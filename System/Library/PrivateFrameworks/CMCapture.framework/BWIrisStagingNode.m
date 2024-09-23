@implementation BWIrisStagingNode

- (void)configurationWithID:(int64_t)a3 updatedFormat:(id)a4 didBecomeLiveForInput:(id)a5
{
  if (objc_msgSend(a5, "index", a3, a4) != *(_QWORD *)&self->_trimLivePhotoMovieAtWideAndSuperWideAutoSwitching)
    objc_msgSend(-[NSArray objectAtIndexedSubscript:](-[BWNode outputs](self, "outputs"), "objectAtIndexedSubscript:", objc_msgSend(a5, "index")), "makeConfiguredFormatLive");
}

- (void)handleDroppedSample:(id)a3 forInput:(id)a4
{
  const __CFAllocator *v6;
  CFDictionaryRef v7;
  CFDictionaryRef v8;
  CMTime v9[2];

  if (!objc_msgSend(a4, "index"))
  {
    memset(&v9[1], 0, sizeof(CMTime));
    if (a3)
      objc_msgSend(a3, "pts");
    v6 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v9[0] = v9[1];
    v7 = CMTimeCopyAsDictionary(v9, v6);
    if (v7)
    {
      v8 = v7;
      -[NSMutableArray addObject:](self->_lastEmittedBuffers, "addObject:", v7);
      CFRelease(v8);
    }
  }
}

uint64_t __45__BWIrisStagingNode__trimQueueForInputIndex___block_invoke(uint64_t a1, uint64_t a2, unint64_t a3)
{
  int v6;
  uint64_t result;
  CMTime v8;
  CMTime time1;

  v6 = objc_msgSend(*(id *)(a1 + 32), "mediaType");
  result = a2;
  if (v6 != 1835365473)
  {
    if (*(_QWORD *)(a1 + 56) - 1 <= a3)
      return 0;
    result = objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", a3 + 1);
  }
  if (!result)
    return result;
  CMSampleBufferGetPresentationTimeStamp(&time1, (CMSampleBufferRef)result);
  v8 = *(CMTime *)(a1 + 72);
  if ((CMTimeCompare(&time1, &v8) & 0x80000000) == 0)
    return 0;
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 376), "objectAtIndexedSubscript:", *(_QWORD *)(a1 + 64)) == a2)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 376), "setObject:atIndexedSubscript:", objc_msgSend(MEMORY[0x1E0C99E38], "null"), *(_QWORD *)(a1 + 64));
  return 1;
}

- (uint64_t)_feedTrimmerWithVideoSampleBuffer:(uint64_t)result
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  int64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  id obj;
  uint64_t v30;
  _BOOL4 v31;
  uint64_t v32;
  void *v33;
  CGPoint origin;
  CGFloat width;
  CGRect v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  CGRect v45;
  _BYTE v46[24];
  _BYTE v47[128];
  _BYTE v48[128];
  _QWORD v49[5];
  CGRect v50;
  CGRect v51;

  v49[3] = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v3 = result;
    v4 = (void *)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
    v5 = objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D06B68]);
    v6 = *(void **)(v3 + 496);
    -[BWIrisStagingNode _hostPTSForSampleBuffer:](target, (CMTime *)v3, (uint64_t)v46);
    result = objc_msgSend(v6, "processISPMotionData:forHostTime:", v5, v46);
    if (*(_BYTE *)(v3 + 484))
    {
      v45.origin.x = 0.0;
      v45.origin.y = 0.0;
      __asm { FMOV            V0.2D, #1.0 }
      v45.size = _Q0;
      if (FigCFDictionaryGetCGRectIfPresent())
      {
        v51.origin.x = 0.0;
        v51.origin.y = 0.0;
        v51.size.width = 1.0;
        v51.size.height = 1.0;
        v31 = !CGRectEqualToRect(v45, v51);
      }
      else
      {
        v31 = 0;
      }
      v33 = (void *)objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D069A0]);
      result = objc_msgSend(v33, "count");
      if (result)
      {
        v12 = *MEMORY[0x1E0D06478];
        v49[0] = *MEMORY[0x1E0D064A0];
        v49[1] = v12;
        v49[2] = *MEMORY[0x1E0D06488];
        v41 = 0u;
        v42 = 0u;
        v43 = 0u;
        v44 = 0u;
        obj = (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 3);
        result = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v48, 16);
        if (result)
        {
          v13 = result;
          v27 = v3;
          v14 = 0;
          v15 = *(_QWORD *)v42;
          v30 = *MEMORY[0x1E0D064D0];
          v28 = *MEMORY[0x1E0D06F20];
          v32 = -1;
          do
          {
            v16 = 0;
            do
            {
              if (*(_QWORD *)v42 != v15)
                objc_enumerationMutation(obj);
              v17 = (void *)objc_msgSend(v33, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * v16));
              if (v17)
              {
                v18 = v17;
                v19 = (void *)objc_msgSend(v17, "objectForKeyedSubscript:", v30);
                v20 = v19;
                if (v31)
                {
                  v39 = 0u;
                  v40 = 0u;
                  v37 = 0u;
                  v38 = 0u;
                  v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
                  if (v21)
                  {
                    v22 = v21;
                    v23 = *(_QWORD *)v38;
                    do
                    {
                      for (i = 0; i != v22; ++i)
                      {
                        if (*(_QWORD *)v38 != v23)
                          objc_enumerationMutation(v20);
                        memset(&v36, 0, sizeof(v36));
                        if (FigCFDictionaryGetCGRectIfPresent())
                        {
                          v50 = CGRectIntersection(v36, v45);
                          if (v50.size.width * v50.size.height <= v36.size.width * v36.size.height * 0.5)
                            v14 = v14;
                          else
                            v14 = (v14 + 1);
                        }
                      }
                      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
                    }
                    while (v22);
                  }
                }
                else
                {
                  v14 = v14 + objc_msgSend(v19, "count");
                }
                if (v32 < 0)
                  v32 = objc_msgSend((id)objc_msgSend(v18, "objectForKeyedSubscript:", v28), "longLongValue");
              }
              ++v16;
            }
            while (v16 != v13);
            result = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v48, 16);
            v13 = result;
          }
          while (result);
          if ((int)v14 >= 1 && (v32 & 0x8000000000000000) == 0)
          {
            memset(&v36, 0, 24);
            v25 = FigHostTimeToNanoseconds();
            CMTimeMake((CMTime *)&v36, v25, 1000000000);
            v26 = *(void **)(v27 + 496);
            origin = v36.origin;
            width = v36.size.width;
            return objc_msgSend(v26, "processCountOfVisibleVitalityObjects:forHostTime:", v14, &origin);
          }
        }
      }
    }
  }
  return result;
}

- (CMTime)_hostPTSForSampleBuffer:(uint64_t)a3@<X8>
{
  uint64_t v5;
  uint64_t v6;
  const __CFDictionary *v7;
  CMTimeEpoch epoch;
  const void *v9;
  CMClockRef HostTimeClock;
  CMTime v11;
  CMTime v12;
  CMTime v13;

  if (result)
  {
    v5 = (uint64_t)result;
    v6 = MEMORY[0x1E0CA2E18];
    *(_OWORD *)a3 = *MEMORY[0x1E0CA2E18];
    *(_QWORD *)(a3 + 16) = *(_QWORD *)(v6 + 16);
    v7 = (const __CFDictionary *)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E0D05D00], 0);
    if (v7)
    {
      result = CMTimeMakeFromDictionary(&v13, v7);
      *(_OWORD *)a3 = *(_OWORD *)&v13.value;
      epoch = v13.epoch;
    }
    else
    {
      memset(&v13, 0, sizeof(v13));
      CMSampleBufferGetPresentationTimeStamp(&v13, (CMSampleBufferRef)target);
      v9 = *(const void **)(v5 + 472);
      HostTimeClock = CMClockGetHostTimeClock();
      v11 = v13;
      result = CMSyncConvertTime(&v12, &v11, v9, HostTimeClock);
      *(_OWORD *)a3 = *(_OWORD *)&v12.value;
      epoch = v12.epoch;
    }
    *(_QWORD *)(a3 + 16) = epoch;
  }
  else
  {
    *(_QWORD *)a3 = 0;
    *(_QWORD *)(a3 + 8) = 0;
    *(_QWORD *)(a3 + 16) = 0;
  }
  return result;
}

- (uint64_t)_updateRetainedBufferCount
{
  uint64_t v1;
  void *v2;
  void *v3;
  double Seconds;
  double v5;
  int *v6;
  int v7;
  uint64_t v8;
  void *v9;
  int v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  uint64_t v15;
  double v16;
  uint64_t v17;
  double v18;
  uint64_t v19;
  void *v20;
  void *v21;
  int v22;
  double v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  CMTime time2;
  CMTime time1;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    v2 = (void *)objc_msgSend((id)result, "inputs");
    result = objc_msgSend(v2, "count");
    if (result)
    {
      if ((*(_BYTE *)(v1 + 108) & 1) != 0 && (*(_BYTE *)(v1 + 132) & 1) != 0)
      {
        time1 = *(CMTime *)(v1 + 120);
        time2 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
        result = CMTimeCompare(&time1, &time2);
        if ((int)result >= 1)
        {
          v3 = (void *)objc_msgSend(v2, "objectAtIndexedSubscript:", 0);
          time1 = *(CMTime *)(v1 + 96);
          Seconds = CMTimeGetSeconds(&time1);
          time1 = *(CMTime *)(v1 + 120);
          v5 = ceil(Seconds / CMTimeGetSeconds(&time1)) + 1.0 + 3.0;
          v6 = (int *)(int)(v5
                                        + (double)(int)objc_msgSend(*(id *)(v1 + 552), "audioOffsetForOriginalStillImageTimeMaximumFrameLatency"));
          v7 = objc_msgSend(*(id *)(v1 + 552), "audioOffsetForOriginalStillImageTimeMaximumFrameLatency");
          v8 = ((7 - *(_DWORD *)(v1 + 608) - v7) & ~((7 - *(_DWORD *)(v1 + 608) - v7) >> 31)) + v6;
          if (*(_DWORD *)(v1 + 576))
          {
            v6 = &OBJC_IVAR___BWQuickTimeMovieFileSinkNode__stereoVideoCaptureDuration;
            v9 = *(void **)(v1 + 568);
            if (v9)
            {

              *(_QWORD *)(v1 + 568) = 0;
            }
            v10 = (int)((double)(int)v8 * 1.5);
            *(_QWORD *)(v1 + 568) = -[BWMotionDataTimeMachine initWithCapacity:synchronizedSlaveMotionDataCachingEnabled:cacheEntireMetadataDictionary:]([BWMotionDataTimeMachine alloc], "initWithCapacity:synchronizedSlaveMotionDataCachingEnabled:cacheEntireMetadataDictionary:", v10, *(_DWORD *)(v1 + 576) == 2, 0);
            v11 = (double)v10;
          }
          else
          {
            v11 = 0.0;
          }
          if (*(_BYTE *)(v1 + 640))
          {
            objc_msgSend(v3, "setRetainedBufferCount:", 0);
            objc_msgSend(v3, "setDelayedBufferCount:", 0);
            *(_DWORD *)(v1 + 612) = v8;
          }
          else
          {
            objc_msgSend(v3, "setDelayedBufferCount:", v8);
          }
          v12 = BWSmartStyleLearningMaxFrameRate();
          time1 = *(CMTime *)(v1 + 120);
          v13 = CMTimeGetSeconds(&time1);
          v24 = 0u;
          v25 = 0u;
          v26 = 0u;
          v27 = 0u;
          v14 = (void *)objc_msgSend(v3, "specifiedAttachedMediaKeys", 0);
          result = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
          if (result)
          {
            v15 = result;
            v16 = v12 / (1.0 / v13);
            v17 = *(_QWORD *)v25;
            LODWORD(v6) = vcvtpd_s64_f64(v16 * (double)(int)v8);
            v18 = ceil(v11 * v16);
            do
            {
              v19 = 0;
              do
              {
                if (*(_QWORD *)v25 != v17)
                  objc_enumerationMutation(v14);
                v20 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v19);
                v21 = (void *)objc_msgSend(v3, "mediaConfigurationForAttachedMediaKey:", v20);
                objc_msgSend(v21, "setDelayedBufferCount:", v8);
                if (objc_msgSend((id)BWAttachedMediaKeysAvailableOnSmartStyleLearnedFramesOnly(), "containsObject:", v20))objc_msgSend(v21, "setDelayedBufferCount:", v6);
                if (objc_msgSend(v20, "isEqualToString:", 0x1E495B358))
                {
                  v22 = objc_msgSend(v21, "delayedBufferCount");
                  v23 = v18;
                  if (v18 < (double)v22)
                    v23 = (double)(int)objc_msgSend(v21, "delayedBufferCount", v18);
                  objc_msgSend(v21, "setDelayedBufferCount:", (int)v23);
                }
                ++v19;
              }
              while (v15 != v19);
              result = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
              v15 = result;
            }
            while (result);
          }
        }
      }
    }
  }
  return result;
}

- (BWMotionDataTimeMachine)motionDataTimeMachine
{
  return (BWMotionDataTimeMachine *)self->_sequenceAdjuster;
}

- (void)setVitalityScoringSmartCameraPipelineVersion:(id)a3
{
  HIWORD(self->_trimMethod) = a3.var2;
  *(_DWORD *)((char *)&self->_masterClock + 6) = *(_DWORD *)&a3.var0;
}

- (void)setTargetFrameDuration:(id *)a3
{
  int64_t var3;

  var3 = a3->var3;
  *(_OWORD *)&self->_targetFrameDuration.value = *(_OWORD *)&a3->var0;
  self->_targetFrameDuration.epoch = var3;
  -[BWIrisStagingNode _updateRetainedBufferCount]((uint64_t)self);
}

- (void)setMasterClock:(OpaqueCMClock *)a3
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *firstEmittedPTSArray;

  firstEmittedPTSArray = self->_firstEmittedPTSArray;
  self->_firstEmittedPTSArray = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)a3;
  if (a3)
    CFRetain(a3);
  if (firstEmittedPTSArray)
    CFRelease(firstEmittedPTSArray);
}

- (void)setIntermediateJPEGDownstreamRetainedBufferCount:(int)a3
{
  LODWORD(self->_intermediateJPEGCompressionQuality) = a3;
  -[BWIrisStagingNode _updateRetainedBufferCount]((uint64_t)self);
}

- (void)setBufferingTime:(id *)a3
{
  int64_t var3;

  var3 = a3->var3;
  *(_OWORD *)&self->_bufferingTime.value = *(_OWORD *)&a3->var0;
  self->_bufferingTime.epoch = var3;
  -[BWIrisStagingNode _updateRetainedBufferCount]((uint64_t)self);
}

- (void)setApplyPreviewShift:(BOOL)a3
{
  LOBYTE(self->_subjectRelightingResult) = a3;
}

- (void)_signalReadyToReceiveRequestsWithEarliestAllowedStillHostPTS:(uint64_t)a1
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  CMTime time;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    *(_BYTE *)(a1 + 666) = 1;
    if (dword_1ECFE94F0)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    v5 = *(void **)(a1 + 584);
    time = *a2;
    objc_msgSend(v5, "stagingNode:readyToReceiveRequestsWithEarliestAllowedStillImageCaptureHostPTS:", a1, &time, v7, v8);
    v6 = *(NSObject **)(a1 + 672);
    if (v6)
    {
      dispatch_group_leave(v6);

      *(_QWORD *)(a1 + 672) = 0;
    }
  }
}

- (void)prepareForCurrentConfigurationToBecomeLive
{
  void *v3;
  OpaqueCMClock *HostTimeClock;
  CMTime v5;
  CMTime v6;
  CMTime bufferingTime;
  CMTime time;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)BWIrisStagingNode;
  -[BWNode prepareForCurrentConfigurationToBecomeLive](&v9, sel_prepareForCurrentConfigurationToBecomeLive);
  pthread_mutex_lock(*(pthread_mutex_t **)&self->_emittedIrisRequestCount);
  HIDWORD(self->_motionDataTimeMachine) = 0;
  BYTE1(self->_subjectRelightingResult) = 0;
  if (SLODWORD(self->_masterClock) > 0 || BYTE4(self->_masterClock))
  {
    *(_QWORD *)&self->_vitalityScoringSmartCameraPipelineVersion.minor = objc_alloc_init(FigIrisAutoTrimmer);
    CMTimeMake(&time, self->_targetFrameDuration.timescale, self->_targetFrameDuration.value);
    objc_msgSend(*(id *)&self->_vitalityScoringSmartCameraPipelineVersion.minor, "setVideoFrameRate:", CMTimeGetSeconds(&time));
    bufferingTime = (CMTime)self->_bufferingTime;
    objc_msgSend(*(id *)&self->_vitalityScoringSmartCameraPipelineVersion.minor, "setBufferHistorySeconds:", CMTimeGetSeconds(&bufferingTime) * 2.0 + 0.5);
    bufferingTime = (CMTime)self->_bufferingTime;
    CMTimeMultiplyByRatio(&v6, &bufferingTime, 1, 2);
    v3 = *(void **)&self->_vitalityScoringSmartCameraPipelineVersion.minor;
    v5 = v6;
    objc_msgSend(v3, "setMaxHoldDuration:", &v5);
    objc_msgSend(*(id *)&self->_vitalityScoringSmartCameraPipelineVersion.minor, "setVitalityScoringEnabled:", BYTE4(self->_masterClock));
    if (BYTE4(self->_masterClock))
      objc_msgSend(*(id *)&self->_vitalityScoringSmartCameraPipelineVersion.minor, "setVitalityScoringSmartCameraPipelineVersion:", HIWORD(self->_masterClock) | ((unint64_t)self->_trimMethod << 16));
    objc_msgSend(*(id *)&self->_vitalityScoringSmartCameraPipelineVersion.minor, "startMotionProcessing");
  }
  if (!self->_stagingSuspended)
  {
    HostTimeClock = CMClockGetHostTimeClock();
    CMClockGetTime(&bufferingTime, HostTimeClock);
    *(CMTime *)(&self->_flushAndSuspendPending + 3) = bufferingTime;
  }
  LODWORD(self->_limitedGMErrorLogger) = 0;
  pthread_mutex_unlock(*(pthread_mutex_t **)&self->_emittedIrisRequestCount);
}

