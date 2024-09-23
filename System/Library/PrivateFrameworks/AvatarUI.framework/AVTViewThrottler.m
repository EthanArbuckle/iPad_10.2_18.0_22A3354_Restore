@implementation AVTViewThrottler

- (AVTViewThrottler)initWithAVTView:(id)a3 environment:(id)a4
{
  id v7;
  id v8;
  AVTViewThrottler *v9;
  AVTViewThrottler *v10;
  uint64_t v11;
  AVTUILogger *logger;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)AVTViewThrottler;
  v9 = -[AVTViewThrottler init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_avtView, a3);
    objc_msgSend(v8, "logger");
    v11 = objc_claimAutoreleasedReturnValue();
    logger = v10->_logger;
    v10->_logger = (AVTUILogger *)v11;

  }
  return v10;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[AVTViewThrottler autoUnthrottlingTimer](self, "autoUnthrottlingTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  v4.receiver = self;
  v4.super_class = (Class)AVTViewThrottler;
  -[AVTViewThrottler dealloc](&v4, sel_dealloc);
}

- (void)throttle
{
  -[AVTViewThrottler cancelAutoUnthrottling](self, "cancelAutoUnthrottling");
  -[AVTViewThrottler applyThrottling](self, "applyThrottling");
}

- (void)cancelAutoUnthrottling
{
  void *v3;
  void *v4;

  -[AVTViewThrottler autoUnthrottlingTimer](self, "autoUnthrottlingTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[AVTViewThrottler autoUnthrottlingTimer](self, "autoUnthrottlingTimer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "invalidate");

    -[AVTViewThrottler setAutoUnthrottlingTimer:](self, "setAutoUnthrottlingTimer:", 0);
  }
}

- (void)throttleForDelay:(double)a3
{
  void *v5;

  if (!-[AVTViewThrottler throttling](self, "throttling")
    || (-[AVTViewThrottler autoUnthrottlingTimer](self, "autoUnthrottlingTimer"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    -[AVTViewThrottler applyThrottling](self, "applyThrottling");
    -[AVTViewThrottler scheduleAutoUnthrottlingAfterDelay:](self, "scheduleAutoUnthrottlingAfterDelay:", a3);
  }
}

- (void)applyThrottling
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Only call from main thread"));
  if (!-[AVTViewThrottler throttling](self, "throttling"))
  {
    -[AVTViewThrottler setThrottling:](self, "setThrottling:", 1);
    -[AVTViewThrottler logger](self, "logger");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "logThrottlingAVTView");

    -[AVTViewThrottler avtView](self, "avtView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setPreferredFramesPerSecond:", 30);

    -[AVTViewThrottler avtView](self, "avtView");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "faceTracker");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "decreaseFrameRate");

  }
}

- (void)unthrottle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Only call from main thread"));
  -[AVTViewThrottler cancelAutoUnthrottling](self, "cancelAutoUnthrottling");
  if (-[AVTViewThrottler throttling](self, "throttling"))
  {
    -[AVTViewThrottler setThrottling:](self, "setThrottling:", 0);
    -[AVTViewThrottler logger](self, "logger");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "logUnthrottlingAVTView");

    -[AVTViewThrottler consumerDelegate](self, "consumerDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "consumer:willConsumeRenderingResourceForEstimatedDuration:", self, 0.0);

    -[AVTViewThrottler avtView](self, "avtView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPreferredFramesPerSecond:", 0);

    -[AVTViewThrottler avtView](self, "avtView");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "faceTracker");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "increaseFrameRateToMaximum");

  }
}

- (void)scheduleAutoUnthrottlingAfterDelay:(double)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  id v11;
  id location;

  -[AVTViewThrottler cancelAutoUnthrottling](self, "cancelAutoUnthrottling");
  if (a3 > 0.0)
  {
    objc_initWeak(&location, self);
    v5 = (void *)MEMORY[0x1E0C99E88];
    v7 = MEMORY[0x1E0C809B0];
    v8 = 3221225472;
    v9 = __55__AVTViewThrottler_scheduleAutoUnthrottlingAfterDelay___block_invoke;
    v10 = &unk_1EA51E290;
    objc_copyWeak(&v11, &location);
    objc_msgSend(v5, "scheduledTimerWithTimeInterval:repeats:block:", 0, &v7, a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTViewThrottler setAutoUnthrottlingTimer:](self, "setAutoUnthrottlingTimer:", v6, v7, v8, v9, v10);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

void __55__AVTViewThrottler_scheduleAutoUnthrottlingAfterDelay___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "autoUnthrottle");

}

- (void)autoUnthrottle
{
  -[AVTViewThrottler setAutoUnthrottlingTimer:](self, "setAutoUnthrottlingTimer:", 0);
  -[AVTViewThrottler unthrottle](self, "unthrottle");
}

- (void)releaseRenderingResourceForEstimatedDuration:(double)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __65__AVTViewThrottler_releaseRenderingResourceForEstimatedDuration___block_invoke;
  v3[3] = &unk_1EA51ECD8;
  v3[4] = self;
  *(double *)&v3[5] = a3;
  dispatch_async(MEMORY[0x1E0C80D38], v3);
}

void __65__AVTViewThrottler_releaseRenderingResourceForEstimatedDuration___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "consumerDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v3 = *(void **)(a1 + 32);
    if (*(double *)(a1 + 40) == 0.0)
      objc_msgSend(v3, "throttle");
    else
      objc_msgSend(v3, "throttleForDelay:");
  }
}

- (AVTDeviceResourceConsumerDelegate)consumerDelegate
{
  return (AVTDeviceResourceConsumerDelegate *)objc_loadWeakRetained((id *)&self->_consumerDelegate);
}

- (void)setConsumerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_consumerDelegate, a3);
}

- (AVTView)avtView
{
  return self->_avtView;
}

- (AVTUILogger)logger
{
  return self->_logger;
}

- (NSTimer)autoUnthrottlingTimer
{
  return self->_autoUnthrottlingTimer;
}

- (void)setAutoUnthrottlingTimer:(id)a3
{
  objc_storeStrong((id *)&self->_autoUnthrottlingTimer, a3);
}

- (BOOL)throttling
{
  return self->_throttling;
}

- (void)setThrottling:(BOOL)a3
{
  self->_throttling = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_autoUnthrottlingTimer, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_avtView, 0);
  objc_destroyWeak((id *)&self->_consumerDelegate);
}

@end
