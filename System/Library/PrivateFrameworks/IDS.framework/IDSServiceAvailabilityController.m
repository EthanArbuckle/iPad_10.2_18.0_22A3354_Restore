@implementation IDSServiceAvailabilityController

- (IDSServiceAvailabilityController)init
{
  NSObject *v3;
  IDSServiceAvailabilityController *v4;
  IDSServiceAvailabilityController *v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *availabilityHandlers;
  objc_super v9;

  if (_IDSRunningInDaemon())
  {
    +[IDSLogging ServiceAvailability](IDSLogging, "ServiceAvailability");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      sub_1907E7DEC((uint64_t)self, v3);

    v4 = 0;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)IDSServiceAvailabilityController;
    v5 = -[IDSServiceAvailabilityController init](&v9, sel_init);
    if (v5)
    {
      v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      availabilityHandlers = v5->_availabilityHandlers;
      v5->_availabilityHandlers = v6;

    }
    self = v5;
    v4 = self;
  }

  return v4;
}

- (id)containerForService:(id)a3 create:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  BOOL v8;
  NSObject *v9;
  IDSServiceContainer *v10;
  void *v11;
  int v13;
  IDSServiceAvailabilityController *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v4 = a4;
  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (-[IDSServiceAvailabilityController _isValidServiceType:](self, "_isValidServiceType:", v6))
  {
    -[NSMutableDictionary objectForKey:](self->_availabilityHandlers, "objectForKey:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      v8 = 1;
    else
      v8 = !v4;
    if (!v8)
    {
      +[IDSLogging ServiceAvailability](IDSLogging, "ServiceAvailability");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v13 = 138412546;
        v14 = self;
        v15 = 2112;
        v16 = v6;
        _os_log_impl(&dword_1906E0000, v9, OS_LOG_TYPE_DEFAULT, "%@ creating monitor for service: %@", (uint8_t *)&v13, 0x16u);
      }

      v10 = -[IDSServiceContainer initWithService:]([IDSServiceContainer alloc], "initWithService:", v6);
      v7 = v10;
      if (v10)
      {
        -[IDSServiceContainer monitor](v10, "monitor");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[IDSServiceAvailabilityController _startListeningToMonitor:](self, "_startListeningToMonitor:", v11);

        -[NSMutableDictionary setObject:forKey:](self->_availabilityHandlers, "setObject:forKey:", v7, v6);
      }
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (int64_t)availabilityForListenerID:(id)a3 forService:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int64_t v11;
  NSObject *v12;
  int v14;
  IDSServiceAvailabilityController *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    -[IDSServiceAvailabilityController containerForService:create:](self, "containerForService:create:", v7, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      if (objc_msgSend(v8, "hasListenerID:", v6))
      {
        objc_msgSend(v9, "monitor");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "serviceAvailability");

LABEL_10:
        goto LABEL_11;
      }
      +[IDSLogging ServiceAvailability](IDSLogging, "ServiceAvailability");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v14 = 138412802;
        v15 = self;
        v16 = 2112;
        v17 = v6;
        v18 = 2112;
        v19 = v7;
      }

    }
    v11 = -2;
    goto LABEL_10;
  }
  v11 = -2;
LABEL_11:

  return v11;
}

- (BOOL)addListenerID:(id)a3 forService:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  char v11;
  int v13;
  IDSServiceAvailabilityController *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6 && objc_msgSend(v6, "length"))
  {
    +[IDSLogging ServiceAvailability](IDSLogging, "ServiceAvailability");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138412802;
      v14 = self;
      v15 = 2112;
      v16 = v6;
      v17 = 2112;
      v18 = v7;
    }

    -[IDSServiceAvailabilityController containerForService:create:](self, "containerForService:create:", v7, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
      v11 = objc_msgSend(v9, "addListenerID:", v6);
    else
      v11 = 0;

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)_startListeningToMonitor:(id)a3
{
  void *v4;
  id v5;
  id v6;

  if (a3)
  {
    v4 = (void *)MEMORY[0x1E0CB37D0];
    v5 = a3;
    objc_msgSend(v4, "defaultCenter");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", self, sel__handleServiceMonitorNotification_, CFSTR("__kIDSServiceMonitorAvailabilityDidChangeNotification"), v5);

  }
}