- (void)didSelectFormat:(id)a3 forInput:(id)a4 forAttachedMediaKey:(id)a5
{
  id v9;
  _BOOL4 v10;
  __CFString *v11;
  uint64_t v12;
  BWNodeOutputMediaProperties *v13;
  BWVideoFormatRequirements *v14;
  CMVideoDimensions Dimensions;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a4, "index") != *(_QWORD *)&self->_trimLivePhotoMovieAtWideAndSuperWideAutoSwitching)
  {
    v9 = -[NSArray objectAtIndexedSubscript:](-[BWNode outputs](self, "outputs"), "objectAtIndexedSubscript:", objc_msgSend(a4, "index"));
    v10 = objc_msgSend(a4, "mediaType") == 1986618469
       && LOBYTE(self->_synchronizedSlaveJPEGCompressor) != 0;
    v11 = (__CFString *)a5;
    if (BYTE4(self->_stagingResumedTime.epoch))
    {
      if (objc_msgSend(a5, "isEqualToString:", CFSTR("SynchronizedSlaveFrame")))
        v11 = CFSTR("CompressedSynchronizedSlaveFrame");
      else
        v11 = (__CFString *)a5;
    }
    if (!-[__CFString isEqualToString:](v11, "isEqualToString:", CFSTR("SynchronizedSlaveFrame"))
      || objc_msgSend((id)objc_msgSend(a4, "mediaConfigurationForAttachedMediaKey:", a5), "passthroughMode"))
    {
      v12 = objc_msgSend(v9, "mediaPropertiesForAttachedMediaKey:", v11);
      if (v12)
      {
        v13 = (BWNodeOutputMediaProperties *)v12;
        if ((-[__CFString isEqualToString:](v11, "isEqualToString:", CFSTR("PrimaryFormat")) & 1) == 0)
        {
          v18 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ output %@ unexpectedly has mediaPropertiesForAttachedMediaKey %@ (provided media key was %@)"), self, v9, v11, a5);
          objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v18, 0));
        }
        if (!v10)
          goto LABEL_24;
      }
      else
      {
        v13 = objc_alloc_init(BWNodeOutputMediaProperties);
        objc_msgSend(v9, "_setMediaProperties:forAttachedMediaKey:", v13, v11);
        if (!v10)
          goto LABEL_24;
      }
      if ((-[__CFString isEqualToString:](v11, "isEqualToString:", CFSTR("PrimaryFormat")) & 1) != 0
        || -[__CFString isEqualToString:](v11, "isEqualToString:", 0x1E495AE38))
      {
        v14 = objc_alloc_init(BWVideoFormatRequirements);
        Dimensions = CMVideoFormatDescriptionGetDimensions((CMVideoFormatDescriptionRef)objc_msgSend(a3, "formatDescription"));
        -[BWVideoFormatRequirements setWidth:](v14, "setWidth:", Dimensions.width);
        -[BWVideoFormatRequirements setHeight:](v14, "setHeight:", *(uint64_t *)&Dimensions >> 32);
        v16 = FigCaptureEncodedByteStreamFormatForPixelFormat(objc_msgSend(a3, "pixelFormat"));
        if (v16)
        {
          v20[0] = v16;
          -[BWVideoFormatRequirements setSupportedPixelFormats:](v14, "setSupportedPixelFormats:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1));
        }
        if (objc_msgSend(a3, "colorSpaceProperties"))
        {
          v19 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(a3, "colorSpaceProperties"));
          -[BWVideoFormatRequirements setSupportedColorSpaceProperties:](v14, "setSupportedColorSpaceProperties:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v19, 1));
        }
        v17 = (void *)objc_msgSend(v9, "mediaConfigurationForAttachedMediaKey:", v11);
        objc_msgSend(v17, "setFormatRequirements:", v14);
        objc_msgSend(v17, "setProvidesPixelBufferPool:", 0);

        return;
      }
LABEL_24:
      -[BWNodeOutputMediaProperties setResolvedFormat:](v13, "setResolvedFormat:", a3);
    }
  }
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  unsigned int v10;
  unsigned int v11;
  Float64 Seconds;
  OpaqueCMClock *HostTimeClock;
  int limitedGMErrorLogger;
  BWSubjectRelightingCalculator *v15;
  OpaqueCMClock *v16;
  double v17;
  BWStats *overallVideoFrameReceptionStats;
  void *v19;
  opaqueCMSampleBuffer *v20;
  void *v21;
  BWStats *v22;
  void *v23;
  void *v24;
  float videoStabilizationOverscanOverride;
  float v26;
  void *AttachedMedia;
  void *v28;
  float v29;
  float v30;
  void *v31;
  float v32;
  float v33;
  float v34;
  void *v35;
  CFTypeRef v36;
  void *v37;
  float v38;
  uint64_t v39;
  CFTypeRef v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t i;
  void *v48;
  const void *v49;
  const void *v50;
  void *v51;
  CGSize v57;
  CGPoint v58;
  float v59;
  const __CFDictionary *v60;
  __int128 v61;
  float64x2_t v63;
  float64x2_t v64;
  float64x2_t v65;
  float v66;
  uint64_t v67;
  opaqueCMSampleBuffer *v68;
  opaqueCMSampleBuffer *v69;
  const __CFString *v70;
  void *v71;
  __CVBuffer *ImageBuffer;
  double Width;
  double Height;
  double v75;
  double v76;
  double v77;
  double v78;
  __CVBuffer *v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  float v85;
  double v86;
  float v87;
  float v88;
  CGFloat v89;
  float v90;
  CGFloat v91;
  float v92;
  CGFloat v93;
  float v94;
  double v95;
  CMTimeFlags flags;
  CMTimeEpoch epoch;
  int64_t v98;
  uint64_t v99;
  NSObject *v100;
  unsigned int x_low;
  unsigned int v102;
  Float64 v103;
  Float64 v104;
  Float64 v105;
  opaqueCMSampleBuffer *v106;
  int64_t *p_epoch;
  uint64_t v108;
  NSObject *v109;
  unsigned int v110;
  unsigned int v111;
  Float64 v112;
  BOOL *p_compressSynchronizedSlaveAttachedMedia;
  int32_t v114;
  int32_t value;
  _DWORD *v116;
  uint64_t v117;
  int v118;
  uint64_t v119;
  opaqueCMSampleBuffer *v120;
  BWIntermediateJPEGCompressor *intermediateJPEGCompressor;
  BWIntermediateJPEGCompressor *v122;
  double v123;
  double v124;
  opaqueCMSampleBuffer *v125;
  BWStats *valveActiveVideoFrameReceptionStats;
  void *v127;
  BWIntermediateJPEGCompressor *v128;
  BWIntermediateJPEGCompressor *v129;
  double v130;
  double v131;
  opaqueCMSampleBuffer *v132;
  BWStats *v133;
  void *v134;
  Float64 v135;
  void *v136;
  BWIrisSequenceAdjuster *sequenceAdjuster;
  uint64_t v138;
  const __CFString *v139;
  void *v140;
  uint64_t v141;
  uint64_t v142;
  const void *v143;
  const __CFDictionary *v144;
  uint64_t v145;
  int v146;
  BWMotionDataPreserver *motionDataPreserver;
  _BYTE *v148;
  _BYTE *v149;
  uint64_t v150;
  uint64_t v151;
  const __CFString *v152;
  CMTimeFlags v153;
  uint64_t v154;
  CGFloat v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  CMTime v159;
  CMTime v160;
  CMTime v161;
  CMTime time1;
  CMTime v163;
  CMTime v164;
  CMTime time2;
  os_log_type_t v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  CMTime v171;
  CMTime v172;
  CMTime v173;
  CMTime v174;
  CMTime v175;
  CMTime v176;
  CMSampleBufferRef v177;
  CMSampleBufferRef v178;
  CMSampleBufferRef sampleBufferOut;
  CGRect type;
  _BYTE lhs[32];
  _BYTE rhs[32];
  __int16 v183;
  Float64 v184;
  _BYTE v185[128];
  CMTime time[5];
  CGFloat v187;
  CMTimeScale timescale;
  uint64_t v189;
  CGRect v190;
  CGRect v191;
  CGRect v192;
  CGRect v193;
  CGRect v194;
  CGRect v195;

  v189 = *MEMORY[0x1E0C80C00];
  v7 = objc_msgSend(a4, "index");
  v8 = *(_QWORD *)&self->_trimLivePhotoMovieAtWideAndSuperWideAutoSwitching;
  if (v7 == v8)
    v158 = 0;
  else
    v158 = -[NSURL objectAtIndexedSubscript:](self->_spatialOverCaptureMasterMovieURL, "objectAtIndexedSubscript:", v7);
  v178 = 0;
  sampleBufferOut = 0;
  v187 = *MEMORY[0x1E0CA2E18];
  timescale = *(_DWORD *)(MEMORY[0x1E0CA2E18] + 8);
  memset(&v176, 0, sizeof(v176));
  v177 = 0;
  CMSampleBufferGetPresentationTimeStamp(&v176, a3);
  pthread_mutex_lock(*(pthread_mutex_t **)&self->_emittedIrisRequestCount);
  if (objc_msgSend(a4, "mediaType") == 1936684398)
  {
    if (!LOBYTE(self->_emissionMap))
    {
      if (dword_1ECFE94F0)
      {
        v156 = v7;
        *(_DWORD *)lhs = 0;
        LOBYTE(type.origin.x) = 0;
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        v10 = *(_DWORD *)lhs;
        if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, LOBYTE(type.origin.x)))
          v11 = v10;
        else
          v11 = v10 & 0xFFFFFFFE;
        if (v11)
        {
          time[0] = v176;
          Seconds = CMTimeGetSeconds(time);
          *(_DWORD *)rhs = 136315650;
          *(_QWORD *)&rhs[4] = "-[BWIrisStagingNode renderSampleBuffer:forInput:]";
          *(_WORD *)&rhs[12] = 2048;
          *(_QWORD *)&rhs[14] = self;
          *(_WORD *)&rhs[22] = 2048;
          *(Float64 *)&rhs[24] = Seconds;
          LODWORD(v150) = 32;
          v148 = rhs;
          _os_log_send_and_compose_impl();
        }
        fig_log_call_emit_and_clean_up_after_send_and_compose();
        v7 = v156;
      }
      LOBYTE(self->_emissionMap) = 1;
    }
  }
  else if (!v7)
  {
    if (self->_stagingSuspended && !BYTE2(self->_emissionMap))
    {
      memset(time, 0, 24);
      HostTimeClock = CMClockGetHostTimeClock();
      CMClockGetTime(time, HostTimeClock);
      *(CMTime *)rhs = time[0];
      -[BWIrisStagingNode _signalReadyToReceiveRequestsWithEarliestAllowedStillHostPTS:]((uint64_t)self, (CMTime *)rhs);
    }
    if (BYTE4(self->_limitedGMErrorLogger))
    {
      if (!*(_QWORD *)&self->_numberOfVideoFramesReceived)
      {
        limitedGMErrorLogger = (int)self->_limitedGMErrorLogger;
        LODWORD(self->_limitedGMErrorLogger) = limitedGMErrorLogger + 1;
        if (limitedGMErrorLogger >= 2)
        {
          if (LOBYTE(self->_emissionMap))
          {
            v15 = objc_alloc_init(BWSubjectRelightingCalculator);
            *(_QWORD *)&self->_numberOfVideoFramesReceived = v15;
            -[BWSubjectRelightingCalculator prepareForVideoFormatAsync:](v15, "prepareForVideoFormatAsync:", objc_msgSend(a4, "videoFormat"));
          }
        }
      }
    }
  }
  if (self->_stagingSuspended)
    goto LABEL_157;
  if (v7)
  {
    if (v7 == v8)
    {
      -[BWIrisStagingNode _feedTrimmerWithInferencesSampleBuffer:]((uint64_t)self, a3);
LABEL_157:
      v20 = 0;
      goto LABEL_193;
    }
    v20 = 0;
    v21 = (void *)v158;
    goto LABEL_184;
  }
  memset(&v175, 0, sizeof(v175));
  v16 = CMClockGetHostTimeClock();
  CMClockGetTime(&v175, v16);
  if (self->_lastReceivedVideoTime.epoch)
  {
    time[0] = v175;
    *(_OWORD *)rhs = *(_OWORD *)((char *)&self->_recommendedMasterPortType + 4);
    *(_QWORD *)&rhs[16] = *(int64_t *)((char *)&self->_lastReceivedVideoTime.value + 4);
    CMTimeSubtract(&v174, time, (CMTime *)rhs);
    v17 = CMTimeGetSeconds(&v174);
    objc_msgSend((id)self->_lastReceivedVideoTime.epoch, "addDataPoint:");
    overallVideoFrameReceptionStats = self->_overallVideoFrameReceptionStats;
    v19 = (void *)v158;
    if (overallVideoFrameReceptionStats)
      -[BWStats addDataPoint:](overallVideoFrameReceptionStats, "addDataPoint:", v17);
  }
  else
  {
    v22 = objc_alloc_init(BWStats);
    self->_lastReceivedVideoTime.epoch = (int64_t)v22;
    -[BWStats setMultiplier:](v22, "setMultiplier:", 1000.0);
    objc_msgSend((id)self->_lastReceivedVideoTime.epoch, "setUnitDesignator:", CFSTR("ms"));
    v19 = (void *)v158;
  }
  *(CMTime *)((char *)&self->_recommendedMasterPortType + 4) = v175;
  memset(&v173, 0, sizeof(v173));
  if ((self->_frameGovernorReferenceTime.value & 0x100000000) != 0)
  {
    time[0] = v176;
    *(_OWORD *)rhs = *(_OWORD *)&self->_frameGovernorNextFrameThreshold.epoch;
    *(_QWORD *)&rhs[16] = *(_QWORD *)&self->_frameGovernorReferenceTime.timescale;
    CMTimeSubtract(&v173, time, (CMTime *)rhs);
  }
  else
  {
    v173 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
  }
  memset(&v172, 0, sizeof(v172));
  if (objc_msgSend(v19, "count", v148, v150))
  {
    CMSampleBufferGetPresentationTimeStamp(&v171, (CMSampleBufferRef)objc_msgSend(v19, "lastObject"));
    time[0] = v176;
    CMTimeSubtract(&v172, time, &v171);
  }
  else
  {
    v172 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
  }
  v23 = (void *)CMGetAttachment(a3, CFSTR("LastRecommendedMasterSelectionReason"), 0);
  v24 = v23;
  if (v23)
    LODWORD(self->_recommendedMasterPortType) = objc_msgSend(v23, "intValue");
  if (BYTE4(self->_readyToReceiveRequestsGroup))
  {
    videoStabilizationOverscanOverride = self->_videoStabilizationOverscanOverride;
    v26 = *(float *)&self->_readyToReceiveRequestsGroup;
    AttachedMedia = (void *)BWSampleBufferGetAttachedMedia(a3, (uint64_t)CFSTR("SynchronizedSlaveFrame"));
    if (AttachedMedia)
    {
      v28 = AttachedMedia;
      v29 = 1.0;
      v30 = ((float)(v26 + 1.0) + 0.2) * (float)(videoStabilizationOverscanOverride + 1.0);
      v31 = (void *)CMGetAttachment(AttachedMedia, CFSTR("TotalZoomFactor"), 0);
      v32 = 1.0;
      if (v31)
      {
        objc_msgSend(v31, "floatValue");
        v32 = v33;
      }
      v34 = -[BWIrisStagingNode _appliedZoomFromSampleBuffer:]((uint64_t)self, a3);
      if ((float)(v32 / v30) >= 1.0)
        v29 = v32 / v30;
      v152 = (const __CFString *)*MEMORY[0x1E0D05CB0];
      v35 = (void *)objc_msgSend((id)CMGetAttachment(v28, (CFStringRef)*MEMORY[0x1E0D05CB0], 0), "objectForKeyedSubscript:", *MEMORY[0x1E0D06D00]);
      v36 = CMGetAttachment(a3, CFSTR("RecommendedMasterPortType"), 0);
      if (v36)
      {
        v37 = (void *)v36;
      }
      else
      {
        v40 = CMGetAttachment(v28, CFSTR("RecommendedMasterPortType"), 0);
        if (v40)
          v37 = (void *)v40;
        else
          v37 = *(void **)&self->_spatialOverCapturePercentageToApply;
      }
      v41 = *(void **)&self->_spatialOverCapturePercentageToApply;
      if (v37 != v41)
      {

        *(_QWORD *)&self->_spatialOverCapturePercentageToApply = v37;
      }
      if (v24 || (v24 = (void *)CMGetAttachment(v28, CFSTR("LastRecommendedMasterSelectionReason"), 0)) != 0)
        LODWORD(self->_recommendedMasterPortType) = objc_msgSend(v24, "intValue");
      if (v32 < v34
        || objc_msgSend(v35, "isEqualToString:", *MEMORY[0x1E0D05A18])
        && (objc_msgSend(v37, "isEqualToString:", v35) & 1) != 0
        || objc_msgSend(v35, "isEqualToString:", *MEMORY[0x1E0D05A28])
        && objc_msgSend(v37, "isEqualToString:", v35)
        && (LODWORD(self->_recommendedMasterPortType) - 1) <= 1)
      {
        BWCMSampleBufferCreateCopyIncludingMetadata((CMSampleBufferRef)v28, &sampleBufferOut);
        if (!sampleBufferOut)
          goto LABEL_212;
        v42 = (void *)objc_msgSend((id)CMGetAttachment(a3, CFSTR("AttachedMedia"), 0), "mutableCopy");
        if (BYTE2(self->_subjectRelightingResult))
        {
          v169 = 0u;
          v170 = 0u;
          v167 = 0u;
          v168 = 0u;
          v43 = BWAttachedMediaKeysRequiredBySmartStyleRenderingPipelines(1, 1);
          v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v167, v185, 16);
          if (v44)
          {
            v45 = v44;
            v46 = *(_QWORD *)v168;
            do
            {
              for (i = 0; i != v45; ++i)
              {
                if (*(_QWORD *)v168 != v46)
                  objc_enumerationMutation(v43);
                objc_msgSend(v42, "setObject:forKeyedSubscript:", BWSampleBufferGetAttachedMedia(v28, *(_QWORD *)(*((_QWORD *)&v167 + 1) + 8 * i)), *(_QWORD *)(*((_QWORD *)&v167 + 1) + 8 * i));
              }
              v45 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v167, v185, 16);
            }
            while (v45);
          }
        }
        if (objc_msgSend(v42, "count"))
        {
          v48 = (void *)objc_msgSend(v42, "copy");
          CMSetAttachment(sampleBufferOut, CFSTR("AttachedMedia"), v48, 1u);

        }
        time[0].value = 0;
        BWCMSampleBufferCreateCopyIncludingMetadata((CMSampleBufferRef)v28, (CMSampleBufferRef *)time);
        v7 = 0;
        v39 = MEMORY[0x1E0CA2E18];
        if (!time[0].value)
          goto LABEL_212;
        BWSampleBufferRemoveAllAttachedMedia((const void *)time[0].value);
        BWSampleBufferSetAttachedMedia(sampleBufferOut, (uint64_t)CFSTR("SynchronizedSlaveFrame"), time[0].value);
        CFRelease((CFTypeRef)time[0].value);
        BWSampleBufferRemoveAllAttachedMedia(a3);
        a3 = sampleBufferOut;
        CMSampleBufferGetPresentationTimeStamp(time, sampleBufferOut);
        v176 = time[0];
      }
      else if (v29 >= v34)
      {
        BWCMSampleBufferCreateCopyIncludingMetadata(a3, &v178);
        v7 = 0;
        v39 = MEMORY[0x1E0CA2E18];
        if (!v178)
          goto LABEL_212;
        BWSampleBufferRemoveAllAttachedMedia(v178);
        BWSampleBufferPropagateAttachedMedia(v28, v178);
        BWSampleBufferSetAttachedMedia(a3, (uint64_t)CFSTR("SynchronizedSlaveFrame"), (uint64_t)v178);
      }
      else
      {
        v7 = 0;
        v39 = MEMORY[0x1E0CA2E18];
      }
      if (self->_videoStabilizationOverscanOverride > 0.0)
      {
        v49 = (const void *)BWSampleBufferGetAttachedMedia(a3, (uint64_t)CFSTR("SynchronizedSlaveFrame"));
        if (!v49)
          goto LABEL_212;
        v50 = v49;
        v51 = (void *)CMGetAttachment(v49, CFSTR("FinalCropRectScaleFactorAtBaseZoom"), 0);
        if (v51)
          objc_msgSend(v51, "floatValue");
        CMGetAttachment(v50, v152, 0);
        *(_OWORD *)&time[0].value = 0uLL;
        __asm { FMOV            V0.2D, #1.0 }
        *(_OWORD *)&time[0].epoch = _Q0;
        FigCFDictionaryGetCGRectIfPresent();
        v57 = *(CGSize *)&time[0].epoch;
        v58 = *(CGPoint *)&time[0].value;
        v190.origin = *(CGPoint *)&time[0].value;
        v190.size = *(CGSize *)&time[0].epoch;
        CGRectGetWidth(v190);
        v191.origin = v58;
        v191.size = v57;
        CGRectGetHeight(v191);
        v192.origin = v58;
        v192.size = v57;
        CGRectGetMidX(v192);
        v193.origin = v58;
        v193.size = v57;
        CGRectGetMidY(v193);
        FigCFDictionarySetCGRect();
        v59 = *(float *)&self->_readyToReceiveRequestsGroup;
        v7 = 0;
        if (v59 > 0.0)
          FigCaptureMetadataUtilitiesScaleFinalCropRectForPadding(v50, v59);
      }
      if (LOBYTE(self->_subjectRelightingResult))
      {
        v60 = (const __CFDictionary *)CMGetAttachment(a3, CFSTR("PreviewShift"), 0);
        if (v60)
        {
          *(_OWORD *)rhs = *MEMORY[0x1E0C9D538];
          CGPointMakeWithDictionaryRepresentation(v60, (CGPoint *)rhs);
          CMGetAttachment(a3, v152, 0);
          v61 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
          *(_OWORD *)&time[0].value = *MEMORY[0x1E0C9D648];
          *(_OWORD *)&time[0].epoch = v61;
          if (!FigCFDictionaryGetCGRectIfPresent())
            goto LABEL_212;
          __asm { FMOV            V0.2D, #1.0 }
          v63 = vsubq_f64(_Q0, *(float64x2_t *)&time[0].epoch);
          v64 = vaddq_f64(*(float64x2_t *)&time[0].value, *(float64x2_t *)rhs);
          v65 = (float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v64, v63), (int8x16_t)v63, (int8x16_t)v64);
          *(int8x16_t *)&time[0].value = vbicq_s8((int8x16_t)v65, (int8x16_t)vcltzq_f64(v65));
          FigCFDictionarySetCGRect();
          v7 = 0;
        }
      }
    }
    else
    {
      v39 = MEMORY[0x1E0CA2E18];
    }
    v66 = *(float *)&self->_readyToReceiveRequestsGroup;
    if (v66 > 0.0)
    {
      FigCaptureMetadataUtilitiesScaleFinalCropRectForPadding(a3, v66);
      if (self->_videoStabilizationOverscanOverride > 0.0)
      {
        v67 = v7;
        v68 = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(a3, (uint64_t)CFSTR("SynchronizedSlaveFrame"));
        if (v68)
        {
          v69 = v68;
          v70 = (const __CFString *)*MEMORY[0x1E0D05CB0];
          v71 = (void *)CMGetAttachment(v68, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
          if (objc_msgSend((id)objc_msgSend(v71, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D00]), "isEqualToString:", objc_msgSend((id)CMGetAttachment(a3, v70, 0), "objectForKeyedSubscript:", *MEMORY[0x1E0D06D00])))
          {
            memset(time, 0, 32);
            if (FigCFDictionaryGetCGRectIfPresent())
            {
              memset(rhs, 0, sizeof(rhs));
              if (FigCFDictionaryGetCGRectIfPresent())
              {
                ImageBuffer = CMSampleBufferGetImageBuffer(v69);
                Width = (double)CVPixelBufferGetWidth(ImageBuffer);
                Height = (double)CVPixelBufferGetHeight(ImageBuffer);
                memset(lhs, 0, sizeof(lhs));
                if (FigCFDictionaryGetCGRectIfPresent())
                {
                  v75 = *(double *)&lhs[24];
                  v76 = *(double *)&lhs[16];
                }
                else
                {
                  *(_OWORD *)lhs = 0uLL;
                  v75 = Height;
                  v76 = Width;
                  *(double *)&lhs[16] = Width;
                  *(double *)&lhs[24] = Height;
                }
                v77 = v76 / Width;
                v78 = v75 / Height;
                v79 = CMSampleBufferGetImageBuffer(a3);
                v80 = (double)CVPixelBufferGetWidth(v79);
                v81 = (double)CVPixelBufferGetHeight(v79);
                memset(&type, 0, sizeof(type));
                if (!FigCFDictionaryGetCGRectIfPresent())
                {
                  type.origin = 0uLL;
                  type.size.width = v80;
                  type.size.height = v81;
                }
                v82 = v77 / *(double *)&time[0].epoch + -1.0;
                v83 = v78 / *(double *)&time[1].value + -1.0;
                if (v82 >= INFINITY)
                  v84 = INFINITY;
                else
                  v84 = v82 + 1.0;
                v85 = *(double *)&rhs[16] * v84;
                if (v83 >= INFINITY)
                  v86 = INFINITY;
                else
                  v86 = v83 + 1.0;
                v87 = *(double *)&rhs[24] * v86;
                v88 = v80 * v85;
                v89 = (double)(int)FigCaptureFloorFloatToMultipleOf(4, v88);
                v90 = v81 * v87;
                v91 = (double)(int)FigCaptureFloorFloatToMultipleOf(4, v90);
                v92 = type.origin.x - (v89 - type.size.width) * 0.5;
                v93 = (double)(int)FigCaptureCeilFloatToMultipleOf(2, v92);
                v94 = type.origin.y - (v91 - type.size.height) * 0.5;
                v194.origin.y = (double)(int)FigCaptureCeilFloatToMultipleOf(2, v94);
                v194.origin.x = v93;
                v194.size.width = v89;
                v194.size.height = v91;
                v195 = CGRectIntersection(v194, type);
                if (!CGRectEqualToRect(v195, type))
                  FigCFDictionarySetCGRect();
                goto LABEL_112;
              }
              v151 = v154;
              LODWORD(v149) = 0;
            }
            else
            {
              v151 = v154;
              LODWORD(v149) = 0;
            }
            FigDebugAssert3();
          }
        }
LABEL_112:
        v7 = v67;
      }
    }
  }
  else
  {
    v38 = *(float *)&self->_readyToReceiveRequestsGroup;
    if (v38 > 0.0)
      FigCaptureMetadataUtilitiesScaleFinalCropRectForPadding(a3, v38);
    v39 = MEMORY[0x1E0CA2E18];
  }
  v95 = *(double *)(v39 + 16);
  if (objc_msgSend((id)CMGetAttachment(a3, CFSTR("IsHarvestedUltraHighResolutionStillFrame"), 0), "BOOLValue"))
  {
    CMTimeMake(time, 16, 1000);
    v187 = *(double *)&time[0].value;
    flags = time[0].flags;
    timescale = time[0].timescale;
    epoch = time[0].epoch;
    v98 = objc_msgSend((id)objc_msgSend((id)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05CB0], 0), "objectForKeyedSubscript:", *MEMORY[0x1E0D06AC0]), "integerValue");
    if (v98 >= 1)
    {
      CMTimeMake(time, v98, 1000000);
      v187 = *(double *)&time[0].value;
      flags = time[0].flags;
      timescale = time[0].timescale;
      epoch = time[0].epoch;
    }
    memset(lhs, 0, 24);
    time[0] = v176;
    *(CGFloat *)rhs = v187;
    *(_DWORD *)&rhs[8] = timescale;
    v153 = flags;
    *(_DWORD *)&rhs[12] = flags;
    *(_QWORD *)&rhs[16] = epoch;
    CMTimeAdd((CMTime *)lhs, time, (CMTime *)rhs);
    if (dword_1ECFE94F0)
    {
      v99 = v7;
      LODWORD(type.origin.x) = 0;
      v166 = OS_LOG_TYPE_DEFAULT;
      v100 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      x_low = LODWORD(type.origin.x);
      if (os_log_type_enabled(v100, OS_LOG_TYPE_DEFAULT))
        v102 = x_low;
      else
        v102 = x_low & 0xFFFFFFFE;
      if (v102)
      {
        time[0] = v176;
        v103 = CMTimeGetSeconds(time);
        time[0] = *(CMTime *)lhs;
        v104 = CMTimeGetSeconds(time);
        *(CGFloat *)&time[0].value = v187;
        *(_QWORD *)&time[0].timescale = __PAIR64__(flags, timescale);
        time[0].epoch = epoch;
        v105 = CMTimeGetSeconds(time);
        *(_DWORD *)rhs = 136315906;
        *(_QWORD *)&rhs[4] = "-[BWIrisStagingNode renderSampleBuffer:forInput:]";
        *(_WORD *)&rhs[12] = 2048;
        *(Float64 *)&rhs[14] = v103;
        *(_WORD *)&rhs[22] = 2048;
        *(Float64 *)&rhs[24] = v104;
        v183 = 2048;
        v184 = v105;
        LODWORD(v151) = 42;
        v149 = rhs;
        _os_log_send_and_compose_impl();
      }
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      v7 = v99;
      v39 = MEMORY[0x1E0CA2E18];
    }
    time[0] = *(CMTime *)lhs;
    *(_OWORD *)rhs = *(_OWORD *)v39;
    *(double *)&rhs[16] = v95;
    BWCMSampleBufferCreateCopyWithNewTimingIncludingMetadata(a3, time, (__int128 *)rhs, &v177);
    v106 = v177;
    if (v177)
    {
      v95 = *(double *)&epoch;
      p_epoch = &self->_frameGovernorNextFrameThreshold.epoch;
      goto LABEL_127;
    }
LABEL_212:
    FigDebugAssert3();
    goto LABEL_157;
  }
  v153 = *(_DWORD *)(v39 + 12);
  v106 = v177;
  p_epoch = &self->_frameGovernorNextFrameThreshold.epoch;
  if (v177)
  {
LABEL_127:
    BWSynchronizeSmartStyleAttachedMediaPTS(v106);
    a3 = v106;
  }
  if (*(_QWORD *)&self->_vitalityScoringSmartCameraPipelineVersion.minor)
    -[BWIrisStagingNode _feedTrimmerWithVideoSampleBuffer:]((uint64_t)self, a3);
  -[BWIrisStagingNode _findAndMarkCuttingBufferForVideoSbuf:]((uint64_t)self, a3);
  if (!LOBYTE(self->_emissionMap))
    goto LABEL_157;
  v155 = v95;
  if (!BYTE1(self->_emissionMap))
  {
    if (dword_1ECFE94F0)
    {
      v108 = v7;
      *(_DWORD *)lhs = 0;
      LOBYTE(type.origin.x) = 0;
      v109 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      v110 = *(_DWORD *)lhs;
      if (os_log_type_enabled(v109, LOBYTE(type.origin.x)))
        v111 = v110;
      else
        v111 = v110 & 0xFFFFFFFE;
      if (v111)
      {
        time[0] = v176;
        v112 = CMTimeGetSeconds(time);
        *(_DWORD *)rhs = 136315650;
        *(_QWORD *)&rhs[4] = "-[BWIrisStagingNode renderSampleBuffer:forInput:]";
        *(_WORD *)&rhs[12] = 2048;
        *(_QWORD *)&rhs[14] = self;
        *(_WORD *)&rhs[22] = 2048;
        *(Float64 *)&rhs[24] = v112;
        LODWORD(v151) = 32;
        v149 = rhs;
        _os_log_send_and_compose_impl();
      }
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      v7 = v108;
    }
    BYTE1(self->_emissionMap) = 1;
  }
  p_compressSynchronizedSlaveAttachedMedia = &self->_compressSynchronizedSlaveAttachedMedia;
  if ((self->_frameGovernorNextFrameThreshold.value & 0x100000000) != 0)
  {
    CMTimeMake(&v164, 5, 1000);
    *(_OWORD *)&time[0].value = *(_OWORD *)p_compressSynchronizedSlaveAttachedMedia;
    time[0].epoch = *(_QWORD *)&self->_frameGovernorNextFrameThreshold.timescale;
    CMTimeSubtract(&time2, time, &v164);
    time[0] = v173;
    if (CMTimeCompare(time, &time2) < 0)
    {
      objc_msgSend((id)self->_inferencesInputIndex, "preserveMotionDataForSoonToBeDroppedSampleBuffer:", a3);
      goto LABEL_157;
    }
  }
  if ((*((_BYTE *)p_epoch + 12) & 1) == 0)
    goto LABEL_144;
  time[0] = (CMTime)self->_targetFrameDuration;
  CMTimeMultiply(&v163, time, 2);
  time[0] = v172;
  if (CMTimeCompare(time, &v163) > 0
    || (time[0] = v173,
        *(_OWORD *)rhs = *(_OWORD *)p_compressSynchronizedSlaveAttachedMedia,
        *(_QWORD *)&rhs[16] = *(_QWORD *)&self->_frameGovernorNextFrameThreshold.timescale,
        CMTimeSubtract(&time1, time, (CMTime *)rhs),
        CMTimeMake(&v161, 5, 1000),
        CMTimeCompare(&time1, &v161) < 0))
  {
LABEL_144:
    *(CMTime *)p_epoch = v176;
    v173 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
  }
  memset(time, 0, 24);
  v114 = self->_targetFrameDuration.timescale;
  value = self->_targetFrameDuration.value;
  *(CMTime *)rhs = v173;
  CMTimeMultiplyByRatio(time, (CMTime *)rhs, v114, value);
  *(_OWORD *)lhs = *(_OWORD *)&self->_targetFrameDuration.value;
  *(_QWORD *)&lhs[16] = self->_targetFrameDuration.epoch;
  CMTimeMultiply((CMTime *)rhs, (CMTime *)lhs, time[0].value / time[0].timescale + 1);
  *(_QWORD *)&self->_frameGovernorNextFrameThreshold.timescale = *(_QWORD *)&rhs[16];
  *(_OWORD *)p_compressSynchronizedSlaveAttachedMedia = *(_OWORD *)rhs;
  v116 = (_DWORD *)MEMORY[0x1E0CA1FC0];
  if (*MEMORY[0x1E0CA1FC0] == 1)
  {
    time[0] = v176;
    CMTimeGetSeconds(time);
    kdebug_trace();
  }
  objc_msgSend((id)self->_inferencesInputIndex, "prependPreservedMotionDataToSampleBuffer:", a3, v149, v151);
  if (!LOBYTE(self->_synchronizedSlaveJPEGCompressor))
  {
    v20 = 0;
    goto LABEL_170;
  }
  v117 = v7;
  v118 = LODWORD(self->_intermediateJPEGCompressionQuality) + LODWORD(self->_intermediateJPEGCompressionRate);
  v119 = BWSampleBufferGetAttachedMedia(a3, (uint64_t)CFSTR("SynchronizedSlaveFrame"));
  if (v119)
  {
    if (self->_videoStabilizationOverscanOverride <= 0.0)
    {
      if (!BYTE4(self->_readyToReceiveRequestsGroup))
        -[BWStats logErrorNumber:errorString:](self->_valveActiveVideoFrameReceptionStats, "logErrorNumber:errorString:", 0xFFFFFFFFLL, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Primary media contains unexpected SynchronizedSlaveFrame.")));
      v125 = 0;
    }
    else
    {
      v120 = (opaqueCMSampleBuffer *)v119;
      intermediateJPEGCompressor = self->_intermediateJPEGCompressor;
      if (!intermediateJPEGCompressor)
      {
        v122 = [BWIntermediateJPEGCompressor alloc];
        LODWORD(v123) = self->_compressedBufferPoolAllocationTimeoutMS;
        LODWORD(v124) = HIDWORD(self->_compressedBufferPoolAllocationTimeoutMS);
        intermediateJPEGCompressor = -[BWIntermediateJPEGCompressor initWithCompressionQuality:compressionRate:jpegSurfacePoolLowWaterBufferCount:jpegSurfacePoolHighWaterBufferCount:compressedBufferPoolAllocationTimeoutMS:name:](v122, "initWithCompressionQuality:compressionRate:jpegSurfacePoolLowWaterBufferCount:jpegSurfacePoolHighWaterBufferCount:compressedBufferPoolAllocationTimeoutMS:name:", (self->_intermediateJPEGDownstreamRetainedBufferCount+ LODWORD(self->_intermediateJPEGCompressionRate)), (self->_intermediateJPEGDownstreamRetainedBufferCount + v118), self->_delegate, CFSTR("synchronizedSlaveJPEGCompressor"), v123, v124);
        self->_intermediateJPEGCompressor = intermediateJPEGCompressor;
      }
      v125 = -[BWIntermediateJPEGCompressor newJPEGSampleBufferFromUncompressedSampleBuffer:](intermediateJPEGCompressor, "newJPEGSampleBufferFromUncompressedSampleBuffer:", v120);
      if (!v125)
      {
        valveActiveVideoFrameReceptionStats = self->_valveActiveVideoFrameReceptionStats;
        v127 = (void *)MEMORY[0x1E0CB3940];
        CMSampleBufferGetPresentationTimeStamp(&v160, v120);
        -[BWStats logErrorNumber:errorString:](valveActiveVideoFrameReceptionStats, "logErrorNumber:errorString:", 0xFFFFFFFFLL, objc_msgSend(v127, "stringWithFormat:", CFSTR("Could not create intermediate JPEG for synchronized slave frame at %.4f"), CMTimeGetSeconds(&v160)));
        BWSampleBufferRemoveAttachedMedia(a3, (uint64_t)CFSTR("SynchronizedSlaveFrame"));
        v20 = 0;
        a3 = 0;
        v7 = v117;
        goto LABEL_170;
      }
    }
    BWSampleBufferRemoveAttachedMedia(a3, (uint64_t)CFSTR("SynchronizedSlaveFrame"));
  }
  else
  {
    v125 = 0;
  }
  v128 = *(BWIntermediateJPEGCompressor **)&self->_additionalCompressedBufferCount;
  v7 = v117;
  if (!v128)
  {
    v129 = [BWIntermediateJPEGCompressor alloc];
    LODWORD(v130) = self->_compressedBufferPoolAllocationTimeoutMS;
    LODWORD(v131) = HIDWORD(self->_compressedBufferPoolAllocationTimeoutMS);
    v7 = v117;
    v128 = -[BWIntermediateJPEGCompressor initWithCompressionQuality:compressionRate:jpegSurfacePoolLowWaterBufferCount:jpegSurfacePoolHighWaterBufferCount:compressedBufferPoolAllocationTimeoutMS:name:](v129, "initWithCompressionQuality:compressionRate:jpegSurfacePoolLowWaterBufferCount:jpegSurfacePoolHighWaterBufferCount:compressedBufferPoolAllocationTimeoutMS:name:", (self->_intermediateJPEGDownstreamRetainedBufferCount+ LODWORD(self->_intermediateJPEGCompressionRate)), (self->_intermediateJPEGDownstreamRetainedBufferCount + v118), self->_delegate, CFSTR("intermediateJPEGCompressor"), v130, v131);
    *(_QWORD *)&self->_additionalCompressedBufferCount = v128;
  }
  v132 = -[BWIntermediateJPEGCompressor newJPEGSampleBufferFromUncompressedSampleBuffer:](v128, "newJPEGSampleBufferFromUncompressedSampleBuffer:", a3);
  v20 = v132;
  if (v132)
  {
    if (!v125)
    {
LABEL_169:
      a3 = v20;
      goto LABEL_170;
    }
    BWSampleBufferSetAttachedMedia(v132, 0x1E495AE38, (uint64_t)v125);
LABEL_168:
    CFRelease(v125);
    goto LABEL_169;
  }
  v133 = self->_valveActiveVideoFrameReceptionStats;
  v134 = (void *)MEMORY[0x1E0CB3940];
  CMSampleBufferGetPresentationTimeStamp(&v159, a3);
  v135 = CMTimeGetSeconds(&v159);
  v136 = v134;
  v7 = v117;
  -[BWStats logErrorNumber:errorString:](v133, "logErrorNumber:errorString:", 0xFFFFFFFFLL, objc_msgSend(v136, "stringWithFormat:", CFSTR("Could not create intermediate JPEG for primary frame at %.4f"), *(_QWORD *)&v135));
  if (v125)
    goto LABEL_168;
  v20 = 0;
  a3 = 0;
LABEL_170:
  v157 = v7;
  if (*v116 == 1)
    kdebug_trace();
  if (a3)
  {
    sequenceAdjuster = self->_sequenceAdjuster;
    if (sequenceAdjuster)
    {
      v138 = -[BWIrisSequenceAdjuster addMotionDataToCacheForSampleBuffer:](sequenceAdjuster, "addMotionDataToCacheForSampleBuffer:", a3);
      v139 = (const __CFString *)*MEMORY[0x1E0D05CB0];
      v140 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
      v141 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v138);
      v142 = *MEMORY[0x1E0D082E8];
      objc_msgSend(v140, "setObject:forKeyedSubscript:", v141, *MEMORY[0x1E0D082E8]);
      v143 = (const void *)BWSampleBufferGetAttachedMedia(a3, (uint64_t)CFSTR("SynchronizedSlaveFrame"));
      if (v143)
      {
        if (self->_sequenceAdjuster)
          objc_msgSend((id)CMGetAttachment(v143, v139, 0), "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v138), v142);
      }
    }
    if (self->_motionDataPreserver)
    {
      memset(time, 0, 24);
      v144 = (const __CFDictionary *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05D00], 0);
      CMTimeMakeFromDictionary(time, v144);
      v21 = (void *)v158;
      if ((time[0].flags & 1) == 0)
        time[0] = v176;
      v145 = objc_msgSend((id)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05CB0], 0), "objectForKeyedSubscript:", *MEMORY[0x1E0D06910]);
      v146 = objc_msgSend((id)CMGetAttachment(a3, CFSTR("StillImageCaptureType"), 0), "intValue");
      if ((v153 & 1) != 0)
      {
        *(CMTime *)lhs = time[0];
        type.origin.x = v187;
        *(_QWORD *)&type.origin.y = __PAIR64__(v153, timescale);
        type.size.width = v155;
        CMTimeAdd((CMTime *)rhs, (CMTime *)lhs, (CMTime *)&type);
        time[0] = *(CMTime *)rhs;
      }
      motionDataPreserver = self->_motionDataPreserver;
      *(CMTime *)rhs = v176;
      *(CMTime *)lhs = time[0];
      -[BWMotionDataPreserver enqueueVideoBufferTime:nativeTime:isBracketFrame:isSISFrame:](motionDataPreserver, "enqueueVideoBufferTime:nativeTime:isBracketFrame:isSISFrame:", rhs, lhs, v145 != 0, v146 == 4);
      v7 = v157;
    }
    else
    {
      v7 = v157;
      v21 = (void *)v158;
    }
LABEL_184:
    objc_msgSend(v21, "addObject:", a3, v148);
    if (!BYTE2(self->_emissionMap))
    {
      memset(time, 0, 24);
      -[BWIrisStagingNode _earliestAllowedStillHostPTS]((CMTime *)self, (uint64_t)time);
      if ((time[0].flags & 1) != 0)
      {
        *(CMTime *)rhs = time[0];
        *(_OWORD *)lhs = *MEMORY[0x1E0CA2E30];
        *(_QWORD *)&lhs[16] = *(_QWORD *)(MEMORY[0x1E0CA2E30] + 16);
        if (CMTimeCompare((CMTime *)rhs, (CMTime *)lhs) < 0)
        {
          *(CMTime *)rhs = time[0];
          -[BWIrisStagingNode _signalReadyToReceiveRequestsWithEarliestAllowedStillHostPTS:]((uint64_t)self, (CMTime *)rhs);
        }
      }
    }
    -[BWIrisStagingNode _trimQueueForInputIndex:]((unint64_t)self, v7);
    if (LOBYTE(self->_droppedFramePTSs))
    {
      if (BYTE2(self->_droppedFramePTSs))
      {
        -[BWIrisStagingNode _emitSampleBuffer:forInputIndex:]((CMTime *)self, a3, v7);
      }
      else if (!v7)
      {
        time[0] = v176;
        -[BWIrisStagingNode _serviceIrisRequestsForCurrentTime:emitBuffers:ensureStillImageTimesAreStaged:]((uint64_t)self, time, 1, 1);
      }
    }
  }
LABEL_193:
  pthread_mutex_unlock(*(pthread_mutex_t **)&self->_emittedIrisRequestCount);
  if (v177)
    CFRelease(v177);
  if (v20)
    CFRelease(v20);
  if (sampleBufferOut)
    CFRelease(sampleBufferOut);
  if (v178)
    CFRelease(v178);
}

