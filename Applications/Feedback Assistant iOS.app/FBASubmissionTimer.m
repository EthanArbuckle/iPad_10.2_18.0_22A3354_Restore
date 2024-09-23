@implementation FBASubmissionTimer

- (FBASubmissionTimer)initWithDelegate:(id)a3 forTask:(id)a4 initialTimeout:(double)a5
{
  id v8;
  id v9;
  FBASubmissionTimer *v10;
  NSObject *v11;
  void *v12;
  unsigned int v13;
  objc_super v15;
  uint8_t buf[4];
  unsigned int v17;
  __int16 v18;
  double v19;

  v8 = a3;
  v9 = a4;
  v15.receiver = self;
  v15.super_class = (Class)FBASubmissionTimer;
  v10 = -[FBASubmissionTimer init](&v15, "init");
  if (v10)
  {
    v11 = objc_claimAutoreleasedReturnValue(+[FBALog appHandle](FBALog, "appHandle"));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "taskIdentifier"));
      v13 = objc_msgSend(v12, "intValue");
      *(_DWORD *)buf = 67109376;
      v17 = v13;
      v18 = 2048;
      v19 = a5;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "starting submission timer for [%i] with timeout [%f]", buf, 0x12u);

    }
    -[FBASubmissionTimer setGivenInterval:](v10, "setGivenInterval:", a5);
    -[FBASubmissionTimer resetTimerWithInterval:](v10, "resetTimerWithInterval:", a5);
    -[FBASubmissionTimer setDelegate:](v10, "setDelegate:", v8);
    -[FBASubmissionTimer setTask:](v10, "setTask:", v9);
  }

  return v10;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FBASubmissionTimer timer](self, "timer"));
  objc_msgSend(v3, "invalidate");

  -[FBASubmissionTimer setTimer:](self, "setTimer:", 0);
  v4.receiver = self;
  v4.super_class = (Class)FBASubmissionTimer;
  -[FBASubmissionTimer dealloc](&v4, "dealloc");
}

- (void)timerDidTick
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FBASubmissionTimer timer](self, "timer"));
  objc_msgSend(v3, "invalidate");

  -[FBASubmissionTimer setTimer:](self, "setTimer:", 0);
  v5 = (id)objc_claimAutoreleasedReturnValue(-[FBASubmissionTimer delegate](self, "delegate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FBASubmissionTimer task](self, "task"));
  objc_msgSend(v5, "timer:didTimeoutForTask:", self, v4);

}

- (void)resetTimerWithInterval:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FBASubmissionTimer timer](self, "timer"));
  objc_msgSend(v5, "invalidate");

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimer timerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "timerWithTimeInterval:target:selector:userInfo:repeats:", self, "timerDidTick", 0, 1, a3));
  -[FBASubmissionTimer setTimer:](self, "setTimer:", v6);

  v8 = (id)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](NSRunLoop, "currentRunLoop"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FBASubmissionTimer timer](self, "timer"));
  objc_msgSend(v8, "addTimer:forMode:", v7, NSRunLoopCommonModes);

}

- (double)currentInterval
{
  double result;

  -[FBASubmissionTimer givenInterval](self, "givenInterval");
  return result;
}

- (NSTimer)timer
{
  return (NSTimer *)objc_getProperty(self, a2, 8, 1);
}

- (void)setTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (FBASubmissionTimerDelegate)delegate
{
  return (FBASubmissionTimerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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
