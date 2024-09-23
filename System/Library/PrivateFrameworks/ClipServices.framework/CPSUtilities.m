@implementation CPSUtilities

+ (id)openURL:(id)a3
{
  return (id)objc_msgSend(a1, "openURL:withOptions:", a3, 0);
}

+ (id)openURL:(id)a3 withOptions:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  id v11;

  v5 = (void *)MEMORY[0x24BDC1548];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "defaultWorkspace");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  objc_msgSend(v8, "openURL:withOptions:error:", v7, v6, &v11);

  v9 = v11;
  return v9;
}

+ (void)openURL:(id)a3 inAppWithBundleIdentifier:(id)a4 completionHandler:(id)a5
{
  objc_msgSend(a1, "openURL:inAppWithBundleIdentifier:promptForUnlock:originIsControlCenter:completionHandler:", a3, a4, 0, 0, a5);
}

+ (void)openURL:(id)a3 inAppWithBundleIdentifier:(id)a4 promptForUnlock:(BOOL)a5 originIsControlCenter:(BOOL)a6 completionHandler:(id)a7
{
  _BOOL4 v8;
  _BOOL8 v9;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  _QWORD *v20;
  void *v21;
  id v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[5];
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;

  v8 = a6;
  v9 = a5;
  v11 = a3;
  v12 = a4;
  v13 = a7;
  v14 = objc_alloc(MEMORY[0x24BDC1598]);
  v15 = (void *)objc_msgSend(v14, "initWithActivityType:", *MEMORY[0x24BDD13E8]);
  objc_msgSend(v15, "setWebpageURL:", v11);
  objc_msgSend(MEMORY[0x24BDC1538], "applicationProxyForIdentifier:", v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v9);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v18, *MEMORY[0x24BE38310]);

  v19 = MEMORY[0x24BDAC760];
  if (v8)
  {
    v26 = 0;
    v27 = &v26;
    v28 = 0x2020000000;
    v20 = (_QWORD *)getCCUIAppLaunchOriginControlCenterSymbolLoc_ptr;
    v29 = getCCUIAppLaunchOriginControlCenterSymbolLoc_ptr;
    if (!getCCUIAppLaunchOriginControlCenterSymbolLoc_ptr)
    {
      v25[0] = MEMORY[0x24BDAC760];
      v25[1] = 3221225472;
      v25[2] = __getCCUIAppLaunchOriginControlCenterSymbolLoc_block_invoke;
      v25[3] = &unk_24C3B9278;
      v25[4] = &v26;
      __getCCUIAppLaunchOriginControlCenterSymbolLoc_block_invoke((uint64_t)v25);
      v20 = (_QWORD *)v27[3];
    }
    _Block_object_dispose(&v26, 8);
    if (!v20)
      +[CPSUtilities openURL:inAppWithBundleIdentifier:promptForUnlock:originIsControlCenter:completionHandler:].cold.1();
    objc_msgSend(v17, "setObject:forKeyedSubscript:", *v20, *MEMORY[0x24BE382E0]);
  }
  objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v19;
  v23[1] = 3221225472;
  v23[2] = __106__CPSUtilities_openURL_inAppWithBundleIdentifier_promptForUnlock_originIsControlCenter_completionHandler___block_invoke;
  v23[3] = &unk_24C3B91D8;
  v24 = v13;
  v22 = v13;
  objc_msgSend(v21, "openUserActivity:withApplicationProxy:options:completionHandler:", v15, v16, v17, v23);

}

uint64_t __106__CPSUtilities_openURL_inAppWithBundleIdentifier_promptForUnlock_originIsControlCenter_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (void)openAppWithBundleIdentifier:(id)a3
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)MEMORY[0x24BDC1548];
  v4 = a3;
  objc_msgSend(v3, "defaultWorkspace");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "openApplicationWithBundleID:", v4);

}

