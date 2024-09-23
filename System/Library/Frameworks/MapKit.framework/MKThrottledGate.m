@implementation MKThrottledGate

- (MKThrottledGate)initWithMax:(int)a3 refreshRate:(double)a4 queue:(id)a5
{
  id v9;
  MKThrottledGate *v10;
  MKThrottledGate *v11;
  uint64_t v12;
  VKTimer *timer;
  NSMutableArray *v14;
  NSMutableArray *waitingJobs;
  objc_super v17;

  v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)MKThrottledGate;
  v10 = -[MKThrottledGate init](&v17, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_queue, a5);
    v11->_maxAvailableTickets = a3;
    v11->_availableTickets = (double)a3;
    v11->_refreshRate = a4;
    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC6578]), "initWithTarget:selector:queue:", v11, sel__timerFired_, v11->_queue);
    timer = v11->_timer;
    v11->_timer = (VKTimer *)v12;

    v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    waitingJobs = v11->_waitingJobs;
    v11->_waitingJobs = v14;

  }
  return v11;
}

- (void)dealloc
{
  objc_super v3;

  -[VKTimer invalidate](self->_timer, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)MKThrottledGate;
  -[MKThrottledGate dealloc](&v3, sel_dealloc);
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p: max tickets: %d, available: %f, refresh rate: %f, waiting jobs: %lu"), v5, self, self->_maxAvailableTickets, *(_QWORD *)&self->_availableTickets, *(_QWORD *)&self->_refreshRate, -[NSMutableArray count](self->_waitingJobs, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_ensureTimer
{
  CFAbsoluteTime v3;

  -[VKTimer nextFireDate](self->_timer, "nextFireDate");
  if (v3 > CFAbsoluteTimeGetCurrent() + 1.0)
    -[VKTimer fireAfter:](self->_timer, "fireAfter:", 1.0);
}

- (void)dispatch:(id)a3
{
  uint64_t v4;
  NSMutableArray *waitingJobs;
  void *v6;
  id v7;

  v4 = objc_msgSend(a3, "copy");
  waitingJobs = self->_waitingJobs;
  v7 = (id)v4;
  v6 = (void *)MEMORY[0x18D778DB8]();
  -[NSMutableArray addObject:](waitingJobs, "addObject:", v6);

  if (-[MKThrottledGate _dispatchWaitingJobsIfNecessary](self, "_dispatchWaitingJobsIfNecessary"))
    -[MKThrottledGate _ensureTimer](self, "_ensureTimer");

}

- (void)_timerFired:(id)a3
{
  BOOL v4;
  _BOOL4 v5;

  v4 = -[MKThrottledGate _replenishAvailableJobsIfNecessary](self, "_replenishAvailableJobsIfNecessary", a3);
  v5 = -[MKThrottledGate _dispatchWaitingJobsIfNecessary](self, "_dispatchWaitingJobsIfNecessary");
  if (v4 || v5)
    -[MKThrottledGate _ensureTimer](self, "_ensureTimer");
}

- (BOOL)_replenishAvailableJobsIfNecessary
{
  double availableTickets;
  double maxAvailableTickets;

  availableTickets = self->_availableTickets;
  maxAvailableTickets = (double)self->_maxAvailableTickets;
  if (availableTickets < maxAvailableTickets)
  {
    availableTickets = availableTickets + self->_refreshRate;
    if (availableTickets >= maxAvailableTickets)
      availableTickets = (double)self->_maxAvailableTickets;
    self->_availableTickets = availableTickets;
  }
  return availableTickets < maxAvailableTickets;
}

- (BOOL)_dispatchWaitingJobsIfNecessary
{
  uint64_t v3;
  void *v4;

  v3 = -[NSMutableArray count](self->_waitingJobs, "count");
  if (v3)
  {
    while (self->_availableTickets >= 1.0)
    {
      if (!-[NSMutableArray count](self->_waitingJobs, "count"))
        break;
      self->_availableTickets = self->_availableTickets + -1.0;
      -[NSMutableArray objectAtIndex:](self->_waitingJobs, "objectAtIndex:", 0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray removeObjectAtIndex:](self->_waitingJobs, "removeObjectAtIndex:", 0);
      dispatch_async((dispatch_queue_t)self->_queue, v4);

    }
    LOBYTE(v3) = -[NSMutableArray count](self->_waitingJobs, "count") != 0;
  }
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_waitingJobs, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
