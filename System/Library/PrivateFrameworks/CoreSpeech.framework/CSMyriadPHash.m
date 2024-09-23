@implementation CSMyriadPHash

- (CSMyriadPHash)init
{
  id v2;
  float *FloatArray;
  float *v4;
  float v5;
  int v6;
  NSObject *v7;
  dispatch_queue_t v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CSMyriadPHash;
  v2 = -[CSMyriadPHash init](&v11, sel_init);
  if (v2)
  {
    FloatArray = (float *)createFloatArray(2048, CFSTR("HammingWindow"));
    *((_QWORD *)v2 + 1) = FloatArray;
    vDSP_hamm_window(FloatArray, 0x800uLL, 0);
    *((_QWORD *)v2 + 2) = vDSP_create_fftsetup(0xAuLL, 2);
    v4 = (float *)createFloatArray((int)(float)(4096.0 / *(float *)&_decimationFactor), CFSTR("HammingWindow"));
    *((_QWORD *)v2 + 3) = v4;
    vDSP_hamm_window(v4, (unint64_t)(float)(4096.0 / *(float *)&_decimationFactor), 0);
    v5 = log2f(4096.0 / *(float *)&_decimationFactor);
    *((_QWORD *)v2 + 4) = vDSP_create_fftsetup((unint64_t)v5, 2);
    *((_WORD *)v2 + 21) = 0;
    objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingSampleRate");
    _sampleRate = v6;
    dispatch_get_global_queue(2, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_queue_create("myriad_audio_analysis", 0);
    v9 = (void *)*((_QWORD *)v2 + 6);
    *((_QWORD *)v2 + 6) = v8;

    dispatch_set_target_queue(*((dispatch_object_t *)v2 + 6), v7);
  }
  return (CSMyriadPHash *)v2;
}

- (void)dealloc
{
  float *hammingWindow;
  float *snrWindow;
  objc_super v5;

  vDSP_destroy_fftsetup(self->_setup);
  vDSP_destroy_fftsetup(self->_snrSetup);
  hammingWindow = self->_hammingWindow;
  if (hammingWindow)
  {
    free(hammingWindow);
    self->_hammingWindow = 0;
  }
  snrWindow = self->_snrWindow;
  if (snrWindow)
  {
    free(snrWindow);
    self->_snrWindow = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)CSMyriadPHash;
  -[CSMyriadPHash dealloc](&v5, sel_dealloc);
}

- (double)_signalEstimate:(float *)a3 length:(unint64_t)a4
{
  float v6;
  int v7;
  float *FloatArray;
  float v9;
  double v10;
  uint64_t v11;
  int v12;
  float *v13;
  float v14;
  float __C;

  v6 = 4096.0 / *(float *)&_decimationFactor;
  v7 = _overlapFactor;
  __C = 0.0;
  FloatArray = (float *)createFloatArray((int)(float)(4096.0 / *(float *)&_decimationFactor), CFSTR("windowed array for signal estimation"));
  v9 = *(float *)&_decimationFactor;
  v10 = 0.0;
  if ((float)((float)(*(float *)&_decimationFactor * (float)_overlapFactor) + -1.0) > 0.0)
  {
    v11 = 4 * (int)(float)(v6 / (float)v7);
    v12 = 1;
    do
    {
      vDSP_vmul(a3, 1, self->_snrWindow, 1, FloatArray, 1, (unint64_t)(float)(4096.0 / v9));
      v13 = fftEnergies(self->_snrSetup, FloatArray, (int)(float)(4096.0 / *(float *)&_decimationFactor));
      __C = 0.0;
      vDSP_sve(&v13[(float)(300.0 / (float)((float)(*(float *)&_sampleRate * 0.00024414) * *(float *)&_decimationFactor))], 1, &__C, (int)(float)(2700.0 / (float)((float)(*(float *)&_sampleRate * 0.00024414) * *(float *)&_decimationFactor)));
      v10 = v10 + __C;
      free(v13);
      v14 = (float)v12;
      v9 = *(float *)&_decimationFactor;
      ++v12;
      a3 = (float *)((char *)a3 + v11);
    }
    while ((float)((float)(*(float *)&_decimationFactor * (float)_overlapFactor) + -1.0) > v14);
  }
  free(FloatArray);
  return v10;
}

- (void)_surfacePsdWithAudioChunk:(id)a3
{
  id v4;
  void *v5;
  vDSP_Length v6;
  void *v7;
  NSObject *v8;
  double v9;
  float v10;
  float __C;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  double v17;
  __int16 v18;
  vDSP_Length v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "numSamples");

  if (v6)
  {
    v7 = malloc_type_malloc(4 * v6, 0x27FE19A6uLL);
    bzero(v7, 4 * v6);
    -[CSMyriadPHash _copyPsdDataInBuffer:copyLength:fromAudioData:](self, "_copyPsdDataInBuffer:copyLength:fromAudioData:", v7, v6, objc_msgSend(objc_retainAutorelease(v5), "bytes"));
    v20[0] = 0xBF7851EC3F800000;
    vDSP_conv((const float *)v7, 1, (const float *)v20 + 1, -1, (float *)v7, 1, v6 - 1, 2uLL);
    *((float *)v7 + v6 - 1) = *((float *)v20 + 1) * *((float *)v7 + v6 - 1);
    vDSP_vsq((const float *)v7, 1, (float *)v7, 1, v6);
    __C = 0.0;
    vDSP_sve((const float *)v7, 1, &__C, v6);
    v8 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      v9 = __C;
      v10 = log10(__C) * 10.0 + -50.0;
      *(_DWORD *)buf = 136315906;
      v13 = "-[CSMyriadPHash _surfacePsdWithAudioChunk:]";
      v14 = 1024;
      v15 = (int)v10;
      v16 = 2048;
      v17 = v9;
      v18 = 2048;
      v19 = v6;
      _os_log_impl(&dword_1C2614000, v8, OS_LOG_TYPE_DEFAULT, "%s Surface PSD: PSD Score = %d, PSDSum = %f, PSDLength = %lu", buf, 0x26u);
    }
    free(v7);
  }

}

