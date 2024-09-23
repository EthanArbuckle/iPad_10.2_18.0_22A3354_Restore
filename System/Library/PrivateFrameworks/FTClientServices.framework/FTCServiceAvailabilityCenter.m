@implementation FTCServiceAvailabilityCenter

+ (id)sharedInstance
{
  if (qword_253D0AE70 != -1)
    dispatch_once(&qword_253D0AE70, &unk_24C358120);
  return (id)qword_253D0AE78;
}

- (id)containerForService:(int64_t)a3 create:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  FTCServiceContainer *v8;
  BOOL v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  FTCServiceContainer *v17;
  FTCServiceContainer *v18;
  uint8_t buf[4];
  FTCServiceAvailabilityCenter *v21;
  __int16 v22;
  __CFString *v23;
  uint64_t v24;

  v4 = a4;
  v24 = *MEMORY[0x24BDAC8D0];
  if (!-[FTCServiceAvailabilityCenter _isValidServiceType:](self, "_isValidServiceType:"))
    return 0;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInteger:", a3);
  v8 = (FTCServiceContainer *)-[NSMutableDictionary objectForKey:](self->_availabilityHandlers, "objectForKey:", v7);
  if (v8)
    v9 = 1;
  else
    v9 = !v4;
  if (!v9)
  {
    v10 = OSLogHandleForRegistrationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v21 = self;
      v22 = 2112;
      v23 = FTCServiceNameForServiceType(a3);
      _os_log_impl(&dword_20A9FB000, v10, OS_LOG_TYPE_DEFAULT, "%@ creating monitor for service: %@", buf, 0x16u);
    }
    if (os_log_shim_legacy_logging_enabled() && MarcoShouldLogRegistration())
    {
      FTCServiceNameForServiceType(a3);
      sub_20A9FCCCC((uint64_t)CFSTR("ServiceAvailability"), CFSTR("%@ creating monitor for service: %@"), v11, v12, v13, v14, v15, v16, (uint64_t)self);
    }
    v17 = -[FTCServiceContainer initWithServiceType:]([FTCServiceContainer alloc], "initWithServiceType:", a3);
    v18 = v17;
    if (v17)
    {
      -[FTCServiceAvailabilityCenter _startListeningToMonitor:](self, "_startListeningToMonitor:", -[FTCServiceContainer monitor](v17, "monitor"));
      -[NSMutableDictionary setObject:forKey:](self->_availabilityHandlers, "setObject:forKey:", v18, v7);
    }
    v8 = v18;

  }
  return v8;
}

- (FTCServiceAvailabilityCenter)init
{
  FTCServiceAvailabilityCenter *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)FTCServiceAvailabilityCenter;
  v2 = -[FTCServiceAvailabilityCenter init](&v4, sel_init);
  if (v2)
    v2->_availabilityHandlers = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "removeObserver:name:object:", self, 0, 0);

  v3.receiver = self;
  v3.super_class = (Class)FTCServiceAvailabilityCenter;
  -[FTCServiceAvailabilityCenter dealloc](&v3, sel_dealloc);
}

- (BOOL)_isValidServiceType:(int64_t)a3
{
  return (unint64_t)a3 < 3;
}

- (void)_postNotificationForService:(int64_t)a3 availability:(int64_t)a4
{
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint8_t buf[4];
  FTCServiceAvailabilityCenter *v18;
  __int16 v19;
  __CFString *v20;
  __int16 v21;
  int64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v7 = OSLogHandleForRegistrationCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v18 = self;
    v19 = 2112;
    v20 = FTCServiceNameForServiceType(a3);
    v21 = 2048;
    v22 = a4;
    _os_log_impl(&dword_20A9FB000, v7, OS_LOG_TYPE_DEFAULT, "%@ posting availability change notification (%@) - available: %ld", buf, 0x20u);
  }
  if (os_log_shim_legacy_logging_enabled() && MarcoShouldLogRegistration())
  {
    FTCServiceNameForServiceType(a3);
    sub_20A9FCCCC((uint64_t)CFSTR("ServiceAvailability"), CFSTR("%@ posting availability change notification (%@) - available: %ld"), v8, v9, v10, v11, v12, v13, (uint64_t)self);
  }
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInteger:", a4);
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInteger:", a3);
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithObjectsAndKeys:", v14, CFSTR("availability"), v15, CFSTR("servicetype"), 0);
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "__mainThreadPostNotificationName:object:userInfo:", CFSTR("__FTCServiceAvailabilityDidChangeNotification"), self, v16);

}

