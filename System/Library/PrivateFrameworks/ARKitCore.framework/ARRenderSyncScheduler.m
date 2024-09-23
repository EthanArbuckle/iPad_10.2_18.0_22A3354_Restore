@implementation ARRenderSyncScheduler

- (ARRenderSyncScheduler)init
{
  return -[ARRenderSyncScheduler initWithExpectedFramesPerSecond:](self, "initWithExpectedFramesPerSecond:", 60);
}

- (ARRenderSyncScheduler)initWithExpectedFramesPerSecond:(int64_t)a3
{
  ARRenderSyncScheduler *v4;
  ARRenderSyncScheduler *v5;
  uint64_t v6;
  NSMutableArray *blocks;
  ARRollingNumberSeries *v8;
  ARRollingNumberSeries *latencies;
  ARDisplayLink *v10;
  uint64_t v11;
  ARDisplayLink *displayLink;
  _QWORD v14[4];
  id v15;
  id location;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)ARRenderSyncScheduler;
  v4 = -[ARRenderSyncScheduler init](&v17, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_lock._os_unfair_lock_opaque = 0;
    v6 = objc_opt_new();
    blocks = v5->_blocks;
    v5->_blocks = (NSMutableArray *)v6;

    v8 = -[ARRollingNumberSeries initWithWindowSize:]([ARRollingNumberSeries alloc], "initWithWindowSize:", 7);
    latencies = v5->_latencies;
    v5->_latencies = v8;

    v5->_schedulingActive = 1;
    objc_initWeak(&location, v5);
    v10 = [ARDisplayLink alloc];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __57__ARRenderSyncScheduler_initWithExpectedFramesPerSecond___block_invoke;
    v14[3] = &unk_1E66722C0;
    objc_copyWeak(&v15, &location);
    v11 = -[ARDisplayLink initWithPreferredFramesPerSecond:callback:](v10, "initWithPreferredFramesPerSecond:callback:", a3, v14);
    displayLink = v5->_displayLink;
    v5->_displayLink = (ARDisplayLink *)v11;

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  return v5;
}

void __57__ARRenderSyncScheduler_initWithExpectedFramesPerSecond___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_callback");

}

- (double)vsyncOffset
{
  double result;

  -[ARDisplayLink vsyncOffset](self->_displayLink, "vsyncOffset");
  return result;
}

- (void)setVsyncOffset:(double)a3
{
  -[ARDisplayLink setVsyncOffset:](self->_displayLink, "setVsyncOffset:", a3);
}

- (int64_t)expectedFramesPerSecond
{
  return -[ARDisplayLink preferredFramesPerSecond](self->_displayLink, "preferredFramesPerSecond");
}

- (void)setExpectedFramesPerSecond:(int64_t)a3
{
  -[ARDisplayLink setPreferredFramesPerSecond:](self->_displayLink, "setPreferredFramesPerSecond:", a3);
}

- (BOOL)schedulingActive
{
  ARRenderSyncScheduler *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_schedulingActive;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setSchedulingActive:(BOOL)a3
{
  os_unfair_lock_s *p_lock;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  os_unfair_lock_s *v14;
  _QWORD v15[5];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_schedulingActive = a3;
  if (!a3)
  {
    if (-[ARRenderSyncScheduler excessiveCallbackOptions](self, "excessiveCallbackOptions") == 1)
    {
      v14 = p_lock;
      v18 = 0u;
      v19 = 0u;
      v16 = 0u;
      v17 = 0u;
      v6 = self->_blocks;
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v17;
        v10 = MEMORY[0x1E0C809B0];
        do
        {
          v11 = 0;
          do
          {
            if (*(_QWORD *)v17 != v9)
              objc_enumerationMutation(v6);
            v12 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v11);
            -[ARDisplayLink runloop](self->_displayLink, "runloop", v14);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v15[0] = v10;
            v15[1] = 3221225472;
            v15[2] = __45__ARRenderSyncScheduler_setSchedulingActive___block_invoke;
            v15[3] = &unk_1E6672168;
            v15[4] = v12;
            objc_msgSend(v13, "runOnRunLoop:", v15);

            ++v11;
          }
          while (v8 != v11);
          v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        }
        while (v8);
      }

      p_lock = v14;
    }
    -[NSMutableArray removeAllObjects](self->_blocks, "removeAllObjects", v14);
  }
  os_unfair_lock_unlock(p_lock);
}

void __45__ARRenderSyncScheduler_setSchedulingActive___block_invoke(uint64_t a1)
{
  void (**v1)(void);

  objc_msgSend(*(id *)(a1 + 32), "block");
  v1 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v1[2]();

}

- (void)submitBlock:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_schedulingActive)
  {
    v5 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setEntryTimestamp:", v6);

    objc_msgSend(v5, "setBlock:", v4);
    -[NSMutableArray addObject:](self->_blocks, "addObject:", v5);

  }
  else
  {
    -[ARDisplayLink runloop](self->_displayLink, "runloop");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __37__ARRenderSyncScheduler_submitBlock___block_invoke;
    v8[3] = &unk_1E6673928;
    v9 = v4;
    objc_msgSend(v7, "runOnRunLoop:", v8);

  }
  -[NSMutableArray count](self->_blocks, "count");
  kdebug_trace();
  os_unfair_lock_unlock(&self->_lock);

}

