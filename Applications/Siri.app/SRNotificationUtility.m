@implementation SRNotificationUtility

+ (id)_userNotificationCenter
{
  return objc_msgSend(objc_alloc((Class)UNUserNotificationCenter), "initWithBundleIdentifier:", CFSTR("com.apple.siri.NotificationSource"));
}

+ (id)_siriUnvailableNotificationRequest
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  unsigned int v10;
  void *v11;
  unsigned __int8 v12;
  const __CFString *v13;
  __CFString *v14;
  void *v15;
  unsigned int v16;
  const __CFString *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v22;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", CFSTR("com.apple.siri")));
  v4 = objc_alloc_init((Class)UNMutableNotificationContent);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "siriUILocalizedStringForKey:", CFSTR("ASSISTANT_NOT_AVAILABLE_TITLE")));
  objc_msgSend(v4, "setTitle:", v5);

  objc_msgSend(v4, "setShouldSuppressDefaultAction:", 1);
  objc_msgSend(v4, "setShouldIgnoreDoNotDisturb:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_deviceSpecificStringForDefaultString:", CFSTR("ASSISTANT_NO_NETWORK_SUBTITLE_NOTIFICATION")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[SRUIFCachedPreferences sharedInstance](SRUIFCachedPreferences, "sharedInstance"));
  v8 = objc_msgSend(v7, "understandingOnDeviceAssetsAvailable");

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v10 = objc_msgSend(v9, "sf_isChinaRegionCellularDevice");

  if (!+[AFFeatureFlags isNLServerFallbackDisabled](AFFeatureFlags, "isNLServerFallbackDisabled")|| (v8 & 1) != 0)
  {
    if (+[AFConnection isAvailable](AFConnection, "isAvailable")
      && ((+[AFConnection isNetworkAvailable](AFConnection, "isNetworkAvailable") | v8) & 1) == 0)
    {
      if (v10)
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("ASSISTANT_NO_LOCAL_ASSETS_SUBTITLE_NOTIFICATION"), "stringByAppendingString:", CFSTR("_CHINA")));
      else
        v14 = CFSTR("ASSISTANT_NO_LOCAL_ASSETS_SUBTITLE_NOTIFICATION");
      v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "siriUILocalizedStringForKey:", v14));

      v6 = (void *)v22;
    }
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[SRUIFCachedPreferences sharedInstance](SRUIFCachedPreferences, "sharedInstance"));
    v12 = objc_msgSend(v11, "assetsDownloading");

    if ((v12 & 1) != 0)
    {
      v13 = CFSTR("ASSISTANT_NO_LOCAL_ASSETS_DOWNLOADING_SUBTITLE_NOTIFICATION");
    }
    else
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[SRUIFCachedPreferences sharedInstance](SRUIFCachedPreferences, "sharedInstance"));
      v16 = objc_msgSend(v15, "assetsNeedSpace");

      v17 = CFSTR("ASSISTANT_NO_LOCAL_ASSETS_NO_WIFI_SUBTITLE_NOTIFICATION");
      if (v10)
        v17 = CFSTR("ASSISTANT_NO_LOCAL_ASSETS_NO_WIFI_SUBTITLE_NOTIFICATION_CHINA");
      if (v16)
        v13 = CFSTR("ASSISTANT_NO_LOCAL_ASSETS_NO_SPACE_SUBTITLE_NOTIFICATION");
      else
        v13 = v17;
    }
    v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "siriUILocalizedStringForKey:", v13));

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", CFSTR("prefs:root=SIRI")));
    objc_msgSend(v4, "setDefaultActionURL:", v19);

    objc_msgSend(v4, "setHasDefaultAction:", 1);
    v6 = (void *)v18;
  }
  objc_msgSend(v4, "setBody:", v6);
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[UNNotificationRequest requestWithIdentifier:content:trigger:](UNNotificationRequest, "requestWithIdentifier:content:trigger:", CFSTR("com.apple.siri.notification.unavailablecontent"), v4, 0));

  return v20;
}

+ (id)_deviceSpecificStringForDefaultString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", CFSTR("com.apple.siri")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[SiriUIUtilities deviceSpecificKeyForDefaultKey:](SiriUIUtilities, "deviceSpecificKeyForDefaultKey:", v3));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "siriUILocalizedStringForKey:", v5));
  return v6;
}

+ (void)postSiriUnavailableNotification:(unint64_t)a3
{
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_siriUnvailableNotificationRequest"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_userNotificationCenter"));
  objc_msgSend(a1, "_postNotificationRequest:notificationCenter:destinations:", v6, v5, a3);

}

+ (void)_postNotificationRequest:(id)a3 notificationCenter:(id)a4 destinations:(unint64_t)a5
{
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "setDestinations:", a5);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10006EA58;
  v10[3] = &unk_100122598;
  v11 = v7;
  v9 = v7;
  objc_msgSend(v8, "addNotificationRequest:withCompletionHandler:", v9, v10);

}

+ (id)_downloadAssetsNotificationRequest
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", CFSTR("com.apple.siri")));
  v4 = objc_alloc_init((Class)UNMutableNotificationContent);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "siriUILocalizedStringForKey:", CFSTR("DOWNLOAD_ASSETS_TITLE")));
  objc_msgSend(v4, "setTitle:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_deviceSpecificStringForDefaultString:", CFSTR("DOWNLOAD_ASSETS_SUBTITLE_NOTIFICATION")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "siriUILocalizedStringForKey:", v6));
  objc_msgSend(v4, "setBody:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", CFSTR("prefs:root=SIRI")));
  objc_msgSend(v4, "setDefaultActionURL:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UNNotificationRequest requestWithIdentifier:content:trigger:](UNNotificationRequest, "requestWithIdentifier:content:trigger:", CFSTR("com.apple.siri.notification.downloadassets"), v4, 0));
  return v9;
}

+ (void)postStorageLowNotification
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_downloadAssetsNotificationRequest"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_userNotificationCenter"));
  objc_msgSend(a1, "_postNotificationRequest:notificationCenter:destinations:", v4, v3, 7);

}

+ (id)_downloadSiriAdvancedFeaturesAssetsNotificationRequest
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", CFSTR("com.apple.siri")));
  v3 = objc_alloc_init((Class)UNMutableNotificationContent);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "siriUILocalizedStringForKey:", CFSTR("DOWNLOAD_ASSETS_TITLE")));
  objc_msgSend(v3, "setTitle:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "siriUILocalizedStringForKey:", CFSTR("DOWNLOAD_ADVANCED_FEATURES_ASSETS_SUBTITLE_NOTIFICATION")));
  objc_msgSend(v3, "setBody:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", CFSTR("prefs:root=SIRI")));
  objc_msgSend(v3, "setDefaultActionURL:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UNNotificationRequest requestWithIdentifier:content:trigger:](UNNotificationRequest, "requestWithIdentifier:content:trigger:", CFSTR("com.apple.siri.notification.downloadassets"), v3, 0));
  return v7;
}

+ (void)postSiriAdvancedFeaturesAssetsDownloadNotification
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_downloadSiriAdvancedFeaturesAssetsNotificationRequest"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_userNotificationCenter"));
  objc_msgSend(a1, "_postNotificationRequest:notificationCenter:destinations:", v4, v3, 7);

}

@end
