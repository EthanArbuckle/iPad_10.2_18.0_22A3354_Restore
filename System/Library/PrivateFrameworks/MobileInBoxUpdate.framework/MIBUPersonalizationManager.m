@implementation MIBUPersonalizationManager

+ (id)requestTatsuTicketForDevice:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  uint64_t v22;
  id v23;
  void *v24;
  int v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  NSObject *v32;
  uint64_t PersonalizedResponse;
  uint64_t v34;
  void *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  uint64_t v41;
  NSObject *v42;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  id v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  id v80;
  id v81;
  id v82;
  id v83;
  id v84;
  id v85;
  id v86;
  id v87;
  CFDictionaryRef theDict;
  char v89;
  _QWORD v90[10];
  _QWORD v91[10];
  uint8_t buf[4];
  id v93;
  __int16 v94;
  void *v95;
  uint64_t v96;

  v96 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v89 = 49;
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &v89, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_opt_new();
  theDict = 0;
  if (MIBUOnceToken != -1)
    dispatch_once(&MIBUOnceToken, &__block_literal_global_10);
  v9 = MIBUConnObj;
  if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v93 = v6;
    _os_log_impl(&dword_222C3F000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: Requesting personalization ticket ...", buf, 0xCu);
  }
  if (MIBUOnceToken != -1)
    dispatch_once(&MIBUOnceToken, &__block_literal_global_12);
  v10 = (void *)MIBUConnObj;
  if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_DEFAULT))
  {
    v90[0] = CFSTR("SerialNumber");
    v11 = v10;
    objc_msgSend(v6, "serialNumber");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    v91[0] = v79;
    v90[1] = CFSTR("ECID");
    objc_msgSend(v6, "ecid");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    v91[1] = v78;
    v90[2] = CFSTR("BoardID");
    objc_msgSend(v6, "boardID");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v91[2] = v77;
    v90[3] = CFSTR("ChipID");
    objc_msgSend(v6, "chipID");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v91[3] = v76;
    v90[4] = CFSTR("Security Domain");
    objc_msgSend(v6, "securityDomain");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v91[4] = v75;
    v90[5] = CFSTR("APNounce");
    objc_msgSend(v6, "apNonce");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v91[5] = v74;
    v90[6] = CFSTR("Production Mode");
    v80 = a1;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v6, "productionMode"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v91[6] = v12;
    v90[7] = CFSTR("Security Mode");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v6, "securityMode"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v91[7] = v13;
    v90[8] = CFSTR("UID Mode");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v6, "uidMode"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v91[8] = v14;
    v90[9] = CFSTR("SEPNonce");
    objc_msgSend(v6, "sepNonce");
    v15 = v8;
    v16 = a4;
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v91[9] = v17;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v91, v90, 10);
    v18 = v7;
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v93 = v6;
    v94 = 2114;
    v95 = v19;
    _os_log_impl(&dword_222C3F000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: Device Info: %{public}@", buf, 0x16u);

    v7 = v18;
    a4 = v16;
    v8 = v15;

    a1 = v80;
  }
  if (os_variant_has_internal_content())
  {
    +[MIBUTestPreferences sharedInstance](MIBUTestPreferences, "sharedInstance");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "useLiveTatsu");

    if ((v21 & 1) == 0)
    {
      if (MIBUOnceToken != -1)
        dispatch_once(&MIBUOnceToken, &__block_literal_global_37);
      v36 = MIBUConnObj;
      if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v93 = v6;
        _os_log_impl(&dword_222C3F000, v36, OS_LOG_TYPE_DEFAULT, "%{public}@: Faking Tatsu ticket, waiting for 30s...", buf, 0xCu);
      }
      sleep(0x1Eu);
      +[MIBUTestPreferences sharedInstance](MIBUTestPreferences, "sharedInstance");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "fakeTatsuPayloadPath");
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      if (v38)
      {
        if (MIBUOnceToken != -1)
          dispatch_once(&MIBUOnceToken, &__block_literal_global_39);
        v39 = MIBUConnObj;
        if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v93 = v6;
          v94 = 2114;
          v95 = v38;
          _os_log_impl(&dword_222C3F000, v39, OS_LOG_TYPE_DEFAULT, "%{public}@: Loading tatsu payload from file: %{public}@", buf, 0x16u);
        }
        v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithContentsOfFile:", v38);
        objc_msgSend(v40, "objectForKey:", *MEMORY[0x24BEDA7E0]);
        v41 = objc_claimAutoreleasedReturnValue();
        if (!v41)
        {
          if (MIBUOnceToken != -1)
            dispatch_once(&MIBUOnceToken, &__block_literal_global_41);
          if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR))
            +[MIBUPersonalizationManager requestTatsuTicketForDevice:error:].cold.7();
          v87 = 0;
          safeAssignError(&v87, 100663296, 0, CFSTR("Failed load tatsu payload from file: %@"), v69, v70, v71, v72, (uint64_t)v38);
          v23 = v87;

          v35 = 0;
          goto LABEL_48;
        }
        v35 = (void *)v41;

      }
      else
      {
        if (MIBUOnceToken != -1)
          dispatch_once(&MIBUOnceToken, &__block_literal_global_45);
        v42 = MIBUConnObj;
        if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v93 = v6;
          _os_log_impl(&dword_222C3F000, v42, OS_LOG_TYPE_DEFAULT, "%{public}@: Generating fake tatsu payload", buf, 0xCu);
        }
        objc_msgSend(MEMORY[0x24BDBCE50], "generateRandomBytesOfSize:", 0xFFFFLL);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v23 = 0;