+ (id)versionIdentifierForAppWithBundleIdentifier:(id)a3 isPlaceholder:(BOOL *)a4
{
  objc_class *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = (objc_class *)MEMORY[0x24BDC1540];
  v6 = a3;
  v7 = (void *)objc_msgSend([v5 alloc], "initWithBundleIdentifier:allowPlaceholder:error:", v6, 1, 0);

  if (a4)
    *a4 = objc_msgSend(v7, "isPlaceholder");
  if (v7)
  {
    v8 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v7, "iTunesMetadata");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "numberWithUnsignedLongLong:", objc_msgSend(v9, "versionIdentifier"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (void)uninstallAppWithBundleIdentifier:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint8_t buf[16];

  v5 = a3;
  v6 = a4;
  v7 = CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_20AD44000, v7, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "UninstallClip", "start uninstall clip", buf, 2u);
  }
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC1540]), "initWithBundleIdentifier:allowPlaceholder:error:", v5, 1, 0);
  objc_msgSend(v8, "appClipMetadata");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = (void *)MEMORY[0x24BE51F70];
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __60__CPSUtilities_uninstallAppWithBundleIdentifier_completion___block_invoke;
    v13[3] = &unk_24C3B9228;
    v14 = v5;
    v15 = v6;
    objc_msgSend(v10, "uninstallAppWithBundleID:requestUserConfirmation:completion:", v14, 0, v13);

    v11 = v14;
LABEL_8:

    goto LABEL_9;
  }
  v12 = CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    +[CPSUtilities uninstallAppWithBundleIdentifier:completion:].cold.1((uint64_t)v5, v12);
    if (!v6)
      goto LABEL_9;
    goto LABEL_7;
  }
  if (v6)
  {
LABEL_7:
    objc_msgSend(MEMORY[0x24BDD1540], "cps_errorWithCode:", 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v6 + 2))(v6, v11);
    goto LABEL_8;
  }
LABEL_9:

}

void __60__CPSUtilities_uninstallAppWithBundleIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = CPS_LOG_CHANNEL_PREFIXClipServices();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __60__CPSUtilities_uninstallAppWithBundleIdentifier_completion___block_invoke_cold_1(a1, v5, v3);
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v9 = 138477827;
    v10 = v6;
    _os_log_impl(&dword_20AD44000, v5, OS_LOG_TYPE_INFO, "CPSUtilities: successfully uninstalled app %{private}@", (uint8_t *)&v9, 0xCu);
  }
  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v3);
  v8 = CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_signpost_enabled(v8))
  {
    LOWORD(v9) = 0;
    _os_signpost_emit_with_name_impl(&dword_20AD44000, v8, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "UninstallClip", "end uninstall clip", (uint8_t *)&v9, 2u);
  }

}

+ (id)poweredByCaptionForAppName:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = a3;
  _CPSLocalizedString(CFSTR("Powered by %@"), &_CPSLocalizableStringsBundleOnceToken, &_CPSLocalizableStringsBundle);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (int)_deviceClass
{
  if (_deviceClass_onceToken != -1)
    dispatch_once(&_deviceClass_onceToken, &__block_literal_global_6);
  return _deviceClass_deviceClass;
}

uint64_t __28__CPSUtilities__deviceClass__block_invoke()
{
  uint64_t result;

  result = MGGetSInt32Answer();
  _deviceClass_deviceClass = result;
  return result;
}

+ (id)localizedDeviceName
{
  if (localizedDeviceName_onceToken != -1)
    dispatch_once(&localizedDeviceName_onceToken, &__block_literal_global_14_0);
  return (id)localizedDeviceName_localizedDeviceName;
}

void __35__CPSUtilities_localizedDeviceName__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = MGGetStringAnswer();
  v1 = (void *)localizedDeviceName_localizedDeviceName;
  localizedDeviceName_localizedDeviceName = v0;

}

+ (id)lowercasedDeviceFamilyName
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42__CPSUtilities_lowercasedDeviceFamilyName__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (lowercasedDeviceFamilyName_onceToken != -1)
    dispatch_once(&lowercasedDeviceFamilyName_onceToken, block);
  return (id)lowercasedDeviceFamilyName_lowercasedDeviceFamilyName;
}

void __42__CPSUtilities_lowercasedDeviceFamilyName__block_invoke()
{
  int v0;
  const __CFString *v1;
  void *v2;

  v0 = objc_msgSend((id)objc_opt_class(), "_deviceClass");
  if (v0 == 1)
  {
    v1 = CFSTR("iphone");
  }
  else
  {
    if (v0 != 3)
      return;
    v1 = CFSTR("ipad");
  }
  v2 = (void *)lowercasedDeviceFamilyName_lowercasedDeviceFamilyName;
  lowercasedDeviceFamilyName_lowercasedDeviceFamilyName = (uint64_t)v1;

}

