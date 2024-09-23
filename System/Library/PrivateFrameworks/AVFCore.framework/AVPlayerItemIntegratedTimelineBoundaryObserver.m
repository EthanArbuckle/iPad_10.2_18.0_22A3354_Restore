@implementation AVPlayerItemIntegratedTimelineBoundaryObserver

- (AVPlayerItemIntegratedTimelineBoundaryObserver)initWithSegment:(id)a3 offsetTimes:(id)a4 queue:(id)a5 block:(id)a6
{
  AVPlayerItemIntegratedTimelineBoundaryObserver *v10;
  NSObject *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)AVPlayerItemIntegratedTimelineBoundaryObserver;
  v10 = -[AVPlayerItemIntegratedTimelineBoundaryObserver init](&v13, sel_init);
  if (v10)
  {
    if (a5)
      v11 = a5;
    else
      v11 = MEMORY[0x1E0C80D38];
    v10->_queue = (OS_dispatch_queue *)v11;
    dispatch_retain(v11);
    v10->_segment = (AVPlayerItemSegment *)objc_msgSend(a3, "copy");
    v10->_offsetTimes = (NSArray *)objc_msgSend(a4, "copy");
    v10->_block = (id)objc_msgSend(a6, "copy");
    v10->_mutex = (OpaqueFigSimpleMutex *)FigSimpleMutexCreate();
  }
  return v10;
}

- (void)dealloc
{
  objc_super v3;

  -[AVTimebaseObserver invalidate](self->_boundaryObserver, "invalidate");

  dispatch_release((dispatch_object_t)self->_queue);
  FigSimpleMutexDestroy();
  v3.receiver = self;
  v3.super_class = (Class)AVPlayerItemIntegratedTimelineBoundaryObserver;
  -[AVPlayerItemIntegratedTimelineBoundaryObserver dealloc](&v3, sel_dealloc);
}

- (id)_currentInterstitialIDForSnapshot:(id)a3
{
  void *v3;

  v3 = (void *)objc_msgSend(a3, "currentSegment");
  if (objc_msgSend(v3, "segmentType") == 1)
    return (id)objc_msgSend((id)objc_msgSend(v3, "interstitialEvent"), "identifier");
  else
    return 0;
}

- (BOOL)_ensureItemTimeOffsetLiesInSegment:(id)a3 item:(id)a4
{
  void *v5;
  __int128 v6;
  CMTimeRange target;
  CMTimeRange range;
  CMTimeMapping v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  CMTimeRange v14;

  v5 = (void *)objc_msgSend(a4, "_integratedTimelineOffsets");
  v6 = 0uLL;
  v13 = 0u;
  memset(&v14, 0, sizeof(v14));
  v11 = 0u;
  v12 = 0u;
  if (a3)
  {
    objc_msgSend(a3, "timeMapping");
    v6 = 0uLL;
  }
  *(_OWORD *)&v10.target.start.epoch = v6;
  *(_OWORD *)&v10.target.duration.timescale = v6;
  *(_OWORD *)&v10.source.duration.timescale = v6;
  *(_OWORD *)&v10.target.start.value = v6;
  *(_OWORD *)&v10.source.start.value = v6;
  *(_OWORD *)&v10.source.start.epoch = v6;
  CMTimeMappingMakeFromDictionary(&v10, (CFDictionaryRef)objc_msgSend(v5, "objectAtIndexedSubscript:", 0));
  range = v14;
  target = v10.target;
  if (CMTimeRangeContainsTimeRange(&range, &target))
    return 1;
  range = v14;
  target = v10.target;
  return CMTimeRangeEqual(&range, &target) != 0;
}

- (BOOL)_isItemCurrentTimeWithinZeroOffsetBoundaryThreshold:(id)a3 offset:(id *)a4
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v6;
  CMTime lhs;
  CMTime time;

  if (a3)
    objc_msgSend(a3, "currentTime");
  else
    memset(&lhs, 0, sizeof(lhs));
  v6 = *a4;
  CMTimeSubtract(&time, &lhs, (CMTime *)&v6);
  return fabs(CMTimeGetSeconds(&time)) < 0.3;
}

