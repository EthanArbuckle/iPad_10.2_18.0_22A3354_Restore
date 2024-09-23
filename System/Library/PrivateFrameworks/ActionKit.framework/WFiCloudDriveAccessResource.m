@implementation WFiCloudDriveAccessResource

- (id)associatedAppIdentifier
{
  return CFSTR("com.apple.iCloudDriveApp");
}

- (id)localizedProtectedResourceDescriptionWithContext:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  WFLocalizedStringResourceWithKey(CFSTR("iCloud Drive"), CFSTR("iCloud Drive"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localize:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (WFiCloudDriveAccessResource)initWithDefinition:(id)a3
{
  WFiCloudDriveAccessResource *v3;
  void *v4;
  WFiCloudDriveAccessResource *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WFiCloudDriveAccessResource;
  v3 = -[WFAccessResource initWithDefinition:](&v7, sel_initWithDefinition_, a3);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", v3, sel_refreshAvailabilityWithNotification, *MEMORY[0x24BDD1380], 0);

    v5 = v3;
  }

  return v3;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BDD1380], 0);

  v4.receiver = self;
  v4.super_class = (Class)WFiCloudDriveAccessResource;
  -[WFAccessResource dealloc](&v4, sel_dealloc);
}

- (unint64_t)status
{
  void *v2;
  void *v3;
  unint64_t v4;

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ubiquityIdentityToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = 4;
  else
    v4 = 1;

  return v4;
}

- (id)localizedErrorReasonForStatus:(unint64_t)a3
{
  return WFLocalizedString(CFSTR("Shortcuts can’t access iCloud Drive because no account is set up. Visit the Settings app to log into iCloud."));
}

- (id)localizedImportErrorReasonForStatus:(unint64_t)a3
{
  return WFLocalizedString(CFSTR("In order to answer this question, Shortcuts needs access to your iCloud Drive account. Log into iCloud in Settings."));
}

- (id)localizedErrorRecoveryOptionsForStatus:(unint64_t)a3
{
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  WFLocalizedString(CFSTR("Open Settings"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)attemptRecoveryFromErrorWithOptionIndex:(unint64_t)a3 userInterface:(id)a4 completionHandler:(id)a5
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v6 = a5;
  v7 = (void *)MEMORY[0x24BE193A0];
  v8 = a4;
  objc_msgSend(v7, "sharedContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("prefs:root=APPLE_ACCOUNT&path=ICLOUD_SERVICE/com.apple.Dataclass.Ubiquity"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __103__WFiCloudDriveAccessResource_attemptRecoveryFromErrorWithOptionIndex_userInterface_completionHandler___block_invoke;
  v12[3] = &unk_24F8B4CD0;
  v13 = v6;
  v11 = v6;
  objc_msgSend(v9, "openURL:withBundleIdentifier:userInterface:completionHandler:", v10, CFSTR("com.apple.Preferences"), v8, v12);

}

uint64_t __103__WFiCloudDriveAccessResource_attemptRecoveryFromErrorWithOptionIndex_userInterface_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (BOOL)mustBeAvailableForDisplay
{
  return 1;
}

+ (BOOL)isSystemResource
{
  return 1;
}

@end
