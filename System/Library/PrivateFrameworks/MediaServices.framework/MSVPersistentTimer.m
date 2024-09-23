@implementation MSVPersistentTimer

- (MSVPersistentTimer)initWithInterval:(double)a3 name:(id)a4 queue:(id)a5 block:(id)a6
{
  id v10;
  id v11;
  id v12;
  MSVPersistentTimer *v13;
  MSVPersistentTimer *v14;
  uint64_t v15;
  id block;
  uint64_t v17;
  NSString *name;
  uint64_t v19;
  NSDate *startDate;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v27;
  PCPersistentTimer *timer;
  id v29;
  NSObject *v30;
  NSString *v31;
  objc_super v33;
  uint8_t buf[4];
  NSString *v35;
  __int16 v36;
  double v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v33.receiver = self;
  v33.super_class = (Class)MSVPersistentTimer;
  v13 = -[MSVPersistentTimer init](&v33, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_interval = a3;
    v15 = objc_msgSend(v12, "copy");
    block = v14->_block;
    v14->_block = (id)v15;

    v17 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@-%p"), v10, v14);
    name = v14->_name;
    v14->_name = (NSString *)v17;

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v19 = objc_claimAutoreleasedReturnValue();
    startDate = v14->_startDate;
    v14->_startDate = (NSDate *)v19;

    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "bundleIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (v22)
    {
      v24 = v22;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "processName");
      v24 = (id)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.MSVTimer"), v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(objc_alloc(MEMORY[0x1E0D70A38]), "initWithTimeInterval:serviceIdentifier:target:selector:userInfo:", v26, v14, sel__handleTimerElapsed_, 0, a3);
    timer = v14->_timer;
    v14->_timer = (PCPersistentTimer *)v27;

    if (v11)
      v29 = v11;
    else
      v29 = (id)MEMORY[0x1E0C80D38];
    -[PCPersistentTimer scheduleInQueue:](v14->_timer, "scheduleInQueue:", v29);
    v30 = os_log_create("com.apple.amp.MediaServices", "SystemUtilities");
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      v31 = v14->_name;
      *(_DWORD *)buf = 138412546;
      v35 = v31;
      v36 = 2048;
      v37 = a3;
      _os_log_impl(&dword_1A077D000, v30, OS_LOG_TYPE_DEFAULT, "[MSVPersistentTimer] Setting timer <%@> for <%lf> seconds", buf, 0x16u);
    }

  }
  return v14;
}

- (void)dealloc
{
  objc_super v3;

  -[MSVPersistentTimer invalidateWithReason:](self, "invalidateWithReason:", CFSTR("Dealloc"));
  v3.receiver = self;
  v3.super_class = (Class)MSVPersistentTimer;
  -[MSVPersistentTimer dealloc](&v3, sel_dealloc);
}

- (void)_handleTimerElapsed:(id)a3
{
  id v4;
  MSVPersistentTimer *v5;
  NSObject *v6;
  NSString *name;
  void *v8;
  double interval;
  uint64_t v10;
  PCPersistentTimer *timer;
  void (**v12)(_QWORD);
  int v13;
  NSString *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  double v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (v5->_timer)
  {
    v6 = os_log_create("com.apple.amp.MediaServices", "SystemUtilities");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      name = v5->_name;
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "timeIntervalSinceDate:", v5->_startDate);
      interval = v5->_interval;
      v13 = 138412802;
      v14 = name;
      v15 = 2048;
      v16 = v10;
      v17 = 2048;
      v18 = interval;
      _os_log_impl(&dword_1A077D000, v6, OS_LOG_TYPE_DEFAULT, "[MSVPersistentTimer] Timer <%@> elapased after <%lf> seconds (<%lf> expected)", (uint8_t *)&v13, 0x20u);

    }
    -[MSVPersistentTimer invalidateWithReason:](v5, "invalidateWithReason:", CFSTR("TimerElapsed"));
    timer = v5->_timer;
    v5->_timer = 0;

    v12 = (void (**)(_QWORD))objc_msgSend(v5->_block, "copy");
  }
  else
  {
    v12 = 0;
  }
  objc_sync_exit(v5);

  if (v12)
    v12[2](v12);

}

- (void)invalidate
{
  -[MSVPersistentTimer invalidateWithReason:](self, "invalidateWithReason:", 0);
}

- (void)invalidateWithReason:(id)a3
{
  id v4;
  MSVPersistentTimer *v5;
  NSObject *v6;
  _BOOL4 v7;
  NSString *name;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  NSString *v12;
  PCPersistentTimer *timer;
  int v14;
  NSString *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (v5->_timer)
  {
    v6 = os_log_create("com.apple.amp.MediaServices", "SystemUtilities");
    v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (v4)
    {
      if (v7)
      {
        name = v5->_name;
        v14 = 138412546;
        v15 = name;
        v16 = 2112;
        v17 = v4;
        v9 = "[MSVPersistentTimer] Timer <%@> invalidated because <%@>";
        v10 = v6;
        v11 = 22;
LABEL_7:
        _os_log_impl(&dword_1A077D000, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v14, v11);
      }
    }
    else if (v7)
    {
      v12 = v5->_name;
      v14 = 138412290;
      v15 = v12;
      v9 = "[MSVPersistentTimer] Timer <%@> invalidated";
      v10 = v6;
      v11 = 12;
      goto LABEL_7;
    }

    -[PCPersistentTimer invalidate](v5->_timer, "invalidate");
    timer = v5->_timer;
    v5->_timer = 0;

  }
  objc_sync_exit(v5);

}

- (BOOL)isValid
{
  MSVPersistentTimer *v2;
  BOOL v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_timer != 0;
  objc_sync_exit(v2);

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_timer, 0);
}

@end
