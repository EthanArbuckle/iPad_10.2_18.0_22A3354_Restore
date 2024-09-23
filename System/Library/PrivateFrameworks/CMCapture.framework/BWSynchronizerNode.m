@implementation BWSynchronizerNode

- (void)didSelectFormat:(id)a3 forInput:(id)a4
{
  -[BWNodeOutput setFormat:](self->super._output, "setFormat:", a3, a4);
}

- (id)nodeType
{
  return CFSTR("Effect");
}

- (CMSampleBufferRef)_newRetimedVideoSampleBuffer:(int)a3 updatePTSSyncHistory:
{
  const void *v5;
  const void *v6;
  const void *v7;
  const void *v8;
  const void *v9;
  const void *v10;
  const __CFAllocator *v11;
  const __CFAllocator *v12;
  CFDictionaryRef v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  uint64_t v25;
  int64_t v26;
  uint64_t v27;
  uint64_t v28;
  CMTime v29;
  CMTime v30;
  CMTime v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  CMTime v36;
  CMTime time;
  CMTime rhs;
  CMTime lhs;
  CMTime presentationTimeStamp;
  CMTime v41;
  CMSampleTimingInfo timingArrayOut;
  CMSampleBufferRef sampleBufferOut;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v28 = (uint64_t)result;
  if (result)
  {
    sampleBufferOut = 0;
    memset(&timingArrayOut, 0, sizeof(timingArrayOut));
    memset(&v41, 0, sizeof(v41));
    if (CMSampleBufferGetSampleTimingInfoArray(sbuf, 1, &timingArrayOut, 0))
    {
      fig_log_get_emitter();
    }
    else
    {
      presentationTimeStamp = timingArrayOut.presentationTimeStamp;
      if ((timingArrayOut.duration.flags & 1) != 0)
      {
        lhs = timingArrayOut.duration;
        rhs = timingArrayOut.presentationTimeStamp;
        CMTimeAdd(&v41, &lhs, &rhs);
      }
      if ((timingArrayOut.presentationTimeStamp.flags & 1) != 0)
      {
        lhs = timingArrayOut.presentationTimeStamp;
        v5 = *(const void **)(v28 + 96);
        v6 = *(const void **)(v28 + 104);
        time = timingArrayOut.presentationTimeStamp;
        CMSyncConvertTime(&rhs, &time, v5, v6);
        timingArrayOut.presentationTimeStamp = rhs;
        if (a3)
        {
          rhs = lhs;
          time = timingArrayOut.presentationTimeStamp;
          -[BWSynchronizerNode _updatePTSSyncHistoryWithSourceTime:syncedTime:](v28, &rhs, (__n128 *)&time);
        }
      }
      if ((timingArrayOut.decodeTimeStamp.flags & 1) != 0)
      {
        v7 = *(const void **)(v28 + 96);
        v8 = *(const void **)(v28 + 104);
        rhs = timingArrayOut.decodeTimeStamp;
        CMSyncConvertTime(&lhs, &rhs, v7, v8);
        timingArrayOut.decodeTimeStamp = lhs;
      }
      if ((timingArrayOut.duration.flags & 1) != 0)
      {
        v9 = *(const void **)(v28 + 96);
        v10 = *(const void **)(v28 + 104);
        rhs = v41;
        CMSyncConvertTime(&lhs, &rhs, v9, v10);
        v41 = lhs;
        rhs = lhs;
        time = timingArrayOut.presentationTimeStamp;
        CMTimeSubtract(&lhs, &rhs, &time);
        timingArrayOut.duration = lhs;
      }
      v11 = CFGetAllocator(sbuf);
      if (!CMSampleBufferCreateCopyWithNewTiming(v11, sbuf, 1, &timingArrayOut, &sampleBufferOut))
      {
        v12 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
        lhs = presentationTimeStamp;
        v13 = CMTimeCopyAsDictionary(&lhs, v12);
        CMSetAttachment(sampleBufferOut, (CFStringRef)*MEMORY[0x1E0D05D00], v13, 1u);
        CFRelease(v13);
        v14 = (void *)CMGetAttachment(sbuf, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
        if (v14)
        {
          v15 = v14;
          v16 = (void *)objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x1E0D08490]);
          if (v16)
          {
            v17 = v16;
            if (objc_msgSend(v16, "count"))
            {
              CMSampleBufferGetPresentationTimeStamp(&v36, sbuf);
              -[BWSynchronizerNode _synchronizeDetectedFaces:metadata:timescale:](v28, v17, v15, v36.timescale);
            }
          }
          v18 = (void *)objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x1E0D069A0]);
          v32 = 0u;
          v33 = 0u;
          v34 = 0u;
          v35 = 0u;
          v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v32, v44, 16);
          if (v19)
          {
            v20 = v19;
            v21 = *(_QWORD *)v33;
            v22 = *MEMORY[0x1E0D06F20];
            v23 = *MEMORY[0x1E0D064D8];
            do
            {
              for (i = 0; i != v20; ++i)
              {
                if (*(_QWORD *)v33 != v21)
                  objc_enumerationMutation(v18);
                v25 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i);
                memset(&lhs, 0, sizeof(lhs));
                objc_msgSend((id)objc_msgSend((id)objc_msgSend(v18, "objectForKeyedSubscript:", v25), "objectForKeyedSubscript:", v22), "longLongValue");
                v26 = FigHostTimeToNanoseconds();
                CMTimeMake(&v31, v26, 1000000000);
                CMSampleBufferGetPresentationTimeStamp(&v30, sbuf);
                CMTimeConvertScale(&lhs, &v31, v30.timescale, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
                memset(&rhs, 0, sizeof(rhs));
                time = lhs;
                -[BWSynchronizerNode _getSyncedTimeForSourceTime:](v28, &time, (uint64_t)&rhs);
                time = rhs;
                CMTimeConvertScale(&v29, &time, 1000000000, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
                v27 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", FigNanosecondsToHostTime());
                objc_msgSend((id)objc_msgSend(v18, "objectForKeyedSubscript:", v25), "setObject:forKeyedSubscript:", objc_msgSend((id)objc_msgSend(v18, "objectForKeyedSubscript:", v25), "objectForKeyedSubscript:", v22), v23);
                objc_msgSend((id)objc_msgSend(v18, "objectForKeyedSubscript:", v25), "setObject:forKeyedSubscript:", v27, v22);
              }
              v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v32, v44, 16);
            }
            while (v20);
          }
        }
        return sampleBufferOut;
      }
      fig_log_get_emitter();
    }
    FigDebugAssert3();
    if (sampleBufferOut)
    {
      CFRelease(sampleBufferOut);
      return 0;
    }
    return sampleBufferOut;
  }
  return result;
}

