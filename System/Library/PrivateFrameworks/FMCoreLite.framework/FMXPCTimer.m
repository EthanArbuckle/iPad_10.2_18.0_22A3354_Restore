@implementation FMXPCTimer

- (FMXPCTimer)initWithName:(id)a3 date:(id)a4 gracePeriod:(double)a5 priority:(int64_t)a6 options:(unint64_t)a7 block:(id)a8
{
  id v14;
  id v15;
  id v16;
  FMXPCTimer *v17;
  FMXPCTimer *v18;
  objc_super v20;

  v14 = a3;
  v15 = a4;
  v16 = a8;
  v20.receiver = self;
  v20.super_class = (Class)FMXPCTimer;
  v17 = -[FMXPCTimer init](&v20, sel_init);
  v18 = v17;
  if (v17)
  {
    -[FMXPCTimer setName:](v17, "setName:", v14);
    -[FMXPCTimer setDate:](v18, "setDate:", v15);
    -[FMXPCTimer setGracePeriod:](v18, "setGracePeriod:", a5);
    -[FMXPCTimer setPriority:](v18, "setPriority:", a6);
    -[FMXPCTimer setOptions:](v18, "setOptions:", a7);
    -[FMXPCTimer setBlock:](v18, "setBlock:", v16);
    -[FMXPCTimer handleActivity](v18, "handleActivity");
  }

  return v18;
}

- (FMXPCTimer)initWithName:(id)a3 date:(id)a4 priority:(int64_t)a5 options:(unint64_t)a6 block:(id)a7
{
  return -[FMXPCTimer initWithName:date:gracePeriod:priority:options:block:](self, "initWithName:date:gracePeriod:priority:options:block:", a3, a4, a5, a6, a7, 0.0);
}