- (unsigned)pHash:(float *)a3 length:(int)a4
{
  double v5;
  double v6;
  int v7;
  NSObject *v8;
  int signalEstimate;
  int v11;
  const char *v12;
  __int16 v13;
  double v14;
  __int16 v15;
  int v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[CSMyriadPHash _signalEstimate:length:](self, "_signalEstimate:length:", a3, a4);
  v6 = v5;
  self->_signalEstimate = -[CSMyriadPHash sigNorm:](self, "sigNorm:");
  v7 = -[CSMyriadPHash sigFrac:](self, "sigFrac:", v6);
  self->_signalFractional = v7;
  v8 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    signalEstimate = self->_signalEstimate;
    v11 = 136315906;
    v12 = "-[CSMyriadPHash pHash:length:]";
    v13 = 2050;
    v14 = v6;
    v15 = 1026;
    v16 = signalEstimate;
    v17 = 1026;
    v18 = v7;
    _os_log_impl(&dword_1C2614000, v8, OS_LOG_TYPE_DEFAULT, "%s sigsum = %{public}f sigNorm= %{public}d sigFrac= %{public}d", (uint8_t *)&v11, 0x22u);
  }
  return -22991;
}

- (unsigned)sigNorm:(double)a3
{
  return (int)(log10(a3) * 10.0 + -50.0 + *(float *)&_decimationCorrection);
}

- (unsigned)sigFrac:(double)a3
{
  float v3;

  v3 = *(float *)&_decimationFractional + log10(a3) * 10.0;
  return vcvts_n_s32_f32(v3 - (float)(int)v3, 8uLL);
}

