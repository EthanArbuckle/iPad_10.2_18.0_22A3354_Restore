@implementation VCPVideoTrackSubsamplingDecoder

- (VCPVideoTrackSubsamplingDecoder)initWithTrack:(id)a3 timerange:(id *)a4 atInterval:(id *)a5
{
  id v8;
  VCPVideoTrackSubsamplingDecoder *v9;
  VCPVideoTrackSubsamplingDecoder *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  AVAssetReader *assetReader;
  void *v15;
  void *v16;
  AVAssetTrack *track;
  void *v18;
  uint64_t v19;
  AVAssetReaderTrackOutput *trackOutput;
  AVAssetReaderTrackOutput *v21;
  AVAssetReader *v22;
  __int128 v23;
  int64_t var3;
  AVAssetReader *v25;
  VCPVideoTrackSubsamplingDecoder *v26;
  $95D729B680665BEAEFA1D6FCA8238556 *p_nextSampleTime;
  CMTimeEpoch epoch;
  opaqueCMSampleBuffer *nextSample;
  CMTimeEpoch v30;
  __int128 v31;
  Float64 Seconds;
  Float64 v33;
  __int128 v34;
  AVAssetReader *v35;
  int64_t v36;
  CMTimeRange v38;
  CMTime v39;
  CMTime time;
  CMTime v41;
  CMTime v42;
  _OWORD v43[3];
  objc_super v44;
  CMTime rhs;
  CMTime lhs;
  _BYTE time1[32];
  __int128 v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v44.receiver = self;
  v44.super_class = (Class)VCPVideoTrackSubsamplingDecoder;
  v9 = -[VCPVideoTrackDecoder initWithTrack:](&v44, sel_initWithTrack_, v8);
  v10 = v9;
  if (v9)
  {
    v11 = (void *)MEMORY[0x1E0C8AFD0];
    -[AVAssetTrack asset](v9->super._track, "asset");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "assetReaderWithAsset:error:", v12, 0);
    v13 = objc_claimAutoreleasedReturnValue();
    assetReader = v10->_assetReader;
    v10->_assetReader = (AVAssetReader *)v13;

    v15 = v10->_assetReader;
    if (v15)
    {
      v16 = (void *)MEMORY[0x1E0C8B000];
      track = v10->super._track;
      -[VCPVideoTrackDecoder settings](v10, "settings");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "assetReaderTrackOutputWithTrack:outputSettings:", track, v18);
      v19 = objc_claimAutoreleasedReturnValue();
      trackOutput = v10->_trackOutput;
      v10->_trackOutput = (AVAssetReaderTrackOutput *)v19;

      v21 = v10->_trackOutput;
      if (!v21)
        goto LABEL_8;
      -[AVAssetReaderTrackOutput setAppliesPreferredTrackTransform:](v21, "setAppliesPreferredTrackTransform:", 1);
      -[AVAssetReader addOutput:](v10->_assetReader, "addOutput:", v10->_trackOutput);
      v22 = v10->_assetReader;
      v23 = *(_OWORD *)&a4->var0.var3;
      v43[0] = *(_OWORD *)&a4->var0.var0;
      v43[1] = v23;
      v43[2] = *(_OWORD *)&a4->var1.var1;
      -[AVAssetReader setTimeRange:](v22, "setTimeRange:", v43);
      if (-[AVAssetReader startReading](v10->_assetReader, "startReading"))
      {
        var3 = a5->var3;
        *(_OWORD *)&v10->_sampleDuration.value = *(_OWORD *)&a5->var0;
        v10->_sampleDuration.epoch = var3;
        v10->_nextSample = (opaqueCMSampleBuffer *)-[AVAssetReaderTrackOutput copyNextSampleBuffer](v10->_trackOutput, "copyNextSampleBuffer");
        v25 = v10->_assetReader;
        if (v25)
        {
          -[AVAssetReader timeRange](v25, "timeRange");
        }
        else
        {
          v48 = 0u;
          memset(time1, 0, sizeof(time1));
        }
        CMTimeMake(&v41, 0, v10->_sampleDuration.timescale);
        lhs = *(CMTime *)time1;
        rhs = v41;
        CMTimeAdd(&v42, &lhs, &rhs);
        p_nextSampleTime = &v10->_nextSampleTime;
        epoch = v42.epoch;
        *(_OWORD *)&v10->_nextSampleTime.value = *(_OWORD *)&v42.value;
        v10->_nextSampleTime.epoch = epoch;
        nextSample = v10->_nextSample;
        if (nextSample)
        {
          memset(&rhs, 0, sizeof(rhs));
          CMSampleBufferGetPresentationTimeStamp(&rhs, nextSample);
          *(CMTime *)time1 = rhs;
          v30 = v10->_nextSampleTime.epoch;
          *(_OWORD *)&lhs.value = *(_OWORD *)&p_nextSampleTime->value;
          lhs.epoch = v30;
          if (CMTimeCompare((CMTime *)time1, &lhs) >= 1)
          {
            if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
            {
              v31 = *(_OWORD *)&p_nextSampleTime->value;
              time.epoch = v10->_nextSampleTime.epoch;
              *(_OWORD *)&time.value = v31;
              Seconds = CMTimeGetSeconds(&time);
              v39 = rhs;
              v33 = CMTimeGetSeconds(&v39);
              *(_DWORD *)time1 = 134218240;
              *(Float64 *)&time1[4] = Seconds;
              *(_WORD *)&time1[12] = 2048;
              *(Float64 *)&time1[14] = v33;
              _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Replace initial nextSampleTime %.4f with %.4f", time1, 0x16u);
            }
            v34 = *(_OWORD *)&rhs.value;
            v10->_nextSampleTime.epoch = rhs.epoch;
            *(_OWORD *)&p_nextSampleTime->value = v34;
          }
        }
        v35 = v10->_assetReader;
        if (v35)
          -[AVAssetReader timeRange](v35, "timeRange");
        else
          memset(&v38, 0, sizeof(v38));
        CMTimeRangeGetEnd((CMTime *)time1, &v38);
        v36 = *(_QWORD *)&time1[16];
        *(_OWORD *)&v10->_decodeEnd.value = *(_OWORD *)time1;
        v10->_decodeEnd.epoch = v36;
        v15 = v10;
      }
      else
      {
LABEL_8:
        v15 = 0;
      }
    }
    v26 = v15;
  }
  else
  {
    v26 = 0;
  }

  return v26;
}