- (FMXPCTimer)initWithName:(id)a3 timeInterval:(double)a4 gracePeriod:(double)a5 priority:(int64_t)a6 options:(unint64_t)a7 block:(id)a8
{
  void *v14;
  id v15;
  id v16;
  void *v17;
  FMXPCTimer *v18;

  v14 = (void *)MEMORY[0x1E0C99D68];
  v15 = a8;
  v16 = a3;
  objc_msgSend(v14, "dateWithTimeIntervalSinceNow:", a4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[FMXPCTimer initWithName:date:gracePeriod:priority:options:block:](self, "initWithName:date:gracePeriod:priority:options:block:", v16, v17, a6, a7, v15, a5);

  return v18;
}

- (FMXPCTimer)initWithName:(id)a3 timeInterval:(double)a4 priority:(int64_t)a5 options:(unint64_t)a6 block:(id)a7
{
  void *v12;
  id v13;
  id v14;
  void *v15;
  FMXPCTimer *v16;

  v12 = (void *)MEMORY[0x1E0C99D68];
  v13 = a7;
  v14 = a3;
  objc_msgSend(v12, "dateWithTimeIntervalSinceNow:", a4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[FMXPCTimer initWithName:date:gracePeriod:priority:options:block:](self, "initWithName:date:gracePeriod:priority:options:block:", v14, v15, a5, a6, v13, 0.0);

  return v16;
}

- (void)schedule
{
  const char *v3;
  void *v4;
  void *v5;
  id v6;

  -[FMXPCTimer name](self, "name");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v3 = (const char *)objc_msgSend(v6, "UTF8String");
  -[FMXPCTimer criteria](self, "criteria");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMXPCTimer activityHandler](self, "activityHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  xpc_activity_register(v3, v4, v5);

}

- (id)criteria
{
  void *v3;
  double v4;
  double v5;
  double v6;
  int64_t v7;
  double v8;
  int64_t v9;
  NSObject *v10;
  xpc_object_t v11;
  int64_t v12;
  const char **v13;
  char v14;
  char v15;
  char v16;
  char v17;
  const char **v18;
  char v19;
  unint64_t v20;
  __int16 v21;
  __int16 v22;
  __int16 v23;
  __int16 v24;
  void *v25;
  int v27;
  int64_t v28;
  __int16 v29;
  int64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  -[FMXPCTimer date](self, "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceNow");
  v5 = v4;

  v6 = 0.0;
  if (v5 >= 0.0)
    v6 = v5;
  v7 = (uint64_t)v6;
  -[FMXPCTimer gracePeriod](self, "gracePeriod");
  v9 = (uint64_t)v8;
  LogCategory_Unspecified();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v27 = 134218240;
    v28 = v7;
    v29 = 2048;
    v30 = v9;
    _os_log_impl(&dword_1AEA5C000, v10, OS_LOG_TYPE_DEFAULT, "FMXPCTimer: Scheduling XPC activity in %lld ~%llds grace.", (uint8_t *)&v27, 0x16u);
  }

  v11 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v11, (const char *)*MEMORY[0x1E0C80898], 0);
  xpc_dictionary_set_int64(v11, (const char *)*MEMORY[0x1E0C80760], v7);
  xpc_dictionary_set_int64(v11, (const char *)*MEMORY[0x1E0C80790], v9);
  v12 = -[FMXPCTimer priority](self, "priority");
  v13 = (const char **)MEMORY[0x1E0C80888];
  if (v12 != 1)
    v13 = (const char **)MEMORY[0x1E0C80880];
  xpc_dictionary_set_string(v11, (const char *)*MEMORY[0x1E0C80878], *v13);
  v14 = -[FMXPCTimer options](self, "options");
  xpc_dictionary_set_BOOL(v11, (const char *)*MEMORY[0x1E0C80868], v14 & 1);
  v15 = -[FMXPCTimer options](self, "options");
  xpc_dictionary_set_BOOL(v11, (const char *)*MEMORY[0x1E0C808E0], (v15 & 4) != 0);
  v16 = -[FMXPCTimer options](self, "options");
  xpc_dictionary_set_BOOL(v11, (const char *)*MEMORY[0x1E0C808F0], (v16 & 2) != 0);
  v17 = -[FMXPCTimer options](self, "options");
  xpc_dictionary_set_BOOL(v11, (const char *)*MEMORY[0x1E0C80908], (v17 & 8) != 0);
  if ((-[FMXPCTimer options](self, "options") & 0x10) != 0)
  {
    v18 = (const char **)MEMORY[0x1E0C808A8];
  }
  else if ((-[FMXPCTimer options](self, "options") & 0x20) != 0)
  {
    v18 = (const char **)MEMORY[0x1E0C808B0];
  }
  else
  {
    if ((-[FMXPCTimer options](self, "options") & 0x40) == 0)
      goto LABEL_15;
    v18 = (const char **)MEMORY[0x1E0C808B8];
  }
  if (*v18)
    xpc_dictionary_set_BOOL(v11, *v18, 1);
LABEL_15:
  v19 = -[FMXPCTimer options](self, "options");
  xpc_dictionary_set_BOOL(v11, (const char *)*MEMORY[0x1E0C808D0], v19 < 0);
  v20 = -[FMXPCTimer options](self, "options");
  xpc_dictionary_set_BOOL(v11, (const char *)*MEMORY[0x1E0C808C8], v20 & 0x100);
  v21 = -[FMXPCTimer options](self, "options");
  xpc_dictionary_set_BOOL(v11, (const char *)*MEMORY[0x1E0C80738], (v21 & 0x200) != 0);
  v22 = -[FMXPCTimer options](self, "options");
  xpc_dictionary_set_BOOL(v11, (const char *)*MEMORY[0x1E0C80808], (v22 & 0x400) != 0);
  v23 = -[FMXPCTimer options](self, "options");
  xpc_dictionary_set_BOOL(v11, (const char *)*MEMORY[0x1E0C80758], (v23 & 0x800) != 0);
  v24 = -[FMXPCTimer options](self, "options");
  xpc_dictionary_set_BOOL(v11, (const char *)*MEMORY[0x1E0C80770], (v24 & 0x1000) != 0);
  -[FMXPCTimer duetActivitySchedulerData](self, "duetActivitySchedulerData");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v25)
    xpc_dictionary_set_value(v11, (const char *)*MEMORY[0x1E0C80778], v25);

  return v11;
}

- (void)invalidate
{
  NSObject *v3;
  void *v4;
  id v5;
  const char *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  LogCategory_Unspecified();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[FMXPCTimer name](self, "name");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_1AEA5C000, v3, OS_LOG_TYPE_DEFAULT, "FMXPCTimer Unregistering XPC activity %@", (uint8_t *)&v7, 0xCu);

  }
  -[FMXPCTimer name](self, "name");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v6 = (const char *)objc_msgSend(v5, "UTF8String");

  xpc_activity_unregister(v6);
}

