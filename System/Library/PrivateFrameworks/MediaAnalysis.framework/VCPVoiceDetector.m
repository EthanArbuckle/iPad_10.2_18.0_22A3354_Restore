@implementation VCPVoiceDetector

+ (id)detector
{
  return objc_alloc_init(VCPVoiceDetectorV2);
}

- (VCPVoiceDetector)init
{
  char *v2;
  VCPVoiceDetector *v3;
  uint64_t v4;
  void *epoch;
  uint64_t v6;
  NSMutableArray *voiceDetections;
  uint64_t v8;
  NSMutableArray *utteranceDetections;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)VCPVoiceDetector;
  v2 = -[VCPVoiceDetector init](&v11, sel_init);
  v3 = (VCPVoiceDetector *)v2;
  if (v2)
  {
    *(_OWORD *)(v2 + 40) = xmmword_1B6FBCA00;
    *(_OWORD *)(v2 + 24) = xmmword_1B6FBCA10;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = objc_claimAutoreleasedReturnValue();
    epoch = (void *)v3->_voiceStart.epoch;
    v3->_voiceStart.epoch = v4;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = objc_claimAutoreleasedReturnValue();
    voiceDetections = v3->_voiceDetections;
    v3->_voiceDetections = (NSMutableArray *)v6;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = objc_claimAutoreleasedReturnValue();
    utteranceDetections = v3->_utteranceDetections;
    v3->_utteranceDetections = (NSMutableArray *)v8;

    v3->_sampleBatchSize = 320;
  }
  return v3;
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
  v7[0] = &unk_1E6B725F0;
  v7[1] = &unk_1E6B71E50;
  v3 = *MEMORY[0x1E0C898F0];
  v6[2] = *MEMORY[0x1E0C89930];
  v6[3] = v3;
  v7[2] = &unk_1E6B72608;
  v7[3] = &unk_1E6B72620;
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

- (void)addDetectionFromTime:(id *)a3 toTime:(id *)a4 result:(id)a5
{
  id v8;
  CFDictionaryRef v9;
  void *v10;
  void *v11;
  void *v12;
  CMTimeRange v13;
  CMTime end;
  CMTime start;
  CMTimeRange v16;
  CMTime rhs;
  CMTime lhs;
  _QWORD v19[2];
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v8 = a5;
  if (v8)
  {
    memset(&v16, 0, sizeof(v16));
    lhs = *(CMTime *)(&self->_sampleBatchSize + 1);
    rhs = (CMTime)*a3;
    CMTimeAdd(&start, &lhs, &rhs);
    lhs = *(CMTime *)(&self->_sampleBatchSize + 1);
    rhs = (CMTime)*a4;
    CMTimeAdd(&end, &lhs, &rhs);
    CMTimeRangeFromTimeToTime(&v16, &start, &end);
    if ((v16.start.flags & 1) != 0
      && (v16.duration.flags & 1) != 0
      && !v16.duration.epoch
      && (v16.duration.value & 0x8000000000000000) == 0)
    {
      v13 = v16;
      v9 = CMTimeRangeCopyAsDictionary(&v13, 0);
      v19[0] = CFSTR("start");
      -[__CFDictionary objectForKey:](v9, "objectForKey:");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = v10;
      v19[1] = CFSTR("duration");
      -[__CFDictionary objectForKey:](v9, "objectForKey:");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v20[1] = v11;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v12);

    }
  }

}

- (int)setupWithSample:(opaqueCMSampleBuffer *)a3 andSampleBatchSize:(int)a4
{
  int result;
  const opaqueCMFormatDescription *FormatDescription;
  const AudioStreamBasicDescription *StreamBasicDescription;
  Float64 *p_mSampleRate;
  CMTime v10;

  self->_sampleBatchSize = a4;
  result = -[VCPVoiceDetector loadModel](self, "loadModel");
  if (!result)
  {
    FormatDescription = CMSampleBufferGetFormatDescription(a3);
    StreamBasicDescription = CMAudioFormatDescriptionGetStreamBasicDescription(FormatDescription);
    if (StreamBasicDescription)
    {
      p_mSampleRate = &StreamBasicDescription->mSampleRate;
      CMSampleBufferGetPresentationTimeStamp(&v10, a3);
      *(CMTime *)(&self->_sampleBatchSize + 1) = v10;
      self->_audioStream.mSampleRate = *p_mSampleRate;
      result = -[VCPVoiceDetector setupWithAudioStream:](self, "setupWithAudioStream:", p_mSampleRate);
      if (!result)
        BYTE4(self->_trackStart.epoch) = 0;
    }
    else
    {
      return -50;
    }
  }
  return result;
}

- (int)loadModel
{
  return -4;
}

- (int)setupWithAudioStream:(const AudioStreamBasicDescription *)a3
{
  return -4;
}

- (int)processAudioSamples:(AudioBufferList *)a3 timestamp:(AudioTimeStamp *)a4
{
  return -4;
}

- (int)finalizeAnalysisAtTime:(id *)a3
{
  return -4;
}

- (id)results
{
  return 0;
}

- (NSMutableArray)voiceDetections
{
  return (NSMutableArray *)objc_getProperty(self, a2, 112, 1);
}

- (void)setVoiceDetections:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_utteranceDetections, 0);
  objc_storeStrong((id *)&self->_voiceDetections, 0);
  objc_storeStrong((id *)&self->_voiceStart.epoch, 0);
  objc_storeStrong((id *)&self->_model, 0);
}

@end
