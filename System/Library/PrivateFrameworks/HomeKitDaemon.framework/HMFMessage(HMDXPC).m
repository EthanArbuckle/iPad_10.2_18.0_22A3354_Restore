@implementation HMFMessage(HMDXPC)

- (uint64_t)isEntitledForSPIAccess
{
  void *v3;
  uint64_t v4;

  if ((objc_msgSend(a1, "isInternal") & 1) != 0)
    return 1;
  objc_msgSend(a1, "proxyConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEntitledForSPIAccess");

  return v4;
}

- (id)proxyConnection
{
  void *v1;
  void *v2;
  id v3;

  objc_msgSend(a1, "transport");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = v1;
  else
    v2 = 0;
  v3 = v2;

  return v3;
}

- (id)applicationBundleIdentifier
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "proxyConnection");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "applicationBundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)clientName
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "proxyConnection");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (uint64_t)requiresSPIEntitlement
{
  void *v1;
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;

  objc_msgSend(a1, "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("requiresSPIEntitlement"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  v5 = objc_msgSend(v4, "BOOLValue");
  return v5;
}

- (uint64_t)requiresNoSPIEntitlement
{
  void *v1;
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;

  objc_msgSend(a1, "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("requiresNoSPIEntitlement"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  v5 = objc_msgSend(v4, "BOOLValue");
  return v5;
}

- (uint64_t)requiresSetupPayloadEntitlement
{
  void *v1;
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;

  objc_msgSend(a1, "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("requiresSetupPayloadEntitlement"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  v5 = objc_msgSend(v4, "BOOLValue");
  return v5;
}

- (uint64_t)requiresMatterSetupPayloadEntitlement
{
  void *v1;
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;

  objc_msgSend(a1, "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("requiresMatterSetupPayloadEntitlement"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  v5 = objc_msgSend(v4, "BOOLValue");
  return v5;
}

- (uint64_t)requiresCameraClipsEntitlement
{
  void *v1;
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;

  objc_msgSend(a1, "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("requiresCameraClipsEntitlement"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  v5 = objc_msgSend(v4, "BOOLValue");
  return v5;
}

- (uint64_t)requiresMultiUserSetupEntitlement
{
  void *v1;
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;

  objc_msgSend(a1, "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("requiresMultiUserSetupEntitlement"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  v5 = objc_msgSend(v4, "BOOLValue");
  return v5;
}

- (uint64_t)requiresPersonManagerEntitlement
{
  void *v1;
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;

  objc_msgSend(a1, "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("requiresPersonManagerEntitlement"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  v5 = objc_msgSend(v4, "BOOLValue");
  return v5;
}

- (uint64_t)requiresWalletKeyEntitlement
{
  void *v1;
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;

  objc_msgSend(a1, "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("requiresWalletKeyEntitlement"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  v5 = objc_msgSend(v4, "BOOLValue");
  return v5;
}

- (uint64_t)entitlements
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "proxyConnection");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "entitlements");

  return v2;
}

- (uint64_t)isEntitledForAPIAccess
{
  void *v3;
  uint64_t v4;

  if ((objc_msgSend(a1, "isInternal") & 1) != 0 || (objc_msgSend(a1, "isRemote") & 1) != 0)
    return 1;
  objc_msgSend(a1, "proxyConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEntitledForAPIAccess");

  return v4;
}

- (uint64_t)isAuthorizedForHomeDataAccess
{
  void *v3;
  uint64_t v4;

  if ((objc_msgSend(a1, "isInternal") & 1) != 0 || (objc_msgSend(a1, "isRemote") & 1) != 0)
    return 1;
  objc_msgSend(a1, "proxyConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isAuthorizedForHomeDataAccess");

  return v4;
}

- (uint64_t)isAuthorizedForMicrophoneAccess
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "proxyConnection");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isAuthorizedForMicrophoneAccess");

  return v2;
}

- (uint64_t)isEntitledForBackgroundMode
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "proxyConnection");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEntitledForBackgroundMode");

  return v2;
}

- (uint64_t)isAuthorizedForLocationAccess
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a1, "proxyConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = objc_msgSend(v2, "isAuthorizedForLocationAccess");
  }
  else if (objc_msgSend(a1, "isSecureRemote"))
  {
    objc_msgSend(a1, "headers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "hmf_BOOLForKey:", CFSTR("cl.locauthz"));

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (uint64_t)isEntitledForHomeLocationAccess
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "proxyConnection");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEntitledForHomeLocationAccess");

  return v2;
}

