void sub_213A83478(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id defaultLogHandle()
{
  if (defaultLogHandle_once != -1)
    dispatch_once(&defaultLogHandle_once, &__block_literal_global_2);
  return (id)defaultLogHandle_defaultLogObj;
}

void __defaultLogHandle_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.MobileStoreDemo", "Default");
  v1 = (void *)defaultLogHandle_defaultLogObj;
  defaultLogHandle_defaultLogObj = (uint64_t)v0;

}

void sub_213A83A30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
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

void sub_213A83DE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

_QWORD *safeAssignError(_QWORD *result, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;

  if (result)
  {
    v3 = result;
    objc_msgSend(MEMORY[0x24BDD1540], "errorDomainMSDWithCode:message:", a2, a3);
    result = (id)objc_claimAutoreleasedReturnValue();
    *v3 = result;
  }
  return result;
}

_QWORD *safeAssignErrorWithReason(_QWORD *result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;

  if (result)
  {
    v4 = result;
    objc_msgSend(MEMORY[0x24BDD1540], "errorDomainMSDWithCode:message:reason:", a2, a3, a4);
    result = (id)objc_claimAutoreleasedReturnValue();
    *v4 = result;
  }
  return result;
}

void safeAssignErrorNoOverwrite(_QWORD *a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;
  id v7;

  v5 = a3;
  if (a1 && !*a1)
  {
    v7 = v5;
    objc_msgSend(MEMORY[0x24BDD1540], "errorDomainMSDWithCode:message:", a2, v5);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v5 = v7;
    *a1 = v6;
  }

}

void sub_213A85A18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_213A85AD0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_213A85CD8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_213A85D9C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_213A85E58(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

id contentRootList()
{
  if (contentRootList_onceToken != -1)
    dispatch_once(&contentRootList_onceToken, &__block_literal_global_1);
  return (id)contentRootList_shared;
}

void __contentRootList_block_invoke()
{
  void *v0;
  int v1;
  void *v2;
  int v3;
  uint64_t v4;
  void *v5;
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
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;

  +[MSDPlatform sharedInstance](MSDPlatform, "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "watchOS");

  if (v1)
  {
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", CFSTR("/var/mobile/Demo.mov"), CFSTR("/var/mobile/Demo.plist"), CFSTR("/var/mobile/Media"), CFSTR("/var/mobile/Library/AddressBook"), CFSTR("/var/mobile/Library/Alarms"), CFSTR("/var/mobile/Library/Calendar"), CFSTR("/var/mobile/Library/CallHistoryDB"), CFSTR("/var/mobile/Library/Carousel"), CFSTR("/var/mobile/Library/Health"), CFSTR("/var/mobile/Library/Maps"), CFSTR("/var/mobile/Library/MapsHistory.plist"), CFSTR("/var/mobile/Library/NanoMailKit"), CFSTR("/var/mobile/Library/NanoMusicSync"), CFSTR("/var/mobile/Library/NanoPasses"), CFSTR("/var/mobile/Library/NanoPodcasts"), CFSTR("/var/mobile/Library/NanoPhotos"), CFSTR("/var/mobile/Library/NanoWeatherDemo"),
      CFSTR("/var/mobile/Library/News"),
      CFSTR("/var/mobile/Library/RetailDemo"),
      CFSTR("/var/mobile/Library/Reminders"),
      CFSTR("/var/mobile/Library/SMS"),
      CFSTR("/var/mobile/Library/UserConfigurationProfiles"),
      CFSTR("/var/mobile/Library/Preferences/.GlobalPreferences.plist"),
      CFSTR("/var/mobile/Library/Preferences/.GlobalPreferences_m.plist"),
      CFSTR("/var/mobile/Library/Preferences/com.apple.Accessibility.plist"),
      CFSTR("/var/mobile/Library/Preferences/com.apple.ActivitySharing.plist"),
      CFSTR("/var/mobile/Library/Preferences/com.apple.AppleMediaServices.plist"),
      CFSTR("/var/mobile/Library/Preferences/com.apple.assistant.backedup.plist"),
      CFSTR("/var/mobile/Library/Preferences/com.apple.assistant.nano.plist"),
      CFSTR("/var/mobile/Library/Preferences/com.apple.assistant.support.plist"),
      CFSTR("/var/mobile/Library/Preferences/com.apple.backboardd.plist"),
      CFSTR("/var/mobile/Library/Preferences/com.apple.Carousel.plist"),
      CFSTR("/var/mobile/Library/Preferences/com.apple.coremedia.plist"),
      CFSTR("/var/mobile/Library/Preferences/com.apple.ControlCenter.plist"),
      CFSTR("/var/mobile/Library/Preferences/com.apple.DeepBreathing.plist"),
      CFSTR("/var/mobile/Library/Preferences/com.apple.demo-settings.plist"),
      CFSTR("/var/mobile/Library/Preferences/com.apple.findmy.plist"),
      CFSTR("/var/mobile/Library/Preferences/com.apple.healthd.plist"),
      CFSTR("/var/mobile/Library/Preferences/com.apple.ids.plist"),
      CFSTR("/var/mobile/Library/Preferences/com.apple.locationd.plist"),
      CFSTR("/var/mobile/Library/Preferences/com.apple.mobileme.fmf1.plist"),
      CFSTR("/var/mobile/Library/Preferences/com.apple.mobilephone.plist"),
      CFSTR("/var/mobile/Library/Preferences/com.apple.mobilephone.speeddial.plist"),
      CFSTR("/var/mobile/Library/Preferences/com.apple.mobiletimer.plist"),
      CFSTR("/var/mobile/Library/Preferences/com.apple.nanobuddy.plist"),
      CFSTR("/var/mobile/Library/Preferences/com.apple.nanolifestyle.plist"),
      CFSTR("/var/mobile/Library/Preferences/com.apple.nanolifestyle.privacy.plist"),
      CFSTR("/var/mobile/Library/Preferences/com.apple.NanoMediaUI.plist"),
      CFSTR("/var/mobile/Library/Preferences/com.apple.NanoMusicSync.plist"),
      CFSTR("/var/mobile/Library/Preferences/com.apple.nanopassbook.plist"),
      CFSTR("/var/mobile/Library/Preferences/com.apple.nanophotos.plist"),
      CFSTR("/var/mobile/Library/Preferences/com.apple.nanonews.sync.plist"),
      CFSTR("/var/mobile/Library/Preferences/com.apple.Noise.plist"),
      CFSTR("/var/mobile/Library/Preferences/com.apple.podcasts.plist"),
      CFSTR("/var/mobile/Library/Preferences/com.apple.SessionTrackerApp.plist"),
      CFSTR("/var/mobile/Library/Preferences/com.apple.stockholm.plist"),
      CFSTR("/var/mobile/Library/Preferences/com.apple.system.prefs.plist"),
      CFSTR("/var/mobile/Library/Preferences/com.apple.timed.plist"),
      CFSTR("/var/mobile/Library/Preferences/com.apple.voicememod.plist"),
      CFSTR("/var/mobile/Library/Preferences/group.com.apple.stocks.plist"),
      CFSTR("/var/mobile/Library/Preferences/Avalon"));
  }
  else
  {
    +[MSDPlatform sharedInstance](MSDPlatform, "sharedInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "tvOS");

    if (!v3)
      return;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", CFSTR("/var/mobile/Media/DCIM"), CFSTR("/var/mobile/Media/PhotoData"), CFSTR("/var/mobile/Library/Preferences/com.apple.demo-settings.plist"), CFSTR("/var/MobileDevice/ProvisioningProfiles"), CFSTR("/var/mobile/Library/com.apple.HeadBoard/HBDemoModeAppOrder"), CFSTR("/var/mobile/Library/com.apple.HeadBoard/AppOrder.plist"), CFSTR("/var/mobile/Library/Preferences/.GlobalPreferences.plist"), CFSTR("/var/mobile/Library/Preferences/.GlobalPreferences_m.plist"), CFSTR("/var/mobile/Library/DemoLoop"), 0, v6, v7, v8, v9, v10, v11, v12,
      v13,
      v14,
      v15,
      v16,
      v17,
      v18,
      v19,
      v20,
      v21,
      v22,
      v23,
      v24,
      v25,
      v26,
      v27,
      v28,
      v29,
      v30,
      v31,
      v32,
      v33,
      v34,
      v35,
      v36,
      v37,
      v38,
      v39,
      v40,
      v41,
      v42,
      v43,
      v44,
      v45,
      v46,
      v47,
      v48,
      v49,
      v50,
      v51,
      v52,
      v53,
      v54,
      v55,
      v56);
  }
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)contentRootList_shared;
  contentRootList_shared = v4;

}

