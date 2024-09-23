@implementation BWIrisSequenceAdjuster

- (int)audioOffsetForOriginalStillImageTimeMaximumFrameLatency
{
  objc_opt_self();
  return 3;
}

- (void)reset
{
  uint64_t v3;
  __int128 v4;
  int64_t v5;
  NSMutableArray *interleavingQueues;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = MEMORY[0x1E0CA2E18];
  v4 = *MEMORY[0x1E0CA2E18];
  *(_OWORD *)&self->_firstIrisAudioOffset.value = *MEMORY[0x1E0CA2E18];
  v5 = *(_QWORD *)(v3 + 16);
  self->_firstIrisAudioOffset.epoch = v5;
  *(_OWORD *)&self->_nextAdjustedVideoTime.value = v4;
  self->_nextAdjustedVideoTime.epoch = v5;
  *(_OWORD *)&self->_masterMovieOriginalStartTime.value = v4;
  self->_masterMovieOriginalStartTime.epoch = v5;
  *(_OWORD *)&self->_previewFrameDuration.value = v4;
  self->_previewFrameDuration.epoch = v5;
  *(_OWORD *)&self->_lastVideoAdjustedTime.value = v4;
  self->_lastVideoAdjustedTime.epoch = v5;
  -[BWMotionDataPreserver reset](self->_motionDataPreserver, "reset");

  self->_preservedAttachedMediaSbufByKeys = 0;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  interleavingQueues = self->_interleavingQueues;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](interleavingQueues, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(interleavingQueues);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "removeAllObjects");
      }
      while (v8 != v10);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](interleavingQueues, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }
}

- (void)enqueueVideoBufferTime:(id *)a3 nativeTime:(id *)a4 isBracketFrame:(BOOL)a5 isSISFrame:(BOOL)a6
{
  uint64_t v6;
  uint64_t v7;
  BWIrisSequenceAdjuster *v10;
  unint64_t v11;
  CMTimeValue v12;
  CMTimeFlags v13;
  CMTimeScale v14;
  CMTimeEpoch v15;
  BOOL v16;
  unint64_t v17;
  unint64_t v18;
  int v19;
  CMTimeFlags v20;
  BWIrisSequenceAdjuster *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  $95D729B680665BEAEFA1D6FCA8238556 *p_previewFrameDuration;
  BWIrisDiscontinuity *v28;
  BWIrisDiscontinuity *v29;
  _BOOL8 generateIFrames;
  NSMutableArray *timeSkews;
  BWIrisDiscontinuity *v32;
  _BOOL8 v33;
  NSMutableArray *v34;
  BWTimeSkew *v35;
  BWTimeSkew *v36;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *v37;
  unsigned int v38;
  unsigned int v39;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *v40;
  void *v41;
  CMTimeEpoch v42;
  CMTimeEpoch epoch;
  CMTimeFlags flags;
  __int128 v45;
  int64_t v46;
  _BYTE v47[24];
  CMTime v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  _QWORD v52[3];
  CMTime time2;
  CMTime time1;
  CMTime v55;
  CMTime v56;
  CMTime v57;
  CMTime rhs;
  CMTime lhs;
  CMTime v60;
  CMTimeValue value;
  CMTimeScale timescale;
  CMTimeValue v63;
  CMTimeScale v64;
  uint64_t v65;

  v6 = a6;
  v7 = a5;
  v10 = self;
  v65 = *MEMORY[0x1E0C80C00];
  v11 = -[NSMutableArray count](self->_timeSkews, "count");
  if (v11 < 2)
    goto LABEL_51;
  v40 = a4;
  v38 = v7;
  v39 = v6;
  v63 = *MEMORY[0x1E0CA2E18];
  v12 = v63;
  v14 = *(_DWORD *)(MEMORY[0x1E0CA2E18] + 8);
  v13 = *(_DWORD *)(MEMORY[0x1E0CA2E18] + 12);
  v64 = v14;
  v15 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  value = v63;
  timescale = v14;
  v16 = (v13 & 1) == 0;
  v37 = a3;
  if ((v13 & 1) == 0)
  {
    v17 = v11;
    v18 = v11 - 1;
    if (((v11 - 1) & 0x8000000000000000) == 0)
    {
      v19 = 0;
      v41 = 0;
      v42 = v15;
      epoch = v15;
      flags = v13;
      v20 = v13;
      while (1)
      {
        v21 = v10;
        v22 = (void *)-[NSMutableArray objectAtIndexedSubscript:](v10->_timeSkews, "objectAtIndexedSubscript:", v18);
        if (objc_msgSend(v22, "isBracketFrame"))
          break;
        if ((flags & 1) == 0)
        {
          if (v22)
          {
            objc_msgSend(v22, "native");
            flags = v60.flags;
            epoch = v60.epoch;
          }
          else
          {
            epoch = 0;
            flags = 0;
            memset(&v60, 0, sizeof(v60));
          }
          value = v60.value;
          timescale = v60.timescale;
          if ((v19 & 1) != 0)
          {
            v23 = objc_msgSend(v22, "isSISFrame");
            v24 = v41;
            if (v23)
              v24 = v22;
            v41 = v24;
            v19 = 1;
          }
          else
          {
            v19 = 0;
          }
          goto LABEL_20;
        }
        if (!objc_msgSend(v22, "isStartOfDiscontinuity"))
        {
          if (v22)
          {
            objc_msgSend(v22, "native");
            v20 = v60.flags;
            v42 = v60.epoch;
          }
          else
          {
            v42 = 0;
            v20 = 0;
            memset(&v60, 0, sizeof(v60));
          }
          v10 = v21;
          v63 = v60.value;
          v64 = v60.timescale;
          v17 = v18;
          goto LABEL_22;
        }
        v63 = v12;
        v64 = v14;
        v20 = v13;
        value = v12;
        v42 = v15;
        epoch = v15;
        flags = v13;
        timescale = v14;
LABEL_21:
        v10 = v21;
LABEL_22:
        v16 = (v20 & 1) == 0;
        if ((v20 & 1) == 0)
        {
          v18 = v17 - 1;
          if (((v17 - 1) & 0x8000000000000000) == 0)
            continue;
        }
        goto LABEL_28;
      }
      v63 = v12;
      v64 = v14;
      value = v12;
      timescale = v14;
      v19 |= objc_msgSend(v22, "isSISFrame");
      v20 = v13;
      v42 = v15;
      epoch = v15;
      flags = v13;
LABEL_20:
      v17 = v18;
      goto LABEL_21;
    }
  }
  v41 = 0;
  v42 = v15;
  v20 = v13;
  flags = v13;
  epoch = v15;
LABEL_28:
  v7 = v38;
  v6 = v39;
  a3 = v37;
  a4 = v40;
  if (!v16)
  {
    memset(&v60, 0, sizeof(v60));
    lhs.value = value;
    lhs.timescale = timescale;
    lhs.flags = flags;
    lhs.epoch = epoch;
    rhs.value = v63;
    rhs.timescale = v64;
    rhs.flags = v20;
    rhs.epoch = v42;
    CMTimeSubtract(&v60, &lhs, &rhs);
    lhs = v60;
    if (CMTimeGetSeconds(&lhs) <= 0.133333333 || (v10->_previewFrameDuration.flags & 1) == 0)
    {
      rhs.value = value;
      rhs.timescale = timescale;
      rhs.flags = flags;
      rhs.epoch = epoch;
      v57.value = v63;
      v57.timescale = v64;
      v57.flags = v20;
      v57.epoch = v42;
      CMTimeSubtract(&lhs, &rhs, &v57);
      v10->_previewFrameDuration = ($95D729B680665BEAEFA1D6FCA8238556)lhs;
    }
    memset(&lhs, 0, sizeof(lhs));
    rhs = (CMTime)v10->_previewFrameDuration;
    CMTimeMultiply(&lhs, &rhs, 3);
    v25 = (void *)-[NSMutableArray lastObject](v10->_timeSkews, "lastObject");
    v26 = v25;
    memset(&rhs, 0, sizeof(rhs));
    if (v25)
      objc_msgSend(v25, "native");
    else
      memset(&v56, 0, sizeof(v56));
    p_previewFrameDuration = &v10->_previewFrameDuration;
    v57 = (CMTime)*v40;
    CMTimeSubtract(&rhs, &v57, &v56);
    memset(&v57, 0, sizeof(v57));
    CMTimeMake(&v55, 5, 1000);
    time1 = rhs;
    CMTimeAdd(&v57, &time1, &v55);
    time1 = v57;
    time2 = lhs;
    if (CMTimeCompare(&time1, &time2) < 1)
    {
      if (v41)
      {
        objc_msgSend(v41, "original");
        if ((v50 & 0x100000000) != 0)
        {
          if (objc_msgSend(v26, "isBracketFrame"))
          {
            if (objc_msgSend(v26, "isSISFrame"))
            {
              if ((v38 & 1) == 0)
              {
                objc_msgSend(v26, "setIsStartOfDiscontinuity:", 1);
                memset(&time1, 0, sizeof(time1));
                objc_msgSend(v41, "native");
                time2 = (CMTime)*v40;
                CMTimeSubtract(&time1, &time2, &v48);
                v29 = [BWIrisDiscontinuity alloc];
                objc_msgSend(v41, "original");
                generateIFrames = v10->_generateIFrames;
                timeSkews = v10->_timeSkews;
                time2 = time1;
                v45 = *(_OWORD *)&p_previewFrameDuration->value;
                v46 = v10->_previewFrameDuration.epoch;
                v32 = -[BWIrisDiscontinuity initWithTime:duration:targetFrameDuration:onlyRetime:generateIFrames:timeSkews:](v29, "initWithTime:duration:targetFrameDuration:onlyRetime:generateIFrames:timeSkews:", v47, &time2, &v45, 1, generateIFrames, timeSkews);
                if (v32)
LABEL_47:
                  -[NSMutableArray addObject:](v10->_discontinuities, "addObject:", v32);
              }
            }
          }
        }
      }
      else
      {
        v49 = 0;
        v50 = 0;
        v51 = 0;
      }
    }
    else
    {
      objc_msgSend(v26, "setIsStartOfDiscontinuity:", 1);
      v28 = [BWIrisDiscontinuity alloc];
      if (v26)
        objc_msgSend(v26, "original");
      else
        memset(v52, 0, sizeof(v52));
      v33 = v10->_generateIFrames;
      v34 = v10->_timeSkews;
      time1 = v57;
      *(_OWORD *)&time2.value = *(_OWORD *)&p_previewFrameDuration->value;
      time2.epoch = v10->_previewFrameDuration.epoch;
      v32 = -[BWIrisDiscontinuity initWithTime:duration:targetFrameDuration:onlyRetime:generateIFrames:timeSkews:](v28, "initWithTime:duration:targetFrameDuration:onlyRetime:generateIFrames:timeSkews:", v52, &time1, &time2, 0, v33, v34);
      a4 = v40;
      if (v32)
        goto LABEL_47;
    }
  }
  if ((unint64_t)-[NSMutableArray count](v10->_discontinuities, "count") >= 0xC9)
    -[NSMutableArray removeObjectAtIndex:](v10->_discontinuities, "removeObjectAtIndex:", 0);
LABEL_51:
  v35 = [BWTimeSkew alloc];
  v60 = (CMTime)*a4;
  lhs = (CMTime)*a3;
  v36 = -[BWTimeSkew initWithNativeTime:originalTime:isBracketFrame:isSISFrame:](v35, "initWithNativeTime:originalTime:isBracketFrame:isSISFrame:", &v60, &lhs, v7, v6);
  -[NSMutableArray addObject:](v10->_timeSkews, "addObject:", v36);

  if ((unint64_t)-[NSMutableArray count](v10->_timeSkews, "count") >= 0xC9)
    -[NSMutableArray removeObjectAtIndex:](v10->_timeSkews, "removeObjectAtIndex:", 0);
}