- (BOOL)_isValidServiceType:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.madrid")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.private.ac")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.ess")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.private.alloy.bulletinboard")) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.private.alloy.photostream"));
  }

  return v4;
}

+ (id)sharedInstance
{
  if (qword_1ECDD6720 != -1)
    dispatch_once(&qword_1ECDD6720, &unk_1E2C5F810);
  return (id)qword_1ECDD66E0;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, 0, 0);

  v4.receiver = self;
  v4.super_class = (Class)IDSServiceAvailabilityController;
  -[IDSServiceAvailabilityController dealloc](&v4, sel_dealloc);
}

- (void)_postNotificationForService:(id)a3 availability:(int64_t)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  uint8_t buf[4];
  IDSServiceAvailabilityController *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  +[IDSLogging ServiceAvailability](IDSLogging, "ServiceAvailability");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v12 = self;
    v13 = 2112;
    v14 = v6;
    v15 = 1024;
    v16 = a4;
    _os_log_impl(&dword_1906E0000, v7, OS_LOG_TYPE_DEFAULT, "%@ posting availability change notification (%@) - available: %d", buf, 0x1Cu);
  }

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInteger:", a4);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v8, CFSTR("availability"), v6, CFSTR("service"), 0);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "__mainThreadPostNotificationName:object:userInfo:", CFSTR("__IDSServiceAvailabilityDidChangeNotification"), self, v9);

}

- (void)_handleServiceMonitorNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  objc_msgSend(v4, "object");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKey:", CFSTR("availability"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "service");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[IDSServiceAvailabilityController _postNotificationForService:availability:](self, "_postNotificationForService:availability:", v7, objc_msgSend(v6, "integerValue"));

}

- (void)_stopListeningToMonitor:(id)a3
{
  void *v4;
  id v5;
  id v6;

  if (a3)
  {
    v4 = (void *)MEMORY[0x1E0CB37D0];
    v5 = a3;
    objc_msgSend(v4, "defaultCenter");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObserver:name:object:", self, CFSTR("__kIDSServiceMonitorAvailabilityDidChangeNotification"), v5);

  }
}

- (BOOL)hasListenerID:(id)a3 forService:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;

  v6 = a3;
  if (v6)
  {
    -[IDSServiceAvailabilityController containerForService:create:](self, "containerForService:create:", a4, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
      v9 = objc_msgSend(v7, "hasListenerID:", v6);
    else
      v9 = 0;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)removeListenerID:(id)a3 forService:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  int v16;
  IDSServiceAvailabilityController *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    +[IDSLogging ServiceAvailability](IDSLogging, "ServiceAvailability");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 138412802;
      v17 = self;
      v18 = 2112;
      v19 = v6;
      v20 = 2112;
      v21 = v7;
    }

    -[IDSServiceAvailabilityController containerForService:create:](self, "containerForService:create:", v7, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      objc_msgSend(v9, "removeListenerID:", v6);
      objc_msgSend(v10, "listeners");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "count");

      if (!v12)
      {
        +[IDSLogging ServiceAvailability](IDSLogging, "ServiceAvailability");
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          v16 = 138412546;
          v17 = self;
          v18 = 2112;
          v19 = v7;
          _os_log_impl(&dword_1906E0000, v13, OS_LOG_TYPE_DEFAULT, "%@ no more listeners for service: %@", (uint8_t *)&v16, 0x16u);
        }

        objc_msgSend(v10, "monitor");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[IDSServiceAvailabilityController _stopListeningToMonitor:](self, "_stopListeningToMonitor:", v14);

        -[NSMutableDictionary removeObjectForKey:](self->_availabilityHandlers, "removeObjectForKey:", v7);
      }
    }

  }
  return v6 != 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_availabilityHandlers, 0);
}

@end
