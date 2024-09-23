@implementation MPCVocalAttenuationProcessorImplementation

- (void)resetAudioUnit
{
  *(_OWORD *)&self->_timestamp.mSMPTETime.mHours = 0u;
  *(_OWORD *)&self->_timestamp.mSMPTETime.mSubframes = 0u;
  *(_OWORD *)&self->_timestamp.mRateScalar = 0u;
  *(_OWORD *)&self->_timestamp.mSampleTime = 0u;
  self->_previousContiguousSampleIndex = -1;
  self->_nextContiguousSampleIndex = -1;
}

- (BOOL)isAvailable
{
  return -[MPCVocalAttenuationProcessorImplementation state](self, "state") == 2
      || -[MPCVocalAttenuationProcessorImplementation state](self, "state") == 3
      || -[MPCVocalAttenuationProcessorImplementation state](self, "state") == 4;
}

- (int64_t)state
{
  return self->_state;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (MPCVocalAttenuationProcessorImplementation)init
{
  void *v3;
  uint64_t v4;
  __int128 v5;
  __int128 v6;
  MPCVocalAttenuationProcessorImplementation *v7;
  _OWORD v9[2];
  uint64_t v10;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB1818]), "initWithCommonFormat:sampleRate:channels:interleaved:", 1, 2, 0, 44100.0);
  v4 = objc_msgSend(v3, "streamDescription");
  v5 = *(_OWORD *)v4;
  v6 = *(_OWORD *)(v4 + 16);
  v10 = *(_QWORD *)(v4 + 32);
  v9[0] = v5;
  v9[1] = v6;
  LODWORD(v5) = 1119748096;
  v7 = -[MPCVocalAttenuationProcessorImplementation initWithMaxAttenuationLevel:audioFormat:maxFrames:](self, "initWithMaxAttenuationLevel:audioFormat:maxFrames:", v9, 0x2000, *(double *)&v5);

  return v7;
}

- (void)dealloc
{
  AudioBufferList *ioBuffer;
  objc_super v4;

  ioBuffer = self->_ioBuffer;
  if (ioBuffer)
    free(ioBuffer);
  v4.receiver = self;
  v4.super_class = (Class)MPCVocalAttenuationProcessorImplementation;
  -[MPCVocalAttenuationProcessorImplementation dealloc](&v4, sel_dealloc);
}

- (MPCVocalAttenuationProcessorImplementation)initWithMaxAttenuationLevel:(float)a3 audioFormat:(AudioStreamBasicDescription *)a4 maxFrames:(unsigned int)a5
{
  char *v8;
  MPCVocalAttenuationProcessorImplementation *v9;
  __int128 v10;
  __int128 v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *creationQueue;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)MPCVocalAttenuationProcessorImplementation;
  v8 = -[MPCVocalAttenuationProcessorImplementation init](&v15, sel_init);
  v9 = (MPCVocalAttenuationProcessorImplementation *)v8;
  if (v8)
  {
    v10 = *(_OWORD *)&a4->mSampleRate;
    v11 = *(_OWORD *)&a4->mBytesPerPacket;
    *((_QWORD *)v8 + 16) = *(_QWORD *)&a4->mBitsPerChannel;
    *((_OWORD *)v8 + 6) = v10;
    *((_OWORD *)v8 + 7) = v11;
    *((_DWORD *)v8 + 34) = a5;
    *(_OWORD *)(v8 + 8) = 0u;
    *(_OWORD *)(v8 + 24) = 0u;
    *(_OWORD *)(v8 + 40) = 0u;
    *(_OWORD *)(v8 + 56) = 0u;
    *((_DWORD *)v8 + 42) = 0;
    *((float *)v8 + 43) = a3;
    *((_QWORD *)v8 + 22) = 0;
    v12 = dispatch_queue_create("com.apple.MediaPlaybackCore.VAProcessorCreationQueue", 0);
    creationQueue = v9->_creationQueue;
    v9->_creationQueue = (OS_dispatch_queue *)v12;

  }
  return v9;
}

- (double)renderingLimit
{
  void *v3;
  float v4;
  double v5;
  double v6;
  double v7;

  objc_msgSend(MEMORY[0x24BDDCB28], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "audioTapTimeOutRatioForFailureDetection");
  v5 = v4;
  -[MPCVocalAttenuationProcessorImplementation sampleTime](self, "sampleTime");
  v7 = v6 * v5;

  return v7;
}

- (double)sampleTime
{
  unint64_t v2;

  LODWORD(v2) = self->_maxFrames;
  return (double)v2 / self->_audioFormat.mSampleRate * 1000.0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_creationQueue, 0);
}

- (void)prepareWithModel:(id)a3 completion:(id)a4
{
  id v8;
  id v9;
  int64_t v10;
  void *v11;
  unint64_t v12;
  __CFString *v13;
  NSObject *creationQueue;
  _QWORD block[5];
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = -[MPCVocalAttenuationProcessorImplementation state](self, "state");
  if ((unint64_t)(v10 - 1) >= 5)
  {
    if (!v10)
    {
      objc_storeStrong((id *)&self->_model, a3);
      self->_state = 1;
      creationQueue = self->_creationQueue;
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __74__MPCVocalAttenuationProcessorImplementation_prepareWithModel_completion___block_invoke;
      block[3] = &unk_24CAB98A8;
      block[4] = self;
      v16 = v8;
      v17 = v9;
      dispatch_async(creationQueue, block);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[MPCVocalAttenuationProcessorImplementation state](self, "state");
    if (v12 >= 6)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("undefined/%ld"), v12);
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = off_24CAB5C70[v12];
    }

  }
}

- (void)tearDownWithCompletion:(id)a3
{
  id v5;
  unint64_t v6;
  NSObject *creationQueue;
  void *v8;
  unint64_t v9;
  __CFString *v10;
  _QWORD block[5];
  id v12;

  v5 = a3;
  v6 = -[MPCVocalAttenuationProcessorImplementation state](self, "state");
  if (v6 <= 5)
  {
    if (((1 << v6) & 0x1C) != 0)
    {
      creationQueue = self->_creationQueue;
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __69__MPCVocalAttenuationProcessorImplementation_tearDownWithCompletion___block_invoke;
      block[3] = &unk_24CAB9830;
      block[4] = self;
      v12 = v5;
      dispatch_async(creationQueue, block);

    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[MPCVocalAttenuationProcessorImplementation state](self, "state");
      if (v9 >= 6)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("undefined/%ld"), v9);
        v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v10 = off_24CAB5C70[v9];
      }

    }
  }

}

- (void)setEnabled:(BOOL)a3
{
  _BOOL4 v3;
  int64_t v5;

  v3 = a3;
  if (-[MPCVocalAttenuationProcessorImplementation isAvailable](self, "isAvailable") && self->_enabled != v3)
  {
    self->_enabled = v3;
    v5 = 3;
    if (!v3)
      v5 = 4;
    self->_state = v5;
    -[MPCVocalAttenuationProcessorImplementation _applyAttenuationLevelToAudioUnit](self, "_applyAttenuationLevelToAudioUnit");
  }
}

- (void)setLevel:(float)a3
{
  float v5;

  if (-[MPCVocalAttenuationProcessorImplementation isAvailable](self, "isAvailable"))
  {
    v5 = fminf(fmaxf(self->_minLevel, a3), self->_maxLevel);
    if (v5 != self->_level)
    {
      self->_level = v5;
      -[MPCVocalAttenuationProcessorImplementation _applyAttenuationLevelToAudioUnit](self, "_applyAttenuationLevelToAudioUnit");
    }
  }
}

- (BOOL)isCompatibleWithAudioFormat:(AudioStreamBasicDescription *)a3 maxFrames:(unsigned int)a4
{
  NSObject *v7;
  void *v8;
  void *v9;
  unsigned int maxFrames;
  BOOL result;
  int v12;
  BOOL v13;
  uint8_t buf[4];
  MPCVocalAttenuationProcessorImplementation *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  unsigned int v21;
  __int16 v22;
  unsigned int v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v7 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Format ID: %u - Sample Rate: %1.0fHz - Bytes/Packet: %u - Frames/Packet: %u - Bytes/Frame: %u - Channels/Frame: %u - Bits/Channel: %u"), a3->mFormatID, *(_QWORD *)&a3->mSampleRate, a3->mBytesPerPacket, a3->mFramesPerPacket, a3->mBytesPerFrame, a3->mChannelsPerFrame, a3->mBitsPerChannel);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Format ID: %u - Sample Rate: %1.0fHz - Bytes/Packet: %u - Frames/Packet: %u - Bytes/Frame: %u - Channels/Frame: %u - Bits/Channel: %u"), self->_audioFormat.mFormatID, *(_QWORD *)&self->_audioFormat.mSampleRate, self->_audioFormat.mBytesPerPacket, self->_audioFormat.mFramesPerPacket, self->_audioFormat.mBytesPerFrame, self->_audioFormat.mChannelsPerFrame, self->_audioFormat.mBitsPerChannel);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    maxFrames = self->_maxFrames;
    *(_DWORD *)buf = 138544386;
    v15 = self;
    v16 = 2114;
    v17 = v8;
    v18 = 2114;
    v19 = v9;
    v20 = 1024;
    v21 = a4;
    v22 = 1024;
    v23 = maxFrames;
    _os_log_impl(&dword_210BD8000, v7, OS_LOG_TYPE_INFO, "[AP] - %{public}@ - isCompatibleWithAudioFormat - format: %{public}@ vs %{public}@ - frames: %u vs %u", buf, 0x2Cu);

  }
  result = 0;
  v12 = ~vaddvq_s32((int32x4_t)vandq_s8((int8x16_t)vcltzq_s32(vshlq_n_s32(vceqq_s32(*(int32x4_t *)&self->_audioFormat.mFormatID, *(int32x4_t *)&a3->mFormatID), 0x1FuLL)), (int8x16_t)xmmword_210ED94B0)) & 0xF;
  v13 = self->_audioFormat.mSampleRate == a3->mSampleRate && v12 == 0;
  if (v13
    && self->_audioFormat.mBytesPerFrame == a3->mBytesPerFrame
    && self->_audioFormat.mChannelsPerFrame == a3->mChannelsPerFrame
    && self->_audioFormat.mBitsPerChannel == a3->mBitsPerChannel)
  {
    return self->_maxFrames >= a4;
  }
  return result;
}