- (void)_getSyncedTimeForSourceTime:(uint64_t)a3@<X8>
{
  int v6;
  int v7;
  int v8;
  int32_t v9;
  int v10;
  double Seconds;
  double v12;
  double v13;
  uint64_t v14;
  const void *v15;
  const void *v16;
  uint64_t v17;
  double v18;
  Float64 v19;
  CMTime *v20;
  int32_t timescale;
  CMTime rhs;
  CMTime time2;
  CMTime time1;

  if (a1)
  {
    if (*(_DWORD *)(a1 + 880) == -1)
    {
LABEL_15:
      v15 = *(const void **)(a1 + 96);
      v16 = *(const void **)(a1 + 104);
      time1 = *a2;
      CMSyncConvertTime((CMTime *)a3, &time1, v15, v16);
    }
    else
    {
      v6 = *(_DWORD *)(a1 + 884);
      v7 = -1;
      while (1)
      {
        v8 = v6;
        time1 = *a2;
        time2 = *(CMTime *)(a1 + 112 + 48 * v6);
        v9 = CMTimeCompare(&time1, &time2);
        if (!v9)
          goto LABEL_13;
        if (v9 >= 1)
          break;
        if (v6 >= 1)
          v10 = -1;
        else
          v10 = 15;
        v7 = v6;
        v6 += v10;
        if (v8 == *(_DWORD *)(a1 + 880))
          goto LABEL_15;
      }
      if (v7 == -1)
        goto LABEL_15;
      time1 = *(CMTime *)(a1 + 112 + 48 * v6);
      Seconds = CMTimeGetSeconds(&time1);
      time1 = *(CMTime *)(a1 + 112 + 48 * v7);
      v12 = CMTimeGetSeconds(&time1);
      time1 = *a2;
      v13 = (CMTimeGetSeconds(&time1) - Seconds) / (v12 - Seconds);
      if (v13 < 0.01)
      {
LABEL_13:
        v14 = a1 + 112 + 48 * v6;
LABEL_14:
        *(_OWORD *)a3 = *(_OWORD *)(v14 + 24);
        *(_QWORD *)(a3 + 16) = *(_QWORD *)(v14 + 40);
        return;
      }
      v17 = a1 + 112;
      if (v13 > 0.99)
      {
        v14 = v17 + 48 * v7;
        goto LABEL_14;
      }
      time1 = *(CMTime *)(v17 + 48 * v6 + 24);
      v18 = CMTimeGetSeconds(&time1);
      time1 = *(CMTime *)(a1 + 112 + 48 * v7 + 24);
      v19 = CMTimeGetSeconds(&time1);
      v20 = (CMTime *)(a1 + 112 + 48 * v6);
      timescale = v20[1].timescale;
      *(_QWORD *)(a3 + 8) = 0;
      *(_QWORD *)(a3 + 16) = 0;
      *(_QWORD *)a3 = 0;
      CMTimeMake(&rhs, (uint64_t)(v13 * (v19 - v18) * (double)timescale), timescale);
      time1 = v20[1];
      CMTimeAdd((CMTime *)a3, &time1, &rhs);
    }
  }
  else
  {
    *(_QWORD *)a3 = 0;
    *(_QWORD *)(a3 + 8) = 0;
    *(_QWORD *)(a3 + 16) = 0;
  }
}

