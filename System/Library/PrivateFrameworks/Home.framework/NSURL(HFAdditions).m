@implementation NSURL(HFAdditions)

+ (id)_localeString
{
  void *v0;
  uint64_t v1;
  void *v2;
  __CFString *v3;
  __CFString *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "localeIdentifier");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)v1;
  v3 = CFSTR("en_us");
  if (v1)
    v3 = (__CFString *)v1;
  v4 = v3;

  -[__CFString stringByReplacingOccurrencesOfString:withString:](v4, "stringByReplacingOccurrencesOfString:withString:", CFSTR("_"), CFSTR("-"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "lowercaseString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)hf_notificationSettingsURL
{
  const __CFString *v0;

  if (+[HFUtilities isAMac](HFUtilities, "isAMac"))
    v0 = CFSTR("x-apple.systempreferences:com.apple.preference.notifications?id=com.apple.home");
  else
    v0 = CFSTR("prefs:root=NOTIFICATIONS_ID&path=com.apple.Home");
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v0);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)hf_wifiSettingsURL
{
  const __CFString *v0;

  if (+[HFUtilities isAMac](HFUtilities, "isAMac"))
    v0 = CFSTR("x-apple.systempreferences:com.apple.preference.network");
  else
    v0 = CFSTR("prefs:root=WIFI");
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v0);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (uint64_t)hf_allowAccessWhileLockedSettingsURL
{
  return objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("prefs:root=TOUCHID_PASSCODE&path=TOUCHID_PASSCODE#HOME_CONTROL_SWITCH"));
}

+ (uint64_t)hf_locationDeviceSettingsURL
{
  return objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("prefs:root=APPLE_ACCOUNT&path=LOCATION_SHARING"));
}

+ (id)hf_locationServicesSettingsURL
{
  const __CFString *v0;

  if (+[HFUtilities isAMac](HFUtilities, "isAMac"))
    v0 = CFSTR("x-apple.systempreferences:com.apple.preference.security?Privacy");
  else
    v0 = CFSTR("prefs:root=Privacy&path=LOCATION");
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v0);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)hf_learnToAddAccessoriesURL
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v1 = (void *)MEMORY[0x1E0C99E98];
  v2 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a1, "_localeString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("https://support.apple.com/%@/HT204893#add"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "URLWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)hf_learnAboutUnshareableNetworksURL
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v1 = (void *)MEMORY[0x1E0C99E98];
  v2 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a1, "_localeString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("https://support.apple.com/%@/HT209643"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "URLWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)hf_learnAboutNetworksRequiringProfilesURL
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v1 = (void *)MEMORY[0x1E0C99E98];
  v2 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a1, "_localeString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("https://support.apple.com/%@/HT209643"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "URLWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)hf_learnToUpdateAppleTVURL
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v1 = (void *)MEMORY[0x1E0C99E98];
  v2 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a1, "_localeString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("https://support.apple.com/%@/HT202716"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "URLWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (uint64_t)hf_learnAboutActivityLogsURL
{
  return objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("https://support.apple.com/ht213743?cid=mc-ols-homeapp-article_ht213743-homeappui-04252023"));
}

+ (uint64_t)hf_applePrivacyURL
{
  return objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("http://www.apple.com/privacy"));
}

+ (id)hf_openiCloudPreferencesURL
{
  const __CFString *v0;

  if (+[HFUtilities isAMac](HFUtilities, "isAMac"))
    v0 = CFSTR("x-apple.systempreferences:com.apple.preferences.AppleIDPrefPane?iCloud");
  else
    v0 = CFSTR("prefs:root=APPLE_ACCOUNT&path=ICLOUD_SERVICE");
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v0);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (uint64_t)hf_openiCloudPasswordAndSecurityURL
{
  const __CFString *v0;

  if (+[HFUtilities isAMac](HFUtilities, "isAMac"))
    v0 = CFSTR("x-apple.systempreferences:com.apple.preferences.icloud");
  else
    v0 = CFSTR("prefs:root=APPLE_ACCOUNT&path=PASSWORD_AND_SECURITY");
  return objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v0);
}

+ (uint64_t)hf_openiCloudKeychainPreferences
{
  return objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("prefs:root=APPLE_ACCOUNT&path=ICLOUD_SERVICE/com.apple.Dataclass.KeychainSync"));
}

+ (uint64_t)hf_cameraRecordingURL
{
  return objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("cameraRecordingLearnMore"));
}

