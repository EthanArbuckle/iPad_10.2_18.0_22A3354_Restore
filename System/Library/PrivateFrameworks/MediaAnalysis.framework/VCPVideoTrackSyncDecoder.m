@implementation VCPVideoTrackSyncDecoder

- (VCPVideoTrackSyncDecoder)initWithTrack:(id)a3 timerange:(id *)a4
{
  id v6;
  id v7;
  VCPVideoTrackSyncDecoder *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  dispatch_queue_t v12;
  void *v13;
  void *v14;
  dispatch_semaphore_t v15;
  void *v16;
  dispatch_semaphore_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  CMTimeRange v27;
  CMTimeRange range;
  CMTimeRange v29;
  objc_super v30;

  v6 = a3;
  v30.receiver = self;
  v30.super_class = (Class)VCPVideoTrackSyncDecoder;
  v7 = -[VCPVideoTrackDecoder initWithTrack:](&v30, sel_initWithTrack_, v6);
  if (v7)
  {
    if (v6)
      objc_msgSend(v6, "timeRange");
    else
      memset(&range, 0, sizeof(range));
    v9 = *(_OWORD *)&a4->var0.var3;
    *(_OWORD *)&v27.start.value = *(_OWORD *)&a4->var0.var0;
    *(_OWORD *)&v27.start.epoch = v9;
    *(_OWORD *)&v27.duration.timescale = *(_OWORD *)&a4->var1.var1;
    CMTimeRangeGetIntersection(&v29, &range, &v27);
    v11 = *(_OWORD *)&v29.start.epoch;
    v10 = *(_OWORD *)&v29.duration.timescale;
    *((_OWORD *)v7 + 2) = *(_OWORD *)&v29.start.value;
    *((_OWORD *)v7 + 3) = v11;
    *((_OWORD *)v7 + 4) = v10;
    *((_BYTE *)v7 + 80) = 0;
    v12 = dispatch_queue_create("com.apple.mediaanalysis.VCPVideoTrackSyncDecoder", 0);
    v13 = (void *)*((_QWORD *)v7 + 11);
    *((_QWORD *)v7 + 11) = v12;

    v14 = (void *)*((_QWORD *)v7 + 12);
    *((_QWORD *)v7 + 12) = 0;

    v15 = dispatch_semaphore_create(0);
    v16 = (void *)*((_QWORD *)v7 + 13);
    *((_QWORD *)v7 + 13) = v15;

    v17 = dispatch_semaphore_create(0);
    v18 = (void *)*((_QWORD *)v7 + 14);
    *((_QWORD *)v7 + 14) = v17;

    *((_BYTE *)v7 + 120) = 0;
    *((_DWORD *)v7 + 31) = 0;
    *((_BYTE *)v7 + 128) = 0;
    *((_DWORD *)v7 + 33) = 0;
    *((_DWORD *)v7 + 34) = 0;
    *((_QWORD *)v7 + 18) = 0;
    *((_QWORD *)v7 + 19) = 0;
    dispatch_semaphore_signal(*((dispatch_semaphore_t *)v7 + 13));
    dispatch_semaphore_signal(*((dispatch_semaphore_t *)v7 + 13));
    v19 = (void *)MEMORY[0x1E0C8AFD0];
    objc_msgSend(*((id *)v7 + 1), "asset");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "assetReaderWithAsset:error:", v20, 0);
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = (void *)*((_QWORD *)v7 + 2);
    *((_QWORD *)v7 + 2) = v21;

    objc_msgSend(MEMORY[0x1E0C8AFF8], "assetReaderSampleReferenceOutputWithTrack:", *((_QWORD *)v7 + 1));
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = (void *)*((_QWORD *)v7 + 3);
    *((_QWORD *)v7 + 3) = v23;

    objc_msgSend(*((id *)v7 + 2), "addOutput:", *((_QWORD *)v7 + 3));
    if (objc_msgSend(*((id *)v7 + 2), "startReading"))
      v25 = v7;
    else
      v25 = 0;
    v8 = v25;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)dealloc
{
  uint64_t v3;
  char v4;
  char v5;
  opaqueCMSampleBuffer *v6;
  objc_super v7;

  -[AVAssetReader cancelReading](self->_assetReader, "cancelReading");
  if (self->_group)
  {
    self->_cancelDecode = 1;
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_inputSemaphore);
    dispatch_group_wait((dispatch_group_t)self->_group, 0xFFFFFFFFFFFFFFFFLL);
  }
  v3 = 0;
  v4 = 1;
  do
  {
    v5 = v4;
    v6 = self->_sampleBuffer[v3];
    if (v6)
      CFRelease(v6);
    v4 = 0;
    v3 = 1;
  }
  while ((v5 & 1) != 0);
  v7.receiver = self;
  v7.super_class = (Class)VCPVideoTrackSyncDecoder;
  -[VCPVideoTrackSyncDecoder dealloc](&v7, sel_dealloc);
}

