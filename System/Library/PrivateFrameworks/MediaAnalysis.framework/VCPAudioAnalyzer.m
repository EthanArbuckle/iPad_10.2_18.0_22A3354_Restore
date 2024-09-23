@implementation VCPAudioAnalyzer

- (VCPAudioAnalyzer)initWithAnalysisTypes:(unint64_t)a3 forStreaming:(BOOL)a4
{
  _BOOL4 v4;
  VCPAudioAnalyzer *v6;
  uint64_t v7;
  VCPVoiceDetector *voiceDetector;
  void *v9;
  VCPAudioClassifier *v10;
  VCPAudioClassifier *audioClassifier;
  VCPLoudnessAnalyzer *v12;
  VCPLoudnessAnalyzer *loudnessAnalyzer;
  VCPSongDetector *v14;
  VCPSongDetector *songDetector;
  VCPAudioAnalyzer *v16;
  objc_super v18;

  v4 = a4;
  v18.receiver = self;
  v18.super_class = (Class)VCPAudioAnalyzer;
  v6 = -[VCPAudioAnalyzer init](&v18, sel_init);
  if (!v6)
  {
    v9 = 0;
    goto LABEL_14;
  }
  if ((a3 & 0x10) != 0 && v4)
  {
    +[VCPVoiceDetector detector](VCPVoiceDetector, "detector");
    v7 = objc_claimAutoreleasedReturnValue();
    voiceDetector = v6->_voiceDetector;
    v6->_voiceDetector = (VCPVoiceDetector *)v7;

    v9 = v6->_voiceDetector;
    if (!v9)
      goto LABEL_14;
  }
  else if ((a3 & 0x820400200010) != 0)
  {
    v10 = -[VCPAudioClassifier initWithTypes:]([VCPAudioClassifier alloc], "initWithTypes:", a3);
    audioClassifier = v6->_audioClassifier;
    v6->_audioClassifier = v10;

    v9 = v6->_audioClassifier;
    if (!v9)
      goto LABEL_14;
  }
  if ((a3 & 0x800000) == 0
    || (v12 = objc_alloc_init(VCPLoudnessAnalyzer),
        loudnessAnalyzer = v6->_loudnessAnalyzer,
        v6->_loudnessAnalyzer = v12,
        loudnessAnalyzer,
        (v9 = v6->_loudnessAnalyzer) != 0))
  {
    if ((a3 & 0x8000000) == 0
      || (v14 = objc_alloc_init(VCPSongDetector),
          songDetector = v6->_songDetector,
          v6->_songDetector = v14,
          songDetector,
          (v9 = v6->_songDetector) != 0))
    {
      v6->_inputBuffer = 0;
      v6->_bufferedSamples = 0;
      v6->_sampleBatchSize = 320;
      v6->_initialized = 0;
      v9 = v6;
    }
  }
LABEL_14:
  v16 = v9;

  return v16;
}

- (void)dealloc
{
  void *inputBuffer;
  objc_super v4;

  inputBuffer = self->_inputBuffer;
  if (inputBuffer)
    free(inputBuffer);
  v4.receiver = self;
  v4.super_class = (Class)VCPAudioAnalyzer;
  -[VCPAudioAnalyzer dealloc](&v4, sel_dealloc);
}