- (unint64_t)_trimQueueForInputIndex:(unint64_t)result
{
  unint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  CMTimeFlags flags;
  CMTimeEpoch epoch;
  int v12;
  _QWORD v13[10];
  CMTimeScale v14;
  CMTimeFlags v15;
  CMTimeEpoch v16;
  CMTime v17;
  CMTime v18;
  CMTime rhs;
  CMTime lhs;
  CMTime v21;
  CMTime v22;
  CMTimeValue value;
  CMTimeScale timescale;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v3 = result;
    v4 = MEMORY[0x1E0CA2E18];
    value = *MEMORY[0x1E0CA2E18];
    timescale = *(_DWORD *)(MEMORY[0x1E0CA2E18] + 8);
    v5 = (void *)objc_msgSend(*(id *)(result + 368), "objectAtIndexedSubscript:", a2);
    v6 = objc_msgSend(v5, "count");
    v7 = (void *)objc_msgSend((id)objc_msgSend((id)v3, "inputs"), "objectAtIndexedSubscript:", a2);
    v8 = (void *)objc_msgSend(*(id *)(v3 + 368), "objectAtIndexedSubscript:", 0);
    v9 = objc_msgSend(v8, "count");
    result = FigSimpleMutexCheckIsLockedOnThisThread();
    if (a2)
    {
      if (v9)
      {
        result = (unint64_t)CMSampleBufferGetPresentationTimeStamp(&v22, (CMSampleBufferRef)objc_msgSend(v8, "objectAtIndexedSubscript:", 0));
        value = v22.value;
        flags = v22.flags;
        timescale = v22.timescale;
        epoch = v22.epoch;
        if ((v22.flags & 1) == 0)
          return result;
      }
      else
      {
        flags = *(_DWORD *)(v4 + 12);
        epoch = *(_QWORD *)(v4 + 16);
        if ((flags & 1) == 0)
          return result;
      }
    }
    else
    {
      memset(&v22, 0, sizeof(v22));
      CMSampleBufferGetPresentationTimeStamp(&v22, (CMSampleBufferRef)objc_msgSend(v5, "lastObject"));
      lhs = v22;
      rhs = *(CMTime *)(v3 + 120);
      CMTimeAdd(&v21, &lhs, &rhs);
      v22 = v21;
      memset(&v21, 0, sizeof(v21));
      lhs = *(CMTime *)(v3 + 120);
      CMTimeMultiply(&v18, &lhs, 3);
      lhs = *(CMTime *)(v3 + 96);
      CMTimeAdd(&v21, &lhs, &v18);
      rhs = v22;
      v17 = v21;
      result = (unint64_t)CMTimeSubtract(&lhs, &rhs, &v17);
      value = lhs.value;
      flags = lhs.flags;
      timescale = lhs.timescale;
      epoch = lhs.epoch;
      if ((lhs.flags & 1) == 0)
        return result;
    }
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __45__BWIrisStagingNode__trimQueueForInputIndex___block_invoke;
    v13[3] = &unk_1E4920378;
    v13[4] = v7;
    v13[5] = v5;
    v14 = timescale;
    v15 = flags;
    v16 = epoch;
    v13[6] = v3;
    v13[7] = v6;
    v13[8] = a2;
    v13[9] = value;
    result = objc_msgSend(v5, "removeObjectsAtIndexes:", objc_msgSend(v5, "indexesOfObjectsPassingTest:", v13));
    if (!a2)
    {
      if (*(_BYTE *)(v3 + 640))
        v12 = *(_DWORD *)(v3 + 612);
      else
        v12 = objc_msgSend(v7, "delayedBufferCount");
      result = objc_msgSend(v5, "count");
      if (result > v12)
        return objc_msgSend(v5, "removeObjectsInRange:", 0, objc_msgSend(v5, "count") - v12);
    }
  }
  return result;
}

- (CMTime)_earliestAllowedStillHostPTS
{
  CMTime *v3;
  void *v4;
  uint64_t v5;
  CMTime v6;
  CMTime rhs;
  CMTime v8;

  if (result)
  {
    v3 = result;
    FigSimpleMutexCheckIsLockedOnThisThread();
    v4 = (void *)objc_msgSend(*(id *)&v3[15].timescale, "objectAtIndexedSubscript:", 0);
    v5 = MEMORY[0x1E0CA2E30];
    *(_OWORD *)a2 = *MEMORY[0x1E0CA2E30];
    *(_QWORD *)(a2 + 16) = *(_QWORD *)(v5 + 16);
    result = (CMTime *)objc_msgSend(v4, "count");
    if ((unint64_t)result >= 2)
    {
      -[BWIrisStagingNode _hostPTSForSampleBuffer:]((void *)objc_msgSend(v4, "objectAtIndexedSubscript:", 1), v3, (uint64_t)&v8);
      *(CMTime *)a2 = v8;
      CMTimeMake(&rhs, *(_DWORD *)(a2 + 8) / 1000, *(_DWORD *)(a2 + 8));
      v6 = *(CMTime *)a2;
      result = CMTimeAdd(&v8, &v6, &rhs);
      *(CMTime *)a2 = v8;
    }
  }
  else
  {
    *(_QWORD *)a2 = 0;
    *(_QWORD *)(a2 + 8) = 0;
    *(_QWORD *)(a2 + 16) = 0;
  }
  return result;
}

- (void)_findAndMarkCuttingBufferForVideoSbuf:(uint64_t)a1
{
  const void *v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  NSObject *v19;
  unsigned int v20;
  unsigned int v21;
  Float64 Seconds;
  int v23;
  CMTime v24;
  os_log_type_t type;
  unsigned int v26;
  int v27;
  const char *v28;
  __int16 v29;
  Float64 v30;
  __int16 v31;
  id v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v4 = (const void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 368), "objectAtIndexedSubscript:", 0), "lastObject");
    if (v4)
    {
      v5 = (const __CFString *)*MEMORY[0x1E0D05CB0];
      v6 = (void *)CMGetAttachment(v4, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
      v7 = (void *)CMGetAttachment(a2, v5, 0);
      if (*(_BYTE *)(a1 + 528)
        && (*(_DWORD *)(a1 + 704) - 1) <= 1
        && ((v8 = *MEMORY[0x1E0D06D00],
             v9 = (void *)objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D00]),
             v10 = (void *)objc_msgSend(v7, "objectForKeyedSubscript:", v8),
             v11 = *MEMORY[0x1E0D05A18],
             v12 = objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0D05A18]),
             v13 = *MEMORY[0x1E0D05A28],
             v12)
         && (objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0D05A28]) & 1) != 0
         || objc_msgSend(v9, "isEqualToString:", v13)
         && objc_msgSend(v10, "isEqualToString:", v11)))
      {
        if (dword_1ECFE94F0)
        {
          v26 = 0;
          type = OS_LOG_TYPE_DEFAULT;
          os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
          v23 = 1;
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        else
        {
          v23 = 1;
        }
      }
      else
      {
        v23 = 0;
      }
      if (!*(_BYTE *)(a1 + 786)
        || (v15 = *MEMORY[0x1E0D060E0],
            v16 = +[FigCaptureSmartStyle createFromDictionary:](FigCaptureSmartStyle, "createFromDictionary:", objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D060E0])), v17 = +[FigCaptureSmartStyle createFromDictionary:](FigCaptureSmartStyle, "createFromDictionary:", objc_msgSend(v7, "objectForKeyedSubscript:", v15)), v16 == v17)|| (v18 = v17, (objc_msgSend(v16, "isEqual:", v17) & 1) != 0))
      {
        if (!v23)
          return;
      }
      else if (dword_1ECFE94F0)
      {
        v26 = 0;
        type = OS_LOG_TYPE_DEFAULT;
        v19 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        v20 = v26;
        if (os_log_type_enabled(v19, type))
          v21 = v20;
        else
          v21 = v20 & 0xFFFFFFFE;
        if (v21)
        {
          CMSampleBufferGetPresentationTimeStamp(&v24, (CMSampleBufferRef)a2);
          Seconds = CMTimeGetSeconds(&v24);
          v27 = 136315906;
          v28 = "-[BWIrisStagingNode _findAndMarkCuttingBufferForVideoSbuf:]";
          v29 = 2048;
          v30 = Seconds;
          v31 = 2112;
          v32 = v16;
          v33 = 2112;
          v34 = v18;
          _os_log_send_and_compose_impl();
        }
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      CMSetAttachment(a2, CFSTR("BufferRequiresCuttingInLivePhotoMovie"), (CFTypeRef)*MEMORY[0x1E0C9AE50], 1u);
    }
  }
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
  }
}

- (BWIrisStagingNode)initWithNumberOfVideoInputs:(unint64_t)a3 numberOfAudioInputs:(unint64_t)a4 numberOfMetadataInputs:(unint64_t)a5 autoTrimMethod:(int)a6 vitalityScoringEnabled:(BOOL)a7 captureDeviceHasOverCaptureEnabled:(BOOL)a8 overCaptureEnabled:(BOOL)a9 depthEnabled:(BOOL)a10 videoStabilizationOverscanOverride:(float)a11 sequenceAdjusterEnabled:(BOOL)a12 visMotionMetadataPreloadingMode:(int)a13 frameReconstructionEnabled:(BOOL)a14 subjectRelightingEnabled:(BOOL)a15 intermediateJPEGCompressionQuality:(float)a16 intermediateJPEGCompressionRate:(float)a17 maxLossyCompressionLevel:(int)a18 temporaryMovieDirectoryURL:(id)a19 cameraInfoByPortType:(id)a20 smartStyleRenderingEnabled:(BOOL)a21 smartStyleReversibilityEnabled:(BOOL)a22 irisRequestDelegate:(id)a23
{
  unint64_t v23;
  _BOOL4 v27;
  unint64_t v31;
  BWIrisStagingNode *v32;
  uint64_t v33;
  __int128 *v34;
  _BOOL4 v35;
  BOOL v36;
  uint64_t v37;
  unint64_t v38;
  unsigned int v39;
  _BOOL4 v40;
  uint64_t v41;
  BWNodeInput *v42;
  BWVideoFormatRequirements *v43;
  void *v44;
  BOOL v45;
  BWNodeInputMediaConfiguration *v46;
  BWNodeOutput *v47;
  BWVideoFormatRequirements *v48;
  BWVideoFormatRequirements *v49;
  BWNodeOutputMediaConfiguration *v50;
  const __CFString *v51;
  BWNodeOutputMediaConfiguration *v52;
  uint64_t v53;
  BWNodeInput *v54;
  BWVideoFormatRequirements *v55;
  unsigned int v56;
  int v57;
  uint64_t v58;
  unint64_t v59;
  _QWORD *v60;
  unint64_t v61;
  _QWORD *v62;
  unint64_t v63;
  uint64_t i;
  _QWORD *v65;
  void *v67;
  uint64_t v68;
  const __CFString *v69;
  _BOOL4 v70;
  unint64_t v71;
  unint64_t v72;
  _BOOL4 v73;
  unint64_t v74;
  __int128 v75;
  uint64_t v76;
  void *v77;
  size_t v78;
  objc_super v79;

  v73 = a8;
  v23 = a4 + a3;
  v78 = a4 + a3 + a5;
  if (!v78)
  {
    v67 = (void *)MEMORY[0x1E0C99DA0];
    v68 = *MEMORY[0x1E0C99778];
    v69 = CFSTR("Need at least 1 input");
    goto LABEL_70;
  }
  v27 = a7;
  v31 = a3;
  if (a9 && !a8)
  {
    v67 = (void *)MEMORY[0x1E0C99DA0];
    v68 = *MEMORY[0x1E0C99778];
    v69 = CFSTR("captureDeviceHasOverCaptureEnabled must be true when overCaptureEnabled is true");
LABEL_70:
    objc_exception_throw((id)objc_msgSend(v67, "exceptionWithName:reason:userInfo:", v68, v69, 0, *(_QWORD *)&a6, a7));
  }
  v79.receiver = self;
  v79.super_class = (Class)BWIrisStagingNode;
  v32 = -[BWNode init](&v79, sel_init);
  v33 = (uint64_t)v32;
  if (!v32)
    return (BWIrisStagingNode *)v33;
  v71 = a5;
  v72 = a4;
  -[BWNode setSupportsConcurrentLiveInputCallbacks:](v32, "setSupportsConcurrentLiveInputCallbacks:", 1);
  *(_QWORD *)(v33 + 368) = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  *(_QWORD *)(v33 + 376) = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  *(_QWORD *)(v33 + 384) = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  *(_QWORD *)(v33 + 432) = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  *(_QWORD *)(v33 + 440) = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  *(_QWORD *)(v33 + 648) = a20;
  *(_QWORD *)(v33 + 584) = a23;
  v34 = (__int128 *)MEMORY[0x1E0CA2E18];
  v76 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  *(_QWORD *)(v33 + 212) = v76;
  v75 = *v34;
  *(_OWORD *)(v33 + 196) = *v34;
  *(_BYTE *)(v33 + 786) = a21;
  v70 = v27;
  *(_BYTE *)(v33 + 787) = a22;
  *(_DWORD *)(v33 + 480) = a6;
  *(_BYTE *)(v33 + 484) = v27;
  v35 = a10;
  *(_BYTE *)(v33 + 764) = a15;
  *(_QWORD *)(v33 + 456) = FigSimpleMutexCreate();
  *(_QWORD *)(v33 + 464) = malloc_type_calloc(v78, 0x18uLL, 0x1000040504FFAC1uLL);
  *(float *)(v33 + 600) = a16;
  *(float *)(v33 + 604) = a17;
  v36 = a17 > 0.0;
  if (*(float *)(v33 + 600) > 0.0)
    v36 = 1;
  *(_BYTE *)(v33 + 640) = v36;
  v77 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v37 = 0;
  v38 = 0;
  v74 = v23;
  do
  {
    if (v38 >= v31)
      v39 = 1936684398;
    else
      v39 = 1986618469;
    v40 = v38 < v23 && v38 < v31;
    if (v38 >= v23)
      v41 = 1835365473;
    else
      v41 = v39;
    objc_msgSend(v77, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v41));
    v42 = -[BWNodeInput initWithMediaType:node:index:]([BWNodeInput alloc], "initWithMediaType:node:index:", v41, v33, v38);
    if (v40)
    {
      v43 = objc_alloc_init(BWVideoFormatRequirements);
      if (*(_BYTE *)(v33 + 640))
      {
        v44 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", &unk_1E4A006B0);
        objc_msgSend(v44, "addObjectsFromArray:", FigCaptureSupportedPixelFormatsForCompressionType(4, 0, 0, a18));
        -[BWVideoFormatRequirements setSupportedPixelFormats:](v43, "setSupportedPixelFormats:", v44);
      }
      -[BWNodeInput setFormatRequirements:](v42, "setFormatRequirements:", v43);

      -[BWNodeInput setPassthroughMode:](v42, "setPassthroughMode:", *(_BYTE *)(v33 + 640) == 0);
      *(_BYTE *)(v33 + 684) = v73;
      if (v73)
      {
        if (*(_BYTE *)(v33 + 640))
          v45 = a9;
        else
          v45 = 0;
        *(_BYTE *)(v33 + 220) = v45;
        v46 = objc_alloc_init(BWNodeInputMediaConfiguration);
        -[BWNodeInputMediaConfiguration setFormatRequirements:](v46, "setFormatRequirements:", objc_alloc_init(BWVideoFormatRequirements));
        if (a9)
        {
          -[BWNodeInputMediaConfiguration setPassthroughMode:](v46, "setPassthroughMode:", *(_BYTE *)(v33 + 220) == 0);
          -[BWNodeInput setMediaConfiguration:forAttachedMediaKey:](v42, "setMediaConfiguration:forAttachedMediaKey:", v46, CFSTR("SynchronizedSlaveFrame"));
          *(_DWORD *)(v33 + 688) = 1053609165;
        }
        else
        {
          -[BWNodeInputMediaConfiguration setPassthroughMode:](v46, "setPassthroughMode:", 0);
          -[BWNodeInput setMediaConfiguration:forAttachedMediaKey:](v42, "setMediaConfiguration:forAttachedMediaKey:", v46, CFSTR("SynchronizedSlaveFrame"));
        }
        v35 = a10;
      }
      v23 = v74;
      if (v35)
      {
        -[BWIrisStagingNode _setupDepthMediaConfigurationForInput:attachedMediaKey:](v33, v42, (uint64_t)CFSTR("DepthData_DX"));
        -[BWIrisStagingNode _setupDepthMediaConfigurationForInput:attachedMediaKey:](v33, v42, (uint64_t)CFSTR("DepthData_DY"));
      }
      *(float *)(v33 + 680) = a11;
    }
    objc_msgSend((id)v33, "addInput:", v42);
    v47 = -[BWNodeOutput initWithMediaType:node:]([BWNodeOutput alloc], "initWithMediaType:node:", v41, v33);
    if (v40)
    {
      v48 = objc_alloc_init(BWVideoFormatRequirements);
      -[BWNodeOutput setFormatRequirements:](v47, "setFormatRequirements:", v48);
      -[BWNodeOutput setPassthroughMode:](v47, "setPassthroughMode:", *(_BYTE *)(v33 + 640) == 0);
      -[BWNodeOutput setIndexOfInputWhichDrivesThisOutput:](v47, "setIndexOfInputWhichDrivesThisOutput:", v38);

      if (a9)
      {
        v49 = objc_alloc_init(BWVideoFormatRequirements);
        v50 = objc_alloc_init(BWNodeOutputMediaConfiguration);
        -[BWNodeOutputMediaConfiguration setFormatRequirements:](v50, "setFormatRequirements:", v49);
        -[BWNodeOutputMediaConfiguration setPassthroughMode:](v50, "setPassthroughMode:", *(_BYTE *)(v33 + 220) == 0);
        -[BWNodeOutputMediaConfiguration setIndexOfInputWhichDrivesThisOutput:](v50, "setIndexOfInputWhichDrivesThisOutput:", v38);
        -[BWNodeOutputMediaConfiguration setAttachedMediaKeyOfInputWhichDrivesThisOutput:](v50, "setAttachedMediaKeyOfInputWhichDrivesThisOutput:", CFSTR("SynchronizedSlaveFrame"));
        if (*(_BYTE *)(v33 + 220))
          v51 = CFSTR("CompressedSynchronizedSlaveFrame");
        else
          v51 = CFSTR("SynchronizedSlaveFrame");
        v52 = v50;
        v23 = v74;
        -[BWNodeOutput setMediaConfiguration:forAttachedMediaKey:](v47, "setMediaConfiguration:forAttachedMediaKey:", v52, v51);
      }
      if (v35)
      {
        -[BWIrisStagingNode _setupDepthMediaConfigurationForOutput:attachedMediaKey:](v33, v47, (uint64_t)CFSTR("DepthData_DX"));
        -[BWIrisStagingNode _setupDepthMediaConfigurationForOutput:attachedMediaKey:](v33, v47, (uint64_t)CFSTR("DepthData_DY"));
      }
      if (*(_BYTE *)(v33 + 786))
      {
        -[BWIrisStagingNode _setupSmartStyleMediaConfigurationsForInput:](v33, v42);
        -[BWIrisStagingNode _setupSmartStyleMediaConfigurationsForOutput:](v33, v47);
      }
    }
    objc_msgSend((id)v33, "addOutput:", v47);
    objc_msgSend(*(id *)(v33 + 368), "addObject:", objc_msgSend(MEMORY[0x1E0C99DE8], "array"));
    objc_msgSend(*(id *)(v33 + 376), "addObject:", objc_msgSend(MEMORY[0x1E0C99E38], "null"));
    v53 = *(_QWORD *)(v33 + 464) + v37;
    *(_OWORD *)v53 = v75;
    *(_QWORD *)(v53 + 16) = v76;

    ++v38;
    v37 += 24;
  }
  while (v78 != v38);
  if (v70)
  {
    *(_QWORD *)(v33 + 536) = v78;
    v54 = -[BWNodeInput initWithMediaType:node:index:]([BWNodeInput alloc], "initWithMediaType:node:index:", 1986618469, v33, *(_QWORD *)(v33 + 536));
    v55 = objc_alloc_init(BWVideoFormatRequirements);
    -[BWNodeInput setFormatRequirements:](v54, "setFormatRequirements:", v55);

    objc_msgSend((id)v33, "addInput:", v54);
  }
  else
  {
    *(_QWORD *)(v33 + 536) = -1;
  }
  v56 = v71;
  *(_DWORD *)(v33 + 576) = a13;
  *(_QWORD *)(v33 + 544) = -[BWMotionDataPreserver initWithName:]([BWMotionDataPreserver alloc], "initWithName:", objc_msgSend((id)v33, "description"));
  if (a12)
  {
    v57 = *(_DWORD *)(v33 + 576);
    if (a22)
      v58 = BWAttachedMediaKeysAvailableOnSmartStyleLearnedFramesOnly();
    else
      v58 = 0;
    *(_QWORD *)(v33 + 552) = -[BWIrisSequenceAdjuster initWithMediaTypes:visMotionMetadataPreloadingEnabled:generateIFrames:attachedMediaKeysToPreserve:]([BWIrisSequenceAdjuster alloc], "initWithMediaTypes:visMotionMetadataPreloadingEnabled:generateIFrames:attachedMediaKeysToPreserve:", v77, v57 != 0, a14, v58);
  }
  *(_QWORD *)(v33 + 344) = a19;
  if (!v31)
    *(_BYTE *)(v33 + 665) = 1;
  v59 = v72;
  if (!v72)
    *(_BYTE *)(v33 + 664) = 1;
  v60 = malloc_type_malloc(8 * v78, 0x100004000313F17uLL);
  *(_QWORD *)(v33 + 656) = v60;
  if (v23 < v78)
  {
    v61 = v71;
    v62 = v60;
    v63 = v23;
    do
    {
      *v62++ = v63++;
      --v61;
    }
    while (v61);
    if (!v31)
      goto LABEL_63;
    goto LABEL_60;
  }
  v56 = 0;
  if (v31)
  {
LABEL_60:
    for (i = 0; i != v31; ++i)
      v60[v56 + i] = i;
    v56 += i;
  }
LABEL_63:
  if (v23 > v31)
  {
    v65 = &v60[v56];
    do
    {
      *v65++ = v31++;
      --v59;
    }
    while (v59);
  }
  *(_QWORD *)(v33 + 752) = -[BWLimitedGMErrorLogger initWithName:maxLoggingCount:]([BWLimitedGMErrorLogger alloc], "initWithName:maxLoggingCount:", CFSTR("BWIrisStagingNode"), 10);
  *(_QWORD *)(v33 + 592) = 1000;
  *(_DWORD *)(v33 + 616) = 0;
  *(_BYTE *)(v33 + 528) = 1;
  return (BWIrisStagingNode *)v33;
}

- (uint64_t)_setupDepthMediaConfigurationForInput:(uint64_t)a3 attachedMediaKey:
{
  BWNodeInputMediaConfiguration *v5;

  if (result)
  {
    v5 = objc_alloc_init(BWNodeInputMediaConfiguration);
    -[BWNodeInputMediaConfiguration setFormatRequirements:](v5, "setFormatRequirements:", objc_alloc_init(BWVideoFormatRequirements));
    -[BWNodeInputMediaConfiguration setPassthroughMode:](v5, "setPassthroughMode:", 1);
    return objc_msgSend(a2, "setMediaConfiguration:forAttachedMediaKey:", v5, a3);
  }
  return result;
}

- (uint64_t)_setupDepthMediaConfigurationForOutput:(uint64_t)a3 attachedMediaKey:
{
  BWNodeOutputMediaConfiguration *v5;

  if (result)
  {
    v5 = objc_alloc_init(BWNodeOutputMediaConfiguration);
    -[BWNodeOutputMediaConfiguration setFormatRequirements:](v5, "setFormatRequirements:", objc_alloc_init(BWVideoFormatRequirements));
    -[BWNodeOutputMediaConfiguration setPassthroughMode:](v5, "setPassthroughMode:", 1);
    return objc_msgSend(a2, "setMediaConfiguration:forAttachedMediaKey:", v5, a3);
  }
  return result;
}

- (uint64_t)_setupSmartStyleMediaConfigurationsForInput:(uint64_t)result
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  BWNodeInputMediaConfiguration *v8;
  BWVideoFormatRequirements *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v3 = BWAttachedMediaKeysRequiredBySmartStyleRenderingPipelines(1, *(unsigned __int8 *)(result + 787));
    result = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (result)
    {
      v4 = result;
      v5 = *(_QWORD *)v11;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v11 != v5)
            objc_enumerationMutation(v3);
          v7 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v6);
          v8 = objc_alloc_init(BWNodeInputMediaConfiguration);
          v9 = objc_alloc_init(BWVideoFormatRequirements);
          -[BWNodeInputMediaConfiguration setFormatRequirements:](v8, "setFormatRequirements:", v9, (_QWORD)v10);
          -[BWNodeInputMediaConfiguration setPassthroughMode:](v8, "setPassthroughMode:", 1);
          objc_msgSend(a2, "setMediaConfiguration:forAttachedMediaKey:", v8, v7);
          ++v6;
        }
        while (v4 != v6);
        result = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        v4 = result;
      }
      while (result);
    }
  }
  return result;
}

- (uint64_t)_setupSmartStyleMediaConfigurationsForOutput:(uint64_t)result
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  BWNodeOutputMediaConfiguration *v8;
  BWVideoFormatRequirements *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v3 = BWAttachedMediaKeysRequiredBySmartStyleRenderingPipelines(1, *(unsigned __int8 *)(result + 787));
    result = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (result)
    {
      v4 = result;
      v5 = *(_QWORD *)v11;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v11 != v5)
            objc_enumerationMutation(v3);
          v7 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v6);
          v8 = objc_alloc_init(BWNodeOutputMediaConfiguration);
          v9 = objc_alloc_init(BWVideoFormatRequirements);
          -[BWNodeOutputMediaConfiguration setFormatRequirements:](v8, "setFormatRequirements:", v9, (_QWORD)v10);
          -[BWNodeOutputMediaConfiguration setPassthroughMode:](v8, "setPassthroughMode:", 1);
          objc_msgSend(a2, "setMediaConfiguration:forAttachedMediaKey:", v8, v7);
          ++v6;
        }
        while (v4 != v6);
        result = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        v4 = result;
      }
      while (result);
    }
  }
  return result;
}

- (void)dealloc
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *firstEmittedPTSArray;
  void *v4;
  BWIntermediateJPEGCompressor *intermediateJPEGCompressor;
  NSObject *v6;
  objc_super v7;

  firstEmittedPTSArray = self->_firstEmittedPTSArray;
  if (firstEmittedPTSArray)
    CFRelease(firstEmittedPTSArray);

  free(self->_stateMutex);
  FigSimpleMutexDestroy();

  v4 = *(void **)&self->_additionalCompressedBufferCount;
  if (v4)

  intermediateJPEGCompressor = self->_intermediateJPEGCompressor;
  if (intermediateJPEGCompressor)

  v6 = *(NSObject **)&self->_haveSeenFirstAudioSampleBuffer;
  if (v6)
  {
    dispatch_group_leave(v6);

  }
  free(self->_cameraInfoByPortType);

  v7.receiver = self;
  v7.super_class = (Class)BWIrisStagingNode;
  -[BWNode dealloc](&v7, sel_dealloc);
}

- (void)didReachEndOfDataForInput:(id)a3
{
  uint64_t motionDataTimeMachine_high;
  opaqueCMSampleBuffer *v5;
  void *v6;
  void *valveOpenerSettingsID;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 *v11;
  uint64_t i;
  void *v13;
  __int128 v14;
  __int128 v15;
  void *v16;
  NSURL *spatialOverCaptureMasterMovieURL;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  BWIntermediateJPEGCompressor *intermediateJPEGCompressor;
  NSArray *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t k;
  void *epoch;
  double v30;
  double v31;
  double v32;
  double v33;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  unsigned int value;
  unsigned int v36;
  uint64_t v37;
  double v38;
  _OWORD *v39;
  uint64_t v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  CMTime v56;
  __int128 v57;
  _OWORD v58[2];
  __int128 v59;
  uint64_t v60;
  _BYTE v61[128];
  _BYTE v62[128];
  _OWORD v63[2];
  __int128 v64;
  __int128 v65;
  uint64_t v66;
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  pthread_mutex_lock(*(pthread_mutex_t **)&self->_emittedIrisRequestCount);
  motionDataTimeMachine_high = SHIDWORD(self->_motionDataTimeMachine);
  HIDWORD(self->_motionDataTimeMachine) = motionDataTimeMachine_high + 1;
  if (-[NSArray count](-[BWNode inputs](self, "inputs"), "count") == motionDataTimeMachine_high + 1)
  {
    BYTE1(self->_subjectRelightingResult) = 1;
    if (LOBYTE(self->_droppedFramePTSs))
    {
      v56 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E18];
      v5 = (opaqueCMSampleBuffer *)objc_msgSend((id)-[NSURL objectAtIndexedSubscript:](self->_spatialOverCaptureMasterMovieURL, "objectAtIndexedSubscript:", 0), "lastObject");
      if (v5)
      {
        CMSampleBufferGetPresentationTimeStamp(&v56, v5);
        v57 = *(_OWORD *)&v56.value;
        *(_QWORD *)&v58[0] = v56.epoch;
        -[BWIrisStagingNode _serviceIrisRequestsForCurrentTime:emitBuffers:ensureStillImageTimesAreStaged:]((uint64_t)self, (CMTime *)&v57, 0, 0);
      }
      v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v52 = 0u;
      v53 = 0u;
      v54 = 0u;
      v55 = 0u;
      valveOpenerSettingsID = (void *)self->_valveOpenerSettingsID;
      v8 = objc_msgSend(valveOpenerSettingsID, "countByEnumeratingWithState:objects:count:", &v52, v67, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v53;
        v11 = (__int128 *)MEMORY[0x1E0CA2E90];
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v53 != v10)
              objc_enumerationMutation(valveOpenerSettingsID);
            v13 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
            if (v13)
            {
              objc_msgSend(v13, "movieStartTime");
              if ((v50 & 0x100000000) != 0)
              {
                v14 = *v11;
                v58[0] = v11[1];
                v60 = *((_QWORD *)v11 + 8);
                v15 = v11[2];
                v59 = v11[3];
                v58[1] = v15;
                v57 = v14;
                *(_OWORD *)((char *)v58 + 8) = *(_OWORD *)&self->_frameGovernorReferenceTime.epoch;
                *((_QWORD *)&v58[1] + 1) = *(_QWORD *)&self->_readyToEmitPTS.timescale;
                v64 = v58[1];
                v65 = v59;
                v66 = v60;
                v63[0] = v14;
                v63[1] = v58[0];
                -[BWIrisStagingNode _emitIrisRequest:withEndingVideoSampleTimingInfo:]((uint64_t)self, v13, (uint64_t)v63);
                objc_msgSend(v6, "addObject:", v13);
              }
            }
            else
            {
              v49 = 0;
              v50 = 0;
              v51 = 0;
            }
          }
          v9 = objc_msgSend(valveOpenerSettingsID, "countByEnumeratingWithState:objects:count:", &v52, v67, 16);
        }
        while (v9);
      }
      objc_msgSend((id)self->_valveOpenerSettingsID, "removeObjectsInArray:", v6);
      if (objc_msgSend((id)self->_valveOpenerSettingsID, "count"))
      {
        objc_msgSend(*(id *)&self->_visMotionMetadataPreloadingMode, "stagingNode:valveClosedWithPendingIrisRequests:", self, self->_valveOpenerSettingsID);
        objc_msgSend((id)self->_valveOpenerSettingsID, "removeAllObjects");
      }
    }
    v16 = *(void **)&self->_vitalityScoringSmartCameraPipelineVersion.minor;
    if (v16)
    {
      objc_msgSend(v16, "stopMotionProcessing");

      *(_QWORD *)&self->_vitalityScoringSmartCameraPipelineVersion.minor = 0;
    }
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    spatialOverCaptureMasterMovieURL = self->_spatialOverCaptureMasterMovieURL;
    v18 = -[NSURL countByEnumeratingWithState:objects:count:](spatialOverCaptureMasterMovieURL, "countByEnumeratingWithState:objects:count:", &v45, v62, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v46;
      do
      {
        for (j = 0; j != v19; ++j)
        {
          if (*(_QWORD *)v46 != v20)
            objc_enumerationMutation(spatialOverCaptureMasterMovieURL);
          objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * j), "removeAllObjects");
        }
        v19 = -[NSURL countByEnumeratingWithState:objects:count:](spatialOverCaptureMasterMovieURL, "countByEnumeratingWithState:objects:count:", &v45, v62, 16);
      }
      while (v19);
    }
    v22 = *(void **)&self->_additionalCompressedBufferCount;
    if (v22)
    {

      *(_QWORD *)&self->_additionalCompressedBufferCount = 0;
    }
    intermediateJPEGCompressor = self->_intermediateJPEGCompressor;
    if (intermediateJPEGCompressor)
    {

      self->_intermediateJPEGCompressor = 0;
    }
    BYTE5(self->_limitedGMErrorLogger) = 0;

    *(_QWORD *)&self->_numberOfVideoFramesReceived = 0;
    self->_subjectRelightingCalculator = 0;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v24 = -[BWNode outputs](self, "outputs");
    v25 = -[NSArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v41, v61, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v42;
      do
      {
        for (k = 0; k != v26; ++k)
        {
          if (*(_QWORD *)v42 != v27)
            objc_enumerationMutation(v24);
          objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * k), "markEndOfLiveOutput");
        }
        v26 = -[NSArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v41, v61, 16);
      }
      while (v26);
    }
    epoch = (void *)self->_lastReceivedVideoTime.epoch;
    if (epoch)
    {
      objc_msgSend(epoch, "average");
      v31 = v30;
      objc_msgSend((id)self->_lastReceivedVideoTime.epoch, "multiplier");
      if (v32 > 0.0)
      {
        objc_msgSend((id)self->_lastReceivedVideoTime.epoch, "multiplier");
        v31 = v31 / v33;
      }
      if (dword_1ECFE94F0)
      {
        LODWORD(v56.value) = 0;
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        value = v56.value;
        if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT))
          v36 = value;
        else
          v36 = value & 0xFFFFFFFE;
        if (v36)
        {
          v37 = objc_msgSend((id)self->_lastReceivedVideoTime.epoch, "description");
          v38 = 0.0;
          LODWORD(v63[0]) = 136315906;
          *(_QWORD *)((char *)v63 + 4) = "-[BWIrisStagingNode didReachEndOfDataForInput:]";
          WORD6(v63[0]) = 2048;
          *(_QWORD *)((char *)v63 + 14) = self;
          WORD3(v63[1]) = 2112;
          *((_QWORD *)&v63[1] + 1) = v37;
          if (v31 > 0.0)
            v38 = 1.0 / v31;
          LOWORD(v64) = 2048;
          *(double *)((char *)&v64 + 2) = v38;
          LODWORD(v40) = 42;
          v39 = v63;
          _os_log_send_and_compose_impl();
        }
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }

      self->_lastReceivedVideoTime.epoch = 0;
    }
    -[BWStats resetCurrentLoggingCounter](self->_valveActiveVideoFrameReceptionStats, "resetCurrentLoggingCounter", v39, v40);
  }
  pthread_mutex_unlock(*(pthread_mutex_t **)&self->_emittedIrisRequestCount);
}

