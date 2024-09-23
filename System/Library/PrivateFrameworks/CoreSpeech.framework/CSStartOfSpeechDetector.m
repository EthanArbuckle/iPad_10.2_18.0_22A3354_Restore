@implementation CSStartOfSpeechDetector

- (CSStartOfSpeechDetector)initWithConfig:(id)a3 samplingRate:(unint64_t)a4 minSpeechFrames:(unint64_t)a5 numLeadingFrames:(unint64_t)a6 delegate:(id)a7
{
  id v13;
  id v14;
  CSStartOfSpeechDetector *v15;
  CSStartOfSpeechDetector *v16;
  dispatch_queue_t v17;
  OS_dispatch_queue *spgQueue;
  dispatch_queue_t v19;
  OS_dispatch_queue *sosQueue;
  NSObject *v21;
  objc_super v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  CSStartOfSpeechDetector *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a7;
  v23.receiver = self;
  v23.super_class = (Class)CSStartOfSpeechDetector;
  v15 = -[CSStartOfSpeechDetector init](&v23, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeWeak((id *)&v15->_delegate, v14);
    v16->_samplingRate = a4;
    objc_storeStrong((id *)&v16->_configFile, a3);
    v16->_minSpeechFrames = a5;
    v16->_numLeadingFrames = a6;
    v17 = dispatch_queue_create("StartOfSpeech SPG queue", 0);
    spgQueue = v16->_spgQueue;
    v16->_spgQueue = (OS_dispatch_queue *)v17;

    v19 = dispatch_queue_create("StartOfSpeech queue", 0);
    sosQueue = v16->_sosQueue;
    v16->_sosQueue = (OS_dispatch_queue *)v19;

    v21 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v25 = "-[CSStartOfSpeechDetector initWithConfig:samplingRate:minSpeechFrames:numLeadingFrames:delegate:]";
      v26 = 2114;
      v27 = v16;
      _os_log_impl(&dword_1C2614000, v21, OS_LOG_TYPE_DEFAULT, "%s Created CSStartOfSpeechDetector: %{public}@ ", buf, 0x16u);
    }
  }

  return v16;
}

- (void)resetForNewRequest
{
  NSObject *sosQueue;
  _QWORD block[5];

  sosQueue = self->_sosQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__CSStartOfSpeechDetector_resetForNewRequest__block_invoke;
  block[3] = &unk_1E7C292C8;
  block[4] = self;
  dispatch_async(sosQueue, block);
}