LABEL_48:

      goto LABEL_49;
    }
  }
  v86 = 0;
  v22 = objc_msgSend(a1, "_createBaseAMAIObjectForDevice:error:", v6, &v86);
  v23 = v86;
  if (v22)
  {
    if (os_variant_has_internal_content())
    {
      +[MIBUTestPreferences sharedInstance](MIBUTestPreferences, "sharedInstance");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "useAppleConnect");

      if (v25)
      {
        if (MIBUOnceToken != -1)
          dispatch_once(&MIBUOnceToken, &__block_literal_global_49);
        v26 = MIBUConnObj;
        if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v93 = v6;
          _os_log_impl(&dword_222C3F000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@: Using AppleConnect for personalization ...", buf, 0xCu);
        }
        v27 = AMAuthInstallSsoInitialize();
        if ((_DWORD)v27)
        {
          v58 = v27;
          if (MIBUOnceToken != -1)
            dispatch_once(&MIBUOnceToken, &__block_literal_global_51);
          if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR))
            +[MIBUPersonalizationManager requestTatsuTicketForDevice:error:].cold.6();
          v85 = v23;
          safeAssignError(&v85, 100663296, 0, CFSTR("Failed load SSOClient.framework; status: %d"),
            v59,
            v60,
            v61,
            v62,
            v58);
          v49 = v85;
        }
        else
        {
          v28 = AMAuthInstallSsoEnable();
          if (!(_DWORD)v28)
            goto LABEL_20;
          v63 = v28;
          if (MIBUOnceToken != -1)
            dispatch_once(&MIBUOnceToken, &__block_literal_global_55);
          if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR))
            +[MIBUPersonalizationManager requestTatsuTicketForDevice:error:].cold.5();
          v84 = v23;
          safeAssignError(&v84, 100663296, 0, CFSTR("Failed to enable AC SSO, status: %d"), v64, v65, v66, v67, v63);
          v49 = v84;
        }
LABEL_82:
        v68 = v49;

        v35 = 0;
        v23 = v68;
        goto LABEL_49;
      }
    }