+ (void)initialize
{
  objc_opt_class();
}

- (BWIrisSequenceAdjuster)initWithMediaTypes:(id)a3 visMotionMetadataPreloadingEnabled:(BOOL)a4 generateIFrames:(BOOL)a5 attachedMediaKeysToPreserve:(id)a6
{
  BWIrisSequenceAdjuster *v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  objc_super v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v23.receiver = self;
  v23.super_class = (Class)BWIrisSequenceAdjuster;
  v10 = -[BWIrisSequenceAdjuster init](&v23, sel_init);
  if (v10)
  {
    v18 = a6;
    v10->_interleavingQueues = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v10->_discontinuities = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v10->_mediaTypes = (unsigned int *)malloc_type_calloc(4uLL, objc_msgSend(a3, "count"), 0x3D6F797DuLL);
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v11 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    if (v11)
    {
      v12 = v11;
      v13 = 0;
      v14 = *(_QWORD *)v20;
      do
      {
        v15 = 0;
        v16 = v13;
        do
        {
          if (*(_QWORD *)v20 != v14)
            objc_enumerationMutation(a3);
          v13 = v16 + 1;
          v10->_mediaTypes[v16] = objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v15), "intValue");
          -[NSMutableArray addObject:](v10->_interleavingQueues, "addObject:", objc_msgSend(MEMORY[0x1E0C99DE8], "array"));
          ++v15;
          ++v16;
        }
        while (v12 != v15);
        v12 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      }
      while (v12);
    }
    v10->_timeSkews = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (!a4)
      v10->_motionDataPreserver = -[BWMotionDataPreserver initWithName:]([BWMotionDataPreserver alloc], "initWithName:", -[BWIrisSequenceAdjuster description](v10, "description"));
    v10->_generateIFrames = a5;
    v10->_attachedMediaKeysToPreserve = (NSArray *)v18;
    -[BWIrisSequenceAdjuster reset](v10, "reset");
  }
  return v10;
}

- (void)dealloc
{
  objc_super v3;

  free(self->_mediaTypes);
  v3.receiver = self;
  v3.super_class = (Class)BWIrisSequenceAdjuster;
  -[BWIrisSequenceAdjuster dealloc](&v3, sel_dealloc);
}

- (BOOL)discontinuityExistsBetweenCurrentPTS:(id *)a3 previousPTS:(id *)a4
{
  CMTime v7;
  CMTime v8;
  CMTime rhs;
  CMTime lhs;
  CMTime time;
  CMTime v12;

  memset(&v12, 0, sizeof(v12));
  time = (CMTime)self->_previewFrameDuration;
  CMTimeMultiply(&v12, &time, 3);
  memset(&time, 0, sizeof(time));
  lhs = *(CMTime *)a3;
  rhs = *(CMTime *)a4;
  CMTimeSubtract(&time, &lhs, &rhs);
  memset(&lhs, 0, sizeof(lhs));
  CMTimeMake(&v8, 5, 1000);
  rhs = time;
  CMTimeAdd(&lhs, &rhs, &v8);
  rhs = lhs;
  v7 = v12;
  return CMTimeCompare(&rhs, &v7) > 0;
}

