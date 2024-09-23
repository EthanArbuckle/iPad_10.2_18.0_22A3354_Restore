@implementation CoreSpotlightPreferences

- (int)notifyToken
{
  return self->_notifyToken;
}

- (BOOL)notifyStart
{
  int *p_notifyToken;
  uint32_t v3;
  NSObject *v5;
  void *v6;
  void *v7;
  id notify_handler;
  NSObject *v9;
  NSObject *v10;
  _QWORD v12[4];
  id v13;
  id location;

  p_notifyToken = &self->_notifyToken;
  if (self->_notifyToken)
  {
    v3 = 1000000;
  }
  else
  {
    -[CoreSpotlightPreferences notifyQueue](self, "notifyQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5
      && (-[CoreSpotlightPreferences notifyHandler](self, "notifyHandler"),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          v6,
          v6))
    {
      location = 0;
      objc_initWeak(&location, self);
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __39__CoreSpotlightPreferences_notifyStart__block_invoke;
      v12[3] = &unk_1E2405320;
      objc_copyWeak(&v13, &location);
      v7 = _Block_copy(v12);
      notify_handler = self->_notify_handler;
      self->_notify_handler = v7;

      v3 = notify_register_dispatch(self->_notification_key, p_notifyToken, v5, self->_notify_handler);
      if (v3)
      {
        logForCSLogCategoryDefault();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          -[CoreSpotlightPreferences notifyStart].cold.2();

        *p_notifyToken = 0;
      }
      objc_destroyWeak(&v13);
      objc_destroyWeak(&location);
    }
    else
    {
      v3 = notify_register_check(self->_notification_key, p_notifyToken);
      if (v3)
      {
        logForCSLogCategoryDefault();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          -[CoreSpotlightPreferences notifyStart].cold.1();

        *p_notifyToken = 0;
      }
    }

  }
  return v3 == 0;
}

void __39__CoreSpotlightPreferences_notifyStart__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "handlePreferencesChanged");

}

- (void)dealloc
{
  int notifyToken;
  objc_super v4;

  notifyToken = self->_notifyToken;
  if (notifyToken)
    notify_cancel(notifyToken);
  v4.receiver = self;
  v4.super_class = (Class)CoreSpotlightPreferences;
  -[CoreSpotlightPreferences dealloc](&v4, sel_dealloc);
}

- (void)handlePreferencesChanged
{
  NSObject *v3;
  NSString *state_key;
  void (**notifyHandler)(void);
  int v6;
  NSString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  logForCSLogCategoryDefault();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    state_key = self->_state_key;
    v6 = 138412290;
    v7 = state_key;
    _os_log_impl(&dword_18C42F000, v3, OS_LOG_TYPE_INFO, "prefs changed for %@", (uint8_t *)&v6, 0xCu);
  }

  CFPreferencesSynchronize((CFStringRef)self->_state_key, (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
  notifyHandler = (void (**)(void))self->_notifyHandler;
  if (notifyHandler)
    notifyHandler[2]();
}

- (void)saveState:(id)a3
{
  CFPreferencesSetValue((CFStringRef)self->_state_key, a3, CFSTR("com.apple.corespotlightui"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
  notify_post(self->_notification_key);
}

- (OS_dispatch_queue)notifyQueue
{
  return self->_notifyQueue;
}

- (void)setNotifyQueue:(id)a3
{
  objc_storeStrong((id *)&self->_notifyQueue, a3);
}

- (id)notifyHandler
{
  return self->_notifyHandler;
}

- (void)setNotifyHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)notify_handler
{
  return self->_notify_handler;
}

- (NSString)state_key
{
  return self->_state_key;
}

- (void)setState_key:(id)a3
{
  objc_storeStrong((id *)&self->_state_key, a3);
}

- (const)notification_key
{
  return self->_notification_key;
}

- (void)setNotification_key:(const char *)a3
{
  self->_notification_key = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_state_key, 0);
  objc_storeStrong(&self->_notify_handler, 0);
  objc_storeStrong(&self->_notifyHandler, 0);
  objc_storeStrong((id *)&self->_notifyQueue, 0);
}

- (void)notifyStart
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  int v3;

  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_9(&dword_18C42F000, v0, v1, "notify_register_dispatch for %s returned %u", v2, v3);
}

@end