- (BOOL)processAudioBuffer:(AudioBufferList *)a3 sampleIndex:(int64_t)a4 numberFrames:(unsigned int)a5 error:(id *)a6
{
  NSObject *v11;
  uint64_t maxFrames;
  float mSampleTime;
  float v14;
  float v15;
  void *v16;
  int v17;
  NSObject *v18;
  Float64 v19;
  int64_t nextContiguousSampleIndex;
  int64_t previousContiguousSampleIndex;
  uint64_t mNumberBuffers;
  uint64_t v23;
  float v24;
  float *mData;
  BOOL v26;
  uint64_t v27;
  float v28;
  id v29;
  BOOL result;
  NSObject *v31;
  unint64_t v32;
  uint64_t v33;
  OSStatus v34;
  OSStatus v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  NSObject *v39;
  Float64 v40;
  int64_t v41;
  int64_t v42;
  NSObject *v43;
  int64_t v44;
  unint64_t v45;
  unint64_t v46;
  uint64_t v47;
  float *v48;
  OSStatus v49;
  OSStatus v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  unsigned int v54;
  id v55;
  id v56;
  unsigned int v57;
  int v58;
  int v59;
  void *v61;
  void *v62;
  id v63;
  void *v64;
  void *v65;
  void *v66;
  id v67;
  uint64_t v68;
  uint64_t v69;
  float v70;
  float *v71;
  BOOL v72;
  uint64_t v73;
  float v74;
  NSObject *v75;
  void *v76;
  _BYTE buf[22];
  __int16 v78;
  int64_t v79;
  __int16 v80;
  int64_t v81;
  _QWORD v82[2];

  v82[1] = *MEMORY[0x24BDAC8D0];
  if (!-[MPCVocalAttenuationProcessorImplementation isAvailable](self, "isAvailable"))
  {
    if (a6)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCSuntoryError"), 211, CFSTR("Attempting to process data while processor is unavailable"));
      v29 = (id)objc_claimAutoreleasedReturnValue();
      result = 0;
      *a6 = v29;
      return result;
    }
    return 0;
  }
  if (!self->_enabled)
    return 0;
  if (self->_maxFrames < a5 && self->_nextContiguousSampleIndex - self->_previousContiguousSampleIndex != a5)
  {
    v11 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      maxFrames = self->_maxFrames;
      *(_DWORD *)buf = 134218240;
      *(_QWORD *)&buf[4] = a5;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = maxFrames;
      _os_log_impl(&dword_210BD8000, v11, OS_LOG_TYPE_ERROR, "[AP] - Request to render %ld frames [more than expected max %ld frames]", buf, 0x16u);
    }

  }
  mSampleTime = self->_timestamp.mSampleTime;
  v14 = (float)a5;
  v15 = mSampleTime / (float)a5;
  objc_msgSend(MEMORY[0x24BDDCB28], "standardUserDefaults");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "vocalAttenuationLogInputAndOuputRMSValues");

  if (v17)
  {
    v18 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = self->_timestamp.mSampleTime;
      previousContiguousSampleIndex = self->_previousContiguousSampleIndex;
      nextContiguousSampleIndex = self->_nextContiguousSampleIndex;
      *(_DWORD *)buf = 134218752;
      *(Float64 *)&buf[4] = v19;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = a4;
      v78 = 2048;
      v79 = nextContiguousSampleIndex;
      v80 = 2048;
      v81 = previousContiguousSampleIndex;
      _os_log_impl(&dword_210BD8000, v18, OS_LOG_TYPE_DEFAULT, "[AP][DEBUG] - INPUT  - sampleTime: %f - sampleIndex: %lld - nextContiguous: %lld - previousContiguous: %lld", buf, 0x2Au);
    }

    mNumberBuffers = a3->mNumberBuffers;
    if ((_DWORD)mNumberBuffers)
    {
      v23 = 0;
      v24 = 0.0;
      do
      {
        mData = (float *)a3->mBuffers[v23].mData;
        if (mData)
          v26 = a5 == 0;
        else
          v26 = 1;
        if (!v26)
        {
          v27 = a5;
          do
          {
            v28 = *mData++;
            v24 = v24 + (float)((float)(v28 * v28) / v14);
            --v27;
          }
          while (v27);
        }
        ++v23;
      }
      while (v23 != mNumberBuffers);
    }
    else
    {
      v24 = 0.0;
    }
    v31 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      *(double *)&buf[4] = v15;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = sqrt(v24);
      _os_log_impl(&dword_210BD8000, v31, OS_LOG_TYPE_DEFAULT, "[AP][DEBUG] - INPUT  - frame: %7.0f - rms: %15.10f", buf, 0x16u);
    }

  }
  if (a4 == -1 || self->_nextContiguousSampleIndex != a4 && self->_previousContiguousSampleIndex != a4)
  {
    v39 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      v40 = self->_timestamp.mSampleTime;
      v42 = self->_previousContiguousSampleIndex;
      v41 = self->_nextContiguousSampleIndex;
      *(_DWORD *)buf = 134218752;
      *(Float64 *)&buf[4] = v40;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = a4;
      v78 = 2048;
      v79 = v41;
      v80 = 2048;
      v81 = v42;
      _os_log_impl(&dword_210BD8000, v39, OS_LOG_TYPE_DEFAULT, "[AP] - Resetting audio unit for time discontinuity [no audio] - sampleTime: %f - sampleIndex: %lld - nextContiguous: %lld - previousContiguous: %lld", buf, 0x2Au);
    }

    if (v17)
    {
      v43 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        *(double *)&buf[4] = v15;
        _os_log_impl(&dword_210BD8000, v43, OS_LOG_TYPE_DEFAULT, "[AP][DEBUG] - RESET  - frame: %7.0f", buf, 0xCu);
      }

    }
    self->_timestamp.mSampleTime = 0.0;
    v44 = a4 & ~(a4 >> 63);
    self->_previousContiguousSampleIndex = v44;
    self->_nextContiguousSampleIndex = v44 + a5;
    v45 = a3->mNumberBuffers;
    if ((_DWORD)v45)
    {
      v46 = 0;
      v47 = 16;
      do
      {
        v48 = *(float **)((char *)&a3->mNumberBuffers + v47);
        if (v48)
        {
          vDSP_vclr(v48, 1, a5);
          v45 = a3->mNumberBuffers;
        }
        ++v46;
        v47 += 16;
      }
      while (v46 < v45);
    }
    v49 = AudioUnitReset(self->_processingAU, 0, 0);
    if (!v49)
    {
      v55 = 0;
LABEL_82:
      v63 = v55;
      v64 = v63;
      if (a6 && v63)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:underlyingError:debugDescription:", CFSTR("MPCSuntoryError"), 213, v63, CFSTR("Audio unit reset failed"));
        *a6 = (id)objc_claimAutoreleasedReturnValue();
      }
      goto LABEL_94;
    }
    v50 = v49;
    v51 = (void *)MEMORY[0x24BDD1540];
    v52 = *MEMORY[0x24BDD1100];
    v53 = v49;
    v82[0] = *MEMORY[0x24BDD0FC8];
    memset(buf, 0, 20);
    v54 = bswap32(v49);
    *(_DWORD *)&buf[1] = v54;
    if ((v54 & 0x80) != 0)
    {
      if (!__maskrune((char)v54, 0x40000uLL))
        goto LABEL_80;
    }
    else if ((*(_DWORD *)(MEMORY[0x24BDAC740] + 4 * (char)v54 + 60) & 0x40000) == 0)
    {
      goto LABEL_80;
    }
    v57 = (__int16)v54 >> 8;
    if ((v54 & 0x8000) != 0)
    {
      if (!__maskrune(v57, 0x40000uLL))
        goto LABEL_80;
    }
    else if ((*(_DWORD *)(MEMORY[0x24BDAC740] + 4 * v57 + 60) & 0x40000) == 0)
    {
      goto LABEL_80;
    }
    if ((buf[3] & 0x80000000) != 0)
    {
      if (!__maskrune(buf[3], 0x40000uLL))
        goto LABEL_80;
    }
    else if ((*(_DWORD *)(MEMORY[0x24BDAC740] + 4 * buf[3] + 60) & 0x40000) == 0)
    {
      goto LABEL_80;
    }
    if ((buf[4] & 0x80000000) != 0)
      v59 = __maskrune(buf[4], 0x40000uLL);
    else
      v59 = *(_DWORD *)(MEMORY[0x24BDAC740] + 4 * buf[4] + 60) & 0x40000;
    if (v59)
    {
      strcpy(&buf[5], "'");
      buf[0] = 39;
LABEL_81:
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", buf);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)buf = v61;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", buf, v82, 1);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "errorWithDomain:code:userInfo:", v52, v53, v62);
      v55 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_82;
    }
