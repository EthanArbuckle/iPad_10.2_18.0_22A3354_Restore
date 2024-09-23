@implementation MSServerMediator

- (MSServerMediator)initWithAccountsDelegate:(id)a3
{
  id v4;
  MSServerMediator *v5;
  NSObject *v6;
  objc_super v8;
  uint8_t buf[4];
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MSServerMediator;
  v5 = -[MSServerMediator init](&v8, sel_init);
  if (v5)
  {
    _MSLogingFacility();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v10 = "-[MSServerMediator initWithAccountsDelegate:]";
      _os_log_impl(&dword_219CD8000, v6, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
    }

    objc_storeWeak((id *)&v5->_accountsInterfaceDelegate, v4);
  }

  return v5;
}

- (void)openConnection
{
  void *v3;
  id v4;

  -[MSServerMediator connectionDelegate](self, "connectionDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[MSServerMediator connectionDelegate](self, "connectionDelegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "openConnection");

  }
}

- (void)getDefaultMediaService:(id)a3 homeUserID:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v8 = a4;
  v9 = a5;
  -[MSServerMediator accountsInterfaceDelegate](self, "accountsInterfaceDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 && v10)
  {
    -[MSServerMediator accountsInterfaceDelegate](self, "accountsInterfaceDelegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "getDefaultMediaService:homeUserID:completion:", v12, v8, v9);

  }
}

- (void)updateDefaultMediaService:(id)a3 homeID:(id)a4 homeUserID:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  -[MSServerMediator accountsInterfaceDelegate](self, "accountsInterfaceDelegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12 && v13)
  {
    -[MSServerMediator accountsInterfaceDelegate](self, "accountsInterfaceDelegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "updateDefaultMediaService:homeID:homeUserID:completion:", v15, v10, v11, v12);

  }
}

- (void)getAvailableServices:(id)a3 userIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v8 = a4;
  v9 = a5;
  -[MSServerMediator accountsInterfaceDelegate](self, "accountsInterfaceDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 && v10)
  {
    -[MSServerMediator accountsInterfaceDelegate](self, "accountsInterfaceDelegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "getAvailableServices:userIdentifier:completion:", v12, v8, v9);

  }
}

- (void)getMediaServiceChoicesForSharedUser:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  -[MSServerMediator accountsInterfaceDelegate](self, "accountsInterfaceDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    _MSLogingFacility();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[MSServerMediator getMediaServiceChoicesForSharedUser:completion:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.mediasetup.errorDomain"), 1, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, v9);
    goto LABEL_7;
  }
  if (v7)
  {
    -[MSServerMediator accountsInterfaceDelegate](self, "accountsInterfaceDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "getMediaServiceChoicesForSharedUser:completion:", v6, v7);
LABEL_7:

  }
}

- (void)getMediaServiceChoicesForAllUsers:(id)a3
{
  void (**v4)(id, _QWORD, void *);
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v4 = (void (**)(id, _QWORD, void *))a3;
  -[MSServerMediator accountsInterfaceDelegate](self, "accountsInterfaceDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    _MSLogingFacility();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[MSServerMediator getMediaServiceChoicesForSharedUser:completion:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.mediasetup.errorDomain"), 1, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, 0, v6);
    goto LABEL_7;
  }
  if (v4)
  {
    -[MSServerMediator accountsInterfaceDelegate](self, "accountsInterfaceDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "getMediaServiceChoicesForAllUsers:", v4);
LABEL_7:

  }
}

