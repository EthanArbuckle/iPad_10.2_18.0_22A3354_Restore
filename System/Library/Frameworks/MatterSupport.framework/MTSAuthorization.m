@implementation MTSAuthorization

- (MTSAuthorization)init
{
  MTSXPCServerProxy *v3;
  MTSAuthorization *v4;

  v3 = objc_alloc_init(MTSXPCServerProxy);
  v4 = -[MTSAuthorization initWithServerProxy:](self, "initWithServerProxy:", v3);

  return v4;
}

- (MTSAuthorization)initWithServerProxy:(id)a3
{
  MTSXPCServerProxy *v4;
  MTSAuthorization *v5;
  MTSXPCServerProxy *serverProxy;
  objc_super v8;

  v4 = (MTSXPCServerProxy *)a3;
  v8.receiver = self;
  v8.super_class = (Class)MTSAuthorization;
  v5 = -[MTSAuthorization init](&v8, sel_init);
  serverProxy = v5->_serverProxy;
  v5->_serverProxy = v4;

  return v5;
}

- (BOOL)isRestrictedCharacteristicsAccessAllowed
{
  return -[MTSAuthorization allowsRestrictedCharacteristicsAccessViaDeveloperModeProfile](self, "allowsRestrictedCharacteristicsAccessViaDeveloperModeProfile")|| -[MTSAuthorization allowsRestrictedCharacteristicsAccessViaSkipDeveloperModeRestrictionProfile](self, "allowsRestrictedCharacteristicsAccessViaSkipDeveloperModeRestrictionProfile");
}

- (BOOL)allowsRestrictedCharacteristicsAccessViaDeveloperModeProfile
{
  uint64_t Int64;
  void *v4;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  LODWORD(Int64) = objc_msgSend((id)objc_opt_class(), "isDeveloperModeEnabled");
  if ((_DWORD)Int64)
  {
    Int64 = CFPrefs_GetInt64();
    if (Int64)
    {
      -[MTSAuthorization serverProxy](self, "serverProxy");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "showRestrictedCharacteristicsAccessWarningAlert");

      LOBYTE(Int64) = 1;
    }
  }
  return Int64;
}

- (BOOL)allowsRestrictedCharacteristicsAccessViaSkipDeveloperModeRestrictionProfile
{
  void *v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  -[MTSAuthorization serverProxy](self, "serverProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __95__MTSAuthorization_allowsRestrictedCharacteristicsAccessViaSkipDeveloperModeRestrictionProfile__block_invoke;
  v4[3] = &unk_250599C38;
  v4[4] = &v5;
  objc_msgSend(v2, "checkRestrictedCharacteristicsAccessAllowedWithCompletionHandler:", v4);

  LOBYTE(v2) = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return (char)v2;
}

- (MTSXPCServerProxy)serverProxy
{
  return (MTSXPCServerProxy *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverProxy, 0);
}

uint64_t __95__MTSAuthorization_allowsRestrictedCharacteristicsAccessViaSkipDeveloperModeRestrictionProfile__block_invoke(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

+ (BOOL)isDeveloperModeEnabled
{
  int v3;
  int v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  _BOOL4 v9;
  size_t v11;
  uint64_t v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v11 = 8;
  v12 = 0;
  v3 = sysctlbyname("security.mac.amfi.developer_mode_status", &v12, &v11, 0, 0);
  if (v3)
  {
    v4 = v3;
    v5 = (void *)MEMORY[0x23493F978]();
    v6 = a1;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v14 = v8;
      v15 = 1024;
      v16 = v4;
      _os_log_impl(&dword_2344FE000, v7, OS_LOG_TYPE_ERROR, "%{public}@Received bad status from sysctl for developer mode check: %d", buf, 0x12u);

    }
    objc_autoreleasePoolPop(v5);
    LOBYTE(v9) = 0;
  }
  else
  {
    return v12 == 1;
  }
  return v9;
}

@end
