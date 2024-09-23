@implementation SAAuthorizationInFlight

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __41__SAAuthorizationInFlight_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_1 != -1)
    dispatch_once(&sharedInstance_onceToken_1, block);
  return (id)sharedInstance_sSAServerAuthorizationInFlight;
}

void __41__SAAuthorizationInFlight_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance_sSAServerAuthorizationInFlight;
  sharedInstance_sSAServerAuthorizationInFlight = v0;

}

- (NSString)getToBundleLocalizedName
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  if (self->_toBundleId)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v2)
    {
      sa_default_log();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
        -[SAAuthorizationInFlight getToBundleLocalizedName].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);

    }
    objc_msgSend(v2, "objectForInfoDictionaryKey:", CFSTR("CFBundleName"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }
  return (NSString *)v11;
}

- (NSString)getFromBundleLocalizedName
{
  void *v2;
  void *v3;

  -[SAAuthorizationInFlight fromApp](self, "fromApp");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getLocalizedName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)getFromBundleLocalizedNameWithCompletion:(id)a3
{
  void *v4;
  void *v5;
  void (*v6)(void);
  SABundleManagerApp *fromApp;
  _QWORD *v8;

  v8 = a3;
  -[SAAuthorizationInFlight fromApp](self, "fromApp");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "getLocalizedName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (void (*)(void))v8[2];
  }
  else
  {
    fromApp = self->_fromApp;
    if (fromApp)
    {
      -[SABundleManagerApp getLocalizedNameForPairedDeviceWithCompletion:](fromApp, "getLocalizedNameForPairedDeviceWithCompletion:", v8);
      goto LABEL_6;
    }
    v6 = (void (*)(void))v8[2];
  }
  v6();
LABEL_6:

}

- (void)reset
{
  id completionHandler;
  SABundleManagerApp *fromApp;
  NSString *toBundleId;

  completionHandler = self->_completionHandler;
  self->_completionHandler = 0;

  fromApp = self->_fromApp;
  self->_fromApp = 0;

  toBundleId = self->_toBundleId;
  self->_toBundleId = 0;

  self->_inFlight = 0;
}

- (id)description
{
  void *v3;
  _BOOL4 v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = -[SAAuthorizationInFlight isInFlight](self, "isInFlight");
  -[SAAuthorizationInFlight fromApp](self, "fromApp");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SAAuthorizationInFlight getFromBundleLocalizedName](self, "getFromBundleLocalizedName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SAAuthorizationInFlight toBundleId](self, "toBundleId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SAAuthorizationInFlight getToBundleLocalizedName](self, "getToBundleLocalizedName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Authorization, isInFlight: %d, from: %@ (%@), to: %@ (%@)"), v4, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)isInFlight
{
  return self->_inFlight;
}

- (void)setInFlight:(BOOL)a3
{
  self->_inFlight = a3;
}

- (int64_t)preflightAuthorizationStatus
{
  return self->_preflightAuthorizationStatus;
}

- (void)setPreflightAuthorizationStatus:(int64_t)a3
{
  self->_preflightAuthorizationStatus = a3;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)fromBundleId
{
  return self->_fromBundleId;
}

- (void)setFromBundleId:(id)a3
{
  objc_storeStrong((id *)&self->_fromBundleId, a3);
}

- (SABundleManagerApp)fromApp
{
  return self->_fromApp;
}

- (void)setFromApp:(id)a3
{
  objc_storeStrong((id *)&self->_fromApp, a3);
}

- (NSString)toBundleId
{
  return self->_toBundleId;
}

- (void)setToBundleId:(id)a3
{
  objc_storeStrong((id *)&self->_toBundleId, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toBundleId, 0);
  objc_storeStrong((id *)&self->_fromApp, 0);
  objc_storeStrong((id *)&self->_fromBundleId, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->toBundleLocalizedName, 0);
}

- (void)getToBundleLocalizedName
{
  OUTLINED_FUNCTION_2_1(&dword_23457A000, a1, a3, "Unable to get Bundle for app requesting authorization: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

@end
