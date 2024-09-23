@implementation IDSServiceMonitor

- (int64_t)serviceAvailability
{
  return self->_availability;
}

- (IDSServiceMonitor)initWithService:(id)a3
{
  id v5;
  NSObject *v6;
  IDSServiceMonitor *v7;
  IDSServiceMonitor *v8;
  IDSServiceMonitor *v9;
  NSObject *v10;
  IDSServiceMonitor *v12;
  objc_super v13;
  uint8_t buf[4];
  IDSServiceMonitor *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!_IDSRunningInDaemon())
  {
    v13.receiver = self;
    v13.super_class = (Class)IDSServiceMonitor;
    v8 = -[IDSServiceMonitor init](&v13, sel_init);
    v9 = v8;
    if (!v8)
    {
LABEL_14:
      self = v9;
      v7 = self;
      goto LABEL_15;
    }
    objc_storeStrong((id *)&v8->_service, a3);
    +[IDSLogging ServiceAvailability](IDSLogging, "ServiceAvailability");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      v15 = v9;
      v16 = 2112;
      v17 = v5;
      _os_log_impl(&dword_1906E0000, v10, OS_LOG_TYPE_DEFAULT, "-[IDSServiceMonitor init] {self: %p, service: %@}", buf, 0x16u);
    }

    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.madrid")) & 1) != 0
      || (objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.ess")) & 1) != 0
      || (objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.private.ac")) & 1) != 0)
    {
      goto LABEL_11;
    }
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.private.alloy.bulletinboard")) & 1) == 0)
    {
      if ((objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.private.alloy.screensharing")) & 1) != 0)
      {
LABEL_11:
        if (IMUserScopedNotification())
        {
          v12 = v9;
          v12->_token = IMDispatchForNotify();

        }
        goto LABEL_13;
      }
      objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.private.alloy.photostream"));
    }
LABEL_13:
    -[IDSServiceMonitor _updateAvailability](v9, "_updateAvailability");
    goto LABEL_14;
  }
  +[IDSLogging ServiceAvailability](IDSLogging, "ServiceAvailability");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    sub_1907E7DEC((uint64_t)self, v6);

  v7 = 0;
LABEL_15:

  return v7;
}

- (void)_updateAvailability
{
  int64_t availability;
  uint64_t v4;
  NSObject *v5;
  int64_t v6;
  uint64_t state64;
  uint8_t buf[4];
  IDSServiceMonitor *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  int64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  availability = self->_availability;
  state64 = 0;
  notify_get_state(self->_token, &state64);
  v4 = state64;
  +[IDSLogging ServiceAvailability](IDSLogging, "ServiceAvailability");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218496;
    v9 = self;
    v10 = 2048;
    v11 = state64;
    v12 = 2048;
    v13 = availability;
    _os_log_impl(&dword_1906E0000, v5, OS_LOG_TYPE_DEFAULT, "-[IDSServiceMonitor _updateAvailability] {self: %p, state: %llu, previousAvailability: %llu}", buf, 0x20u);
  }
  v6 = v4 != 0;

  self->_availability = v6;
  if (availability != v6)
    -[IDSServiceMonitor _postAvailability:](self, "_postAvailability:", v6);
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  IDSServiceMonitor *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  +[IDSLogging ServiceAvailability](IDSLogging, "ServiceAvailability");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v6 = self;
    _os_log_impl(&dword_1906E0000, v3, OS_LOG_TYPE_DEFAULT, "-[IDSServiceMonitor dealloc] {self: %p}", buf, 0xCu);
  }

  notify_cancel(self->_token);
  v4.receiver = self;
  v4.super_class = (Class)IDSServiceMonitor;
  -[IDSServiceMonitor dealloc](&v4, sel_dealloc);
}

- (void)_postAvailability:(int64_t)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInteger:", a3);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v6, CFSTR("availability"), 0);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "__mainThreadPostNotificationName:object:userInfo:", CFSTR("__kIDSServiceMonitorAvailabilityDidChangeNotification"), self, v4);

}

- (void)updateAvailability
{
  im_dispatch_after_primary_queue();
}

- (NSString)service
{
  return self->_service;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p service:%@, serviceAvailability: %llu>"), v5, self, self->_service, self->_availability);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_service, 0);
}

@end