- (void)enqueueSampleBuffer:(opaqueCMSampleBuffer *)a3 forMediaTypeWithIndex:(int64_t)a4
{
  char flags;
  unsigned int v8;
  CMTimeFlags v9;
  const __CFString *v10;
  CFTypeRef v11;
  const void *v12;
  unsigned int v13;
  CMTimeEpoch epoch;
  BWMotionDataPreserver *motionDataPreserver;
  _BOOL4 v16;
  id v17;
  NSArray *attachedMediaKeysToPreserve;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  CMAttachmentBearerRef v23;
  void *v24;
  void *v25;
  BWMotionDataPreserver *v26;
  NSMutableDictionary *preservedAttachedMediaSbufByKeys;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  uint64_t v32;
  uint64_t v33;
  CMTimeEpoch v34;
  _BOOL4 v35;
  const __CFString *v36;
  const void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  CMTime rhs;
  CMTime time2;
  CMTime time1;
  __int128 v49;
  uint64_t v50;
  CMAttachmentBearerRef target;
  CMTime v52;
  _BYTE v53[128];
  _BYTE v54[128];
  CMTimeValue value;
  CMTimeScale timescale;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    memset(&v52, 0, sizeof(v52));
    CMSampleBufferGetPresentationTimeStamp(&v52, a3);
    flags = v52.flags;
    target = 0;
    v49 = xmmword_1A32B1D78;
    v50 = 0;
    v8 = self->_mediaTypes[a4];
    if (v8 == 1835365473)
    {
      target = CFRetain(a3);
      if ((flags & 1) == 0)
        goto LABEL_39;
      goto LABEL_38;
    }
    if (v8 != 1986618469)
    {
      if (v8 == 1936684398)
      {
        time2 = v52;
        -[BWIrisSequenceAdjuster _adjustedTimeForAudioBufferWithTime:]((CMTime *)self, &time2, (uint64_t)&time1);
        value = time1.value;
        LOBYTE(v9) = time1.flags;
        timescale = time1.timescale;
        time2 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E18];
        BWCMSampleBufferCreateCopyWithNewTimingIncludingMetadata(a3, &time1, (__int128 *)&time2.value, (CMSampleBufferRef *)&target);
        if (!target)
        {
LABEL_56:
          fig_log_get_emitter();
          goto LABEL_57;
        }
        goto LABEL_37;
      }
      if ((*(_DWORD *)(MEMORY[0x1E0CA2E18] + 12) & 1) == 0)
      {
LABEL_39:
        if (target)
          CFRelease(target);
        return;
      }
LABEL_38:
      v25 = (void *)-[NSMutableArray objectAtIndexedSubscript:](self->_interleavingQueues, "objectAtIndexedSubscript:", a4);
      objc_msgSend(v25, "addObject:", target);
      goto LABEL_39;
    }
    v10 = (const __CFString *)*MEMORY[0x1E0CA26A8];
    v11 = CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0CA26A8], 0);
    v12 = (const void *)*MEMORY[0x1E0C9AE50];
    v13 = v11 == (CFTypeRef)*MEMORY[0x1E0C9AE50];
    time2 = v52;
    -[BWIrisSequenceAdjuster _adjustedTimeForVideoBufferWithTime:forceKeepingBuffer:discontinuityFrameAttributesOut:]((uint64_t)self, &time2, v13, (uint64_t)&v49, (__int128 *)&time1.value);
    value = time1.value;
    v9 = time1.flags;
    timescale = time1.timescale;
    epoch = time1.epoch;
    if ((time1.flags & 1) != 0)
    {
      if ((self->_lastVideoAdjustedTime.flags & 1) != 0)
      {
        time1.timescale = timescale;
        time2 = (CMTime)self->_lastVideoAdjustedTime;
        time1.value = value;
        if (CMTimeCompare(&time1, &time2) <= 0)
          goto LABEL_56;
      }
      v16 = 0;
    }
    else
    {
      motionDataPreserver = self->_motionDataPreserver;
      v37 = v12;
      v36 = v10;
      v35 = motionDataPreserver == 0;
      if (motionDataPreserver)
      {
        v34 = time1.epoch;
        -[BWMotionDataPreserver preserveMotionDataForSoonToBeDroppedSampleBuffer:](motionDataPreserver, "preserveMotionDataForSoonToBeDroppedSampleBuffer:", a3);
      }
      else
      {
        if ((self->_lastVideoAdjustedTime.flags & 1) != 0)
        {
          CMTimeMake(&rhs, self->_lastVideoAdjustedTime.timescale / 100, self->_lastVideoAdjustedTime.timescale);
          time2 = (CMTime)self->_lastVideoAdjustedTime;
          CMTimeAdd(&time1, &time2, &rhs);
        }
        else
        {
          CMSampleBufferGetPresentationTimeStamp(&time1, a3);
        }
        value = time1.value;
        v9 = time1.flags;
        timescale = time1.timescale;
        v34 = time1.epoch;
      }
      v17 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v42 = 0u;
      v43 = 0u;
      v44 = 0u;
      v45 = 0u;
      attachedMediaKeysToPreserve = self->_attachedMediaKeysToPreserve;
      v19 = -[NSArray countByEnumeratingWithState:objects:count:](attachedMediaKeysToPreserve, "countByEnumeratingWithState:objects:count:", &v42, v54, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v43;
        do
        {
          for (i = 0; i != v20; ++i)
          {
            if (*(_QWORD *)v43 != v21)
              objc_enumerationMutation(attachedMediaKeysToPreserve);
            objc_msgSend(v17, "setObject:forKeyedSubscript:", BWSampleBufferGetAttachedMedia(a3, *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * i)), *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * i));
          }
          v20 = -[NSArray countByEnumeratingWithState:objects:count:](attachedMediaKeysToPreserve, "countByEnumeratingWithState:objects:count:", &v42, v54, 16);
        }
        while (v20);
      }
      v16 = v35;
      if (objc_msgSend(v17, "count"))
      {

        self->_preservedAttachedMediaSbufByKeys = (NSMutableDictionary *)v17;
      }

      v12 = v37;
      v10 = v36;
      epoch = v34;
      if ((v9 & 1) == 0)
        goto LABEL_37;
    }
    time1.value = value;
    time1.timescale = timescale;
    time1.flags = v9;
    time1.epoch = epoch;
    time2 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E18];
    BWCMSampleBufferCreateCopyWithNewTimingIncludingMetadata(a3, &time1, (__int128 *)&time2.value, (CMSampleBufferRef *)&target);
    v23 = target;
    if (!target)
    {
      fig_log_get_emitter();
LABEL_57:
      FigDebugAssert3();
      goto LABEL_39;
    }
    self->_lastVideoAdjustedTime.value = value;
    self->_lastVideoAdjustedTime.timescale = timescale;
    self->_lastVideoAdjustedTime.flags = v9;
    self->_lastVideoAdjustedTime.epoch = epoch;
    v24 = (void *)CMGetAttachment(v23, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
    if ((_BYTE)v49)
    {
      objc_msgSend(v24, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v50), 0x1E4928E58);
      objc_msgSend(v24, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *((_QWORD *)&v49 + 1)), 0x1E4928E78);
      if (BYTE1(v49))
        CMSetAttachment(target, v10, v12, 1u);
    }
    if (!v16)
    {
      v26 = self->_motionDataPreserver;
      if (v26)
        -[BWMotionDataPreserver prependPreservedMotionDataToSampleBuffer:](v26, "prependPreservedMotionDataToSampleBuffer:", target);
      v40 = 0u;
      v41 = 0u;
      v38 = 0u;
      v39 = 0u;
      preservedAttachedMediaSbufByKeys = self->_preservedAttachedMediaSbufByKeys;
      v28 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](preservedAttachedMediaSbufByKeys, "countByEnumeratingWithState:objects:count:", &v38, v53, 16);
      if (v28)
      {
        v29 = v28;
        v30 = *(_QWORD *)v39;
        do
        {
          for (j = 0; j != v29; ++j)
          {
            if (*(_QWORD *)v39 != v30)
              objc_enumerationMutation(preservedAttachedMediaSbufByKeys);
            v32 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * j);
            if (!BWSampleBufferGetAttachedMedia(target, v32))
            {
              v33 = -[NSMutableDictionary objectForKeyedSubscript:](self->_preservedAttachedMediaSbufByKeys, "objectForKeyedSubscript:", v32);
              BWSampleBufferSetAttachedMedia(target, v32, v33);
            }
          }
          v29 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](preservedAttachedMediaSbufByKeys, "countByEnumeratingWithState:objects:count:", &v38, v53, 16);
        }
        while (v29);
      }

      self->_preservedAttachedMediaSbufByKeys = 0;
      if ((v9 & 1) == 0)
        goto LABEL_39;
      goto LABEL_38;
    }
    CMSetAttachment(target, CFSTR("SampleDataToBeDropped"), v12, 1u);
    objc_msgSend(v24, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], 0x1E495A9F8);