- (id)audioFormatRequirements
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v6[7];
  _QWORD v7[8];

  v7[7] = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0C89970];
  v6[0] = *MEMORY[0x1E0C898E0];
  v6[1] = v2;
  v7[0] = &unk_1E6B747C8;
  v7[1] = &unk_1E6B71F90;
  v3 = *MEMORY[0x1E0C898F0];
  v6[2] = *MEMORY[0x1E0C89930];
  v6[3] = v3;
  v7[2] = &unk_1E6B747E0;
  v7[3] = &unk_1E6B747F8;
  v4 = *MEMORY[0x1E0C89910];
  v6[4] = *MEMORY[0x1E0C89900];
  v6[5] = v4;
  v7[4] = MEMORY[0x1E0C9AAA0];
  v7[5] = MEMORY[0x1E0C9AAB0];
  v6[6] = *MEMORY[0x1E0C89928];
  v7[6] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 7);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)setupWithSample:(opaqueCMSampleBuffer *)a3 andTrackDuration:(id *)a4
{
  const opaqueCMFormatDescription *FormatDescription;
  VCPVoiceDetector *voiceDetector;
  int result;
  VCPAudioClassifier *audioClassifier;
  VCPLoudnessAnalyzer *loudnessAnalyzer;
  VCPSongDetector *songDetector;
  void *v13;
  UInt32 v14;
  __int128 v15;
  int64_t var3;

  FormatDescription = CMSampleBufferGetFormatDescription(a3);
  if (!CMAudioFormatDescriptionGetStreamBasicDescription(FormatDescription))
    return -50;
  voiceDetector = self->_voiceDetector;
  if (!voiceDetector
    || (result = -[VCPVoiceDetector setupWithSample:andSampleBatchSize:](voiceDetector, "setupWithSample:andSampleBatchSize:", a3, self->_sampleBatchSize)) == 0)
  {
    audioClassifier = self->_audioClassifier;
    if (!audioClassifier
      || (v15 = *(_OWORD *)&a4->var0,
          var3 = a4->var3,
          (result = -[VCPAudioClassifier setupWithSample:trackDuration:andSampleBatchSize:](audioClassifier, "setupWithSample:trackDuration:andSampleBatchSize:", a3, &v15, self->_sampleBatchSize)) == 0))
    {
      loudnessAnalyzer = self->_loudnessAnalyzer;
      if (!loudnessAnalyzer
        || (result = -[VCPLoudnessAnalyzer setupWithSample:andSampleBatchSize:](loudnessAnalyzer, "setupWithSample:andSampleBatchSize:", a3, self->_sampleBatchSize)) == 0)
      {
        songDetector = self->_songDetector;
        if (!songDetector
          || (result = -[VCPSongDetector setupWithSample:andSampleBatchSize:](songDetector, "setupWithSample:andSampleBatchSize:", a3, self->_sampleBatchSize)) == 0)
        {
          if (self->_inputBuffer)
          {
LABEL_13:
            result = 0;
            self->_audioTimestamp.mSampleTime = 0.0;
            self->_audioTimestamp.mFlags = 1;
            return result;
          }
          v13 = malloc_type_malloc(4 * self->_sampleBatchSize + 4095, 0x37FF7721uLL);
          self->_inputBuffer = v13;
          if (v13)
          {
            self->_audioBufferList.mBuffers[0].mData = (void *)(((unint64_t)v13 + 4095) & 0xFFFFFFFFFFFFF000);
            self->_audioBufferList.mNumberBuffers = 1;
            v14 = 4 * self->_sampleBatchSize;
            self->_audioBufferList.mBuffers[0].mNumberChannels = 1;
            self->_audioBufferList.mBuffers[0].mDataByteSize = v14;
            goto LABEL_13;
          }
          return -108;
        }
      }
    }
  }
  return result;
}