uint64_t __37__ARRenderSyncScheduler_submitBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_callback
{
  -[ARDisplayLink vsyncOffset](self->_displayLink, "vsyncOffset");
  -[ARRenderSyncScheduler inputJitterBufferInterval](self, "inputJitterBufferInterval");
  -[ARRenderSyncScheduler expectedFramesPerSecond](self, "expectedFramesPerSecond");
  kdebug_trace();
  -[ARRenderSyncScheduler _tryNextBlockWithTotalTried:](self, "_tryNextBlockWithTotalTried:", 0);
}

- (void)_tryNextBlockWithTotalTried:(unint64_t)a3
{
  os_unfair_lock_s *p_lock;
  void *v6;
  void *v7;
  double v8;
  double v9;
  char v10;
  void *v11;
  void (**v12)(void);
  void (**v13)(void);
  id v14;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_schedulingActive)
  {
    -[NSMutableArray firstObject](self->_blocks, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v6;
    if (v6)
    {
      objc_msgSend(v6, "entryTimestamp");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "timeIntervalSinceNow");
      v9 = -v8;

      v10 = -[ARRenderSyncScheduler _callbackActionForBlockWithLatency:](self, "_callbackActionForBlockWithLatency:", v9);
    }
    else
    {
      v10 = 0;
    }
    -[NSMutableArray count](self->_blocks, "count");
    kdebug_trace();
    if ((v10 & 1) != 0)
    {
      -[NSMutableArray removeObjectAtIndex:](self->_blocks, "removeObjectAtIndex:", 0);
      os_unfair_lock_unlock(p_lock);
      if (v14)
      {
        if (!a3)
        {
          objc_msgSend(v14, "block");
          v13 = (void (**)(void))objc_claimAutoreleasedReturnValue();
          v13[2]();

          self->_reportAdjustments = 1;
          if ((v10 & 2) == 0)
            goto LABEL_20;
          goto LABEL_19;
        }
        if (-[ARRenderSyncScheduler excessiveCallbackOptions](self, "excessiveCallbackOptions") == 1)
        {
          objc_msgSend(v14, "block");
          v12 = (void (**)(void))objc_claimAutoreleasedReturnValue();
          v12[2]();

        }
        self->_reportAdjustments = 1;
        -[ARRenderSyncScheduler excessiveCallbackOptions](self, "excessiveCallbackOptions");
        goto LABEL_17;
      }
      if (!a3 && self->_reportAdjustments)
LABEL_17:
        kdebug_trace();
    }
    else
    {
      os_unfair_lock_unlock(p_lock);
      if (!a3 && self->_reportAdjustments)
        goto LABEL_17;
    }
    if ((v10 & 2) == 0)
    {
LABEL_20:
      v11 = v14;
      goto LABEL_21;
    }
LABEL_19:
    kdebug_trace();
    -[ARRenderSyncScheduler _tryNextBlockWithTotalTried:](self, "_tryNextBlockWithTotalTried:", a3 + 1);
    goto LABEL_20;
  }
  os_unfair_lock_unlock(p_lock);
  v11 = 0;
LABEL_21:

}

- (unint64_t)_callbackActionForBlockWithLatency:(double)a3
{
  double v5;
  double v6;
  double v7;
  unint64_t v9;
  double v10;

  -[ARRenderSyncScheduler inputJitterBufferInterval](self, "inputJitterBufferInterval");
  v6 = v5;
  -[ARRollingNumberSeries count](self->_latencies, "count");
  -[ARRollingNumberSeries min](self->_latencies, "min");
  -[ARRollingNumberSeries max](self->_latencies, "max");
  kdebug_trace();
  if (!self->_initialLatencyReached)
  {
    if (v6 > a3)
      return 0;
    self->_initialLatencyReached = 1;
  }
  if (-[ARRollingNumberSeries count](self->_latencies, "count"))
  {
    -[ARRollingNumberSeries max](self->_latencies, "max");
    if (v7 < v6)
    {
      self->_initialLatencyReached = 0;
      -[ARRollingNumberSeries clear](self->_latencies, "clear");
      return 0;
    }
  }
  -[ARRollingNumberSeries appendNumber:](self->_latencies, "appendNumber:", a3);
  v9 = -[ARRollingNumberSeries count](self->_latencies, "count");
  if (v9 != -[ARRollingNumberSeries windowSize](self->_latencies, "windowSize"))
    return 1;
  -[ARRollingNumberSeries min](self->_latencies, "min");
  if (v10 <= v6 + 1.0 / (double)-[ARRenderSyncScheduler expectedFramesPerSecond](self, "expectedFramesPerSecond"))
    return 1;
  self->_initialLatencyReached = 0;
  return 3;
}

- (double)inputJitterBufferInterval
{
  return self->_inputJitterBufferInterval;
}

- (void)setInputJitterBufferInterval:(double)a3
{
  self->_inputJitterBufferInterval = a3;
}

- (unint64_t)excessiveCallbackOptions
{
  return self->_excessiveCallbackOptions;
}

- (void)setExcessiveCallbackOptions:(unint64_t)a3
{
  self->_excessiveCallbackOptions = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blocks, 0);
  objc_storeStrong((id *)&self->_latencies, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
}

@end
