@implementation LACDeviceLifecycleManager

+ (void)rebootDeviceWithReason:(id)a3 completion:(id)a4
{
  id v5;
  void (**v6)(id, void *);
  NSObject *v7;
  int v8;
  NSObject *v9;
  void *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = (void (**)(id, void *))a4;
  LACLogDefault();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412290;
    v12 = v5;
    _os_log_impl(&dword_2409DC000, v7, OS_LOG_TYPE_DEFAULT, "Rebooting device with reason: %@", (uint8_t *)&v11, 0xCu);
  }

  v8 = reboot3();
  LACLogDefault();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 67109120;
    LODWORD(v12) = v8;
    _os_log_impl(&dword_2409DC000, v9, OS_LOG_TYPE_DEFAULT, "Requested reboot with result: %d", (uint8_t *)&v11, 8u);
  }

  if (v8)
  {
    +[LACError errorWithCode:debugDescription:](LACError, "errorWithCode:debugDescription:", -1000, CFSTR("Failed to reboot the device"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, v10);

  }
  else
  {
    v6[2](v6, 0);
  }

}

@end