- (uint64_t)isEntitledToProvideAccessorySetupPayload
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "proxyConnection");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEntitledToProvideAccessorySetupPayload");

  return v2;
}

- (uint64_t)isEntitledToProvideMatterSetupPayload
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "proxyConnection");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEntitledToProvideMatterSetupPayload");

  return v2;
}

- (uint64_t)isEntitledForShortcutsAutomationAccess
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a1, "proxyConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = objc_msgSend(v2, "isEntitledForShortcutsAutomationAccess");
  }
  else if (objc_msgSend(a1, "isSecureRemote"))
  {
    objc_msgSend(a1, "headers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "hmf_BOOLForKey:", CFSTR("cl.shortcutent"));

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (uint64_t)isEntitledForSecureAccess
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "proxyConnection");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEntitledForSecureAccess");

  return v2;
}

- (uint64_t)isEntitledForStateDump
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "proxyConnection");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEntitledForStateDump");

  return v2;
}

- (uint64_t)isEntitledForAssistantIdentifiers
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "proxyConnection");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEntitledForAssistantIdentifiers");

  return v2;
}

- (uint64_t)isEntitledForHomeLocationFeedbackAccess
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "proxyConnection");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEntitledForHomeLocationFeedbackAccess");

  return v2;
}

- (uint64_t)isBackground
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "proxyConnection");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "processInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isBackgrounded");

  return v3;
}

- (uint64_t)sourcePid
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "proxyConnection");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
    v3 = objc_msgSend(v1, "clientPid");
  else
    v3 = 0xFFFFFFFFLL;

  return v3;
}

- (id)companionAppBundleIdentifier
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "proxyConnection");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "companionAppBundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)sendPolicy
{
  void *v1;
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(a1, "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("sendPolicy"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (uint64_t)homeManagerOptions
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "proxyConnection");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
    v3 = objc_msgSend(v1, "homeManagerOptions");
  else
    v3 = -1;

  return v3;
}

+ (id)entitledMessageWithName:()HMDXPC messagePayload:
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  const __CFString *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v14 = CFSTR("requiresSPIEntitlement");
  v15[0] = MEMORY[0x24BDBD1C8];
  v6 = (void *)MEMORY[0x24BDBCE70];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = [a1 alloc];
  objc_msgSend(MEMORY[0x24BE3F1B8], "allMessageDestinations");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithName:qualityOfService:destination:userInfo:headers:payload:", v8, -1, v11, v9, 0, v7);

  return v12;
}

+ (id)entitledMessageWithName:()HMDXPC identifier:messagePayload:
{
  id v8;
  void *v9;

  v8 = a4;
  objc_msgSend(a1, "entitledMessageWithName:messagePayload:", a3, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setIdentifier:", v8);

  return v9;
}

+ (id)nonSPIEntitledMessageWithName:()HMDXPC messagePayload:
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  const __CFString *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v14 = CFSTR("requiresNoSPIEntitlement");
  v15[0] = MEMORY[0x24BDBD1C8];
  v6 = (void *)MEMORY[0x24BDBCE70];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = [a1 alloc];
  objc_msgSend(MEMORY[0x24BE3F1B8], "allMessageDestinations");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithName:qualityOfService:destination:userInfo:headers:payload:", v8, -1, v11, v9, 0, v7);

  return v12;
}

@end