id doNotExtractList()
{
  if (doNotExtractList_onceToken != -1)
    dispatch_once(&doNotExtractList_onceToken, &__block_literal_global_167);
  return (id)doNotExtractList_shared;
}

void __doNotExtractList_block_invoke()
{
  void *v0;
  int v1;
  uint64_t v2;
  void *v3;
  int v4;
  void *v5;

  +[MSDPlatform sharedInstance](MSDPlatform, "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "watchOS");

  if (v1)
  {
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", CFSTR("/var/mobile/Library/Caches/sharedCaches/com.apple.WatchListKit.NSURLCache"), CFSTR("/var/mobile/Library/Caches/sharedCaches/com.apple.iTunesStore.NSURLCache/VaryState.db-shm"), CFSTR("/var/mobile/Library/Caches/sharedCaches/com.apple.iTunesStore.NSURLCache/VaryState.db-wal"), CFSTR("/var/mobile/Library/Caches/sharedCaches/com.apple.iTunesStore.NSURLCache/VaryState.db"), CFSTR("/var/mobile/Library/Caches/sharedCaches/com.apple.iTunesStore.NSURLCache/Cache.db"), CFSTR("/var/mobile/Library/Caches/sharedCaches/com.apple.iTunesStore.NSURLCache/Cache.db-wal"), CFSTR("/var/mobile/Library/Caches/sharedCaches/com.apple.iTunesStore.NSURLCache/Cache.db-shm"), CFSTR("/var/mobile/Library/Caches/sharedCaches/com.apple.iTunesStore.NSURLCache/fsCachedData"), 0);
    v2 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[MSDPlatform sharedInstance](MSDPlatform, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "tvOS");

    if (!v4)
      return;
    objc_msgSend(MEMORY[0x24BDBCE30], "array");
    v2 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (void *)doNotExtractList_shared;
  doNotExtractList_shared = v2;

}

id systemContainerShouldRestoreList()
{
  if (systemContainerShouldRestoreList_onceToken != -1)
    dispatch_once(&systemContainerShouldRestoreList_onceToken, &__block_literal_global_184);
  return (id)systemContainerShouldRestoreList_shared;
}

void __systemContainerShouldRestoreList_block_invoke()
{
  void *v0;
  int v1;
  uint64_t v2;
  void *v3;
  int v4;
  void *v5;

  +[MSDPlatform sharedInstance](MSDPlatform, "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "watchOS");

  if (v1)
  {
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", CFSTR("systemgroup.com.apple.configurationprofiles"), 0);
    v2 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[MSDPlatform sharedInstance](MSDPlatform, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "tvOS");

    if (!v4)
      return;
    objc_msgSend(MEMORY[0x24BDBCE30], "array");
    v2 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (void *)systemContainerShouldRestoreList_shared;
  systemContainerShouldRestoreList_shared = v2;

}

id appContainerDoNotExtractList()
{
  if (appContainerDoNotExtractList_onceToken != -1)
    dispatch_once(&appContainerDoNotExtractList_onceToken, &__block_literal_global_187);
  return (id)appContainerDoNotExtractList_shared;
}

void __appContainerDoNotExtractList_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", CFSTR("/.com.apple.mobile_container_manager.metadata.plist"), CFSTR("/Library/Caches"), CFSTR("/Library/SyncedPreferences"), CFSTR("/Library/Saved Application State"), CFSTR("/SystemData/com.apple.AuthenticationServices"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)appContainerDoNotExtractList_shared;
  appContainerDoNotExtractList_shared = v0;

}

id systemContainerDoNotExtractList()
{
  if (systemContainerDoNotExtractList_onceToken != -1)
    dispatch_once(&systemContainerDoNotExtractList_onceToken, &__block_literal_global_198);
  return (id)systemContainerDoNotExtractList_shared;
}

void __systemContainerDoNotExtractList_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", CFSTR("/.com.apple.mobile_container_manager.metadata.plist"), CFSTR("/Library/Caches"), CFSTR("/Library/SyncedPreferences"), CFSTR("/Library/Saved Application State"), CFSTR("/SystemData/com.apple.AuthenticationServices"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)systemContainerDoNotExtractList_shared;
  systemContainerDoNotExtractList_shared = v0;

}

id generateCustomDomainsPlistForSecurityRulesCheck()
{
  void *v0;
  void *v1;
  void *v2;
  _QWORD v4[2];
  _QWORD v5[3];

  v5[2] = *MEMORY[0x24BDAC8D0];
  v4[0] = CFSTR("ContentRootDomain");
  contentRootList();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v4[1] = CFSTR("SystemContainerDomain");
  v5[0] = v0;
  systemContainerShouldRestoreList();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[1] = v1;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v5, v4, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

void OUTLINED_FUNCTION_0_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x20u);
}

id screenSaverLogHandle()
{
  if (screenSaverLogHandle_once != -1)
    dispatch_once(&screenSaverLogHandle_once, &__block_literal_global_3);
  return (id)screenSaverLogHandle_currentLogObj;
}

void __screenSaverLogHandle_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.MobileStoreDemo", "ScreenSaver");
  v1 = (void *)screenSaverLogHandle_currentLogObj;
  screenSaverLogHandle_currentLogObj = (uint64_t)v0;

}

