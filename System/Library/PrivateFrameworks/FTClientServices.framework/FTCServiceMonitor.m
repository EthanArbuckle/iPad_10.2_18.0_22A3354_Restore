@implementation FTCServiceMonitor

- (FTCServiceMonitor)initWithServiceType:(int64_t)a3
{
  FTCServiceMonitor *v4;
  FTCServiceMonitor *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)FTCServiceMonitor;
  v4 = -[FTCServiceMonitor init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_type = a3;
    if ((unint64_t)a3 <= 2)
      IMUserScopedNotification();
    objc_msgSend(MEMORY[0x24BE18E28], "weakRefWithObject:", v5);
    v5->_token = IMDispatchForNotify();
    -[FTCServiceMonitor _updateAvailability](v5, "_updateAvailability");
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  notify_cancel(self->_token);
  v3.receiver = self;
  v3.super_class = (Class)FTCServiceMonitor;
  -[FTCServiceMonitor dealloc](&v3, sel_dealloc);
}

- (void)_postAvailability:(int64_t)a3
{
  void *v4;
  id v5;

  v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInteger:", a3);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithObjectsAndKeys:", v5, CFSTR("availability"), 0);
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "__mainThreadPostNotificationName:object:userInfo:", CFSTR("__kFTCServiceMonitorAvailabilityDidChangeNotification"), self, v4);

}

- (void)_updateAvailability
{
  int64_t *p_availability;
  int64_t availability;
  int64_t v5;
  NSObject *v6;
  int64_t v7;
  const __CFString *v8;
  const __CFString *v9;
  unint64_t v10;
  const __CFString *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t state64;
  uint8_t buf[4];
  FTCServiceMonitor *v20;
  __int16 v21;
  const __CFString *v22;
  __int16 v23;
  const __CFString *v24;
  __int16 v25;
  const __CFString *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  p_availability = &self->_availability;
  availability = self->_availability;
  state64 = 0;
  notify_get_state(self->_token, &state64);
  v5 = state64 != 0;
  *p_availability = v5;
  if (availability != v5)
  {
    v6 = OSLogHandleForRegistrationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = -[FTCServiceMonitor serviceType](self, "serviceType");
      if ((unint64_t)(v7 + 1) > 3)
        v8 = CFSTR("Unknown");
      else
        v8 = *(&off_24C358218 + v7 + 1);
      if ((unint64_t)(availability + 2) > 3)
        v9 = CFSTR("Unknown");
      else
        v9 = *(&off_24C358238 + availability + 2);
      v10 = self->_availability + 2;
      if (v10 > 3)
        v11 = CFSTR("Unknown");
      else
        v11 = *(&off_24C358238 + v10);
      *(_DWORD *)buf = 138413058;
      v20 = self;
      v21 = 2112;
      v22 = v8;
      v23 = 2112;
      v24 = v9;
      v25 = 2112;
      v26 = v11;
      _os_log_impl(&dword_20A9FB000, v6, OS_LOG_TYPE_DEFAULT, "%@ updating availability for %@   => from %@ to %@", buf, 0x2Au);
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      if (MarcoShouldLogRegistration())
      {
        -[FTCServiceMonitor serviceType](self, "serviceType");
        sub_20A9FCCCC((uint64_t)CFSTR("ServiceAvailability"), CFSTR("%@ updating availability for %@   => from %@ to %@"), v12, v13, v14, v15, v16, v17, (uint64_t)self);
      }
    }
    -[FTCServiceMonitor _postAvailability:](self, "_postAvailability:", self->_availability);
  }
}

- (void)updateAvailability
{
  im_dispatch_after_primary_queue();
}

- (int64_t)serviceAvailability
{
  return self->_availability;
}

- (int64_t)serviceType
{
  return self->_type;
}

@end