- (void)_handleServiceMonitorNotification:(id)a3
{
  void *v5;
  void *v6;

  v5 = (void *)objc_msgSend(a3, "object");
  v6 = (void *)objc_msgSend((id)objc_msgSend(a3, "userInfo"), "objectForKey:", CFSTR("availability"));
  objc_msgSend(v5, "serviceType");
  objc_msgSend(v6, "integerValue");
  MEMORY[0x24BEDD108](self, sel__postNotificationForService_availability_);
}

- (void)_startListeningToMonitor:(id)a3
{
  uint64_t v3;

  if (a3)
  {
    v3 = objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    MEMORY[0x24BEDD108](v3, sel_addObserver_selector_name_object_);
  }
}

- (void)_stopListeningToMonitor:(id)a3
{
  if (a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "removeObserver:name:object:", self, CFSTR("__kFTCServiceMonitorAvailabilityDidChangeNotification"), a3);
}

- (BOOL)hasListenerID:(id)a3 forService:(int64_t)a4
{
  id v5;

  if (a3
    && (v5 = -[FTCServiceAvailabilityCenter containerForService:create:](self, "containerForService:create:", a4, 0)) != 0)
  {
    return objc_msgSend(v5, "hasListenerID:", a3);
  }
  else
  {
    return 0;
  }
}

- (BOOL)addListenerID:(id)a3 forService:(int64_t)a4
{
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint8_t buf[4];
  FTCServiceAvailabilityCenter *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    v7 = (id)objc_msgSend(a3, "length");
    if (v7)
    {
      v8 = OSLogHandleForRegistrationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        v17 = self;
        v18 = 2112;
        v19 = a3;
        v20 = 2112;
        v21 = FTCServiceNameForServiceType(a4);
      }
      if (os_log_shim_legacy_logging_enabled() && MarcoShouldLogRegistration())
      {
        FTCServiceNameForServiceType(a4);
      }
      v7 = -[FTCServiceAvailabilityCenter containerForService:create:](self, "containerForService:create:", a4, 1);
      if (v7)
        LOBYTE(v7) = objc_msgSend(v7, "addListenerID:", a3);
    }
  }
  else
  {
    LOBYTE(v7) = 0;
  }
  return (char)v7;
}

- (BOOL)removeListenerID:(id)a3 forService:(int64_t)a4
{
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  NSObject *v16;
  __CFString *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint8_t buf[4];
  FTCServiceAvailabilityCenter *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  __CFString *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    v7 = OSLogHandleForRegistrationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v27 = self;
      v28 = 2112;
      v29 = a3;
      v30 = 2112;
      v31 = FTCServiceNameForServiceType(a4);
    }
    if (os_log_shim_legacy_logging_enabled() && MarcoShouldLogRegistration())
    {
      FTCServiceNameForServiceType(a4);
    }
    v14 = -[FTCServiceAvailabilityCenter containerForService:create:](self, "containerForService:create:", a4, 0);
    v15 = v14;
    if (v14)
    {
      objc_msgSend(v14, "removeListenerID:", a3);
      if (!objc_msgSend((id)objc_msgSend(v15, "listeners"), "count"))
      {
        v16 = OSLogHandleForRegistrationCategory();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          v17 = FTCServiceNameForServiceType(a4);
          *(_DWORD *)buf = 138412546;
          v27 = self;
          v28 = 2112;
          v29 = v17;
          _os_log_impl(&dword_20A9FB000, v16, OS_LOG_TYPE_DEFAULT, "%@ no more listeners for service: %@", buf, 0x16u);
        }
        if (os_log_shim_legacy_logging_enabled() && MarcoShouldLogRegistration())
        {
          FTCServiceNameForServiceType(a4);
          sub_20A9FCCCC((uint64_t)CFSTR("ServiceAvailability"), CFSTR("%@ no more listeners for service: %@"), v18, v19, v20, v21, v22, v23, (uint64_t)self);
        }
        -[FTCServiceAvailabilityCenter _stopListeningToMonitor:](self, "_stopListeningToMonitor:", objc_msgSend(v15, "monitor"));
        v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInteger:", a4);
        -[NSMutableDictionary removeObjectForKey:](self->_availabilityHandlers, "removeObjectForKey:", v24);

      }
    }
  }
  return a3 != 0;
}

- (int64_t)availabilityForListenerID:(id)a3 forService:(int64_t)a4
{
  id v5;
  void *v6;
  uint64_t v7;

  if (!a3)
    return -2;
  v5 = -[FTCServiceAvailabilityCenter containerForService:create:](self, "containerForService:create:", a4, 0);
  if (!v5)
    return -2;
  v6 = v5;
  if (!objc_msgSend(v5, "hasListenerID:", a3))
    return -2;
  v7 = objc_msgSend(v6, "monitor");
  return MEMORY[0x24BEDD108](v7, sel_serviceAvailability);
}

@end