LABEL_20:
    objc_msgSend(v8, "setObject:forKey:", v7, CFSTR("Ap,EnableInBoxUpdate"));
    objc_msgSend(v6, "sepNonce");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v29, *MEMORY[0x24BEDA818]);

    if (objc_msgSend(v6, "sikaFuseExists"))
    {
      objc_msgSend(v6, "sikaFuse");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKey:", v30, *MEMORY[0x24BEDA820]);

    }
    v31 = AMAuthInstallApImg4ServerRequestAddRequiredTags();
    if ((_DWORD)v31)
    {
      v44 = v31;
      if (MIBUOnceToken != -1)
        dispatch_once(&MIBUOnceToken, &__block_literal_global_61);
      if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR))
        +[MIBUPersonalizationManager requestTatsuTicketForDevice:error:].cold.4();
      v83 = v23;
      safeAssignError(&v83, 100663296, 0, CFSTR("Failed to add measurement dict, status: %d"), v45, v46, v47, v48, v44);
      v49 = v83;
    }
    else
    {
      if (MIBUOnceToken != -1)
        dispatch_once(&MIBUOnceToken, &__block_literal_global_65);
      v32 = MIBUConnObj;
      if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v93 = v6;
        _os_log_impl(&dword_222C3F000, v32, OS_LOG_TYPE_DEFAULT, "%{public}@: Sending Tatsu personalization request...", buf, 0xCu);
      }
      PersonalizedResponse = AMAuthInstallApCreatePersonalizedResponse();
      if ((_DWORD)PersonalizedResponse || !theDict)
      {
        if (MIBUOnceToken != -1)
          dispatch_once(&MIBUOnceToken, &__block_literal_global_67);
        if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR))
          +[MIBUPersonalizationManager requestTatsuTicketForDevice:error:].cold.2();
        v82 = v23;
        safeAssignError(&v82, 100663296, 0, CFSTR("Fail Tatsu personalization, status: %d"), v50, v51, v52, v53, PersonalizedResponse);
        v49 = v82;
      }
      else
      {
        CFDictionaryGetValue(theDict, (const void *)*MEMORY[0x24BEDA7E0]);
        v34 = objc_claimAutoreleasedReturnValue();
        if (v34)
        {
          v35 = (void *)v34;
          goto LABEL_49;
        }
        if (MIBUOnceToken != -1)
          dispatch_once(&MIBUOnceToken, &__block_literal_global_71);
        if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR))
          +[MIBUPersonalizationManager requestTatsuTicketForDevice:error:].cold.3();
        v81 = v23;
        safeAssignError(&v81, 100663296, 0, CFSTR("Failed to parse payload from personalization response"), v54, v55, v56, v57, v73);
        v49 = v81;
      }
    }
    goto LABEL_82;
  }
  if (MIBUOnceToken != -1)
    dispatch_once(&MIBUOnceToken, &__block_literal_global_47);
  if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR))
    +[MIBUPersonalizationManager requestTatsuTicketForDevice:error:].cold.1();
  v35 = 0;
LABEL_49:
  if (a4)
    *a4 = objc_retainAutorelease(v23);
  AMSupportSafeRelease();

  return v35;
}

void __64__MIBUPersonalizationManager_requestTatsuTicketForDevice_error___block_invoke()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v2)
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

void __64__MIBUPersonalizationManager_requestTatsuTicketForDevice_error___block_invoke_11()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v2)
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

void __64__MIBUPersonalizationManager_requestTatsuTicketForDevice_error___block_invoke_36()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v2)
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

void __64__MIBUPersonalizationManager_requestTatsuTicketForDevice_error___block_invoke_38()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v2)
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

void __64__MIBUPersonalizationManager_requestTatsuTicketForDevice_error___block_invoke_40()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v2)
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

void __64__MIBUPersonalizationManager_requestTatsuTicketForDevice_error___block_invoke_44()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v2)
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

void __64__MIBUPersonalizationManager_requestTatsuTicketForDevice_error___block_invoke_46()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v2)
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

void __64__MIBUPersonalizationManager_requestTatsuTicketForDevice_error___block_invoke_48()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v2)
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

void __64__MIBUPersonalizationManager_requestTatsuTicketForDevice_error___block_invoke_50()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v2)
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

void __64__MIBUPersonalizationManager_requestTatsuTicketForDevice_error___block_invoke_54()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v2)
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

void __64__MIBUPersonalizationManager_requestTatsuTicketForDevice_error___block_invoke_60()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v2)
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

void __64__MIBUPersonalizationManager_requestTatsuTicketForDevice_error___block_invoke_64()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v2)
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

void __64__MIBUPersonalizationManager_requestTatsuTicketForDevice_error___block_invoke_66()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v2)
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