LABEL_37:
    if ((v9 & 1) == 0)
      goto LABEL_39;
    goto LABEL_38;
  }
}

- (CMTime)_adjustedTimeForAudioBufferWithTime:(uint64_t)a3@<X8>
{
  CMTime *v5;
  CMTime v6;
  CMTime lhs;
  CMTime v8;

  if (result)
  {
    v5 = result;
    *(_OWORD *)a3 = *(_OWORD *)&a2->value;
    *(_QWORD *)(a3 + 16) = a2->epoch;
    result = (CMTime *)objc_msgSend(*(id *)&result->timescale, "count");
    if (result)
    {
      if ((v5[1].value & 0x100000000) != 0)
      {
        lhs = *a2;
        v6 = *(CMTime *)&v5->epoch;
        result = CMTimeSubtract(&v8, &lhs, &v6);
        *(CMTime *)a3 = v8;
      }
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

- (uint64_t)_adjustedTimeForVideoBufferWithTime:(unsigned int)a3@<W2> forceKeepingBuffer:(uint64_t)a4@<X3> discontinuityFrameAttributesOut:(__int128 *)a5@<X8>
{
  uint64_t v8;
  CMTime *v9;
  CMTime *v10;
  __int128 *v11;
  void *v12;
  CMTimeEpoch v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  int v20;
  CMTimeEpoch epoch;
  void *v22;
  int v23;
  CMTimeEpoch v24;
  __int128 v26;
  uint64_t v27;
  CMTime rhs;
  CMTime lhs;
  CMTime v30;
  CMTime v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  CMTimeValue value;
  CMTimeScale timescale;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)a5 = 0;
  *((_QWORD *)a5 + 1) = 0;
  *((_QWORD *)a5 + 2) = 0;
  if (result)
  {
    v8 = result;
    v9 = (CMTime *)(result + 48);
    if (objc_msgSend(*(id *)(result + 8), "count"))
      v10 = (CMTime *)(v8 + 48);
    else
      v10 = a2;
    *a5 = *(_OWORD *)&v10->value;
    *((_QWORD *)a5 + 2) = v10->epoch;
    v11 = (__int128 *)MEMORY[0x1E0CA2E18];
    value = *MEMORY[0x1E0CA2E18];
    LODWORD(v12) = *(_DWORD *)(MEMORY[0x1E0CA2E18] + 12);
    timescale = *(_DWORD *)(MEMORY[0x1E0CA2E18] + 8);
    v13 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v14 = *(void **)(v8 + 8);
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    if (v15)
    {
      v16 = v15;
      v24 = v13;
      v23 = (int)v12;
      v17 = *(_QWORD *)v33;
LABEL_7:
      v18 = 0;
      while (1)
      {
        if (*(_QWORD *)v33 != v17)
          objc_enumerationMutation(v14);
        v12 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v18);
        v31 = *a2;
        if (objc_msgSend(v12, "containsVideoBufferTime:", &v31))
          break;
        if (v16 == ++v18)
        {
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
          if (v16)
            goto LABEL_7;
          v19 = 1;
          v13 = v24;
          v9 = (CMTime *)(v8 + 48);
          LODWORD(v12) = v23;
          goto LABEL_20;
        }
      }
      v31 = *a2;
      v9 = (CMTime *)(v8 + 48);
      v20 = objc_msgSend(v12, "shouldKeepBufferWithTime:forceKeepingBuffer:nextAdjustedTimeInOut:discontinuityFrameAttributesOut:", &v31, a3, v8 + 48, a4);
      if (v12)
      {
        objc_msgSend(v12, "targetFrameDuration");
        LODWORD(v12) = v31.flags;
        epoch = v31.epoch;
      }
      else
      {
        epoch = 0;
        memset(&v31, 0, sizeof(v31));
      }
      value = v31.value;
      timescale = v31.timescale;
      if (v20)
      {
        v19 = 0;
        v13 = epoch;
        goto LABEL_20;
      }
      *a5 = *v11;
      *((_QWORD *)a5 + 2) = v24;
    }
    else
    {
      v19 = 1;
LABEL_20:
      if ((*((_BYTE *)a5 + 12) & 1) == 0)
      {
        *a5 = *(_OWORD *)&a2->value;
        *((_QWORD *)a5 + 2) = a2->epoch;
      }
      if (v19)
      {
        memset(&v31, 0, sizeof(v31));
        v30 = *a2;
        -[BWIrisSequenceAdjuster _originalDurationForVideoBufferWithTime:]((CMTime *)v8, &v30, (uint64_t)&v31);
        if ((v12 & 1) == 0)
        {
          value = *(_QWORD *)(v8 + 112);
          LODWORD(v12) = *(_DWORD *)(v8 + 124);
          timescale = *(_DWORD *)(v8 + 120);
          v13 = *(_QWORD *)(v8 + 128);
        }
        if ((v31.flags & 1) == 0)
        {
          v31.value = value;
          v31.timescale = timescale;
          v31.flags = v12;
          v31.epoch = v13;
        }
        lhs = *(CMTime *)a5;
        rhs = v31;
        CMTimeAdd(&v30, &lhs, &rhs);
        *v9 = v30;
      }
    }
    v31 = *a2;
    result = -[BWIrisSequenceAdjuster _indexOfTime:](v8, &v31);
    if (result != 0x7FFFFFFFFFFFFFFFLL)
    {
      v22 = (void *)objc_msgSend(*(id *)(v8 + 80), "objectAtIndexedSubscript:", result);
      v26 = *a5;
      v27 = *((_QWORD *)a5 + 2);
      return objc_msgSend(v22, "setAdjusted:", &v26);
    }
  }
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)audioOffsetForOriginalStillImageTime:(SEL)a3
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  CMTime v5;
  CMTime v6;

  v6 = *(CMTime *)a4;
  v5 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E18];
  -[BWIrisSequenceAdjuster _audioOffsetForOriginalStillImageTime:adjustedStillImageTime:]((uint64_t)self, &v6, &v5, (uint64_t)retstr);
  return result;
}