- (id)activityHandler
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id location;

  -[FMXPCTimer name](self, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  -[FMXPCTimer block](self, "block");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __29__FMXPCTimer_activityHandler__block_invoke;
  v9[3] = &unk_1E5E0DFD0;
  v10 = v3;
  v5 = v3;
  objc_copyWeak(&v12, &location);
  v11 = v4;
  v6 = v4;
  v7 = (void *)MEMORY[0x1AF455734](v9);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
  return v7;
}

void __29__FMXPCTimer_activityHandler__block_invoke(uint64_t a1, void *a2)
{
  _xpc_activity_s *v3;
  _BOOL4 v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  xpc_activity_state_t state;
  NSObject *WeakRetained;
  _BOOL4 v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  NSObject *v20;
  uint64_t v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  xpc_activity_state_t v25;
  __int16 v26;
  NSObject *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (xpc_activity_should_defer(v3))
  {
    v4 = xpc_activity_set_state(v3, 3);
    LogCategory_Unspecified();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v4)
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v7 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        v23 = v7;
      }
    }
    else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      __29__FMXPCTimer_activityHandler__block_invoke_cold_1(a1, v6);
    }
  }
  else
  {
    state = xpc_activity_get_state(v3);
    v6 = xpc_activity_copy_criteria(v3);
    if (state == 2)
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
      v10 = xpc_activity_set_state(v3, 5);
      v11 = (void *)MEMORY[0x1E0CB3940];
      v12 = *(_QWORD *)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "UUIDString");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", CFSTR("%@-%@"), v12, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = objc_retainAutorelease(v15);
      objc_msgSend(v16, "UTF8String");
      v17 = (void *)os_transaction_create();
      if (WeakRetained)
      {
        (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      }
      else
      {
        LogCategory_Unspecified();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
          __29__FMXPCTimer_activityHandler__block_invoke_cold_2(v19);

      }
      LogCategory_Unspecified();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v21 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138412546;
        v23 = v21;
        v24 = 1024;
        LODWORD(v25) = v10;
        _os_log_impl(&dword_1AEA5C000, v20, OS_LOG_TYPE_DEFAULT, "FMXPCTimer triggered. Updating to done so that it can be cleaned. success : %@ : %d", buf, 0x12u);
      }

    }
    else
    {
      LogCategory_Unspecified();
      WeakRetained = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_DEFAULT))
      {
        v18 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138412802;
        v23 = v18;
        v24 = 2048;
        v25 = state;
        v26 = 2048;
        v27 = v6;
        _os_log_impl(&dword_1AEA5C000, WeakRetained, OS_LOG_TYPE_DEFAULT, "FMXPCTimer %@ changed to state %ld with criteria %p", buf, 0x20u);
      }
    }

  }
}

- (void)handleActivity
{
  const char *v3;
  void *v4;
  void *v5;
  id v6;

  -[FMXPCTimer name](self, "name");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v3 = (const char *)objc_msgSend(v6, "UTF8String");
  v4 = (void *)*MEMORY[0x1E0C80748];
  -[FMXPCTimer activityHandler](self, "activityHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  xpc_activity_register(v3, v4, v5);

}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (double)gracePeriod
{
  return self->_gracePeriod;
}

- (void)setGracePeriod:(double)a3
{
  self->_gracePeriod = a3;
}

- (int64_t)priority
{
  return self->_priority;
}

- (void)setPriority:(int64_t)a3
{
  self->_priority = a3;
}

- (unint64_t)options
{
  return self->_options;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (id)block
{
  return self->_block;
}

- (void)setBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (OS_xpc_object)duetActivitySchedulerData
{
  return self->_duetActivitySchedulerData;
}

- (void)setDuetActivitySchedulerData:(id)a3
{
  objc_storeStrong((id *)&self->_duetActivitySchedulerData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_duetActivitySchedulerData, 0);
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

void __29__FMXPCTimer_activityHandler__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = 138412290;
  v4 = v2;
}

void __29__FMXPCTimer_activityHandler__block_invoke_cold_2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1AEA5C000, log, OS_LOG_TYPE_FAULT, "self went away in FPXPCTimer.activityHandler", v1, 2u);
}

@end