+ (id)oppositeDeviceFamilyName
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __40__CPSUtilities_oppositeDeviceFamilyName__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (oppositeDeviceFamilyName_onceToken != -1)
    dispatch_once(&oppositeDeviceFamilyName_onceToken, block);
  return (id)oppositeDeviceFamilyName_oppositeDeviceFamilyName;
}

void __40__CPSUtilities_oppositeDeviceFamilyName__block_invoke()
{
  int v0;
  const __CFString *v1;
  void *v2;

  v0 = objc_msgSend((id)objc_opt_class(), "_deviceClass");
  if (v0 == 1)
  {
    v1 = CFSTR("iPad");
  }
  else
  {
    if (v0 != 3)
      return;
    v1 = CFSTR("iPhone");
  }
  v2 = (void *)oppositeDeviceFamilyName_oppositeDeviceFamilyName;
  oppositeDeviceFamilyName_oppositeDeviceFamilyName = (uint64_t)v1;

}

+ (BOOL)deviceIsPad
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __27__CPSUtilities_deviceIsPad__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (deviceIsPad_onceToken != -1)
    dispatch_once(&deviceIsPad_onceToken, block);
  return deviceIsPad_isPad;
}

uint64_t __27__CPSUtilities_deviceIsPad__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_deviceClass");
  deviceIsPad_isPad = (_DWORD)result == 3;
  return result;
}

+ (BOOL)deviceHasHomeButton
{
  if (deviceHasHomeButton_onceToken != -1)
    dispatch_once(&deviceHasHomeButton_onceToken, &__block_literal_global_25);
  return deviceHasHomeButton_hasHomeButton;
}

uint64_t __35__CPSUtilities_deviceHasHomeButton__block_invoke()
{
  uint64_t result;

  result = MGGetSInt32Answer();
  deviceHasHomeButton_hasHomeButton = (_DWORD)result != 2;
  return result;
}

+ (BOOL)deviceIsLocked
{
  return MKBGetDeviceLockState() - 1 < 2;
}

+ (BOOL)shouldPlayHaptics
{
  Boolean keyExistsAndHasValidFormat;

  if (shouldPlayHaptics_onceToken != -1)
    dispatch_once(&shouldPlayHaptics_onceToken, &__block_literal_global_28);
  if (!shouldPlayHaptics_supportsHaptics)
    return 0;
  keyExistsAndHasValidFormat = 0;
  return CFPreferencesGetAppBooleanValue(CFSTR("effects-haptic"), CFSTR("com.apple.preferences.sounds"), &keyExistsAndHasValidFormat)|| keyExistsAndHasValidFormat == 0;
}

uint64_t __33__CPSUtilities_shouldPlayHaptics__block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  shouldPlayHaptics_supportsHaptics = result;
  return result;
}

+ (BOOL)isBundleIdentifierBeingInstalled:(id)a3
{
  void *v3;
  BOOL v4;

  objc_msgSend(MEMORY[0x24BE51F70], "existingCoordinatorForAppWithBundleID:error:", a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

+ (BOOL)isNetworkConstrained
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(MEMORY[0x24BDE07E8], "sharedDefaultEvaluator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isConstrained");

  return v4;
}

+ (BOOL)deviceHasCapabilities:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  BOOL v8;
  NSObject *v9;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "safari_filterObjectsUsingBlock:", &__block_literal_global_37);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = (void *)MGCopyMultipleAnswers();
    objc_msgSend(v5, "safari_mapAndFilterKeysAndObjectsUsingBlock:", &__block_literal_global_40);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");
    v8 = v7 == objc_msgSend(v4, "count");
    if (!v8)
    {
      v9 = CPS_LOG_CHANNEL_PREFIXClipServices();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v11 = 138412290;
        v12 = v4;
        _os_log_impl(&dword_20AD44000, v9, OS_LOG_TYPE_INFO, "CPSUtilities: app clip requires capabilities that is not supported by this device [ %@].", (uint8_t *)&v11, 0xCu);
      }
    }

  }
  else
  {
    v8 = 1;
    v4 = v3;
  }

  return v8;
}

uint64_t __38__CPSUtilities_deviceHasCapabilities___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  int v5;

  v2 = (void *)MEMORY[0x24BDBCEF8];
  v3 = a2;
  objc_msgSend(v2, "null");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  return v5 ^ 1u;
}

