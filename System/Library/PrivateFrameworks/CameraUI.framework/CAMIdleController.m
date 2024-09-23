@implementation CAMIdleController

- (CAMIdleController)init
{
  CAMIdleController *v2;
  CAMIdleController *v3;
  NSTimer *enableIdleTimer;
  CAMIdleController *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CAMIdleController;
  v2 = -[CAMIdleController init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_updatingIdleTimer = 0;
    enableIdleTimer = v2->_enableIdleTimer;
    v2->_enableIdleTimer = 0;

    v5 = v3;
  }

  return v3;
}

- (void)startUpdatingIdleTimer
{
  -[CAMIdleController _setUpdatingIdleTimer:](self, "_setUpdatingIdleTimer:", 1);
  -[CAMIdleController _delayIdleTimerByTimeIntervalUnlessIndefinitelyDisabled:](self, "_delayIdleTimerByTimeIntervalUnlessIndefinitelyDisabled:", 300.0);
}

- (void)_setUpdatingIdleTimer:(BOOL)a3
{
  self->_updatingIdleTimer = a3;
}

- (void)_delayIdleTimerByTimeIntervalUnlessIndefinitelyDisabled:(double)a3
{
  if (!-[CAMIdleController _isIdleTimerIndefinitelyDisabled](self, "_isIdleTimerIndefinitelyDisabled"))
    -[CAMIdleController _delayIdleTimerByTimeInterval:](self, "_delayIdleTimerByTimeInterval:", a3);
}

- (BOOL)_isIdleTimerIndefinitelyDisabled
{
  void *v2;
  void *v3;
  char v4;
  BOOL v5;

  -[CAMIdleController _enableIdleTimer](self, "_enableIdleTimer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isIdleTimerDisabled");

  if (v2)
    v5 = 0;
  else
    v5 = v4;

  return v5;
}

- (NSTimer)_enableIdleTimer
{
  return self->_enableIdleTimer;
}

- (void)_delayIdleTimerByTimeInterval:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  int v9;
  double v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (-[CAMIdleController isUpdatingIdleTimer](self, "isUpdatingIdleTimer"))
  {
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setIdleTimerDisabled:", 1);

    -[CAMIdleController _enableIdleTimer](self, "_enableIdleTimer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "invalidate");
    objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__immediatelyEnableApplicationIdleTimer, 0, 0, a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMIdleController _setEnableIdleTimer:](self, "_setEnableIdleTimer:", v7);
    v8 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 134217984;
      v10 = a3;
      _os_log_impl(&dword_1DB760000, v8, OS_LOG_TYPE_DEFAULT, "Delaying application idle timer by %f seconds", (uint8_t *)&v9, 0xCu);
    }

  }
}

- (BOOL)isUpdatingIdleTimer
{
  return self->_updatingIdleTimer;
}

- (void)_setEnableIdleTimer:(id)a3
{
  objc_storeStrong((id *)&self->_enableIdleTimer, a3);
}

- (void)dealloc
{
  objc_super v3;

  -[CAMIdleController _immediatelyEnableApplicationIdleTimer](self, "_immediatelyEnableApplicationIdleTimer");
  v3.receiver = self;
  v3.super_class = (Class)CAMIdleController;
  -[CAMIdleController dealloc](&v3, sel_dealloc);
}

- (void)stopUpdatingIdleTimer
{
  -[CAMIdleController _immediatelyEnableApplicationIdleTimer](self, "_immediatelyEnableApplicationIdleTimer");
  -[CAMIdleController _setUpdatingIdleTimer:](self, "_setUpdatingIdleTimer:", 0);
}

- (void)stillImageRequestDidStopCapturingStillImage:(id)a3
{
  void *v4;
  double v5;

  objc_msgSend(a3, "textAnalysisIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v5 = 30.0;
  else
    v5 = 300.0;

  -[CAMIdleController _delayIdleTimerByTimeIntervalUnlessIndefinitelyDisabled:](self, "_delayIdleTimerByTimeIntervalUnlessIndefinitelyDisabled:", v5);
}

- (void)videoRequestDidStopCapturing:(id)a3
{
  -[CAMIdleController _delayIdleTimerByTimeInterval:](self, "_delayIdleTimerByTimeInterval:", a3, 300.0);
}

- (void)updateForVideoPaused
{
  -[CAMIdleController _delayIdleTimerByTimeInterval:](self, "_delayIdleTimerByTimeInterval:", 300.0);
}

- (void)stillImageRequestsDidStopCapturingCTMVideo
{
  -[CAMIdleController _delayIdleTimerByTimeInterval:](self, "_delayIdleTimerByTimeInterval:", 300.0);
}

- (void)panoramaRequestDidStopCapturing:(id)a3 interrupted:(BOOL)a4
{
  -[CAMIdleController _delayIdleTimerByTimeInterval:](self, "_delayIdleTimerByTimeInterval:", a3, a4, 300.0);
}

- (void)timelapseRequestDidStopCapturing
{
  -[CAMIdleController _delayIdleTimerByTimeInterval:](self, "_delayIdleTimerByTimeInterval:", 300.0);
}

- (void)_teardownEnableIdleTimer
{
  void *v3;

  -[CAMIdleController _enableIdleTimer](self, "_enableIdleTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  -[CAMIdleController _setEnableIdleTimer:](self, "_setEnableIdleTimer:", 0);
}

- (void)_immediatelyEnableApplicationIdleTimer
{
  void *v3;
  NSObject *v4;
  uint8_t v5[16];

  if (-[CAMIdleController isUpdatingIdleTimer](self, "isUpdatingIdleTimer"))
  {
    -[CAMIdleController _teardownEnableIdleTimer](self, "_teardownEnableIdleTimer");
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setIdleTimerDisabled:", 0);

    v4 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1DB760000, v4, OS_LOG_TYPE_DEFAULT, "Immediately enabling application idle timer", v5, 2u);
    }

  }
}

- (void)_indefinitelyDisableApplicationIdleTimer
{
  void *v3;
  NSObject *v4;
  uint8_t v5[16];

  if (-[CAMIdleController isUpdatingIdleTimer](self, "isUpdatingIdleTimer"))
  {
    -[CAMIdleController _teardownEnableIdleTimer](self, "_teardownEnableIdleTimer");
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setIdleTimerDisabled:", 1);

    v4 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1DB760000, v4, OS_LOG_TYPE_DEFAULT, "Disabling application idle timer indefinitely", v5, 2u);
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enableIdleTimer, 0);
}

@end