- (void)_audioOffsetForOriginalStillImageTime:(CMTime *)a3@<X2> adjustedStillImageTime:(uint64_t)a4@<X8>
{
  CMTimeFlags flags;
  uint64_t v9;
  CMTimeValue value;
  CMTime v11;
  CMTime lhs;
  CMTime v13;
  __int128 v14;

  if (a1)
  {
    flags = a3->flags;
    if ((flags & 1) == 0)
    {
      lhs = *a2;
      objc_msgSend((id)a1, "adjustedTimeForTime:", &lhs);
      *a3 = v13;
      flags = a3->flags;
    }
    if ((~flags & 0x11) != 0 && (flags & 1) != 0)
    {
      lhs = *a2;
      v11 = *a3;
      CMTimeSubtract(&v13, &lhs, &v11);
      v14 = *(_OWORD *)&v13.timescale;
      if ((*(_BYTE *)(a1 + 28) & 1) != 0)
      {
        lhs.value = v13.value & ~(v13.value >> 63);
        *(_OWORD *)&lhs.timescale = v14;
        v11 = *(CMTime *)(a1 + 16);
        CMTimeSubtract(&v13, &lhs, &v11);
        value = v13.value;
        v14 = *(_OWORD *)&v13.timescale;
      }
      else
      {
        *(_QWORD *)(a1 + 16) = v13.value & ~(v13.value >> 63);
        *(_OWORD *)(a1 + 24) = v14;
        value = *MEMORY[0x1E0CA2E68];
        v14 = *(_OWORD *)(MEMORY[0x1E0CA2E68] + 8);
        -[BWIrisSequenceAdjuster _adjustTimesInAudioInterleavingQueues](a1);
      }
      *(_QWORD *)a4 = value;
      *(_OWORD *)(a4 + 8) = v14;
    }
    else
    {
      v9 = MEMORY[0x1E0CA2E18];
      *(_OWORD *)a4 = *MEMORY[0x1E0CA2E18];
      *(_QWORD *)(a4 + 16) = *(_QWORD *)(v9 + 16);
    }
  }
  else
  {
    *(_QWORD *)a4 = 0;
    *(_QWORD *)(a4 + 8) = 0;
    *(_QWORD *)(a4 + 16) = 0;
  }
}

- (opaqueCMSampleBuffer)dequeueAndRetainAdjustedSampleBufferForMediaTypeWithIndex:(int64_t)a3
{
  void *v5;
  opaqueCMSampleBuffer *result;
  opaqueCMSampleBuffer *v7;
  unsigned int v8;
  __int128 v9;
  uint64_t v10;
  CMTime v11;
  CMTime v12;
  CMTime v13;
  CMSampleBufferRef v14;

  v5 = (void *)-[NSMutableArray objectAtIndexedSubscript:](self->_interleavingQueues, "objectAtIndexedSubscript:");
  result = (opaqueCMSampleBuffer *)objc_msgSend(v5, "count");
  if (result)
  {
    v7 = (opaqueCMSampleBuffer *)objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v14 = 0;
    memset(&v13, 0, sizeof(v13));
    CMSampleBufferGetPresentationTimeStamp(&v13, v7);
    v8 = self->_mediaTypes[a3];
    if (v8 != 1986618469)
    {
      if (v8 != 1936684398)
      {
        if (v8 == 1835365473)
        {
          memset(&v12, 0, sizeof(v12));
          v11 = v13;
          -[BWIrisSequenceAdjuster _adjustedTimeForMetadataBufferWithTime:]((uint64_t)self, (__int128 *)&v11.value, (uint64_t)&v12);
          if ((v12.flags & 1) != 0)
          {
            if ((v12.flags & 0x10) != 0)
              return v14;
            v11 = v12;
            v9 = *MEMORY[0x1E0CA2E18];
            v10 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
            BWCMSampleBufferCreateCopyWithNewTimingIncludingMetadata(v7, &v11, &v9, &v14);
            if (!v14)
            {
              fig_log_get_emitter();
              FigDebugAssert3();
              return v14;
            }
          }
        }
LABEL_11:
        objc_msgSend(v5, "removeObjectAtIndex:", 0);
        return v14;
      }
      if ((self->_firstIrisAudioOffset.flags & 1) == 0)
        return v14;
    }
    v14 = (CMSampleBufferRef)CFRetain(v7);
    goto LABEL_11;
  }
  return result;
}