- (void)_serviceIrisRequestsForCurrentTime:(int)a3 emitBuffers:(int)a4 ensureStillImageTimesAreStaged:
{
  void *v8;
  CMTimeEpoch v9;
  void *v10;
  __int128 v11;
  CMTime v12;
  __int128 v13;
  char v14;
  CMTime v15;
  CMTime v16;

  if (a1)
  {
    v8 = (void *)objc_msgSend(*(id *)(a1 + 432), "firstObject");
    v11 = *MEMORY[0x1E0CA2E18];
    *(_OWORD *)&v16.value = *MEMORY[0x1E0CA2E18];
    v9 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
    v16.epoch = v9;
    if ((*(_BYTE *)(a1 + 308) & 1) == 0)
    {
      v10 = v8;
      if (v8)
      {
        v15 = *a2;
        if (-[BWIrisStagingNode _haveEnoughVideoStagedToStartFirstIrisRecording:currentTime:emitEndTimeOut:](a1, v8, &v15, &v16))
        {
          -[BWIrisStagingNode _fillInStartAndTrimTimesForMasterMovieWithInfo:](a1, v10);
          objc_msgSend(v10, "movieStartTime");
          if ((v14 & 1) != 0)
          {
            objc_msgSend(v10, "movieTrimStartTime");
            *(CMTime *)(a1 + 504) = v15;
            objc_msgSend(v10, "movieStartTime");
            v15 = v16;
            -[BWIrisStagingNode _prepareToEmitFramesFromStartTime:throughEndTime:](a1, &v13, (uint64_t)&v15);
          }
        }
      }
    }
    if ((*(_BYTE *)(a1 + 308) & 1) != 0)
    {
      if (a4)
      {
        v15 = *a2;
      }
      else
      {
        *(_OWORD *)&v15.value = v11;
        v15.epoch = v9;
      }
      v12 = v15;
      -[BWIrisStagingNode _fillInRefMovieStartAndTrimTimesForStillImageTimesBeforeTime:](a1, &v12);
      v12 = *a2;
      -[BWIrisStagingNode _informDelegateOfSoonToBeEmittedIrisRequestsForTime:](a1, &v12);
      -[BWIrisStagingNode _tagStillImageVISKeyFrames](a1);
      if (a3)
        -[BWIrisStagingNode _processQueuedVideoFrames](a1);
    }
  }
}

- (uint64_t)_emitIrisRequest:(uint64_t)a3 withEndingVideoSampleTimingInfo:
{
  uint64_t v5;
  _BOOL8 v6;
  void *v7;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *v9;
  unsigned int v10;
  unsigned int v11;
  uint64_t v12;
  NSObject *v13;
  unsigned int v14;
  unsigned int v15;
  uint64_t v16;
  NSObject *v17;
  unsigned int v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  CMTimeRange *p_lhs;
  uint64_t v23;
  CMTime v24;
  CMTime v25;
  CMTime v26;
  CMTime v27;
  CMTime v28;
  CMTime v29;
  CMTime v30;
  CMTime v31;
  CMTime v32;
  CMTime v33;
  os_log_type_t type;
  unsigned int v35;
  CMTime time2;
  CMTime time1;
  _QWORD v38[3];
  CMTime end;
  CMTime start;
  __int128 v41;
  uint64_t v42;
  __int128 v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  CMTime v48;
  CMTime v49;
  __int128 v50;
  uint64_t v51;
  CMTime rhs;
  __int128 v53;
  uint64_t v54;
  CMTimeRange v55[2];
  CMTimeRange lhs;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  if (!result)
    return result;
  v5 = result;
  result = FigSimpleMutexCheckIsLockedOnThisThread();
  if (!*(_BYTE *)(v5 + 392))
    return result;
  objc_msgSend(a2, "setFinalEnqueuedIrisRequest:", objc_msgSend(*(id *)(v5 + 432), "lastObject") == (_QWORD)a2);
  objc_msgSend(a2, "isFinalEnqueuedIrisRequest");
  v53 = *(_OWORD *)(v5 + 320);
  v54 = *(_QWORD *)(v5 + 336);
  objc_msgSend(a2, "setMasterMovieStartTime:", &v53);
  if ((*(_BYTE *)(a3 + 12) & 1) == 0)
  {
    CMTimeMake(&rhs, 5, 1000);
    *(_OWORD *)&lhs.start.value = *(_OWORD *)(v5 + 120);
    lhs.start.epoch = *(_QWORD *)(v5 + 136);
    CMTimeSubtract(&v55[0].start, &lhs.start, &rhs);
    *(_OWORD *)a3 = *(_OWORD *)&v55[0].start.value;
    *(_QWORD *)(a3 + 16) = v55[0].start.epoch;
  }
  v50 = *(_OWORD *)(a3 + 24);
  v51 = *(_QWORD *)(a3 + 40);
  objc_msgSend(a2, "setMovieEndingVideoPTS:", &v50);
  *(_OWORD *)&v55[0].start.value = *(_OWORD *)(a3 + 24);
  v55[0].start.epoch = *(_QWORD *)(a3 + 40);
  *(_OWORD *)&lhs.start.value = *(_OWORD *)a3;
  lhs.start.epoch = *(_QWORD *)(a3 + 16);
  CMTimeAdd(&v49, &v55[0].start, &lhs.start);
  v48 = v49;
  objc_msgSend(a2, "setMovieEndTime:", &v48);
  if (!a2)
  {
    v45 = 0;
    v46 = 0;
    v47 = 0;
    v44 = 0;
    v43 = 0uLL;
    goto LABEL_9;
  }
  objc_msgSend(a2, "movieTrimEndTime");
  if ((v46 & 0x100000000) == 0)
  {
    objc_msgSend(a2, "movieEndTime");
LABEL_9:
    v41 = v43;
    v42 = v44;
    objc_msgSend(a2, "setMovieTrimEndTime:", &v41);
  }
  objc_msgSend(a2, "setMasterMovieURL:", *(_QWORD *)(v5 + 352));
  objc_msgSend(a2, "setSpatialOverCaptureMasterMovieURL:", *(_QWORD *)(v5 + 360));
  if (objc_msgSend(a2, "isFinalEnqueuedIrisRequest"))
    v6 = *(_DWORD *)(v5 + 448) > 0;
  else
    v6 = 0;
  objc_msgSend(a2, "setFinalReferenceMovie:", v6);
  if (*(_BYTE *)(v5 + 484) && (objc_msgSend(a2, "isMomentCaptureMovieRecording") & 1) == 0)
  {
    memset(v55, 0, 48);
    if (a2)
    {
      objc_msgSend(a2, "movieTrimStartTime");
      objc_msgSend(a2, "movieTrimEndTime");
      CMTimeRangeFromTimeToTime(v55, &start, &end);
      v7 = *(void **)(v5 + 496);
      objc_msgSend(a2, "stillImageCaptureTime");
    }
    else
    {
      memset(&start, 0, sizeof(start));
      memset(&end, 0, sizeof(end));
      CMTimeRangeFromTimeToTime(v55, &start, &end);
      v7 = *(void **)(v5 + 496);
      memset(v38, 0, sizeof(v38));
    }
    lhs = v55[0];
    objc_msgSend(v7, "computeVitalityScoreForStillImageHostPTS:movieRange:", v38, &lhs);
    objc_msgSend(a2, "setVitalityScore:");
    objc_msgSend(a2, "setVitalityScoringVersion:", objc_msgSend(*(id *)(v5 + 496), "vitalityScoringVersion"));
    objc_msgSend(a2, "setVitalityScoreValid:", objc_msgSend(a2, "vitalityScoringVersion") != 0);
  }
  if (objc_msgSend(a2, "isFinalEnqueuedIrisRequest"))
  {
    if (a2)
    {
      objc_msgSend(a2, "movieEndingVideoPTS");
      objc_msgSend(a2, "stillImageCaptureTime");
    }
    else
    {
      memset(&time1, 0, sizeof(time1));
      memset(&time2, 0, sizeof(time2));
    }
    if (CMTimeCompare(&time1, &time2) <= 0)
    {
      if (dword_1ECFE94F0)
      {
        v35 = 0;
        type = OS_LOG_TYPE_DEFAULT;
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      *(_QWORD *)(v5 + 560) = 0;
    }
  }
  if (*(_QWORD *)(v5 + 560))
  {
    if (a2)
    {
      objc_msgSend(a2, "movieEndTime");
      objc_msgSend(a2, "stillImageCaptureTime");
    }
    else
    {
      memset(&v33, 0, sizeof(v33));
      memset(&v32, 0, sizeof(v32));
    }
    if (CMTimeCompare(&v33, &v32) < 0 && dword_1ECFE94F0)
    {
      v35 = 0;
      type = OS_LOG_TYPE_DEFAULT;
      v9 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      v10 = v35;
      if (os_log_type_enabled(v9, type))
        v11 = v10;
      else
        v11 = v10 & 0xFFFFFFFE;
      if (v11)
      {
        v12 = objc_msgSend(a2, "description");
        LODWORD(lhs.start.value) = 136315394;
        *(CMTimeValue *)((char *)&lhs.start.value + 4) = (CMTimeValue)"-[BWIrisStagingNode _emitIrisRequest:withEndingVid"
                                                                      "eoSampleTimingInfo:]";
        LOWORD(lhs.start.flags) = 2112;
        *(_QWORD *)((char *)&lhs.start.flags + 2) = v12;
        LODWORD(v23) = 22;
        p_lhs = &lhs;
        _os_log_send_and_compose_impl();
      }
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    objc_msgSend(*(id *)(v5 + 560), "adjustMovieInfoTimes:", a2, p_lhs, v23);
    if (a2)
    {
      objc_msgSend(a2, "movieEndTime");
      objc_msgSend(a2, "stillImageCaptureTime");
    }
    else
    {
      memset(&v31, 0, sizeof(v31));
      memset(&v30, 0, sizeof(v30));
    }
    if (CMTimeCompare(&v31, &v30) < 0 && dword_1ECFE94F0)
    {
      v35 = 0;
      type = OS_LOG_TYPE_DEFAULT;
      v17 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      v18 = v35;
      if (os_log_type_enabled(v17, type))
        v19 = v18;
      else
        v19 = v18 & 0xFFFFFFFE;
      if (v19)
      {
        v20 = objc_msgSend(a2, "description");
        LODWORD(lhs.start.value) = 136315394;
        *(CMTimeValue *)((char *)&lhs.start.value + 4) = (CMTimeValue)"-[BWIrisStagingNode _emitIrisRequest:withEndingVid"
                                                                      "eoSampleTimingInfo:]";
        LOWORD(lhs.start.flags) = 2112;
        *(_QWORD *)((char *)&lhs.start.flags + 2) = v20;
        LODWORD(v23) = 22;
        p_lhs = &lhs;
        _os_log_send_and_compose_impl();
      }
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  else
  {
    if (a2)
    {
      objc_msgSend(a2, "movieEndTime");
      objc_msgSend(a2, "stillImageCaptureTime");
    }
    else
    {
      memset(&v29, 0, sizeof(v29));
      memset(&v28, 0, sizeof(v28));
    }
    if (CMTimeCompare(&v29, &v28) < 0 && dword_1ECFE94F0)
    {
      v35 = 0;
      type = OS_LOG_TYPE_DEFAULT;
      v13 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      v14 = v35;
      if (os_log_type_enabled(v13, type))
        v15 = v14;
      else
        v15 = v14 & 0xFFFFFFFE;
      if (v15)
      {
        v16 = objc_msgSend(a2, "description");
        LODWORD(lhs.start.value) = 136315394;
        *(CMTimeValue *)((char *)&lhs.start.value + 4) = (CMTimeValue)"-[BWIrisStagingNode _emitIrisRequest:withEndingVid"
                                                                      "eoSampleTimingInfo:]";
        LOWORD(lhs.start.flags) = 2112;
        *(_QWORD *)((char *)&lhs.start.flags + 2) = v16;
        LODWORD(v23) = 22;
        p_lhs = &lhs;
        _os_log_send_and_compose_impl();
      }
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  objc_msgSend(a2, "setStagingNodeOverallVideoFrameReceptionStats:", *(_QWORD *)(v5 + 736), p_lhs, v23);
  objc_msgSend(a2, "setStagingNodeValveActiveVideoFrameReceptionStats:", *(_QWORD *)(v5 + 744));
  if (objc_msgSend(*(id *)(v5 + 440), "containsObject:", a2))
    objc_msgSend(*(id *)(v5 + 440), "removeObject:", a2);
  else
    objc_msgSend(*(id *)(v5 + 584), "stagingNode:willEmitIrisRequest:", v5, a2);
  -[BWIrisStagingNode _emitIrisMovieRequestWithInfo:]((void *)v5, a2);
  ++*(_DWORD *)(v5 + 448);
  result = objc_msgSend(a2, "isFinalEnqueuedIrisRequest");
  if ((_DWORD)result)
  {
    *(_BYTE *)(v5 + 394) = 1;
    v21 = MEMORY[0x1E0CA2E18];
    *(_OWORD *)(v5 + 400) = *MEMORY[0x1E0CA2E18];
    *(_QWORD *)(v5 + 416) = *(_QWORD *)(v21 + 16);
    if (a2)
      objc_msgSend(a2, "movieEndingVideoPTS");
    else
      memset(&v26, 0, sizeof(v26));
    CMTimeMake(&v24, 5, 1000);
    *(_OWORD *)&v55[0].start.value = *(_OWORD *)(v5 + 120);
    v55[0].start.epoch = *(_QWORD *)(v5 + 136);
    CMTimeSubtract(&v25, &v55[0].start, &v24);
    CMTimeSubtract(&v27, &v26, &v25);
    -[BWIrisStagingNode _emitBuffersThroughPTS:](v5, &v27);
    return -[BWIrisStagingNode _emitBuffersThroughPTS:](v5, MEMORY[0x1E0CA2E30]);
  }
  return result;
}

- (float)_appliedZoomFromSampleBuffer:(uint64_t)a1
{
  void *v3;
  void *v4;
  float v5;
  float v6;
  void *v7;
  float v8;

  if (!a1)
    return 0.0;
  v3 = (void *)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
  v4 = (void *)objc_msgSend(*(id *)(a1 + 648), "objectForKeyedSubscript:", objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D00]));
  objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D058B8]), "floatValue");
  v6 = v5;
  if (v5 <= 0.0)
  {
    FigDebugAssert3();
  }
  else
  {
    v7 = (void *)objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D06F58]);
    if (v7)
    {
      objc_msgSend(v7, "floatValue");
      return v6 * v8;
    }
  }
  return v6;
}

- (uint64_t)_feedTrimmerWithInferencesSampleBuffer:(uint64_t)result
{
  uint64_t v3;
  void *AttachedInferenceResult;
  const __CFDictionary *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[3];
  CMTime time1;
  CMTime time2;
  CMTime v11;

  if (!result)
    return result;
  v3 = result;
  AttachedInferenceResult = (void *)BWInferenceGetAttachedInferenceResult(a2, 101);
  result = objc_msgSend(AttachedInferenceResult, "isValid");
  if (!(_DWORD)result)
    return result;
  memset(&v11, 0, sizeof(v11));
  v5 = (const __CFDictionary *)CMGetAttachment(a2, (CFStringRef)*MEMORY[0x1E0D05D00], 0);
  if (!v5)
  {
    CMSampleBufferGetPresentationTimeStamp(&v11, (CMSampleBufferRef)a2);
    if (AttachedInferenceResult)
      goto LABEL_5;
LABEL_7:
    memset(&time2, 0, sizeof(time2));
    goto LABEL_8;
  }
  CMTimeMakeFromDictionary(&v11, v5);
  if (!AttachedInferenceResult)
    goto LABEL_7;
LABEL_5:
  objc_msgSend(AttachedInferenceResult, "timestamp");
LABEL_8:
  time1 = v11;
  CMTimeCompare(&time1, &time2);
  v6 = objc_msgSend(AttachedInferenceResult, "inferences");
  v7 = *(void **)(v3 + 496);
  if (AttachedInferenceResult)
    objc_msgSend(AttachedInferenceResult, "timestamp");
  else
    memset(v8, 0, sizeof(v8));
  return objc_msgSend(v7, "processInferences:forHostTime:", v6, v8);
}

- (CMTime)_emitSampleBuffer:(uint64_t)a3 forInputIndex:
{
  CMTime *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  void *v17;
  OpaqueCMClock *HostTimeClock;
  const void *v19;
  const void *AttachedMedia;
  int v21;
  const void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  __int128 v30;
  uint64_t v31;
  const __CFString *v32;
  CFTypeRef value;
  uint64_t v34;
  const __CFString *key;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  CMTime v41;
  CMTime time;
  _QWORD v43[7];
  CMTime v44;
  void *v45;
  CMTime v46;
  CMTime v47;
  _QWORD v48[3];
  CMTime time2;
  CMTime time1;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  CFTypeRef cf;
  _BYTE v59[128];
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v5 = result;
    v36 = (void *)objc_msgSend((id)-[CMTime outputs](result, "outputs"), "objectAtIndexedSubscript:", a3);
    cf = 0;
    v6 = *(void **)&v5[23].timescale;
    if (!v6)
    {
      BWCMSampleBufferCreateCopyIncludingMetadata(a2, (CMSampleBufferRef *)&cf);
      goto LABEL_24;
    }
    objc_msgSend(v6, "enqueueSampleBuffer:forMediaTypeWithIndex:", a2, a3);
    if (!a3)
    {
      v56 = 0u;
      v57 = 0u;
      v54 = 0u;
      v55 = 0u;
      v7 = (void *)v5[18].value;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v54, v60, 16);
      if (v8)
      {
        v9 = *(_QWORD *)v55;
        do
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v55 != v9)
              objc_enumerationMutation(v7);
            v11 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * i);
            if (v11)
            {
              objc_msgSend(*(id *)(*((_QWORD *)&v54 + 1) + 8 * i), "audioOffset");
              if ((v52 & 0x100000000) != 0)
                continue;
              CMSampleBufferGetPresentationTimeStamp(&time1, a2);
              objc_msgSend(v11, "stillImageCaptureTime");
            }
            else
            {
              v51 = 0;
              v52 = 0;
              v53 = 0;
              CMSampleBufferGetPresentationTimeStamp(&time1, a2);
              memset(&time2, 0, sizeof(time2));
            }
            if (CMTimeCompare(&time1, &time2) >= 1)
            {
              memset(&v44, 0, sizeof(v44));
              v12 = *(void **)&v5[23].timescale;
              if (v11)
              {
                objc_msgSend(v11, "stillImageCaptureTime");
                if (!v12)
                  continue;
              }
              else
              {
                memset(v48, 0, sizeof(v48));
                if (!v12)
                  continue;
              }
              objc_msgSend(v12, "audioOffsetForOriginalStillImageTime:", v48);
              if ((v44.flags & 1) != 0)
              {
                v47 = v44;
                objc_msgSend(v11, "setAudioOffset:", &v47);
              }
            }
          }
          v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v54, v60, 16);
        }
        while (v8);
      }
    }
LABEL_24:
    key = (const __CFString *)*MEMORY[0x1E0D05CB0];
    v32 = CFSTR("SubjectRelightingResult");
    v34 = *MEMORY[0x1E0D060E0];
    value = (CFTypeRef)*MEMORY[0x1E0C9AE50];
    v13 = (void *)cf;
    while (1)
    {
      v14 = *(void **)&v5[23].timescale;
      if (v14 || v13 == 0)
      {
        v13 = (void *)objc_msgSend(v14, "dequeueAndRetainAdjustedSampleBufferForMediaTypeWithIndex:", a3);
        cf = v13;
        if (!v13)
          break;
      }
      if (!a3)
      {
        v44.value = 0;
        *(_QWORD *)&v44.timescale = &v44;
        v44.epoch = 0x3810000000;
        v45 = &unk_1A33536F2;
        memset(&v46, 0, sizeof(v46));
        CMSampleBufferGetPresentationTimeStamp(&v46, (CMSampleBufferRef)v13);
        v16 = (void *)v5[18].value;
        v43[0] = MEMORY[0x1E0C809B0];
        v43[1] = 3221225472;
        v43[2] = __53__BWIrisStagingNode__emitSampleBuffer_forInputIndex___block_invoke;
        v43[3] = &unk_1E49203A0;
        v43[4] = v5;
        v43[5] = &v44;
        v43[6] = cf;
        objc_msgSend(v16, "enumerateObjectsUsingBlock:", v43);
        v17 = (void *)MEMORY[0x1E0CB37E8];
        HostTimeClock = CMClockGetHostTimeClock();
        CMClockGetTime(&time, HostTimeClock);
        CMTimeConvertScale(&v41, &time, 1000000000, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
        v19 = (const void *)objc_msgSend(v17, "numberWithLongLong:", v41.value);
        CMSetAttachment(cf, CFSTR("IrisStagingNodeEmissionTimeStamp"), v19, 1u);
        AttachedMedia = (const void *)BWSampleBufferGetAttachedMedia(cf, 0x1E495AE38);
        if (AttachedMedia
          || (AttachedMedia = (const void *)BWSampleBufferGetAttachedMedia(cf, (uint64_t)CFSTR("SynchronizedSlaveFrame"))) != 0)
        {
          CMSetAttachment(AttachedMedia, CFSTR("IrisStagingNodeEmissionTimeStamp"), v19, 1u);
        }
        if (v5[32].value && BYTE5(v5[31].epoch))
        {
          v21 = BYTE2(v5[32].epoch)
              ? objc_msgSend(+[FigCaptureSmartStyle createFromDictionary:](FigCaptureSmartStyle, "createFromDictionary:", objc_msgSend((id)CMGetAttachment(cf, key, 0), "objectForKeyedSubscript:", v34)), "isIdentity"): 1;
          v22 = *(const void **)&v5[32].timescale;
          if (v22)
          {
            if (v21)
              CMSetAttachment(cf, v32, v22, 1u);
          }
        }
        if (BYTE3(v5[32].epoch))
        {
          if (objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)v5[18].value, "firstObject"), "settings"), "smartStyleReversibilitySupported"))
          {
            BWSynchronizeSmartStyleAttachedMediaPTS((opaqueCMSampleBuffer *)cf);
          }
          else
          {
            v39 = 0u;
            v40 = 0u;
            v37 = 0u;
            v38 = 0u;
            v23 = BWAttachedMediaKeysRequiredBySmartStyleRenderingPipelines(0, 1);
            v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v37, v59, 16);
            if (v24)
            {
              v25 = *(_QWORD *)v38;
              do
              {
                for (j = 0; j != v24; ++j)
                {
                  if (*(_QWORD *)v38 != v25)
                    objc_enumerationMutation(v23);
                  BWSampleBufferRemoveAttachedMedia(cf, *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * j));
                }
                v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v37, v59, 16);
              }
              while (v24);
            }
          }
        }
        _Block_object_dispose(&v44, 8);
        v13 = (void *)cf;
        if (BYTE2(v5[32].epoch))
        {
          v27 = (void *)CMGetAttachment(cf, key, 0);
          v28 = objc_msgSend(v27, "objectForKeyedSubscript:", v34);
          v13 = (void *)cf;
          if (!v28)
          {
            CMSetAttachment(cf, CFSTR("SampleDataToBeDropped"), value, 1u);
            objc_msgSend(v27, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], 0x1E495A9F8);
            v13 = (void *)cf;
          }
        }
      }
      objc_msgSend(v36, "emitSampleBuffer:", v13, v32);
      v13 = 0;
      if (cf)
      {
        CFRelease(cf);
        v13 = 0;
        cf = 0;
      }
    }
    result = (CMTime *)objc_msgSend((id)v5[15].epoch, "setObject:atIndexedSubscript:", a2, a3);
    v29 = *(_QWORD *)&v5[19].timescale;
    if ((*(_BYTE *)(v29 + 24 * a3 + 12) & 1) == 0)
    {
      result = CMSampleBufferGetPresentationTimeStamp(&v44, a2);
      v30 = *(_OWORD *)&v44.value;
      v31 = v29 + 24 * a3;
      *(_QWORD *)(v31 + 16) = v44.epoch;
      *(_OWORD *)v31 = v30;
    }
  }
  return result;
}

- (void)handleNodeError:(id)a3 forInput:(id)a4
{
  if (objc_msgSend(a4, "index") != *(_QWORD *)&self->_trimLivePhotoMovieAtWideAndSuperWideAutoSwitching)
    objc_msgSend(-[NSArray objectAtIndexedSubscript:](-[BWNode outputs](self, "outputs"), "objectAtIndexedSubscript:", objc_msgSend(a4, "index")), "emitNodeError:", a3);
}