void __64__MIBUPersonalizationManager_requestTatsuTicketForDevice_error___block_invoke_70()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v2)
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

+ (__AMAuthInstall)_createBaseAMAIObjectForDevice:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  const __CFAllocator *v8;
  __AMAuthInstall *v9;
  CFURLRef v10;
  uint64_t v11;
  CFMutableDictionaryRef Mutable;
  __CFDictionary *v13;
  const void *v14;
  void *v15;
  void *v16;
  const void *v17;
  void *v18;
  void *v19;
  const void *v20;
  void *v21;
  void *v22;
  const void *v23;
  void *v24;
  void *v25;
  const void *v26;
  int v27;
  const void *v28;
  const void *v29;
  const void *v30;
  const void *v31;
  const void *v32;
  const void *v33;
  void *v34;
  void *v35;
  const void *v36;
  const void *v37;
  uint64_t v38;
  id v39;
  char v40;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  __CFString *v46;
  id *v47;
  uint64_t *v48;
  NSObject *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  __CFString *v62;
  uint64_t *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint8_t buf[4];
  id v73;
  __int16 v74;
  uint64_t LibraryVersionString;
  uint64_t v76;

  v76 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  AMAuthInstallLogSetHandler();
  if (MIBUOnceToken != -1)
    dispatch_once(&MIBUOnceToken, &__block_literal_global_76);
  v6 = (void *)MIBUConnObj;
  if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    *(_DWORD *)buf = 138543618;
    v73 = v5;
    v74 = 2112;
    LibraryVersionString = AMAuthInstallSupportGetLibraryVersionString();
    _os_log_impl(&dword_222C3F000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Building base AMAI object from %@", buf, 0x16u);

  }
  v8 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v9 = (__AMAuthInstall *)AMAuthInstallCreate();
  if (!v9)
  {
    if (MIBUOnceToken != -1)
      dispatch_once(&MIBUOnceToken, &__block_literal_global_78);
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR))
      +[MIBUPersonalizationManager _createBaseAMAIObjectForDevice:error:].cold.1();
    v71 = 0;
    v46 = CFSTR("Failed to create AMAuthInstall object");
    v47 = (id *)&v71;
    v48 = &v71;
    goto LABEL_50;
  }
  v10 = CFURLCreateWithString(v8, CFSTR("https://gs.apple.com:443"), 0);
  if (!v10)
  {
    if (MIBUOnceToken != -1)
      dispatch_once(&MIBUOnceToken, &__block_literal_global_82);
    v49 = MIBUConnObj;
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR))
      +[MIBUPersonalizationManager _createBaseAMAIObjectForDevice:error:].cold.2((uint64_t)v5, v49);
    v70 = 0;
    v46 = CFSTR("Failed to create server URL object");
    v47 = (id *)&v70;
    v48 = &v70;
LABEL_50:
    safeAssignError(v48, 100663296, 0, v46, v42, v43, v44, v45, v65);