LABEL_80:
    __sprintf_chk(buf, 0, 0x14uLL, "%d", v50);
    goto LABEL_81;
  }
  if (a3->mNumberBuffers)
  {
    v32 = 0;
    v33 = 8;
    do
    {
      *(_OWORD *)((char *)&self->_ioBuffer->mNumberBuffers + v33) = *(_OWORD *)((char *)&a3->mNumberBuffers + v33);
      ++v32;
      v33 += 16;
    }
    while (v32 < a3->mNumberBuffers);
  }
  v34 = AudioUnitRender(self->_processingAU, 0, &self->_timestamp, 0, a5, a3);
  if (!v34)
  {
    v56 = 0;
    goto LABEL_90;
  }
  v35 = v34;
  v76 = (void *)MEMORY[0x24BDD1540];
  v36 = *MEMORY[0x24BDD1100];
  v37 = v34;
  v82[0] = *MEMORY[0x24BDD0FC8];
  memset(buf, 0, 20);
  *(_DWORD *)&buf[1] = bswap32(v34);
  v38 = MEMORY[0x24BDAC740];
  if ((buf[1] & 0x80) != 0)
  {
    if (!__maskrune(buf[1], 0x40000uLL))
      goto LABEL_88;
  }
  else if ((*(_DWORD *)(MEMORY[0x24BDAC740] + 4 * buf[1] + 60) & 0x40000) == 0)
  {
    goto LABEL_88;
  }
  if ((buf[2] & 0x80000000) != 0)
  {
    if (__maskrune(buf[2], 0x40000uLL))
      goto LABEL_68;
LABEL_88:
    __sprintf_chk(buf, 0, 0x14uLL, "%d", v35);
    goto LABEL_89;
  }
  if ((*(_DWORD *)(v38 + 4 * buf[2] + 60) & 0x40000) == 0)
    goto LABEL_88;
LABEL_68:
  if ((buf[3] & 0x80000000) != 0)
    v58 = __maskrune(buf[3], 0x40000uLL);
  else
    v58 = *(_DWORD *)(v38 + 4 * buf[3] + 60) & 0x40000;
  if (!v58)
    goto LABEL_88;
  if (!((buf[4] & 0x80000000) != 0 ? __maskrune(buf[4], 0x40000uLL) : *(_DWORD *)(v38 + 4 * buf[4] + 60) & 0x40000))
    goto LABEL_88;
  strcpy(&buf[5], "'");
  buf[0] = 39;
LABEL_89:
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", buf);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)buf = v65;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", buf, v82, 1);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "errorWithDomain:code:userInfo:", v36, v37, v66);
  v56 = (id)objc_claimAutoreleasedReturnValue();

LABEL_90:
  v67 = v56;
  v64 = v67;
  if (a6 && v67)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:underlyingError:debugDescription:", CFSTR("MPCSuntoryError"), 210, v67, CFSTR("Data processing failure"));
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  self->_timestamp.mSampleTime = self->_timestamp.mSampleTime + (double)a5;
  self->_previousContiguousSampleIndex = a4;
  self->_nextContiguousSampleIndex = a4 + a5;
LABEL_94:

  if (v17)
  {
    v68 = a3->mNumberBuffers;
    if ((_DWORD)v68)
    {
      v69 = 0;
      v70 = 0.0;
      do
      {
        v71 = (float *)a3->mBuffers[v69].mData;
        if (v71)
          v72 = a5 == 0;
        else
          v72 = 1;
        if (!v72)
        {
          v73 = a5;
          do
          {
            v74 = *v71++;
            v70 = v70 + (float)((float)(v74 * v74) / v14);
            --v73;
          }
          while (v73);
        }
        ++v69;
      }
      while (v69 != v68);
    }
    else
    {
      v70 = 0.0;
    }
    v75 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      *(double *)&buf[4] = v15;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = sqrt(v70);
      _os_log_impl(&dword_210BD8000, v75, OS_LOG_TYPE_DEFAULT, "[AP][DEBUG] - OUTPUT - frame: %7.0f - rms: %15.10f", buf, 0x16u);
    }

  }
  return 1;
}

- (void)_prepareWithModel:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, void *);
  BOOL v8;
  id v9;
  id v10;
  BOOL v11;
  id v12;
  BOOL v13;
  NSObject *v14;
  void *v15;
  const __CFString *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  uint8_t buf[4];
  MPCVocalAttenuationProcessorImplementation *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, uint64_t, void *))a4;
  v22 = 0;
  v8 = -[MPCVocalAttenuationProcessorImplementation _createAudioUnit:](self, "_createAudioUnit:", &v22);
  v9 = v22;
  v10 = v9;
  if (!v8)
  {
    v15 = (void *)MEMORY[0x24BDD1540];
    v16 = CFSTR("Unable to create audio unit");
    v17 = 201;
LABEL_10:
    objc_msgSend(v15, "msv_errorWithDomain:code:underlyingError:debugDescription:", CFSTR("MPCSuntoryError"), v17, v10, v16);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 5, v19);

    goto LABEL_11;
  }
  v21 = v9;
  v11 = -[MPCVocalAttenuationProcessorImplementation _setupAudioUnitWithModel:error:](self, "_setupAudioUnitWithModel:error:", v6, &v21);
  v12 = v21;

  if (!v11)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:underlyingError:debugDescription:", CFSTR("MPCSuntoryError"), 202, v12, CFSTR("Unable to setup audio unit"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 5, v18);

    v10 = v12;
    goto LABEL_11;
  }
  v20 = v12;
  v13 = -[MPCVocalAttenuationProcessorImplementation _initializeAudioUnit:](self, "_initializeAudioUnit:", &v20);
  v10 = v20;

  if (!v13)
  {
    v15 = (void *)MEMORY[0x24BDD1540];
    v16 = CFSTR("Unable to initialize audio unit");
    v17 = 203;
    goto LABEL_10;
  }
  v14 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v24 = self;
    _os_log_impl(&dword_210BD8000, v14, OS_LOG_TYPE_DEFAULT, "[AP] - %{public}@ - Audio Unit created", buf, 0xCu);
  }

  v7[2](v7, 2, 0);
LABEL_11:

}

- (BOOL)_createAudioUnit:(id *)a3
{
  OpaqueAudioComponent *Next;
  NSObject *v6;
  OSStatus v7;
  OSStatus v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int v12;
  uint64_t v13;
  void *v14;
  BOOL v15;
  unsigned int v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  NSObject *v21;
  id v22;
  AudioComponentDescription inDesc;
  uint8_t buf[24];
  uint64_t v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x24BDAC8D0];
  *(_OWORD *)&inDesc.componentType = *(_OWORD *)"xfuasiovlppa";
  inDesc.componentFlagsMask = 0;
  Next = AudioComponentFindNext(0, &inDesc);
  v6 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = Next;
    _os_log_impl(&dword_210BD8000, v6, OS_LOG_TYPE_INFO, "[AP] - %{public}@ - Found AudioComponent: %p", buf, 0x16u);
  }

  v7 = AudioComponentInstanceNew(Next, &self->_processingAU);
  if (!v7)
  {
    v14 = 0;
    v15 = 1;
    goto LABEL_28;
  }
  v8 = v7;
  v9 = (void *)MEMORY[0x24BDD1540];
  v10 = *MEMORY[0x24BDD1100];
  v11 = v7;
  v26 = *MEMORY[0x24BDD0FC8];
  memset(buf, 0, 20);
  v12 = bswap32(v7);
  *(_DWORD *)&buf[1] = v12;
  v13 = MEMORY[0x24BDAC740];
  if ((v12 & 0x80) != 0)
  {
    if (!__maskrune((char)v12, 0x40000uLL))
      goto LABEL_21;
  }
  else if ((*(_DWORD *)(MEMORY[0x24BDAC740] + 4 * (char)v12 + 60) & 0x40000) == 0)
  {
    goto LABEL_21;
  }
  v16 = (__int16)v12 >> 8;
  if ((v12 & 0x8000) != 0)
  {
    if (!__maskrune(v16, 0x40000uLL))
      goto LABEL_21;
  }
  else if ((*(_DWORD *)(v13 + 4 * v16 + 60) & 0x40000) == 0)
  {
    goto LABEL_21;
  }
  if ((char)buf[3] < 0)
  {
    if (!__maskrune((char)buf[3], 0x40000uLL))
      goto LABEL_21;
  }
  else if ((*(_DWORD *)(v13 + 4 * (char)buf[3] + 60) & 0x40000) == 0)
  {
    goto LABEL_21;
  }
  if ((char)buf[4] < 0)
  {
    if (__maskrune((char)buf[4], 0x40000uLL))
      goto LABEL_19;
  }
  else if ((*(_DWORD *)(v13 + 4 * (char)buf[4] + 60) & 0x40000) != 0)
  {
LABEL_19:
    strcpy((char *)&buf[5], "'");
    buf[0] = 39;
    goto LABEL_22;
  }