- (void)rescheduleObserverWithSnapshot:(id)a3 itemToSchedule:(id)a4
{
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  int64_t v13;
  NSString *v14;
  const __CFDictionary *v15;
  AVPlayerItemSegment *segment;
  NSArray *offsetTimes;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  unsigned int value;
  unsigned int v25;
  CMTimeRange *p_rhs;
  uint64_t v27;
  void *v28;
  _QWORD v29[5];
  CMTime v30;
  CMTime v31;
  CMTime v32;
  CMTime v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  CMTimeRange v38;
  CMTimeRange v39;
  CMTimeRange v40;
  CMTimeRange lhs[2];
  CMTimeRange rhs;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v7 = *(_OWORD *)(MEMORY[0x1E0CA2E20] + 32);
  v8 = *(_OWORD *)(MEMORY[0x1E0CA2E20] + 64);
  v9 = *(_OWORD *)(MEMORY[0x1E0CA2E20] + 80);
  *(_OWORD *)&v40.start.value = *(_OWORD *)(MEMORY[0x1E0CA2E20] + 48);
  *(_OWORD *)&v40.start.epoch = v8;
  *(_OWORD *)&v40.duration.timescale = v9;
  v10 = *MEMORY[0x1E0CA2E20];
  *(_OWORD *)&v39.start.epoch = *(_OWORD *)(MEMORY[0x1E0CA2E20] + 16);
  *(_OWORD *)&v39.duration.timescale = v7;
  v11 = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 16);
  *(_OWORD *)&v38.start.value = *MEMORY[0x1E0CA2E40];
  *(_OWORD *)&v38.start.epoch = v11;
  *(_OWORD *)&v38.duration.timescale = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 32);
  *(_OWORD *)&v39.start.value = v10;
  v12 = objc_msgSend(a4, "timebase");
  v28 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  if (a4 && !self->_segmentWasRemoved)
  {
    MEMORY[0x194033BF8](self->_mutex);
    v13 = -[AVPlayerItemSegment segmentType](self->_segment, "segmentType");
    if (v13)
    {
      v14 = -[AVPlayerInterstitialEvent identifier](-[AVPlayerItemSegment interstitialEvent](self->_segment, "interstitialEvent"), "identifier");
      if (v14 == -[AVPlayerItemIntegratedTimelineBoundaryObserver _currentInterstitialIDForSnapshot:](self, "_currentInterstitialIDForSnapshot:", a3)&& -[AVPlayerItemIntegratedTimelineBoundaryObserver _ensureItemTimeOffsetLiesInSegment:item:](self, "_ensureItemTimeOffsetLiesInSegment:item:", objc_msgSend(a3, "currentSegment"), a4))
      {
        v15 = (const __CFDictionary *)objc_msgSend(a4, "_interstitialEventItemTimeOffset");
        if (v15)
          CMTimeRangeMakeFromDictionary(&v38, v15);
        goto LABEL_13;
      }
    }
    else if (!self->_boundaryObserver)
    {
      segment = self->_segment;
      if (segment)
        -[AVPlayerItemSegment timeMapping](segment, "timeMapping");
      else
        memset(lhs, 0, sizeof(lhs));
      v39 = lhs[0];
      v40 = lhs[1];
      v38 = lhs[1];
LABEL_13:
      v36 = 0u;
      v37 = 0u;
      v34 = 0u;
      v35 = 0u;
      offsetTimes = self->_offsetTimes;
      v18 = -[NSArray countByEnumeratingWithState:objects:count:](offsetTimes, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v35;
        do
        {
          for (i = 0; i != v19; ++i)
          {
            if (*(_QWORD *)v35 != v20)
              objc_enumerationMutation(offsetTimes);
            v22 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
            memset(&v33, 0, sizeof(v33));
            if (v22)
              objc_msgSend(v22, "CMTimeValue");
            memset(&v32, 0, sizeof(v32));
            if (v13)
            {
              v32 = v33;
              memset(&v31, 0, sizeof(v31));
              lhs[0].start = v33;
              *(_OWORD *)&rhs.start.value = *(_OWORD *)&v38.start.value;
              rhs.start.epoch = v38.start.epoch;
              CMTimeSubtract(&v31, &lhs[0].start, &rhs.start);
            }
            else
            {
              *(_OWORD *)&lhs[0].start.value = *(_OWORD *)&v38.start.value;
              lhs[0].start.epoch = v38.start.epoch;
              rhs.start = v33;
              CMTimeAdd(&v32, &lhs[0].start, &rhs.start);
              memset(&v31, 0, sizeof(v31));
              v30 = v32;
              lhs[0] = v40;
              rhs = v39;
              CMTimeMapTimeFromRangeToRange(&v31, &v30, lhs, &rhs);
            }
            lhs[0].start = v31;
            if (CMTimeGetSeconds(&lhs[0].start) <= 0.3
              && (lhs[0].start = v31,
                  -[AVPlayerItemIntegratedTimelineBoundaryObserver _isItemCurrentTimeWithinZeroOffsetBoundaryThreshold:offset:](self, "_isItemCurrentTimeWithinZeroOffsetBoundaryThreshold:offset:", a4, lhs)))
            {
              (*((void (**)(void))self->_block + 2))();
            }
            else
            {
              lhs[0] = v38;
              rhs.start = v32;
              if (CMTimeRangeContainsTime(lhs, &rhs.start))
              {
                lhs[0].start = v31;
                objc_msgSend(v28, "addObject:", objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCMTime:", lhs));
              }
            }
          }
          v19 = -[NSArray countByEnumeratingWithState:objects:count:](offsetTimes, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
        }
        while (v19);
      }
      if (objc_msgSend(v28, "count"))
      {
        if (dword_1EE2B0310)
        {
          LODWORD(v33.value) = 0;
          LOBYTE(v32.value) = 0;
          os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          value = v33.value;
          if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, v32.value))
            v25 = value;
          else
            v25 = value & 0xFFFFFFFE;
          if (v25)
          {
            LODWORD(rhs.start.value) = 136315906;
            *(CMTimeValue *)((char *)&rhs.start.value + 4) = (CMTimeValue)"-[AVPlayerItemIntegratedTimelineBoundaryObserv"
                                                                          "er rescheduleObserverWithSnapshot:itemToSchedule:]";
            LOWORD(rhs.start.flags) = 2048;
            *(_QWORD *)((char *)&rhs.start.flags + 2) = self;
            HIWORD(rhs.start.epoch) = 2048;
            rhs.duration.value = (CMTimeValue)a4;
            LOWORD(rhs.duration.timescale) = 2112;
            *(_QWORD *)((char *)&rhs.duration.timescale + 2) = v28;
            LODWORD(v27) = 42;
            p_rhs = &rhs;
            _os_log_send_and_compose_impl();
          }
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        -[AVTimebaseObserver invalidate](self->_boundaryObserver, "invalidate", p_rhs, v27);

        v29[0] = MEMORY[0x1E0C809B0];
        v29[1] = 3221225472;
        v29[2] = __96__AVPlayerItemIntegratedTimelineBoundaryObserver_rescheduleObserverWithSnapshot_itemToSchedule___block_invoke;
        v29[3] = &unk_1E302FA10;
        v29[4] = self;
        self->_hasBeenScheduled = 1;
        self->_boundaryObserver = -[AVOccasionalTimebaseObserver initWithTimebase:times:queue:block:]([AVOccasionalTimebaseObserver alloc], "initWithTimebase:times:queue:block:", v12, v28, self->_queue, v29);
      }
    }
    MEMORY[0x194033C04](self->_mutex);
  }
}

