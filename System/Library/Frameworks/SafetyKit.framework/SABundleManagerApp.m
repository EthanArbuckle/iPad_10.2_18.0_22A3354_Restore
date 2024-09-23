@implementation SABundleManagerApp

- (SABundleManagerApp)initWithBundleId:(id)a3 deviceType:(int64_t)a4
{
  id v6;
  SABundleManagerApp *v7;
  SABundleManagerApp *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SABundleManagerApp;
  v7 = -[SABundleManagerApp init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    -[SABundleManagerApp setBundleId:](v7, "setBundleId:", v6);
    -[SABundleManagerApp setDeviceType:](v8, "setDeviceType:", a4);
  }

  return v8;
}

- (id)getLocalizedName
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;

  -[SABundleManagerApp bundleId](self, "bundleId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x24BDD1488];
    -[SABundleManagerApp bundleId](self, "bundleId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bundleWithIdentifier:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      sa_default_log();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        -[SABundleManagerApp getLocalizedName].cold.1(v7);

    }
    objc_msgSend(v6, "objectForInfoDictionaryKey:", CFSTR("CFBundleName"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (void)getLocalizedNameForPairedDeviceWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void (**v8)(_QWORD, _QWORD);
  void *v9;
  int64_t v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  void (**v16)(_QWORD, _QWORD);
  _QWORD v17[4];
  id v18;
  id v19;
  id location;

  v4 = a3;
  -[SABundleManagerApp name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_initWeak(&location, self);
    v7 = MEMORY[0x24BDAC760];
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __68__SABundleManagerApp_getLocalizedNameForPairedDeviceWithCompletion___block_invoke;
    v17[3] = &unk_2505B36A8;
    objc_copyWeak(&v19, &location);
    v18 = v4;
    v8 = (void (**)(_QWORD, _QWORD))MEMORY[0x234940A48](v17);
    -[SABundleManagerApp bundleId](self, "bundleId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v10 = -[SABundleManagerApp deviceType](self, "deviceType");
      if (!v10)
      {
        -[SABundleManagerApp bundleId](self, "bundleId");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BE03DE0], "sharedDeviceConnection");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14[0] = v7;
        v14[1] = 3221225472;
        v14[2] = __68__SABundleManagerApp_getLocalizedNameForPairedDeviceWithCompletion___block_invoke_2;
        v14[3] = &unk_2505B36D0;
        v11 = v12;
        v15 = v11;
        v16 = v8;
        objc_msgSend(v13, "fetchWatchAppBundleIDForCompanionAppBundleID:completion:", v11, v14);

        goto LABEL_9;
      }
      if (v10 == 1)
      {
        -[SABundleManagerApp bundleId](self, "bundleId");
        v11 = (id)objc_claimAutoreleasedReturnValue();
        +[SABundleManager getRemoteApplicationNameWithBundleId:withCompletion:](SABundleManager, "getRemoteApplicationNameWithBundleId:withCompletion:", v11, v8);
LABEL_9:

      }
    }
    else
    {
      v8[2](v8, 0);
    }

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
    goto LABEL_11;
  }
  -[SABundleManagerApp name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void *))v4 + 2))(v4, v6);

LABEL_11:
}

void __68__SABundleManagerApp_getLocalizedNameForPairedDeviceWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id WeakRetained;
  id v5;

  v3 = (id *)(a1 + 40);
  v5 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "setName:", v5);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __68__SABundleManagerApp_getLocalizedNameForPairedDeviceWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    sa_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __68__SABundleManagerApp_getLocalizedNameForPairedDeviceWithCompletion___block_invoke_2_cold_1(a1);

  }
  if (v5)
    +[SABundleManager getRemoteApplicationNameWithBundleId:withCompletion:](SABundleManager, "getRemoteApplicationNameWithBundleId:withCompletion:", v5, *(_QWORD *)(a1 + 40));
  else
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (void)setBundleId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (int64_t)deviceType
{
  return self->_deviceType;
}

- (void)setDeviceType:(int64_t)a3
{
  self->_deviceType = a3;
}

- (NSString)pairedBundleId
{
  return self->_pairedBundleId;
}

- (void)setPairedBundleId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSDate)authorizationDate
{
  return self->_authorizationDate;
}

- (void)setAuthorizationDate:(id)a3
{
  objc_storeStrong((id *)&self->_authorizationDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authorizationDate, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_pairedBundleId, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
}

- (void)getLocalizedName
{
  int v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 138412290;
  v2 = 0;
  _os_log_error_impl(&dword_23457A000, log, OS_LOG_TYPE_ERROR, "Unable to get Bundle for app with previous authorization: %@", (uint8_t *)&v1, 0xCu);
  OUTLINED_FUNCTION_2();
}

void __68__SABundleManagerApp_getLocalizedNameForPairedDeviceWithCompletion___block_invoke_2_cold_1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = *(_QWORD *)(a1 + 32);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_23457A000, v1, v2, "Unable to get remote app bundleId for fromBundleId: %@, error: %@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

@end