- (int)openValveWithIrisRequest:(id)a3
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  BWStats *v6;
  CMTimeEpoch v7;
  double v8;
  CMClockRef HostTimeClock;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *firstEmittedPTSArray;
  NSObject *v11;
  NSObject *v12;
  unsigned int value;
  unsigned int v14;
  const __CFString *v15;
  OpaqueCMClock *v16;
  Float64 Seconds;
  double v18;
  double v19;
  double v20;
  Float64 v21;
  Float64 v22;
  Float64 v23;
  Float64 v24;
  double v25;
  double v26;
  Float64 v27;
  BWMotionDataPreserver *motionDataPreserver;
  void *v29;
  void *v30;
  NSURL *v31;
  NSURL *v32;
  $95D729B680665BEAEFA1D6FCA8238556 *p_beginIrisMovieCaptureTime;
  int v34;
  NSObject *v35;
  unsigned int v36;
  unsigned int v37;
  int droppedFramePTSs_low;
  NSObject *v40;
  NSObject *v41;
  NSObject *v42;
  uint64_t v43;
  CMTime *p_time2;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  __int128 v48;
  CMTime v49;
  CMTime v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  CMTime rhs;
  CMTime v55;
  CMTime v56;
  CMTime v57;
  CMTime lhs;
  CMTime v59;
  CMTime v60;
  CMTime v61;
  CMTime v62;
  CMTime v63;
  CMTime v64;
  CMTime v65;
  os_log_type_t v66;
  int v67;
  CMTime v68;
  CMTime v69;
  CMTime v70;
  CMTime v71;
  CMTime v72;
  CMTime type;
  CMTime v74;
  CMTime v75;
  CMTime v76;
  CMTime v77;
  CMTime time2;
  uint64_t v79;
  __int16 v80;
  const __CFString *v81;
  __int16 v82;
  Float64 v83;
  __int16 v84;
  double v85;
  __int16 v86;
  Float64 v87;
  __int16 v88;
  Float64 v89;
  __int16 v90;
  Float64 v91;
  __int16 v92;
  Float64 v93;
  __int16 v94;
  double v95;
  CMTime time1;
  uint64_t v97;

  v97 = *MEMORY[0x1E0C80C00];
  pthread_mutex_lock(*(pthread_mutex_t **)&self->_emittedIrisRequestCount);
  if (LOBYTE(self->_droppedFramePTSs))
  {
    if (!dword_1ECFE94F0)
    {
LABEL_74:
      v34 = 0;
      goto LABEL_81;
    }
    LODWORD(v75.value) = 0;
    LOBYTE(type.value) = 0;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    goto LABEL_73;
  }
  v6 = objc_alloc_init(BWStats);
  self->_overallVideoFrameReceptionStats = v6;
  -[BWStats setMultiplier:](v6, "setMultiplier:", 1000.0);
  -[BWStats setUnitDesignator:](self->_overallVideoFrameReceptionStats, "setUnitDesignator:", CFSTR("ms"));
  v48 = *MEMORY[0x1E0CA2E18];
  *(_OWORD *)&v77.value = *MEMORY[0x1E0CA2E18];
  v7 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  v77.epoch = v7;
  if (self->_stagingSuspended)
  {
    objc_msgSend(a3, "isMomentCaptureMovieRecording");
    v8 = -[BWIrisStagingNode _resumeStaging]((uint64_t)self);
    self->_flushAndSuspendPending = 1;
    if (a3)
      objc_msgSend(a3, "stillImageCaptureHostTime", v8);
    else
      memset(&time1, 0, sizeof(time1));
    v77 = time1;
  }
  else
  {
    -[BWIrisStagingNode _earliestAllowedStillHostPTS]((CMTime *)self, (uint64_t)&v77);
  }
  if (objc_msgSend(a3, "isMomentCaptureMovieRecording"))
  {
    time1 = v77;
    time2 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E30];
    if (CMTimeCompare(&time1, &time2) < 0)
    {
      if (a3)
        objc_msgSend(a3, "stillImageCaptureHostTime");
      else
        memset(&v76, 0, sizeof(v76));
      time1 = v77;
      if (CMTimeCompare(&v76, &time1) < 0)
      {
        memset(&v75, 0, sizeof(v75));
        HostTimeClock = CMClockGetHostTimeClock();
        firstEmittedPTSArray = self->_firstEmittedPTSArray;
        time1 = v77;
        CMSyncConvertTime(&v75, &time1, HostTimeClock, firstEmittedPTSArray);
        LODWORD(type.value) = 0;
        LOBYTE(v71.value) = 0;
        v11 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
        time1 = v77;
        time2 = v75;
        objc_msgSend(a3, "setMomentCaptureRecordingStillImageCaptureHostTimeOverride:stillImageCaptureTimeOverride:", &time1, &time2);
      }
    }
  }
  if ((objc_msgSend(a3, "isMomentCaptureMovieRecording", v43, v45) & 1) == 0)
  {
    if (a3)
      objc_msgSend(a3, "stillImageCaptureHostTime");
    else
      memset(&v74, 0, sizeof(v74));
    time1 = v77;
    if (CMTimeCompare(&v74, &time1) < 0)
    {
      memset(&v75, 0, sizeof(v75));
      v16 = CMClockGetHostTimeClock();
      CMClockGetTime(&v75, v16);
      memset(&type, 0, sizeof(type));
      if (a3)
        objc_msgSend(a3, "stillImageCaptureHostTime");
      else
        memset(&v72, 0, sizeof(v72));
      time1 = v75;
      CMTimeSubtract(&type, &time1, &v72);
      memset(&v71, 0, sizeof(v71));
      CMSampleBufferGetPresentationTimeStamp(&v70, (CMSampleBufferRef)objc_msgSend((id)-[NSURL objectAtIndexedSubscript:](self->_spatialOverCaptureMasterMovieURL, "objectAtIndexedSubscript:", 0), "lastObject"));
      time1 = v75;
      CMTimeSubtract(&v71, &time1, &v70);
      memset(&v69, 0, sizeof(v69));
      time1 = v75;
      time2 = *(CMTime *)(&self->_flushAndSuspendPending + 3);
      CMTimeSubtract(&v69, &time1, &time2);
      memset(&v68, 0, sizeof(v68));
      CMTimeMake(&v68, 500, 1000);
      if ((v69.flags & 1) != 0 && (time1 = v69, time2 = v68, CMTimeCompare(&time1, &time2) < 0))
      {
        v67 = 0;
        v66 = OS_LOG_TYPE_DEFAULT;
        v40 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
        v34 = -15544;
      }
      else
      {
        time1 = type;
        time2 = v71;
        if (CMTimeCompare(&time1, &time2) < 0)
        {
          if ((v71.flags & 1) != 0)
          {
            v67 = 0;
            v66 = OS_LOG_TYPE_DEFAULT;
            v41 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();
            v34 = -16959;
          }
          else
          {
            v34 = -16958;
          }
        }
        else
        {
          v34 = -16955;
        }
      }
      if (dword_1ECFE94F0)
      {
        v67 = 0;
        v66 = OS_LOG_TYPE_DEFAULT;
        v42 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      goto LABEL_81;
    }
  }
  memset(&v65, 0, sizeof(v65));
  CMSampleBufferGetPresentationTimeStamp(&v65, (CMSampleBufferRef)objc_msgSend((id)-[NSURL objectAtIndexedSubscript:](self->_spatialOverCaptureMasterMovieURL, "objectAtIndexedSubscript:", 0), "lastObject"));
  if (dword_1ECFE94F0)
  {
    LODWORD(v75.value) = 0;
    LOBYTE(type.value) = 0;
    v12 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    value = v75.value;
    if (os_log_type_enabled(v12, type.value))
      v14 = value;
    else
      v14 = value & 0xFFFFFFFE;
    if (v14)
    {
      v47 = objc_msgSend((id)objc_msgSend(a3, "settings"), "settingsID");
      if (objc_msgSend(a3, "isMomentCaptureMovieRecording"))
        v15 = CFSTR("Moment Capture Movie Recording");
      else
        v15 = CFSTR("Live Photo");
      if (a3)
        objc_msgSend(a3, "stillImageCaptureTime");
      else
        memset(&v64, 0, sizeof(v64));
      Seconds = CMTimeGetSeconds(&v64);
      mach_absolute_time();
      v18 = (double)FigHostTimeToNanoseconds();
      if (a3)
        objc_msgSend(a3, "stillImageCaptureHostTime");
      else
        memset(&v63, 0, sizeof(v63));
      v19 = v18 / 1000000000.0;
      v20 = CMTimeGetSeconds(&v63);
      CMSampleBufferGetPresentationTimeStamp(&v62, (CMSampleBufferRef)objc_msgSend((id)-[NSURL objectAtIndexedSubscript:](self->_spatialOverCaptureMasterMovieURL, "objectAtIndexedSubscript:", 0), "firstObject"));
      v21 = CMTimeGetSeconds(&v62);
      time1 = v65;
      v22 = CMTimeGetSeconds(&time1);
      v23 = 0.0;
      v24 = 0.0;
      if (-[BWIrisStagingNode _emittingInputsCount]((uint64_t)self) != 1)
      {
        CMSampleBufferGetPresentationTimeStamp(&v61, (CMSampleBufferRef)objc_msgSend((id)-[NSURL objectAtIndexedSubscript:](self->_spatialOverCaptureMasterMovieURL, "objectAtIndexedSubscript:", 1), "firstObject"));
        v24 = CMTimeGetSeconds(&v61);
      }
      v25 = v19 - v20;
      if (-[BWIrisStagingNode _emittingInputsCount]((uint64_t)self) != 1)
      {
        CMSampleBufferGetPresentationTimeStamp(&v60, (CMSampleBufferRef)objc_msgSend((id)-[NSURL objectAtIndexedSubscript:](self->_spatialOverCaptureMasterMovieURL, "objectAtIndexedSubscript:", 1), "lastObject"));
        v23 = CMTimeGetSeconds(&v60);
      }
      v26 = v25 * 1000.0;
      if (a3)
        objc_msgSend(a3, "stillImageCaptureHostTime");
      else
        memset(&lhs, 0, sizeof(lhs));
      time1 = v77;
      CMTimeSubtract(&v59, &lhs, &time1);
      v27 = CMTimeGetSeconds(&v59);
      LODWORD(time2.value) = 136317698;
      *(CMTimeValue *)((char *)&time2.value + 4) = (CMTimeValue)"-[BWIrisStagingNode openValveWithIrisRequest:]";
      LOWORD(time2.flags) = 2048;
      *(_QWORD *)((char *)&time2.flags + 2) = self;
      HIWORD(time2.epoch) = 2048;
      v79 = v47;
      v80 = 2112;
      v81 = v15;
      v82 = 2048;
      v83 = Seconds;
      v84 = 2048;
      v85 = v26;
      v86 = 2048;
      v87 = v21;
      v88 = 2048;
      v89 = v22;
      v90 = 2048;
      v91 = v24;
      v92 = 2048;
      v93 = v23;
      v94 = 2048;
      v95 = v27 * 1000.0;
      LODWORD(v46) = 112;
      p_time2 = &time2;
      _os_log_send_and_compose_impl();
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  LOBYTE(self->_droppedFramePTSs) = 1;
  BYTE3(self->_droppedFramePTSs) = 0;
  BYTE4(self->_droppedFramePTSs) = objc_msgSend(a3, "isMomentCaptureMovieRecording", p_time2, v46);
  self->_valveDiscontinuitySearchLimit.epoch = objc_msgSend((id)objc_msgSend(a3, "settings"), "settingsID");
  *(_OWORD *)&self->_frameGovernorReferenceTime.epoch = v48;
  *(_QWORD *)&self->_readyToEmitPTS.timescale = v7;
  *(_OWORD *)&self->_readyToEmitPTS.epoch = v48;
  *(_QWORD *)&self->_lastProcessedVideoPTS.timescale = v7;
  *(_OWORD *)&self->_lastProcessedVideoPTS.epoch = v48;
  *(_QWORD *)&self->_masterMovieStartPTS.timescale = v7;
  *(_OWORD *)&self->_trimmer = v48;
  *(_QWORD *)&self->_firstTrimStartPTS.timescale = v7;
  LODWORD(self->_irisRequestsSoonToBeEmitted) = 0;
  if (objc_msgSend(a3, "isMomentCaptureMovieRecording"))
  {
    self->_sequenceAdjusterBackingStore = 0;
  }
  else
  {
    motionDataPreserver = self->_motionDataPreserver;
    self->_sequenceAdjusterBackingStore = (BWIrisSequenceAdjuster *)motionDataPreserver;
    if (motionDataPreserver)
    {
      time1 = (CMTime)self->_targetFrameDuration;
      CMTimeMultiply(&v56, &time1, 5);
      CMTimeMake(&rhs, 5, 1000);
      time1 = (CMTime)self->_targetFrameDuration;
      CMTimeAdd(&v55, &time1, &rhs);
      CMTimeAdd(&v57, &v56, &v55);
      time2 = v65;
      CMTimeAdd(&time1, &time2, &v57);
      *(CMTime *)&self->_valveOpen = time1;
      goto LABEL_53;
    }
  }
  *(_OWORD *)&self->_valveOpen = v48;
  *(_QWORD *)&self->_valveDiscontinuitySearchLimit.timescale = v7;
LABEL_53:

  self->_masterMovieURL = 0;
  if (objc_msgSend(a3, "isMomentCaptureMovieRecording"))
  {
    self->_temporaryMovieDirectoryURL = (NSURL *)(id)objc_msgSend((id)objc_msgSend(a3, "settings"), "outputURL");
    self->_masterMovieURL = (NSURL *)(id)objc_msgSend((id)objc_msgSend(a3, "settings"), "spatialOverCaptureMovieURL");
  }
  else
  {
    if (self->_masterMovieStartPTS.epoch)
    {
      v29 = (void *)objc_msgSend((id)self->_masterMovieStartPTS.epoch, "URLByAppendingPathComponent:isDirectory:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("master%lld.mov"), objc_msgSend((id)objc_msgSend(a3, "settings"), "settingsID")), 0);
    }
    else
    {
      v30 = (void *)objc_msgSend((id)objc_msgSend(a3, "settings"), "outputURL");
      v29 = (void *)objc_msgSend((id)objc_msgSend(v30, "URLByDeletingLastPathComponent"), "URLByAppendingPathComponent:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3A28], "UUID"), "UUIDString"), objc_msgSend(v30, "pathExtension")));
    }
    v31 = v29;
    self->_temporaryMovieDirectoryURL = v31;
    objc_msgSend((id)objc_msgSend(a3, "settings"), "setOutputURL:", v31);
    if (objc_msgSend((id)objc_msgSend(a3, "settings"), "spatialOverCaptureMovieURL"))
    {
      v32 = isn_addVariantToURL(self->_temporaryMovieDirectoryURL);
      self->_masterMovieURL = v32;
      objc_msgSend((id)objc_msgSend(a3, "settings"), "setSpatialOverCaptureMovieURL:", v32);
    }
  }
  p_beginIrisMovieCaptureTime = &self->_beginIrisMovieCaptureTime;
  if ((self->_beginIrisMovieCaptureTime.flags & 1) != 0)
  {
    if (a3)
    {
      objc_msgSend(a3, "beginTrimMasterPTS");
      if ((v52 & 0x100000000) == 0)
        goto LABEL_66;
      objc_msgSend(a3, "beginTrimMasterPTS");
      *(_OWORD *)&time1.value = *(_OWORD *)&p_beginIrisMovieCaptureTime->value;
      time1.epoch = self->_beginIrisMovieCaptureTime.epoch;
      if ((CMTimeCompare(&time1, &v50) & 0x80000000) == 0)
        goto LABEL_66;
      goto LABEL_62;
    }
    v51 = 0;
    v52 = 0;
    v53 = 0;
LABEL_69:
    memset(&v49, 0, sizeof(v49));
    goto LABEL_70;
  }
  if (!a3)
  {
    p_beginIrisMovieCaptureTime->value = 0;
    *(_QWORD *)&self->_beginIrisMovieCaptureTime.timescale = 0;
    self->_beginIrisMovieCaptureTime.epoch = 0;
    goto LABEL_69;
  }
LABEL_62:
  objc_msgSend(a3, "beginTrimMasterPTS");
  *(_OWORD *)&p_beginIrisMovieCaptureTime->value = *(_OWORD *)&time1.value;
  self->_beginIrisMovieCaptureTime.epoch = time1.epoch;
LABEL_66:
  objc_msgSend(a3, "stillImageCaptureTime");
LABEL_70:
  time1 = (CMTime)self->_endIrisMovieCaptureTime;
  if (CMTimeCompare(&time1, &v49) <= 0)
  {
    *(_OWORD *)&self->_endIrisMovieCaptureTime.value = v48;
    self->_endIrisMovieCaptureTime.epoch = v7;
  }
  -[BWIrisStagingNode _enqueueIrisRequest:]((uint64_t)self, a3);
LABEL_73:
  if (LOBYTE(self->_droppedFramePTSs))
    goto LABEL_74;
  LODWORD(v75.value) = 0;
  LOBYTE(type.value) = 0;
  v35 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
  v36 = v75.value;
  if (os_log_type_enabled(v35, type.value))
    v37 = v36;
  else
    v37 = v36 & 0xFFFFFFFE;
  if (v37)
  {
    LODWORD(time2.value) = 136315394;
    *(CMTimeValue *)((char *)&time2.value + 4) = (CMTimeValue)"-[BWIrisStagingNode openValveWithIrisRequest:]";
    LOWORD(time2.flags) = 2048;
    *(_QWORD *)((char *)&time2.flags + 2) = self;
    _os_log_send_and_compose_impl();
  }
  fig_log_call_emit_and_clean_up_after_send_and_compose();
  v34 = -16959;
LABEL_81:
  droppedFramePTSs_low = LOBYTE(self->_droppedFramePTSs);
  pthread_mutex_unlock(*(pthread_mutex_t **)&self->_emittedIrisRequestCount);
  if (droppedFramePTSs_low)
    return 0;
  else
    return v34;
}

- (double)_resumeStaging
{
  OpaqueCMClock *HostTimeClock;
  double result;
  CMTime v4;

  if (a1)
  {
    FigSimpleMutexCheckIsLockedOnThisThread();
    *(_BYTE *)(a1 + 192) = 0;
    *(_BYTE *)(a1 + 193) = 0;
    HostTimeClock = CMClockGetHostTimeClock();
    CMClockGetTime(&v4, HostTimeClock);
    result = *(double *)&v4.value;
    *(CMTime *)(a1 + 196) = v4;
  }
  return result;
}

- (uint64_t)_emittingInputsCount
{
  _QWORD *v1;

  if (result)
  {
    v1 = (_QWORD *)result;
    FigSimpleMutexCheckIsLockedOnThisThread();
    result = objc_msgSend((id)objc_msgSend(v1, "inputs"), "count");
    if (v1[67] == result - 1)
      --result;
  }
  return result;
}

- (uint64_t)_enqueueIrisRequest:(uint64_t)result
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  const __CFString *v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  int v10;
  void *v11;
  void *v12;
  int32_t timescale;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  CMTime time2;
  CMTime v16;
  CMTime v17;
  CMTime v18;
  CMTime v19;
  CMTime v20;
  CMTime v21;
  CMTime v22;
  CMTime v23;
  CMTime v24;
  CMTime v25;
  CMTime v26;
  CMTime v27;
  CMTime v28;
  CMTime lhs;
  CMTime v30;
  CMTime v31;
  CMTime v32;
  CMTime v33;
  CMTime v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  CMTime v38;
  CMTime rhs;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v3 = result;
    result = FigSimpleMutexCheckIsLockedOnThisThread();
    if (*(_BYTE *)(v3 + 392))
    {
      if (*(_QWORD *)(v3 + 344))
      {
        v4 = objc_msgSend((id)objc_msgSend(a2, "settings"), "settingsID");
        v5 = objc_msgSend(a2, "isOriginalPhotoRecording");
        v6 = &stru_1E4928818;
        if (v5)
          v6 = CFSTR("_original");
        objc_msgSend(a2, "setTemporaryMovieURL:", objc_msgSend(*(id *)(v3 + 344), "URLByAppendingPathComponent:isDirectory:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("output%lld%@.mov"), v4, v6), 0));
        if ((int)objc_msgSend(a2, "numberOfRequestedVariants") >= 2)
        {
          v7 = objc_msgSend((id)objc_msgSend(a2, "settings"), "settingsID");
          objc_msgSend(a2, "setTemporaryURLForSDOFOriginalMovie:", objc_msgSend(*(id *)(v3 + 344), "URLByAppendingPathComponent:isDirectory:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("output%lld%@.mov"), v7, CFSTR("_original")), 0));
        }
        if (objc_msgSend((id)objc_msgSend(a2, "settings"), "spatialOverCaptureMovieURL"))
          objc_msgSend(a2, "setSpatialOverCaptureTemporaryMovieURL:", isn_addVariantToURL((void *)objc_msgSend(a2, "temporaryMovieURL")));
      }
      objc_msgSend(*(id *)(v3 + 432), "addObject:", a2);
      if ((unint64_t)objc_msgSend(*(id *)(v3 + 432), "count") >= 2)
        objc_msgSend(a2, "setIsOverlappingRequest:", 1);
      v9 = *(_QWORD *)(v3 + 120);
      v10 = *(_DWORD *)(v3 + 128);
      v35 = 0;
      v36 = 0;
      v37 = 0;
      v11 = *(void **)(v3 + 552);
      if (v11)
        objc_msgSend(v11, "previewFrameDuration");
      if (v9)
      {
        *(float *)&v8 = (float)v10 / (float)v9;
        objc_msgSend(a2, "setTargetFrameRate:", v8);
      }
      memset(&v34, 0, sizeof(v34));
      CMSampleBufferGetPresentationTimeStamp(&v34, (CMSampleBufferRef)objc_msgSend((id)objc_msgSend(*(id *)(v3 + 368), "objectAtIndexedSubscript:", 0), "firstObject"));
      memset(&v33, 0, sizeof(v33));
      CMSampleBufferGetPresentationTimeStamp(&v33, (CMSampleBufferRef)objc_msgSend((id)objc_msgSend(*(id *)(v3 + 368), "objectAtIndexedSubscript:", 0), "lastObject"));
      memset(&v32, 0, sizeof(v32));
      if (-[BWIrisStagingNode _emittingInputsCount](v3) == 1)
        v32 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E18];
      else
        CMSampleBufferGetPresentationTimeStamp(&v32, (CMSampleBufferRef)objc_msgSend((id)objc_msgSend(*(id *)(v3 + 368), "objectAtIndexedSubscript:", 1), "firstObject"));
      memset(&v31, 0, sizeof(v31));
      if (-[BWIrisStagingNode _emittingInputsCount](v3) == 1)
        v31 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E18];
      else
        CMSampleBufferGetPresentationTimeStamp(&v31, (CMSampleBufferRef)objc_msgSend((id)objc_msgSend(*(id *)(v3 + 368), "objectAtIndexedSubscript:", 1), "lastObject"));
      if (a2)
        objc_msgSend(a2, "stillImageCaptureTime");
      else
        memset(&lhs, 0, sizeof(lhs));
      rhs = v34;
      CMTimeSubtract(&v30, &lhs, &rhs);
      v28 = v30;
      objc_msgSend(a2, "setStillTimeOffsetToVideoPrerollStartTime:", &v28);
      if (a2)
        objc_msgSend(a2, "stillImageCaptureTime");
      else
        memset(&v26, 0, sizeof(v26));
      rhs = v33;
      CMTimeSubtract(&v27, &v26, &rhs);
      v25 = v27;
      objc_msgSend(a2, "setStillTimeOffsetToVideoPrerollStopTime:", &v25);
      if (a2)
        objc_msgSend(a2, "stillImageCaptureTime");
      else
        memset(&v23, 0, sizeof(v23));
      rhs = v32;
      CMTimeSubtract(&v24, &v23, &rhs);
      v22 = v24;
      objc_msgSend(a2, "setStillTimeOffsetToAudioPrerollStartTime:", &v22);
      if (a2)
        objc_msgSend(a2, "stillImageCaptureTime");
      else
        memset(&v20, 0, sizeof(v20));
      rhs = v31;
      CMTimeSubtract(&v21, &v20, &rhs);
      v19 = v21;
      result = objc_msgSend(a2, "setStillTimeOffsetToAudioPrerollStopTime:", &v19);
      if (*(_QWORD *)(v3 + 768))
      {
        if (!*(_QWORD *)(v3 + 776) && !*(_BYTE *)(v3 + 765))
        {
          result = objc_msgSend(a2, "requiresSubjectRelightingCalculation");
          if ((_DWORD)result)
          {
            *(_BYTE *)(v3 + 765) = 1;
            v12 = (void *)objc_msgSend(*(id *)(v3 + 368), "objectAtIndexedSubscript:", 0);
            memset(&v18, 0, sizeof(v18));
            -[BWIrisStagingNode _hostPTSForSampleBuffer:]((void *)objc_msgSend(v12, "lastObject"), (CMTime *)v3, (uint64_t)&v18);
            memset(&v17, 0, sizeof(v17));
            if (a2)
            {
              objc_msgSend(a2, "stillImageCaptureHostTime");
              timescale = v17.timescale;
            }
            else
            {
              timescale = 0;
            }
            memset(&v16, 0, sizeof(v16));
            CMTimeMake(&v16, timescale / 1000, timescale);
            rhs = v17;
            v38 = v16;
            CMTimeSubtract(&time2, &rhs, &v38);
            rhs = v18;
            result = CMTimeCompare(&rhs, &time2);
            if ((int)result >= 1)
            {
              rhs = v17;
              v38 = v16;
              result = -[BWIrisStagingNode _indexOfBufferBeforeOrEqualToHostPTS:inputIndex:tolerance:](v3, &rhs, 0, &v38);
              if (result != 0x7FFFFFFFFFFFFFFFLL)
              {
                result = (uint64_t)(id)objc_msgSend(*(id *)(v3 + 768), "startCalculationWithJPEGSampleBuffer:stillImageRequestSettings:stillImageCaptureSettings:", objc_msgSend(v12, "objectAtIndexedSubscript:", result), objc_msgSend(a2, "stillImageRequestSettings"), objc_msgSend(a2, "stillImageCaptureSettings"));
                *(_QWORD *)(v3 + 776) = result;
              }
            }
            if (!*(_QWORD *)(v3 + 776))
            {
              if (dword_1ECFE94F0)
              {
                os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
                return fig_log_call_emit_and_clean_up_after_send_and_compose();
              }
            }
          }
        }
      }
    }
  }
  return result;
}

- (void)closeValve
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *v4;
  BWStats *overallVideoFrameReceptionStats;
  double v6;
  double v7;
  double v8;
  double v9;
  NSObject *v10;
  unsigned int v11;
  unsigned int v12;
  id v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  int *v22;
  uint64_t v23;
  __int128 v24;
  os_log_type_t type;
  unsigned int v26;
  int v27;
  const char *v28;
  __int16 v29;
  BWIrisStagingNode *v30;
  __int16 v31;
  id v32;
  __int16 v33;
  double v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  pthread_mutex_lock(*(pthread_mutex_t **)&self->_emittedIrisRequestCount);
  if (LOBYTE(self->_droppedFramePTSs))
  {
    if (dword_1ECFE94F0)
    {
      v26 = 0;
      type = OS_LOG_TYPE_DEFAULT;
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    overallVideoFrameReceptionStats = self->_overallVideoFrameReceptionStats;
    if (overallVideoFrameReceptionStats)
    {
      -[BWStats average](overallVideoFrameReceptionStats, "average");
      v7 = v6;
      -[BWStats multiplier](self->_overallVideoFrameReceptionStats, "multiplier");
      if (v8 > 0.0)
      {
        -[BWStats multiplier](self->_overallVideoFrameReceptionStats, "multiplier");
        v7 = v7 / v9;
      }
      if (dword_1ECFE94F0)
      {
        v26 = 0;
        type = OS_LOG_TYPE_DEFAULT;
        v10 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        v11 = v26;
        if (os_log_type_enabled(v10, type))
          v12 = v11;
        else
          v12 = v11 & 0xFFFFFFFE;
        if (v12)
        {
          v13 = -[BWStats description](self->_overallVideoFrameReceptionStats, "description");
          v14 = 0.0;
          v27 = 136315906;
          v28 = "-[BWIrisStagingNode closeValve]";
          v29 = 2048;
          v30 = self;
          v31 = 2112;
          v32 = v13;
          if (v7 > 0.0)
            v14 = 1.0 / v7;
          v33 = 2048;
          v34 = v14;
          LODWORD(v23) = 42;
          v22 = &v27;
          _os_log_send_and_compose_impl();
        }
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }

      self->_overallVideoFrameReceptionStats = 0;
    }
    v15 = -[BWIrisStagingNode _emittingInputsCount]((uint64_t)self);
    v16 = MEMORY[0x1E0CA2E18];
    if (v15)
    {
      v17 = v15;
      v18 = 0;
      v19 = 0;
      v24 = *MEMORY[0x1E0CA2E18];
      v20 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
      do
      {
        -[NSMutableArray setObject:atIndexedSubscript:](self->_stagingQueues, "setObject:atIndexedSubscript:", objc_msgSend(MEMORY[0x1E0C99E38], "null", v22, v23), v19);
        v21 = (char *)self->_stateMutex + v18;
        *(_OWORD *)v21 = v24;
        *((_QWORD *)v21 + 2) = v20;
        ++v19;
        v18 += 24;
      }
      while (v17 != v19);
    }
    LOBYTE(self->_droppedFramePTSs) = 0;
    *(_OWORD *)&self->_valveOpen = *(_OWORD *)v16;
    *(_QWORD *)&self->_valveDiscontinuitySearchLimit.timescale = *(_QWORD *)(v16 + 16);
    BYTE1(self->_droppedFramePTSs) = 0;
    BYTE2(self->_droppedFramePTSs) = 0;
    BYTE5(self->_limitedGMErrorLogger) = 0;

    self->_subjectRelightingCalculator = 0;
    -[BWIrisSequenceAdjuster reset](self->_sequenceAdjusterBackingStore, "reset");
    self->_sequenceAdjusterBackingStore = 0;
    if (objc_msgSend((id)self->_valveOpenerSettingsID, "count"))
    {
      objc_msgSend(*(id *)&self->_visMotionMetadataPreloadingMode, "stagingNode:valveClosedWithPendingIrisRequests:", self, self->_valveOpenerSettingsID);
      objc_msgSend((id)self->_valveOpenerSettingsID, "removeAllObjects");
    }
    if (self->_flushAndSuspendPending)
      -[BWIrisStagingNode _flushAndSuspendStaging]((uint64_t)self);
  }
  else if (dword_1ECFE94F0)
  {
    v26 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    v4 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  pthread_mutex_unlock(*(pthread_mutex_t **)&self->_emittedIrisRequestCount);
}

- (uint64_t)_flushAndSuspendStaging
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    FigSimpleMutexCheckIsLockedOnThisThread();
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    v2 = *(void **)(v1 + 368);
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v9;
      do
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v9 != v5)
            objc_enumerationMutation(v2);
          objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * i), "removeAllObjects");
        }
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      }
      while (v4);
    }
    objc_msgSend(*(id *)(v1 + 624), "flush");
    objc_msgSend(*(id *)(v1 + 632), "flush");
    *(_BYTE *)(v1 + 192) = 1;
    v7 = MEMORY[0x1E0CA2E18];
    *(_OWORD *)(v1 + 196) = *MEMORY[0x1E0CA2E18];
    *(_QWORD *)(v1 + 212) = *(_QWORD *)(v7 + 16);
    *(_BYTE *)(v1 + 193) = 0;
    return objc_msgSend(*(id *)(v1 + 16), "suspendResources");
  }
  return result;
}

- (BOOL)valveIsOpen
{
  return (BOOL)self->_droppedFramePTSs;
}

- (int)enqueueIrisRequest:(id)a3
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *v6;
  int v7;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  int v15;
  int v16;
  int v17;
  NSObject *v18;
  unsigned int v19;
  unsigned int v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  NSObject *v26;
  unsigned int v27;
  unsigned int v28;
  uint64_t v29;
  int v30;
  int v31;
  NSObject *v32;
  unsigned int v33;
  unsigned int v34;
  uint64_t v35;
  int v36;
  int v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  NSURL *masterMovieURL;
  int v42;
  os_log_type_t type;
  unsigned int v44;
  int v45;
  const char *v46;
  __int16 v47;
  BWIrisStagingNode *v48;
  __int16 v49;
  uint64_t v50;
  __int16 v51;
  int v52;
  __int16 v53;
  int v54;
  __int16 v55;
  int v56;
  __int16 v57;
  int v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  pthread_mutex_lock(*(pthread_mutex_t **)&self->_emittedIrisRequestCount);
  if (objc_msgSend((id)objc_msgSend(a3, "settings"), "settingsID") < self->_valveDiscontinuitySearchLimit.epoch)
  {
    if (dword_1ECFE94F0)
    {
      v44 = 0;
      type = OS_LOG_TYPE_DEFAULT;
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    v7 = -16954;
    goto LABEL_11;
  }
  if (!LOBYTE(self->_droppedFramePTSs) || BYTE2(self->_droppedFramePTSs) || BYTE1(self->_droppedFramePTSs))
  {
    if (dword_1ECFE94F0)
    {
      v44 = 0;
      type = OS_LOG_TYPE_DEFAULT;
      v6 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    v7 = -16953;
    goto LABEL_11;
  }
  if (dword_1ECFE94F0)
  {
    v44 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    v9 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v42 = -[BWIrisStagingNode _momentCaptureMovieRecordingInProgress]((uint64_t)self);
  FigSimpleMutexCheckIsLockedOnThisThread();
  masterMovieURL = self->_masterMovieURL;
  v10 = (void *)objc_msgSend((id)self->_valveOpenerSettingsID, "firstObject");
  v11 = objc_msgSend(v10, "semanticStyle");
  v12 = (void *)objc_msgSend(a3, "semanticStyle");
  v13 = v12;
  if (v12 == (void *)v11)
    v14 = 0;
  else
    v14 = objc_msgSend(v12, "isEqual:", v11) ^ 1;
  v15 = objc_msgSend((id)objc_msgSend(v10, "settings", v38, v39), "smartStyleReversibilitySupported");
  v16 = objc_msgSend((id)objc_msgSend(a3, "settings"), "smartStyleReversibilitySupported");
  if (BYTE3(self->_subjectRelightingResult))
    v17 = v15 ^ v16;
  else
    v17 = 0;
  if ((objc_msgSend(a3, "isMomentCaptureMovieRecording") & 1) != 0
    || v42 != objc_msgSend(a3, "isMomentCaptureMovieRecording")
    || objc_msgSend(a3, "spatialOverCaptureExpected") && !masterMovieURL)
  {
    if (!dword_1ECFE94F0)
    {
LABEL_43:
      v7 = -16957;
      goto LABEL_11;
    }
    v44 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    v18 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v19 = v44;
    if (os_log_type_enabled(v18, type))
      v20 = v19;
    else
      v20 = v19 & 0xFFFFFFFE;
    if (v20)
    {
      v40 = objc_msgSend((id)objc_msgSend(a3, "settings"), "settingsID");
      if (objc_msgSend(a3, "isMomentCaptureMovieRecording"))
        v21 = 84;
      else
        v21 = 70;
      if (v42)
        v22 = 84;
      else
        v22 = 70;
      v23 = objc_msgSend(a3, "spatialOverCaptureExpected");
      v45 = 136316674;
      v46 = "-[BWIrisStagingNode enqueueIrisRequest:]";
      if (v23)
        v24 = 84;
      else
        v24 = 70;
      v47 = 2048;
      if (masterMovieURL)
        v25 = 84;
      else
        v25 = 70;
      v48 = self;
      v49 = 2048;
      v50 = v40;
      v51 = 1024;
      v52 = v21;
      v53 = 1024;
      v54 = v22;
      v55 = 1024;
      v56 = v24;
      v57 = 1024;
      v58 = v25;
      _os_log_send_and_compose_impl();
    }
LABEL_42:
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    goto LABEL_43;
  }
  if (!v14)
  {
    if (!v17)
    {
      -[BWIrisStagingNode _enqueueIrisRequest:]((uint64_t)self, a3);
      v7 = 0;
      goto LABEL_11;
    }
    if (!dword_1ECFE94F0)
      goto LABEL_43;
    v44 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    v32 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v33 = v44;
    if (os_log_type_enabled(v32, type))
      v34 = v33;
    else
      v34 = v33 & 0xFFFFFFFE;
    if (v34)
    {
      v35 = objc_msgSend((id)objc_msgSend(a3, "settings"), "settingsID");
      v45 = 136316418;
      v46 = "-[BWIrisStagingNode enqueueIrisRequest:]";
      if (v16)
        v36 = 84;
      else
        v36 = 70;
      v47 = 2048;
      v48 = self;
      if (v15)
        v37 = 84;
      else
        v37 = 70;
      v49 = 2048;
      v50 = v35;
      v51 = 1024;
      v52 = v36;
      v53 = 1024;
      v54 = v37;
      v55 = 1024;
      v56 = 70;
      _os_log_send_and_compose_impl();
    }
    goto LABEL_42;
  }
  if (dword_1ECFE94F0)
  {
    v44 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    v26 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v27 = v44;
    if (os_log_type_enabled(v26, type))
      v28 = v27;
    else
      v28 = v27 & 0xFFFFFFFE;
    if (v28)
    {
      v29 = objc_msgSend((id)objc_msgSend(a3, "settings"), "settingsID");
      v45 = 136316418;
      v46 = "-[BWIrisStagingNode enqueueIrisRequest:]";
      if (v13)
        v30 = 84;
      else
        v30 = 70;
      v47 = 2048;
      v48 = self;
      if (v11)
        v31 = 84;
      else
        v31 = 70;
      v49 = 2048;
      v50 = v29;
      v51 = 1024;
      v52 = v30;
      v53 = 1024;
      v54 = v31;
      v55 = 1024;
      v56 = 84;
      _os_log_send_and_compose_impl();
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v7 = -15543;
LABEL_11:
  pthread_mutex_unlock(*(pthread_mutex_t **)&self->_emittedIrisRequestCount);
  return v7;
}

- (uint64_t)_momentCaptureMovieRecordingInProgress
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    FigSimpleMutexCheckIsLockedOnThisThread();
    v8 = 0u;
    v9 = 0u;
    v6 = 0u;
    v7 = 0u;
    v2 = *(void **)(v1 + 432);
    result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    if (result)
    {
      v3 = result;
      v4 = *(_QWORD *)v7;
      while (2)
      {
        v5 = 0;
        do
        {
          if (*(_QWORD *)v7 != v4)
            objc_enumerationMutation(v2);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v6 + 1) + 8 * v5), "isMomentCaptureMovieRecording") & 1) != 0)
            return 1;
          ++v5;
        }
        while (v3 != v5);
        result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
        v3 = result;
        if (result)
          continue;
        break;
      }
    }
  }
  return result;
}

