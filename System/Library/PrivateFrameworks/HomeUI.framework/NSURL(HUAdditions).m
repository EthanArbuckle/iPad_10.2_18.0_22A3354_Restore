@implementation NSURL(HUAdditions)

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

+ (id)hu_notificationSettingsURL
{
  const __CFString *v0;

  if (objc_msgSend(MEMORY[0x1E0D319D0], "isAMac"))
    v0 = CFSTR("x-apple.systempreferences:com.apple.preference.notifications?id=com.apple.home");
  else
    v0 = CFSTR("prefs:root=NOTIFICATIONS_ID&path=com.apple.Home");
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v0);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)hu_wifiSettingsURL
{
  const __CFString *v0;

  if (objc_msgSend(MEMORY[0x1E0D319D0], "isAMac"))
    v0 = CFSTR("x-apple.systempreferences:com.apple.preference.network");
  else
    v0 = CFSTR("prefs:root=WIFI");
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v0);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (uint64_t)hu_allowAccessWhileLockedSettingsURL
{
  return objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("prefs:root=TOUCHID_PASSCODE&path=TOUCHID_PASSCODE#HOME_CONTROL_SWITCH"));
}

+ (uint64_t)hu_locationDeviceSettingsURL
{
  return objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("prefs:root=APPLE_ACCOUNT&path=LOCATION_SHARING"));
}

+ (id)hu_locationServicesSettingsURL
{
  const __CFString *v0;

  if (objc_msgSend(MEMORY[0x1E0D319D0], "isAMac"))
    v0 = CFSTR("x-apple.systempreferences:com.apple.preference.security?Privacy");
  else
    v0 = CFSTR("prefs:root=Privacy&path=LOCATION");
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v0);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)hu_learnToAddAccessoriesURL
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

+ (id)hu_learnAboutUnshareableNetworksURL
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

+ (id)hu_learnAboutNetworksRequiringProfilesURL
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

+ (uint64_t)hu_applePrivacyURL
{
  return objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("http://www.apple.com/privacy"));
}

+ (id)hu_openiCloudPreferencesURL
{
  const __CFString *v0;

  if (objc_msgSend(MEMORY[0x1E0D319D0], "isAMac"))
    v0 = CFSTR("x-apple.systempreferences:com.apple.preferences.AppleIDPrefPane?iCloud");
  else
    v0 = CFSTR("prefs:root=APPLE_ACCOUNT&path=ICLOUD_SERVICE");
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v0);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (uint64_t)hu_openiCloudKeychainPreferences
{
  return objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("prefs:root=APPLE_ACCOUNT&path=ICLOUD_SERVICE/com.apple.Dataclass.KeychainSync"));
}

+ (uint64_t)hu_cameraRecordingURL
{
  return objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("cameraRecordingLearnMore"));
}

+ (uint64_t)hu_learnAboutNetworkProtectionURL
{
  return objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("https://support.apple.com/HT210544?cid=iOS_UI_HomeKit_article_HT210544"));
}

+ (uint64_t)hu_photosLibraryPeopleAlbumURL
{
  return objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("photos://people"));
}

+ (uint64_t)hu_faceRecognitionPrivacyURL
{
  return objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("faceRecognitionLearnMore"));
}

+ (uint64_t)hu_losslessURL
{
  return objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("https://support.apple.com/HT212183"));
}

- (uint64_t)hu_isHomeKnowledgeBasedArticleURL
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99E98], "hu_learnToAddAccessoriesURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(a1, "isEqual:", v2) & 1) != 0)
  {
    v3 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "hu_learnAboutUnshareableNetworksURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(a1, "isEqual:", v4) & 1) != 0)
    {
      v3 = 1;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "hu_learnAboutNetworksRequiringProfilesURL");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(a1, "isEqual:", v5) & 1) != 0)
      {
        v3 = 1;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99E98], "hu_learnAboutNetworkProtectionURL");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v3 = objc_msgSend(a1, "isEqual:", v6);

      }
    }

  }
  return v3;
}

+ (id)hu_appStoreURLForBundleIdentifier:()HUAdditions
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
  objc_msgSend(v5, "setHost:", &stru_1E6F60E80);
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

@end