LABEL_72:
    v40 = 0;
    goto LABEL_73;
  }
  v11 = (uint64_t)v10;
  if (AMAuthInstallSetSigningServerURL())
  {
    if (MIBUOnceToken != -1)
      dispatch_once(&MIBUOnceToken, &__block_literal_global_86);
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR))
      +[MIBUPersonalizationManager _createBaseAMAIObjectForDevice:error:].cold.6();
    v69 = 0;
    v47 = (id *)&v69;
    safeAssignError(&v69, 100663296, 0, CFSTR("Failed to set signing server URL to %@"), v50, v51, v52, v53, v11);
    goto LABEL_72;
  }
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  if (Mutable)
  {
    v13 = Mutable;
    v14 = (const void *)*MEMORY[0x24BEDA748];
    objc_msgSend(v5, "ecid");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      objc_msgSend(v5, "ecid");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      CFDictionarySetValue(v13, v14, v16);

    }
    else
    {
      CFDictionarySetValue(v13, v14, (const void *)*MEMORY[0x24BDBD430]);
    }

    v17 = (const void *)*MEMORY[0x24BEDA740];
    objc_msgSend(v5, "chipID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      objc_msgSend(v5, "chipID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      CFDictionarySetValue(v13, v17, v19);

    }
    else
    {
      CFDictionarySetValue(v13, v17, (const void *)*MEMORY[0x24BDBD430]);
    }

    v20 = (const void *)*MEMORY[0x24BEDA738];
    objc_msgSend(v5, "boardID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      objc_msgSend(v5, "boardID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      CFDictionarySetValue(v13, v20, v22);

    }
    else
    {
      CFDictionarySetValue(v13, v20, (const void *)*MEMORY[0x24BDBD430]);
    }

    v23 = (const void *)*MEMORY[0x24BEDA778];
    objc_msgSend(v5, "securityDomain");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      objc_msgSend(v5, "securityDomain");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      CFDictionarySetValue(v13, v23, v25);

    }
    else
    {
      CFDictionarySetValue(v13, v23, (const void *)*MEMORY[0x24BDBD430]);
    }

    v26 = (const void *)*MEMORY[0x24BEDA780];
    v27 = objc_msgSend(v5, "securityMode");
    v28 = (const void *)*MEMORY[0x24BDBD270];
    v29 = (const void *)*MEMORY[0x24BDBD268];
    if (v27)
      v30 = (const void *)*MEMORY[0x24BDBD270];
    else
      v30 = (const void *)*MEMORY[0x24BDBD268];
    CFDictionarySetValue(v13, v26, v30);
    v31 = (const void *)*MEMORY[0x24BEDA768];
    if (objc_msgSend(v5, "productionMode"))
      v32 = v28;
    else
      v32 = v29;
    CFDictionarySetValue(v13, v31, v32);
    CFDictionarySetValue(v13, (const void *)*MEMORY[0x24BEDA790], v28);
    v33 = (const void *)*MEMORY[0x24BEDA730];
    objc_msgSend(v5, "apNonce");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (v34)
    {
      objc_msgSend(v5, "apNonce");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      CFDictionarySetValue(v13, v33, v35);

    }
    else
    {
      CFDictionarySetValue(v13, v33, (const void *)*MEMORY[0x24BDBD430]);
    }

    v36 = (const void *)*MEMORY[0x24BEDA798];
    if (objc_msgSend(v5, "uidMode"))
      v37 = v28;
    else
      v37 = v29;
    CFDictionarySetValue(v13, v36, v37);
    CFDictionarySetValue(v13, (const void *)*MEMORY[0x24BEDA770], v28);
    if (AMAuthInstallApSetParameters())
    {
      if (MIBUOnceToken != -1)
        dispatch_once(&MIBUOnceToken, &__block_literal_global_94);
      if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR))
        +[MIBUPersonalizationManager _createBaseAMAIObjectForDevice:error:].cold.5();
      v67 = 0;
      v62 = CFSTR("Failed to set auth install ap img4 parameters");
      v47 = (id *)&v67;
      v63 = &v67;
    }
    else
    {
      v38 = AMAuthInstallApImg4ForceServerSigning();
      if (!(_DWORD)v38)
      {
        v39 = 0;
        v40 = 1;
        if (!a4)
          goto LABEL_37;
        goto LABEL_36;
      }
      v64 = v38;
      if (MIBUOnceToken != -1)
        dispatch_once(&MIBUOnceToken, &__block_literal_global_98);
      if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR))
        +[MIBUPersonalizationManager _createBaseAMAIObjectForDevice:error:].cold.4();
      v66 = 0;
      v62 = CFSTR("Failed server signing, status: %d");
      v65 = v64;
      v47 = (id *)&v66;
      v63 = &v66;
    }
    safeAssignError(v63, 100663296, 0, v62, v58, v59, v60, v61, v65);
    goto LABEL_72;
  }
  if (MIBUOnceToken != -1)
    dispatch_once(&MIBUOnceToken, &__block_literal_global_90);
  if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR))
    +[MIBUPersonalizationManager _createBaseAMAIObjectForDevice:error:].cold.3();
  v68 = 0;
  v47 = (id *)&v68;
  safeAssignError(&v68, 100663296, 0, CFSTR("Failed to allocate options dictionary"), v54, v55, v56, v57, v65);
  v40 = 1;