LABEL_21:
  __sprintf_chk((char *)buf, 0, 0x14uLL, "%d", v8);
LABEL_22:
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", buf);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v17;
  v15 = 1;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "errorWithDomain:code:userInfo:", v10, v11, v18);
  v19 = (id)objc_claimAutoreleasedReturnValue();

  v20 = v19;
  v14 = v20;
  if (v20)
  {
    if (a3)
      *a3 = objc_retainAutorelease(v20);
    v21 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v22 = *a3;
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v22;
      _os_log_impl(&dword_210BD8000, v21, OS_LOG_TYPE_ERROR, "[AP] - %{public}@ - Error creating audio unit: %{public}@", buf, 0x16u);
    }

    v15 = 0;
  }
LABEL_28:

  return v15;
}

- (BOOL)_setupAudioUnitWithModel:(id)a3 error:(id *)a4
{
  _QWORD *v6;
  OSStatus v7;
  OSStatus v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  NSObject *v18;
  id v19;
  const char *v20;
  NSObject *v21;
  uint64_t maxFrames;
  OSStatus v23;
  OSStatus v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  id v32;
  NSObject *v33;
  id v34;
  OSStatus v35;
  OSStatus v36;
  _QWORD *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  id v43;
  id v44;
  id v45;
  OSStatus v46;
  OSStatus v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  int v51;
  int v52;
  void *v53;
  void *v54;
  id v55;
  id v56;
  id v57;
  NSObject *v58;
  void *v59;
  id v60;
  void *v61;
  id v62;
  OSStatus v63;
  OSStatus v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  int v68;
  void *v70;
  void *v71;
  id v72;
  id v73;
  id v74;
  NSObject *v75;
  void *v76;
  id v77;
  void *v78;
  id v79;
  OSStatus v80;
  OSStatus v81;
  void *v82;
  uint64_t v83;
  uint64_t v84;
  int v85;
  int v86;
  int v87;
  int v88;
  void *v89;
  void *v90;
  id v91;
  id v92;
  id v93;
  BOOL v94;
  NSObject *v96;
  OSStatus v97;
  OSStatus v98;
  void *v99;
  uint64_t v100;
  uint64_t v101;
  int v102;
  int v103;
  int v104;
  int v105;
  void *v106;
  void *v107;
  id v108;
  id v109;
  NSObject *v110;
  id v111;
  const char *v112;
  void *v113;
  int v114;
  _BOOL4 v115;
  OSStatus v116;
  OSStatus v117;
  void *v118;
  uint64_t v119;
  uint64_t v120;
  int v121;
  int v122;
  int v123;
  int v124;
  void *v125;
  void *v126;
  id v127;
  id v128;
  id v129;
  OSStatus v130;
  OSStatus v131;
  void *v132;
  uint64_t v133;
  uint64_t v134;
  __darwin_ct_rune_t v135;
  int v136;
  unsigned int v137;
  int v138;
  int v139;
  int v140;
  void *v141;
  void *v142;
  id v143;
  id v144;
  id v145;
  const __CFString *v146;
  id v147;
  id v148;
  _QWORD inData[2];
  __darwin_ct_rune_t v150[6];
  uint64_t v151;
  _QWORD v152[2];

  v152[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  inData[0] = inputRenderCallback;
  inData[1] = self;
  v7 = AudioUnitSetProperty(self->_processingAU, 0x17u, 1u, 0, inData, 0x10u);
  if (!v7)
    goto LABEL_25;
  v8 = v7;
  v9 = (void *)MEMORY[0x24BDD1540];
  v10 = *MEMORY[0x24BDD1100];
  v11 = v7;
  v151 = *MEMORY[0x24BDD0FC8];
  memset(v150, 0, 20);
  *(__darwin_ct_rune_t *)((char *)v150 + 1) = bswap32(v7);
  v12 = MEMORY[0x24BDAC740];
  if ((v150[0] & 0x8000) != 0)
  {
    if (!__maskrune(SBYTE1(v150[0]), 0x40000uLL))
      goto LABEL_19;
  }
  else if ((*(_DWORD *)(MEMORY[0x24BDAC740] + 4 * SBYTE1(v150[0]) + 60) & 0x40000) == 0)
  {
    goto LABEL_19;
  }
  if (SBYTE2(v150[0]) < 0)
  {
    if (!__maskrune(SBYTE2(v150[0]), 0x40000uLL))
      goto LABEL_19;
  }
  else if ((*(_DWORD *)(v12 + 4 * SBYTE2(v150[0]) + 60) & 0x40000) == 0)
  {
    goto LABEL_19;
  }
  if (SHIBYTE(v150[0]) < 0)
  {
    if (!__maskrune(SHIBYTE(v150[0]), 0x40000uLL))
      goto LABEL_19;
  }
  else if ((*(_DWORD *)(v12 + 4 * SHIBYTE(v150[0]) + 60) & 0x40000) == 0)
  {
    goto LABEL_19;
  }
  if (SLOBYTE(v150[1]) < 0)
  {
    if (__maskrune(SLOBYTE(v150[1]), 0x40000uLL))
      goto LABEL_17;
  }
  else if ((*(_DWORD *)(v12 + 4 * SLOBYTE(v150[1]) + 60) & 0x40000) != 0)
  {
LABEL_17:
    strcpy((char *)&v150[1] + 1, "'");
    LOBYTE(v150[0]) = 39;
    goto LABEL_20;
  }
LABEL_19:
  __sprintf_chk((char *)v150, 0, 0x14uLL, "%d", v8);
LABEL_20:
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v150);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v152[0] = v13;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v152, &v151, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "errorWithDomain:code:userInfo:", v10, v11, v14);
  v15 = (id)objc_claimAutoreleasedReturnValue();

  v16 = v15;
  if (v16)
  {
    v17 = v16;
    if (a4)
      *a4 = objc_retainAutorelease(v16);
    v18 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      goto LABEL_165;
    v19 = *a4;
    v150[0] = 138543618;
    *(_QWORD *)&v150[1] = self;
    LOWORD(v150[3]) = 2114;
    *(_QWORD *)((char *)&v150[3] + 2) = v19;
    v20 = "[AP] - %{public}@ - Error setting input render callback format: %{public}@";
LABEL_164:
    _os_log_impl(&dword_210BD8000, v18, OS_LOG_TYPE_ERROR, v20, (uint8_t *)v150, 0x16u);
LABEL_165:

    v94 = 0;
    goto LABEL_166;
  }