- (uint64_t)_adjustedTimeForMetadataBufferWithTime:(uint64_t)a3@<X8>
{
  void *v5;
  __int128 v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;

  if (result)
  {
    v5 = (void *)result;
    *(_OWORD *)a3 = *a2;
    *(_QWORD *)(a3 + 16) = *((_QWORD *)a2 + 2);
    result = objc_msgSend(*(id *)(result + 8), "count");
    if (result)
    {
      v6 = *a2;
      v7 = *((_QWORD *)a2 + 2);
      result = objc_msgSend(v5, "adjustedTimeForTime:", &v6);
      *(_OWORD *)a3 = v8;
      *(_QWORD *)(a3 + 16) = v9;
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

- (void)adjustMovieInfoTimes:(id)a3
{
  uint64_t v5;
  id v6;
  CMTimeFlags flags;
  CMTimeEpoch epoch;
  CMTime v9;
  CMTime v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  CMTimeValue v14;
  CMTimeScale v15;
  CMTimeFlags v16;
  CMTimeEpoch v17;
  CMTime v18;
  CMTime v19;
  CMTime v20;
  CMTime v21;
  CMTime v22;
  CMTime v23;
  CMTime lhs;
  CMTime v25;
  CMTime v26;
  CMTime v27;
  CMTime rhs;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  id v34;
  CMTime v35;
  __int128 v36;
  uint64_t v37;
  __int128 v38;
  uint64_t v39;
  CMTime v40;
  CMTime v41;
  __int128 v42;
  uint64_t v43;
  __int128 v44;
  uint64_t v45;
  __int128 v46;
  uint64_t v47;
  CMTime time2;
  CMTime time1;
  CMTime v50;
  CMTime v51;
  CMTime v52;
  __int128 v53;
  uint64_t v54;
  CMTime v55;
  CMTime v56;
  CMTime v57[2];
  CMTimeValue value;
  CMTimeScale timescale;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  memset(&v57[1], 0, sizeof(CMTime));
  if (a3)
  {
    objc_msgSend(a3, "movieStartTime");
    memset(v57, 0, 24);
    objc_msgSend(a3, "movieEndTime");
    memset(&v56, 0, sizeof(v56));
    objc_msgSend(a3, "movieEndingVideoPTS");
    memset(&v55, 0, sizeof(v55));
    objc_msgSend(a3, "stillImageCaptureTime");
  }
  else
  {
    memset(v57, 0, 24);
    memset(&v56, 0, sizeof(v56));
    memset(&v55, 0, sizeof(v55));
  }
  v53 = 0uLL;
  v54 = 0;
  if (self)
  {
    v52 = v57[1];
    -[BWIrisSequenceAdjuster adjustedTimeForTime:](self, "adjustedTimeForTime:", &v52);
    memset(&v52, 0, sizeof(v52));
    v51 = v56;
    -[BWIrisSequenceAdjuster adjustedTimeForTime:](self, "adjustedTimeForTime:", &v51);
    memset(&v51, 0, sizeof(v51));
    v50 = v57[0];
    -[BWIrisSequenceAdjuster adjustedTimeForTime:](self, "adjustedTimeForTime:", &v50);
  }
  else
  {
    memset(&v52, 0, sizeof(v52));
    memset(&v51, 0, sizeof(v51));
  }
  time1 = v52;
  time2 = (CMTime)self->_nextAdjustedVideoTime;
  CMTimeMinimum(&v50, &time1, &time2);
  v52 = v50;
  time1 = v51;
  time2 = (CMTime)self->_nextAdjustedVideoTime;
  CMTimeMinimum(&v50, &time1, &time2);
  v51 = v50;
  memset(&v50, 0, sizeof(v50));
  time1 = v55;
  -[BWIrisSequenceAdjuster adjustedTimeForTime:](self, "adjustedTimeForTime:", &time1);
  v5 = MEMORY[0x1E0CA2E18];
  value = *MEMORY[0x1E0CA2E18];
  timescale = *(_DWORD *)(MEMORY[0x1E0CA2E18] + 8);
  if ((BYTE12(v53) & 0x11) == 1)
  {
    v46 = v53;
    v47 = v54;
    objc_msgSend(a3, "setMovieStartTime:", &v46);
    if (a3)
    {
      objc_msgSend(a3, "movieStartTime");
    }
    else
    {
      v44 = 0uLL;
      v45 = 0;
    }
    v42 = v44;
    v43 = v45;
    objc_msgSend(a3, "setMovieTrimStartTime:", &v42);
  }
  if ((v52.flags & 0x11) == 1)
  {
    v41 = v52;
    objc_msgSend(a3, "setMovieEndingVideoPTS:", &v41);
  }
  if ((v51.flags & 0x11) == 1)
  {
    v40 = v51;
    objc_msgSend(a3, "setMovieEndTime:", &v40);
    if (a3)
    {
      objc_msgSend(a3, "movieEndTime");
    }
    else
    {
      v38 = 0uLL;
      v39 = 0;
    }
    v36 = v38;
    v37 = v39;
    objc_msgSend(a3, "setMovieTrimEndTime:", &v36);
  }
  if ((v50.flags & 0x11) == 1)
  {
    v35 = v50;
    objc_msgSend(a3, "setStillImageCaptureTime:", &v35);
    return;
  }
  if ((v51.flags & 0x11) == 1)
  {
    v34 = 0;
    time1 = v55;
    -[BWIrisSequenceAdjuster _getPreviousTimeSkewOut:andNextTimeSkewOut:forTime:]((_BOOL8)self, &v34, &v33, &time1);
    v6 = v34;
    if (v34)
    {
      objc_msgSend(v34, "adjusted");
      if ((v32 & 1) != 0)
      {
        if (a3)
        {
          objc_msgSend(a3, "audioOffset");
          if ((v30 & 0x100000000) != 0)
            return;
        }
        else
        {
          v29 = 0;
          v30 = 0;
          v31 = 0;
        }
        memset(&time1, 0, sizeof(time1));
        objc_msgSend(v6, "original");
        time2 = v55;
        CMTimeSubtract(&time1, &time2, &rhs);
        CMTimeMake(&v27, 800, 1000);
        time2 = time1;
        if (CMTimeCompare(&time2, &v27) <= 0)
        {
          CMTimeMake(&v26, 5, 1000);
          v25 = v51;
          CMTimeSubtract(&time2, &v25, &v26);
          epoch = time2.epoch;
          v50 = time2;
          value = time2.value;
          flags = time2.flags;
          timescale = time2.timescale;
        }
        else
        {
          flags = *(_DWORD *)(v5 + 12);
          epoch = *(_QWORD *)(v5 + 16);
          memset(&time2, 0, sizeof(time2));
          objc_msgSend(v6, "original");
          objc_msgSend(v6, "adjusted");
          CMTimeSubtract(&time2, &lhs, &v23);
          if ((time2.flags & 1) != 0)
          {
            v22 = v55;
            v21 = time2;
            CMTimeSubtract(&v25, &v22, &v21);
            v50 = v25;
          }
        }
        time2 = v55;
        v25 = v50;
        if (CMTimeCompare(&time2, &v25))
        {
          memset(&time2, 0, sizeof(time2));
          v25 = v55;
          v22 = v50;
          -[BWIrisSequenceAdjuster _audioOffsetForOriginalStillImageTime:adjustedStillImageTime:]((uint64_t)self, &v25, &v22, (uint64_t)&time2);
          if ((time2.flags & 1) != 0)
          {
            v25 = time2;
            v22 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
            if ((CMTimeCompare(&v25, &v22) & 0x80000000) == 0)
            {
              v20 = v50;
              objc_msgSend(a3, "setStillImageCaptureTime:", &v20);
              v19 = time2;
              objc_msgSend(a3, "setAudioOffset:", &v19);
            }
          }
        }
        if ((flags & 1) != 0)
        {
          if (a3)
            objc_msgSend(a3, "stillImageCaptureTime");
          else
            memset(&v18, 0, sizeof(v18));
          time2.value = value;
          time2.timescale = timescale;
          time2.flags = flags;
          time2.epoch = epoch;
          if (CMTimeCompare(&time2, &v18) < 0)
          {
            v14 = value;
            v15 = timescale;
            v16 = flags;
            v17 = epoch;
            objc_msgSend(a3, "setStillImageCaptureTime:", &v14);
          }
        }
        if (a3)
        {
          objc_msgSend(a3, "audioOffset");
          if ((v12 & 0x100000000) != 0)
            return;
        }
        else
        {
          v11 = 0;
          v12 = 0;
          v13 = 0;
        }
        if (objc_msgSend(a3, "isFinalEnqueuedIrisRequest"))
        {
          CMTimeMake(&v10, 1, 1000);
          v9 = v10;
          objc_msgSend(a3, "setAudioOffset:", &v9);
        }
      }
    }
  }
}

- (BOOL)_getPreviousTimeSkewOut:(_QWORD *)a3 andNextTimeSkewOut:(CMTime *)a4 forTime:
{
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  CMTime v15;
  CMTime v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  CMTime time2;
  CMTime time1;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v7 = result;
    *a3 = 0;
    *a2 = 0;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v8 = (void *)objc_msgSend(*(id *)(result + 80), "reverseObjectEnumerator");
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v26;
      while (2)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v26 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          if (v13)
          {
            objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "adjusted");
            if ((v23 & 0x100000000) != 0)
            {
              objc_msgSend(v13, "original");
              time2 = *a4;
              if (CMTimeCompare(&time1, &time2) < 1)
              {
                result = 0;
                *a2 = v13;
                return result;
              }
            }
            objc_msgSend(v13, "adjusted");
            if ((v18 & 0x100000000) != 0)
            {
              objc_msgSend(v13, "original");
              time2 = *a4;
              if (CMTimeCompare(&v16, &time2) >= 1)
                *a3 = v13;
            }
          }
          else
          {
            v22 = 0;
            v23 = 0;
            v24 = 0;
            v18 = 0;
            v19 = 0;
            v17 = 0;
          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
        if (v10)
          continue;
        break;
      }
    }
    v14 = (void *)objc_msgSend(*(id *)(v7 + 80), "firstObject");
    if (v14)
      objc_msgSend(v14, "original");
    else
      memset(&v15, 0, sizeof(v15));
    time2 = *a4;
    return CMTimeCompare(&v15, &time2) > 0;
  }
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)adjustedTimeForTime:(SEL)a3
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  id v7;
  int v8;
  uint64_t v9;
  int64_t var3;
  id v11;
  double Seconds;
  Float64 v13;
  CMTime v14;
  CMTime time;
  CMTime v16;
  CMTime v17;
  CMTime v18;
  CMTime v19;
  CMTime v20;
  CMTime v21;
  CMTime rhs;
  CMTime lhs;
  char v24;
  CMTime v25;
  id v26;
  id v27;

  v26 = 0;
  v27 = 0;
  v25 = *(CMTime *)a4;
  result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)-[BWIrisSequenceAdjuster _getPreviousTimeSkewOut:andNextTimeSkewOut:forTime:]((_BOOL8)self, &v27, &v26, &v25);
  v7 = v26;
  if (!v26
    || (v8 = (int)result, result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)objc_msgSend(v26, "adjusted"), (v24 & 1) == 0))
  {
    v9 = MEMORY[0x1E0CA2E10];
    *(_OWORD *)&retstr->var0 = *MEMORY[0x1E0CA2E10];
    var3 = *(_QWORD *)(v9 + 16);
LABEL_4:
    retstr->var3 = var3;
    return result;
  }
  if (v8)
  {
    *(_OWORD *)&retstr->var0 = *(_OWORD *)&a4->var0;
    var3 = a4->var3;
    goto LABEL_4;
  }
  memset(&v25, 0, sizeof(v25));
  objc_msgSend(v7, "original");
  v11 = v27;
  if (v27)
  {
    objc_msgSend(v27, "original");
    CMTimeSubtract(&v25, &lhs, &rhs);
    memset(&v21, 0, sizeof(v21));
    objc_msgSend(v11, "original");
  }
  else
  {
    memset(&rhs, 0, sizeof(rhs));
    CMTimeSubtract(&v25, &lhs, &rhs);
    memset(&v21, 0, sizeof(v21));
    memset(&v20, 0, sizeof(v20));
  }
  v19 = (CMTime)*a4;
  CMTimeSubtract(&v21, &v19, &v20);
  memset(&v19, 0, sizeof(v19));
  objc_msgSend(v7, "adjusted");
  if (v11)
    objc_msgSend(v11, "adjusted");
  else
    memset(&v17, 0, sizeof(v17));
  CMTimeSubtract(&v19, &v18, &v17);
  memset(&v16, 0, sizeof(v16));
  time = v19;
  Seconds = CMTimeGetSeconds(&time);
  time = v25;
  v13 = CMTimeGetSeconds(&time);
  time = v21;
  CMTimeMultiplyByFloat64(&v16, &time, Seconds / v13);
  if (v11)
    objc_msgSend(v11, "adjusted");
  else
    memset(&v14, 0, sizeof(v14));
  time = v16;
  return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeAdd((CMTime *)retstr, &v14, &time);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)adjustedTimeForStillImageTime:(SEL)a3
{
  _BOOL4 v6;
  id v7;
  _BOOL4 v8;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  id v10;
  id v11;
  uint64_t v12;
  int64_t var3;
  double Seconds;
  Float64 v15;
  CMTime v16;
  CMTime v17;
  CMTime v18;
  CMTime v19;
  CMTime v20;
  CMTime v21;
  CMTime v22;
  CMTime v23;
  CMTime rhs;
  CMTime lhs;
  CMTime v26;
  CMTime v27;
  CMTime time;
  CMTime v29;
  CMTime time2;
  CMTime time1;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  CMTime v35;
  id v36;
  id v37;

  v36 = 0;
  v37 = 0;
  v35 = *(CMTime *)a4;
  v6 = -[BWIrisSequenceAdjuster _getPreviousTimeSkewOut:andNextTimeSkewOut:forTime:]((_BOOL8)self, &v37, &v36, &v35);
  v7 = v36;
  if (!v36)
  {
    v32 = 0;
    v33 = 0;
    v34 = 0;
LABEL_7:
    v11 = v37;
    if (v37)
    {
      objc_msgSend(v37, "original");
      objc_msgSend(v11, "adjusted");
      result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeCompare(&time1, &time2);
      if ((_DWORD)result)
        goto LABEL_13;
      objc_msgSend(v11, "original");
    }
    else
    {
      memset(&time1, 0, sizeof(time1));
      memset(&time2, 0, sizeof(time2));
      result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeCompare(&time1, &time2);
      if ((_DWORD)result)
        goto LABEL_13;
      memset(&v27, 0, sizeof(v27));
    }
    v35 = (CMTime)*a4;
    CMTimeSubtract(&time, &v35, &v27);
    CMTimeAbsoluteValue(&v29, &time);
    CMTimeMake(&v26, a4->var1 / 1000, a4->var1);
    result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeCompare(&v29, &v26);
    if ((result & 0x80000000) != 0)
      goto LABEL_14;
LABEL_13:
    v12 = MEMORY[0x1E0CA2E10];
    *(_OWORD *)&retstr->var0 = *MEMORY[0x1E0CA2E10];
    var3 = *(_QWORD *)(v12 + 16);
LABEL_15:
    retstr->var3 = var3;
    return result;
  }
  v8 = v6;
  result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)objc_msgSend(v36, "adjusted");
  if ((v33 & 0x100000000) == 0)
    goto LABEL_7;
  if (v8)
  {
LABEL_14:
    *(_OWORD *)&retstr->var0 = *(_OWORD *)&a4->var0;
    var3 = a4->var3;
    goto LABEL_15;
  }
  memset(&v35, 0, sizeof(v35));
  objc_msgSend(v7, "original");
  v10 = v37;
  if (v37)
  {
    objc_msgSend(v37, "original");
    CMTimeSubtract(&v35, &lhs, &rhs);
    memset(&v23, 0, sizeof(v23));
    objc_msgSend(v10, "original");
  }
  else
  {
    memset(&rhs, 0, sizeof(rhs));
    CMTimeSubtract(&v35, &lhs, &rhs);
    memset(&v23, 0, sizeof(v23));
    memset(&v22, 0, sizeof(v22));
  }
  v21 = (CMTime)*a4;
  CMTimeSubtract(&v23, &v21, &v22);
  memset(&v21, 0, sizeof(v21));
  objc_msgSend(v7, "adjusted");
  if (v10)
    objc_msgSend(v10, "adjusted");
  else
    memset(&v19, 0, sizeof(v19));
  CMTimeSubtract(&v21, &v20, &v19);
  memset(&v18, 0, sizeof(v18));
  v17 = v21;
  Seconds = CMTimeGetSeconds(&v17);
  v17 = v35;
  v15 = CMTimeGetSeconds(&v17);
  v17 = v23;
  CMTimeMultiplyByFloat64(&v18, &v17, Seconds / v15);
  if (v10)
    objc_msgSend(v10, "adjusted");
  else
    memset(&v16, 0, sizeof(v16));
  v17 = v18;
  return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeAdd((CMTime *)retstr, &v16, &v17);
}

