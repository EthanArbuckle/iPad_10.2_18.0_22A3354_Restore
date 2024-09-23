@implementation DDUIiOSNotificationPresenter

void __47___DDUIiOSNotificationPresenter__setupIfNeeded__block_invoke(uint64_t a1, int a2, void *a3)
{
  id v4;
  NSObject *v5;
  _DWORD v6[2];
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _DDUICoreLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109378;
    v6[1] = a2;
    v7 = 2112;
    v8 = v4;
    _os_log_impl(&dword_1C87B2000, v5, OS_LOG_TYPE_DEFAULT, "Notification authorization granted? %d with error: %@", (uint8_t *)v6, 0x12u);
  }

}

void __97___DDUIiOSNotificationPresenter_showNotificationForApplication_deviceName_identifier_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  const char *v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _DDUICoreLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      v8 = 138412290;
      v9 = v3;
      v6 = "Could not post local notification with error %@";
LABEL_6:
      _os_log_impl(&dword_1C87B2000, v4, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v8, 0xCu);
    }
  }
  else if (v5)
  {
    v7 = *(void **)(a1 + 32);
    v8 = 138412290;
    v9 = v7;
    v6 = "Local notification %@ posted successfully";
    goto LABEL_6;
  }

}

void __88___DDUIiOSNotificationPresenter_showContinuityCameraConfirmation_identifier_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  const char *v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _DDUICoreLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      v8 = 138412290;
      v9 = v3;
      v6 = "Could not post local notification with error %@";
LABEL_6:
      _os_log_impl(&dword_1C87B2000, v4, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v8, 0xCu);
    }
  }
  else if (v5)
  {
    v7 = *(void **)(a1 + 32);
    v8 = 138412290;
    v9 = v7;
    v6 = "Local notification %@ posted successfully";
    goto LABEL_6;
  }

}

uint64_t __62___DDUIiOSNotificationPresenter__configureNotificationTimeout__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD);
  uint8_t v8[16];

  _DDUICoreLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_1C87B2000, v2, OS_LOG_TYPE_DEFAULT, "Notification timed out.  Removing from notification center.", v8, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "presentedNotification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "completion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "presentedNotification");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "completion");
    v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v6[2](v6, 5);

  }
  return objc_msgSend(*(id *)(a1 + 32), "_clearPresentedNotificationIfNeeded");
}

void __87___DDUIiOSNotificationPresenter__handleContinuityCameraDisabledAlertResponseWithState___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  char v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  uint8_t buf[4];
  uint64_t v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v8 = 0;
  v4 = objc_msgSend(v2, "openSensitiveURL:withOptions:error:", v3, 0, &v8);
  v5 = v8;

  if ((v4 & 1) == 0)
  {
    _DDUICoreLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      v10 = v7;
      v11 = 2112;
      v12 = v5;
      _os_log_impl(&dword_1C87B2000, v6, OS_LOG_TYPE_DEFAULT, "### Launch URL failed: %@, %@\n", buf, 0x16u);
    }

  }
}

void __77___DDUIiOSNotificationPresenter__showContinuityCameraDisabledAlertWithState___block_invoke(uint64_t a1)
{
  int DeviceClass;
  void *v3;
  uint64_t v4;
  void *v5;
  int v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  __CFString *v17;
  void *v18;
  void *v19;
  __CFUserNotification *v20;
  NSObject *v21;
  __CFUserNotification *v22;
  SInt32 error;
  uint8_t buf[8];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  DeviceClass = GestaltGetDeviceClass();
  error = 0;
  v3 = (void *)objc_opt_new();
  v4 = *(_QWORD *)(a1 + 40);
  if (v4 == 1)
  {
    DDUICoreLocalizedString(CFSTR("CC_DISABLED_HEADER"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, *MEMORY[0x1E0C9B800]);

    DDUICoreLocalizedString(CFSTR("CC_DISABLED_CANCEL"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, *MEMORY[0x1E0C9B830]);

    DDUICoreLocalizedString(CFSTR("CC_DISABLED_SETTINGS"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, *MEMORY[0x1E0C9B838]);

    if (DeviceClass == 3)
    {
      v17 = CFSTR("CC_DISABLED_MESSAGE_IPAD");
    }
    else
    {
      if (DeviceClass != 1)
        goto LABEL_16;
      v17 = CFSTR("CC_DISABLED_MESSAGE_IPHONE");
    }
    DDUICoreLocalizedString(v17);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0C9B810]);
  }
  else
  {
    if (v4)
      goto LABEL_16;
    objc_msgSend(*(id *)(a1 + 32), "wirelessSettingsController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "deviceSupportsWAPI");
    v7 = CFSTR("WIFI");
    if (v6)
      v7 = CFSTR("WLAN");
    v8 = v7;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CC_%@_OFF_HEADER"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    DDUICoreLocalizedString(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, *MEMORY[0x1E0C9B800]);

    DDUICoreLocalizedString(CFSTR("CC_WIFI_OFF_CANCEL"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, *MEMORY[0x1E0C9B830]);

    DDUICoreLocalizedString(CFSTR("CC_WIFI_OFF_SETTINGS"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, *MEMORY[0x1E0C9B838]);

    if (DeviceClass == 1)
    {
      v13 = CFSTR("CC_%@_OFF_MESSAGE_IPHONE");
      goto LABEL_12;
    }
    if (DeviceClass == 3)
    {
      v13 = CFSTR("CC_%@_OFF_MESSAGE_IPAD");
LABEL_12:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v13, v8);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      DDUICoreLocalizedString(v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, *MEMORY[0x1E0C9B810]);

    }
  }

LABEL_16:
  v20 = CFUserNotificationCreate(0, 0.0, 1uLL, &error, (CFDictionaryRef)v3);
  if (error)
  {
    _DDUICoreLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = error;
      _os_log_impl(&dword_1C87B2000, v21, OS_LOG_TYPE_DEFAULT, "Error creating continuity camera disabled user notification (error: %d)\n", buf, 8u);
    }

  }
  else
  {
    v22 = v20;
    *(_QWORD *)buf = 0;
    CFUserNotificationReceiveResponse(v20, 0.0, (CFOptionFlags *)buf);
    if ((buf[0] & 3) == 0)
      objc_msgSend(*(id *)(a1 + 32), "_handleContinuityCameraDisabledAlertResponseWithState:", *(_QWORD *)(a1 + 40));
    CFRelease(v22);
  }

}

void __109___DDUIiOSNotificationPresenter_userNotificationCenter_didReceiveNotificationResponse_withCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _DDUICoreLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_1C87B2000, v5, OS_LOG_TYPE_DEFAULT, "Finished launching application with error %@", (uint8_t *)&v7, 0xCu);
  }

  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
    (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v6, 1);

}

@end