LABEL_25:
  self->_ioBuffer = (AudioBufferList *)malloc_type_malloc(16 * (self->_audioFormat.mChannelsPerFrame - 1) + 24, 0x7E22D33BuLL);
  v21 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    maxFrames = self->_maxFrames;
    v150[0] = 138543618;
    *(_QWORD *)&v150[1] = self;
    LOWORD(v150[3]) = 2048;
    *(_QWORD *)((char *)&v150[3] + 2) = maxFrames;
    _os_log_impl(&dword_210BD8000, v21, OS_LOG_TYPE_INFO, "[AP] - %{public}@ - Setting up maximum frames per slice to %ld", (uint8_t *)v150, 0x16u);
  }

  v23 = AudioUnitSetProperty(self->_processingAU, 0xEu, 0, 0, &self->_maxFrames, 4u);
  if (!v23)
    goto LABEL_51;
  v24 = v23;
  v25 = (void *)MEMORY[0x24BDD1540];
  v26 = *MEMORY[0x24BDD1100];
  v27 = v23;
  v151 = *MEMORY[0x24BDD0FC8];
  memset(v150, 0, 20);
  *(__darwin_ct_rune_t *)((char *)v150 + 1) = bswap32(v23);
  if ((v150[0] & 0x8000) != 0)
  {
    if (!__maskrune(SBYTE1(v150[0]), 0x40000uLL))
      goto LABEL_45;
  }
  else if ((*(_DWORD *)(MEMORY[0x24BDAC740] + 4 * SBYTE1(v150[0]) + 60) & 0x40000) == 0)
  {
    goto LABEL_45;
  }
  if (SBYTE2(v150[0]) < 0)
  {
    if (!__maskrune(SBYTE2(v150[0]), 0x40000uLL))
      goto LABEL_45;
  }
  else if ((*(_DWORD *)(MEMORY[0x24BDAC740] + 4 * SBYTE2(v150[0]) + 60) & 0x40000) == 0)
  {
    goto LABEL_45;
  }
  if (SHIBYTE(v150[0]) < 0)
  {
    if (!__maskrune(SHIBYTE(v150[0]), 0x40000uLL))
      goto LABEL_45;
  }
  else if ((*(_DWORD *)(MEMORY[0x24BDAC740] + 4 * SHIBYTE(v150[0]) + 60) & 0x40000) == 0)
  {
    goto LABEL_45;
  }
  if (SLOBYTE(v150[1]) < 0)
  {
    if (__maskrune(SLOBYTE(v150[1]), 0x40000uLL))
      goto LABEL_43;
  }
  else if ((*(_DWORD *)(MEMORY[0x24BDAC740] + 4 * SLOBYTE(v150[1]) + 60) & 0x40000) != 0)
  {
LABEL_43:
    strcpy((char *)&v150[1] + 1, "'");
    LOBYTE(v150[0]) = 39;
    goto LABEL_46;
  }
LABEL_45:
  __sprintf_chk((char *)v150, 0, 0x14uLL, "%d", v24);
LABEL_46:
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v150);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v152[0] = v28;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v152, &v151, 1);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "errorWithDomain:code:userInfo:", v26, v27, v29);
  v30 = (id)objc_claimAutoreleasedReturnValue();

  v31 = v30;
  if (v31)
  {
    v17 = v31;
    if (a4)
      *a4 = objc_retainAutorelease(v31);
    v18 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      goto LABEL_165;
    v32 = *a4;
    v150[0] = 138543618;
    *(_QWORD *)&v150[1] = self;
    LOWORD(v150[3]) = 2114;
    *(_QWORD *)((char *)&v150[3] + 2) = v32;
    v20 = "[AP] - %{public}@ - Error setting max frames: %{public}@";
    goto LABEL_164;
  }
LABEL_51:
  v33 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Format ID: %u - Sample Rate: %1.0fHz - Bytes/Packet: %u - Frames/Packet: %u - Bytes/Frame: %u - Channels/Frame: %u - Bits/Channel: %u"), self->_audioFormat.mFormatID, *(_QWORD *)&self->_audioFormat.mSampleRate, self->_audioFormat.mBytesPerPacket, self->_audioFormat.mFramesPerPacket, self->_audioFormat.mBytesPerFrame, self->_audioFormat.mChannelsPerFrame, self->_audioFormat.mBitsPerChannel);
    v34 = (id)objc_claimAutoreleasedReturnValue();
    v150[0] = 138543618;
    *(_QWORD *)&v150[1] = self;
    LOWORD(v150[3]) = 2114;
    *(_QWORD *)((char *)&v150[3] + 2) = v34;
    _os_log_impl(&dword_210BD8000, v33, OS_LOG_TYPE_INFO, "[AP] - %{public}@ - Setting up stream processing format to %{public}@", (uint8_t *)v150, 0x16u);

  }
  v35 = AudioUnitSetProperty(self->_processingAU, 8u, 1u, 0, &self->_audioFormat, 0x28u);
  if (!v35)
  {
    v37 = v6;
    goto LABEL_77;
  }
  v36 = v35;
  v37 = v6;
  v38 = (void *)MEMORY[0x24BDD1540];
  v39 = *MEMORY[0x24BDD1100];
  v40 = v35;
  v151 = *MEMORY[0x24BDD0FC8];
  memset(v150, 0, 20);
  *(__darwin_ct_rune_t *)((char *)v150 + 1) = bswap32(v35);
  if ((v150[0] & 0x8000) != 0)
  {
    if (!__maskrune(SBYTE1(v150[0]), 0x40000uLL))
      goto LABEL_71;
  }
  else if ((*(_DWORD *)(MEMORY[0x24BDAC740] + 4 * SBYTE1(v150[0]) + 60) & 0x40000) == 0)
  {
    goto LABEL_71;
  }
  if (SBYTE2(v150[0]) < 0)
  {
    if (!__maskrune(SBYTE2(v150[0]), 0x40000uLL))
      goto LABEL_71;
  }
  else if ((*(_DWORD *)(MEMORY[0x24BDAC740] + 4 * SBYTE2(v150[0]) + 60) & 0x40000) == 0)
  {
    goto LABEL_71;
  }
  if (SHIBYTE(v150[0]) < 0)
  {
    if (!__maskrune(SHIBYTE(v150[0]), 0x40000uLL))
      goto LABEL_71;
  }
  else if ((*(_DWORD *)(MEMORY[0x24BDAC740] + 4 * SHIBYTE(v150[0]) + 60) & 0x40000) == 0)
  {
    goto LABEL_71;
  }
  if (SLOBYTE(v150[1]) < 0)
  {
    if (__maskrune(SLOBYTE(v150[1]), 0x40000uLL))
      goto LABEL_69;
  }
  else if ((*(_DWORD *)(MEMORY[0x24BDAC740] + 4 * SLOBYTE(v150[1]) + 60) & 0x40000) != 0)
  {
LABEL_69:
    strcpy((char *)&v150[1] + 1, "'");
    LOBYTE(v150[0]) = 39;
    goto LABEL_72;
  }
LABEL_71:
  __sprintf_chk((char *)v150, 0, 0x14uLL, "%d", v36);
LABEL_72:
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v150);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v152[0] = v41;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v152, &v151, 1);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "errorWithDomain:code:userInfo:", v39, v40, v42);
  v43 = (id)objc_claimAutoreleasedReturnValue();

  v44 = v43;
  if (v44)
  {
    v17 = v44;
    if (a4)
      *a4 = objc_retainAutorelease(v44);
    v18 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    v6 = v37;
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      goto LABEL_165;
    v45 = *a4;
    v150[0] = 138543618;
    *(_QWORD *)&v150[1] = self;
    LOWORD(v150[3]) = 2114;
    *(_QWORD *)((char *)&v150[3] + 2) = v45;
    v20 = "[AP] - %{public}@ - Error setting input format: %{public}@";
    goto LABEL_164;
  }
LABEL_77:
  v46 = AudioUnitSetProperty(self->_processingAU, 8u, 2u, 0, &self->_audioFormat, 0x28u);
  if (!v46)
  {
    v6 = v37;
    goto LABEL_102;
  }
  v47 = v46;
  v48 = (void *)MEMORY[0x24BDD1540];
  v49 = *MEMORY[0x24BDD1100];
  v50 = v46;
  v151 = *MEMORY[0x24BDD0FC8];
  memset(v150, 0, 20);
  *(__darwin_ct_rune_t *)((char *)v150 + 1) = bswap32(v46);
  if ((v150[0] & 0x8000) != 0)
    v51 = __maskrune(SBYTE1(v150[0]), 0x40000uLL);
  else
    v51 = *(_DWORD *)(MEMORY[0x24BDAC740] + 4 * SBYTE1(v150[0]) + 60) & 0x40000;
  v6 = v37;
  if (!v51)
    goto LABEL_96;
  if (SBYTE2(v150[0]) < 0)
  {
    if (!__maskrune(SBYTE2(v150[0]), 0x40000uLL))
      goto LABEL_96;
  }
  else if ((*(_DWORD *)(MEMORY[0x24BDAC740] + 4 * SBYTE2(v150[0]) + 60) & 0x40000) == 0)
  {
    goto LABEL_96;
  }
  if (SHIBYTE(v150[0]) < 0)
  {
    if (!__maskrune(SHIBYTE(v150[0]), 0x40000uLL))
      goto LABEL_96;
  }
  else if ((*(_DWORD *)(MEMORY[0x24BDAC740] + 4 * SHIBYTE(v150[0]) + 60) & 0x40000) == 0)
  {
    goto LABEL_96;
  }
  if (SLOBYTE(v150[1]) < 0)
    v52 = __maskrune(SLOBYTE(v150[1]), 0x40000uLL);
  else
    v52 = *(_DWORD *)(MEMORY[0x24BDAC740] + 4 * SLOBYTE(v150[1]) + 60) & 0x40000;
  if (v52)
  {
    strcpy((char *)&v150[1] + 1, "'");
    LOBYTE(v150[0]) = 39;
    goto LABEL_97;
  }
LABEL_96:
  __sprintf_chk((char *)v150, 0, 0x14uLL, "%d", v47);
