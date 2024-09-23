void sub_21ACD6964(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getAXSettingsClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!AccessibilityUtilitiesLibraryCore_frameworkLibrary)
  {
    AccessibilityUtilitiesLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!AccessibilityUtilitiesLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("AXSettings");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getAXSettingsClass_block_invoke_cold_1();
    free(v3);
  }
  getAXSettingsClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void sub_21ACD7298(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

id _accessibilitySDUISupportBundle()
{
  if (_accessibilitySDUISupportBundle_onceToken != -1)
    dispatch_once(&_accessibilitySDUISupportBundle_onceToken, &__block_literal_global_0);
  return (id)_accessibilitySDUISupportBundle_AXBundle;
}

void ___accessibilitySDUISupportBundle_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_accessibilitySDUISupportBundle_AXBundle;
  _accessibilitySDUISupportBundle_AXBundle = v0;

}

void AXSDSoundDetectionRequestNotificationAuthorization()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[AXSDListenEngine sharedInstance](AXSDListenEngine, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "supportsVirtualAudioDevice"))
    v0 = 40;
  else
    v0 = 32;
  AXSDSoundDetectionNotificationCenter();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "requestAuthorizationWithOptions:completionHandler:", v0, &__block_literal_global_4);

}

id AXSDSoundDetectionNotificationCenter()
{
  if (AXSDSoundDetectionNotificationCenter_onceToken != -1)
    dispatch_once(&AXSDSoundDetectionNotificationCenter_onceToken, &__block_literal_global_90);
  return (id)AXSDSoundDetectionNotificationCenter_NotificationCenter;
}

void AXSDSoundDetectionGenerateUserNotificationForDetectionType(void *a1, float a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  NSObject *v14;
  id v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  const __CFString *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  __int128 v44;
  void (*v45)(uint64_t, void *);
  void *v46;
  id v47;
  _QWORD v48[2];
  _QWORD v49[2];
  _BYTE buf[24];
  void *v51;
  id v52;
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  objc_msgSend(MEMORY[0x24BDFF278], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "soundDetectionState");

  if (v5 == 2)
  {
    objc_msgSend(MEMORY[0x24BDFF278], "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "enabledSoundDetectionTypes");
    v7 = objc_claimAutoreleasedReturnValue();

    if ((-[NSObject containsObject:](v7, "containsObject:", v3) & 1) != 0)
    {
      objc_msgSend(MEMORY[0x24BDFF278], "sharedInstance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "soundDetectionSnoozeDictionary");
      v9 = objc_claimAutoreleasedReturnValue();

      -[NSObject objectForKey:](v9, "objectForKey:", v3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10
        && (objc_msgSend(MEMORY[0x24BDBCE60], "date"),
            v11 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v10, "laterDate:", v11),
            v12 = (void *)objc_claimAutoreleasedReturnValue(),
            v13 = objc_msgSend(v12, "isEqualToDate:", v10),
            v12,
            v11,
            v13))
      {
        AXLogUltron();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = v3;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v10;
          _os_log_impl(&dword_21ACD4000, v14, OS_LOG_TYPE_DEFAULT, "Not generating user notification for detection. Notifications for %@ are snoozed until %@", buf, 0x16u);
        }
      }
      else
      {
        v15 = v3;
        AXLogUltron();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          AXSDSoundDetectionGenerateUserNotificationForDetectionType_cold_1((uint64_t)v15, v16, v17, a2);

        v18 = MEMORY[0x24BDAC760];
        *(_QWORD *)buf = MEMORY[0x24BDAC760];
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = ___SoundDetectionSendNotification_block_invoke;
        v51 = &unk_24DDF6A90;
        v19 = v15;
        v52 = v19;
        AnalyticsSendEventLazy();
        objc_msgSend(MEMORY[0x24BDF8810], "soundWithAlertType:", 29);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDFF278], "sharedInstance");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "soundAlertTopicForSoundDetectionType:", v19);
        v22 = objc_claimAutoreleasedReturnValue();

        if (v22)
          objc_msgSend(v20, "setAlertTopic:", v22);
        v41 = (void *)v22;
        v42 = v10;
        v23 = (void *)objc_opt_new();
        AXSDSoundDetectionLocalizedStringForType();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setTitle:", v24);

        AXSDSoundDetectionLocalizedStringForType();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setBody:", v25);

        v48[0] = CFSTR("SDNotificationDetectorKey");
        v48[1] = CFSTR("SDNotificationConfidenceKey");
        v49[0] = v19;
        *(float *)&v26 = a2;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v49[1] = v27;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v49, v48, 2);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setUserInfo:", v28);

        objc_msgSend(v23, "setSound:", v20);
        objc_msgSend(v23, "setInterruptionLevel:", 2);
        v43 = v20;
        if (AXSDIsConnectedToCarPlay()
          && ((id)*MEMORY[0x24BDFF1E8] == v19 || (id)*MEMORY[0x24BDFF258] == v19))
        {
          v29 = v18;
          objc_msgSend(v23, "setShouldSuppressDefaultAction:", 0);
          v31 = CFSTR("com.apple.SoundDetectionCarPlayNotifications.message");
          v32 = 15;
        }
        else
        {
          v29 = v18;
          objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("prefs:root=ACCESSIBILITY&path=SOUND_RECOGNITION_TITLE/Sounds"));
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "setDefaultActionURL:", v30);

          v31 = CFSTR("com.apple.SoundDetectionNotifications.message");
          v32 = 7;
        }
        objc_msgSend(v23, "setCategoryIdentifier:", v31);
        v33 = (void *)MEMORY[0x24BDF8858];
        objc_msgSend(MEMORY[0x24BDD1880], "UUID");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "UUIDString");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "requestWithIdentifier:content:trigger:destinations:", v35, v23, 0, v32);
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        AXLogUltron();
        v37 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
        {
          LODWORD(v44) = 138412290;
          *(_QWORD *)((char *)&v44 + 4) = v36;
          _os_log_impl(&dword_21ACD4000, v37, OS_LOG_TYPE_INFO, "Posting local notification: %@", (uint8_t *)&v44, 0xCu);
        }

        AXSDSoundDetectionNotificationCenter();
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        *(_QWORD *)&v44 = v29;
        *((_QWORD *)&v44 + 1) = 3221225472;
        v45 = ___SoundDetectionSendNotification_block_invoke_130;
        v46 = &unk_24DDF6AB8;
        v47 = v19;
        v39 = v19;
        objc_msgSend(v38, "addNotificationRequest:withCompletionHandler:", v36, &v44);

        objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", 30.0);
        v14 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDFF278], "sharedInstance");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "addSnoozeDateToSnoozeDictionary:forKey:", v14, v39);

        v10 = v42;
      }

    }
    else
    {
      AXLogUltron();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
        AXSDSoundDetectionGenerateUserNotificationForDetectionType_cold_2();
    }

  }
  else
  {
    AXLogUltron();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21ACD4000, v7, OS_LOG_TYPE_DEFAULT, "Not generating user notification because feature is off", buf, 2u);
    }
  }

}

void _SoundDetectionSendNotificationForCustomDetector(void *a1, float a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  uint8_t buf[4];
  void *v26;
  _QWORD v27[2];
  _QWORD v28[3];

  v28[2] = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  objc_msgSend(MEMORY[0x24BDFF278], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "detectorForIdentifier:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  AXLogUltron();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      _SoundDetectionSendNotificationForCustomDetector_cold_2(v5, v7);

    objc_msgSend(MEMORY[0x24BDF8810], "soundWithAlertType:", 29);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_opt_new();
    objc_msgSend(v5, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTitle:", v9);

    _accessibilitySDUISupportBundle();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("CustomDetectionBody"), CFSTR("CustomDetectionBody"), CFSTR("SoundDetectionSupport"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v5, "name");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringWithFormat:", v11, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setBody:", v14);

    objc_msgSend(v8, "setCategoryIdentifier:", CFSTR("com.apple.SoundDetectionNotifications.message"));
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("prefs:root=ACCESSIBILITY&path=SOUND_RECOGNITION_TITLE/Sounds"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDefaultActionURL:", v15);

    objc_msgSend(v8, "setSound:", v7);
    v27[0] = CFSTR("SDNotificationDetectorKey");
    v27[1] = CFSTR("SDNotificationConfidenceKey");
    v28[0] = v3;
    *(float *)&v16 = a2;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v28[1] = v17;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v28, v27, 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setUserInfo:", v18);

    objc_msgSend(v8, "setInterruptionLevel:", 2);
    v19 = (void *)MEMORY[0x24BDF8858];
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "UUIDString");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "requestWithIdentifier:content:trigger:", v21, v8, 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    AXLogUltron();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v26 = v22;
      _os_log_impl(&dword_21ACD4000, v23, OS_LOG_TYPE_INFO, "Posting local notification: %@", buf, 0xCu);
    }

    AXSDSoundDetectionNotificationCenter();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addNotificationRequest:withCompletionHandler:", v22, &__block_literal_global_27);

  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    _SoundDetectionSendNotificationForCustomDetector_cold_1(v7);
  }

}

void AXSDSoundDetectionGenerateUserNotificationForCustomDetector(void *a1, float a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;
  void *v11;
  int v12;
  id v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  objc_msgSend(MEMORY[0x24BDFF278], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "soundDetectionSnoozeDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKey:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6
    && (objc_msgSend(MEMORY[0x24BDBCE60], "date"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v6, "laterDate:", v7),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "isEqualToDate:", v6),
        v8,
        v7,
        v9))
  {
    AXLogUltron();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138412546;
      v13 = v3;
      v14 = 2112;
      v15 = v6;
      _os_log_impl(&dword_21ACD4000, v10, OS_LOG_TYPE_DEFAULT, "Not generating user notification for detection. Notifications for %@ are snoozed until %@", (uint8_t *)&v12, 0x16u);
    }
  }
  else
  {
    _SoundDetectionSendNotificationForCustomDetector(v3, a2);
    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", 30.0);
    v10 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDFF278], "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addSnoozeDateToSnoozeDictionary:forKey:", v10, v3);

  }
}

void AXSDSoundDetectionSendKShotModelReadyNotification(void *a1)
{
  id v1;
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  AXLogUltron();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    _SoundDetectionSendNotificationForCustomDetector_cold_2(v1, v2);

  objc_msgSend(MEMORY[0x24BDF8810], "soundWithAlertType:", 29);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_opt_new();
  objc_msgSend(v1, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitle:", v5);

  _accessibilitySDUISupportBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("ModelReady"), CFSTR("ModelReady"), CFSTR("SoundDetectionSupport"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v1, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringWithFormat:", v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBody:", v10);

  objc_msgSend(v4, "setCategoryIdentifier:", CFSTR("com.apple.SoundDetectionNotifications.modelReady"));
  objc_msgSend(v1, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("prefs:root=ACCESSIBILITY&path=SOUND_RECOGNITION_TITLE/Sounds/"), "stringByAppendingString:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDefaultActionURL:", v13);

  objc_msgSend(v4, "setSound:", v3);
  objc_msgSend(v4, "setInterruptionLevel:", 2);
  v14 = (void *)MEMORY[0x24BDF8858];
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "UUIDString");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "requestWithIdentifier:content:trigger:", v16, v4, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  AXLogUltron();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v21 = v17;
    _os_log_impl(&dword_21ACD4000, v18, OS_LOG_TYPE_INFO, "Posting local notification: %@", buf, 0xCu);
  }

  AXSDSoundDetectionNotificationCenter();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addNotificationRequest:withCompletionHandler:", v17, &__block_literal_global_34);

}

void AXSDSoundDetectionSendKShotModelFailedNotification(void *a1)
{
  id v1;
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  AXLogUltron();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    AXSDSoundDetectionSendKShotModelFailedNotification_cold_1();

  objc_msgSend(MEMORY[0x24BDF8810], "soundWithAlertType:", 29);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_opt_new();
  objc_msgSend(v1, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitle:", v5);

  _accessibilitySDUISupportBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("ModelFailed"), CFSTR("ModelFailed"), CFSTR("SoundDetectionSupport"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v1, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringWithFormat:", v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBody:", v10);

  objc_msgSend(v4, "setCategoryIdentifier:", CFSTR("com.apple.SoundDetectionNotifications.modelReady"));
  objc_msgSend(v1, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(CFSTR("prefs:root=ACCESSIBILITY&path=SOUND_RECOGNITION_TITLE/Sounds/"), "stringByAppendingString:", v11);
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = CFSTR("prefs:root=ACCESSIBILITY&path=SOUND_RECOGNITION_TITLE/Sounds/");
  }
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDefaultActionURL:", v13);

  objc_msgSend(v4, "setSound:", v3);
  objc_msgSend(v4, "setInterruptionLevel:", 2);
  v14 = (void *)MEMORY[0x24BDF8858];
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "UUIDString");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "requestWithIdentifier:content:trigger:", v16, v4, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  AXLogUltron();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v21 = v17;
    _os_log_impl(&dword_21ACD4000, v18, OS_LOG_TYPE_INFO, "Posting local notification: %@", buf, 0xCu);
  }

  AXSDSoundDetectionNotificationCenter();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addNotificationRequest:withCompletionHandler:", v17, &__block_literal_global_37);

}

void AXSDKShotGatherFilesAndGenerateRadarForDetector(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  _QWORD v30[12];

  v30[10] = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  objc_msgSend(v1, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(v1, "identifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("/"), "stringByAppendingString:", v3);
    v27 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(CFSTR("/var/mobile/Library/Accessibility/SoundDetectionKShot/TrainingFiles"), "stringByAppendingString:", v27);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "modelURLString");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "stringByAppendingString:", CFSTR(","));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByAppendingString:", v28);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = (void *)objc_opt_new();
    objc_msgSend(v26, "setScheme:", CFSTR("tap-to-radar"));
    objc_msgSend(v26, "setHost:", CFSTR("new"));
    v5 = (void *)MEMORY[0x24BDD1838];
    v6 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v1, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("AX Sound Recognition KShot issue with detector named: %@ with ID %@"), v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "queryItemWithName:value:", CFSTR("Title"), v9);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("Description"), CFSTR("[Add any details about what issue was happening with this detection or enrollment, did you get a model error notification etc.]"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("Classification"), CFSTR("Performance"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("Reproducibility"), CFSTR("I Didn't Try"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("ComponentName"), CFSTR("Accessibility Sound Detection"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("ComponentID"), CFSTR("1074027"));
    v24 = v1;
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("ComponentVersion"), CFSTR("All"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("Attachments"), v25);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("AutoDiagnostics"), CFSTR("log-archive-only"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("DeviceClasses"), CFSTR("iPhone,iPad"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = v23;
    v30[1] = v22;
    v30[2] = v10;
    v30[3] = v21;
    v30[4] = v11;
    v30[5] = v12;
    v30[6] = v13;
    v30[7] = v14;
    v30[8] = v15;
    v30[9] = v16;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v30, 10);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setQueryItems:", v17);

    objc_msgSend(v26, "URL");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "openURL:withOptions:", v18, 0);

    v20 = v27;
    v1 = v24;

  }
  else
  {
    AXLogUltron();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
      AXSDKShotGatherFilesAndGenerateRadarForDetector_cold_1();
  }

}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x16u);
}

void sub_21ACDE918(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45)
{
  _Block_object_dispose(&a45, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void OUTLINED_FUNCTION_0_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_3_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_4_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

void sub_21ACDFF7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_3_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_21ACE1128(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21ACE1980(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_21ACE2988(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_3(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

void sub_21ACE44EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void __getAXEventRepresentationClass_block_invoke(uint64_t a1)
{
  AccessibilityUtilitiesLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("AXEventRepresentation");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getAXEventRepresentationClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getAXEventRepresentationClass_block_invoke_cold_1();
    AccessibilityUtilitiesLibrary();
  }
}

void AccessibilityUtilitiesLibrary()
{
  void *v0;

  if (!AccessibilityUtilitiesLibraryCore_frameworkLibrary_0)
    AccessibilityUtilitiesLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  if (!AccessibilityUtilitiesLibraryCore_frameworkLibrary_0)
  {
    v0 = (void *)abort_report_np();
    free(v0);
  }
}

AXSDKShotDetector *__getAXEventTapManagerClass_block_invoke(uint64_t a1)
{
  AXSDKShotDetector *result;
  AXSDKShotDetector *v3;
  SEL v4;
  id v5;

  AccessibilityUtilitiesLibrary();
  result = (AXSDKShotDetector *)objc_getClass("AXEventTapManager");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getAXEventTapManagerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = (AXSDKShotDetector *)__getAXEventTapManagerClass_block_invoke_cold_1();
    return -[AXSDKShotDetector initWithName:](v3, v4, v5);
  }
  return result;
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

void sub_21ACE6FD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21ACE75A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  id *v19;
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_2_3(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{

}

void sub_21ACEB840(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

Class __getAXSettingsClass_block_invoke_0(uint64_t a1)
{
  Class result;
  void *v3;

  if (!AccessibilityUtilitiesLibraryCore_frameworkLibrary_1)
  {
    AccessibilityUtilitiesLibraryCore_frameworkLibrary_1 = _sl_dlopen();
    if (!AccessibilityUtilitiesLibraryCore_frameworkLibrary_1)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("AXSettings");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getAXSettingsClass_block_invoke_cold_1();
    free(v3);
  }
  getAXSettingsClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void OUTLINED_FUNCTION_0_4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_2_4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_4_1(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  NSObject *v4;
  uint8_t *v5;

  _os_log_fault_impl(a1, v4, OS_LOG_TYPE_FAULT, a4, v5, 0xCu);
}

uint64_t OUTLINED_FUNCTION_5_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 8), "count");
}

uint64_t OUTLINED_FUNCTION_7(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t OUTLINED_FUNCTION_8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "count");
}

void sub_21ACED848(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id OUTLINED_FUNCTION_0_5(id a1)
{
  return a1;
}

void OUTLINED_FUNCTION_1_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_5_3(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

uint64_t OUTLINED_FUNCTION_12()
{
  return objc_opt_class();
}

id OUTLINED_FUNCTION_5_4(id a1)
{
  return a1;
}

uint64_t OUTLINED_FUNCTION_6()
{
  return objc_opt_class();
}

id OUTLINED_FUNCTION_9_1(void *a1)
{
  return a1;
}

uint64_t OUTLINED_FUNCTION_10()
{
  return objc_opt_class();
}

id OUTLINED_FUNCTION_14(id a1)
{
  return a1;
}

uint64_t OUTLINED_FUNCTION_15()
{
  uint64_t v0;

  return v0;
}

id OUTLINED_FUNCTION_19(void *a1)
{
  return a1;
}

id sub_21ACF2D14()
{
  uint64_t v0;
  id *v1;
  id result;

  v1 = (id *)(v0 + OBJC_IVAR____TtC18AXSoundDetectionUI34AXSDNSBaseControllerImplementation_listener);
  swift_beginAccess();
  result = objc_msgSend(*v1, sel_containsListenDelegate_, v0);
  if ((_DWORD)result)
    return objc_msgSend(*v1, sel_isListening);
  return result;
}

uint64_t sub_21ACF2E24()
{
  uint64_t v0;
  id v1;
  uint64_t v2;
  uint64_t v3;

  v1 = objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC18AXSoundDetectionUI35AXSDKShotNSControllerImplementation_modelManager), sel_currentDetectors);
  v2 = sub_21AD23FAC();

  v3 = sub_21ACF79AC(v2);
  swift_bridgeObjectRelease();
  return v3;
}

void sub_21ACF2E8C(uint64_t a1)
{
  int64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  int64_t v7;
  unint64_t v8;
  unint64_t v9;
  int64_t v10;
  unint64_t v11;
  int64_t v12;
  id v13[2];

  sub_21ACF8044(0, (unint64_t *)&qword_2551182B0);
  sub_21ACF807C();
  v2 = 0;
  v13[1] = (id)sub_21AD24030();
  v3 = a1 + 64;
  v4 = 1 << *(_BYTE *)(a1 + 32);
  v5 = -1;
  if (v4 < 64)
    v5 = ~(-1 << v4);
  v6 = v5 & *(_QWORD *)(a1 + 64);
  v7 = (unint64_t)(v4 + 63) >> 6;
  while (1)
  {
    if (v6)
    {
      v8 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      v9 = v8 | (v2 << 6);
      goto LABEL_5;
    }
    v10 = v2 + 1;
    if (__OFADD__(v2, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v10 >= v7)
      goto LABEL_23;
    v11 = *(_QWORD *)(v3 + 8 * v10);
    ++v2;
    if (!v11)
    {
      v2 = v10 + 1;
      if (v10 + 1 >= v7)
        goto LABEL_23;
      v11 = *(_QWORD *)(v3 + 8 * v2);
      if (!v11)
      {
        v2 = v10 + 2;
        if (v10 + 2 >= v7)
          goto LABEL_23;
        v11 = *(_QWORD *)(v3 + 8 * v2);
        if (!v11)
        {
          v2 = v10 + 3;
          if (v10 + 3 >= v7)
            goto LABEL_23;
          v11 = *(_QWORD *)(v3 + 8 * v2);
          if (!v11)
            break;
        }
      }
    }
LABEL_22:
    v6 = (v11 - 1) & v11;
    v9 = __clz(__rbit64(v11)) + (v2 << 6);
LABEL_5:
    sub_21ACF60A0(v13, *(id *)(*(_QWORD *)(a1 + 48) + 8 * v9));

  }
  v12 = v10 + 4;
  if (v12 >= v7)
  {
LABEL_23:
    swift_release();
    return;
  }
  v11 = *(_QWORD *)(v3 + 8 * v12);
  if (v11)
  {
    v2 = v12;
    goto LABEL_22;
  }
  while (1)
  {
    v2 = v12 + 1;
    if (__OFADD__(v12, 1))
      break;
    if (v2 >= v7)
      goto LABEL_23;
    v11 = *(_QWORD *)(v3 + 8 * v2);
    ++v12;
    if (v11)
      goto LABEL_22;
  }
LABEL_25:
  __break(1u);
}

id sub_21ACF3028()
{
  id v0;
  objc_class *v1;
  char *v2;
  id v3;
  uint64_t inited;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  id v9;
  objc_super v11;

  v0 = objc_msgSend(objc_allocWithZone((Class)AXSDKShotModelManager), sel_init);
  v1 = (objc_class *)type metadata accessor for AXSDKShotNSControllerImplementation();
  v2 = (char *)objc_allocWithZone(v1);
  *(_QWORD *)&v2[OBJC_IVAR____TtC18AXSoundDetectionUI35AXSDKShotNSControllerImplementation_modelManager] = v0;
  type metadata accessor for AXSDKShotMonitor();
  v3 = v0;
  inited = swift_initStaticObject();
  if (qword_2551178E0 != -1)
    swift_once();
  v5 = sub_21AD23EEC();
  __swift_project_value_buffer(v5, (uint64_t)qword_2551180B8);
  v6 = sub_21AD23EE0();
  v7 = sub_21AD2406C();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_21ACD4000, v6, v7, "AXSDKShotMonitor: Start Monitoring", v8, 2u);
    MEMORY[0x220756ED0](v8, -1, -1);
  }

  *(_QWORD *)(inited + 16) = sub_21AD0B9A8();
  swift_release();
  v11.receiver = v2;
  v11.super_class = v1;
  v9 = objc_msgSendSuper2(&v11, sel_init);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  objc_msgSend(v3, sel_setDelegate_, v9);

  return v9;
}

id AXSDKShotNSControllerImplementation.__allocating_init(modelManager:)(void *a1)
{
  objc_class *v1;
  objc_class *v2;
  char *v4;
  id v5;
  uint64_t inited;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  id v11;
  objc_super v13;

  v2 = v1;
  v4 = (char *)objc_allocWithZone(v2);
  *(_QWORD *)&v4[OBJC_IVAR____TtC18AXSoundDetectionUI35AXSDKShotNSControllerImplementation_modelManager] = a1;
  type metadata accessor for AXSDKShotMonitor();
  v5 = a1;
  inited = swift_initStaticObject();
  if (qword_2551178E0 != -1)
    swift_once();
  v7 = sub_21AD23EEC();
  __swift_project_value_buffer(v7, (uint64_t)qword_2551180B8);
  v8 = sub_21AD23EE0();
  v9 = sub_21AD2406C();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_21ACD4000, v8, v9, "AXSDKShotMonitor: Start Monitoring", v10, 2u);
    MEMORY[0x220756ED0](v10, -1, -1);
  }

  *(_QWORD *)(inited + 16) = sub_21AD0B9A8();
  swift_release();
  v13.receiver = v4;
  v13.super_class = v2;
  v11 = objc_msgSendSuper2(&v13, sel_init);

  return v11;
}

id AXSDKShotNSControllerImplementation.init(modelManager:)(void *a1)
{
  char *v1;
  char *v2;
  id v4;
  uint64_t inited;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  id v10;
  objc_super v12;

  v2 = v1;
  *(_QWORD *)&v2[OBJC_IVAR____TtC18AXSoundDetectionUI35AXSDKShotNSControllerImplementation_modelManager] = a1;
  type metadata accessor for AXSDKShotMonitor();
  v4 = a1;
  inited = swift_initStaticObject();
  if (qword_2551178E0 != -1)
    swift_once();
  v6 = sub_21AD23EEC();
  __swift_project_value_buffer(v6, (uint64_t)qword_2551180B8);
  v7 = sub_21AD23EE0();
  v8 = sub_21AD2406C();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_21ACD4000, v7, v8, "AXSDKShotMonitor: Start Monitoring", v9, 2u);
    MEMORY[0x220756ED0](v9, -1, -1);
  }

  *(_QWORD *)(inited + 16) = sub_21AD0B9A8();
  swift_release();
  v12.receiver = v2;
  v12.super_class = (Class)type metadata accessor for AXSDKShotNSControllerImplementation();
  v10 = objc_msgSendSuper2(&v12, sel_init);

  return v10;
}

void sub_21ACF34B4()
{
  uint64_t v0;

}

id AXSDKShotNSControllerImplementation.__deallocating_deinit()
{
  void *v0;
  void *v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  objc_super v7;

  v1 = v0;
  if (qword_2551178E0 != -1)
    swift_once();
  v2 = sub_21AD23EEC();
  __swift_project_value_buffer(v2, (uint64_t)qword_2551180B8);
  v3 = sub_21AD23EE0();
  v4 = sub_21AD2406C();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_21ACD4000, v3, v4, "AXSDKShotMonitor: Stop Monitoring", v5, 2u);
    MEMORY[0x220756ED0](v5, -1, -1);
  }

  if (qword_255117910)
  {
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255117930);
    sub_21AD2400C();
    swift_task_isCancelled();
    swift_release();
  }
  v7.receiver = v1;
  v7.super_class = (Class)type metadata accessor for AXSDKShotNSControllerImplementation();
  return objc_msgSendSuper2(&v7, sel_dealloc);
}

void sub_21ACF367C()
{
  char *v0;
  id *v1;
  uint64_t v2;
  char *v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;
  char *v8;
  id v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  char *v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  uint64_t v18;
  char *v19;
  id v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;

  v1 = (id *)&v0[OBJC_IVAR____TtC18AXSoundDetectionUI34AXSDNSBaseControllerImplementation_listener];
  swift_beginAccess();
  if (objc_msgSend(*v1, sel_containsListenDelegate_, v0)
    && (objc_msgSend(*v1, sel_isListening) & 1) != 0)
  {
    if (qword_2551178E8 != -1)
      swift_once();
    v2 = sub_21AD23EEC();
    __swift_project_value_buffer(v2, (uint64_t)qword_2551180D0);
    v3 = v0;
    v4 = sub_21AD23EE0();
    v5 = sub_21AD2406C();
    if (os_log_type_enabled(v4, v5))
    {
      v6 = (uint8_t *)swift_slowAlloc();
      v7 = swift_slowAlloc();
      v24 = v7;
      *(_DWORD *)v6 = 136315138;
      v8 = v3;
      v9 = objc_msgSend(v8, sel_description);
      v10 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
      v12 = v11;

      sub_21ACF58B4(v10, v12, &v24);
      sub_21AD240CC();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_21ACD4000, v4, v5, "[%s]: custom sound recognition is already listening.", v6, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x220756ED0](v7, -1, -1);
      MEMORY[0x220756ED0](v6, -1, -1);

    }
    else
    {

    }
  }
  else
  {
    if (qword_2551178E8 != -1)
      swift_once();
    v13 = sub_21AD23EEC();
    __swift_project_value_buffer(v13, (uint64_t)qword_2551180D0);
    v14 = v0;
    v15 = sub_21AD23EE0();
    v16 = sub_21AD2406C();
    if (os_log_type_enabled(v15, v16))
    {
      v17 = (uint8_t *)swift_slowAlloc();
      v18 = swift_slowAlloc();
      v24 = v18;
      *(_DWORD *)v17 = 136315138;
      v19 = v14;
      v20 = objc_msgSend(v19, sel_description);
      v21 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
      v23 = v22;

      sub_21ACF58B4(v21, v23, &v24);
      sub_21AD240CC();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_21ACD4000, v15, v16, "[%s]: will start listening", v17, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x220756ED0](v18, -1, -1);
      MEMORY[0x220756ED0](v17, -1, -1);

    }
    else
    {

    }
    sub_21ACF7380(v14, v14, (uint64_t)&unk_24DDF74C8, (uint64_t)sub_21ACF812C, (uint64_t)&block_descriptor_40);
  }
}

void sub_21ACF3A84()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  id *v9;
  uint64_t v10;
  char *v11;
  NSObject *v12;
  os_log_type_t v13;
  int v14;
  uint8_t *v15;
  char *v16;
  char *v17;
  id v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint8_t *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  NSObject *v26;
  os_log_type_t v27;
  uint8_t *v28;
  uint64_t v29;
  char *v30;
  id v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  char *v38;
  _QWORD v39[2];
  uint8_t *v40;
  uint64_t v41;
  int v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t aBlock[6];
  uint64_t v47;

  v1 = sub_21AD23F04();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8]();
  v4 = (char *)v39 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_21AD23F1C();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = (id *)&v0[OBJC_IVAR____TtC18AXSoundDetectionUI34AXSDNSBaseControllerImplementation_listener];
  swift_beginAccess();
  if (objc_msgSend(*v9, sel_containsListenDelegate_, v0)
    && objc_msgSend(*v9, sel_isListening))
  {
    if (qword_2551178E8 != -1)
      swift_once();
    v10 = sub_21AD23EEC();
    __swift_project_value_buffer(v10, (uint64_t)qword_2551180D0);
    v11 = v0;
    v12 = sub_21AD23EE0();
    v13 = sub_21AD2406C();
    v14 = v13;
    if (os_log_type_enabled(v12, v13))
    {
      v42 = v14;
      v15 = (uint8_t *)swift_slowAlloc();
      v41 = swift_slowAlloc();
      aBlock[0] = v41;
      v44 = v5;
      *(_DWORD *)v15 = 136315138;
      v39[1] = v15 + 4;
      v40 = v15;
      v16 = v11;
      v45 = v2;
      v17 = v16;
      v18 = objc_msgSend(v16, sel_description);
      v19 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
      v43 = v11;
      v21 = v20;

      v47 = sub_21ACF58B4(v19, v21, aBlock);
      v5 = v44;
      sub_21AD240CC();

      v2 = v45;
      v11 = v43;
      swift_bridgeObjectRelease();
      v22 = v40;
      _os_log_impl(&dword_21ACD4000, v12, (os_log_type_t)v42, "[%s]: will stop listening", v40, 0xCu);
      v23 = v41;
      swift_arrayDestroy();
      MEMORY[0x220756ED0](v23, -1, -1);
      MEMORY[0x220756ED0](v22, -1, -1);

    }
    else
    {

    }
    sub_21ACF8044(0, (unint64_t *)&qword_255117BD0);
    v35 = (void *)sub_21AD24090();
    v36 = swift_allocObject();
    *(_QWORD *)(v36 + 16) = v11;
    aBlock[4] = (uint64_t)sub_21ACF7ADC;
    aBlock[5] = v36;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_21ACF4004;
    aBlock[3] = (uint64_t)&block_descriptor;
    v37 = _Block_copy(aBlock);
    v38 = v11;
    swift_release();
    sub_21AD23F10();
    aBlock[0] = MEMORY[0x24BEE4AF8];
    sub_21ACF7DA4((unint64_t *)&qword_255117940, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255118240);
    sub_21ACF7B30();
    sub_21AD240E4();
    MEMORY[0x220756504](0, v8, v4, v37);
    _Block_release(v37);

    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  else
  {
    if (qword_2551178E8 != -1)
      swift_once();
    v24 = sub_21AD23EEC();
    __swift_project_value_buffer(v24, (uint64_t)qword_2551180D0);
    v25 = v0;
    v26 = sub_21AD23EE0();
    v27 = sub_21AD2406C();
    if (os_log_type_enabled(v26, v27))
    {
      v28 = (uint8_t *)swift_slowAlloc();
      v29 = swift_slowAlloc();
      aBlock[0] = v29;
      *(_DWORD *)v28 = 136315138;
      v30 = v25;
      v31 = objc_msgSend(v30, sel_description);
      v32 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
      v34 = v33;

      v47 = sub_21ACF58B4(v32, v34, aBlock);
      sub_21AD240CC();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_21ACD4000, v26, v27, "[%s]: custom sound recognition is already stopped.", v28, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x220756ED0](v29, -1, -1);
      MEMORY[0x220756ED0](v28, -1, -1);

    }
    else
    {

    }
  }
}

uint64_t sub_21ACF4004(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

id sub_21ACF4064(uint64_t a1)
{
  uint64_t v1;

  return objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC18AXSoundDetectionUI35AXSDKShotNSControllerImplementation_modelManager), sel_addCustomDetector_, a1);
}

id sub_21ACF4098(uint64_t a1)
{
  uint64_t v1;

  return objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC18AXSoundDetectionUI35AXSDKShotNSControllerImplementation_modelManager), sel_removeCustomDetector_, a1);
}

uint64_t sub_21ACF40CC()
{
  void *v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t);
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v14;
  uint64_t v15;
  _QWORD aBlock[6];

  v1 = sub_21AD23F04();
  v2 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458];
  v15 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8]();
  v4 = (char *)&v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_21AD23F1C();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21ACF8044(0, (unint64_t *)&qword_255117BD0);
  v9 = (void *)sub_21AD24090();
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = v0;
  aBlock[4] = sub_21ACF7BC0;
  aBlock[5] = v10;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_21ACF4004;
  aBlock[3] = &block_descriptor_6;
  v11 = _Block_copy(aBlock);
  v12 = v0;
  swift_release();
  sub_21AD23F10();
  aBlock[0] = MEMORY[0x24BEE4AF8];
  sub_21ACF7DA4((unint64_t *)&qword_255117940, v2, MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255118240);
  sub_21ACF7B30();
  sub_21AD240E4();
  MEMORY[0x220756504](0, v8, v4, v11);
  _Block_release(v11);

  (*(void (**)(char *, uint64_t))(v15 + 8))(v4, v1);
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

Swift::Void __swiftcall AXSDKShotNSControllerImplementation.listenEngineDidStart(withInputFormat:)(AVAudioFormat_optional *withInputFormat)
{
  void *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  AVAudioFormat_optional *v11;
  uint64_t v12;
  id v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  AVAudioFormat_optional *v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint8_t *v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  NSObject *v31;
  os_log_type_t v32;
  uint8_t *v33;
  uint64_t v34;
  id v35;
  id v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  AVAudioFormat_optional *v43;
  id v44;
  char *v45;
  _QWORD v46[2];
  uint8_t *v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  uint8_t *v53;
  uint64_t aBlock[6];
  uint64_t v55;

  v3 = sub_21AD23F04();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)v46 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_21AD23F1C();
  v52 = *(_QWORD *)(v7 - 8);
  v53 = (uint8_t *)v7;
  MEMORY[0x24BDAC7A8]();
  v9 = (char *)v46 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (withInputFormat)
  {
    v51 = v9;
    v10 = qword_2551178E8;
    v11 = withInputFormat;
    if (v10 != -1)
      swift_once();
    v12 = sub_21AD23EEC();
    __swift_project_value_buffer(v12, (uint64_t)qword_2551180D0);
    v13 = v1;
    v14 = sub_21AD23EE0();
    v15 = sub_21AD2406C();
    if (os_log_type_enabled(v14, v15))
    {
      v16 = (uint8_t *)swift_slowAlloc();
      v48 = swift_slowAlloc();
      aBlock[0] = v48;
      *(_DWORD *)v16 = 136315138;
      v46[1] = v16 + 4;
      v47 = v16;
      v17 = v13;
      v50 = v4;
      v18 = v17;
      v19 = objc_msgSend(v17, sel_description);
      v20 = v13;
      v21 = v11;
      v22 = v3;
      v23 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
      v49 = v6;
      v25 = v24;

      v26 = v23;
      v3 = v22;
      v11 = v21;
      v13 = v20;
      v55 = sub_21ACF58B4(v26, v25, aBlock);
      sub_21AD240CC();

      v6 = v49;
      v4 = v50;
      swift_bridgeObjectRelease();
      v27 = v47;
      _os_log_impl(&dword_21ACD4000, v14, v15, "[%s]: listen engine did start", v47, 0xCu);
      v28 = v48;
      swift_arrayDestroy();
      MEMORY[0x220756ED0](v28, -1, -1);
      MEMORY[0x220756ED0](v27, -1, -1);

    }
    else
    {

    }
    sub_21ACF8044(0, (unint64_t *)&qword_255117BD0);
    v40 = (void *)sub_21AD24090();
    v41 = swift_allocObject();
    *(_QWORD *)(v41 + 16) = v13;
    *(_QWORD *)(v41 + 24) = v11;
    aBlock[4] = (uint64_t)sub_21ACF7C08;
    aBlock[5] = v41;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_21ACF4004;
    aBlock[3] = (uint64_t)&block_descriptor_12;
    v42 = _Block_copy(aBlock);
    v43 = v11;
    v44 = v13;
    swift_release();
    v45 = v51;
    sub_21AD23F10();
    aBlock[0] = MEMORY[0x24BEE4AF8];
    sub_21ACF7DA4((unint64_t *)&qword_255117940, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255118240);
    sub_21ACF7B30();
    sub_21AD240E4();
    MEMORY[0x220756504](0, v45, v6, v42);
    _Block_release(v42);

    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    (*(void (**)(char *, uint8_t *))(v52 + 8))(v45, v53);
  }
  else
  {
    if (qword_2551178E8 != -1)
      swift_once();
    v29 = sub_21AD23EEC();
    __swift_project_value_buffer(v29, (uint64_t)qword_2551180D0);
    v30 = v1;
    v31 = sub_21AD23EE0();
    v32 = sub_21AD24060();
    if (os_log_type_enabled(v31, v32))
    {
      v33 = (uint8_t *)swift_slowAlloc();
      v34 = swift_slowAlloc();
      *(_DWORD *)v33 = 136315138;
      v53 = v33 + 4;
      aBlock[0] = v34;
      v35 = v30;
      v36 = objc_msgSend(v35, sel_description);
      v37 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
      v39 = v38;

      v55 = sub_21ACF58B4(v37, v39, aBlock);
      sub_21AD240CC();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_21ACD4000, v31, v32, "[%s]: Listen Engine did not return an audio format. This should NOT happen; bailing. File a radar!",
        v33,
        0xCu);
      swift_arrayDestroy();
      MEMORY[0x220756ED0](v34, -1, -1);
      MEMORY[0x220756ED0](v33, -1, -1);

    }
    else
    {

    }
    sub_21ACF3A84();
  }
}

Swift::Void __swiftcall AXSDKShotNSControllerImplementation.receivedBuffer(_:at:)(AVAudioPCMBuffer _, AVAudioTime *at)
{
  uint64_t v2;

  objc_msgSend(*(id *)(v2 + OBJC_IVAR____TtC18AXSoundDetectionUI35AXSDKShotNSControllerImplementation_modelManager), sel_processAudioBuffer_atTime_, _.super.super.isa, _.super._impl);
}

void AXSDKShotNSControllerImplementation.listenEngineFailedToStartWithError(_:)(void *a1)
{
  void *v1;
  uint64_t v3;
  id v4;
  id v5;
  id v6;
  id v7;
  os_log_type_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  id v12;
  id v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  id v17;
  NSObject *oslog;
  uint64_t v19;
  uint64_t v20;

  if (qword_2551178E8 != -1)
    swift_once();
  v3 = sub_21AD23EEC();
  __swift_project_value_buffer(v3, (uint64_t)qword_2551180D0);
  v4 = v1;
  v5 = a1;
  v6 = v4;
  v7 = a1;
  oslog = sub_21AD23EE0();
  v8 = sub_21AD24060();
  if (os_log_type_enabled(oslog, v8))
  {
    v9 = swift_slowAlloc();
    v10 = (_QWORD *)swift_slowAlloc();
    v11 = swift_slowAlloc();
    v20 = v11;
    *(_DWORD *)v9 = 136315394;
    v12 = v6;
    v13 = objc_msgSend(v12, sel_description);
    v14 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
    v16 = v15;

    sub_21ACF58B4(v14, v16, &v20);
    sub_21AD240CC();

    swift_bridgeObjectRelease();
    *(_WORD *)(v9 + 12) = 2112;
    v17 = a1;
    v19 = _swift_stdlib_bridgeErrorToNSError();
    sub_21AD240CC();
    *v10 = v19;

    _os_log_impl(&dword_21ACD4000, oslog, v8, "[%s]: listen engine failed to start with error: %@", (uint8_t *)v9, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_255117958);
    swift_arrayDestroy();
    MEMORY[0x220756ED0](v10, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x220756ED0](v11, -1, -1);
    MEMORY[0x220756ED0](v9, -1, -1);

  }
  else
  {

  }
}

Swift::Void __swiftcall AXSDKShotNSControllerImplementation.receivedObservation(_:forDetector:)(SNClassificationResult _, SNClassifySoundRequest forDetector)
{
  uint64_t v2;
  uint64_t isa;
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v14;
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  id v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  __int128 v24;
  __int128 v25;

  isa = (uint64_t)_.super.isa;
  v5 = -[objc_class classifications](_.super.isa, sel_classifications);
  sub_21ACF8044(0, &qword_255117960);
  v6 = sub_21AD23FAC();

  if ((v6 & 0xC000000000000001) != 0)
  {
    v7 = (id)MEMORY[0x2207565F4](0, v6);
  }
  else
  {
    if (!*(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      goto LABEL_23;
    }
    v7 = *(id *)(v6 + 32);
  }
  v8 = v7;
  swift_bridgeObjectRelease();
  v9 = objc_msgSend(v8, sel_identifier);

  v10 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
  v12 = v11;

  if (v10 == 49 && v12 == 0xE100000000000000)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    v14 = sub_21AD2427C();
    swift_bridgeObjectRelease();
    if ((v14 & 1) == 0)
      return;
  }
  v15 = objc_msgSend(*(id *)(v2 + OBJC_IVAR____TtC18AXSoundDetectionUI35AXSDKShotNSControllerImplementation_modelManager), sel_currentRequests);
  v16 = objc_msgSend(v15, sel_allKeysForObject_, forDetector.super.isa);

  v17 = sub_21AD23FAC();
  if (!*(_QWORD *)(v17 + 16))
  {
    v24 = 0u;
    v25 = 0u;
    swift_bridgeObjectRelease();
    goto LABEL_19;
  }
  sub_21ACF7C24(v17 + 32, (uint64_t)&v24);
  swift_bridgeObjectRelease();
  if (!*((_QWORD *)&v25 + 1))
  {
LABEL_19:
    sub_21ACF7C60((uint64_t)&v24);
    return;
  }
  if ((swift_dynamicCast() & 1) != 0)
  {
    v18 = objc_msgSend((id)isa, sel_classifications);
    isa = sub_21AD23FAC();

    if ((isa & 0xC000000000000001) == 0)
    {
      if (!*(_QWORD *)((isa & 0xFFFFFFFFFFFFF8) + 0x10))
      {
        __break(1u);
        return;
      }
      v19 = *(id *)(isa + 32);
LABEL_17:
      v20 = v19;
      swift_bridgeObjectRelease();
      objc_msgSend(v20, sel_confidence);
      v22 = v21;

      v23 = (void *)sub_21AD23F4C();
      swift_bridgeObjectRelease();
      *(float *)&v22 = v22;
      AXSDSoundDetectionGenerateUserNotificationForCustomDetector(v23, *(float *)&v22);

      return;
    }
LABEL_23:
    v19 = (id)MEMORY[0x2207565F4](0, isa);
    goto LABEL_17;
  }
}

Swift::Void __swiftcall AXSDKShotNSControllerImplementation.receivedCompletion(_:)(SNClassifySoundRequest a1)
{
  void *v1;
  uint64_t v3;
  id v4;
  objc_class *v5;
  objc_class *v6;
  NSObject *v7;
  os_log_type_t v8;
  uint64_t v9;
  _QWORD *v10;
  id v11;
  id v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  objc_class *v16;
  uint64_t v17;
  id v18;
  uint64_t v19;

  if (qword_2551178E8 != -1)
    swift_once();
  v3 = sub_21AD23EEC();
  __swift_project_value_buffer(v3, (uint64_t)qword_2551180D0);
  v4 = v1;
  v5 = a1.super.isa;
  v18 = v4;
  v6 = v5;
  v7 = sub_21AD23EE0();
  v8 = sub_21AD2406C();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = swift_slowAlloc();
    v10 = (_QWORD *)swift_slowAlloc();
    v17 = swift_slowAlloc();
    v19 = v17;
    *(_DWORD *)v9 = 136315394;
    v11 = v18;
    v12 = objc_msgSend(v11, sel_description);
    v13 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
    v15 = v14;

    sub_21ACF58B4(v13, v15, &v19);
    sub_21AD240CC();

    swift_bridgeObjectRelease();
    *(_WORD *)(v9 + 12) = 2112;
    v16 = v6;
    sub_21AD240CC();
    *v10 = v6;

    _os_log_impl(&dword_21ACD4000, v7, v8, "[%s]: received completion for: %@", (uint8_t *)v9, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_255117958);
    swift_arrayDestroy();
    MEMORY[0x220756ED0](v10, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x220756ED0](v17, -1, -1);
    MEMORY[0x220756ED0](v9, -1, -1);

  }
  else
  {

  }
}

void AXSDKShotNSControllerImplementation.receivedError(_:fromDetector:)(void *a1, void *a2)
{
  void *v2;
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  os_log_type_t v12;
  uint64_t v13;
  _QWORD *v14;
  id v15;
  id v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  id v20;
  id v21;
  uint64_t v22;
  NSObject *oslog;
  uint64_t v24;
  uint64_t v25;

  if (qword_2551178E8 != -1)
    swift_once();
  v5 = sub_21AD23EEC();
  __swift_project_value_buffer(v5, (uint64_t)qword_2551180D0);
  v6 = v2;
  v7 = a2;
  v8 = a1;
  v9 = v6;
  v10 = v7;
  v11 = a1;
  oslog = sub_21AD23EE0();
  v12 = sub_21AD24060();
  if (os_log_type_enabled(oslog, v12))
  {
    v13 = swift_slowAlloc();
    v14 = (_QWORD *)swift_slowAlloc();
    v22 = swift_slowAlloc();
    v25 = v22;
    *(_DWORD *)v13 = 136315650;
    v15 = v9;
    v16 = objc_msgSend(v15, sel_description);
    v17 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
    v19 = v18;

    sub_21ACF58B4(v17, v19, &v25);
    sub_21AD240CC();

    swift_bridgeObjectRelease();
    *(_WORD *)(v13 + 12) = 2112;
    v20 = v10;
    sub_21AD240CC();
    *v14 = v10;

    *(_WORD *)(v13 + 22) = 2112;
    v21 = a1;
    v24 = _swift_stdlib_bridgeErrorToNSError();
    sub_21AD240CC();
    v14[1] = v24;

    _os_log_impl(&dword_21ACD4000, oslog, v12, "[%s]: received error during detection of detector: %@. error: %@", (uint8_t *)v13, 0x20u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_255117958);
    swift_arrayDestroy();
    MEMORY[0x220756ED0](v14, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x220756ED0](v22, -1, -1);
    MEMORY[0x220756ED0](v13, -1, -1);

  }
  else
  {

  }
}

uint64_t sub_21ACF5508(uint64_t a1, uint64_t a2)
{
  return sub_21ACF56D8(a1, a2, (uint64_t (*)(uint64_t))MEMORY[0x24BDCF9E0]);
}

uint64_t sub_21ACF5514(uint64_t a1, id *a2)
{
  uint64_t result;

  result = sub_21AD23F58();
  *a2 = 0;
  return result;
}

uint64_t sub_21ACF5588(uint64_t a1, id *a2)
{
  char v3;

  v3 = sub_21AD23F64();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_21ACF5604@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
  v2 = sub_21AD23F4C();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_21ACF5644()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;

  v0 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
  v2 = v1;
  if (v0 == _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0() && v2 == v3)
    v5 = 1;
  else
    v5 = sub_21AD2427C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_21ACF56CC(uint64_t a1, uint64_t a2)
{
  return sub_21ACF56D8(a1, a2, MEMORY[0x24BEE0CD8]);
}

uint64_t sub_21ACF56D8(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4;
  uint64_t v5;

  v4 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
  v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_21ACF5714()
{
  _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
  sub_21AD23F88();
  return swift_bridgeObjectRelease();
}

uint64_t sub_21ACF5754()
{
  uint64_t v0;

  _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
  sub_21AD242E8();
  sub_21AD23F88();
  v0 = sub_21AD24300();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_21ACF57C4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_21AD23F4C();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_21ACF5808@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_21ACF5830()
{
  sub_21ACF7DA4(&qword_255118260, (uint64_t (*)(uint64_t))type metadata accessor for AXSDSoundDetectionType, (uint64_t)&unk_21AD26EC0);
  sub_21ACF7DA4(&qword_255117A20, (uint64_t (*)(uint64_t))type metadata accessor for AXSDSoundDetectionType, (uint64_t)&unk_21AD26E14);
  return sub_21AD24258();
}

uint64_t sub_21ACF58B4(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_21ACF5984(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_21ACF7C24((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = MEMORY[0x24BEE2520];
    v12[0] = a1;
    v12[1] = a2;
    v10 = *a3;
    if (*a3)
    {
      sub_21ACF7C24((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_21ACF5984(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  uint64_t v8;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  _QWORD __src[2];

  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (_QWORD *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            sub_21AD240D8();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_21ACF5B3C(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0)
    goto LABEL_13;
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  v8 = sub_21AD241A4();
  if (!v8)
  {
    sub_21AD24210();
    __break(1u);
LABEL_17:
    result = sub_21AD2424C();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0)
    return 0;
  else
    return swift_unknownObjectRetain();
}

uint64_t sub_21ACF5B3C(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_21ACF5BD0(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_21ACF5DA8(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_21ACF5DA8(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_21ACF5BD0(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  char v6;
  uint64_t result;

  if ((a2 & 0x1000000000000000) != 0)
    goto LABEL_10;
  if ((a2 & 0x2000000000000000) != 0)
    v2 = HIBYTE(a2) & 0xF;
  else
    v2 = a1 & 0xFFFFFFFFFFFFLL;
  if (v2)
  {
    while (1)
    {
      v3 = sub_21ACF5D44(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_21AD24180();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_21AD24210();
      __break(1u);
LABEL_10:
      v2 = sub_21AD23F94();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_21AD2424C();
    __break(1u);
LABEL_14:
    result = sub_21AD24210();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_21ACF5D44(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  size_t v5;

  if (a2 <= a1)
    v2 = a1;
  else
    v2 = a2;
  if (!v2)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_255117A50);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_21ACF5DA8(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_255117A50);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[v8])
      memmove(v12, v13, v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  result = sub_21AD2424C();
  __break(1u);
  return result;
}

uint64_t sub_21ACF5EF4(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  BOOL v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v17;
  _QWORD *v18;
  BOOL v19;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v21;

  v7 = *v3;
  sub_21AD242E8();
  swift_bridgeObjectRetain();
  sub_21AD23F88();
  v8 = sub_21AD24300();
  v9 = -1 << *(_BYTE *)(v7 + 32);
  v10 = v8 & ~v9;
  if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0)
  {
    v11 = *(_QWORD *)(v7 + 48);
    v12 = (_QWORD *)(v11 + 16 * v10);
    v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_21AD2427C() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v14 = (uint64_t *)(*(_QWORD *)(*v3 + 48) + 16 * v10);
      v15 = v14[1];
      *a1 = *v14;
      a1[1] = v15;
      swift_bridgeObjectRetain();
      return 0;
    }
    v17 = ~v9;
    while (1)
    {
      v10 = (v10 + 1) & v17;
      if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) == 0)
        break;
      v18 = (_QWORD *)(v11 + 16 * v10);
      v19 = *v18 == a2 && v18[1] == a3;
      if (v19 || (sub_21AD2427C() & 1) != 0)
        goto LABEL_7;
    }
  }
  swift_bridgeObjectRelease();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v21 = *v3;
  *v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_21ACF65E4(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_21ACF60A0(_QWORD *a1, void *a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  id v14;
  char v15;
  uint64_t v16;
  id v17;
  char v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  char isUniquelyReferenced_nonNull_native;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v3 = v2;
  v6 = *v2;
  if ((*v2 & 0xC000000000000001) != 0)
  {
    if (v6 < 0)
      v7 = *v2;
    else
      v7 = v6 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain();
    v8 = a2;
    v9 = sub_21AD24120();

    if (v9)
    {
      swift_bridgeObjectRelease();

      sub_21ACF8044(0, (unint64_t *)&qword_2551182B0);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      *a1 = v26;
      swift_unknownObjectRelease();
      return 0;
    }
    result = sub_21AD24114();
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    v21 = sub_21AD15118(v7, result + 1);
    v27 = v21;
    if (*(_QWORD *)(v21 + 24) <= *(_QWORD *)(v21 + 16))
    {
      v25 = v8;
      sub_21AD155D8();
      v22 = v27;
    }
    else
    {
      v22 = v21;
      v23 = v8;
    }
    sub_21ACF6564((uint64_t)v8, v22);
    *v3 = v22;
  }
  else
  {
    swift_bridgeObjectRetain();
    v11 = sub_21AD240B4();
    v12 = -1 << *(_BYTE *)(v6 + 32);
    v13 = v11 & ~v12;
    if (((*(_QWORD *)(v6 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFF8)) >> v13) & 1) != 0)
    {
      sub_21ACF8044(0, (unint64_t *)&qword_2551182B0);
      v14 = *(id *)(*(_QWORD *)(v6 + 48) + 8 * v13);
      v15 = sub_21AD240C0();

      if ((v15 & 1) != 0)
      {
LABEL_12:

        swift_bridgeObjectRelease();
        v19 = *(void **)(*(_QWORD *)(*v2 + 48) + 8 * v13);
        *a1 = v19;
        v20 = v19;
        return 0;
      }
      v16 = ~v12;
      while (1)
      {
        v13 = (v13 + 1) & v16;
        if (((*(_QWORD *)(v6 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFF8)) >> v13) & 1) == 0)
          break;
        v17 = *(id *)(*(_QWORD *)(v6 + 48) + 8 * v13);
        v18 = sub_21AD240C0();

        if ((v18 & 1) != 0)
          goto LABEL_12;
      }
    }
    swift_bridgeObjectRelease();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v28 = *v2;
    *v2 = 0x8000000000000000;
    v8 = a2;
    sub_21ACF677C((uint64_t)v8, v13, isUniquelyReferenced_nonNull_native);
    *v2 = v28;
  }
  swift_bridgeObjectRelease();
  *a1 = v8;
  return 1;
}

uint64_t sub_21ACF633C(_QWORD *a1, void *a2)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v22;
  char isUniquelyReferenced_nonNull_native;
  id v24;
  void *v26;
  id v27;
  uint64_t v28;

  v3 = v2;
  v6 = *v2;
  _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
  sub_21AD242E8();
  swift_bridgeObjectRetain();
  sub_21AD23F88();
  v7 = sub_21AD24300();
  swift_bridgeObjectRelease();
  v8 = -1 << *(_BYTE *)(v6 + 32);
  v9 = v7 & ~v8;
  if (((*(_QWORD *)(v6 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFF8)) >> v9) & 1) == 0)
  {
LABEL_15:
    swift_bridgeObjectRelease();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v28 = *v3;
    *v3 = 0x8000000000000000;
    v24 = a2;
    sub_21ACF6900((uint64_t)v24, v9, isUniquelyReferenced_nonNull_native);
    *v3 = v28;
    swift_bridgeObjectRelease();
    *a1 = v24;
    return 1;
  }
  v10 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
  v12 = v11;
  if (v10 == _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0() && v12 == v13)
  {
LABEL_16:
    swift_bridgeObjectRelease_n();
  }
  else
  {
    v15 = sub_21AD2427C();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v15 & 1) == 0)
    {
      v16 = ~v8;
      do
      {
        v9 = (v9 + 1) & v16;
        if (((*(_QWORD *)(v6 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFF8)) >> v9) & 1) == 0)
          goto LABEL_15;
        v17 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
        v19 = v18;
        if (v17 == _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0() && v19 == v20)
          goto LABEL_16;
        v22 = sub_21AD2427C();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      while ((v22 & 1) == 0);
    }
  }

  swift_bridgeObjectRelease();
  v26 = *(void **)(*(_QWORD *)(*v3 + 48) + 8 * v9);
  *a1 = v26;
  v27 = v26;
  return 0;
}

unint64_t sub_21ACF6564(uint64_t a1, uint64_t a2)
{
  unint64_t result;

  sub_21AD240B4();
  result = sub_21AD240FC();
  *(_QWORD *)(a2 + 56 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
  *(_QWORD *)(*(_QWORD *)(a2 + 48) + 8 * result) = a1;
  ++*(_QWORD *)(a2 + 16);
  return result;
}

uint64_t sub_21ACF65E4(uint64_t result, uint64_t a2, unint64_t a3, char a4)
{
  uint64_t *v4;
  uint64_t *v5;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  BOOL v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;

  v5 = v4;
  v8 = result;
  v9 = *(_QWORD *)(*v4 + 16);
  v10 = *(_QWORD *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0)
    goto LABEL_22;
  if ((a4 & 1) != 0)
  {
    sub_21AD152FC();
  }
  else
  {
    if (v10 > v9)
    {
      result = (uint64_t)sub_21AD15B84();
      goto LABEL_22;
    }
    sub_21ACF6B2C();
  }
  v11 = *v4;
  sub_21AD242E8();
  sub_21AD23F88();
  result = sub_21AD24300();
  v12 = -1 << *(_BYTE *)(v11 + 32);
  a3 = result & ~v12;
  v13 = v11 + 56;
  if (((*(_QWORD *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) != 0)
  {
    v14 = *(_QWORD *)(v11 + 48);
    v15 = (_QWORD *)(v14 + 16 * a3);
    v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (result = sub_21AD2427C(), (result & 1) != 0))
    {
LABEL_21:
      result = sub_21AD24288();
      __break(1u);
    }
    else
    {
      v17 = ~v12;
      while (1)
      {
        a3 = (a3 + 1) & v17;
        if (((*(_QWORD *)(v13 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) == 0)
          break;
        v18 = (_QWORD *)(v14 + 16 * a3);
        if (*v18 != v8 || v18[1] != a2)
        {
          result = sub_21AD2427C();
          if ((result & 1) == 0)
            continue;
        }
        goto LABEL_21;
      }
    }
  }
LABEL_22:
  v20 = *v5;
  *(_QWORD *)(*v5 + 8 * (a3 >> 6) + 56) |= 1 << a3;
  v21 = (uint64_t *)(*(_QWORD *)(v20 + 48) + 16 * a3);
  *v21 = v8;
  v21[1] = a2;
  v22 = *(_QWORD *)(v20 + 16);
  v23 = __OFADD__(v22, 1);
  v24 = v22 + 1;
  if (v23)
    __break(1u);
  else
    *(_QWORD *)(v20 + 16) = v24;
  return result;
}

void sub_21ACF677C(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t *v3;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  char v12;
  uint64_t v13;
  id v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  BOOL v18;
  uint64_t v19;

  v6 = *(_QWORD *)(*v3 + 16);
  v7 = *(_QWORD *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0)
    goto LABEL_14;
  if ((a3 & 1) != 0)
  {
    sub_21AD155D8();
  }
  else
  {
    if (v7 > v6)
    {
      sub_21AD15D34();
      goto LABEL_14;
    }
    sub_21ACF6DD8();
  }
  v8 = *v3;
  v9 = sub_21AD240B4();
  v10 = -1 << *(_BYTE *)(v8 + 32);
  a2 = v9 & ~v10;
  if (((*(_QWORD *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    sub_21ACF8044(0, (unint64_t *)&qword_2551182B0);
    v11 = *(id *)(*(_QWORD *)(v8 + 48) + 8 * a2);
    v12 = sub_21AD240C0();

    if ((v12 & 1) != 0)
    {
LABEL_13:
      sub_21AD24288();
      __break(1u);
    }
    else
    {
      v13 = ~v10;
      while (1)
      {
        a2 = (a2 + 1) & v13;
        if (((*(_QWORD *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) == 0)
          break;
        v14 = *(id *)(*(_QWORD *)(v8 + 48) + 8 * a2);
        v15 = sub_21AD240C0();

        if ((v15 & 1) != 0)
          goto LABEL_13;
      }
    }
  }
LABEL_14:
  v16 = *v3;
  *(_QWORD *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(_QWORD *)(*(_QWORD *)(v16 + 48) + 8 * a2) = a1;
  v17 = *(_QWORD *)(v16 + 16);
  v18 = __OFADD__(v17, 1);
  v19 = v17 + 1;
  if (v18)
    __break(1u);
  else
    *(_QWORD *)(v16 + 16) = v19;
}

uint64_t sub_21ACF6900(uint64_t result, unint64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t *v4;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v24;
  uint64_t v25;
  uint64_t v26;
  BOOL v27;
  uint64_t v28;

  v4 = v3;
  v6 = result;
  v7 = *(_QWORD *)(*v3 + 16);
  v8 = *(_QWORD *)(*v3 + 24);
  if (v8 > v7 && (a3 & 1) != 0)
    goto LABEL_22;
  if ((a3 & 1) != 0)
  {
    sub_21AD15874();
  }
  else
  {
    if (v8 > v7)
    {
      result = (uint64_t)sub_21AD15EDC();
LABEL_22:
      v25 = *v4;
      *(_QWORD *)(*v4 + 8 * (a2 >> 6) + 56) |= 1 << a2;
      *(_QWORD *)(*(_QWORD *)(v25 + 48) + 8 * a2) = v6;
      v26 = *(_QWORD *)(v25 + 16);
      v27 = __OFADD__(v26, 1);
      v28 = v26 + 1;
      if (!v27)
      {
        *(_QWORD *)(v25 + 16) = v28;
        return result;
      }
      __break(1u);
      goto LABEL_25;
    }
    sub_21ACF7050();
  }
  v9 = *v3;
  _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
  sub_21AD242E8();
  sub_21AD23F88();
  v10 = sub_21AD24300();
  result = swift_bridgeObjectRelease();
  v11 = -1 << *(_BYTE *)(v9 + 32);
  a2 = v10 & ~v11;
  if (((*(_QWORD *)(v9 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) == 0)
    goto LABEL_22;
  v12 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
  v14 = v13;
  if (v12 == _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0() && v14 == v15)
  {
LABEL_25:
    swift_bridgeObjectRelease_n();
    goto LABEL_26;
  }
  v17 = sub_21AD2427C();
  swift_bridgeObjectRelease();
  result = swift_bridgeObjectRelease();
  if ((v17 & 1) == 0)
  {
    v18 = ~v11;
    do
    {
      a2 = (a2 + 1) & v18;
      if (((*(_QWORD *)(v9 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) == 0)
        goto LABEL_22;
      v19 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
      v21 = v20;
      if (v19 == _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0() && v21 == v22)
        goto LABEL_25;
      v24 = sub_21AD2427C();
      swift_bridgeObjectRelease();
      result = swift_bridgeObjectRelease();
    }
    while ((v24 & 1) == 0);
  }
LABEL_26:
  type metadata accessor for AXSDSoundDetectionType();
  result = sub_21AD24288();
  __break(1u);
  return result;
}

uint64_t sub_21ACF6B2C()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t result;
  int64_t v11;
  unint64_t v12;
  _QWORD *v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  int64_t v29;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255117A58);
  v3 = sub_21AD2415C();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = swift_release();
LABEL_35:
    *v1 = v4;
    return result;
  }
  v5 = 1 << *(_BYTE *)(v2 + 32);
  v6 = v2 + 56;
  if (v5 < 64)
    v7 = ~(-1 << v5);
  else
    v7 = -1;
  v8 = v7 & *(_QWORD *)(v2 + 56);
  v29 = (unint64_t)(v5 + 63) >> 6;
  v9 = v3 + 56;
  result = swift_retain();
  v11 = 0;
  while (1)
  {
    if (v8)
    {
      v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      v15 = v14 | (v11 << 6);
      goto LABEL_24;
    }
    v16 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v29)
      goto LABEL_33;
    v17 = *(_QWORD *)(v6 + 8 * v16);
    ++v11;
    if (!v17)
    {
      v11 = v16 + 1;
      if (v16 + 1 >= v29)
        goto LABEL_33;
      v17 = *(_QWORD *)(v6 + 8 * v11);
      if (!v17)
      {
        v11 = v16 + 2;
        if (v16 + 2 >= v29)
          goto LABEL_33;
        v17 = *(_QWORD *)(v6 + 8 * v11);
        if (!v17)
          break;
      }
    }
LABEL_23:
    v8 = (v17 - 1) & v17;
    v15 = __clz(__rbit64(v17)) + (v11 << 6);
LABEL_24:
    v19 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v20 = *v19;
    v21 = v19[1];
    sub_21AD242E8();
    swift_bridgeObjectRetain();
    sub_21AD23F88();
    result = sub_21AD24300();
    v22 = -1 << *(_BYTE *)(v4 + 32);
    v23 = result & ~v22;
    v24 = v23 >> 6;
    if (((-1 << v23) & ~*(_QWORD *)(v9 + 8 * (v23 >> 6))) != 0)
    {
      v12 = __clz(__rbit64((-1 << v23) & ~*(_QWORD *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v25 = 0;
      v26 = (unint64_t)(63 - v22) >> 6;
      do
      {
        if (++v24 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        v27 = v24 == v26;
        if (v24 == v26)
          v24 = 0;
        v25 |= v27;
        v28 = *(_QWORD *)(v9 + 8 * v24);
      }
      while (v28 == -1);
      v12 = __clz(__rbit64(~v28)) + (v24 << 6);
    }
    *(_QWORD *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    v13 = (_QWORD *)(*(_QWORD *)(v4 + 48) + 16 * v12);
    *v13 = v20;
    v13[1] = v21;
    ++*(_QWORD *)(v4 + 16);
  }
  v18 = v16 + 3;
  if (v18 >= v29)
  {
LABEL_33:
    result = swift_release_n();
    v1 = v0;
    goto LABEL_35;
  }
  v17 = *(_QWORD *)(v6 + 8 * v18);
  if (v17)
  {
    v11 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    v11 = v18 + 1;
    if (__OFADD__(v18, 1))
      break;
    if (v11 >= v29)
      goto LABEL_33;
    v17 = *(_QWORD *)(v6 + 8 * v11);
    ++v18;
    if (v17)
      goto LABEL_23;
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_21ACF6DD8()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t result;
  int64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  id v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  char v23;
  unint64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t *v27;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255117A48);
  v3 = sub_21AD2415C();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = swift_release();
LABEL_35:
    *v1 = v4;
    return result;
  }
  v27 = v0;
  v5 = 1 << *(_BYTE *)(v2 + 32);
  v6 = v2 + 56;
  if (v5 < 64)
    v7 = ~(-1 << v5);
  else
    v7 = -1;
  v8 = v7 & *(_QWORD *)(v2 + 56);
  v9 = (unint64_t)(v5 + 63) >> 6;
  v10 = v3 + 56;
  result = swift_retain();
  v12 = 0;
  while (1)
  {
    if (v8)
    {
      v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      v15 = v14 | (v12 << 6);
      goto LABEL_24;
    }
    v16 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v9)
      goto LABEL_33;
    v17 = *(_QWORD *)(v6 + 8 * v16);
    ++v12;
    if (!v17)
    {
      v12 = v16 + 1;
      if (v16 + 1 >= v9)
        goto LABEL_33;
      v17 = *(_QWORD *)(v6 + 8 * v12);
      if (!v17)
      {
        v12 = v16 + 2;
        if (v16 + 2 >= v9)
          goto LABEL_33;
        v17 = *(_QWORD *)(v6 + 8 * v12);
        if (!v17)
          break;
      }
    }
LABEL_23:
    v8 = (v17 - 1) & v17;
    v15 = __clz(__rbit64(v17)) + (v12 << 6);
LABEL_24:
    v19 = *(id *)(*(_QWORD *)(v2 + 48) + 8 * v15);
    result = sub_21AD240B4();
    v20 = -1 << *(_BYTE *)(v4 + 32);
    v21 = result & ~v20;
    v22 = v21 >> 6;
    if (((-1 << v21) & ~*(_QWORD *)(v10 + 8 * (v21 >> 6))) != 0)
    {
      v13 = __clz(__rbit64((-1 << v21) & ~*(_QWORD *)(v10 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v23 = 0;
      v24 = (unint64_t)(63 - v20) >> 6;
      do
      {
        if (++v22 == v24 && (v23 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        v25 = v22 == v24;
        if (v22 == v24)
          v22 = 0;
        v23 |= v25;
        v26 = *(_QWORD *)(v10 + 8 * v22);
      }
      while (v26 == -1);
      v13 = __clz(__rbit64(~v26)) + (v22 << 6);
    }
    *(_QWORD *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v13) = v19;
    ++*(_QWORD *)(v4 + 16);
  }
  v18 = v16 + 3;
  if (v18 >= v9)
  {
LABEL_33:
    result = swift_release_n();
    v1 = v27;
    goto LABEL_35;
  }
  v17 = *(_QWORD *)(v6 + 8 * v18);
  if (v17)
  {
    v12 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    v12 = v18 + 1;
    if (__OFADD__(v18, 1))
      break;
    if (v12 >= v9)
      goto LABEL_33;
    v17 = *(_QWORD *)(v6 + 8 * v12);
    ++v18;
    if (v17)
      goto LABEL_23;
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_21ACF7050()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t result;
  int64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  int64_t v14;
  unint64_t v15;
  int64_t v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  char v23;
  unint64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  int64_t v29;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255117A30);
  v3 = sub_21AD2415C();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = swift_release();
LABEL_35:
    *v1 = v4;
    return result;
  }
  v5 = 1 << *(_BYTE *)(v2 + 32);
  v27 = v0;
  v28 = v2 + 56;
  if (v5 < 64)
    v6 = ~(-1 << v5);
  else
    v6 = -1;
  v7 = v6 & *(_QWORD *)(v2 + 56);
  v29 = (unint64_t)(v5 + 63) >> 6;
  v8 = v3 + 56;
  result = swift_retain();
  v10 = 0;
  while (1)
  {
    if (v7)
    {
      v12 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      v13 = v12 | (v10 << 6);
      goto LABEL_24;
    }
    v14 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v14 >= v29)
      goto LABEL_33;
    v15 = *(_QWORD *)(v28 + 8 * v14);
    ++v10;
    if (!v15)
    {
      v10 = v14 + 1;
      if (v14 + 1 >= v29)
        goto LABEL_33;
      v15 = *(_QWORD *)(v28 + 8 * v10);
      if (!v15)
      {
        v10 = v14 + 2;
        if (v14 + 2 >= v29)
          goto LABEL_33;
        v15 = *(_QWORD *)(v28 + 8 * v10);
        if (!v15)
          break;
      }
    }
LABEL_23:
    v7 = (v15 - 1) & v15;
    v13 = __clz(__rbit64(v15)) + (v10 << 6);
LABEL_24:
    v17 = *(void **)(*(_QWORD *)(v2 + 48) + 8 * v13);
    _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
    sub_21AD242E8();
    v18 = v17;
    sub_21AD23F88();
    v19 = sub_21AD24300();
    result = swift_bridgeObjectRelease();
    v20 = -1 << *(_BYTE *)(v4 + 32);
    v21 = v19 & ~v20;
    v22 = v21 >> 6;
    if (((-1 << v21) & ~*(_QWORD *)(v8 + 8 * (v21 >> 6))) != 0)
    {
      v11 = __clz(__rbit64((-1 << v21) & ~*(_QWORD *)(v8 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v23 = 0;
      v24 = (unint64_t)(63 - v20) >> 6;
      do
      {
        if (++v22 == v24 && (v23 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        v25 = v22 == v24;
        if (v22 == v24)
          v22 = 0;
        v23 |= v25;
        v26 = *(_QWORD *)(v8 + 8 * v22);
      }
      while (v26 == -1);
      v11 = __clz(__rbit64(~v26)) + (v22 << 6);
    }
    *(_QWORD *)(v8 + ((v11 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v11;
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v11) = v18;
    ++*(_QWORD *)(v4 + 16);
  }
  v16 = v14 + 3;
  if (v16 >= v29)
  {
LABEL_33:
    result = swift_release_n();
    v1 = v27;
    goto LABEL_35;
  }
  v15 = *(_QWORD *)(v28 + 8 * v16);
  if (v15)
  {
    v10 = v16;
    goto LABEL_23;
  }
  while (1)
  {
    v10 = v16 + 1;
    if (__OFADD__(v16, 1))
      break;
    if (v10 >= v29)
      goto LABEL_33;
    v15 = *(_QWORD *)(v28 + 8 * v10);
    ++v16;
    if (v15)
      goto LABEL_23;
  }
LABEL_37:
  __break(1u);
  return result;
}

void sub_21ACF732C(void *a1, void *a2)
{
  sub_21ACF7380(a1, a2, (uint64_t)&unk_24DDF7478, (uint64_t)sub_21ACF812C, (uint64_t)&block_descriptor_33);
}

void sub_21ACF7348(void *a1, void *a2)
{
  sub_21ACF7380(a1, a2, (uint64_t)&unk_24DDF7428, (uint64_t)sub_21ACF812C, (uint64_t)&block_descriptor_26);
}

void sub_21ACF7364(void *a1, void *a2)
{
  sub_21ACF7380(a1, a2, (uint64_t)&unk_24DDF73D8, (uint64_t)sub_21ACF7E40, (uint64_t)&block_descriptor_19);
}

void sub_21ACF7380(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  char *v17;
  id v18;
  NSObject *v19;
  os_log_type_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  char *v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id *v34;
  char *v35;
  id v36;
  char *v37;
  id v38;
  NSObject *v39;
  os_log_type_t v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  id v44;
  uint64_t v45;
  unint64_t v46;
  unint64_t v47;
  uint64_t v48;
  unint64_t v49;
  void *v50;
  uint64_t v51;
  void *v52;
  char *v53;
  id v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t aBlock[6];
  uint64_t v69;

  v62 = a4;
  v63 = a5;
  v61 = a3;
  v7 = sub_21AD23F04();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8]();
  v10 = (char *)&v56 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_21AD23F1C();
  v65 = *(_QWORD *)(v11 - 8);
  v66 = v11;
  MEMORY[0x24BDAC7A8]();
  v64 = (char *)&v56 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2551178E0 != -1)
    swift_once();
  v13 = sub_21AD23EEC();
  v14 = __swift_project_value_buffer(v13, (uint64_t)qword_2551180B8);
  v15 = a2;
  v16 = a1;
  v17 = (char *)v15;
  v18 = v16;
  v60 = v14;
  v19 = sub_21AD23EE0();
  v20 = sub_21AD2406C();
  if (os_log_type_enabled(v19, v20))
  {
    v21 = swift_slowAlloc();
    v58 = v10;
    v22 = v21;
    v57 = swift_slowAlloc();
    aBlock[0] = v57;
    *(_DWORD *)v22 = 136315394;
    v56 = v22 + 4;
    v23 = v17;
    v59 = v7;
    v24 = v23;
    v25 = v8;
    v26 = objc_msgSend(v23, sel_description);
    v27 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
    v29 = v28;

    v8 = v25;
    v69 = sub_21ACF58B4(v27, v29, aBlock);
    sub_21AD240CC();

    swift_bridgeObjectRelease();
    *(_WORD *)(v22 + 12) = 2080;
    v69 = (uint64_t)v18;
    swift_unknownObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_255117A28);
    v30 = sub_21AD23F7C();
    v69 = sub_21ACF58B4(v30, v31, aBlock);
    v7 = v59;
    sub_21AD240CC();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21ACD4000, v19, v20, "[%s]: start listening with delegate: %s", (uint8_t *)v22, 0x16u);
    v32 = v57;
    swift_arrayDestroy();
    MEMORY[0x220756ED0](v32, -1, -1);
    v33 = v22;
    v10 = v58;
    MEMORY[0x220756ED0](v33, -1, -1);

  }
  else
  {

  }
  v34 = (id *)&v17[OBJC_IVAR____TtC18AXSoundDetectionUI34AXSDNSBaseControllerImplementation_listener];
  swift_beginAccess();
  if (objc_msgSend(*v34, sel_containsListenDelegate_, v18))
  {
    v35 = v17;
    v36 = v18;
    v37 = v35;
    v38 = v36;
    v39 = sub_21AD23EE0();
    v40 = sub_21AD24054();
    if (os_log_type_enabled(v39, v40))
    {
      v41 = swift_slowAlloc();
      v42 = swift_slowAlloc();
      aBlock[0] = v42;
      *(_DWORD *)v41 = 136315394;
      v43 = v37;
      v44 = objc_msgSend(v43, sel_description);
      v45 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
      v47 = v46;

      v67 = sub_21ACF58B4(v45, v47, aBlock);
      sub_21AD240CC();

      swift_bridgeObjectRelease();
      *(_WORD *)(v41 + 12) = 2080;
      v67 = (uint64_t)v38;
      swift_unknownObjectRetain();
      __swift_instantiateConcreteTypeFromMangledName(&qword_255117A28);
      v48 = sub_21AD23F7C();
      v67 = sub_21ACF58B4(v48, v49, aBlock);
      sub_21AD240CC();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_21ACD4000, v39, v40, "[%s]: listen engine already contains delegate: %s", (uint8_t *)v41, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x220756ED0](v42, -1, -1);
      MEMORY[0x220756ED0](v41, -1, -1);

    }
    else
    {

    }
  }
  else
  {
    sub_21ACF8044(0, (unint64_t *)&qword_255117BD0);
    v50 = (void *)sub_21AD24090();
    v51 = swift_allocObject();
    *(_QWORD *)(v51 + 16) = v17;
    *(_QWORD *)(v51 + 24) = v18;
    aBlock[4] = v62;
    aBlock[5] = v51;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_21ACF4004;
    aBlock[3] = v63;
    v52 = _Block_copy(aBlock);
    v53 = v17;
    v54 = v18;
    swift_release();
    v55 = v64;
    sub_21AD23F10();
    aBlock[0] = MEMORY[0x24BEE4AF8];
    sub_21ACF7DA4((unint64_t *)&qword_255117940, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255118240);
    sub_21ACF7B30();
    sub_21AD240E4();
    MEMORY[0x220756504](0, v55, v10, v52);
    _Block_release(v52);

    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    (*(void (**)(char *, uint64_t))(v65 + 8))(v55, v66);
  }
}

uint64_t sub_21ACF79AC(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = *(_QWORD *)(a1 + 16);
  result = sub_21AD24030();
  v8 = result;
  if (v2)
  {
    v4 = (uint64_t *)(a1 + 40);
    do
    {
      v5 = *(v4 - 1);
      v6 = *v4;
      swift_bridgeObjectRetain();
      sub_21ACF5EF4(&v7, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t type metadata accessor for AXSDKShotNSControllerImplementation()
{
  return objc_opt_self();
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x220756E28]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_21ACF7AB8()
{
  uint64_t v0;

  return swift_deallocObject();
}

id sub_21ACF7ADC()
{
  uint64_t v0;
  char *v1;

  v1 = *(char **)(v0 + 16);
  sub_21ACFA090(v1, v1);
  return objc_msgSend(*(id *)&v1[OBJC_IVAR____TtC18AXSoundDetectionUI35AXSDKShotNSControllerImplementation_modelManager], sel_stopDetection);
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

unint64_t sub_21ACF7B30()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255117950;
  if (!qword_255117950)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_255118240);
    result = MEMORY[0x220756E40](MEMORY[0x24BEE12C8], v1);
    atomic_store(result, (unint64_t *)&qword_255117950);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x220756E34](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

id sub_21ACF7BC0()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(*(_QWORD *)(v0 + 16)+ OBJC_IVAR____TtC18AXSoundDetectionUI35AXSDKShotNSControllerImplementation_modelManager), sel_removeAllDetectors);
}

uint64_t sub_21ACF7BDC()
{
  uint64_t v0;

  return swift_deallocObject();
}

id sub_21ACF7C08()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(*(_QWORD *)(v0 + 16)+ OBJC_IVAR____TtC18AXSoundDetectionUI35AXSDKShotNSControllerImplementation_modelManager), sel_startDetectionWithFormat_, *(_QWORD *)(v0 + 24));
}

uint64_t sub_21ACF7C24(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_21ACF7C60(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_255117968);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t method lookup function for AXSDKShotNSControllerImplementation()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of AXSDKShotNSControllerImplementation.currentDetectionTypes.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xE8))();
}

uint64_t dispatch thunk of AXSDKShotNSControllerImplementation.__allocating_init(modelManager:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 240))();
}

uint64_t dispatch thunk of AXSDKShotNSControllerImplementation.add(customDetector:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xF8))();
}

uint64_t dispatch thunk of AXSDKShotNSControllerImplementation.remove(customDetector:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x100))();
}

uint64_t dispatch thunk of AXSDKShotNSControllerImplementation.removeAllListenTypes()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x108))();
}

void type metadata accessor for AXSDSoundDetectionType()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!qword_2551179F8)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_2551179F8);
  }
}

uint64_t sub_21ACF7D78()
{
  return sub_21ACF7DA4(&qword_255117A00, (uint64_t (*)(uint64_t))type metadata accessor for AXSDSoundDetectionType, (uint64_t)&unk_21AD26DD8);
}

uint64_t sub_21ACF7DA4(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x220756E40](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_21ACF7DE4()
{
  return sub_21ACF7DA4(&qword_255117A08, (uint64_t (*)(uint64_t))type metadata accessor for AXSDSoundDetectionType, (uint64_t)&unk_21AD26DAC);
}

uint64_t sub_21ACF7E10()
{
  return sub_21ACF7DA4((unint64_t *)&unk_255117A10, (uint64_t (*)(uint64_t))type metadata accessor for AXSDSoundDetectionType, (uint64_t)&unk_21AD26E48);
}

id sub_21ACF7E40()
{
  uint64_t v0;

  return sub_21ACF9744(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t sub_21ACF7E4C(unint64_t a1)
{
  unint64_t v2;
  uint64_t result;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void **v7;
  void *v8;
  id v9;
  uint64_t v10;

  v2 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    sub_21AD2421C();
    swift_bridgeObjectRelease();
  }
  sub_21ACF8044(0, (unint64_t *)&qword_2551182B0);
  sub_21ACF807C();
  result = sub_21AD24030();
  v10 = result;
  if (v2)
  {
    swift_bridgeObjectRetain();
    v4 = sub_21AD2421C();
    result = swift_bridgeObjectRelease();
    if (!v4)
      return v10;
  }
  else
  {
    v4 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v4)
      return v10;
  }
  if (v4 >= 1)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      for (i = 0; i != v4; ++i)
      {
        v6 = (void *)MEMORY[0x2207565F4](i, a1);
        sub_21ACF60A0(&v9, v6);

      }
    }
    else
    {
      v7 = (void **)(a1 + 32);
      do
      {
        v8 = *v7++;
        sub_21ACF60A0(&v9, v8);

        --v4;
      }
      while (v4);
    }
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_21ACF7FA4(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  void **v4;
  void *v5;
  id v6;
  uint64_t v7;

  v2 = *(_QWORD *)(a1 + 16);
  type metadata accessor for AXSDSoundDetectionType();
  sub_21ACF7DA4(&qword_255118260, (uint64_t (*)(uint64_t))type metadata accessor for AXSDSoundDetectionType, (uint64_t)&unk_21AD26EC0);
  result = sub_21AD24030();
  v7 = result;
  if (v2)
  {
    v4 = (void **)(a1 + 32);
    do
    {
      v5 = *v4++;
      sub_21ACF633C(&v6, v5);

      --v2;
    }
    while (v2);
    return v7;
  }
  return result;
}

uint64_t sub_21ACF8044(uint64_t a1, unint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

unint64_t sub_21ACF807C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255117A40;
  if (!qword_255117A40)
  {
    v1 = sub_21ACF8044(255, (unint64_t *)&qword_2551182B0);
    result = MEMORY[0x220756E40](MEMORY[0x24BEE5BD8], v1);
    atomic_store(result, (unint64_t *)&qword_255117A40);
  }
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t objectdestroy_15Tm()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  return swift_deallocObject();
}

uint64_t AXSDSoundDetectionType.detectorIdentifier.getter@<X0>(void *a1@<X0>, char *a2@<X8>)
{
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  void (*v12)(char *, char *, uint64_t);
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255117AC0);
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_21AD23E20();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8]();
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  AXSDSoundDetectionType.builtInDetectorIdentifier.getter(a1, (uint64_t)v5);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) == 1)
  {
    sub_21ACF8D54((uint64_t)v5);
    v10 = sub_21AD23E14();
    return (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(a2, 1, 1, v10);
  }
  else
  {
    v12 = *(void (**)(char *, char *, uint64_t))(v7 + 32);
    v12(v9, v5, v6);
    v12(a2, v9, v6);
    v13 = *MEMORY[0x24BDE9950];
    v14 = sub_21AD23E14();
    v15 = *(_QWORD *)(v14 - 8);
    (*(void (**)(char *, uint64_t, uint64_t))(v15 + 104))(a2, v13, v14);
    return (*(uint64_t (**)(char *, _QWORD, uint64_t, uint64_t))(v15 + 56))(a2, 0, 1, v14);
  }
}

uint64_t AXSDSoundDetectionType.builtInDetectorIdentifier.getter@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unsigned int *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  char v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  char v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  char v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  char v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  char v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  char v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  char v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  char v95;
  uint64_t v96;
  id v97;
  NSObject *v98;
  os_log_type_t v99;
  uint8_t *v100;
  uint64_t v101;
  uint64_t v102;
  unint64_t v103;
  uint64_t v104;
  uint64_t v105;

  v4 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
  v6 = v5;
  if (v4 == _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0() && v6 == v7)
  {
    swift_bridgeObjectRelease_n();
    goto LABEL_15;
  }
  v9 = sub_21AD2427C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v9 & 1) != 0)
  {
LABEL_15:
    v20 = (unsigned int *)MEMORY[0x24BDE9998];
LABEL_16:
    v21 = *v20;
    v22 = sub_21AD23E20();
    v23 = *(_QWORD *)(v22 - 8);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v23 + 104))(a2, v21, v22);
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v23 + 56))(a2, 0, 1, v22);
  }
  v10 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
  v12 = v11;
  if (v10 == _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0() && v12 == v13)
  {
    swift_bridgeObjectRelease_n();
    goto LABEL_18;
  }
  v15 = sub_21AD2427C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v15 & 1) != 0)
  {
LABEL_18:
    v20 = (unsigned int *)MEMORY[0x24BDE99D0];
    goto LABEL_16;
  }
  v16 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
  v18 = v17;
  if (v16 == _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0() && v18 == v19)
  {
    swift_bridgeObjectRelease_n();
LABEL_20:
    v20 = (unsigned int *)MEMORY[0x24BDE99B0];
    goto LABEL_16;
  }
  v25 = sub_21AD2427C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v25 & 1) != 0)
    goto LABEL_20;
  v26 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
  v28 = v27;
  if (v26 == _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0() && v28 == v29)
  {
    swift_bridgeObjectRelease_n();
LABEL_25:
    v20 = (unsigned int *)MEMORY[0x24BDE99B8];
    goto LABEL_16;
  }
  v30 = sub_21AD2427C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v30 & 1) != 0)
    goto LABEL_25;
  v31 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
  v33 = v32;
  if (v31 == _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0() && v33 == v34)
  {
    swift_bridgeObjectRelease_n();
LABEL_30:
    v20 = (unsigned int *)MEMORY[0x24BDE99C0];
    goto LABEL_16;
  }
  v35 = sub_21AD2427C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v35 & 1) != 0)
    goto LABEL_30;
  v36 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
  v38 = v37;
  if (v36 == _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0() && v38 == v39)
  {
    swift_bridgeObjectRelease_n();
LABEL_35:
    v20 = (unsigned int *)MEMORY[0x24BDE99A0];
    goto LABEL_16;
  }
  v40 = sub_21AD2427C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v40 & 1) != 0)
    goto LABEL_35;
  v41 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
  v43 = v42;
  if (v41 == _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0() && v43 == v44)
  {
    swift_bridgeObjectRelease_n();
LABEL_40:
    v20 = (unsigned int *)MEMORY[0x24BDE9988];
    goto LABEL_16;
  }
  v45 = sub_21AD2427C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v45 & 1) != 0)
    goto LABEL_40;
  v46 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
  v48 = v47;
  if (v46 == _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0() && v48 == v49)
  {
    swift_bridgeObjectRelease_n();
LABEL_45:
    v20 = (unsigned int *)MEMORY[0x24BDE99C8];
    goto LABEL_16;
  }
  v50 = sub_21AD2427C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v50 & 1) != 0)
    goto LABEL_45;
  v51 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
  v53 = v52;
  if (v51 == _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0() && v53 == v54)
  {
    swift_bridgeObjectRelease_n();
LABEL_50:
    v20 = (unsigned int *)MEMORY[0x24BDE99E0];
    goto LABEL_16;
  }
  v55 = sub_21AD2427C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v55 & 1) != 0)
    goto LABEL_50;
  v56 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
  v58 = v57;
  if (v56 == _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0() && v58 == v59)
  {
    swift_bridgeObjectRelease_n();
LABEL_55:
    v20 = (unsigned int *)MEMORY[0x24BDE99D8];
    goto LABEL_16;
  }
  v60 = sub_21AD2427C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v60 & 1) != 0)
    goto LABEL_55;
  v61 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
  v63 = v62;
  if (v61 == _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0() && v63 == v64)
  {
    swift_bridgeObjectRelease_n();
LABEL_60:
    v20 = (unsigned int *)MEMORY[0x24BDE99E8];
    goto LABEL_16;
  }
  v65 = sub_21AD2427C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v65 & 1) != 0)
    goto LABEL_60;
  v66 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
  v68 = v67;
  if (v66 == _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0() && v68 == v69)
  {
    swift_bridgeObjectRelease_n();
LABEL_65:
    v20 = (unsigned int *)MEMORY[0x24BDE9980];
    goto LABEL_16;
  }
  v70 = sub_21AD2427C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v70 & 1) != 0)
    goto LABEL_65;
  v71 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
  v73 = v72;
  if (v71 == _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0() && v73 == v74)
  {
    swift_bridgeObjectRelease_n();
LABEL_70:
    v20 = (unsigned int *)MEMORY[0x24BDE9990];
    goto LABEL_16;
  }
  v75 = sub_21AD2427C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v75 & 1) != 0)
    goto LABEL_70;
  v76 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
  v78 = v77;
  if (v76 == _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0() && v78 == v79)
  {
    swift_bridgeObjectRelease_n();
LABEL_75:
    v20 = (unsigned int *)MEMORY[0x24BDE99A8];
    goto LABEL_16;
  }
  v80 = sub_21AD2427C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v80 & 1) != 0)
    goto LABEL_75;
  v81 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
  v83 = v82;
  if (v81 == _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0() && v83 == v84)
  {
    swift_bridgeObjectRelease_n();
LABEL_80:
    v20 = (unsigned int *)MEMORY[0x24BDE9968];
    goto LABEL_16;
  }
  v85 = sub_21AD2427C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v85 & 1) != 0)
    goto LABEL_80;
  v86 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
  v88 = v87;
  if (v86 == _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0() && v88 == v89)
  {
    swift_bridgeObjectRelease_n();
LABEL_85:
    v20 = (unsigned int *)MEMORY[0x24BDE9970];
    goto LABEL_16;
  }
  v90 = sub_21AD2427C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v90 & 1) != 0)
    goto LABEL_85;
  v91 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
  v93 = v92;
  if (v91 == _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0() && v93 == v94)
  {
    swift_bridgeObjectRelease_n();
LABEL_90:
    v20 = (unsigned int *)MEMORY[0x24BDE9978];
    goto LABEL_16;
  }
  v95 = sub_21AD2427C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v95 & 1) != 0)
    goto LABEL_90;
  if (qword_2551178E0 != -1)
    swift_once();
  v96 = sub_21AD23EEC();
  __swift_project_value_buffer(v96, (uint64_t)qword_2551180B8);
  v97 = a1;
  v98 = sub_21AD23EE0();
  v99 = sub_21AD24060();
  if (os_log_type_enabled(v98, v99))
  {
    v100 = (uint8_t *)swift_slowAlloc();
    v101 = swift_slowAlloc();
    v105 = v101;
    *(_DWORD *)v100 = 136315138;
    v102 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
    sub_21ACF58B4(v102, v103, &v105);
    sub_21AD240CC();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21ACD4000, v98, v99, "Couldn't find a SoundRecognition.BuiltInDetectorIdentifier for: %s", v100, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x220756ED0](v101, -1, -1);
    MEMORY[0x220756ED0](v100, -1, -1);

  }
  else
  {

  }
  v104 = sub_21AD23E20();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v104 - 8) + 56))(a2, 1, 1, v104);
}

uint64_t sub_21ACF8D54(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255117AC0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t AccessibilitySoundRecognition.BuiltInDetectorIdentifier.description.getter()
{
  id v0;
  void *v1;
  uint64_t v2;

  v0 = AccessibilitySoundRecognition.BuiltInDetectorIdentifier.listenType.getter();
  if (!v0)
    return 0x6E776F6E6B6E55;
  v1 = v0;
  v2 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();

  return v2;
}

id AccessibilitySoundRecognition.BuiltInDetectorIdentifier.listenType.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  int v5;
  id *v6;
  id v7;
  id v8;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;

  v1 = sub_21AD23E20();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8]();
  v4 = (char *)&v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v4, v0, v1);
  v5 = (*(uint64_t (**)(char *, uint64_t))(v2 + 88))(v4, v1);
  if (v5 == *MEMORY[0x24BDE9970])
  {
    v6 = (id *)MEMORY[0x24BDFF260];
LABEL_35:
    v7 = *v6;
    v8 = *v6;
    return v7;
  }
  if (v5 == *MEMORY[0x24BDE9988])
  {
    v6 = (id *)MEMORY[0x24BDFF200];
    goto LABEL_35;
  }
  if (v5 == *MEMORY[0x24BDE9998])
  {
    v6 = (id *)MEMORY[0x24BDFF1D0];
    goto LABEL_35;
  }
  if (v5 == *MEMORY[0x24BDE99B0])
  {
    v6 = (id *)MEMORY[0x24BDFF1E0];
    goto LABEL_35;
  }
  if (v5 == *MEMORY[0x24BDE99B8])
  {
    v6 = (id *)MEMORY[0x24BDFF1E8];
    goto LABEL_35;
  }
  if (v5 == *MEMORY[0x24BDE99C0])
  {
    v6 = (id *)MEMORY[0x24BDFF1F0];
    goto LABEL_35;
  }
  if (v5 == *MEMORY[0x24BDE99A0])
  {
    v6 = (id *)MEMORY[0x24BDFF1F8];
    goto LABEL_35;
  }
  if (v5 == *MEMORY[0x24BDE99D0])
  {
    v6 = (id *)MEMORY[0x24BDFF1D8];
    goto LABEL_35;
  }
  if (v5 == *MEMORY[0x24BDE99C8])
  {
    v6 = (id *)MEMORY[0x24BDFF208];
    goto LABEL_35;
  }
  if (v5 == *MEMORY[0x24BDE99D8])
  {
    v6 = (id *)MEMORY[0x24BDFF218];
    goto LABEL_35;
  }
  if (v5 == *MEMORY[0x24BDE99E0])
  {
    v6 = (id *)MEMORY[0x24BDFF210];
    goto LABEL_35;
  }
  if (v5 == *MEMORY[0x24BDE99E8])
  {
    v6 = (id *)MEMORY[0x24BDFF220];
    goto LABEL_35;
  }
  if (v5 == *MEMORY[0x24BDE9980])
  {
    v6 = (id *)MEMORY[0x24BDFF230];
    goto LABEL_35;
  }
  if (v5 == *MEMORY[0x24BDE9990])
  {
    v6 = (id *)MEMORY[0x24BDFF240];
    goto LABEL_35;
  }
  if (v5 == *MEMORY[0x24BDE99A8])
  {
    v6 = (id *)MEMORY[0x24BDFF250];
    goto LABEL_35;
  }
  if (v5 == *MEMORY[0x24BDE9968])
  {
    v6 = (id *)MEMORY[0x24BDFF258];
    goto LABEL_35;
  }
  if (v5 == *MEMORY[0x24BDE9978])
  {
    v6 = (id *)MEMORY[0x24BDFF268];
    goto LABEL_35;
  }
  if (qword_2551178E0 != -1)
    swift_once();
  v10 = sub_21AD23EEC();
  __swift_project_value_buffer(v10, (uint64_t)qword_2551180B8);
  v11 = sub_21AD23EE0();
  v12 = sub_21AD24060();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_21ACD4000, v11, v12, "Couldn't find a AXSDSoundDetectionType for the builtin identifier.", v13, 2u);
    MEMORY[0x220756ED0](v13, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  return 0;
}

uint64_t sub_21ACF9164()
{
  id v0;
  void *v1;
  uint64_t v2;

  v0 = AccessibilitySoundRecognition.BuiltInDetectorIdentifier.listenType.getter();
  if (!v0)
    return 0x6E776F6E6B6E55;
  v1 = v0;
  v2 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();

  return v2;
}

id sub_21ACF91C0()
{
  uint64_t v0;
  id *v1;

  v1 = (id *)(v0 + OBJC_IVAR____TtC18AXSoundDetectionUI34AXSDNSBaseControllerImplementation_listener);
  swift_beginAccess();
  return *v1;
}

double sub_21ACF9204()
{
  uint64_t v0;
  id *v1;

  v1 = (id *)(v0 + OBJC_IVAR____TtC18AXSoundDetectionUI34AXSDNSBaseControllerImplementation_listener);
  swift_beginAccess();
  return (double)(unint64_t)objc_msgSend(*v1, sel_bufferSize);
}

uint64_t sub_21ACF925C()
{
  return 0;
}

uint64_t sub_21ACF9264()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC18AXSoundDetectionUI34AXSDNSBaseControllerImplementation_isEnabled);
  swift_beginAccess();
  return *v1;
}

id sub_21ACF92A8(uint64_t a1)
{
  uint64_t v1;

  return sub_21ACFA018(a1, v1);
}

void sub_21ACF92B0(void **a1, _QWORD *a2)
{
  void *v2;
  void **v3;
  void *v4;
  id v5;

  v2 = *a1;
  v3 = (void **)(*a2 + OBJC_IVAR____TtC18AXSoundDetectionUI34AXSDNSBaseControllerImplementation_listener);
  swift_beginAccess();
  v4 = *v3;
  *v3 = v2;
  v5 = v2;

}

id sub_21ACF9360()
{
  uint64_t v0;
  id *v1;

  v1 = (id *)(v0 + OBJC_IVAR____TtC18AXSoundDetectionUI34AXSDNSBaseControllerImplementation_listener);
  swift_beginAccess();
  return objc_msgSend(*v1, sel_isListening);
}

id AXSDNSBaseControllerImplementation.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id AXSDNSBaseControllerImplementation.init()()
{
  _BYTE *v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  id v7;
  objc_super v9;

  v0[OBJC_IVAR____TtC18AXSoundDetectionUI34AXSDNSBaseControllerImplementation_debug] = 0;
  v0[OBJC_IVAR____TtC18AXSoundDetectionUI34AXSDNSBaseControllerImplementation_isEnabled] = 0;
  v1 = qword_2551178E0;
  v2 = v0;
  if (v1 != -1)
    swift_once();
  v3 = sub_21AD23EEC();
  __swift_project_value_buffer(v3, (uint64_t)qword_2551180B8);
  v4 = sub_21AD23EE0();
  v5 = sub_21AD24054();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_21ACD4000, v4, v5, "Initializing Base Non Secure Controller", v6, 2u);
    MEMORY[0x220756ED0](v6, -1, -1);
  }

  v7 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
  *(_QWORD *)&v2[OBJC_IVAR____TtC18AXSoundDetectionUI34AXSDNSBaseControllerImplementation_listener] = v7;

  v9.receiver = v2;
  v9.super_class = (Class)type metadata accessor for AXSDNSBaseControllerImplementation();
  return objc_msgSendSuper2(&v9, sel_init);
}

void sub_21ACF9534()
{
  void *v0;
  uint64_t v1;
  id v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;
  id v7;
  id v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;

  if (qword_2551178E0 != -1)
    swift_once();
  v1 = sub_21AD23EEC();
  __swift_project_value_buffer(v1, (uint64_t)qword_2551180B8);
  v2 = v0;
  v3 = sub_21AD23EE0();
  v4 = sub_21AD24054();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    v6 = swift_slowAlloc();
    v12 = v6;
    *(_DWORD *)v5 = 136315138;
    v7 = v2;
    v8 = objc_msgSend(v7, sel_description);
    v9 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
    v11 = v10;

    sub_21ACF58B4(v9, v11, &v12);
    sub_21AD240CC();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21ACD4000, v3, v4, "[%s]: start listening", v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x220756ED0](v6, -1, -1);
    MEMORY[0x220756ED0](v5, -1, -1);

  }
  else
  {

  }
  sub_21ACF732C(v2, v2);
}

id sub_21ACF9744(uint64_t a1, uint64_t a2)
{
  id *v3;

  v3 = (id *)(a1 + OBJC_IVAR____TtC18AXSoundDetectionUI34AXSDNSBaseControllerImplementation_listener);
  swift_beginAccess();
  return objc_msgSend(*v3, sel_addListenDelegate_, a2);
}

uint64_t sub_21ACF979C()
{
  void *v0;
  uint64_t v1;
  id v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;
  id v7;
  id v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v13;

  if (qword_2551178E0 != -1)
    swift_once();
  v1 = sub_21AD23EEC();
  __swift_project_value_buffer(v1, (uint64_t)qword_2551180B8);
  v2 = v0;
  v3 = sub_21AD23EE0();
  v4 = sub_21AD24054();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    v6 = swift_slowAlloc();
    v13 = v6;
    *(_DWORD *)v5 = 136315138;
    v7 = v2;
    v8 = objc_msgSend(v7, sel_description);
    v9 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
    v11 = v10;

    sub_21ACF58B4(v9, v11, &v13);
    sub_21AD240CC();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21ACD4000, v3, v4, "[%s]: stop listening", v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x220756ED0](v6, -1, -1);
    MEMORY[0x220756ED0](v5, -1, -1);

  }
  else
  {

  }
  return sub_21ACFA0AC(v2, v2, (uint64_t)&unk_24DDF76B8, (uint64_t)sub_21ACFA724, (uint64_t)&block_descriptor_17);
}

id AXSDNSBaseControllerImplementation.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AXSDNSBaseControllerImplementation();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

Swift::Void __swiftcall AXSDNSBaseControllerImplementation.listenEngineDidStart(withInputFormat:)(AVAudioFormat_optional *withInputFormat)
{
  void *v1;
  uint64_t v3;
  AVAudioFormat_optional *v4;
  id v5;
  AVAudioFormat_optional *v6;
  NSObject *v7;
  os_log_type_t v8;
  uint64_t v9;
  id v10;
  id v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  AVAudioFormat_optional *v15;
  _QWORD *v16;
  uint64_t v17;
  id v18;
  uint64_t v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  if (qword_2551178E0 != -1)
    swift_once();
  v3 = sub_21AD23EEC();
  __swift_project_value_buffer(v3, (uint64_t)qword_2551180B8);
  v4 = withInputFormat;
  v5 = v1;
  v6 = v4;
  v18 = v5;
  v7 = sub_21AD23EE0();
  v8 = sub_21AD2406C();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = swift_slowAlloc();
    v16 = (_QWORD *)swift_slowAlloc();
    v17 = swift_slowAlloc();
    v19[0] = v17;
    *(_DWORD *)v9 = 136315394;
    v10 = v18;
    v11 = objc_msgSend(v10, sel_description);
    v12 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
    v14 = v13;

    sub_21ACF58B4(v12, v14, v19);
    sub_21AD240CC();

    swift_bridgeObjectRelease();
    *(_WORD *)(v9 + 12) = 2112;
    if (withInputFormat)
      v15 = v6;
    sub_21AD240CC();
    *v16 = withInputFormat;

    _os_log_impl(&dword_21ACD4000, v7, v8, "[%s]: listen engine did start with format: %@", (uint8_t *)v9, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_255117958);
    swift_arrayDestroy();
    MEMORY[0x220756ED0](v16, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x220756ED0](v17, -1, -1);
    MEMORY[0x220756ED0](v9, -1, -1);

  }
  else
  {

  }
}

void AXSDNSBaseControllerImplementation.listenEngineFailedToStartWithError(_:)(void *a1)
{
  void *v1;
  uint64_t v3;
  id v4;
  id v5;
  id v6;
  id v7;
  os_log_type_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  id v12;
  id v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  id v17;
  NSObject *oslog;
  uint64_t v19;
  uint64_t v20;

  if (qword_2551178E0 != -1)
    swift_once();
  v3 = sub_21AD23EEC();
  __swift_project_value_buffer(v3, (uint64_t)qword_2551180B8);
  v4 = v1;
  v5 = a1;
  v6 = v4;
  v7 = a1;
  oslog = sub_21AD23EE0();
  v8 = sub_21AD24060();
  if (os_log_type_enabled(oslog, v8))
  {
    v9 = swift_slowAlloc();
    v10 = (_QWORD *)swift_slowAlloc();
    v11 = swift_slowAlloc();
    v20 = v11;
    *(_DWORD *)v9 = 136315394;
    v12 = v6;
    v13 = objc_msgSend(v12, sel_description);
    v14 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
    v16 = v15;

    sub_21ACF58B4(v14, v16, &v20);
    sub_21AD240CC();

    swift_bridgeObjectRelease();
    *(_WORD *)(v9 + 12) = 2112;
    v17 = a1;
    v19 = _swift_stdlib_bridgeErrorToNSError();
    sub_21AD240CC();
    *v10 = v19;

    _os_log_impl(&dword_21ACD4000, oslog, v8, "[%s]: listen engine failed to start with error: %@", (uint8_t *)v9, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_255117958);
    swift_arrayDestroy();
    MEMORY[0x220756ED0](v10, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x220756ED0](v11, -1, -1);
    MEMORY[0x220756ED0](v9, -1, -1);

  }
  else
  {

  }
}

id sub_21ACFA018(uint64_t a1, uint64_t a2)
{
  id *v3;

  v3 = (id *)(a2 + OBJC_IVAR____TtC18AXSoundDetectionUI34AXSDNSBaseControllerImplementation_listener);
  swift_beginAccess();
  return objc_msgSend(*v3, sel_containsListenDelegate_, a1);
}

uint64_t type metadata accessor for AXSDNSBaseControllerImplementation()
{
  return objc_opt_self();
}

uint64_t sub_21ACFA090(void *a1, void *a2)
{
  return sub_21ACFA0AC(a1, a2, (uint64_t)&unk_24DDF7708, (uint64_t)sub_21ACFA724, (uint64_t)&block_descriptor_24);
}

uint64_t sub_21ACFA0AC(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  id v19;
  NSObject *v20;
  os_log_type_t v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  id v26;
  char *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  id v40;
  id v41;
  char *v42;
  _QWORD v44[2];
  int v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t aBlock[6];

  v50 = a3;
  v9 = sub_21AD23F04();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8]();
  v12 = (char *)v44 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_21AD23F1C();
  v52 = *(_QWORD *)(v13 - 8);
  v53 = v13;
  MEMORY[0x24BDAC7A8]();
  v51 = (char *)v44 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2551178E0 != -1)
    swift_once();
  v15 = sub_21AD23EEC();
  __swift_project_value_buffer(v15, (uint64_t)qword_2551180B8);
  v16 = a2;
  v17 = a1;
  v18 = v16;
  v19 = v17;
  v20 = sub_21AD23EE0();
  v21 = sub_21AD2406C();
  v22 = v21;
  if (os_log_type_enabled(v20, v21))
  {
    v23 = swift_slowAlloc();
    v45 = v22;
    v24 = v23;
    v46 = swift_slowAlloc();
    aBlock[0] = v46;
    *(_DWORD *)v24 = 136315394;
    v49 = v9;
    v44[1] = v24 + 4;
    v25 = v18;
    v48 = a5;
    v26 = v25;
    v27 = v12;
    v28 = objc_msgSend(v25, sel_description);
    v29 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
    v47 = a4;
    v30 = v29;
    v31 = v10;
    v33 = v32;

    v12 = v27;
    v54 = sub_21ACF58B4(v30, v33, aBlock);
    sub_21AD240CC();

    v10 = v31;
    swift_bridgeObjectRelease();
    *(_WORD *)(v24 + 12) = 2080;
    v54 = (uint64_t)v19;
    swift_unknownObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_255117A28);
    v34 = sub_21AD23F7C();
    v54 = sub_21ACF58B4(v34, v35, aBlock);
    a5 = v48;
    v9 = v49;
    sub_21AD240CC();

    a4 = v47;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21ACD4000, v20, (os_log_type_t)v45, "[%s]: stop listening with delegate: %s", (uint8_t *)v24, 0x16u);
    v36 = v46;
    swift_arrayDestroy();
    MEMORY[0x220756ED0](v36, -1, -1);
    MEMORY[0x220756ED0](v24, -1, -1);

  }
  else
  {

  }
  sub_21ACFA6E4();
  v37 = (void *)sub_21AD24090();
  v38 = swift_allocObject();
  *(_QWORD *)(v38 + 16) = v18;
  *(_QWORD *)(v38 + 24) = v19;
  aBlock[4] = a4;
  aBlock[5] = v38;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_21ACF4004;
  aBlock[3] = a5;
  v39 = _Block_copy(aBlock);
  v40 = v18;
  v41 = v19;
  swift_release();
  v42 = v51;
  sub_21AD23F10();
  aBlock[0] = MEMORY[0x24BEE4AF8];
  sub_21ACFA740();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255118240);
  sub_21ACF7B30();
  sub_21AD240E4();
  MEMORY[0x220756504](0, v42, v12, v39);
  _Block_release(v39);

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  return (*(uint64_t (**)(char *, uint64_t))(v52 + 8))(v42, v53);
}

id sub_21ACFA4B4@<X0>(_QWORD *a1@<X0>, void **a2@<X8>)
{
  void **v3;
  void *v4;

  v3 = (void **)(*a1 + OBJC_IVAR____TtC18AXSoundDetectionUI34AXSDNSBaseControllerImplementation_listener);
  swift_beginAccess();
  v4 = *v3;
  *a2 = *v3;
  return v4;
}

uint64_t sub_21ACFA508@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(*a1 + OBJC_IVAR____TtC18AXSoundDetectionUI34AXSDNSBaseControllerImplementation_isEnabled);
  result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

uint64_t sub_21ACFA558(char *a1, _QWORD *a2)
{
  char v2;
  _BYTE *v3;
  uint64_t result;

  v2 = *a1;
  v3 = (_BYTE *)(*a2 + OBJC_IVAR____TtC18AXSoundDetectionUI34AXSDNSBaseControllerImplementation_isEnabled);
  result = swift_beginAccess();
  *v3 = v2;
  return result;
}

uint64_t method lookup function for AXSDNSBaseControllerImplementation()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of AXSDNSBaseControllerImplementation.listener.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x68))();
}

uint64_t dispatch thunk of AXSDNSBaseControllerImplementation.isListening.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x80))();
}

uint64_t dispatch thunk of AXSDNSBaseControllerImplementation.listenerBufferSize.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x88))();
}

uint64_t dispatch thunk of AXSDNSBaseControllerImplementation.isListenerListening.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x90))();
}

uint64_t dispatch thunk of AXSDNSBaseControllerImplementation.isSecure.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x98))();
}

uint64_t dispatch thunk of AXSDNSBaseControllerImplementation.isEnabled.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of AXSDNSBaseControllerImplementation.listenerContains(delegate:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xB8))();
}

uint64_t dispatch thunk of AXSDNSBaseControllerImplementation.startListening()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xC0))();
}

uint64_t dispatch thunk of AXSDNSBaseControllerImplementation.stopListening()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xD0))();
}

uint64_t sub_21ACFA6AC(void *a1, void *a2)
{
  return sub_21ACFA0AC(a1, a2, (uint64_t)&unk_24DDF7668, (uint64_t)sub_21ACFA724, (uint64_t)&block_descriptor_10);
}

uint64_t sub_21ACFA6C8(void *a1, void *a2)
{
  return sub_21ACFA0AC(a1, a2, (uint64_t)&unk_24DDF7618, (uint64_t)sub_21ACFA724, (uint64_t)&block_descriptor_0);
}

unint64_t sub_21ACFA6E4()
{
  unint64_t result;

  result = qword_255117BD0;
  if (!qword_255117BD0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_255117BD0);
  }
  return result;
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

unint64_t sub_21ACFA740()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255117940;
  if (!qword_255117940)
  {
    v1 = sub_21AD23F04();
    result = MEMORY[0x220756E40](MEMORY[0x24BEE5468], v1);
    atomic_store(result, (unint64_t *)&qword_255117940);
  }
  return result;
}

id sub_21ACFA794()
{
  uint64_t v0;
  uint64_t v1;
  id *v2;

  v1 = *(_QWORD *)(v0 + 24);
  v2 = (id *)(*(_QWORD *)(v0 + 16) + OBJC_IVAR____TtC18AXSoundDetectionUI34AXSDNSBaseControllerImplementation_listener);
  swift_beginAccess();
  return objc_msgSend(*v2, sel_removeListenDelegate_, v1);
}

uint64_t sub_21ACFA858()
{
  uint64_t v0;
  unint64_t *v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t i;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v1 = (unint64_t *)(v0
                          + OBJC_IVAR____TtC18AXSoundDetectionUI38AXSDSecureBaseControllerImplementation_currentDetectors);
  swift_beginAccess();
  v2 = *v1;
  v3 = MEMORY[0x24BEE4AF8];
  v23 = MEMORY[0x24BEE4AF8];
  if (!(v2 >> 62))
  {
    v4 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
    if (v4)
      goto LABEL_3;
LABEL_15:
    swift_bridgeObjectRelease();
    v9 = MEMORY[0x24BEE4AF8];
    if ((MEMORY[0x24BEE4AF8] & 0x8000000000000000) != 0)
      goto LABEL_27;
    goto LABEL_16;
  }
  swift_bridgeObjectRetain();
  result = sub_21AD2421C();
  v4 = result;
  if (!result)
    goto LABEL_15;
LABEL_3:
  if (v4 < 1)
  {
    __break(1u);
    goto LABEL_31;
  }
  for (i = 0; i != v4; ++i)
  {
    if ((v2 & 0xC000000000000001) != 0)
      v7 = (id)MEMORY[0x2207565F4](i, v2);
    else
      v7 = *(id *)(v2 + 8 * i + 32);
    v8 = v7;
    if (objc_msgSend(v7, sel_isCustom, v23))
    {
      sub_21AD241B0();
      sub_21AD241C8();
      sub_21AD241D4();
      sub_21AD241BC();
    }
    else
    {

    }
  }
  swift_bridgeObjectRelease();
  v9 = v23;
  if (v23 < 0)
    goto LABEL_27;
LABEL_16:
  if ((v9 & 0x4000000000000000) == 0)
  {
    v10 = *(_QWORD *)(v9 + 16);
    if (!v10)
    {
LABEL_28:
      swift_release();
      v12 = MEMORY[0x24BEE4AF8];
LABEL_29:
      v22 = sub_21ACF79AC(v12);
      swift_bridgeObjectRelease();
      return v22;
    }
    goto LABEL_18;
  }
LABEL_27:
  swift_bridgeObjectRetain();
  v10 = sub_21AD2421C();
  swift_release();
  if (!v10)
    goto LABEL_28;
LABEL_18:
  v24 = v3;
  result = sub_21ACFC614(0, v10 & ~(v10 >> 63), 0);
  if ((v10 & 0x8000000000000000) == 0)
  {
    v11 = 0;
    v12 = v3;
    do
    {
      if ((v9 & 0xC000000000000001) != 0)
        v13 = (id)MEMORY[0x2207565F4](v11, v9);
      else
        v13 = *(id *)(v9 + 8 * v11 + 32);
      v14 = v13;
      v15 = objc_msgSend(v13, sel_identifier, v24);
      v16 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
      v18 = v17;

      v24 = v12;
      v20 = *(_QWORD *)(v12 + 16);
      v19 = *(_QWORD *)(v12 + 24);
      if (v20 >= v19 >> 1)
        sub_21ACFC614(v19 > 1, v20 + 1, 1);
      ++v11;
      *(_QWORD *)(v12 + 16) = v20 + 1;
      v21 = v12 + 16 * v20;
      *(_QWORD *)(v21 + 32) = v16;
      *(_QWORD *)(v21 + 40) = v18;
    }
    while (v10 != v11);
    swift_release();
    goto LABEL_29;
  }
LABEL_31:
  __break(1u);
  return result;
}

id AXSDKShotSecureControllerImplementation.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id AXSDKShotSecureControllerImplementation.init()()
{
  char *v0;
  uint64_t v1;
  id v2;
  char *v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t inited;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  objc_super v13;

  v1 = OBJC_IVAR____TtC18AXSoundDetectionUI39AXSDKShotSecureControllerImplementation_detectorQueueManager;
  v2 = objc_allocWithZone((Class)AXSDDetectorQueueManager);
  v3 = v0;
  *(_QWORD *)&v0[v1] = objc_msgSend(v2, sel_init);

  if (qword_2551178E8 != -1)
    swift_once();
  v4 = sub_21AD23EEC();
  __swift_project_value_buffer(v4, (uint64_t)qword_2551180D0);
  v5 = sub_21AD23EE0();
  v6 = sub_21AD24054();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_21ACD4000, v5, v6, "Initializing Secure Custom Sound Detection Controller", v7, 2u);
    MEMORY[0x220756ED0](v7, -1, -1);
  }

  type metadata accessor for AXSDKShotMonitor();
  inited = swift_initStaticObject();
  if (qword_2551178E0 != -1)
    swift_once();
  __swift_project_value_buffer(v4, (uint64_t)qword_2551180B8);
  v9 = sub_21AD23EE0();
  v10 = sub_21AD2406C();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_21ACD4000, v9, v10, "AXSDKShotMonitor: Start Monitoring", v11, 2u);
    MEMORY[0x220756ED0](v11, -1, -1);
  }

  *(_QWORD *)(inited + 16) = sub_21AD0B9A8();
  swift_release();
  v13.receiver = v3;
  v13.super_class = (Class)type metadata accessor for AXSDKShotSecureControllerImplementation();
  return objc_msgSendSuper2(&v13, sel_init);
}

void sub_21ACFAD34()
{
  uint64_t v0;

  objc_release(*(id *)(v0
                     + OBJC_IVAR____TtC18AXSoundDetectionUI39AXSDKShotSecureControllerImplementation_detectorQueueManager));
}

id AXSDKShotSecureControllerImplementation.__deallocating_deinit()
{
  void *v0;
  void *v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  objc_super v7;

  v1 = v0;
  if (qword_2551178E0 != -1)
    swift_once();
  v2 = sub_21AD23EEC();
  __swift_project_value_buffer(v2, (uint64_t)qword_2551180B8);
  v3 = sub_21AD23EE0();
  v4 = sub_21AD2406C();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_21ACD4000, v3, v4, "AXSDKShotMonitor: Stop Monitoring", v5, 2u);
    MEMORY[0x220756ED0](v5, -1, -1);
  }

  if (qword_255117910)
  {
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255117930);
    sub_21AD2400C();
    swift_task_isCancelled();
    swift_release();
  }
  v7.receiver = v1;
  v7.super_class = (Class)type metadata accessor for AXSDKShotSecureControllerImplementation();
  return objc_msgSendSuper2(&v7, sel_dealloc);
}

uint64_t sub_21ACFAEFC(void *a1)
{
  return sub_21ACFAF78(a1, "[%s]: adding custom detector: %@", (uint64_t (*)(_QWORD))sub_21AD0D524);
}

uint64_t sub_21ACFAF64(void *a1)
{
  return sub_21ACFAF78(a1, "[%s]: removing custom detector: %@", (uint64_t (*)(_QWORD))sub_21AD0DA68);
}

uint64_t sub_21ACFAF78(void *a1, char *a2, uint64_t (*a3)(_QWORD))
{
  void *v3;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  id v15;
  id v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  id v20;
  char *format;
  _QWORD *v23;
  uint64_t v24;
  uint64_t (*v25)(_QWORD);
  uint64_t v26;

  if (qword_2551178E8 != -1)
    swift_once();
  v7 = sub_21AD23EEC();
  __swift_project_value_buffer(v7, (uint64_t)qword_2551180D0);
  v8 = v3;
  v9 = a1;
  v10 = v8;
  v11 = v9;
  v12 = sub_21AD23EE0();
  v13 = sub_21AD2406C();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = swift_slowAlloc();
    v23 = (_QWORD *)swift_slowAlloc();
    v24 = swift_slowAlloc();
    v26 = v24;
    *(_DWORD *)v14 = 136315394;
    v25 = a3;
    v15 = v10;
    format = a2;
    v16 = objc_msgSend(v15, sel_description);
    v17 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
    v19 = v18;

    sub_21ACF58B4(v17, v19, &v26);
    sub_21AD240CC();

    swift_bridgeObjectRelease();
    *(_WORD *)(v14 + 12) = 2112;
    v20 = v11;
    a3 = v25;
    sub_21AD240CC();
    *v23 = v11;

    _os_log_impl(&dword_21ACD4000, v12, v13, format, (uint8_t *)v14, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_255117958);
    swift_arrayDestroy();
    MEMORY[0x220756ED0](v23, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x220756ED0](v24, -1, -1);
    MEMORY[0x220756ED0](v14, -1, -1);

  }
  else
  {

  }
  return a3(v11);
}

void sub_21ACFB2F8(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  void (*v12)(char *, uint64_t, uint64_t);
  int v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  id v18;
  NSObject *v19;
  os_log_type_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  id v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  id v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  id v35;
  id v36;
  os_log_type_t v37;
  _QWORD *v38;
  id v39;
  id v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  id v47;
  id v48;
  id v49;
  id v50;
  NSObject *v51;
  os_log_type_t v52;
  uint64_t v53;
  uint64_t v54;
  id v55;
  id v56;
  uint64_t v57;
  unint64_t v58;
  unint64_t v59;
  id v60;
  uint64_t v61;
  unint64_t v62;
  unint64_t v63;
  uint64_t v64;
  id v65;
  id v66;
  id v67;
  id v68;
  NSObject *v69;
  os_log_type_t v70;
  int v71;
  uint64_t v72;
  uint64_t v73;
  id v74;
  id v75;
  uint64_t v76;
  unint64_t v77;
  unint64_t v78;
  id v79;
  id v80;
  uint64_t v81;
  unint64_t v82;
  unint64_t v83;
  uint64_t v84;
  uint64_t v85;
  unint64_t v86;
  void (*v87)(char *, uint64_t);
  id v88;
  id v89;
  _QWORD v90[2];
  id v91;
  os_log_t v92;
  uint64_t v93;
  id v94;
  uint64_t v95;
  uint64_t v96;

  v5 = sub_21AD23E68();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)v90 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)v90 - v10;
  if (objc_msgSend(a2, sel_isCustom))
  {
    v12 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
    v12(v11, a1, v5);
    v13 = (*(uint64_t (**)(char *, uint64_t))(v6 + 88))(v11, v5);
    if (v13 == *MEMORY[0x24BDE9A38])
    {
      if (qword_2551178E8 != -1)
        swift_once();
      v14 = sub_21AD23EEC();
      __swift_project_value_buffer(v14, (uint64_t)qword_2551180D0);
      v15 = v2;
      v16 = a2;
      v17 = v15;
      v18 = v16;
      v19 = sub_21AD23EE0();
      v20 = sub_21AD24048();
      if (os_log_type_enabled(v19, v20))
      {
        v21 = swift_slowAlloc();
        v22 = swift_slowAlloc();
        v96 = v22;
        *(_DWORD *)v21 = 136315394;
        v23 = v17;
        v24 = objc_msgSend(v23, sel_description);
        v25 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
        v27 = v26;

        v95 = sub_21ACF58B4(v25, v27, &v96);
        sub_21AD240CC();

        swift_bridgeObjectRelease();
        *(_WORD *)(v21 + 12) = 2080;
        v28 = objc_msgSend(v18, sel_identifier);
        v29 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
        v31 = v30;

        v95 = sub_21ACF58B4(v29, v31, &v96);
        sub_21AD240CC();

        swift_bridgeObjectRelease();
        _os_log_impl(&dword_21ACD4000, v19, v20, "[%s]: Custom Detector: %s is INACTIVE", (uint8_t *)v21, 0x16u);
        swift_arrayDestroy();
        v32 = v22;
LABEL_11:
        MEMORY[0x220756ED0](v32, -1, -1);
        MEMORY[0x220756ED0](v21, -1, -1);

        return;
      }

    }
    else if (v13 == *MEMORY[0x24BDE9A30])
    {
      if (qword_2551178E8 != -1)
        swift_once();
      v46 = sub_21AD23EEC();
      __swift_project_value_buffer(v46, (uint64_t)qword_2551180D0);
      v47 = v2;
      v48 = a2;
      v49 = v47;
      v50 = v48;
      v51 = sub_21AD23EE0();
      v52 = sub_21AD24048();
      if (os_log_type_enabled(v51, v52))
      {
        v53 = swift_slowAlloc();
        v54 = swift_slowAlloc();
        v96 = v54;
        *(_DWORD *)v53 = 136315394;
        v55 = v49;
        v56 = objc_msgSend(v55, sel_description);
        v57 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
        v59 = v58;

        v95 = sub_21ACF58B4(v57, v59, &v96);
        sub_21AD240CC();

        swift_bridgeObjectRelease();
        *(_WORD *)(v53 + 12) = 2080;
        v60 = objc_msgSend(v50, sel_identifier);
        v61 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
        v63 = v62;

        v95 = sub_21ACF58B4(v61, v63, &v96);
        sub_21AD240CC();

        swift_bridgeObjectRelease();
        _os_log_impl(&dword_21ACD4000, v51, v52, "[%s]: Custom Detector: %s is ACTIVE", (uint8_t *)v53, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x220756ED0](v54, -1, -1);
        MEMORY[0x220756ED0](v53, -1, -1);

      }
      else
      {

      }
      v89 = objc_msgSend(v50, sel_identifier);
      if (!v89)
      {
        _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
        v89 = (id)sub_21AD23F4C();
        swift_bridgeObjectRelease();
      }
      AXSDSoundDetectionGenerateUserNotificationForCustomDetector(v89, 100.0);

    }
    else
    {
      if (qword_2551178E8 != -1)
        swift_once();
      v64 = sub_21AD23EEC();
      __swift_project_value_buffer(v64, (uint64_t)qword_2551180D0);
      v12(v9, a1, v5);
      v65 = v2;
      v66 = a2;
      v67 = v65;
      v68 = v66;
      v69 = sub_21AD23EE0();
      v70 = sub_21AD24060();
      v71 = v70;
      if (os_log_type_enabled(v69, v70))
      {
        v72 = swift_slowAlloc();
        v91 = v68;
        v73 = v72;
        v94 = (id)swift_slowAlloc();
        v96 = (uint64_t)v94;
        *(_DWORD *)v73 = 136315650;
        LODWORD(v93) = v71;
        v74 = v67;
        v75 = objc_msgSend(v74, sel_description);
        v76 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
        v92 = v69;
        v78 = v77;

        v95 = sub_21ACF58B4(v76, v78, &v96);
        v90[1] = &v96;
        sub_21AD240CC();

        swift_bridgeObjectRelease();
        *(_WORD *)(v73 + 12) = 2080;
        v79 = v91;
        v80 = objc_msgSend(v91, sel_identifier);
        v81 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
        v83 = v82;

        v95 = sub_21ACF58B4(v81, v83, &v96);
        sub_21AD240CC();

        swift_bridgeObjectRelease();
        *(_WORD *)(v73 + 22) = 2080;
        v84 = sub_21ACF7DA4(&qword_255117B58, (uint64_t (*)(uint64_t))MEMORY[0x24BDE9A40], (uint64_t)&protocol conformance descriptor for AccessibilitySoundRecognition.Detection);
        v85 = sub_21AD06418(v5, v84);
        v95 = sub_21ACF58B4(v85, v86, &v96);
        sub_21AD240CC();
        swift_bridgeObjectRelease();
        v87 = *(void (**)(char *, uint64_t))(v6 + 8);
        v87(v9, v5);
        v69 = v92;
        _os_log_impl(&dword_21ACD4000, v92, (os_log_type_t)v93, "[%s]: Custom Detector: %s. FATAL ERROR - result is unknown and not handled. Result: %s", (uint8_t *)v73, 0x20u);
        v88 = v94;
        swift_arrayDestroy();
        MEMORY[0x220756ED0](v88, -1, -1);
        MEMORY[0x220756ED0](v73, -1, -1);
      }
      else
      {

        v87 = *(void (**)(char *, uint64_t))(v6 + 8);
        v87(v9, v5);
      }

      v87(v11, v5);
    }
  }
  else
  {
    if (qword_2551178E8 != -1)
      swift_once();
    v33 = sub_21AD23EEC();
    __swift_project_value_buffer(v33, (uint64_t)qword_2551180D0);
    v34 = v2;
    v35 = a2;
    v94 = v34;
    v36 = v35;
    v19 = sub_21AD23EE0();
    v37 = sub_21AD24060();
    if (os_log_type_enabled(v19, v37))
    {
      v21 = swift_slowAlloc();
      v38 = (_QWORD *)swift_slowAlloc();
      v93 = swift_slowAlloc();
      v96 = v93;
      *(_DWORD *)v21 = 136315394;
      v39 = v94;
      v40 = objc_msgSend(v39, sel_description);
      v41 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
      v43 = v42;

      v95 = sub_21ACF58B4(v41, v43, &v96);
      sub_21AD240CC();

      swift_bridgeObjectRelease();
      *(_WORD *)(v21 + 12) = 2112;
      v95 = (uint64_t)v36;
      v44 = v36;
      sub_21AD240CC();
      *v38 = v36;

      _os_log_impl(&dword_21ACD4000, v19, v37, "[%s]: Received detection for non-custom detector: %@", (uint8_t *)v21, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_255117958);
      swift_arrayDestroy();
      MEMORY[0x220756ED0](v38, -1, -1);
      v45 = v93;
      swift_arrayDestroy();
      v32 = v45;
      goto LABEL_11;
    }

  }
}

uint64_t AXSDKShotDetector.detectorIdentifier.getter@<X0>(char *a1@<X8>)
{
  void *v1;
  void *v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  uint64_t v12;
  void (*v14)(char *, char *, uint64_t);
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255117B20);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_21AD23E08();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = objc_msgSend(v2, sel_identifier);
  _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();

  sub_21AD23DE4();
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {
    sub_21ACFCA74((uint64_t)v6, &qword_255117B20);
    v12 = sub_21AD23E14();
    return (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(a1, 1, 1, v12);
  }
  else
  {
    v14 = *(void (**)(char *, char *, uint64_t))(v8 + 32);
    v14(v10, v6, v7);
    v14(a1, v10, v7);
    v15 = *MEMORY[0x24BDE9948];
    v16 = sub_21AD23E14();
    v17 = *(_QWORD *)(v16 - 8);
    (*(void (**)(char *, uint64_t, uint64_t))(v17 + 104))(a1, v15, v16);
    return (*(uint64_t (**)(char *, _QWORD, uint64_t, uint64_t))(v17 + 56))(a1, 0, 1, v16);
  }
}

uint64_t AccessibilitySoundRecognition.DetectorIdentifier.customDetector.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _BYTE v19[16];

  v1 = v0;
  v2 = sub_21AD23E14();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = &v19[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v6 = sub_21AD23E08();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = &v19[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v3 + 16))(v5, v1, v2);
  if ((*(unsigned int (**)(_BYTE *, uint64_t))(v3 + 88))(v5, v2) != *MEMORY[0x24BDE9948])
  {
    (*(void (**)(_BYTE *, uint64_t))(v3 + 8))(v5, v2);
    return 0;
  }
  (*(void (**)(_BYTE *, uint64_t))(v3 + 96))(v5, v2);
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v7 + 32))(v9, v5, v6);
  v10 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
  v11 = objc_msgSend(v10, sel_decodedKShotDetectors);

  sub_21ACFC958();
  v12 = sub_21AD23F34();

  MEMORY[0x24BDAC7A8](v13);
  *(_QWORD *)&v19[-16] = v9;
  sub_21ACFC3F0((uint64_t (*)(_QWORD *))sub_21ACFC994, (uint64_t)&v19[-32], v12);
  v15 = v14;
  v17 = v16;
  swift_bridgeObjectRelease();
  (*(void (**)(_BYTE *, uint64_t))(v7 + 8))(v9, v6);
  if (!v15)
    return 0;
  swift_bridgeObjectRelease();
  return v17;
}

uint64_t sub_21ACFC100(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  unsigned int (*v19)(uint64_t, uint64_t, uint64_t);
  uint64_t *v20;
  char v21;
  char *v22;
  void (*v23)(char *, uint64_t);
  uint64_t v25;
  char *v26;

  v3 = sub_21AD23E08();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v26 = (char *)&v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_255117B68);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_255117B20);
  v10 = MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = MEMORY[0x24BDAC7A8](v10);
  v15 = (char *)&v25 - v14;
  MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v25 - v16;
  sub_21AD23DE4();
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v15, a2, v3);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v4 + 56))(v15, 0, 1, v3);
  v18 = (uint64_t)&v8[*(int *)(v6 + 48)];
  sub_21ACFCA2C((uint64_t)v17, (uint64_t)v8);
  sub_21ACFCA2C((uint64_t)v15, v18);
  v19 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v4 + 48);
  if (v19((uint64_t)v8, 1, v3) == 1)
  {
    v20 = &qword_255117B20;
    sub_21ACFCA74((uint64_t)v15, &qword_255117B20);
    sub_21ACFCA74((uint64_t)v17, &qword_255117B20);
    if (v19(v18, 1, v3) == 1)
    {
      v21 = -1;
    }
    else
    {
      v20 = &qword_255117B68;
      v21 = 0;
    }
  }
  else
  {
    sub_21ACFCA2C((uint64_t)v8, (uint64_t)v12);
    if (v19(v18, 1, v3) == 1)
    {
      sub_21ACFCA74((uint64_t)v15, &qword_255117B20);
      sub_21ACFCA74((uint64_t)v17, &qword_255117B20);
      (*(void (**)(char *, uint64_t))(v4 + 8))(v12, v3);
      v21 = 0;
      v20 = &qword_255117B68;
    }
    else
    {
      v22 = v26;
      (*(void (**)(char *, uint64_t, uint64_t))(v4 + 32))(v26, v18, v3);
      sub_21ACF7DA4(&qword_255117B70, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA98]);
      v21 = sub_21AD23F40();
      v23 = *(void (**)(char *, uint64_t))(v4 + 8);
      v23(v22, v3);
      v20 = &qword_255117B20;
      sub_21ACFCA74((uint64_t)v15, &qword_255117B20);
      sub_21ACFCA74((uint64_t)v17, &qword_255117B20);
      v23(v12, v3);
    }
  }
  sub_21ACFCA74((uint64_t)v8, v20);
  return v21 & 1;
}

uint64_t sub_21ACFC3F0(uint64_t (*a1)(_QWORD *), uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t result;
  int64_t v11;
  unint64_t v12;
  unint64_t i;
  unint64_t v15;
  int64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  char v22;
  uint64_t v23;
  _QWORD v24[3];
  int64_t v25;

  v4 = v3;
  v23 = a3 + 64;
  v7 = 1 << *(_BYTE *)(a3 + 32);
  v8 = -1;
  if (v7 < 64)
    v8 = ~(-1 << v7);
  v9 = v8 & *(_QWORD *)(a3 + 64);
  v25 = (unint64_t)(v7 + 63) >> 6;
  result = swift_bridgeObjectRetain();
  v11 = 0;
  if (!v9)
    goto LABEL_5;
LABEL_4:
  v12 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  for (i = v12 | (v11 << 6); ; i = __clz(__rbit64(v15)) + (v11 << 6))
  {
    v17 = (uint64_t *)(*(_QWORD *)(a3 + 48) + 16 * i);
    v19 = *v17;
    v18 = v17[1];
    v20 = *(void **)(*(_QWORD *)(a3 + 56) + 8 * i);
    v24[0] = *v17;
    v24[1] = v18;
    v24[2] = v20;
    swift_bridgeObjectRetain();
    v21 = v20;
    v22 = a1(v24);
    if (v4)
    {
      swift_release();

      swift_bridgeObjectRelease();
      return v19;
    }
    if ((v22 & 1) != 0)
    {
      swift_release();
      return v19;
    }

    result = swift_bridgeObjectRelease();
    if (v9)
      goto LABEL_4;
LABEL_5:
    if (__OFADD__(v11++, 1))
      break;
    if (v11 >= v25)
      goto LABEL_28;
    v15 = *(_QWORD *)(v23 + 8 * v11);
    if (!v15)
    {
      v16 = v11 + 1;
      if (v11 + 1 >= v25)
        goto LABEL_28;
      v15 = *(_QWORD *)(v23 + 8 * v16);
      if (v15)
        goto LABEL_16;
      v16 = v11 + 2;
      if (v11 + 2 >= v25)
        goto LABEL_28;
      v15 = *(_QWORD *)(v23 + 8 * v16);
      if (v15)
        goto LABEL_16;
      v16 = v11 + 3;
      if (v11 + 3 >= v25)
        goto LABEL_28;
      v15 = *(_QWORD *)(v23 + 8 * v16);
      if (v15)
      {
LABEL_16:
        v11 = v16;
        goto LABEL_17;
      }
      v16 = v11 + 4;
      if (v11 + 4 < v25)
      {
        v15 = *(_QWORD *)(v23 + 8 * v16);
        if (!v15)
        {
          while (1)
          {
            v11 = v16 + 1;
            if (__OFADD__(v16, 1))
              goto LABEL_31;
            if (v11 >= v25)
              goto LABEL_28;
            v15 = *(_QWORD *)(v23 + 8 * v11);
            ++v16;
            if (v15)
              goto LABEL_17;
          }
        }
        goto LABEL_16;
      }
LABEL_28:
      swift_release();
      return 0;
    }
LABEL_17:
    v9 = (v15 - 1) & v15;
  }
  __break(1u);
LABEL_31:
  __break(1u);
  return result;
}

uint64_t sub_21ACFC614(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_21ACFC64C(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_21ACFC630(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_21ACFC7B4(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

uint64_t sub_21ACFC64C(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_255117B78);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 17;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8])
      memmove(v13, v14, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[16 * v8] || v13 >= &v14[16 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_21AD2424C();
  __break(1u);
  return result;
}

uint64_t sub_21ACFC7B4(char a1, int64_t a2, char a3, _QWORD *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = a4[2];
  if (v7 <= v8)
    v9 = a4[2];
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_255117B60);
    v10 = (_QWORD *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 25;
    v10[2] = v8;
    v10[3] = 2 * (v12 >> 3);
  }
  else
  {
    v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  v13 = (unint64_t)(v10 + 4);
  v14 = (unint64_t)(a4 + 4);
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= v14 + 8 * v8)
      memmove(v10 + 4, a4 + 4, 8 * v8);
    a4[2] = 0;
    goto LABEL_30;
  }
  if (v14 >= v13 + 8 * v8 || v13 >= v14 + 8 * v8)
  {
    type metadata accessor for AXSDSoundDetectionType();
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_21AD2424C();
  __break(1u);
  return result;
}

uint64_t type metadata accessor for AXSDKShotSecureControllerImplementation()
{
  return objc_opt_self();
}

unint64_t sub_21ACFC958()
{
  unint64_t result;

  result = qword_255117B28;
  if (!qword_255117B28)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_255117B28);
  }
  return result;
}

uint64_t sub_21ACFC994(uint64_t a1)
{
  uint64_t v1;

  return sub_21ACFC100(a1, *(_QWORD *)(v1 + 16)) & 1;
}

uint64_t method lookup function for AXSDKShotSecureControllerImplementation()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of AXSDKShotSecureControllerImplementation.currentDetectionTypes.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x150))();
}

uint64_t dispatch thunk of AXSDKShotSecureControllerImplementation.add(customDetector:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x158))();
}

uint64_t dispatch thunk of AXSDKShotSecureControllerImplementation.remove(customDetector:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x160))();
}

uint64_t dispatch thunk of AXSDKShotSecureControllerImplementation.removeAllListenTypes()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x168))();
}

uint64_t sub_21ACFCA2C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255117B20);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_21ACFCA74(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

BOOL sub_21ACFCAB0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_21ACFCAC8()
{
  sub_21AD242E8();
  sub_21AD242F4();
  return sub_21AD24300();
}

uint64_t sub_21ACFCB0C()
{
  return sub_21AD242F4();
}

uint64_t sub_21ACFCB34()
{
  sub_21AD242E8();
  sub_21AD242F4();
  return sub_21AD24300();
}

double sub_21ACFCB84()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation_sampleLength;
  swift_beginAccess();
  return *(double *)v1;
}

id sub_21ACFCC10()
{
  uint64_t v0;
  id *v1;

  v1 = (id *)(v0 + OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation_detectorManager);
  swift_beginAccess();
  return *v1;
}

void sub_21ACFCCB0(void *a1)
{
  uint64_t v1;
  void **v3;
  void *v4;

  v3 = (void **)(v1 + OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation_detectorManager);
  swift_beginAccess();
  v4 = *v3;
  *v3 = a1;

}

void sub_21ACFCD00(void **a1, _QWORD *a2)
{
  void *v2;
  void **v3;
  void *v4;
  id v5;

  v2 = *a1;
  v3 = (void **)(*a2 + OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation_detectorManager);
  swift_beginAccess();
  v4 = *v3;
  *v3 = v2;
  v5 = v2;

}

uint64_t (*sub_21ACFCD60())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

void sub_21ACFCDA8(void **a1, _QWORD *a2)
{
  void *v2;
  void **v3;
  void *v4;
  id v5;

  v2 = *a1;
  v3 = (void **)(*a2
               + OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation_trainingDetector);
  swift_beginAccess();
  v4 = *v3;
  *v3 = v2;
  v5 = v2;

}

void *sub_21ACFCE08()
{
  uint64_t v0;
  void **v1;
  void *v2;
  id v3;

  v1 = (void **)(v0 + OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation_trainingDetector);
  swift_beginAccess();
  v2 = *v1;
  v3 = v2;
  return v2;
}

double sub_21ACFCE54()
{
  uint64_t v0;

  return (double)(unint64_t)objc_msgSend(*(id *)(v0+ OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation_listener), sel_bufferSize);
}

id sub_21ACFCE98()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation_listener), sel_isListening);
}

uint64_t sub_21ACFCEC0()
{
  uint64_t v0;

  return *(_QWORD *)(v0
                   + OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation__visualizationBucketCount);
}

uint64_t sub_21ACFCED0(uint64_t result)
{
  uint64_t v1;

  if (__OFADD__(result, 2))
    __break(1u);
  else
    *(_QWORD *)(v1
              + OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation__visualizationBucketCount) = result + 2;
  return result;
}

_QWORD *(*sub_21ACFCEEC(_QWORD *a1))(_QWORD *result, char a2)
{
  uint64_t v1;
  uint64_t v2;

  v2 = OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation__visualizationBucketCount;
  a1[1] = v1;
  a1[2] = v2;
  *a1 = *(_QWORD *)(v1 + v2);
  return sub_21ACFCF10;
}

_QWORD *sub_21ACFCF10(_QWORD *result, char a2)
{
  uint64_t v2;
  BOOL v3;

  v2 = *result + 2;
  v3 = __OFADD__(*result, 2);
  if ((a2 & 1) != 0)
  {
    if (!v3)
    {
LABEL_8:
      *(_QWORD *)(result[1] + result[2]) = v2;
      return result;
    }
    __break(1u);
  }
  if (!v3)
    goto LABEL_8;
  __break(1u);
  return result;
}

uint64_t sub_21ACFD030()
{
  uint64_t v0;
  id *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;

  v1 = (id *)(v0 + OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation_detectorManager);
  swift_beginAccess();
  v2 = objc_msgSend(*v1, sel_currentDetectors);
  type metadata accessor for AXSDSoundDetectionType();
  v3 = sub_21AD23FAC();

  v4 = sub_21ACF7FA4(v3);
  swift_bridgeObjectRelease();
  return v4;
}

void sub_21ACFD0C8(char a1)
{
  char *v1;
  int v2;
  unsigned __int8 *v3;
  id v4;
  uint64_t v5;
  char *v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  char *v11;
  id v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  char *v17;
  NSObject *v18;
  os_log_type_t v19;
  uint8_t *v20;
  uint64_t v21;
  char *v22;
  id v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  void *v27;
  double v28;
  uint64_t v29;
  void *v30;
  char *v31;
  uint64_t aBlock[6];
  uint64_t v33;

  v2 = a1 & 1;
  v3 = (unsigned __int8 *)&v1[OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation_isActivelyTraining];
  swift_beginAccess();
  if (*v3 != v2)
  {
    v4 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
    objc_msgSend(v4, sel_setIsActivelyTrainingAKShotModel_, *v3);

    if (*v3 == 1)
    {
      if (qword_2551178E8 != -1)
        swift_once();
      v5 = sub_21AD23EEC();
      __swift_project_value_buffer(v5, (uint64_t)qword_2551180D0);
      v6 = v1;
      v7 = sub_21AD23EE0();
      v8 = sub_21AD2406C();
      if (os_log_type_enabled(v7, v8))
      {
        v9 = (uint8_t *)swift_slowAlloc();
        v10 = swift_slowAlloc();
        *(_DWORD *)v9 = 136315138;
        aBlock[0] = v10;
        v11 = v6;
        v12 = objc_msgSend(v11, sel_description);
        v13 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
        v15 = v14;

        v33 = sub_21ACF58B4(v13, v15, aBlock);
        sub_21AD240CC();

        swift_bridgeObjectRelease();
        _os_log_impl(&dword_21ACD4000, v7, v8, "[%s]: BEGIN actively training kshot model", v9, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x220756ED0](v10, -1, -1);
        MEMORY[0x220756ED0](v9, -1, -1);

      }
      else
      {

      }
      v27 = *(void **)&v6[OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation_dispatchTimer];
      v28 = *(double *)&v6[OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation_maximumActiveTrainingDuration];
      v29 = swift_allocObject();
      *(_QWORD *)(v29 + 16) = v6;
      aBlock[4] = (uint64_t)sub_21AD04D98;
      aBlock[5] = v29;
      aBlock[0] = MEMORY[0x24BDAC760];
      aBlock[1] = 1107296256;
      aBlock[2] = (uint64_t)sub_21ACF4004;
      aBlock[3] = (uint64_t)&block_descriptor_63;
      v30 = _Block_copy(aBlock);
      v31 = v6;
      swift_release();
      objc_msgSend(v27, sel_afterDelay_processBlock_, v30, v28);
      _Block_release(v30);
    }
    else
    {
      objc_msgSend(*(id *)&v1[OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation_dispatchTimer], sel_cancel);
      if (qword_2551178E8 != -1)
        swift_once();
      v16 = sub_21AD23EEC();
      __swift_project_value_buffer(v16, (uint64_t)qword_2551180D0);
      v17 = v1;
      v18 = sub_21AD23EE0();
      v19 = sub_21AD2406C();
      if (os_log_type_enabled(v18, v19))
      {
        v20 = (uint8_t *)swift_slowAlloc();
        v21 = swift_slowAlloc();
        aBlock[0] = v21;
        *(_DWORD *)v20 = 136315138;
        v22 = v17;
        v23 = objc_msgSend(v22, sel_description);
        v24 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
        v26 = v25;

        v33 = sub_21ACF58B4(v24, v26, aBlock);
        sub_21AD240CC();

        swift_bridgeObjectRelease();
        _os_log_impl(&dword_21ACD4000, v18, v19, "[%s]: END actively training kshot model", v20, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x220756ED0](v21, -1, -1);
        MEMORY[0x220756ED0](v20, -1, -1);

      }
      else
      {

      }
    }
  }
}

uint64_t sub_21ACFD55C(uint64_t a1)
{
  _BYTE *v1;
  uint64_t v2;

  v1 = (_BYTE *)(a1
               + OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation_isActivelyTraining);
  swift_beginAccess();
  v2 = *v1;
  *v1 = 0;
  return sub_21ACFD0C8(v2);
}

uint64_t sub_21ACFD5AC()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0
                         + OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation_isActivelyTraining);
  swift_beginAccess();
  return *v1;
}

id AXSDKShotNSRecordingControllerImplementation.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void AXSDKShotNSRecordingControllerImplementation.init()()
{
  _BYTE *v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  objc_class *v21;
  char *v22;
  double *v23;
  double v24;
  void *v25;
  char *v26;
  id v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  objc_super v36;

  v34 = sub_21AD24084();
  v1 = *(_QWORD *)(v34 - 8);
  MEMORY[0x24BDAC7A8](v34);
  v3 = (char *)&v33 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_21AD24078();
  MEMORY[0x24BDAC7A8](v4);
  v5 = sub_21AD23F1C();
  MEMORY[0x24BDAC7A8](v5);
  *(_QWORD *)&v0[OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation_recordingManager] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation_sampleLength] = 0x3EF7C6F8C751F177;
  *(_QWORD *)&v0[OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation_trainingDetector] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation__visualizationBucketCount] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation_maximumActiveTrainingDuration] = 0x408C200000000000;
  *(_QWORD *)&v0[OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation_maxNumberOfTrainings] = 5;
  v0[OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation_isActivelyTraining] = 0;
  v6 = qword_2551178E8;
  v7 = v0;
  if (v6 != -1)
    swift_once();
  v8 = sub_21AD23EEC();
  __swift_project_value_buffer(v8, (uint64_t)qword_2551180D0);
  v9 = sub_21AD23EE0();
  v10 = sub_21AD24054();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_21ACD4000, v9, v10, "Initializing KShot Recording Controller", v11, 2u);
    MEMORY[0x220756ED0](v11, -1, -1);
  }

  v12 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
  *(_QWORD *)&v7[OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation_listener] = v12;
  v13 = MEMORY[0x24BEE4AF8];
  *(_QWORD *)&v7[OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation_listenerHandlers] = sub_21ACFDB60(MEMORY[0x24BEE4AF8]);
  sub_21ACFA6E4();
  sub_21AD23F10();
  v35 = v13;
  sub_21ACF7DA4(&qword_255117BD8, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5688], MEMORY[0x24BEE5698]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255117BE0);
  sub_21AD03D88(&qword_255117BE8, &qword_255117BE0);
  sub_21AD240E4();
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v3, *MEMORY[0x24BEE5750], v34);
  *(_QWORD *)&v7[OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation_listenerQueue] = sub_21AD240A8();
  v14 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE4BDB8]), sel_init);
  *(_QWORD *)&v7[OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation_xpcHelperService] = v14;
  v15 = objc_msgSend(objc_allocWithZone((Class)AXSDDetectorManager), sel_init);
  *(_QWORD *)&v7[OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation_detectorManager] = v15;
  v16 = objc_msgSend(objc_allocWithZone((Class)AXSDKShotDetectorQueueManager), sel_init);
  *(_QWORD *)&v7[OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation_detectorQueueManager] = v16;
  v17 = (void *)sub_21AD24090();
  v18 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDFE490]), sel_initWithTargetSerialQueue_, v17);

  if (v18)
  {
    *(_QWORD *)&v7[OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation_dispatchTimer] = v18;
    objc_msgSend(v18, sel_setAutomaticallyCancelPendingBlockUponSchedulingNewBlock_, 1);
    v19 = v18;
    v20 = (void *)sub_21AD23F4C();
    objc_msgSend(v19, sel_setLabel_, v20);

    v21 = (objc_class *)type metadata accessor for AXSDKShotNSRecordingControllerImplementation();
    v36.receiver = v7;
    v36.super_class = v21;
    v22 = (char *)objc_msgSendSuper2(&v36, sel_init);
    v23 = (double *)&v22[OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation_sampleLength];
    swift_beginAccess();
    v24 = *v23;
    v25 = *(void **)&v22[OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation_listener];
    v26 = v22;
    v27 = objc_msgSend(objc_allocWithZone((Class)AXSDKShotRecordingManager), sel_initWithSampleLength_bufferSize_, v24, (double)(unint64_t)objc_msgSend(v25, sel_bufferSize));
    v28 = OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation_recordingManager;
    v29 = *(void **)&v26[OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation_recordingManager];
    *(_QWORD *)&v26[OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation_recordingManager] = v27;

    v30 = *(void **)&v26[v28];
    if (v30)
      objc_msgSend(v30, sel_setDelegate_, v26);
    v31 = (id *)&v26[OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation_detectorManager];
    swift_beginAccess();
    objc_msgSend(*v31, sel_setDelegate_, v26);
    objc_msgSend(*(id *)&v26[OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation_detectorQueueManager], sel_setDelegate_, v26);
    v32 = *(id *)&v26[OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation_xpcHelperService];
    objc_msgSend(v32, sel_setDelegate_, v26);

  }
  else
  {
    __break(1u);
  }
}

unint64_t sub_21ACFDB60(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  _OWORD *v4;
  id v5;
  unint64_t result;
  char v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  __int128 v11;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2551182C0);
  v2 = (_QWORD *)sub_21AD24240();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (_OWORD *)(a1 + 40);
  while (1)
  {
    v11 = *v4;
    v5 = *((id *)v4 - 1);
    swift_retain();
    result = sub_21AD1DF80((uint64_t)v5);
    if ((v7 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    *(_QWORD *)(v2[6] + 8 * result) = v5;
    *(_OWORD *)(v2[7] + 16 * result) = v11;
    v8 = v2[2];
    v9 = __OFADD__(v8, 1);
    v10 = v8 + 1;
    if (v9)
      goto LABEL_11;
    v2[2] = v10;
    v4 = (_OWORD *)((char *)v4 + 24);
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_21ACFDC7C(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  id v6;
  unint64_t result;
  char v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_255117E48);
  v2 = (_QWORD *)sub_21AD24240();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (uint64_t *)(a1 + 40);
  while (1)
  {
    v5 = *v4;
    v6 = (id)*(v4 - 1);
    swift_retain();
    result = sub_21AD1DF34((uint64_t)v6);
    if ((v8 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v9 = 8 * result;
    *(_QWORD *)(v2[6] + v9) = v6;
    *(_QWORD *)(v2[7] + v9) = v5;
    v10 = v2[2];
    v11 = __OFADD__(v10, 1);
    v12 = v10 + 1;
    if (v11)
      goto LABEL_11;
    v2[2] = v12;
    v4 += 2;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_21ACFDD84(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  id v6;
  unint64_t result;
  char v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_255117E40);
  v2 = (_QWORD *)sub_21AD24240();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (uint64_t *)(a1 + 40);
  while (1)
  {
    v5 = *v4;
    v6 = (id)*(v4 - 1);
    swift_bridgeObjectRetain();
    result = sub_21AD1DFCC((uint64_t)v6);
    if ((v8 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v9 = 8 * result;
    *(_QWORD *)(v2[6] + v9) = v6;
    *(_QWORD *)(v2[7] + v9) = v5;
    v10 = v2[2];
    v11 = __OFADD__(v10, 1);
    v12 = v10 + 1;
    if (v11)
      goto LABEL_11;
    v2[2] = v12;
    v4 += 2;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_21ACFDEAC()
{
  return sub_21ACFFC14("[%s]: start listening", (uint64_t)&unk_24DDF7778, (uint64_t)sub_21AD03D54, (uint64_t)&block_descriptor_1);
}

void sub_21ACFDF04(void *a1)
{
  void *v1;
  uint64_t v3;
  id v4;
  id v5;
  char *v6;
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  id v16;
  uint64_t v17;
  char *v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  uint64_t v22;
  char *v23;
  id v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;

  if (qword_2551178E8 != -1)
    swift_once();
  v3 = sub_21AD23EEC();
  __swift_project_value_buffer(v3, (uint64_t)qword_2551180D0);
  v4 = v1;
  v5 = a1;
  v6 = (char *)v4;
  v7 = v5;
  v8 = sub_21AD23EE0();
  v9 = sub_21AD2406C();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = swift_slowAlloc();
    v28 = (_QWORD *)swift_slowAlloc();
    v29 = swift_slowAlloc();
    v30 = v29;
    *(_DWORD *)v10 = 136315394;
    v11 = v6;
    v12 = objc_msgSend(v11, sel_description);
    v13 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
    v15 = v14;

    sub_21ACF58B4(v13, v15, &v30);
    sub_21AD240CC();

    swift_bridgeObjectRelease();
    *(_WORD *)(v10 + 12) = 2112;
    v16 = v7;
    sub_21AD240CC();
    *v28 = v7;

    _os_log_impl(&dword_21ACD4000, v8, v9, "[%s]: start listening to train detector: %@", (uint8_t *)v10, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_255117958);
    swift_arrayDestroy();
    MEMORY[0x220756ED0](v28, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x220756ED0](v29, -1, -1);
    MEMORY[0x220756ED0](v10, -1, -1);

  }
  else
  {

  }
  v17 = OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation_recordingManager;
  if (*(_QWORD *)&v6[OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation_recordingManager])
  {
    objc_msgSend(*(id *)&v6[OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation_detectorQueueManager], sel_addGeneralApplianceDetector);
    objc_msgSend(*(id *)&v6[v17], sel_setTargetDetector_, v7);
    sub_21ACFDEAC();
  }
  else
  {
    v18 = v6;
    v19 = sub_21AD23EE0();
    v20 = sub_21AD24060();
    if (os_log_type_enabled(v19, v20))
    {
      v21 = (uint8_t *)swift_slowAlloc();
      v22 = swift_slowAlloc();
      v30 = v22;
      *(_DWORD *)v21 = 136315138;
      v23 = v18;
      v24 = objc_msgSend(v23, sel_description);
      v25 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
      v27 = v26;

      sub_21ACF58B4(v25, v27, &v30);
      sub_21AD240CC();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_21ACD4000, v19, v20, "[%s]: kshot recording manager failed to start. can not start listening to train detector.", v21, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x220756ED0](v22, -1, -1);
      MEMORY[0x220756ED0](v21, -1, -1);

    }
    else
    {

    }
  }
}

uint64_t sub_21ACFE358()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  char *v12;
  char *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint8_t *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  char *v24;
  char *v25;
  uint8_t *v27;
  uint8_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t aBlock[6];

  v1 = sub_21AD23F04();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v27 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_21AD23F1C();
  v33 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v32 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2551178E8 != -1)
    swift_once();
  v7 = sub_21AD23EEC();
  __swift_project_value_buffer(v7, (uint64_t)qword_2551180D0);
  v8 = v0;
  v9 = sub_21AD23EE0();
  v10 = sub_21AD2406C();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc();
    v29 = swift_slowAlloc();
    aBlock[0] = v29;
    v30 = v5;
    *(_DWORD *)v11 = 136315138;
    v27 = v11 + 4;
    v28 = v11;
    v12 = v8;
    v13 = v4;
    v14 = v1;
    v15 = objc_msgSend(v12, sel_description);
    v16 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
    v31 = v2;
    v18 = v17;

    v1 = v14;
    v4 = v13;
    v34 = sub_21ACF58B4(v16, v18, aBlock);
    v5 = v30;
    sub_21AD240CC();

    v2 = v31;
    swift_bridgeObjectRelease();
    v19 = v28;
    _os_log_impl(&dword_21ACD4000, v9, v10, "[%s]: stop listening.", v28, 0xCu);
    v20 = v29;
    swift_arrayDestroy();
    MEMORY[0x220756ED0](v20, -1, -1);
    MEMORY[0x220756ED0](v19, -1, -1);

  }
  else
  {

  }
  objc_msgSend(*(id *)&v8[OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation_detectorQueueManager], sel_stopListening);
  sub_21ACFA6E4();
  v21 = (void *)sub_21AD24090();
  v22 = swift_allocObject();
  *(_QWORD *)(v22 + 16) = v8;
  aBlock[4] = (uint64_t)sub_21AD03DC8;
  aBlock[5] = v22;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_21ACF4004;
  aBlock[3] = (uint64_t)&block_descriptor_6_0;
  v23 = _Block_copy(aBlock);
  v24 = v8;
  swift_release();
  v25 = v32;
  sub_21AD23F10();
  aBlock[0] = MEMORY[0x24BEE4AF8];
  sub_21ACF7DA4((unint64_t *)&qword_255117940, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255118240);
  sub_21AD03D88((unint64_t *)&qword_255117950, (uint64_t *)&unk_255118240);
  sub_21AD240E4();
  MEMORY[0x220756504](0, v25, v4, v23);
  _Block_release(v23);

  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  return (*(uint64_t (**)(char *, uint64_t))(v33 + 8))(v25, v5);
}

id sub_21ACFE724(uint64_t a1)
{
  id *v2;

  objc_msgSend(*(id *)(a1 + OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation_listener), sel_removeListenDelegate_, a1);
  v2 = (id *)(a1 + OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation_detectorManager);
  swift_beginAccess();
  objc_msgSend(*v2, sel_removeAllDetectors);
  objc_msgSend(*v2, sel_stopDetection);
  return objc_msgSend(*(id *)(a1+ OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation_recordingManager), sel_reset);
}

uint64_t sub_21ACFE7F0(void *a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  os_log_type_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  id v29;
  _QWORD *v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  void *v34;
  id v35;
  id v36;
  char *v37;
  uint64_t v39;
  _QWORD *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t aBlock[6];

  v7 = sub_21AD23F04();
  v46 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v39 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_21AD23F1C();
  v48 = *(_QWORD *)(v10 - 8);
  v49 = v10;
  MEMORY[0x24BDAC7A8](v10);
  v47 = (char *)&v39 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2551178E8 != -1)
    swift_once();
  v12 = sub_21AD23EEC();
  __swift_project_value_buffer(v12, (uint64_t)qword_2551180D0);
  v13 = v3;
  v14 = a1;
  v15 = v13;
  v16 = v14;
  v17 = sub_21AD23EE0();
  v18 = sub_21AD2406C();
  if (os_log_type_enabled(v17, v18))
  {
    v19 = swift_slowAlloc();
    v44 = v9;
    v20 = v19;
    v40 = (_QWORD *)swift_slowAlloc();
    v41 = swift_slowAlloc();
    aBlock[0] = v41;
    *(_DWORD *)v20 = 136315394;
    v39 = v20 + 4;
    v21 = v15;
    v42 = a2;
    v22 = v21;
    v23 = objc_msgSend(v21, sel_description);
    v45 = v7;
    v24 = v23;
    v25 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
    v43 = a3;
    v26 = v25;
    v28 = v27;

    v50 = sub_21ACF58B4(v26, v28, aBlock);
    sub_21AD240CC();

    swift_bridgeObjectRelease();
    *(_WORD *)(v20 + 12) = 2112;
    v50 = (uint64_t)v16;
    v29 = v16;
    v7 = v45;
    a2 = v42;
    a3 = v43;
    sub_21AD240CC();
    LOBYTE(v26) = v18;
    v30 = v40;
    *v40 = v16;

    _os_log_impl(&dword_21ACD4000, v17, (os_log_type_t)v26, "[%s]: registering listener: %@", (uint8_t *)v20, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_255117958);
    swift_arrayDestroy();
    MEMORY[0x220756ED0](v30, -1, -1);
    v31 = v41;
    swift_arrayDestroy();
    MEMORY[0x220756ED0](v31, -1, -1);
    v32 = v20;
    v9 = v44;
    MEMORY[0x220756ED0](v32, -1, -1);

  }
  else
  {

  }
  v33 = (_QWORD *)swift_allocObject();
  v33[2] = v15;
  v33[3] = v16;
  v33[4] = a2;
  v33[5] = a3;
  aBlock[4] = (uint64_t)sub_21AD03E04;
  aBlock[5] = (uint64_t)v33;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_21ACF4004;
  aBlock[3] = (uint64_t)&block_descriptor_12_0;
  v34 = _Block_copy(aBlock);
  v35 = v15;
  v36 = v16;
  swift_retain();
  v37 = v47;
  sub_21AD23F10();
  v50 = MEMORY[0x24BEE4AF8];
  sub_21ACF7DA4((unint64_t *)&qword_255117940, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255118240);
  sub_21AD03D88((unint64_t *)&qword_255117950, (uint64_t *)&unk_255118240);
  sub_21AD240E4();
  MEMORY[0x220756504](0, v37, v9, v34);
  _Block_release(v34);
  (*(void (**)(char *, uint64_t))(v46 + 8))(v9, v7);
  (*(void (**)(char *, uint64_t))(v48 + 8))(v37, v49);
  return swift_release();
}

uint64_t sub_21ACFEC40(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t *v9;
  id v10;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v13;

  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a3;
  *(_QWORD *)(v8 + 24) = a4;
  v9 = (uint64_t *)(a1
                 + OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation_listenerHandlers);
  swift_beginAccess();
  v10 = a2;
  swift_retain();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v13 = *v9;
  *v9 = 0x8000000000000000;
  sub_21AD1EA6C((uint64_t)sub_21AD04DA0, v8, v10, isUniquelyReferenced_nonNull_native);
  *v9 = v13;

  swift_bridgeObjectRelease();
  return swift_endAccess();
}

uint64_t sub_21ACFEDA0(void *a1)
{
  void *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  os_log_type_t v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  id v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  id v29;
  id v30;
  char *v31;
  char *v32;
  _QWORD v34[2];
  _QWORD *v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  uint64_t aBlock[6];

  v3 = sub_21AD23F04();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v41 = (char *)v34 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_21AD23F1C();
  v39 = *(_QWORD *)(v6 - 8);
  v40 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v38 = (char *)v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2551178E8 != -1)
    swift_once();
  v8 = sub_21AD23EEC();
  __swift_project_value_buffer(v8, (uint64_t)qword_2551180D0);
  v9 = v1;
  v10 = a1;
  v11 = v9;
  v12 = v10;
  v13 = sub_21AD23EE0();
  v14 = sub_21AD2406C();
  if (os_log_type_enabled(v13, v14))
  {
    v15 = swift_slowAlloc();
    v35 = (_QWORD *)swift_slowAlloc();
    v36 = swift_slowAlloc();
    aBlock[0] = v36;
    *(_DWORD *)v15 = 136315394;
    v34[1] = v15 + 4;
    v16 = v11;
    v17 = objc_msgSend(v16, sel_description);
    v37 = v3;
    v18 = v17;
    v19 = v4;
    v20 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
    v22 = v21;

    v23 = v20;
    v4 = v19;
    v42 = sub_21ACF58B4(v23, v22, aBlock);
    sub_21AD240CC();

    swift_bridgeObjectRelease();
    *(_WORD *)(v15 + 12) = 2112;
    v42 = (uint64_t)v12;
    v24 = v12;
    v3 = v37;
    sub_21AD240CC();
    v25 = v35;
    *v35 = v12;

    _os_log_impl(&dword_21ACD4000, v13, v14, "[%s]: deregister listener: %@", (uint8_t *)v15, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_255117958);
    swift_arrayDestroy();
    MEMORY[0x220756ED0](v25, -1, -1);
    v26 = v36;
    swift_arrayDestroy();
    MEMORY[0x220756ED0](v26, -1, -1);
    MEMORY[0x220756ED0](v15, -1, -1);

  }
  else
  {

  }
  v27 = swift_allocObject();
  *(_QWORD *)(v27 + 16) = v11;
  *(_QWORD *)(v27 + 24) = v12;
  aBlock[4] = (uint64_t)sub_21AD03E3C;
  aBlock[5] = v27;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_21ACF4004;
  aBlock[3] = (uint64_t)&block_descriptor_18;
  v28 = _Block_copy(aBlock);
  v29 = v11;
  v30 = v12;
  v31 = v38;
  sub_21AD23F10();
  v42 = MEMORY[0x24BEE4AF8];
  sub_21ACF7DA4((unint64_t *)&qword_255117940, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255118240);
  sub_21AD03D88((unint64_t *)&qword_255117950, (uint64_t *)&unk_255118240);
  v32 = v41;
  sub_21AD240E4();
  MEMORY[0x220756504](0, v31, v32, v28);
  _Block_release(v28);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v32, v3);
  (*(void (**)(char *, uint64_t))(v39 + 8))(v31, v40);
  return swift_release();
}

uint64_t sub_21ACFF1CC(uint64_t a1, uint64_t a2)
{
  uint64_t *v3;
  unint64_t v4;
  char v5;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v7;
  uint64_t v9;

  v3 = (uint64_t *)(a1
                 + OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation_listenerHandlers);
  swift_beginAccess();
  swift_bridgeObjectRetain();
  v4 = sub_21AD1DF80(a2);
  LOBYTE(a2) = v5;
  swift_bridgeObjectRelease();
  if ((a2 & 1) == 0)
    return swift_endAccess();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v7 = *v3;
  v9 = *v3;
  *v3 = 0x8000000000000000;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    sub_21AD179F4();
    v7 = v9;
  }

  sub_21AD1769C(v4, v7);
  *v3 = v7;
  swift_bridgeObjectRelease();
  swift_endAccess();
  return swift_release();
}

uint64_t sub_21ACFF310(uint64_t a1, unint64_t a2)
{
  void *v2;
  id v5;
  void *v6;
  id v7;
  uint64_t v9;
  id v10;
  id v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  id v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  id v22;
  id v23;
  id v24;
  id v25;
  NSObject *v26;
  os_log_type_t v27;
  uint64_t v28;
  id v29;
  id v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  id v34;
  _QWORD *v35;
  os_log_type_t type;
  uint64_t v37;
  uint64_t v38;

  v5 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
  v6 = (void *)sub_21AD23F4C();
  v7 = objc_msgSend(v5, sel_detectorWithIdentifier_, v6);

  if (v7)
  {
    if ((objc_msgSend(v7, sel_isCustom) & 1) != 0)
    {

      return 1;
    }
    if (qword_2551178E8 != -1)
      swift_once();
    v21 = sub_21AD23EEC();
    __swift_project_value_buffer(v21, (uint64_t)qword_2551180D0);
    v22 = v2;
    swift_bridgeObjectRetain_n();
    v23 = v7;
    v24 = v22;
    v25 = v23;
    v26 = sub_21AD23EE0();
    v27 = sub_21AD24060();
    if (os_log_type_enabled(v26, v27))
    {
      type = v27;
      v28 = swift_slowAlloc();
      v35 = (_QWORD *)swift_slowAlloc();
      v37 = swift_slowAlloc();
      v38 = v37;
      *(_DWORD *)v28 = 136315650;
      v29 = v24;
      v30 = objc_msgSend(v29, sel_description);
      v31 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
      v33 = v32;

      sub_21ACF58B4(v31, v33, &v38);
      sub_21AD240CC();

      swift_bridgeObjectRelease();
      *(_WORD *)(v28 + 12) = 2080;
      swift_bridgeObjectRetain();
      sub_21ACF58B4(a1, a2, &v38);
      sub_21AD240CC();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v28 + 22) = 2112;
      v34 = v25;
      sub_21AD240CC();
      *v35 = v7;

      _os_log_impl(&dword_21ACD4000, v26, type, "[%s]: detector with identifier: %s is not a custom detector. Specified detector: %@", (uint8_t *)v28, 0x20u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_255117958);
      swift_arrayDestroy();
      MEMORY[0x220756ED0](v35, -1, -1);
      swift_arrayDestroy();
      MEMORY[0x220756ED0](v37, -1, -1);
      MEMORY[0x220756ED0](v28, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
  else
  {
    if (qword_2551178E8 != -1)
      swift_once();
    v9 = sub_21AD23EEC();
    __swift_project_value_buffer(v9, (uint64_t)qword_2551180D0);
    v10 = v2;
    swift_bridgeObjectRetain_n();
    v11 = v10;
    v12 = sub_21AD23EE0();
    v13 = sub_21AD24060();
    if (os_log_type_enabled(v12, v13))
    {
      v14 = swift_slowAlloc();
      v15 = swift_slowAlloc();
      v38 = v15;
      *(_DWORD *)v14 = 136315394;
      v16 = v11;
      v17 = objc_msgSend(v16, sel_description);
      v18 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
      v20 = v19;

      sub_21ACF58B4(v18, v20, &v38);
      sub_21AD240CC();

      swift_bridgeObjectRelease();
      *(_WORD *)(v14 + 12) = 2080;
      swift_bridgeObjectRetain();
      sub_21ACF58B4(a1, a2, &v38);
      sub_21AD240CC();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_21ACD4000, v12, v13, "[%s]: no custom detector found with identifier: %s. can not retrain.", (uint8_t *)v14, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x220756ED0](v15, -1, -1);
      MEMORY[0x220756ED0](v14, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
  return 0;
}

id sub_21ACFF8C4(void *a1)
{
  return sub_21ACFF940(a1, "[%s]: adding listen type: %s", (SEL *)&selRef_addListenType_);
}

id sub_21ACFF92C(void *a1)
{
  return sub_21ACFF940(a1, "[%s]: removing listen type: %s", (SEL *)&selRef_removeListenType_);
}

id sub_21ACFF940(void *a1, char *a2, SEL *a3)
{
  void *v3;
  uint64_t v7;
  id v8;
  id v9;
  char *v10;
  id v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  char *v15;
  id v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char *format;
  uint64_t v24;
  SEL *v25;
  uint64_t v26;

  if (qword_2551178E8 != -1)
    swift_once();
  v7 = sub_21AD23EEC();
  __swift_project_value_buffer(v7, (uint64_t)qword_2551180D0);
  v8 = v3;
  v9 = a1;
  v10 = (char *)v8;
  v11 = v9;
  v12 = sub_21AD23EE0();
  v13 = sub_21AD2406C();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = swift_slowAlloc();
    v24 = swift_slowAlloc();
    v26 = v24;
    *(_DWORD *)v14 = 136315394;
    v15 = v10;
    format = a2;
    v16 = objc_msgSend(v15, sel_description);
    v25 = a3;
    v17 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
    v19 = v18;

    sub_21ACF58B4(v17, v19, &v26);
    sub_21AD240CC();

    swift_bridgeObjectRelease();
    *(_WORD *)(v14 + 12) = 2080;
    v20 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
    sub_21ACF58B4(v20, v21, &v26);
    a3 = v25;
    sub_21AD240CC();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21ACD4000, v12, v13, format, (uint8_t *)v14, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x220756ED0](v24, -1, -1);
    MEMORY[0x220756ED0](v14, -1, -1);

  }
  else
  {

  }
  return objc_msgSend(*(id *)&v10[OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation_detectorQueueManager], *a3, v11);
}

uint64_t sub_21ACFFBF0()
{
  return sub_21ACFFC14("[%s]: removing all listen types", (uint64_t)&unk_24DDF78B8, (uint64_t)sub_21AD03E44, (uint64_t)&block_descriptor_24_0);
}

uint64_t sub_21ACFFC14(const char *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  NSObject *v15;
  os_log_type_t v16;
  uint64_t v17;
  uint8_t *v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint8_t *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  id v32;
  char *v33;
  uint8_t *v35;
  uint8_t *v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t aBlock[6];

  v42 = a1;
  v7 = sub_21AD23F04();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v35 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_21AD23F1C();
  v44 = *(_QWORD *)(v11 - 8);
  v45 = v11;
  MEMORY[0x24BDAC7A8](v11);
  v43 = (char *)&v35 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2551178E8 != -1)
    swift_once();
  v13 = sub_21AD23EEC();
  __swift_project_value_buffer(v13, (uint64_t)qword_2551180D0);
  v14 = v4;
  v15 = sub_21AD23EE0();
  v16 = sub_21AD2406C();
  if (os_log_type_enabled(v15, v16))
  {
    v38 = a4;
    v17 = swift_slowAlloc();
    v39 = v10;
    v18 = (uint8_t *)v17;
    v37 = swift_slowAlloc();
    aBlock[0] = v37;
    v36 = v18;
    *(_DWORD *)v18 = 136315138;
    v35 = v18 + 4;
    v19 = v14;
    v41 = v7;
    v20 = v19;
    v21 = objc_msgSend(v19, sel_description);
    v22 = a3;
    v23 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
    v40 = v8;
    v25 = v24;

    a4 = v38;
    v26 = v23;
    a3 = v22;
    v46 = sub_21ACF58B4(v26, v25, aBlock);
    sub_21AD240CC();

    v8 = v40;
    v7 = v41;
    swift_bridgeObjectRelease();
    v27 = v36;
    _os_log_impl(&dword_21ACD4000, v15, v16, v42, v36, 0xCu);
    v28 = v37;
    swift_arrayDestroy();
    MEMORY[0x220756ED0](v28, -1, -1);
    v10 = v39;
    MEMORY[0x220756ED0](v27, -1, -1);

  }
  else
  {

  }
  sub_21ACFA6E4();
  v29 = (void *)sub_21AD24090();
  v30 = swift_allocObject();
  *(_QWORD *)(v30 + 16) = v14;
  aBlock[4] = a3;
  aBlock[5] = v30;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_21ACF4004;
  aBlock[3] = a4;
  v31 = _Block_copy(aBlock);
  v32 = v14;
  swift_release();
  v33 = v43;
  sub_21AD23F10();
  aBlock[0] = MEMORY[0x24BEE4AF8];
  sub_21ACF7DA4((unint64_t *)&qword_255117940, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255118240);
  sub_21AD03D88((unint64_t *)&qword_255117950, (uint64_t *)&unk_255118240);
  sub_21AD240E4();
  MEMORY[0x220756504](0, v33, v10, v31);
  _Block_release(v31);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return (*(uint64_t (**)(char *, uint64_t))(v44 + 8))(v33, v45);
}

void sub_21ACFFFFC(void *a1)
{
  void *v1;
  uint64_t v3;
  id v4;
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  uint64_t v10;
  _QWORD *v11;
  id v12;
  id v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  NSObject *v22;
  os_log_type_t v23;
  uint64_t v24;
  _QWORD *v25;
  id v26;
  id v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  id v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  uint64_t v35;

  if (qword_2551178E8 != -1)
    swift_once();
  v3 = sub_21AD23EEC();
  __swift_project_value_buffer(v3, (uint64_t)qword_2551180D0);
  v4 = v1;
  v5 = a1;
  v6 = v4;
  v7 = v5;
  v8 = sub_21AD23EE0();
  v9 = sub_21AD2406C();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = swift_slowAlloc();
    v11 = (_QWORD *)swift_slowAlloc();
    v32 = swift_slowAlloc();
    v35 = v32;
    *(_DWORD *)v10 = 136315394;
    v12 = v6;
    v33 = v6;
    v13 = objc_msgSend(v12, sel_description);
    v14 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
    v16 = v15;

    sub_21ACF58B4(v14, v16, &v35);
    sub_21AD240CC();

    swift_bridgeObjectRelease();
    *(_WORD *)(v10 + 12) = 2112;
    v17 = v7;
    v6 = v33;
    sub_21AD240CC();
    *v11 = v7;

    _os_log_impl(&dword_21ACD4000, v8, v9, "[%s]: handle ML error with detector: %@.", (uint8_t *)v10, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_255117958);
    swift_arrayDestroy();
    MEMORY[0x220756ED0](v11, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x220756ED0](v32, -1, -1);
    MEMORY[0x220756ED0](v10, -1, -1);

  }
  else
  {

  }
  if ((unint64_t)objc_msgSend(v7, sel_trainings) >= 5)
  {
    v18 = v6;
    v19 = v7;
    v20 = v18;
    v21 = v19;
    v22 = sub_21AD23EE0();
    v23 = sub_21AD24060();
    if (os_log_type_enabled(v22, v23))
    {
      v24 = swift_slowAlloc();
      v25 = (_QWORD *)swift_slowAlloc();
      v34 = swift_slowAlloc();
      v35 = v34;
      *(_DWORD *)v24 = 136315650;
      v26 = v20;
      v27 = objc_msgSend(v26, sel_description);
      v28 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
      v30 = v29;

      sub_21ACF58B4(v28, v30, &v35);
      sub_21AD240CC();

      swift_bridgeObjectRelease();
      *(_WORD *)(v24 + 12) = 2048;

      sub_21AD240CC();
      *(_WORD *)(v24 + 22) = 2112;
      v31 = v21;
      sub_21AD240CC();
      *v25 = v21;

      _os_log_impl(&dword_21ACD4000, v22, v23, "[%s]: attempted %ld trainings. marking detector as failed. Detector: %@", (uint8_t *)v24, 0x20u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_255117958);
      swift_arrayDestroy();
      MEMORY[0x220756ED0](v25, -1, -1);
      swift_arrayDestroy();
      MEMORY[0x220756ED0](v34, -1, -1);
      MEMORY[0x220756ED0](v24, -1, -1);

    }
    else
    {

    }
    sub_21AD04090(v21, 0);
  }
}

void sub_21AD004AC(void *a1, uint64_t a2, char *a3)
{
  void *v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  id v18;
  char *v19;
  id v20;
  NSObject *v21;
  os_log_type_t v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  char *v27;
  id v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  id v34;
  _QWORD *v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  char *v39;
  char v40;
  uint64_t v41;
  char *v42;
  id v43;
  char *v44;
  char *v45;
  id v46;
  char *v47;
  NSObject *v48;
  os_log_type_t v49;
  uint64_t v50;
  _QWORD *v51;
  char *v52;
  id v53;
  uint64_t v54;
  char *v55;
  unint64_t v56;
  unint64_t v57;
  id v58;
  char *v59;
  uint64_t v60;
  NSObject *v61;
  uint64_t v62;
  _QWORD v63[2];
  _QWORD *v64;
  int v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  char *v70;
  NSObject *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74[4];

  v74[3] = *MEMORY[0x24BDAC8D0];
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_255117C10);
  v8 = MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)v63 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = MEMORY[0x24BDAC7A8](v8);
  v71 = ((char *)v63 - v12);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)v63 - v13;
  if (qword_2551178E8 != -1)
    swift_once();
  v15 = sub_21AD23EEC();
  v16 = __swift_project_value_buffer(v15, (uint64_t)qword_2551180D0);
  sub_21AD04D1C(a2, (uint64_t)v14);
  v17 = v3;
  v18 = a1;
  v19 = (char *)v17;
  v20 = v18;
  v21 = sub_21AD23EE0();
  v22 = sub_21AD2406C();
  v23 = v22;
  if (os_log_type_enabled(v21, v22))
  {
    v24 = swift_slowAlloc();
    v65 = v23;
    v25 = v24;
    v64 = (_QWORD *)swift_slowAlloc();
    v66 = swift_slowAlloc();
    v74[0] = v66;
    *(_DWORD *)v25 = 136315650;
    v67 = v16;
    v26 = v19;
    v63[1] = v7;
    v27 = v26;
    v28 = objc_msgSend(v26, sel_description);
    v68 = a2;
    v29 = v28;
    v30 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
    v69 = (uint64_t)v10;
    v70 = a3;
    v31 = v30;
    v33 = v32;

    v73 = sub_21ACF58B4(v31, v33, v74);
    sub_21AD240CC();

    swift_bridgeObjectRelease();
    *(_WORD *)(v25 + 12) = 2112;
    v73 = (uint64_t)v20;
    v34 = v20;
    sub_21AD240CC();
    v35 = v64;
    *v64 = v20;

    *(_WORD *)(v25 + 22) = 2080;
    sub_21AD04D1C((uint64_t)v14, (uint64_t)v71);
    v36 = sub_21AD23F7C();
    v73 = sub_21ACF58B4(v36, v37, v74);
    a2 = v68;
    a3 = v70;
    sub_21AD240CC();
    v10 = (char *)v69;
    swift_bridgeObjectRelease();
    sub_21AD03E98((uint64_t)v14);
    _os_log_impl(&dword_21ACD4000, v21, (os_log_type_t)v65, "[%s]: handle ML result with detector: %@ - model URL: %s", (uint8_t *)v25, 0x20u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_255117958);
    swift_arrayDestroy();
    MEMORY[0x220756ED0](v35, -1, -1);
    v38 = v66;
    swift_arrayDestroy();
    MEMORY[0x220756ED0](v38, -1, -1);
    MEMORY[0x220756ED0](v25, -1, -1);
  }
  else
  {

    sub_21AD03E98((uint64_t)v14);
  }

  v39 = &v19[OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation_isActivelyTraining];
  swift_beginAccess();
  v40 = *v39;
  *v39 = 0;
  sub_21ACFD0C8(v40);
  sub_21AD04D1C(a2, (uint64_t)v10);
  v41 = sub_21AD23D9C();
  LODWORD(v39) = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v41 - 8) + 48))(v10, 1, v41);
  sub_21AD03E98((uint64_t)v10);
  if ((_DWORD)v39 == 1)
  {
    v42 = v19;
    v43 = v20;
    v44 = a3;
    v45 = v42;
    v46 = v43;
    v47 = a3;
    v48 = sub_21AD23EE0();
    v49 = sub_21AD24060();
    v71 = v48;
    if (os_log_type_enabled(v48, v49))
    {
      v50 = swift_slowAlloc();
      v51 = (_QWORD *)swift_slowAlloc();
      v69 = swift_slowAlloc();
      v73 = v69;
      *(_DWORD *)v50 = 136315650;
      v70 = v45;
      v52 = v45;
      v53 = objc_msgSend(v52, sel_description);
      v54 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
      v55 = a3;
      v57 = v56;

      v72 = sub_21ACF58B4(v54, v57, &v73);
      sub_21AD240CC();

      swift_bridgeObjectRelease();
      *(_WORD *)(v50 + 12) = 2112;
      v72 = (uint64_t)v46;
      v58 = v46;
      sub_21AD240CC();
      *v51 = v46;

      *(_WORD *)(v50 + 22) = 2112;
      if (v55)
      {
        v59 = v55;
        v60 = _swift_stdlib_bridgeErrorToNSError();
        v72 = v60;
        sub_21AD240CC();
      }
      else
      {
        v72 = 0;
        sub_21AD240CC();
        v60 = 0;
      }
      v51[1] = v60;

      v61 = v71;
      _os_log_impl(&dword_21ACD4000, v71, v49, "[%s]: k-shot model creation failed for detector: %@ - error: %@", (uint8_t *)v50, 0x20u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_255117958);
      swift_arrayDestroy();
      MEMORY[0x220756ED0](v51, -1, -1);
      v62 = v69;
      swift_arrayDestroy();
      MEMORY[0x220756ED0](v62, -1, -1);
      MEMORY[0x220756ED0](v50, -1, -1);

    }
    else
    {

    }
    sub_21ACFFFFC(v46);
  }
  else
  {
    sub_21AD04090(v20, 1);
  }
}

void sub_21AD00B64(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  id v24;
  id v25;
  char *v26;
  id v27;
  NSObject *v28;
  os_log_type_t v29;
  _BOOL4 v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  id v34;
  id v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  id v39;
  _QWORD *v40;
  uint64_t v41;
  uint64_t v42;
  void **v43;
  void *v44;
  id v45;
  void *v46;
  id v47;
  char *v48;
  void *v49;
  id v50;
  id v51;
  uint8_t *v52;
  uint64_t v53;
  void (*v54)(uint64_t, uint64_t, uint64_t, _QWORD *);
  uint64_t v55;
  unsigned int (*v56)(uint64_t, uint64_t, _QWORD *);
  _QWORD *v57;
  NSObject *v58;
  os_log_type_t v59;
  uint8_t *v60;
  uint64_t v61;
  _QWORD *v62;
  id v63;
  uint64_t v64;
  unint64_t v65;
  unint64_t v66;
  void *v67;
  id v68;
  _BYTE *v69;
  char *v70;
  char *v71;
  void (*v72)(char *, char *, _QWORD *);
  void *v73;
  id v74;
  id v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  _QWORD *v79;
  NSObject *v80;
  os_log_type_t v81;
  uint8_t *v82;
  _QWORD *v83;
  id v84;
  _QWORD *v85;
  uint64_t v86;
  unint64_t v87;
  unint64_t v88;
  uint64_t v89;
  id v90;
  uint8_t *v91;
  id v92;
  _BYTE *v93;
  char *v94;
  char *v95;
  char *v96;
  NSObject *v97;
  os_log_type_t v98;
  int v99;
  uint64_t v100;
  char *v101;
  id v102;
  id v103;
  _QWORD *v104;
  uint64_t v105;
  unint64_t v106;
  unint64_t v107;
  uint64_t v108;
  unint64_t v109;
  uint64_t v110;
  unint64_t v111;
  char *v112;
  void *v113;
  char *v114;
  char v115;
  id v116;
  char *v117;
  char *v118;
  void *v119;
  id v120;
  id v121;
  char *v122;
  char *v123;
  void *v124;
  uint64_t v125;
  void *v126;
  char *v127;
  id v128;
  char *v129;
  void (*v130)(char *, _QWORD *);
  uint64_t v131;
  id v132;
  char *v133;
  uint64_t v134;
  uint64_t v135;
  char *v136;
  char *v137;
  _QWORD *v138;
  char *v139;
  uint64_t v140;
  _QWORD *v141;
  uint64_t v142;
  char *v143;
  char *v144;
  char *v145;
  char *v146;
  char *v147;
  uint64_t aBlock[6];
  uint64_t v149;
  uint64_t v150;
  uint8_t *v151;

  v3 = v2;
  v5 = sub_21AD23DD8();
  v134 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v133 = (char *)&v131 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_255117C10);
  v8 = MEMORY[0x24BDAC7A8](v7);
  v137 = (char *)&v131 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v139 = (char *)&v131 - v11;
  v12 = MEMORY[0x24BDAC7A8](v10);
  v144 = (char *)&v131 - v13;
  MEMORY[0x24BDAC7A8](v12);
  v146 = (char *)&v131 - v14;
  v15 = (_QWORD *)sub_21AD23D9C();
  v151 = (uint8_t *)*(v15 - 1);
  v16 = MEMORY[0x24BDAC7A8](v15);
  v18 = (char *)&v131 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = MEMORY[0x24BDAC7A8](v16);
  v143 = (char *)&v131 - v20;
  MEMORY[0x24BDAC7A8](v19);
  v145 = (char *)&v131 - v21;
  if (qword_2551178E8 != -1)
    swift_once();
  v22 = sub_21AD23EEC();
  v23 = (char *)__swift_project_value_buffer(v22, (uint64_t)qword_2551180D0);
  v24 = v1;
  v25 = a1;
  v26 = (char *)v24;
  v27 = v25;
  v28 = sub_21AD23EE0();
  v29 = sub_21AD2406C();
  v30 = os_log_type_enabled(v28, v29);
  v136 = v18;
  v135 = v5;
  v147 = v23;
  if (v30)
  {
    v31 = swift_slowAlloc();
    v141 = v15;
    v32 = v31;
    v138 = (_QWORD *)swift_slowAlloc();
    v140 = swift_slowAlloc();
    aBlock[0] = v140;
    *(_DWORD *)v32 = 136315394;
    v132 = (id)(v32 + 4);
    v33 = v26;
    v34 = objc_msgSend(v33, sel_description);
    v142 = v2;
    v35 = v34;
    v36 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
    v38 = v37;

    v150 = sub_21ACF58B4(v36, v38, aBlock);
    sub_21AD240CC();

    swift_bridgeObjectRelease();
    *(_WORD *)(v32 + 12) = 2112;
    v150 = (uint64_t)v27;
    v39 = v27;
    v3 = v142;
    sub_21AD240CC();
    v40 = v138;
    *v138 = v27;

    _os_log_impl(&dword_21ACD4000, v28, v29, "[%s]: kicking off training of detector: %@", (uint8_t *)v32, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_255117958);
    swift_arrayDestroy();
    MEMORY[0x220756ED0](v40, -1, -1);
    v41 = v140;
    swift_arrayDestroy();
    MEMORY[0x220756ED0](v41, -1, -1);
    v42 = v32;
    v15 = v141;
    MEMORY[0x220756ED0](v42, -1, -1);

  }
  else
  {

  }
  v43 = (void **)&v26[OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation_trainingDetector];
  swift_beginAccess();
  v44 = *v43;
  *v43 = v27;
  v45 = v27;

  v46 = *v43;
  if (*v43)
  {
    v141 = v26;
    v47 = v46;
    AXSDSoundDetectionRequestNotificationAuthorization();
    v138 = (_QWORD *)objc_opt_self();
    v48 = (char *)objc_msgSend(v138, sel_sharedInstance);
    _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
    v49 = (void *)sub_21AD23F4C();
    swift_bridgeObjectRelease();
    v50 = objc_msgSend(v48, sel_detectorWithName_, v49);

    v140 = (uint64_t)v47;
    if (!v50)
    {
      v55 = (uint64_t)v146;
      (*((void (**)(char *, uint64_t, uint64_t, _QWORD *))v151 + 7))(v146, 1, 1, v15);
LABEL_13:
      sub_21AD03E98(v55);
      v57 = v141;
      v58 = sub_21AD23EE0();
      v59 = sub_21AD2406C();
      if (os_log_type_enabled(v58, v59))
      {
        v146 = v48;
        v60 = (uint8_t *)swift_slowAlloc();
        v61 = swift_slowAlloc();
        aBlock[0] = v61;
        *(_DWORD *)v60 = 136315138;
        v151 = v60 + 4;
        v62 = v57;
        v63 = objc_msgSend(v62, sel_description);
        v64 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
        v66 = v65;

        v149 = sub_21ACF58B4(v64, v66, aBlock);
        sub_21AD240CC();

        v48 = v146;
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_21ACD4000, v58, v59, "[%s]: unable to train detector. Hallucinator asset is not downloaded.", v60, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x220756ED0](v61, -1, -1);
        MEMORY[0x220756ED0](v60, -1, -1);

      }
      else
      {

      }
      v67 = (void *)v140;
      v68 = objc_msgSend(v138, sel_sharedInstance);
      objc_msgSend(v68, sel_downloadDetectors);

      sub_21AD03ED8();
      swift_allocError();
      *v69 = 0;
      swift_willThrow();
LABEL_27:

      return;
    }
    v51 = objc_msgSend(v50, sel_modelURL);

    v52 = v151;
    v132 = v45;
    if (v51)
    {
      v53 = (uint64_t)v144;
      sub_21AD23D84();

      v54 = (void (*)(uint64_t, uint64_t, uint64_t, _QWORD *))*((_QWORD *)v52 + 7);
      v54(v53, 0, 1, v15);
    }
    else
    {
      v54 = (void (*)(uint64_t, uint64_t, uint64_t, _QWORD *))*((_QWORD *)v151 + 7);
      v53 = (uint64_t)v144;
      v54((uint64_t)v144, 1, 1, v15);
    }
    v55 = (uint64_t)v146;
    sub_21AD03F1C(v53, (uint64_t)v146);
    v56 = (unsigned int (*)(uint64_t, uint64_t, _QWORD *))*((_QWORD *)v52 + 6);
    if (v56(v55, 1, v15) == 1)
      goto LABEL_13;
    v142 = v3;
    v70 = v145;
    v144 = (char *)*((_QWORD *)v52 + 4);
    ((void (*)(char *, uint64_t, _QWORD *))v144)(v145, v55, v15);
    _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
    v71 = v143;
    sub_21AD23D78();
    swift_bridgeObjectRelease();
    v72 = (void (*)(char *, char *, _QWORD *))*((_QWORD *)v52 + 5);
    v72(v70, v71, v15);
    _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
    v73 = (void *)sub_21AD23F4C();
    swift_bridgeObjectRelease();
    v146 = v48;
    v74 = objc_msgSend(v48, sel_detectorWithName_, v73);

    if (!v74)
    {
      v78 = (uint64_t)v139;
      v54((uint64_t)v139, 1, 1, v15);
LABEL_23:
      sub_21AD03E98(v78);
      v79 = v141;
      v80 = sub_21AD23EE0();
      v81 = sub_21AD2406C();
      if (os_log_type_enabled(v80, v81))
      {
        v82 = (uint8_t *)swift_slowAlloc();
        v147 = (char *)swift_slowAlloc();
        aBlock[0] = (uint64_t)v147;
        *(_DWORD *)v82 = 136315138;
        v144 = (char *)(v82 + 4);
        v83 = v79;
        v84 = objc_msgSend(v83, sel_description);
        v85 = v15;
        v86 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
        v88 = v87;

        v89 = v86;
        v15 = v85;
        v149 = sub_21ACF58B4(v89, v88, aBlock);
        sub_21AD240CC();

        swift_bridgeObjectRelease();
        _os_log_impl(&dword_21ACD4000, v80, v81, "[%s]: unable to train detector. Model Weights asset is not downloaded.", v82, 0xCu);
        v90 = v147;
        swift_arrayDestroy();
        MEMORY[0x220756ED0](v90, -1, -1);
        MEMORY[0x220756ED0](v82, -1, -1);

      }
      else
      {

      }
      v91 = v151;
      v48 = v146;
      v67 = (void *)v140;
      v92 = objc_msgSend(v138, sel_sharedInstance);
      objc_msgSend(v92, sel_downloadDetectors);

      sub_21AD03ED8();
      swift_allocError();
      *v93 = 1;
      swift_willThrow();
      (*((void (**)(char *, _QWORD *))v91 + 1))(v145, v15);
      goto LABEL_27;
    }
    v75 = objc_msgSend(v74, sel_modelURL);

    if (v75)
    {
      v76 = (uint64_t)v137;
      sub_21AD23D84();

      v77 = 0;
      v78 = (uint64_t)v139;
    }
    else
    {
      v77 = 1;
      v78 = (uint64_t)v139;
      v76 = (uint64_t)v137;
    }
    v54(v76, v77, 1, v15);
    sub_21AD03F1C(v76, v78);
    if (v56(v78, 1, v15) == 1)
      goto LABEL_23;
    v94 = v136;
    ((void (*)(char *, uint64_t, _QWORD *))v144)(v136, v78, v15);
    _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
    v95 = v143;
    sub_21AD23D78();
    swift_bridgeObjectRelease();
    v72(v94, v95, v15);
    v96 = v141;
    v97 = sub_21AD23EE0();
    v98 = sub_21AD2406C();
    v99 = v98;
    if (os_log_type_enabled(v97, v98))
    {
      v100 = swift_slowAlloc();
      v144 = (char *)swift_slowAlloc();
      aBlock[0] = (uint64_t)v144;
      *(_DWORD *)v100 = 136315650;
      LODWORD(v143) = v99;
      v101 = v96;
      v102 = objc_msgSend(v101, sel_description);
      v147 = v96;
      v103 = v102;
      v104 = v15;
      v105 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
      v107 = v106;

      v149 = sub_21ACF58B4(v105, v107, aBlock);
      sub_21AD240CC();

      swift_bridgeObjectRelease();
      *(_WORD *)(v100 + 12) = 2080;
      swift_beginAccess();
      sub_21ACF7DA4(&qword_255117C20, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDB28]);
      v108 = sub_21AD24270();
      v149 = sub_21ACF58B4(v108, v109, aBlock);
      sub_21AD240CC();
      swift_bridgeObjectRelease();
      *(_WORD *)(v100 + 22) = 2080;
      v15 = v104;
      swift_beginAccess();
      v110 = sub_21AD24270();
      v149 = sub_21ACF58B4(v110, v111, aBlock);
      v96 = v147;
      sub_21AD240CC();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_21ACD4000, v97, (os_log_type_t)v143, "[%s]: using model paths: \n\t hallucinator model: %s \n\t model weights path: %s", (uint8_t *)v100, 0x20u);
      v112 = v144;
      swift_arrayDestroy();
      MEMORY[0x220756ED0](v112, -1, -1);
      MEMORY[0x220756ED0](v100, -1, -1);

    }
    else
    {

    }
    v113 = (void *)v140;
    v114 = &v96[OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation_isActivelyTraining];
    swift_beginAccess();
    v115 = *v114;
    *v114 = 1;
    sub_21ACFD0C8(v115);
    v116 = v132;
    v117 = (char *)objc_msgSend(v132, sel_trainings);
    if (v117 == (char *)-1)
    {
      __break(1u);
    }
    else
    {
      objc_msgSend(v116, sel_setTrainings_, v117 + 1);
      v118 = v133;
      sub_21AD23DCC();
      v119 = (void *)sub_21AD23DA8();
      (*(void (**)(char *, uint64_t))(v134 + 8))(v118, v135);
      objc_msgSend(v116, sel_setLastAttemptedTrainingDate_, v119);

      v120 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
      objc_msgSend(v120, sel_updateKShotDetector_, v116);

      v147 = *(char **)&v96[OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation_xpcHelperService];
      v121 = objc_msgSend(v113, sel_identifier);
      if (!v121)
      {
        _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
        v121 = (id)sub_21AD23F4C();
        swift_bridgeObjectRelease();
      }
      v122 = v145;
      swift_beginAccess();
      v144 = (char *)sub_21AD23D6C();
      v123 = v136;
      swift_beginAccess();
      v124 = (void *)sub_21AD23D6C();
      v125 = swift_allocObject();
      *(_QWORD *)(v125 + 16) = v96;
      *(_QWORD *)(v125 + 24) = v113;
      aBlock[4] = (uint64_t)sub_21AD03F64;
      aBlock[5] = v125;
      aBlock[0] = MEMORY[0x24BDAC760];
      aBlock[1] = 1107296256;
      aBlock[2] = (uint64_t)sub_21AD01BE4;
      aBlock[3] = (uint64_t)&block_descriptor_30;
      v126 = _Block_copy(aBlock);
      v127 = v96;
      v128 = v113;
      swift_release();
      v129 = v144;
      objc_msgSend(v147, sel_trainWithDetectorID_hallucinatorPath_pretrainedWeightsPath_resultHandler_, v121, v144, v124, v126);
      _Block_release(v126);

      v130 = (void (*)(char *, _QWORD *))*((_QWORD *)v151 + 1);
      v130(v123, v15);
      v130(v122, v15);

    }
  }
}

uint64_t sub_21AD01BE4(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  void (*v9)(char *, void *);
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v14;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_255117C10);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *(void (**)(char *, void *))(a1 + 32);
  if (a2)
  {
    sub_21AD23D84();
    v10 = sub_21AD23D9C();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v8, 0, 1, v10);
  }
  else
  {
    v11 = sub_21AD23D9C();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v8, 1, 1, v11);
  }
  swift_retain();
  v12 = a3;
  v9(v8, a3);
  swift_release();

  return sub_21AD03E98((uint64_t)v8);
}

id AXSDKShotNSRecordingControllerImplementation.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AXSDKShotNSRecordingControllerImplementation();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void AXSDKShotNSRecordingControllerImplementation.listenEngineFailedToStartWithError(_:)(void *a1)
{
  void *v1;
  uint64_t v3;
  id v4;
  id v5;
  id v6;
  id v7;
  os_log_type_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  id v12;
  id v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  id v17;
  NSObject *oslog;
  uint64_t v19;
  uint64_t v20;

  if (qword_2551178E8 != -1)
    swift_once();
  v3 = sub_21AD23EEC();
  __swift_project_value_buffer(v3, (uint64_t)qword_2551180D0);
  v4 = v1;
  v5 = a1;
  v6 = v4;
  v7 = a1;
  oslog = sub_21AD23EE0();
  v8 = sub_21AD24060();
  if (os_log_type_enabled(oslog, v8))
  {
    v9 = swift_slowAlloc();
    v10 = (_QWORD *)swift_slowAlloc();
    v11 = swift_slowAlloc();
    v20 = v11;
    *(_DWORD *)v9 = 136315394;
    v12 = v6;
    v13 = objc_msgSend(v12, sel_description);
    v14 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
    v16 = v15;

    sub_21ACF58B4(v14, v16, &v20);
    sub_21AD240CC();

    swift_bridgeObjectRelease();
    *(_WORD *)(v9 + 12) = 2112;
    v17 = a1;
    v19 = _swift_stdlib_bridgeErrorToNSError();
    sub_21AD240CC();
    *v10 = v19;

    _os_log_impl(&dword_21ACD4000, oslog, v8, "[%s]: listener engine failed to start with error: %@", (uint8_t *)v9, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_255117958);
    swift_arrayDestroy();
    MEMORY[0x220756ED0](v10, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x220756ED0](v11, -1, -1);
    MEMORY[0x220756ED0](v9, -1, -1);

  }
  else
  {

  }
}

Swift::Void __swiftcall AXSDKShotNSRecordingControllerImplementation.listenEngineDidStart(withInputFormat:)(AVAudioFormat_optional *withInputFormat)
{
  void *v1;
  void *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  AVAudioFormat_optional *v10;
  id v11;
  AVAudioFormat_optional *v12;
  id v13;
  NSObject *v14;
  os_log_type_t v15;
  uint64_t v16;
  id v17;
  id v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  AVAudioFormat_optional *v22;
  AVAudioFormat_optional *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  id v27;
  AVAudioFormat_optional *v28;
  char *v29;
  char *v30;
  _QWORD *v31;
  uint64_t v32;
  id v33;
  NSObject *v34;
  os_log_type_t v35;
  uint8_t *v36;
  uint64_t v37;
  id v38;
  id v39;
  uint64_t v40;
  unint64_t v41;
  unint64_t v42;
  _QWORD *v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t aBlock[7];

  v2 = v1;
  aBlock[6] = *MEMORY[0x24BDAC8D0];
  v4 = sub_21AD23F04();
  v52 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v51 = (char *)&v43 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_21AD23F1C();
  v49 = *(_QWORD *)(v6 - 8);
  v50 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v48 = (char *)&v43 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2551178E8 != -1)
    swift_once();
  v8 = sub_21AD23EEC();
  v9 = __swift_project_value_buffer(v8, (uint64_t)qword_2551180D0);
  v10 = withInputFormat;
  v11 = v2;
  v12 = v10;
  v13 = v11;
  v14 = sub_21AD23EE0();
  v15 = sub_21AD24060();
  if (os_log_type_enabled(v14, v15))
  {
    v45 = v9;
    v47 = v4;
    v16 = swift_slowAlloc();
    v43 = (_QWORD *)swift_slowAlloc();
    v44 = swift_slowAlloc();
    aBlock[0] = v44;
    *(_DWORD *)v16 = 136315394;
    v46 = v13;
    v17 = v13;
    v18 = objc_msgSend(v17, sel_description);
    v19 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
    v21 = v20;

    v53 = sub_21ACF58B4(v19, v21, aBlock);
    sub_21AD240CC();

    swift_bridgeObjectRelease();
    *(_WORD *)(v16 + 12) = 2112;
    if (withInputFormat)
    {
      v53 = (uint64_t)v12;
      v22 = v12;
    }
    else
    {
      v53 = 0;
    }
    sub_21AD240CC();
    v31 = v43;
    *v43 = withInputFormat;

    _os_log_impl(&dword_21ACD4000, v14, v15, "[%s]: listen engine did start with format: %@", (uint8_t *)v16, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_255117958);
    swift_arrayDestroy();
    MEMORY[0x220756ED0](v31, -1, -1);
    v32 = v44;
    swift_arrayDestroy();
    MEMORY[0x220756ED0](v32, -1, -1);
    MEMORY[0x220756ED0](v16, -1, -1);

    v13 = v46;
    v4 = v47;
    if (!withInputFormat)
      goto LABEL_10;
LABEL_7:
    sub_21ACFA6E4();
    v23 = v12;
    v24 = (void *)sub_21AD24090();
    v25 = swift_allocObject();
    *(_QWORD *)(v25 + 16) = v13;
    *(_QWORD *)(v25 + 24) = v23;
    aBlock[4] = (uint64_t)sub_21AD03F90;
    aBlock[5] = v25;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_21ACF4004;
    aBlock[3] = (uint64_t)&block_descriptor_36;
    v26 = _Block_copy(aBlock);
    v27 = v13;
    v28 = v23;
    swift_release();
    v29 = v48;
    sub_21AD23F10();
    aBlock[0] = MEMORY[0x24BEE4AF8];
    sub_21ACF7DA4((unint64_t *)&qword_255117940, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255118240);
    sub_21AD03D88((unint64_t *)&qword_255117950, (uint64_t *)&unk_255118240);
    v30 = v51;
    sub_21AD240E4();
    MEMORY[0x220756504](0, v29, v30, v26);
    _Block_release(v26);

    (*(void (**)(char *, uint64_t))(v52 + 8))(v30, v4);
    (*(void (**)(char *, uint64_t))(v49 + 8))(v29, v50);
    return;
  }

  if (withInputFormat)
    goto LABEL_7;
LABEL_10:
  v33 = v13;
  v34 = sub_21AD23EE0();
  v35 = sub_21AD24060();
  if (os_log_type_enabled(v34, v35))
  {
    v36 = (uint8_t *)swift_slowAlloc();
    v37 = swift_slowAlloc();
    aBlock[0] = v37;
    *(_DWORD *)v36 = 136315138;
    v38 = v33;
    v39 = objc_msgSend(v38, sel_description);
    v40 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
    v42 = v41;

    v53 = sub_21ACF58B4(v40, v42, aBlock);
    sub_21AD240CC();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21ACD4000, v34, v35, "[%s]: listen engine did not return an audio format. This should NOT happen; bailing. File a radar!",
      v36,
      0xCu);
    swift_arrayDestroy();
    MEMORY[0x220756ED0](v37, -1, -1);
    MEMORY[0x220756ED0](v36, -1, -1);

  }
  else
  {

  }
}

Swift::Void __swiftcall AXSDKShotNSRecordingControllerImplementation.receivedBuffer(_:at:)(AVAudioPCMBuffer _, AVAudioTime *at)
{
  void *v2;
  void *impl;
  Class isa;
  uint64_t v5;
  id v6;
  objc_class *v7;
  id v8;
  id v9;
  objc_class *v10;
  id v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  _QWORD *v15;
  id v16;
  id v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  objc_class *v21;
  id v22;
  os_log_type_t type;
  uint64_t v24;
  id v25;
  uint64_t v26;

  impl = _.super._impl;
  isa = _.super.super.isa;
  if (qword_2551178E8 != -1)
    swift_once();
  v5 = sub_21AD23EEC();
  __swift_project_value_buffer(v5, (uint64_t)qword_2551180D0);
  v6 = v2;
  v7 = isa;
  v8 = impl;
  v9 = v6;
  v10 = v7;
  v11 = v8;
  v12 = sub_21AD23EE0();
  v13 = sub_21AD2406C();
  if (os_log_type_enabled(v12, v13))
  {
    type = v13;
    v14 = swift_slowAlloc();
    v15 = (_QWORD *)swift_slowAlloc();
    v24 = swift_slowAlloc();
    v26 = v24;
    *(_DWORD *)v14 = 136315650;
    v16 = v9;
    v17 = objc_msgSend(v16, sel_description);
    v25 = v9;
    v18 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
    v20 = v19;

    sub_21ACF58B4(v18, v20, &v26);
    sub_21AD240CC();

    swift_bridgeObjectRelease();
    *(_WORD *)(v14 + 12) = 2112;
    v21 = v10;
    sub_21AD240CC();
    *v15 = v10;

    *(_WORD *)(v14 + 22) = 2112;
    v22 = v11;
    v9 = v25;
    sub_21AD240CC();
    v15[1] = v11;

    _os_log_impl(&dword_21ACD4000, v12, type, "[%s]: received buffer: %@ - at time: %@", (uint8_t *)v14, 0x20u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_255117958);
    swift_arrayDestroy();
    MEMORY[0x220756ED0](v15, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x220756ED0](v24, -1, -1);
    MEMORY[0x220756ED0](v14, -1, -1);

  }
  else
  {

  }
  objc_msgSend(v9, sel_receivedBuffer_atTime_isFile_, v10, v11, 0);
}

Swift::Void __swiftcall AXSDKShotNSRecordingControllerImplementation.receivedBuffer(_:at:isFile:)(AVAudioPCMBuffer _, AVAudioTime *at, Swift::Bool isFile)
{
  char *v3;
  char v4;
  void *impl;
  Class isa;
  id *v7;
  void *v8;
  uint64_t v9;
  char *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  char *v15;
  id v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;

  v4 = (char)at;
  impl = _.super._impl;
  isa = _.super.super.isa;
  v7 = (id *)&v3[OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation_detectorManager];
  swift_beginAccess();
  objc_msgSend(*v7, sel_processAudioBuffer_atTime_, isa, impl);
  v8 = *(void **)&v3[OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation_recordingManager];
  if (v8)
  {
    objc_msgSend(v8, sel_trackBuffer_atTime_isFile_, isa, impl, v4 & 1);
  }
  else
  {
    if (qword_2551178E8 != -1)
      swift_once();
    v9 = sub_21AD23EEC();
    __swift_project_value_buffer(v9, (uint64_t)qword_2551180D0);
    v10 = v3;
    v11 = sub_21AD23EE0();
    v12 = sub_21AD24060();
    if (os_log_type_enabled(v11, v12))
    {
      v13 = (uint8_t *)swift_slowAlloc();
      v14 = swift_slowAlloc();
      v20 = v14;
      *(_DWORD *)v13 = 136315138;
      v15 = v10;
      v16 = objc_msgSend(v15, sel_description);
      v17 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
      v19 = v18;

      sub_21ACF58B4(v17, v19, &v20);
      sub_21AD240CC();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_21ACD4000, v11, v12, "[%s]: kshot recording manager failed to start. can not start listening to train detector.", v13, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x220756ED0](v14, -1, -1);
      MEMORY[0x220756ED0](v13, -1, -1);

    }
    else
    {

    }
  }
}

void AXSDKShotNSRecordingControllerImplementation.receivedObservation(_:forDetector:)(void *a1, void *a2)
{
  void *v2;
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  char *v9;
  id v10;
  id v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  char *v15;
  id v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  id v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  void *v24;
  char *v25;
  NSObject *v26;
  os_log_type_t v27;
  uint8_t *v28;
  uint64_t v29;
  char *v30;
  id v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  os_log_type_t type;
  uint64_t v36;
  uint64_t v37;

  if (qword_2551178E8 != -1)
    swift_once();
  v5 = sub_21AD23EEC();
  __swift_project_value_buffer(v5, (uint64_t)qword_2551180D0);
  v6 = v2;
  v7 = a1;
  v8 = a2;
  v9 = (char *)v6;
  v10 = v7;
  v11 = v8;
  v12 = sub_21AD23EE0();
  v13 = sub_21AD2406C();
  if (os_log_type_enabled(v12, v13))
  {
    type = v13;
    v14 = swift_slowAlloc();
    v36 = swift_slowAlloc();
    v37 = v36;
    *(_DWORD *)v14 = 136315650;
    v15 = v9;
    v16 = objc_msgSend(v15, sel_description);
    v17 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
    v19 = v18;

    sub_21ACF58B4(v17, v19, &v37);
    sub_21AD240CC();

    swift_bridgeObjectRelease();
    *(_WORD *)(v14 + 12) = 2048;
    objc_msgSend(v10, sel_confidence);
    sub_21AD240CC();

    *(_WORD *)(v14 + 22) = 2080;
    v20 = objc_msgSend(v11, sel_soundIdentifier);
    v21 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
    v23 = v22;

    sub_21ACF58B4(v21, v23, &v37);
    sub_21AD240CC();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21ACD4000, v12, type, "[%s]: received observation: %f - for request: %s", (uint8_t *)v14, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x220756ED0](v36, -1, -1);
    MEMORY[0x220756ED0](v14, -1, -1);

  }
  else
  {

  }
  v24 = *(void **)&v9[OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation_recordingManager];
  if (v24)
  {
    objc_msgSend(v24, sel_receivedObservation_forDetector_, v10, v11);
  }
  else
  {
    v25 = v9;
    v26 = sub_21AD23EE0();
    v27 = sub_21AD24060();
    if (os_log_type_enabled(v26, v27))
    {
      v28 = (uint8_t *)swift_slowAlloc();
      v29 = swift_slowAlloc();
      v37 = v29;
      *(_DWORD *)v28 = 136315138;
      v30 = v25;
      v31 = objc_msgSend(v30, sel_description);
      v32 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
      v34 = v33;

      sub_21ACF58B4(v32, v34, &v37);
      sub_21AD240CC();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_21ACD4000, v26, v27, "[%s]: kshot recording manager failed to start. can not start listening to train detector.", v28, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x220756ED0](v29, -1, -1);
      MEMORY[0x220756ED0](v28, -1, -1);

    }
    else
    {

    }
  }
}

void AXSDKShotNSRecordingControllerImplementation.receivedCompletion(_:)(void *a1)
{
  void *v1;
  uint64_t v3;
  id v4;
  id v5;
  id v6;
  NSObject *v7;
  os_log_type_t v8;
  uint64_t v9;
  _QWORD *v10;
  id v11;
  id v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  id v16;
  uint64_t v17;
  id v18;
  uint64_t v19;

  if (qword_2551178E8 != -1)
    swift_once();
  v3 = sub_21AD23EEC();
  __swift_project_value_buffer(v3, (uint64_t)qword_2551180D0);
  v4 = v1;
  v5 = a1;
  v18 = v4;
  v6 = v5;
  v7 = sub_21AD23EE0();
  v8 = sub_21AD24060();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = swift_slowAlloc();
    v10 = (_QWORD *)swift_slowAlloc();
    v17 = swift_slowAlloc();
    v19 = v17;
    *(_DWORD *)v9 = 136315394;
    v11 = v18;
    v12 = objc_msgSend(v11, sel_description);
    v13 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
    v15 = v14;

    sub_21ACF58B4(v13, v15, &v19);
    sub_21AD240CC();

    swift_bridgeObjectRelease();
    *(_WORD *)(v9 + 12) = 2112;
    v16 = v6;
    sub_21AD240CC();
    *v10 = v6;

    _os_log_impl(&dword_21ACD4000, v7, v8, "[%s]: received completion for request: %@", (uint8_t *)v9, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_255117958);
    swift_arrayDestroy();
    MEMORY[0x220756ED0](v10, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x220756ED0](v17, -1, -1);
    MEMORY[0x220756ED0](v9, -1, -1);

  }
  else
  {

  }
}

void AXSDKShotNSRecordingControllerImplementation.receivedError(_:fromDetector:)(void *a1, void *a2)
{
  void *v2;
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  os_log_type_t v12;
  uint64_t v13;
  _QWORD *v14;
  id v15;
  id v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  id v20;
  id v21;
  uint64_t v22;
  NSObject *oslog;
  uint64_t v24;
  uint64_t v25;

  if (qword_2551178E8 != -1)
    swift_once();
  v5 = sub_21AD23EEC();
  __swift_project_value_buffer(v5, (uint64_t)qword_2551180D0);
  v6 = v2;
  v7 = a2;
  v8 = a1;
  v9 = v6;
  v10 = v7;
  v11 = a1;
  oslog = sub_21AD23EE0();
  v12 = sub_21AD24060();
  if (os_log_type_enabled(oslog, v12))
  {
    v13 = swift_slowAlloc();
    v14 = (_QWORD *)swift_slowAlloc();
    v22 = swift_slowAlloc();
    v25 = v22;
    *(_DWORD *)v13 = 136315650;
    v15 = v9;
    v16 = objc_msgSend(v15, sel_description);
    v17 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
    v19 = v18;

    sub_21ACF58B4(v17, v19, &v25);
    sub_21AD240CC();

    swift_bridgeObjectRelease();
    *(_WORD *)(v13 + 12) = 2112;
    v20 = v10;
    sub_21AD240CC();
    *v14 = v10;

    *(_WORD *)(v13 + 22) = 2112;
    v21 = a1;
    v24 = _swift_stdlib_bridgeErrorToNSError();
    sub_21AD240CC();
    v14[1] = v24;

    _os_log_impl(&dword_21ACD4000, oslog, v12, "[%s]: received error for request: %@ - error: %@", (uint8_t *)v13, 0x20u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_255117958);
    swift_arrayDestroy();
    MEMORY[0x220756ED0](v14, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x220756ED0](v22, -1, -1);
    MEMORY[0x220756ED0](v13, -1, -1);

  }
  else
  {

  }
}

Swift::Void __swiftcall AXSDKShotNSRecordingControllerImplementation.assetsReadyAndDetectorsAdded()()
{
  void *v0;
  uint64_t v1;
  id v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;
  id v7;
  id v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;

  if (qword_2551178E8 != -1)
    swift_once();
  v1 = sub_21AD23EEC();
  __swift_project_value_buffer(v1, (uint64_t)qword_2551180D0);
  v2 = v0;
  v3 = sub_21AD23EE0();
  v4 = sub_21AD2406C();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    v6 = swift_slowAlloc();
    v12 = v6;
    *(_DWORD *)v5 = 136315138;
    v7 = v2;
    v8 = objc_msgSend(v7, sel_description);
    v9 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
    v11 = v10;

    sub_21ACF58B4(v9, v11, &v12);
    sub_21AD240CC();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21ACD4000, v3, v4, "[%s]: assets ready and detectors added.", v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x220756ED0](v6, -1, -1);
    MEMORY[0x220756ED0](v5, -1, -1);

  }
  else
  {

  }
  sub_21ACFDEAC();
}

Swift::Void __swiftcall AXSDKShotNSRecordingControllerImplementation.savedTrainingRecording(for:)(AXSDKShotDetector_optional *a1)
{
  uint64_t v1;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  int64_t v9;
  AXSDKShotDetector_optional *v10;
  int64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  void *v17;
  AXSDKShotDetector_optional *v18;
  int64_t v19;
  unint64_t v20;
  int64_t v21;
  _QWORD aBlock[6];

  if (!a1)
    return;
  v3 = (uint64_t *)(v1
                 + OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation_listenerHandlers);
  swift_beginAccess();
  v4 = *v3;
  v5 = v4 + 64;
  v6 = 1 << *(_BYTE *)(v4 + 32);
  v7 = -1;
  if (v6 < 64)
    v7 = ~(-1 << v6);
  v8 = v7 & *(_QWORD *)(v4 + 64);
  v9 = (unint64_t)(v6 + 63) >> 6;
  v10 = a1;
  swift_bridgeObjectRetain();
  v11 = 0;
  while (1)
  {
    if (v8)
    {
      v12 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      v13 = v12 | (v11 << 6);
      goto LABEL_6;
    }
    v19 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v19 >= v9)
      goto LABEL_22;
    v20 = *(_QWORD *)(v5 + 8 * v19);
    ++v11;
    if (!v20)
    {
      v11 = v19 + 1;
      if (v19 + 1 >= v9)
        goto LABEL_22;
      v20 = *(_QWORD *)(v5 + 8 * v11);
      if (!v20)
      {
        v11 = v19 + 2;
        if (v19 + 2 >= v9)
          goto LABEL_22;
        v20 = *(_QWORD *)(v5 + 8 * v11);
        if (!v20)
          break;
      }
    }
LABEL_21:
    v8 = (v20 - 1) & v20;
    v13 = __clz(__rbit64(v20)) + (v11 << 6);
LABEL_6:
    v14 = *(_QWORD *)(v4 + 56);
    v15 = swift_allocObject();
    *(_OWORD *)(v15 + 16) = *(_OWORD *)(v14 + 16 * v13);
    v16 = (_QWORD *)swift_allocObject();
    v16[2] = sub_21AD0400C;
    v16[3] = v15;
    v16[4] = v10;
    aBlock[4] = sub_21AD04068;
    aBlock[5] = v16;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_21ACF4004;
    aBlock[3] = &block_descriptor_45;
    v17 = _Block_copy(aBlock);
    v18 = v10;
    swift_retain();
    swift_retain();
    swift_release();
    AXPerformBlockOnMainThread();
    _Block_release(v17);
    swift_release();
  }
  v21 = v19 + 3;
  if (v21 >= v9)
  {
LABEL_22:
    swift_release();

    return;
  }
  v20 = *(_QWORD *)(v5 + 8 * v21);
  if (v20)
  {
    v11 = v21;
    goto LABEL_21;
  }
  while (1)
  {
    v11 = v21 + 1;
    if (__OFADD__(v21, 1))
      break;
    if (v11 >= v9)
      goto LABEL_22;
    v20 = *(_QWORD *)(v5 + 8 * v11);
    ++v21;
    if (v20)
      goto LABEL_21;
  }
LABEL_25:
  __break(1u);
}

void AXSDKShotNSRecordingControllerImplementation.hearingMLHelperService(_:eventOccurred:)()
{
  sub_21AD04258();
}

uint64_t type metadata accessor for AXSDKShotNSRecordingControllerImplementation()
{
  return objc_opt_self();
}

uint64_t sub_21AD03D30()
{
  uint64_t v0;

  return swift_deallocObject();
}

id sub_21AD03D54()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(*(_QWORD *)(v0 + 16)+ OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation_listener), sel_addListenDelegate_);
}

uint64_t block_copy_helper_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_1()
{
  return swift_release();
}

uint64_t sub_21AD03D88(unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x220756E40](MEMORY[0x24BEE12C8], v4);
    atomic_store(result, a1);
  }
  return result;
}

id sub_21AD03DC8()
{
  uint64_t v0;

  return sub_21ACFE724(*(_QWORD *)(v0 + 16));
}

uint64_t sub_21AD03DD0()
{
  uint64_t v0;

  swift_release();
  return swift_deallocObject();
}

uint64_t sub_21AD03E04()
{
  uint64_t v0;

  return sub_21ACFEC40(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24), *(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40));
}

uint64_t sub_21AD03E10()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_21AD03E3C()
{
  uint64_t v0;

  return sub_21ACFF1CC(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

id sub_21AD03E44()
{
  uint64_t v0;
  id *v1;

  v1 = (id *)(*(_QWORD *)(v0 + 16)
            + OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation_detectorManager);
  swift_beginAccess();
  return objc_msgSend(*v1, sel_removeAllDetectors);
}

uint64_t sub_21AD03E98(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_255117C10);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_21AD03ED8()
{
  unint64_t result;

  result = qword_255117C18;
  if (!qword_255117C18)
  {
    result = MEMORY[0x220756E40](&unk_21AD27100, &type metadata for AXSDKShotRecordingError);
    atomic_store(result, (unint64_t *)&qword_255117C18);
  }
  return result;
}

uint64_t sub_21AD03F1C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255117C10);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_21AD03F64(uint64_t a1, char *a2)
{
  uint64_t v2;

  sub_21AD004AC(*(void **)(v2 + 24), a1, a2);
}

id sub_21AD03F90()
{
  uint64_t v0;
  uint64_t v1;
  id *v2;

  v1 = *(_QWORD *)(v0 + 24);
  v2 = (id *)(*(_QWORD *)(v0 + 16)
            + OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation_detectorManager);
  swift_beginAccess();
  return objc_msgSend(*v2, sel_startGeneralApplianceDetectionWithFormat_, v1);
}

uint64_t sub_21AD03FE8()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_21AD0400C(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t *);
  uint64_t v4;

  v2 = *(uint64_t (**)(uint64_t *))(v1 + 16);
  v4 = a1;
  return v2(&v4);
}

uint64_t sub_21AD0403C()
{
  uint64_t v0;

  swift_release();

  return swift_deallocObject();
}

uint64_t sub_21AD04068()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD))(v0 + 16))(*(_QWORD *)(v0 + 32));
}

void sub_21AD04090(void *a1, char a2)
{
  __CFNotificationCenter *v4;
  __CFString *v5;
  id v6;
  __CFString *v7;
  id v8;
  void *v9;
  id v10;
  id v11;

  v4 = CFNotificationCenterGetDarwinNotifyCenter();
  if ((a2 & 1) != 0)
  {
    v5 = (__CFString *)sub_21AD23F4C();
    CFNotificationCenterPostNotification(v4, v5, 0, 0, 1u);

    AXSDSoundDetectionSendKShotModelReadyNotification(a1);
    v6 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
    objc_msgSend(v6, sel_setKShotDetectorIsEnabled_isEnabled_, a1, 1);

  }
  else
  {
    v7 = (__CFString *)sub_21AD23F4C();
    CFNotificationCenterPostNotification(v4, v7, 0, 0, 1u);

    AXSDSoundDetectionSendKShotModelFailedNotification(a1);
    v8 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
    objc_msgSend(v8, sel_setKShotDetectorModelFailed_modelFailed_, a1, 1);

    objc_msgSend(a1, sel_setModelFailed_, 1);
  }
  v9 = (void *)objc_opt_self();
  v10 = objc_msgSend(v9, sel_sharedInstance);
  objc_msgSend(v10, sel_setIsActivelyTrainingAKShotModel_, 0);

  v11 = objc_msgSend(v9, sel_sharedInstance);
  objc_msgSend(v11, sel_updateKShotDetector_, a1);

}

void sub_21AD04258()
{
  void *v0;
  uint64_t v1;
  char *v2;
  NSObject *v3;
  os_log_type_t v4;
  uint64_t v5;
  char *v6;
  id v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  id *v11;
  id v12;
  uint64_t v13;
  unint64_t v14;
  id *v15;
  id v16;
  char *v17;
  NSObject *v18;
  os_log_type_t v19;
  uint8_t *v20;
  uint64_t v21;
  char *v22;
  id v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29[3];

  if (qword_2551178E8 != -1)
    swift_once();
  v1 = sub_21AD23EEC();
  __swift_project_value_buffer(v1, (uint64_t)qword_2551180D0);
  v2 = v0;
  v3 = sub_21AD23EE0();
  v4 = sub_21AD24060();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = swift_slowAlloc();
    v27 = swift_slowAlloc();
    v29[0] = v27;
    *(_DWORD *)v5 = 136315650;
    v6 = v2;
    v7 = objc_msgSend(v6, sel_description);
    v8 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
    v10 = v9;

    sub_21ACF58B4(v8, v10, v29);
    sub_21AD240CC();

    swift_bridgeObjectRelease();
    *(_WORD *)(v5 + 12) = 2048;
    sub_21AD240CC();
    *(_WORD *)(v5 + 22) = 2080;
    v11 = (id *)&v6[OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation_trainingDetector];
    swift_beginAccess();
    v12 = *v11;
    __swift_instantiateConcreteTypeFromMangledName(&qword_255117E50);
    v13 = sub_21AD23F7C();
    v28 = sub_21ACF58B4(v13, v14, v29);
    sub_21AD240CC();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21ACD4000, v3, v4, "[%s]: Invalid event occured - code: %ld - detector: %s", (uint8_t *)v5, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x220756ED0](v27, -1, -1);
    MEMORY[0x220756ED0](v5, -1, -1);

  }
  else
  {

  }
  v15 = (id *)&v2[OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation_trainingDetector];
  swift_beginAccess();
  if (*v15)
  {
    v16 = *v15;
    sub_21AD04090(v16, 0);

  }
  else
  {
    v17 = v2;
    v18 = sub_21AD23EE0();
    v19 = sub_21AD24060();
    if (os_log_type_enabled(v18, v19))
    {
      v20 = (uint8_t *)swift_slowAlloc();
      v21 = swift_slowAlloc();
      v28 = v21;
      *(_DWORD *)v20 = 136315138;
      v22 = v17;
      v23 = objc_msgSend(v22, sel_description);
      v24 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
      v26 = v25;

      sub_21ACF58B4(v24, v26, &v28);
      sub_21AD240CC();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_21ACD4000, v18, v19, "[%s]: No training detector set!", v20, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x220756ED0](v21, -1, -1);
      MEMORY[0x220756ED0](v20, -1, -1);

    }
    else
    {

    }
  }
}

double sub_21AD0467C@<D0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  double *v3;
  double result;

  v3 = (double *)(*a1 + OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation_sampleLength);
  swift_beginAccess();
  result = *v3;
  *a2 = *(_QWORD *)v3;
  return result;
}

uint64_t sub_21AD046CC(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t result;

  v2 = *a1;
  v3 = (_QWORD *)(*a2 + OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation_sampleLength);
  result = swift_beginAccess();
  *v3 = v2;
  return result;
}

id sub_21AD04720@<X0>(_QWORD *a1@<X0>, void **a2@<X8>)
{
  void **v3;
  void *v4;

  v3 = (void **)(*a1 + OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation_detectorManager);
  swift_beginAccess();
  v4 = *v3;
  *a2 = *v3;
  return v4;
}

id sub_21AD04774@<X0>(_QWORD *a1@<X0>, void **a2@<X8>)
{
  void **v3;
  void *v4;

  v3 = (void **)(*a1
               + OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation_trainingDetector);
  swift_beginAccess();
  v4 = *v3;
  *a2 = *v3;
  return v4;
}

_QWORD *sub_21AD047C8@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *(_QWORD *)(*result
                  + OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation__visualizationBucketCount);
  return result;
}

_QWORD *sub_21AD047E0(_QWORD *result, _QWORD *a2)
{
  if (__OFADD__(*result, 2))
    __break(1u);
  else
    *(_QWORD *)(*a2
              + OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation__visualizationBucketCount) = *result + 2;
  return result;
}

uint64_t sub_21AD04804@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(*a1
               + OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation_isActivelyTraining);
  result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

void sub_21AD04854(char *a1, _QWORD *a2)
{
  char v2;
  char *v3;
  char v4;

  v2 = *a1;
  v3 = (char *)(*a2
              + OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation_isActivelyTraining);
  swift_beginAccess();
  v4 = *v3;
  *v3 = v2;
  sub_21ACFD0C8(v4);
}

uint64_t method lookup function for AXSDKShotNSRecordingControllerImplementation()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of AXSDKShotNSRecordingControllerImplementation.sampleLength.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xF0))();
}

uint64_t dispatch thunk of AXSDKShotNSRecordingControllerImplementation.detectorManager.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x108))();
}

uint64_t dispatch thunk of AXSDKShotNSRecordingControllerImplementation.detectorManager.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x110))();
}

uint64_t dispatch thunk of AXSDKShotNSRecordingControllerImplementation.detectorManager.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x118))();
}

uint64_t dispatch thunk of AXSDKShotNSRecordingControllerImplementation.trainingDetector.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x138))();
}

uint64_t dispatch thunk of AXSDKShotNSRecordingControllerImplementation.listenerBufferSize.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x150))();
}

uint64_t dispatch thunk of AXSDKShotNSRecordingControllerImplementation.isListening.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x158))();
}

uint64_t dispatch thunk of AXSDKShotNSRecordingControllerImplementation.visualizationBucketCount.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x178))();
}

uint64_t dispatch thunk of AXSDKShotNSRecordingControllerImplementation.visualizationBucketCount.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x180))();
}

uint64_t dispatch thunk of AXSDKShotNSRecordingControllerImplementation.visualizationBucketCount.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x188))();
}

uint64_t dispatch thunk of AXSDKShotNSRecordingControllerImplementation.currentDetectionTypes.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x190))();
}

uint64_t dispatch thunk of AXSDKShotNSRecordingControllerImplementation.isSecure.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x198))();
}

uint64_t dispatch thunk of AXSDKShotNSRecordingControllerImplementation.isActivelyTraining.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1A0))();
}

uint64_t dispatch thunk of AXSDKShotNSRecordingControllerImplementation.startListening()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1B8))();
}

uint64_t dispatch thunk of AXSDKShotNSRecordingControllerImplementation.startListening(toTrainDetector:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1C0))();
}

uint64_t dispatch thunk of AXSDKShotNSRecordingControllerImplementation.stopListening()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1C8))();
}

uint64_t dispatch thunk of AXSDKShotNSRecordingControllerImplementation.register(listener:forRecordingUpdates:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1D0))();
}

uint64_t dispatch thunk of AXSDKShotNSRecordingControllerImplementation.deregister(listener:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1D8))();
}

uint64_t dispatch thunk of AXSDKShotNSRecordingControllerImplementation.retrainModel(withIdentifier:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1E0))();
}

uint64_t dispatch thunk of AXSDKShotNSRecordingControllerImplementation.add(listenType:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1E8))();
}

uint64_t dispatch thunk of AXSDKShotNSRecordingControllerImplementation.remove(listenType:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1F0))();
}

uint64_t dispatch thunk of AXSDKShotNSRecordingControllerImplementation.removeAllListenTypes()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1F8))();
}

uint64_t dispatch thunk of AXSDKShotNSRecordingControllerImplementation.kickoffMLTrainingOf(detector:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x218))();
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for AXSDKShotRecordingError(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFF)
    goto LABEL_17;
  if (a2 + 1 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 1) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 1;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 1;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 1;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 2;
  v8 = v6 - 2;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for AXSDKShotRecordingError(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 1 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFF)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFE)
    return ((uint64_t (*)(void))((char *)&loc_21AD04C3C + 4 * byte_21AD27015[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_21AD04C70 + 4 * byte_21AD27010[v4]))();
}

uint64_t sub_21AD04C70(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_21AD04C78(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21AD04C80);
  return result;
}

uint64_t sub_21AD04C8C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x21AD04C94);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_21AD04C98(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21AD04CA0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21AD04CAC(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_21AD04CB8(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for AXSDKShotRecordingError()
{
  return &type metadata for AXSDKShotRecordingError;
}

unint64_t sub_21AD04CD8()
{
  unint64_t result;

  result = qword_255117E30;
  if (!qword_255117E30)
  {
    result = MEMORY[0x220756E40](&unk_21AD270D8, &type metadata for AXSDKShotRecordingError);
    atomic_store(result, (unint64_t *)&qword_255117E30);
  }
  return result;
}

uint64_t sub_21AD04D1C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255117C10);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_21AD04D64()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_21AD04D88()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 16) + 16))();
}

uint64_t sub_21AD04D98()
{
  uint64_t v0;

  return sub_21ACFD55C(*(_QWORD *)(v0 + 16));
}

uint64_t sub_21AD04DA0(_QWORD *a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(_QWORD))(v1 + 16))(*a1);
}

uint64_t sub_21AD04E90()
{
  uint64_t v0;
  unint64_t *v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t i;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v1 = (unint64_t *)(v0
                          + OBJC_IVAR____TtC18AXSoundDetectionUI38AXSDSecureBaseControllerImplementation_currentDetectors);
  swift_beginAccess();
  v2 = *v1;
  v3 = MEMORY[0x24BEE4AF8];
  v20 = MEMORY[0x24BEE4AF8];
  if (!(v2 >> 62))
  {
    v4 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
    if (v4)
      goto LABEL_3;
LABEL_15:
    swift_bridgeObjectRelease();
    v9 = MEMORY[0x24BEE4AF8];
    if ((MEMORY[0x24BEE4AF8] & 0x8000000000000000) != 0)
      goto LABEL_27;
    goto LABEL_16;
  }
  swift_bridgeObjectRetain();
  result = sub_21AD2421C();
  v4 = result;
  if (!result)
    goto LABEL_15;
LABEL_3:
  if (v4 < 1)
  {
    __break(1u);
    goto LABEL_31;
  }
  for (i = 0; i != v4; ++i)
  {
    if ((v2 & 0xC000000000000001) != 0)
      v7 = (id)MEMORY[0x2207565F4](i, v2);
    else
      v7 = *(id *)(v2 + 8 * i + 32);
    v8 = v7;
    if ((objc_msgSend(v7, sel_isCustom, v20) & 1) != 0)
    {

    }
    else
    {
      sub_21AD241B0();
      sub_21AD241C8();
      sub_21AD241D4();
      sub_21AD241BC();
    }
  }
  swift_bridgeObjectRelease();
  v9 = v20;
  if (v20 < 0)
    goto LABEL_27;
LABEL_16:
  if ((v9 & 0x4000000000000000) == 0)
  {
    v10 = *(_QWORD *)(v9 + 16);
    if (!v10)
    {
LABEL_28:
      swift_release();
      v12 = MEMORY[0x24BEE4AF8];
LABEL_29:
      v19 = sub_21ACF7FA4(v12);
      swift_bridgeObjectRelease();
      return v19;
    }
    goto LABEL_18;
  }
LABEL_27:
  swift_bridgeObjectRetain();
  v10 = sub_21AD2421C();
  swift_release();
  if (!v10)
    goto LABEL_28;
LABEL_18:
  v21 = v3;
  result = sub_21ACFC630(0, v10 & ~(v10 >> 63), 0);
  if ((v10 & 0x8000000000000000) == 0)
  {
    v11 = 0;
    v12 = v3;
    do
    {
      if ((v9 & 0xC000000000000001) != 0)
        v13 = (id)MEMORY[0x2207565F4](v11, v9);
      else
        v13 = *(id *)(v9 + 8 * v11 + 32);
      v14 = v13;
      v15 = objc_msgSend(v13, sel_identifier, v21);
      _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();

      v16 = sub_21AD23F4C();
      swift_bridgeObjectRelease();
      v21 = v12;
      v18 = *(_QWORD *)(v12 + 16);
      v17 = *(_QWORD *)(v12 + 24);
      if (v18 >= v17 >> 1)
        sub_21ACFC630(v17 > 1, v18 + 1, 1);
      ++v11;
      *(_QWORD *)(v12 + 16) = v18 + 1;
      *(_QWORD *)(v12 + 8 * v18 + 32) = v16;
    }
    while (v10 != v11);
    swift_release();
    goto LABEL_29;
  }
LABEL_31:
  __break(1u);
  return result;
}

id AXSDSecureControllerImplementation.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id AXSDSecureControllerImplementation.init()()
{
  void *v0;
  void *v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  objc_super v7;

  v1 = v0;
  if (qword_2551178E0 != -1)
    swift_once();
  v2 = sub_21AD23EEC();
  __swift_project_value_buffer(v2, (uint64_t)qword_2551180B8);
  v3 = sub_21AD23EE0();
  v4 = sub_21AD2406C();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_21ACD4000, v3, v4, "Initializing Secure Sound Detection Controller", v5, 2u);
    MEMORY[0x220756ED0](v5, -1, -1);
  }

  v7.receiver = v1;
  v7.super_class = (Class)type metadata accessor for AXSDSecureControllerImplementation();
  return objc_msgSendSuper2(&v7, sel_init);
}

id AXSDSecureControllerImplementation.__deallocating_deinit()
{
  void *v0;
  void *v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  objc_super v7;

  v1 = v0;
  if (qword_2551178E0 != -1)
    swift_once();
  v2 = sub_21AD23EEC();
  __swift_project_value_buffer(v2, (uint64_t)qword_2551180B8);
  v3 = sub_21AD23EE0();
  v4 = sub_21AD2406C();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_21ACD4000, v3, v4, "Deinitializing Secure Sound Detection Controller", v5, 2u);
    MEMORY[0x220756ED0](v5, -1, -1);
  }

  v7.receiver = v1;
  v7.super_class = (Class)type metadata accessor for AXSDSecureControllerImplementation();
  return objc_msgSendSuper2(&v7, sel_dealloc);
}

uint64_t sub_21AD05524(uint64_t a1)
{
  return sub_21AD055A4(a1, (void (*)(void))sub_21AD05530);
}

void sub_21AD05530(void *a1)
{
  sub_21AD05634(a1, "[%s]: adding listen type: %s", (void (*)(_QWORD))sub_21AD0D524);
}

uint64_t sub_21AD05598(uint64_t a1)
{
  return sub_21AD055A4(a1, (void (*)(void))sub_21AD05620);
}

uint64_t sub_21AD055A4(uint64_t result, void (*a2)(void))
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v2 = *(_QWORD *)(result + 16);
  if (v2)
  {
    v4 = result;
    swift_bridgeObjectRetain();
    v5 = 0;
    do
    {
      v6 = *(void **)(v4 + 8 * v5++ + 32);
      v7 = v6;
      a2();

    }
    while (v2 != v5);
    return swift_bridgeObjectRelease();
  }
  return result;
}

void sub_21AD05620(void *a1)
{
  sub_21AD05634(a1, "[%s]: removing listen type: %s", (void (*)(_QWORD))sub_21AD0DA68);
}

void sub_21AD05634(void *a1, char *a2, void (*a3)(_QWORD))
{
  void *v3;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  id v15;
  id v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  id v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  uint64_t v38;
  unint64_t v39;
  char *format;
  uint64_t v41;
  void (*v42)(_QWORD);
  void *v43;
  uint64_t v44;
  uint64_t v45;

  if (qword_2551178E0 != -1)
    swift_once();
  v7 = sub_21AD23EEC();
  __swift_project_value_buffer(v7, (uint64_t)qword_2551180B8);
  v8 = v3;
  v9 = a1;
  v10 = v8;
  v11 = v9;
  v12 = sub_21AD23EE0();
  v13 = sub_21AD2406C();
  v43 = v10;
  if (os_log_type_enabled(v12, v13))
  {
    v42 = a3;
    v14 = swift_slowAlloc();
    v41 = swift_slowAlloc();
    v45 = v41;
    *(_DWORD *)v14 = 136315394;
    v15 = v10;
    format = a2;
    v16 = objc_msgSend(v15, sel_description);
    v17 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
    v19 = v18;

    sub_21ACF58B4(v17, v19, &v45);
    sub_21AD240CC();

    swift_bridgeObjectRelease();
    *(_WORD *)(v14 + 12) = 2080;
    v20 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
    sub_21ACF58B4(v20, v21, &v45);
    sub_21AD240CC();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21ACD4000, v12, v13, format, (uint8_t *)v14, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x220756ED0](v41, -1, -1);
    v22 = v14;
    a3 = v42;
    MEMORY[0x220756ED0](v22, -1, -1);

  }
  else
  {

  }
  v23 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
  _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
  v24 = (void *)sub_21AD23F4C();
  swift_bridgeObjectRelease();
  v25 = objc_msgSend(v23, sel_detectorWithIdentifier_, v24);

  if (v25)
  {
    a3(v25);

  }
  else
  {
    v26 = v43;
    v27 = v11;
    v28 = v26;
    v29 = v27;
    v30 = sub_21AD23EE0();
    v31 = sub_21AD24060();
    if (os_log_type_enabled(v30, (os_log_type_t)v31))
    {
      v32 = swift_slowAlloc();
      v44 = swift_slowAlloc();
      v45 = v44;
      *(_DWORD *)v32 = 136315394;
      v33 = v28;
      v34 = objc_msgSend(v33, sel_description);
      v35 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
      v37 = v36;

      sub_21ACF58B4(v35, v37, &v45);
      sub_21AD240CC();

      swift_bridgeObjectRelease();
      *(_WORD *)(v32 + 12) = 2080;
      v38 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
      sub_21ACF58B4(v38, v39, &v45);
      sub_21AD240CC();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_21ACD4000, v30, (os_log_type_t)v31, "[%s]: unable to locate detector for listen type: %s", (uint8_t *)v32, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x220756ED0](v44, -1, -1);
      MEMORY[0x220756ED0](v32, -1, -1);

    }
    else
    {

    }
  }
}

void sub_21AD05BA8(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  void (*v12)(char *, uint64_t, uint64_t);
  int v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  id v18;
  NSObject *v19;
  os_log_type_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  id v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  id v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  id v33;
  id v34;
  id v35;
  id v36;
  NSObject *v37;
  os_log_type_t v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  id v42;
  uint64_t v43;
  unint64_t v44;
  unint64_t v45;
  id v46;
  uint64_t v47;
  unint64_t v48;
  unint64_t v49;
  uint64_t v50;
  id v51;
  id v52;
  id v53;
  id v54;
  NSObject *v55;
  os_log_type_t v56;
  int v57;
  uint64_t v58;
  uint64_t v59;
  id v60;
  id v61;
  uint64_t v62;
  unint64_t v63;
  unint64_t v64;
  id v65;
  id v66;
  uint64_t v67;
  unint64_t v68;
  unint64_t v69;
  uint64_t v70;
  uint64_t v71;
  unint64_t v72;
  void (*v73)(char *, uint64_t);
  uint64_t v74;
  id v75;
  _QWORD v76[2];
  id v77;
  os_log_t v78;
  int v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;

  v5 = sub_21AD23E68();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)v76 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)v76 - v10;
  v12 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
  v12((char *)v76 - v10, a1, v5);
  v13 = (*(uint64_t (**)(char *, uint64_t))(v6 + 88))(v11, v5);
  if (v13 == *MEMORY[0x24BDE9A38])
  {
    if (qword_2551178E0 != -1)
      swift_once();
    v14 = sub_21AD23EEC();
    __swift_project_value_buffer(v14, (uint64_t)qword_2551180B8);
    v15 = v2;
    v16 = a2;
    v17 = v15;
    v18 = v16;
    v19 = sub_21AD23EE0();
    v20 = sub_21AD24048();
    if (os_log_type_enabled(v19, v20))
    {
      v21 = swift_slowAlloc();
      v22 = swift_slowAlloc();
      v82 = v22;
      *(_DWORD *)v21 = 136315394;
      v23 = v17;
      v24 = objc_msgSend(v23, sel_description);
      v25 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
      v27 = v26;

      v81 = sub_21ACF58B4(v25, v27, &v82);
      sub_21AD240CC();

      swift_bridgeObjectRelease();
      *(_WORD *)(v21 + 12) = 2080;
      v28 = objc_msgSend(v18, sel_identifier);
      v29 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
      v31 = v30;

      v81 = sub_21ACF58B4(v29, v31, &v82);
      sub_21AD240CC();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_21ACD4000, v19, v20, "[%s]: Detector: %s is INACTIVE", (uint8_t *)v21, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x220756ED0](v22, -1, -1);
      MEMORY[0x220756ED0](v21, -1, -1);

    }
    else
    {

    }
  }
  else if (v13 == *MEMORY[0x24BDE9A30])
  {
    if (qword_2551178E0 != -1)
      swift_once();
    v32 = sub_21AD23EEC();
    __swift_project_value_buffer(v32, (uint64_t)qword_2551180B8);
    v33 = v2;
    v34 = a2;
    v35 = v33;
    v36 = v34;
    v37 = sub_21AD23EE0();
    v38 = sub_21AD24048();
    if (os_log_type_enabled(v37, v38))
    {
      v39 = swift_slowAlloc();
      v40 = swift_slowAlloc();
      v82 = v40;
      *(_DWORD *)v39 = 136315394;
      v41 = v35;
      v42 = objc_msgSend(v41, sel_description);
      v43 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
      v45 = v44;

      v81 = sub_21ACF58B4(v43, v45, &v82);
      sub_21AD240CC();

      swift_bridgeObjectRelease();
      *(_WORD *)(v39 + 12) = 2080;
      v46 = objc_msgSend(v36, sel_identifier);
      v47 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
      v49 = v48;

      v81 = sub_21ACF58B4(v47, v49, &v82);
      sub_21AD240CC();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_21ACD4000, v37, v38, "[%s]: Detector: %s is ACTIVE", (uint8_t *)v39, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x220756ED0](v40, -1, -1);
      MEMORY[0x220756ED0](v39, -1, -1);

    }
    else
    {

    }
    v75 = objc_msgSend(v36, sel_identifier);
    if (!v75)
    {
      _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
      v75 = (id)sub_21AD23F4C();
      swift_bridgeObjectRelease();
    }
    AXSDSoundDetectionGenerateUserNotificationForDetectionType(v75, 100.0);

  }
  else
  {
    if (qword_2551178E0 != -1)
      swift_once();
    v50 = sub_21AD23EEC();
    __swift_project_value_buffer(v50, (uint64_t)qword_2551180B8);
    v12(v9, a1, v5);
    v51 = v2;
    v52 = a2;
    v53 = v51;
    v54 = v52;
    v55 = sub_21AD23EE0();
    v56 = sub_21AD24060();
    v57 = v56;
    if (os_log_type_enabled(v55, v56))
    {
      v58 = swift_slowAlloc();
      v77 = v54;
      v59 = v58;
      v80 = swift_slowAlloc();
      v82 = v80;
      *(_DWORD *)v59 = 136315650;
      v79 = v57;
      v60 = v53;
      v61 = objc_msgSend(v60, sel_description);
      v62 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
      v78 = v55;
      v64 = v63;

      v81 = sub_21ACF58B4(v62, v64, &v82);
      v76[1] = &v82;
      sub_21AD240CC();

      swift_bridgeObjectRelease();
      *(_WORD *)(v59 + 12) = 2080;
      v65 = v77;
      v66 = objc_msgSend(v77, sel_identifier);
      v67 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
      v69 = v68;

      v81 = sub_21ACF58B4(v67, v69, &v82);
      sub_21AD240CC();

      swift_bridgeObjectRelease();
      *(_WORD *)(v59 + 22) = 2080;
      v70 = sub_21ACF7DA4(&qword_255117B58, (uint64_t (*)(uint64_t))MEMORY[0x24BDE9A40], (uint64_t)&protocol conformance descriptor for AccessibilitySoundRecognition.Detection);
      v71 = sub_21AD06418(v5, v70);
      v81 = sub_21ACF58B4(v71, v72, &v82);
      sub_21AD240CC();
      swift_bridgeObjectRelease();
      v73 = *(void (**)(char *, uint64_t))(v6 + 8);
      v73(v9, v5);
      v55 = v78;
      _os_log_impl(&dword_21ACD4000, v78, (os_log_type_t)v79, "[%s]: Detector: %s. FATAL ERROR - result is unknown and not handled. Result: %s", (uint8_t *)v59, 0x20u);
      v74 = v80;
      swift_arrayDestroy();
      MEMORY[0x220756ED0](v74, -1, -1);
      MEMORY[0x220756ED0](v59, -1, -1);
    }
    else
    {

      v73 = *(void (**)(char *, uint64_t))(v6 + 8);
      v73(v9, v5);
    }

    v73(v11, v5);
  }
}

uint64_t AccessibilitySoundRecognition.Detection.description.getter()
{
  uint64_t v0;
  uint64_t v1;

  v0 = sub_21AD23E68();
  v1 = sub_21ACF7DA4(&qword_255117B58, (uint64_t (*)(uint64_t))MEMORY[0x24BDE9A40], (uint64_t)&protocol conformance descriptor for AccessibilitySoundRecognition.Detection);
  return sub_21AD06418(v0, v1);
}

uint64_t sub_21AD06418(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v9;

  v4 = *(_QWORD *)(a1 - 8);
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v4 + 16))(v6);
  v7 = sub_21AD06418(a1, a2);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, a1);
  return v7;
}

uint64_t type metadata accessor for AXSDSecureControllerImplementation()
{
  return objc_opt_self();
}

uint64_t method lookup function for AXSDSecureControllerImplementation()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of AXSDSecureControllerImplementation.currentDetectionTypes.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x148))();
}

uint64_t dispatch thunk of AXSDSecureControllerImplementation.add(listenTypes:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x150))();
}

uint64_t dispatch thunk of AXSDSecureControllerImplementation.add(listenType:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x158))();
}

uint64_t dispatch thunk of AXSDSecureControllerImplementation.remove(listenTypes:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x160))();
}

uint64_t dispatch thunk of AXSDSecureControllerImplementation.remove(listenType:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x168))();
}

uint64_t dispatch thunk of AXSDSecureControllerImplementation.removeAllListenTypes()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x170))();
}

uint64_t sub_21AD065D4()
{
  swift_beginAccess();
  return swift_unknownObjectRetain();
}

uint64_t sub_21AD06680(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)(v1 + OBJC_IVAR____TtC18AXSoundDetectionUI34AXSASecureControllerImplementation_delegate);
  swift_beginAccess();
  *v3 = a1;
  return swift_unknownObjectRelease();
}

uint64_t sub_21AD066D0(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;
  _QWORD *v3;

  v2 = *a1;
  v3 = (_QWORD *)(*a2 + OBJC_IVAR____TtC18AXSoundDetectionUI34AXSASecureControllerImplementation_delegate);
  swift_beginAccess();
  *v3 = v2;
  swift_unknownObjectRetain();
  return swift_unknownObjectRelease();
}

uint64_t (*sub_21AD06738())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

BOOL sub_21AD06794()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + OBJC_IVAR____TtC18AXSoundDetectionUI34AXSASecureControllerImplementation_currentTask) != 0;
}

uint64_t sub_21AD067B4()
{
  return 1;
}

id AXSASecureControllerImplementation.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id AXSASecureControllerImplementation.init()()
{
  char *v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  objc_class *v10;
  uint64_t v12;
  objc_super v13;

  v1 = v0;
  v2 = sub_21AD23EEC();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)&v1[OBJC_IVAR____TtC18AXSoundDetectionUI34AXSASecureControllerImplementation_currentTask] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC18AXSoundDetectionUI34AXSASecureControllerImplementation_delegate] = 0;
  if (qword_2551178F0 != -1)
    swift_once();
  v6 = __swift_project_value_buffer(v2, (uint64_t)qword_2551180E8);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  v7 = sub_21AD23EE0();
  v8 = sub_21AD24054();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_21ACD4000, v7, v8, "Initializing Secure Sound Actions Controller", v9, 2u);
    MEMORY[0x220756ED0](v9, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  v10 = (objc_class *)type metadata accessor for AXSASecureControllerImplementation();
  v13.receiver = v1;
  v13.super_class = v10;
  return objc_msgSendSuper2(&v13, sel_init);
}

uint64_t sub_21AD06A00()
{
  char *v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  NSObject *v15;
  os_log_type_t v16;
  uint64_t v17;
  uint8_t *v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint8_t *v27;
  void (*v28)(char *, uint64_t);
  uint64_t v29;
  char *v30;
  NSObject *v31;
  os_log_type_t v32;
  uint8_t *v33;
  uint64_t v34;
  char *v35;
  id v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  char *v41;
  NSObject *v42;
  os_log_type_t v43;
  uint8_t *v44;
  char *v45;
  char *v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  unint64_t v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  uint8_t *v55;
  uint64_t v56;
  char *v57;
  char *v58;
  uint64_t v59;
  char *v60;
  void (*v61)(char *, uint64_t, uint64_t);
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;

  v1 = v0;
  v2 = sub_21AD23EEC();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v55 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = MEMORY[0x24BDAC7A8](v4);
  v9 = (char *)&v55 - v8;
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v55 - v10;
  v12 = OBJC_IVAR____TtC18AXSoundDetectionUI34AXSASecureControllerImplementation_currentTask;
  if (*(_QWORD *)&v1[OBJC_IVAR____TtC18AXSoundDetectionUI34AXSASecureControllerImplementation_currentTask])
  {
    if (qword_2551178F0 != -1)
      swift_once();
    v13 = __swift_project_value_buffer(v2, (uint64_t)qword_2551180E8);
    swift_beginAccess();
    v61 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    v61(v9, v13, v2);
    v14 = v1;
    v15 = sub_21AD23EE0();
    v16 = sub_21AD2406C();
    if (os_log_type_enabled(v15, v16))
    {
      v63 = v2;
      v17 = swift_slowAlloc();
      v59 = v12;
      v18 = (uint8_t *)v17;
      v19 = swift_slowAlloc();
      v58 = v6;
      v56 = v19;
      v65 = v19;
      v62 = v3;
      *(_DWORD *)v18 = 136315138;
      v55 = v18 + 4;
      v57 = v14;
      v20 = v14;
      v21 = v13;
      v22 = objc_msgSend(v20, sel_description);
      v23 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
      v60 = v1;
      v25 = v24;

      v13 = v21;
      v64 = sub_21ACF58B4(v23, v25, &v65);
      sub_21AD240CC();

      v2 = v63;
      v1 = v60;
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_21ACD4000, v15, v16, "[%s]: sound actions will stop listening.", v18, 0xCu);
      v26 = v56;
      swift_arrayDestroy();
      v6 = v58;
      MEMORY[0x220756ED0](v26, -1, -1);
      v27 = v18;
      v12 = v59;
      MEMORY[0x220756ED0](v27, -1, -1);

      v28 = *(void (**)(char *, uint64_t))(v62 + 8);
      v28(v9, v2);
      v14 = v57;
      if (!*(_QWORD *)&v1[v12])
        goto LABEL_19;
    }
    else
    {

      v28 = *(void (**)(char *, uint64_t))(v3 + 8);
      v28(v9, v2);
      if (!*(_QWORD *)&v1[v12])
      {
LABEL_19:
        *(_QWORD *)&v1[v12] = 0;
        return swift_release();
      }
    }
    swift_retain();
    if ((swift_task_isCancelled() & 1) == 0)
    {
      v61(v6, v13, v2);
      v41 = v14;
      v42 = sub_21AD23EE0();
      v43 = sub_21AD2406C();
      if (os_log_type_enabled(v42, v43))
      {
        v60 = v1;
        v44 = (uint8_t *)swift_slowAlloc();
        v62 = swift_slowAlloc();
        v65 = v62;
        v63 = v2;
        *(_DWORD *)v44 = 136315138;
        v61 = (void (*)(char *, uint64_t, uint64_t))(v44 + 4);
        v45 = v41;
        v59 = v12;
        v46 = v45;
        v47 = objc_msgSend(v45, sel_description);
        v48 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
        v58 = v6;
        v49 = v48;
        v51 = v50;

        v64 = sub_21ACF58B4(v49, v51, &v65);
        sub_21AD240CC();

        v12 = v59;
        v1 = v60;
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_21ACD4000, v42, v43, "[%s]: sound actions cancelled current task.", v44, 0xCu);
        v52 = v62;
        swift_arrayDestroy();
        MEMORY[0x220756ED0](v52, -1, -1);
        MEMORY[0x220756ED0](v44, -1, -1);

        v53 = v58;
        v54 = v63;
      }
      else
      {

        v53 = v6;
        v54 = v2;
      }
      v28(v53, v54);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255117930);
      sub_21AD2400C();
    }
    swift_release();
    goto LABEL_19;
  }
  if (qword_2551178F0 != -1)
    swift_once();
  v29 = __swift_project_value_buffer(v2, (uint64_t)qword_2551180E8);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v11, v29, v2);
  v30 = v1;
  v31 = sub_21AD23EE0();
  v32 = sub_21AD2406C();
  if (os_log_type_enabled(v31, v32))
  {
    v63 = v2;
    v33 = (uint8_t *)swift_slowAlloc();
    v34 = swift_slowAlloc();
    v65 = v34;
    v62 = v3;
    *(_DWORD *)v33 = 136315138;
    v61 = (void (*)(char *, uint64_t, uint64_t))(v33 + 4);
    v35 = v30;
    v36 = objc_msgSend(v35, sel_description);
    v37 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
    v39 = v38;

    v64 = sub_21ACF58B4(v37, v39, &v65);
    sub_21AD240CC();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21ACD4000, v31, v32, "[%s]: sound actions has already stopped listening.", v33, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x220756ED0](v34, -1, -1);
    MEMORY[0x220756ED0](v33, -1, -1);

    return (*(uint64_t (**)(char *, uint64_t))(v62 + 8))(v11, v63);
  }
  else
  {

    return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v11, v2);
  }
}

uint64_t sub_21AD070C4()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  int v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v13[4];

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_255117EC0);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)v13 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_21AD24000();
  v5 = *(_QWORD *)(v4 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v3, 1, 1, v4);
  v6 = (_QWORD *)swift_allocObject();
  v6[2] = 0;
  v6[3] = 0;
  v6[4] = v0;
  v7 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4);
  v8 = v0;
  if (v7 == 1)
  {
    sub_21AD09128((uint64_t)v3);
  }
  else
  {
    sub_21AD23FF4();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v3, v4);
    if (v6[2])
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      v9 = sub_21AD23FDC();
      v11 = v10;
      swift_unknownObjectRelease();
      if (v11 | v9)
      {
        v13[0] = 0;
        v13[1] = 0;
        v13[2] = v9;
        v13[3] = v11;
      }
    }
  }
  return swift_task_create();
}

uint64_t sub_21AD07274(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v4[11] = a4;
  v5 = sub_21AD241E0();
  v4[12] = v5;
  v4[13] = *(_QWORD *)(v5 - 8);
  v4[14] = swift_task_alloc();
  v4[15] = swift_task_alloc();
  v6 = sub_21AD241F8();
  v4[16] = v6;
  v4[17] = *(_QWORD *)(v6 - 8);
  v4[18] = swift_task_alloc();
  v7 = sub_21AD23EEC();
  v4[19] = v7;
  v4[20] = *(_QWORD *)(v7 - 8);
  v4[21] = swift_task_alloc();
  v8 = sub_21AD23E80();
  v4[22] = v8;
  v4[23] = *(_QWORD *)(v8 - 8);
  v4[24] = swift_task_alloc();
  v4[25] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255117ED8);
  v4[26] = swift_task_alloc();
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_255117EE0);
  v4[27] = v9;
  v4[28] = *(_QWORD *)(v9 - 8);
  v4[29] = swift_task_alloc();
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_255117EE8);
  v4[30] = v10;
  v4[31] = *(_QWORD *)(v10 - 8);
  v4[32] = swift_task_alloc();
  v11 = sub_21AD23EB0();
  v4[33] = v11;
  v4[34] = *(_QWORD *)(v11 - 8);
  v4[35] = swift_task_alloc();
  v12 = sub_21AD23E98();
  v4[36] = v12;
  v4[37] = *(_QWORD *)(v12 - 8);
  v4[38] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_21AD07438()
{
  uint64_t v0;
  _QWORD *v2;

  if ((sub_21AD24018() & 1) != 0)
  {
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    sub_21AD23E8C();
    v2 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 312) = v2;
    *v2 = v0;
    v2[1] = sub_21AD07564;
    return sub_21AD23ED4();
  }
}

uint64_t sub_21AD07564()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 320) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_21AD075C8()
{
  uint64_t v0;
  _QWORD *v1;

  sub_21AD23EA4();
  sub_21AD23EBC();
  *(_QWORD *)(v0 + 328) = sub_21AD09168();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 336) = v1;
  *v1 = v0;
  v1[1] = sub_21AD07658;
  return sub_21AD23FE8();
}

uint64_t sub_21AD07658()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  swift_task_dealloc();
  if (v0)
    *(_QWORD *)(v2 + 344) = v0;
  return swift_task_switch();
}

uint64_t sub_21AD076BC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t);
  _QWORD *v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  id v28;
  NSObject *v29;
  os_log_type_t v30;
  _BOOL4 v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  id v42;
  uint64_t v43;
  unint64_t v44;
  unint64_t v45;
  uint64_t v46;
  unint64_t v47;
  void (*v48)(uint64_t, uint64_t);
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  _QWORD *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;

  v1 = *(_QWORD *)(v0 + 208);
  v2 = *(_QWORD *)(v0 + 176);
  v3 = *(_QWORD *)(v0 + 184);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v1, 1, v2) == 1)
  {
    v5 = *(_QWORD *)(v0 + 296);
    v4 = *(_QWORD *)(v0 + 304);
    v7 = *(_QWORD *)(v0 + 280);
    v6 = *(_QWORD *)(v0 + 288);
    v8 = *(_QWORD *)(v0 + 264);
    v9 = *(_QWORD *)(v0 + 272);
    v11 = *(_QWORD *)(v0 + 248);
    v10 = *(_QWORD *)(v0 + 256);
    v12 = *(_QWORD *)(v0 + 240);
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 224) + 8))(*(_QWORD *)(v0 + 232), *(_QWORD *)(v0 + 216));
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v10, v12);
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v7, v8);
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
    v14 = *(_QWORD *)(v0 + 104);
    v13 = *(_QWORD *)(v0 + 112);
    v15 = *(_QWORD *)(v0 + 96);
    sub_21AD241EC();
    *(_OWORD *)(v0 + 64) = xmmword_21AD271C0;
    *(_QWORD *)(v0 + 48) = 0;
    *(_QWORD *)(v0 + 40) = 0;
    *(_BYTE *)(v0 + 56) = 1;
    sub_21ACF7DA4(&qword_255117EF0, (uint64_t (*)(uint64_t))MEMORY[0x24BEE6E10], MEMORY[0x24BEE6E20]);
    sub_21AD242A0();
    sub_21ACF7DA4(&qword_255117EF8, (uint64_t (*)(uint64_t))MEMORY[0x24BEE6DC8], MEMORY[0x24BEE6E00]);
    sub_21AD24204();
    v16 = *(void (**)(uint64_t, uint64_t))(v14 + 8);
    *(_QWORD *)(v0 + 384) = v16;
    v16(v13, v15);
    v17 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 392) = v17;
    *v17 = v0;
    v17[1] = sub_21AD08018;
    return sub_21AD242AC();
  }
  else
  {
    (*(void (**)(_QWORD, uint64_t, uint64_t))(v3 + 32))(*(_QWORD *)(v0 + 200), v1, v2);
    if (qword_2551178F0 != -1)
      swift_once();
    v20 = *(_QWORD *)(v0 + 192);
    v19 = *(_QWORD *)(v0 + 200);
    v21 = *(_QWORD *)(v0 + 176);
    v22 = *(_QWORD *)(v0 + 184);
    v24 = *(_QWORD *)(v0 + 160);
    v23 = *(_QWORD *)(v0 + 168);
    v25 = *(_QWORD *)(v0 + 152);
    v26 = *(void **)(v0 + 88);
    v27 = __swift_project_value_buffer(v25, (uint64_t)qword_2551180E8);
    swift_beginAccess();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v24 + 16))(v23, v27, v25);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v22 + 16))(v20, v19, v21);
    v28 = v26;
    v29 = sub_21AD23EE0();
    v30 = sub_21AD2406C();
    v31 = os_log_type_enabled(v29, v30);
    v33 = *(_QWORD *)(v0 + 184);
    v32 = *(_QWORD *)(v0 + 192);
    v34 = *(_QWORD *)(v0 + 168);
    v35 = *(_QWORD *)(v0 + 176);
    v36 = *(_QWORD *)(v0 + 152);
    v37 = *(_QWORD *)(v0 + 160);
    v38 = *(void **)(v0 + 88);
    if (v31)
    {
      v57 = *(_QWORD *)(v0 + 160);
      v39 = swift_slowAlloc();
      v54 = v35;
      v40 = swift_slowAlloc();
      v58 = v40;
      *(_DWORD *)v39 = 136315394;
      v53 = v33;
      v41 = v38;
      v42 = objc_msgSend(v41, sel_description);
      v55 = v36;
      v56 = v34;
      v43 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
      v45 = v44;

      *(_QWORD *)(v39 + 4) = sub_21ACF58B4(v43, v45, &v58);
      swift_bridgeObjectRelease();

      *(_WORD *)(v39 + 12) = 2080;
      v46 = sub_21AD23E74();
      *(_QWORD *)(v39 + 14) = sub_21ACF58B4(v46, v47, &v58);
      swift_bridgeObjectRelease();
      v48 = *(void (**)(uint64_t, uint64_t))(v53 + 8);
      v48(v32, v54);
      _os_log_impl(&dword_21ACD4000, v29, v30, "[%s]: Detected Sound Action event: %s", (uint8_t *)v39, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x220756ED0](v40, -1, -1);
      MEMORY[0x220756ED0](v39, -1, -1);

      (*(void (**)(uint64_t, uint64_t))(v57 + 8))(v56, v55);
    }
    else
    {

      v48 = *(void (**)(uint64_t, uint64_t))(v33 + 8);
      v48(v32, v35);

      (*(void (**)(uint64_t, uint64_t))(v37 + 8))(v34, v36);
    }
    *(_QWORD *)(v0 + 352) = v48;
    v49 = sub_21AD23E74();
    v51 = v50;
    *(_QWORD *)(v0 + 360) = v50;
    v52 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 368) = v52;
    *v52 = v0;
    v52[1] = sub_21AD07EF0;
    return sub_21AD084DC(v49, v51);
  }
}

uint64_t sub_21AD07B0C()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 80) = *(_QWORD *)(v0 + 344);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255117930);
  swift_willThrowTypedImpl();
  return swift_task_switch();
}

uint64_t sub_21AD07B6C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  os_log_type_t v14;
  _BOOL4 v15;
  void *v16;
  uint64_t v17;
  _QWORD *v18;
  id v19;
  id v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t, uint64_t);
  _QWORD *v30;
  uint64_t v32;
  uint64_t v33;

  v2 = *(_QWORD *)(v0 + 272);
  v1 = *(_QWORD *)(v0 + 280);
  v4 = *(_QWORD *)(v0 + 256);
  v3 = *(_QWORD *)(v0 + 264);
  v5 = *(_QWORD *)(v0 + 240);
  v6 = *(_QWORD *)(v0 + 248);
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 224) + 8))(*(_QWORD *)(v0 + 232), *(_QWORD *)(v0 + 216));
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  v7 = *(void **)(v0 + 344);
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 296) + 8))(*(_QWORD *)(v0 + 304), *(_QWORD *)(v0 + 288));
  if (qword_2551178E0 != -1)
    swift_once();
  v8 = *(void **)(v0 + 88);
  __swift_project_value_buffer(*(_QWORD *)(v0 + 152), (uint64_t)qword_2551180B8);
  v9 = v8;
  v10 = v7;
  v11 = v9;
  v12 = v7;
  v13 = sub_21AD23EE0();
  v14 = sub_21AD2406C();
  v15 = os_log_type_enabled(v13, v14);
  v16 = *(void **)(v0 + 88);
  if (v15)
  {
    v17 = swift_slowAlloc();
    v18 = (_QWORD *)swift_slowAlloc();
    v32 = swift_slowAlloc();
    v33 = v32;
    *(_DWORD *)v17 = 136315394;
    v19 = v16;
    v20 = objc_msgSend(v19, sel_description);
    v21 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
    v23 = v22;

    *(_QWORD *)(v17 + 4) = sub_21ACF58B4(v21, v23, &v33);
    swift_bridgeObjectRelease();

    *(_WORD *)(v17 + 12) = 2112;
    v24 = v7;
    v25 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v17 + 14) = v25;
    *v18 = v25;

    _os_log_impl(&dword_21ACD4000, v13, v14, "[%s]: session failed with %@", (uint8_t *)v17, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_255117958);
    swift_arrayDestroy();
    MEMORY[0x220756ED0](v18, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x220756ED0](v32, -1, -1);
    MEMORY[0x220756ED0](v17, -1, -1);

  }
  else
  {

  }
  v27 = *(_QWORD *)(v0 + 104);
  v26 = *(_QWORD *)(v0 + 112);
  v28 = *(_QWORD *)(v0 + 96);
  sub_21AD241EC();
  *(_OWORD *)(v0 + 64) = xmmword_21AD271C0;
  *(_QWORD *)(v0 + 48) = 0;
  *(_QWORD *)(v0 + 40) = 0;
  *(_BYTE *)(v0 + 56) = 1;
  sub_21ACF7DA4(&qword_255117EF0, (uint64_t (*)(uint64_t))MEMORY[0x24BEE6E10], MEMORY[0x24BEE6E20]);
  sub_21AD242A0();
  sub_21ACF7DA4(&qword_255117EF8, (uint64_t (*)(uint64_t))MEMORY[0x24BEE6DC8], MEMORY[0x24BEE6E00]);
  sub_21AD24204();
  v29 = *(void (**)(uint64_t, uint64_t))(v27 + 8);
  *(_QWORD *)(v0 + 384) = v29;
  v29(v26, v28);
  v30 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 392) = v30;
  *v30 = v0;
  v30[1] = sub_21AD08018;
  return sub_21AD242AC();
}

uint64_t sub_21AD07EF0()
{
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return swift_task_switch();
}

uint64_t sub_21AD07F4C()
{
  uint64_t v0;
  _QWORD *v1;

  (*(void (**)(_QWORD, _QWORD))(v0 + 352))(*(_QWORD *)(v0 + 200), *(_QWORD *)(v0 + 176));
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 376) = v1;
  *v1 = v0;
  v1[1] = sub_21AD07FB4;
  return sub_21AD23FE8();
}

uint64_t sub_21AD07FB4()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  swift_task_dealloc();
  if (v0)
    *(_QWORD *)(v2 + 344) = v0;
  return swift_task_switch();
}

uint64_t sub_21AD08018()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = *v1;
  *(_QWORD *)(*v1 + 400) = v0;
  swift_task_dealloc();
  if (v0)
  {
    (*(void (**)(_QWORD, _QWORD))(v2 + 384))(*(_QWORD *)(v2 + 120), *(_QWORD *)(v2 + 96));
  }
  else
  {
    v4 = *(_QWORD *)(v2 + 136);
    v3 = *(_QWORD *)(v2 + 144);
    v5 = *(_QWORD *)(v2 + 128);
    (*(void (**)(_QWORD, _QWORD))(v2 + 384))(*(_QWORD *)(v2 + 120), *(_QWORD *)(v2 + 96));
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  }
  return swift_task_switch();
}

uint64_t sub_21AD080B8()
{
  uint64_t v0;

  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 136) + 8))(*(_QWORD *)(v0 + 144), *(_QWORD *)(v0 + 128));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_21AD08194()
{
  uint64_t v0;
  void *v1;
  void *v2;
  id v3;
  id v4;
  id v5;
  id v6;
  NSObject *v7;
  os_log_type_t v8;
  _BOOL4 v9;
  void *v10;
  uint64_t v11;
  _QWORD *v12;
  id v13;
  id v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, uint64_t);
  _QWORD *v24;
  uint64_t v26;
  uint64_t v27;

  v1 = *(void **)(v0 + 320);
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 296) + 8))(*(_QWORD *)(v0 + 304), *(_QWORD *)(v0 + 288));
  if (qword_2551178E0 != -1)
    swift_once();
  v2 = *(void **)(v0 + 88);
  __swift_project_value_buffer(*(_QWORD *)(v0 + 152), (uint64_t)qword_2551180B8);
  v3 = v2;
  v4 = v1;
  v5 = v3;
  v6 = v1;
  v7 = sub_21AD23EE0();
  v8 = sub_21AD2406C();
  v9 = os_log_type_enabled(v7, v8);
  v10 = *(void **)(v0 + 88);
  if (v9)
  {
    v11 = swift_slowAlloc();
    v12 = (_QWORD *)swift_slowAlloc();
    v26 = swift_slowAlloc();
    v27 = v26;
    *(_DWORD *)v11 = 136315394;
    v13 = v10;
    v14 = objc_msgSend(v13, sel_description);
    v15 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
    v17 = v16;

    *(_QWORD *)(v11 + 4) = sub_21ACF58B4(v15, v17, &v27);
    swift_bridgeObjectRelease();

    *(_WORD *)(v11 + 12) = 2112;
    v18 = v1;
    v19 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v11 + 14) = v19;
    *v12 = v19;

    _os_log_impl(&dword_21ACD4000, v7, v8, "[%s]: session failed with %@", (uint8_t *)v11, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_255117958);
    swift_arrayDestroy();
    MEMORY[0x220756ED0](v12, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x220756ED0](v26, -1, -1);
    MEMORY[0x220756ED0](v11, -1, -1);

  }
  else
  {

  }
  v21 = *(_QWORD *)(v0 + 104);
  v20 = *(_QWORD *)(v0 + 112);
  v22 = *(_QWORD *)(v0 + 96);
  sub_21AD241EC();
  *(_OWORD *)(v0 + 64) = xmmword_21AD271C0;
  *(_QWORD *)(v0 + 48) = 0;
  *(_QWORD *)(v0 + 40) = 0;
  *(_BYTE *)(v0 + 56) = 1;
  sub_21ACF7DA4(&qword_255117EF0, (uint64_t (*)(uint64_t))MEMORY[0x24BEE6E10], MEMORY[0x24BEE6E20]);
  sub_21AD242A0();
  sub_21ACF7DA4(&qword_255117EF8, (uint64_t (*)(uint64_t))MEMORY[0x24BEE6DC8], MEMORY[0x24BEE6E00]);
  sub_21AD24204();
  v23 = *(void (**)(uint64_t, uint64_t))(v21 + 8);
  *(_QWORD *)(v0 + 384) = v23;
  v23(v20, v22);
  v24 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 392) = v24;
  *v24 = v0;
  v24[1] = sub_21AD08018;
  return sub_21AD242AC();
}

uint64_t sub_21AD084DC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;

  v3[15] = a2;
  v3[16] = v2;
  v3[14] = a1;
  v4 = sub_21AD23EEC();
  v3[17] = v4;
  v3[18] = *(_QWORD *)(v4 - 8);
  v3[19] = swift_task_alloc();
  v3[20] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_21AD08550()
{
  uint64_t v0;
  unsigned __int8 v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  _BOOL4 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint8_t *v13;
  uint64_t v14;
  unsigned __int8 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  id v21;
  NSObject *v22;
  os_log_type_t v23;
  _BOOL4 v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  id v30;
  id v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  id *v35;
  uint64_t v37;
  uint64_t v38;
  uint64_t type;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;

  swift_bridgeObjectRetain();
  v1 = sub_21AD0B1E8();
  if (v1 == 14)
  {
    if (qword_2551178F0 != -1)
      swift_once();
    v3 = *(_QWORD *)(v0 + 144);
    v2 = *(_QWORD *)(v0 + 152);
    v4 = *(_QWORD *)(v0 + 136);
    v5 = __swift_project_value_buffer(v4, (uint64_t)qword_2551180E8);
    swift_beginAccess();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v5, v4);
    swift_bridgeObjectRetain_n();
    v6 = sub_21AD23EE0();
    v7 = sub_21AD24060();
    v8 = os_log_type_enabled(v6, v7);
    v10 = *(_QWORD *)(v0 + 144);
    v9 = *(_QWORD *)(v0 + 152);
    v11 = *(_QWORD *)(v0 + 136);
    v12 = *(_QWORD *)(v0 + 120);
    if (v8)
    {
      v42 = *(_QWORD *)(v0 + 144);
      type = *(_QWORD *)(v0 + 112);
      v40 = *(_QWORD *)(v0 + 136);
      v13 = (uint8_t *)swift_slowAlloc();
      v14 = swift_slowAlloc();
      v44 = v14;
      *(_DWORD *)v13 = 136315138;
      swift_bridgeObjectRetain();
      *(_QWORD *)(v0 + 88) = sub_21ACF58B4(type, v12, &v44);
      sub_21AD240CC();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_21ACD4000, v6, v7, "no sound action type found for identifier: %s", v13, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x220756ED0](v14, -1, -1);
      MEMORY[0x220756ED0](v13, -1, -1);

      (*(void (**)(uint64_t, uint64_t))(v42 + 8))(v9, v40);
    }
    else
    {
      swift_bridgeObjectRelease_n();

      (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v9, v11);
    }
  }
  else
  {
    v15 = v1;
    if (qword_2551178F0 != -1)
      swift_once();
    v16 = *(_QWORD *)(v0 + 160);
    v18 = *(_QWORD *)(v0 + 136);
    v17 = *(_QWORD *)(v0 + 144);
    v19 = *(void **)(v0 + 128);
    v20 = __swift_project_value_buffer(v18, (uint64_t)qword_2551180E8);
    swift_beginAccess();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 16))(v16, v20, v18);
    v21 = v19;
    v22 = sub_21AD23EE0();
    v23 = sub_21AD2406C();
    v24 = os_log_type_enabled(v22, v23);
    v25 = *(_QWORD *)(v0 + 160);
    v26 = *(_QWORD *)(v0 + 136);
    v27 = *(_QWORD *)(v0 + 144);
    v28 = *(void **)(v0 + 128);
    if (v24)
    {
      v29 = swift_slowAlloc();
      v41 = swift_slowAlloc();
      v44 = v41;
      *(_DWORD *)v29 = 136315394;
      v43 = v27;
      v30 = v28;
      v31 = objc_msgSend(v30, sel_description);
      v37 = v26;
      v38 = v25;
      v32 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
      v34 = v33;

      *(_QWORD *)(v0 + 96) = sub_21ACF58B4(v32, v34, &v44);
      sub_21AD240CC();
      swift_bridgeObjectRelease();

      *(_WORD *)(v29 + 12) = 2048;
      *(_QWORD *)(v0 + 104) = v15 + 1;
      sub_21AD240CC();
      _os_log_impl(&dword_21ACD4000, v22, v23, "[%s]: posting voice trigger event to system: %ld", (uint8_t *)v29, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x220756ED0](v41, -1, -1);
      MEMORY[0x220756ED0](v29, -1, -1);

      (*(void (**)(uint64_t, uint64_t))(v43 + 8))(v38, v37);
    }
    else
    {

      (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v25, v26);
    }
    v35 = (id *)(*(_QWORD *)(v0 + 128)
               + OBJC_IVAR____TtC18AXSoundDetectionUI34AXSASecureControllerImplementation_delegate);
    swift_beginAccess();
    if (*v35)
      objc_msgSend(*v35, sel_postEventToSystemWithSoundActionEvent_, v15 + 1);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

id AXSASecureControllerImplementation.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AXSASecureControllerImplementation();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for AXSASecureControllerImplementation()
{
  return objc_opt_self();
}

uint64_t sub_21AD08A90()
{
  char *v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint64_t v15;
  char *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v23;
  char *v24;
  NSObject *v25;
  os_log_type_t v26;
  uint8_t *v27;
  char *v28;
  char *v29;
  id v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  uint8_t *v36;
  uint64_t v37;
  _QWORD v38[2];
  uint8_t *v39;
  uint64_t v40;
  uint8_t *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;

  v1 = v0;
  v2 = sub_21AD23EEC();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)v38 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)v38 - v7;
  v9 = OBJC_IVAR____TtC18AXSoundDetectionUI34AXSASecureControllerImplementation_currentTask;
  if (*(_QWORD *)&v1[OBJC_IVAR____TtC18AXSoundDetectionUI34AXSASecureControllerImplementation_currentTask])
  {
    if (qword_2551178F0 != -1)
      swift_once();
    v10 = __swift_project_value_buffer(v2, (uint64_t)qword_2551180E8);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v8, v10, v2);
    v11 = v1;
    v12 = sub_21AD23EE0();
    v13 = sub_21AD2406C();
    if (os_log_type_enabled(v12, v13))
    {
      v14 = (uint8_t *)swift_slowAlloc();
      v15 = swift_slowAlloc();
      v45 = v15;
      v43 = v2;
      *(_DWORD *)v14 = 136315138;
      v41 = v14 + 4;
      v16 = v11;
      v17 = objc_msgSend(v16, sel_description);
      v18 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
      v42 = v3;
      v19 = v18;
      v21 = v20;

      v44 = sub_21ACF58B4(v19, v21, &v45);
      sub_21AD240CC();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_21ACD4000, v12, v13, "[%s]: sound actions is already listening.", v14, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x220756ED0](v15, -1, -1);
      MEMORY[0x220756ED0](v14, -1, -1);

      return (*(uint64_t (**)(char *, uint64_t))(v42 + 8))(v8, v43);
    }
    else
    {

      return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v8, v2);
    }
  }
  else
  {
    if (qword_2551178F0 != -1)
      swift_once();
    v23 = __swift_project_value_buffer(v2, (uint64_t)qword_2551180E8);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, v23, v2);
    v24 = v1;
    v25 = sub_21AD23EE0();
    v26 = sub_21AD2406C();
    if (os_log_type_enabled(v25, v26))
    {
      v27 = (uint8_t *)swift_slowAlloc();
      v40 = swift_slowAlloc();
      v45 = v40;
      v39 = v27;
      *(_DWORD *)v27 = 136315138;
      v38[1] = v27 + 4;
      v28 = v24;
      v41 = (uint8_t *)v24;
      v29 = v28;
      v30 = objc_msgSend(v28, sel_description);
      v42 = v3;
      v31 = v30;
      v32 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
      v43 = v2;
      v33 = v32;
      v35 = v34;

      v44 = sub_21ACF58B4(v33, v35, &v45);
      sub_21AD240CC();

      swift_bridgeObjectRelease();
      v36 = v39;
      _os_log_impl(&dword_21ACD4000, v25, v26, "[%s]: sound actions will start listening.", v39, 0xCu);
      v37 = v40;
      swift_arrayDestroy();
      MEMORY[0x220756ED0](v37, -1, -1);
      MEMORY[0x220756ED0](v36, -1, -1);

      (*(void (**)(char *, uint64_t))(v42 + 8))(v6, v43);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
    }
    *(_QWORD *)&v1[v9] = sub_21AD070C4();
    return swift_release();
  }
}

uint64_t sub_21AD08F04@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v3;

  v3 = (_QWORD *)(*a1 + OBJC_IVAR____TtC18AXSoundDetectionUI34AXSASecureControllerImplementation_delegate);
  swift_beginAccess();
  *a2 = *v3;
  return swift_unknownObjectRetain();
}

uint64_t method lookup function for AXSASecureControllerImplementation()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of AXSASecureControllerImplementation.delegate.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x78))();
}

uint64_t dispatch thunk of AXSASecureControllerImplementation.delegate.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x80))();
}

uint64_t dispatch thunk of AXSASecureControllerImplementation.delegate.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x88))();
}

uint64_t dispatch thunk of AXSASecureControllerImplementation.isListening.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x90))();
}

uint64_t dispatch thunk of AXSASecureControllerImplementation.isSecure.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x98))();
}

uint64_t dispatch thunk of AXSASecureControllerImplementation.startListening()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of AXSASecureControllerImplementation.startListening(onQueue:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of AXSASecureControllerImplementation.stopListening()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xB0))();
}

uint64_t sub_21AD09048()
{
  uint64_t v0;

  swift_unknownObjectRelease();

  return swift_deallocObject();
}

uint64_t sub_21AD09074(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_21AD090E0;
  return sub_21AD07274(a1, v4, v5, v6);
}

uint64_t sub_21AD090E0()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_21AD09128(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_255117EC0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_21AD09168()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255117F00;
  if (!qword_255117F00)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255117EE0);
    result = MEMORY[0x220756E40](MEMORY[0x24BDE9A90], v1);
    atomic_store(result, (unint64_t *)&qword_255117F00);
  }
  return result;
}

uint64_t sub_21AD09200()
{
  swift_beginAccess();
  return swift_unknownObjectRetain();
}

uint64_t sub_21AD092AC(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)(v1 + OBJC_IVAR____TtC18AXSoundDetectionUI30AXSANSControllerImplementation_delegate);
  swift_beginAccess();
  *v3 = a1;
  return swift_unknownObjectRelease();
}

uint64_t sub_21AD092FC(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;
  _QWORD *v3;

  v2 = *a1;
  v3 = (_QWORD *)(*a2 + OBJC_IVAR____TtC18AXSoundDetectionUI30AXSANSControllerImplementation_delegate);
  swift_beginAccess();
  *v3 = v2;
  swift_unknownObjectRetain();
  return swift_unknownObjectRelease();
}

uint64_t (*sub_21AD09364())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

id AXSANSControllerImplementation.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

char *AXSANSControllerImplementation.init()()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t (*v5)(uint64_t);
  uint64_t v6;
  id v7;
  char *v8;
  id v9;
  objc_class *v10;
  char *v11;
  uint64_t v13;
  objc_super v14;
  uint64_t v15;

  v13 = sub_21AD24084();
  v1 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v3 = (char *)&v13 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_21AD24078();
  v5 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5688];
  MEMORY[0x24BDAC7A8](v4);
  v6 = sub_21AD23F1C();
  MEMORY[0x24BDAC7A8](v6);
  *(_QWORD *)&v0[OBJC_IVAR____TtC18AXSoundDetectionUI30AXSANSControllerImplementation_delegate] = 0;
  v7 = objc_allocWithZone((Class)AXSDVoiceTriggerModelManager);
  v8 = v0;
  v9 = objc_msgSend(v7, sel_initWithError_, 0);
  *(_QWORD *)&v8[OBJC_IVAR____TtC18AXSoundDetectionUI30AXSANSControllerImplementation_modelManager] = v9;
  sub_21ACFA6E4();
  sub_21AD23F10();
  v15 = MEMORY[0x24BEE4AF8];
  sub_21ACF7DA4(&qword_255117BD8, v5, MEMORY[0x24BEE5698]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255117BE0);
  sub_21AD03D88(&qword_255117BE8, &qword_255117BE0);
  sub_21AD240E4();
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v3, *MEMORY[0x24BEE5750], v13);
  *(_QWORD *)&v8[OBJC_IVAR____TtC18AXSoundDetectionUI30AXSANSControllerImplementation_processingQueue] = sub_21AD240A8();

  v10 = (objc_class *)type metadata accessor for AXSANSControllerImplementation();
  v14.receiver = v8;
  v14.super_class = v10;
  v11 = (char *)objc_msgSendSuper2(&v14, sel_init);
  objc_msgSend(*(id *)&v11[OBJC_IVAR____TtC18AXSoundDetectionUI30AXSANSControllerImplementation_modelManager], sel_setDelegate_, v11);
  return v11;
}

uint64_t type metadata accessor for AXSANSControllerImplementation()
{
  return objc_opt_self();
}

void sub_21AD096E8()
{
  sub_21AD0972C(0);
}

void sub_21AD0972C(void *a1)
{
  void *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  char *v18;
  NSObject *v19;
  os_log_type_t v20;
  uint64_t v21;
  char *v22;
  id v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  void *v27;
  id v28;
  id v29;
  void (*v30)(char *, uint64_t);
  void *v31;
  char *v32;
  _QWORD *v33;
  uint64_t v34;
  id *v35;
  char *v36;
  NSObject *v37;
  os_log_type_t v38;
  uint8_t *v39;
  uint64_t v40;
  char *v41;
  id v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  unint64_t v47;
  __objc2_meth_list **p_base_meths;
  id v49;
  char *v50;
  id v51;
  char *v52;
  id v53;
  NSObject *v54;
  os_log_type_t v55;
  uint64_t v56;
  uint64_t v57;
  char *v58;
  char *v59;
  id v60;
  uint64_t v61;
  uint64_t v62;
  unint64_t v63;
  unint64_t v64;
  id v65;
  _QWORD *v66;
  char *v67;
  __objc2_meth_list *v68;
  void *v69;
  uint64_t v70;
  _QWORD *v71;
  uint64_t v72;
  char *v73;
  id v74;
  uint64_t v75;
  _QWORD *v76;
  char *v77;
  void (*v78)(char *, uint64_t, uint64_t);
  uint64_t v79;
  char *v80;
  void *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84[8];

  v84[6] = *MEMORY[0x24BDAC8D0];
  v3 = sub_21AD23EEC();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = MEMORY[0x24BDAC7A8](v3);
  v80 = (char *)&v70 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v70 - v8;
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v70 - v10;
  if (qword_2551178F0 != -1)
    swift_once();
  v12 = __swift_project_value_buffer(v3, (uint64_t)qword_2551180E8);
  swift_beginAccess();
  v78 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 16);
  v78(v11, v12, v3);
  v13 = a1;
  v81 = a1;
  v14 = v13;
  v15 = v1;
  v16 = v14;
  v17 = v4;
  v18 = (char *)v15;
  v19 = sub_21AD23EE0();
  v20 = sub_21AD2406C();
  if (os_log_type_enabled(v19, v20))
  {
    v74 = v16;
    v75 = v17;
    v76 = (_QWORD *)v12;
    v77 = v9;
    v79 = v3;
    v21 = swift_slowAlloc();
    v71 = (_QWORD *)swift_slowAlloc();
    v72 = swift_slowAlloc();
    v84[0] = v72;
    *(_DWORD *)v21 = 136315394;
    v73 = v18;
    v22 = v18;
    v23 = objc_msgSend(v22, sel_description);
    v24 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
    v26 = v25;

    v83 = sub_21ACF58B4(v24, v26, v84);
    sub_21AD240CC();

    swift_bridgeObjectRelease();
    *(_WORD *)(v21 + 12) = 2112;
    v27 = v81;
    if (v81)
    {
      v28 = v74;
      v83 = (uint64_t)v74;
      v29 = v74;
      sub_21AD240CC();
      v3 = v79;
    }
    else
    {
      v83 = 0;
      sub_21AD240CC();
      v3 = v79;
      v28 = v74;
    }
    v31 = v27;
    v33 = v71;
    *v71 = v31;

    _os_log_impl(&dword_21ACD4000, v19, v20, "[%s]: start listening with queue: %@", (uint8_t *)v21, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_255117958);
    swift_arrayDestroy();
    MEMORY[0x220756ED0](v33, -1, -1);
    v34 = v72;
    swift_arrayDestroy();
    MEMORY[0x220756ED0](v34, -1, -1);
    MEMORY[0x220756ED0](v21, -1, -1);

    v30 = *(void (**)(char *, uint64_t))(v75 + 8);
    v30(v11, v3);
    v12 = (uint64_t)v76;
    v9 = v77;
    v32 = v80;
    v16 = v28;
    v18 = v73;
  }
  else
  {

    v30 = *(void (**)(char *, uint64_t))(v17 + 8);
    v30(v11, v3);
    v32 = v80;
    v31 = v81;
  }
  v35 = (id *)&v18[OBJC_IVAR____TtC18AXSoundDetectionUI34AXSDNSBaseControllerImplementation_listener];
  swift_beginAccess();
  if (objc_msgSend(*v35, sel_containsListenDelegate_, v18)
    && (objc_msgSend(*v35, sel_isListening) & 1) != 0)
  {
    v78(v32, v12, v3);
    v36 = v18;
    v37 = sub_21AD23EE0();
    v38 = sub_21AD2406C();
    if (os_log_type_enabled(v37, v38))
    {
      v39 = (uint8_t *)swift_slowAlloc();
      v40 = swift_slowAlloc();
      v83 = v40;
      *(_DWORD *)v39 = 136315138;
      v41 = v36;
      v42 = objc_msgSend(v41, sel_description);
      v79 = v3;
      v43 = v42;
      v44 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
      v78 = (void (*)(char *, uint64_t, uint64_t))v30;
      v45 = v44;
      v47 = v46;

      v82 = sub_21ACF58B4(v45, v47, &v83);
      sub_21AD240CC();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_21ACD4000, v37, v38, "[%s]: Sound Actions is already listening. startListening is a no-op.", v39, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x220756ED0](v40, -1, -1);
      MEMORY[0x220756ED0](v39, -1, -1);

      ((void (*)(char *, uint64_t))v78)(v80, v79);
    }
    else
    {

      v30(v32, v3);
    }
  }
  else
  {
    p_base_meths = &AXSANSControllerImplementation.base_meths;
    if (v31)
    {
      v78(v9, v12, v3);
      v49 = v16;
      v50 = v18;
      v51 = v49;
      v52 = v50;
      v53 = v51;
      v54 = sub_21AD23EE0();
      v55 = sub_21AD2406C();
      if (os_log_type_enabled(v54, v55))
      {
        v56 = swift_slowAlloc();
        v79 = v3;
        v57 = v56;
        v76 = (_QWORD *)swift_slowAlloc();
        v80 = (char *)swift_slowAlloc();
        v83 = (uint64_t)v80;
        *(_DWORD *)v57 = 136315394;
        v75 = v57 + 4;
        v58 = v52;
        v77 = v9;
        v59 = v58;
        v60 = objc_msgSend(v58, sel_description);
        v61 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
        v78 = (void (*)(char *, uint64_t, uint64_t))v30;
        v62 = v61;
        v64 = v63;

        v82 = sub_21ACF58B4(v62, v64, &v83);
        sub_21AD240CC();

        swift_bridgeObjectRelease();
        *(_WORD *)(v57 + 12) = 2112;
        v82 = (uint64_t)v53;
        v65 = v53;
        p_base_meths = (__objc2_meth_list **)(&AXSANSControllerImplementation + 32);
        sub_21AD240CC();
        v66 = v76;
        *v76 = v81;

        _os_log_impl(&dword_21ACD4000, v54, v55, "[%s]: updating dispatch queue to: %@", (uint8_t *)v57, 0x16u);
        __swift_instantiateConcreteTypeFromMangledName(&qword_255117958);
        swift_arrayDestroy();
        MEMORY[0x220756ED0](v66, -1, -1);
        v67 = v80;
        swift_arrayDestroy();
        MEMORY[0x220756ED0](v67, -1, -1);
        MEMORY[0x220756ED0](v57, -1, -1);

        ((void (*)(char *, uint64_t))v78)(v77, v79);
      }
      else
      {

        v30(v9, v3);
      }
      v68 = p_base_meths[484];
      v69 = *(void **)((char *)v68 + (_QWORD)v52);
      *(__objc2_meth_list *)((char *)v68 + (_QWORD)v52) = (__objc2_meth_list)v53;

    }
    objc_msgSend(*(id *)&v18[OBJC_IVAR____TtC18AXSoundDetectionUI30AXSANSControllerImplementation_modelManager], sel_setProcessingQueue_, *(_QWORD *)((char *)p_base_meths[484] + (_QWORD)v18));
    sub_21ACF7348(v18, v18);
  }
}

uint64_t sub_21AD09F80()
{
  void *v0;

  return sub_21ACFA6AC(v0, v0);
}

uint64_t sub_21AD09FB8()
{
  uint64_t v0;

  return swift_unknownObjectRelease();
}

id AXSANSControllerImplementation.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AXSANSControllerImplementation();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

Swift::Void __swiftcall AXSANSControllerImplementation.receivedBuffer(_:at:)(AVAudioPCMBuffer _, AVAudioTime *at)
{
  char *v2;
  void *impl;
  Class isa;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  _QWORD *v13;
  void *v14;
  id v15;
  char *v16;
  objc_class *v17;
  id v18;
  _QWORD v19[2];
  _QWORD aBlock[6];

  impl = _.super._impl;
  isa = _.super.super.isa;
  v5 = sub_21AD23F04();
  v19[0] = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_21AD23F1C();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = *(void **)&v2[OBJC_IVAR____TtC18AXSoundDetectionUI30AXSANSControllerImplementation_processingQueue];
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = v2;
  v13[3] = isa;
  v13[4] = impl;
  aBlock[4] = sub_21AD0B168;
  aBlock[5] = v13;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_21ACF4004;
  aBlock[3] = &block_descriptor_2;
  v14 = _Block_copy(aBlock);
  v15 = v12;
  v16 = v2;
  v17 = isa;
  v18 = impl;
  sub_21AD23F10();
  v19[1] = MEMORY[0x24BEE4AF8];
  sub_21ACF7DA4((unint64_t *)&qword_255117940, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255118240);
  sub_21AD03D88((unint64_t *)&qword_255117950, (uint64_t *)&unk_255118240);
  sub_21AD240E4();
  MEMORY[0x220756504](0, v11, v7, v14);
  _Block_release(v14);

  (*(void (**)(char *, uint64_t))(v19[0] + 8))(v7, v5);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  swift_release();
}

Swift::Void __swiftcall AXSANSControllerImplementation.listenEngineDidStart(withInputFormat:)(AVAudioFormat_optional *withInputFormat)
{
  void *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  AVAudioFormat_optional *v17;
  uint64_t v18;
  char *v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  char *v23;
  char *v24;
  id v25;
  id v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  NSObject *v33;
  os_log_type_t v34;
  uint64_t v35;
  uint8_t *v36;
  id v37;
  id v38;
  uint64_t v39;
  unint64_t v40;
  unint64_t v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  AVAudioFormat_optional *v46;
  char *v47;
  id v48;
  char *v49;
  char *v50;
  uint8_t *v51;
  uint64_t v52;
  AVAudioFormat_optional *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  char *v58;
  uint64_t v59;
  char *v60;
  uint64_t v61;
  uint64_t aBlock[6];
  uint64_t v63[3];
  uint64_t v64;

  v3 = sub_21AD23F04();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v51 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_21AD23F1C();
  v61 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v60 = (char *)&v51 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_21AD23EEC();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v51 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v51 - v14;
  if (withInputFormat)
  {
    v57 = v7;
    v59 = v4;
    v16 = qword_2551178F0;
    v17 = withInputFormat;
    if (v16 != -1)
      swift_once();
    v58 = v6;
    v18 = __swift_project_value_buffer(v9, (uint64_t)qword_2551180E8);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v15, v18, v9);
    v19 = v1;
    v20 = sub_21AD23EE0();
    v21 = sub_21AD2406C();
    if (os_log_type_enabled(v20, v21))
    {
      v22 = (uint8_t *)swift_slowAlloc();
      v52 = swift_slowAlloc();
      aBlock[0] = v52;
      v54 = v3;
      *(_DWORD *)v22 = 136315138;
      v51 = v22 + 4;
      v23 = v19;
      v55 = v9;
      v24 = v23;
      v25 = objc_msgSend(v23, sel_description);
      v56 = v10;
      v26 = v25;
      v27 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
      v53 = v17;
      v29 = v28;

      v64 = sub_21ACF58B4(v27, v29, aBlock);
      v3 = v54;
      sub_21AD240CC();

      v17 = v53;
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_21ACD4000, v20, v21, "[%s]: listen engine did start", v22, 0xCu);
      v30 = v52;
      swift_arrayDestroy();
      MEMORY[0x220756ED0](v30, -1, -1);
      MEMORY[0x220756ED0](v22, -1, -1);

      (*(void (**)(char *, uint64_t))(v56 + 8))(v15, v55);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v10 + 8))(v15, v9);
    }
    v43 = *(void **)&v19[OBJC_IVAR____TtC18AXSoundDetectionUI30AXSANSControllerImplementation_processingQueue];
    v44 = swift_allocObject();
    *(_QWORD *)(v44 + 16) = v19;
    *(_QWORD *)(v44 + 24) = v17;
    aBlock[4] = (uint64_t)sub_21AD0B1CC;
    aBlock[5] = v44;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_21ACF4004;
    aBlock[3] = (uint64_t)&block_descriptor_6_1;
    v45 = _Block_copy(aBlock);
    v46 = v17;
    v47 = v19;
    v48 = v43;
    v49 = v60;
    sub_21AD23F10();
    v64 = MEMORY[0x24BEE4AF8];
    sub_21ACF7DA4((unint64_t *)&qword_255117940, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255118240);
    sub_21AD03D88((unint64_t *)&qword_255117950, (uint64_t *)&unk_255118240);
    v50 = v58;
    sub_21AD240E4();
    MEMORY[0x220756504](0, v49, v50, v45);
    _Block_release(v45);

    (*(void (**)(char *, uint64_t))(v59 + 8))(v50, v3);
    (*(void (**)(char *, uint64_t))(v61 + 8))(v49, v57);
    swift_release();
  }
  else
  {
    if (qword_2551178F0 != -1)
      swift_once();
    v31 = __swift_project_value_buffer(v9, (uint64_t)qword_2551180E8);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v13, v31, v9);
    v32 = v1;
    v33 = sub_21AD23EE0();
    v34 = sub_21AD24060();
    if (os_log_type_enabled(v33, v34))
    {
      v56 = v10;
      v35 = swift_slowAlloc();
      v55 = v9;
      v36 = (uint8_t *)v35;
      v61 = swift_slowAlloc();
      v63[0] = v61;
      *(_DWORD *)v36 = 136315138;
      v60 = (char *)(v36 + 4);
      v37 = v32;
      v38 = objc_msgSend(v37, sel_description);
      v39 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
      v41 = v40;

      v64 = sub_21ACF58B4(v39, v41, v63);
      sub_21AD240CC();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_21ACD4000, v33, v34, "[%s]: listen engine did not return an audio format - this should NOT happen; bailing. File a radar!",
        v36,
        0xCu);
      v42 = v61;
      swift_arrayDestroy();
      MEMORY[0x220756ED0](v42, -1, -1);
      MEMORY[0x220756ED0](v36, -1, -1);

      (*(void (**)(char *, uint64_t))(v56 + 8))(v13, v55);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v9);
    }
    sub_21ACFA6AC(v32, v32);
  }
}

uint64_t AXSANSControllerImplementation.listenEngineFailedToStartWithError(_:)(void *a1)
{
  return sub_21AD0ADF4(a1, "[%s]: listen engine failed to start: %@");
}

uint64_t AXSANSControllerImplementation.receivedError(_:fromDetector:)(void *a1, void *a2)
{
  void *v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  os_log_type_t v17;
  int v18;
  uint64_t v19;
  _QWORD *v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  id v28;
  id v29;
  uint64_t v30;
  os_log_t v31;
  uint64_t v32;
  os_log_t v34;
  int v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;

  v5 = sub_21AD23EEC();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2551178F0 != -1)
    swift_once();
  v9 = __swift_project_value_buffer(v5, (uint64_t)qword_2551180E8);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v9, v5);
  v10 = v2;
  v11 = a2;
  v12 = a1;
  v13 = v10;
  v14 = v11;
  v15 = a1;
  v16 = sub_21AD23EE0();
  v17 = sub_21AD24060();
  v18 = v17;
  if (os_log_type_enabled(v16, v17))
  {
    v19 = swift_slowAlloc();
    v20 = (_QWORD *)swift_slowAlloc();
    v38 = swift_slowAlloc();
    v40 = v38;
    *(_DWORD *)v19 = 136315650;
    v36 = v19 + 4;
    v21 = v13;
    v22 = objc_msgSend(v21, sel_description);
    v35 = v18;
    v23 = v22;
    v24 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
    v34 = v16;
    v25 = v24;
    v37 = v6;
    v27 = v26;

    v39 = sub_21ACF58B4(v25, v27, &v40);
    sub_21AD240CC();

    swift_bridgeObjectRelease();
    v36 = v5;
    *(_WORD *)(v19 + 12) = 2112;
    v39 = (uint64_t)v14;
    v28 = v14;
    sub_21AD240CC();
    *v20 = v14;

    *(_WORD *)(v19 + 22) = 2112;
    v29 = a1;
    v30 = _swift_stdlib_bridgeErrorToNSError();
    v39 = v30;
    sub_21AD240CC();
    v20[1] = v30;

    v31 = v34;
    _os_log_impl(&dword_21ACD4000, v34, (os_log_type_t)v35, "[%s]: received error for sound action: %@. error: %@", (uint8_t *)v19, 0x20u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_255117958);
    swift_arrayDestroy();
    MEMORY[0x220756ED0](v20, -1, -1);
    v32 = v38;
    swift_arrayDestroy();
    MEMORY[0x220756ED0](v32, -1, -1);
    MEMORY[0x220756ED0](v19, -1, -1);

    return (*(uint64_t (**)(char *, uint64_t))(v37 + 8))(v8, v36);
  }
  else
  {

    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
}

uint64_t AXSANSControllerImplementation.listeningStoppedWithError(_:)(void *a1)
{
  return sub_21AD0ADF4(a1, "[%s]: listening stopped with error: %@");
}

uint64_t sub_21AD0ADF4(void *a1, const char *a2)
{
  void *v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  os_log_type_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  id v24;
  uint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v29;
  const char *v30;
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  v5 = sub_21AD23EEC();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2551178F0 != -1)
    swift_once();
  v9 = __swift_project_value_buffer(v5, (uint64_t)qword_2551180E8);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v9, v5);
  v10 = v2;
  v11 = a1;
  v12 = v10;
  v13 = a1;
  v14 = sub_21AD23EE0();
  v15 = sub_21AD24060();
  if (os_log_type_enabled(v14, v15))
  {
    v16 = swift_slowAlloc();
    v33 = v6;
    v17 = v16;
    v31 = (_QWORD *)swift_slowAlloc();
    v32 = swift_slowAlloc();
    v35 = v32;
    *(_DWORD *)v17 = 136315394;
    v29 = v17 + 4;
    v18 = v12;
    v19 = objc_msgSend(v18, sel_description);
    v30 = a2;
    v20 = v19;
    v21 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
    v23 = v22;

    v34 = sub_21ACF58B4(v21, v23, &v35);
    sub_21AD240CC();

    swift_bridgeObjectRelease();
    *(_WORD *)(v17 + 12) = 2112;
    v24 = a1;
    v25 = _swift_stdlib_bridgeErrorToNSError();
    v34 = v25;
    sub_21AD240CC();
    v26 = v31;
    *v31 = v25;

    _os_log_impl(&dword_21ACD4000, v14, v15, v30, (uint8_t *)v17, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_255117958);
    swift_arrayDestroy();
    MEMORY[0x220756ED0](v26, -1, -1);
    v27 = v32;
    swift_arrayDestroy();
    MEMORY[0x220756ED0](v27, -1, -1);
    MEMORY[0x220756ED0](v17, -1, -1);

    return (*(uint64_t (**)(char *, uint64_t))(v33 + 8))(v8, v5);
  }
  else
  {

    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
}

uint64_t sub_21AD0B134()
{
  id *v0;

  return swift_deallocObject();
}

id sub_21AD0B168()
{
  _QWORD *v0;

  return objc_msgSend(*(id *)(v0[2] + OBJC_IVAR____TtC18AXSoundDetectionUI30AXSANSControllerImplementation_modelManager), sel_processAudioBuffer_atTime_, v0[3], v0[4]);
}

uint64_t block_copy_helper_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_2()
{
  return swift_release();
}

uint64_t sub_21AD0B1A0()
{
  uint64_t v0;

  return swift_deallocObject();
}

id sub_21AD0B1CC()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(*(_QWORD *)(v0 + 16)+ OBJC_IVAR____TtC18AXSoundDetectionUI30AXSANSControllerImplementation_modelManager), sel_startListeningWithFormat_, *(_QWORD *)(v0 + 24));
}

uint64_t sub_21AD0B1E8()
{
  unint64_t v0;

  v0 = sub_21AD24264();
  swift_bridgeObjectRelease();
  if (v0 >= 0xE)
    return 14;
  else
    return v0;
}

id _s18AXSoundDetectionUI30AXSANSControllerImplementationC19receivedObservation_11forDetectorySo20SNSoundActionsResultC_So20SNDetectSoundRequestCtF_0(void *a1)
{
  void *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  char *v14;
  NSObject *v15;
  os_log_type_t v16;
  _BOOL4 v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  id v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void (*v35)(char *, uint64_t);
  id result;
  double v37;
  id v38;
  unsigned __int8 v39;
  id v40;
  NSObject *v41;
  os_log_type_t v42;
  uint8_t *v43;
  uint64_t v44;
  id v45;
  uint64_t v46;
  unint64_t v47;
  unint64_t v48;
  char *v49;
  uint64_t v50;
  unsigned __int8 v51;
  id *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  char *v56;
  void (*v57)(char *, uint64_t, uint64_t);
  char *v58;
  uint64_t v59;
  uint64_t v60[3];
  uint64_t v61;

  v3 = sub_21AD23EEC();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v53 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v53 - v8;
  if (qword_2551178F0 != -1)
    swift_once();
  v10 = __swift_project_value_buffer(v3, (uint64_t)qword_2551180E8);
  swift_beginAccess();
  v57 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 16);
  v57(v9, v10, v3);
  v11 = a1;
  v12 = v1;
  v13 = v11;
  v14 = (char *)v12;
  v15 = sub_21AD23EE0();
  v16 = sub_21AD24054();
  v17 = os_log_type_enabled(v15, v16);
  v56 = v14;
  if (v17)
  {
    v18 = swift_slowAlloc();
    v59 = v3;
    v19 = v18;
    v54 = swift_slowAlloc();
    v60[0] = v54;
    *(_DWORD *)v19 = 136315650;
    v20 = v14;
    v55 = v10;
    v21 = v20;
    v22 = objc_msgSend(v20, sel_description);
    v23 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
    v53 = v4;
    v24 = v23;
    v58 = v7;
    v26 = v25;

    v61 = sub_21ACF58B4(v24, v26, v60);
    sub_21AD240CC();

    swift_bridgeObjectRelease();
    *(_WORD *)(v19 + 12) = 2080;
    v27 = objc_msgSend(v13, sel_name);
    v28 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
    v30 = v29;

    v31 = v28;
    v10 = v55;
    v61 = sub_21ACF58B4(v31, v30, v60);
    sub_21AD240CC();

    v7 = v58;
    swift_bridgeObjectRelease();
    *(_WORD *)(v19 + 22) = 2048;
    objc_msgSend(v13, sel_confidence);
    v61 = v32;
    sub_21AD240CC();

    _os_log_impl(&dword_21ACD4000, v15, v16, "[%s]: received sound action: %s with confidence: %f.", (uint8_t *)v19, 0x20u);
    v33 = v54;
    swift_arrayDestroy();
    MEMORY[0x220756ED0](v33, -1, -1);
    v34 = v19;
    v3 = v59;
    MEMORY[0x220756ED0](v34, -1, -1);

    v35 = *(void (**)(char *, uint64_t))(v53 + 8);
  }
  else
  {

    v35 = *(void (**)(char *, uint64_t))(v4 + 8);
  }
  v35(v9, v3);
  result = objc_msgSend(v13, sel_confidence);
  if (v37 >= 0.5)
  {
    v38 = objc_msgSend(v13, sel_name);
    _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();

    v39 = sub_21AD0B1E8();
    if (v39 == 14)
    {
      v57(v7, v10, v3);
      v40 = v13;
      v41 = sub_21AD23EE0();
      v42 = sub_21AD24060();
      if (os_log_type_enabled(v41, v42))
      {
        v59 = v3;
        v43 = (uint8_t *)swift_slowAlloc();
        v44 = swift_slowAlloc();
        v60[0] = v44;
        *(_DWORD *)v43 = 136315138;
        v57 = (void (*)(char *, uint64_t, uint64_t))(v43 + 4);
        v45 = objc_msgSend(v40, sel_name);
        v46 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
        v58 = v7;
        v48 = v47;

        v61 = sub_21ACF58B4(v46, v48, v60);
        sub_21AD240CC();

        swift_bridgeObjectRelease();
        _os_log_impl(&dword_21ACD4000, v41, v42, "no action type found for result name: %s", v43, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x220756ED0](v44, -1, -1);
        MEMORY[0x220756ED0](v43, -1, -1);

        v49 = v58;
        v50 = v59;
      }
      else
      {

        v49 = v7;
        v50 = v3;
      }
      return (id)((uint64_t (*)(char *, uint64_t))v35)(v49, v50);
    }
    else
    {
      v51 = v39;
      v52 = (id *)&v56[OBJC_IVAR____TtC18AXSoundDetectionUI30AXSANSControllerImplementation_delegate];
      swift_beginAccess();
      result = *v52;
      if (*v52)
        return objc_msgSend(result, sel_postEventToSystemWithSoundActionEvent_, v51 + 1);
    }
  }
  return result;
}

uint64_t sub_21AD0B7A0@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v3;

  v3 = (_QWORD *)(*a1 + OBJC_IVAR____TtC18AXSoundDetectionUI30AXSANSControllerImplementation_delegate);
  swift_beginAccess();
  *a2 = *v3;
  return swift_unknownObjectRetain();
}

uint64_t method lookup function for AXSANSControllerImplementation()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of AXSANSControllerImplementation.delegate.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x110))();
}

uint64_t dispatch thunk of AXSANSControllerImplementation.delegate.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x118))();
}

uint64_t dispatch thunk of AXSANSControllerImplementation.delegate.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x120))();
}

uint64_t dispatch thunk of AXSANSControllerImplementation.startListening(onQueue:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x128))();
}

uint64_t sub_21AD0B87C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  char isCancelled;

  v1 = v0;
  if (qword_2551178E0 != -1)
    swift_once();
  v2 = sub_21AD23EEC();
  __swift_project_value_buffer(v2, (uint64_t)qword_2551180B8);
  v3 = sub_21AD23EE0();
  v4 = sub_21AD2406C();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_21ACD4000, v3, v4, "AXSDKShotMonitor: Stop Monitoring", v5, 2u);
    MEMORY[0x220756ED0](v5, -1, -1);
  }

  if (!*(_QWORD *)(v1 + 16))
    return 0;
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255117930);
  sub_21AD2400C();
  isCancelled = swift_task_isCancelled();
  swift_release();
  return isCancelled & 1;
}

uint64_t sub_21AD0B9A8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[4];

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255117EC0);
  MEMORY[0x24BDAC7A8]();
  v3 = (char *)v12 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_21AD24000();
  v5 = *(_QWORD *)(v4 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v3, 1, 1, v4);
  v6 = (_QWORD *)swift_allocObject();
  v6[2] = 0;
  v6[3] = 0;
  v6[4] = v1;
  v7 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4);
  swift_retain();
  if (v7 == 1)
  {
    sub_21ACFCA74((uint64_t)v3, &qword_255117EC0);
  }
  else
  {
    sub_21AD23FF4();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v3, v4);
    if (v6[2])
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      v8 = sub_21AD23FDC();
      v10 = v9;
      swift_unknownObjectRelease();
      if (v10 | v8)
      {
        v12[0] = 0;
        v12[1] = 0;
        v12[2] = v8;
        v12[3] = v10;
      }
    }
  }
  return swift_task_create();
}

uint64_t sub_21AD0BB64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;

  v4[7] = a4;
  v5 = sub_21AD241E0();
  v4[8] = v5;
  v4[9] = *(_QWORD *)(v5 - 8);
  v4[10] = swift_task_alloc();
  v4[11] = swift_task_alloc();
  v6 = sub_21AD241F8();
  v4[12] = v6;
  v4[13] = *(_QWORD *)(v6 - 8);
  v4[14] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_21AD0BBFC()
{
  uint64_t v0;
  void *v2;
  id v3;
  unsigned __int8 v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);
  _QWORD *v13;

  if ((sub_21AD24018() & 1) != 0)
  {
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    v2 = (void *)objc_opt_self();
    *(_QWORD *)(v0 + 120) = v2;
    v3 = objc_msgSend(v2, sel_sharedInstance);
    v4 = objc_msgSend(v3, sel_isActivelyTrainingAKShotModel);

    if ((v4 & 1) != 0)
    {
      if (qword_2551178E8 != -1)
        swift_once();
      v5 = sub_21AD23EEC();
      __swift_project_value_buffer(v5, (uint64_t)qword_2551180D0);
      v6 = sub_21AD23EE0();
      v7 = sub_21AD2406C();
      if (os_log_type_enabled(v6, v7))
      {
        v8 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v8 = 0;
        _os_log_impl(&dword_21ACD4000, v6, v7, "AXSDKShotMonitor: Not checking detectors. Currently training a KShot Model.", v8, 2u);
        MEMORY[0x220756ED0](v8, -1, -1);
      }

    }
    else
    {
      sub_21AD0C1DC();
    }
    v10 = *(_QWORD *)(v0 + 72);
    v9 = *(_QWORD *)(v0 + 80);
    v11 = *(_QWORD *)(v0 + 64);
    sub_21AD241EC();
    *(_OWORD *)(v0 + 40) = xmmword_21AD27280;
    *(_QWORD *)(v0 + 24) = 0;
    *(_QWORD *)(v0 + 16) = 0;
    *(_BYTE *)(v0 + 32) = 1;
    sub_21ACF7DA4(&qword_255117EF0, (uint64_t (*)(uint64_t))MEMORY[0x24BEE6E10], MEMORY[0x24BEE6E20]);
    sub_21AD242A0();
    sub_21ACF7DA4(&qword_255117EF8, (uint64_t (*)(uint64_t))MEMORY[0x24BEE6DC8], MEMORY[0x24BEE6E00]);
    sub_21AD24204();
    v12 = *(void (**)(uint64_t, uint64_t))(v10 + 8);
    *(_QWORD *)(v0 + 128) = v12;
    v12(v9, v11);
    v13 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 136) = v13;
    *v13 = v0;
    v13[1] = sub_21AD0BE70;
    return sub_21AD242AC();
  }
}

uint64_t sub_21AD0BE70()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = *v1;
  *(_QWORD *)(*v1 + 144) = v0;
  swift_task_dealloc();
  if (v0)
  {
    (*(void (**)(_QWORD, _QWORD))(v2 + 128))(*(_QWORD *)(v2 + 88), *(_QWORD *)(v2 + 64));
  }
  else
  {
    v4 = *(_QWORD *)(v2 + 104);
    v3 = *(_QWORD *)(v2 + 112);
    v5 = *(_QWORD *)(v2 + 96);
    (*(void (**)(_QWORD, _QWORD))(v2 + 128))(*(_QWORD *)(v2 + 88), *(_QWORD *)(v2 + 64));
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  }
  return swift_task_switch();
}

uint64_t sub_21AD0BF10()
{
  uint64_t v0;
  id v2;
  unsigned __int8 v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  _QWORD *v12;

  if ((sub_21AD24018() & 1) != 0)
  {
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    v2 = objc_msgSend(*(id *)(v0 + 120), sel_sharedInstance);
    v3 = objc_msgSend(v2, sel_isActivelyTrainingAKShotModel);

    if ((v3 & 1) != 0)
    {
      if (qword_2551178E8 != -1)
        swift_once();
      v4 = sub_21AD23EEC();
      __swift_project_value_buffer(v4, (uint64_t)qword_2551180D0);
      v5 = sub_21AD23EE0();
      v6 = sub_21AD2406C();
      if (os_log_type_enabled(v5, v6))
      {
        v7 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v7 = 0;
        _os_log_impl(&dword_21ACD4000, v5, v6, "AXSDKShotMonitor: Not checking detectors. Currently training a KShot Model.", v7, 2u);
        MEMORY[0x220756ED0](v7, -1, -1);
      }

    }
    else
    {
      sub_21AD0C1DC();
    }
    v9 = *(_QWORD *)(v0 + 72);
    v8 = *(_QWORD *)(v0 + 80);
    v10 = *(_QWORD *)(v0 + 64);
    sub_21AD241EC();
    *(_OWORD *)(v0 + 40) = xmmword_21AD27280;
    *(_QWORD *)(v0 + 24) = 0;
    *(_QWORD *)(v0 + 16) = 0;
    *(_BYTE *)(v0 + 32) = 1;
    sub_21ACF7DA4(&qword_255117EF0, (uint64_t (*)(uint64_t))MEMORY[0x24BEE6E10], MEMORY[0x24BEE6E20]);
    sub_21AD242A0();
    sub_21ACF7DA4(&qword_255117EF8, (uint64_t (*)(uint64_t))MEMORY[0x24BEE6DC8], MEMORY[0x24BEE6E00]);
    sub_21AD24204();
    v11 = *(void (**)(uint64_t, uint64_t))(v9 + 8);
    *(_QWORD *)(v0 + 128) = v11;
    v11(v8, v10);
    v12 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 136) = v12;
    *v12 = v0;
    v12[1] = sub_21AD0BE70;
    return sub_21AD242AC();
  }
}

uint64_t sub_21AD0C178()
{
  uint64_t v0;

  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 104) + 8))(*(_QWORD *)(v0 + 112), *(_QWORD *)(v0 + 96));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_21AD0C1DC()
{
  id v0;
  id v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  char **v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  os_log_type_t v14;
  uint64_t v15;
  _QWORD *v16;
  char v17;
  NSObject *v18;
  os_log_type_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;

  v0 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
  v1 = objc_msgSend(v0, sel_customDetectors);

  sub_21ACF8044(0, (unint64_t *)&qword_2551182B0);
  v2 = sub_21AD23FAC();

  if (v2 >> 62)
  {
    swift_bridgeObjectRetain();
    v3 = sub_21AD2421C();
    swift_bridgeObjectRelease();
    if (v3)
      goto LABEL_3;
LABEL_29:
    swift_bridgeObjectRelease();
    return;
  }
  v3 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (!v3)
    goto LABEL_29;
LABEL_3:
  if (v3 >= 1)
  {
    v4 = 0;
    v5 = v2 & 0xC000000000000001;
    v6 = &selRef_nextObject;
    while (1)
    {
      if (v5)
        v7 = (id)MEMORY[0x2207565F4](v4, v2);
      else
        v7 = *(id *)(v2 + 8 * v4 + 32);
      v8 = v7;
      objc_opt_self();
      v9 = swift_dynamicCastObjCClass();
      if (v9)
      {
        v10 = (void *)v9;
        v8 = v8;
        if (objc_msgSend(v10, v6[357]))
        {
          if (qword_2551178E0 != -1)
            swift_once();
          v11 = sub_21AD23EEC();
          __swift_project_value_buffer(v11, (uint64_t)qword_2551180B8);
          v12 = v8;
          v13 = sub_21AD23EE0();
          v14 = sub_21AD2406C();
          if (os_log_type_enabled(v13, v14))
          {
            v15 = swift_slowAlloc();
            v16 = (_QWORD *)swift_slowAlloc();
            *(_DWORD *)v15 = 138412290;
            *(_QWORD *)(v15 + 4) = v10;
            *v16 = v10;
            _os_log_impl(&dword_21ACD4000, v13, v14, "AXSDKShotMonitor: Checking if detector should be retrained: %@.", (uint8_t *)v15, 0xCu);
            __swift_instantiateConcreteTypeFromMangledName(&qword_255117958);
            swift_arrayDestroy();
            MEMORY[0x220756ED0](v16, -1, -1);
            MEMORY[0x220756ED0](v15, -1, -1);
          }
          else
          {

            v13 = v12;
          }

          v17 = sub_21AD0C5CC(v10);
          v18 = sub_21AD23EE0();
          v19 = sub_21AD2406C();
          if (os_log_type_enabled(v18, v19))
          {
            v20 = swift_slowAlloc();
            v21 = swift_slowAlloc();
            v24 = v21;
            *(_DWORD *)v20 = 136315138;
            if ((v17 & 1) != 0)
              v22 = 0x4653534543435553;
            else
              v22 = 0x204552554C494146;
            if ((v17 & 1) != 0)
              v23 = 0xEC000000594C4C55;
            else
              v23 = 0xEA00000000004F54;
            *(_QWORD *)(v20 + 4) = sub_21ACF58B4(v22, v23, &v24);
            swift_bridgeObjectRelease();
            _os_log_impl(&dword_21ACD4000, v18, v19, "AXSDKShotMonitor: %s start retraining of detector.", (uint8_t *)v20, 0xCu);
            swift_arrayDestroy();
            MEMORY[0x220756ED0](v21, -1, -1);
            MEMORY[0x220756ED0](v20, -1, -1);

          }
          else
          {

          }
          v5 = v2 & 0xC000000000000001;
          v6 = &selRef_nextObject;
          goto LABEL_7;
        }

      }
LABEL_7:
      if (v3 == ++v4)
        goto LABEL_29;
    }
  }
  __break(1u);
}

uint64_t sub_21AD0C5CC(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  id v20;
  NSObject *v21;
  os_log_type_t v22;
  uint8_t *v23;
  _QWORD *v24;
  id v25;
  id v26;
  void *v27;
  void (*v28)(char *, char *, uint64_t);
  char *v29;
  double v30;
  double v31;
  uint64_t v32;
  id v33;
  id v34;
  NSObject *v35;
  os_log_type_t v36;
  uint64_t v37;
  _QWORD *v38;
  id v39;
  void *v40;
  uint64_t v42;
  NSObject *v43;
  NSObject *v44;
  os_log_type_t v45;
  int v46;
  NSObject *v47;
  uint8_t *v48;
  _QWORD *v49;
  uint8_t *v50;
  NSObject *v51;
  uint8_t *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  NSObject *v56;
  uint8_t *v57;
  uint8_t *v58;
  void (*v59)(char *, uint64_t);
  uint64_t v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  _QWORD aBlock[6];

  v2 = sub_21AD23F04();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v57 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_21AD23F1C();
  v63 = *(_QWORD *)(v6 - 8);
  v64 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v57 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2551180A0);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v57 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_21AD23DD8();
  v13 = *(_QWORD *)(v12 - 8);
  v14 = MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v57 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)&v57 - v17;
  if (objc_msgSend(a1, sel_modelFailed))
  {
    if (qword_2551178E0 != -1)
      swift_once();
    v19 = sub_21AD23EEC();
    __swift_project_value_buffer(v19, (uint64_t)qword_2551180B8);
    v20 = a1;
    v21 = sub_21AD23EE0();
    v22 = sub_21AD2406C();
    if (os_log_type_enabled(v21, v22))
    {
      v23 = (uint8_t *)swift_slowAlloc();
      v24 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v23 = 138412290;
      aBlock[0] = v20;
      v25 = v20;
      sub_21AD240CC();
      *v24 = v20;

      _os_log_impl(&dword_21ACD4000, v21, v22, "Detector is already marked as failed. Not attempting retraining. Detector: %@", v23, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_255117958);
      swift_arrayDestroy();
      MEMORY[0x220756ED0](v24, -1, -1);
      MEMORY[0x220756ED0](v23, -1, -1);

    }
    else
    {

    }
    return 0;
  }
  v60 = v3;
  v61 = v18;
  v26 = objc_msgSend(a1, sel_lastAttemptedTrainingDate);
  if (!v26)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v11, 1, 1, v12);
    goto LABEL_15;
  }
  v27 = v26;
  sub_21AD23DB4();

  v28 = *(void (**)(char *, char *, uint64_t))(v13 + 32);
  v28(v11, v16, v12);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v11, 0, 1, v12);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12) == 1)
  {
LABEL_15:
    sub_21ACFCA74((uint64_t)v11, &qword_2551180A0);
    sub_21AD23DCC();
    v40 = (void *)sub_21AD23DA8();
    (*(void (**)(char *, uint64_t))(v13 + 8))(v16, v12);
    objc_msgSend(a1, sel_setLastAttemptedTrainingDate_, v40);

    return 0;
  }
  v29 = v61;
  v28(v61, v11, v12);
  sub_21AD23DCC();
  sub_21AD23DC0();
  v31 = v30;
  v59 = *(void (**)(char *, uint64_t))(v13 + 8);
  v59(v16, v12);
  if (fabs(v31) < 900.0)
  {
    if (qword_2551178E0 != -1)
      swift_once();
    v32 = sub_21AD23EEC();
    __swift_project_value_buffer(v32, (uint64_t)qword_2551180B8);
    v33 = a1;
    swift_retain_n();
    v34 = v33;
    v35 = sub_21AD23EE0();
    v36 = sub_21AD2406C();
    if (os_log_type_enabled(v35, v36))
    {
      v37 = swift_slowAlloc();
      v38 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v37 = 134218498;
      aBlock[0] = 0x408C200000000000;
      sub_21AD240CC();
      swift_release_n();
      *(_WORD *)(v37 + 12) = 2048;
      *(double *)aBlock = v31;
      sub_21AD240CC();
      *(_WORD *)(v37 + 22) = 2112;
      aBlock[0] = v34;
      v39 = v34;
      v29 = v61;
      sub_21AD240CC();
      *v38 = v34;

      _os_log_impl(&dword_21ACD4000, v35, v36, "It's too early to attempt retrain of detector. Waiting: %f. Current time difference is: %f. Not attempting retraining. Detector: %@", (uint8_t *)v37, 0x20u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_255117958);
      swift_arrayDestroy();
      MEMORY[0x220756ED0](v38, -1, -1);
      MEMORY[0x220756ED0](v37, -1, -1);
    }
    else
    {
      swift_release_n();

    }
    v59(v29, v12);
    return 0;
  }
  if (qword_2551178E0 != -1)
    swift_once();
  v42 = sub_21AD23EEC();
  __swift_project_value_buffer(v42, (uint64_t)qword_2551180B8);
  v43 = a1;
  v44 = sub_21AD23EE0();
  v45 = sub_21AD2406C();
  v46 = v45;
  if (os_log_type_enabled(v44, v45))
  {
    v47 = v43;
    LODWORD(v62) = v46;
    v48 = (uint8_t *)swift_slowAlloc();
    v49 = (_QWORD *)swift_slowAlloc();
    v50 = v48;
    v58 = v48;
    *(_DWORD *)v48 = 138412290;
    v43 = v47;
    v57 = v50 + 4;
    aBlock[0] = v47;
    v51 = v47;
    sub_21AD240CC();
    *v49 = v47;

    v52 = v58;
    _os_log_impl(&dword_21ACD4000, v44, (os_log_type_t)v62, "Attempting to retrain detector. Detector: %@", v58, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_255117958);
    swift_arrayDestroy();
    MEMORY[0x220756ED0](v49, -1, -1);
    MEMORY[0x220756ED0](v52, -1, -1);
  }
  else
  {

    v44 = v43;
  }

  sub_21ACF8044(0, (unint64_t *)&qword_255117BD0);
  v53 = (void *)sub_21AD24090();
  v54 = swift_allocObject();
  *(_QWORD *)(v54 + 16) = v43;
  aBlock[4] = sub_21AD0CF00;
  aBlock[5] = v54;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_21ACF4004;
  aBlock[3] = &block_descriptor_3;
  v55 = _Block_copy(aBlock);
  v56 = v43;
  swift_release();
  sub_21AD23F10();
  aBlock[0] = MEMORY[0x24BEE4AF8];
  sub_21ACF7DA4((unint64_t *)&qword_255117940, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255118240);
  sub_21ACF7B30();
  sub_21AD240E4();
  MEMORY[0x220756504](0, v8, v5, v55);
  _Block_release(v55);

  (*(void (**)(char *, uint64_t))(v60 + 8))(v5, v2);
  (*(void (**)(char *, uint64_t))(v63 + 8))(v8, v64);
  v59(v61, v12);
  return 1;
}

void sub_21AD0CE3C(uint64_t a1)
{
  id v2;

  v2 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
  objc_msgSend(v2, sel_retrainDetector_, a1);

}

uint64_t sub_21AD0CE98()
{
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for AXSDKShotMonitor()
{
  return objc_opt_self();
}

uint64_t sub_21AD0CEDC()
{
  uint64_t v0;

  return swift_deallocObject();
}

void sub_21AD0CF00()
{
  uint64_t v0;

  sub_21AD0CE3C(*(_QWORD *)(v0 + 16));
}

uint64_t block_copy_helper_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_3()
{
  return swift_release();
}

uint64_t sub_21AD0CF20()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_21AD0CF4C(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_21AD090E0;
  return sub_21AD0BB64(a1, v4, v5, v6);
}

id sub_21AD0CFB8(uint64_t a1)
{
  return sub_21AD0D094(a1, qword_2551180B8, MEMORY[0x24BDFE1F8]);
}

uint64_t static Logger.ultron.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_21AD0D018(&qword_2551178E0, (uint64_t)qword_2551180B8, a1);
}

id sub_21AD0CFE8(uint64_t a1)
{
  return sub_21AD0D094(a1, qword_2551180D0, MEMORY[0x24BDFE200]);
}

uint64_t static Logger.kshot.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_21AD0D018(&qword_2551178E8, (uint64_t)qword_2551180D0, a1);
}

uint64_t sub_21AD0D018@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;

  if (*a1 != -1)
    swift_once();
  v5 = sub_21AD23EEC();
  v6 = __swift_project_value_buffer(v5, a2);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a3, v6, v5);
}

id sub_21AD0D080(uint64_t a1)
{
  return sub_21AD0D094(a1, qword_2551180E8, MEMORY[0x24BDFE180]);
}

id sub_21AD0D094(uint64_t a1, uint64_t *a2, uint64_t (*a3)(void))
{
  uint64_t v5;
  id result;

  v5 = sub_21AD23EEC();
  __swift_allocate_value_buffer(v5, a2);
  __swift_project_value_buffer(v5, (uint64_t)a2);
  result = (id)a3();
  if (result)
    return (id)sub_21AD23EF8();
  __break(1u);
  return result;
}

uint64_t static Logger.soundActions.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_2551178F0 != -1)
    swift_once();
  v2 = sub_21AD23EEC();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_2551180E8);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t static Logger.soundActions.setter(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  if (qword_2551178F0 != -1)
    swift_once();
  v2 = sub_21AD23EEC();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_2551180E8);
  swift_beginAccess();
  v4 = *(_QWORD *)(v2 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 24))(v3, a1, v2);
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(a1, v2);
}

uint64_t (*static Logger.soundActions.modify())()
{
  uint64_t v0;

  if (qword_2551178F0 != -1)
    swift_once();
  v0 = sub_21AD23EEC();
  __swift_project_value_buffer(v0, (uint64_t)qword_2551180E8);
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  if ((*(_DWORD *)(*(_QWORD *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_21AD0D2FC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  void (*v14)(char *, uint64_t, uint64_t);
  int v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v20;
  uint64_t v21;

  v2 = sub_21AD23E08();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_21AD23E20();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_21AD23E14();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = *(void (**)(char *, uint64_t, uint64_t))(v11 + 16);
  v21 = a1;
  v14(v13, a1, v10);
  v15 = (*(uint64_t (**)(char *, uint64_t))(v11 + 88))(v13, v10);
  if (v15 == *MEMORY[0x24BDE9950])
  {
    (*(void (**)(char *, uint64_t))(v11 + 96))(v13, v10);
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v9, v13, v6);
    v16 = AccessibilitySoundRecognition.BuiltInDetectorIdentifier.listenType.getter();
    if (v16)
    {
      v17 = v16;
      v18 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();

    }
    else
    {
      v18 = 0x6E776F6E6B6E55;
    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
  else if (v15 == *MEMORY[0x24BDE9948])
  {
    (*(void (**)(char *, uint64_t))(v11 + 96))(v13, v10);
    (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v5, v13, v2);
    v18 = sub_21AD23DFC();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  else
  {
    v18 = 0x6E776F6E6B6E55;
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  }
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v21, v10);
  return v18;
}

void sub_21AD0D524(void *a1)
{
  void *v1;
  uint64_t v3;
  id v4;
  id v5;
  char *v6;
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  uint64_t v10;
  _QWORD *v11;
  char *v12;
  id v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  id v17;
  uint64_t *v18;
  id v19;
  unint64_t v20;
  char v21;
  char *v22;
  id v23;
  char *v24;
  id v25;
  NSObject *v26;
  os_log_type_t v27;
  uint64_t v28;
  _QWORD *v29;
  char *v30;
  id v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  id v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42[3];

  if (qword_2551178E0 != -1)
    swift_once();
  v3 = sub_21AD23EEC();
  __swift_project_value_buffer(v3, (uint64_t)qword_2551180B8);
  v4 = v1;
  v5 = a1;
  v6 = (char *)v4;
  v7 = v5;
  v8 = sub_21AD23EE0();
  v9 = sub_21AD2406C();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = swift_slowAlloc();
    v11 = (_QWORD *)swift_slowAlloc();
    v38 = swift_slowAlloc();
    v42[0] = v38;
    *(_DWORD *)v10 = 136315394;
    v12 = v6;
    v39 = v6;
    v13 = objc_msgSend(v12, sel_description);
    v14 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
    v16 = v15;

    sub_21ACF58B4(v14, v16, v42);
    sub_21AD240CC();

    swift_bridgeObjectRelease();
    *(_WORD *)(v10 + 12) = 2112;
    v41 = (uint64_t)v7;
    v17 = v7;
    v6 = v39;
    sub_21AD240CC();
    *v11 = v7;

    _os_log_impl(&dword_21ACD4000, v8, v9, "[%s]: adding detector: %@", (uint8_t *)v10, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_255117958);
    swift_arrayDestroy();
    MEMORY[0x220756ED0](v11, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x220756ED0](v38, -1, -1);
    MEMORY[0x220756ED0](v10, -1, -1);

  }
  else
  {

  }
  v18 = (uint64_t *)&v6[OBJC_IVAR____TtC18AXSoundDetectionUI38AXSDSecureBaseControllerImplementation_currentDetectors];
  swift_beginAccess();
  v19 = v7;
  v20 = swift_bridgeObjectRetain();
  v21 = sub_21AD18210(v20, v19);
  swift_bridgeObjectRelease();

  if ((v21 & 1) != 0)
  {
    v22 = v6;
    v23 = v19;
    v24 = v22;
    v25 = v23;
    v26 = sub_21AD23EE0();
    v27 = sub_21AD24054();
    if (os_log_type_enabled(v26, v27))
    {
      v28 = swift_slowAlloc();
      v29 = (_QWORD *)swift_slowAlloc();
      v40 = swift_slowAlloc();
      v41 = v40;
      *(_DWORD *)v28 = 136315394;
      v30 = v24;
      v31 = objc_msgSend(v30, sel_description);
      v32 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
      v34 = v33;

      sub_21ACF58B4(v32, v34, &v41);
      sub_21AD240CC();

      swift_bridgeObjectRelease();
      *(_WORD *)(v28 + 12) = 2112;
      v35 = v25;
      sub_21AD240CC();
      *v29 = v25;

      _os_log_impl(&dword_21ACD4000, v26, v27, "[%s]: already added detector: %@. ignoring", (uint8_t *)v28, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_255117958);
      swift_arrayDestroy();
      MEMORY[0x220756ED0](v29, -1, -1);
      swift_arrayDestroy();
      MEMORY[0x220756ED0](v40, -1, -1);
      MEMORY[0x220756ED0](v28, -1, -1);

    }
    else
    {

    }
  }
  else
  {
    v41 = *v18;
    v36 = v19;
    v37 = swift_bridgeObjectRetain();
    MEMORY[0x220756408](v37);
    if (*(_QWORD *)((v41 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v41 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      sub_21AD23FC4();
    sub_21AD23FD0();
    sub_21AD23FB8();
    *v18 = v41;
    swift_bridgeObjectRetain();
    sub_21AD0E548();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
}

void sub_21AD0DA68(void *a1)
{
  void *v1;
  uint64_t v3;
  id v4;
  id v5;
  char *v6;
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  id v16;
  unint64_t *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23[3];
  unint64_t v24;

  if (qword_2551178E0 != -1)
    swift_once();
  v3 = sub_21AD23EEC();
  __swift_project_value_buffer(v3, (uint64_t)qword_2551180B8);
  v4 = v1;
  v5 = a1;
  v6 = (char *)v4;
  v7 = v5;
  v8 = sub_21AD23EE0();
  v9 = sub_21AD2406C();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = swift_slowAlloc();
    v21 = (_QWORD *)swift_slowAlloc();
    v22 = swift_slowAlloc();
    v23[0] = v22;
    *(_DWORD *)v10 = 136315394;
    v11 = v6;
    v12 = objc_msgSend(v11, sel_description);
    v13 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
    v15 = v14;

    v24 = sub_21ACF58B4(v13, v15, v23);
    sub_21AD240CC();

    swift_bridgeObjectRelease();
    *(_WORD *)(v10 + 12) = 2112;
    v24 = (unint64_t)v7;
    v16 = v7;
    sub_21AD240CC();
    *v21 = v7;

    _os_log_impl(&dword_21ACD4000, v8, v9, "[%s]: removing detector: %@", (uint8_t *)v10, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_255117958);
    swift_arrayDestroy();
    MEMORY[0x220756ED0](v21, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x220756ED0](v22, -1, -1);
    MEMORY[0x220756ED0](v10, -1, -1);

  }
  else
  {

  }
  v17 = (unint64_t *)&v6[OBJC_IVAR____TtC18AXSoundDetectionUI38AXSDSecureBaseControllerImplementation_currentDetectors];
  swift_beginAccess();
  v24 = *v17;
  v18 = v7;
  swift_bridgeObjectRetain();
  v19 = sub_21AD18574(&v24, v18);

  if (v24 >> 62)
  {
    swift_bridgeObjectRetain();
    v20 = sub_21AD2421C();
    swift_bridgeObjectRelease();
    if (v20 >= v19)
      goto LABEL_8;
  }
  else
  {
    v20 = *(_QWORD *)((v24 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v20 >= v19)
    {
LABEL_8:
      sub_21AD18944(v19, v20);
      *v17 = v24;
      swift_bridgeObjectRetain();
      sub_21AD0E548();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return;
    }
  }
  __break(1u);
}

uint64_t sub_21AD0DDB4()
{
  void *v0;
  uint64_t v1;
  char *v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;
  char *v7;
  id v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  char *v12;
  uint64_t v14[3];

  if (qword_2551178E0 != -1)
    swift_once();
  v1 = sub_21AD23EEC();
  __swift_project_value_buffer(v1, (uint64_t)qword_2551180B8);
  v2 = v0;
  v3 = sub_21AD23EE0();
  v4 = sub_21AD2406C();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    v6 = swift_slowAlloc();
    v14[0] = v6;
    *(_DWORD *)v5 = 136315138;
    v7 = v2;
    v8 = objc_msgSend(v7, sel_description);
    v9 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
    v11 = v10;

    sub_21ACF58B4(v9, v11, v14);
    sub_21AD240CC();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21ACD4000, v3, v4, "[%s]: removing all detectors", v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x220756ED0](v6, -1, -1);
    MEMORY[0x220756ED0](v5, -1, -1);

  }
  else
  {

  }
  v12 = &v2[OBJC_IVAR____TtC18AXSoundDetectionUI38AXSDSecureBaseControllerImplementation_currentDetectors];
  swift_beginAccess();
  *(_QWORD *)v12 = MEMORY[0x24BEE4AF8];
  swift_bridgeObjectRetain();
  sub_21AD0E548();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void sub_21AD0DFDC()
{
  char *v0;
  char *v1;
  uint64_t v2;
  char *v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;
  char *v8;
  id v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13[3];

  v1 = &v0[OBJC_IVAR____TtC18AXSoundDetectionUI38AXSDSecureBaseControllerImplementation_isEnabled];
  swift_beginAccess();
  if ((*v1 & 1) != 0)
  {
    if (qword_2551178E0 != -1)
      swift_once();
    v2 = sub_21AD23EEC();
    __swift_project_value_buffer(v2, (uint64_t)qword_2551180B8);
    v3 = v0;
    v4 = sub_21AD23EE0();
    v5 = sub_21AD2406C();
    if (os_log_type_enabled(v4, v5))
    {
      v6 = (uint8_t *)swift_slowAlloc();
      v7 = swift_slowAlloc();
      v13[0] = v7;
      *(_DWORD *)v6 = 136315138;
      v8 = v3;
      v9 = objc_msgSend(v8, sel_description);
      v10 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
      v12 = v11;

      sub_21ACF58B4(v10, v12, v13);
      sub_21AD240CC();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_21ACD4000, v4, v5, "[%s]: sound recognition is already listening.", v6, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x220756ED0](v7, -1, -1);
      MEMORY[0x220756ED0](v6, -1, -1);

    }
    else
    {

    }
  }
  else
  {
    *v1 = 1;
    swift_beginAccess();
    swift_bridgeObjectRetain();
    sub_21AD18C3C();
    swift_bridgeObjectRelease();
  }
}

void sub_21AD0E224()
{
  char *v0;
  char *v1;
  uint64_t v2;
  char *v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;
  char *v8;
  id v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13[4];

  v1 = &v0[OBJC_IVAR____TtC18AXSoundDetectionUI38AXSDSecureBaseControllerImplementation_isEnabled];
  swift_beginAccess();
  if (*v1 == 1)
  {
    *v1 = 0;
    swift_beginAccess();
    swift_bridgeObjectRetain();
    sub_21AD18F34();
    swift_bridgeObjectRelease();
  }
  else
  {
    if (qword_2551178E0 != -1)
      swift_once();
    v2 = sub_21AD23EEC();
    __swift_project_value_buffer(v2, (uint64_t)qword_2551180B8);
    v3 = v0;
    v4 = sub_21AD23EE0();
    v5 = sub_21AD2406C();
    if (os_log_type_enabled(v4, v5))
    {
      v6 = (uint8_t *)swift_slowAlloc();
      v7 = swift_slowAlloc();
      v13[0] = v7;
      *(_DWORD *)v6 = 136315138;
      v8 = v3;
      v9 = objc_msgSend(v8, sel_description);
      v10 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
      v12 = v11;

      v13[3] = sub_21ACF58B4(v10, v12, v13);
      sub_21AD240CC();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_21ACD4000, v4, v5, "[%s]: sound recognition is already stopped.", v6, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x220756ED0](v7, -1, -1);
      MEMORY[0x220756ED0](v6, -1, -1);

    }
    else
    {

    }
  }
}

uint64_t sub_21AD0E46C()
{
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t sub_21AD0E4B4()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC18AXSoundDetectionUI38AXSDSecureBaseControllerImplementation_isEnabled);
  swift_beginAccess();
  return *v1;
}

BOOL sub_21AD0E4F8()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtC18AXSoundDetectionUI38AXSDSecureBaseControllerImplementation_currentTasks;
  swift_beginAccess();
  return *(_QWORD *)(*(_QWORD *)v1 + 16) != 0;
}

uint64_t sub_21AD0E548()
{
  uint64_t v0;
  _BYTE *v1;
  uint64_t result;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t j;
  id v17;
  void *v18;

  v1 = (_BYTE *)(v0 + OBJC_IVAR____TtC18AXSoundDetectionUI38AXSDSecureBaseControllerImplementation_isEnabled);
  result = swift_beginAccess();
  if (*v1 == 1)
  {
    v3 = swift_bridgeObjectRetain();
    v4 = sub_21ACF7E4C(v3);
    swift_bridgeObjectRelease();
    v5 = swift_bridgeObjectRetain();
    v6 = sub_21ACF7E4C(v5);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    v7 = sub_21AD10448(v6, v4);
    v8 = sub_21AD10448(v4, v6);
    swift_bridgeObjectRelease();
    v9 = sub_21AD16084(v7);
    swift_bridgeObjectRelease();
    v10 = sub_21AD16084(v8);
    swift_bridgeObjectRelease();
    if (v10 < 0 || (v10 & 0x4000000000000000) != 0)
    {
      swift_retain();
      result = sub_21AD2421C();
      v11 = result;
      if (!result)
        goto LABEL_12;
    }
    else
    {
      v11 = *(_QWORD *)(v10 + 16);
      result = swift_retain();
      if (!v11)
        goto LABEL_12;
    }
    if (v11 < 1)
    {
      __break(1u);
      goto LABEL_25;
    }
    for (i = 0; i != v11; ++i)
    {
      if ((v10 & 0xC000000000000001) != 0)
        v13 = (id)MEMORY[0x2207565F4](i, v10);
      else
        v13 = *(id *)(v10 + 8 * i + 32);
      v14 = v13;
      sub_21AD0F9A0(v13);

    }
LABEL_12:
    swift_release();
    if (v9 < 0 || (v9 & 0x4000000000000000) != 0)
    {
      swift_retain();
      result = sub_21AD2421C();
      v15 = result;
      if (result)
      {
LABEL_15:
        if (v15 >= 1)
        {
          for (j = 0; j != v15; ++j)
          {
            if ((v9 & 0xC000000000000001) != 0)
              v17 = (id)MEMORY[0x2207565F4](j, v9);
            else
              v17 = *(id *)(v9 + 8 * j + 32);
            v18 = v17;
            sub_21AD0F658(v17);

          }
          goto LABEL_22;
        }
LABEL_25:
        __break(1u);
        return result;
      }
    }
    else
    {
      v15 = *(_QWORD *)(v9 + 16);
      result = swift_retain();
      if (v15)
        goto LABEL_15;
    }
LABEL_22:
    swift_release_n();
    return swift_release();
  }
  return result;
}

uint64_t sub_21AD0E750(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v22;
  uint64_t v23;
  id v24;
  id v25;
  id v26;
  id v27;
  NSObject *v28;
  os_log_type_t v29;
  _BOOL4 v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  id v34;
  id v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  id v39;
  _QWORD *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unsigned __int8 v44;
  uint64_t v45;
  uint64_t v46;
  id v47;
  uint64_t v48;
  int v49;
  uint64_t v50;
  void (*v51)(char *, uint64_t, uint64_t);
  char *v52;
  id v53;
  id v54;
  id v55;
  id v56;
  NSObject *v57;
  os_log_type_t v58;
  uint64_t v59;
  _QWORD *v60;
  id v61;
  id v62;
  uint64_t v63;
  unint64_t v64;
  unint64_t v65;
  id v66;
  uint64_t v67;
  uint64_t v68;
  void (*v69)(char *, uint64_t, uint64_t);
  char *v70;
  uint64_t v71;
  uint64_t v72;
  char *v73;
  unint64_t v74;
  uint64_t v75;
  void *v76;
  unint64_t v77;
  char *v78;
  void *v79;
  id v80;
  id v81;
  uint64_t v82;
  _QWORD *v83;
  uint64_t v84;
  id v85;
  uint64_t v86;
  uint64_t v87;
  char *v88;
  char *v89;
  char *v90;
  char *v91;
  id v92;
  uint64_t v93;
  char *v94;
  char *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255117EC0);
  MEMORY[0x24BDAC7A8](v4);
  v95 = (char *)&v82 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255117AC0);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v82 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_21AD23E20();
  v96 = *(_QWORD *)(v9 - 8);
  v97 = v9;
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v82 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_255118178);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v82 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_21AD23E14();
  v16 = *(_QWORD *)(v15 - 8);
  v17 = *(_QWORD *)(v16 + 64);
  v18 = MEMORY[0x24BDAC7A8](v15);
  MEMORY[0x24BDAC7A8](v18);
  v20 = (char *)&v82 - v19;
  if (objc_msgSend(a1, sel_isCustom))
    return sub_21AD0EF54(a1);
  v90 = v20;
  v91 = v8;
  v94 = v14;
  v89 = (char *)&v82 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2551178E0 != -1)
    swift_once();
  v22 = sub_21AD23EEC();
  v23 = __swift_project_value_buffer(v22, (uint64_t)qword_2551180B8);
  v24 = v2;
  v25 = a1;
  v26 = v24;
  v27 = v25;
  v93 = v23;
  v28 = sub_21AD23EE0();
  v29 = sub_21AD2406C();
  v30 = os_log_type_enabled(v28, v29);
  v88 = v11;
  if (v30)
  {
    v31 = swift_slowAlloc();
    v92 = v26;
    v32 = v31;
    v83 = (_QWORD *)swift_slowAlloc();
    v84 = swift_slowAlloc();
    v99 = v84;
    *(_DWORD *)v32 = 136315394;
    v86 = v16;
    v33 = v92;
    v87 = v15;
    v34 = v33;
    v35 = objc_msgSend(v33, sel_description);
    v36 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
    v38 = v37;

    v98 = sub_21ACF58B4(v36, v38, &v99);
    v16 = v86;
    sub_21AD240CC();

    swift_bridgeObjectRelease();
    *(_WORD *)(v32 + 12) = 2112;
    v98 = (uint64_t)v27;
    v39 = v27;
    sub_21AD240CC();
    v40 = v83;
    *v83 = v27;

    v15 = v87;
    _os_log_impl(&dword_21ACD4000, v28, v29, "[%s]: creating task for sound recognition detector: %@", (uint8_t *)v32, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_255117958);
    swift_arrayDestroy();
    MEMORY[0x220756ED0](v40, -1, -1);
    v41 = v84;
    swift_arrayDestroy();
    MEMORY[0x220756ED0](v41, -1, -1);
    v42 = v32;
    v26 = v92;
    MEMORY[0x220756ED0](v42, -1, -1);

  }
  else
  {

  }
  v43 = v97;
  v44 = objc_msgSend(v27, sel_isCustom);
  v45 = (uint64_t)v94;
  v46 = v96;
  if ((v44 & 1) != 0)
    goto LABEL_16;
  v47 = objc_msgSend(v27, sel_identifier);
  if (!v47)
  {
    _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
    v47 = (id)sub_21AD23F4C();
    v43 = v97;
    swift_bridgeObjectRelease();
  }
  v48 = (uint64_t)v91;
  AXSDSoundDetectionType.builtInDetectorIdentifier.getter(v47, (uint64_t)v91);
  v49 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v46 + 48))(v48, 1, v43);
  v85 = v27;
  if (v49 == 1)
  {
    sub_21ACFCA74(v48, (uint64_t *)&unk_255117AC0);
    v50 = 1;
  }
  else
  {
    v51 = *(void (**)(char *, uint64_t, uint64_t))(v46 + 32);
    v52 = v88;
    v51(v88, v48, v43);
    v51((char *)v45, (uint64_t)v52, v43);
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v16 + 104))(v45, *MEMORY[0x24BDE9950], v15);
    v50 = 0;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v16 + 56))(v45, v50, 1, v15);

  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v16 + 48))(v45, 1, v15) == 1)
  {
    sub_21ACFCA74(v45, &qword_255118178);
    v27 = v85;
LABEL_16:
    v53 = v26;
    v54 = v27;
    v55 = v53;
    v56 = v54;
    v57 = sub_21AD23EE0();
    v58 = sub_21AD24060();
    if (os_log_type_enabled(v57, v58))
    {
      v59 = swift_slowAlloc();
      v60 = (_QWORD *)swift_slowAlloc();
      v97 = swift_slowAlloc();
      v99 = v97;
      *(_DWORD *)v59 = 136315394;
      v61 = v55;
      v62 = objc_msgSend(v61, sel_description);
      v63 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
      v65 = v64;

      v98 = sub_21ACF58B4(v63, v65, &v99);
      sub_21AD240CC();

      swift_bridgeObjectRelease();
      *(_WORD *)(v59 + 12) = 2112;
      v98 = (uint64_t)v56;
      v66 = v56;
      sub_21AD240CC();
      *v60 = v56;

      _os_log_impl(&dword_21ACD4000, v57, v58, "[%s]: unable to find identifier for detector: %@", (uint8_t *)v59, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_255117958);
      swift_arrayDestroy();
      MEMORY[0x220756ED0](v60, -1, -1);
      v67 = v97;
      swift_arrayDestroy();
      MEMORY[0x220756ED0](v67, -1, -1);
      MEMORY[0x220756ED0](v59, -1, -1);

    }
    else
    {

    }
    return 0;
  }
  v69 = *(void (**)(char *, uint64_t, uint64_t))(v16 + 32);
  v70 = v90;
  v69(v90, v45, v15);
  v71 = sub_21AD24000();
  v72 = (uint64_t)v95;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v71 - 8) + 56))(v95, 1, 1, v71);
  v73 = v89;
  (*(void (**)(char *, char *, uint64_t))(v16 + 16))(v89, v70, v15);
  v74 = (*(unsigned __int8 *)(v16 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  v75 = v17 + v74 + 7;
  v76 = v26;
  v77 = v75 & 0xFFFFFFFFFFFFFFF8;
  v78 = (char *)swift_allocObject();
  *((_QWORD *)v78 + 2) = 0;
  *((_QWORD *)v78 + 3) = 0;
  *((_QWORD *)v78 + 4) = v76;
  v69(&v78[v74], (uint64_t)v73, v15);
  v79 = v85;
  *(_QWORD *)&v78[v77] = v85;
  v80 = v76;
  v81 = v79;
  v68 = sub_21AD0FE50(v72, (uint64_t)&unk_255118188, (uint64_t)v78);
  (*(void (**)(char *, uint64_t))(v16 + 8))(v70, v15);
  return v68;
}

uint64_t sub_21AD0EF54(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  id v18;
  NSObject *v19;
  os_log_type_t v20;
  _BOOL4 v21;
  uint64_t v22;
  void *v23;
  _QWORD *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  id v32;
  uint64_t v33;
  unsigned int v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  id v38;
  id v39;
  void *v40;
  char *v41;
  void (*v42)(uint64_t, char *, uint64_t);
  char *v43;
  uint64_t v44;
  unint64_t v45;
  unint64_t v46;
  _QWORD *v47;
  id v48;
  id v49;
  id v50;
  uint64_t v51;
  id v52;
  id v53;
  id v54;
  id v55;
  NSObject *v56;
  os_log_type_t v57;
  uint64_t v58;
  _QWORD *v59;
  id v60;
  id v61;
  uint64_t v62;
  unint64_t v63;
  unint64_t v64;
  id v65;
  char *v66;
  uint64_t v68;
  uint64_t v69;
  char *v70;
  uint64_t v71;
  char *v72;
  char *v73;
  uint64_t v74;
  uint64_t v75;
  id v76;
  char *v77;
  uint64_t v78;
  char *v79;

  v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255117EC0);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v5 = (char *)&v68 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255117C10);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v77 = (char *)&v68 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_21AD23D9C();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v11 = (char *)&v68 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v71 = v10;
  MEMORY[0x24BDAC7A8](v9);
  v73 = (char *)&v68 - v12;
  if (qword_2551178E8 != -1)
    swift_once();
  v13 = sub_21AD23EEC();
  v14 = __swift_project_value_buffer(v13, (uint64_t)qword_2551180D0);
  v15 = v2;
  v16 = a1;
  v17 = v15;
  v18 = v16;
  v75 = v14;
  v19 = sub_21AD23EE0();
  v20 = sub_21AD2406C();
  v21 = os_log_type_enabled(v19, v20);
  v72 = v11;
  v76 = v17;
  if (v21)
  {
    v22 = swift_slowAlloc();
    v23 = v17;
    v24 = (_QWORD *)swift_slowAlloc();
    v68 = swift_slowAlloc();
    v79 = (char *)v68;
    *(_DWORD *)v22 = 136315394;
    v70 = v5;
    v25 = v23;
    v69 = v7;
    v26 = v25;
    v27 = objc_msgSend(v25, sel_description);
    v74 = v8;
    v28 = v27;
    v29 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
    v31 = v30;

    v78 = sub_21ACF58B4(v29, v31, (uint64_t *)&v79);
    sub_21AD240CC();

    v7 = v69;
    swift_bridgeObjectRelease();
    *(_WORD *)(v22 + 12) = 2112;
    v78 = (uint64_t)v18;
    v32 = v18;
    v8 = v74;
    sub_21AD240CC();
    *v24 = v18;

    v5 = v70;
    _os_log_impl(&dword_21ACD4000, v19, v20, "[%s]: creating task for sound recognition detector: %@", (uint8_t *)v22, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_255117958);
    swift_arrayDestroy();
    MEMORY[0x220756ED0](v24, -1, -1);
    v33 = v68;
    swift_arrayDestroy();
    MEMORY[0x220756ED0](v33, -1, -1);
    MEMORY[0x220756ED0](v22, -1, -1);

  }
  else
  {

  }
  v34 = objc_msgSend(v18, sel_isCustom);
  v35 = (uint64_t)v77;
  if (v34)
  {
    objc_opt_self();
    v36 = swift_dynamicCastObjCClass();
    if (v36)
    {
      v37 = (void *)v36;
      v38 = v18;
      v39 = objc_msgSend(v37, sel_modelURL);
      if (v39)
      {
        v40 = v39;
        v41 = v72;
        sub_21AD23D84();

        v42 = *(void (**)(uint64_t, char *, uint64_t))(v8 + 32);
        v42(v35, v41, v7);
        (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v8 + 56))(v35, 0, 1, v7);
        if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v35, 1, v7) != 1)
        {
          v43 = v73;
          v42((uint64_t)v73, (char *)v35, v7);
          v44 = sub_21AD24000();
          (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v44 - 8) + 56))(v5, 1, 1, v44);
          (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v41, v43, v7);
          v45 = (*(unsigned __int8 *)(v8 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
          v74 = v8;
          v46 = (v71 + v45 + 7) & 0xFFFFFFFFFFFFFFF8;
          v47 = (_QWORD *)swift_allocObject();
          v47[2] = 0;
          v47[3] = 0;
          v48 = v76;
          v47[4] = v76;
          v47[5] = v37;
          v42((uint64_t)v47 + v45, v41, v7);
          *(_QWORD *)((char *)v47 + v46) = v38;
          v49 = v48;
          v50 = v38;
          v51 = sub_21AD0FE50((uint64_t)v5, (uint64_t)&unk_255118148, (uint64_t)v47);
          (*(void (**)(char *, uint64_t))(v74 + 8))(v73, v7);
          return v51;
        }
      }
      else
      {
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v8 + 56))(v35, 1, 1, v7);
      }

      sub_21ACFCA74(v35, &qword_255117C10);
    }
  }
  v52 = v76;
  v53 = v18;
  v54 = v52;
  v55 = v53;
  v56 = sub_21AD23EE0();
  v57 = sub_21AD24060();
  if (os_log_type_enabled(v56, v57))
  {
    v58 = swift_slowAlloc();
    v59 = (_QWORD *)swift_slowAlloc();
    v77 = (char *)swift_slowAlloc();
    v79 = v77;
    *(_DWORD *)v58 = 136315394;
    v60 = v54;
    v61 = objc_msgSend(v60, sel_description);
    v62 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
    v64 = v63;

    v78 = sub_21ACF58B4(v62, v64, (uint64_t *)&v79);
    sub_21AD240CC();

    swift_bridgeObjectRelease();
    *(_WORD *)(v58 + 12) = 2112;
    v78 = (uint64_t)v55;
    v65 = v55;
    sub_21AD240CC();
    *v59 = v55;

    _os_log_impl(&dword_21ACD4000, v56, v57, "[%s]: unable to locate mlModel found for custom detector: %@", (uint8_t *)v58, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_255117958);
    swift_arrayDestroy();
    MEMORY[0x220756ED0](v59, -1, -1);
    v66 = v77;
    swift_arrayDestroy();
    MEMORY[0x220756ED0](v66, -1, -1);
    MEMORY[0x220756ED0](v58, -1, -1);

  }
  else
  {

  }
  return 0;
}

void sub_21AD0F658(void *a1)
{
  char *v1;
  uint64_t *v3;
  id v4;
  char v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v11;
  id v12;
  char *v13;
  id v14;
  char *v15;
  NSObject *v16;
  os_log_type_t v17;
  uint64_t v18;
  _QWORD *v19;
  char *v20;
  id v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  id v25;
  uint64_t v26;
  uint64_t v27[3];
  uint64_t v28;

  v3 = (uint64_t *)&v1[OBJC_IVAR____TtC18AXSoundDetectionUI38AXSDSecureBaseControllerImplementation_currentTasks];
  swift_beginAccess();
  if (!*(_QWORD *)(*v3 + 16)
    || (v4 = a1,
        swift_bridgeObjectRetain(),
        sub_21AD1DF34((uint64_t)v4),
        v6 = v5,
        v4,
        swift_bridgeObjectRelease(),
        (v6 & 1) == 0))
  {
    v7 = sub_21AD0E750(a1);
    if (v7)
    {
      v8 = v7;
      swift_beginAccess();
      v9 = a1;
      swift_retain();
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v28 = *v3;
      *v3 = 0x8000000000000000;
      sub_21AD1E90C(v8, v9, isUniquelyReferenced_nonNull_native);
      *v3 = v28;

      swift_bridgeObjectRelease();
      swift_endAccess();
      swift_release();
    }
    else
    {
      if (qword_2551178E0 != -1)
        swift_once();
      v11 = sub_21AD23EEC();
      __swift_project_value_buffer(v11, (uint64_t)qword_2551180B8);
      v12 = a1;
      v13 = v1;
      v14 = v12;
      v15 = v13;
      v16 = sub_21AD23EE0();
      v17 = sub_21AD2406C();
      if (os_log_type_enabled(v16, v17))
      {
        v18 = swift_slowAlloc();
        v19 = (_QWORD *)swift_slowAlloc();
        v26 = swift_slowAlloc();
        v27[0] = v26;
        *(_DWORD *)v18 = 136315394;
        v20 = v15;
        v21 = objc_msgSend(v20, sel_description);
        v22 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
        v24 = v23;

        v28 = sub_21ACF58B4(v22, v24, v27);
        sub_21AD240CC();

        swift_bridgeObjectRelease();
        *(_WORD *)(v18 + 12) = 2112;
        v28 = (uint64_t)v14;
        v25 = v14;
        sub_21AD240CC();
        *v19 = v14;

        _os_log_impl(&dword_21ACD4000, v16, v17, "[%s]: unable to create a task for detector: %@", (uint8_t *)v18, 0x16u);
        __swift_instantiateConcreteTypeFromMangledName(&qword_255117958);
        swift_arrayDestroy();
        MEMORY[0x220756ED0](v19, -1, -1);
        swift_arrayDestroy();
        MEMORY[0x220756ED0](v26, -1, -1);
        MEMORY[0x220756ED0](v18, -1, -1);

      }
      else
      {

      }
    }
  }
}

uint64_t sub_21AD0F9A0(void *a1)
{
  char *v1;
  char *v3;
  id v4;
  char v5;
  uint64_t v6;
  id v7;
  char *v8;
  id v9;
  char *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  char *v14;
  id v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  id v19;
  id v20;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24[3];

  v3 = &v1[OBJC_IVAR____TtC18AXSoundDetectionUI38AXSDSecureBaseControllerImplementation_currentTasks];
  swift_beginAccess();
  if (*(_QWORD *)(*(_QWORD *)v3 + 16))
  {
    v4 = a1;
    swift_bridgeObjectRetain();
    sub_21AD1DF34((uint64_t)v4);
    if ((v5 & 1) != 0)
    {
      swift_retain();

      swift_bridgeObjectRelease();
      if (qword_2551178E0 != -1)
        swift_once();
      v6 = sub_21AD23EEC();
      __swift_project_value_buffer(v6, (uint64_t)qword_2551180B8);
      v7 = v4;
      v8 = v1;
      v9 = v7;
      v10 = v8;
      v11 = sub_21AD23EE0();
      v12 = sub_21AD2406C();
      if (os_log_type_enabled(v11, v12))
      {
        v13 = swift_slowAlloc();
        v22 = (_QWORD *)swift_slowAlloc();
        v23 = swift_slowAlloc();
        v24[0] = v23;
        *(_DWORD *)v13 = 136315394;
        v14 = v10;
        v15 = objc_msgSend(v14, sel_description);
        v16 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
        v18 = v17;

        sub_21ACF58B4(v16, v18, v24);
        sub_21AD240CC();

        swift_bridgeObjectRelease();
        *(_WORD *)(v13 + 12) = 2112;
        v19 = v9;
        sub_21AD240CC();
        *v22 = v9;

        _os_log_impl(&dword_21ACD4000, v11, v12, "[%s]: removing task for detector: %@.", (uint8_t *)v13, 0x16u);
        __swift_instantiateConcreteTypeFromMangledName(&qword_255117958);
        swift_arrayDestroy();
        MEMORY[0x220756ED0](v22, -1, -1);
        swift_arrayDestroy();
        MEMORY[0x220756ED0](v23, -1, -1);
        MEMORY[0x220756ED0](v13, -1, -1);

      }
      else
      {

      }
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255117930);
      sub_21AD2400C();
      swift_release();
    }
    else
    {

      swift_bridgeObjectRelease();
    }
  }
  swift_beginAccess();
  v20 = a1;
  sub_21AD17428((uint64_t)v20);
  swift_endAccess();

  return swift_release();
}

BOOL sub_21AD0FCFC()
{
  uint64_t v0;
  char *v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  unint64_t v8;
  uint64_t v9;
  char v10;
  char v11;
  uint64_t v12;
  uint64_t v13;

  v1 = (char *)(v0 + OBJC_IVAR____TtC18AXSoundDetectionUI38AXSDSecureBaseControllerImplementation_isEnabled);
  swift_beginAccess();
  v2 = *v1;
  v3 = v0 + OBJC_IVAR____TtC18AXSoundDetectionUI38AXSDSecureBaseControllerImplementation_currentTasks;
  if ((v2 & 1) != 0)
  {
    swift_beginAccess();
    v4 = swift_bridgeObjectRetain();
    sub_21ACF2E8C(v4);
    v6 = v5;
    v7 = (_QWORD *)(v0 + OBJC_IVAR____TtC18AXSoundDetectionUI38AXSDSecureBaseControllerImplementation_currentDetectors);
    swift_beginAccess();
    v8 = swift_bridgeObjectRetain();
    v9 = sub_21ACF7E4C(v8);
    swift_bridgeObjectRelease();
    sub_21AD14744(v6, v9);
    v11 = v10;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v11 & 1) == 0)
      return 0;
    v12 = *(_QWORD *)(*(_QWORD *)v3 + 16);
    if (*v7 >> 62)
    {
      swift_bridgeObjectRetain();
      v13 = sub_21AD2421C();
      swift_bridgeObjectRelease();
    }
    else
    {
      v13 = *(_QWORD *)((*v7 & 0xFFFFFFFFFFFFF8) + 0x10);
    }
    return v12 == v13;
  }
  else
  {
    swift_beginAccess();
    return *(_QWORD *)(*(_QWORD *)v3 + 16) == 0;
  }
}

uint64_t sub_21AD0FE50(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;

  v5 = sub_21AD24000();
  v6 = *(_QWORD *)(v5 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v5) != 1)
  {
    sub_21AD23FF4();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    if (!*(_QWORD *)(a3 + 16))
      return swift_task_create();
    goto LABEL_3;
  }
  sub_21ACFCA74(a1, &qword_255117EC0);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_21AD23FDC();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

uint64_t sub_21AD0FF84(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;
  _QWORD *v3;

  v2 = *a1;
  v3 = (_QWORD *)(*a2 + OBJC_IVAR____TtC18AXSoundDetectionUI38AXSDSecureBaseControllerImplementation_currentDetectors);
  swift_beginAccess();
  *v3 = v2;
  swift_bridgeObjectRetain_n();
  sub_21AD0E548();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

id AXSDSecureBaseControllerImplementation.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id AXSDSecureBaseControllerImplementation.init()()
{
  void *v0;
  uint64_t v1;
  _BYTE *v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;
  objc_super v9;

  v1 = qword_2551178E0;
  v2 = v0;
  if (v1 != -1)
    swift_once();
  v3 = sub_21AD23EEC();
  __swift_project_value_buffer(v3, (uint64_t)qword_2551180B8);
  v4 = sub_21AD23EE0();
  v5 = sub_21AD2406C();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_21ACD4000, v4, v5, "Initializing Base Secure Sound Detection Controller", v6, 2u);
    MEMORY[0x220756ED0](v6, -1, -1);
  }

  v7 = MEMORY[0x24BEE4AF8];
  *(_QWORD *)&v2[OBJC_IVAR____TtC18AXSoundDetectionUI38AXSDSecureBaseControllerImplementation_currentDetectors] = MEMORY[0x24BEE4AF8];
  *(_QWORD *)&v2[OBJC_IVAR____TtC18AXSoundDetectionUI38AXSDSecureBaseControllerImplementation_currentTasks] = sub_21ACFDC7C(v7);
  v2[OBJC_IVAR____TtC18AXSoundDetectionUI38AXSDSecureBaseControllerImplementation_isEnabled] = 0;

  v9.receiver = v2;
  v9.super_class = (Class)type metadata accessor for AXSDSecureBaseControllerImplementation();
  return objc_msgSendSuper2(&v9, sel_init);
}

id AXSDSecureBaseControllerImplementation.__deallocating_deinit()
{
  void *v0;
  void *v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  objc_super v7;

  v1 = v0;
  if (qword_2551178E0 != -1)
    swift_once();
  v2 = sub_21AD23EEC();
  __swift_project_value_buffer(v2, (uint64_t)qword_2551180B8);
  v3 = sub_21AD23EE0();
  v4 = sub_21AD2406C();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_21ACD4000, v3, v4, "Deinitializing Base Secure Sound Detection Controller", v5, 2u);
    MEMORY[0x220756ED0](v5, -1, -1);
  }

  v7.receiver = v1;
  v7.super_class = (Class)type metadata accessor for AXSDSecureBaseControllerImplementation();
  return objc_msgSendSuper2(&v7, sel_dealloc);
}

uint64_t sub_21AD10448(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = a2;
  if ((a1 & 0xC000000000000001) != 0)
  {
    v4 = sub_21AD24114();
    if ((v2 & 0xC000000000000001) != 0)
      goto LABEL_3;
LABEL_9:
    if (v4 > *(_QWORD *)(v2 + 16) >> 3)
      return sub_21AD16454(a1, v2);
    goto LABEL_11;
  }
  v4 = *(_QWORD *)(a1 + 16);
  if ((a2 & 0xC000000000000001) == 0)
    goto LABEL_9;
LABEL_3:
  if (v2 < 0)
    v5 = v2;
  else
    v5 = v2 & 0xFFFFFFFFFFFFFF8;
  if (v4 > sub_21AD24114() / 8)
  {
    swift_bridgeObjectRetain();
    v6 = sub_21AD24114();
    v7 = sub_21AD15118(v5, v6);
    swift_bridgeObjectRelease();
    v2 = v7;
    return sub_21AD16454(a1, v2);
  }
LABEL_11:
  sub_21AD1617C(a1);
  return v2;
}

uint64_t sub_21AD1053C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v6[17] = a5;
  v6[18] = a6;
  v6[16] = a4;
  v7 = sub_21AD241E0();
  v6[19] = v7;
  v6[20] = *(_QWORD *)(v7 - 8);
  v6[21] = swift_task_alloc();
  v6[22] = swift_task_alloc();
  v8 = sub_21AD241F8();
  v6[23] = v8;
  v6[24] = *(_QWORD *)(v8 - 8);
  v6[25] = swift_task_alloc();
  v9 = sub_21AD23E68();
  v6[26] = v9;
  v6[27] = *(_QWORD *)(v9 - 8);
  v6[28] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255118150);
  v6[29] = swift_task_alloc();
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_255118158);
  v6[30] = v10;
  v6[31] = *(_QWORD *)(v10 - 8);
  v6[32] = swift_task_alloc();
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_255118160);
  v6[33] = v11;
  v6[34] = *(_QWORD *)(v11 - 8);
  v6[35] = swift_task_alloc();
  v12 = sub_21AD23E5C();
  v6[36] = v12;
  v6[37] = *(_QWORD *)(v12 - 8);
  v6[38] = swift_task_alloc();
  v13 = sub_21AD23E44();
  v6[39] = v13;
  v6[40] = *(_QWORD *)(v13 - 8);
  v6[41] = swift_task_alloc();
  v6[42] = swift_task_alloc();
  v14 = sub_21AD23E14();
  v6[43] = v14;
  v6[44] = *(_QWORD *)(v14 - 8);
  v6[45] = swift_task_alloc();
  v6[46] = swift_task_alloc();
  v6[47] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_21AD10720()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  id v8;
  NSObject *v9;
  os_log_type_t v10;
  _BOOL4 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  void (*v24)(uint64_t, uint64_t);
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  id v31;
  NSObject *v32;
  os_log_type_t v33;
  _BOOL4 v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  id v40;
  id v41;
  uint64_t v42;
  unint64_t v43;
  unint64_t v44;
  uint64_t v45;
  unint64_t v46;
  void (*v47)(uint64_t, uint64_t);
  _QWORD *v48;
  uint64_t v49;
  uint64_t v50;
  os_log_type_t v51;
  os_log_type_t type[8];
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;

  if (qword_2551178E0 != -1)
    swift_once();
  v1 = *(void **)(v0 + 128);
  v2 = *(_QWORD *)(v0 + 376);
  v3 = *(_QWORD *)(v0 + 344);
  v4 = *(_QWORD *)(v0 + 352);
  v5 = *(_QWORD *)(v0 + 136);
  v6 = sub_21AD23EEC();
  *(_QWORD *)(v0 + 384) = __swift_project_value_buffer(v6, (uint64_t)qword_2551180B8);
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);
  *(_QWORD *)(v0 + 392) = v7;
  v7(v2, v5, v3);
  v8 = v1;
  v9 = sub_21AD23EE0();
  v10 = sub_21AD2406C();
  v11 = os_log_type_enabled(v9, v10);
  v12 = *(_QWORD *)(v0 + 376);
  v13 = *(_QWORD *)(v0 + 344);
  v14 = *(_QWORD *)(v0 + 352);
  v15 = *(void **)(v0 + 128);
  if (v11)
  {
    v53 = *(_QWORD *)(v0 + 344);
    v16 = swift_slowAlloc();
    v54 = swift_slowAlloc();
    v56 = v54;
    *(_DWORD *)v16 = 136315394;
    v17 = v15;
    v18 = objc_msgSend(v17, sel_description);
    v49 = v14;
    v19 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
    v21 = v20;

    *(_QWORD *)(v0 + 112) = sub_21ACF58B4(v19, v21, &v56);
    sub_21AD240CC();
    swift_bridgeObjectRelease();

    *(_WORD *)(v16 + 12) = 2080;
    v22 = AccessibilitySoundRecognition.DetectorIdentifier.description.getter();
    *(_QWORD *)(v0 + 120) = sub_21ACF58B4(v22, v23, &v56);
    sub_21AD240CC();
    swift_bridgeObjectRelease();
    v24 = *(void (**)(uint64_t, uint64_t))(v49 + 8);
    v24(v12, v53);
    _os_log_impl(&dword_21ACD4000, v9, v10, "[%s]: Starting sound recogntion task for identifier: %s.", (uint8_t *)v16, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x220756ED0](v54, -1, -1);
    MEMORY[0x220756ED0](v16, -1, -1);
  }
  else
  {

    v24 = *(void (**)(uint64_t, uint64_t))(v14 + 8);
    v24(v12, v13);
  }

  *(_QWORD *)(v0 + 400) = v24;
  if ((sub_21AD24018() & 1) != 0)
  {
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    *(_QWORD *)(v0 + 408) = v24;
    v26 = *(_QWORD *)(v0 + 336);
    v28 = *(_QWORD *)(v0 + 320);
    v27 = *(_QWORD *)(v0 + 328);
    v29 = *(_QWORD *)(v0 + 312);
    v30 = *(void **)(v0 + 128);
    (*(void (**)(_QWORD, _QWORD, _QWORD))(v0 + 392))(*(_QWORD *)(v0 + 368), *(_QWORD *)(v0 + 136), *(_QWORD *)(v0 + 344));
    sub_21AD23E38();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v28 + 16))(v27, v26, v29);
    v31 = v30;
    v32 = sub_21AD23EE0();
    v33 = sub_21AD2406C();
    v34 = os_log_type_enabled(v32, v33);
    v36 = *(_QWORD *)(v0 + 320);
    v35 = *(_QWORD *)(v0 + 328);
    v37 = *(_QWORD *)(v0 + 312);
    v38 = *(void **)(v0 + 128);
    if (v34)
    {
      *(_QWORD *)type = *(_QWORD *)(v0 + 320);
      v39 = swift_slowAlloc();
      v55 = swift_slowAlloc();
      v56 = v55;
      *(_DWORD *)v39 = 136315394;
      v51 = v33;
      v40 = v38;
      v50 = v35;
      v41 = objc_msgSend(v40, sel_description);
      v42 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
      v44 = v43;

      *(_QWORD *)(v0 + 96) = sub_21ACF58B4(v42, v44, &v56);
      sub_21AD240CC();
      swift_bridgeObjectRelease();

      *(_WORD *)(v39 + 12) = 2080;
      sub_21ACF7DA4(&qword_255118170, (uint64_t (*)(uint64_t))MEMORY[0x24BDE9A10], MEMORY[0x24BDE9A18]);
      v45 = sub_21AD24270();
      *(_QWORD *)(v0 + 104) = sub_21ACF58B4(v45, v46, &v56);
      sub_21AD240CC();
      swift_bridgeObjectRelease();
      v47 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)type + 8);
      v47(v50, v37);
      _os_log_impl(&dword_21ACD4000, v32, v51, "[%s]: running request %s", (uint8_t *)v39, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x220756ED0](v55, -1, -1);
      MEMORY[0x220756ED0](v39, -1, -1);
    }
    else
    {

      v47 = *(void (**)(uint64_t, uint64_t))(v36 + 8);
      v47(v35, v37);
    }

    *(_QWORD *)(v0 + 416) = v47;
    v48 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 424) = v48;
    *v48 = v0;
    v48[1] = sub_21AD10CCC;
    return sub_21AD23EC8();
  }
}

uint64_t sub_21AD10CCC()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 432) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_21AD10D30()
{
  uint64_t v0;
  _QWORD *v1;

  sub_21AD23E50();
  sub_21AD23EBC();
  *(_QWORD *)(v0 + 440) = sub_21AD19568();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 448) = v1;
  *v1 = v0;
  v1[1] = sub_21AD10DC0;
  return sub_21AD23FE8();
}

uint64_t sub_21AD10DC0()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  swift_task_dealloc();
  if (v0)
    *(_QWORD *)(v2 + 456) = v0;
  return swift_task_switch();
}

uint64_t sub_21AD10E24()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void (*v4)(uint64_t, uint64_t);
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  NSObject *v15;
  os_log_type_t v16;
  BOOL v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  id v22;
  id v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  _QWORD *v34;
  void (*v36)(uint64_t, uint64_t);
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void (*v40)(uint64_t, uint64_t);
  _QWORD *v41;
  uint64_t v42;
  uint64_t v43;
  void (*v44)(uint64_t, uint64_t);
  uint64_t v45;

  v1 = *(_QWORD *)(v0 + 232);
  v2 = *(_QWORD *)(v0 + 208);
  v3 = *(_QWORD *)(v0 + 216);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v1, 1, v2) == 1)
  {
    v4 = *(void (**)(uint64_t, uint64_t))(v0 + 416);
    v5 = *(_QWORD *)(v0 + 336);
    v7 = *(_QWORD *)(v0 + 304);
    v6 = *(_QWORD *)(v0 + 312);
    v8 = *(_QWORD *)(v0 + 288);
    v9 = *(_QWORD *)(v0 + 296);
    v11 = *(_QWORD *)(v0 + 272);
    v10 = *(_QWORD *)(v0 + 280);
    v12 = *(_QWORD *)(v0 + 264);
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 248) + 8))(*(_QWORD *)(v0 + 256), *(_QWORD *)(v0 + 240));
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v10, v12);
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v7, v8);
    v4(v5, v6);
    v13 = *(void **)(v0 + 128);
    (*(void (**)(_QWORD, _QWORD, _QWORD))(v0 + 392))(*(_QWORD *)(v0 + 360), *(_QWORD *)(v0 + 136), *(_QWORD *)(v0 + 344));
    v14 = v13;
    v15 = sub_21AD23EE0();
    v16 = sub_21AD2406C();
    v17 = os_log_type_enabled(v15, v16);
    v18 = *(_QWORD *)(v0 + 360);
    v19 = *(_QWORD *)(v0 + 344);
    v20 = *(void **)(v0 + 128);
    if (v17)
    {
      v44 = *(void (**)(uint64_t, uint64_t))(v0 + 400);
      v21 = swift_slowAlloc();
      v43 = swift_slowAlloc();
      v45 = v43;
      *(_DWORD *)v21 = 136315394;
      v22 = v20;
      v23 = objc_msgSend(v22, sel_description);
      v24 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
      v42 = v19;
      v26 = v25;

      *(_QWORD *)(v0 + 56) = sub_21ACF58B4(v24, v26, &v45);
      sub_21AD240CC();
      swift_bridgeObjectRelease();

      *(_WORD *)(v21 + 12) = 2080;
      v27 = AccessibilitySoundRecognition.DetectorIdentifier.description.getter();
      *(_QWORD *)(v0 + 64) = sub_21ACF58B4(v27, v28, &v45);
      sub_21AD240CC();
      swift_bridgeObjectRelease();
      v44(v18, v42);
      _os_log_impl(&dword_21ACD4000, v15, v16, "[%s]: Restarting sound recogntion task for identifier: %s.", (uint8_t *)v21, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x220756ED0](v43, -1, -1);
      v29 = v21;
      v30 = (_QWORD *)(v0 + 400);
      MEMORY[0x220756ED0](v29, -1, -1);
    }
    else
    {
      v30 = (_QWORD *)(v0 + 408);
      v36 = *(void (**)(uint64_t, uint64_t))(v0 + 408);

      v36(v18, v19);
    }

    *(_QWORD *)(v0 + 472) = *v30;
    v38 = *(_QWORD *)(v0 + 160);
    v37 = *(_QWORD *)(v0 + 168);
    v39 = *(_QWORD *)(v0 + 152);
    sub_21AD241EC();
    *(_OWORD *)(v0 + 40) = xmmword_21AD271C0;
    *(_QWORD *)(v0 + 24) = 0;
    *(_QWORD *)(v0 + 16) = 0;
    *(_BYTE *)(v0 + 32) = 1;
    sub_21ACF7DA4(&qword_255117EF0, (uint64_t (*)(uint64_t))MEMORY[0x24BEE6E10], MEMORY[0x24BEE6E20]);
    sub_21AD242A0();
    sub_21ACF7DA4(&qword_255117EF8, (uint64_t (*)(uint64_t))MEMORY[0x24BEE6DC8], MEMORY[0x24BEE6E00]);
    sub_21AD24204();
    v40 = *(void (**)(uint64_t, uint64_t))(v38 + 8);
    *(_QWORD *)(v0 + 480) = v40;
    v40(v37, v39);
    v41 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 488) = v41;
    *v41 = v0;
    v41[1] = sub_21AD11894;
    return sub_21AD242AC();
  }
  else
  {
    v31 = *(_QWORD *)(v0 + 224);
    v32 = *(_QWORD *)(v0 + 144);
    v33 = *(_QWORD **)(v0 + 128);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 32))(v31, v1, v2);
    (*(void (**)(uint64_t, uint64_t))((*MEMORY[0x24BEE4EA0] & *v33) + 0x140))(v31, v32);
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v31, v2);
    v34 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 464) = v34;
    *v34 = v0;
    v34[1] = sub_21AD11830;
    return sub_21AD23FE8();
  }
}

uint64_t sub_21AD11258()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 88) = *(_QWORD *)(v0 + 456);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255117930);
  swift_willThrowTypedImpl();
  return swift_task_switch();
}

uint64_t sub_21AD112B8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  os_log_type_t v14;
  char *__ptr32 *v15;
  uint32_t *p_align;
  void *v17;
  uint64_t v18;
  id v19;
  id v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  id v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  NSObject *v29;
  os_log_type_t v30;
  _BOOL4 v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  id v36;
  id v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  _QWORD *v44;
  void (*v45)(uint64_t, uint64_t);
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void (*v49)(uint64_t, uint64_t);
  _QWORD *v50;
  uint64_t v52;
  uint64_t v53;
  _QWORD *v54;
  void (*v55)(uint64_t, uint64_t);
  uint64_t v56;
  uint64_t v57;

  v2 = *(_QWORD *)(v0 + 296);
  v1 = *(_QWORD *)(v0 + 304);
  v4 = *(_QWORD *)(v0 + 280);
  v3 = *(_QWORD *)(v0 + 288);
  v5 = *(_QWORD *)(v0 + 264);
  v6 = *(_QWORD *)(v0 + 272);
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 248) + 8))(*(_QWORD *)(v0 + 256), *(_QWORD *)(v0 + 240));
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  v7 = *(void **)(v0 + 456);
  v8 = *(void **)(v0 + 128);
  (*(void (**)(_QWORD, _QWORD))(v0 + 416))(*(_QWORD *)(v0 + 336), *(_QWORD *)(v0 + 312));
  v9 = v8;
  v10 = v7;
  v11 = v9;
  v12 = v7;
  v13 = sub_21AD23EE0();
  v14 = sub_21AD2406C();
  v15 = &off_21AD26000;
  p_align = &stru_24DDFCFE8.align;
  if (os_log_type_enabled(v13, v14))
  {
    v17 = *(void **)(v0 + 128);
    v18 = swift_slowAlloc();
    v54 = (_QWORD *)swift_slowAlloc();
    v56 = swift_slowAlloc();
    v57 = v56;
    *(_DWORD *)v18 = 136315394;
    v19 = v17;
    v20 = objc_msgSend(v19, sel_description);
    v21 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
    v23 = v22;

    *(_QWORD *)(v0 + 72) = sub_21ACF58B4(v21, v23, &v57);
    sub_21AD240CC();
    swift_bridgeObjectRelease();

    *(_WORD *)(v18 + 12) = 2112;
    v24 = v7;
    v25 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 80) = v25;
    p_align = (_DWORD *)(&stru_24DDFCFE8 + 24);
    sub_21AD240CC();
    *v54 = v25;
    v15 = &off_21AD26000;

    _os_log_impl(&dword_21ACD4000, v13, v14, "[%s]: session failed with %@", (uint8_t *)v18, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_255117958);
    swift_arrayDestroy();
    MEMORY[0x220756ED0](v54, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x220756ED0](v56, -1, -1);
    MEMORY[0x220756ED0](v18, -1, -1);

  }
  else
  {
    v26 = *(void **)(v0 + 128);

  }
  v27 = *(void **)(v0 + 128);
  (*(void (**)(_QWORD, _QWORD, _QWORD))(v0 + 392))(*(_QWORD *)(v0 + 360), *(_QWORD *)(v0 + 136), *(_QWORD *)(v0 + 344));
  v28 = v27;
  v29 = sub_21AD23EE0();
  v30 = sub_21AD2406C();
  v31 = os_log_type_enabled(v29, v30);
  v32 = *(_QWORD *)(v0 + 360);
  v33 = *(_QWORD *)(v0 + 344);
  v34 = *(void **)(v0 + 128);
  if (v31)
  {
    v55 = *(void (**)(uint64_t, uint64_t))(v0 + 400);
    v35 = swift_slowAlloc();
    v53 = swift_slowAlloc();
    v57 = v53;
    *(_DWORD *)v35 = *((_QWORD *)v15 + 418);
    v52 = v33;
    v36 = v34;
    v37 = objc_msgSend(v36, *((SEL *)p_align + 367));
    v38 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
    v40 = v39;

    *(_QWORD *)(v0 + 56) = sub_21ACF58B4(v38, v40, &v57);
    sub_21AD240CC();
    swift_bridgeObjectRelease();

    *(_WORD *)(v35 + 12) = 2080;
    v41 = AccessibilitySoundRecognition.DetectorIdentifier.description.getter();
    *(_QWORD *)(v0 + 64) = sub_21ACF58B4(v41, v42, &v57);
    sub_21AD240CC();
    swift_bridgeObjectRelease();
    v55(v32, v52);
    _os_log_impl(&dword_21ACD4000, v29, v30, "[%s]: Restarting sound recogntion task for identifier: %s.", (uint8_t *)v35, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x220756ED0](v53, -1, -1);
    v43 = v35;
    v44 = (_QWORD *)(v0 + 400);
    MEMORY[0x220756ED0](v43, -1, -1);
  }
  else
  {
    v44 = (_QWORD *)(v0 + 408);
    v45 = *(void (**)(uint64_t, uint64_t))(v0 + 408);

    v45(v32, v33);
  }

  *(_QWORD *)(v0 + 472) = *v44;
  v47 = *(_QWORD *)(v0 + 160);
  v46 = *(_QWORD *)(v0 + 168);
  v48 = *(_QWORD *)(v0 + 152);
  sub_21AD241EC();
  *(_OWORD *)(v0 + 40) = xmmword_21AD271C0;
  *(_QWORD *)(v0 + 24) = 0;
  *(_QWORD *)(v0 + 16) = 0;
  *(_BYTE *)(v0 + 32) = 1;
  sub_21ACF7DA4(&qword_255117EF0, (uint64_t (*)(uint64_t))MEMORY[0x24BEE6E10], MEMORY[0x24BEE6E20]);
  sub_21AD242A0();
  sub_21ACF7DA4(&qword_255117EF8, (uint64_t (*)(uint64_t))MEMORY[0x24BEE6DC8], MEMORY[0x24BEE6E00]);
  sub_21AD24204();
  v49 = *(void (**)(uint64_t, uint64_t))(v47 + 8);
  *(_QWORD *)(v0 + 480) = v49;
  v49(v46, v48);
  v50 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 488) = v50;
  *v50 = v0;
  v50[1] = sub_21AD11894;
  return sub_21AD242AC();
}

uint64_t sub_21AD11830()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  swift_task_dealloc();
  if (v0)
    *(_QWORD *)(v2 + 456) = v0;
  return swift_task_switch();
}

uint64_t sub_21AD11894()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = *v1;
  *(_QWORD *)(*v1 + 496) = v0;
  swift_task_dealloc();
  if (v0)
  {
    (*(void (**)(_QWORD, _QWORD))(v2 + 480))(*(_QWORD *)(v2 + 176), *(_QWORD *)(v2 + 152));
  }
  else
  {
    v4 = *(_QWORD *)(v2 + 192);
    v3 = *(_QWORD *)(v2 + 200);
    v5 = *(_QWORD *)(v2 + 184);
    (*(void (**)(_QWORD, _QWORD))(v2 + 480))(*(_QWORD *)(v2 + 176), *(_QWORD *)(v2 + 152));
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  }
  return swift_task_switch();
}

uint64_t sub_21AD11934()
{
  uint64_t v0;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  void (*v23)(uint64_t, uint64_t);
  _QWORD *v24;
  uint64_t v25;
  os_log_type_t type;
  uint64_t v27;
  uint64_t v28;

  if ((sub_21AD24018() & 1) != 0)
  {
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    *(_QWORD *)(v0 + 408) = *(_QWORD *)(v0 + 472);
    v2 = *(_QWORD *)(v0 + 336);
    v4 = *(_QWORD *)(v0 + 320);
    v3 = *(_QWORD *)(v0 + 328);
    v5 = *(_QWORD *)(v0 + 312);
    v6 = *(void **)(v0 + 128);
    (*(void (**)(_QWORD, _QWORD, _QWORD))(v0 + 392))(*(_QWORD *)(v0 + 368), *(_QWORD *)(v0 + 136), *(_QWORD *)(v0 + 344));
    sub_21AD23E38();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v3, v2, v5);
    v7 = v6;
    v8 = sub_21AD23EE0();
    v9 = sub_21AD2406C();
    v10 = os_log_type_enabled(v8, v9);
    v12 = *(_QWORD *)(v0 + 320);
    v11 = *(_QWORD *)(v0 + 328);
    v13 = *(_QWORD *)(v0 + 312);
    v14 = *(void **)(v0 + 128);
    if (v10)
    {
      type = v9;
      v15 = swift_slowAlloc();
      v27 = swift_slowAlloc();
      v28 = v27;
      *(_DWORD *)v15 = 136315394;
      v16 = v14;
      v17 = objc_msgSend(v16, sel_description);
      v25 = v12;
      v18 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
      v20 = v19;

      *(_QWORD *)(v0 + 96) = sub_21ACF58B4(v18, v20, &v28);
      sub_21AD240CC();
      swift_bridgeObjectRelease();

      *(_WORD *)(v15 + 12) = 2080;
      sub_21ACF7DA4(&qword_255118170, (uint64_t (*)(uint64_t))MEMORY[0x24BDE9A10], MEMORY[0x24BDE9A18]);
      v21 = sub_21AD24270();
      *(_QWORD *)(v0 + 104) = sub_21ACF58B4(v21, v22, &v28);
      sub_21AD240CC();
      swift_bridgeObjectRelease();
      v23 = *(void (**)(uint64_t, uint64_t))(v25 + 8);
      v23(v11, v13);
      _os_log_impl(&dword_21ACD4000, v8, type, "[%s]: running request %s", (uint8_t *)v15, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x220756ED0](v27, -1, -1);
      MEMORY[0x220756ED0](v15, -1, -1);
    }
    else
    {

      v23 = *(void (**)(uint64_t, uint64_t))(v12 + 8);
      v23(v11, v13);
    }

    *(_QWORD *)(v0 + 416) = v23;
    v24 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 424) = v24;
    *v24 = v0;
    v24[1] = sub_21AD10CCC;
    return sub_21AD23EC8();
  }
}

uint64_t sub_21AD11C98()
{
  uint64_t v0;

  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 192) + 8))(*(_QWORD *)(v0 + 200), *(_QWORD *)(v0 + 184));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_21AD11D8C()
{
  uint64_t v0;
  void *v1;
  void *v2;
  id v3;
  id v4;
  id v5;
  id v6;
  NSObject *v7;
  os_log_type_t v8;
  char *__ptr32 *v9;
  uint32_t *p_align;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  os_log_type_t v24;
  _BOOL4 v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  id v30;
  id v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  _QWORD *v38;
  void (*v39)(uint64_t, uint64_t);
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void (*v43)(uint64_t, uint64_t);
  _QWORD *v44;
  uint64_t v46;
  uint64_t v47;
  _QWORD *v48;
  void (*v49)(uint64_t, uint64_t);
  uint64_t v50;
  uint64_t v51;

  v1 = *(void **)(v0 + 432);
  v2 = *(void **)(v0 + 128);
  (*(void (**)(_QWORD, _QWORD))(v0 + 416))(*(_QWORD *)(v0 + 336), *(_QWORD *)(v0 + 312));
  v3 = v2;
  v4 = v1;
  v5 = v3;
  v6 = v1;
  v7 = sub_21AD23EE0();
  v8 = sub_21AD2406C();
  v9 = &off_21AD26000;
  p_align = &stru_24DDFCFE8.align;
  if (os_log_type_enabled(v7, v8))
  {
    v11 = *(void **)(v0 + 128);
    v12 = swift_slowAlloc();
    v48 = (_QWORD *)swift_slowAlloc();
    v50 = swift_slowAlloc();
    v51 = v50;
    *(_DWORD *)v12 = 136315394;
    v13 = v11;
    v14 = objc_msgSend(v13, sel_description);
    v15 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
    v17 = v16;

    *(_QWORD *)(v0 + 72) = sub_21ACF58B4(v15, v17, &v51);
    sub_21AD240CC();
    swift_bridgeObjectRelease();

    *(_WORD *)(v12 + 12) = 2112;
    v18 = v1;
    v19 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 80) = v19;
    p_align = (_DWORD *)(&stru_24DDFCFE8 + 24);
    sub_21AD240CC();
    *v48 = v19;
    v9 = &off_21AD26000;

    _os_log_impl(&dword_21ACD4000, v7, v8, "[%s]: session failed with %@", (uint8_t *)v12, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_255117958);
    swift_arrayDestroy();
    MEMORY[0x220756ED0](v48, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x220756ED0](v50, -1, -1);
    MEMORY[0x220756ED0](v12, -1, -1);

  }
  else
  {
    v20 = *(void **)(v0 + 128);

  }
  v21 = *(void **)(v0 + 128);
  (*(void (**)(_QWORD, _QWORD, _QWORD))(v0 + 392))(*(_QWORD *)(v0 + 360), *(_QWORD *)(v0 + 136), *(_QWORD *)(v0 + 344));
  v22 = v21;
  v23 = sub_21AD23EE0();
  v24 = sub_21AD2406C();
  v25 = os_log_type_enabled(v23, v24);
  v26 = *(_QWORD *)(v0 + 360);
  v27 = *(_QWORD *)(v0 + 344);
  v28 = *(void **)(v0 + 128);
  if (v25)
  {
    v49 = *(void (**)(uint64_t, uint64_t))(v0 + 400);
    v29 = swift_slowAlloc();
    v47 = swift_slowAlloc();
    v51 = v47;
    *(_DWORD *)v29 = *((_QWORD *)v9 + 418);
    v46 = v27;
    v30 = v28;
    v31 = objc_msgSend(v30, *((SEL *)p_align + 367));
    v32 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
    v34 = v33;

    *(_QWORD *)(v0 + 56) = sub_21ACF58B4(v32, v34, &v51);
    sub_21AD240CC();
    swift_bridgeObjectRelease();

    *(_WORD *)(v29 + 12) = 2080;
    v35 = AccessibilitySoundRecognition.DetectorIdentifier.description.getter();
    *(_QWORD *)(v0 + 64) = sub_21ACF58B4(v35, v36, &v51);
    sub_21AD240CC();
    swift_bridgeObjectRelease();
    v49(v26, v46);
    _os_log_impl(&dword_21ACD4000, v23, v24, "[%s]: Restarting sound recogntion task for identifier: %s.", (uint8_t *)v29, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x220756ED0](v47, -1, -1);
    v37 = v29;
    v38 = (_QWORD *)(v0 + 400);
    MEMORY[0x220756ED0](v37, -1, -1);
  }
  else
  {
    v38 = (_QWORD *)(v0 + 408);
    v39 = *(void (**)(uint64_t, uint64_t))(v0 + 408);

    v39(v26, v27);
  }

  *(_QWORD *)(v0 + 472) = *v38;
  v41 = *(_QWORD *)(v0 + 160);
  v40 = *(_QWORD *)(v0 + 168);
  v42 = *(_QWORD *)(v0 + 152);
  sub_21AD241EC();
  *(_OWORD *)(v0 + 40) = xmmword_21AD271C0;
  *(_QWORD *)(v0 + 24) = 0;
  *(_QWORD *)(v0 + 16) = 0;
  *(_BYTE *)(v0 + 32) = 1;
  sub_21ACF7DA4(&qword_255117EF0, (uint64_t (*)(uint64_t))MEMORY[0x24BEE6E10], MEMORY[0x24BEE6E20]);
  sub_21AD242A0();
  sub_21ACF7DA4(&qword_255117EF8, (uint64_t (*)(uint64_t))MEMORY[0x24BEE6DC8], MEMORY[0x24BEE6E00]);
  sub_21AD24204();
  v43 = *(void (**)(uint64_t, uint64_t))(v41 + 8);
  *(_QWORD *)(v0 + 480) = v43;
  v43(v40, v42);
  v44 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 488) = v44;
  *v44 = v0;
  v44[1] = sub_21AD11894;
  return sub_21AD242AC();
}

uint64_t sub_21AD122C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v7[14] = a6;
  v7[15] = a7;
  v7[12] = a4;
  v7[13] = a5;
  v8 = sub_21AD241E0();
  v7[16] = v8;
  v7[17] = *(_QWORD *)(v8 - 8);
  v7[18] = swift_task_alloc();
  v7[19] = swift_task_alloc();
  v9 = sub_21AD241F8();
  v7[20] = v9;
  v7[21] = *(_QWORD *)(v9 - 8);
  v7[22] = swift_task_alloc();
  v10 = sub_21AD23E68();
  v7[23] = v10;
  v7[24] = *(_QWORD *)(v10 - 8);
  v7[25] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255118150);
  v7[26] = swift_task_alloc();
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_255118158);
  v7[27] = v11;
  v7[28] = *(_QWORD *)(v11 - 8);
  v7[29] = swift_task_alloc();
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_255118160);
  v7[30] = v12;
  v7[31] = *(_QWORD *)(v12 - 8);
  v7[32] = swift_task_alloc();
  v13 = sub_21AD23E5C();
  v7[33] = v13;
  v7[34] = *(_QWORD *)(v13 - 8);
  v7[35] = swift_task_alloc();
  v14 = sub_21AD23D9C();
  v7[36] = v14;
  v7[37] = *(_QWORD *)(v14 - 8);
  v7[38] = swift_task_alloc();
  v15 = sub_21AD23E44();
  v7[39] = v15;
  v7[40] = *(_QWORD *)(v15 - 8);
  v7[41] = swift_task_alloc();
  v7[42] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_21AD12490()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  id v4;
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  id v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v24;
  void (*v25)(_QWORD, _QWORD, uint64_t);
  void *v26;
  id v27;
  NSObject *v28;
  os_log_type_t v29;
  _BOOL4 v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  id v36;
  id v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t v41;
  unint64_t v42;
  void (*isa)(uint64_t, uint64_t);
  _QWORD *v44;
  uint64_t v45;
  os_log_type_t type;
  os_log_t log;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50[2];

  if (qword_2551178E8 != -1)
    swift_once();
  v1 = *(void **)(v0 + 96);
  v2 = *(void **)(v0 + 104);
  v3 = sub_21AD23EEC();
  *(_QWORD *)(v0 + 344) = __swift_project_value_buffer(v3, (uint64_t)qword_2551180D0);
  v4 = v1;
  v5 = v2;
  v6 = v4;
  v7 = v5;
  v8 = sub_21AD23EE0();
  v9 = sub_21AD2406C();
  v10 = os_log_type_enabled(v8, v9);
  v12 = *(void **)(v0 + 96);
  v11 = *(void **)(v0 + 104);
  if (v10)
  {
    v13 = swift_slowAlloc();
    v48 = swift_slowAlloc();
    v50[0] = v48;
    *(_DWORD *)v13 = 136315394;
    v14 = v12;
    v15 = objc_msgSend(v14, sel_description);
    v16 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
    v18 = v17;

    *(_QWORD *)(v0 + 80) = sub_21ACF58B4(v16, v18, v50);
    sub_21AD240CC();
    swift_bridgeObjectRelease();

    *(_WORD *)(v13 + 12) = 2080;
    v19 = objc_msgSend(v11, sel_identifier);
    v20 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
    v22 = v21;

    *(_QWORD *)(v0 + 88) = sub_21ACF58B4(v20, v22, v50);
    sub_21AD240CC();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_21ACD4000, v8, v9, "[%s]: Starting custom sound recogntion task for identifier: %s.", (uint8_t *)v13, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x220756ED0](v48, -1, -1);
    MEMORY[0x220756ED0](v13, -1, -1);
  }
  else
  {

  }
  if ((sub_21AD24018() & 1) != 0)
  {
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    v24 = *(_QWORD *)(v0 + 288);
    v25 = *(void (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(v0 + 296) + 16);
    *(_QWORD *)(v0 + 352) = v25;
    v25(*(_QWORD *)(v0 + 304), *(_QWORD *)(v0 + 112), v24);
    sub_21AD23E2C();
    v26 = *(void **)(v0 + 96);
    (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v0 + 320) + 16))(*(_QWORD *)(v0 + 328), *(_QWORD *)(v0 + 336), *(_QWORD *)(v0 + 312));
    v27 = v26;
    v28 = sub_21AD23EE0();
    v29 = sub_21AD2406C();
    v30 = os_log_type_enabled(v28, v29);
    v32 = *(_QWORD *)(v0 + 320);
    v31 = *(_QWORD *)(v0 + 328);
    v33 = *(_QWORD *)(v0 + 312);
    v34 = *(void **)(v0 + 96);
    if (v30)
    {
      log = *(os_log_t *)(v0 + 320);
      v35 = swift_slowAlloc();
      v49 = swift_slowAlloc();
      v50[0] = v49;
      *(_DWORD *)v35 = 136315394;
      v36 = v34;
      v45 = v31;
      v37 = objc_msgSend(v36, sel_description);
      type = v29;
      v38 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
      v40 = v39;

      *(_QWORD *)(v0 + 64) = sub_21ACF58B4(v38, v40, v50);
      sub_21AD240CC();
      swift_bridgeObjectRelease();

      *(_WORD *)(v35 + 12) = 2080;
      sub_21ACF7DA4(&qword_255118170, (uint64_t (*)(uint64_t))MEMORY[0x24BDE9A10], MEMORY[0x24BDE9A18]);
      v41 = sub_21AD24270();
      *(_QWORD *)(v0 + 72) = sub_21ACF58B4(v41, v42, v50);
      sub_21AD240CC();
      swift_bridgeObjectRelease();
      isa = (void (*)(uint64_t, uint64_t))log[1].isa;
      isa(v45, v33);
      _os_log_impl(&dword_21ACD4000, v28, type, "[%s]: running request %s", (uint8_t *)v35, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x220756ED0](v49, -1, -1);
      MEMORY[0x220756ED0](v35, -1, -1);
    }
    else
    {

      isa = *(void (**)(uint64_t, uint64_t))(v32 + 8);
      isa(v31, v33);
    }

    *(_QWORD *)(v0 + 360) = isa;
    v44 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 368) = v44;
    *v44 = v0;
    v44[1] = sub_21AD12E80;
    return sub_21AD23EC8();
  }
}

uint64_t sub_21AD12E80()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 376) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_21AD12EE4()
{
  uint64_t v0;
  _QWORD *v1;

  sub_21AD23E50();
  sub_21AD23EBC();
  *(_QWORD *)(v0 + 384) = sub_21AD19568();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 392) = v1;
  *v1 = v0;
  v1[1] = sub_21AD12F74;
  return sub_21AD23FE8();
}

uint64_t sub_21AD12F74()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  swift_task_dealloc();
  if (v0)
    *(_QWORD *)(v2 + 400) = v0;
  return swift_task_switch();
}

uint64_t sub_21AD12FD8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void (*v4)(uint64_t, uint64_t);
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  os_log_type_t v19;
  BOOL v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  id v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  id v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD *v36;
  _QWORD *v37;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void (*v42)(uint64_t, uint64_t);
  _QWORD *v43;
  uint64_t v44;

  v1 = *(_QWORD *)(v0 + 208);
  v2 = *(_QWORD *)(v0 + 184);
  v3 = *(_QWORD *)(v0 + 192);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v1, 1, v2) == 1)
  {
    v4 = *(void (**)(uint64_t, uint64_t))(v0 + 360);
    v5 = *(_QWORD *)(v0 + 336);
    v6 = *(_QWORD *)(v0 + 312);
    v8 = *(_QWORD *)(v0 + 272);
    v7 = *(_QWORD *)(v0 + 280);
    v10 = *(_QWORD *)(v0 + 256);
    v9 = *(_QWORD *)(v0 + 264);
    v11 = *(_QWORD *)(v0 + 240);
    v12 = *(_QWORD *)(v0 + 248);
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 224) + 8))(*(_QWORD *)(v0 + 232), *(_QWORD *)(v0 + 216));
    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v10, v11);
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v7, v9);
    v4(v5, v6);
    v13 = *(void **)(v0 + 104);
    v14 = *(id *)(v0 + 96);
    v15 = v13;
    v16 = v14;
    v17 = v15;
    v18 = sub_21AD23EE0();
    v19 = sub_21AD2406C();
    v20 = os_log_type_enabled(v18, v19);
    v22 = *(void **)(v0 + 96);
    v21 = *(void **)(v0 + 104);
    if (v20)
    {
      v23 = swift_slowAlloc();
      v24 = swift_slowAlloc();
      v44 = v24;
      *(_DWORD *)v23 = 136315394;
      v25 = v22;
      v26 = objc_msgSend(v25, sel_description, v44);
      v27 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
      v29 = v28;

      *(_QWORD *)(v23 + 4) = sub_21ACF58B4(v27, v29, &v44);
      swift_bridgeObjectRelease();

      *(_WORD *)(v23 + 12) = 2080;
      v30 = objc_msgSend(v21, sel_identifier);
      v31 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
      v33 = v32;

      *(_QWORD *)(v23 + 14) = sub_21ACF58B4(v31, v33, &v44);
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_21ACD4000, v18, v19, "[%s]: Restarting custom sound recogntion task for identifier: %s.", (uint8_t *)v23, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x220756ED0](v24, -1, -1);
      MEMORY[0x220756ED0](v23, -1, -1);
    }
    else
    {

    }
    v40 = *(_QWORD *)(v0 + 136);
    v39 = *(_QWORD *)(v0 + 144);
    v41 = *(_QWORD *)(v0 + 128);
    sub_21AD241EC();
    *(_OWORD *)(v0 + 40) = xmmword_21AD271C0;
    *(_QWORD *)(v0 + 24) = 0;
    *(_QWORD *)(v0 + 16) = 0;
    *(_BYTE *)(v0 + 32) = 1;
    sub_21ACF7DA4(&qword_255117EF0, (uint64_t (*)(uint64_t))MEMORY[0x24BEE6E10], MEMORY[0x24BEE6E20]);
    sub_21AD242A0();
    sub_21ACF7DA4(&qword_255117EF8, (uint64_t (*)(uint64_t))MEMORY[0x24BEE6DC8], MEMORY[0x24BEE6E00]);
    sub_21AD24204();
    v42 = *(void (**)(uint64_t, uint64_t))(v40 + 8);
    *(_QWORD *)(v0 + 416) = v42;
    v42(v39, v41);
    v43 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 424) = v43;
    *v43 = v0;
    v43[1] = sub_21AD13970;
    return sub_21AD242AC();
  }
  else
  {
    v34 = *(_QWORD *)(v0 + 200);
    v35 = *(_QWORD *)(v0 + 120);
    v36 = *(_QWORD **)(v0 + 96);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 32))(v34, v1, v2);
    (*(void (**)(uint64_t, uint64_t))((*MEMORY[0x24BEE4EA0] & *v36) + 0x140))(v34, v35);
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v34, v2);
    v37 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 408) = v37;
    *v37 = v0;
    v37[1] = sub_21AD1390C;
    return sub_21AD23FE8();
  }
}

uint64_t sub_21AD133C0()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 56) = *(_QWORD *)(v0 + 400);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255117930);
  swift_willThrowTypedImpl();
  return swift_task_switch();
}

uint64_t sub_21AD13420()
{
  uint64_t v0;
  void (*v1)(uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  os_log_type_t v16;
  BOOL v17;
  void *v18;
  char *__ptr32 *v19;
  uint32_t *p_align;
  uint64_t v21;
  _QWORD *v22;
  id v23;
  id v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  id v28;
  uint64_t v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  id v34;
  NSObject *v35;
  os_log_type_t v36;
  _BOOL4 v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  id v43;
  uint64_t v44;
  unint64_t v45;
  unint64_t v46;
  id v47;
  uint64_t v48;
  unint64_t v49;
  unint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void (*v54)(uint64_t, uint64_t);
  _QWORD *v55;
  uint64_t v57;
  uint64_t v58;

  v1 = *(void (**)(uint64_t, uint64_t))(v0 + 360);
  v2 = *(_QWORD *)(v0 + 336);
  v3 = *(_QWORD *)(v0 + 312);
  v5 = *(_QWORD *)(v0 + 272);
  v4 = *(_QWORD *)(v0 + 280);
  v7 = *(_QWORD *)(v0 + 256);
  v6 = *(_QWORD *)(v0 + 264);
  v8 = *(_QWORD *)(v0 + 240);
  v9 = *(_QWORD *)(v0 + 248);
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 224) + 8))(*(_QWORD *)(v0 + 232), *(_QWORD *)(v0 + 216));
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v7, v8);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  v1(v2, v3);
  v10 = *(void **)(v0 + 400);
  v11 = *(id *)(v0 + 96);
  v12 = v10;
  v13 = v11;
  v14 = v10;
  v15 = sub_21AD23EE0();
  v16 = sub_21AD2406C();
  v17 = os_log_type_enabled(v15, v16);
  v18 = *(void **)(v0 + 96);
  v19 = &off_21AD26000;
  p_align = &stru_24DDFCFE8.align;
  if (v17)
  {
    v21 = swift_slowAlloc();
    v22 = (_QWORD *)swift_slowAlloc();
    v57 = swift_slowAlloc();
    v58 = v57;
    *(_DWORD *)v21 = 136315394;
    v23 = v18;
    v24 = objc_msgSend(v23, sel_description);
    v25 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
    v27 = v26;

    p_align = (_DWORD *)(&stru_24DDFCFE8 + 24);
    *(_QWORD *)(v21 + 4) = sub_21ACF58B4(v25, v27, &v58);
    swift_bridgeObjectRelease();

    v19 = &off_21AD26000;
    *(_WORD *)(v21 + 12) = 2112;
    v28 = v10;
    v29 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v21 + 14) = v29;
    *v22 = v29;

    _os_log_impl(&dword_21ACD4000, v15, v16, "[%s]: session failed with %@", (uint8_t *)v21, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_255117958);
    swift_arrayDestroy();
    MEMORY[0x220756ED0](v22, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x220756ED0](v57, -1, -1);
    MEMORY[0x220756ED0](v21, -1, -1);

  }
  else
  {

  }
  v30 = *(void **)(v0 + 104);
  v31 = *(id *)(v0 + 96);
  v32 = v30;
  v33 = v31;
  v34 = v32;
  v35 = sub_21AD23EE0();
  v36 = sub_21AD2406C();
  v37 = os_log_type_enabled(v35, v36);
  v39 = *(void **)(v0 + 96);
  v38 = *(void **)(v0 + 104);
  if (v37)
  {
    v40 = swift_slowAlloc();
    v41 = swift_slowAlloc();
    v58 = v41;
    *(_DWORD *)v40 = *((_QWORD *)v19 + 418);
    v42 = v39;
    v43 = objc_msgSend(v42, *((SEL *)p_align + 367));
    v44 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
    v46 = v45;

    *(_QWORD *)(v40 + 4) = sub_21ACF58B4(v44, v46, &v58);
    swift_bridgeObjectRelease();

    *(_WORD *)(v40 + 12) = 2080;
    v47 = objc_msgSend(v38, sel_identifier);
    v48 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
    v50 = v49;

    *(_QWORD *)(v40 + 14) = sub_21ACF58B4(v48, v50, &v58);
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_21ACD4000, v35, v36, "[%s]: Restarting custom sound recogntion task for identifier: %s.", (uint8_t *)v40, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x220756ED0](v41, -1, -1);
    MEMORY[0x220756ED0](v40, -1, -1);
  }
  else
  {

  }
  v52 = *(_QWORD *)(v0 + 136);
  v51 = *(_QWORD *)(v0 + 144);
  v53 = *(_QWORD *)(v0 + 128);
  sub_21AD241EC();
  *(_OWORD *)(v0 + 40) = xmmword_21AD271C0;
  *(_QWORD *)(v0 + 24) = 0;
  *(_QWORD *)(v0 + 16) = 0;
  *(_BYTE *)(v0 + 32) = 1;
  sub_21ACF7DA4(&qword_255117EF0, (uint64_t (*)(uint64_t))MEMORY[0x24BEE6E10], MEMORY[0x24BEE6E20]);
  sub_21AD242A0();
  sub_21ACF7DA4(&qword_255117EF8, (uint64_t (*)(uint64_t))MEMORY[0x24BEE6DC8], MEMORY[0x24BEE6E00]);
  sub_21AD24204();
  v54 = *(void (**)(uint64_t, uint64_t))(v52 + 8);
  *(_QWORD *)(v0 + 416) = v54;
  v54(v51, v53);
  v55 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 424) = v55;
  *v55 = v0;
  v55[1] = sub_21AD13970;
  return sub_21AD242AC();
}

uint64_t sub_21AD1390C()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  swift_task_dealloc();
  if (v0)
    *(_QWORD *)(v2 + 400) = v0;
  return swift_task_switch();
}

uint64_t sub_21AD13970()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = *v1;
  *(_QWORD *)(*v1 + 432) = v0;
  swift_task_dealloc();
  if (v0)
  {
    (*(void (**)(_QWORD, _QWORD))(v2 + 416))(*(_QWORD *)(v2 + 152), *(_QWORD *)(v2 + 128));
  }
  else
  {
    v4 = *(_QWORD *)(v2 + 168);
    v3 = *(_QWORD *)(v2 + 176);
    v5 = *(_QWORD *)(v2 + 160);
    (*(void (**)(_QWORD, _QWORD))(v2 + 416))(*(_QWORD *)(v2 + 152), *(_QWORD *)(v2 + 128));
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  }
  return swift_task_switch();
}

uint64_t sub_21AD13A10()
{
  uint64_t v0;
  void *v2;
  id v3;
  id v4;
  id v5;
  id v6;
  NSObject *v7;
  os_log_type_t v8;
  _BOOL4 v9;
  void *v10;
  char *__ptr32 *v11;
  uint32_t *p_align;
  uint64_t v13;
  _QWORD *v14;
  id v15;
  id v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  id v20;
  uint64_t v21;
  void *v22;
  id v23;
  NSObject *v24;
  os_log_type_t v25;
  _BOOL4 v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  id v32;
  id v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  uint64_t v37;
  unint64_t v38;
  void (*v39)(uint64_t, uint64_t);
  void *v40;
  id v41;
  id v42;
  id v43;
  id v44;
  NSObject *v45;
  os_log_type_t v46;
  _BOOL4 v47;
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  id v52;
  id v53;
  uint64_t v54;
  unint64_t v55;
  unint64_t v56;
  id v57;
  uint64_t v58;
  unint64_t v59;
  unint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  void (*v64)(uint64_t, uint64_t);
  _QWORD *v65;
  _QWORD *v66;
  uint64_t v67;
  os_log_type_t type;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71[2];

  if ((sub_21AD24018() & 1) != 0)
  {
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    v2 = *(void **)(v0 + 432);
    (*(void (**)(_QWORD, _QWORD, _QWORD))(v0 + 352))(*(_QWORD *)(v0 + 304), *(_QWORD *)(v0 + 112), *(_QWORD *)(v0 + 288));
    sub_21AD23E2C();
    if (v2)
    {
      v3 = *(id *)(v0 + 96);
      v4 = v2;
      v5 = v3;
      v6 = v2;
      v7 = sub_21AD23EE0();
      v8 = sub_21AD2406C();
      v9 = os_log_type_enabled(v7, v8);
      v10 = *(void **)(v0 + 96);
      v11 = &off_21AD26000;
      p_align = &stru_24DDFCFE8.align;
      if (v9)
      {
        v13 = swift_slowAlloc();
        v14 = (_QWORD *)swift_slowAlloc();
        v69 = swift_slowAlloc();
        v71[0] = v69;
        *(_DWORD *)v13 = 136315394;
        v15 = v10;
        v16 = objc_msgSend(v15, sel_description);
        v17 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
        v19 = v18;

        p_align = (_DWORD *)(&stru_24DDFCFE8 + 24);
        *(_QWORD *)(v13 + 4) = sub_21ACF58B4(v17, v19, v71);
        swift_bridgeObjectRelease();

        v11 = &off_21AD26000;
        *(_WORD *)(v13 + 12) = 2112;
        v20 = v2;
        v21 = _swift_stdlib_bridgeErrorToNSError();
        *(_QWORD *)(v13 + 14) = v21;
        *v14 = v21;

        _os_log_impl(&dword_21ACD4000, v7, v8, "[%s]: session failed with %@", (uint8_t *)v13, 0x16u);
        __swift_instantiateConcreteTypeFromMangledName(&qword_255117958);
        swift_arrayDestroy();
        MEMORY[0x220756ED0](v14, -1, -1);
        swift_arrayDestroy();
        MEMORY[0x220756ED0](v69, -1, -1);
        MEMORY[0x220756ED0](v13, -1, -1);

      }
      else
      {

      }
      v40 = *(void **)(v0 + 104);
      v41 = *(id *)(v0 + 96);
      v42 = v40;
      v43 = v41;
      v44 = v42;
      v45 = sub_21AD23EE0();
      v46 = sub_21AD2406C();
      v47 = os_log_type_enabled(v45, v46);
      v49 = *(void **)(v0 + 96);
      v48 = *(void **)(v0 + 104);
      if (v47)
      {
        v50 = swift_slowAlloc();
        v51 = swift_slowAlloc();
        v71[0] = v51;
        *(_DWORD *)v50 = *((_QWORD *)v11 + 418);
        v52 = v49;
        v53 = objc_msgSend(v52, *((SEL *)p_align + 367));
        v54 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
        v56 = v55;

        *(_QWORD *)(v50 + 4) = sub_21ACF58B4(v54, v56, v71);
        swift_bridgeObjectRelease();

        *(_WORD *)(v50 + 12) = 2080;
        v57 = objc_msgSend(v48, sel_identifier);
        v58 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
        v60 = v59;

        *(_QWORD *)(v50 + 14) = sub_21ACF58B4(v58, v60, v71);
        swift_bridgeObjectRelease();

        _os_log_impl(&dword_21ACD4000, v45, v46, "[%s]: Restarting custom sound recogntion task for identifier: %s.", (uint8_t *)v50, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x220756ED0](v51, -1, -1);
        MEMORY[0x220756ED0](v50, -1, -1);
      }
      else
      {

      }
      v62 = *(_QWORD *)(v0 + 136);
      v61 = *(_QWORD *)(v0 + 144);
      v63 = *(_QWORD *)(v0 + 128);
      sub_21AD241EC();
      *(_OWORD *)(v0 + 40) = xmmword_21AD271C0;
      *(_QWORD *)(v0 + 24) = 0;
      *(_QWORD *)(v0 + 16) = 0;
      *(_BYTE *)(v0 + 32) = 1;
      sub_21ACF7DA4(&qword_255117EF0, (uint64_t (*)(uint64_t))MEMORY[0x24BEE6E10], MEMORY[0x24BEE6E20]);
      sub_21AD242A0();
      sub_21ACF7DA4(&qword_255117EF8, (uint64_t (*)(uint64_t))MEMORY[0x24BEE6DC8], MEMORY[0x24BEE6E00]);
      sub_21AD24204();
      v64 = *(void (**)(uint64_t, uint64_t))(v62 + 8);
      *(_QWORD *)(v0 + 416) = v64;
      v64(v61, v63);
      v65 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 424) = v65;
      *v65 = v0;
      v65[1] = sub_21AD13970;
      return sub_21AD242AC();
    }
    else
    {
      v22 = *(void **)(v0 + 96);
      (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v0 + 320) + 16))(*(_QWORD *)(v0 + 328), *(_QWORD *)(v0 + 336), *(_QWORD *)(v0 + 312));
      v23 = v22;
      v24 = sub_21AD23EE0();
      v25 = sub_21AD2406C();
      v26 = os_log_type_enabled(v24, v25);
      v28 = *(_QWORD *)(v0 + 320);
      v27 = *(_QWORD *)(v0 + 328);
      v29 = *(_QWORD *)(v0 + 312);
      v30 = *(void **)(v0 + 96);
      if (v26)
      {
        type = v25;
        v31 = swift_slowAlloc();
        v70 = swift_slowAlloc();
        v71[0] = v70;
        *(_DWORD *)v31 = 136315394;
        v32 = v30;
        v33 = objc_msgSend(v32, sel_description);
        v67 = v28;
        v34 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
        v36 = v35;

        *(_QWORD *)(v0 + 64) = sub_21ACF58B4(v34, v36, v71);
        sub_21AD240CC();
        swift_bridgeObjectRelease();

        *(_WORD *)(v31 + 12) = 2080;
        sub_21ACF7DA4(&qword_255118170, (uint64_t (*)(uint64_t))MEMORY[0x24BDE9A10], MEMORY[0x24BDE9A18]);
        v37 = sub_21AD24270();
        *(_QWORD *)(v0 + 72) = sub_21ACF58B4(v37, v38, v71);
        sub_21AD240CC();
        swift_bridgeObjectRelease();
        v39 = *(void (**)(uint64_t, uint64_t))(v67 + 8);
        v39(v27, v29);
        _os_log_impl(&dword_21ACD4000, v24, type, "[%s]: running request %s", (uint8_t *)v31, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x220756ED0](v70, -1, -1);
        MEMORY[0x220756ED0](v31, -1, -1);
      }
      else
      {

        v39 = *(void (**)(uint64_t, uint64_t))(v28 + 8);
        v39(v27, v29);
      }

      *(_QWORD *)(v0 + 360) = v39;
      v66 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 368) = v66;
      *v66 = v0;
      v66[1] = sub_21AD12E80;
      return sub_21AD23EC8();
    }
  }
}

uint64_t sub_21AD141C4()
{
  uint64_t v0;

  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 168) + 8))(*(_QWORD *)(v0 + 176), *(_QWORD *)(v0 + 160));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_21AD1429C()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  id v4;
  id v5;
  NSObject *v6;
  os_log_type_t v7;
  BOOL v8;
  void *v9;
  char *__ptr32 *v10;
  uint32_t *p_align;
  uint64_t v12;
  _QWORD *v13;
  id v14;
  id v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  id v19;
  uint64_t v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  NSObject *v26;
  os_log_type_t v27;
  _BOOL4 v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  id v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  id v38;
  uint64_t v39;
  unint64_t v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void (*v45)(uint64_t, uint64_t);
  _QWORD *v46;
  uint64_t v48;
  uint64_t v49;

  (*(void (**)(_QWORD, _QWORD))(v0 + 360))(*(_QWORD *)(v0 + 336), *(_QWORD *)(v0 + 312));
  v1 = *(void **)(v0 + 376);
  v2 = *(id *)(v0 + 96);
  v3 = v1;
  v4 = v2;
  v5 = v1;
  v6 = sub_21AD23EE0();
  v7 = sub_21AD2406C();
  v8 = os_log_type_enabled(v6, v7);
  v9 = *(void **)(v0 + 96);
  v10 = &off_21AD26000;
  p_align = &stru_24DDFCFE8.align;
  if (v8)
  {
    v12 = swift_slowAlloc();
    v13 = (_QWORD *)swift_slowAlloc();
    v48 = swift_slowAlloc();
    v49 = v48;
    *(_DWORD *)v12 = 136315394;
    v14 = v9;
    v15 = objc_msgSend(v14, sel_description);
    v16 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
    v18 = v17;

    p_align = (_DWORD *)(&stru_24DDFCFE8 + 24);
    *(_QWORD *)(v12 + 4) = sub_21ACF58B4(v16, v18, &v49);
    swift_bridgeObjectRelease();

    v10 = &off_21AD26000;
    *(_WORD *)(v12 + 12) = 2112;
    v19 = v1;
    v20 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v12 + 14) = v20;
    *v13 = v20;

    _os_log_impl(&dword_21ACD4000, v6, v7, "[%s]: session failed with %@", (uint8_t *)v12, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_255117958);
    swift_arrayDestroy();
    MEMORY[0x220756ED0](v13, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x220756ED0](v48, -1, -1);
    MEMORY[0x220756ED0](v12, -1, -1);

  }
  else
  {

  }
  v21 = *(void **)(v0 + 104);
  v22 = *(id *)(v0 + 96);
  v23 = v21;
  v24 = v22;
  v25 = v23;
  v26 = sub_21AD23EE0();
  v27 = sub_21AD2406C();
  v28 = os_log_type_enabled(v26, v27);
  v30 = *(void **)(v0 + 96);
  v29 = *(void **)(v0 + 104);
  if (v28)
  {
    v31 = swift_slowAlloc();
    v32 = swift_slowAlloc();
    v49 = v32;
    *(_DWORD *)v31 = *((_QWORD *)v10 + 418);
    v33 = v30;
    v34 = objc_msgSend(v33, *((SEL *)p_align + 367));
    v35 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
    v37 = v36;

    *(_QWORD *)(v31 + 4) = sub_21ACF58B4(v35, v37, &v49);
    swift_bridgeObjectRelease();

    *(_WORD *)(v31 + 12) = 2080;
    v38 = objc_msgSend(v29, sel_identifier);
    v39 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
    v41 = v40;

    *(_QWORD *)(v31 + 14) = sub_21ACF58B4(v39, v41, &v49);
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_21ACD4000, v26, v27, "[%s]: Restarting custom sound recogntion task for identifier: %s.", (uint8_t *)v31, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x220756ED0](v32, -1, -1);
    MEMORY[0x220756ED0](v31, -1, -1);
  }
  else
  {

  }
  v43 = *(_QWORD *)(v0 + 136);
  v42 = *(_QWORD *)(v0 + 144);
  v44 = *(_QWORD *)(v0 + 128);
  sub_21AD241EC();
  *(_OWORD *)(v0 + 40) = xmmword_21AD271C0;
  *(_QWORD *)(v0 + 24) = 0;
  *(_QWORD *)(v0 + 16) = 0;
  *(_BYTE *)(v0 + 32) = 1;
  sub_21ACF7DA4(&qword_255117EF0, (uint64_t (*)(uint64_t))MEMORY[0x24BEE6E10], MEMORY[0x24BEE6E20]);
  sub_21AD242A0();
  sub_21ACF7DA4(&qword_255117EF8, (uint64_t (*)(uint64_t))MEMORY[0x24BEE6DC8], MEMORY[0x24BEE6E00]);
  sub_21AD24204();
  v45 = *(void (**)(uint64_t, uint64_t))(v43 + 8);
  *(_QWORD *)(v0 + 416) = v45;
  v45(v42, v44);
  v46 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 424) = v46;
  *v46 = v0;
  v46[1] = sub_21AD13970;
  return sub_21AD242AC();
}

void sub_21AD14744(uint64_t a1, uint64_t a2)
{
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  int64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  id v22;
  char v23;
  uint64_t v24;
  id v25;
  char v26;
  uint64_t v27;
  int64_t v28;
  int64_t v29;

  v4 = a2 & 0xC000000000000001;
  if ((a1 & 0xC000000000000001) != 0)
  {
    if (a1 < 0)
      v5 = a1;
    else
      v5 = a1 & 0xFFFFFFFFFFFFFF8;
    if (v4)
    {
      sub_21AD2412C();
      return;
    }
    v6 = v5;
    v7 = a2;
    goto LABEL_13;
  }
  if (v4)
  {
    if (a2 < 0)
      v6 = a2;
    else
      v6 = a2 & 0xFFFFFFFFFFFFFF8;
    v7 = a1;
LABEL_13:
    sub_21AD17D58(v6, v7);
    return;
  }
  if (a1 == a2 || *(_QWORD *)(a1 + 16) != *(_QWORD *)(a2 + 16))
    return;
  v27 = a1 + 56;
  v8 = 1 << *(_BYTE *)(a1 + 32);
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(a1 + 56);
  sub_21AD19700();
  v11 = 0;
  v28 = (unint64_t)(v8 + 63) >> 6;
  v12 = a2 + 56;
  while (1)
  {
    if (v10)
    {
      v13 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v14 = v13 | (v11 << 6);
      goto LABEL_39;
    }
    v15 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_49;
    }
    if (v15 >= v28)
      return;
    v16 = *(_QWORD *)(v27 + 8 * v15);
    ++v11;
    if (!v16)
    {
      v11 = v15 + 1;
      if (v15 + 1 >= v28)
        return;
      v16 = *(_QWORD *)(v27 + 8 * v11);
      if (!v16)
      {
        v11 = v15 + 2;
        if (v15 + 2 >= v28)
          return;
        v16 = *(_QWORD *)(v27 + 8 * v11);
        if (!v16)
        {
          v11 = v15 + 3;
          if (v15 + 3 >= v28)
            return;
          v16 = *(_QWORD *)(v27 + 8 * v11);
          if (!v16)
            break;
        }
      }
    }
LABEL_38:
    v10 = (v16 - 1) & v16;
    v14 = __clz(__rbit64(v16)) + (v11 << 6);
LABEL_39:
    v18 = *(id *)(*(_QWORD *)(a1 + 48) + 8 * v14);
    v19 = sub_21AD240B4();
    v20 = -1 << *(_BYTE *)(a2 + 32);
    v21 = v19 & ~v20;
    if (((*(_QWORD *)(v12 + ((v21 >> 3) & 0xFFFFFFFFFFFFF8)) >> v21) & 1) == 0)
      goto LABEL_46;
    v29 = v11;
    v22 = *(id *)(*(_QWORD *)(a2 + 48) + 8 * v21);
    v23 = sub_21AD240C0();

    if ((v23 & 1) == 0)
    {
      v24 = ~v20;
      while (1)
      {
        v21 = (v21 + 1) & v24;
        if (((*(_QWORD *)(v12 + ((v21 >> 3) & 0xFFFFFFFFFFFFF8)) >> v21) & 1) == 0)
          break;
        v25 = *(id *)(*(_QWORD *)(a2 + 48) + 8 * v21);
        v26 = sub_21AD240C0();

        if ((v26 & 1) != 0)
          goto LABEL_20;
      }
LABEL_46:

      return;
    }
LABEL_20:

    v11 = v29;
  }
  v17 = v15 + 4;
  if (v17 >= v28)
    return;
  v16 = *(_QWORD *)(v27 + 8 * v17);
  if (v16)
  {
    v11 = v17;
    goto LABEL_38;
  }
  while (1)
  {
    v11 = v17 + 1;
    if (__OFADD__(v17, 1))
      break;
    if (v11 >= v28)
      return;
    v16 = *(_QWORD *)(v27 + 8 * v11);
    ++v17;
    if (v16)
      goto LABEL_38;
  }
LABEL_49:
  __break(1u);
}

uint64_t AccessibilitySoundRecognition.DetectorIdentifier.identifier.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  void (*v21)(char *, uint64_t, uint64_t);
  int v22;
  id v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(char *, uint64_t, uint64_t);
  char *v29;
  uint64_t v30;
  char *v31;
  NSObject *v32;
  os_log_type_t v33;
  int v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  void (*v40)(uint64_t, char *, uint64_t);
  void (*v41)(char *, uint64_t);
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  void (*v45)(char *, uint64_t);
  uint64_t v47;
  os_log_t v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  void (*v52)(char *, uint64_t, uint64_t);
  char *v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;

  v50 = sub_21AD23E08();
  v1 = *(_QWORD *)(v50 - 8);
  MEMORY[0x24BDAC7A8](v50);
  v3 = (char *)&v47 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_21AD23E20();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v47 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v47 - v9;
  v11 = sub_21AD23E14();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = MEMORY[0x24BDAC7A8](v11);
  v49 = (char *)&v47 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = MEMORY[0x24BDAC7A8](v13);
  v54 = (char *)&v47 - v16;
  v17 = MEMORY[0x24BDAC7A8](v15);
  v53 = (char *)&v47 - v18;
  MEMORY[0x24BDAC7A8](v17);
  v20 = (char *)&v47 - v19;
  v21 = *(void (**)(char *, uint64_t, uint64_t))(v12 + 16);
  v51 = v0;
  v52 = v21;
  v21((char *)&v47 - v19, v0, v11);
  v22 = (*(uint64_t (**)(char *, uint64_t))(v12 + 88))(v20, v11);
  if (v22 == *MEMORY[0x24BDE9950])
  {
    (*(void (**)(char *, uint64_t))(v12 + 96))(v20, v11);
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v10, v20, v4);
    (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v8, v10, v4);
    v23 = AccessibilitySoundRecognition.BuiltInDetectorIdentifier.listenType.getter();
    if (v23)
    {
      v24 = v23;
      v25 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();

    }
    else
    {
      v25 = 0x6E776F6E6B6E55;
    }
    v45 = *(void (**)(char *, uint64_t))(v5 + 8);
    v45(v8, v4);
    v45(v10, v4);
  }
  else if (v22 == *MEMORY[0x24BDE9948])
  {
    (*(void (**)(char *, uint64_t))(v12 + 96))(v20, v11);
    v26 = v50;
    (*(void (**)(char *, char *, uint64_t))(v1 + 32))(v3, v20, v50);
    v25 = sub_21AD23DF0();
    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v26);
  }
  else
  {
    if (qword_2551178E0 != -1)
      swift_once();
    v27 = sub_21AD23EEC();
    __swift_project_value_buffer(v27, (uint64_t)qword_2551180B8);
    v28 = v52;
    v29 = v53;
    v30 = v51;
    v52(v53, v51, v11);
    v31 = v54;
    v28(v54, v30, v11);
    v32 = sub_21AD23EE0();
    v33 = sub_21AD24060();
    v34 = v33;
    if (os_log_type_enabled(v32, v33))
    {
      v35 = swift_slowAlloc();
      LODWORD(v50) = v34;
      v36 = v35;
      v51 = swift_slowAlloc();
      v56 = v51;
      *(_DWORD *)v36 = 136315394;
      v47 = v36 + 4;
      v48 = v32;
      v37 = (uint64_t)v49;
      v28(v49, (uint64_t)v29, v11);
      v38 = sub_21AD0D2FC(v37);
      v55 = sub_21ACF58B4(v38, v39, &v56);
      sub_21AD240CC();
      swift_bridgeObjectRelease();
      v40 = (void (*)(uint64_t, char *, uint64_t))v28;
      v41 = *(void (**)(char *, uint64_t))(v12 + 8);
      v41(v29, v11);
      *(_WORD *)(v36 + 12) = 2080;
      v40(v37, v31, v11);
      v42 = sub_21AD0D2FC(v37);
      v55 = sub_21ACF58B4(v42, v43, &v56);
      sub_21AD240CC();
      swift_bridgeObjectRelease();
      v41(v31, v11);
      v32 = v48;
      _os_log_impl(&dword_21ACD4000, v48, (os_log_type_t)v50, "[%s]: FATAL ERROR - DetectorIdentifier: %s, is unknown and not handled.", (uint8_t *)v36, 0x16u);
      v44 = v51;
      swift_arrayDestroy();
      MEMORY[0x220756ED0](v44, -1, -1);
      MEMORY[0x220756ED0](v36, -1, -1);
    }
    else
    {
      v41 = *(void (**)(char *, uint64_t))(v12 + 8);
      v41(v29, v11);
      v41(v31, v11);
    }

    v41(v20, v11);
    return 0;
  }
  return v25;
}

uint64_t AccessibilitySoundRecognition.DetectorIdentifier.description.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  int v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v19;

  v1 = v0;
  v2 = sub_21AD23E08();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_21AD23E20();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_21AD23E14();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v13, v1, v10);
  v14 = (*(uint64_t (**)(char *, uint64_t))(v11 + 88))(v13, v10);
  if (v14 == *MEMORY[0x24BDE9950])
  {
    (*(void (**)(char *, uint64_t))(v11 + 96))(v13, v10);
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v9, v13, v6);
    v15 = AccessibilitySoundRecognition.BuiltInDetectorIdentifier.listenType.getter();
    if (v15)
    {
      v16 = v15;
      v17 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();

    }
    else
    {
      v17 = 0x6E776F6E6B6E55;
    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
  else if (v14 == *MEMORY[0x24BDE9948])
  {
    (*(void (**)(char *, uint64_t))(v11 + 96))(v13, v10);
    (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v5, v13, v2);
    v17 = sub_21AD23DFC();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  else
  {
    v17 = 0x6E776F6E6B6E55;
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  }
  return v17;
}

uint64_t sub_21AD15118(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  char v9;
  unint64_t v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_255117A48);
    v2 = sub_21AD24168();
    v14 = v2;
    sub_21AD24108();
    if (sub_21AD24138())
    {
      sub_21AD19700();
      do
      {
        swift_dynamicCast();
        v2 = v14;
        if (*(_QWORD *)(v14 + 24) <= *(_QWORD *)(v14 + 16))
        {
          sub_21AD155D8();
          v2 = v14;
        }
        result = sub_21AD240B4();
        v4 = v2 + 56;
        v5 = -1 << *(_BYTE *)(v2 + 32);
        v6 = result & ~v5;
        v7 = v6 >> 6;
        if (((-1 << v6) & ~*(_QWORD *)(v2 + 56 + 8 * (v6 >> 6))) != 0)
        {
          v8 = __clz(__rbit64((-1 << v6) & ~*(_QWORD *)(v2 + 56 + 8 * (v6 >> 6)))) | v6 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          v9 = 0;
          v10 = (unint64_t)(63 - v5) >> 6;
          do
          {
            if (++v7 == v10 && (v9 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            v11 = v7 == v10;
            if (v7 == v10)
              v7 = 0;
            v9 |= v11;
            v12 = *(_QWORD *)(v4 + 8 * v7);
          }
          while (v12 == -1);
          v8 = __clz(__rbit64(~v12)) + (v7 << 6);
        }
        *(_QWORD *)(v4 + ((v8 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v8;
        *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v8) = v13;
        ++*(_QWORD *)(v2 + 16);
      }
      while (sub_21AD24138());
    }
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    return MEMORY[0x24BEE4B08];
  }
  return v2;
}

uint64_t sub_21AD152FC()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t result;
  int64_t v11;
  unint64_t v12;
  _QWORD *v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255117A58);
  v3 = sub_21AD2415C();
  v4 = v3;
  if (*(_QWORD *)(v2 + 16))
  {
    v5 = 1 << *(_BYTE *)(v2 + 32);
    v30 = (_QWORD *)(v2 + 56);
    if (v5 < 64)
      v6 = ~(-1 << v5);
    else
      v6 = -1;
    v7 = v6 & *(_QWORD *)(v2 + 56);
    v8 = (unint64_t)(v5 + 63) >> 6;
    v9 = v3 + 56;
    result = swift_retain();
    v11 = 0;
    while (1)
    {
      if (v7)
      {
        v14 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        v15 = v14 | (v11 << 6);
      }
      else
      {
        v16 = v11 + 1;
        if (__OFADD__(v11, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v8)
          goto LABEL_33;
        v17 = v30[v16];
        ++v11;
        if (!v17)
        {
          v11 = v16 + 1;
          if (v16 + 1 >= v8)
            goto LABEL_33;
          v17 = v30[v11];
          if (!v17)
          {
            v11 = v16 + 2;
            if (v16 + 2 >= v8)
              goto LABEL_33;
            v17 = v30[v11];
            if (!v17)
            {
              v18 = v16 + 3;
              if (v18 >= v8)
              {
LABEL_33:
                swift_release();
                v1 = v0;
                v29 = 1 << *(_BYTE *)(v2 + 32);
                if (v29 > 63)
                  bzero(v30, ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v30 = -1 << v29;
                *(_QWORD *)(v2 + 16) = 0;
                break;
              }
              v17 = v30[v18];
              if (!v17)
              {
                while (1)
                {
                  v11 = v18 + 1;
                  if (__OFADD__(v18, 1))
                    goto LABEL_39;
                  if (v11 >= v8)
                    goto LABEL_33;
                  v17 = v30[v11];
                  ++v18;
                  if (v17)
                    goto LABEL_23;
                }
              }
              v11 = v18;
            }
          }
        }
LABEL_23:
        v7 = (v17 - 1) & v17;
        v15 = __clz(__rbit64(v17)) + (v11 << 6);
      }
      v19 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
      v20 = *v19;
      v21 = v19[1];
      sub_21AD242E8();
      sub_21AD23F88();
      result = sub_21AD24300();
      v22 = -1 << *(_BYTE *)(v4 + 32);
      v23 = result & ~v22;
      v24 = v23 >> 6;
      if (((-1 << v23) & ~*(_QWORD *)(v9 + 8 * (v23 >> 6))) != 0)
      {
        v12 = __clz(__rbit64((-1 << v23) & ~*(_QWORD *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v25 = 0;
        v26 = (unint64_t)(63 - v22) >> 6;
        do
        {
          if (++v24 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          v27 = v24 == v26;
          if (v24 == v26)
            v24 = 0;
          v25 |= v27;
          v28 = *(_QWORD *)(v9 + 8 * v24);
        }
        while (v28 == -1);
        v12 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(_QWORD *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      v13 = (_QWORD *)(*(_QWORD *)(v4 + 48) + 16 * v12);
      *v13 = v20;
      v13[1] = v21;
      ++*(_QWORD *)(v4 + 16);
    }
  }
  result = swift_release();
  *v1 = v4;
  return result;
}

uint64_t sub_21AD155D8()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  unint64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t result;
  int64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  char v23;
  unint64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255117A48);
  v3 = sub_21AD2415C();
  v4 = v3;
  if (*(_QWORD *)(v2 + 16))
  {
    v28 = v0;
    v5 = 1 << *(_BYTE *)(v2 + 32);
    v6 = (_QWORD *)(v2 + 56);
    if (v5 < 64)
      v7 = ~(-1 << v5);
    else
      v7 = -1;
    v8 = v7 & *(_QWORD *)(v2 + 56);
    v9 = (unint64_t)(v5 + 63) >> 6;
    v10 = v3 + 56;
    result = swift_retain();
    v12 = 0;
    while (1)
    {
      if (v8)
      {
        v14 = __clz(__rbit64(v8));
        v8 &= v8 - 1;
        v15 = v14 | (v12 << 6);
      }
      else
      {
        v16 = v12 + 1;
        if (__OFADD__(v12, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v9)
          goto LABEL_33;
        v17 = v6[v16];
        ++v12;
        if (!v17)
        {
          v12 = v16 + 1;
          if (v16 + 1 >= v9)
            goto LABEL_33;
          v17 = v6[v12];
          if (!v17)
          {
            v12 = v16 + 2;
            if (v16 + 2 >= v9)
              goto LABEL_33;
            v17 = v6[v12];
            if (!v17)
            {
              v18 = v16 + 3;
              if (v18 >= v9)
              {
LABEL_33:
                swift_release();
                v1 = v28;
                v27 = 1 << *(_BYTE *)(v2 + 32);
                if (v27 > 63)
                  bzero((void *)(v2 + 56), ((unint64_t)(v27 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v6 = -1 << v27;
                *(_QWORD *)(v2 + 16) = 0;
                break;
              }
              v17 = v6[v18];
              if (!v17)
              {
                while (1)
                {
                  v12 = v18 + 1;
                  if (__OFADD__(v18, 1))
                    goto LABEL_39;
                  if (v12 >= v9)
                    goto LABEL_33;
                  v17 = v6[v12];
                  ++v18;
                  if (v17)
                    goto LABEL_23;
                }
              }
              v12 = v18;
            }
          }
        }
LABEL_23:
        v8 = (v17 - 1) & v17;
        v15 = __clz(__rbit64(v17)) + (v12 << 6);
      }
      v19 = *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v15);
      result = sub_21AD240B4();
      v20 = -1 << *(_BYTE *)(v4 + 32);
      v21 = result & ~v20;
      v22 = v21 >> 6;
      if (((-1 << v21) & ~*(_QWORD *)(v10 + 8 * (v21 >> 6))) != 0)
      {
        v13 = __clz(__rbit64((-1 << v21) & ~*(_QWORD *)(v10 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v23 = 0;
        v24 = (unint64_t)(63 - v20) >> 6;
        do
        {
          if (++v22 == v24 && (v23 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          v25 = v22 == v24;
          if (v22 == v24)
            v22 = 0;
          v23 |= v25;
          v26 = *(_QWORD *)(v10 + 8 * v22);
        }
        while (v26 == -1);
        v13 = __clz(__rbit64(~v26)) + (v22 << 6);
      }
      *(_QWORD *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
      *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v13) = v19;
      ++*(_QWORD *)(v4 + 16);
    }
  }
  result = swift_release();
  *v1 = v4;
  return result;
}

uint64_t sub_21AD15874()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t result;
  int64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  int64_t v14;
  unint64_t v15;
  int64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  char v22;
  unint64_t v23;
  BOOL v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  int64_t v28;
  _QWORD *v29;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255117A30);
  v3 = sub_21AD2415C();
  v4 = v3;
  if (*(_QWORD *)(v2 + 16))
  {
    v27 = v0;
    v5 = 1 << *(_BYTE *)(v2 + 32);
    v29 = (_QWORD *)(v2 + 56);
    if (v5 < 64)
      v6 = ~(-1 << v5);
    else
      v6 = -1;
    v7 = v6 & *(_QWORD *)(v2 + 56);
    v28 = (unint64_t)(v5 + 63) >> 6;
    v8 = v3 + 56;
    result = swift_retain();
    v10 = 0;
    while (1)
    {
      if (v7)
      {
        v12 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        v13 = v12 | (v10 << 6);
      }
      else
      {
        v14 = v10 + 1;
        if (__OFADD__(v10, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v14 >= v28)
          goto LABEL_33;
        v15 = v29[v14];
        ++v10;
        if (!v15)
        {
          v10 = v14 + 1;
          if (v14 + 1 >= v28)
            goto LABEL_33;
          v15 = v29[v10];
          if (!v15)
          {
            v10 = v14 + 2;
            if (v14 + 2 >= v28)
              goto LABEL_33;
            v15 = v29[v10];
            if (!v15)
            {
              v16 = v14 + 3;
              if (v16 >= v28)
              {
LABEL_33:
                swift_release();
                v1 = v27;
                v26 = 1 << *(_BYTE *)(v2 + 32);
                if (v26 > 63)
                  bzero(v29, ((unint64_t)(v26 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v29 = -1 << v26;
                *(_QWORD *)(v2 + 16) = 0;
                break;
              }
              v15 = v29[v16];
              if (!v15)
              {
                while (1)
                {
                  v10 = v16 + 1;
                  if (__OFADD__(v16, 1))
                    goto LABEL_39;
                  if (v10 >= v28)
                    goto LABEL_33;
                  v15 = v29[v10];
                  ++v16;
                  if (v15)
                    goto LABEL_23;
                }
              }
              v10 = v16;
            }
          }
        }
LABEL_23:
        v7 = (v15 - 1) & v15;
        v13 = __clz(__rbit64(v15)) + (v10 << 6);
      }
      v17 = *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v13);
      _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
      sub_21AD242E8();
      sub_21AD23F88();
      v18 = sub_21AD24300();
      result = swift_bridgeObjectRelease();
      v19 = -1 << *(_BYTE *)(v4 + 32);
      v20 = v18 & ~v19;
      v21 = v20 >> 6;
      if (((-1 << v20) & ~*(_QWORD *)(v8 + 8 * (v20 >> 6))) != 0)
      {
        v11 = __clz(__rbit64((-1 << v20) & ~*(_QWORD *)(v8 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v22 = 0;
        v23 = (unint64_t)(63 - v19) >> 6;
        do
        {
          if (++v21 == v23 && (v22 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          v24 = v21 == v23;
          if (v21 == v23)
            v21 = 0;
          v22 |= v24;
          v25 = *(_QWORD *)(v8 + 8 * v21);
        }
        while (v25 == -1);
        v11 = __clz(__rbit64(~v25)) + (v21 << 6);
      }
      *(_QWORD *)(v8 + ((v11 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v11;
      *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v11) = v17;
      ++*(_QWORD *)(v4 + 16);
    }
  }
  result = swift_release();
  *v1 = v4;
  return result;
}

void *sub_21AD15B84()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  _QWORD *v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255117A58);
  v2 = *v0;
  v3 = sub_21AD24150();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_28:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 56);
  v6 = v2 + 56;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 56);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v20 >= v13)
      goto LABEL_28;
    v21 = *(_QWORD *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      v9 = v20 + 1;
      if (v20 + 1 >= v13)
        goto LABEL_28;
      v21 = *(_QWORD *)(v6 + 8 * v9);
      if (!v21)
      {
        v9 = v20 + 2;
        if (v20 + 2 >= v13)
          goto LABEL_28;
        v21 = *(_QWORD *)(v6 + 8 * v9);
        if (!v21)
          break;
      }
    }
LABEL_27:
    v12 = (v21 - 1) & v21;
    v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (_QWORD *)(*(_QWORD *)(v2 + 48) + v16);
    v18 = v17[1];
    v19 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v19 = *v17;
    v19[1] = v18;
    result = (void *)swift_bridgeObjectRetain();
  }
  v22 = v20 + 3;
  if (v22 >= v13)
    goto LABEL_28;
  v21 = *(_QWORD *)(v6 + 8 * v22);
  if (v21)
  {
    v9 = v22;
    goto LABEL_27;
  }
  while (1)
  {
    v9 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v9 >= v13)
      goto LABEL_28;
    v21 = *(_QWORD *)(v6 + 8 * v9);
    ++v22;
    if (v21)
      goto LABEL_27;
  }
LABEL_30:
  __break(1u);
  return result;
}

id sub_21AD15D34()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  void *v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255117A48);
  v2 = *v0;
  v3 = sub_21AD24150();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_28:
    result = (id)swift_release();
    *v1 = v4;
    return result;
  }
  result = (id)(v3 + 56);
  v6 = v2 + 56;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 56);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v18 >= v13)
      goto LABEL_28;
    v19 = *(_QWORD *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      v9 = v18 + 1;
      if (v18 + 1 >= v13)
        goto LABEL_28;
      v19 = *(_QWORD *)(v6 + 8 * v9);
      if (!v19)
      {
        v9 = v18 + 2;
        if (v18 + 2 >= v13)
          goto LABEL_28;
        v19 = *(_QWORD *)(v6 + 8 * v9);
        if (!v19)
          break;
      }
    }
LABEL_27:
    v12 = (v19 - 1) & v19;
    v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    v16 = 8 * v15;
    v17 = *(void **)(*(_QWORD *)(v2 + 48) + v16);
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + v16) = v17;
    result = v17;
  }
  v20 = v18 + 3;
  if (v20 >= v13)
    goto LABEL_28;
  v19 = *(_QWORD *)(v6 + 8 * v20);
  if (v19)
  {
    v9 = v20;
    goto LABEL_27;
  }
  while (1)
  {
    v9 = v20 + 1;
    if (__OFADD__(v20, 1))
      break;
    if (v9 >= v13)
      goto LABEL_28;
    v19 = *(_QWORD *)(v6 + 8 * v9);
    ++v20;
    if (v19)
      goto LABEL_27;
  }
LABEL_30:
  __break(1u);
  return result;
}

id sub_21AD15EDC()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  void *v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255117A30);
  v2 = *v0;
  v3 = sub_21AD24150();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_28:
    result = (id)swift_release();
    *v1 = v4;
    return result;
  }
  result = (id)(v3 + 56);
  v6 = v2 + 56;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 56);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v18 >= v13)
      goto LABEL_28;
    v19 = *(_QWORD *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      v9 = v18 + 1;
      if (v18 + 1 >= v13)
        goto LABEL_28;
      v19 = *(_QWORD *)(v6 + 8 * v9);
      if (!v19)
      {
        v9 = v18 + 2;
        if (v18 + 2 >= v13)
          goto LABEL_28;
        v19 = *(_QWORD *)(v6 + 8 * v9);
        if (!v19)
          break;
      }
    }
LABEL_27:
    v12 = (v19 - 1) & v19;
    v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    v16 = 8 * v15;
    v17 = *(void **)(*(_QWORD *)(v2 + 48) + v16);
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + v16) = v17;
    result = v17;
  }
  v20 = v18 + 3;
  if (v20 >= v13)
    goto LABEL_28;
  v19 = *(_QWORD *)(v6 + 8 * v20);
  if (v19)
  {
    v9 = v20;
    goto LABEL_27;
  }
  while (1)
  {
    v9 = v20 + 1;
    if (__OFADD__(v20, 1))
      break;
    if (v9 >= v13)
      goto LABEL_28;
    v19 = *(_QWORD *)(v6 + 8 * v9);
    ++v20;
    if (v19)
      goto LABEL_27;
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_21AD16084(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  int64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t result;
  uint64_t v8;

  if ((a1 & 0xC000000000000001) != 0)
  {
    v2 = sub_21AD24114();
    if (v2)
      goto LABEL_3;
    return MEMORY[0x24BEE4AF8];
  }
  v2 = *(_QWORD *)(a1 + 16);
  if (!v2)
    return MEMORY[0x24BEE4AF8];
LABEL_3:
  if (v2 <= 0)
  {
    v3 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255118270);
    v3 = (_QWORD *)swift_allocObject();
    v4 = _swift_stdlib_malloc_size(v3);
    v5 = v4 - 32;
    if (v4 < 32)
      v5 = v4 - 25;
    v3[2] = v2;
    v3[3] = (2 * (v5 >> 3)) | 1;
  }
  swift_bridgeObjectRetain();
  v6 = sub_21AD17EA8(&v8, v3 + 4, v2, a1);
  result = sub_21AD196F8();
  if (v6 == (_QWORD *)v2)
    return (uint64_t)v3;
  __break(1u);
  return result;
}

void sub_21AD1617C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  id v13;
  int64_t v14;
  unint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;

  if ((*(_QWORD *)v1 & 0xC000000000000001) != 0)
  {
    if (!sub_21AD24114())
      return;
LABEL_5:
    if ((a1 & 0xC000000000000001) != 0)
    {
      swift_bridgeObjectRetain();
      sub_21AD24108();
      sub_21AD19700();
      sub_21ACF7DA4((unint64_t *)&qword_255117A40, (uint64_t (*)(uint64_t))sub_21AD19700, MEMORY[0x24BEE5BD8]);
      sub_21AD2403C();
      a1 = v20;
      v18 = v21;
      v3 = v22;
      v4 = v23;
      v5 = v24;
    }
    else
    {
      v6 = -1 << *(_BYTE *)(a1 + 32);
      v18 = a1 + 56;
      v3 = ~v6;
      v7 = -v6;
      if (v7 < 64)
        v8 = ~(-1 << v7);
      else
        v8 = -1;
      v5 = v8 & *(_QWORD *)(a1 + 56);
      swift_bridgeObjectRetain();
      v4 = 0;
    }
    v9 = (unint64_t)(v3 + 64) >> 6;
    if (a1 < 0)
      goto LABEL_14;
    while (1)
    {
      if (v5)
      {
        v10 = (v5 - 1) & v5;
        v11 = __clz(__rbit64(v5)) | (v4 << 6);
        v12 = v4;
      }
      else
      {
        v14 = v4 + 1;
        if (__OFADD__(v4, 1))
        {
          __break(1u);
          return;
        }
        if (v14 >= v9)
          goto LABEL_36;
        v15 = *(_QWORD *)(v18 + 8 * v14);
        v12 = v4 + 1;
        if (!v15)
        {
          v12 = v4 + 2;
          if (v4 + 2 >= v9)
            goto LABEL_36;
          v15 = *(_QWORD *)(v18 + 8 * v12);
          if (!v15)
          {
            v12 = v4 + 3;
            if (v4 + 3 >= v9)
              goto LABEL_36;
            v15 = *(_QWORD *)(v18 + 8 * v12);
            if (!v15)
            {
              v12 = v4 + 4;
              if (v4 + 4 >= v9)
                goto LABEL_36;
              v15 = *(_QWORD *)(v18 + 8 * v12);
              if (!v15)
              {
                v12 = v4 + 5;
                if (v4 + 5 >= v9)
                  goto LABEL_36;
                v15 = *(_QWORD *)(v18 + 8 * v12);
                if (!v15)
                {
                  v16 = v4 + 6;
                  while (v9 != v16)
                  {
                    v15 = *(_QWORD *)(v18 + 8 * v16++);
                    if (v15)
                    {
                      v12 = v16 - 1;
                      goto LABEL_32;
                    }
                  }
LABEL_36:
                  sub_21AD196F8();
                  return;
                }
              }
            }
          }
        }
LABEL_32:
        v10 = (v15 - 1) & v15;
        v11 = __clz(__rbit64(v15)) + (v12 << 6);
      }
      v13 = *(id *)(*(_QWORD *)(a1 + 48) + 8 * v11);
      if (!v13)
        goto LABEL_36;
      while (1)
      {
        v17 = (void *)sub_21AD16974(v13);

        v4 = v12;
        v5 = v10;
        if ((a1 & 0x8000000000000000) == 0)
          break;
LABEL_14:
        if (sub_21AD24138())
        {
          sub_21AD19700();
          swift_unknownObjectRetain();
          swift_dynamicCast();
          v13 = v19;
          swift_unknownObjectRelease();
          v12 = v4;
          v10 = v5;
          if (v19)
            continue;
        }
        goto LABEL_36;
      }
    }
  }
  if (*(_QWORD *)(*(_QWORD *)v1 + 16))
    goto LABEL_5;
}

uint64_t sub_21AD16454(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  id v20;
  char v21;
  uint64_t v22;
  id v23;
  char v24;
  int64_t v25;
  int64_t v26;
  unint64_t v27;
  int64_t v28;
  int64_t v29;
  uint64_t isStackAllocationSafe;
  char v31;
  unint64_t v32;
  size_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  int64_t v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  int64_t v49;
  unint64_t v50;
  uint64_t v51;

  v2 = a2;
  v51 = *MEMORY[0x24BDAC8D0];
  if (!*(_QWORD *)(a2 + 16))
  {
    swift_release();
    return MEMORY[0x24BEE4B08];
  }
  v3 = a1;
  if ((a1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    sub_21AD24108();
    sub_21AD19700();
    sub_21ACF7DA4((unint64_t *)&qword_255117A40, (uint64_t (*)(uint64_t))sub_21AD19700, MEMORY[0x24BEE5BD8]);
    sub_21AD2403C();
    v3 = v46;
    v4 = v47;
    v6 = v48;
    v5 = v49;
    v7 = v50;
  }
  else
  {
    v8 = -1 << *(_BYTE *)(a1 + 32);
    v4 = a1 + 56;
    v6 = ~v8;
    v9 = -v8;
    if (v9 < 64)
      v10 = ~(-1 << v9);
    else
      v10 = -1;
    v7 = v10 & *(_QWORD *)(a1 + 56);
    swift_bridgeObjectRetain();
    v5 = 0;
  }
  v41 = v3;
  v42 = v4;
  v43 = v6;
  v44 = v5;
  v45 = v7;
  v11 = v2 + 56;
  while (1)
  {
    if ((v3 & 0x8000000000000000) == 0)
    {
      if (v7)
      {
        v12 = (v7 - 1) & v7;
        v13 = __clz(__rbit64(v7)) | (v5 << 6);
LABEL_14:
        v14 = *(void **)(*(_QWORD *)(v3 + 48) + 8 * v13);
        v15 = v14;
        goto LABEL_15;
      }
      v25 = v5 + 1;
      if (__OFADD__(v5, 1))
        __break(1u);
      v26 = (unint64_t)(v6 + 64) >> 6;
      if (v25 >= v26)
      {
        v14 = 0;
        v12 = 0;
        goto LABEL_15;
      }
      v27 = *(_QWORD *)(v42 + 8 * v25);
      if (v27)
      {
LABEL_28:
        v12 = (v27 - 1) & v27;
        v13 = __clz(__rbit64(v27)) + (v25 << 6);
        v5 = v25;
        goto LABEL_14;
      }
      v28 = v5 + 2;
      if (v5 + 2 >= v26)
        goto LABEL_44;
      v27 = *(_QWORD *)(v42 + 8 * v28);
      if (v27)
      {
LABEL_32:
        v25 = v28;
        goto LABEL_28;
      }
      if (v5 + 3 < v26)
      {
        v27 = *(_QWORD *)(v42 + 8 * (v5 + 3));
        if (v27)
        {
          v25 = v5 + 3;
          goto LABEL_28;
        }
        v28 = v5 + 4;
        if (v5 + 4 >= v26)
        {
          v14 = 0;
          v12 = 0;
          v5 += 3;
LABEL_15:
          v44 = v5;
          v45 = v12;
          if (!v14)
            goto LABEL_53;
          goto LABEL_19;
        }
        v27 = *(_QWORD *)(v42 + 8 * v28);
        if (v27)
          goto LABEL_32;
        v25 = v5 + 5;
        if (v5 + 5 < v26)
        {
          v27 = *(_QWORD *)(v42 + 8 * v25);
          if (v27)
            goto LABEL_28;
          v25 = v26 - 1;
          v29 = v5 + 6;
          while (v26 != v29)
          {
            v27 = *(_QWORD *)(v42 + 8 * v29++);
            if (v27)
            {
              v25 = v29 - 1;
              goto LABEL_28;
            }
          }
LABEL_44:
          v14 = 0;
          v12 = 0;
          v5 = v25;
          goto LABEL_15;
        }
      }
      v14 = 0;
      v12 = 0;
      v5 = v28;
      goto LABEL_15;
    }
    v16 = sub_21AD24138();
    if (!v16
      || (v39 = v16,
          sub_21AD19700(),
          swift_unknownObjectRetain(),
          swift_dynamicCast(),
          v14 = v40,
          swift_unknownObjectRelease(),
          !v40))
    {
LABEL_53:
      sub_21AD196F8();
      return v2;
    }
LABEL_19:
    v17 = sub_21AD240B4();
    v18 = -1 << *(_BYTE *)(v2 + 32);
    v19 = v17 & ~v18;
    if (((*(_QWORD *)(v11 + ((v19 >> 3) & 0xFFFFFFFFFFFFF8)) >> v19) & 1) == 0)
      goto LABEL_10;
    sub_21AD19700();
    v20 = *(id *)(*(_QWORD *)(v2 + 48) + 8 * v19);
    v21 = sub_21AD240C0();

    if ((v21 & 1) != 0)
      break;
    v22 = ~v18;
    while (1)
    {
      v19 = (v19 + 1) & v22;
      if (((*(_QWORD *)(v11 + ((v19 >> 3) & 0xFFFFFFFFFFFFF8)) >> v19) & 1) == 0)
        break;
      v23 = *(id *)(*(_QWORD *)(v2 + 48) + 8 * v19);
      v24 = sub_21AD240C0();

      if ((v24 & 1) != 0)
        goto LABEL_47;
    }
LABEL_10:

    v3 = v41;
    v6 = v43;
    v5 = v44;
    v7 = v45;
  }
LABEL_47:

  v31 = *(_BYTE *)(v2 + 32);
  v32 = (unint64_t)((1 << v31) + 63) >> 6;
  v33 = 8 * v32;
  if ((v31 & 0x3Fu) < 0xE
    || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (_DWORD)isStackAllocationSafe))
  {
    MEMORY[0x24BDAC7A8](isStackAllocationSafe);
    memcpy((char *)&v39 - ((v33 + 15) & 0x3FFFFFFFFFFFFFF0), (const void *)(v2 + 56), v33);
    sub_21AD16B38((unint64_t *)((char *)&v39 - ((v33 + 15) & 0x3FFFFFFFFFFFFFF0)), v32, v2, v19, &v41);
    v35 = v34;
    swift_release();
    sub_21AD196F8();
  }
  else
  {
    v36 = (void *)swift_slowAlloc();
    memcpy(v36, (const void *)(v2 + 56), v33);
    sub_21AD16B38((unint64_t *)v36, v32, v2, v19, &v41);
    v35 = v37;
    swift_release();
    sub_21AD196F8();
    MEMORY[0x220756ED0](v36, -1, -1);
  }
  return v35;
}

uint64_t sub_21AD16974(void *a1)
{
  uint64_t *v1;
  uint64_t v3;
  id v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  id v10;
  char v11;
  uint64_t v12;
  id v13;
  char v14;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v16;
  uint64_t v18;

  v3 = *v1;
  if ((*v1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    v4 = a1;
    v5 = sub_21AD24144();

    if ((v5 & 1) != 0)
    {
      v6 = sub_21AD17100();
      swift_bridgeObjectRelease();
      return v6;
    }
LABEL_12:
    swift_bridgeObjectRelease();
    return 0;
  }
  swift_bridgeObjectRetain();
  v7 = sub_21AD240B4();
  v8 = -1 << *(_BYTE *)(v3 + 32);
  v9 = v7 & ~v8;
  if (((*(_QWORD *)(v3 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFF8)) >> v9) & 1) == 0)
    goto LABEL_12;
  sub_21AD19700();
  v10 = *(id *)(*(_QWORD *)(v3 + 48) + 8 * v9);
  v11 = sub_21AD240C0();

  if ((v11 & 1) == 0)
  {
    v12 = ~v8;
    do
    {
      v9 = (v9 + 1) & v12;
      if (((*(_QWORD *)(v3 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFF8)) >> v9) & 1) == 0)
        goto LABEL_12;
      v13 = *(id *)(*(_QWORD *)(v3 + 48) + 8 * v9);
      v14 = sub_21AD240C0();

    }
    while ((v14 & 1) == 0);
  }
  swift_bridgeObjectRelease();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v16 = *v1;
  v18 = *v1;
  *v1 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_21AD15D34();
    v16 = v18;
  }
  v6 = *(_QWORD *)(*(_QWORD *)(v16 + 48) + 8 * v9);
  sub_21AD17288(v9);
  *v1 = v18;
  swift_bridgeObjectRelease();
  return v6;
}

void sub_21AD16B38(unint64_t *a1, uint64_t a2, uint64_t a3, unint64_t a4, _QWORD *a5)
{
  _QWORD *v5;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  int64_t v10;
  uint64_t v11;
  unint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  id v20;
  char v21;
  uint64_t v22;
  unint64_t i;
  unint64_t v24;
  id v25;
  char v26;
  int64_t v27;
  int64_t v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  BOOL v32;
  int64_t v33;
  int64_t v34;
  uint64_t v36;
  uint64_t v39;
  void *v40;

  v5 = a5;
  v7 = *(_QWORD *)(a3 + 16);
  *(unint64_t *)((char *)a1 + ((a4 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << a4) - 1;
  v8 = v7 - 1;
  v39 = a3 + 56;
  while (2)
  {
    v36 = v8;
    do
    {
      while (1)
      {
        if ((*v5 & 0x8000000000000000) == 0)
        {
          v10 = v5[3];
          v9 = v5[4];
          if (v9)
          {
            v11 = (v9 - 1) & v9;
            v12 = __clz(__rbit64(v9)) | (v10 << 6);
LABEL_7:
            v13 = *(void **)(*(_QWORD *)(*v5 + 48) + 8 * v12);
            v14 = v13;
            goto LABEL_8;
          }
          v27 = v10 + 1;
          if (__OFADD__(v10, 1))
          {
            __break(1u);
            goto LABEL_49;
          }
          v28 = (unint64_t)(v5[2] + 64) >> 6;
          if (v27 >= v28)
          {
            v13 = 0;
            v11 = 0;
            goto LABEL_8;
          }
          v29 = v5[1];
          v30 = *(_QWORD *)(v29 + 8 * v27);
          if (v30)
          {
LABEL_22:
            v11 = (v30 - 1) & v30;
            v12 = __clz(__rbit64(v30)) + (v27 << 6);
            v10 = v27;
            goto LABEL_7;
          }
          v33 = v10 + 2;
          if (v10 + 2 >= v28)
            goto LABEL_41;
          v30 = *(_QWORD *)(v29 + 8 * v33);
          if (v30)
          {
LABEL_29:
            v27 = v33;
            goto LABEL_22;
          }
          if (v10 + 3 < v28)
          {
            v30 = *(_QWORD *)(v29 + 8 * (v10 + 3));
            if (v30)
            {
              v27 = v10 + 3;
              goto LABEL_22;
            }
            v33 = v10 + 4;
            if (v10 + 4 >= v28)
            {
              v13 = 0;
              v11 = 0;
              v10 += 3;
LABEL_8:
              v5[3] = v10;
              v5[4] = v11;
              if (!v13)
                goto LABEL_47;
              goto LABEL_12;
            }
            v30 = *(_QWORD *)(v29 + 8 * v33);
            if (v30)
              goto LABEL_29;
            v27 = v10 + 5;
            if (v10 + 5 < v28)
            {
              v30 = *(_QWORD *)(v29 + 8 * v27);
              if (v30)
                goto LABEL_22;
              v27 = v28 - 1;
              v34 = v10 + 6;
              while (v28 != v34)
              {
                v30 = *(_QWORD *)(v29 + 8 * v34++);
                if (v30)
                {
                  v27 = v34 - 1;
                  goto LABEL_22;
                }
              }
LABEL_41:
              v13 = 0;
              v11 = 0;
              v10 = v27;
              goto LABEL_8;
            }
          }
          v13 = 0;
          v11 = 0;
          v10 = v33;
          goto LABEL_8;
        }
        if (!sub_21AD24138()
          || (sub_21AD19700(),
              swift_unknownObjectRetain(),
              swift_dynamicCast(),
              v13 = v40,
              swift_unknownObjectRelease(),
              !v40))
        {
LABEL_47:
          swift_retain();
          sub_21AD16EA4(a1, a2, v36, a3);
          return;
        }
LABEL_12:
        v15 = sub_21AD240B4();
        v16 = -1 << *(_BYTE *)(a3 + 32);
        v17 = v15 & ~v16;
        v18 = v17 >> 6;
        v19 = 1 << v17;
        if (((1 << v17) & *(_QWORD *)(v39 + 8 * (v17 >> 6))) == 0)
          goto LABEL_3;
        sub_21AD19700();
        v20 = *(id *)(*(_QWORD *)(a3 + 48) + 8 * v17);
        v21 = sub_21AD240C0();

        if ((v21 & 1) != 0)
          break;
        v22 = ~v16;
        for (i = v17 + 1; ; i = v24 + 1)
        {
          v24 = i & v22;
          if (((*(_QWORD *)(v39 + (((i & v22) >> 3) & 0xFFFFFFFFFFFFF8)) >> (i & v22)) & 1) == 0)
            break;
          v25 = *(id *)(*(_QWORD *)(a3 + 48) + 8 * v24);
          v26 = sub_21AD240C0();

          if ((v26 & 1) != 0)
          {

            v18 = v24 >> 6;
            v19 = 1 << v24;
            goto LABEL_25;
          }
        }
LABEL_3:

        v5 = a5;
      }

LABEL_25:
      v31 = a1[v18];
      a1[v18] = v31 & ~v19;
      v32 = (v19 & v31) == 0;
      v5 = a5;
    }
    while (v32);
    v8 = v36 - 1;
    if (__OFSUB__(v36, 1))
    {
LABEL_49:
      __break(1u);
      return;
    }
    if (v36 != 1)
      continue;
    break;
  }
}

uint64_t sub_21AD16EA4(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  char v23;
  unint64_t v24;
  BOOL v25;
  uint64_t v26;
  unint64_t *v28;

  v4 = a4;
  if (!a3)
  {
    v9 = MEMORY[0x24BEE4B08];
LABEL_36:
    swift_release();
    return v9;
  }
  v5 = a3;
  if (*(_QWORD *)(a4 + 16) == a3)
    return v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255117A48);
  result = sub_21AD24174();
  v9 = result;
  v28 = a1;
  if (a2 < 1)
    v10 = 0;
  else
    v10 = *a1;
  v11 = 0;
  v12 = result + 56;
  while (1)
  {
    if (v10)
    {
      v13 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v14 = v13 | (v11 << 6);
      goto LABEL_24;
    }
    v15 = v11 + 1;
    if (__OFADD__(v11, 1))
      goto LABEL_39;
    if (v15 >= a2)
      goto LABEL_36;
    v16 = v28[v15];
    ++v11;
    if (!v16)
    {
      v11 = v15 + 1;
      if (v15 + 1 >= a2)
        goto LABEL_36;
      v16 = v28[v11];
      if (!v16)
      {
        v11 = v15 + 2;
        if (v15 + 2 >= a2)
          goto LABEL_36;
        v16 = v28[v11];
        if (!v16)
          break;
      }
    }
LABEL_23:
    v10 = (v16 - 1) & v16;
    v14 = __clz(__rbit64(v16)) + (v11 << 6);
LABEL_24:
    v18 = *(id *)(*(_QWORD *)(v4 + 48) + 8 * v14);
    result = sub_21AD240B4();
    v19 = -1 << *(_BYTE *)(v9 + 32);
    v20 = result & ~v19;
    v21 = v20 >> 6;
    if (((-1 << v20) & ~*(_QWORD *)(v12 + 8 * (v20 >> 6))) != 0)
    {
      v22 = __clz(__rbit64((-1 << v20) & ~*(_QWORD *)(v12 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v23 = 0;
      v24 = (unint64_t)(63 - v19) >> 6;
      do
      {
        if (++v21 == v24 && (v23 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        v25 = v21 == v24;
        if (v21 == v24)
          v21 = 0;
        v23 |= v25;
        v26 = *(_QWORD *)(v12 + 8 * v21);
      }
      while (v26 == -1);
      v22 = __clz(__rbit64(~v26)) + (v21 << 6);
    }
    *(_QWORD *)(v12 + ((v22 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v22;
    *(_QWORD *)(*(_QWORD *)(v9 + 48) + 8 * v22) = v18;
    ++*(_QWORD *)(v9 + 16);
    if (__OFSUB__(v5--, 1))
    {
LABEL_38:
      __break(1u);
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }
    if (!v5)
      goto LABEL_36;
  }
  v17 = v15 + 3;
  if (v17 >= a2)
    goto LABEL_36;
  v16 = v28[v17];
  if (v16)
  {
    v11 = v17;
    goto LABEL_23;
  }
  while (1)
  {
    v11 = v17 + 1;
    if (__OFADD__(v17, 1))
      break;
    if (v11 >= a2)
      goto LABEL_36;
    v16 = v28[v11];
    ++v17;
    if (v16)
      goto LABEL_23;
  }
LABEL_40:
  __break(1u);
  return result;
}

uint64_t sub_21AD17100()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  id v8;
  char v9;
  uint64_t v10;
  id v11;
  char v12;
  uint64_t v13;
  uint64_t result;
  uint64_t v15;

  v1 = v0;
  swift_bridgeObjectRelease();
  v2 = sub_21AD24114();
  v3 = swift_unknownObjectRetain();
  v4 = sub_21AD15118(v3, v2);
  v15 = v4;
  swift_retain();
  v5 = sub_21AD240B4();
  v6 = -1 << *(_BYTE *)(v4 + 32);
  v7 = v5 & ~v6;
  if (((*(_QWORD *)(v4 + 56 + ((v7 >> 3) & 0xFFFFFFFFFFFFF8)) >> v7) & 1) != 0)
  {
    sub_21AD19700();
    v8 = *(id *)(*(_QWORD *)(v4 + 48) + 8 * v7);
    v9 = sub_21AD240C0();

    if ((v9 & 1) != 0)
    {
LABEL_6:
      swift_release();
      v13 = *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v7);
      sub_21AD17288(v7);
      if ((sub_21AD240C0() & 1) != 0)
      {
        *v1 = v15;
        return v13;
      }
      __break(1u);
    }
    else
    {
      v10 = ~v6;
      while (1)
      {
        v7 = (v7 + 1) & v10;
        if (((*(_QWORD *)(v4 + 56 + ((v7 >> 3) & 0xFFFFFFFFFFFFF8)) >> v7) & 1) == 0)
          break;
        v11 = *(id *)(*(_QWORD *)(v4 + 48) + 8 * v7);
        v12 = sub_21AD240C0();

        if ((v12 & 1) != 0)
          goto LABEL_6;
      }
    }
    swift_release();
    __break(1u);
  }
  result = swift_release();
  __break(1u);
  return result;
}

unint64_t sub_21AD17288(unint64_t result)
{
  uint64_t *v1;
  int64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  id v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  BOOL v19;
  uint64_t v20;

  v2 = result;
  v3 = *v1;
  v4 = *v1 + 56;
  v5 = -1 << *(_BYTE *)(*v1 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(v4 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    swift_retain();
    v8 = sub_21AD240F0();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v9 = (v8 + 1) & v7;
      do
      {
        v10 = *(id *)(*(_QWORD *)(v3 + 48) + 8 * v6);
        v11 = sub_21AD240B4();

        v12 = v11 & v7;
        if (v2 >= (uint64_t)v9)
        {
          if (v12 >= v9 && v2 >= (uint64_t)v12)
          {
LABEL_16:
            v15 = *(_QWORD *)(v3 + 48);
            v16 = (_QWORD *)(v15 + 8 * v2);
            v17 = (_QWORD *)(v15 + 8 * v6);
            if (v2 != v6 || (v2 = v6, v16 >= v17 + 1))
            {
              *v16 = *v17;
              v2 = v6;
            }
          }
        }
        else if (v12 >= v9 || v2 >= (uint64_t)v12)
        {
          goto LABEL_16;
        }
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    *(_QWORD *)(v4 + (((unint64_t)v2 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << v2) - 1;
    result = swift_release();
  }
  else
  {
    *(_QWORD *)(v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << result) - 1;
  }
  v18 = *(_QWORD *)(v3 + 16);
  v19 = __OFSUB__(v18, 1);
  v20 = v18 - 1;
  if (v19)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(v3 + 16) = v20;
    ++*(_DWORD *)(v3 + 36);
  }
  return result;
}

uint64_t sub_21AD17428(uint64_t a1)
{
  uint64_t *v1;
  uint64_t *v2;
  unint64_t v4;
  char v5;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;

  v2 = v1;
  swift_bridgeObjectRetain();
  v4 = sub_21AD1DF34(a1);
  LOBYTE(a1) = v5;
  swift_bridgeObjectRelease();
  if ((a1 & 1) == 0)
    return 0;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v7 = *v2;
  v10 = *v2;
  *v2 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_21AD1784C();
    v7 = v10;
  }

  v8 = *(_QWORD *)(*(_QWORD *)(v7 + 56) + 8 * v4);
  sub_21AD174EC(v4, v7);
  *v2 = v7;
  swift_bridgeObjectRelease();
  return v8;
}

void sub_21AD174EC(unint64_t a1, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  id v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;

  v3 = a1;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (a1 + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    v8 = sub_21AD240F0();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v9 = (v8 + 1) & v7;
      do
      {
        v10 = *(id *)(*(_QWORD *)(a2 + 48) + 8 * v6);
        v11 = sub_21AD240B4();

        v12 = v11 & v7;
        if (v3 >= (uint64_t)v9)
        {
          if (v12 >= v9 && v3 >= (uint64_t)v12)
          {
LABEL_16:
            v15 = *(_QWORD *)(a2 + 48);
            v16 = (_QWORD *)(v15 + 8 * v3);
            v17 = (_QWORD *)(v15 + 8 * v6);
            if (v3 != v6 || v16 >= v17 + 1)
              *v16 = *v17;
            v18 = *(_QWORD *)(a2 + 56);
            v19 = (_QWORD *)(v18 + 8 * v3);
            v20 = (_QWORD *)(v18 + 8 * v6);
            if (v3 != v6 || (v3 = v6, v19 >= v20 + 1))
            {
              *v19 = *v20;
              v3 = v6;
            }
          }
        }
        else if (v12 >= v9 || v3 >= (uint64_t)v12)
        {
          goto LABEL_16;
        }
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v21 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v22 = *v21;
    v23 = (-1 << v3) - 1;
  }
  else
  {
    v21 = (uint64_t *)(v4 + 8 * (a1 >> 6));
    v23 = *v21;
    v22 = (-1 << a1) - 1;
  }
  *v21 = v23 & v22;
  v24 = *(_QWORD *)(a2 + 16);
  v25 = __OFSUB__(v24, 1);
  v26 = v24 - 1;
  if (v25)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v26;
    ++*(_DWORD *)(a2 + 36);
  }
}

void sub_21AD1769C(unint64_t a1, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  id v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  _OWORD *v19;
  _OWORD *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;

  v3 = a1;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (a1 + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    v8 = sub_21AD240F0();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v9 = (v8 + 1) & v7;
      do
      {
        v10 = *(id *)(*(_QWORD *)(a2 + 48) + 8 * v6);
        v11 = sub_21AD240B4();

        v12 = v11 & v7;
        if (v3 >= (uint64_t)v9)
        {
          if (v12 >= v9 && v3 >= (uint64_t)v12)
          {
LABEL_16:
            v15 = *(_QWORD *)(a2 + 48);
            v16 = (_QWORD *)(v15 + 8 * v3);
            v17 = (_QWORD *)(v15 + 8 * v6);
            if (v3 != v6 || v16 >= v17 + 1)
              *v16 = *v17;
            v18 = *(_QWORD *)(a2 + 56);
            v19 = (_OWORD *)(v18 + 16 * v3);
            v20 = (_OWORD *)(v18 + 16 * v6);
            if (v3 != v6 || (v3 = v6, v19 >= v20 + 1))
            {
              *v19 = *v20;
              v3 = v6;
            }
          }
        }
        else if (v12 >= v9 || v3 >= (uint64_t)v12)
        {
          goto LABEL_16;
        }
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v21 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v22 = *v21;
    v23 = (-1 << v3) - 1;
  }
  else
  {
    v21 = (uint64_t *)(v4 + 8 * (a1 >> 6));
    v23 = *v21;
    v22 = (-1 << a1) - 1;
  }
  *v21 = v23 & v22;
  v24 = *(_QWORD *)(a2 + 16);
  v25 = __OFSUB__(v24, 1);
  v26 = v24 - 1;
  if (v25)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v26;
    ++*(_DWORD *)(a2 + 36);
  }
}

void *sub_21AD1784C()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  id v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255117E48);
  v2 = *v0;
  v3 = sub_21AD24228();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v20 >= v13)
      goto LABEL_26;
    v21 = *(_QWORD *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      v9 = v20 + 1;
      if (v20 + 1 >= v13)
        goto LABEL_26;
      v21 = *(_QWORD *)(v6 + 8 * v9);
      if (!v21)
        break;
    }
LABEL_25:
    v12 = (v21 - 1) & v21;
    v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    v16 = 8 * v15;
    v17 = *(void **)(*(_QWORD *)(v2 + 48) + v16);
    v18 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + v16);
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + v16) = v17;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v16) = v18;
    v19 = v17;
    result = (void *)swift_retain();
  }
  v22 = v20 + 2;
  if (v22 >= v13)
    goto LABEL_26;
  v21 = *(_QWORD *)(v6 + 8 * v22);
  if (v21)
  {
    v9 = v22;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v21 = *(_QWORD *)(v6 + 8 * v9);
    ++v22;
    if (v21)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_21AD179F4()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  __int128 v19;
  id v20;
  int64_t v21;
  unint64_t v22;
  int64_t v23;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2551182C0);
  v2 = *v0;
  v3 = sub_21AD24228();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v21 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v21 >= v13)
      goto LABEL_26;
    v22 = *(_QWORD *)(v6 + 8 * v21);
    ++v9;
    if (!v22)
    {
      v9 = v21 + 1;
      if (v21 + 1 >= v13)
        goto LABEL_26;
      v22 = *(_QWORD *)(v6 + 8 * v9);
      if (!v22)
        break;
    }
LABEL_25:
    v12 = (v22 - 1) & v22;
    v15 = __clz(__rbit64(v22)) + (v9 << 6);
LABEL_12:
    v16 = 8 * v15;
    v17 = *(void **)(*(_QWORD *)(v2 + 48) + 8 * v15);
    v18 = 16 * v15;
    v19 = *(_OWORD *)(*(_QWORD *)(v2 + 56) + v18);
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + v16) = v17;
    *(_OWORD *)(*(_QWORD *)(v4 + 56) + v18) = v19;
    v20 = v17;
    result = (void *)swift_retain();
  }
  v23 = v21 + 2;
  if (v23 >= v13)
    goto LABEL_26;
  v22 = *(_QWORD *)(v6 + 8 * v23);
  if (v22)
  {
    v9 = v23;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v23 + 1;
    if (__OFADD__(v23, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v22 = *(_QWORD *)(v6 + 8 * v9);
    ++v23;
    if (v22)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_21AD17BB0()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  id v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255117E40);
  v2 = *v0;
  v3 = sub_21AD24228();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v20 >= v13)
      goto LABEL_26;
    v21 = *(_QWORD *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      v9 = v20 + 1;
      if (v20 + 1 >= v13)
        goto LABEL_26;
      v21 = *(_QWORD *)(v6 + 8 * v9);
      if (!v21)
        break;
    }
LABEL_25:
    v12 = (v21 - 1) & v21;
    v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    v16 = 8 * v15;
    v17 = *(void **)(*(_QWORD *)(v2 + 48) + v16);
    v18 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + v16);
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + v16) = v17;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v16) = v18;
    v19 = v17;
    result = (void *)swift_bridgeObjectRetain();
  }
  v22 = v20 + 2;
  if (v22 >= v13)
    goto LABEL_26;
  v21 = *(_QWORD *)(v6 + 8 * v22);
  if (v21)
  {
    v9 = v22;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v21 = *(_QWORD *)(v6 + 8 * v9);
    ++v22;
    if (v21)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void sub_21AD17D58(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  int64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  int64_t v9;
  unint64_t v10;
  unint64_t v11;
  id v12;
  char v13;
  int64_t v14;
  unint64_t v15;
  int64_t v16;

  v3 = *(_QWORD *)(a2 + 16);
  if (v3 != sub_21AD24114())
    return;
  v4 = 0;
  v5 = a2 + 56;
  v6 = 1 << *(_BYTE *)(a2 + 32);
  v7 = -1;
  if (v6 < 64)
    v7 = ~(-1 << v6);
  v8 = v7 & *(_QWORD *)(a2 + 56);
  v9 = (unint64_t)(v6 + 63) >> 6;
  while (v8)
  {
    v10 = __clz(__rbit64(v8));
    v8 &= v8 - 1;
    v11 = v10 | (v4 << 6);
LABEL_6:
    v12 = *(id *)(*(_QWORD *)(a2 + 48) + 8 * v11);
    v13 = sub_21AD24144();

    if ((v13 & 1) == 0)
      return;
  }
  v14 = v4 + 1;
  if (__OFADD__(v4, 1))
  {
    __break(1u);
    goto LABEL_23;
  }
  if (v14 >= v9)
    return;
  v15 = *(_QWORD *)(v5 + 8 * v14);
  ++v4;
  if (v15)
    goto LABEL_19;
  v4 = v14 + 1;
  if (v14 + 1 >= v9)
    return;
  v15 = *(_QWORD *)(v5 + 8 * v4);
  if (v15)
  {
LABEL_19:
    v8 = (v15 - 1) & v15;
    v11 = __clz(__rbit64(v15)) + (v4 << 6);
    goto LABEL_6;
  }
  v16 = v14 + 2;
  if (v16 >= v9)
    return;
  v15 = *(_QWORD *)(v5 + 8 * v16);
  if (v15)
  {
    v4 = v16;
    goto LABEL_19;
  }
  while (1)
  {
    v4 = v16 + 1;
    if (__OFADD__(v16, 1))
      break;
    if (v4 >= v9)
      return;
    v15 = *(_QWORD *)(v5 + 8 * v4);
    ++v16;
    if (v15)
      goto LABEL_19;
  }
LABEL_23:
  __break(1u);
}

_QWORD *sub_21AD17EA8(_QWORD *result, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  int64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  _QWORD *v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  int64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  int64_t v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int64_t v30;
  unint64_t v31;

  v4 = a4;
  v6 = a2;
  v7 = result;
  if ((a4 & 0xC000000000000001) != 0)
  {
    sub_21AD24108();
    sub_21AD19700();
    sub_21ACF7DA4((unint64_t *)&qword_255117A40, (uint64_t (*)(uint64_t))sub_21AD19700, MEMORY[0x24BEE5BD8]);
    result = (_QWORD *)sub_21AD2403C();
    v4 = v27;
    v8 = v28;
    v9 = v29;
    v10 = v30;
    v11 = v31;
    v24 = v7;
    if (v6)
      goto LABEL_3;
LABEL_36:
    v12 = 0;
LABEL_46:
    *v24 = v4;
    v24[1] = v8;
    v24[2] = v9;
    v24[3] = v10;
    v24[4] = v11;
    return (_QWORD *)v12;
  }
  v10 = 0;
  v20 = -1 << *(_BYTE *)(a4 + 32);
  v8 = a4 + 56;
  v9 = ~v20;
  v21 = -v20;
  if (v21 < 64)
    v22 = ~(-1 << v21);
  else
    v22 = -1;
  v11 = v22 & *(_QWORD *)(a4 + 56);
  v24 = result;
  if (!a2)
    goto LABEL_36;
LABEL_3:
  if (!a3)
  {
    v12 = 0;
    goto LABEL_46;
  }
  if (a3 < 0)
    goto LABEL_48;
  v12 = 0;
  v25 = (unint64_t)(v9 + 64) >> 6;
  v23 = v9;
  while (1)
  {
    if (v4 < 0)
    {
      if (!sub_21AD24138())
        goto LABEL_45;
      sub_21AD19700();
      swift_unknownObjectRetain();
      swift_dynamicCast();
      v15 = v26;
      result = (_QWORD *)swift_unknownObjectRelease();
      if (!v26)
        goto LABEL_45;
      goto LABEL_8;
    }
    if (v11)
    {
      v13 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      v14 = v13 | (v10 << 6);
      goto LABEL_7;
    }
    v16 = v10 + 1;
    if (__OFADD__(v10, 1))
      break;
    if (v16 >= v25)
    {
      v11 = 0;
      goto LABEL_45;
    }
    v17 = *(_QWORD *)(v8 + 8 * v16);
    if (v17)
      goto LABEL_23;
    v18 = v10 + 2;
    if (v10 + 2 >= v25)
    {
      v11 = 0;
      ++v10;
      goto LABEL_45;
    }
    v17 = *(_QWORD *)(v8 + 8 * v18);
    if (!v17)
    {
      if (v10 + 3 >= v25)
        goto LABEL_42;
      v17 = *(_QWORD *)(v8 + 8 * (v10 + 3));
      if (v17)
      {
        v16 = v10 + 3;
        goto LABEL_23;
      }
      v18 = v10 + 4;
      if (v10 + 4 >= v25)
      {
        v11 = 0;
        v10 += 3;
        goto LABEL_45;
      }
      v17 = *(_QWORD *)(v8 + 8 * v18);
      if (!v17)
      {
        v16 = v10 + 5;
        if (v10 + 5 >= v25)
        {
LABEL_42:
          v11 = 0;
          v10 = v18;
          goto LABEL_45;
        }
        v17 = *(_QWORD *)(v8 + 8 * v16);
        if (!v17)
        {
          v19 = v10 + 6;
          while (v25 != v19)
          {
            v17 = *(_QWORD *)(v8 + 8 * v19++);
            if (v17)
            {
              v16 = v19 - 1;
              goto LABEL_23;
            }
          }
          v11 = 0;
          v10 = v25 - 1;
          goto LABEL_45;
        }
        goto LABEL_23;
      }
    }
    v16 = v18;
LABEL_23:
    v11 = (v17 - 1) & v17;
    v14 = __clz(__rbit64(v17)) + (v16 << 6);
    v10 = v16;
LABEL_7:
    result = *(id *)(*(_QWORD *)(v4 + 48) + 8 * v14);
    v15 = result;
    if (!result)
      goto LABEL_45;
LABEL_8:
    ++v12;
    *v6++ = v15;
    if (v12 == a3)
    {
      v12 = a3;
LABEL_45:
      v9 = v23;
      goto LABEL_46;
    }
  }
  __break(1u);
LABEL_48:
  __break(1u);
  return result;
}

void sub_21AD181A8(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    sub_21AD2421C();
    swift_bridgeObjectRelease();
  }
  JUMPOUT(0x220756600);
}

uint64_t sub_21AD18210(unint64_t a1, void *a2)
{
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  BOOL v18;
  char v19;
  unint64_t v21;
  unint64_t v22;

  v2 = a1;
  if (a1 >> 62)
  {
LABEL_20:
    swift_bridgeObjectRetain();
    v3 = sub_21AD2421C();
    if (v3)
      goto LABEL_3;
  }
  else
  {
    v3 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v3)
    {
LABEL_3:
      v21 = v2;
      v22 = v2 & 0xC000000000000001;
      v4 = 4;
      while (1)
      {
        v5 = v4 - 4;
        if (v22)
        {
          v6 = (id)MEMORY[0x2207565F4](v4 - 4, v2);
          v7 = v4 - 3;
          if (__OFADD__(v5, 1))
            goto LABEL_19;
        }
        else
        {
          v6 = *(id *)(v2 + 8 * v4);
          v7 = v4 - 3;
          if (__OFADD__(v5, 1))
          {
LABEL_19:
            __break(1u);
            goto LABEL_20;
          }
        }
        v8 = v3;
        v9 = v6;
        v10 = objc_msgSend(v6, sel_identifier);
        v11 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
        v13 = v12;

        v14 = objc_msgSend(a2, sel_identifier);
        v15 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
        v17 = v16;

        v18 = v11 == v15 && v13 == v17;
        if (v18)
        {
          swift_bridgeObjectRelease();

          swift_bridgeObjectRelease();
          v19 = 1;
          goto LABEL_22;
        }
        v19 = sub_21AD2427C();

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v19 & 1) == 0)
        {
          ++v4;
          v3 = v8;
          v18 = v7 == v8;
          v2 = v21;
          if (!v18)
            continue;
        }
        goto LABEL_22;
      }
    }
  }
  v19 = 0;
LABEL_22:
  swift_bridgeObjectRelease();
  return v19 & 1;
}

uint64_t sub_21AD183D4(unint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  char v17;
  uint64_t v18;
  uint64_t v20;

  v3 = v2;
  if (a1 >> 62)
    goto LABEL_18;
  v5 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (v5)
  {
    v6 = 0;
    v20 = v3;
    while (1)
    {
      if ((a1 & 0xC000000000000001) != 0)
        v7 = (id)MEMORY[0x2207565F4](v6, a1);
      else
        v7 = *(id *)(a1 + 8 * v6 + 32);
      v8 = v7;
      v9 = objc_msgSend(v7, sel_identifier, v20);
      v10 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
      v12 = v11;

      v13 = objc_msgSend(a2, sel_identifier);
      v3 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
      v15 = v14;

      if (v10 == v3 && v12 == v15)
      {

        swift_bridgeObjectRelease_n();
        return v6;
      }
      v17 = sub_21AD2427C();

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v17 & 1) != 0)
        return v6;
      v18 = v6 + 1;
      if (__OFADD__(v6, 1))
        break;
      ++v6;
      if (v18 == v5)
        return 0;
    }
    __break(1u);
LABEL_18:
    swift_bridgeObjectRetain();
    v5 = sub_21AD2421C();
    swift_bridgeObjectRelease();
  }
  return 0;
}

uint64_t sub_21AD18574(unint64_t *a1, void *a2)
{
  uint64_t v2;
  unint64_t v5;
  char v6;
  char v7;
  id v8;
  unint64_t i;
  unint64_t v10;
  unint64_t v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v22;
  unint64_t v23;
  id v24;
  id v25;
  int isUniquelyReferenced_nonNull_bridgeObject;
  void *v27;
  unint64_t v28;
  int v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  unint64_t v39;

  v5 = swift_bridgeObjectRetain();
  v38 = a2;
  v39 = sub_21AD183D4(v5, a2);
  v7 = v6;
  swift_bridgeObjectRelease();
  v37 = v2;
  if (v2)
    return v39;
  if ((v7 & 1) == 0)
  {
    v8 = (id)(v39 + 1);
    if (__OFADD__(v39, 1))
      goto LABEL_60;
    if (*a1 >> 62)
    {
LABEL_61:
      swift_bridgeObjectRetain();
      v35 = sub_21AD2421C();
      swift_bridgeObjectRelease();
      if (v8 != (id)v35)
        goto LABEL_6;
    }
    else if (v8 != *(id *)((*a1 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
LABEL_6:
      for (i = v39 + 5; ; ++i)
      {
        v10 = i - 4;
        v11 = *a1;
        if ((*a1 & 0xC000000000000001) != 0)
        {
          v12 = (id)MEMORY[0x2207565F4](i - 4);
        }
        else
        {
          if ((v10 & 0x8000000000000000) != 0)
          {
            __break(1u);
LABEL_51:
            __break(1u);
LABEL_52:
            __break(1u);
LABEL_53:
            __break(1u);
LABEL_54:
            __break(1u);
LABEL_55:
            __break(1u);
LABEL_56:
            __break(1u);
LABEL_57:
            __break(1u);
LABEL_58:
            __break(1u);
LABEL_59:
            __break(1u);
LABEL_60:
            __break(1u);
            goto LABEL_61;
          }
          if (v10 >= *(_QWORD *)((v11 & 0xFFFFFFFFFFFFF8) + 0x10))
            goto LABEL_51;
          v12 = *(id *)(v11 + 8 * i);
        }
        v13 = v12;
        v14 = objc_msgSend(v12, sel_identifier, v37);
        v15 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
        v17 = v16;

        v8 = objc_msgSend(v38, sel_identifier);
        v18 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
        v20 = v19;

        if (v15 == v18 && v17 == v20)
        {

          swift_bridgeObjectRelease_n();
          goto LABEL_38;
        }
        v22 = sub_21AD2427C();

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v22 & 1) != 0)
          goto LABEL_38;
        if (v10 != v39)
          break;
LABEL_35:
        if (__OFADD__(v39, 1))
          goto LABEL_53;
        ++v39;
LABEL_38:
        v8 = (id)(i - 3);
        if (__OFADD__(v10, 1))
          goto LABEL_52;
        if (*a1 >> 62)
        {
          swift_bridgeObjectRetain();
          v32 = sub_21AD2421C();
          swift_bridgeObjectRelease();
        }
        else
        {
          v32 = *(_QWORD *)((*a1 & 0xFFFFFFFFFFFFF8) + 0x10);
        }
        if (v8 == (id)v32)
          return v39;
      }
      v23 = *a1;
      if ((*a1 & 0xC000000000000001) != 0)
      {
        v24 = (id)MEMORY[0x2207565F4](v39, *a1);
        v23 = *a1;
        if ((*a1 & 0xC000000000000001) == 0)
        {
LABEL_21:
          if ((v10 & 0x8000000000000000) != 0)
            goto LABEL_56;
          if (v10 >= *(_QWORD *)((v23 & 0xFFFFFFFFFFFFF8) + 0x10))
            goto LABEL_57;
          v25 = *(id *)(v23 + 8 * i);
          goto LABEL_24;
        }
      }
      else
      {
        if ((v39 & 0x8000000000000000) != 0)
          goto LABEL_54;
        if (v39 >= *(_QWORD *)((v23 & 0xFFFFFFFFFFFFF8) + 0x10))
          goto LABEL_55;
        v24 = *(id *)(v23 + 8 * v39 + 32);
        if ((v23 & 0xC000000000000001) == 0)
          goto LABEL_21;
      }
      v25 = (id)MEMORY[0x2207565F4](i - 4, v23);
      v23 = *a1;
LABEL_24:
      isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
      *a1 = v23;
      if (!isUniquelyReferenced_nonNull_bridgeObject
        || (v23 & 0x8000000000000000) != 0
        || (v23 & 0x4000000000000000) != 0)
      {
        sub_21AD181A8(v23);
      }
      v27 = *(void **)((v23 & 0xFFFFFFFFFFFFFF8) + 8 * v39 + 0x20);
      *(_QWORD *)((v23 & 0xFFFFFFFFFFFFFF8) + 8 * v39 + 0x20) = v25;

      sub_21AD23FB8();
      v28 = *a1;
      v29 = swift_isUniquelyReferenced_nonNull_bridgeObject();
      *a1 = v28;
      if (!v29 || (v28 & 0x8000000000000000) != 0 || (v28 & 0x4000000000000000) != 0)
        sub_21AD181A8(v28);
      if ((v10 & 0x8000000000000000) != 0)
        goto LABEL_58;
      v30 = v28 & 0xFFFFFFFFFFFFFF8;
      if (v10 >= *(_QWORD *)((v28 & 0xFFFFFFFFFFFFFF8) + 0x10))
        goto LABEL_59;
      v31 = *(void **)(v30 + 8 * i);
      *(_QWORD *)(v30 + 8 * i) = v24;

      sub_21AD23FB8();
      goto LABEL_35;
    }
    return v39;
  }
  v33 = *a1;
  if (!(v33 >> 62))
    return *(_QWORD *)((v33 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  v36 = sub_21AD2421C();
  swift_bridgeObjectRelease();
  return v36;
}

uint64_t sub_21AD18944(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  unint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  int isUniquelyReferenced_nonNull_bridgeObject;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t result;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  if (a1 < 0)
  {
    __break(1u);
  }
  else
  {
    v2 = a2;
    v4 = a1;
    if (!(*v3 >> 62))
    {
      if (*(_QWORD *)((*v3 & 0xFFFFFFFFFFFFF8) + 0x10) >= a2)
        goto LABEL_4;
LABEL_31:
      __break(1u);
      goto LABEL_32;
    }
  }
  swift_bridgeObjectRetain();
  v21 = sub_21AD2421C();
  swift_bridgeObjectRelease();
  if (v21 < v2)
    goto LABEL_31;
LABEL_4:
  v6 = v2 - v4;
  if (__OFSUB__(v2, v4))
  {
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
  v5 = v4 - v2;
  if (__OFSUB__(0, v6))
  {
LABEL_33:
    __break(1u);
LABEL_34:
    swift_bridgeObjectRetain();
    v7 = sub_21AD2421C();
    swift_bridgeObjectRelease();
    v8 = v7 + v5;
    if (!__OFADD__(v7, v5))
      goto LABEL_8;
LABEL_36:
    __break(1u);
LABEL_37:
    swift_bridgeObjectRetain();
    v12 = sub_21AD2421C();
    swift_bridgeObjectRelease();
    v9 = *v3;
    goto LABEL_15;
  }
  if (*v3 >> 62)
    goto LABEL_34;
  v7 = *(_QWORD *)((*v3 & 0xFFFFFFFFFFFFF8) + 0x10);
  v8 = v7 - v6;
  if (__OFADD__(v7, v5))
    goto LABEL_36;
LABEL_8:
  v9 = *v3;
  isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *v3 = v9;
  v7 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v9 & 0x8000000000000000) == 0 && (v9 & 0x4000000000000000) == 0)
  {
    v11 = v9 & 0xFFFFFFFFFFFFFF8;
    if (v8 <= *(_QWORD *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      goto LABEL_18;
    v7 = 1;
  }
  if (v9 >> 62)
    goto LABEL_37;
  v12 = *(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10);
LABEL_15:
  if (v12 <= v8)
    v12 = v8;
  swift_bridgeObjectRetain();
  *v3 = MEMORY[0x220756600](v7, v12, 1, v9);
  swift_bridgeObjectRelease();
  v11 = *v3 & 0xFFFFFFFFFFFFFF8;
LABEL_18:
  v13 = v11 + 32;
  v14 = (char *)(v11 + 32 + 8 * v4);
  sub_21AD19700();
  swift_arrayDestroy();
  if (!v5)
    return sub_21AD23FB8();
  if (!(*v3 >> 62))
  {
    v15 = *(_QWORD *)((*v3 & 0xFFFFFFFFFFFFF8) + 0x10);
    v16 = v15 - v2;
    if (!__OFSUB__(v15, v2))
      goto LABEL_21;
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  swift_bridgeObjectRetain();
  v22 = sub_21AD2421C();
  swift_bridgeObjectRelease();
  v16 = v22 - v2;
  if (__OFSUB__(v22, v2))
    goto LABEL_40;
LABEL_21:
  if ((v16 & 0x8000000000000000) == 0)
  {
    v17 = (char *)(v13 + 8 * v2);
    if (v4 != v2 || v14 >= &v17[8 * v16])
      memmove(v14, v17, 8 * v16);
    if (!(*v3 >> 62))
    {
      v18 = *(_QWORD *)((*v3 & 0xFFFFFFFFFFFFF8) + 0x10);
      v19 = v18 + v5;
      if (!__OFADD__(v18, v5))
      {
LABEL_27:
        *(_QWORD *)((*v3 & 0xFFFFFFFFFFFFF8) + 0x10) = v19;
        return sub_21AD23FB8();
      }
      goto LABEL_43;
    }
LABEL_41:
    swift_bridgeObjectRetain();
    v23 = sub_21AD2421C();
    swift_bridgeObjectRelease();
    v19 = v23 + v5;
    if (!__OFADD__(v23, v5))
      goto LABEL_27;
LABEL_43:
    __break(1u);
  }
  result = sub_21AD2424C();
  __break(1u);
  return result;
}

uint64_t sub_21AD18C3C()
{
  char *v0;
  char *v1;
  char *v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t i;
  id v7;
  void *v8;
  uint64_t v9;
  char *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  char *v15;
  id v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  _BYTE *v20;
  uint64_t v21[8];

  v1 = &v0[OBJC_IVAR____TtC18AXSoundDetectionUI38AXSDSecureBaseControllerImplementation_isEnabled];
  swift_beginAccess();
  if (*v1 != 1)
  {
    if (qword_2551178E0 != -1)
      swift_once();
    v9 = sub_21AD23EEC();
    __swift_project_value_buffer(v9, (uint64_t)qword_2551180B8);
    v10 = v0;
    v11 = sub_21AD23EE0();
    v12 = sub_21AD24060();
    if (os_log_type_enabled(v11, v12))
    {
      v13 = (uint8_t *)swift_slowAlloc();
      v14 = swift_slowAlloc();
      *(_DWORD *)v13 = 136315138;
      v21[0] = v14;
      v15 = v10;
      v16 = objc_msgSend(v15, sel_description);
      v17 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
      v19 = v18;

      v21[7] = sub_21ACF58B4(v17, v19, v21);
      sub_21AD240CC();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_21ACD4000, v11, v12, "[%s]: trying to start sound analysis while the feature is not enabled. Need to enable it first.", v13, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x220756ED0](v14, -1, -1);
      MEMORY[0x220756ED0](v13, -1, -1);

    }
    else
    {

    }
    sub_21AD1973C();
    swift_allocError();
    *v20 = 0;
    return swift_willThrow();
  }
  v2 = &v0[OBJC_IVAR____TtC18AXSoundDetectionUI38AXSDSecureBaseControllerImplementation_currentDetectors];
  swift_beginAccess();
  v3 = *(_QWORD *)v2;
  if (v3 >> 62)
  {
    swift_bridgeObjectRetain_n();
    result = sub_21AD2421C();
    v4 = result;
    if (result)
      goto LABEL_4;
    return swift_bridgeObjectRelease_n();
  }
  v4 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10);
  result = swift_bridgeObjectRetain_n();
  if (!v4)
    return swift_bridgeObjectRelease_n();
LABEL_4:
  if (v4 >= 1)
  {
    for (i = 0; i != v4; ++i)
    {
      if ((v3 & 0xC000000000000001) != 0)
        v7 = (id)MEMORY[0x2207565F4](i, v3);
      else
        v7 = *(id *)(v3 + 8 * i + 32);
      v8 = v7;
      sub_21AD0F658(v7);

    }
    return swift_bridgeObjectRelease_n();
  }
  __break(1u);
  return result;
}

uint64_t sub_21AD18F34()
{
  char *v0;
  char *v1;
  uint64_t v2;
  char *v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;
  char *v8;
  id v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  char *v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t result;
  uint64_t i;
  id v18;
  void *v19;
  _BYTE *v20;
  uint64_t v21[8];

  v1 = &v0[OBJC_IVAR____TtC18AXSoundDetectionUI38AXSDSecureBaseControllerImplementation_isEnabled];
  swift_beginAccess();
  if ((*v1 & 1) == 0)
  {
    v13 = &v0[OBJC_IVAR____TtC18AXSoundDetectionUI38AXSDSecureBaseControllerImplementation_currentDetectors];
    swift_beginAccess();
    v14 = *(_QWORD *)v13;
    if (v14 >> 62)
    {
      swift_bridgeObjectRetain_n();
      result = sub_21AD2421C();
      v15 = result;
      if (!result)
        return swift_bridgeObjectRelease_n();
    }
    else
    {
      v15 = *(_QWORD *)((v14 & 0xFFFFFFFFFFFFF8) + 0x10);
      result = swift_bridgeObjectRetain_n();
      if (!v15)
        return swift_bridgeObjectRelease_n();
    }
    if (v15 < 1)
    {
      __break(1u);
      return result;
    }
    for (i = 0; i != v15; ++i)
    {
      if ((v14 & 0xC000000000000001) != 0)
        v18 = (id)MEMORY[0x2207565F4](i, v14);
      else
        v18 = *(id *)(v14 + 8 * i + 32);
      v19 = v18;
      sub_21AD0F9A0(v18);

    }
    return swift_bridgeObjectRelease_n();
  }
  if (qword_2551178E0 != -1)
    swift_once();
  v2 = sub_21AD23EEC();
  __swift_project_value_buffer(v2, (uint64_t)qword_2551180B8);
  v3 = v0;
  v4 = sub_21AD23EE0();
  v5 = sub_21AD24060();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc();
    v7 = swift_slowAlloc();
    *(_DWORD *)v6 = 136315138;
    v21[0] = v7;
    v8 = v3;
    v9 = objc_msgSend(v8, sel_description);
    v10 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
    v12 = v11;

    v21[7] = sub_21ACF58B4(v10, v12, v21);
    sub_21AD240CC();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21ACD4000, v4, v5, "[%s]: trying to stop sound analysis while the feature is enabled. Need to disable it first.", v6, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x220756ED0](v7, -1, -1);
    MEMORY[0x220756ED0](v6, -1, -1);

  }
  else
  {

  }
  sub_21AD1973C();
  swift_allocError();
  *v20 = 1;
  return swift_willThrow();
}

uint64_t type metadata accessor for AXSDSecureBaseControllerImplementation()
{
  return objc_opt_self();
}

uint64_t sub_21AD1924C@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v3;

  v3 = (_QWORD *)(*a1 + OBJC_IVAR____TtC18AXSoundDetectionUI38AXSDSecureBaseControllerImplementation_currentDetectors);
  swift_beginAccess();
  *a2 = *v3;
  return swift_bridgeObjectRetain();
}

uint64_t sub_21AD192A4@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(*a1 + OBJC_IVAR____TtC18AXSoundDetectionUI38AXSDSecureBaseControllerImplementation_isEnabled);
  result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

uint64_t sub_21AD192F4(char *a1, _QWORD *a2)
{
  char v2;
  _BYTE *v3;
  uint64_t result;

  v2 = *a1;
  v3 = (_BYTE *)(*a2 + OBJC_IVAR____TtC18AXSoundDetectionUI38AXSDSecureBaseControllerImplementation_isEnabled);
  result = swift_beginAccess();
  *v3 = v2;
  return result;
}

uint64_t method lookup function for AXSDSecureBaseControllerImplementation()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of AXSDSecureBaseControllerImplementation.currentDetectors.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x80))();
}

uint64_t dispatch thunk of AXSDSecureBaseControllerImplementation.isEnabled.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x98))();
}

uint64_t dispatch thunk of AXSDSecureBaseControllerImplementation.isListening.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xB0))();
}

uint64_t dispatch thunk of AXSDSecureBaseControllerImplementation.isSecure.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xB8))();
}

uint64_t dispatch thunk of AXSDSecureBaseControllerImplementation.startListening()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xD8))();
}

uint64_t dispatch thunk of AXSDSecureBaseControllerImplementation.stopListening()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xE8))();
}

uint64_t dispatch thunk of AXSDSecureBaseControllerImplementation.verifyTasks()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x138))();
}

uint64_t sub_21AD19410()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v1 = sub_21AD23D9C();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = (*(_QWORD *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  swift_unknownObjectRelease();

  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

uint64_t sub_21AD194B0(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;

  v4 = *(_QWORD *)(sub_21AD23D9C() - 8);
  v5 = (*(unsigned __int8 *)(v4 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v6 = v1[2];
  v7 = v1[3];
  v8 = v1[4];
  v9 = v1[5];
  v10 = (uint64_t)v1 + v5;
  v11 = *(_QWORD *)((char *)v1 + ((*(_QWORD *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFF8));
  v12 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v12;
  *v12 = v2;
  v12[1] = sub_21AD19894;
  return sub_21AD122C8(a1, v6, v7, v8, v9, v10, v11);
}

unint64_t sub_21AD19568()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255118168;
  if (!qword_255118168)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255118158);
    result = MEMORY[0x220756E40](MEMORY[0x24BDE9A90], v1);
    atomic_store(result, (unint64_t *)&qword_255118168);
  }
  return result;
}

uint64_t sub_21AD195B4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v1 = sub_21AD23E14();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = (*(_QWORD *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  swift_unknownObjectRelease();

  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

uint64_t sub_21AD1964C(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;

  v4 = *(_QWORD *)(sub_21AD23E14() - 8);
  v5 = (*(unsigned __int8 *)(v4 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v6 = v1[2];
  v7 = v1[3];
  v8 = v1[4];
  v9 = (uint64_t)v1 + v5;
  v10 = *(_QWORD *)((char *)v1 + ((*(_QWORD *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFF8));
  v11 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v11;
  *v11 = v2;
  v11[1] = sub_21AD090E0;
  return sub_21AD1053C(a1, v6, v7, v8, v9, v10);
}

uint64_t sub_21AD196F8()
{
  return swift_release();
}

unint64_t sub_21AD19700()
{
  unint64_t result;

  result = qword_2551182B0;
  if (!qword_2551182B0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2551182B0);
  }
  return result;
}

unint64_t sub_21AD1973C()
{
  unint64_t result;

  result = qword_255118190;
  if (!qword_255118190)
  {
    result = MEMORY[0x220756E40](&unk_21AD273F0, &type metadata for SoundRecognitionError);
    atomic_store(result, (unint64_t *)&qword_255118190);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for SoundRecognitionError(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 1 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFF)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFE)
    return ((uint64_t (*)(void))((char *)&loc_21AD197CC + 4 * byte_21AD272E5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_21AD19800 + 4 * asc_21AD272E0[v4]))();
}

uint64_t sub_21AD19800(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_21AD19808(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21AD19810);
  return result;
}

uint64_t sub_21AD1981C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x21AD19824);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_21AD19828(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21AD19830(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SoundRecognitionError()
{
  return &type metadata for SoundRecognitionError;
}

unint64_t sub_21AD19850()
{
  unint64_t result;

  result = qword_255118198;
  if (!qword_255118198)
  {
    result = MEMORY[0x220756E40](&unk_21AD273C8, &type metadata for SoundRecognitionError);
    atomic_store(result, (unint64_t *)&qword_255118198);
  }
  return result;
}

uint64_t sub_21AD1989C()
{
  return _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
}

uint64_t *sub_21AD198A4(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v5 = *(_QWORD *)(a3 - 8);
  v6 = *(_DWORD *)(v5 + 80);
  if ((v6 & 0x20000) != 0)
  {
    v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v6 + 16) & ~(unint64_t)v6));
    swift_retain();
  }
  else
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(qword_2551181A0);
    v8 = *(_QWORD *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
    {
      memcpy(a1, a2, *(_QWORD *)(v5 + 64));
    }
    else
    {
      v10 = sub_21AD23D9C();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(a1, a2, v10);
      (*(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
    }
  }
  return a1;
}

uint64_t sub_21AD1997C(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;

  v2 = __swift_instantiateConcreteTypeFromMangledName(qword_2551181A0);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 48))(a1, 1, v2);
  if (!(_DWORD)result)
  {
    v4 = sub_21AD23D9C();
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  }
  return result;
}

void *sub_21AD199E4(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = __swift_instantiateConcreteTypeFromMangledName(qword_2551181A0);
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    v8 = sub_21AD23D9C();
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(a1, a2, v8);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  return a1;
}

void *sub_21AD19A98(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(void *, uint64_t, uint64_t);
  int v9;
  int v10;
  uint64_t v11;
  uint64_t v13;

  v6 = __swift_instantiateConcreteTypeFromMangledName(qword_2551181A0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v7 + 48);
  v9 = v8(a1, 1, v6);
  v10 = v8(a2, 1, v6);
  if (!v9)
  {
    if (!v10)
    {
      v13 = sub_21AD23D9C();
      (*(void (**)(void *, void *, uint64_t))(*(_QWORD *)(v13 - 8) + 24))(a1, a2, v13);
      return a1;
    }
    sub_21AD19B9C((uint64_t)a1);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    return a1;
  }
  v11 = sub_21AD23D9C();
  (*(void (**)(void *, void *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(a1, a2, v11);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  return a1;
}

uint64_t sub_21AD19B9C(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(qword_2551181A0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void *sub_21AD19BDC(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = __swift_instantiateConcreteTypeFromMangledName(qword_2551181A0);
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    v8 = sub_21AD23D9C();
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(a1, a2, v8);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  return a1;
}

void *sub_21AD19C90(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(void *, uint64_t, uint64_t);
  int v9;
  int v10;
  uint64_t v11;
  uint64_t v13;

  v6 = __swift_instantiateConcreteTypeFromMangledName(qword_2551181A0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v7 + 48);
  v9 = v8(a1, 1, v6);
  v10 = v8(a2, 1, v6);
  if (!v9)
  {
    if (!v10)
    {
      v13 = sub_21AD23D9C();
      (*(void (**)(void *, void *, uint64_t))(*(_QWORD *)(v13 - 8) + 40))(a1, a2, v13);
      return a1;
    }
    sub_21AD19B9C((uint64_t)a1);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    return a1;
  }
  v11 = sub_21AD23D9C();
  (*(void (**)(void *, void *, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(a1, a2, v11);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  return a1;
}

uint64_t sub_21AD19D94()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_21AD19DA0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  unsigned int v5;

  v4 = __swift_instantiateConcreteTypeFromMangledName(qword_2551181A0);
  v5 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
  if (v5 >= 2)
    return v5 - 1;
  else
    return 0;
}

uint64_t sub_21AD19DF0()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_21AD19DFC(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;

  if (a2)
    v5 = (a2 + 1);
  else
    v5 = 0;
  v6 = __swift_instantiateConcreteTypeFromMangledName(qword_2551181A0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(a1, v5, a3, v6);
}

uint64_t sub_21AD19E50(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(qword_2551181A0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 48))(a1, 1, v2);
}

uint64_t sub_21AD19E8C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(qword_2551181A0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, 1, v4);
}

uint64_t type metadata accessor for AXSDError()
{
  uint64_t result;

  result = qword_255118218;
  if (!qword_255118218)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_21AD19F0C()
{
  uint64_t result;
  unint64_t v1;

  result = sub_21AD23D9C();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataSinglePayload();
    return 0;
  }
  return result;
}

id sub_21AD19FA8()
{
  uint64_t v0;
  id *v1;

  v1 = (id *)(v0 + OBJC_IVAR____TtC18AXSoundDetectionUI30AXSDNSControllerImplementation_detectorManager);
  swift_beginAccess();
  return *v1;
}

void sub_21AD1A048(void *a1)
{
  uint64_t v1;
  void **v3;
  void *v4;

  v3 = (void **)(v1 + OBJC_IVAR____TtC18AXSoundDetectionUI30AXSDNSControllerImplementation_detectorManager);
  swift_beginAccess();
  v4 = *v3;
  *v3 = a1;

}

void sub_21AD1A098(void **a1, _QWORD *a2)
{
  void *v2;
  void **v3;
  void *v4;
  id v5;

  v2 = *a1;
  v3 = (void **)(*a2 + OBJC_IVAR____TtC18AXSoundDetectionUI30AXSDNSControllerImplementation_detectorManager);
  swift_beginAccess();
  v4 = *v3;
  *v3 = v2;
  v5 = v2;

}

uint64_t (*sub_21AD1A0F8())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_21AD1A230()
{
  uint64_t v0;
  id *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;

  v1 = (id *)(v0 + OBJC_IVAR____TtC18AXSoundDetectionUI30AXSDNSControllerImplementation_detectorManager);
  swift_beginAccess();
  v2 = objc_msgSend(*v1, sel_currentDetectors);
  type metadata accessor for AXSDSoundDetectionType();
  v3 = sub_21AD23FAC();

  v4 = sub_21ACF7FA4(v3);
  swift_bridgeObjectRelease();
  return v4;
}

id sub_21AD1A358()
{
  void *v0;
  id v1;
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;

  v1 = objc_allocWithZone((Class)AXSDDetectorManager);
  v2 = v0;
  v3 = objc_msgSend(v1, sel_init);
  v4 = objc_msgSend(objc_allocWithZone((Class)AXSDDetectorQueueManager), sel_init);

  v5 = objc_allocWithZone((Class)type metadata accessor for AXSDNSControllerImplementation());
  v6 = v3;
  v7 = v4;
  v8 = sub_21AD1F0EC(v6, v7);

  swift_getObjectType();
  swift_deallocPartialClassInstance();
  v9 = v8;
  objc_msgSend(v6, sel_setDelegate_, v9);
  objc_msgSend(v7, sel_setDelegate_, v9);

  return v9;
}

id AXSDNSControllerImplementation.__allocating_init(detectorManager:queueManager:)(void *a1, void *a2)
{
  objc_class *v2;
  id v5;
  id v6;

  v5 = objc_allocWithZone(v2);
  v6 = sub_21AD1F0EC(a1, a2);

  return v6;
}

id AXSDNSControllerImplementation.init(detectorManager:queueManager:)(void *a1, void *a2)
{
  id v4;

  v4 = sub_21AD1F0EC(a1, a2);

  return v4;
}

id sub_21AD1A504(void *a1)
{
  return sub_21AD1A580(a1, "[%s]: adding listen type: %s", (SEL *)&selRef_addListenType_);
}

id sub_21AD1A56C(void *a1)
{
  return sub_21AD1A580(a1, "[%s]: removing listen type: %s", (SEL *)&selRef_removeListenType_);
}

id sub_21AD1A580(void *a1, char *a2, SEL *a3)
{
  void *v3;
  uint64_t v7;
  id v8;
  id v9;
  char *v10;
  id v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  char *v15;
  id v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char *format;
  uint64_t v24;
  SEL *v25;
  uint64_t v26;

  if (qword_2551178E0 != -1)
    swift_once();
  v7 = sub_21AD23EEC();
  __swift_project_value_buffer(v7, (uint64_t)qword_2551180B8);
  v8 = v3;
  v9 = a1;
  v10 = (char *)v8;
  v11 = v9;
  v12 = sub_21AD23EE0();
  v13 = sub_21AD2406C();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = swift_slowAlloc();
    v24 = swift_slowAlloc();
    v26 = v24;
    *(_DWORD *)v14 = 136315394;
    v15 = v10;
    format = a2;
    v16 = objc_msgSend(v15, sel_description);
    v25 = a3;
    v17 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
    v19 = v18;

    sub_21ACF58B4(v17, v19, &v26);
    sub_21AD240CC();

    swift_bridgeObjectRelease();
    *(_WORD *)(v14 + 12) = 2080;
    v20 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
    sub_21ACF58B4(v20, v21, &v26);
    a3 = v25;
    sub_21AD240CC();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21ACD4000, v12, v13, format, (uint8_t *)v14, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x220756ED0](v24, -1, -1);
    MEMORY[0x220756ED0](v14, -1, -1);

  }
  else
  {

  }
  return objc_msgSend(*(id *)&v10[OBJC_IVAR____TtC18AXSoundDetectionUI30AXSDNSControllerImplementation_detectorQueueManager], *a3, v11);
}

uint64_t sub_21AD1A830()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
  char *v25;
  uint8_t *v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t aBlock[6];

  v1 = sub_21AD23F04();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v27 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_21AD23F1C();
  v33 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v32 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2551178E0 != -1)
    swift_once();
  v7 = sub_21AD23EEC();
  __swift_project_value_buffer(v7, (uint64_t)qword_2551180B8);
  v8 = v0;
  v9 = sub_21AD23EE0();
  v10 = sub_21AD2406C();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc();
    v12 = swift_slowAlloc();
    v29 = v4;
    v13 = v12;
    aBlock[0] = v12;
    v28 = v5;
    *(_DWORD *)v11 = 136315138;
    v27 = v11 + 4;
    v14 = v8;
    v31 = v1;
    v15 = v14;
    v16 = objc_msgSend(v14, sel_description);
    v17 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
    v30 = v2;
    v19 = v18;

    v34 = sub_21ACF58B4(v17, v19, aBlock);
    v5 = v28;
    sub_21AD240CC();

    v2 = v30;
    v1 = v31;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21ACD4000, v9, v10, "[%s]: removing all listen types", v11, 0xCu);
    swift_arrayDestroy();
    v20 = v13;
    v4 = v29;
    MEMORY[0x220756ED0](v20, -1, -1);
    MEMORY[0x220756ED0](v11, -1, -1);

  }
  else
  {

  }
  sub_21ACF8044(0, (unint64_t *)&qword_255117BD0);
  v21 = (void *)sub_21AD24090();
  v22 = swift_allocObject();
  *(_QWORD *)(v22 + 16) = v8;
  aBlock[4] = (uint64_t)sub_21AD1F250;
  aBlock[5] = v22;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_21ACF4004;
  aBlock[3] = (uint64_t)&block_descriptor_4;
  v23 = _Block_copy(aBlock);
  v24 = v8;
  swift_release();
  v25 = v32;
  sub_21AD23F10();
  aBlock[0] = MEMORY[0x24BEE4AF8];
  sub_21ACF7DA4((unint64_t *)&qword_255117940, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255118240);
  sub_21ACF7B30();
  sub_21AD240E4();
  MEMORY[0x220756504](0, v25, v4, v23);
  _Block_release(v23);

  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  return (*(uint64_t (**)(char *, uint64_t))(v33 + 8))(v25, v5);
}

void _s18AXSoundDetectionUI30AXSDNSControllerImplementationC28assetsReadyAndDetectorsAddedyyF_0()
{
  void *v0;
  char *v1;
  id v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v1 = v0;
  v2 = objc_msgSend(v1, sel_description);
  v3 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
  v5 = v4;

  if (qword_2551178E0 != -1)
    swift_once();
  v6 = sub_21AD23EEC();
  __swift_project_value_buffer(v6, (uint64_t)qword_2551180B8);
  swift_bridgeObjectRetain_n();
  v7 = sub_21AD23EE0();
  v8 = sub_21AD2406C();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    v10 = swift_slowAlloc();
    v16 = v10;
    *(_DWORD *)v9 = 136315138;
    swift_bridgeObjectRetain();
    v15 = sub_21ACF58B4(v3, v5, &v16);
    sub_21AD240CC();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_21ACD4000, v7, v8, "[%s]: start listening", v9, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x220756ED0](v10, -1, -1);
    MEMORY[0x220756ED0](v9, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  if (objc_msgSend(*(id *)&v1[OBJC_IVAR____TtC18AXSoundDetectionUI30AXSDNSControllerImplementation_detectorQueueManager], sel_prepareToListen, v15, v16))
  {
    swift_bridgeObjectRelease();
    sub_21ACF7364(v1, v1);
  }
  else
  {
    swift_bridgeObjectRetain();
    v11 = sub_21AD23EE0();
    v12 = sub_21AD2406C();
    if (os_log_type_enabled(v11, v12))
    {
      v13 = (uint8_t *)swift_slowAlloc();
      v14 = swift_slowAlloc();
      v16 = v14;
      *(_DWORD *)v13 = 136315138;
      swift_bridgeObjectRetain();
      sub_21ACF58B4(v3, v5, &v16);
      sub_21AD240CC();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_21ACD4000, v11, v12, "[%s]: detector queue manager not ready, returning", v13, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x220756ED0](v14, -1, -1);
      MEMORY[0x220756ED0](v13, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

uint64_t sub_21AD1AF58()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  id v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint64_t v15;
  uint8_t *v16;
  uint64_t v17;
  uint8_t *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  char *v22;
  char *v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t aBlock[6];

  v1 = sub_21AD23F04();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v25 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_21AD23F1C();
  v29 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v28 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = v0;
  v8 = objc_msgSend(v7, sel_description);
  v9 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
  v11 = v10;

  if (qword_2551178E0 != -1)
    swift_once();
  v12 = sub_21AD23EEC();
  __swift_project_value_buffer(v12, (uint64_t)qword_2551180B8);
  swift_bridgeObjectRetain();
  v13 = sub_21AD23EE0();
  v14 = sub_21AD2406C();
  if (os_log_type_enabled(v13, v14))
  {
    v25 = v9;
    v15 = swift_slowAlloc();
    v27 = v1;
    v16 = (uint8_t *)v15;
    v17 = swift_slowAlloc();
    aBlock[0] = v17;
    v26 = v5;
    *(_DWORD *)v16 = 136315138;
    swift_bridgeObjectRetain();
    v30 = sub_21ACF58B4(v25, v11, aBlock);
    v5 = v26;
    sub_21AD240CC();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_21ACD4000, v13, v14, "[%s]: stop listening", v16, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x220756ED0](v17, -1, -1);
    v18 = v16;
    v1 = v27;
    MEMORY[0x220756ED0](v18, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  objc_msgSend(*(id *)&v7[OBJC_IVAR____TtC18AXSoundDetectionUI30AXSDNSControllerImplementation_detectorQueueManager], sel_stopListening);
  sub_21ACF8044(0, (unint64_t *)&qword_255117BD0);
  v19 = (void *)sub_21AD24090();
  v20 = swift_allocObject();
  *(_QWORD *)(v20 + 16) = v7;
  aBlock[4] = (uint64_t)sub_21AD1F274;
  aBlock[5] = v20;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_21ACF4004;
  aBlock[3] = (uint64_t)&block_descriptor_6_2;
  v21 = _Block_copy(aBlock);
  v22 = v7;
  swift_release();
  v23 = v28;
  sub_21AD23F10();
  aBlock[0] = MEMORY[0x24BEE4AF8];
  sub_21ACF7DA4((unint64_t *)&qword_255117940, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255118240);
  sub_21ACF7B30();
  sub_21AD240E4();
  MEMORY[0x220756504](0, v23, v4, v21);
  _Block_release(v21);

  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  return (*(uint64_t (**)(char *, uint64_t))(v29 + 8))(v23, v5);
}

id sub_21AD1B31C(char *a1)
{
  id *v2;

  sub_21ACFA6C8(a1, a1);
  v2 = (id *)&a1[OBJC_IVAR____TtC18AXSoundDetectionUI30AXSDNSControllerImplementation_detectorManager];
  swift_beginAccess();
  return objc_msgSend(*v2, sel_stopDetection);
}

uint64_t sub_21AD1B3AC()
{
  uint64_t v0;

  return swift_bridgeObjectRelease();
}

id AXSDNSControllerImplementation.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AXSDNSControllerImplementation();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t AXSDNSControllerImplementation.pipe(inFileURL:)(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void (*v13)(char *, uint64_t, uint64_t);
  id v14;
  NSObject *v15;
  os_log_type_t v16;
  int v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  void *v28;
  char *v29;
  char *v30;
  uint64_t v31;
  id v32;
  uint64_t v34;
  int v35;
  void *v36;
  void (*v37)(char *, uint64_t, uint64_t);
  uint64_t v38;
  uint64_t v39;
  id v40[2];

  v2 = v1;
  v40[1] = *(id *)MEMORY[0x24BDAC8D0];
  v4 = sub_21AD23D9C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((sub_21AD23D60() & 1) == 0)
  {
    if (qword_2551178E0 != -1)
      swift_once();
    v12 = sub_21AD23EEC();
    __swift_project_value_buffer(v12, (uint64_t)qword_2551180B8);
    v13 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
    v13(v7, a1, v4);
    v14 = v1;
    v15 = sub_21AD23EE0();
    v16 = sub_21AD2406C();
    v17 = v16;
    if (os_log_type_enabled(v15, v16))
    {
      v18 = swift_slowAlloc();
      v36 = (void *)swift_slowAlloc();
      v40[0] = v36;
      *(_DWORD *)v18 = 136315394;
      v34 = v18 + 4;
      v19 = v14;
      v20 = objc_msgSend(v19, sel_description);
      v37 = v13;
      v21 = v20;
      v22 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
      v35 = v17;
      v23 = v22;
      v38 = a1;
      v25 = v24;

      v39 = sub_21ACF58B4(v23, v25, (uint64_t *)v40);
      sub_21AD240CC();

      swift_bridgeObjectRelease();
      *(_WORD *)(v18 + 12) = 2080;
      sub_21ACF7DA4(&qword_255117C20, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDB28]);
      v26 = sub_21AD24270();
      v39 = sub_21ACF58B4(v26, v27, (uint64_t *)v40);
      v13 = v37;
      a1 = v38;
      sub_21AD240CC();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
      _os_log_impl(&dword_21ACD4000, v15, (os_log_type_t)v35, "[%s]: piped in fileURL: %s is not a valid file URL", (uint8_t *)v18, 0x16u);
      v28 = v36;
      swift_arrayDestroy();
      MEMORY[0x220756ED0](v28, -1, -1);
      MEMORY[0x220756ED0](v18, -1, -1);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    }

    type metadata accessor for AXSDError();
    sub_21ACF7DA4(&qword_255118250, (uint64_t (*)(uint64_t))type metadata accessor for AXSDError, (uint64_t)&unk_21AD27470);
    swift_allocError();
    v30 = v29;
    v13(v29, a1, v4);
    v31 = __swift_instantiateConcreteTypeFromMangledName(qword_2551181A0);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v31 - 8) + 56))(v30, 0, 1, v31);
    goto LABEL_11;
  }
  sub_21AD23D90();
  v8 = (void *)sub_21AD23F4C();
  swift_bridgeObjectRelease();
  v40[0] = 0;
  v9 = objc_msgSend(v2, sel_pipeInFilePath_error_, v8, v40);

  v10 = v40[0];
  if (!v9)
  {
    v32 = v40[0];
    sub_21AD23D54();

LABEL_11:
    swift_willThrow();
    return v4;
  }
  type metadata accessor for AXSDSoundDetectionType();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255118258);
  sub_21ACF7DA4(&qword_255118260, (uint64_t (*)(uint64_t))type metadata accessor for AXSDSoundDetectionType, (uint64_t)&unk_21AD26EC0);
  v4 = sub_21AD23F34();
  v11 = v10;

  return v4;
}

uint64_t AXSDNSControllerImplementation.pipe(inFilePath:)(uint64_t a1, unint64_t a2)
{
  void *v2;
  char *v5;
  id v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  id *v17;
  id v18;
  void *v19;
  uint64_t result;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25[3];
  uint64_t v26;

  v5 = v2;
  v6 = objc_msgSend(v5, sel_description);
  v7 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
  v9 = v8;

  if (qword_2551178E0 != -1)
    swift_once();
  v10 = sub_21AD23EEC();
  __swift_project_value_buffer(v10, (uint64_t)qword_2551180B8);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  v11 = sub_21AD23EE0();
  v12 = sub_21AD2406C();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = swift_slowAlloc();
    v24 = a1;
    v25[0] = swift_slowAlloc();
    v14 = v25[0];
    *(_DWORD *)v13 = 136315394;
    swift_bridgeObjectRetain();
    v26 = sub_21ACF58B4(v7, v9, v25);
    sub_21AD240CC();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v13 + 12) = 2080;
    swift_bridgeObjectRetain();
    v26 = sub_21ACF58B4(v24, a2, v25);
    sub_21AD240CC();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_21ACD4000, v11, v12, "[%s]: AUTOMATION: piped in file: %s", (uint8_t *)v13, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x220756ED0](v14, -1, -1);
    MEMORY[0x220756ED0](v13, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }
  v15 = sub_21ACFDD84(MEMORY[0x24BEE4AF8]);
  v16 = OBJC_IVAR____TtC18AXSoundDetectionUI30AXSDNSControllerImplementation_recentDetections;
  *(_QWORD *)&v5[OBJC_IVAR____TtC18AXSoundDetectionUI30AXSDNSControllerImplementation_recentDetections] = v15;
  swift_bridgeObjectRelease();
  v17 = (id *)&v5[OBJC_IVAR____TtC18AXSoundDetectionUI34AXSDNSBaseControllerImplementation_listener];
  swift_beginAccess();
  v18 = *v17;
  v19 = (void *)sub_21AD23F4C();
  objc_msgSend(v18, sel_pipeInFile_, v19);

  result = *(_QWORD *)&v5[v16];
  if (result)
  {
    *(_QWORD *)&v5[v16] = 0;
  }
  else
  {
    type metadata accessor for AXSDError();
    sub_21ACF7DA4(&qword_255118250, (uint64_t (*)(uint64_t))type metadata accessor for AXSDError, (uint64_t)&unk_21AD27470);
    swift_allocError();
    v22 = v21;
    v23 = __swift_instantiateConcreteTypeFromMangledName(qword_2551181A0);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 56))(v22, 1, 1, v23);
    swift_willThrow();
    *(_QWORD *)&v5[v16] = 0;
    return swift_bridgeObjectRelease();
  }
  return result;
}

id AXSDNSControllerImplementation.trackObservation(_:forDetector:)(void *a1, void *a2)
{
  uint64_t v2;
  id result;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  unint64_t v11;
  char v12;
  uint64_t v13;
  id v14;
  id v15;
  char v16;
  uint64_t v17;
  id v18;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v20;

  result = objc_msgSend((id)objc_opt_self(), sel_isInternalInstall);
  if (!(_DWORD)result)
    return result;
  v6 = *(_QWORD *)(v2 + OBJC_IVAR____TtC18AXSoundDetectionUI30AXSDNSControllerImplementation_recentDetections);
  if (!v6)
    return result;
  swift_bridgeObjectRetain_n();
  v7 = objc_msgSend(a2, sel_soundIdentifier);
  _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();

  v8 = (void *)sub_21AD23F4C();
  swift_bridgeObjectRelease();
  v9 = (id)AXSDSoundDetectionTypeForIdentifier();

  if (!*(_QWORD *)(v6 + 16))
  {
LABEL_10:
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255118270);
    v17 = swift_allocObject();
    *(_OWORD *)(v17 + 16) = xmmword_21AD274B0;
    *(_QWORD *)(v17 + 32) = a1;
    v20 = v17;
    sub_21AD23FB8();
    v18 = a1;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    sub_21AD1EFB0(v20, v9, isUniquelyReferenced_nonNull_native);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    return (id)swift_bridgeObjectRelease();
  }
  v10 = v9;
  v11 = sub_21AD1DFCC((uint64_t)v10);
  if ((v12 & 1) == 0)
  {

    goto LABEL_10;
  }
  v13 = *(_QWORD *)(*(_QWORD *)(v6 + 56) + 8 * v11);
  swift_bridgeObjectRetain();

  swift_bridgeObjectRelease();
  v14 = a1;
  MEMORY[0x220756408]();
  if (*(_QWORD *)((v13 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v13 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
    sub_21AD23FC4();
  sub_21AD23FD0();
  sub_21AD23FB8();
  v15 = v10;
  v16 = swift_isUniquelyReferenced_nonNull_native();
  sub_21AD1EBDC(v13, v15, v16);

  swift_bridgeObjectRelease();
  return (id)swift_bridgeObjectRelease();
}

Swift::Void __swiftcall AXSDNSControllerImplementation.receivedBuffer(_:at:)(AVAudioPCMBuffer _, AVAudioTime *at)
{
  void *v2;
  void *impl;
  Class isa;
  objc_super v5;

  impl = _.super._impl;
  isa = _.super.super.isa;
  v5.receiver = v2;
  v5.super_class = (Class)type metadata accessor for AXSDNSControllerImplementation();
  objc_msgSendSuper2(&v5, sel_receivedBuffer_atTime_, isa, impl);
  objc_msgSend(v2, sel_receivedBuffer_atTime_isFile_, isa, impl, 0);
}

Swift::Void __swiftcall AXSDNSControllerImplementation.listenEngineDidStart(withInputFormat:)(AVAudioFormat_optional *withInputFormat)
{
  void *v1;
  void *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  objc_class *v12;
  AVAudioFormat_optional *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  AVAudioFormat_optional *v17;
  id v18;
  uint64_t v19;
  id v20;
  NSObject *v21;
  os_log_type_t v22;
  uint8_t *v23;
  uint64_t v24;
  id v25;
  id v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t aBlock[7];
  objc_super v32;

  v2 = v1;
  v4 = sub_21AD23F04();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&aBlock[-1] - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_21AD23F1C();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&aBlock[-1] - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = (objc_class *)type metadata accessor for AXSDNSControllerImplementation();
  v32.receiver = v2;
  v32.super_class = v12;
  -[AVAudioFormat_optional listenEngineDidStartWithInputFormat:](&v32, sel_listenEngineDidStartWithInputFormat_, withInputFormat);
  if (withInputFormat)
  {
    sub_21ACF8044(0, (unint64_t *)&qword_255117BD0);
    v30 = v5;
    v13 = withInputFormat;
    v14 = (void *)sub_21AD24090();
    v15 = swift_allocObject();
    *(_QWORD *)(v15 + 16) = v2;
    *(_QWORD *)(v15 + 24) = v13;
    aBlock[4] = (uint64_t)sub_21AD1F35C;
    aBlock[5] = v15;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_21ACF4004;
    aBlock[3] = (uint64_t)&block_descriptor_12_1;
    v16 = _Block_copy(aBlock);
    v17 = v13;
    v18 = v2;
    swift_release();
    sub_21AD23F10();
    aBlock[0] = MEMORY[0x24BEE4AF8];
    sub_21ACF7DA4((unint64_t *)&qword_255117940, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255118240);
    sub_21ACF7B30();
    sub_21AD240E4();
    MEMORY[0x220756504](0, v11, v7, v16);
    _Block_release(v16);

    (*(void (**)(char *, uint64_t))(v30 + 8))(v7, v4);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
  else
  {
    if (qword_2551178E0 != -1)
      swift_once();
    v19 = sub_21AD23EEC();
    __swift_project_value_buffer(v19, (uint64_t)qword_2551180B8);
    v20 = v2;
    v21 = sub_21AD23EE0();
    v22 = sub_21AD24060();
    if (os_log_type_enabled(v21, v22))
    {
      v23 = (uint8_t *)swift_slowAlloc();
      v24 = swift_slowAlloc();
      aBlock[0] = v24;
      *(_DWORD *)v23 = 136315138;
      v25 = v20;
      v26 = objc_msgSend(v25, sel_description);
      v27 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
      v29 = v28;

      aBlock[6] = sub_21ACF58B4(v27, v29, aBlock);
      sub_21AD240CC();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_21ACD4000, v21, v22, "[%s]: Listen Engine did not return an audio format. This should NOT happen; bailing. File a radar!",
        v23,
        0xCu);
      swift_arrayDestroy();
      MEMORY[0x220756ED0](v24, -1, -1);
      MEMORY[0x220756ED0](v23, -1, -1);

    }
    else
    {

    }
  }
}

void sub_21AD1C60C(uint64_t a1, void *a2)
{
  id *v4;
  uint64_t v5;
  double v6;
  double v7;
  id *v8;
  id v9;
  void *v10;

  v4 = (id *)(a1 + OBJC_IVAR____TtC18AXSoundDetectionUI30AXSDNSControllerImplementation_detectorManager);
  swift_beginAccess();
  objc_msgSend(*v4, sel_startDetectionWithFormat_, a2);
  if (objc_msgSend((id)objc_opt_self(), sel_isInternalInstall)
    && objc_msgSend((id)objc_opt_self(), sel_isEnrolled))
  {
    v5 = OBJC_IVAR____TtC18AXSoundDetectionUI30AXSDNSControllerImplementation_recordingManager;
    if (!*(_QWORD *)(a1 + OBJC_IVAR____TtC18AXSoundDetectionUI30AXSDNSControllerImplementation_recordingManager))
    {
      objc_msgSend(a2, sel_sampleRate);
      v7 = 1.0 / v6;
      v8 = (id *)(a1 + OBJC_IVAR____TtC18AXSoundDetectionUI34AXSDNSBaseControllerImplementation_listener);
      swift_beginAccess();
      v9 = objc_msgSend(objc_allocWithZone((Class)AXSDUltronInternalRecordingManager), sel_initWithSampleLength_bufferSize_, v7, (double)(unint64_t)objc_msgSend(*v8, sel_bufferSize));
      v10 = *(void **)(a1 + v5);
      *(_QWORD *)(a1 + v5) = v9;

    }
  }
}

Swift::Void __swiftcall AXSDNSControllerImplementation.listenEngineReceivedAudioFile(_:)(AVAudioFile a1)
{
  void *v1;
  Class isa;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  objc_class *v7;
  id v8;
  objc_class *v9;
  uint8_t *v10;
  NSObject *v11;
  os_log_type_t v12;
  _BOOL4 v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint8_t *v17;
  objc_class *v18;
  uint8_t *v19;
  id v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  objc_class *v24;
  id v25;
  uint64_t v26;
  uint8_t *v27;
  NSObject *v28;
  os_log_type_t v29;
  uint8_t *v30;
  uint8_t *v31;
  id v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint8_t *v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  char *v46;
  void (*v47)(char *, uint64_t);
  id v48;
  uint8_t *v49;
  id v50;
  uint8_t *v51;
  NSObject *v52;
  os_log_type_t v53;
  uint64_t v54;
  uint64_t v55;
  uint8_t *v56;
  id v57;
  uint64_t v58;
  unint64_t v59;
  unint64_t v60;
  id v61;
  _QWORD *v62;
  id v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  void *v67;
  id v68;
  uint8_t *v69;
  char *v70;
  uint64_t v71;
  char *v72;
  uint64_t v73;
  _QWORD *v74;
  uint64_t v75;
  uint8_t *v76;
  uint64_t v77;
  id v78;
  void (*v79)(char *, uint64_t);
  uint64_t v80;
  char *v81;
  uint64_t v82;
  char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t aBlock;
  uint64_t v87;
  uint64_t (*v88)(uint64_t);
  void *v89;
  void *v90;
  uint64_t v91;

  isa = a1.super.isa;
  v84 = sub_21AD23F04();
  v80 = *(_QWORD *)(v84 - 8);
  MEMORY[0x24BDAC7A8](v84);
  v83 = (char *)&v73 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v82 = sub_21AD23F1C();
  v79 = *(_QWORD **)(v82 - 8);
  MEMORY[0x24BDAC7A8](v82);
  v81 = (char *)&v73 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2551178E0 != -1)
    swift_once();
  v5 = sub_21AD23EEC();
  v6 = __swift_project_value_buffer(v5, (uint64_t)qword_2551180B8);
  v7 = isa;
  v8 = v1;
  v9 = v7;
  v10 = (uint8_t *)v8;
  v11 = sub_21AD23EE0();
  v12 = sub_21AD24048();
  v13 = os_log_type_enabled(v11, v12);
  v78 = v9;
  if (v13)
  {
    v14 = swift_slowAlloc();
    v15 = swift_slowAlloc();
    v77 = v6;
    v16 = (_QWORD *)v15;
    v75 = swift_slowAlloc();
    aBlock = v75;
    *(_DWORD *)v14 = 136315650;
    v17 = v10;
    v76 = v10;
    v18 = v9;
    v19 = v17;
    v20 = -[uint8_t description](v17, sel_description);
    v21 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
    v23 = v22;

    v85 = sub_21ACF58B4(v21, v23, &aBlock);
    sub_21AD240CC();

    swift_bridgeObjectRelease();
    *(_WORD *)(v14 + 12) = 2112;
    v85 = (uint64_t)v18;
    v24 = v18;
    sub_21AD240CC();
    *v16 = v18;
    v10 = v76;

    *(_WORD *)(v14 + 22) = 2112;
    v25 = -[objc_class processingFormat](v24, sel_processingFormat);
    v85 = (uint64_t)v25;
    sub_21AD240CC();
    v16[1] = v25;

    _os_log_impl(&dword_21ACD4000, v11, v12, "[%s]: Received audio file: %@ with audio format: %@", (uint8_t *)v14, 0x20u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_255117958);
    swift_arrayDestroy();
    MEMORY[0x220756ED0](v16, -1, -1);
    v26 = v75;
    swift_arrayDestroy();
    MEMORY[0x220756ED0](v26, -1, -1);
    MEMORY[0x220756ED0](v14, -1, -1);

  }
  else
  {

  }
  v27 = v10;
  v28 = sub_21AD23EE0();
  v29 = sub_21AD24054();
  if (os_log_type_enabled(v28, v29))
  {
    v30 = (uint8_t *)swift_slowAlloc();
    v77 = swift_slowAlloc();
    aBlock = v77;
    *(_DWORD *)v30 = 136315138;
    v76 = v30 + 4;
    v31 = v27;
    v32 = -[uint8_t description](v31, sel_description);
    v33 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
    v35 = v34;

    v85 = sub_21ACF58B4(v33, v35, &aBlock);
    sub_21AD240CC();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21ACD4000, v28, v29, "[%s]: Stopping detector manager.", v30, 0xCu);
    v36 = v77;
    swift_arrayDestroy();
    MEMORY[0x220756ED0](v36, -1, -1);
    MEMORY[0x220756ED0](v30, -1, -1);

  }
  else
  {

  }
  sub_21ACF8044(0, (unint64_t *)&qword_255117BD0);
  v37 = (void *)sub_21AD24090();
  v38 = swift_allocObject();
  *(_QWORD *)(v38 + 16) = v27;
  v90 = sub_21AD1F364;
  v91 = v38;
  aBlock = MEMORY[0x24BDAC760];
  v87 = 1107296256;
  v88 = sub_21ACF4004;
  v89 = &block_descriptor_18_0;
  v39 = _Block_copy(&aBlock);
  v40 = v27;
  swift_release();
  v41 = v81;
  sub_21AD23F10();
  aBlock = MEMORY[0x24BEE4AF8];
  v42 = sub_21ACF7DA4((unint64_t *)&qword_255117940, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  v43 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255118240);
  v44 = sub_21ACF7B30();
  v46 = v83;
  v45 = v84;
  v75 = v44;
  v76 = (uint8_t *)v43;
  v77 = v42;
  sub_21AD240E4();
  MEMORY[0x220756504](0, v41, v46, v39);
  _Block_release(v39);

  v47 = *(void (**)(char *, uint64_t))(v80 + 8);
  v47(v46, v45);
  v80 = v79[1];
  ((void (*)(char *, uint64_t))v80)(v41, v82);
  v48 = v78;
  v49 = v40;
  v50 = v48;
  v51 = v49;
  v52 = sub_21AD23EE0();
  v53 = sub_21AD24054();
  if (os_log_type_enabled(v52, v53))
  {
    v54 = swift_slowAlloc();
    v79 = v47;
    v55 = v54;
    v74 = (_QWORD *)swift_slowAlloc();
    v78 = (id)swift_slowAlloc();
    aBlock = (uint64_t)v78;
    *(_DWORD *)v55 = 136315394;
    v73 = v55 + 4;
    v56 = v51;
    v57 = -[uint8_t description](v56, sel_description);
    v58 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
    v60 = v59;

    v85 = sub_21ACF58B4(v58, v60, &aBlock);
    sub_21AD240CC();

    swift_bridgeObjectRelease();
    *(_WORD *)(v55 + 12) = 2112;
    v61 = objc_msgSend(v50, sel_processingFormat);
    v85 = (uint64_t)v61;
    sub_21AD240CC();
    v62 = v74;
    *v74 = v61;

    _os_log_impl(&dword_21ACD4000, v52, v53, "[%s]: Starting detector manager with audio format: %@", (uint8_t *)v55, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_255117958);
    swift_arrayDestroy();
    MEMORY[0x220756ED0](v62, -1, -1);
    v63 = v78;
    swift_arrayDestroy();
    MEMORY[0x220756ED0](v63, -1, -1);
    v64 = v55;
    v47 = (void (*)(char *, uint64_t))v79;
    MEMORY[0x220756ED0](v64, -1, -1);

  }
  else
  {

  }
  v65 = (void *)sub_21AD24090();
  v66 = swift_allocObject();
  *(_QWORD *)(v66 + 16) = v51;
  *(_QWORD *)(v66 + 24) = v50;
  v90 = sub_21AD1F39C;
  v91 = v66;
  aBlock = MEMORY[0x24BDAC760];
  v87 = 1107296256;
  v88 = sub_21ACF4004;
  v89 = &block_descriptor_24_1;
  v67 = _Block_copy(&aBlock);
  v68 = v50;
  v69 = v51;
  swift_release();
  v70 = v81;
  sub_21AD23F10();
  aBlock = MEMORY[0x24BEE4AF8];
  v72 = v83;
  v71 = v84;
  sub_21AD240E4();
  MEMORY[0x220756504](0, v70, v72, v67);
  _Block_release(v67);

  v47(v72, v71);
  ((void (*)(char *, uint64_t))v80)(v70, v82);
}

void sub_21AD1D0A0(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id v5;

  v3 = (id *)(a1 + OBJC_IVAR____TtC18AXSoundDetectionUI30AXSDNSControllerImplementation_detectorManager);
  swift_beginAccess();
  v4 = *v3;
  v5 = objc_msgSend(a2, sel_processingFormat);
  objc_msgSend(v4, sel_startDetectionWithFormat_, v5);

}

Swift::Void __swiftcall AXSDNSControllerImplementation.listenEngineFinishedAudioFile(_:)(AVAudioFile a1)
{
  void *v1;
  Class isa;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  objc_class *v9;
  id v10;
  objc_class *v11;
  NSObject *v12;
  os_log_type_t v13;
  _BOOL4 v14;
  uint64_t v15;
  id v16;
  id v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  objc_class *v21;
  _QWORD *v22;
  uint64_t v23;
  id v24;
  NSObject *v25;
  os_log_type_t v26;
  uint8_t *v27;
  id v28;
  id v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  char *v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  void (*v44)(char *, uint64_t);
  void (*v45)(char *, uint64_t);
  id *v46;
  id v47;
  void *v48;
  char *v49;
  id v50;
  char *v51;
  id v52;
  NSObject *v53;
  os_log_type_t v54;
  uint64_t v55;
  char *v56;
  id v57;
  uint64_t v58;
  unint64_t v59;
  unint64_t v60;
  id v61;
  _QWORD *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  uint64_t v67;
  void *v68;
  char *v69;
  id v70;
  char *v71;
  uint64_t v72;
  _QWORD *v73;
  uint64_t v74;
  uint64_t v75;
  unint64_t v76;
  _QWORD *v77;
  uint64_t v78;
  void (*v79)(char *, uint64_t);
  void (*v80)(char *, uint64_t);
  uint64_t v81;
  char *v82;
  uint64_t v83;
  char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t aBlock;
  uint64_t v88;
  uint64_t (*v89)(uint64_t);
  void *v90;
  id (*v91)();
  uint64_t v92;

  isa = a1.super.isa;
  v3 = sub_21AD23F04();
  v80 = *(void (**)(char *, uint64_t))(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v72 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v81 = sub_21AD23F1C();
  v79 = *(void (**)(char *, uint64_t))(v81 - 8);
  MEMORY[0x24BDAC7A8](v81);
  v84 = (char *)&v72 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2551178E0 != -1)
    swift_once();
  v7 = sub_21AD23EEC();
  __swift_project_value_buffer(v7, (uint64_t)qword_2551180B8);
  v8 = v1;
  v9 = isa;
  v10 = v8;
  v11 = v9;
  v12 = sub_21AD23EE0();
  v13 = sub_21AD24048();
  v14 = os_log_type_enabled(v12, v13);
  v82 = v5;
  v83 = v3;
  if (v14)
  {
    v15 = swift_slowAlloc();
    v77 = (_QWORD *)swift_slowAlloc();
    v78 = swift_slowAlloc();
    aBlock = v78;
    *(_DWORD *)v15 = 136315394;
    v76 = v15 + 4;
    v16 = v10;
    v17 = objc_msgSend(v16, sel_description);
    v18 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
    v20 = v19;

    v86 = sub_21ACF58B4(v18, v20, &aBlock);
    sub_21AD240CC();

    swift_bridgeObjectRelease();
    *(_WORD *)(v15 + 12) = 2112;
    v86 = (uint64_t)v11;
    v21 = v11;
    sub_21AD240CC();
    v22 = v77;
    *v77 = v11;

    _os_log_impl(&dword_21ACD4000, v12, v13, "[%s]: Finished processing audio file: %@.", (uint8_t *)v15, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_255117958);
    swift_arrayDestroy();
    MEMORY[0x220756ED0](v22, -1, -1);
    v23 = v78;
    swift_arrayDestroy();
    MEMORY[0x220756ED0](v23, -1, -1);
    MEMORY[0x220756ED0](v15, -1, -1);

  }
  else
  {

  }
  v24 = v10;
  v25 = sub_21AD23EE0();
  v26 = sub_21AD24054();
  if (os_log_type_enabled(v25, v26))
  {
    v27 = (uint8_t *)swift_slowAlloc();
    v78 = swift_slowAlloc();
    aBlock = v78;
    *(_DWORD *)v27 = 136315138;
    v77 = v27 + 4;
    v28 = v24;
    v29 = objc_msgSend(v28, sel_description);
    v30 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
    v32 = v31;

    v86 = sub_21ACF58B4(v30, v32, &aBlock);
    sub_21AD240CC();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21ACD4000, v25, v26, "[%s]: Stopping detector manager.", v27, 0xCu);
    v33 = v78;
    swift_arrayDestroy();
    MEMORY[0x220756ED0](v33, -1, -1);
    MEMORY[0x220756ED0](v27, -1, -1);

  }
  else
  {

  }
  v35 = v82;
  v34 = v83;
  v36 = v81;
  v75 = sub_21ACF8044(0, (unint64_t *)&qword_255117BD0);
  v37 = (void *)sub_21AD24090();
  v38 = swift_allocObject();
  *(_QWORD *)(v38 + 16) = v24;
  v91 = sub_21AD1F364;
  v92 = v38;
  aBlock = MEMORY[0x24BDAC760];
  v88 = 1107296256;
  v89 = sub_21ACF4004;
  v90 = &block_descriptor_30_0;
  v39 = _Block_copy(&aBlock);
  v40 = (char *)v24;
  swift_release();
  v41 = v84;
  sub_21AD23F10();
  aBlock = MEMORY[0x24BEE4AF8];
  v42 = sub_21ACF7DA4((unint64_t *)&qword_255117940, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  v43 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255118240);
  v76 = sub_21ACF7B30();
  v77 = (_QWORD *)v43;
  v78 = v42;
  sub_21AD240E4();
  MEMORY[0x220756504](0, v41, v35, v39);
  _Block_release(v39);

  v44 = (void (*)(char *, uint64_t))*((_QWORD *)v80 + 1);
  v44(v35, v34);
  v45 = (void (*)(char *, uint64_t))*((_QWORD *)v79 + 1);
  v45(v41, v36);
  v46 = (id *)&v40[OBJC_IVAR____TtC18AXSoundDetectionUI34AXSDNSBaseControllerImplementation_listener];
  swift_beginAccess();
  v47 = objc_msgSend(*v46, sel_audioFormat);
  if (v47)
  {
    v48 = v47;
    v79 = v45;
    v80 = v44;
    v49 = v40;
    v50 = v48;
    v51 = v49;
    v52 = v50;
    v53 = sub_21AD23EE0();
    v54 = sub_21AD24054();
    if (os_log_type_enabled(v53, v54))
    {
      v55 = swift_slowAlloc();
      v73 = (_QWORD *)swift_slowAlloc();
      v74 = swift_slowAlloc();
      aBlock = v74;
      *(_DWORD *)v55 = 136315394;
      v72 = v55 + 4;
      v56 = v51;
      v57 = objc_msgSend(v56, sel_description);
      v58 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
      v60 = v59;

      v85 = sub_21ACF58B4(v58, v60, &aBlock);
      sub_21AD240CC();

      swift_bridgeObjectRelease();
      *(_WORD *)(v55 + 12) = 2112;
      v85 = (uint64_t)v52;
      v61 = v52;
      v34 = v83;
      sub_21AD240CC();
      v62 = v73;
      *v73 = v48;

      v36 = v81;
      _os_log_impl(&dword_21ACD4000, v53, v54, "[%s]: Starting detector manager with audio format: %@", (uint8_t *)v55, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_255117958);
      swift_arrayDestroy();
      MEMORY[0x220756ED0](v62, -1, -1);
      v63 = v74;
      swift_arrayDestroy();
      MEMORY[0x220756ED0](v63, -1, -1);
      v64 = v55;
      v35 = v82;
      MEMORY[0x220756ED0](v64, -1, -1);

    }
    else
    {

    }
    v65 = MEMORY[0x24BDAC760];
    v66 = (void *)sub_21AD24090();
    v67 = swift_allocObject();
    *(_QWORD *)(v67 + 16) = v51;
    *(_QWORD *)(v67 + 24) = v52;
    v91 = sub_21AD1F3F8;
    v92 = v67;
    aBlock = v65;
    v88 = 1107296256;
    v89 = sub_21ACF4004;
    v90 = &block_descriptor_36_0;
    v68 = _Block_copy(&aBlock);
    v69 = v51;
    v70 = v52;
    swift_release();
    v71 = v84;
    sub_21AD23F10();
    aBlock = MEMORY[0x24BEE4AF8];
    sub_21AD240E4();
    MEMORY[0x220756504](0, v71, v35, v68);
    _Block_release(v68);

    v80(v35, v34);
    v79(v71, v36);
  }
}

void AXSDNSControllerImplementation.receivedObservation(_:forDetector:)(void *a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  os_log_type_t v12;
  char **v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  double v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;

  v3 = v2;
  if (objc_msgSend(a1, sel_detected))
  {
    if (qword_2551178E0 != -1)
      swift_once();
    v6 = sub_21AD23EEC();
    __swift_project_value_buffer(v6, (uint64_t)qword_2551180B8);
    v7 = a2;
    v8 = a1;
    v9 = v7;
    v10 = v8;
    v11 = sub_21AD23EE0();
    v12 = sub_21AD24048();
    v13 = &selRef_nextObject;
    if (os_log_type_enabled(v11, v12))
    {
      v14 = swift_slowAlloc();
      v27 = v3;
      v15 = swift_slowAlloc();
      v28 = v15;
      *(_DWORD *)v14 = 136315394;
      v16 = objc_msgSend(v9, sel_soundIdentifier);
      v17 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
      v19 = v18;

      sub_21ACF58B4(v17, v19, &v28);
      sub_21AD240CC();

      swift_bridgeObjectRelease();
      *(_WORD *)(v14 + 12) = 2048;
      objc_msgSend(v10, sel_confidence);
      v13 = &selRef_nextObject;
      sub_21AD240CC();

      _os_log_impl(&dword_21ACD4000, v11, v12, "Detected type: %s at confidence level: %f", (uint8_t *)v14, 0x16u);
      swift_arrayDestroy();
      v20 = v15;
      v3 = v27;
      MEMORY[0x220756ED0](v20, -1, -1);
      MEMORY[0x220756ED0](v14, -1, -1);

    }
    else
    {

    }
    v21 = objc_msgSend(v9, v13[179]);
    _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();

    v22 = (void *)sub_21AD23F4C();
    swift_bridgeObjectRelease();
    v23 = (id)AXSDSoundDetectionTypeForIdentifier();

    v24 = v23;
    objc_msgSend(v10, sel_confidence);
    *(float *)&v25 = v25;
    AXSDSoundDetectionGenerateUserNotificationForDetectionType(v24, *(float *)&v25);

    v26 = (void *)objc_opt_self();
    if (objc_msgSend(v26, sel_isInternalInstall)
      && objc_msgSend((id)objc_opt_self(), sel_isEnrolled))
    {
      objc_msgSend(*(id *)(v3 + OBJC_IVAR____TtC18AXSoundDetectionUI30AXSDNSControllerImplementation_recordingManager), sel_saveDetectionResult_, v10);
    }
    if (objc_msgSend(v26, sel_isInternalInstall))
    {
      if (*(_QWORD *)(v3 + OBJC_IVAR____TtC18AXSoundDetectionUI30AXSDNSControllerImplementation_recentDetections))
        AXSDNSControllerImplementation.trackObservation(_:forDetector:)(v10, v9);
    }

  }
}

unint64_t sub_21AD1DF34(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_21AD240B4();
  return sub_21AD1ED2C(a1, v2, (unint64_t *)&qword_2551182B0);
}

unint64_t sub_21AD1DF80(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_21AD240B4();
  return sub_21AD1ED2C(a1, v2, &qword_2551182B8);
}

unint64_t sub_21AD1DFCC(uint64_t a1)
{
  uint64_t v2;

  _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
  sub_21AD242E8();
  sub_21AD23F88();
  v2 = sub_21AD24300();
  swift_bridgeObjectRelease();
  return sub_21AD1EE3C(a1, v2);
}

uint64_t sub_21AD1E04C(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  int64_t v11;
  uint64_t v12;
  uint64_t result;
  int64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  int64_t v22;
  _QWORD *v23;
  unint64_t v24;
  int64_t v25;
  char v26;
  unint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255117E48);
  v6 = sub_21AD24234();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v35 = v2;
  v36 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v11 = (unint64_t)(v8 + 63) >> 6;
  v12 = v6 + 64;
  result = swift_retain();
  v14 = 0;
  while (1)
  {
    if (v10)
    {
      v20 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v21 = v20 | (v14 << 6);
      goto LABEL_31;
    }
    v22 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v22 >= v11)
      break;
    v23 = (_QWORD *)(v5 + 64);
    v24 = *(_QWORD *)(v36 + 8 * v22);
    ++v14;
    if (!v24)
    {
      v14 = v22 + 1;
      if (v22 + 1 >= v11)
        goto LABEL_33;
      v24 = *(_QWORD *)(v36 + 8 * v14);
      if (!v24)
      {
        v25 = v22 + 2;
        if (v25 >= v11)
        {
LABEL_33:
          swift_release();
          v3 = v35;
          if ((a2 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v24 = *(_QWORD *)(v36 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            v14 = v25 + 1;
            if (__OFADD__(v25, 1))
              goto LABEL_42;
            if (v14 >= v11)
              goto LABEL_33;
            v24 = *(_QWORD *)(v36 + 8 * v14);
            ++v25;
            if (v24)
              goto LABEL_30;
          }
        }
        v14 = v25;
      }
    }
LABEL_30:
    v10 = (v24 - 1) & v24;
    v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_31:
    v30 = 8 * v21;
    v31 = *(void **)(*(_QWORD *)(v5 + 48) + v30);
    v32 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + v30);
    if ((a2 & 1) == 0)
    {
      v33 = v31;
      swift_retain();
    }
    result = sub_21AD240B4();
    v15 = -1 << *(_BYTE *)(v7 + 32);
    v16 = result & ~v15;
    v17 = v16 >> 6;
    if (((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      v18 = __clz(__rbit64((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v26 = 0;
      v27 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v28 = v17 == v27;
        if (v17 == v27)
          v17 = 0;
        v26 |= v28;
        v29 = *(_QWORD *)(v12 + 8 * v17);
      }
      while (v29 == -1);
      v18 = __clz(__rbit64(~v29)) + (v17 << 6);
    }
    *(_QWORD *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    v19 = 8 * v18;
    *(_QWORD *)(*(_QWORD *)(v7 + 48) + v19) = v31;
    *(_QWORD *)(*(_QWORD *)(v7 + 56) + v19) = v32;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v3 = v35;
  v23 = (_QWORD *)(v5 + 64);
  if ((a2 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v34 = 1 << *(_BYTE *)(v5 + 32);
  if (v34 >= 64)
    bzero(v23, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v23 = -1 << v34;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_21AD1E320(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  unint64_t v11;
  int64_t v12;
  uint64_t v13;
  uint64_t result;
  int64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t *v32;
  __int128 v33;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2551182C0);
  v6 = sub_21AD24234();
  v7 = v6;
  if (*(_QWORD *)(v5 + 16))
  {
    v32 = v2;
    v8 = 1 << *(_BYTE *)(v5 + 32);
    v9 = (_QWORD *)(v5 + 64);
    if (v8 < 64)
      v10 = ~(-1 << v8);
    else
      v10 = -1;
    v11 = v10 & *(_QWORD *)(v5 + 64);
    v12 = (unint64_t)(v8 + 63) >> 6;
    v13 = v6 + 64;
    result = swift_retain();
    v15 = 0;
    while (1)
    {
      if (v11)
      {
        v20 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        v21 = v20 | (v15 << 6);
      }
      else
      {
        v22 = v15 + 1;
        if (__OFADD__(v15, 1))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }
        if (v22 >= v12)
          goto LABEL_33;
        v23 = v9[v22];
        ++v15;
        if (!v23)
        {
          v15 = v22 + 1;
          if (v22 + 1 >= v12)
            goto LABEL_33;
          v23 = v9[v15];
          if (!v23)
          {
            v24 = v22 + 2;
            if (v24 >= v12)
            {
LABEL_33:
              swift_release();
              if ((a2 & 1) == 0)
              {
                result = swift_release();
                v3 = v32;
                goto LABEL_40;
              }
              v31 = 1 << *(_BYTE *)(v5 + 32);
              if (v31 >= 64)
                bzero((void *)(v5 + 64), ((unint64_t)(v31 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              else
                *v9 = -1 << v31;
              v3 = v32;
              *(_QWORD *)(v5 + 16) = 0;
              break;
            }
            v23 = v9[v24];
            if (!v23)
            {
              while (1)
              {
                v15 = v24 + 1;
                if (__OFADD__(v24, 1))
                  goto LABEL_42;
                if (v15 >= v12)
                  goto LABEL_33;
                v23 = v9[v15];
                ++v24;
                if (v23)
                  goto LABEL_30;
              }
            }
            v15 = v24;
          }
        }
LABEL_30:
        v11 = (v23 - 1) & v23;
        v21 = __clz(__rbit64(v23)) + (v15 << 6);
      }
      v29 = *(void **)(*(_QWORD *)(v5 + 48) + 8 * v21);
      v33 = *(_OWORD *)(*(_QWORD *)(v5 + 56) + 16 * v21);
      if ((a2 & 1) == 0)
      {
        v30 = v29;
        swift_retain();
      }
      result = sub_21AD240B4();
      v16 = -1 << *(_BYTE *)(v7 + 32);
      v17 = result & ~v16;
      v18 = v17 >> 6;
      if (((-1 << v17) & ~*(_QWORD *)(v13 + 8 * (v17 >> 6))) != 0)
      {
        v19 = __clz(__rbit64((-1 << v17) & ~*(_QWORD *)(v13 + 8 * (v17 >> 6)))) | v17 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v25 = 0;
        v26 = (unint64_t)(63 - v16) >> 6;
        do
        {
          if (++v18 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }
          v27 = v18 == v26;
          if (v18 == v26)
            v18 = 0;
          v25 |= v27;
          v28 = *(_QWORD *)(v13 + 8 * v18);
        }
        while (v28 == -1);
        v19 = __clz(__rbit64(~v28)) + (v18 << 6);
      }
      *(_QWORD *)(v13 + ((v19 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v19;
      *(_QWORD *)(*(_QWORD *)(v7 + 48) + 8 * v19) = v29;
      *(_OWORD *)(*(_QWORD *)(v7 + 56) + 16 * v19) = v33;
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release();
LABEL_40:
  *v3 = v7;
  return result;
}

uint64_t sub_21AD1E5F0(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t result;
  int64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  uint64_t *v34;
  int64_t v35;
  _QWORD *v36;
  char v37;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255117E40);
  v37 = a2;
  v6 = sub_21AD24234();
  v7 = v6;
  if (*(_QWORD *)(v5 + 16))
  {
    v34 = v2;
    v8 = 1 << *(_BYTE *)(v5 + 32);
    v36 = (_QWORD *)(v5 + 64);
    if (v8 < 64)
      v9 = ~(-1 << v8);
    else
      v9 = -1;
    v10 = v9 & *(_QWORD *)(v5 + 64);
    v35 = (unint64_t)(v8 + 63) >> 6;
    v11 = v6 + 64;
    result = swift_retain();
    v13 = 0;
    while (1)
    {
      if (v10)
      {
        v20 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        v21 = v20 | (v13 << 6);
      }
      else
      {
        v22 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
          return result;
        }
        if (v22 >= v35)
          goto LABEL_33;
        v23 = v36[v22];
        ++v13;
        if (!v23)
        {
          v13 = v22 + 1;
          if (v22 + 1 >= v35)
            goto LABEL_33;
          v23 = v36[v13];
          if (!v23)
          {
            v24 = v22 + 2;
            if (v24 >= v35)
            {
LABEL_33:
              swift_release();
              v3 = v34;
              if ((v37 & 1) != 0)
              {
                v33 = 1 << *(_BYTE *)(v5 + 32);
                if (v33 >= 64)
                  bzero(v36, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v36 = -1 << v33;
                *(_QWORD *)(v5 + 16) = 0;
              }
              break;
            }
            v23 = v36[v24];
            if (!v23)
            {
              while (1)
              {
                v13 = v24 + 1;
                if (__OFADD__(v24, 1))
                  goto LABEL_40;
                if (v13 >= v35)
                  goto LABEL_33;
                v23 = v36[v13];
                ++v24;
                if (v23)
                  goto LABEL_30;
              }
            }
            v13 = v24;
          }
        }
LABEL_30:
        v10 = (v23 - 1) & v23;
        v21 = __clz(__rbit64(v23)) + (v13 << 6);
      }
      v29 = 8 * v21;
      v30 = *(void **)(*(_QWORD *)(v5 + 48) + v29);
      v31 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + v29);
      if ((v37 & 1) == 0)
      {
        v32 = v30;
        swift_bridgeObjectRetain();
      }
      _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
      sub_21AD242E8();
      sub_21AD23F88();
      v14 = sub_21AD24300();
      result = swift_bridgeObjectRelease();
      v15 = -1 << *(_BYTE *)(v7 + 32);
      v16 = v14 & ~v15;
      v17 = v16 >> 6;
      if (((-1 << v16) & ~*(_QWORD *)(v11 + 8 * (v16 >> 6))) != 0)
      {
        v18 = __clz(__rbit64((-1 << v16) & ~*(_QWORD *)(v11 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v25 = 0;
        v26 = (unint64_t)(63 - v15) >> 6;
        do
        {
          if (++v17 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_39;
          }
          v27 = v17 == v26;
          if (v17 == v26)
            v17 = 0;
          v25 |= v27;
          v28 = *(_QWORD *)(v11 + 8 * v17);
        }
        while (v28 == -1);
        v18 = __clz(__rbit64(~v28)) + (v17 << 6);
      }
      *(_QWORD *)(v11 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
      v19 = 8 * v18;
      *(_QWORD *)(*(_QWORD *)(v7 + 48) + v19) = v30;
      *(_QWORD *)(*(_QWORD *)(v7 + 56) + v19) = v31;
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release();
  *v3 = v7;
  return result;
}

id sub_21AD1E90C(uint64_t a1, void *a2, char a3)
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v7;
  char v8;
  unint64_t v9;
  uint64_t v10;
  _BOOL8 v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  id result;
  unint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;

  v4 = v3;
  v7 = *v3;
  v9 = sub_21AD1DF34((uint64_t)a2);
  v10 = *(_QWORD *)(v7 + 16);
  v11 = (v8 & 1) == 0;
  v12 = v10 + v11;
  if (__OFADD__(v10, v11))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v13 = v8;
  v14 = *(_QWORD *)(v7 + 24);
  if (v14 >= v12 && (a3 & 1) != 0)
    goto LABEL_7;
  if (v14 >= v12 && (a3 & 1) == 0)
  {
    sub_21AD1784C();
LABEL_7:
    v15 = (_QWORD *)*v4;
    if ((v13 & 1) != 0)
    {
LABEL_8:
      v16 = v15[7];
      result = (id)swift_release();
      *(_QWORD *)(v16 + 8 * v9) = a1;
      return result;
    }
LABEL_11:
    v15[(v9 >> 6) + 8] |= 1 << v9;
    v20 = 8 * v9;
    *(_QWORD *)(v15[6] + v20) = a2;
    *(_QWORD *)(v15[7] + v20) = a1;
    v21 = v15[2];
    v22 = __OFADD__(v21, 1);
    v23 = v21 + 1;
    if (!v22)
    {
      v15[2] = v23;
      return a2;
    }
    goto LABEL_14;
  }
  sub_21AD1E04C(v12, a3 & 1);
  v18 = sub_21AD1DF34((uint64_t)a2);
  if ((v13 & 1) == (v19 & 1))
  {
    v9 = v18;
    v15 = (_QWORD *)*v4;
    if ((v13 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  sub_21ACF8044(0, (unint64_t *)&qword_2551182B0);
  result = (id)sub_21AD24294();
  __break(1u);
  return result;
}

id sub_21AD1EA6C(uint64_t a1, uint64_t a2, void *a3, char a4)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v9;
  char v10;
  unint64_t v11;
  uint64_t v12;
  _BOOL8 v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  id result;
  unint64_t v20;
  char v21;
  _QWORD *v22;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;

  v5 = v4;
  v9 = *v4;
  v11 = sub_21AD1DF80((uint64_t)a3);
  v12 = *(_QWORD *)(v9 + 16);
  v13 = (v10 & 1) == 0;
  v14 = v12 + v13;
  if (__OFADD__(v12, v13))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v15 = v10;
  v16 = *(_QWORD *)(v9 + 24);
  if (v16 >= v14 && (a4 & 1) != 0)
    goto LABEL_7;
  if (v16 >= v14 && (a4 & 1) == 0)
  {
    sub_21AD179F4();
LABEL_7:
    v17 = (_QWORD *)*v5;
    if ((v15 & 1) != 0)
    {
LABEL_8:
      v18 = (_QWORD *)(v17[7] + 16 * v11);
      result = (id)swift_release();
      *v18 = a1;
      v18[1] = a2;
      return result;
    }
LABEL_11:
    v17[(v11 >> 6) + 8] |= 1 << v11;
    *(_QWORD *)(v17[6] + 8 * v11) = a3;
    v22 = (_QWORD *)(v17[7] + 16 * v11);
    *v22 = a1;
    v22[1] = a2;
    v23 = v17[2];
    v24 = __OFADD__(v23, 1);
    v25 = v23 + 1;
    if (!v24)
    {
      v17[2] = v25;
      return a3;
    }
    goto LABEL_14;
  }
  sub_21AD1E320(v14, a4 & 1);
  v20 = sub_21AD1DF80((uint64_t)a3);
  if ((v15 & 1) == (v21 & 1))
  {
    v11 = v20;
    v17 = (_QWORD *)*v5;
    if ((v15 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  sub_21ACF8044(0, &qword_2551182B8);
  result = (id)sub_21AD24294();
  __break(1u);
  return result;
}

id sub_21AD1EBDC(uint64_t a1, void *a2, char a3)
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v7;
  char v8;
  unint64_t v9;
  uint64_t v10;
  _BOOL8 v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  id result;
  unint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;

  v4 = v3;
  v7 = *v3;
  v9 = sub_21AD1DFCC((uint64_t)a2);
  v10 = *(_QWORD *)(v7 + 16);
  v11 = (v8 & 1) == 0;
  v12 = v10 + v11;
  if (__OFADD__(v10, v11))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v13 = v8;
  v14 = *(_QWORD *)(v7 + 24);
  if (v14 >= v12 && (a3 & 1) != 0)
    goto LABEL_7;
  if (v14 >= v12 && (a3 & 1) == 0)
  {
    sub_21AD17BB0();
LABEL_7:
    v15 = (_QWORD *)*v4;
    if ((v13 & 1) != 0)
    {
LABEL_8:
      v16 = v15[7];
      result = (id)swift_bridgeObjectRelease();
      *(_QWORD *)(v16 + 8 * v9) = a1;
      return result;
    }
LABEL_11:
    v15[(v9 >> 6) + 8] |= 1 << v9;
    v20 = 8 * v9;
    *(_QWORD *)(v15[6] + v20) = a2;
    *(_QWORD *)(v15[7] + v20) = a1;
    v21 = v15[2];
    v22 = __OFADD__(v21, 1);
    v23 = v21 + 1;
    if (!v22)
    {
      v15[2] = v23;
      return a2;
    }
    goto LABEL_14;
  }
  sub_21AD1E5F0(v12, a3 & 1);
  v18 = sub_21AD1DFCC((uint64_t)a2);
  if ((v13 & 1) == (v19 & 1))
  {
    v9 = v18;
    v15 = (_QWORD *)*v4;
    if ((v13 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  type metadata accessor for AXSDSoundDetectionType();
  result = (id)sub_21AD24294();
  __break(1u);
  return result;
}

unint64_t sub_21AD1ED2C(uint64_t a1, uint64_t a2, unint64_t *a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t i;
  id v7;
  char v8;
  uint64_t v9;
  id v10;
  char v11;

  v4 = v3 + 64;
  v5 = -1 << *(_BYTE *)(v3 + 32);
  i = a2 & ~v5;
  if (((*(_QWORD *)(v3 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0)
  {
    sub_21ACF8044(0, a3);
    v7 = *(id *)(*(_QWORD *)(v3 + 48) + 8 * i);
    v8 = sub_21AD240C0();

    if ((v8 & 1) == 0)
    {
      v9 = ~v5;
      for (i = (i + 1) & v9; ((*(_QWORD *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0; i = (i + 1) & v9)
      {
        v10 = *(id *)(*(_QWORD *)(v3 + 48) + 8 * i);
        v11 = sub_21AD240C0();

        if ((v11 & 1) != 0)
          break;
      }
    }
  }
  return i;
}

unint64_t sub_21AD1EE3C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v18;

  v3 = v2 + 64;
  v4 = -1 << *(_BYTE *)(v2 + 32);
  v5 = a2 & ~v4;
  if (((*(_QWORD *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
  {
    v6 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
    v8 = v7;
    if (v6 == _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    v11 = sub_21AD2427C();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v11 & 1) == 0)
    {
      v12 = ~v4;
      v5 = (v5 + 1) & v12;
      if (((*(_QWORD *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
      {
        while (1)
        {
          v13 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
          v15 = v14;
          if (v13 == _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0() && v15 == v16)
            break;
          v18 = sub_21AD2427C();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v18 & 1) == 0)
          {
            v5 = (v5 + 1) & v12;
            if (((*(_QWORD *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
              continue;
          }
          return v5;
        }
        goto LABEL_16;
      }
    }
  }
  return v5;
}

uint64_t sub_21AD1EFB0(uint64_t a1, void *a2, char a3)
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v8;
  char v9;
  unint64_t v10;
  uint64_t v11;
  _BOOL8 v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t result;
  unint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;
  id v25;

  v4 = v3;
  v8 = *v3;
  v10 = sub_21AD1DFCC((uint64_t)a2);
  v11 = *(_QWORD *)(v8 + 16);
  v12 = (v9 & 1) == 0;
  v13 = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v14 = v9;
  v15 = *(_QWORD *)(v8 + 24);
  if (v15 >= v13 && (a3 & 1) != 0)
    goto LABEL_7;
  if (v15 >= v13 && (a3 & 1) == 0)
  {
    sub_21AD17BB0();
LABEL_7:
    v16 = (_QWORD *)*v4;
    if ((v14 & 1) != 0)
    {
LABEL_8:
      v17 = v16[7];
      result = *(_QWORD *)(v17 + 8 * v10);
      *(_QWORD *)(v17 + 8 * v10) = a1;
      return result;
    }
LABEL_11:
    v16[(v10 >> 6) + 8] |= 1 << v10;
    v21 = 8 * v10;
    *(_QWORD *)(v16[6] + v21) = a2;
    *(_QWORD *)(v16[7] + v21) = a1;
    v22 = v16[2];
    v23 = __OFADD__(v22, 1);
    v24 = v22 + 1;
    if (!v23)
    {
      v16[2] = v24;
      v25 = a2;
      return 0;
    }
    goto LABEL_14;
  }
  sub_21AD1E5F0(v13, a3 & 1);
  v19 = sub_21AD1DFCC((uint64_t)a2);
  if ((v14 & 1) == (v20 & 1))
  {
    v10 = v19;
    v16 = (_QWORD *)*v4;
    if ((v14 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  type metadata accessor for AXSDSoundDetectionType();
  result = sub_21AD24294();
  __break(1u);
  return result;
}

id sub_21AD1F0EC(void *a1, void *a2)
{
  char *v2;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  id v11;
  id v12;
  objc_super v14;

  *(_QWORD *)&v2[OBJC_IVAR____TtC18AXSoundDetectionUI30AXSDNSControllerImplementation_recordingManager] = 0;
  *(_QWORD *)&v2[OBJC_IVAR____TtC18AXSoundDetectionUI30AXSDNSControllerImplementation_recentDetections] = 0;
  v5 = qword_2551178E0;
  v6 = v2;
  if (v5 != -1)
    swift_once();
  v7 = sub_21AD23EEC();
  __swift_project_value_buffer(v7, (uint64_t)qword_2551180B8);
  v8 = sub_21AD23EE0();
  v9 = sub_21AD24054();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_21ACD4000, v8, v9, "Initializing NS Sound Detection Controller", v10, 2u);
    MEMORY[0x220756ED0](v10, -1, -1);
  }

  *(_QWORD *)&v6[OBJC_IVAR____TtC18AXSoundDetectionUI30AXSDNSControllerImplementation_detectorManager] = a1;
  *(_QWORD *)&v6[OBJC_IVAR____TtC18AXSoundDetectionUI30AXSDNSControllerImplementation_detectorQueueManager] = a2;
  v11 = a1;
  v12 = a2;

  v14.receiver = v6;
  v14.super_class = (Class)type metadata accessor for AXSDNSControllerImplementation();
  return objc_msgSendSuper2(&v14, sel_init);
}

uint64_t sub_21AD1F22C()
{
  uint64_t v0;

  return swift_deallocObject();
}

id sub_21AD1F250()
{
  return sub_21AD1F3A4((SEL *)&selRef_removeAllDetectors);
}

uint64_t block_copy_helper_4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_4()
{
  return swift_release();
}

id sub_21AD1F274()
{
  uint64_t v0;

  return sub_21AD1B31C(*(char **)(v0 + 16));
}

uint64_t type metadata accessor for AXSDNSControllerImplementation()
{
  return objc_opt_self();
}

id _s18AXSoundDetectionUI30AXSDNSControllerImplementationC14receivedBuffer_2at6isFileySo16AVAudioPCMBufferC_So0K4TimeCSbtF_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  id *v5;
  id result;

  v5 = (id *)(v2 + OBJC_IVAR____TtC18AXSoundDetectionUI30AXSDNSControllerImplementation_detectorManager);
  swift_beginAccess();
  objc_msgSend(*v5, sel_processAudioBuffer_atTime_, a1, a2);
  result = objc_msgSend((id)objc_opt_self(), sel_isInternalInstall);
  if ((_DWORD)result)
  {
    result = objc_msgSend((id)objc_opt_self(), sel_isEnrolled);
    if ((_DWORD)result)
      return objc_msgSend(*(id *)(v2 + OBJC_IVAR____TtC18AXSoundDetectionUI30AXSDNSControllerImplementation_recordingManager), sel_trackBuffer_atTime_, a1, a2);
  }
  return result;
}

void sub_21AD1F35C()
{
  uint64_t v0;

  sub_21AD1C60C(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24));
}

id sub_21AD1F364()
{
  return sub_21AD1F3A4((SEL *)&selRef_stopDetection);
}

uint64_t sub_21AD1F370()
{
  uint64_t v0;

  return swift_deallocObject();
}

void sub_21AD1F39C()
{
  uint64_t v0;

  sub_21AD1D0A0(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24));
}

id sub_21AD1F3A4(SEL *a1)
{
  uint64_t v1;
  id *v3;

  v3 = (id *)(*(_QWORD *)(v1 + 16) + OBJC_IVAR____TtC18AXSoundDetectionUI30AXSDNSControllerImplementation_detectorManager);
  swift_beginAccess();
  return objc_msgSend(*v3, *a1);
}

id sub_21AD1F3F8()
{
  uint64_t v0;
  uint64_t v1;
  id *v2;

  v1 = *(_QWORD *)(v0 + 24);
  v2 = (id *)(*(_QWORD *)(v0 + 16) + OBJC_IVAR____TtC18AXSoundDetectionUI30AXSDNSControllerImplementation_detectorManager);
  swift_beginAccess();
  return objc_msgSend(*v2, sel_startDetectionWithFormat_, v1);
}

void _s18AXSoundDetectionUI30AXSDNSControllerImplementationC18receivedCompletionyySo20SNDetectSoundRequestCF_0(void *a1)
{
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  _QWORD *v6;
  id v7;
  id v8;

  if (qword_2551178E0 != -1)
    swift_once();
  v2 = sub_21AD23EEC();
  __swift_project_value_buffer(v2, (uint64_t)qword_2551180B8);
  v8 = a1;
  v3 = sub_21AD23EE0();
  v4 = sub_21AD24054();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    v6 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v5 = 138412290;
    v7 = v8;
    sub_21AD240CC();
    *v6 = v8;

    _os_log_impl(&dword_21ACD4000, v3, v4, "Received completion for request: %@", v5, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_255117958);
    swift_arrayDestroy();
    MEMORY[0x220756ED0](v6, -1, -1);
    MEMORY[0x220756ED0](v5, -1, -1);

  }
  else
  {

  }
}

void _s18AXSoundDetectionUI30AXSDNSControllerImplementationC13receivedError_12fromDetectorys0G0_p_So20SNDetectSoundRequestCtF_0(void *a1, void *a2)
{
  uint64_t v4;
  id v5;
  id v6;
  id v7;
  id v8;
  os_log_type_t v9;
  uint64_t v10;
  _QWORD *v11;
  id v12;
  id v13;
  NSObject *oslog;
  uint64_t v15;

  if (qword_2551178E0 != -1)
    swift_once();
  v4 = sub_21AD23EEC();
  __swift_project_value_buffer(v4, (uint64_t)qword_2551180B8);
  v5 = a2;
  v6 = a1;
  v7 = v5;
  v8 = a1;
  oslog = sub_21AD23EE0();
  v9 = sub_21AD24060();
  if (os_log_type_enabled(oslog, v9))
  {
    v10 = swift_slowAlloc();
    v11 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v10 = 138412546;
    v12 = v7;
    sub_21AD240CC();
    *v11 = v7;

    *(_WORD *)(v10 + 12) = 2112;
    v13 = a1;
    v15 = _swift_stdlib_bridgeErrorToNSError();
    sub_21AD240CC();
    v11[1] = v15;

    _os_log_impl(&dword_21ACD4000, oslog, v9, "Received error for request: %@ - error: %@", (uint8_t *)v10, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_255117958);
    swift_arrayDestroy();
    MEMORY[0x220756ED0](v11, -1, -1);
    MEMORY[0x220756ED0](v10, -1, -1);
  }
  else
  {

  }
}

id sub_21AD1F824@<X0>(_QWORD *a1@<X0>, void **a2@<X8>)
{
  void **v3;
  void *v4;

  v3 = (void **)(*a1 + OBJC_IVAR____TtC18AXSoundDetectionUI30AXSDNSControllerImplementation_detectorManager);
  swift_beginAccess();
  v4 = *v3;
  *a2 = *v3;
  return v4;
}

uint64_t method lookup function for AXSDNSControllerImplementation()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of AXSDNSControllerImplementation.detectorManager.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x100))();
}

uint64_t dispatch thunk of AXSDNSControllerImplementation.detectorManager.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x108))();
}

uint64_t dispatch thunk of AXSDNSControllerImplementation.detectorManager.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x110))();
}

uint64_t dispatch thunk of AXSDNSControllerImplementation.currentDetectionTypes.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x130))();
}

uint64_t dispatch thunk of AXSDNSControllerImplementation.__allocating_init(detectorManager:queueManager:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 336))();
}

uint64_t dispatch thunk of AXSDNSControllerImplementation.add(listenType:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x158))();
}

uint64_t dispatch thunk of AXSDNSControllerImplementation.remove(listenType:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x160))();
}

uint64_t dispatch thunk of AXSDNSControllerImplementation.removeAllListenTypes()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x168))();
}

uint64_t __getAXSettingsClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return -[AXSDDetectorStore addObserver:].cold.1(v0);
}

void AXSDSoundDetectionGenerateUserNotificationForDetectionType_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, float a4)
{
  int v4;
  uint64_t v5;
  __int16 v6;
  double v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = 138412546;
  v5 = a1;
  v6 = 2048;
  v7 = a4;
  OUTLINED_FUNCTION_3(&dword_21ACD4000, a2, a3, "Requesting send notification for detection: %@ w/ confidence %f", (uint8_t *)&v4);
  OUTLINED_FUNCTION_2();
}

void AXSDSoundDetectionGenerateUserNotificationForDetectionType_cold_2()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2_0();
  v3 = 2112;
  v4 = v0;
  _os_log_fault_impl(&dword_21ACD4000, v1, OS_LOG_TYPE_FAULT, "Asked to send notification for type %{public}@, but it's not in the list of detectors %@", v2, 0x16u);
  OUTLINED_FUNCTION_2();
}

void _SoundDetectionSendNotificationForCustomDetector_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21ACD4000, log, OS_LOG_TYPE_ERROR, "Unable to send notification since detector is nil", v1, 2u);
}

void _SoundDetectionSendNotificationForCustomDetector_cold_2(void *a1, NSObject *a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint8_t v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_21ACD4000, a2, v6, "Requesting send notification for detector: %@ %@", v7);

  OUTLINED_FUNCTION_5();
}

void AXSDSoundDetectionSendKShotModelFailedNotification_cold_1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2_0();
  _os_log_debug_impl(&dword_21ACD4000, v0, OS_LOG_TYPE_DEBUG, "Requesting send notification for detector: %@", v1, 0xCu);
  OUTLINED_FUNCTION_2();
}

void AXSDKShotGatherFilesAndGenerateRadarForDetector_cold_1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2_0();
  _os_log_fault_impl(&dword_21ACD4000, v0, OS_LOG_TYPE_FAULT, "no detector identifier! %@", v1, 0xCu);
  OUTLINED_FUNCTION_2();
}

uint64_t __getAXEventRepresentationClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getAXEventTapManagerClass_block_invoke_cold_1(v0);
}

uint64_t __getAXEventTapManagerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return -[AXSDKShotDetector mlModel].cold.1(v0);
}

#error "21AD235F4: call analysis failed (funcsize=32)"

#error "21AD236F0: call analysis failed (funcsize=32)"

#error "21AD2382C: call analysis failed (funcsize=32)"

#error "21AD23928: call analysis failed (funcsize=32)"

#error "21AD23C8C: call analysis failed (funcsize=33)"

#error "21AD23D18: call analysis failed (funcsize=33)"

uint64_t sub_21AD23D48()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t sub_21AD23D54()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_21AD23D60()
{
  return MEMORY[0x24BDCD748]();
}

uint64_t sub_21AD23D6C()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_21AD23D78()
{
  return MEMORY[0x24BDCD928]();
}

uint64_t sub_21AD23D84()
{
  return MEMORY[0x24BDCD9C0]();
}

uint64_t sub_21AD23D90()
{
  return MEMORY[0x24BDCD9F8]();
}

uint64_t sub_21AD23D9C()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_21AD23DA8()
{
  return MEMORY[0x24BDCE5D8]();
}

uint64_t sub_21AD23DB4()
{
  return MEMORY[0x24BDCE878]();
}

uint64_t sub_21AD23DC0()
{
  return MEMORY[0x24BDCE8B0]();
}

uint64_t sub_21AD23DCC()
{
  return MEMORY[0x24BDCE8F8]();
}

uint64_t sub_21AD23DD8()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_21AD23DE4()
{
  return MEMORY[0x24BDCE998]();
}

uint64_t sub_21AD23DF0()
{
  return MEMORY[0x24BDCE9B0]();
}

uint64_t sub_21AD23DFC()
{
  return MEMORY[0x24BDCE9B8]();
}

uint64_t sub_21AD23E08()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_21AD23E14()
{
  return MEMORY[0x24BDE9958]();
}

uint64_t sub_21AD23E20()
{
  return MEMORY[0x24BDE99F0]();
}

uint64_t sub_21AD23E2C()
{
  return MEMORY[0x24BDE9A00]();
}

uint64_t sub_21AD23E38()
{
  return MEMORY[0x24BDE9A08]();
}

uint64_t sub_21AD23E44()
{
  return MEMORY[0x24BDE9A10]();
}

uint64_t sub_21AD23E50()
{
  return MEMORY[0x24BDE9A20]();
}

uint64_t sub_21AD23E5C()
{
  return MEMORY[0x24BDE9A28]();
}

uint64_t sub_21AD23E68()
{
  return MEMORY[0x24BDE9A40]();
}

uint64_t sub_21AD23E74()
{
  return MEMORY[0x24BDE9A50]();
}

uint64_t sub_21AD23E80()
{
  return MEMORY[0x24BDE9A58]();
}

uint64_t sub_21AD23E8C()
{
  return MEMORY[0x24BDE9A68]();
}

uint64_t sub_21AD23E98()
{
  return MEMORY[0x24BDE9A70]();
}

uint64_t sub_21AD23EA4()
{
  return MEMORY[0x24BDE9A78]();
}

uint64_t sub_21AD23EB0()
{
  return MEMORY[0x24BDE9A80]();
}

uint64_t sub_21AD23EBC()
{
  return MEMORY[0x24BDE9A98]();
}

uint64_t sub_21AD23EC8()
{
  return MEMORY[0x24BDE9AA8]();
}

uint64_t sub_21AD23ED4()
{
  return MEMORY[0x24BDE9AB8]();
}

uint64_t sub_21AD23EE0()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_21AD23EEC()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_21AD23EF8()
{
  return MEMORY[0x24BEE78E8]();
}

uint64_t sub_21AD23F04()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_21AD23F10()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_21AD23F1C()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_21AD23F28()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_21AD23F34()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_21AD23F40()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_21AD23F4C()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_21AD23F58()
{
  return MEMORY[0x24BDCFA08]();
}

uint64_t sub_21AD23F64()
{
  return MEMORY[0x24BDCFA18]();
}

uint64_t _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_21AD23F7C()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_21AD23F88()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_21AD23F94()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_21AD23FA0()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_21AD23FAC()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_21AD23FB8()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_21AD23FC4()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_21AD23FD0()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_21AD23FDC()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_21AD23FE8()
{
  return MEMORY[0x24BEE68C8]();
}

uint64_t sub_21AD23FF4()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_21AD24000()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_21AD2400C()
{
  return MEMORY[0x24BEE6AD0]();
}

uint64_t sub_21AD24018()
{
  return MEMORY[0x24BEE6B10]();
}

uint64_t sub_21AD24024()
{
  return MEMORY[0x24BDCFCC0]();
}

uint64_t sub_21AD24030()
{
  return MEMORY[0x24BEE15D8]();
}

uint64_t sub_21AD2403C()
{
  return MEMORY[0x24BEE1678]();
}

uint64_t sub_21AD24048()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_21AD24054()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_21AD24060()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_21AD2406C()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_21AD24078()
{
  return MEMORY[0x24BEE5688]();
}

uint64_t sub_21AD24084()
{
  return MEMORY[0x24BEE5760]();
}

uint64_t sub_21AD24090()
{
  return MEMORY[0x24BEE5770]();
}

uint64_t sub_21AD2409C()
{
  return MEMORY[0x24BEE5790]();
}

uint64_t sub_21AD240A8()
{
  return MEMORY[0x24BEE57A0]();
}

uint64_t sub_21AD240B4()
{
  return MEMORY[0x24BEE5BB8]();
}

uint64_t sub_21AD240C0()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_21AD240CC()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_21AD240D8()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_21AD240E4()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_21AD240F0()
{
  return MEMORY[0x24BEE22D0]();
}

uint64_t sub_21AD240FC()
{
  return MEMORY[0x24BEE22E0]();
}

uint64_t sub_21AD24108()
{
  return MEMORY[0x24BEE2300]();
}

uint64_t sub_21AD24114()
{
  return MEMORY[0x24BEE2330]();
}

uint64_t sub_21AD24120()
{
  return MEMORY[0x24BEE2340]();
}

uint64_t sub_21AD2412C()
{
  return MEMORY[0x24BEE2350]();
}

uint64_t sub_21AD24138()
{
  return MEMORY[0x24BEE2358]();
}

uint64_t sub_21AD24144()
{
  return MEMORY[0x24BEE2360]();
}

uint64_t sub_21AD24150()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_21AD2415C()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_21AD24168()
{
  return MEMORY[0x24BEE24C8]();
}

uint64_t sub_21AD24174()
{
  return MEMORY[0x24BEE24D0]();
}

uint64_t sub_21AD24180()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_21AD2418C()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_21AD24198()
{
  return MEMORY[0x24BEE2660]();
}

uint64_t sub_21AD241A4()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_21AD241B0()
{
  return MEMORY[0x24BEE2908]();
}

uint64_t sub_21AD241BC()
{
  return MEMORY[0x24BEE2938]();
}

uint64_t sub_21AD241C8()
{
  return MEMORY[0x24BEE2980]();
}

uint64_t sub_21AD241D4()
{
  return MEMORY[0x24BEE2988]();
}

uint64_t sub_21AD241E0()
{
  return MEMORY[0x24BEE6DC8]();
}

uint64_t sub_21AD241EC()
{
  return MEMORY[0x24BEE6E08]();
}

uint64_t sub_21AD241F8()
{
  return MEMORY[0x24BEE6E10]();
}

uint64_t sub_21AD24204()
{
  return MEMORY[0x24BEE2AE0]();
}

uint64_t sub_21AD24210()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_21AD2421C()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_21AD24228()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_21AD24234()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_21AD24240()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_21AD2424C()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_21AD24258()
{
  return MEMORY[0x24BEE31D0]();
}

uint64_t sub_21AD24264()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_21AD24270()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_21AD2427C()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_21AD24288()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_21AD24294()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_21AD242A0()
{
  return MEMORY[0x24BEE7110]();
}

uint64_t sub_21AD242AC()
{
  return MEMORY[0x24BEE7118]();
}

uint64_t sub_21AD242B8()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_21AD242C4()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_21AD242D0()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_21AD242DC()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_21AD242E8()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_21AD242F4()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_21AD24300()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t AXIsSoundDetectionMedinaSupportEnabled()
{
  return MEMORY[0x24BDFF138]();
}

uint64_t AXLogSoundActions()
{
  return MEMORY[0x24BDFE180]();
}

uint64_t AXLogTemp()
{
  return MEMORY[0x24BDFE1C0]();
}

uint64_t AXLogUltron()
{
  return MEMORY[0x24BDFE1F8]();
}

uint64_t AXLogUltronKShot()
{
  return MEMORY[0x24BDFE200]();
}

uint64_t AXPerformBlockAsynchronouslyOnMainThread()
{
  return MEMORY[0x24BDFE240]();
}

uint64_t AXPerformBlockOnMainThread()
{
  return MEMORY[0x24BDFE248]();
}

uint64_t AXRuntimeCheck_SoundRecognitionMedinaSupportEnabled()
{
  return MEMORY[0x24BDFE318]();
}

uint64_t AXSDIsConnectedToCarPlay()
{
  return MEMORY[0x24BDFF168]();
}

uint64_t AXSDSoundDetectionBundle()
{
  return MEMORY[0x24BDFF198]();
}

uint64_t AXSDSoundDetectionCategories()
{
  return MEMORY[0x24BDFF1A0]();
}

uint64_t AXSDSoundDetectionLocalizedStringForType()
{
  return MEMORY[0x24BDFF1C0]();
}

uint64_t AXSDSoundDetectionLocalizedTitleForType()
{
  return MEMORY[0x24BDFF1C8]();
}

uint64_t AXSDSoundDetectionTypeForIdentifier()
{
  return MEMORY[0x24BDFF228]();
}

uint64_t AXSDSoundDetectionTypesForCategory()
{
  return MEMORY[0x24BDFF270]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x24BE1A1C8]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x24BDBB780]();
  return result;
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x24BDBC050]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
  MEMORY[0x24BDBC070](center, name, object, userInfo, deliverImmediately);
}

CFRunLoopRunResult CFRunLoopRunInMode(CFRunLoopMode mode, CFTimeInterval seconds, Boolean returnAfterSourceHandled)
{
  return MEMORY[0x24BDBC360](mode, returnAfterSourceHandled, seconds);
}

CMTime *__cdecl CMTimeMake(CMTime *__return_ptr retstr, int64_t value, int32_t timescale)
{
  return (CMTime *)MEMORY[0x24BDC0498](retstr, value, *(_QWORD *)&timescale);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x24BED8448]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x24BED8470]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x24BED8490]();
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

uint64_t NSStringFromBOOL()
{
  return MEMORY[0x24BDD1238]();
}

uint64_t _AXAssertIsMainThread()
{
  return MEMORY[0x24BDFE530]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x24BDACB60]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB88](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x24BEAE670]();
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x24BEE4B30]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x24BDAD010]();
}

uint64_t bmTypeForSoundDetectionType()
{
  return MEMORY[0x24BDFF280]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEB8](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEC8](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

float fmodf(float a1, float a2)
{
  float result;

  MEMORY[0x24BDAE3F8](a1, a2);
  return result;
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x24BDAED60](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x24BEDCFB0](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x24BEDCFC0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x24BEDCFD8](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_end_catch(void)
{
  MEMORY[0x24BEDD050]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x24BEDD088](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3D0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t swift_allocError()
{
  return MEMORY[0x24BEE4B68]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x24BEE4B98]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x24BEE4BA0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x24BEE4BB8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x24BEE4BC8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x24BEE4BD8]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x24BEE4C18]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x24BEE4C60]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x24BEE4C98]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x24BEE4CA8]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4D10]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x24BEE4DB0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x24BEE4DB8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x24BEE4DD0]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x24BEE4E10]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x24BEE4E18]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
}

uint64_t swift_initEnumMetadataSinglePayload()
{
  return MEMORY[0x24BEE4E40]();
}

uint64_t swift_initStaticObject()
{
  return MEMORY[0x24BEE4E50]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x24BEE4E90]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x24BEE4EA8]();
}

uint64_t swift_once()
{
  return MEMORY[0x24BEE4EC8]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x24BEE4F00]();
}

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x24BEE4F10]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x24BEE4F38]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x24BEE4F40]();
}

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x24BEE4F48]();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4F60]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x24BEE7228]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x24BEE7230]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x24BEE7238]();
}

uint64_t swift_task_isCancelled()
{
  return MEMORY[0x24BEE7248]();
}

uint64_t swift_task_switch()
{
  return MEMORY[0x24BEE7278]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}

uint64_t swift_willThrowTypedImpl()
{
  return MEMORY[0x24BEE5058]();
}