- (__n128)_updatePTSSyncHistoryWithSourceTime:(__n128 *)a3 syncedTime:
{
  CMTime *v6;
  int32_t v7;
  __n128 result;
  int v9;
  int v10;
  BOOL v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  uint64_t v19;
  CMTimeEpoch epoch;
  uint64_t v21;
  unint64_t v22;
  CMTime v23;
  CMTime time1;

  if (a1)
  {
    if (*(_DWORD *)(a1 + 880) == -1)
      goto LABEL_12;
    v6 = (CMTime *)(a1 + 112 + 48 * *(int *)(a1 + 884));
    time1 = *a2;
    v23 = *v6;
    v7 = CMTimeCompare(&time1, &v23);
    if (!v7)
      return result;
    if (v7 < 0)
    {
LABEL_12:
      *(_DWORD *)(a1 + 880) = 0;
      *(_DWORD *)(a1 + 884) = 0;
    }
    else
    {
      v9 = *(_DWORD *)(a1 + 884) + 1;
      v10 = v9 & 0xF;
      v12 = -v9;
      v11 = v12 < 0;
      v13 = v12 & 0xF;
      if (v11)
        v14 = v10;
      else
        v14 = -v13;
      *(_DWORD *)(a1 + 884) = v14;
      v15 = *(_DWORD *)(a1 + 884);
      if (v15 == *(_DWORD *)(a1 + 880))
      {
        v16 = v15 + 1;
        v11 = -v16 < 0;
        v17 = -v16 & 0xF;
        v18 = v16 & 0xF;
        if (!v11)
          v18 = -v17;
        *(_DWORD *)(a1 + 880) = v18;
      }
    }
    v19 = a1 + 112 + 48 * *(int *)(a1 + 884);
    epoch = a2->epoch;
    *(_OWORD *)v19 = *(_OWORD *)&a2->value;
    *(_QWORD *)(v19 + 16) = epoch;
    v21 = a1 + 112 + 48 * *(int *)(a1 + 884);
    v22 = a3[1].n128_u64[0];
    result = *a3;
    *(__n128 *)(v21 + 24) = *a3;
    *(_QWORD *)(v21 + 40) = v22;
  }
  return result;
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  uint64_t v4;
  opaqueCMSampleBuffer *v5;
  CMSampleBufferRef v7;
  CMSampleBufferRef v8;
  opaqueCMSampleBuffer *AttachedMedia;
  uint64_t v10;
  uint64_t v11;

  v5 = a3;
  if (!a3)
  {
    fig_log_get_emitter();
    v11 = v4;
    LODWORD(v10) = 0;
    FigDebugAssert3();
    goto LABEL_3;
  }
  if (FigCFEqual())
  {
LABEL_3:
    v7 = 0;
LABEL_4:
    v8 = 0;
    goto LABEL_11;
  }
  v7 = -[BWSynchronizerNode _newRetimedVideoSampleBuffer:updatePTSSyncHistory:]((CMSampleBufferRef)self, v5, 1);
  if (!v7)
  {
    fig_log_get_emitter();
    v11 = v4;
    LODWORD(v10) = 0;
    FigDebugAssert3();
    goto LABEL_4;
  }
  AttachedMedia = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(v5, (uint64_t)CFSTR("SynchronizedSlaveFrame"));
  if (!AttachedMedia)
  {
    v8 = 0;
    goto LABEL_10;
  }
  v8 = -[BWSynchronizerNode _newRetimedVideoSampleBuffer:updatePTSSyncHistory:]((CMSampleBufferRef)self, AttachedMedia, 0);
  if (v8)
  {
    BWSampleBufferSetAttachedMedia(v7, (uint64_t)CFSTR("SynchronizedSlaveFrame"), (uint64_t)v8);
LABEL_10:
    BWSynchronizeSmartStyleAttachedMediaPTS(v7);
    v5 = v7;
    goto LABEL_11;
  }
  fig_log_get_emitter();
  v11 = v4;
  LODWORD(v10) = 0;
  FigDebugAssert3();
LABEL_11:
  -[BWNodeOutput emitSampleBuffer:](self->super._output, "emitSampleBuffer:", v5, v10, v11);
  if (v7)
    CFRelease(v7);
  if (v8)
    CFRelease(v8);
}

