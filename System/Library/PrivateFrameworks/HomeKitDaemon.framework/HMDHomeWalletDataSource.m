@implementation HMDHomeWalletDataSource

- (HMDHomeWalletDataSource)init
{
  HMDHomeWalletDataSource *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HMDHomeWalletDataSource;
  result = -[HMDHomeWalletDataSource init](&v3, sel_init);
  if (result)
    result->_passCodeChangeNotificationToken = -1;
  return result;
}

- (void)dealloc
{
  int passCodeChangeNotificationToken;
  objc_super v4;

  passCodeChangeNotificationToken = self->_passCodeChangeNotificationToken;
  if (passCodeChangeNotificationToken != -1)
    notify_cancel(passCodeChangeNotificationToken);
  v4.receiver = self;
  v4.super_class = (Class)HMDHomeWalletDataSource;
  -[HMDHomeWalletDataSource dealloc](&v4, sel_dealloc);
}

- (BOOL)isResidentCapable
{
  void *v2;
  char v3;

  +[HMDDeviceCapabilities deviceCapabilities](HMDDeviceCapabilities, "deviceCapabilities");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isResidentCapable");

  return v3;
}

- (int64_t)accessoryWriteMaxRetryCount
{
  void *v2;
  void *v3;
  void *v4;
  int64_t v5;

  objc_msgSend(MEMORY[0x24BE3F248], "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferenceForKey:", CFSTR("walletKeyAccessoryWriteMaxRetryCount"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");

  return v5;
}

- (double)accessoryWriteRetryInterval
{
  void *v2;
  void *v3;
  void *v4;
  double v5;

  objc_msgSend(MEMORY[0x24BE3F248], "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferenceForKey:", CFSTR("walletKeyAccessoryWriteRetryInterval"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (double)objc_msgSend(v4, "integerValue");

  return v5;
}

- (int64_t)walletKeyColor
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  int64_t v6;
  BOOL v7;
  uint64_t v8;

  objc_msgSend(MEMORY[0x24BE3F248], "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferenceForKey:", CFSTR("walletKeyColor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "integerValue");
  v6 = v5;
  if (v5 > 14935010)
  {
    v7 = v5 == 14935011;
    v8 = 15521450;
  }
  else
  {
    v7 = v5 == 0;
    v8 = 14341582;
  }
  if (!v7 && v5 != v8)
    v6 = *MEMORY[0x24BDD63F8];

  return v6;
}

- (BOOL)registerForPasscodeChangeNotificationWithQueue:(id)a3 callback:(id)a4
{
  NSObject *v6;
  id v7;
  id v8;
  uint32_t v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, int);
  void *v14;
  id v15;
  id v16;
  id location;
  int out_token;

  v6 = a3;
  v7 = a4;
  out_token = -1;
  objc_initWeak(&location, self);
  v11 = MEMORY[0x24BDAC760];
  v12 = 3221225472;
  v13 = __83__HMDHomeWalletDataSource_registerForPasscodeChangeNotificationWithQueue_callback___block_invoke;
  v14 = &unk_24E7882B8;
  objc_copyWeak(&v16, &location);
  v8 = v7;
  v15 = v8;
  v9 = notify_register_dispatch("com.apple.managedconfiguration.passcodechanged", &out_token, v6, &v11);
  if (!v9)
    -[HMDHomeWalletDataSource setPassCodeChangeNotificationToken:](self, "setPassCodeChangeNotificationToken:", out_token, v11, v12, v13, v14);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

  return v9 == 0;
}

- (void)persistNumberValueToNoBackupStore:(id)a3 withKey:(id)a4
{
  CFPreferencesSetAppValue((CFStringRef)a4, a3, CFSTR("com.apple.homed.notbackedup"));
  CFPreferencesAppSynchronize(CFSTR("com.apple.homed.notbackedup"));
}

- (id)numberValueFromNoBackupStoreWithKey:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)CFPreferencesCopyAppValue((CFStringRef)a3, CFSTR("com.apple.homed.notbackedup"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

- (void)showExpressEnabledUserNotificationForWalletKeyWithPassUniqueID:(id)a3 completion:(id)a4
{
  void *v5;
  id v6;
  id v7;

  v5 = (void *)MEMORY[0x24BDD1540];
  v6 = a4;
  objc_msgSend(v5, "hmErrorWithCode:", 48);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a4 + 2))(v6, v7);

}

- (void)canNotifyAboutExpressModeWithCompletion:(id)a3
{
  (*((void (**)(id, _QWORD))a3 + 2))(a3, 0);
}

- (int)passCodeChangeNotificationToken
{
  return self->_passCodeChangeNotificationToken;
}

- (void)setPassCodeChangeNotificationToken:(int)a3
{
  self->_passCodeChangeNotificationToken = a3;
}

void __83__HMDHomeWalletDataSource_registerForPasscodeChangeNotificationWithQueue_callback___block_invoke(uint64_t a1, int a2)
{
  id WeakRetained;
  BOOL v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v6 = WeakRetained;
    v5 = objc_msgSend(WeakRetained, "passCodeChangeNotificationToken") == a2;
    WeakRetained = v6;
    if (v5)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
      WeakRetained = v6;
    }
  }

}

@end
