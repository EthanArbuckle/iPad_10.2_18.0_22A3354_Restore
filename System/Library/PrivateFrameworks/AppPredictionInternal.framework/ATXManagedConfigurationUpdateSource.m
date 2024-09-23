@implementation ATXManagedConfigurationUpdateSource

- (ATXManagedConfigurationUpdateSource)init
{
  void *v3;
  ATXManagedConfigurationUpdateSource *v4;

  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[ATXManagedConfigurationUpdateSource initWithProfileConnection:](self, "initWithProfileConnection:", v3);

  return v4;
}

- (ATXManagedConfigurationUpdateSource)initWithProfileConnection:(id)a3
{
  id v5;
  ATXManagedConfigurationUpdateSource *v6;
  ATXManagedConfigurationUpdateSource *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXManagedConfigurationUpdateSource;
  v6 = -[ATXManagedConfigurationUpdateSource init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_profileConnection, a3);
    -[ATXManagedConfigurationUpdateSource _registerForRestrictionChangedNotifications](v7, "_registerForRestrictionChangedNotifications");
  }

  return v7;
}

- (void)_registerForRestrictionChangedNotifications
{
  void *v3;
  uint64_t v4;
  void *v5;
  id restrictionChangedNotificationToken;
  _QWORD v7[5];

  if (!self->_restrictionChangedNotificationToken)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *MEMORY[0x1E0D471F0];
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __82__ATXManagedConfigurationUpdateSource__registerForRestrictionChangedNotifications__block_invoke;
    v7[3] = &unk_1E82DE9D0;
    v7[4] = self;
    objc_msgSend(v3, "addObserverForName:object:queue:usingBlock:", v4, 0, 0, v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    restrictionChangedNotificationToken = self->_restrictionChangedNotificationToken;
    self->_restrictionChangedNotificationToken = v5;

  }
}

uint64_t __82__ATXManagedConfigurationUpdateSource__registerForRestrictionChangedNotifications__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleProfileChangedNotification");
}

- (void)handleProfileChangedNotification
{
  int v3;
  NSObject *v4;
  objc_class *v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  id WeakRetained;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  const __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = -[MCProfileConnection isAppClipsAllowed](self->_profileConnection, "isAppClipsAllowed");
  -[MCProfileConnection invalidateRestrictionCache](self->_profileConnection, "invalidateRestrictionCache");
  __atxlog_handle_default();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    v8 = CFSTR("NO");
    if (v3)
      v8 = CFSTR("YES");
    v12 = 138412546;
    v13 = v6;
    v14 = 2112;
    v15 = v8;
    _os_log_impl(&dword_1C9A3B000, v4, OS_LOG_TYPE_DEFAULT, "%@ - MCProfileConnection isAppClipsAllowed status changed to: %@", (uint8_t *)&v12, 0x16u);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v10 = WeakRetained;
  if ((v3 & 1) != 0)
    objc_msgSend(WeakRetained, "tryUpdatePredictionsDefaultIntervalWithReason:", 19);
  else
    objc_msgSend(WeakRetained, "forceUpdatePredictionsImmediatelyWithReason:", 19);

  +[ATXAppDirectoryOrderingProvider sharedInstance](ATXAppDirectoryOrderingProvider, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "updateRecents");

}

- (ATXUpdatePredictionsDelegate)delegate
{
  return (ATXUpdatePredictionsDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (MCProfileConnection)profileConnection
{
  return self->_profileConnection;
}

- (void)setProfileConnection:(id)a3
{
  objc_storeStrong((id *)&self->_profileConnection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profileConnection, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_restrictionChangedNotificationToken, 0);
}

@end
