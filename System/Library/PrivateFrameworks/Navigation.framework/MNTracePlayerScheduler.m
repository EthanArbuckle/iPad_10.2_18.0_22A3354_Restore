@implementation MNTracePlayerScheduler

- (MNTracePlayerScheduler)init
{
  MNTracePlayerScheduler *v2;
  MNTracePlayerScheduler *v3;
  MNTracePlayerScheduler *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MNTracePlayerScheduler;
  v2 = -[MNTracePlayerScheduler init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_speedMultiplier = 1.0;
    v4 = v2;
  }

  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[NSTimer invalidate](self->_timer, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)MNTracePlayerScheduler;
  -[MNTracePlayerScheduler dealloc](&v3, sel_dealloc);
}

- (void)setPosition:(double)a3
{
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  self->_position = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = self->_timelineStreams;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "jumpToPosition:", a3, (_QWORD)v9);
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)addTimelineStream:(id)a3
{
  id v4;
  NSMutableArray *timelineStreams;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  timelineStreams = self->_timelineStreams;
  v8 = v4;
  if (!timelineStreams)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_timelineStreams;
    self->_timelineStreams = v6;

    v4 = v8;
    timelineStreams = self->_timelineStreams;
  }
  -[NSMutableArray addObject:](timelineStreams, "addObject:", v4);
  objc_msgSend(v8, "jumpToPosition:", self->_position);

}

- (void)removeTimelineStream:(id)a3
{
  MNTracePlayerTimelineStream *v4;
  MNTracePlayerTimelineStream *v5;

  v5 = (MNTracePlayerTimelineStream *)a3;
  -[NSMutableArray removeObject:](self->_timelineStreams, "removeObject:", v5);
  v4 = v5;
  if (self->_nextTimelineStream == v5)
  {
    self->_nextTimelineStream = 0;

    v4 = v5;
  }

}

- (void)removeAllTimelineStreams
{
  MNTracePlayerTimelineStream *nextTimelineStream;

  -[NSMutableArray removeAllObjects](self->_timelineStreams, "removeAllObjects");
  nextTimelineStream = self->_nextTimelineStream;
  self->_nextTimelineStream = 0;

}

- (void)resume
{
  double v3;
  NSTimer *v4;
  NSTimer *timer;

  if (!self->_timer)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    self->_lastTimerScheduleTime = v3;
    -[NSTimer invalidate](self->_timer, "invalidate");
    objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__timerUpdated_, 0, 1, 0.0333333333);
    v4 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    timer = self->_timer;
    self->_timer = v4;

  }
}

- (void)pause
{
  NSTimer *timer;

  -[NSTimer invalidate](self->_timer, "invalidate");
  timer = self->_timer;
  self->_timer = 0;

}

- (void)_update
{
  MNTracePlayerTimelineStream **p_nextTimelineStream;
  double position;
  double v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  double v11;
  uint64_t i;
  void *v13;
  double v14;
  double v15;
  id v16;
  double v17;
  double v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  p_nextTimelineStream = &self->_nextTimelineStream;
  position = self->_position;
  -[MNTracePlayerTimelineStream nextUpdatePosition](self->_nextTimelineStream, "nextUpdatePosition");
  if (position >= v5)
    -[MNTracePlayerTimelineStream triggerNextUpdate](*p_nextTimelineStream, "triggerNextUpdate");
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = self->_timelineStreams;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v20;
    v11 = 978307200.0;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(v6);
        v13 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v13, "nextUpdatePosition", (_QWORD)v19);
        if (v14 < v11)
        {
          objc_msgSend(v13, "nextUpdatePosition");
          v11 = v15;
          v16 = v13;

          v9 = v16;
        }
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }

  objc_storeStrong((id *)p_nextTimelineStream, v9);
  if (*p_nextTimelineStream)
  {
    v17 = self->_position;
    -[MNTracePlayerTimelineStream nextUpdatePosition](*p_nextTimelineStream, "nextUpdatePosition");
    if (v17 >= v18)
      -[MNTracePlayerScheduler _update](self, "_update");
  }

}

- (void)_timerUpdated:(id)a3
{
  double speedMultiplier;
  double v5;
  double v6;
  double v7;
  double position;
  double v9;
  id WeakRetained;

  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate", a3);
  speedMultiplier = self->_speedMultiplier;
  v6 = v5 - self->_lastTimerScheduleTime;
  self->_lastTimerScheduleTime = v5;
  v7 = 0.0333333333;
  if (v6 <= 1.0)
    v7 = v6;
  position = self->_position;
  v9 = position + v7 * speedMultiplier;
  self->_position = v9;
  if (floor(position) != floor(v9))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "tracePlayerScheduler:didUpdatePosition:", self, self->_position);

  }
  -[MNTracePlayerScheduler _update](self, "_update");
}

- (MNTracePlayerSchedulerDelegate)delegate
{
  return (MNTracePlayerSchedulerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (double)speedMultiplier
{
  return self->_speedMultiplier;
}

- (void)setSpeedMultiplier:(double)a3
{
  self->_speedMultiplier = a3;
}

- (double)position
{
  return self->_position;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextTimelineStream, 0);
  objc_storeStrong((id *)&self->_timelineStreams, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