id messageLogHandle()
{
  if (messageLogHandle_once != -1)
    dispatch_once(&messageLogHandle_once, &__block_literal_global_5);
  return (id)messageLogHandle_messageLogObj;
}

void __messageLogHandle_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.MobileStoreDemo", "Message");
  v1 = (void *)messageLogHandle_messageLogObj;
  messageLogHandle_messageLogObj = (uint64_t)v0;

}

id signpostLogHandle()
{
  if (signpostLogHandle_once != -1)
    dispatch_once(&signpostLogHandle_once, &__block_literal_global_7);
  return (id)signpostLogHandle_signpostLogObj;
}

void __signpostLogHandle_block_invoke()
{
  os_log_t v0;
  id v1;
  void *v2;

  if (os_variant_has_internal_content())
  {
    v0 = os_log_create("com.apple.MobileStoreDemo", "Signpost");
  }
  else
  {
    v0 = (os_log_t)MEMORY[0x24BDACB78];
    v1 = MEMORY[0x24BDACB78];
  }
  v2 = (void *)signpostLogHandle_signpostLogObj;
  signpostLogHandle_signpostLogObj = (uint64_t)v0;

}

void MSDLogToFile(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v9;
  void *v10;

  v9 = a1;
  +[MSDLogModel sharedInstance](MSDLogModel, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "logWithFormat:andArgs:", v9, &a9);

}

