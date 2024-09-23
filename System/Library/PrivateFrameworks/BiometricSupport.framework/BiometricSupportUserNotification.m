@implementation BiometricSupportUserNotification

+ (void)displayTouchIDIssueNotification
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = (id)MGCopyAnswer();
  +[BKLocalization getLocalizedString:](BKLocalization, "getLocalizedString:", CFSTR("TOUCH_ID_ISSUE_NOTIFICATION_TITLE"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "uppercaseString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("TOUCH_ID_ISSUE_NOTIFICATION_TEXT_"), "stringByAppendingString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[BKLocalization getLocalizedString:](BKLocalization, "getLocalizedString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[BKLocalization getLocalizedString:](BKLocalization, "getLocalizedString:", CFSTR("TOUCH_ID_ISSUE_NOTIFICATION_CONFIRM"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "displaySensorIssueNotificationWithHeader:message:button:", v3, v6, v7);

}

+ (void)displayPearlIssueNotification
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = (id)MGCopyAnswer();
  +[BKLocalization getLocalizedString:](BKLocalization, "getLocalizedString:", CFSTR("FACE_ID_ISSUE_NOTIFICATION_TITLE"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "uppercaseString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("FACE_ID_ISSUE_NOTIFICATION_TEXT_"), "stringByAppendingString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[BKLocalization getLocalizedString:](BKLocalization, "getLocalizedString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[BKLocalization getLocalizedString:](BKLocalization, "getLocalizedString:", CFSTR("FACE_ID_ISSUE_NOTIFICATION_CONFIRM"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "displaySensorIssueNotificationWithHeader:message:button:", v3, v6, v7);

}

+ (void)displayPearlInterlockIssueNotification:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  NSObject *v17;
  int v18;
  NSObject *v19;
  NSObject *v20;
  int v21;
  id v22;
  uint64_t v23;

  v3 = a3;
  v23 = *MEMORY[0x24BDAC8D0];
  v4 = MEMORY[0x24BDACB70];
  if (__osLogTrace)
    v5 = __osLogTrace;
  else
    v5 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v21) = 0;
    _os_log_impl(&dword_2148C7000, v5, OS_LOG_TYPE_DEFAULT, "postPearlInterlockFollowUpItem\n", (uint8_t *)&v21, 2u);
  }
  v6 = displayPearlInterlockIssueNotification__count;
  if (displayPearlInterlockIssueNotification__count == -1)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE1B3A8]), "initWithClientIdentifier:", CFSTR("com.apple.BiometricKit"));
    v6 = objc_msgSend(v7, "countOfPendingFollowUpItems:", 0);
    displayPearlInterlockIssueNotification__count = v6;
    if (!v3)
    {
LABEL_17:
      v18 = 1;
      if (v3 || v6 < 1)
      {
        v8 = v7;
      }
      else
      {
        v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE1B3A8]), "initWithClientIdentifier:", CFSTR("com.apple.BiometricKit"));

        if (__osLog)
          v19 = __osLog;
        else
          v19 = v4;
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v21) = 0;
          _os_log_impl(&dword_2148C7000, v19, OS_LOG_TYPE_DEFAULT, "Clearing item\n", (uint8_t *)&v21, 2u);
        }
        v18 = objc_msgSend(v8, "clearPendingFollowUpItems:", 0);
        displayPearlInterlockIssueNotification__count = objc_msgSend(v8, "countOfPendingFollowUpItems:", 0);
      }
      goto LABEL_26;
    }
  }
  else
  {
    v7 = 0;
    if (!v3)
      goto LABEL_17;
  }
  if (v6)
    goto LABEL_17;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE1B3A8]), "initWithClientIdentifier:", CFSTR("com.apple.BiometricKit"));

  v9 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("https://support.apple.com/HT208186?cid=iOS_SettingsUI_iphone_article_HT208186"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x24BE1B3A0];
  +[BKLocalization getLocalizedString:](BKLocalization, "getLocalizedString:", CFSTR("FACE_ID_INTERLOCK_ACTION"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "actionWithLabel:url:", v12, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "addObject:", v13);
  v14 = objc_alloc_init(MEMORY[0x24BE1B3B0]);
  objc_msgSend(v14, "setUniqueIdentifier:", CFSTR("com.apple.faceid.CamInterlockError"));
  +[BKLocalization getLocalizedString:](BKLocalization, "getLocalizedString:", CFSTR("FACE_ID_INTERLOCK_TITLE"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTitle:", v15);

  +[BKLocalization getLocalizedString:](BKLocalization, "getLocalizedString:", CFSTR("FACE_ID_INTERLOCK_INFORMATIVE_TEXT"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setInformativeText:", v16);

  objc_msgSend(v14, "setActions:", v9);
  if (__osLog)
    v17 = __osLog;
  else
    v17 = v4;
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v21 = 138412290;
    v22 = v14;
    _os_log_impl(&dword_2148C7000, v17, OS_LOG_TYPE_DEFAULT, "Posting item: %@\n", (uint8_t *)&v21, 0xCu);
  }
  v18 = objc_msgSend(v8, "postFollowUpItem:error:", v14, 0);
  displayPearlInterlockIssueNotification__count = objc_msgSend(v8, "countOfPendingFollowUpItems:", 0);

LABEL_26:
  if (__osLogTrace)
    v20 = __osLogTrace;
  else
    v20 = v4;
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v21 = 67109120;
    LODWORD(v22) = v18;
    _os_log_impl(&dword_2148C7000, v20, OS_LOG_TYPE_DEFAULT, "postPearlInterlockFollowUpItem -> %d\n", (uint8_t *)&v21, 8u);
  }

}

+ (BOOL)displayPearlGlassesBannerNotification
{
  uint64_t v2;
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  char v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  NSObject *v16;
  int v18;
  const __CFString *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v2 = MEMORY[0x24BDACB70];
  if (__osLogTrace)
    v3 = __osLogTrace;
  else
    v3 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v18) = 0;
    _os_log_impl(&dword_2148C7000, v3, OS_LOG_TYPE_DEFAULT, "displayPearlGlassesBannerNotification\n", (uint8_t *)&v18, 2u);
  }
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "fileExistsAtPath:", CFSTR("/tmp/biokit_glasses_banner_notification"));

  if ((v5 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "createFileAtPath:contents:attributes:", CFSTR("/tmp/biokit_glasses_banner_notification"), 0, 0);

    if ((v7 & 1) == 0)
    {
      v8 = (__osLog ? __osLog : v2);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v18 = 138412290;
        v19 = CFSTR("/tmp/biokit_glasses_banner_notification");
        _os_log_impl(&dword_2148C7000, v8, OS_LOG_TYPE_ERROR, "displayPearlGlassesBannerNotification: cannot create mark file %@\n", (uint8_t *)&v18, 0xCu);
      }
    }
    v9 = objc_alloc_init(MEMORY[0x24BDF8800]);
    +[BKLocalization getLocalizedString:fromFile:](BKLocalization, "getLocalizedString:fromFile:", CFSTR("FACE_ID_GLASSES_BANNER_TITLE"), CFSTR("biometrickitd-Periocular"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTitle:", v10);

    +[BKLocalization getLocalizedString:fromFile:](BKLocalization, "getLocalizedString:fromFile:", CFSTR("FACE_ID_GLASSES_BANNER_BODY"), CFSTR("biometrickitd-Periocular"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setBody:", v11);

    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("prefs:root=TOUCHID_PASSCODE"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setDefaultActionURL:", v12);

    objc_msgSend(MEMORY[0x24BDF8858], "requestWithIdentifier:content:trigger:destinations:", CFSTR("com.apple.BiometricKit.GlassesBanner"), v9, 0, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF88B8]), "initWithBundleIdentifier:", CFSTR("com.apple.Preferences"));
    objc_msgSend(v14, "addNotificationRequest:withCompletionHandler:", v13, &__block_literal_global_0);

  }
  v15 = v5 ^ 1;
  if (__osLogTrace)
    v16 = __osLogTrace;
  else
    v16 = v2;
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v18 = 67109120;
    LODWORD(v19) = v15;
    _os_log_impl(&dword_2148C7000, v16, OS_LOG_TYPE_DEFAULT, "displayPearlGlassesBannerNotification -> %d\n", (uint8_t *)&v18, 8u);
  }
  return v15;
}

