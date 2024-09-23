@implementation IMTypingTimer

+ (BOOL)shouldAdjustTimeoutIntervalForBeginDate
{
  return 1;
}

- (IMTypingTimer)initWithHandle:(id)a3 beginDate:(id)a4 timeoutInterval:(double)a5 delegate:(id)a6
{
  id v11;
  id v12;
  id v13;
  IMTypingTimer *v14;
  IMTypingTimer *v15;
  id *p_beginDate;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  uint64_t v22;
  NSTimer *timer;
  objc_super v25;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v25.receiver = self;
  v25.super_class = (Class)IMTypingTimer;
  v14 = -[IMTypingTimer init](&v25, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_handle, a3);
    p_beginDate = (id *)&v15->_beginDate;
    objc_storeStrong((id *)&v15->_beginDate, a4);
    v15->_timeoutInterval = a5;
    objc_storeWeak((id *)&v15->_delegate, v13);
    if (+[IMTypingTimer shouldAdjustTimeoutIntervalForBeginDate](IMTypingTimer, "shouldAdjustTimeoutIntervalForBeginDate")&& *p_beginDate)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      if (v17)
      {
        objc_msgSend(v17, "timeIntervalSinceReferenceDate");
        v20 = v19;
        objc_msgSend(*p_beginDate, "timeIntervalSinceReferenceDate");
        a5 = a5 - (v20 - v21);
      }

    }
    if (a5 <= 0.0)
    {
      -[IMTypingTimer triggerTimeout](v15, "triggerTimeout");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", v15, sel_timerCallback, 0, 0, a5);
      v22 = objc_claimAutoreleasedReturnValue();
      timer = v15->_timer;
      v15->_timer = (NSTimer *)v22;

      -[NSTimer setTolerance:](v15->_timer, "setTolerance:", 5.0);
    }
  }

  return v15;
}

- (void)timerCallback
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (-[IMTypingTimer isValid](self, "isValid"))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        -[IMTypingTimer handle](self, "handle");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = 138412290;
        v6 = v4;
        _os_log_impl(&dword_1A1FF4000, v3, OS_LOG_TYPE_INFO, "Timer callback was called for valid typing timeout with handle %@", (uint8_t *)&v5, 0xCu);

      }
    }
    -[IMTypingTimer invalidate](self, "invalidate");
    -[IMTypingTimer triggerTimeout](self, "triggerTimeout");
  }
}

- (void)triggerTimeout
{
  NSObject *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      -[IMTypingTimer handle](self, "handle");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138412290;
      v7 = v4;
      _os_log_impl(&dword_1A1FF4000, v3, OS_LOG_TYPE_INFO, "Triggering typing timeout for handle %@", (uint8_t *)&v6, 0xCu);

    }
  }
  -[IMTypingTimer delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "typingTimeoutDidTriggerWithTimer:", self);

}

- (void)invalidate
{
  void *v3;

  -[IMTypingTimer timer](self, "timer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  MEMORY[0x1E0DE7D20](self, sel_setTimer_);
}

- (BOOL)isValid
{
  void *v2;
  char v3;

  -[IMTypingTimer timer](self, "timer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isValid");

  return v3;
}

- (IMTypingTimerDelegate)delegate
{
  return (IMTypingTimerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (IMHandle)handle
{
  return self->_handle;
}

- (NSDate)beginDate
{
  return self->_beginDate;
}

- (double)timeoutInterval
{
  return self->_timeoutInterval;
}

- (NSTimer)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
  objc_storeStrong((id *)&self->_timer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_beginDate, 0);
  objc_storeStrong((id *)&self->_handle, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