LABEL_97:
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v150);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v152[0] = v53;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v152, &v151, 1);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "errorWithDomain:code:userInfo:", v49, v50, v54);
  v55 = (id)objc_claimAutoreleasedReturnValue();

  v56 = v55;
  if (v56)
  {
    v17 = v56;
    if (a4)
      *a4 = objc_retainAutorelease(v56);
    v18 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      goto LABEL_165;
    v57 = *a4;
    v150[0] = 138543618;
    *(_QWORD *)&v150[1] = self;
    LOWORD(v150[3]) = 2114;
    *(_QWORD *)((char *)&v150[3] + 2) = v57;
    v20 = "[AP] - %{public}@ - Error setting output format: %{public}@";
    goto LABEL_164;
  }
LABEL_102:
  _MPCLogCategoryPlayback();
  v58 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
  {
    if (v6)
      v59 = (void *)v6[4];
    else
      v59 = 0;
    v60 = v59;
    v150[0] = 138543618;
    *(_QWORD *)&v150[1] = self;
    LOWORD(v150[3]) = 2114;
    *(_QWORD *)((char *)&v150[3] + 2) = v60;
    _os_log_impl(&dword_210BD8000, v58, OS_LOG_TYPE_INFO, "[AP] - %{public}@ - Setting up plist path to %{public}@", (uint8_t *)v150, 0x16u);

  }
  v148 = 0;
  if (v6)
    v61 = (void *)v6[4];
  else
    v61 = 0;
  v62 = v61;

  v148 = v62;
  v63 = AudioUnitSetProperty(self->_processingAU, 0x7530u, 0, 0, &v148, 8u);
  if (!v63)
    goto LABEL_133;
  v64 = v63;
  v65 = (void *)MEMORY[0x24BDD1540];
  v66 = *MEMORY[0x24BDD1100];
  v67 = v63;
  v151 = *MEMORY[0x24BDD0FC8];
  memset(v150, 0, 20);
  *(__darwin_ct_rune_t *)((char *)v150 + 1) = bswap32(v63);
  if ((v150[0] & 0x8000) != 0)
  {
    if (!__maskrune(SBYTE1(v150[0]), 0x40000uLL))
      goto LABEL_127;
  }
  else if ((*(_DWORD *)(MEMORY[0x24BDAC740] + 4 * SBYTE1(v150[0]) + 60) & 0x40000) == 0)
  {
    goto LABEL_127;
  }
  if (SBYTE2(v150[0]) < 0)
  {
    if (!__maskrune(SBYTE2(v150[0]), 0x40000uLL))
      goto LABEL_127;
  }
  else if ((*(_DWORD *)(MEMORY[0x24BDAC740] + 4 * SBYTE2(v150[0]) + 60) & 0x40000) == 0)
  {
    goto LABEL_127;
  }
  if (SHIBYTE(v150[0]) < 0)
    v68 = __maskrune(SHIBYTE(v150[0]), 0x40000uLL);
  else
    v68 = *(_DWORD *)(MEMORY[0x24BDAC740] + 4 * SHIBYTE(v150[0]) + 60) & 0x40000;
  if (v68)
  {
    if (SLOBYTE(v150[1]) < 0
       ? __maskrune(SLOBYTE(v150[1]), 0x40000uLL)
       : *(_DWORD *)(MEMORY[0x24BDAC740] + 4 * SLOBYTE(v150[1]) + 60) & 0x40000)
    {
      strcpy((char *)&v150[1] + 1, "'");
      LOBYTE(v150[0]) = 39;
      goto LABEL_128;
    }
  }
LABEL_127:
  __sprintf_chk((char *)v150, 0, 0x14uLL, "%d", v64);
LABEL_128:
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v150);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v152[0] = v70;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v152, &v151, 1);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "errorWithDomain:code:userInfo:", v66, v67, v71);
  v72 = (id)objc_claimAutoreleasedReturnValue();

  v73 = v72;
  if (v73)
  {
    v17 = v73;
    if (a4)
      *a4 = objc_retainAutorelease(v73);
    _MPCLogCategoryPlayback();
    v18 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      goto LABEL_165;
    v74 = *a4;
    v150[0] = 138543618;
    *(_QWORD *)&v150[1] = self;
    LOWORD(v150[3]) = 2114;
    *(_QWORD *)((char *)&v150[3] + 2) = v74;
    v20 = "[AP] - %{public}@ - Error setting model plist path: %{public}@";
    goto LABEL_164;
  }
LABEL_133:
  _MPCLogCategoryPlayback();
  v75 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v75, OS_LOG_TYPE_INFO))
  {
    if (v6)
      v76 = (void *)v6[3];
    else
      v76 = 0;
    v77 = v76;
    v150[0] = 138543618;
    *(_QWORD *)&v150[1] = self;
    LOWORD(v150[3]) = 2114;
    *(_QWORD *)((char *)&v150[3] + 2) = v77;
    _os_log_impl(&dword_210BD8000, v75, OS_LOG_TYPE_INFO, "[AP] - %{public}@ - Setting up model base path to %{public}@", (uint8_t *)v150, 0x16u);

  }
  v147 = 0;
  if (v6)
    v78 = (void *)v6[3];
  else
    v78 = 0;
  v79 = v78;

  v147 = v79;
  v80 = AudioUnitSetProperty(self->_processingAU, 0x9C40u, 0, 0, &v147, 8u);
  if (v80)
  {
    v81 = v80;
    v82 = (void *)MEMORY[0x24BDD1540];
    v83 = *MEMORY[0x24BDD1100];
    v84 = v80;
    v151 = *MEMORY[0x24BDD0FC8];
    memset(v150, 0, 20);
    *(__darwin_ct_rune_t *)((char *)v150 + 1) = bswap32(v80);
    v85 = (v150[0] & 0x8000) != 0
        ? __maskrune(SBYTE1(v150[0]), 0x40000uLL)
        : *(_DWORD *)(MEMORY[0x24BDAC740] + 4 * SBYTE1(v150[0]) + 60) & 0x40000;
    if (v85
      && (SBYTE2(v150[0]) < 0
        ? (v86 = __maskrune(SBYTE2(v150[0]), 0x40000uLL))
        : (v86 = *(_DWORD *)(MEMORY[0x24BDAC740] + 4 * SBYTE2(v150[0]) + 60) & 0x40000),
          v86
       && (SHIBYTE(v150[0]) < 0
         ? (v87 = __maskrune(SHIBYTE(v150[0]), 0x40000uLL))
         : (v87 = *(_DWORD *)(MEMORY[0x24BDAC740] + 4 * SHIBYTE(v150[0]) + 60) & 0x40000),
           v87
        && (SLOBYTE(v150[1]) < 0
          ? (v88 = __maskrune(SLOBYTE(v150[1]), 0x40000uLL))
          : (v88 = *(_DWORD *)(MEMORY[0x24BDAC740] + 4 * SLOBYTE(v150[1]) + 60) & 0x40000),
            v88))))
    {
      strcpy((char *)&v150[1] + 1, "'");
      LOBYTE(v150[0]) = 39;
    }
    else
    {
      __sprintf_chk((char *)v150, 0, 0x14uLL, "%d", v81);
    }
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v150);
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    v152[0] = v89;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v152, &v151, 1);
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "errorWithDomain:code:userInfo:", v83, v84, v90);
    v91 = (id)objc_claimAutoreleasedReturnValue();

    v92 = v91;
    if (v92)
    {
      v17 = v92;
      if (a4)
        *a4 = objc_retainAutorelease(v92);
      _MPCLogCategoryPlayback();
      v18 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        goto LABEL_165;
      v93 = *a4;
      v150[0] = 138543618;
      *(_QWORD *)&v150[1] = self;
      LOWORD(v150[3]) = 2114;
      *(_QWORD *)((char *)&v150[3] + 2) = v93;
      v20 = "[AP] - %{public}@ - Error setting model base path: %{public}@";
      goto LABEL_164;
    }
  }
  _MPCLogCategoryPlayback();
  v96 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v96, OS_LOG_TYPE_INFO))
  {
    v150[0] = 138543362;
    *(_QWORD *)&v150[1] = self;
    _os_log_impl(&dword_210BD8000, v96, OS_LOG_TYPE_INFO, "[AP] - %{public}@ - Turning dereverb off", (uint8_t *)v150, 0xCu);
  }

  v146 = &stru_24CABB5D0;
  v97 = AudioUnitSetProperty(self->_processingAU, 0xC350u, 0, 0, &v146, 8u);
  if (v97)
  {
    v98 = v97;
    v99 = (void *)MEMORY[0x24BDD1540];
    v100 = *MEMORY[0x24BDD1100];
    v101 = v97;
    v151 = *MEMORY[0x24BDD0FC8];
    memset(v150, 0, 20);
    *(__darwin_ct_rune_t *)((char *)v150 + 1) = bswap32(v97);
    v102 = (v150[0] & 0x8000) != 0
         ? __maskrune(SBYTE1(v150[0]), 0x40000uLL)
         : *(_DWORD *)(MEMORY[0x24BDAC740] + 4 * SBYTE1(v150[0]) + 60) & 0x40000;
    if (v102
      && (SBYTE2(v150[0]) < 0
        ? (v103 = __maskrune(SBYTE2(v150[0]), 0x40000uLL))
        : (v103 = *(_DWORD *)(MEMORY[0x24BDAC740] + 4 * SBYTE2(v150[0]) + 60) & 0x40000),
          v103
       && (SHIBYTE(v150[0]) < 0
         ? (v104 = __maskrune(SHIBYTE(v150[0]), 0x40000uLL))
         : (v104 = *(_DWORD *)(MEMORY[0x24BDAC740] + 4 * SHIBYTE(v150[0]) + 60) & 0x40000),
           v104
        && (SLOBYTE(v150[1]) < 0
          ? (v105 = __maskrune(SLOBYTE(v150[1]), 0x40000uLL))
          : (v105 = *(_DWORD *)(MEMORY[0x24BDAC740] + 4 * SLOBYTE(v150[1]) + 60) & 0x40000),
            v105))))
    {
      strcpy((char *)&v150[1] + 1, "'");
      LOBYTE(v150[0]) = 39;
    }
    else
    {
      __sprintf_chk((char *)v150, 0, 0x14uLL, "%d", v98);
    }
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v150);
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    v152[0] = v106;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v152, &v151, 1);
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v99, "errorWithDomain:code:userInfo:", v100, v101, v107);
    v108 = (id)objc_claimAutoreleasedReturnValue();

    v109 = v108;
    if (v109)
    {
      v17 = v109;
      if (a4)
        *a4 = objc_retainAutorelease(v109);
      _MPCLogCategoryPlayback();
      v110 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v110, OS_LOG_TYPE_ERROR))
        goto LABEL_251;
      v111 = *a4;
      v150[0] = 138543618;
      *(_QWORD *)&v150[1] = self;
      LOWORD(v150[3]) = 2114;
      *(_QWORD *)((char *)&v150[3] + 2) = v111;
      v112 = "[AP] - %{public}@ - Error disabling Dereverb: %{public}@";