- (int64_t)status
{
  int outputFrameIdx;
  int v5;

  if (self->_decodeError)
    return 3;
  outputFrameIdx = self->_outputFrameIdx;
  if (dispatch_group_wait((dispatch_group_t)self->_group, 0))
    return 1;
  v5 = outputFrameIdx & 1;
  if (outputFrameIdx < 0)
    v5 = -v5;
  if (self->_sampleBuffer[v5])
    return 1;
  else
    return 2;
}

- (int)findNextSample:(BOOL)a3 timerange:(id *)a4
{
  opaqueCMSampleBuffer *v7;
  __int128 v8;
  __int128 v9;
  CMTime *v10;
  opaqueCMSampleBuffer *v11;
  __int128 v12;
  const __CFArray *SampleAttachmentsArray;
  const __CFArray *v14;
  const __CFDictionary *ValueAtIndex;
  const void *Value;
  const void *v17;
  CFTypeID v18;
  __int128 v19;
  CFTypeRef cf2;
  void *key;
  CMTimeRange otherRange;
  CMTimeRange range;
  CMTimeRange v25;
  CMTime duration;
  CMTime start;
  CMTimeRange v28;
  CMTime time2;

  v7 = 0;
  v8 = *MEMORY[0x1E0CA2E40];
  v9 = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 32);
  *(_OWORD *)&a4->var0.var3 = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 16);
  *(_OWORD *)&a4->var1.var1 = v9;
  *(_OWORD *)&a4->var0.var0 = v8;
  key = (void *)*MEMORY[0x1E0CA2620];
  cf2 = (CFTypeRef)*MEMORY[0x1E0C9AE50];
  v10 = (CMTime *)MEMORY[0x1E0CA2E68];
  while (1)
  {
    if (v7)
      CFRelease(v7);
    v11 = (opaqueCMSampleBuffer *)-[AVAssetReaderSampleReferenceOutput copyNextSampleBuffer](self->_trackReader, "copyNextSampleBuffer", cf2);
    if (!v11)
      break;
    v7 = v11;
    memset(&v28, 0, sizeof(v28));
    CMSampleBufferGetOutputPresentationTimeStamp(&start, v11);
    CMSampleBufferGetOutputDuration(&duration, v7);
    CMTimeRangeMake(&v28, &start, &duration);
    v12 = *(_OWORD *)&self->_timerange.start.epoch;
    *(_OWORD *)&range.start.value = *(_OWORD *)&self->_timerange.start.value;
    *(_OWORD *)&range.start.epoch = v12;
    *(_OWORD *)&range.duration.timescale = *(_OWORD *)&self->_timerange.duration.timescale;
    otherRange = v28;
    CMTimeRangeGetIntersection(&v25, &range, &otherRange);
    v28 = v25;
    if ((v25.start.flags & 1) != 0
      && (v28.duration.flags & 1) != 0
      && !v28.duration.epoch
      && (v28.duration.value & 0x8000000000000000) == 0)
    {
      v25.start = v28.duration;
      time2 = *v10;
      if (CMTimeCompare(&v25.start, &time2) >= 1)
      {
        if (a3
          || (SampleAttachmentsArray = CMSampleBufferGetSampleAttachmentsArray(v7, 0)) != 0
          && (v14 = SampleAttachmentsArray, CFArrayGetCount(SampleAttachmentsArray))
          && ((ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v14, 0),
               (Value = CFDictionaryGetValue(ValueAtIndex, key)) == 0)
           || (v17 = Value, v18 = CFGetTypeID(Value), v18 != CFBooleanGetTypeID())
           || !CFEqual(v17, cf2)))
        {
          v19 = *(_OWORD *)&v28.start.epoch;
          *(_OWORD *)&a4->var0.var0 = *(_OWORD *)&v28.start.value;
          *(_OWORD *)&a4->var0.var3 = v19;
          *(_OWORD *)&a4->var1.var1 = *(_OWORD *)&v28.duration.timescale;
          CFRelease(v7);
          return 0;
        }
      }
    }
  }
  if (-[AVAssetReader status](self->_assetReader, "status") == AVAssetReaderStatusCompleted)
    return 0;
  else
    return -19;
}

