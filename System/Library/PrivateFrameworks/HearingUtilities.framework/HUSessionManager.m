@implementation HUSessionManager

- (HUSessionManager)init
{
  HUSessionManager *v2;
  HUSessionManager *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HUSessionManager;
  v2 = -[HUSessionManager init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[HUSessionManager registerForSessionNotifications](v2, "registerForSessionNotifications");
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[HUSessionManager unregisterForSessionNotifications](self, "unregisterForSessionNotifications");
  v3.receiver = self;
  v3.super_class = (Class)HUSessionManager;
  -[HUSessionManager dealloc](&v3, sel_dealloc);
}

- (void)userLoggedOut:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  HCLogHearingHandoff();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412290;
    v11 = v6;
    _os_log_impl(&dword_1DE311000, v5, OS_LOG_TYPE_DEFAULT, "System status has changed userLoggedOut: %@", (uint8_t *)&v10, 0xCu);

  }
  -[HUSessionManager delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[HUSessionManager delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleSessionMessage:completion:", 3, 0);

  }
}

- (HUSessionManagerDelegate)delegate
{
  return (HUSessionManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isMacSleep
{
  return self->_isMacSleep;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
