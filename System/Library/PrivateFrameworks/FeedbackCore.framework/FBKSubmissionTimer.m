@implementation FBKSubmissionTimer

- (FBKSubmissionTimer)initWithDelegate:(id)a3 forTask:(id)a4 initialTimeout:(double)a5
{
  id v8;
  id v9;
  FBKSubmissionTimer *v10;
  NSObject *v11;
  void *v12;
  int v13;
  objc_super v15;
  uint8_t buf[4];
  int v17;
  __int16 v18;
  double v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v15.receiver = self;
  v15.super_class = (Class)FBKSubmissionTimer;
  v10 = -[FBKSubmissionTimer init](&v15, sel_init);
  if (v10)
  {
    +[FBKLog appHandle](FBKLog, "appHandle");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v9, "taskIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "intValue");
      *(_DWORD *)buf = 67109376;
      v17 = v13;
      v18 = 2048;
      v19 = a5;
      _os_log_impl(&dword_21D9A9000, v11, OS_LOG_TYPE_DEFAULT, "starting submission timer for [%i] with timeout [%f]", buf, 0x12u);

    }
    -[FBKSubmissionTimer setGivenInterval:](v10, "setGivenInterval:", a5);
    -[FBKSubmissionTimer resetTimerWithInterval:](v10, "resetTimerWithInterval:", a5);
    -[FBKSubmissionTimer setDelegate:](v10, "setDelegate:", v8);
    -[FBKSubmissionTimer setTask:](v10, "setTask:", v9);
  }

  return v10;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[FBKSubmissionTimer timer](self, "timer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  -[FBKSubmissionTimer setTimer:](self, "setTimer:", 0);
  v4.receiver = self;
  v4.super_class = (Class)FBKSubmissionTimer;
  -[FBKSubmissionTimer dealloc](&v4, sel_dealloc);
}

- (void)timerDidTick
{
  void *v3;
  void *v4;
  id v5;

  -[FBKSubmissionTimer timer](self, "timer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  -[FBKSubmissionTimer setTimer:](self, "setTimer:", 0);
  -[FBKSubmissionTimer delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[FBKSubmissionTimer task](self, "task");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timer:didTimeoutForTask:", self, v4);

}

- (void)resetTimerWithInterval:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[FBKSubmissionTimer timer](self, "timer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invalidate");

  objc_msgSend(MEMORY[0x24BDBCF40], "timerWithTimeInterval:target:selector:userInfo:repeats:", self, sel_timerDidTick, 0, 1, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKSubmissionTimer setTimer:](self, "setTimer:", v6);

  objc_msgSend(MEMORY[0x24BDBCF18], "currentRunLoop");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[FBKSubmissionTimer timer](self, "timer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addTimer:forMode:", v7, *MEMORY[0x24BDBCB80]);

}

- (NSTimer)timer
{
  return (NSTimer *)objc_getProperty(self, a2, 8, 1);
}

- (void)setTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (FBKSubmissionTimerDelegate)delegate
{
  return (FBKSubmissionTimerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (FBKUploadTask)task
{
  return (FBKUploadTask *)objc_getProperty(self, a2, 24, 1);
}

- (void)setTask:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (double)givenInterval
{
  return self->_givenInterval;
}

- (void)setGivenInterval:(double)a3
{
  self->_givenInterval = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_task, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_timer, 0);
}

@end
