@implementation VCPVideoTrackStandardDecoder

- (VCPVideoTrackStandardDecoder)initWithTrack:(id)a3 timerange:(id *)a4
{
  return -[VCPVideoTrackStandardDecoder initWithTrack:timerange:withSettings:applyTransform:](self, "initWithTrack:timerange:withSettings:applyTransform:", a3, a4, 0, 1);
}

- (VCPVideoTrackStandardDecoder)initWithTrack:(id)a3 timerange:(id *)a4 withSettings:(id)a5 applyTransform:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  VCPVideoTrackStandardDecoder *v12;
  VCPVideoTrackStandardDecoder *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  AVAssetReader *assetReader;
  void *v18;
  void *v19;
  uint64_t v20;
  AVAssetReaderTrackOutput *trackOutput;
  AVAssetReaderTrackOutput *v22;
  AVAssetReader *v23;
  __int128 v24;
  uint64_t v25;
  uint64_t v26;
  VCPVideoTrackStandardDecoder *v27;
  _OWORD v29[3];
  objc_super v30;

  v6 = a6;
  v10 = a3;
  v11 = a5;
  v30.receiver = self;
  v30.super_class = (Class)VCPVideoTrackStandardDecoder;
  v12 = -[VCPVideoTrackDecoder initWithTrack:](&v30, sel_initWithTrack_, v10);
  v13 = v12;
  if (v12)
  {
    v14 = (void *)MEMORY[0x1E0C8AFD0];
    -[AVAssetTrack asset](v12->super._track, "asset");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "assetReaderWithAsset:error:", v15, 0);
    v16 = objc_claimAutoreleasedReturnValue();
    assetReader = v13->_assetReader;
    v13->_assetReader = (AVAssetReader *)v16;

    v18 = v13->_assetReader;
    if (v18)
    {
      v19 = v11;
      if (!v11)
      {
        -[VCPVideoTrackDecoder settings](v13, "settings");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_storeStrong((id *)&v13->_decoderSettings, v19);
      if (!v11)

      objc_msgSend(MEMORY[0x1E0C8B000], "assetReaderTrackOutputWithTrack:outputSettings:", v13->super._track, v13->_decoderSettings);
      v20 = objc_claimAutoreleasedReturnValue();
      trackOutput = v13->_trackOutput;
      v13->_trackOutput = (AVAssetReaderTrackOutput *)v20;

      v22 = v13->_trackOutput;
      if (!v22)
        goto LABEL_12;
      -[AVAssetReaderTrackOutput setAppliesPreferredTrackTransform:](v22, "setAppliesPreferredTrackTransform:", v6);
      -[AVAssetReader addOutput:](v13->_assetReader, "addOutput:", v13->_trackOutput);
      v23 = v13->_assetReader;
      v24 = *(_OWORD *)&a4->var0.var3;
      v29[0] = *(_OWORD *)&a4->var0.var0;
      v29[1] = v24;
      v29[2] = *(_OWORD *)&a4->var1.var1;
      -[AVAssetReader setTimeRange:](v23, "setTimeRange:", v29);
      if (-[AVAssetReader startReading](v13->_assetReader, "startReading"))
      {
        v25 = -[AVAssetReaderTrackOutput copyNextSampleBuffer](v13->_trackOutput, "copyNextSampleBuffer");
        v13->_nextSample = (opaqueCMSampleBuffer *)v25;
        if (v25)
          v26 = 1;
        else
          v26 = -[AVAssetReader status](v13->_assetReader, "status");
        v13->_status = v26;
        v18 = v13;
      }
      else
      {
LABEL_12:
        v18 = 0;
      }
    }
    v27 = v18;
  }
  else
  {
    v27 = 0;
  }

  return v27;
}

- (void)dealloc
{
  opaqueCMSampleBuffer *nextSample;
  AVAssetReader *assetReader;
  objc_super v5;

  nextSample = self->_nextSample;
  if (nextSample)
    CFRelease(nextSample);
  assetReader = self->_assetReader;
  if (assetReader)
    -[AVAssetReader cancelReading](assetReader, "cancelReading");
  v5.receiver = self;
  v5.super_class = (Class)VCPVideoTrackStandardDecoder;
  -[VCPVideoTrackStandardDecoder dealloc](&v5, sel_dealloc);
}

- (int64_t)status
{
  return self->_status;
}

- (opaqueCMSampleBuffer)copyNextSampleBuffer
{
  opaqueCMSampleBuffer *nextSample;
  opaqueCMSampleBuffer *v4;
  CMTime *v5;
  AVAssetReaderStatus v6;
  void *v7;
  void *v8;
  AVAssetReader *assetReader;
  int32_t v11;
  CMTime *p_rhs;
  opaqueCMSampleBuffer *v13;
  CMSampleTimingInfo v14;
  CMTimeRange v15;
  CMTime v16;
  CMTimeRange range;
  CMTime v18;
  CMTime rhs;
  CMTime time2;

  nextSample = self->_nextSample;
  if (!nextSample)
    return 0;
  v4 = (opaqueCMSampleBuffer *)-[AVAssetReaderTrackOutput copyNextSampleBuffer](self->_trackOutput, "copyNextSampleBuffer");
  self->_nextSample = v4;
  v5 = (CMTime *)MEMORY[0x1E0CA2E18];
  v18 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E18];
  if (!v4)
  {
    v6 = -[AVAssetReader status](self->_assetReader, "status");
    self->_status = v6;
    if (v6 == AVAssetReaderStatusCompleted)
    {
      -[AVAssetReaderTrackOutput track](self->_trackOutput, "track");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (v7)
        objc_msgSend(v7, "timeRange");
      else
        memset(&range, 0, sizeof(range));
      CMTimeRangeGetEnd(&rhs, &range);
      assetReader = self->_assetReader;
      if (assetReader)
        -[AVAssetReader timeRange](assetReader, "timeRange");
      else
        memset(&v15, 0, sizeof(v15));
      CMTimeRangeGetEnd(&v16, &v15);
      v14.duration = v16;
      time2 = rhs;
      v11 = CMTimeCompare(&v14.duration, &time2);
      p_rhs = &rhs;
      if (v11 < 0)
        p_rhs = &v16;
      v18 = *p_rhs;

      goto LABEL_16;
    }
    CFRelease(nextSample);
    return 0;
  }
  CMSampleBufferGetPresentationTimeStamp(&v18, v4);
LABEL_16:
  v14.decodeTimeStamp = *v5;
  CMSampleBufferGetPresentationTimeStamp(&v14.presentationTimeStamp, nextSample);
  time2 = v18;
  rhs = v14.presentationTimeStamp;
  CMTimeSubtract(&v16, &time2, &rhs);
  v14.duration = v16;
  time2.value = 0;
  if (CMSampleBufferCreateCopyWithNewTiming(0, nextSample, 1, &v14, (CMSampleBufferRef *)&time2))
  {
    v13 = self->_nextSample;
    if (v13)
    {
      CFRelease(v13);
      self->_nextSample = 0;
    }
    self->_status = 3;
  }
  CFRelease(nextSample);
  return (opaqueCMSampleBuffer *)time2.value;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_decoderSettings, 0);
  objc_storeStrong((id *)&self->_trackOutput, 0);
  objc_storeStrong((id *)&self->_assetReader, 0);
}

@end
