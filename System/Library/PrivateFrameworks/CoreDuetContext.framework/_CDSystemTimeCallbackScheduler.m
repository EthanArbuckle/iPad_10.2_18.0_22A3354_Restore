@implementation _CDSystemTimeCallbackScheduler

- (_CDSystemTimeCallbackScheduler)initWithEventNameRoot:(id)a3
{
  id v4;
  _CDSystemTimeCallbackScheduler *v5;
  uint64_t v6;
  NSString *eventNameRoot;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_CDSystemTimeCallbackScheduler;
  v5 = -[_CDSystemTimeCallbackScheduler init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    eventNameRoot = v5->_eventNameRoot;
    v5->_eventNameRoot = (NSString *)v6;

  }
  return v5;
}

+ (_CDSystemTimeCallbackScheduler)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_37);
  return (_CDSystemTimeCallbackScheduler *)(id)sharedInstance_scheduler;
}

- (void)scheduleCallbackAtDate:(id)a3 identifier:(id)a4 requiringDeviceWake:(BOOL)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  char v23;
  double v24;
  int64_t v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  _QWORD v30[4];

  v30[3] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  -[_CDSystemTimeCallbackScheduler eventNameRoot](self, "eventNameRoot");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 && v10)
  {

    if (v8 && a5)
    {
      v11 = (void *)MEMORY[0x1E0CB3940];
      v12 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v8, "timeIntervalSince1970");
      objc_msgSend(v12, "numberWithDouble:");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", CFSTR("%@"), v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      -[_CDSystemTimeCallbackScheduler eventNameRoot](self, "eventNameRoot");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v30[0] = v15;
      v30[1] = v9;
      v30[2] = v14;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 3);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "componentsJoinedByString:", CFSTR("."));
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "compare:", v8);

      objc_msgSend(MEMORY[0x1E0D158F0], "contextChannel");
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = v20;
      if (v19 == 1)
      {
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          -[_CDSystemTimeCallbackScheduler scheduleCallbackAtDate:identifier:requiringDeviceWake:].cold.1((uint64_t)v8, (uint64_t)v17, v21);
      }
      else
      {
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          _CDFormattedDate();
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v27 = v22;
          v28 = 2112;
          v29 = v17;
          _os_log_impl(&dword_18DD73000, v21, OS_LOG_TYPE_INFO, "Setting com.apple.alarm xpc event with date %@ for %@", buf, 0x16u);

        }
        v23 = objc_msgSend(v9, "hasPrefix:", CFSTR("com.apple.softwareupdateservicesd")) ^ 1;
        objc_msgSend(v8, "timeIntervalSince1970");
        v25 = (uint64_t)(ceil(v24) * 1000000000.0);
        v21 = xpc_dictionary_create(0, 0, 0);
        xpc_dictionary_set_date(v21, "Date", v25);
        xpc_dictionary_set_BOOL(v21, "UserVisible", v23);
        objc_msgSend(objc_retainAutorelease(v17), "UTF8String");
        xpc_set_event();
      }

    }
  }
  else
  {

  }
}

- (void)unscheduleCallbackAtDate:(id)a3 identifier:(id)a4 requiringDeviceWake:(BOOL)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  _QWORD v25[4];

  v25[3] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  -[_CDSystemTimeCallbackScheduler eventNameRoot](self, "eventNameRoot");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 && v10)
  {

    if (v8 && a5)
    {
      v11 = (void *)MEMORY[0x1E0CB3940];
      v12 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v8, "timeIntervalSince1970");
      objc_msgSend(v12, "numberWithDouble:");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", CFSTR("%@"), v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      -[_CDSystemTimeCallbackScheduler eventNameRoot](self, "eventNameRoot");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = v15;
      v25[1] = v9;
      v25[2] = v14;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 3);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "componentsJoinedByString:", CFSTR("."));
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0D158F0], "contextChannel");
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        _CDFormattedDate();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v22 = v19;
        v23 = 2112;
        v24 = v17;
        _os_log_impl(&dword_18DD73000, v18, OS_LOG_TYPE_INFO, "Removing com.apple.alarm xpc event with date %@ for %@", buf, 0x16u);

      }
      v20 = objc_retainAutorelease(v17);
      objc_msgSend(v20, "UTF8String");
      xpc_set_event();

    }
  }
  else
  {

  }
}

- (void)_handleCallbackAtDate:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0CB37D0];
  v5 = a3;
  objc_msgSend(v4, "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = CFSTR("_CDSystemTimeCallbackDateKey");
  v9[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "postNotificationName:object:userInfo:", CFSTR("_CDSystemTimeCallbackNotification"), self, v7);
}

- (NSString)eventNameRoot
{
  return self->_eventNameRoot;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventNameRoot, 0);
}

- (void)scheduleCallbackAtDate:(uint64_t)a1 identifier:(uint64_t)a2 requiringDeviceWake:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  _CDFormattedDate();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v5;
  v8 = 2112;
  v9 = a2;
  _os_log_error_impl(&dword_18DD73000, a3, OS_LOG_TYPE_ERROR, "Setting com.apple.alarm xpc event to a past date %@ for %@", (uint8_t *)&v6, 0x16u);

}

@end