- (int)processAudioSamples:(AudioBufferList *)a3 timestamp:(AudioTimeStamp *)a4
{
  VCPVoiceDetector *voiceDetector;
  __int128 v8;
  __int128 v9;
  int result;
  VCPAudioClassifier *audioClassifier;
  __int128 v12;
  __int128 v13;
  VCPLoudnessAnalyzer *loudnessAnalyzer;
  __int128 v15;
  __int128 v16;
  VCPSongDetector *songDetector;
  __int128 v18;
  __int128 v19;
  _OWORD v20[4];
  _OWORD v21[4];
  _OWORD v22[4];
  _OWORD v23[4];

  voiceDetector = self->_voiceDetector;
  if (!voiceDetector
    || (v8 = *(_OWORD *)&a4->mRateScalar,
        v23[0] = *(_OWORD *)&a4->mSampleTime,
        v23[1] = v8,
        v9 = *(_OWORD *)&a4->mSMPTETime.mHours,
        v23[2] = *(_OWORD *)&a4->mSMPTETime.mSubframes,
        v23[3] = v9,
        (result = -[VCPVoiceDetector processAudioSamples:timestamp:](voiceDetector, "processAudioSamples:timestamp:", a3, v23)) == 0))
  {
    audioClassifier = self->_audioClassifier;
    if (!audioClassifier
      || (v12 = *(_OWORD *)&a4->mRateScalar,
          v22[0] = *(_OWORD *)&a4->mSampleTime,
          v22[1] = v12,
          v13 = *(_OWORD *)&a4->mSMPTETime.mHours,
          v22[2] = *(_OWORD *)&a4->mSMPTETime.mSubframes,
          v22[3] = v13,
          (result = -[VCPAudioClassifier processAudioSamples:timestamp:](audioClassifier, "processAudioSamples:timestamp:", a3, v22)) == 0))
    {
      loudnessAnalyzer = self->_loudnessAnalyzer;
      if (!loudnessAnalyzer
        || (v15 = *(_OWORD *)&a4->mRateScalar,
            v21[0] = *(_OWORD *)&a4->mSampleTime,
            v21[1] = v15,
            v16 = *(_OWORD *)&a4->mSMPTETime.mHours,
            v21[2] = *(_OWORD *)&a4->mSMPTETime.mSubframes,
            v21[3] = v16,
            (result = -[VCPLoudnessAnalyzer processAudioSamples:timestamp:](loudnessAnalyzer, "processAudioSamples:timestamp:", a3, v21)) == 0))
      {
        songDetector = self->_songDetector;
        if (!songDetector)
          return 0;
        v18 = *(_OWORD *)&a4->mRateScalar;
        v20[0] = *(_OWORD *)&a4->mSampleTime;
        v20[1] = v18;
        v19 = *(_OWORD *)&a4->mSMPTETime.mHours;
        v20[2] = *(_OWORD *)&a4->mSMPTETime.mSubframes;
        v20[3] = v19;
        result = -[VCPSongDetector processAudioSamples:timestamp:](songDetector, "processAudioSamples:timestamp:", a3, v20);
        if (!result)
          return 0;
      }
    }
  }
  return result;
}

- (int)finalizeAnalysisAtTime:(id *)a3
{
  VCPVoiceDetector *voiceDetector;
  int result;
  VCPAudioClassifier *audioClassifier;
  VCPLoudnessAnalyzer *loudnessAnalyzer;
  VCPSongDetector *songDetector;

  voiceDetector = self->_voiceDetector;
  if (!voiceDetector
    || (result = -[VCPVoiceDetector finalizeAnalysisAtTime:](voiceDetector, "finalizeAnalysisAtTime:", a3)) == 0)
  {
    audioClassifier = self->_audioClassifier;
    if (!audioClassifier
      || (result = -[VCPAudioClassifier finalizeAnalysisAtTime:](audioClassifier, "finalizeAnalysisAtTime:", a3)) == 0)
    {
      loudnessAnalyzer = self->_loudnessAnalyzer;
      if (!loudnessAnalyzer
        || (result = -[VCPLoudnessAnalyzer finalizeAnalysisAtTime:](loudnessAnalyzer, "finalizeAnalysisAtTime:", a3)) == 0)
      {
        songDetector = self->_songDetector;
        if (!songDetector)
          return 0;
        result = -[VCPSongDetector finalizeAnalysisAtTime:](songDetector, "finalizeAnalysisAtTime:", a3);
        if (!result)
          return 0;
      }
    }
  }
  return result;
}