LABEL_73:
  v39 = *v47;
  if (a4)
LABEL_36:
    *a4 = objc_retainAutorelease(v39);
LABEL_37:
  AMSupportSafeRelease();
  AMSupportSafeRelease();
  if ((v40 & 1) == 0)
  {
    AMSupportSafeRelease();
    v9 = 0;
  }

  return v9;
}

void __67__MIBUPersonalizationManager__createBaseAMAIObjectForDevice_error___block_invoke()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v2)
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

void __67__MIBUPersonalizationManager__createBaseAMAIObjectForDevice_error___block_invoke_77()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v2)
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

void __67__MIBUPersonalizationManager__createBaseAMAIObjectForDevice_error___block_invoke_81()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v2)
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

void __67__MIBUPersonalizationManager__createBaseAMAIObjectForDevice_error___block_invoke_85()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v2)
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

void __67__MIBUPersonalizationManager__createBaseAMAIObjectForDevice_error___block_invoke_89()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v2)
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

void __67__MIBUPersonalizationManager__createBaseAMAIObjectForDevice_error___block_invoke_93()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v2)
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

void __67__MIBUPersonalizationManager__createBaseAMAIObjectForDevice_error___block_invoke_97()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v2)
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

+ (void)requestTatsuTicketForDevice:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_222C3F000, v0, v1, "%{public}@: Failed to create AMAI object", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

+ (void)requestTatsuTicketForDevice:error:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_222C3F000, v0, v1, "%{public}@: Fail Tatsu personalization, status: %d");
  OUTLINED_FUNCTION_4();
}

+ (void)requestTatsuTicketForDevice:error:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6(&dword_222C3F000, v0, v1, "%{public}@: Failed to parse payload from personalization response: %{public}@");
  OUTLINED_FUNCTION_4();
}

+ (void)requestTatsuTicketForDevice:error:.cold.4()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_222C3F000, v0, v1, "%{public}@: Failed to add measurement dict, status: %d");
  OUTLINED_FUNCTION_4();
}

+ (void)requestTatsuTicketForDevice:error:.cold.5()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_222C3F000, v0, v1, "%{public}@: Failed to enable AC SSO, status: %d");
  OUTLINED_FUNCTION_4();
}

+ (void)requestTatsuTicketForDevice:error:.cold.6()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_222C3F000, v0, v1, "%{public}@: Failed load SSOClient.framework; status: %d");
  OUTLINED_FUNCTION_4();
}

+ (void)requestTatsuTicketForDevice:error:.cold.7()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6(&dword_222C3F000, v0, v1, "%{public}@: Failed to load tatsu payload from file: %{public}@");
  OUTLINED_FUNCTION_4();
}

+ (void)_createBaseAMAIObjectForDevice:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_222C3F000, v0, v1, "%{public}@: Failed to create AMAuthInstall object", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

+ (void)_createBaseAMAIObjectForDevice:(uint64_t)a1 error:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  __int16 v4;
  const __CFString *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 138543618;
  v3 = a1;
  v4 = 2114;
  v5 = CFSTR("https://gs.apple.com:443");
  _os_log_error_impl(&dword_222C3F000, a2, OS_LOG_TYPE_ERROR, "%{public}@: Failed to create server URL object for %{public}@", (uint8_t *)&v2, 0x16u);
  OUTLINED_FUNCTION_4();
}

+ (void)_createBaseAMAIObjectForDevice:error:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_222C3F000, v0, v1, "%{public}@: Failed to allocate options dictionary", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

+ (void)_createBaseAMAIObjectForDevice:error:.cold.4()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_222C3F000, v0, v1, "%{public}@: Failed server signing, status: %d");
  OUTLINED_FUNCTION_4();
}

+ (void)_createBaseAMAIObjectForDevice:error:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_222C3F000, v0, v1, "%{public}@: Failed to set auth install ap img4 parameters", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

+ (void)_createBaseAMAIObjectForDevice:error:.cold.6()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6(&dword_222C3F000, v0, v1, "%{public}@: Failed to set signing server URL to %{public}@");
  OUTLINED_FUNCTION_4();
}

@end