- (void)handleDroppedSample:(id)a3 forInput:(id)a4
{
  OpaqueCMClock *sourceClock;
  OpaqueCMClock *masterClock;
  uint64_t v8;
  id v9;
  CMTime v10;
  CMTime time;
  CMTime v12;
  CMTime v13;

  if (FigCFEqual())
    goto LABEL_2;
  memset(&v13, 0, sizeof(v13));
  if (a3)
    objc_msgSend(a3, "pts");
  memset(&v12, 0, sizeof(v12));
  sourceClock = self->_sourceClock;
  masterClock = self->_masterClock;
  time = v13;
  CMSyncConvertTime(&v12, &time, sourceClock, masterClock);
  time = v13;
  v10 = v12;
  if (!CMTimeCompare(&time, &v10))
  {
LABEL_2:
    -[BWNodeOutput emitDroppedSample:](self->super._output, "emitDroppedSample:", a3);
  }
  else
  {
    v8 = objc_msgSend(a3, "reason");
    time = v12;
    v9 = +[BWDroppedSample newDroppedSampleWithReason:pts:](BWDroppedSample, "newDroppedSampleWithReason:pts:", v8, &time);
    -[BWNodeOutput emitDroppedSample:](self->super._output, "emitDroppedSample:", v9);

  }
}

- (void)prepareForCurrentConfigurationToBecomeLive
{
  if (!self->_masterClock || !self->_sourceClock)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("master and source clock must be set"), 0));
}

- (void)setSourceClock:(OpaqueCMClock *)a3
{
  OpaqueCMClock *sourceClock;

  sourceClock = self->_sourceClock;
  self->_sourceClock = a3;
  if (a3)
    CFRetain(a3);
  if (sourceClock)
    CFRelease(sourceClock);
}

- (BWSynchronizerNode)initWithMediaType:(unsigned int)a3
{
  uint64_t v3;
  BWSynchronizerNode *v4;
  BWNodeInput *v5;
  BWVideoFormatRequirements *v6;
  BWNodeOutput *v7;
  BWVideoFormatRequirements *v8;
  objc_super v10;

  v3 = *(_QWORD *)&a3;
  v10.receiver = self;
  v10.super_class = (Class)BWSynchronizerNode;
  v4 = -[BWNode init](&v10, sel_init);
  if (v4)
  {
    v5 = -[BWNodeInput initWithMediaType:node:]([BWNodeInput alloc], "initWithMediaType:node:", v3, v4);
    if ((_DWORD)v3 == 1986618469)
    {
      v6 = objc_alloc_init(BWVideoFormatRequirements);
      -[BWNodeInput setFormatRequirements:](v5, "setFormatRequirements:", v6);

    }
    -[BWNodeInput setPassthroughMode:](v5, "setPassthroughMode:", 1);
    -[BWNode addInput:](v4, "addInput:", v5);

    v7 = -[BWNodeOutput initWithMediaType:node:]([BWNodeOutput alloc], "initWithMediaType:node:", v3, v4);
    if ((_DWORD)v3 == 1986618469)
    {
      v8 = objc_alloc_init(BWVideoFormatRequirements);
      -[BWNodeOutput setFormatRequirements:](v7, "setFormatRequirements:", v8);

    }
    -[BWNodeOutput setPassthroughMode:](v7, "setPassthroughMode:", 1);
    -[BWNodeOutput setDropsSampleBuffersWithUnexpectedPTS:](v7, "setDropsSampleBuffersWithUnexpectedPTS:", 1);
    v4->_oldestPTSSyncHistoryElement = -1;
    v4->_newestPTSSyncHistoryElement = -1;
    -[BWNode addOutput:](v4, "addOutput:", v7);

  }
  return v4;
}