- (id)cachedHash
{
  NSObject *queue;
  id v3;
  _QWORD block[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__12751;
  v10 = __Block_byref_object_dispose__12752;
  v11 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __27__CSMyriadPHash_cachedHash__block_invoke;
  block[3] = &unk_1E7C287B8;
  block[4] = &v6;
  dispatch_sync(queue, block);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)_copyAudioDataInBuffer:(float *)a3 bufferSize:(unint64_t)a4 copyLength:(unint64_t)a5 fromAudioData:(void *)a6
{
  NSObject *v9;
  float __C;
  float __B;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  unint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (a3 && a6)
  {
    if (!a5)
      goto LABEL_8;
    if (objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingIsFloat"))
    {
      *(_DWORD *)buf = 1191181824;
      __C = 1.0;
      __B = -1.0;
      vDSP_vclip((const float *)a6, 1, &__B, &__C, a3, 1, a5);
      vDSP_vsmul(a3, 1, (const float *)buf, a3, 1, a5);
    }
    else
    {
      vDSP_vflt16((const __int16 *)a6, 1, a3, 1, a5);
    }
    if (a5 <= 0xFFF)
    {
LABEL_8:
      v9 = *MEMORY[0x1E0D18F60];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v13 = "-[CSMyriadPHash _copyAudioDataInBuffer:bufferSize:copyLength:fromAudioData:]";
        v14 = 2050;
        v15 = 4096 - a5;
        _os_log_impl(&dword_1C2614000, v9, OS_LOG_TYPE_DEFAULT, "%s BTLE padded %{public}ld samples to fill out buffer", buf, 0x16u);
      }
    }
  }
}

- (void)_copyPsdDataInBuffer:(float *)a3 copyLength:(unint64_t)a4 fromAudioData:(void *)a5
{
  float __B;

  if (a4 && a3 && a5)
  {
    if (objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingIsFloat"))
    {
      __B = 32767.0;
      vDSP_vsmul((const float *)a5, 1, &__B, a3, 1, a4);
    }
    else
    {
      vDSP_vflt16((const __int16 *)a5, 1, a3, 1, a4);
    }
  }
}

- (id)_generateMyriadInfo:(unint64_t)a3 hsStart:(unint64_t)a4 triggerEnd:(unint64_t)a5 writeFile:(BOOL)a6 score:(float)a7 triggerSource:(id)a8 channel:(unint64_t)a9 audioProviderUUID:(id)a10 absoluteTime:(unint64_t)a11
{
  _BOOL4 v13;
  id v17;
  id v18;
  int v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  os_log_t *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  unint64_t v28;
  NSObject *v29;
  void *v30;
  id v31;
  uint64_t v32;
  unsigned __int8 v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v43;
  _BOOL4 v44;
  id v45;
  void *v47;
  uint8_t buf[4];
  const char *v49;
  __int16 v50;
  unint64_t v51;
  __int16 v52;
  unint64_t v53;
  uint64_t v54;

  v13 = a6;
  v54 = *MEMORY[0x1E0C80C00];
  v17 = a8;
  v18 = a10;
  if (v17
    && ((v19 = objc_msgSend(v17, "isEqualToString:", *MEMORY[0x1E0D19488]),
         (objc_msgSend(v17, "isEqualToString:", *MEMORY[0x1E0D19480]) & 1) != 0)
     || (objc_msgSend(v17, "isEqualToString:", *MEMORY[0x1E0D19478]) | v19) == 1))
  {
    v20 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v49 = "-[CSMyriadPHash _generateMyriadInfo:hsStart:triggerEnd:writeFile:score:triggerSource:channel:audioProviderUU"
            "ID:absoluteTime:]";
      v50 = 2114;
      v51 = (unint64_t)v17;
      _os_log_impl(&dword_1C2614000, v20, OS_LOG_TYPE_INFO, "%s No posting as trigger source is %{public}@", buf, 0x16u);
    }
    v21 = 0;
  }
  else
  {
    v44 = v13;
    +[CSSpeechManager sharedManagerForCoreSpeechDaemon](CSSpeechManager, "sharedManagerForCoreSpeechDaemon");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = v18;
    objc_msgSend(v22, "audioProviderWithUUID:", v18);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = (os_log_t *)MEMORY[0x1E0D18F60];
    v25 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v49 = "-[CSMyriadPHash _generateMyriadInfo:hsStart:triggerEnd:writeFile:score:triggerSource:channel:audioProviderUU"
            "ID:absoluteTime:]";
      v50 = 2050;
      v51 = a3;
      v52 = 2050;
      v53 = a9;
      _os_log_impl(&dword_1C2614000, v25, OS_LOG_TYPE_DEFAULT, "%s BTLE AudioPayload ringBuffer startpoint: %{public}lld toEnd, activeChannel: %{public}tu", buf, 0x20u);
    }
    v47 = v23;
    objc_msgSend(v23, "audioChunkToEndFrom:channelIdx:", a3, a9, a5);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "data");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v26, "numSamples");
    v29 = *v24;
    if (os_log_type_enabled(*v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v49 = "-[CSMyriadPHash _generateMyriadInfo:hsStart:triggerEnd:writeFile:score:triggerSource:channel:audioProviderUU"
            "ID:absoluteTime:]";
      v50 = 2050;
      v51 = v28;
      _os_log_impl(&dword_1C2614000, v29, OS_LOG_TYPE_DEFAULT, "%s BTLE raw audio size = %{public}ld", buf, 0x16u);
    }
    v30 = malloc_type_malloc(0x4000uLL, 0xA1E2413FuLL);
    bzero(v30, 0x4000uLL);
    if (v28 >= 0x1000)
      v28 = 4096;
    v31 = objc_retainAutorelease(v27);
    -[CSMyriadPHash _copyAudioDataInBuffer:bufferSize:copyLength:fromAudioData:](self, "_copyAudioDataInBuffer:bufferSize:copyLength:fromAudioData:", v30, 0x4000, v28, objc_msgSend(v31, "bytes"));
    v32 = -[CSMyriadPHash pHash:length:](self, "pHash:length:", v30, 4096);
    v33 = -[CSMyriadPHash signalEstimate](self, "signalEstimate");
    v34 = -[CSMyriadPHash signalFractional](self, "signalFractional");
    free(v30);
    if (CSIsInternalBuild())
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "audioChunkFrom:to:channelIdx:", a4, v43, a9);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[CSMyriadPHash _surfacePsdWithAudioChunk:](self, "_surfacePsdWithAudioChunk:", v36);
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = (void *)*MEMORY[0x1E0D18F60];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
      {
        v39 = v38;
        objc_msgSend(v37, "timeIntervalSinceDate:", v35);
        *(_DWORD *)buf = 136315394;
        v49 = "-[CSMyriadPHash _generateMyriadInfo:hsStart:triggerEnd:writeFile:score:triggerSource:channel:audioProvider"
              "UUID:absoluteTime:]";
        v50 = 2050;
        v51 = v40;
        _os_log_impl(&dword_1C2614000, v39, OS_LOG_TYPE_DEFAULT, "%s Surface PSD elapsed time = %{public}lf", buf, 0x16u);

      }
    }
    if (CSIsHorseman())
      v41 = 0;
    else
      v41 = (int)(float)(a7 * 10.0);
    +[CSMyriadPHash createHashResult:goodness:confidence:absTime:frac:](CSMyriadPHash, "createHashResult:goodness:confidence:absTime:frac:", v32, v33, v41, a11, v34);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v44)
      +[CSMyriadPHash writeHashResultIntoFile:](CSMyriadPHash, "writeHashResultIntoFile:", v21);
    +[CSMyriadPHash notifyAudioHashNotification](CSMyriadPHash, "notifyAudioHashNotification");

    v18 = v45;
  }

  return v21;
}