void sub_213A8B468(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_213A8B7F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
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

void sub_213A8C028(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = MEMORY[0x2199BBB24](*(_QWORD *)(a2 + 40));
  *(_QWORD *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{

}

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__8(uint64_t a1)
{

}

void sub_213A8C38C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_213A8C6CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_213A8F000(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{

}

void sub_213A8F880(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_3_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void sub_213A92A08(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_213A92C18(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_213A92D10(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_213A92E88(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_213A93074(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_213A9326C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_213A93464(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_213A93680(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_213A9389C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_213A93AB0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_213A93CC0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_213A93EC8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_213A940E4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_213A942F8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_213A944F8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_213A94714(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_213A94924(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_213A94B1C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_213A94D1C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_213A94F4C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_213A9514C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_213A95354(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_213A9555C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_213A95764(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_213A9596C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_213A95B6C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_213A95D40(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_213A95EFC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_213A960BC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_213A96298(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_213A96450(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_213A96608(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_213A967DC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_213A96994(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_213A96FB4(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 112));
  _Unwind_Resume(a1);
}

void sub_213A97064(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_213A970F0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_213A97508(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_213A9763C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_213A97750(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_213A99DD4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_213A9A008(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

void sub_213A9CE48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{

}

void OUTLINED_FUNCTION_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

uint64_t OUTLINED_FUNCTION_8_0()
{
  void *v0;

  return objc_msgSend(v0, "code");
}

void sub_213AA0CB4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_213AA14A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_213AA16CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  uint64_t v15;
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 64), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4(uint64_t a1)
{

}

void sub_213AA2084(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_213AA2510(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_213AA29BC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_3_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_7_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_8_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_4_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

CFStringRef _hashToCFString(unsigned __int8 *a1)
{
  char __str[100];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  snprintf(__str, 0x64uLL, "%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x", *a1, a1[1], a1[2], a1[3], a1[4], a1[5], a1[6], a1[7], a1[8], a1[9], a1[10], a1[11], a1[12], a1[13], a1[14], a1[15],
    a1[16],
    a1[17],
    a1[18],
    a1[19]);
  return CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x24BDBD240], __str, 0x8000100u);
}

unsigned __int8 *_MobileAssetHashAssetData(uint64_t a1, const __CFString *a2, const __CFString *a3)
{
  unsigned __int8 *v4;
  unsigned __int8 *v5;
  uint64_t i;

  v4 = _hashCFType(a2);
  v5 = v4;
  if (v4)
  {
    v4 = _hashCFType(a3);
    if (v4)
    {
      for (i = 0; i != 20; ++i)
        v5[i] ^= v4[i];
    }
  }
  free(v4);
  return v5;
}

unsigned __int8 *_hashCFType(const __CFString *a1)
{
  CFTypeID v2;
  unsigned __int8 *v3;
  CC_SHA1_CTX *p_c;
  CC_LONG Length;
  size_t v6;
  char *v7;
  const UInt8 *BytePtr;
  NSObject *v9;
  CFIndex v11;
  const void *ValueAtIndex;
  unsigned __int8 *v13;
  unsigned __int8 *v14;
  uint64_t i;
  uint8_t v16[16];
  CC_SHA1_CTX c;

  if (!a1)
    return 0;
  v2 = CFGetTypeID(a1);
  if (v2 == CFBooleanGetTypeID())
  {
    v3 = (unsigned __int8 *)malloc_type_calloc(1uLL, 0x14uLL, 0x6A69C61BuLL);
    LOBYTE(c.h0) = CFBooleanGetValue((CFBooleanRef)a1);
    p_c = &c;
    Length = 1;
LABEL_10:
    CC_SHA1(p_c, Length, v3);
    return v3;
  }
  if (v2 != CFStringGetTypeID())
  {
    if (v2 == CFDateGetTypeID())
    {
      v3 = (unsigned __int8 *)malloc_type_calloc(1uLL, 0x14uLL, 0xEAF147E6uLL);
      *(_QWORD *)&c.h0 = MEMORY[0x2199BB638](a1);
      p_c = &c;
      Length = 8;
      goto LABEL_10;
    }
    if (v2 == CFDataGetTypeID())
    {
      v3 = (unsigned __int8 *)malloc_type_calloc(1uLL, 0x14uLL, 0x1991A161uLL);
      BytePtr = CFDataGetBytePtr((CFDataRef)a1);
      Length = CFDataGetLength((CFDataRef)a1);
      p_c = (CC_SHA1_CTX *)BytePtr;
      goto LABEL_10;
    }
    if (v2 == CFArrayGetTypeID())
    {
      if (CFArrayGetCount((CFArrayRef)a1))
      {
        memset(&c, 0, sizeof(c));
        if (!_MobileAssetArrayHasDuplicateEntries((const __CFArray *)a1))
        {
          v3 = (unsigned __int8 *)_hashCFType(CFSTR("array"));
          CC_SHA1_Init(&c);
          if (CFArrayGetCount((CFArrayRef)a1) >= 1)
          {
            v11 = 0;
            do
            {
              ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)a1, v11);
              v13 = (unsigned __int8 *)_hashCFType(ValueAtIndex);
              if (!v13)
                break;
              v14 = v13;
              CC_SHA1_Update(&c, v13, 0x14u);
              CC_SHA1_Final(v14, &c);
              if (v3)
              {
                for (i = 0; i != 20; ++i)
                  v3[i] ^= v14[i];
              }
              free(v14);
              ++v11;
            }
            while (CFArrayGetCount((CFArrayRef)a1) > v11);
          }
          return v3;
        }
        defaultLogHandle();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v16 = 0;
          _os_log_impl(&dword_213A7E000, v9, OS_LOG_TYPE_DEFAULT, "Failing to hash due to duplicate array entries", v16, 2u);
        }

      }
    }
    else
    {
      if (v2 == CFDictionaryGetTypeID())
        return (unsigned __int8 *)_hashCFDictionary((const __CFDictionary *)a1);
      if (v2 == CFNumberGetTypeID())
        return _hashCFNumber((const __CFNumber *)a1);
    }
    return 0;
  }
  v3 = (unsigned __int8 *)malloc_type_calloc(1uLL, 0x14uLL, 0x877E83E2uLL);
  v6 = CFStringGetLength(a1) + 1;
  v7 = (char *)malloc_type_calloc(1uLL, v6, 0x9DED1793uLL);
  CFStringGetCString(a1, v7, v6, 0x8000100u);
  CC_SHA1(v7, v6, v3);
  free(v7);
  return v3;
}

CFDataRef _MobileAssetCopyFileHash(const __CFAllocator *a1, const __CFString *a2, CFStringRef theString1, uint64_t a4, void (*a5)(uint64_t, float, float), uint64_t a6)
{
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  CFDataRef v19;
  const __CFURL *v20;
  const __CFURL *v21;
  __CFReadStream *v22;
  __CFReadStream *v23;
  UInt8 *v24;
  UInt8 *v25;
  CFIndex v26;
  CFIndex v27;
  uint64_t v28;
  __n128 v29;
  int v30;
  CFDataRef v31;
  CFStringRef v32;
  NSObject *v33;
  NSObject *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  NSObject *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  int v50;
  timeval v52;
  CC_SHA1_CTX c;
  unsigned __int8 md[20];
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  memset(&c, 0, sizeof(c));
  if (CFStringCompare(theString1, CFSTR("SHA-1"), 0) == kCFCompareEqualTo)
  {
    v20 = CFURLCreateWithFileSystemPath(a1, a2, kCFURLPOSIXPathStyle, 0);
    if (!v20)
    {
      defaultLogHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        _MobileAssetCopyFileHash_cold_1((uint64_t)a2, v11);
      goto LABEL_4;
    }
    v21 = v20;
    v22 = CFReadStreamCreateWithFile(a1, v20);
    if (!v22)
    {
      defaultLogHandle();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        _MobileAssetCopyFileHash_cold_2();

      v19 = 0;
      goto LABEL_40;
    }
    v23 = v22;
    if (CFReadStreamOpen(v22))
    {
      if (a5)
        a5(a6, 0.0, -1.0);
      CC_SHA1_Init(&c);
      v24 = (UInt8 *)malloc_type_calloc(1uLL, 0x10000uLL, 0x49093F70uLL);
      if (v24)
      {
        v25 = v24;
        v52.tv_sec = 0;
        *(_QWORD *)&v52.tv_usec = 0;
        gettimeofday(&v52, 0);
        v26 = CFReadStreamRead(v23, v25, 0x10000);
        if (v26 < 1)
        {
LABEL_18:
          CC_SHA1_Final(md, &c);
          v31 = CFDataCreate(a1, md, 20);
          if (v31)
          {
            v19 = v31;
            v32 = _hashToCFString(md);
            if (v32)
              CFRelease(v32);
            if (a5)
              a5(a6, 1.0, -1.0);
            goto LABEL_38;
          }
          defaultLogHandle();
          v42 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
            _MobileAssetCopyFileHash_cold_5(v42, v43, v44, v45, v46, v47, v48, v49);
        }
        else
        {
          v27 = v26;
          v28 = 0;
          while (1)
          {
            CC_SHA1_Update(&c, v25, v27);
            v28 += v27;
            v29.n128_u32[0] = -1.0;
            if (a4)
              v29.n128_f32[0] = (float)v28 / (float)a4;
            if (a5)
            {
              v30 = ((uint64_t (*)(uint64_t, __n128, float))a5)(a6, v29, -1.0);
              if (v30)
                break;
            }
            v27 = CFReadStreamRead(v23, v25, 0x10000);
            if (v27 <= 0)
              goto LABEL_18;
          }
          v50 = v30;
          defaultLogHandle();
          v42 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
            _MobileAssetCopyFileHash_cold_6(v50, v42);
        }

        v19 = 0;
LABEL_38:
        free(v25);
        goto LABEL_39;
      }
      defaultLogHandle();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        _MobileAssetCopyFileHash_cold_4(v34, v35, v36, v37, v38, v39, v40, v41);
    }
    else
    {
      defaultLogHandle();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        _MobileAssetCopyFileHash_cold_3();
    }

    v19 = 0;
LABEL_39:
    CFReadStreamClose(v23);
    CFRelease(v23);
LABEL_40:
    CFRelease(v21);
    return v19;
  }
  defaultLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    _MobileAssetCopyFileHash_cold_7(v11, v12, v13, v14, v15, v16, v17, v18);
LABEL_4:

  return 0;
}

uint64_t _hashCFDictionary(const __CFDictionary *a1)
{
  uint64_t v2;
  int64_t Count;
  const void **v4;
  uint64_t i;
  void *v6;
  const void *Value;
  void *v8;
  unsigned __int8 *v9;
  uint64_t j;
  CC_SHA1_CTX v12;

  if (!CFDictionaryGetCount(a1))
    return 0;
  memset(&v12, 0, sizeof(v12));
  v2 = _hashCFType(CFSTR("dictionary"));
  Count = CFDictionaryGetCount(a1);
  v4 = (const void **)malloc_type_calloc(Count, 8uLL, 0x6004044C4A2DFuLL);
  CFDictionaryGetKeysAndValues(a1, v4, 0);
  if (Count >= 1)
  {
    for (i = 0; i != Count; ++i)
    {
      v6 = (void *)_hashCFType(v4[i]);
      Value = CFDictionaryGetValue(a1, v4[i]);
      v8 = (void *)_hashCFType(Value);
      CC_SHA1_Init(&v12);
      v9 = (unsigned __int8 *)malloc_type_calloc(1uLL, 0x14uLL, 0x663AA81CuLL);
      if (v6)
      {
        CC_SHA1_Update(&v12, v6, 0x14u);
        free(v6);
      }
      if (v8)
      {
        CC_SHA1_Update(&v12, v8, 0x14u);
        free(v8);
      }
      CC_SHA1_Final(v9, &v12);
      if (v2 && v9)
      {
        for (j = 0; j != 20; ++j)
          *(_BYTE *)(v2 + j) ^= v9[j];
      }
      free(v9);
    }
  }
  free(v4);
  return v2;
}

unsigned __int8 *_hashCFNumber(const __CFNumber *a1)
{
  unsigned __int8 *v2;
  size_t v3;
  CFNumberType v4;
  void *v5;
  uint64_t valuePtr;

  v2 = (unsigned __int8 *)malloc_type_calloc(1uLL, 0x14uLL, 0xFF7F1A96uLL);
  valuePtr = 0;
  CFNumberGetValue(a1, kCFNumberSInt64Type, &valuePtr);
  if ((unint64_t)(valuePtr + 1) >= 0xE)
    v3 = 8;
  else
    v3 = 4;
  if ((unint64_t)(valuePtr + 1) < 0xE)
    v4 = kCFNumberSInt32Type;
  else
    v4 = kCFNumberSInt64Type;
  v5 = malloc_type_calloc(1uLL, v3, 0xD98972E9uLL);
  CFNumberGetValue(a1, v4, v5);
  CC_SHA1(v5, v3, v2);
  free(v5);
  return v2;
}

uint64_t _MobileAssetArrayHasDuplicateEntries(const __CFArray *a1)
{
  CFIndex Count;
  CFIndex v3;
  CFIndex v4;
  const void *ValueAtIndex;
  CFRange v7;

  Count = CFArrayGetCount(a1);
  if (Count < 1)
    return 0;
  v3 = Count;
  v4 = 0;
  while (1)
  {
    ValueAtIndex = CFArrayGetValueAtIndex(a1, v4);
    v7.location = 0;
    v7.length = v3;
    if (CFArrayGetCountOfValue(a1, v7, ValueAtIndex) >= 2)
      break;
    if (v3 == ++v4)
      return 0;
  }
  return 1;
}

void OUTLINED_FUNCTION_1_3(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void _MobileAssetCopyFileHash_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_213A7E000, a2, OS_LOG_TYPE_ERROR, "Can't create URL %{public}@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_1();
}

void _MobileAssetCopyFileHash_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_1_3(&dword_213A7E000, v0, v1, "Can't create read stream, %{public}@ %{public}@");
  OUTLINED_FUNCTION_1();
}

void _MobileAssetCopyFileHash_cold_3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_1_3(&dword_213A7E000, v0, v1, "Can't open read stream %{public}@ *** %{public}@");
  OUTLINED_FUNCTION_1();
}

void _MobileAssetCopyFileHash_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_213A7E000, a1, a3, "Can't alloc buffer", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_7();
}

void _MobileAssetCopyFileHash_cold_5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_213A7E000, a1, a3, "Can't create data", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_7();
}

void _MobileAssetCopyFileHash_cold_6(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_213A7E000, a2, OS_LOG_TYPE_ERROR, "Progress handler returned with status %d; failing verification",
    (uint8_t *)v2,
    8u);
  OUTLINED_FUNCTION_7();
}

void _MobileAssetCopyFileHash_cold_7(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_213A7E000, a1, a3, "Unknown algorithm", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_7();
}

unsigned __int8 *__cdecl CC_SHA1(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x24BDAC320](data, *(_QWORD *)&len, md);
}

int CC_SHA1_Final(unsigned __int8 *md, CC_SHA1_CTX *c)
{
  return MEMORY[0x24BDAC328](md, c);
}

int CC_SHA1_Init(CC_SHA1_CTX *c)
{
  return MEMORY[0x24BDAC330](c);
}

int CC_SHA1_Update(CC_SHA1_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x24BDAC338](c, data, *(_QWORD *)&len);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x24BDBB820](theArray);
}

CFIndex CFArrayGetCountOfValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x24BDBB830](theArray, range.location, range.length, value);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x24BDBB850]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x24BDBB860](theArray, idx);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x24BDBBA18]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x24BDBBA20](BOOLean);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x24BDBBC98](allocator, bytes, length);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x24BDBBCE0](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x24BDBBCF8](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x24BDBBD08]();
}

CFAbsoluteTime CFDateGetAbsoluteTime(CFDateRef theDate)
{
  CFAbsoluteTime result;

  MEMORY[0x24BDBBD98](theDate);
  return result;
}

CFTypeID CFDateGetTypeID(void)
{
  return MEMORY[0x24BDBBDA8]();
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x24BDBBE00](theDict);
}

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
  MEMORY[0x24BDBBE10](theDict, keys, values);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x24BDBBE18]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x24BDBBE30](theDict, key);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x24BDBBE68](cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x24BDBC118]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x24BDBC130](number, theType, valuePtr);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC178](key, applicationID, userName, hostName);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x24BDBC188](key, applicationID, keyExistsAndHasValidFormat);
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return MEMORY[0x24BDBC1B0](applicationID, userName, hostName);
}