- (void)prepareToFinishAllEnqueuedIrisRequestsWithEndTime:(id *)a3
{
  __int128 v5;
  $95D729B680665BEAEFA1D6FCA8238556 endIrisMovieCaptureTime;
  CMTime time1;

  pthread_mutex_lock(*(pthread_mutex_t **)&self->_emittedIrisRequestCount);
  time1 = *(CMTime *)a3;
  endIrisMovieCaptureTime = self->_endIrisMovieCaptureTime;
  if (CMTimeCompare(&time1, (CMTime *)&endIrisMovieCaptureTime) < 0)
  {
    v5 = *(_OWORD *)&a3->var0;
    self->_endIrisMovieCaptureTime.epoch = a3->var3;
    *(_OWORD *)&self->_endIrisMovieCaptureTime.value = v5;
  }
  BYTE1(self->_droppedFramePTSs) = 1;
  pthread_mutex_unlock(*(pthread_mutex_t **)&self->_emittedIrisRequestCount);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)beginIrisMovieCaptureTime
{
  retstr->var0 = 0;
  *(_QWORD *)&retstr->var1 = 0;
  retstr->var3 = 0;
  pthread_mutex_lock(*(pthread_mutex_t **)&self->_emittedIrisRequestCount);
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = self->_beginIrisMovieCaptureTime;
  return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)pthread_mutex_unlock(*(pthread_mutex_t **)&self->_emittedIrisRequestCount);
}

- (void)setBeginIrisMovieCaptureTime:(id *)a3
{
  int64_t var3;

  pthread_mutex_lock(*(pthread_mutex_t **)&self->_emittedIrisRequestCount);
  var3 = a3->var3;
  *(_OWORD *)&self->_beginIrisMovieCaptureTime.value = *(_OWORD *)&a3->var0;
  self->_beginIrisMovieCaptureTime.epoch = var3;
  self->_endIrisMovieCaptureTime = *($95D729B680665BEAEFA1D6FCA8238556 *)*(_QWORD *)&MEMORY[0x1E0CA2E18];
  -[BWIrisStagingNode _resumeStaging]((uint64_t)self);
  pthread_mutex_unlock(*(pthread_mutex_t **)&self->_emittedIrisRequestCount);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)endIrisMovieCaptureTime
{
  retstr->var0 = 0;
  *(_QWORD *)&retstr->var1 = 0;
  retstr->var3 = 0;
  pthread_mutex_lock(*(pthread_mutex_t **)&self->_emittedIrisRequestCount);
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = self->_endIrisMovieCaptureTime;
  return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)pthread_mutex_unlock(*(pthread_mutex_t **)&self->_emittedIrisRequestCount);
}

- (void)setEndIrisMovieCaptureTime:(id *)a3
{
  int64_t var3;

  pthread_mutex_lock(*(pthread_mutex_t **)&self->_emittedIrisRequestCount);
  var3 = a3->var3;
  *(_OWORD *)&self->_endIrisMovieCaptureTime.value = *(_OWORD *)&a3->var0;
  self->_endIrisMovieCaptureTime.epoch = var3;
  self->_beginIrisMovieCaptureTime = *($95D729B680665BEAEFA1D6FCA8238556 *)*(_QWORD *)&MEMORY[0x1E0CA2E18];
  -[BWIrisStagingNode _suspendStaging]((uint64_t)self);
  pthread_mutex_unlock(*(pthread_mutex_t **)&self->_emittedIrisRequestCount);
}

- (uint64_t)_suspendStaging
{
  _BYTE *v1;

  if (result)
  {
    v1 = (_BYTE *)result;
    result = FigSimpleMutexCheckIsLockedOnThisThread();
    if (!v1[192])
    {
      if (v1[392])
        v1[193] = 1;
      else
        return -[BWIrisStagingNode _flushAndSuspendStaging]((uint64_t)v1);
    }
  }
  return result;
}

- (void)setMomentCaptureMovieRecordingMasterEndTime:(id *)a3 forRequestWithSettingsID:(int64_t)a4
{
  void *valveOpenerSettingsID;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  int64_t var3;
  os_log_type_t type;
  int v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  pthread_mutex_lock(*(pthread_mutex_t **)&self->_emittedIrisRequestCount);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  valveOpenerSettingsID = (void *)self->_valveOpenerSettingsID;
  v8 = objc_msgSend(valveOpenerSettingsID, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v21;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(valveOpenerSettingsID);
        v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        if (objc_msgSend((id)objc_msgSend(v12, "settings"), "settingsID") == a4)
        {
          if (dword_1ECFE94F0)
          {
            v19 = 0;
            type = OS_LOG_TYPE_DEFAULT;
            os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();
          }
          v16 = *(_OWORD *)&a3->var0;
          var3 = a3->var3;
          objc_msgSend(v12, "setMomentCaptureMovieRecordingMasterEndTime:", &v16, v14, v15);
          goto LABEL_13;
        }
      }
      v9 = objc_msgSend(valveOpenerSettingsID, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v9)
        continue;
      break;
    }
  }
LABEL_13:
  pthread_mutex_unlock(*(pthread_mutex_t **)&self->_emittedIrisRequestCount);
}

- (BOOL)waitUntilReadyToReceiveRequestsWithTimeout:(float)a3
{
  BOOL v5;
  void *v7;
  NSObject *v8;
  dispatch_group_t v9;
  dispatch_time_t v10;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  pthread_mutex_lock(*(pthread_mutex_t **)&self->_emittedIrisRequestCount);
  if (BYTE2(self->_emissionMap))
  {
    pthread_mutex_unlock(*(pthread_mutex_t **)&self->_emittedIrisRequestCount);
    return 1;
  }
  else
  {
    v7 = *(void **)&self->_haveSeenFirstAudioSampleBuffer;
    if (v7)
    {
      v8 = v7;
    }
    else
    {
      v9 = dispatch_group_create();
      *(_QWORD *)&self->_haveSeenFirstAudioSampleBuffer = v9;
      v8 = v9;
      dispatch_group_enter(v8);
    }
    pthread_mutex_unlock(*(pthread_mutex_t **)&self->_emittedIrisRequestCount);
    if (v8)
    {
      mach_absolute_time();
      v10 = dispatch_time(0, (uint64_t)(float)(a3 * 1000000000.0));
      v5 = dispatch_group_wait(v8, v10) == 0;
      mach_absolute_time();

      if (dword_1ECFE94F0)
      {
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
    }
    else
    {
      return 0;
    }
  }
  return v5;
}

- (NSURL)temporaryMovieDirectoryURL
{
  return (NSURL *)self->_masterMovieStartPTS.epoch;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)targetFrameDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[5];
  return self;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)bufferingTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[4];
  return self;
}

- (OpaqueCMClock)masterClock
{
  return (OpaqueCMClock *)self->_firstEmittedPTSArray;
}

- ($2ACC23B9A21F50F5CC728381CA870116)vitalityScoringSmartCameraPipelineVersion
{
  return ($2ACC23B9A21F50F5CC728381CA870116)(*(unsigned int *)((char *)&self->_masterClock + 6) | ((unint64_t)HIWORD(self->_trimMethod) << 32));
}

- (int)intermediateJPEGDownstreamRetainedBufferCount
{
  return LODWORD(self->_intermediateJPEGCompressionQuality);
}

- (BOOL)applyPreviewShift
{
  return (BOOL)self->_subjectRelightingResult;
}

- (uint64_t)_indexOfBufferBeforeOrEqualToHostPTS:(uint64_t)a3 inputIndex:(CMTime *)a4 tolerance:
{
  void *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  int32_t v11;
  unint64_t v12;
  CMTime time2;
  CMTime rhs;
  CMTime lhs;
  CMTime v17;
  CMTime v18;

  if (!a1)
    return 0;
  v7 = (void *)objc_msgSend(*(id *)(a1 + 368), "objectAtIndexedSubscript:");
  v8 = objc_msgSend(v7, "count");
  if (!v8)
    return 0x7FFFFFFFFFFFFFFFLL;
  v9 = v8;
  v10 = 0;
  while (1)
  {
    memset(&v18, 0, sizeof(v18));
    -[BWIrisStagingNode _hostPTSForSampleBuffer:]((void *)objc_msgSend(v7, "objectAtIndexedSubscript:", v10), (CMTime *)a1, (uint64_t)&v18);
    memset(&v17, 0, sizeof(v17));
    lhs = v18;
    rhs = *a2;
    CMTimeSubtract(&v17, &lhs, &rhs);
    lhs = v17;
    CMTimeAbsoluteValue(&time2, &lhs);
    lhs = *a4;
    if ((CMTimeCompare(&lhs, &time2) & 0x80000000) == 0)
      break;
    lhs = v18;
    rhs = *a2;
    v11 = CMTimeCompare(&lhs, &rhs);
    if (v11 < 1)
      ++v10;
    if (v10 >= v9 || v11 >= 1)
    {
      v12 = v10 - 1;
      if (!v10)
        v12 = 0;
      if (v11 <= 0)
        return 0x7FFFFFFFFFFFFFFFLL;
      else
        return v12;
    }
  }
  return v10;
}

- (CMTime)_maxPTSForIrisRequest:(uint64_t)a3@<X8>
{
  CMTime *v5;
  CMTime v6;
  CMTime lhs;
  CMTime time2;
  CMTime time1;

  if (result)
  {
    v5 = result;
    if (objc_msgSend(a2, "isMomentCaptureMovieRecording"))
    {
      if (a2)
      {
        objc_msgSend(a2, "stillImageCaptureTime");
        objc_msgSend(a2, "momentCaptureMovieRecordingMasterEndTime");
      }
      else
      {
        memset(&time1, 0, sizeof(time1));
        memset(&time2, 0, sizeof(time2));
      }
      return CMTimeMaximum((CMTime *)a3, &time1, &time2);
    }
    else
    {
      if (a2)
        objc_msgSend(a2, "stillImageCaptureTime");
      else
        memset(&lhs, 0, sizeof(lhs));
      v6 = v5[4];
      return CMTimeAdd((CMTime *)a3, &lhs, &v6);
    }
  }
  else
  {
    *(_QWORD *)a3 = 0;
    *(_QWORD *)(a3 + 8) = 0;
    *(_QWORD *)(a3 + 16) = 0;
  }
  return result;
}

- (void)_emitIrisMovieRequestWithInfo:(void *)a1
{
  __int128 v4;
  CMTimeEpoch v5;
  __int128 v6;
  CMTimeEpoch v7;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  void *v9;
  CMSampleTimingInfo sampleTimingArray;
  CMAttachmentBearerRef target;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    target = 0;
    v4 = *(_OWORD *)(MEMORY[0x1E0CA2E90] + 48);
    *(_OWORD *)&sampleTimingArray.presentationTimeStamp.timescale = *(_OWORD *)(MEMORY[0x1E0CA2E90] + 32);
    *(_OWORD *)&sampleTimingArray.decodeTimeStamp.value = v4;
    v5 = *(_QWORD *)(MEMORY[0x1E0CA2E90] + 64);
    v6 = *(_OWORD *)(MEMORY[0x1E0CA2E90] + 16);
    *(_OWORD *)&sampleTimingArray.duration.value = *MEMORY[0x1E0CA2E90];
    *(_OWORD *)&sampleTimingArray.duration.epoch = v6;
    *(_OWORD *)&sampleTimingArray.presentationTimeStamp.value = *MEMORY[0x1E0CA2E28];
    v7 = *(_QWORD *)(MEMORY[0x1E0CA2E28] + 16);
    sampleTimingArray.decodeTimeStamp.epoch = v5;
    sampleTimingArray.presentationTimeStamp.epoch = v7;
    if (!CMSampleBufferCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 1u, 0, 0, 0, 0, 1, &sampleTimingArray, 0, 0, (CMSampleBufferRef *)&target))
    {
      if (dword_1ECFE94F0)
      {
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      CMSetAttachment(target, CFSTR("IrisMovieRequest"), a2, 1u);
      v9 = (void *)objc_msgSend(a1, "output");
      objc_msgSend(v9, "emitSampleBuffer:", target);
      if (target)
        CFRelease(target);
    }
  }
}

- (uint64_t)_emitBuffersThroughPTS:(uint64_t)result
{
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  uint64_t i;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  int *v12;
  CMTime *v13;
  int32_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  int *v18;
  unint64_t *v19;
  unint64_t v20;
  char v21;
  BOOL v22;
  _QWORD v23[2];
  id v24;
  CMTime *v25;
  int v26;
  _QWORD *v27;
  _QWORD *v28;
  CMTime rhs;
  CMTime time2;
  CMTime time1;
  CMTime v32;
  CMTime v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v3 = result;
    FigSimpleMutexCheckIsLockedOnThisThread();
    FigSimpleMutexCheckIsLockedOnThisThread();
    result = objc_msgSend((id)objc_msgSend((id)v3, "inputs"), "count");
    v4 = *(_QWORD *)(v3 + 536) == result - 1 ? result - 1 : result;
    if (v4)
    {
      v25 = a2;
      v23[1] = v23;
      v28 = (_QWORD *)((char *)v23 - ((8 * v4 + 15) & 0xFFFFFFFFFFFFFFF0));
      v27 = v28;
      v5 = (char *)v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
      for (i = 0; i != v4; ++i)
      {
        v7 = (void *)objc_msgSend(*(id *)(v3 + 368), "objectAtIndexedSubscript:", i);
        v8 = objc_msgSend(*(id *)(v3 + 376), "objectAtIndexedSubscript:", i);
        if (v8 == objc_msgSend(MEMORY[0x1E0C99E38], "null"))
        {
          v10 = 0;
        }
        else
        {
          v9 = objc_msgSend(v7, "indexOfObjectIdenticalTo:", objc_msgSend(*(id *)(v3 + 376), "objectAtIndexedSubscript:", i));
          if (v9 == 0x7FFFFFFFFFFFFFFFLL)
            v10 = 0;
          else
            v10 = v9 + 1;
        }
        v11 = objc_msgSend(v7, "count");
        v28[i] = v11;
        v27[i] = v10;
        v5[i] = v10 >= v11;
      }
      v24 = (id)objc_msgSend(*(id *)(v3 + 368), "objectAtIndexedSubscript:", 0);
      v12 = &OBJC_IVAR___BWQuickTimeMovieFileSinkNode__stereoVideoCaptureDuration;
      do
      {
        v13 = v25;
        v33 = *v25;
        if (!*v5 && (unint64_t)(*v27 + 1) < *v28)
        {
          memset(&v32, 0, sizeof(v32));
          CMSampleBufferGetPresentationTimeStamp(&v32, (CMSampleBufferRef)objc_msgSend(v24, "objectAtIndexedSubscript:"));
          time1 = v32;
          time2 = *v13;
          if (CMTimeCompare(&time1, &time2) <= 0)
          {
            CMTimeMake(&rhs, v32.timescale / 1000, v32.timescale);
            time1 = v32;
            CMTimeSubtract(&v33, &time1, &rhs);
          }
        }
        v32 = v33;
        time1 = *v13;
        v14 = CMTimeCompare(&v32, &time1);
        v15 = 0;
        v26 = 0;
        do
        {
          v16 = *(_QWORD *)(*(_QWORD *)(v3 + v12[680]) + 8 * v15);
          result = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)v3, "inputs"), "objectAtIndexedSubscript:", v16), "mediaType");
          if ((_DWORD)result == 1936684398 && !*(_BYTE *)(v3 + 395))
          {
            result = objc_msgSend(*(id *)(v3 + 560), "readyToReleaseAudio");
            v17 = result;
          }
          else
          {
            v17 = 0;
          }
          if (!v5[v16])
          {
            v18 = v12;
            v19 = &v27[v16];
            v20 = v28[v16];
            v32 = v33;
            result = -[BWIrisStagingNode _emitBuffersThroughPTS:forInputIndex:inOutBufferIndex:bufferCount:](v3, &v32, v16, v19, v20);
            if (*(_BYTE *)(v3 + 395))
            {
              v21 = 1;
            }
            else if ((int)result > 0)
            {
              v21 = v17;
            }
            else
            {
              v21 = 0;
            }
            *(_BYTE *)(v3 + 395) = v21;
            if (v14 && (_DWORD)result)
            {
              v22 = *v19 == v20;
              v5[v16] = v22;
              v12 = v18;
              if (!v22)
                ++v26;
            }
            else
            {
              v5[v16] = 1;
              v12 = v18;
            }
          }
          ++v15;
        }
        while (v4 != v15);
      }
      while (v26 > 0);
    }
  }
  return result;
}

- (uint64_t)_emitBuffersThroughPTS:(uint64_t)a3 forInputIndex:(unint64_t *)a4 inOutBufferIndex:(unint64_t)a5 bufferCount:
{
  unint64_t v10;
  uint64_t v11;
  opaqueCMSampleBuffer *v12;
  const __CFDictionary *v13;
  __int128 *v14;
  __int128 v15;
  id v16;
  unsigned int v18;
  unint64_t *v19;
  void *v20;
  CMTime v21;
  CMTime time2;
  CMTime time1;
  CMTime v24;

  if (!a1)
    return 0;
  v20 = (void *)objc_msgSend(*(id *)(a1 + 368), "objectAtIndexedSubscript:");
  v10 = *a4;
  FigSimpleMutexCheckIsLockedOnThisThread();
  if (v10 >= a5)
  {
    v11 = 0;
  }
  else
  {
    v19 = a4;
    v11 = 0;
    v18 = a5 - v10;
    while (1)
    {
      v12 = (opaqueCMSampleBuffer *)objc_msgSend(v20, "objectAtIndexedSubscript:", v10);
      memset(&v24, 0, sizeof(v24));
      CMSampleBufferGetPresentationTimeStamp(&v24, v12);
      time1 = *a2;
      time2 = v24;
      if (CMTimeCompare(&time1, &time2) < 0)
        break;
      if (!a3 && objc_msgSend(*(id *)(a1 + 384), "count"))
      {
        while (objc_msgSend(*(id *)(a1 + 384), "count"))
        {
          v13 = (const __CFDictionary *)objc_msgSend(*(id *)(a1 + 384), "objectAtIndexedSubscript:", 0);
          memset(&time1, 0, sizeof(time1));
          CMTimeMakeFromDictionary(&time1, v13);
          v14 = *(__int128 **)(a1 + 464);
          time2 = time1;
          v15 = *v14;
          v21.epoch = *((_QWORD *)v14 + 2);
          *(_OWORD *)&v21.value = v15;
          if (CMTimeCompare(&time2, &v21) >= 1)
          {
            time2 = time1;
            v21 = v24;
            if (CMTimeCompare(&time2, &v21) > 0)
              break;
            time2 = time1;
            v16 = +[BWDroppedSample newDroppedSampleWithReason:pts:](BWDroppedSample, "newDroppedSampleWithReason:pts:", 0x1E494EF78, &time2);
            objc_msgSend(*(id *)(a1 + 16), "emitDroppedSample:", v16);

          }
          objc_msgSend(*(id *)(a1 + 384), "removeObject:", v13);
        }
      }
      -[BWIrisStagingNode _emitSampleBuffer:forInputIndex:]((CMTime *)a1, v12, a3);
      v11 = (v11 + 1);
      if (++v10 == a5)
      {
        v11 = v18;
        v10 = a5;
        break;
      }
    }
    a4 = v19;
  }
  *a4 = v10;
  return v11;
}

uint64_t __53__BWIrisStagingNode__emitSampleBuffer_forInputIndex___block_invoke(uint64_t a1, void *a2, uint64_t a3, BOOL *a4)
{
  uint64_t result;
  uint64_t v8;
  CMTime v9;
  CMTime time2;
  CMTime lhs;
  CMTime v12;
  CMTime v13;

  result = objc_msgSend(a2, "stillImageEncoderKeyFrameEmitted");
  if ((result & 1) == 0)
  {
    memset(&v13, 0, sizeof(v13));
    if (a2)
      objc_msgSend(a2, "stillImageCaptureTime");
    result = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 560);
    if (result)
    {
      lhs = v13;
      result = objc_msgSend((id)result, "adjustedTimeForStillImageTime:", &lhs);
      v13 = v12;
    }
    if ((v13.flags & 1) != 0)
    {
      memset(&v12, 0, sizeof(v12));
      result = (uint64_t)CMTimeMake(&v12, v13.timescale / 1000, v13.timescale);
      if ((~v13.flags & 0x11) != 0)
      {
        v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        lhs = v13;
        v9 = v12;
        CMTimeSubtract(&time2, &lhs, &v9);
        lhs = *(CMTime *)(v8 + 32);
        result = CMTimeCompare(&lhs, &time2);
        *a4 = (int)result < 0;
        if ((result & 0x80000000) == 0)
        {
          CMSetAttachment(*(CMAttachmentBearerRef *)(a1 + 48), (CFStringRef)*MEMORY[0x1E0CA26A8], (CFTypeRef)*MEMORY[0x1E0C9AE50], 1u);
          return objc_msgSend(a2, "setStillImageEncoderKeyFrameEmitted:", 1);
        }
      }
      else
      {
        *a4 = 1;
      }
    }
  }
  return result;
}

- (unint64_t)_indexOfBufferBeforeOrEqualToPTS:(id *)a3 inputIndex:(unint64_t)a4 applyFrameDropsMitigation:(BOOL)a5
{
  _BOOL4 v5;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  int32_t v12;
  unint64_t result;
  opaqueCMSampleBuffer *v14;
  opaqueCMSampleBuffer *v15;
  CMTime v16;
  CMTime rhs;
  CMTime v18;
  CMTime time2;
  CMTime time1;
  CMTime v21;

  v5 = a5;
  v8 = (void *)-[NSURL objectAtIndexedSubscript:](self->_spatialOverCaptureMasterMovieURL, "objectAtIndexedSubscript:", a4);
  v9 = objc_msgSend(v8, "count");
  if (!v9)
    return 0x7FFFFFFFFFFFFFFFLL;
  v10 = v9;
  v11 = 0;
  do
  {
    memset(&v21, 0, sizeof(v21));
    CMSampleBufferGetPresentationTimeStamp(&v21, (CMSampleBufferRef)objc_msgSend(v8, "objectAtIndexedSubscript:", v11));
    time1 = v21;
    time2 = (CMTime)*a3;
    v12 = CMTimeCompare(&time1, &time2);
    if (v12 < 1)
      ++v11;
  }
  while (v11 < v10 && v12 < 1);
  if (v12 < 1)
    return 0x7FFFFFFFFFFFFFFFLL;
  if (v11)
    result = v11 - 1;
  else
    result = 0;
  if (v11 && v5)
  {
    v14 = (opaqueCMSampleBuffer *)objc_msgSend(v8, "objectAtIndexedSubscript:", v11 - 1);
    memset(&v21, 0, sizeof(v21));
    CMSampleBufferGetPresentationTimeStamp(&v21, v14);
    v15 = (opaqueCMSampleBuffer *)objc_msgSend(v8, "objectAtIndexedSubscript:", v11);
    memset(&time1, 0, sizeof(time1));
    CMSampleBufferGetPresentationTimeStamp(&time1, v15);
    time2 = time1;
    rhs = v21;
    CMTimeSubtract(&v18, &time2, &rhs);
    time2 = (CMTime)self->_targetFrameDuration;
    CMTimeMultiply(&v16, &time2, 3);
    if (CMTimeCompare(&v18, &v16) <= 0)
      return v11 - 1;
    else
      return v11;
  }
  return result;
}

- (uint64_t)_processQueuedVideoFrames
{
  uint64_t v1;
  void *v2;
  unint64_t v3;
  unint64_t v4;
  void *v5;
  int v6;
  __int128 *v7;
  uint64_t v8;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  opaqueCMSampleBuffer *v17;
  unint64_t v18;
  int *v19;
  opaqueCMSampleBuffer *v20;
  int v21;
  int v22;
  _OWORD *v23;
  __int128 v24;
  __int128 v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  int32_t v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  int32_t v43;
  uint64_t v44;
  _OWORD *v45;
  uint64_t v46;
  CMTimeEpoch v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  void *v54;
  unint64_t v55;
  CMTime v56;
  CMTime v57;
  CMTime v58;
  CMTime v59;
  CMTime v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  CMTime v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  CMTime type;
  CMTime v70;
  CMTime lhs;
  CMTime v72;
  CMTime time1;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  CMTime v78;
  CMTime rhs;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  CMTime v84;
  CMTime v85;
  _BYTE v86[128];
  __int128 time2;
  __int128 time2_16;
  __int128 v89;
  __int128 v90;
  uint64_t v91;
  _BYTE v92[128];
  _BYTE v93[128];
  CMTime time[2];
  __int128 v95;
  uint64_t v96;
  uint64_t v97;

  v97 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    v2 = (void *)objc_msgSend(*(id *)(result + 368), "objectAtIndexedSubscript:", 0);
    v3 = objc_msgSend(v2, "count");
    v4 = v3;
    v53 = v3;
    v54 = v2;
    if (*(_QWORD *)(v1 + 560) && (*(_BYTE *)(v1 + 412) & 1) != 0 && v3 >= 2)
    {
      memset(&v85, 0, sizeof(v85));
      CMSampleBufferGetPresentationTimeStamp(&v85, (CMSampleBufferRef)objc_msgSend(v2, "objectAtIndexedSubscript:", v3 - 1));
      memset(&v84, 0, sizeof(v84));
      CMSampleBufferGetPresentationTimeStamp(&v84, (CMSampleBufferRef)objc_msgSend(v2, "objectAtIndexedSubscript:", v4 - 2));
      v5 = *(void **)(v1 + 552);
      time[0] = v85;
      time2 = *(_OWORD *)&v84.value;
      *(_QWORD *)&time2_16 = v84.epoch;
      v6 = objc_msgSend(v5, "discontinuityExistsBetweenCurrentPTS:previousPTS:", time, &time2);
      v7 = (__int128 *)(v1 + 400);
      if (v6)
      {
        v8 = MEMORY[0x1E0CA2E18];
        *v7 = *MEMORY[0x1E0CA2E18];
        *(_QWORD *)(v1 + 416) = *(_QWORD *)(v8 + 16);
        if (dword_1ECFE94F0)
        {
          LODWORD(v78.value) = 0;
          LOBYTE(type.value) = 0;
          os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
          v4 = v53;
        }
      }
      else
      {
        time[0] = v85;
        time2 = *v7;
        *(_QWORD *)&time2_16 = *(_QWORD *)(v1 + 416);
        if ((CMTimeCompare(time, (CMTime *)&time2) & 0x80000000) == 0)
        {
          if (dword_1ECFE94F0)
          {
            LODWORD(v78.value) = 0;
            LOBYTE(type.value) = 0;
            v10 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();
            v4 = v53;
          }
          v11 = MEMORY[0x1E0CA2E18];
          *(_OWORD *)(v1 + 400) = *MEMORY[0x1E0CA2E18];
          *(_QWORD *)(v1 + 416) = *(_QWORD *)(v11 + 16);
        }
      }
    }
    v82 = 0u;
    v83 = 0u;
    v80 = 0u;
    v81 = 0u;
    v12 = (void *)objc_msgSend(v2, "reverseObjectEnumerator", v49, v50);
    result = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v80, v93, 16);
    if (result)
    {
      v13 = result;
      v14 = *(_QWORD *)v81;
      while (2)
      {
        v15 = 0;
        v16 = v4 - v13;
        do
        {
          if (*(_QWORD *)v81 != v14)
            objc_enumerationMutation(v12);
          v17 = *(opaqueCMSampleBuffer **)(*((_QWORD *)&v80 + 1) + 8 * v15);
          memset(time, 0, 24);
          CMSampleBufferGetPresentationTimeStamp(time, v17);
          time2 = *(_OWORD *)&time[0].value;
          *(_QWORD *)&time2_16 = time[0].epoch;
          v85 = *(CMTime *)(v1 + 296);
          result = CMTimeCompare((CMTime *)&time2, &v85);
          if ((int)result < 1)
          {
            v18 = v4 - v15;
            goto LABEL_22;
          }
          ++v15;
        }
        while (v13 != v15);
        result = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v80, v93, 16);
        v13 = result;
        v4 = v16;
        if (result)
          continue;
        break;
      }
      v18 = 0;