- (void)dealloc
{
  AVAssetReader *assetReader;
  opaqueCMSampleBuffer *currentSample;
  opaqueCMSampleBuffer *nextSample;
  objc_super v6;

  assetReader = self->_assetReader;
  if (assetReader)
    -[AVAssetReader cancelReading](assetReader, "cancelReading");
  currentSample = self->_currentSample;
  if (currentSample)
    CFRelease(currentSample);
  nextSample = self->_nextSample;
  if (nextSample)
    CFRelease(nextSample);
  v6.receiver = self;
  v6.super_class = (Class)VCPVideoTrackSubsamplingDecoder;
  -[VCPVideoTrackSubsamplingDecoder dealloc](&v6, sel_dealloc);
}

- (int64_t)status
{
  $95D729B680665BEAEFA1D6FCA8238556 decodeEnd;
  CMTime time1;

  time1 = (CMTime)self->_nextSampleTime;
  decodeEnd = self->_decodeEnd;
  if (CMTimeCompare(&time1, (CMTime *)&decodeEnd) < 0)
    return -[AVAssetReader status](self->_assetReader, "status");
  else
    return 2;
}

- (opaqueCMSampleBuffer)copyNextSampleBuffer
{
  AVAssetReaderStatus v3;
  $95D729B680665BEAEFA1D6FCA8238556 *p_nextSampleTime;
  int32_t v5;
  opaqueCMSampleBuffer *result;
  opaqueCMSampleBuffer *nextSample;
  opaqueCMSampleBuffer *currentSample;
  CMTime *p_sampleDuration;
  int32_t v10;
  CMTime *p_lhs;
  __int128 v12;
  CMTimeValue value;
  CMTimeScale timescale;
  double Seconds;
  Float64 v16;
  opaqueCMSampleBuffer *v17;
  CMSampleBufferRef sampleBufferOut;
  CMTime v19;
  CMTime time;
  CMTime sampleDuration;
  CMTime rhs;
  CMTime lhs;
  CMTime time2;
  CMSampleTimingInfo time1;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = -[AVAssetReader status](self->_assetReader, "status");
  p_nextSampleTime = &self->_nextSampleTime;
  time1.duration = (CMTime)self->_nextSampleTime;
  time2 = (CMTime)self->_decodeEnd;
  v5 = CMTimeCompare(&time1.duration, &time2);
  result = 0;
  if (v5 < 0 && (unint64_t)(v3 - 3) >= 0xFFFFFFFFFFFFFFFELL)
  {
    nextSample = self->_nextSample;
    if (nextSample)
    {
      while (1)
      {
        memset(&lhs, 0, sizeof(lhs));
        CMSampleBufferGetPresentationTimeStamp(&lhs, nextSample);
        *(_OWORD *)&time1.duration.value = *(_OWORD *)&p_nextSampleTime->value;
        time1.duration.epoch = self->_nextSampleTime.epoch;
        time2 = lhs;
        if (CMTimeCompare(&time1.duration, &time2) < 0)
          break;
        currentSample = self->_currentSample;
        if (currentSample)
          CFRelease(currentSample);
        self->_currentSample = self->_nextSample;
        nextSample = (opaqueCMSampleBuffer *)-[AVAssetReaderTrackOutput copyNextSampleBuffer](self->_trackOutput, "copyNextSampleBuffer");
        self->_nextSample = nextSample;
        if (!nextSample)
        {
          if (-[AVAssetReader status](self->_assetReader, "status") == AVAssetReaderStatusFailed)
            return 0;
          nextSample = self->_nextSample;
          if (!nextSample)
            goto LABEL_10;
        }
      }
      v17 = self->_nextSample;
      p_sampleDuration = (CMTime *)&self->_sampleDuration;
      sampleDuration = (CMTime)self->_sampleDuration;
      if (v17)
      {
        memset(&lhs, 0, sizeof(lhs));
        CMSampleBufferGetPresentationTimeStamp(&lhs, v17);
        while (1)
        {
          *(_OWORD *)&time1.duration.value = *(_OWORD *)&p_nextSampleTime->value;
          time1.duration.epoch = self->_nextSampleTime.epoch;
          time2 = sampleDuration;
          CMTimeAdd(&rhs, &time1.duration, &time2);
          time1.duration = rhs;
          time2 = lhs;
          if ((CMTimeCompare(&time1.duration, &time2) & 0x80000000) == 0)
            break;
          time1.duration = sampleDuration;
          *(_OWORD *)&time2.value = *(_OWORD *)&p_sampleDuration->value;
          time2.epoch = self->_sampleDuration.epoch;
          CMTimeAdd(&sampleDuration, &time1.duration, &time2);
        }
      }
    }
    else
    {
LABEL_10:
      p_sampleDuration = (CMTime *)&self->_sampleDuration;
      sampleDuration = (CMTime)self->_sampleDuration;
    }
    *(_OWORD *)&time1.duration.value = *(_OWORD *)&self->_decodeEnd.value;
    time1.duration.epoch = self->_decodeEnd.epoch;
    *(_OWORD *)&time2.value = *(_OWORD *)&p_nextSampleTime->value;
    time2.epoch = self->_nextSampleTime.epoch;
    CMTimeSubtract(&lhs, &time1.duration, &time2);
    time1.duration = lhs;
    time2 = sampleDuration;
    v10 = CMTimeCompare(&time1.duration, &time2);
    p_lhs = &sampleDuration;
    if (v10 < 0)
      p_lhs = &lhs;
    v12 = *(_OWORD *)&p_lhs->value;
    sampleDuration.epoch = p_lhs->epoch;
    *(_OWORD *)&sampleDuration.value = v12;
    *(_OWORD *)&time1.duration.value = v12;
    time1.duration.epoch = sampleDuration.epoch;
    time2 = *p_sampleDuration;
    if (CMTimeCompare(&time1.duration, &time2) > 0)
    {
      memset(&time2, 0, sizeof(time2));
      CMSampleBufferGetPresentationTimeStamp(&time2, self->_currentSample);
      if ((int)MediaAnalysisLogLevel() >= 5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        value = time2.value;
        timescale = time2.timescale;
        time = sampleDuration;
        Seconds = CMTimeGetSeconds(&time);
        v19 = *p_sampleDuration;
        v16 = CMTimeGetSeconds(&v19);
        LODWORD(time1.duration.value) = 134218496;
        *(CMTimeValue *)((char *)&time1.duration.value + 4) = value;
        LOWORD(time1.duration.flags) = 1024;
        *(CMTimeFlags *)((char *)&time1.duration.flags + 2) = timescale;
        WORD1(time1.duration.epoch) = 2048;
        *(double *)((char *)&time1.duration.epoch + 4) = Seconds / v16;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[MediaAnalysis] Sample at %lld/%d is being extended %0.1fx", (uint8_t *)&time1, 0x1Cu);
      }
    }
    *(_OWORD *)&time1.decodeTimeStamp.value = *(_OWORD *)&p_nextSampleTime->value;
    time1.decodeTimeStamp.epoch = self->_nextSampleTime.epoch;
    time1.presentationTimeStamp = time1.decodeTimeStamp;
    time1.duration = sampleDuration;
    sampleBufferOut = 0;
    if (CMSampleBufferCreateCopyWithNewTiming(0, self->_currentSample, 1, &time1, &sampleBufferOut))
    {
      result = sampleBufferOut;
      if (sampleBufferOut)
      {
        CFRelease(sampleBufferOut);
        return 0;
      }
    }
    else
    {
      *(_OWORD *)&lhs.value = *(_OWORD *)&p_nextSampleTime->value;
      lhs.epoch = self->_nextSampleTime.epoch;
      rhs = sampleDuration;
      CMTimeAdd(&time2, &lhs, &rhs);
      *(_OWORD *)&p_nextSampleTime->value = *(_OWORD *)&time2.value;
      self->_nextSampleTime.epoch = time2.epoch;
      return sampleBufferOut;
    }
  }
  return result;
}

- (opaqueCMSampleBuffer)getNextCaptureSampleBuffer
{
  return self->_nextSample;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackOutput, 0);
  objc_storeStrong((id *)&self->_assetReader, 0);
}

@end