CFPropertyListRef CFPropertyListCreateDeepCopy(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFOptionFlags mutabilityOption)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC1C8](allocator, propertyList, mutabilityOption);
}

void CFReadStreamClose(CFReadStreamRef stream)
{
  MEMORY[0x24BDBC218](stream);
}

CFReadStreamRef CFReadStreamCreateWithFile(CFAllocatorRef alloc, CFURLRef fileURL)
{
  return (CFReadStreamRef)MEMORY[0x24BDBC230](alloc, fileURL);
}

Boolean CFReadStreamOpen(CFReadStreamRef stream)
{
  return MEMORY[0x24BDBC258](stream);
}

CFIndex CFReadStreamRead(CFReadStreamRef stream, UInt8 *buffer, CFIndex bufferLength)
{
  return MEMORY[0x24BDBC260](stream, buffer, bufferLength);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x24BDBC4D0](theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x24BDBC568](alloc, cStr, *(_QWORD *)&encoding);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x24BDBC600](theString, buffer, bufferSize, *(_QWORD *)&encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x24BDBC658](theString);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x24BDBC698]();
}

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x24BDBC858](allocator, filePath, pathStyle, isDirectory);
}

kern_return_t IOMasterPort(mach_port_t bootstrapPort, mach_port_t *mainPort)
{
  return MEMORY[0x24BDD8688](*(_QWORD *)&bootstrapPort, mainPort);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x24BDD86F8](*(_QWORD *)&object);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x24BDD88B0](*(_QWORD *)&entry, key, allocator, *(_QWORD *)&options);
}