id __38__CPSUtilities_deviceHasCapabilities___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  void *v4;
  id v5;

  v3 = a3;
  if (objc_msgSend(v3, "BOOLValue"))
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

+ (BOOL)appClipAssociatedDomainIsApprovedForURL:(id)a3 applicationIdentifier:(id)a4
{
  return objc_msgSend(a1, "_associatedDomainIsApprovedForURL:applicationIdentifier:serviceType:", a3, a4, *MEMORY[0x24BE8F740]);
}

+ (BOOL)validDomainAssociationWithAnyServiceTypeForURL:(id)a3 applicationIdentifier:(id)a4
{
  return objc_msgSend(a1, "_associatedDomainIsApprovedForURL:applicationIdentifier:serviceType:", a3, a4, 0);
}

+ (BOOL)_associatedDomainIsApprovedForURL:(id)a3 applicationIdentifier:(id)a4 serviceType:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  char v18;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = a5;
  if (a3)
  {
    objc_msgSend(MEMORY[0x24BDD1808], "componentsWithURL:resolvingAgainstBaseURL:", a3, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "host");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE8F730]), "initWithServiceType:applicationIdentifier:domain:", v8, v7, 0);
      objc_msgSend(MEMORY[0x24BE8F728], "serviceDetailsWithServiceSpecifier:error:", v11, 0);
      v21 = 0u;
      v22 = 0u;
      v23 = 0u;
      v24 = 0u;
      v12 = (id)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v13)
      {
        v20 = v11;
        v14 = *(_QWORD *)v22;
        while (2)
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v22 != v14)
              objc_enumerationMutation(v12);
            v16 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
            if (objc_msgSend(v16, "isApproved"))
            {
              objc_msgSend(v16, "serviceSpecifier");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              v18 = objc_msgSend(v17, "domainEncompassesDomain:", v10);

              if ((v18 & 1) != 0)
              {
                LOBYTE(v13) = 1;
                goto LABEL_16;
              }
            }
          }
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
          if (v13)
            continue;
          break;
        }
LABEL_16:
        v11 = v20;
      }

    }
    else
    {
      LOBYTE(v13) = 0;
    }

  }
  else
  {
    LOBYTE(v13) = 0;
  }

  return v13;
}

+ (id)productVariants
{
  if (productVariants_onceToken != -1)
    dispatch_once(&productVariants_onceToken, &__block_literal_global_44);
  return (id)productVariants_productVariants;
}

void __31__CPSUtilities_productVariants__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = MGCopyAnswer();
  v1 = (void *)productVariants_productVariants;
  productVariants_productVariants = v0;

}

+ (id)osVersion
{
  if (osVersion_onceToken != -1)
    dispatch_once(&osVersion_onceToken, &__block_literal_global_47);
  return (id)osVersion_productVersion;
}

void __25__CPSUtilities_osVersion__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = MGCopyAnswer();
  v1 = (void *)osVersion_productVersion;
  osVersion_productVersion = v0;

}

+ (void)openURL:inAppWithBundleIdentifier:promptForUnlock:originIsControlCenter:completionHandler:.cold.1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getCCUIAppLaunchOriginControlCenter(void)");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("CPSUtilities.m"), 26, CFSTR("%s"), dlerror());

  __break(1u);
}

+ (void)uninstallAppWithBundleIdentifier:(uint64_t)a1 completion:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138477827;
  v3 = a1;
  _os_log_error_impl(&dword_20AD44000, a2, OS_LOG_TYPE_ERROR, "CPSUtilities: Not an app clip (%{private}@). Skipping deletion.", (uint8_t *)&v2, 0xCu);
}

void __60__CPSUtilities_uninstallAppWithBundleIdentifier_completion___block_invoke_cold_1(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  NSObject *v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = *(_QWORD *)(a1 + 32);
  v5 = a2;
  objc_msgSend(a3, "cps_privacyPreservingDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138478083;
  v8 = v4;
  v9 = 2114;
  v10 = v6;
  _os_log_error_impl(&dword_20AD44000, v5, OS_LOG_TYPE_ERROR, "CPSUtilities: Error in uninstalling app %{private}@: %{public}@", (uint8_t *)&v7, 0x16u);

}

@end