- (int)processSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  const opaqueCMFormatDescription *FormatDescription;
  CMItemCount NumSamples;
  OpaqueCMBlockBuffer *DataBuffer;
  char *mData;
  int result;
  int sampleBatchSize;
  int bufferedSamples;
  char *v12;
  int v13;
  int v14;
  __int128 v15;
  __int128 v16;
  _OWORD v17[4];
  char *dataPointerOut;

  FormatDescription = CMSampleBufferGetFormatDescription(a3);
  if (!CMAudioFormatDescriptionGetStreamBasicDescription(FormatDescription))
    return -50;
  NumSamples = CMSampleBufferGetNumSamples(a3);
  DataBuffer = CMSampleBufferGetDataBuffer(a3);
  dataPointerOut = 0;
  mData = (char *)self->_audioBufferList.mBuffers[0].mData;
  result = CMBlockBufferGetDataPointer(DataBuffer, 0, 0, 0, &dataPointerOut);
  if (!result)
  {
    if (NumSamples)
    {
      sampleBatchSize = self->_sampleBatchSize;
      bufferedSamples = self->_bufferedSamples;
      v12 = dataPointerOut;
      do
      {
        v13 = sampleBatchSize - bufferedSamples;
        if (NumSamples >= v13)
          v14 = v13;
        else
          v14 = NumSamples;
        memcpy(&mData[4 * bufferedSamples], v12, 4 * v14);
        bufferedSamples = self->_bufferedSamples + v14;
        self->_bufferedSamples = bufferedSamples;
        sampleBatchSize = self->_sampleBatchSize;
        if (bufferedSamples == sampleBatchSize)
        {
          v15 = *(_OWORD *)&self->_audioTimestamp.mRateScalar;
          v17[0] = *(_OWORD *)&self->_audioTimestamp.mSampleTime;
          v17[1] = v15;
          v16 = *(_OWORD *)&self->_audioTimestamp.mSMPTETime.mHours;
          v17[2] = *(_OWORD *)&self->_audioTimestamp.mSMPTETime.mSubframes;
          v17[3] = v16;
          result = -[VCPAudioAnalyzer processAudioSamples:timestamp:](self, "processAudioSamples:timestamp:", &self->_audioBufferList, v17);
          if (result)
            return result;
          bufferedSamples = 0;
          sampleBatchSize = self->_sampleBatchSize;
          self->_audioTimestamp.mSampleTime = self->_audioTimestamp.mSampleTime + (double)sampleBatchSize;
          self->_bufferedSamples = 0;
          v12 = dataPointerOut;
        }
        v12 += 4 * v14;
        dataPointerOut = v12;
        NumSamples -= v14;
      }
      while (NumSamples);
    }
    return 0;
  }
  return result;
}