io_registry_entry_t IORegistryEntryFromPath(mach_port_t mainPort, const io_string_t path)
{
  return MEMORY[0x24BDD88C0](*(_QWORD *)&mainPort, path);
}

uint64_t MAECopyActivationRecordWithError()
{
  return MEMORY[0x24BE66A28]();
}

uint64_t MAEGetActivationStateWithError()
{
  return MEMORY[0x24BE66A40]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x24BED8448]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x24BED8470]();
}

uint64_t MGGetStringAnswer()
{
  return MEMORY[0x24BED84B0]();
}

uint64_t MISValidateSignatureAndCopyInfo()
{
  return MEMORY[0x24BEDC860]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x24BDD0B80](aClassName);
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x24BDD1268](aSelector);
}

OSStatus SecCertificateCopyCommonName(SecCertificateRef certificate, CFStringRef *commonName)
{
  return MEMORY[0x24BDE8828](certificate, commonName);
}

uint64_t SecCertificateCopyOrganizationalUnit()
{
  return MEMORY[0x24BDE88B0]();
}

SecCertificateRef SecCertificateCreateWithData(CFAllocatorRef allocator, CFDataRef data)
{
  return (SecCertificateRef)MEMORY[0x24BDE8918](allocator, data);
}

OSStatus SecKeyRawVerify(SecKeyRef key, SecPadding padding, const uint8_t *signedData, size_t signedDataLen, const uint8_t *sig, size_t sigLen)
{
  return MEMORY[0x24BDE8B98](key, *(_QWORD *)&padding, signedData, signedDataLen, sig, sigLen);
}