- (void)addAudio:(id)a3 numSamples:(unint64_t)a4
{
  id v6;
  NSObject *sosQueue;
  id v8;
  _QWORD block[5];
  id v10;
  unint64_t v11;

  v6 = a3;
  sosQueue = self->_sosQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__CSStartOfSpeechDetector_addAudio_numSamples___block_invoke;
  block[3] = &unk_1E7C28B58;
  block[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  dispatch_async(sosQueue, block);

}

- (void)endAudio
{
  NSObject *sosQueue;
  _QWORD block[5];

  sosQueue = self->_sosQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__CSStartOfSpeechDetector_endAudio__block_invoke;
  block[3] = &unk_1E7C292C8;
  block[4] = self;
  dispatch_async(sosQueue, block);
}

- (void)clientSilenceFeaturesAvailable:(id)a3
{
  id v4;
  NSObject *sosQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  sosQueue = self->_sosQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__CSStartOfSpeechDetector_clientSilenceFeaturesAvailable___block_invoke;
  v7[3] = &unk_1E7C292A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(sosQueue, v7);

}

- (CSStartOfSpeechDetectorDelegate)delegate
{
  return (CSStartOfSpeechDetectorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (EARCaesuraSilencePosteriorGenerator)caesuraSPG
{
  return self->_caesuraSPG;
}

- (void)setCaesuraSPG:(id)a3
{
  objc_storeStrong((id *)&self->_caesuraSPG, a3);
}

- (NSString)configFile
{
  return self->_configFile;
}

- (void)setConfigFile:(id)a3
{
  objc_storeStrong((id *)&self->_configFile, a3);
}

- (BOOL)startDetected
{
  return self->_startDetected;
}

- (void)setStartDetected:(BOOL)a3
{
  self->_startDetected = a3;
}

- (unint64_t)minSpeechFrames
{
  return self->_minSpeechFrames;
}

- (void)setMinSpeechFrames:(unint64_t)a3
{
  self->_minSpeechFrames = a3;
}

- (unint64_t)curSpeechFrames
{
  return self->_curSpeechFrames;
}

- (void)setCurSpeechFrames:(unint64_t)a3
{
  self->_curSpeechFrames = a3;
}

- (unint64_t)numLeadingFrames
{
  return self->_numLeadingFrames;
}

- (void)setNumLeadingFrames:(unint64_t)a3
{
  self->_numLeadingFrames = a3;
}

- (float)prevAudioProcessedMs
{
  return self->_prevAudioProcessedMs;
}

- (void)setPrevAudioProcessedMs:(float)a3
{
  self->_prevAudioProcessedMs = a3;
}

- (unint64_t)samplingRate
{
  return self->_samplingRate;
}

- (void)setSamplingRate:(unint64_t)a3
{
  self->_samplingRate = a3;
}

- (OS_dispatch_queue)spgQueue
{
  return self->_spgQueue;
}

- (void)setSpgQueue:(id)a3
{
  objc_storeStrong((id *)&self->_spgQueue, a3);
}

- (OS_dispatch_queue)sosQueue
{
  return self->_sosQueue;
}

- (void)setSosQueue:(id)a3
{
  objc_storeStrong((id *)&self->_sosQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sosQueue, 0);
  objc_storeStrong((id *)&self->_spgQueue, 0);
  objc_storeStrong((id *)&self->_configFile, 0);
  objc_storeStrong((id *)&self->_caesuraSPG, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __58__CSStartOfSpeechDetector_clientSilenceFeaturesAvailable___block_invoke(uint64_t a1)
{
  int v2;
  os_log_t *v3;
  NSObject *v4;
  _BOOL4 v5;
  void *v6;
  NSObject *v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  double v12;
  unint64_t v13;
  double v14;
  uint64_t v15;
  double v16;
  float v17;
  double v18;
  double v19;
  uint64_t v20;
  double v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  NSObject *v32;
  id WeakRetained;
  id v34;
  int v35;
  const char *v36;
  __int16 v37;
  unint64_t v38;
  __int16 v39;
  unint64_t v40;
  __int16 v41;
  unint64_t v42;
  __int16 v43;
  double v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v2 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 8);
  v3 = (os_log_t *)MEMORY[0x1E0D18F60];
  v4 = *MEMORY[0x1E0D18F60];
  v5 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v5)
    {
      v35 = 136315138;
      v36 = "-[CSStartOfSpeechDetector clientSilenceFeaturesAvailable:]_block_invoke";
      _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_DEFAULT, "%s Start of speech already reported, ignoring !", (uint8_t *)&v35, 0xCu);
    }
  }
  else
  {
    if (v5)
    {
      v6 = *(void **)(a1 + 40);
      v7 = v4;
      objc_msgSend(v6, "silencePosterior");
      v9 = v8;
      objc_msgSend(*(id *)(a1 + 40), "silenceFramesCountMs");
      v11 = v10;
      objc_msgSend(*(id *)(a1 + 40), "processedAudioMs");
      v12 = *(double *)(*(_QWORD *)(a1 + 32) + 48);
      v35 = 136316162;
      v36 = "-[CSStartOfSpeechDetector clientSilenceFeaturesAvailable:]_block_invoke";
      v37 = 2050;
      v38 = v9;
      v39 = 2050;
      v40 = v11;
      v41 = 2050;
      v42 = v13;
      v43 = 2050;
      v44 = v12;
      _os_log_impl(&dword_1C2614000, v7, OS_LOG_TYPE_DEFAULT, "%s silProb= %{public}f, silnfcnt=%{public}f, clientProcessedAudioMs=%{public}f curSpeechFrmCnt=%{public}lu", (uint8_t *)&v35, 0x34u);

    }
    objc_msgSend(*(id *)(a1 + 40), "silenceFramesCountMs");
    if (v14 == 0.0)
    {
      objc_msgSend(*(id *)(a1 + 40), "processedAudioMs");
      v15 = *(_QWORD *)(a1 + 32);
      v17 = v16 - *(float *)(v15 + 12);
      *(_QWORD *)(v15 + 48) = (unint64_t)(float)((float)(v17
                                                              / (float)objc_msgSend(*(id *)(v15 + 24), "getFrameDurationMs"))+ (float)*(unint64_t *)(v15 + 48));
    }
    else
    {
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48) = 0;
    }
    objc_msgSend(*(id *)(a1 + 40), "processedAudioMs");
    *(float *)&v18 = v18;
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 12) = LODWORD(v18);
    if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 48) >= *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40))
    {
      objc_msgSend(*(id *)(a1 + 40), "processedAudioMs");
      v20 = *(_QWORD *)(a1 + 32);
      v21 = v19 / 1000.0 * (double)*(unint64_t *)(v20 + 64);
      v22 = *(_QWORD *)(v20 + 48);
      v23 = objc_msgSend(*(id *)(v20 + 24), "getFrameDurationMs") * v22;
      v24 = *(_QWORD *)(a1 + 32);
      v25 = *(_QWORD *)(v24 + 56);
      v26 = (unint64_t)((double)(unint64_t)v21
                             - (double)(unint64_t)(v23 * *(_QWORD *)(v24 + 64)) / 1000.0);
      v27 = objc_msgSend(*(id *)(v24 + 24), "getFrameDurationMs");
      v28 = *(_QWORD *)(a1 + 32);
      v29 = *(_QWORD *)(v28 + 64);
      v30 = (unint64_t)((float)(unint64_t)(v27 * v25) / 1000.0 * (double)v29);
      if (v26 <= v30)
        v30 = 0;
      v31 = v26 - v30;
      v32 = *v3;
      if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
      {
        v35 = 136316162;
        v36 = "-[CSStartOfSpeechDetector clientSilenceFeaturesAvailable:]_block_invoke";
        v37 = 2050;
        v38 = (unint64_t)v21;
        v39 = 2050;
        v40 = v31;
        v41 = 2048;
        v42 = (unint64_t)v21 - v31;
        v43 = 2050;
        v44 = (float)((float)v42 / (float)v29);
        _os_log_impl(&dword_1C2614000, v32, OS_LOG_TYPE_DEFAULT, "%s Speech prob target reached at %{public}lu from %{public}lu, #samples=%lu, secs=%{public}f", (uint8_t *)&v35, 0x34u);
        v28 = *(_QWORD *)(a1 + 32);
      }
      *(_BYTE *)(v28 + 8) = 1;
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "endAudio");
      WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));

      if (WeakRetained)
      {
        v34 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
        objc_msgSend(v34, "startOfSpeechDetector:foundStartSampleAt:", *(_QWORD *)(a1 + 32), v31);

      }
    }
  }
}

uint64_t __35__CSStartOfSpeechDetector_endAudio__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 24);
  *(_QWORD *)(v2 + 24) = 0;

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "endAudio");
}

uint64_t __47__CSStartOfSpeechDetector_addAudio_numSamples___block_invoke(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 24), "addAudio:numSamples:", a1[5], a1[6]);
}

void __45__CSStartOfSpeechDetector_resetForNewRequest__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(objc_alloc(MEMORY[0x1E0D1F0D8]), "initWithConfigFile:samplingRate:queue:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 24);
  *(_QWORD *)(v3 + 24) = v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setDelegate:");
  v5 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
    v7 = 136315394;
    v8 = "-[CSStartOfSpeechDetector resetForNewRequest]_block_invoke";
    v9 = 2114;
    v10 = v6;
    _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_DEFAULT, "%s Reset: Created EARCaesuraSilencePosteriorGenerator: %{public}@", (uint8_t *)&v7, 0x16u);
  }
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48) = 0;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = 0;
}

@end
