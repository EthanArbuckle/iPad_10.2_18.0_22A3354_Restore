@implementation CAMViewfinderActionIntervalometer

- (CAMViewfinderActionIntervalometer)init
{
  return -[CAMViewfinderActionIntervalometer initWithDelegate:interval:delay:maximumCount:viewfinderViewController:](self, "initWithDelegate:interval:delay:maximumCount:viewfinderViewController:", 0, 0, 0, 0.0, 0.0);
}

- (CAMViewfinderActionIntervalometer)initWithDelegate:(id)a3 interval:(double)a4 delay:(double)a5 maximumCount:(int64_t)a6 viewfinderViewController:(id)a7
{
  id v12;
  id v13;
  CAMViewfinderActionIntervalometer *v14;
  CAMViewfinderActionIntervalometer *v15;
  CAMPreciseTimer *v16;
  uint64_t v17;
  CAMPreciseTimer *timer;
  CAMViewfinderActionIntervalometer *v19;
  _QWORD v21[4];
  id v22;
  id location;
  objc_super v24;

  v12 = a3;
  v13 = a7;
  v24.receiver = self;
  v24.super_class = (Class)CAMViewfinderActionIntervalometer;
  v14 = -[CAMViewfinderActionIntervalometer init](&v24, sel_init);
  v15 = v14;
  if (v14)
  {
    if (!a6)
      a6 = 0x7FFFFFFFFFFFFFFFLL;
    objc_storeWeak((id *)&v14->_delegate, v12);
    v15->_interval = a4;
    v15->_delay = a5;
    v15->_maximumCount = a6;
    v15->__remaining = a6;
    objc_storeStrong((id *)&v15->__viewfinderViewController, a7);
    objc_initWeak(&location, v15);
    v16 = [CAMPreciseTimer alloc];
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __107__CAMViewfinderActionIntervalometer_initWithDelegate_interval_delay_maximumCount_viewfinderViewController___block_invoke;
    v21[3] = &unk_1EA32A920;
    objc_copyWeak(&v22, &location);
    v17 = -[CAMPreciseTimer initWithDelay:interval:handler:](v16, "initWithDelay:interval:handler:", v21, a5, a4);
    timer = v15->__timer;
    v15->__timer = (CAMPreciseTimer *)v17;

    v19 = v15;
    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }

  return v15;
}

void __107__CAMViewfinderActionIntervalometer_initWithDelegate_interval_delay_maximumCount_viewfinderViewController___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_attemptViewfinderActions");

}

- (void)startGeneratingRequests
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DB760000, log, OS_LOG_TYPE_ERROR, "Can't start generating requests from the intervalometer without a reference to a CAMViewfinderViewController!", v1, 2u);
}

- (void)_attemptViewfinderActions
{
  void *v3;
  id v4;

  -[CAMViewfinderActionIntervalometer delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    if (objc_msgSend(v3, "shouldAttemptAction"))
    {
      if (objc_msgSend(v4, "executeAction"))
      {
        -[CAMViewfinderActionIntervalometer set_remaining:](self, "set_remaining:", -[CAMViewfinderActionIntervalometer _remaining](self, "_remaining") - 1);
        if (!-[CAMViewfinderActionIntervalometer _remaining](self, "_remaining"))
        {
          -[CAMViewfinderActionIntervalometer stopAttemptingActions](self, "stopAttemptingActions");
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v4, "intervalometerDidReachMaximumCount:", self);
        }
      }
    }
  }
  else
  {
    -[CAMViewfinderActionIntervalometer stopAttemptingActions](self, "stopAttemptingActions");
  }

}

- (void)stopAttemptingActions
{
  id v2;

  -[CAMViewfinderActionIntervalometer _timer](self, "_timer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidate");

}

- (unint64_t)successfullActionCount
{
  int64_t v3;

  v3 = -[CAMViewfinderActionIntervalometer maximumCount](self, "maximumCount");
  return v3 - -[CAMViewfinderActionIntervalometer _remaining](self, "_remaining");
}

- (CAMViewfinderActionIntervalometerDelegate)delegate
{
  return (CAMViewfinderActionIntervalometerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (double)interval
{
  return self->_interval;
}

- (double)delay
{
  return self->_delay;
}

- (int64_t)maximumCount
{
  return self->_maximumCount;
}

- (int64_t)_remaining
{
  return self->__remaining;
}

- (void)set_remaining:(int64_t)a3
{
  self->__remaining = a3;
}

- (CAMPreciseTimer)_timer
{
  return self->__timer;
}

- (CAMViewfinderViewController)_viewfinderViewController
{
  return self->__viewfinderViewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__viewfinderViewController, 0);
  objc_storeStrong((id *)&self->__timer, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
