@implementation AVPlayerItemIntegratedTimelinePeriodicObserver

- (AVPlayerItemIntegratedTimelinePeriodicObserver)initWithInterval:(id *)a3 queue:(id)a4 block:(id)a5
{
  AVPlayerItemIntegratedTimelinePeriodicObserver *v8;
  AVPlayerItemIntegratedTimelinePeriodicObserver *v9;
  int64_t var3;
  NSObject *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)AVPlayerItemIntegratedTimelinePeriodicObserver;
  v8 = -[AVPlayerItemIntegratedTimelinePeriodicObserver init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    var3 = a3->var3;
    *(_OWORD *)&v8->_interval.value = *(_OWORD *)&a3->var0;
    if (a4)
      v11 = a4;
    else
      v11 = MEMORY[0x1E0C80D38];
    v9->_interval.epoch = var3;
    v9->_queue = (OS_dispatch_queue *)v11;
    dispatch_retain(v11);
    v9->_block = (id)objc_msgSend(a5, "copy");
    v9->_mutex = (OpaqueFigSimpleMutex *)FigSimpleMutexCreate();
  }
  return v9;
}

- (void)dealloc
{
  objc_super v3;

  -[AVTimebaseObserver invalidate](self->_periodicObserver, "invalidate");

  dispatch_release((dispatch_object_t)self->_queue);
  FigSimpleMutexDestroy();
  v3.receiver = self;
  v3.super_class = (Class)AVPlayerItemIntegratedTimelinePeriodicObserver;
  -[AVPlayerItemIntegratedTimelinePeriodicObserver dealloc](&v3, sel_dealloc);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)_getNextPeriodicFireTimeFromIntegratedCurrentTime:(SEL)a3
{
  int32_t timescale;
  CMTime v8;
  CMTime v9;

  memset(&v9, 0, sizeof(v9));
  timescale = self->_interval.timescale;
  v8 = *(CMTime *)a4;
  CMTimeConvertScale(&v9, &v8, timescale, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
  return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeMake((CMTime *)retstr, self->_interval.value+ self->_interval.value * (int)(v9.value / self->_interval.value), self->_interval.timescale);
}

- (BOOL)_doesTimeResideInItemIntegratedTimelineOffsets:(id *)a3 withOffsets:(id)a4 timeMappingOut:(id *)a5
{
  __int128 v8;
  __int128 v9;
  __int128 v10;
  unint64_t v11;
  int v12;
  BOOL v13;
  CMTimeMapping *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v20;
  CMTimeRange range;
  CMTimeMapping v22;

  v8 = *(_OWORD *)(MEMORY[0x1E0CA2E20] + 48);
  *(_OWORD *)&v22.source.duration.timescale = *(_OWORD *)(MEMORY[0x1E0CA2E20] + 32);
  *(_OWORD *)&v22.target.start.value = v8;
  v9 = *(_OWORD *)(MEMORY[0x1E0CA2E20] + 80);
  *(_OWORD *)&v22.target.start.epoch = *(_OWORD *)(MEMORY[0x1E0CA2E20] + 64);
  *(_OWORD *)&v22.target.duration.timescale = v9;
  v10 = *(_OWORD *)(MEMORY[0x1E0CA2E20] + 16);
  *(_OWORD *)&v22.source.start.value = *MEMORY[0x1E0CA2E20];
  *(_OWORD *)&v22.source.start.epoch = v10;
  if (!objc_msgSend(a4, "count"))
  {
    if (!a5)
      return 0;
    goto LABEL_9;
  }
  v11 = 1;
  do
  {
    CMTimeMappingMakeFromDictionary(&v22, (CFDictionaryRef)objc_msgSend(a4, "objectAtIndex:", v11 - 1));
    range = v22.target;
    v20 = *a3;
    v12 = CMTimeRangeContainsTime(&range, (CMTime *)&v20);
    v13 = v12 != 0;
    if (v11 >= objc_msgSend(a4, "count"))
      break;
    ++v11;
  }
  while (!v12);
  if (a5)
  {
    if (v12)
    {
      v13 = 1;
      v14 = &v22;
LABEL_10:
      v15 = *(_OWORD *)&v14->source.start.epoch;
      *(_OWORD *)&a5->var0.var0.var0 = *(_OWORD *)&v14->source.start.value;
      *(_OWORD *)&a5->var0.var0.var3 = v15;
      v16 = *(_OWORD *)&v14->source.duration.timescale;
      v17 = *(_OWORD *)&v14->target.start.value;
      v18 = *(_OWORD *)&v14->target.duration.timescale;
      *(_OWORD *)&a5->var1.var0.var3 = *(_OWORD *)&v14->target.start.epoch;
      *(_OWORD *)&a5->var1.var1.var1 = v18;
      *(_OWORD *)&a5->var0.var1.var1 = v16;
      *(_OWORD *)&a5->var1.var0.var0 = v17;
      return v13;
    }
LABEL_9:
    v13 = 0;
    v14 = (CMTimeMapping *)MEMORY[0x1E0CA2E20];
    goto LABEL_10;
  }
  return v13;
}

- (void)rescheduleObserverWithSnapshot:(id)a3 itemToSchedule:(id)a4
{
  void *v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  _BOOL4 v13;
  uint64_t v14;
  _BOOL4 v15;
  BOOL v16;
  int v17;
  char v18;
  int32_t timescale;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  unsigned int value;
  unsigned int v25;
  Float64 Seconds;
  AVPeriodicTimebaseObserver *v27;
  OS_dispatch_queue *queue;
  _QWORD v29[5];
  CMTime v30;
  CMTime v31;
  CMTime rhs;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  CMTimeRange v36;
  CMTimeRange range;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  CMTimeRange v42;
  CMTime v43;
  CMTime start;
  CMTime v45;
  __int128 v46;
  CMTimeEpoch v47;
  CMTime lhs;
  Float64 v49;
  CMTimeRange otherRange;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v7 = (void *)objc_msgSend(a3, "currentSegment");
  v46 = 0uLL;
  v47 = 0;
  if (a3)
    objc_msgSend(a3, "currentTime");
  v8 = objc_msgSend(a4, "timebase");
  v45 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
  start = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E18];
  v43 = start;
  v9 = *(_OWORD *)(MEMORY[0x1E0CA2E20] + 48);
  v41 = *(_OWORD *)(MEMORY[0x1E0CA2E20] + 32);
  *(_OWORD *)&v42.start.value = v9;
  v10 = *(_OWORD *)(MEMORY[0x1E0CA2E20] + 80);
  *(_OWORD *)&v42.start.epoch = *(_OWORD *)(MEMORY[0x1E0CA2E20] + 64);
  *(_OWORD *)&v42.duration.timescale = v10;
  v11 = *(_OWORD *)(MEMORY[0x1E0CA2E20] + 16);
  v39 = *MEMORY[0x1E0CA2E20];
  v40 = v11;
  v38 = 0;
  v12 = objc_msgSend(v7, "segmentType");
  v13 = v12 == 1 && objc_msgSend((id)objc_msgSend(v7, "interstitialEvent"), "timelineOccupancy") == 0;
  if (a4)
  {
    MEMORY[0x194033BF8](self->_mutex);
    *(_OWORD *)&otherRange.start.value = v46;
    otherRange.start.epoch = v47;
    -[AVPlayerItemIntegratedTimelinePeriodicObserver _getNextPeriodicFireTimeFromIntegratedCurrentTime:](self, "_getNextPeriodicFireTimeFromIntegratedCurrentTime:", &otherRange);
    otherRange.start = v43;
    objc_msgSend(a3, "mapTime:toSegment:atSegmentOffset:", &otherRange, &v38, &start);
    v14 = objc_msgSend(a4, "_integratedTimelineOffsets");
    otherRange.start = v43;
    v15 = -[AVPlayerItemIntegratedTimelinePeriodicObserver _doesTimeResideInItemIntegratedTimelineOffsets:withOffsets:timeMappingOut:](self, "_doesTimeResideInItemIntegratedTimelineOffsets:withOffsets:timeMappingOut:", &otherRange, v14, &v39);
    if (v15)
    {
      v16 = v15;
      if (v7)
      {
        objc_msgSend(v7, "timeMapping");
      }
      else
      {
        v35 = 0u;
        memset(&v36, 0, sizeof(v36));
        v34 = 0u;
        v33 = 0u;
      }
      range = v36;
      otherRange = v42;
      if (!CMTimeRangeContainsTimeRange(&range, &otherRange))
      {
LABEL_29:
        MEMORY[0x194033C04](self->_mutex);
        return;
      }
      v17 = 0;
      v18 = !v16;
      if (v38 != v7)
        v18 = 1;
      if ((v18 & 1) == 0 && !v13)
      {
        if (v12 == 1)
        {
          lhs = v43;
          rhs = v42.start;
          CMTimeSubtract(&otherRange.start, &lhs, &rhs);
          start = otherRange.start;
        }
        memset(&otherRange, 0, 24);
        timescale = self->_interval.timescale;
        *(_OWORD *)&lhs.value = v39;
        lhs.epoch = v40;
        v17 = 1;
        CMTimeConvertScale(&otherRange.start, &lhs, timescale, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
        memset(&lhs, 0, sizeof(lhs));
        CMTimeMake(&lhs, otherRange.start.value / self->_interval.value * self->_interval.value, self->_interval.timescale);
        rhs = otherRange.start;
        v30 = lhs;
        CMTimeSubtract(&v31, &rhs, &v30);
        rhs = start;
        CMTimeAdd(&v45, &v31, &rhs);
        v20 = *(_OWORD *)&v42.start.value;
        *(_OWORD *)&self->_observedTimeMapping.source.duration.timescale = v41;
        *(_OWORD *)&self->_observedTimeMapping.target.start.value = v20;
        v21 = *(_OWORD *)&v42.duration.timescale;
        *(_OWORD *)&self->_observedTimeMapping.target.start.epoch = *(_OWORD *)&v42.start.epoch;
        *(_OWORD *)&self->_observedTimeMapping.target.duration.timescale = v21;
        v22 = v40;
        *(_OWORD *)&self->_observedTimeMapping.source.start.value = v39;
        *(_OWORD *)&self->_observedTimeMapping.source.start.epoch = v22;
      }
    }
    else
    {
      v17 = 0;
    }
    -[AVTimebaseObserver invalidate](self->_periodicObserver, "invalidate");

    self->_periodicObserver = 0;
    if (v17)
    {
      if (dword_1EE2B0310)
      {
        LODWORD(rhs.value) = 0;
        LOBYTE(v30.value) = 0;
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        value = rhs.value;
        if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, v30.value))
          v25 = value;
        else
          v25 = value & 0xFFFFFFFE;
        if (v25)
        {
          otherRange.start = v45;
          Seconds = CMTimeGetSeconds(&otherRange.start);
          LODWORD(lhs.value) = 136315650;
          *(CMTimeValue *)((char *)&lhs.value + 4) = (CMTimeValue)"-[AVPlayerItemIntegratedTimelinePeriodicObserver resch"
                                                                  "eduleObserverWithSnapshot:itemToSchedule:]";
          LOWORD(lhs.flags) = 2048;
          *(_QWORD *)((char *)&lhs.flags + 2) = self;
          HIWORD(lhs.epoch) = 2048;
          v49 = Seconds;
          _os_log_send_and_compose_impl();
        }
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __96__AVPlayerItemIntegratedTimelinePeriodicObserver_rescheduleObserverWithSnapshot_itemToSchedule___block_invoke;
      v29[3] = &unk_1E3035518;
      v29[4] = self;
      self->_hasBeenScheduled = 1;
      v27 = [AVPeriodicTimebaseObserver alloc];
      *(_OWORD *)&otherRange.start.value = *(_OWORD *)&self->_interval.value;
      queue = self->_queue;
      otherRange.start.epoch = self->_interval.epoch;
      lhs = v45;
      self->_periodicObserver = -[AVPeriodicTimebaseObserver initWithTimebase:interval:offset:queue:block:](v27, "initWithTimebase:interval:offset:queue:block:", v8, &otherRange, &lhs, queue, v29);
    }
    goto LABEL_29;
  }
}