uint64_t __96__AVPlayerItemIntegratedTimelineBoundaryObserver_rescheduleObserverWithSnapshot_itemToSchedule___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) + 16))();
}

- (void)ensureBoundaryObserverSegmentStillExistsWithNewSnapshot:(id)a3
{
  void *v4;
  NSString *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *queue;
  _QWORD block[5];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend(a3, "segments");
  MEMORY[0x194033BF8](self->_mutex);
  if (-[AVPlayerItemSegment segmentType](self->_segment, "segmentType") == 1 && !self->_segmentWasRemoved)
  {
    v5 = -[AVPlayerInterstitialEvent identifier](-[AVPlayerItemSegment interstitialEvent](self->_segment, "interstitialEvent"), "identifier");
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v14;
LABEL_6:
      v9 = 0;
      while (1)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v9);
        if (objc_msgSend(v10, "segmentType") == 1
          && -[NSString isEqualToString:](v5, "isEqualToString:", objc_msgSend((id)objc_msgSend(v10, "interstitialEvent"), "identifier")))
        {
          break;
        }
        if (v7 == ++v9)
        {
          v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
          if (v7)
            goto LABEL_6;
          goto LABEL_13;
        }
      }
    }
    else
    {
LABEL_13:
      queue = self->_queue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __106__AVPlayerItemIntegratedTimelineBoundaryObserver_ensureBoundaryObserverSegmentStillExistsWithNewSnapshot___block_invoke;
      block[3] = &unk_1E302FA10;
      block[4] = self;
      dispatch_async(queue, block);
      self->_segmentWasRemoved = 1;
      -[AVTimebaseObserver invalidate](self->_boundaryObserver, "invalidate");

    }
  }
  MEMORY[0x194033C04](self->_mutex);
}

uint64_t __106__AVPlayerItemIntegratedTimelineBoundaryObserver_ensureBoundaryObserverSegmentStillExistsWithNewSnapshot___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) + 16))();
}

- (BOOL)hasObserverBeenScheduledYet
{
  BOOL hasBeenScheduled;

  MEMORY[0x194033BF8](self->_mutex, a2);
  hasBeenScheduled = self->_hasBeenScheduled;
  MEMORY[0x194033C04](self->_mutex);
  return hasBeenScheduled;
}

- (id)scheduledSegment
{
  AVPlayerItemSegment *segment;

  MEMORY[0x194033BF8](self->_mutex, a2);
  segment = self->_segment;
  MEMORY[0x194033C04](self->_mutex);
  return segment;
}

@end