Boolean SecKeyVerifySignature(SecKeyRef key, SecKeyAlgorithm algorithm, CFDataRef signedData, CFDataRef signature, CFErrorRef *error)
{
  return MEMORY[0x24BDE8BA8](key, algorithm, signedData, signature, error);
}

uint64_t SecPolicyCreateDemoDigitalCatalogSigning()
{
  return MEMORY[0x24BDE8C30]();
}

uint64_t SecPolicyCreateMobileStoreSigner()
{
  return MEMORY[0x24BDE8C58]();
}

uint64_t SecPolicyCreateTestMobileStoreSigner()
{
  return MEMORY[0x24BDE8C80]();
}

SecKeyRef SecTrustCopyPublicKey(SecTrustRef trust)
{
  return (SecKeyRef)MEMORY[0x24BDE8DC8](trust);
}

OSStatus SecTrustCreateWithCertificates(CFTypeRef certificates, CFTypeRef policies, SecTrustRef *trust)
{
  return MEMORY[0x24BDE8DD8](certificates, policies, trust);
}

OSStatus SecTrustEvaluate(SecTrustRef trust, SecTrustResultType *result)
{
  return MEMORY[0x24BDE8DE0](trust, result);
}

OSStatus SecTrustSetAnchorCertificates(SecTrustRef trust, CFArrayRef anchorCertificates)
{
  return MEMORY[0x24BDE8E28](trust, anchorCertificates);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t container_create_or_lookup_path_for_current_user()
{
  return MEMORY[0x24BDADA50]();
}

dispatch_data_t dispatch_data_create(const void *buffer, size_t size, dispatch_queue_t queue, dispatch_block_t destructor)
{
  return (dispatch_data_t)MEMORY[0x24BDADD60](buffer, size, queue, destructor);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

int fflush(FILE *a1)
{
  return MEMORY[0x24BDAE350](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x24BDAE410](__filename, __mode);
}

int fputs(const char *a1, FILE *a2)
{
  return MEMORY[0x24BDAE440](a1, a2);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

uid_t geteuid(void)
{
  return MEMORY[0x24BDAE5F8]();
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x24BDAE780](a1, a2);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED70](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
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

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
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

int objc_sync_enter(id obj)
{
  return MEMORY[0x24BEDD438](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x24BEDD440](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x24BDAF4D0]();
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x24BDAFE40](__str, __size, __format);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x24BDAFEF0](__s1, __s2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x24BDAFF68](__s1, __s2, __n);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x24BDB0000](__str, __endptr, *(_QWORD *)&__base);
}

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
  MEMORY[0x24BDB0630](xarray, value);
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  return MEMORY[0x24BDB0638](xarray, applier);
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return (xpc_object_t)MEMORY[0x24BDB0640](objects, count);
}

