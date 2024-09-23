@implementation CNMCProfileConnection

- (id)defaultAppBundleIDForCommunicationServiceType:(id)a3 forAccountWithIdentifier:(id)a4
{
  Class (__cdecl *v5)();
  id v6;
  id v7;
  void *v8;
  void *v9;

  v5 = (Class (__cdecl *)())getMCProfileConnectionClass;
  v6 = a4;
  v7 = a3;
  -[objc_class sharedConnection](v5(), "sharedConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "defaultAppBundleIDForCommunicationServiceType:forAccountWithIdentifier:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)communicationServiceRulesExistForBundleID:(id)a3 forCommunicationServiceType:(id)a4
{
  Class (__cdecl *v5)();
  id v6;
  id v7;
  void *v8;
  char v9;

  v5 = (Class (__cdecl *)())getMCProfileConnectionClass;
  v6 = a4;
  v7 = a3;
  -[objc_class sharedConnection](v5(), "sharedConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "communicationServiceRulesExistForBundleID:forCommunicationServiceType:", v7, v6);

  return v9;
}

- (id)observableForManagedConfigChanged
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0D13AE8];
  getMCProfileListChangedNotification();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "observableOnDarwinNotificationCenterWithName:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