- (int)analyzeAsset:(id)a3 cancel:(id)a4 results:(id *)a5
{
  id v7;
  uint64_t (**v8)(_QWORD);
  void *v9;
  uint64_t v10;
  __int128 v11;
  int v12;
  uint64_t v13;
  void *v14;
  int v15;
  CMTimeValue value;
  CMTimeScale timescale;
  Float64 Seconds;
  CMTimeValue v19;
  CMTimeScale v20;
  Float64 v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  const void *v26;
  uint64_t bufferedSamples;
  __int128 v28;
  __int128 v29;
  VCPVoiceDetector *voiceDetector;
  void *v31;
  VCPAudioClassifier *audioClassifier;
  void *v33;
  VCPLoudnessAnalyzer *loudnessAnalyzer;
  void *v35;
  VCPSongDetector *songDetector;
  void *v37;
  int v38;
  void *v39;
  __int128 v41;
  uint64_t v42;
  void *v44;
  uint64_t i;
  void *v46;
  void *v47;
  _OWORD v48[4];
  CMTime duration;
  CMTime v50;
  CMTime time;
  CMTimeRange range;
  CMTime v53;
  CMTimeRange v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE buf[50];
  __int16 v60;
  Float64 v61;
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (uint64_t (**)(_QWORD))a4;
  v46 = v7;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  objc_msgSend(v7, "vcp_enabledTracksWithMediaType:", *MEMORY[0x1E0C8A7A0]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = v9;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v55, v62, 16);
  if (!v10)
  {
    v12 = 0;
    goto LABEL_41;
  }
  v42 = v10;
  v12 = 0;
  v13 = *(_QWORD *)v56;
  *(_QWORD *)&v11 = 67110656;
  v41 = v11;
  while (2)
  {
    for (i = 0; i != v42; ++i)
    {
      if (*(_QWORD *)v56 != v13)
        objc_enumerationMutation(v9);
      v14 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * i);
      memset(&v54, 0, sizeof(v54));
      if (v14)
        objc_msgSend(v14, "timeRange");
      memset(&v53, 0, sizeof(v53));
      range = v54;
      CMTimeRangeGetEnd(&v53, &range);
      if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        v15 = objc_msgSend(v14, "trackID");
        value = v54.start.value;
        timescale = v54.start.timescale;
        time = v54.start;
        Seconds = CMTimeGetSeconds(&time);
        v19 = v53.value;
        v20 = v53.timescale;
        v50 = v53;
        v21 = CMTimeGetSeconds(&v50);
        *(_DWORD *)buf = v41;
        *(_DWORD *)&buf[4] = v15;
        *(_WORD *)&buf[8] = 2048;
        *(_QWORD *)&buf[10] = value;
        *(_WORD *)&buf[18] = 1024;
        *(_DWORD *)&buf[20] = timescale;
        *(_WORD *)&buf[24] = 2048;
        *(Float64 *)&buf[26] = Seconds;
        *(_WORD *)&buf[34] = 2048;
        *(_QWORD *)&buf[36] = v19;
        *(_WORD *)&buf[44] = 1024;
        *(_DWORD *)&buf[46] = v20;
        v60 = 2048;
        v61 = v21;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "    Analyzing Audio Track - ID: %d Start: %lld/%d (%0.3fs) End: %lld/%d (%0.3fs)", buf, 0x3Cu);
      }
      v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C8AFD0]), "initWithAsset:error:", v46, 0);
      v23 = (void *)MEMORY[0x1E0C8B000];
      -[VCPAudioAnalyzer audioFormatRequirements](self, "audioFormatRequirements");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "assetReaderTrackOutputWithTrack:outputSettings:", v14, v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v22, "addOutput:", v25);
      if ((objc_msgSend(v22, "startReading") & 1) == 0)
      {
LABEL_47:
        v26 = 0;
LABEL_48:
        v12 = -19;
LABEL_36:
        v38 = 1;
        goto LABEL_37;
      }
      v26 = (const void *)objc_msgSend(v25, "copyNextSampleBuffer");
      if (!v26)
        goto LABEL_48;
      duration = v54.duration;
      LODWORD(v24) = -[VCPAudioAnalyzer setupWithSample:andTrackDuration:](self, "setupWithSample:andTrackDuration:", v26, &duration);
      if ((_DWORD)v24)
        goto LABEL_50;
      do
      {
        if ((v8[2](v8) & 1) != 0)
        {
          v12 = -128;
          goto LABEL_36;
        }
        v24 = (void *)MEMORY[0x1BCCA1B2C]();
        -[VCPAudioAnalyzer processSampleBuffer:](self, "processSampleBuffer:", v26);
        objc_autoreleasePoolPop(v24);
        CFRelease(v26);
        v26 = (const void *)objc_msgSend(v25, "copyNextSampleBuffer");
      }
      while (v26);
      if (objc_msgSend(v22, "status") != 2)
        goto LABEL_47;
      bufferedSamples = self->_bufferedSamples;
      if ((_DWORD)bufferedSamples)
      {
        bzero((char *)self->_audioBufferList.mBuffers[0].mData + 4 * bufferedSamples, 4 * (self->_sampleBatchSize - (int)bufferedSamples));
        v28 = *(_OWORD *)&self->_audioTimestamp.mRateScalar;
        v48[0] = *(_OWORD *)&self->_audioTimestamp.mSampleTime;
        v48[1] = v28;
        v29 = *(_OWORD *)&self->_audioTimestamp.mSMPTETime.mHours;
        v48[2] = *(_OWORD *)&self->_audioTimestamp.mSMPTETime.mSubframes;
        v48[3] = v29;
        LODWORD(v24) = -[VCPAudioAnalyzer processAudioSamples:timestamp:](self, "processAudioSamples:timestamp:", &self->_audioBufferList, v48);
        if (!(_DWORD)v24)
        {
          self->_bufferedSamples = 0;
          goto LABEL_20;
        }
        v26 = 0;
        v38 = 0;
LABEL_37:

        if (!v38)
          goto LABEL_46;
        if (!v26)
          goto LABEL_42;
        goto LABEL_39;
      }