- (int)decodeSample:(id *)a3 sample:(opaqueCMSampleBuffer *)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  BOOL v12;
  void *v13;
  __int128 v14;
  void *v15;
  AVAssetTrack *track;
  void *v17;
  int v18;
  opaqueCMSampleBuffer *v20;
  _OWORD v21[3];
  id v22;

  *a4 = 0;
  v7 = (void *)MEMORY[0x1BCCA1B2C](self, a2);
  v8 = (void *)MEMORY[0x1E0C8AFD0];
  -[AVAssetTrack asset](self->super._track, "asset");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  objc_msgSend(v8, "assetReaderWithAsset:error:", v9, &v22);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v22;

  if (v10)
    v12 = v11 == 0;
  else
    v12 = 0;
  if (!v12)
  {
    v13 = 0;
LABEL_9:
    v18 = -18;
    goto LABEL_10;
  }
  v14 = *(_OWORD *)&a3->var0.var3;
  v21[0] = *(_OWORD *)&a3->var0.var0;
  v21[1] = v14;
  v21[2] = *(_OWORD *)&a3->var1.var1;
  objc_msgSend(v10, "setTimeRange:", v21);
  v15 = (void *)MEMORY[0x1E0C8B000];
  track = self->super._track;
  -[VCPVideoTrackDecoder settings](self, "settings");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "assetReaderTrackOutputWithTrack:outputSettings:", track, v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
    goto LABEL_9;
  objc_msgSend(v13, "setAppliesPreferredTrackTransform:", 1);
  if (!objc_msgSend(v10, "canAddOutput:", v13))
    goto LABEL_9;
  objc_msgSend(v10, "addOutput:", v13);
  if (objc_msgSend(v10, "status"))
    goto LABEL_9;
  if (objc_msgSend(v10, "startReading"))
  {
    v20 = (opaqueCMSampleBuffer *)objc_msgSend(v13, "copyNextSampleBuffer");
    *a4 = v20;
    if (v20)
      v18 = 0;
    else
      v18 = -19;
  }
  else
  {
    v18 = -19;
  }
LABEL_10:
  if (objc_msgSend(v10, "status") == 1)
    objc_msgSend(v10, "cancelReading");

  objc_autoreleasePoolPop(v7);
  return v18;
}