xpc_object_t xpc_array_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x24BDB0648]();
}

xpc_object_t xpc_BOOL_create(BOOL value)
{
  return (xpc_object_t)MEMORY[0x24BDB06D8](value);
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return MEMORY[0x24BDB06E0](xBOOL);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
  MEMORY[0x24BDB0718](connection);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x24BDB0740](name, targetq, flags);
}

void xpc_connection_resume(xpc_connection_t connection)
{
  MEMORY[0x24BDB0798](connection);
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
  MEMORY[0x24BDB07A8](connection, message);
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
  MEMORY[0x24BDB07B0](connection, message, replyq, handler);
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x24BDB07B8](connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
  MEMORY[0x24BDB07C8](connection, handler);
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return (char *)MEMORY[0x24BDB0820](object);
}

xpc_object_t xpc_data_create(const void *bytes, size_t length)
{
  return (xpc_object_t)MEMORY[0x24BDB0868](bytes, length);
}

xpc_object_t xpc_data_create_with_dispatch_data(dispatch_data_t ddata)
{
  return (xpc_object_t)MEMORY[0x24BDB0870](ddata);
}

const void *__cdecl xpc_data_get_bytes_ptr(xpc_object_t xdata)
{
  return (const void *)MEMORY[0x24BDB0880](xdata);
}

size_t xpc_data_get_length(xpc_object_t xdata)
{
  return MEMORY[0x24BDB0888](xdata);
}

xpc_object_t xpc_date_create(int64_t interval)
{
  return (xpc_object_t)MEMORY[0x24BDB0890](interval);
}

int64_t xpc_date_get_value(xpc_object_t xdate)
{
  return MEMORY[0x24BDB08A0](xdate);
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return MEMORY[0x24BDB08B0](xdict, applier);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x24BDB08C0](keys, values, count);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x24BDB08D8](original);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x24BDB0908](xdict, key);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return (const void *)MEMORY[0x24BDB0918](xdict, key, length);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x24BDB0938](xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x24BDB0950](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x24BDB0958](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x24BDB0968](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
  MEMORY[0x24BDB0978](xdict, key, value);
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
  MEMORY[0x24BDB0988](xdict, key, bytes, length);
}

void xpc_dictionary_set_date(xpc_object_t xdict, const char *key, int64_t value)
{
  MEMORY[0x24BDB0990](xdict, key, value);
}

void xpc_dictionary_set_double(xpc_object_t xdict, const char *key, double value)
{
  MEMORY[0x24BDB0998](xdict, key, value);
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
  MEMORY[0x24BDB09A8](xdict, key, value);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
  MEMORY[0x24BDB09C8](xdict, key, string);
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
  MEMORY[0x24BDB09E0](xdict, key, value);
}

xpc_object_t xpc_double_create(double value)
{
  return (xpc_object_t)MEMORY[0x24BDB09E8](value);
}

double xpc_double_get_value(xpc_object_t xdouble)
{
  double result;

  MEMORY[0x24BDB09F0](xdouble);
  return result;
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x24BDB0A70](object);
}

xpc_object_t xpc_int64_create(int64_t value)
{
  return (xpc_object_t)MEMORY[0x24BDB0A80](value);
}

int64_t xpc_int64_get_value(xpc_object_t xint)
{
  return MEMORY[0x24BDB0A88](xint);
}

xpc_object_t xpc_string_create(const char *string)
{
  return (xpc_object_t)MEMORY[0x24BDB0B80](string);
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return (const char *)MEMORY[0x24BDB0BA8](xstring);
}

uint64_t xpc_uint64_get_value(xpc_object_t xuint)
{
  return MEMORY[0x24BDB0BE0](xuint);
}