- (id)_audioLogDirectory
{
  void *v2;
  void *v3;
  __CFString *v4;
  id v5;
  char v6;
  void *v7;
  NSObject *v9;
  void *v10;
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  __CFString *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D19110], "sharedPreferences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "voiceTriggerAudioLogDirectory");
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v2, "fileExistsAtPath:", v4) & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    v11 = 0;
    v6 = objc_msgSend(v2, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v4, 1, 0, &v11);
    v5 = v11;
    if ((v6 & 1) == 0)
    {
      v7 = (void *)*MEMORY[0x1E0D18F60];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
      {
        v9 = v7;
        objc_msgSend(v5, "localizedDescription");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315650;
        v13 = "-[CSMyriadPHash _audioLogDirectory]";
        v14 = 2114;
        v15 = v4;
        v16 = 2114;
        v17 = v10;
        _os_log_error_impl(&dword_1C2614000, v9, OS_LOG_TYPE_ERROR, "%s Couldn't create voice trigger audio logging directory at path %{public}@ %{public}@", buf, 0x20u);

      }
      v4 = CFSTR("/tmp");
    }
  }

  return v4;
}

- (id)generatePHashFromExclaveVoiceTriggerInfo:(id)a3 writeFile:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char isKindOfClass;
  void *v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  void *v26;
  int v28;
  const char *v29;
  __int16 v30;
  double v31;
  __int16 v32;
  int v33;
  __int16 v34;
  int v35;
  uint64_t v36;

  v4 = a4;
  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  v8 = 0.0;
  if (!v6)
    goto LABEL_5;
  v9 = *MEMORY[0x1E0D19418];
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D19418]);
  v10 = objc_claimAutoreleasedReturnValue();
  if (!v10)
    goto LABEL_5;
  v11 = (void *)v10;
  objc_msgSend(v7, "objectForKeyedSubscript:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "doubleValue");
    v8 = v15;

    v16 = -[CSMyriadPHash sigNorm:](self, "sigNorm:", v8);
    v17 = -[CSMyriadPHash sigFrac:](self, "sigFrac:", v8);
  }
  else
  {
LABEL_5:
    v16 = 0;
    v17 = 0;
  }
  v18 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v28 = 136315906;
    v29 = "-[CSMyriadPHash generatePHashFromExclaveVoiceTriggerInfo:writeFile:]";
    v30 = 2050;
    v31 = v8;
    v32 = 1026;
    v33 = v16;
    v34 = 1026;
    v35 = v17;
    _os_log_impl(&dword_1C2614000, v18, OS_LOG_TYPE_DEFAULT, "%s sigsum = %{public}f sigNorm= %{public}d sigFrac= %{public}d", (uint8_t *)&v28, 0x22u);
  }
  v19 = mach_absolute_time();
  if (v7)
  {
    v20 = *MEMORY[0x1E0D19728];
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D19728]);
    v21 = objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      v22 = (void *)v21;
      objc_msgSend(v7, "objectForKeyedSubscript:", v20);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v24 = objc_opt_isKindOfClass();

      if ((v24 & 1) != 0)
      {
        objc_msgSend(v7, "objectForKeyedSubscript:", v20);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v25, "unsignedLongLongValue");

      }
    }
  }
  +[CSMyriadPHash createHashResult:goodness:confidence:absTime:frac:](CSMyriadPHash, "createHashResult:goodness:confidence:absTime:frac:", 42545, v16, 0, v19, v17);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    +[CSMyriadPHash writeHashResultIntoFile:](CSMyriadPHash, "writeHashResultIntoFile:", v26);

  return v26;
}

- (id)generatePHashFromVoiceTriggerInfo:(id)a3 writeFile:(BOOL)a4
{
  id v6;
  NSObject *queue;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  CSMyriadPHash *v13;
  uint64_t *v14;
  BOOL v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v6 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__12751;
  v20 = __Block_byref_object_dispose__12752;
  v21 = 0;
  queue = self->_queue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __61__CSMyriadPHash_generatePHashFromVoiceTriggerInfo_writeFile___block_invoke;
  v11[3] = &unk_1E7C26018;
  v12 = v6;
  v13 = self;
  v14 = &v16;
  v15 = a4;
  v8 = v6;
  dispatch_sync(queue, v11);
  v9 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v9;
}

