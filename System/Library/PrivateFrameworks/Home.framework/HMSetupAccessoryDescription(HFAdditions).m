@implementation HMSetupAccessoryDescription(HFAdditions)

- (id)hf_home
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[5];

  +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "homeManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "homes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51__HMSetupAccessoryDescription_HFAdditions__hf_home__block_invoke;
  v7[3] = &unk_1EA72B630;
  v7[4] = a1;
  objc_msgSend(v4, "na_firstObjectPassingTest:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (uint64_t)hf_isLogitechCircleViewDoorbell
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  objc_msgSend(a1, "category");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "categoryType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CB7AF0]))
  {
    objc_msgSend(a1, "setupAccessoryPayload");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "productNumber");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "uppercaseString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("9BFF8F87"));

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (__CFString)hf_marketingName
{
  __CFString *v2;

  objc_msgSend(a1, "marketingName");
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(a1, "hf_isLogitechCircleViewDoorbell"))
  {

    v2 = CFSTR("Logitech Circle View Doorbell");
  }
  return v2;
}

- (id)hf_installationGuideURL
{
  void *v2;
  _BOOL4 v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(a1, "installationGuideURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(a1, "hf_isLogitechCircleViewDoorbell"))
  {
    v3 = HFForceInstallationGuideUseStagingURL();
    v4 = (void *)MEMORY[0x1E0C99E98];
    if (v3)
    {
      HFStoreInstallationGuideStagingURLString();
      v5 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "URLWithString:", v5);
      v6 = objc_claimAutoreleasedReturnValue();

      v2 = (void *)v5;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("http://logi.com/circleviewdoorbell/setup"));
      v6 = objc_claimAutoreleasedReturnValue();
    }

    v2 = (void *)v6;
  }
  return v2;
}

- (uint64_t)hf_isKeyedToASpecificAccessory
{
  return objc_msgSend(a1, "addAndSetupAccessories") ^ 1;
}

- (BOOL)hf_isLaunchedByHomeApp
{
  void *v1;
  void *v2;
  id v3;
  void *v4;
  _BOOL8 v5;
  _QWORD v7[4];
  id v8;

  objc_msgSend(a1, "appIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  __HFHomeApplicationBundleIdentifiers_block_invoke();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __66__HMSetupAccessoryDescription_HFAdditions__hf_isLaunchedByHomeApp__block_invoke;
  v7[3] = &unk_1EA726EA8;
  v8 = v1;
  v3 = v1;
  objc_msgSend(v2, "na_firstObjectPassingTest:", v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  return v5;
}

- (uint64_t)hf_isLaunchedByHomeDaemon
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "appIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.homed"));

  return v2;
}

- (id)hf_localizedLaunchingAppName
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  v1 = (void *)MEMORY[0x1E0CA5898];
  objc_msgSend(a1, "appIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "bundleRecordWithApplicationIdentifier:error:", v2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "localizedShortName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(v3, "localizedName");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

- (void)hf_updateWithDiscoveredAccessory:()HFAdditions
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "accessory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v8, "accessory");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "updateWithAccessory:", v5);

  }
  objc_msgSend(v8, "category");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v8, "category");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "updateAccessoryCategory:", v7);

  }
}

@end
