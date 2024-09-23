@implementation ANTimer

+ (id)timerWithLabel:(id)a3 identifier:(id)a4
{
  id v5;
  id v6;
  ANTimer *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[ANTimer initWithLabel:identifier:]([ANTimer alloc], "initWithLabel:identifier:", v6, v5);

  return v7;
}

- (ANTimer)initWithLabel:(id)a3 identifier:(id)a4
{
  id v7;
  id v8;
  ANTimer *v9;
  ANTimer *v10;
  void *v11;
  char *v12;
  uint64_t v13;
  OS_os_log *log;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)ANTimer;
  v9 = -[ANTimer init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_label, a3);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@Timer"), v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (char *)ANLogBuildCategoryName(v11, v8);
    ANLogWithCategory(v12);
    v13 = objc_claimAutoreleasedReturnValue();
    log = v10->_log;
    v10->_log = (OS_os_log *)v13;

  }
  return v10;
}

- (void)dealloc
{
  objc_super v3;

  -[ANTimer cancel](self, "cancel");
  v3.receiver = self;
  v3.super_class = (Class)ANTimer;
  -[ANTimer dealloc](&v3, sel_dealloc);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[ANTimer timer](self, "timer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ANTimer label](self, "label");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ANTimer timeoutValue](self, "timeoutValue");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Timer = %@, Label = %@, Timeout Value = %f"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)startWithValue:(double)a3 queue:(id)a4 handler:(id)a5
{
  id v8;
  id v9;

  v8 = a5;
  v9 = a4;
  -[ANTimer setTimeoutValue:](self, "setTimeoutValue:", a3);
  -[ANTimer cancel](self, "cancel");
  -[ANTimer _createAndStartTimerWithQueue:handler:](self, "_createAndStartTimerWithQueue:handler:", v9, v8);

}

- (void)_createAndStartTimerWithQueue:(id)a3 handler:(id)a4
{
  id v6;
  dispatch_source_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, (dispatch_queue_t)a3);
  -[ANTimer setTimer:](self, "setTimer:", v7);

  -[ANTimer timer](self, "timer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[ANTimer log](self, "log");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      -[ANTimer timer](self, "timer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412290;
      v13 = v10;
      _os_log_impl(&dword_2156FF000, v9, OS_LOG_TYPE_DEFAULT, "Created Timer %@", (uint8_t *)&v12, 0xCu);

    }
    -[ANTimer timer](self, "timer");
    v11 = objc_claimAutoreleasedReturnValue();
    dispatch_source_set_event_handler(v11, v6);

    -[ANTimer _startTimer](self, "_startTimer");
  }

}

- (void)_startTimer
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  double v7;
  dispatch_time_t v8;
  double v9;
  NSObject *v10;
  int v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  -[ANTimer log](self, "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[ANTimer timer](self, "timer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[ANTimer timeoutValue](self, "timeoutValue");
    v11 = 138412546;
    v12 = v4;
    v13 = 2048;
    v14 = v5;
    _os_log_impl(&dword_2156FF000, v3, OS_LOG_TYPE_DEFAULT, "Starting Timer (%@) for %f seconds", (uint8_t *)&v11, 0x16u);

  }
  -[ANTimer timer](self, "timer");
  v6 = objc_claimAutoreleasedReturnValue();
  -[ANTimer timeoutValue](self, "timeoutValue");
  v8 = dispatch_time(0, (uint64_t)(v7 * 1000000000.0));
  -[ANTimer timeoutValue](self, "timeoutValue");
  dispatch_source_set_timer(v6, v8, (unint64_t)(v9 * 1000000000.0), 0);

  -[ANTimer timer](self, "timer");
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_resume(v10);

}

- (void)reset
{
  void *v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  -[ANTimer timer](self, "timer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[ANTimer timer](self, "timer");
    v4 = objc_claimAutoreleasedReturnValue();
    dispatch_suspend(v4);

    -[ANTimer log](self, "log");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      -[ANTimer timer](self, "timer");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138412290;
      v8 = v6;
      _os_log_impl(&dword_2156FF000, v5, OS_LOG_TYPE_DEFAULT, "Restarting Timer %@", (uint8_t *)&v7, 0xCu);

    }
    -[ANTimer _startTimer](self, "_startTimer");
  }
}

- (void)cancel
{
  void *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  -[ANTimer timer](self, "timer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[ANTimer log](self, "log");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      -[ANTimer timer](self, "timer");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138412290;
      v8 = v5;
      _os_log_impl(&dword_2156FF000, v4, OS_LOG_TYPE_DEFAULT, "Canceling and removing Timer %@", (uint8_t *)&v7, 0xCu);

    }
    -[ANTimer timer](self, "timer");
    v6 = objc_claimAutoreleasedReturnValue();
    dispatch_source_cancel(v6);

    -[ANTimer setTimer:](self, "setTimer:", 0);
  }
}

- (NSString)label
{
  return self->_label;
}

- (OS_dispatch_source)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
  objc_storeStrong((id *)&self->_timer, a3);
}

- (OS_os_log)log
{
  return self->_log;
}

- (double)timeoutValue
{
  return self->_timeoutValue;
}

- (void)setTimeoutValue:(double)a3
{
  self->_timeoutValue = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end