- (signed)signalEstimate
{
  return self->_signalEstimate;
}

- (void)setSignalEstimate:(signed __int16)a3
{
  self->_signalEstimate = a3;
}

- (unsigned)signalFractional
{
  return self->_signalFractional;
}

- (void)setSignalFractional:(unsigned __int8)a3
{
  self->_signalFractional = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
}

uint64_t __61__CSMyriadPHash_generatePHashFromVoiceTriggerInfo_writeFile___block_invoke(uint64_t a1)
{
  void *v2;
  unint64_t v3;
  unint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  unint64_t v11;
  void *v12;
  uint64_t v13;
  os_log_t *v14;
  NSObject *v15;
  unint64_t v16;
  os_log_t v17;
  void *v18;
  char v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  int v36;
  int v37;
  uint64_t v38;
  void *v39;
  void *v40;
  double v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  int v49;
  void *v50;
  double v51;
  double v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  void *v57;
  NSObject *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  unint64_t v62;
  uint8_t buf[4];
  const char *v64;
  __int16 v65;
  unint64_t v66;
  __int16 v67;
  uint64_t v68;
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *MEMORY[0x1E0D19730]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntegerValue");

  v62 = v3;
  if (v3 >= 0x1000)
    v4 = v3 - 4096;
  else
    v4 = 0;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *MEMORY[0x1E0D19788]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedIntegerValue");

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *MEMORY[0x1E0D19600]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unsignedIntegerValue");

  v9 = v6 + v8;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *MEMORY[0x1E0D195A8]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "unsignedIntegerValue");

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *MEMORY[0x1E0D19728]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "unsignedLongLongValue");

  v14 = (os_log_t *)MEMORY[0x1E0D18F60];
  v15 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v64 = "-[CSMyriadPHash generatePHashFromVoiceTriggerInfo:writeFile:]_block_invoke";
    v65 = 2048;
    v66 = v13;
    v67 = 2048;
    v68 = v13;
    _os_log_impl(&dword_1C2614000, v15, OS_LOG_TYPE_INFO, "%s trigger end machAbsoluteTime: %llu hex: %llx", buf, 0x20u);
  }
  v61 = v13;
  v16 = v4;
  v60 = v9 + 1600;
  if (v11 >= objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingNumberOfChannels"))
  {
    v17 = *v14;
    if (os_log_type_enabled(*v14, OS_LOG_TYPE_ERROR))
    {
      v57 = (void *)MEMORY[0x1E0D19090];
      v58 = v17;
      v59 = objc_msgSend(v57, "channelForProcessedInput");
      *(_DWORD *)buf = 136315650;
      v64 = "-[CSMyriadPHash generatePHashFromVoiceTriggerInfo:writeFile:]_block_invoke";
      v65 = 2050;
      v66 = v11;
      v67 = 2050;
      v68 = v59;
      _os_log_error_impl(&dword_1C2614000, v58, OS_LOG_TYPE_ERROR, "%s Invalid active channel in VTEI: %{public}tu, defaulting to master channel: %{public}tu", buf, 0x20u);

    }
    v11 = objc_msgSend(MEMORY[0x1E0D19090], "channelForProcessedInput");
  }
  objc_msgSend(MEMORY[0x1E0D19110], "sharedPreferences");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "myriadFileLoggingEnabled");

  if ((v19 & 1) != 0)
  {
    v20 = objc_alloc_init(MEMORY[0x1E0C99D68]);
    v21 = objc_alloc_init(MEMORY[0x1E0CB3578]);
    objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setLocale:", v22);

    objc_msgSend(v21, "setDateFormat:", CFSTR("yyyy_MM_dd-HHmmss.SSS"));
    v23 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(*(id *)(a1 + 40), "_audioLogDirectory");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "stringFromDate:", v20);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "stringWithFormat:", CFSTR("%@/%@%@.wav"), v24, CFSTR("Myriad-"), v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    v27 = *v14;
    if (os_log_type_enabled(*v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v64 = "-[CSMyriadPHash generatePHashFromVoiceTriggerInfo:writeFile:]_block_invoke";
      v65 = 2114;
      v66 = (unint64_t)v26;
      _os_log_impl(&dword_1C2614000, v27, OS_LOG_TYPE_DEFAULT, "%s Logging audio file into : %{public}@", buf, 0x16u);
    }
    +[CSSpeechManager sharedManagerForCoreSpeechDaemon](CSSpeechManager, "sharedManagerForCoreSpeechDaemon");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = *MEMORY[0x1E0D193E8];
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *MEMORY[0x1E0D193E8]);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "audioProviderWithUUID:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v26);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "saveRecordingBufferToEndFrom:toURL:", v16, v32);

  }
  else
  {
    v29 = *MEMORY[0x1E0D193E8];
  }
  v33 = *(unsigned __int8 *)(a1 + 56);
  v34 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *MEMORY[0x1E0D19778]);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "floatValue");
  v37 = v36;
  v38 = *MEMORY[0x1E0D19660];
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *MEMORY[0x1E0D19660]);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v29);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v41) = v37;
  objc_msgSend(v34, "_generateMyriadInfo:hsStart:triggerEnd:writeFile:score:triggerSource:channel:audioProviderUUID:absoluteTime:", v16, v60, v62, v33, v39, v11, v41, v40, v61);
  v42 = objc_claimAutoreleasedReturnValue();
  v43 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v44 = *(void **)(v43 + 40);
  *(_QWORD *)(v43 + 40) = v42;

  v45 = *(void **)(a1 + 32);
  if (v45)
  {
    objc_msgSend(v45, "objectForKeyedSubscript:", v38);
    v46 = objc_claimAutoreleasedReturnValue();
    if (v46)
    {
      v47 = (void *)v46;
      objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v38);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = objc_msgSend(v48, "isEqualToString:", *MEMORY[0x1E0D19490]);

      if (v49)
      {
        objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *MEMORY[0x1E0D19440]);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "doubleValue");
        v52 = v51;

        +[CSMyriadPHash createRemoraHashResultFromPHash:firstPassTriggerEndTime:](CSMyriadPHash, "createRemoraHashResultFromPHash:firstPassTriggerEndTime:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v52);
        v53 = objc_claimAutoreleasedReturnValue();
        v54 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        v55 = *(void **)(v54 + 40);
        *(_QWORD *)(v54 + 40) = v53;

      }
    }
  }
  return +[CSMyriadPHash setLastHash:](CSMyriadPHash, "setLastHash:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
}