- (void)getCachedAvailableServices:(id)a3 userIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v8 = a4;
  v9 = a5;
  -[MSServerMediator accountsInterfaceDelegate](self, "accountsInterfaceDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 && v10)
  {
    -[MSServerMediator accountsInterfaceDelegate](self, "accountsInterfaceDelegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "getCachedAvailableServices:userIdentifier:completion:", v12, v8, v9);

  }
}

- (void)thirdPartyMusicAvailable:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  -[MSServerMediator accountsInterfaceDelegate](self, "accountsInterfaceDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 && v7)
  {
    -[MSServerMediator accountsInterfaceDelegate](self, "accountsInterfaceDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "thirdPartyMusicAvailable:completion:", v9, v6);

  }
}

- (void)getCachedServiceInfo:(id)a3 homeUserID:(id)a4 endpointID:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  -[MSServerMediator accountsInterfaceDelegate](self, "accountsInterfaceDelegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12 && v13)
  {
    -[MSServerMediator accountsInterfaceDelegate](self, "accountsInterfaceDelegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "getCachedServiceInfo:homeUserID:endpointID:completion:", v15, v10, v11, v12);

  }
}

- (void)requestAuthRenewalForMediaService:(id)a3 homeUserID:(id)a4 parentNetworkActivity:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  -[MSServerMediator accountsInterfaceDelegate](self, "accountsInterfaceDelegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12 && v13)
  {
    -[MSServerMediator accountsInterfaceDelegate](self, "accountsInterfaceDelegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "requestAuthRenewalForMediaService:homeUserID:parentNetworkActivity:completion:", v15, v10, v11, v12);

  }
}

- (void)addMediaService:(id)a3 usingSetupBundles:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v8 = a4;
  v9 = a5;
  -[MSServerMediator accountsInterfaceDelegate](self, "accountsInterfaceDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 && v10)
  {
    -[MSServerMediator accountsInterfaceDelegate](self, "accountsInterfaceDelegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addMediaService:usingSetupBundles:completion:", v12, v8, v9);

  }
}

- (void)removeMediaService:(id)a3 homeID:(id)a4 homeUserID:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  -[MSServerMediator accountsInterfaceDelegate](self, "accountsInterfaceDelegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12 && v13)
  {
    -[MSServerMediator accountsInterfaceDelegate](self, "accountsInterfaceDelegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "removeMediaService:homeID:homeUserID:completion:", v15, v10, v11, v12);

  }
}

- (void)updateProperty:(id)a3 homeID:(id)a4 homeUserID:(id)a5 withOptions:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  -[MSServerMediator accountsInterfaceDelegate](self, "accountsInterfaceDelegate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15 && v16)
  {
    -[MSServerMediator accountsInterfaceDelegate](self, "accountsInterfaceDelegate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "updateProperty:homeID:homeUserID:withOptions:completion:", v18, v12, v13, v14, v15);

  }
}

- (void)getServiceConfigurationInfo:(id)a3 serviceID:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v8 = a4;
  v9 = a5;
  -[MSServerMediator accountsInterfaceDelegate](self, "accountsInterfaceDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 && v10)
  {
    -[MSServerMediator accountsInterfaceDelegate](self, "accountsInterfaceDelegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "getServiceConfigurationInfo:serviceID:completion:", v12, v8, v9);

  }
}

- (void)getResolvedServiceInfo:(id)a3 sharedUserID:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v8 = a4;
  v9 = a5;
  -[MSServerMediator accountsInterfaceDelegate](self, "accountsInterfaceDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 && v10)
  {
    -[MSServerMediator accountsInterfaceDelegate](self, "accountsInterfaceDelegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "getResolvedServiceInfo:sharedUserID:completion:", v12, v8, v9);

  }
}

- (void)getDefaultMediaServiceForAllUsers:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[MSServerMediator accountsInterfaceDelegate](self, "accountsInterfaceDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 && v4)
  {
    -[MSServerMediator accountsInterfaceDelegate](self, "accountsInterfaceDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "getDefaultMediaServiceForAllUsers:", v6);

  }
}

- (void)getPublicInfoForBundleID:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  -[MSServerMediator accountsInterfaceDelegate](self, "accountsInterfaceDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 && v7)
  {
    -[MSServerMediator accountsInterfaceDelegate](self, "accountsInterfaceDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "getPublicInfoForBundleID:completion:", v9, v6);

  }
}

- (void)setVersion:(unint64_t)a3 completion:(id)a4
{
  void *v6;
  void *v7;
  id v8;

  v8 = a4;
  -[MSServerMediator accountsInterfaceDelegate](self, "accountsInterfaceDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 && v6)
  {
    -[MSServerMediator accountsInterfaceDelegate](self, "accountsInterfaceDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setVersion:completion:", a3, v8);

  }
}

- (void)overrideAppleMusicSubscriptionStatus:(BOOL)a3 homeUserIDS:(id)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v6 = a3;
  v11 = a4;
  v8 = a5;
  -[MSServerMediator accountsInterfaceDelegate](self, "accountsInterfaceDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[MSServerMediator accountsInterfaceDelegate](self, "accountsInterfaceDelegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "overrideAppleMusicSubscriptionStatus:homeUserIDS:completion:", v6, v11, v8);

  }
}

- (void)getResolvedServiceInfo:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  -[MSServerMediator accountsInterfaceDelegate](self, "accountsInterfaceDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 && v7)
  {
    -[MSServerMediator accountsInterfaceDelegate](self, "accountsInterfaceDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "getResolvedServiceInfo:completion:", v9, v6);

  }
}

- (void)activeServiceApplicationInformationForSharedUserID:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  -[MSServerMediator accountsInterfaceDelegate](self, "accountsInterfaceDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 && v7)
  {
    -[MSServerMediator accountsInterfaceDelegate](self, "accountsInterfaceDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "activeServiceApplicationInformationForSharedUserID:completionHandler:", v9, v6);

  }
}

- (void)switchUserAccountInfo:(id)a3 homeID:(id)a4 homeUserID:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  -[MSServerMediator accountsInterfaceDelegate](self, "accountsInterfaceDelegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12 && v13)
  {
    -[MSServerMediator accountsInterfaceDelegate](self, "accountsInterfaceDelegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "switchUserAccountInfo:homeID:homeUserID:completion:", v15, v10, v11, v12);

  }
}

- (void)getSupportedThirdPartyMediaServices:(id)a3
{
  void (**v4)(id, _QWORD, void *);
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v4 = (void (**)(id, _QWORD, void *))a3;
  -[MSServerMediator accountsInterfaceDelegate](self, "accountsInterfaceDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    _MSLogingFacility();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[MSServerMediator getMediaServiceChoicesForSharedUser:completion:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.mediasetup.errorDomain"), 1, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, 0, v6);
    goto LABEL_7;
  }
  if (v4)
  {
    -[MSServerMediator accountsInterfaceDelegate](self, "accountsInterfaceDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "getSupportedThirdPartyMediaServices:", v4);
LABEL_7:

  }
}

- (MSAccountsImplementer)accountsInterfaceDelegate
{
  return (MSAccountsImplementer *)objc_loadWeakRetained((id *)&self->_accountsInterfaceDelegate);
}

- (void)setAccountsInterfaceDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_accountsInterfaceDelegate, a3);
}

- (MSProxyConnectionDelegate)connectionDelegate
{
  return (MSProxyConnectionDelegate *)objc_loadWeakRetained((id *)&self->_connectionDelegate);
}

- (void)setConnectionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_connectionDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_connectionDelegate);
  objc_destroyWeak((id *)&self->_accountsInterfaceDelegate);
}

- (void)getMediaServiceChoicesForSharedUser:(uint64_t)a3 completion:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_219CD8000, a1, a3, "Missing accounts delegate", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

@end