- (void)setMasterMovieOriginalStartTime:(id *)a3
{
  __int128 v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSMutableArray *discontinuities;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  NSMutableArray *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  CMTime v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint64_t v38;
  CMTime time2;
  CMTime time1;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v5 = *(_OWORD *)&a3->var0;
  self->_masterMovieOriginalStartTime.epoch = a3->var3;
  *(_OWORD *)&self->_masterMovieOriginalStartTime.value = v5;
  if (-[NSMutableArray count](self->_timeSkews, "count"))
  {
    v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v7 = (void *)-[NSMutableArray reverseObjectEnumerator](self->_timeSkews, "reverseObjectEnumerator");
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v42;
      v11 = (__int128 *)MEMORY[0x1E0CA2E18];
LABEL_4:
      v12 = 0;
      while (1)
      {
        if (*(_QWORD *)v42 != v10)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * v12);
        if (v13)
          objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * v12), "original");
        else
          memset(&time1, 0, sizeof(time1));
        time2 = (CMTime)*a3;
        if (CMTimeCompare(&time1, &time2) < 0)
          break;
        v14 = (void *)objc_msgSend(v13, "copy");
        v37 = *v11;
        v38 = *((_QWORD *)v11 + 2);
        objc_msgSend(v14, "setAdjusted:", &v37);
        objc_msgSend(v6, "insertObject:atIndex:", v14, 0);

        if (v9 == ++v12)
        {
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
          if (v9)
            goto LABEL_4;
          break;
        }
      }
    }

    self->_timeSkews = (NSMutableArray *)v6;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    discontinuities = self->_discontinuities;
    v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](discontinuities, "countByEnumeratingWithState:objects:count:", &v33, v46, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v34 != v18)
            objc_enumerationMutation(discontinuities);
          objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * i), "resetWithNewTimeSkews:", self->_timeSkews);
        }
        v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](discontinuities, "countByEnumeratingWithState:objects:count:", &v33, v46, 16);
      }
      while (v17);
    }
  }
  if (-[NSMutableArray count](self->_discontinuities, "count"))
  {
    v20 = (void *)objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v21 = self->_discontinuities;
    v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v29, v45, 16);
    if (v22)
    {
      v23 = v22;
      v24 = 0;
      v25 = *(_QWORD *)v30;
LABEL_23:
      v26 = 0;
      while (1)
      {
        if (*(_QWORD *)v30 != v25)
          objc_enumerationMutation(v21);
        v27 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v26);
        if (v27)
          objc_msgSend(v27, "time");
        else
          memset(&v28, 0, sizeof(v28));
        time2 = (CMTime)*a3;
        if ((CMTimeCompare(&v28, &time2) & 0x80000000) == 0)
          break;
        objc_msgSend(v20, "addIndex:", v24 + v26++);
        if (v23 == v26)
        {
          v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v29, v45, 16);
          v24 += v26;
          if (v23)
            goto LABEL_23;
          break;
        }
      }
    }
    -[NSMutableArray removeObjectsAtIndexes:](self->_discontinuities, "removeObjectsAtIndexes:", v20);
  }
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)masterMovieOriginalStartTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 88);
  return self;
}