LABEL_250:
      _os_log_impl(&dword_210BD8000, v110, OS_LOG_TYPE_ERROR, v112, (uint8_t *)v150, 0x16u);
LABEL_251:
      v94 = 0;
LABEL_252:

      goto LABEL_166;
    }
  }
  objc_msgSend(MEMORY[0x24BDDCB28], "standardUserDefaults");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  v114 = objc_msgSend(v113, "shouldBypassVocalAttenuationDenoising");

  _MPCLogCategoryPlayback();
  v110 = objc_claimAutoreleasedReturnValue();
  v115 = os_log_type_enabled(v110, OS_LOG_TYPE_INFO);
  if (!v114)
  {
    if (v115)
    {
      v150[0] = 138543362;
      *(_QWORD *)&v150[1] = self;
      v94 = 1;
      _os_log_impl(&dword_210BD8000, v110, OS_LOG_TYPE_INFO, "[AP] - %{public}@ - Keeping denoising on", (uint8_t *)v150, 0xCu);
      v17 = 0;
    }
    else
    {
      v17 = 0;
      v94 = 1;
    }
    goto LABEL_252;
  }
  if (v115)
  {
    v150[0] = 138543362;
    *(_QWORD *)&v150[1] = self;
    _os_log_impl(&dword_210BD8000, v110, OS_LOG_TYPE_INFO, "[AP] - %{public}@ - Turning denoising off", (uint8_t *)v150, 0xCu);
  }

  v116 = AudioUnitSetParameter(self->_processingAU, 0x17626u, 0, 0, 1.0, 0);
  if (v116)
  {
    v117 = v116;
    v118 = (void *)MEMORY[0x24BDD1540];
    v119 = *MEMORY[0x24BDD1100];
    v120 = v116;
    v151 = *MEMORY[0x24BDD0FC8];
    memset(v150, 0, 20);
    *(__darwin_ct_rune_t *)((char *)v150 + 1) = bswap32(v116);
    v121 = (v150[0] & 0x8000) != 0
         ? __maskrune(SBYTE1(v150[0]), 0x40000uLL)
         : *(_DWORD *)(MEMORY[0x24BDAC740] + 4 * SBYTE1(v150[0]) + 60) & 0x40000;
    if (v121
      && (SBYTE2(v150[0]) < 0
        ? (v122 = __maskrune(SBYTE2(v150[0]), 0x40000uLL))
        : (v122 = *(_DWORD *)(MEMORY[0x24BDAC740] + 4 * SBYTE2(v150[0]) + 60) & 0x40000),
          v122
       && (SHIBYTE(v150[0]) < 0
         ? (v123 = __maskrune(SHIBYTE(v150[0]), 0x40000uLL))
         : (v123 = *(_DWORD *)(MEMORY[0x24BDAC740] + 4 * SHIBYTE(v150[0]) + 60) & 0x40000),
           v123
        && (SLOBYTE(v150[1]) < 0
          ? (v124 = __maskrune(SLOBYTE(v150[1]), 0x40000uLL))
          : (v124 = *(_DWORD *)(MEMORY[0x24BDAC740] + 4 * SLOBYTE(v150[1]) + 60) & 0x40000),
            v124))))
    {
      strcpy((char *)&v150[1] + 1, "'");
      LOBYTE(v150[0]) = 39;
    }
    else
    {
      __sprintf_chk((char *)v150, 0, 0x14uLL, "%d", v117);
    }
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v150);
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    v152[0] = v125;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v152, &v151, 1);
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v118, "errorWithDomain:code:userInfo:", v119, v120, v126);
    v127 = (id)objc_claimAutoreleasedReturnValue();

    v128 = v127;
    if (v128)
    {
      v17 = v128;
      if (a4)
        *a4 = objc_retainAutorelease(v128);
      _MPCLogCategoryPlayback();
      v110 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v110, OS_LOG_TYPE_ERROR))
        goto LABEL_251;
      v129 = *a4;
      v150[0] = 138543618;
      *(_QWORD *)&v150[1] = self;
      LOWORD(v150[3]) = 2114;
      *(_QWORD *)((char *)&v150[3] + 2) = v129;
      v112 = "[AP] - %{public}@ - Error setting UseTuningMode to 1: %{public}@";
      goto LABEL_250;
    }
  }
  v130 = AudioUnitSetParameter(self->_processingAU, 0x17627u, 0, 0, 0.0, 0);
  if (!v130)
  {
    v17 = 0;
    v94 = 1;
    goto LABEL_166;
  }
  v131 = v130;
  v132 = (void *)MEMORY[0x24BDD1540];
  v133 = *MEMORY[0x24BDD1100];
  v134 = v130;
  v151 = *MEMORY[0x24BDD0FC8];
  memset(v150, 0, 20);
  v135 = bswap32(v130);
  *(__darwin_ct_rune_t *)((char *)v150 + 1) = v135;
  if ((v135 & 0x80) != 0)
    v136 = __maskrune((char)v135, 0x40000uLL);
  else
    v136 = *(_DWORD *)(MEMORY[0x24BDAC740] + 4 * (char)v135 + 60) & 0x40000;
  if (v136
    && ((v137 = (__int16)v135 >> 8, (v135 & 0x8000) != 0)
      ? (v138 = __maskrune(v137, 0x40000uLL))
      : (v138 = *(_DWORD *)(MEMORY[0x24BDAC740] + 4 * v137 + 60) & 0x40000),
        v138
     && (SHIBYTE(v150[0]) < 0
       ? (v139 = __maskrune(SHIBYTE(v150[0]), 0x40000uLL))
       : (v139 = *(_DWORD *)(MEMORY[0x24BDAC740] + 4 * SHIBYTE(v150[0]) + 60) & 0x40000),
         v139
      && (SLOBYTE(v150[1]) < 0
        ? (v140 = __maskrune(SLOBYTE(v150[1]), 0x40000uLL))
        : (v140 = *(_DWORD *)(MEMORY[0x24BDAC740] + 4 * SLOBYTE(v150[1]) + 60) & 0x40000),
          v140))))
  {
    strcpy((char *)&v150[1] + 1, "'");
    LOBYTE(v150[0]) = 39;
  }
  else
  {
    __sprintf_chk((char *)v150, 0, 0x14uLL, "%d", v131);
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v150);
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  v152[0] = v141;
  v94 = 1;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v152, &v151, 1);
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v132, "errorWithDomain:code:userInfo:", v133, v134, v142);
  v143 = (id)objc_claimAutoreleasedReturnValue();

  v144 = v143;
  v17 = v144;
  if (v144)
  {
    if (a4)
      *a4 = objc_retainAutorelease(v144);
    _MPCLogCategoryPlayback();
    v110 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v110, OS_LOG_TYPE_ERROR))
      goto LABEL_251;
    v145 = *a4;
    v150[0] = 138543618;
    *(_QWORD *)&v150[1] = self;
    LOWORD(v150[3]) = 2114;
    *(_QWORD *)((char *)&v150[3] + 2) = v145;
    v112 = "[AP] - %{public}@ - Error setting TuningMode to 0: %{public}@";
    goto LABEL_250;
  }