void __73__BiometricSupportUserNotification_displayPearlGlassesBannerNotification__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  if (__osLog)
    v3 = __osLog;
  else
    v3 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_2148C7000, v3, OS_LOG_TYPE_INFO, "displayPearlGlassesBannerNotification addNotificationRequest callback, error = %@\n", (uint8_t *)&v4, 0xCu);
  }

}

+ (BOOL)didDisplayPearlGlassesBannerNotificationRecently:(double)a3
{
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  NSObject *v13;
  _BOOL4 v14;
  NSObject *v15;
  NSObject *v16;
  int v18;
  double v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = MEMORY[0x24BDACB70];
  if (__osLogTrace)
    v5 = __osLogTrace;
  else
    v5 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v18 = 134217984;
    v19 = a3;
    _os_log_impl(&dword_2148C7000, v5, OS_LOG_TYPE_DEFAULT, "didDisplayPearlGlassesBannerNotificationRecently:%f\n", (uint8_t *)&v18, 0xCu);
  }
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "attributesOfItemAtPath:error:", CFSTR("/tmp/biokit_glasses_banner_notification"), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if (__osLog)
      v8 = __osLog;
    else
      v8 = v4;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v18) = 0;
      _os_log_impl(&dword_2148C7000, v8, OS_LOG_TYPE_DEBUG, "Glasses banner markfile found, attributes retrieved\n", (uint8_t *)&v18, 2u);
    }
    objc_msgSend(v7, "fileCreationDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      objc_msgSend(v9, "timeIntervalSinceNow");
      v12 = -v11;
      if (__osLog)
        v13 = __osLog;
      else
        v13 = v4;
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v18 = 134217984;
        v19 = v12;
        _os_log_impl(&dword_2148C7000, v13, OS_LOG_TYPE_INFO, "Glasses banner mark file age is %f\n", (uint8_t *)&v18, 0xCu);
      }
      v14 = v12 < a3;
    }
    else
    {
      if (__osLog)
        v15 = __osLog;
      else
        v15 = v4;
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v18) = 0;
        _os_log_impl(&dword_2148C7000, v15, OS_LOG_TYPE_ERROR, "Cannot get glasses banner markfile creation date\n", (uint8_t *)&v18, 2u);
      }
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }
  if (__osLogTrace)
    v16 = __osLogTrace;
  else
    v16 = v4;
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v18 = 67109120;
    LODWORD(v19) = v14;
    _os_log_impl(&dword_2148C7000, v16, OS_LOG_TYPE_DEFAULT, "didDisplayPearlGlassesBannerNotificationRecently -> %d\n", (uint8_t *)&v18, 8u);
  }

  return v14;
}