- (void)decodeTask
{
  __int128 v3;
  __int128 *v4;
  __int128 v5;
  int v6;
  __int128 v7;
  OSStatus v8;
  CMTime *v9;
  int v10;
  CMSampleTimingInfo v11;
  _OWORD v12[3];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  CMSampleBufferRef originalSBuf;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  CMTimeRange range;
  CMTime v21;
  CMTime rhs;
  CMTime lhs;

  memset(&v21, 0, sizeof(v21));
  v3 = *(_OWORD *)&self->_timerange.start.epoch;
  *(_OWORD *)&range.start.value = *(_OWORD *)&self->_timerange.start.value;
  *(_OWORD *)&range.start.epoch = v3;
  *(_OWORD *)&range.duration.timescale = *(_OWORD *)&self->_timerange.duration.timescale;
  CMTimeRangeGetEnd(&v21, &range);
  v4 = (__int128 *)MEMORY[0x1E0CA2E40];
  v5 = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 16);
  v17 = *MEMORY[0x1E0CA2E40];
  v18 = v5;
  v19 = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 32);
  originalSBuf = 0;
  v6 = -[VCPVideoTrackSyncDecoder findNextSample:timerange:](self, "findNextSample:timerange:", 1, &v17);
  if (!v6)
  {
    if ((BYTE12(v17) & 1) != 0)
    {
      while (1)
      {
        v6 = 0;
        if ((BYTE4(v19) & 1) == 0 || *((_QWORD *)&v19 + 1) || (*((_QWORD *)&v18 + 1) & 0x8000000000000000) != 0)
          break;
        dispatch_semaphore_wait((dispatch_semaphore_t)self->_inputSemaphore, 0xFFFFFFFFFFFFFFFFLL);
        if (self->_cancelDecode)
          goto LABEL_3;
        v7 = v4[1];
        v13 = *v4;
        v14 = v7;
        v15 = v4[2];
        v8 = -[VCPVideoTrackSyncDecoder findNextSample:timerange:](self, "findNextSample:timerange:", 0, &v13);
        if (v8)
          goto LABEL_22;
        v12[0] = v17;
        v12[1] = v18;
        v12[2] = v19;
        v8 = -[VCPVideoTrackSyncDecoder decodeSample:sample:](self, "decodeSample:sample:", v12, &originalSBuf);
        if (v8)
          goto LABEL_22;
        if ((BYTE12(v13) & 1) != 0)
        {
          v9 = (CMTime *)&v13;
          if ((BYTE4(v15) & (*((_QWORD *)&v15 + 1) == 0) & (v14 >= 0)) == 0)
            v9 = &v21;
        }
        else
        {
          v9 = &v21;
        }
        lhs = *v9;
        memset(&v11, 0, sizeof(v11));
        *(_OWORD *)&rhs.value = v17;
        rhs.epoch = v18;
        CMTimeSubtract(&v11.duration, &lhs, &rhs);
        *(_OWORD *)&v11.presentationTimeStamp.value = v17;
        v11.presentationTimeStamp.epoch = v18;
        *(_OWORD *)&v11.decodeTimeStamp.value = v17;
        v11.decodeTimeStamp.epoch = v18;
        v10 = self->_decodedFrames >= 0 ? self->_decodedFrames & 1 : -(self->_decodedFrames & 1);
        v8 = CMSampleBufferCreateCopyWithNewTiming(0, originalSBuf, 1, &v11, &self->_sampleBuffer[v10]);
        if (v8)
        {
LABEL_22:
          v6 = v8;
          break;
        }
        if (originalSBuf)
        {
          CFRelease(originalSBuf);
          originalSBuf = 0;
        }
        dispatch_semaphore_signal((dispatch_semaphore_t)self->_outputSemaphore);
        v17 = v13;
        v18 = v14;
        v19 = v15;
        ++self->_decodedFrames;
        if ((BYTE12(v17) & 1) == 0)
          goto LABEL_3;
      }
    }
    else
    {
LABEL_3:
      v6 = 0;
    }
    if (originalSBuf)
      CFRelease(originalSBuf);
  }
  self->_decodeError = v6;
  self->_decodeFinished = 1;
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_outputSemaphore);
}

- (opaqueCMSampleBuffer)copyNextSampleBuffer
{
  VCPVideoTrackSyncDecoder *v2;
  dispatch_group_t v3;
  OS_dispatch_group *group;
  NSObject *v5;
  NSObject *queue;
  opaqueCMSampleBuffer *v7;
  int outputFrameIdx;
  int v10;
  _QWORD block[5];

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_launchOnce)
  {
    v3 = dispatch_group_create();
    group = v2->_group;
    v2->_group = (OS_dispatch_group *)v3;

    v5 = v2->_group;
    queue = v2->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __48__VCPVideoTrackSyncDecoder_copyNextSampleBuffer__block_invoke;
    block[3] = &unk_1E6B15468;
    block[4] = v2;
    dispatch_group_async(v5, queue, block);
    v2->_launchOnce = 1;
  }
  objc_sync_exit(v2);

  if (v2->_decodeError || v2->_decodeFinished && v2->_outputFrameIdx >= v2->_decodedFrames)
    return 0;
  dispatch_semaphore_wait((dispatch_semaphore_t)v2->_outputSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  if (v2->_decodeError)
    return 0;
  outputFrameIdx = v2->_outputFrameIdx;
  if (v2->_decodeFinished && outputFrameIdx >= v2->_decodedFrames)
    return 0;
  v10 = v2->_outputFrameIdx & 1;
  if (outputFrameIdx < 0)
    v10 = -v10;
  v7 = v2->_sampleBuffer[v10];
  v2->_sampleBuffer[v10] = 0;
  v2->_outputFrameIdx = outputFrameIdx + 1;
  dispatch_semaphore_signal((dispatch_semaphore_t)v2->_inputSemaphore);
  return v7;
}

uint64_t __48__VCPVideoTrackSyncDecoder_copyNextSampleBuffer__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "decodeTask");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputSemaphore, 0);
  objc_storeStrong((id *)&self->_inputSemaphore, 0);
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_trackReader, 0);
  objc_storeStrong((id *)&self->_assetReader, 0);
}

@end