LABEL_20:
      if (v14)
        objc_msgSend(v14, "timeRange");
      else
        memset(buf, 0, 48);
      LODWORD(v24) = -[VCPAudioAnalyzer finalizeAnalysisAtTime:](self, "finalizeAnalysisAtTime:", &buf[24], v41);
      if ((_DWORD)v24)
      {
        v26 = 0;
LABEL_50:

        v12 = (int)v24;
        if (!v26)
          goto LABEL_42;
LABEL_39:
        CFRelease(v26);
        goto LABEL_42;
      }
      voiceDetector = self->_voiceDetector;
      if (voiceDetector)
      {
        -[VCPVoiceDetector results](voiceDetector, "results");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "addEntriesFromDictionary:", v31);

      }
      audioClassifier = self->_audioClassifier;
      if (audioClassifier)
      {
        -[VCPAudioClassifier results](audioClassifier, "results");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "addEntriesFromDictionary:", v33);

      }
      loudnessAnalyzer = self->_loudnessAnalyzer;
      if (loudnessAnalyzer)
      {
        -[VCPLoudnessAnalyzer results](loudnessAnalyzer, "results");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "addEntriesFromDictionary:", v35);

      }
      songDetector = self->_songDetector;
      if (songDetector)
      {
        -[VCPSongDetector results](songDetector, "results");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "addEntriesFromDictionary:", v37);

      }
      v9 = v44;
    }
    v42 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v55, v62, 16);
    if (v42)
      continue;
    break;
  }
LABEL_41:

LABEL_42:
  if (v12)
    v39 = 0;
  else
    v39 = v47;
  *a5 = objc_retainAutorelease(v39);
  LODWORD(v24) = v12;
LABEL_46:

  return (int)v24;
}

- (int)analyzeSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  int result;
  uint64_t bufferedSamples;
  __int128 v7;
  __int128 v8;
  _OWORD v9[4];
  __int128 v10;
  uint64_t v11;

  if (!self->_initialized)
  {
    v10 = *MEMORY[0x1E0CA2E18];
    v11 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
    result = -[VCPAudioAnalyzer setupWithSample:andTrackDuration:](self, "setupWithSample:andTrackDuration:", a3, &v10);
    if (result)
      return result;
    self->_initialized = 1;
  }
  result = -[VCPAudioAnalyzer processSampleBuffer:](self, "processSampleBuffer:", a3);
  if (!result)
  {
    bufferedSamples = self->_bufferedSamples;
    if ((_DWORD)bufferedSamples)
    {
      bzero((char *)self->_audioBufferList.mBuffers[0].mData + 4 * bufferedSamples, 4 * (self->_sampleBatchSize - (int)bufferedSamples));
      v7 = *(_OWORD *)&self->_audioTimestamp.mRateScalar;
      v9[0] = *(_OWORD *)&self->_audioTimestamp.mSampleTime;
      v9[1] = v7;
      v8 = *(_OWORD *)&self->_audioTimestamp.mSMPTETime.mHours;
      v9[2] = *(_OWORD *)&self->_audioTimestamp.mSMPTETime.mSubframes;
      v9[3] = v8;
      result = -[VCPAudioAnalyzer processAudioSamples:timestamp:](self, "processAudioSamples:timestamp:", &self->_audioBufferList, v9);
      if (!result)
        self->_bufferedSamples = 0;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (id)voiceDetections
{
  void *voiceDetector;

  voiceDetector = self->_voiceDetector;
  if (voiceDetector)
  {
    objc_msgSend(voiceDetector, "voiceDetections");
    voiceDetector = (void *)objc_claimAutoreleasedReturnValue();
  }
  return voiceDetector;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_songDetector, 0);
  objc_storeStrong((id *)&self->_loudnessAnalyzer, 0);
  objc_storeStrong((id *)&self->_audioClassifier, 0);
  objc_storeStrong((id *)&self->_voiceDetector, 0);
}

@end