void __27__CSMyriadPHash_cachedHash__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0D19110], "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "myriadHashFilePath");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", v6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

+ (void)notifyHashlessTrigger:(unint64_t)a3
{
  id v3;

  v3 = +[CSMyriadPHash generateEmptyPHash:writeFile:](CSMyriadPHash, "generateEmptyPHash:writeFile:", a3, 1);
  +[CSMyriadPHash notifyAudioHashlessNotification](CSMyriadPHash, "notifyAudioHashlessNotification");
}

+ (id)createRemoraHashResultFromPHash:(id)a3 firstPassTriggerEndTime:(double)a4
{
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;

  v5 = objc_retainAutorelease(a3);
  v6 = *(unsigned __int16 *)objc_msgSend(v5, "bytes");
  v7 = objc_retainAutorelease(v5);
  v8 = *(unsigned __int8 *)(objc_msgSend(v7, "bytes") + 2);
  v9 = objc_retainAutorelease(v7);
  v10 = *(unsigned __int8 *)(objc_msgSend(v9, "bytes") + 3);
  v11 = objc_retainAutorelease(v9);
  v12 = objc_msgSend(v11, "bytes");

  return +[CSMyriadPHash createRemoraHashResult:goodness:confidence:firstPassTriggerEndTime:frac:](CSMyriadPHash, "createRemoraHashResult:goodness:confidence:firstPassTriggerEndTime:frac:", v6, v8, v10, *(unsigned __int8 *)(v12 + 12), a4);
}

+ (id)createRemoraHashResult:(unsigned __int16)a3 goodness:(unsigned __int8)a4 confidence:(unsigned __int8)a5 firstPassTriggerEndTime:(double)a6 frac:(unsigned __int8)a7
{
  void *v7;
  NSObject *v8;
  unsigned __int8 v10;
  double v11;
  unsigned __int8 v12;
  unsigned __int8 v13;
  unsigned __int16 v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v13 = a4;
  v12 = a5;
  v11 = a6;
  v10 = a7;
  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithCapacity:", 13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendBytes:length:", &v14, 2);
  objc_msgSend(v7, "appendBytes:length:", &v13, 1);
  objc_msgSend(v7, "appendBytes:length:", &v12, 1);
  objc_msgSend(v7, "appendBytes:length:", &v11, 8);
  objc_msgSend(v7, "appendBytes:length:", &v10, 1);
  v8 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v16 = "+[CSMyriadPHash createRemoraHashResult:goodness:confidence:firstPassTriggerEndTime:frac:]";
    v17 = 2114;
    v18 = v7;
    _os_log_impl(&dword_1C2614000, v8, OS_LOG_TYPE_DEFAULT, "%s Advert data: %{public}@", buf, 0x16u);
  }
  return v7;
}