LABEL_166:

  return v94;
}

- (BOOL)_initializeAudioUnit:(id *)a3
{
  OSStatus v5;
  OSStatus v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  void *v11;
  BOOL v12;
  unsigned int v13;
  unsigned int v14;
  unsigned int v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  NSObject *v20;
  id v21;
  uint8_t buf[24];
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x24BDAC8D0];
  v5 = AudioUnitInitialize(self->_processingAU);
  if (!v5)
  {
    v11 = 0;
    v12 = 1;
    goto LABEL_26;
  }
  v6 = v5;
  v7 = (void *)MEMORY[0x24BDD1540];
  v8 = *MEMORY[0x24BDD1100];
  v9 = v5;
  v24 = *MEMORY[0x24BDD0FC8];
  memset(buf, 0, 20);
  v10 = bswap32(v5);
  *(_DWORD *)&buf[1] = v10;
  if ((v10 & 0x80) != 0)
  {
    if (!__maskrune((char)v10, 0x40000uLL))
      goto LABEL_19;
  }
  else if ((*(_DWORD *)(MEMORY[0x24BDAC740] + 4 * (char)v10 + 60) & 0x40000) == 0)
  {
    goto LABEL_19;
  }
  v13 = (__int16)v10 >> 8;
  if ((v10 & 0x8000) != 0)
  {
    if (!__maskrune(v13, 0x40000uLL))
      goto LABEL_19;
  }
  else if ((*(_DWORD *)(MEMORY[0x24BDAC740] + 4 * v13 + 60) & 0x40000) == 0)
  {
    goto LABEL_19;
  }
  v14 = v10 << 8 >> 24;
  if ((v10 & 0x800000) != 0)
  {
    if (!__maskrune(v14, 0x40000uLL))
      goto LABEL_19;
  }
  else if ((*(_DWORD *)(MEMORY[0x24BDAC740] + 4 * v14 + 60) & 0x40000) == 0)
  {
    goto LABEL_19;
  }
  v15 = v10 >> 24;
  if (v10 < 0)
  {
    if (__maskrune(v15, 0x40000uLL))
      goto LABEL_17;
  }
  else if ((*(_DWORD *)(MEMORY[0x24BDAC740] + 4 * v15 + 60) & 0x40000) != 0)
  {
LABEL_17:
    strcpy((char *)&buf[5], "'");
    buf[0] = 39;
    goto LABEL_20;
  }
LABEL_19:
  __sprintf_chk((char *)buf, 0, 0x14uLL, "%d", v6);
LABEL_20:
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", buf);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v16;
  v12 = 1;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "errorWithDomain:code:userInfo:", v8, v9, v17);
  v18 = (id)objc_claimAutoreleasedReturnValue();

  v19 = v18;
  v11 = v19;
  if (v19)
  {
    if (a3)
      *a3 = objc_retainAutorelease(v19);
    v20 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v21 = *a3;
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v21;
      _os_log_impl(&dword_210BD8000, v20, OS_LOG_TYPE_ERROR, "[AP] - %{public}@ - Error initializing audio unit: %{public}@", buf, 0x16u);
    }

    v12 = 0;
  }
LABEL_26:

  return v12;
}

- (void)_applyAttenuationLevelToAudioUnit
{
  OSStatus v3;
  OSStatus v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  id v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  const char *v18;
  NSObject *v19;
  os_log_type_t v20;
  double level;
  uint8_t buf[32];
  _QWORD v23[2];

  v23[1] = *MEMORY[0x24BDAC8D0];
  if (-[MPCVocalAttenuationProcessorImplementation isAvailable](self, "isAvailable"))
  {
    v3 = AudioUnitSetParameter(self->_processingAU, 0, 0, 0, self->_level, 0);
    if (!v3)
    {
      v9 = 0;
      goto LABEL_22;
    }
    v4 = v3;
    v5 = (void *)MEMORY[0x24BDD1540];
    v6 = *MEMORY[0x24BDD1100];
    v7 = v3;
    v23[0] = *MEMORY[0x24BDD0FC8];
    memset(buf, 0, 20);
    v8 = bswap32(v3);
    *(_DWORD *)&buf[1] = v8;
    if ((v8 & 0x80) != 0)
    {
      if (!__maskrune((char)v8, 0x40000uLL))
        goto LABEL_20;
    }
    else if ((*(_DWORD *)(MEMORY[0x24BDAC740] + 4 * (char)v8 + 60) & 0x40000) == 0)
    {
      goto LABEL_20;
    }
    v10 = (__int16)v8 >> 8;
    if ((v8 & 0x8000) != 0)
    {
      if (!__maskrune(v10, 0x40000uLL))
        goto LABEL_20;
    }
    else if ((*(_DWORD *)(MEMORY[0x24BDAC740] + 4 * v10 + 60) & 0x40000) == 0)
    {
      goto LABEL_20;
    }
    v11 = v8 << 8 >> 24;
    if ((v8 & 0x800000) != 0)
    {
      if (!__maskrune(v11, 0x40000uLL))
        goto LABEL_20;
    }
    else if ((*(_DWORD *)(MEMORY[0x24BDAC740] + 4 * v11 + 60) & 0x40000) == 0)
    {
      goto LABEL_20;
    }
    v12 = v8 >> 24;
    if (v8 < 0)
    {
      if (__maskrune(v12, 0x40000uLL))
        goto LABEL_18;
    }
    else if ((*(_DWORD *)(MEMORY[0x24BDAC740] + 4 * v12 + 60) & 0x40000) != 0)
    {
LABEL_18:
      strcpy((char *)&buf[5], "'");
      buf[0] = 39;
LABEL_21:
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", buf);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)buf = v13;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", buf, v23, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "errorWithDomain:code:userInfo:", v6, v7, v14);
      v9 = (id)objc_claimAutoreleasedReturnValue();

LABEL_22:
      v15 = v9;
      v16 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      v17 = v16;
      if (v15)
      {
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)&buf[4] = self;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v15;
          v18 = "[AP] - %{public}@ - Error setting audio attenuation level: %{public}@";
          v19 = v17;
          v20 = OS_LOG_TYPE_ERROR;
LABEL_27:
          _os_log_impl(&dword_210BD8000, v19, v20, v18, buf, 0x16u);
        }
      }
      else if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        level = self->_level;
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = self;
        *(_WORD *)&buf[12] = 2048;
        *(double *)&buf[14] = level;
        v18 = "[AP] - %{public}@ - New attenuation level: %f";
        v19 = v17;
        v20 = OS_LOG_TYPE_DEFAULT;
        goto LABEL_27;
      }

      return;
    }
LABEL_20:
    __sprintf_chk((char *)buf, 0, 0x14uLL, "%d", v4);
    goto LABEL_21;
  }
}

- (MPCVocalAttenuationModel)model
{
  return self->_model;
}

- (float)level
{
  return self->_level;
}

- (float)minLevel
{
  return self->_minLevel;
}

- (float)maxLevel
{
  return self->_maxLevel;
}

void __69__MPCVocalAttenuationProcessorImplementation_tearDownWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];
  id v4;

  AudioUnitUninitialize(*(AudioUnit *)(*(_QWORD *)(a1 + 32) + 144));
  AudioComponentInstanceDispose(*(AudioComponentInstance *)(*(_QWORD *)(a1 + 32) + 144));
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __69__MPCVocalAttenuationProcessorImplementation_tearDownWithCompletion___block_invoke_2;
  v3[3] = &unk_24CAB9830;
  v2 = *(void **)(a1 + 40);
  v3[4] = *(_QWORD *)(a1 + 32);
  v4 = v2;
  dispatch_async(MEMORY[0x24BDAC9B8], v3);

}

uint64_t __69__MPCVocalAttenuationProcessorImplementation_tearDownWithCompletion___block_invoke_2(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 176) = 0;
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 176), 0);
}

void __74__MPCVocalAttenuationProcessorImplementation_prepareWithModel_completion___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  _QWORD v3[5];
  id v4;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __74__MPCVocalAttenuationProcessorImplementation_prepareWithModel_completion___block_invoke_2;
  v3[3] = &unk_24CAB5C50;
  v3[4] = v1;
  v4 = *(id *)(a1 + 48);
  objc_msgSend(v1, "_prepareWithModel:completion:", v2, v3);

}

void __74__MPCVocalAttenuationProcessorImplementation_prepareWithModel_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;
  uint64_t v11;

  v5 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __74__MPCVocalAttenuationProcessorImplementation_prepareWithModel_completion___block_invoke_3;
  v8[3] = &unk_24CAB5C28;
  v6 = *(void **)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v11 = a2;
  v9 = v5;
  v10 = v6;
  v7 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], v8);

}

uint64_t __74__MPCVocalAttenuationProcessorImplementation_prepareWithModel_completion___block_invoke_3(_QWORD *a1)
{
  *(_QWORD *)(a1[4] + 176) = a1[7];
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], *(_QWORD *)(a1[4] + 176), a1[5]);
}

@end