- (BOOL)readyToReleaseAudio
{
  return self->_firstIrisAudioOffset.flags & 1;
}

- (unint64_t)maximumNumberOfPreDiscontinuityFramesNeededToSatisfyAllDropFrameRecipes
{
  return 14;
}

- (void)_adjustTimesInAudioInterleavingQueues
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  opaqueCMSampleBuffer *v11;
  uint64_t v12;
  id obj;
  uint64_t v14;
  id v15;
  uint64_t v16;
  __int128 v17;
  uint64_t v18;
  CMTime v19;
  CMTime v20;
  CMTime v21;
  CFTypeRef cf;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    obj = *(id *)(a1 + 40);
    v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    if (v16)
    {
      v14 = *(_QWORD *)v28;
      v2 = -1;
      v3 = MEMORY[0x1E0CA2E18];
      do
      {
        v4 = 0;
        v12 = v2;
        do
        {
          if (*(_QWORD *)v28 != v14)
            objc_enumerationMutation(obj);
          v5 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v4);
          ++v2;
          if (*(_DWORD *)(*(_QWORD *)(a1 + 72) + 4 * v2) == 1936684398)
          {
            v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            objc_msgSend(v15, "addObject:", v6);
            v25 = 0u;
            v26 = 0u;
            v23 = 0u;
            v24 = 0u;
            v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
            if (v7)
            {
              v8 = v7;
              v9 = *(_QWORD *)v24;
              do
              {
                for (i = 0; i != v8; ++i)
                {
                  if (*(_QWORD *)v24 != v9)
                    objc_enumerationMutation(v5);
                  v11 = *(opaqueCMSampleBuffer **)(*((_QWORD *)&v23 + 1) + 8 * i);
                  cf = 0;
                  memset(&v21, 0, sizeof(v21));
                  CMSampleBufferGetPresentationTimeStamp(&v20, v11);
                  -[BWIrisSequenceAdjuster _adjustedTimeForAudioBufferWithTime:]((CMTime *)a1, &v20, (uint64_t)&v21);
                  v19 = v21;
                  v17 = *(_OWORD *)v3;
                  v18 = *(_QWORD *)(v3 + 16);
                  BWCMSampleBufferCreateCopyWithNewTimingIncludingMetadata(v11, &v19, &v17, (CMSampleBufferRef *)&cf);
                  objc_msgSend(v6, "addObject:", cf);
                  CFRelease(cf);
                }
                v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
              }
              while (v8);
            }
          }
          else
          {
            objc_msgSend(v15, "addObject:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v4));
          }
          ++v4;
        }
        while (v4 != v16);
        v2 = v12 + v16;
        v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      }
      while (v16);
    }

    *(_QWORD *)(a1 + 40) = v15;
  }
}

- (uint64_t)_indexOfTime:(uint64_t)result
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  CMTime v11;
  CMTime time1;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v3 = *(void **)(result + 80);
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v4)
    {
      v5 = v4;
      v6 = 0;
      v7 = *(_QWORD *)v14;
      while (2)
      {
        v8 = 0;
        v9 = v6 + v5;
        do
        {
          if (*(_QWORD *)v14 != v7)
            objc_enumerationMutation(v3);
          v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v8);
          if (v10)
            objc_msgSend(v10, "original");
          else
            memset(&time1, 0, sizeof(time1));
          v11 = *a2;
          if (!CMTimeCompare(&time1, &v11))
            return v6 + v8;
          ++v8;
        }
        while (v5 != v8);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        v6 = v9;
        if (v5)
          continue;
        break;
      }
    }
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  return result;
}

- (CMTime)_originalDurationForVideoBufferWithTime:(uint64_t)a3@<X8>
{
  CMTime *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  CMTime v9;
  CMTime lhs;
  CMTime v11;

  if (!result)
  {
    *(_QWORD *)a3 = 0;
    *(_QWORD *)(a3 + 8) = 0;
    *(_QWORD *)(a3 + 16) = 0;
    return result;
  }
  v4 = result;
  v11 = *a2;
  result = (CMTime *)-[BWIrisSequenceAdjuster _indexOfTime:]((uint64_t)result, &v11);
  if (result == (CMTime *)0x7FFFFFFFFFFFFFFFLL
    || (v5 = (unint64_t)result,
        result = (CMTime *)objc_msgSend(*(id *)&v4[3].timescale, "count"),
        v5 >= (unint64_t)&result[-1].epoch + 7))
  {
    v8 = MEMORY[0x1E0CA2E18];
    *(_OWORD *)a3 = *MEMORY[0x1E0CA2E18];
    *(_QWORD *)(a3 + 16) = *(_QWORD *)(v8 + 16);
    return result;
  }
  v6 = (void *)objc_msgSend(*(id *)&v4[3].timescale, "objectAtIndexedSubscript:", v5);
  v7 = (void *)objc_msgSend(*(id *)&v4[3].timescale, "objectAtIndexedSubscript:", v5 + 1);
  if (!v7)
  {
    memset(&lhs, 0, sizeof(lhs));
    if (v6)
      goto LABEL_6;
LABEL_9:
    memset(&v9, 0, sizeof(v9));
    return CMTimeSubtract((CMTime *)a3, &lhs, &v9);
  }
  objc_msgSend(v7, "original");
  if (!v6)
    goto LABEL_9;
LABEL_6:
  objc_msgSend(v6, "original");
  return CMTimeSubtract((CMTime *)a3, &lhs, &v9);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)previewFrameDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 112);
  return self;
}

- (void)setAudioOffsetForOriginalStillImageTimeMaximumFrameLatency:(int)a3
{
  self->_audioOffsetForOriginalStillImageTimeMaximumFrameLatency = a3;
}

@end