+ (id)createHashResult:(unsigned __int16)a3 goodness:(unsigned __int8)a4 confidence:(unsigned __int8)a5 absTime:(unint64_t)a6 frac:(unsigned __int8)a7
{
  int v7;
  int v9;
  int v10;
  os_log_t *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  unsigned __int8 v16;
  unint64_t v17;
  unsigned __int8 v18;
  unsigned __int8 v19;
  unsigned __int16 v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  _BYTE v24[10];
  __int16 v25;
  unint64_t v26;
  __int16 v27;
  int v28;
  uint64_t v29;

  v7 = a7;
  v9 = a5;
  v10 = a4;
  v29 = *MEMORY[0x1E0C80C00];
  v20 = a3;
  v19 = a4;
  v18 = a5;
  v17 = a6;
  v16 = a7;
  v11 = (os_log_t *)MEMORY[0x1E0D18F60];
  v12 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316162;
    v22 = "+[CSMyriadPHash createHashResult:goodness:confidence:absTime:frac:]";
    v23 = 1024;
    *(_DWORD *)v24 = v10;
    *(_WORD *)&v24[4] = 1024;
    *(_DWORD *)&v24[6] = v9;
    v25 = 2048;
    v26 = a6;
    v27 = 1024;
    v28 = v7;
    _os_log_impl(&dword_1C2614000, v12, OS_LOG_TYPE_DEFAULT, "%s goodness = %d, confidence = %d absTime = %llu, frac = %d", buf, 0x28u);
  }
  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithCapacity:", 13);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "appendBytes:length:", &v20, 2);
  objc_msgSend(v13, "appendBytes:length:", &v19, 1);
  objc_msgSend(v13, "appendBytes:length:", &v18, 1);
  objc_msgSend(v13, "appendBytes:length:", &v17, 8);
  objc_msgSend(v13, "appendBytes:length:", &v16, 1);
  v14 = *v11;
  if (os_log_type_enabled(*v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v22 = "+[CSMyriadPHash createHashResult:goodness:confidence:absTime:frac:]";
    v23 = 2114;
    *(_QWORD *)v24 = v13;
    _os_log_impl(&dword_1C2614000, v14, OS_LOG_TYPE_DEFAULT, "%s Advert data: %{public}@", buf, 0x16u);
  }
  return v13;
}

+ (id)generateEmptyPHash:(unint64_t)a3 writeFile:(BOOL)a4
{
  _BOOL4 v4;
  void *v5;

  v4 = a4;
  +[CSMyriadPHash createHashResult:goodness:confidence:absTime:frac:](CSMyriadPHash, "createHashResult:goodness:confidence:absTime:frac:", 0, 0, 0, a3, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    +[CSMyriadPHash writeHashResultIntoFile:](CSMyriadPHash, "writeHashResultIntoFile:", v5);
  return v5;
}

+ (id)decodeWithMyriadPHash:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  CSMyriadPHashFactors *v7;
  CSMyriadPHashFactors *v8;
  unsigned __int8 v10;
  uint64_t v11;
  __int16 v12;
  unsigned __int16 v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  unint64_t v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  v13 = 0;
  v12 = 0;
  v11 = 0;
  v10 = 0;
  if (v3 && objc_msgSend(v3, "length") == 13)
  {
    objc_msgSend(v4, "getBytes:range:", &v13, 0, 2);
    objc_msgSend(v4, "getBytes:range:", (char *)&v12 + 1, 2, 1);
    objc_msgSend(v4, "getBytes:range:", &v12, 3, 1);
    objc_msgSend(v4, "getBytes:range:", &v11, 4, 8);
    objc_msgSend(v4, "getBytes:range:", &v10, 12, 1);
    v5 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      v15 = "+[CSMyriadPHash decodeWithMyriadPHash:]";
      v16 = 2048;
      v17 = v13;
      v18 = 2048;
      v19 = HIBYTE(v12);
      v20 = 2048;
      v21 = v12;
      v22 = 2048;
      v23 = v11;
      v24 = 2048;
      v25 = v10;
      _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_DEFAULT, "%s Decoded myriadPHash : hash(%lu), goodness(%lu), confidence(%lu), absTime(%llu), frac(%lu)", buf, 0x3Eu);
    }
  }
  else
  {
    v6 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v15 = "+[CSMyriadPHash decodeWithMyriadPHash:]";
      v16 = 2114;
      v17 = (unint64_t)v4;
      _os_log_error_impl(&dword_1C2614000, v6, OS_LOG_TYPE_ERROR, "%s Invalid myriad pHash : %{public}@", buf, 0x16u);
    }
  }
  v7 = [CSMyriadPHashFactors alloc];
  v8 = -[CSMyriadPHashFactors initWithHash:goodness:confidence:absTime:frac:](v7, "initWithHash:goodness:confidence:absTime:frac:", v13, HIBYTE(v12), v12, v11, v10);

  return v8;
}

