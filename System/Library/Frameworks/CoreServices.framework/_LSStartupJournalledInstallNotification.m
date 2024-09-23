@implementation _LSStartupJournalledInstallNotification

- (_LSStartupJournalledInstallNotification)initWithNotification:(int)a3 appProxies:(id)a4 plugins:(BOOL)a5
{
  id v8;
  _LSStartupJournalledInstallNotification *v9;
  _LSStartupJournalledInstallNotification *v10;
  uint64_t v11;
  NSArray *proxies;
  objc_super v14;

  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_LSStartupJournalledInstallNotification;
  v9 = -[_LSStartupJournalledInstallNotification init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_notification = a3;
    v11 = objc_msgSend(v8, "copy");
    proxies = v10->_proxies;
    v10->_proxies = (NSArray *)v11;

    v10->_plugins = a5;
  }

  return v10;
}

- (void)dispatchToObserver:(id)a3 forInstallProgressService:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  _LSProgressLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = -[_LSStartupJournalledInstallNotification notification](self, "notification");
    -[_LSStartupJournalledInstallNotification proxies](self, "proxies");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 134218242;
    v14 = v9;
    v15 = 2112;
    v16 = v10;
    _os_log_impl(&dword_182882000, v8, OS_LOG_TYPE_INFO, "Sending notification %lu for proxies %@ to observer.", (uint8_t *)&v13, 0x16u);

  }
  v11 = -[_LSStartupJournalledInstallNotification notification](self, "notification");
  -[_LSStartupJournalledInstallNotification proxies](self, "proxies");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "directlySendNotification:withProxies:toObserver:", v11, v12, v7);

}

- (int)notification
{
  return self->_notification;
}

- (NSArray)proxies
{
  return self->_proxies;
}

- (BOOL)plugins
{
  return self->_plugins;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxies, 0);
}

@end