+ (void)displaySensorIssueNotificationWithHeader:(id)a3 message:(id)a4 button:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  char v11;
  void *v12;
  NSObject *v13;
  _QWORD block[4];
  id v15;
  id v16;
  id v17;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "fileExistsAtPath:", CFSTR("/tmp/biokit_hw_issue_notification"));

  if ((v11 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "createFileAtPath:contents:attributes:", CFSTR("/tmp/biokit_hw_issue_notification"), 0, 0);

    dispatch_get_global_queue(33, 0);
    v13 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __92__BiometricSupportUserNotification_displaySensorIssueNotificationWithHeader_message_button___block_invoke;
    block[3] = &unk_24D241528;
    v15 = v7;
    v16 = v8;
    v17 = v9;
    dispatch_async(v13, block);

  }
}

void __92__BiometricSupportUserNotification_displaySensorIssueNotificationWithHeader_message_button___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const __CFDictionary *v6;
  __CFUserNotification *v7;
  __CFUserNotification *v8;
  CFOptionFlags responseFlags;
  SInt32 error;
  _QWORD v11[6];
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  error = 0;
  responseFlags = 0;
  v1 = *MEMORY[0x24BDBD6D8];
  v12 = *(_OWORD *)(a1 + 32);
  v2 = *MEMORY[0x24BDBD6E0];
  v11[0] = v1;
  v11[1] = v2;
  v3 = *(_QWORD *)(a1 + 48);
  v4 = *MEMORY[0x24BDBD6E8];
  v11[2] = *MEMORY[0x24BDBD6F8];
  v11[3] = v4;
  v13 = v3;
  v14 = MEMORY[0x24BDBD1C8];
  v5 = *MEMORY[0x24BEB0DF0];
  v11[4] = *MEMORY[0x24BEB0E58];
  v11[5] = v5;
  v15 = MEMORY[0x24BDBD1C8];
  v16 = MEMORY[0x24BDBD1C0];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v12, v11, 6);
  v6 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  v7 = CFUserNotificationCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], 0.0, 0, &error, v6);
  if (v7)
  {
    v8 = v7;
    CFUserNotificationReceiveResponse(v7, 0.0, &responseFlags);
    CFRelease(v8);
  }

}

+ (void)displayStopAlertWithHeader:(id)a3 andMessage:(id)a4
{
  CFUserNotificationDisplayAlert(0.0, 0, 0, 0, 0, (CFStringRef)a3, (CFStringRef)a4, 0, 0, 0, 0);
}

@end
