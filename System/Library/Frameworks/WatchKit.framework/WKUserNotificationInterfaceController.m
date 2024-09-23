@implementation WKUserNotificationInterfaceController

- (WKUserNotificationInterfaceController)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WKUserNotificationInterfaceController;
  return -[WKInterfaceController init](&v3, sel_init);
}

- (void)_didReceiveNotification:(id)a3 remoteNotification:(id)a4 localNotification:(id)a5 withCompletion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  WKUserNotificationInterfaceController *v14;
  id v15;
  id v16;

  v16 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = (void *)objc_opt_class();
  if (spUtils_subclassForObjectOverridesSelectorFromSuperclass(self, (uint64_t)sel_didReceiveNotification_withCompletion_, v13))
  {
    -[WKUserNotificationInterfaceController didReceiveNotification:withCompletion:](self, "didReceiveNotification:withCompletion:", v16, v12);
  }
  else if (v11)
  {
    -[WKUserNotificationInterfaceController didReceiveLocalNotification:withCompletion:](self, "didReceiveLocalNotification:withCompletion:", v11, v12);
  }
  else
  {
    if (v10)
    {
      v14 = self;
      v15 = v10;
    }
    else
    {
      v15 = (id)MEMORY[0x24BDBD1B8];
      v14 = self;
    }
    -[WKUserNotificationInterfaceController didReceiveRemoteNotification:withCompletion:](v14, "didReceiveRemoteNotification:withCompletion:", v15, v12);
  }

}

- (void)didReceiveNotification:(id)a3 withCompletion:(id)a4
{
  void (**v4)(id, _QWORD);
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, _QWORD))a4;
  wk_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136446466;
    v7 = "-[WKUserNotificationInterfaceController didReceiveNotification:withCompletion:]";
    v8 = 1024;
    v9 = 809;
    _os_log_impl(&dword_215918000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: Calling default implementation", (uint8_t *)&v6, 0x12u);
  }

  v4[2](v4, 0);
}

- (void)didReceiveRemoteNotification:(id)a3 withCompletion:(id)a4
{
  void (**v4)(id, _QWORD);
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, _QWORD))a4;
  wk_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136446466;
    v7 = "-[WKUserNotificationInterfaceController didReceiveRemoteNotification:withCompletion:]";
    v8 = 1024;
    v9 = 817;
    _os_log_impl(&dword_215918000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: Calling default implementation", (uint8_t *)&v6, 0x12u);
  }

  v4[2](v4, 0);
}

- (void)didReceiveLocalNotification:(id)a3 withCompletion:(id)a4
{
  void (**v4)(id, _QWORD);
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, _QWORD))a4;
  wk_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136446466;
    v7 = "-[WKUserNotificationInterfaceController didReceiveLocalNotification:withCompletion:]";
    v8 = 1024;
    v9 = 825;
    _os_log_impl(&dword_215918000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: Calling default implementation", (uint8_t *)&v6, 0x12u);
  }

  v4[2](v4, 0);
}

@end