LABEL_22:
      v4 = v53;
      v2 = v54;
    }
    else
    {
      v18 = 0;
    }
    if (v18 < v4)
    {
      v19 = &OBJC_IVAR___BWQuickTimeMovieFileSinkNode__stereoVideoCaptureDuration;
      while (1)
      {
        v20 = (opaqueCMSampleBuffer *)objc_msgSend(v2, "objectAtIndexedSubscript:", v18);
        memset(&v85, 0, sizeof(v85));
        CMSampleBufferGetPresentationTimeStamp(&v85, v20);
        v21 = -[BWIrisStagingNode _emissionStatusForSampleBuffer:](v1, v20);
        switch(v21)
        {
          case 1:
          case 2:
            v22 = v21;
            v23 = (_OWORD *)(v1 + 272);
            if ((*(_BYTE *)(v1 + 284) & 1) == 0)
            {
              *v23 = *(_OWORD *)&v85.value;
              *(_QWORD *)(v1 + 288) = v85.epoch;
            }
            v55 = v18;
            v96 = *(_QWORD *)(MEMORY[0x1E0CA2E90] + 64);
            v24 = *(_OWORD *)(MEMORY[0x1E0CA2E90] + 48);
            *(_OWORD *)&time[1].timescale = *(_OWORD *)(MEMORY[0x1E0CA2E90] + 32);
            v95 = v24;
            v25 = *(_OWORD *)(MEMORY[0x1E0CA2E90] + 16);
            *(_OWORD *)&time[0].value = *MEMORY[0x1E0CA2E90];
            *(_OWORD *)&time[0].epoch = v25;
            time[1].epoch = *(_QWORD *)(v1 + 288);
            *(_OWORD *)&time[1].value = *v23;
            CMTimeMake(&rhs, 5, 1000);
            time2 = *(_OWORD *)(v1 + 120);
            *(_QWORD *)&time2_16 = *(_QWORD *)(v1 + 136);
            CMTimeSubtract(time, (CMTime *)&time2, &rhs);
            memset(&v84, 0, sizeof(v84));
            time2 = *(_OWORD *)&time[1].value;
            *(_QWORD *)&time2_16 = time[1].epoch;
            v78 = time[0];
            CMTimeAdd(&v84, (CMTime *)&time2, &v78);
            if (*(_DWORD *)(v1 + 480) == 2)
            {
              v76 = 0uLL;
              v77 = 0uLL;
              v74 = 0uLL;
              v75 = 0uLL;
              v26 = *(void **)(v1 + 432);
              v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v74, v92, 16);
              if (!v27)
              {
LABEL_52:
                v78 = v85;
                v89 = *(_OWORD *)&time[1].timescale;
                v90 = v95;
                v91 = v96;
                time2 = *(_OWORD *)&time[0].value;
                time2_16 = *(_OWORD *)&time[0].epoch;
                -[BWIrisStagingNode _emitIrisRequestsOlderThanTime:withEndingVideoSampleTimingInfo:](v1, (uint64_t)&v78, &time2);
                v4 = v53;
                v2 = v54;
                v19 = &OBJC_IVAR___BWQuickTimeMovieFileSinkNode__stereoVideoCaptureDuration;
                goto LABEL_77;
              }
              v28 = v27;
              v29 = *(_QWORD *)v75;
              while (2)
              {
                v30 = 0;
LABEL_33:
                if (*(_QWORD *)v75 != v29)
                  objc_enumerationMutation(v26);
                v31 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * v30);
                if (v31)
                  objc_msgSend(*(id *)(*((_QWORD *)&v74 + 1) + 8 * v30), "stillImageCaptureTime");
                else
                  memset(&time1, 0, sizeof(time1));
                time2 = *(_OWORD *)&v84.value;
                *(_QWORD *)&time2_16 = v84.epoch;
                if ((CMTimeCompare(&time1, (CMTime *)&time2) & 0x80000000) == 0)
                {
                  if (v31)
                    objc_msgSend(v31, "movieStartTime");
                  else
                    memset(&v72, 0, sizeof(v72));
                  time2 = *(_OWORD *)&v84.value;
                  *(_QWORD *)&time2_16 = v84.epoch;
                  v32 = CMTimeCompare(&v72, (CMTime *)&time2);
                  if (v22 == 2 && v32 < 0)
                  {
                    time2 = *(_OWORD *)&v85.value;
                    *(_QWORD *)&time2_16 = v85.epoch;
                    v78 = *(CMTime *)(v1 + 272);
                    CMTimeSubtract(&lhs, (CMTime *)&time2, &v78);
                    CMTimeMake(&v70, 5, 1000);
                    CMTimeSubtract((CMTime *)&time2, &lhs, &v70);
                    time[0].epoch = time2_16;
                    *(_OWORD *)&time[0].value = time2;
                    v78 = time[1];
                    *(_OWORD *)&type.value = time2;
                    type.epoch = time2_16;
                    CMTimeAdd((CMTime *)&time2, &v78, &type);
                    *(_OWORD *)&v84.value = time2;
                    v84.epoch = time2_16;
                    break;
                  }
LABEL_50:
                  if (v28 == ++v30)
                  {
                    v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v74, v92, 16);
                    if (!v28)
                      goto LABEL_52;
                    continue;
                  }
                  goto LABEL_33;
                }
                break;
              }
              if (v31)
              {
                objc_msgSend(v31, "movieTrimEndTime");
                if ((v67 & 0x100000000) != 0)
                  goto LABEL_50;
              }
              else
              {
                v66 = 0;
                v67 = 0;
                v68 = 0;
              }
              v65 = v84;
              objc_msgSend(v31, "setMovieTrimEndTime:", &v65);
              goto LABEL_50;
            }
            v63 = 0uLL;
            v64 = 0uLL;
            v62 = 0uLL;
            v61 = 0uLL;
            v36 = *(void **)(v1 + 432);
            v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v61, v86, 16);
            if (v37)
            {
              v38 = v37;
              v39 = *(_QWORD *)v62;
              v40 = 0;
              while (2)
              {
                v41 = 0;
                v51 = v40;
                v52 = v40 + v38;
                do
                {
                  if (*(_QWORD *)v62 != v39)
                    objc_enumerationMutation(v36);
                  v42 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * v41);
                  if (v42)
                    objc_msgSend(*(id *)(*((_QWORD *)&v61 + 1) + 8 * v41), "stillImageCaptureTime");
                  else
                    memset(&v60, 0, sizeof(v60));
                  time2 = *(_OWORD *)&v84.value;
                  *(_QWORD *)&time2_16 = v84.epoch;
                  if ((CMTimeCompare(&v60, (CMTime *)&time2) & 0x80000000) == 0)
                  {
                    if (v42)
                      objc_msgSend(v42, "movieStartTime");
                    else
                      memset(&v59, 0, sizeof(v59));
                    time2 = *(_OWORD *)&v84.value;
                    *(_QWORD *)&time2_16 = v84.epoch;
                    v43 = CMTimeCompare(&v59, (CMTime *)&time2);
                    if (v22 != 2 || (v43 & 0x80000000) == 0)
                    {
                      v44 = v51 + v41;
                      goto LABEL_74;
                    }
                    time2 = *(_OWORD *)&v85.value;
                    *(_QWORD *)&time2_16 = v85.epoch;
                    v78 = *(CMTime *)(v1 + 272);
                    CMTimeSubtract(&v58, (CMTime *)&time2, &v78);
                    CMTimeMake(&v57, 5, 1000);
                    CMTimeSubtract((CMTime *)&time2, &v58, &v57);
                    time[0].epoch = time2_16;
                    *(_OWORD *)&time[0].value = time2;
                    v78 = time[1];
                    *(_OWORD *)&type.value = time2;
                    type.epoch = time2_16;
                    CMTimeAdd((CMTime *)&time2, &v78, &type);
                    *(_OWORD *)&v84.value = time2;
                    v84.epoch = time2_16;
                  }
                  v89 = *(_OWORD *)&time[1].timescale;
                  v90 = v95;
                  v91 = v96;
                  time2 = *(_OWORD *)&time[0].value;
                  time2_16 = *(_OWORD *)&time[0].epoch;
                  -[BWIrisStagingNode _emitIrisRequest:withEndingVideoSampleTimingInfo:](v1, v42, (uint64_t)&time2);
                  ++v41;
                }
                while (v38 != v41);
                v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v61, v86, 16);
                v44 = v52;
                v40 = v52;
                if (v38)
                  continue;
                break;
              }
LABEL_74:
              v4 = v53;
              v2 = v54;
              if (v44)
                objc_msgSend(*(id *)(v1 + 432), "removeObjectsInRange:", 0);
            }
            v19 = &OBJC_IVAR___BWQuickTimeMovieFileSinkNode__stereoVideoCaptureDuration;
            if (!objc_msgSend(*(id *)(v1 + 432), "count"))
              goto LABEL_78;
LABEL_77:
            *(CMTime *)(v1 + 272) = v85;
LABEL_78:
            v18 = v55;
LABEL_79:
            *(CMTime *)(v1 + 296) = v85;
            result = objc_msgSend(*(id *)(v1 + v19[654]), "count");
            if (!result)
              return result;
            if (++v18 == v4)
              goto LABEL_81;
            break;
          case 3:
            v33 = *(void **)(v1 + 584);
            time[0] = v85;
            objc_msgSend(v33, "stagingNode:waitingToEmitFrameWithPTS:", v1, time);
            goto LABEL_79;
          case 4:
            v96 = *(_QWORD *)(MEMORY[0x1E0CA2E90] + 64);
            v34 = *(_OWORD *)(MEMORY[0x1E0CA2E90] + 48);
            *(_OWORD *)&time[1].timescale = *(_OWORD *)(MEMORY[0x1E0CA2E90] + 32);
            v95 = v34;
            v35 = *(_OWORD *)(MEMORY[0x1E0CA2E90] + 16);
            *(_OWORD *)&time[0].value = *MEMORY[0x1E0CA2E90];
            *(_OWORD *)&time[0].epoch = v35;
            time[1] = *(CMTime *)(v1 + 272);
            v84 = v85;
            v89 = *(_OWORD *)&time[1].timescale;
            v90 = v95;
            v91 = v96;
            time2 = *(_OWORD *)&time[0].value;
            time2_16 = *(_OWORD *)&time[0].epoch;
            -[BWIrisStagingNode _emitIrisRequestsOlderThanTime:withEndingVideoSampleTimingInfo:](v1, (uint64_t)&v84, &time2);
            v19 = &OBJC_IVAR___BWQuickTimeMovieFileSinkNode__stereoVideoCaptureDuration;
            *(CMTime *)(v1 + 272) = v85;
            goto LABEL_79;
          case 5:
            v48 = *(void **)(v1 + 584);
            time[0] = v85;
            result = objc_msgSend(v48, "stagingNode:waitingToEmitFrameWithPTS:", v1, time);
            goto LABEL_81;
          default:
            goto LABEL_79;
        }
      }
    }
LABEL_81:
    v45 = (_OWORD *)(v1 + 272);
    if ((*(_BYTE *)(v1 + 284) & 1) != 0)
    {
      memset(time, 0, 24);
      if (*(_QWORD *)(v1 + 496) && !*(_BYTE *)(v1 + 396))
      {
        *(_OWORD *)&time[0].value = *v45;
        time[0].epoch = *(_QWORD *)(v1 + 288);
      }
      else
      {
        CMTimeMake(&v56, 150, 1000);
        time2 = *v45;
        *(_QWORD *)&time2_16 = *(_QWORD *)(v1 + 288);
        result = (uint64_t)CMTimeSubtract(time, (CMTime *)&time2, &v56);
      }
      if ((*(_BYTE *)(v1 + 412) & 1) == 0)
        goto LABEL_92;
      v46 = objc_msgSend(v2, "count");
      result = objc_msgSend(*(id *)(v1 + 560), "maximumNumberOfPreDiscontinuityFramesNeededToSatisfyAllDropFrameRecipes");
      if (v46 + ~result < 0)
      {
        *(_OWORD *)&time[0].value = *MEMORY[0x1E0CA2E18];
        v47 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
      }
      else
      {
        time2 = 0uLL;
        *(_QWORD *)&time2_16 = 0;
        CMSampleBufferGetPresentationTimeStamp((CMTime *)&time2, (CMSampleBufferRef)objc_msgSend(v2, "objectAtIndexedSubscript:", v46 + ~result));
        v85 = time[0];
        *(_OWORD *)&v84.value = time2;
        v84.epoch = time2_16;
        result = CMTimeCompare(&v85, &v84);
        if ((result & 0x80000000) != 0)
          goto LABEL_92;
        *(_OWORD *)&time[0].value = time2;
        v47 = time2_16;
      }
      time[0].epoch = v47;
LABEL_92:
      if ((time[0].flags & 1) != 0)
      {
        time2 = *(_OWORD *)&time[0].value;
        *(_QWORD *)&time2_16 = time[0].epoch;
        return -[BWIrisStagingNode _emitBuffersThroughPTS:](v1, (CMTime *)&time2);
      }
    }
  }
  return result;
}

- (uint64_t)_emissionStatusForSampleBuffer:(uint64_t)result
{
  uint64_t v3;
  void *v4;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  void *v6;
  CMTime time1;
  CMTime v8;
  CMTime v9;
  CMTime rhs;
  CMTime lhs;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v3 = result;
    memset(&v9, 0, sizeof(v9));
    CMSampleBufferGetPresentationTimeStamp(&v9, sbuf);
    memset(&v8, 0, sizeof(v8));
    lhs = v9;
    rhs = *(CMTime *)(v3 + 120);
    CMTimeAdd(&v8, &lhs, &rhs);
    lhs = v8;
    rhs = *(CMTime *)(v3 + 168);
    if (CMTimeCompare(&lhs, &rhs) >= 1
      && ((v4 = (void *)objc_msgSend(*(id *)(v3 + 432), "lastObject")) == 0
       || (objc_msgSend(v4, "stillImageCaptureTime"), lhs = *(CMTime *)(v3 + 168), CMTimeCompare(&time1, &lhs) < 0)))
    {
      return 1;
    }
    else
    {
      if ((-[BWIrisStagingNode _momentCaptureMovieRecordingInProgress](v3) & 1) != 0)
        return 4;
      if (objc_msgSend((id)CMGetAttachment(sbuf, CFSTR("BufferRequiresCuttingInLivePhotoMovie"), 0), "BOOLValue"))
      {
        if (dword_1ECFE94F0)
        {
          os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        return 2;
      }
      else
      {
        if (!*(_DWORD *)(v3 + 480))
          return 4;
        memset(&lhs, 0, sizeof(lhs));
        -[BWIrisStagingNode _hostPTSForSampleBuffer:](sbuf, (CMTime *)v3, (uint64_t)&lhs);
        v6 = *(void **)(v3 + 496);
        rhs = lhs;
        return objc_msgSend(v6, "emissionStatusForHostPTS:", &rhs);
      }
    }
  }
  return result;
}

- (uint64_t)_emitIrisRequestsOlderThanTime:(__int128 *)a3 withEndingVideoSampleTimingInfo:
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 *v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  __int128 v15;
  __int128 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id obj;
  __int128 time2;
  _BYTE time2_16[32];
  __int128 v26;
  uint64_t v27;
  __int128 v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE time1[32];
  __int128 v35;
  __int128 v36;
  uint64_t v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v5 = result;
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    obj = *(id *)(result + 432);
    result = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    if (result)
    {
      v6 = result;
      v7 = 0;
      v8 = *(_QWORD *)v31;
      v9 = (__int128 *)MEMORY[0x1E0CA2E90];
      v20 = *(_QWORD *)v31;
      v21 = v5;
      while (2)
      {
        v10 = 0;
        v18 = v7 + v6;
        v19 = v7;
        v22 = v6;
        do
        {
          if (*(_QWORD *)v31 != v8)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v10);
          v28 = 0uLL;
          v29 = 0;
          -[BWIrisStagingNode _maxPTSForIrisRequest:]((CMTime *)v5, v11, (uint64_t)&v28);
          *(_OWORD *)time1 = *(_OWORD *)a2;
          *(_QWORD *)&time1[16] = *(_QWORD *)(a2 + 16);
          time2 = v28;
          *(_QWORD *)time2_16 = v29;
          result = CMTimeCompare((CMTime *)time1, (CMTime *)&time2);
          if ((result & 0x80000000) != 0)
          {
            v17 = v19 + v10;
            goto LABEL_15;
          }
          v12 = v9[3];
          *(_OWORD *)&time2_16[16] = v9[2];
          v26 = v12;
          v27 = *((_QWORD *)v9 + 8);
          v13 = v9[1];
          time2 = *v9;
          *(_OWORD *)time2_16 = v13;
          if (objc_msgSend(v11, "isMomentCaptureMovieRecording"))
          {
            *(_OWORD *)&time2_16[8] = v28;
            *(_QWORD *)&time2_16[24] = v29;
            os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
            v8 = v20;
            v6 = v22;
            fig_log_call_emit_and_clean_up_after_send_and_compose();
            v5 = v21;
          }
          else
          {
            v15 = a3[3];
            *(_OWORD *)&time2_16[16] = a3[2];
            v26 = v15;
            v27 = *((_QWORD *)a3 + 8);
            v16 = a3[1];
            time2 = *a3;
            *(_OWORD *)time2_16 = v16;
          }
          v35 = *(_OWORD *)&time2_16[16];
          v36 = v26;
          v37 = v27;
          *(_OWORD *)time1 = time2;
          *(_OWORD *)&time1[16] = *(_OWORD *)time2_16;
          -[BWIrisStagingNode _emitIrisRequest:withEndingVideoSampleTimingInfo:](v5, v11, (uint64_t)time1);
          ++v10;
        }
        while (v6 != v10);
        result = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
        v6 = result;
        v17 = v18;
        v7 = v18;
        if (result)
          continue;
        break;
      }
LABEL_15:
      if (v17 >= 1)
        return objc_msgSend(*(id *)(v5 + 432), "removeObjectsInRange:", 0);
    }
  }
  return result;
}

- (CMTime)_adjustedStartTimeForTrimmedStartTime:(CMTime *)a3@<X2> ensuringAtLeast3FramesBeforeStillTime:(int)a4@<W3> ensuringFrameIsAfterTrimmedStartTime:(CMTime *)a5@<X4> butNotEarlierThanOriginalStartTime:(uint64_t *)a6@<X5> adjustedStartBufferIndexOut:(uint64_t)a7@<X8>
{
  id *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  CMTime v18;

  if (result)
  {
    v12 = (id *)result;
    v13 = MEMORY[0x1E0CA2E18];
    *(_OWORD *)a7 = *MEMORY[0x1E0CA2E18];
    *(_QWORD *)(a7 + 16) = *(_QWORD *)(v13 + 16);
    v18 = *a3;
    v14 = -[CMTime _indexOfBufferBeforeOrEqualToPTS:inputIndex:applyFrameDropsMitigation:](result, "_indexOfBufferBeforeOrEqualToPTS:inputIndex:applyFrameDropsMitigation:", &v18, 0, 0);
    v18 = *a2;
    v15 = objc_msgSend(v12, "_indexOfBufferBeforeOrEqualToPTS:inputIndex:applyFrameDropsMitigation:", &v18, 0, 0);
    v18 = *a5;
    v16 = objc_msgSend(v12, "_indexOfBufferBeforeOrEqualToPTS:inputIndex:applyFrameDropsMitigation:", &v18, 0, 0);
    if (v14 == 0x7FFFFFFFFFFFFFFFLL)
      return (CMTime *)FigDebugAssert3();
    if (v15 == 0x7FFFFFFFFFFFFFFFLL)
      return (CMTime *)FigDebugAssert3();
    v17 = v16;
    if (v16 == 0x7FFFFFFFFFFFFFFFLL)
    {
      return (CMTime *)FigDebugAssert3();
    }
    else
    {
      if (a4
        && v15 + 1 < (unint64_t)objc_msgSend((id)objc_msgSend(v12[46], "objectAtIndexedSubscript:", 0), "count"))
      {
        ++v15;
      }
      if (v14 - v15 <= 2)
      {
        if (v14 - 3 <= v17)
          v15 = v17;
        else
          v15 = v14 - 3;
      }
      result = CMSampleBufferGetPresentationTimeStamp(&v18, (CMSampleBufferRef)objc_msgSend((id)objc_msgSend(v12[46], "objectAtIndexedSubscript:", 0), "objectAtIndexedSubscript:", v15));
      *(CMTime *)a7 = v18;
      if (a6)
        *a6 = v15;
    }
  }
  else
  {
    *(_QWORD *)a7 = 0;
    *(_QWORD *)(a7 + 8) = 0;
    *(_QWORD *)(a7 + 16) = 0;
  }
  return result;
}

- (uint64_t)_fillInStartAndTrimTimesForMasterMovieWithInfo:(uint64_t)result
{
  uint64_t v3;
  CMTimeValue v4;
  CMTimeFlags flags;
  CMTimeScale v6;
  CMTimeEpoch epoch;
  int v8;
  void *v9;
  CMClockRef HostTimeClock;
  const void *v11;
  CMTimeFlags v12;
  CMTimeEpoch v13;
  int *v14;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  unsigned int v16;
  unsigned int v17;
  Float64 Seconds;
  Float64 v19;
  uint64_t v20;
  unsigned int v21;
  int v22;
  NSObject *v23;
  unsigned int v24;
  unsigned int v25;
  Float64 v26;
  Float64 v27;
  uint64_t v28;
  void *v29;
  CMTimeFlags v30;
  CMTimeEpoch v31;
  CMTime *p_time2;
  uint64_t v33;
  CMTimeValue v34;
  CMTimeScale v35;
  CMTimeFlags v36;
  CMTimeEpoch v37;
  CMTime v38;
  CMTime v39;
  CMTime v40;
  CMTime v41;
  uint64_t v42;
  CMTime v43;
  uint64_t v44;
  CMTime v45;
  CMTime v46;
  CMTime time;
  CMTime v48;
  CMTime v49;
  CMTime v50;
  CMTime v51;
  CMTime lhs;
  CMTime v53;
  CMTime time2;
  Float64 v55;
  __int16 v56;
  uint64_t v57;
  CMTime rhs;
  CMTimeValue value;
  CMTimeScale timescale;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v3 = result;
    memset(&v53, 0, sizeof(v53));
    if (a2)
      objc_msgSend(a2, "stillImageCaptureTime");
    else
      memset(&lhs, 0, sizeof(lhs));
    rhs = *(CMTime *)(v3 + 96);
    CMTimeSubtract(&v53, &lhs, &rhs);
    v4 = *MEMORY[0x1E0CA2E18];
    value = *MEMORY[0x1E0CA2E18];
    v6 = *(_DWORD *)(MEMORY[0x1E0CA2E18] + 8);
    flags = *(_DWORD *)(MEMORY[0x1E0CA2E18] + 12);
    timescale = v6;
    epoch = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
    v51 = v53;
    v8 = *(_DWORD *)(v3 + 480);
    if ((v8 - 1) >= 2)
    {
      if (!v8)
      {
        value = v53.value;
        flags = v53.flags;
        timescale = v53.timescale;
        epoch = v53.epoch;
      }
    }
    else
    {
      memset(&rhs, 0, sizeof(rhs));
      if (a2)
        objc_msgSend(a2, "stillImageCaptureHostTime");
      else
        memset(&v50, 0, sizeof(v50));
      time2 = *(CMTime *)(v3 + 96);
      CMTimeSubtract(&rhs, &v50, &time2);
      memset(&time2, 0, sizeof(time2));
      if (a2)
        objc_msgSend(a2, "stillImageCaptureHostTime");
      memset(&v49, 0, sizeof(v49));
      v9 = *(void **)(v3 + 496);
      if (v9
        && (v48 = time2,
            time = rhs,
            objc_msgSend(v9, "beginTrimmingForStillImageHostPTS:minimumPTS:", &v48, &time),
            (v49.flags & 1) != 0))
      {
        HostTimeClock = CMClockGetHostTimeClock();
        v11 = *(const void **)(v3 + 472);
        time = v49;
        CMSyncConvertTime(&v48, &time, HostTimeClock, v11);
        value = v48.value;
        v12 = v48.flags;
        timescale = v48.timescale;
        v13 = v48.epoch;
        if (a2)
          objc_msgSend(a2, "stillImageCaptureTime");
        else
          memset(&v46, 0, sizeof(v46));
        time.value = value;
        time.timescale = timescale;
        time.flags = v12;
        time.epoch = v13;
        v45 = v53;
        -[BWIrisStagingNode _adjustedStartTimeForTrimmedStartTime:ensuringAtLeast3FramesBeforeStillTime:ensuringFrameIsAfterTrimmedStartTime:butNotEarlierThanOriginalStartTime:adjustedStartBufferIndexOut:]((CMTime *)v3, &time, &v46, 0, &v45, 0, (uint64_t)&v48);
        value = v48.value;
        flags = v48.flags;
        timescale = v48.timescale;
        epoch = v48.epoch;
      }
      else
      {
        value = v4;
        timescale = v6;
      }
      if (*(_DWORD *)(v3 + 480) == 1)
      {
        v53.value = value;
        v53.timescale = timescale;
        v53.flags = flags;
        v53.epoch = epoch;
      }
    }
    if ((flags & 1) != 0)
    {
      rhs = v53;
      v44 = objc_msgSend((id)v3, "_indexOfBufferBeforeOrEqualToPTS:inputIndex:applyFrameDropsMitigation:", &rhs, 0, 1);
      if (v44 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v14 = &OBJC_IVAR___BWQuickTimeMovieFileSinkNode__stereoVideoCaptureDuration;
        CMSampleBufferGetPresentationTimeStamp(&rhs, (CMSampleBufferRef)objc_msgSend((id)objc_msgSend(*(id *)(v3 + 368), "objectAtIndexedSubscript:", 0), "objectAtIndexedSubscript:", v44));
        v53 = rhs;
        if ((*(_BYTE *)(v3 + 156) & 1) != 0)
        {
          rhs = v53;
          time2 = *(CMTime *)(v3 + 144);
          if (CMTimeCompare(&rhs, &time2) < 0)
          {
            if (a2)
              objc_msgSend(a2, "stillImageCaptureTime");
            else
              memset(&v43, 0, sizeof(v43));
            time2 = *(CMTime *)(v3 + 144);
            v49 = v51;
            -[BWIrisStagingNode _adjustedStartTimeForTrimmedStartTime:ensuringAtLeast3FramesBeforeStillTime:ensuringFrameIsAfterTrimmedStartTime:butNotEarlierThanOriginalStartTime:adjustedStartBufferIndexOut:]((CMTime *)v3, &time2, &v43, 1, &v49, &v44, (uint64_t)&rhs);
            v53 = rhs;
            objc_msgSend(a2, "setMovieStartTimeRequiresCutting:", 1);
          }
        }
        v42 = 0x7FFFFFFFFFFFFFFFLL;
        memset(&v41, 0, sizeof(v41));
        if (a2)
          objc_msgSend(a2, "stillImageCaptureTime");
        else
          memset(&v40, 0, sizeof(v40));
        -[BWIrisStagingNode _mostRecentCuttingBufferPTSBeforePTS:cuttingBufferIndexOut:]((CMTime *)v3, &v40, &v42, (uint64_t)&v41);
        if ((v41.flags & 1) != 0)
        {
          rhs = v53;
          time2 = v41;
          if (CMTimeCompare(&rhs, &time2) < 0)
          {
            v49 = v53;
            v53 = v41;
            v44 = v42;
            objc_msgSend(a2, "setMovieStartTimeRequiresCutting:", 1);
            if (dword_1ECFE94F0)
            {
              LODWORD(v48.value) = 0;
              LOBYTE(time.value) = 0;
              os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
              v16 = v48.value;
              if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, time.value))
                v17 = v16;
              else
                v17 = v16 & 0xFFFFFFFE;
              if (v17)
              {
                rhs = v49;
                Seconds = CMTimeGetSeconds(&rhs);
                rhs = v53;
                v19 = CMTimeGetSeconds(&rhs);
                v20 = objc_msgSend((id)objc_msgSend(a2, "settings"), "settingsID");
                LODWORD(time2.value) = 136315906;
                *(CMTimeValue *)((char *)&time2.value + 4) = (CMTimeValue)"-[BWIrisStagingNode _fillInStartAndTrimTimesFo"
                                                                          "rMasterMovieWithInfo:]";
                LOWORD(time2.flags) = 2048;
                *(Float64 *)((char *)&time2.flags + 2) = Seconds;
                HIWORD(time2.epoch) = 2048;
                v55 = v19;
                v56 = 2048;
                v57 = v20;
                LODWORD(v33) = 42;
                p_time2 = &time2;
                _os_log_send_and_compose_impl();
              }
              fig_log_call_emit_and_clean_up_after_send_and_compose();
              v14 = &OBJC_IVAR___BWQuickTimeMovieFileSinkNode__stereoVideoCaptureDuration;
            }
          }
        }
        if (*(_BYTE *)(v3 + 787)
          && objc_msgSend((id)objc_msgSend(a2, "settings"), "smartStyleReversibilitySupported"))
        {
          v49 = v53;
          v21 = v44;
          v22 = objc_msgSend(a2, "movieStartTimeRequiresCutting") ^ 1;
          if (a2)
            objc_msgSend(a2, "stillImageCaptureTime");
          else
            memset(&v39, 0, sizeof(v39));
          -[BWIrisStagingNode _adjustedStartTimeForSmartStyle:allowSearchBackward:searchEndPTS:adjustedStartBufferIndexOut:](v3, v21, v22, &v39, &v44, &rhs);
          v53 = rhs;
          if (dword_1ECFE94F0)
          {
            LODWORD(v48.value) = 0;
            LOBYTE(time.value) = 0;
            v23 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            v24 = v48.value;
            if (os_log_type_enabled(v23, time.value))
              v25 = v24;
            else
              v25 = v24 & 0xFFFFFFFE;
            if (v25)
            {
              rhs = v49;
              v26 = CMTimeGetSeconds(&rhs);
              rhs = v53;
              v27 = CMTimeGetSeconds(&rhs);
              v28 = objc_msgSend((id)objc_msgSend(a2, "settings"), "settingsID");
              LODWORD(time2.value) = 136315906;
              *(CMTimeValue *)((char *)&time2.value + 4) = (CMTimeValue)"-[BWIrisStagingNode _fillInStartAndTrimTimesForM"
                                                                        "asterMovieWithInfo:]";
              LOWORD(time2.flags) = 2048;
              *(Float64 *)((char *)&time2.flags + 2) = v26;
              HIWORD(time2.epoch) = 2048;
              v55 = v27;
              v56 = 2048;
              v57 = v28;
              LODWORD(v33) = 42;
              p_time2 = &time2;
              _os_log_send_and_compose_impl();
            }
            fig_log_call_emit_and_clean_up_after_send_and_compose();
            v14 = &OBJC_IVAR___BWQuickTimeMovieFileSinkNode__stereoVideoCaptureDuration;
          }
          -[BWIrisStagingNode _updateSmartStyleRenderingBypassedForIrisMovieInfo:startBufferIndex:](v3, a2, v44);
        }
        rhs.value = value;
        rhs.timescale = timescale;
        rhs.flags = flags;
        rhs.epoch = epoch;
        time2 = v53;
        if (CMTimeCompare(&rhs, &time2) < 0)
        {
          value = v53.value;
          flags = v53.flags;
          timescale = v53.timescale;
          epoch = v53.epoch;
        }
        if (*(_DWORD *)(v3 + 480) != 2)
        {
          value = v53.value;
          v30 = v53.flags;
          timescale = v53.timescale;
          v31 = v53.epoch;
          goto LABEL_61;
        }
        rhs.value = value;
        rhs.timescale = timescale;
        rhs.flags = flags;
        rhs.epoch = epoch;
        v44 = objc_msgSend((id)v3, "_indexOfBufferBeforeOrEqualToPTS:inputIndex:applyFrameDropsMitigation:", &rhs, 0, 1);
        if (v44 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v29 = (void *)objc_msgSend(*(id *)(v3 + v14[651]), "objectAtIndexedSubscript:", 0);
          CMSampleBufferGetPresentationTimeStamp(&rhs, (CMSampleBufferRef)objc_msgSend(v29, "objectAtIndexedSubscript:", v44));
          value = rhs.value;
          v30 = rhs.flags;
          timescale = rhs.timescale;
          v31 = rhs.epoch;
LABEL_61:
          v38 = v53;
          objc_msgSend(a2, "setMovieStartTime:", &v38, p_time2, v33);
          v34 = value;
          v35 = timescale;
          v36 = v30;
          v37 = v31;
          objc_msgSend(a2, "setMovieTrimStartTime:", &v34);
          return 1;
        }
        FigDebugAssert3();
      }
    }
    return 0;
  }
  return result;
}

- (CMTime)_mostRecentCuttingBufferPTSBeforePTS:(uint64_t *)a3@<X2> cuttingBufferIndexOut:(uint64_t)a4@<X8>
{
  CMTime *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  CMTime v13;

  if (result)
  {
    v6 = result;
    v7 = MEMORY[0x1E0CA2E18];
    *(_OWORD *)a4 = *MEMORY[0x1E0CA2E18];
    *(_QWORD *)(a4 + 16) = *(_QWORD *)(v7 + 16);
    v13 = *a2;
    v8 = -[CMTime _indexOfBufferBeforeOrEqualToPTS:inputIndex:applyFrameDropsMitigation:](result, "_indexOfBufferBeforeOrEqualToPTS:inputIndex:applyFrameDropsMitigation:", &v13, 0, 0);
    if (v8 == 0x7FFFFFFFFFFFFFFFLL)
      return (CMTime *)FigDebugAssert3();
    v9 = v8;
    v10 = (void *)objc_msgSend(*(id *)&v6[15].timescale, "objectAtIndexedSubscript:", 0);
    result = (CMTime *)objc_msgSend(v10, "count");
    if (v9 >= (unint64_t)result)
    {
      return (CMTime *)FigDebugAssert3();
    }
    else if ((v9 & 0x8000000000000000) == 0)
    {
      while (1)
      {
        v11 = (void *)objc_msgSend(v10, "objectAtIndexedSubscript:", v9);
        result = (CMTime *)objc_msgSend((id)CMGetAttachment(v11, CFSTR("BufferRequiresCuttingInLivePhotoMovie"), 0), "BOOLValue");
        if ((_DWORD)result)
          break;
        if (v9-- <= 0)
          return result;
      }
      result = CMSampleBufferGetPresentationTimeStamp(&v13, (CMSampleBufferRef)v11);
      *(CMTime *)a4 = v13;
      if (a3)
        *a3 = v9;
    }
  }
  else
  {
    *(_QWORD *)a4 = 0;
    *(_QWORD *)(a4 + 8) = 0;
    *(_QWORD *)(a4 + 16) = 0;
  }
  return result;
}