void __96__AVPlayerItemIntegratedTimelinePeriodicObserver_rescheduleObserverWithSnapshot_itemToSchedule___block_invoke(uint64_t a1, CMTime *a2)
{
  void *v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  void (*v8)(void);
  CMTimeRange v9;
  CMTimeRange fromRange;
  CMTime v11;
  CMTime v12;

  v4 = (void *)MEMORY[0x1940343FC]();
  memset(&v12, 0, sizeof(v12));
  v5 = *(_QWORD *)(a1 + 32);
  v11 = *a2;
  v6 = *(_OWORD *)(v5 + 72);
  *(_OWORD *)&fromRange.start.value = *(_OWORD *)(v5 + 56);
  *(_OWORD *)&fromRange.start.epoch = v6;
  *(_OWORD *)&fromRange.duration.timescale = *(_OWORD *)(v5 + 88);
  v7 = *(_OWORD *)(v5 + 120);
  *(_OWORD *)&v9.start.value = *(_OWORD *)(v5 + 104);
  *(_OWORD *)&v9.start.epoch = v7;
  *(_OWORD *)&v9.duration.timescale = *(_OWORD *)(v5 + 136);
  CMTimeMapTimeFromRangeToRange(&v12, &v11, &fromRange, &v9);
  v8 = *(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 48) + 16);
  fromRange.start = v12;
  v8();
  objc_autoreleasePoolPop(v4);
}

- (BOOL)hasObserverBeenScheduledYet
{
  BOOL hasBeenScheduled;

  MEMORY[0x194033BF8](self->_mutex, a2);
  hasBeenScheduled = self->_hasBeenScheduled;
  MEMORY[0x194033C04](self->_mutex);
  return hasBeenScheduled;
}

@end