+ (id)overridePHash:(id)a3 withMachTime:(unint64_t)a4
{
  void *v5;
  void *v6;

  +[CSMyriadPHash decodeWithMyriadPHash:](CSMyriadPHash, "decodeWithMyriadPHash:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[CSMyriadPHash createHashResult:goodness:confidence:absTime:frac:](CSMyriadPHash, "createHashResult:goodness:confidence:absTime:frac:", (unsigned __int16)objc_msgSend(v5, "hash"), objc_msgSend(v5, "goodness"), objc_msgSend(v5, "confidence"), a4, objc_msgSend(v5, "frac"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (BOOL)writeHashlessResult:(unint64_t)a3
{
  void *v3;
  BOOL v4;

  +[CSMyriadPHash createHashResult:goodness:confidence:absTime:frac:](CSMyriadPHash, "createHashResult:goodness:confidence:absTime:frac:", 0, 0, 0, a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = +[CSMyriadPHash writeHashResultIntoFile:](CSMyriadPHash, "writeHashResultIntoFile:", v3);

  return v4;
}

+ (BOOL)writeHashResultIntoFile:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  char v7;
  NSObject *v8;
  int v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0D19110];
  v4 = a3;
  objc_msgSend(v3, "sharedPreferences");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "myriadHashFilePath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v4, "writeToFile:atomically:", v6, 0);
  if ((v7 & 1) == 0)
  {
    v8 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
    {
      v10 = 136315138;
      v11 = "+[CSMyriadPHash writeHashResultIntoFile:]";
      _os_log_error_impl(&dword_1C2614000, v8, OS_LOG_TYPE_ERROR, "%s advert data write failed", (uint8_t *)&v10, 0xCu);
    }
  }

  return v7;
}

+ (void)notifyAudioHashNotification
{
  __CFNotificationCenter *DarwinNotifyCenter;
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (CSIsBridgeOS())
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.siri.myriad.apayload"), 0, 0, 1u);
    v3 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_INFO))
    {
      v4 = 136315138;
      v5 = "+[CSMyriadPHash notifyAudioHashNotification]";
      _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_INFO, "%s Posted siri audio hash notification", (uint8_t *)&v4, 0xCu);
    }
  }
}

+ (void)notifyAudioHashlessNotification
{
  __CFNotificationCenter *DarwinNotifyCenter;
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.siri.myriad.apayload"), 0, 0, 1u);
  v3 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_INFO))
  {
    v4 = 136315138;
    v5 = "+[CSMyriadPHash notifyAudioHashlessNotification]";
    _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_INFO, "%s Posted siri audio hash notification", (uint8_t *)&v4, 0xCu);
  }
}

+ (void)setLastHash:(id)a3
{
  uint64_t v3;
  void *v4;

  v3 = objc_msgSend(a3, "copy");
  v4 = (void *)_lastHash;
  _lastHash = v3;

}

+ (NSData)lastHash
{
  return (NSData *)(id)_lastHash;
}

+ (double)signalEstimateWithBuilder:(id)a3
{
  void *v3;
  CSMyriadPHash *v4;
  void *v5;
  uint64_t v6;
  double v7;
  uint64_t v8;
  os_log_t *v9;
  NSObject *v10;
  void *v11;
  const float *v12;
  long double v13;
  NSObject *v14;
  float __C;
  float __B;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  (*((void (**)(id, uint64_t))a3 + 2))(a3, 4096);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(CSMyriadPHash);
  if (v3)
  {
    objc_msgSend(v3, "data");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "length");
    v7 = -1.0;
    if (v6)
    {
      v8 = v6;
      if (objc_msgSend(MEMORY[0x1E0D19260], "supportHomeKitAccessory"))
      {
        v9 = (os_log_t *)MEMORY[0x1E0D18F60];
        v10 = *MEMORY[0x1E0D18F60];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315651;
          v19 = "+[CSMyriadPHash(SignalEstimate) signalEstimateWithBuilder:]";
          v20 = 2049;
          v21 = 4096;
          v22 = 2049;
          v23 = v8;
          _os_log_impl(&dword_1C2614000, v10, OS_LOG_TYPE_INFO, "%s BTLE raw audio size = %{private}ld, audio length = %{private}ld", buf, 0x20u);
        }
        if (objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingIsFloat"))
        {
          v11 = malloc_type_malloc(0x4000uLL, 0xD30E96FAuLL);
          bzero(v11, 0x4000uLL);
          v12 = (const float *)objc_msgSend(objc_retainAutorelease(v5), "bytes");
          *(_DWORD *)buf = 1191181824;
          __C = 1.0;
          __B = -1.0;
          vDSP_vclip(v12, 1, &__B, &__C, (float *)v11, 1, 0x1000uLL);
          vDSP_vsmul((const float *)v11, 1, (const float *)buf, (float *)v11, 1, 0x1000uLL);
          -[CSMyriadPHash _signalEstimate:length:](v4, "_signalEstimate:length:", v11, v8);
          v7 = log10(v13) * 10.0;
          free(v11);
        }
        else
        {
          v14 = *v9;
          if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315138;
            v19 = "+[CSMyriadPHash(SignalEstimate) signalEstimateWithBuilder:]";
            _os_log_error_impl(&dword_1C2614000, v14, OS_LOG_TYPE_ERROR, "%s Input recording is not float", buf, 0xCu);
          }
        }
      }
    }

  }
  else
  {
    v7 = -1.0;
  }

  return v7;
}

@end