- (void)setMasterClock:(OpaqueCMClock *)a3
{
  OpaqueCMClock *masterClock;

  masterClock = self->_masterClock;
  self->_masterClock = a3;
  if (a3)
    CFRetain(a3);
  if (masterClock)
    CFRelease(masterClock);
}

+ (void)initialize
{
  objc_opt_class();
}

- (void)dealloc
{
  OpaqueCMClock *sourceClock;
  OpaqueCMClock *masterClock;
  objc_super v5;

  sourceClock = self->_sourceClock;
  if (sourceClock)
    CFRelease(sourceClock);
  masterClock = self->_masterClock;
  if (masterClock)
    CFRelease(masterClock);
  v5.receiver = self;
  v5.super_class = (Class)BWSynchronizerNode;
  -[BWNode dealloc](&v5, sel_dealloc);
}

- (OpaqueCMClock)sourceClock
{
  OpaqueCMClock *sourceClock;

  sourceClock = self->_sourceClock;
  if (sourceClock)
  {
    CFRetain(self->_sourceClock);
    CFAutorelease(sourceClock);
  }
  return sourceClock;
}

- (OpaqueCMClock)masterClock
{
  OpaqueCMClock *masterClock;

  masterClock = self->_masterClock;
  if (masterClock)
  {
    CFRetain(self->_masterClock);
    CFAutorelease(masterClock);
  }
  return masterClock;
}

- (id)nodeSubType
{
  return CFSTR("GenericSynchronizer");
}

- (uint64_t)_synchronizeDetectedFaces:(void *)a3 metadata:(int32_t)a4 timescale:
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  int64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  CMTime v22;
  CMTime time2;
  CMTime time1;
  CMTime v25;
  CMTime time;
  CMTime v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  CMTime v32;
  CMTime v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v19 = result;
  if (result)
  {
    v5 = a2;
    v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(a2, "count"));
    v33 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E18];
    v32 = v33;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v29;
      v10 = *MEMORY[0x1E0D06F20];
      v20 = *MEMORY[0x1E0D064D8];
      v21 = v5;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v29 != v9)
            objc_enumerationMutation(v5);
          v12 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          v13 = (void *)objc_msgSend(v12, "objectForKeyedSubscript:", v10);
          if (!v13)
            goto LABEL_14;
          v14 = v13;
          memset(&v27, 0, sizeof(v27));
          objc_msgSend(v13, "longLongValue");
          v15 = FigHostTimeToNanoseconds();
          CMTimeMake(&time, v15, 1000000000);
          CMTimeConvertScale(&v27, &time, a4, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
          if ((v27.flags & 1) == 0)
            goto LABEL_14;
          memset(&v25, 0, sizeof(v25));
          time1 = v33;
          time2 = v27;
          if (CMTimeCompare(&time1, &time2))
          {
            time1 = v27;
            -[BWSynchronizerNode _getSyncedTimeForSourceTime:](v19, &time1, (uint64_t)&v25);
            v33 = v27;
            v32 = v25;
          }
          else
          {
            v25 = v32;
          }
          time1 = v25;
          CMTimeConvertScale(&v22, &time1, 1000000000, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
          v16 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", FigNanosecondsToHostTime());
          v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v12, "count") + 1);
          objc_msgSend(v17, "addEntriesFromDictionary:", v12);
          objc_msgSend(v17, "setObject:forKeyedSubscript:", v16, v10);
          objc_msgSend(v17, "setObject:forKeyedSubscript:", v14, v20);
          v5 = v21;
          if (v17)
          {
            objc_msgSend(v6, "addObject:", v17);

          }
          else
          {
LABEL_14:
            objc_msgSend(v6, "addObject:", v12);
          }
        }
        v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
      }
      while (v8);
    }
    return objc_msgSend(a3, "setObject:forKeyedSubscript:", v6, *MEMORY[0x1E0D08490]);
  }
  return result;
}

@end