- (uint64_t)_adjustedStartTimeForSmartStyle:(int)a3@<W2> allowSearchBackward:(CMTime *)a4@<X3> searchEndPTS:(uint64_t *)a5@<X4> adjustedStartBufferIndexOut:(CMTime *)a6@<X8>
{
  uint64_t v11;
  opaqueCMSampleBuffer *v12;
  uint64_t v13;
  CMTimeEpoch v14;
  CMTimeFlags v15;
  uint64_t v16;
  opaqueCMSampleBuffer *v17;
  CMTimeFlags flags;
  CMTimeEpoch epoch;
  uint64_t v20;
  opaqueCMSampleBuffer *v21;
  CMTimeEpoch v22;
  uint64_t *v23;
  CMTime v24;
  CMTime time;
  CMTime time2;
  CMTime time1;
  CMTime lhs;
  CMTime v29;
  CMTime v30;
  CMTime v31;
  CMTimeValue v32;
  CMTimeScale v33;
  CMTimeValue value;
  CMTimeScale timescale;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v11 = result;
    v12 = (opaqueCMSampleBuffer *)objc_msgSend((id)objc_msgSend(*(id *)(result + 368), "objectAtIndexedSubscript:", 0), "objectAtIndexedSubscript:", (int)a2);
    memset(&v31, 0, sizeof(v31));
    CMSampleBufferGetPresentationTimeStamp(&v31, v12);
    *a6 = v31;
    v13 = MEMORY[0x1E0CA2E18];
    *(_OWORD *)&v30.value = *MEMORY[0x1E0CA2E18];
    v14 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
    v30.epoch = v14;
    *(_OWORD *)&v29.value = *(_OWORD *)&v30.value;
    v29.epoch = v14;
    result = -[BWIrisStagingNode _sbufHasSmartStyleReversibilityAttachedMedia:](v11, v12);
    if ((result & 1) == 0)
    {
      v23 = a5;
      value = *(_QWORD *)v13;
      v15 = *(_DWORD *)(v13 + 12);
      timescale = *(_DWORD *)(v13 + 8);
      v32 = value;
      v33 = timescale;
      if (a3)
      {
        v16 = a2;
        while ((int)v16 >= 1)
        {
          v17 = (opaqueCMSampleBuffer *)objc_msgSend((id)objc_msgSend(*(id *)(v11 + 368), "objectAtIndexedSubscript:", 0), "objectAtIndexedSubscript:", --v16);
          if (-[BWIrisStagingNode _sbufHasSmartStyleReversibilityAttachedMedia:](v11, v17))
          {
            CMSampleBufferGetPresentationTimeStamp(&lhs, v17);
            value = lhs.value;
            flags = lhs.flags;
            timescale = lhs.timescale;
            epoch = lhs.epoch;
            goto LABEL_9;
          }
        }
      }
      v16 = 0x7FFFFFFFFFFFFFFFLL;
      flags = v15;
      epoch = v14;
LABEL_9:
      LODWORD(v20) = a2 + 1;
      if (objc_msgSend((id)objc_msgSend(*(id *)(v11 + 368), "objectAtIndexedSubscript:", 0), "count") <= (unint64_t)(int)v20)
      {
        v20 = 0x7FFFFFFFFFFFFFFFLL;
      }
      else
      {
        v22 = epoch;
        v20 = (int)v20;
        while (1)
        {
          v21 = (opaqueCMSampleBuffer *)objc_msgSend((id)objc_msgSend(*(id *)(v11 + 368), "objectAtIndexedSubscript:", 0), "objectAtIndexedSubscript:", v20);
          memset(&lhs, 0, sizeof(lhs));
          CMSampleBufferGetPresentationTimeStamp(&lhs, v21);
          time1 = lhs;
          time2 = *a4;
          if ((CMTimeCompare(&time1, &time2) & 0x80000000) == 0)
          {
LABEL_14:
            v20 = 0x7FFFFFFFFFFFFFFFLL;
            goto LABEL_17;
          }
          if (-[BWIrisStagingNode _sbufHasSmartStyleReversibilityAttachedMedia:](v11, v21))
            break;
          if (objc_msgSend((id)objc_msgSend(*(id *)(v11 + 368), "objectAtIndexedSubscript:", 0), "count") <= (unint64_t)++v20)
            goto LABEL_14;
        }
        CMSampleBufferGetPresentationTimeStamp(&time1, v21);
        v32 = time1.value;
        v15 = time1.flags;
        v33 = time1.timescale;
        v14 = time1.epoch;
LABEL_17:
        epoch = v22;
      }
      if (((flags | v15) & 1) != 0)
      {
        lhs = v31;
        time1.value = value;
        time1.timescale = timescale;
        time1.flags = flags;
        time1.epoch = epoch;
        CMTimeSubtract(&time, &lhs, &time1);
        CMTimeAbsoluteValue(&v30, &time);
        lhs.value = v32;
        lhs.timescale = v33;
        lhs.flags = v15;
        lhs.epoch = v14;
        time1 = v31;
        CMTimeSubtract(&v24, &lhs, &time1);
        CMTimeAbsoluteValue(&v29, &v24);
        lhs = v30;
        time1 = v29;
        result = CMTimeCompare(&lhs, &time1);
        if ((int)result <= 0)
        {
          a6->value = value;
          a6->timescale = timescale;
          a6->flags = flags;
          a6->epoch = epoch;
          if (v23)
            *v23 = v16;
        }
        else
        {
          a6->value = v32;
          a6->timescale = v33;
          a6->flags = v15;
          a6->epoch = v14;
          if (v23)
            *v23 = v20;
        }
      }
      else
      {
        return FigDebugAssert3();
      }
    }
  }
  else
  {
    a6->value = 0;
    *(_QWORD *)&a6->timescale = 0;
    a6->epoch = 0;
  }
  return result;
}

- (uint64_t)_updateSmartStyleRenderingBypassedForIrisMovieInfo:(uint64_t)a3 startBufferIndex:
{
  if (result)
  {
    if (!a2 || a3 == 0x7FFFFFFFFFFFFFFFLL)
      return FigDebugAssert3();
    else
      return objc_msgSend((id)objc_msgSend(a2, "settings"), "setSmartStyleRenderingBypassed:", BWSmartStyleRenderingShouldBeBypassed((const void *)objc_msgSend((id)objc_msgSend(*(id *)(result + 368), "objectAtIndexedSubscript:", 0), "objectAtIndexedSubscript:", a3)));
  }
  return result;
}

- (uint64_t)_fillInRefMovieStartAndTrimTimesForStillImageTimesBeforeTime:(uint64_t)result
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int *v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  unsigned int v12;
  unsigned int v13;
  Float64 Seconds;
  Float64 v15;
  uint64_t v16;
  unsigned int v17;
  int v18;
  NSObject *v19;
  unsigned int v20;
  unsigned int v21;
  Float64 v22;
  Float64 v23;
  uint64_t v24;
  void *v25;
  void *v26;
  NSObject *v27;
  unsigned int value;
  unsigned int v29;
  Float64 v30;
  uint64_t v31;
  int v32;
  CMTime *v33;
  CMTime *v34;
  uint64_t v35;
  const void *v36;
  const __CFString *v37;
  uint64_t v38;
  id obj;
  CMTime v40;
  CMTime v41;
  CMTime v42;
  CMTime v43;
  CMTime v44;
  CMTime v45;
  CMTime v46;
  CMTime v47;
  CMTime v48;
  CMTime time;
  CMTime v50;
  os_log_type_t type;
  os_log_type_t v52[4];
  CMTime v53;
  CMTime v54;
  uint64_t v55;
  CMTime v56;
  CMTime v57;
  uint64_t v58;
  CMTime lhs;
  CMTime v60;
  CMTime time1;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  CMTime v69;
  Float64 v70;
  __int16 v71;
  uint64_t v72;
  CMTime time2;
  _BYTE v74[128];
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  if (!result)
    return result;
  v3 = result;
  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  obj = *(id *)(result + 432);
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v74, 16);
  if (!v4)
    return 1;
  v5 = v4;
  v6 = &OBJC_IVAR___BWQuickTimeMovieFileSinkNode__stereoVideoCaptureDuration;
  v7 = *(_QWORD *)v66;
  v36 = (const void *)*MEMORY[0x1E0C9AE50];
  v37 = (const __CFString *)*MEMORY[0x1E0CA26A8];
  v38 = *(_QWORD *)v66;
  while (2)
  {
    for (i = 0; i != v5; ++i)
    {
      if (*(_QWORD *)v66 != v7)
        objc_enumerationMutation(obj);
      v9 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * i);
      if (v9)
      {
        objc_msgSend(*(id *)(*((_QWORD *)&v65 + 1) + 8 * i), "movieStartTime");
        if ((v63 & 0x100000000) != 0)
          continue;
        objc_msgSend(v9, "stillImageCaptureTime");
      }
      else
      {
        v63 = 0;
        v62 = 0;
        v64 = 0;
        memset(&time1, 0, sizeof(time1));
      }
      time2 = *a2;
      if (CMTimeCompare(&time1, &time2) > 0)
        return 1;
      memset(&v60, 0, sizeof(v60));
      if (v9)
        objc_msgSend(v9, "stillImageCaptureTime");
      else
        memset(&lhs, 0, sizeof(lhs));
      time2 = *(CMTime *)(v3 + 96);
      CMTimeSubtract(&v60, &lhs, &time2);
      v58 = 0;
      time2 = v60;
      v58 = objc_msgSend((id)v3, "_indexOfBufferBeforeOrEqualToPTS:inputIndex:applyFrameDropsMitigation:", &time2, 0, 1);
      if (v58 == 0x7FFFFFFFFFFFFFFFLL)
        return 0;
      v10 = (void *)objc_msgSend(*(id *)(v3 + v6[651]), "objectAtIndexedSubscript:", 0);
      CMSampleBufferGetPresentationTimeStamp(&time2, (CMSampleBufferRef)objc_msgSend(v10, "objectAtIndexedSubscript:", v58));
      v60 = time2;
      if ((*(_BYTE *)(v3 + 156) & 1) != 0)
      {
        time2 = v60;
        v69 = *(CMTime *)(v3 + 144);
        if (CMTimeCompare(&time2, &v69) < 0)
        {
          if (v9)
            objc_msgSend(v9, "stillImageCaptureTime");
          else
            memset(&v57, 0, sizeof(v57));
          v69 = *(CMTime *)(v3 + 144);
          v56 = v60;
          -[BWIrisStagingNode _adjustedStartTimeForTrimmedStartTime:ensuringAtLeast3FramesBeforeStillTime:ensuringFrameIsAfterTrimmedStartTime:butNotEarlierThanOriginalStartTime:adjustedStartBufferIndexOut:]((CMTime *)v3, &v69, &v57, 1, &v56, &v58, (uint64_t)&time2);
          v60 = time2;
          objc_msgSend(v9, "setMovieStartTimeRequiresCutting:", 1);
        }
      }
      v55 = 0x7FFFFFFFFFFFFFFFLL;
      memset(&v56, 0, sizeof(v56));
      if (v9)
        objc_msgSend(v9, "stillImageCaptureTime");
      else
        memset(&v54, 0, sizeof(v54));
      -[BWIrisStagingNode _mostRecentCuttingBufferPTSBeforePTS:cuttingBufferIndexOut:]((CMTime *)v3, &v54, &v55, (uint64_t)&v56);
      if ((v56.flags & 1) != 0)
      {
        time2 = v60;
        v69 = v56;
        if (CMTimeCompare(&time2, &v69) < 0)
        {
          v53 = v60;
          v60 = v56;
          v58 = v55;
          objc_msgSend(v9, "setMovieStartTimeRequiresCutting:", 1);
          if (dword_1ECFE94F0)
          {
            *(_DWORD *)v52 = 0;
            type = OS_LOG_TYPE_DEFAULT;
            os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            v12 = *(_DWORD *)v52;
            if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, type))
              v13 = v12;
            else
              v13 = v12 & 0xFFFFFFFE;
            if (v13)
            {
              time2 = v53;
              Seconds = CMTimeGetSeconds(&time2);
              time2 = v60;
              v15 = CMTimeGetSeconds(&time2);
              v16 = objc_msgSend((id)objc_msgSend(v9, "settings"), "settingsID");
              LODWORD(v69.value) = 136315906;
              *(CMTimeValue *)((char *)&v69.value + 4) = (CMTimeValue)"-[BWIrisStagingNode _fillInRefMovieStartAndTrimTim"
                                                                      "esForStillImageTimesBeforeTime:]";
              LOWORD(v69.flags) = 2048;
              *(Float64 *)((char *)&v69.flags + 2) = Seconds;
              HIWORD(v69.epoch) = 2048;
              v70 = v15;
              v71 = 2048;
              v72 = v16;
              LODWORD(v35) = 42;
              v34 = &v69;
              _os_log_send_and_compose_impl();
            }
            fig_log_call_emit_and_clean_up_after_send_and_compose();
            v6 = &OBJC_IVAR___BWQuickTimeMovieFileSinkNode__stereoVideoCaptureDuration;
          }
        }
      }
      if (*(_BYTE *)(v3 + 787)
        && objc_msgSend((id)objc_msgSend(v9, "settings"), "smartStyleReversibilitySupported"))
      {
        v53 = v60;
        v17 = v58;
        v18 = objc_msgSend(v9, "movieStartTimeRequiresCutting");
        if (v9)
          objc_msgSend(v9, "stillImageCaptureTime");
        else
          memset(&v50, 0, sizeof(v50));
        -[BWIrisStagingNode _adjustedStartTimeForSmartStyle:allowSearchBackward:searchEndPTS:adjustedStartBufferIndexOut:](v3, v17, v18 ^ 1, &v50, &v58, &time2);
        v60 = time2;
        v7 = v38;
        if (dword_1ECFE94F0)
        {
          *(_DWORD *)v52 = 0;
          type = OS_LOG_TYPE_DEFAULT;
          v19 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          v20 = *(_DWORD *)v52;
          if (os_log_type_enabled(v19, type))
            v21 = v20;
          else
            v21 = v20 & 0xFFFFFFFE;
          if (v21)
          {
            time2 = v53;
            v22 = CMTimeGetSeconds(&time2);
            time2 = v60;
            v23 = CMTimeGetSeconds(&time2);
            v24 = objc_msgSend((id)objc_msgSend(v9, "settings"), "settingsID");
            LODWORD(v69.value) = 136315906;
            *(CMTimeValue *)((char *)&v69.value + 4) = (CMTimeValue)"-[BWIrisStagingNode _fillInRefMovieStartAndTrimTimes"
                                                                    "ForStillImageTimesBeforeTime:]";
            LOWORD(v69.flags) = 2048;
            *(Float64 *)((char *)&v69.flags + 2) = v22;
            HIWORD(v69.epoch) = 2048;
            v70 = v23;
            v71 = 2048;
            v72 = v24;
            LODWORD(v35) = 42;
            v34 = &v69;
            _os_log_send_and_compose_impl();
          }
          fig_log_call_emit_and_clean_up_after_send_and_compose();
          v6 = &OBJC_IVAR___BWQuickTimeMovieFileSinkNode__stereoVideoCaptureDuration;
        }
        -[BWIrisStagingNode _updateSmartStyleRenderingBypassedForIrisMovieInfo:startBufferIndex:](v3, v9, v58);
      }
      if (objc_msgSend(v9, "movieStartTimeRequiresCutting", v34, v35))
      {
        if (v58 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v25 = (void *)objc_msgSend(*(id *)(v3 + v6[651]), "objectAtIndexedSubscript:", 0);
          v26 = (void *)objc_msgSend(v25, "objectAtIndexedSubscript:", v58);
          CMSetAttachment(v26, v37, v36, 1u);
          if (dword_1ECFE94F0)
          {
            LODWORD(v53.value) = 0;
            v52[0] = OS_LOG_TYPE_DEFAULT;
            v27 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            value = v53.value;
            if (os_log_type_enabled(v27, v52[0]))
              v29 = value;
            else
              v29 = value & 0xFFFFFFFE;
            if (v29)
            {
              CMSampleBufferGetPresentationTimeStamp(&time, (CMSampleBufferRef)v26);
              v30 = CMTimeGetSeconds(&time);
              v31 = objc_msgSend((id)objc_msgSend(v9, "settings"), "settingsID");
              LODWORD(v69.value) = 136315650;
              *(CMTimeValue *)((char *)&v69.value + 4) = (CMTimeValue)"-[BWIrisStagingNode _fillInRefMovieStartAndTrimTim"
                                                                      "esForStillImageTimesBeforeTime:]";
              LOWORD(v69.flags) = 2048;
              *(Float64 *)((char *)&v69.flags + 2) = v30;
              HIWORD(v69.epoch) = 2048;
              v70 = *(double *)&v31;
              LODWORD(v35) = 32;
              v34 = &v69;
              _os_log_send_and_compose_impl();
            }
            fig_log_call_emit_and_clean_up_after_send_and_compose();
            v6 = &OBJC_IVAR___BWQuickTimeMovieFileSinkNode__stereoVideoCaptureDuration;
            v7 = v38;
          }
        }
      }
      v32 = *(_DWORD *)(v3 + 480);
      if (v32 == 2)
      {
        v42 = v60;
        objc_msgSend(v9, "setMovieStartTime:", &v42);
        time2 = v60;
        v69 = *(CMTime *)(v3 + 504);
        CMTimeMaximum(&v41, &time2, &v69);
        v40 = v41;
        objc_msgSend(v9, "setMovieTrimStartTime:", &v40);
      }
      else
      {
        if (v32 == 1)
        {
          time2 = v60;
          v69 = *(CMTime *)(v3 + 504);
          CMTimeMaximum(&v45, &time2, &v69);
          v44 = v45;
          objc_msgSend(v9, "setMovieTrimStartTime:", &v44);
          v43 = v45;
          v33 = &v43;
        }
        else
        {
          if (v32)
            continue;
          v48 = v60;
          v47 = v60;
          objc_msgSend(v9, "setMovieTrimStartTime:", &v47);
          v46 = v48;
          v33 = &v46;
        }
        objc_msgSend(v9, "setMovieStartTime:", v33, v34, v35);
      }
    }
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v74, 16);
    if (v5)
      continue;
    break;
  }
  return 1;
}

- (uint64_t)_tagStillImageVISKeyFrames
{
  uint64_t v1;
  uint64_t v2;
  __int128 v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const void *v9;
  void *v10;
  void *v11;
  float v12;
  float v13;
  void *v14;
  float v15;
  float v16;
  int v17;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  const void *AttachedMedia;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  CMTimeScale timescale;
  CMTimeValue value;
  uint64_t v33;
  uint64_t v34;
  const __CFString *key;
  CMTime time2;
  CMTime v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  CMTime v42;
  CMTime rhs;
  CMTime lhs;
  _BYTE v45[128];
  uint64_t v46;
  int epoch_high;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    v2 = MEMORY[0x1E0CA2E18];
    v46 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 12);
    epoch_high = *(_DWORD *)(MEMORY[0x1E0CA2E18] + 20);
    v3 = *MEMORY[0x1E0CA2E18];
    v42.epoch = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    *(_OWORD *)&v42.value = v3;
    v4 = *(void **)(result + 432);
    result = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v38, v45, 16);
    if (result)
    {
      v5 = result;
      v29 = 0;
      v30 = 0;
      timescale = *(_DWORD *)(v2 + 8);
      value = *(_QWORD *)v2;
      v6 = *(_QWORD *)v39;
      key = (const __CFString *)*MEMORY[0x1E0D05CB0];
      v34 = *MEMORY[0x1E0D088C0];
      v33 = *MEMORY[0x1E0D05A00];
      v28 = *MEMORY[0x1E0D06C40];
      v26 = *MEMORY[0x1E0D06D00];
      v25 = *MEMORY[0x1E0D05A18];
      v24 = *MEMORY[0x1E0D058B8];
      v23 = *MEMORY[0x1E0D05A28];
      v27 = v4;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v39 != v6)
            objc_enumerationMutation(v4);
          v8 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v7);
          if ((objc_msgSend(v8, "isMomentCaptureMovieRecording") & 1) == 0
            && (objc_msgSend(v8, "stillImageVISKeyFrameTagged") & 1) == 0)
          {
            if (!v30)
            {
              v29 = (void *)objc_msgSend(*(id *)(v1 + 368), "objectAtIndexedSubscript:", 0);
              v30 = (void *)objc_msgSend(v29, "objectAtIndexedSubscript:", objc_msgSend(v29, "count") - 1);
              -[BWIrisStagingNode _hostPTSForSampleBuffer:](v30, (CMTime *)v1, (uint64_t)&lhs);
              v46 = *(_QWORD *)&lhs.flags;
              epoch_high = HIDWORD(lhs.epoch);
              timescale = lhs.timescale;
              value = lhs.value;
              CMTimeMake(&v42, lhs.timescale / 1000, lhs.timescale);
            }
            memset(&v37, 0, sizeof(v37));
            if (v8)
              objc_msgSend(v8, "stillImageCaptureHostTime");
            lhs = v37;
            rhs = v42;
            CMTimeSubtract(&time2, &lhs, &rhs);
            lhs.value = value;
            lhs.timescale = timescale;
            *(_QWORD *)&lhs.flags = v46;
            HIDWORD(lhs.epoch) = epoch_high;
            result = CMTimeCompare(&lhs, &time2);
            if ((result & 0x80000000) != 0)
              return result;
            lhs = v37;
            rhs = v42;
            result = -[BWIrisStagingNode _indexOfBufferBeforeOrEqualToHostPTS:inputIndex:tolerance:](v1, &lhs, 0, &rhs);
            if (result == 0x7FFFFFFFFFFFFFFFLL)
              return result;
            v9 = (const void *)objc_msgSend(v29, "objectAtIndexedSubscript:", result);
            v10 = (void *)CMGetAttachment(v9, key, 0);
            objc_msgSend(v10, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], v34);
            objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(v8, "livePhotoMetadataStillImageKeyFrameSettingsID"), v33);
            objc_msgSend(v8, "setStillImageVISKeyFrameTagged:", 1);
            objc_msgSend(v8, "setStillImageCaptureLuxLevel:", objc_msgSend((id)objc_msgSend(v10, "objectForKeyedSubscript:", v28), "intValue"));
            if (!*(_BYTE *)(v1 + 784))
            {
              v11 = (void *)CMGetAttachment(v9, CFSTR("TotalZoomFactor"), 0);
              if (v11)
              {
                objc_msgSend(v11, "floatValue");
                v13 = v12;
              }
              else
              {
                v13 = 1.0;
              }
              v14 = (void *)objc_msgSend(v10, "objectForKeyedSubscript:", v26);
              objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(v1 + 648), "objectForKeyedSubscript:", v25), "objectForKeyedSubscript:", v24), "floatValue");
              v16 = v15;
              v17 = objc_msgSend(v14, "isEqualToString:", v23);
              v4 = v27;
              if (v17)
              {
                if (v16 > 0.0 && v13 >= v16)
                  objc_msgSend(v8, "setLimitStillImageTransformDuringVitalityPlayback:", 1);
              }
            }
            if (*(_QWORD *)(v1 + 768) && objc_msgSend(v8, "requiresSubjectRelightingCalculation"))
            {
              if (!*(_QWORD *)(v1 + 776))
              {
                *(_QWORD *)(v1 + 776) = (id)objc_msgSend(*(id *)(v1 + 768), "startCalculationWithJPEGSampleBuffer:stillImageRequestSettings:stillImageCaptureSettings:", v9, objc_msgSend(v8, "stillImageRequestSettings"), objc_msgSend(v8, "stillImageCaptureSettings"));
                if (dword_1ECFE94F0)
                {
                  os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                  os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
                  fig_log_call_emit_and_clean_up_after_send_and_compose();
                }
                v4 = v27;
              }
              objc_msgSend(v8, "setSubjectRelightingResult:", v21, v22);
            }
            AttachedMedia = (const void *)BWSampleBufferGetAttachedMedia(v9, 0x1E495AE38);
            if (AttachedMedia
              || (AttachedMedia = (const void *)BWSampleBufferGetAttachedMedia(v9, (uint64_t)CFSTR("SynchronizedSlaveFrame"))) != 0)
            {
              v20 = (void *)CMGetAttachment(AttachedMedia, key, 0);
              objc_msgSend(v20, "setObject:forKeyedSubscript:", objc_msgSend(v10, "objectForKeyedSubscript:", v34), v34);
              objc_msgSend(v20, "setObject:forKeyedSubscript:", objc_msgSend(v10, "objectForKeyedSubscript:", v33), v33);
            }
          }
          ++v7;
        }
        while (v5 != v7);
        result = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v38, v45, 16);
        v5 = result;
      }
      while (result);
    }
  }
  return result;
}

- (__n128)_prepareToEmitFramesFromStartTime:(uint64_t)a3 throughEndTime:
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  __n128 result;
  id obj;
  __int128 v22;
  uint64_t v23;
  __int128 v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return result;
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = *(id *)(a1 + 368);
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (!v5)
    goto LABEL_13;
  v6 = v5;
  v7 = *(_QWORD *)v27;
  v8 = -1;
  v9 = MEMORY[0x1E0CA2E18];
  do
  {
    v10 = 0;
    v11 = 24 * v8 + 24;
    do
    {
      if (*(_QWORD *)v27 != v7)
        objc_enumerationMutation(obj);
      v12 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v10);
      v24 = *a2;
      v25 = *((_QWORD *)a2 + 2);
      v13 = objc_msgSend((id)a1, "_indexOfBufferBeforeOrEqualToPTS:inputIndex:applyFrameDropsMitigation:", &v24, v8 + v10 + 1, 0);
      if (v13)
      {
        if (v13 == 0x7FFFFFFFFFFFFFFFLL)
          goto LABEL_11;
        objc_msgSend(*(id *)(a1 + 376), "setObject:atIndexedSubscript:", objc_msgSend(v12, "objectAtIndexedSubscript:", v13 - 1), v8 + v10 + 1);
      }
      v14 = *(_QWORD *)(a1 + 464) + v11;
      *(_OWORD *)v14 = *(_OWORD *)v9;
      *(_QWORD *)(v14 + 16) = *(_QWORD *)(v9 + 16);
LABEL_11:
      ++v10;
      v11 += 24;
    }
    while (v6 != v10);
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    v8 += v10;
  }
  while (v6);
LABEL_13:
  v15 = *((_QWORD *)a2 + 2);
  *(_OWORD *)(a1 + 320) = *a2;
  *(_QWORD *)(a1 + 336) = v15;
  v16 = *(void **)(a1 + 560);
  if (v16)
  {
    v22 = *a2;
    v23 = *((_QWORD *)a2 + 2);
    objc_msgSend(v16, "setMasterMovieOriginalStartTime:", &v22);
  }
  v17 = *(_QWORD *)(a3 + 16);
  *(_OWORD *)(a1 + 296) = *(_OWORD *)a3;
  *(_QWORD *)(a1 + 312) = v17;
  v18 = *(_QWORD *)(a3 + 16);
  result = *(__n128 *)a3;
  *(_OWORD *)(a1 + 272) = *(_OWORD *)a3;
  *(_QWORD *)(a1 + 288) = v18;
  return result;
}

- (BOOL)_haveEnoughVideoStagedToStartFirstIrisRecording:(CMTime *)a3 currentTime:(CMTime *)a4 emitEndTimeOut:
{
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  opaqueCMSampleBuffer *v12;
  unint64_t v13;
  unint64_t v14;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  CMTime v16;
  os_log_type_t type;
  int v18;
  CMTime v19;
  CMTime v20;
  uint64_t v21;
  int32_t timescale[2];
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  CMTime v27;
  CMTime v28;
  CMTime time2;
  CMTime time1;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v7 = result;
    v28 = *a3;
    memset(&v27, 0, sizeof(v27));
    if (a2)
    {
      objc_msgSend(a2, "stillImageCaptureHostTime");
      objc_msgSend(a2, "stillImageCaptureHostTime");
      CMTimeMake(&v27, (int)v25 / 1000, timescale[0]);
      objc_msgSend(a2, "stillImageCaptureHostTime");
    }
    else
    {
      v24 = 0;
      v25 = 0;
      v26 = 0;
      *(_QWORD *)timescale = 0;
      v23 = 0;
      v21 = 0;
      CMTimeMake(&v27, 0, 0);
      memset(&v20, 0, sizeof(v20));
    }
    time1 = v27;
    v8 = -[BWIrisStagingNode _indexOfBufferBeforeOrEqualToHostPTS:inputIndex:tolerance:](v7, &v20, 0, &time1);
    v9 = (void *)objc_msgSend(*(id *)(v7 + 368), "objectAtIndexedSubscript:", 0);
    v10 = *(void **)(v7 + 560);
    if (v10 && *(_QWORD *)(v7 + 496) && !*(_BYTE *)(v7 + 785))
      v11 = (int)objc_msgSend(v10, "audioOffsetForOriginalStillImageTimeMaximumFrameLatency");
    else
      v11 = 1;
    if (v8 == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (a2)
        objc_msgSend(a2, "stillImageCaptureTime");
      else
        memset(&v16, 0, sizeof(v16));
      time1 = *a3;
      result = CMTimeCompare(&time1, &v16) > 0;
      if (a4)
        goto LABEL_22;
    }
    else
    {
      if (objc_msgSend(v9, "count") <= (unint64_t)(v11 + v8))
      {
        result = 0;
        if (!a4)
          return result;
        goto LABEL_22;
      }
      if (v8 + 1 < (unint64_t)objc_msgSend(v9, "count"))
      {
        do
        {
          v12 = (opaqueCMSampleBuffer *)objc_msgSend((id)objc_msgSend(*(id *)(v7 + 368), "objectAtIndexedSubscript:", 0), "objectAtIndexedSubscript:", v8);
          memset(&v19, 0, sizeof(v19));
          CMSampleBufferGetPresentationTimeStamp(&v19, v12);
          time1 = v19;
          time2 = *a3;
          if ((CMTimeCompare(&time1, &time2) & 0x80000000) == 0)
            break;
          if (objc_msgSend((id)CMGetAttachment((CMAttachmentBearerRef)objc_msgSend((id)objc_msgSend(*(id *)(v7 + 368), "objectAtIndexedSubscript:", 0), "objectAtIndexedSubscript:", v8 + 1), CFSTR("BufferRequiresCuttingInLivePhotoMovie"), 0), "BOOLValue"))
          {
            v28 = v19;
            if (dword_1ECFE94F0)
            {
              v18 = 0;
              type = OS_LOG_TYPE_DEFAULT;
              os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
              os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
              fig_log_call_emit_and_clean_up_after_send_and_compose();
            }
            break;
          }
          v13 = objc_msgSend(v9, "count");
          v14 = v8 + 2;
          ++v8;
        }
        while (v14 < v13);
      }
      result = 1;
      if (a4)
LABEL_22:
        *a4 = v28;
    }
  }
  return result;
}

- (uint64_t)_informDelegateOfSoonToBeEmittedIrisRequestsForTime:(uint64_t)result
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  CMTime v9;
  CMTime time1;
  CMTime v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v3 = result;
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v4 = *(void **)(result + 432);
    result = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (result)
    {
      v5 = result;
      v6 = *(_QWORD *)v13;
LABEL_4:
      v7 = 0;
      while (1)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v7);
        memset(&v11, 0, sizeof(v11));
        -[BWIrisStagingNode _maxPTSForIrisRequest:]((CMTime *)v3, v8, (uint64_t)&v11);
        time1 = *a2;
        v9 = v11;
        result = CMTimeCompare(&time1, &v9);
        if ((result & 0x80000000) != 0)
          break;
        if ((objc_msgSend(*(id *)(v3 + 440), "containsObject:", v8) & 1) == 0)
        {
          objc_msgSend(*(id *)(v3 + 440), "addObject:", v8);
          objc_msgSend(*(id *)(v3 + 584), "stagingNode:willEmitIrisRequest:", v3, v8);
        }
        if (v5 == ++v7)
        {
          result = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
          v5 = result;
          if (result)
            goto LABEL_4;
          return result;
        }
      }
    }
  }
  return result;
}

- (uint64_t)_sbufHasSmartStyleReversibilityAttachedMedia:(uint64_t)a1
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = 1;
  v4 = BWAttachedMediaKeysRequiredBySmartStyleRenderingPipelines(1, 1);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
LABEL_4:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v12 != v7)
        objc_enumerationMutation(v4);
      v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v8);
      if ((!BWSmartStyleRenderingShouldBeBypassed(a2)
         || (objc_msgSend(v9, "isEqualToString:", 0x1E495B358, (_QWORD)v11) & 1) == 0)
        && !BWSampleBufferGetAttachedMedia(a2, (uint64_t)v9))
      {
        return 0;
      }
      if (v6 == ++v8)
      {
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        if (v6)
          goto LABEL_4;
        return 1;
      }
    }
  }
  return v3;
}

- (void)setStagingQueues:(id)a3
{

  self->_spatialOverCaptureMasterMovieURL = (NSURL *)a3;
}

@end