+ (uint64_t)hf_learnAboutNetworkProtectionURL
{
  return objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("https://support.apple.com/HT210544?cid=iOS_UI_HomeKit_article_HT210544"));
}

+ (uint64_t)hf_photosLibraryPeopleAlbumURL
{
  return objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("photos://people"));
}

+ (uint64_t)hf_faceRecognitionPrivacyURL
{
  return objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("faceRecognitionLearnMore"));
}

+ (uint64_t)hf_losslessURL
{
  return objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("https://support.apple.com/HT212183"));
}

+ (id)hf_setupHomeHubLearnMoreURL
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v1 = (void *)MEMORY[0x1E0C99E98];
  v2 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a1, "_localeString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("https://support.apple.com/%@/HT207057"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "URLWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (uint64_t)hf_homeHubRequiredLearnMoreURL
{
  return objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("https://support.apple.com/ht213214?cid=mc-ols-homekit-article_ht213214-ios_ui-03292022"));
}

+ (uint64_t)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
{
  return objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("https://support.apple.com/ht213429?cid=mc-ols-homekit-article_ht213429-homeappui-08232022"));
}

+ (uint64_t)hf_threadNetworkRequiredLearnMoreURL
{
  return objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("https://support.apple.com/ht210213?cid=mc-ols-homekit-article_ht210213-ios_ui-04142022"));
}

+ (id)hf_systemSoftwareUpdate
{
  const __CFString *v0;

  if (+[HFUtilities isAMac](HFUtilities, "isAMac"))
    v0 = CFSTR("x-apple.systempreferences:com.apple.Software-Update-Settings.extension");
  else
    v0 = CFSTR("prefs:root=General%23-64&path=SOFTWARE_UPDATE_LINK%23-64");
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v0);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (uint64_t)hf_matterAccessoriesInSettingsApp
{
  return objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("prefs:root=General&path=MATTER_ACCESSORIES"));
}

- (uint64_t)hf_isHomeKnowledgeBasedArticleURL
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99E98], "hf_learnToAddAccessoriesURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(a1, "isEqual:", v2) & 1) != 0)
  {
    v3 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "hf_learnAboutUnshareableNetworksURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(a1, "isEqual:", v4) & 1) != 0)
    {
      v3 = 1;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "hf_learnAboutNetworksRequiringProfilesURL");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(a1, "isEqual:", v5) & 1) != 0)
      {
        v3 = 1;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99E98], "hf_learnAboutNetworkProtectionURL");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(a1, "isEqual:", v6) & 1) != 0)
        {
          v3 = 1;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99E98], "hf_losslessURL");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(a1, "isEqual:", v7) & 1) != 0)
          {
            v3 = 1;
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E98], "hf_homeHubRequiredLearnMoreURL");
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(a1, "isEqual:", v8) & 1) != 0)
            {
              v3 = 1;
            }
            else
            {
              objc_msgSend(MEMORY[0x1E0C99E98], "hf_threadNetworkRequiredLearnMoreURL");
              v9 = (void *)objc_claimAutoreleasedReturnValue();
              v3 = objc_msgSend(a1, "isEqual:", v9);

            }
          }

        }
      }

    }
  }

  return v3;
}

+ (id)hf_appStoreURLForBundleIdentifier:()HFAdditions
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)MEMORY[0x1E0CB3998];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v5, "setScheme:", CFSTR("itms-apps"));
  objc_msgSend(v5, "setHost:", &stru_1EA741FF8);
  objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("bundleIdentifier"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setQueryItems:", v7);

  objc_msgSend(v5, "URL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)hf_locationFromURL:()HFAdditions
{
  id v3;
  HFURLComponents *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  BOOL v8;
  id v9;
  double v10;
  double v11;
  double v12;
  void *v13;

  v3 = a3;
  v4 = -[HFURLComponents initWithURL:]([HFURLComponents alloc], "initWithURL:", v3);

  -[HFURLComponents valueForParameter:](v4, "valueForParameter:", CFSTR("latitude"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFURLComponents valueForParameter:](v4, "valueForParameter:", CFSTR("longitude"));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v5)
    v8 = v6 == 0;
  else
    v8 = 1;
  if (v8)
  {
    v13 = 0;
  }
  else
  {
    v9 = objc_alloc(MEMORY[0x1E0C9E3B8]);
    objc_msgSend(v5, "doubleValue");
    v11 = v10;
    objc_msgSend(v7, "doubleValue");
    v13 = (void *)objc_msgSend(v9, "initWithLatitude:longitude:", v11, v12);
  }

  return v13;
}

@end
