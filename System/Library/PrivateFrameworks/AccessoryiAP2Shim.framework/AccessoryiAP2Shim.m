void init_logging_signposts()
{
  init_logging_signpost_modules((uint64_t)&_gLogSignpostObjects, 4, (uint64_t)_kLoggingSignpostModuleEntries);
}

void init_logging_signpost_modules(uint64_t a1, char a2, uint64_t a3)
{
  _QWORD block[6];
  char v4;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 0x40000000;
  block[2] = __init_logging_signpost_modules_block_invoke;
  block[3] = &__block_descriptor_tmp;
  v4 = a2;
  block[4] = a3;
  block[5] = a1;
  if (init_logging_signpost_modules_onceToken != -1)
    dispatch_once(&init_logging_signpost_modules_onceToken, block);
}

void __init_logging_signpost_modules_block_invoke(uint64_t a1)
{
  char *__ptr32 *v2;
  uint64_t v3;
  unint64_t v4;
  int v5;
  NSObject *v6;
  uint64_t v7;
  const char *v8;
  const char *v9;
  os_log_t v10;
  unint64_t v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  const char *v15;
  uint8_t v16[4];
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v2 = &off_217DDA000;
  if (*(_BYTE *)(a1 + 48))
  {
    v3 = 0;
    v4 = 0;
    v5 = 0;
    v6 = MEMORY[0x24BDACB70];
    do
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = *(const char **)(v7 + v3);
      if (!v8)
      {
        v8 = "<Undefined>";
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v13) = v4;
          _os_log_error_impl(&dword_217DCB000, v6, OS_LOG_TYPE_ERROR, "Subsystem missing for logging module %d!\n(Check LoggingSignpostModuleEntry_t table)", buf, 8u);
          v7 = *(_QWORD *)(a1 + 32);
          v8 = "<Undefined>";
        }
      }
      v9 = *(const char **)(v7 + v3 + 8);
      if (!v9)
      {
        v9 = "<Undefined>";
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          __init_logging_signpost_modules_block_invoke_cold_1(v16, v4, &v17);
          v9 = "<Undefined>";
        }
      }
      v10 = os_log_create(v8, v9);
      *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8 * v4) = v10;
      if (v10)
      {
        ++v5;
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315394;
          v13 = v8;
          v14 = 2080;
          v15 = v9;
          _os_log_debug_impl(&dword_217DCB000, v6, OS_LOG_TYPE_DEBUG, "Created log object %s: %s", buf, 0x16u);
        }
      }
      else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v13 = v8;
        v14 = 2080;
        v15 = v9;
        _os_log_error_impl(&dword_217DCB000, v6, OS_LOG_TYPE_ERROR, "Failed to create os_log_t object %s: %s!", buf, 0x16u);
      }
      ++v4;
      v11 = *(unsigned __int8 *)(a1 + 48);
      v3 += 16;
    }
    while (v4 < v11);
    v2 = &off_217DDA000;
  }
  else
  {
    LODWORD(v11) = 0;
    v5 = 0;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = *((_QWORD *)v2 + 137);
    LODWORD(v13) = v5;
    _os_log_impl(&dword_217DCB000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Created %d log object(s)!", buf, 8u);
    LODWORD(v11) = *(unsigned __int8 *)(a1 + 48);
  }
  gLogSignpostObjects = *(_QWORD *)(a1 + 40);
  gNumLogSignpostObjects = v11;
}

uint64_t acc_policies_shouldHideAccessoryWithModelNumber(uint64_t a1)
{
  void *v2;
  int v3;
  uint64_t v4;
  const char *v5;
  const char *v6;
  int v8;
  const char *v9;
  __int16 v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  +[ACCUserDefaults sharedDefaults](ACCUserDefaults, "sharedDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("ShowHiddenAccessories"));

  if ((v3 & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    if (acc_policies_shouldHideAccessoryWithModelNumber_onceToken != -1)
      dispatch_once(&acc_policies_shouldHideAccessoryWithModelNumber_onceToken, &__block_literal_global);
    v4 = objc_msgSend((id)acc_policies_shouldHideAccessoryWithModelNumber_hiddenModelNumbers, "containsObject:", a1);
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    v5 = "NO";
    if ((_DWORD)v4)
      v6 = "YES";
    else
      v6 = "NO";
    if (v3)
      v5 = "YES";
    v8 = 136315394;
    v9 = v6;
    v10 = 2080;
    v11 = v5;
    _os_log_impl(&dword_217DCB000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "shouldHideAccessory: %s, showHiddenAccessories: %s", (uint8_t *)&v8, 0x16u);
  }
  return v4;
}

void __acc_policies_shouldHideAccessoryWithModelNumber_block_invoke()
{
  void *v0;

  v0 = (void *)acc_policies_shouldHideAccessoryWithModelNumber_hiddenModelNumbers;
  acc_policies_shouldHideAccessoryWithModelNumber_hiddenModelNumbers = (uint64_t)&unk_24D909410;

}

BOOL acc_policies_endpointRequiresUserAuthorization(uint64_t a1)
{
  return !a1 || !*(_QWORD *)a1 || *(_DWORD *)(*(_QWORD *)a1 + 8) != 2;
}

uint64_t acc_policies_shouldOverrideNameOnAccessoryWithModelNumber(uint64_t a1)
{
  uint64_t v2;
  const char *v3;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  if (acc_policies_shouldOverrideNameOnAccessoryWithModelNumber_onceToken != -1)
    dispatch_once(&acc_policies_shouldOverrideNameOnAccessoryWithModelNumber_onceToken, &__block_literal_global_50);
  v2 = objc_msgSend((id)acc_policies_shouldOverrideNameOnAccessoryWithModelNumber_hiddenModelNumbers, "containsObject:", a1);
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    v3 = "NO";
    if ((_DWORD)v2)
      v3 = "YES";
    v5 = 136315138;
    v6 = v3;
    _os_log_impl(&dword_217DCB000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "shouldOverrideName: %s", (uint8_t *)&v5, 0xCu);
  }
  return v2;
}

void __acc_policies_shouldOverrideNameOnAccessoryWithModelNumber_block_invoke()
{
  void *v0;

  v0 = (void *)acc_policies_shouldOverrideNameOnAccessoryWithModelNumber_hiddenModelNumbers;
  acc_policies_shouldOverrideNameOnAccessoryWithModelNumber_hiddenModelNumbers = (uint64_t)&unk_24D909428;

}

BOOL acc_policies_isTransportSupervised(unsigned int a1, int a2)
{
  _BOOL4 v2;

  v2 = ((1 << a1) & 0x1C3) != 0 && a2 == 1;
  return a1 <= 8 && v2;
}

uint64_t acc_policies_shouldResetLightningBusWhenTransportIsNoLongerRestricted(unsigned int a1, int a2)
{
  if ((a2 - 3) < 0xFFFFFFFE)
    return (a1 < 9) & (0x1C3u >> a1);
  else
    return 0;
}

BOOL acc_policies_endpointRequiresChargingCurrentLimit(uint64_t a1, int a2, int a3, unsigned int a4, unsigned int a5, _WORD *a6)
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned __int16 v13;
  int v14;
  int v15;
  int v16;
  int v17;
  unsigned int v18;
  int v19;
  unsigned int v20;
  _BOOL8 v21;
  CFTypeRef *v22;
  const void *v23;
  const void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  void *v30;
  void *v31;
  _BOOL4 v32;
  void *v33;
  void *v34;
  _BOOL4 v35;
  void *v36;
  void *v37;
  _BOOL4 v38;
  void *v39;
  BOOL v40;
  _BOOL4 v41;
  int v42;
  uint64_t v44;
  int v45;
  id obj;
  void *v53;
  void *v54;
  void *v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  uint8_t v60[128];
  uint8_t buf[4];
  int v62;
  __int16 v63;
  int v64;
  __int16 v65;
  unsigned int v66;
  __int16 v67;
  unsigned int v68;
  __int16 v69;
  unsigned int v70;
  __int16 v71;
  int v72;
  __int16 v73;
  int v74;
  _QWORD v75[3];
  _QWORD v76[3];
  _QWORD v77[3];
  _QWORD v78[3];
  _QWORD v79[3];
  _QWORD v80[3];
  _QWORD v81[3];
  _QWORD v82[3];
  _QWORD v83[3];
  _QWORD v84[3];
  _QWORD v85[3];
  _QWORD v86[3];
  _QWORD v87[9];

  v87[6] = *MEMORY[0x24BDAC8D0];
  v85[0] = CFSTR("nameMatch");
  v85[1] = CFSTR("modelContain");
  v86[0] = CFSTR("IntelliLink");
  v86[1] = CFSTR("1.0");
  v85[2] = CFSTR("overrideCurrentLimit");
  v86[2] = &unk_24D909440;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v86, v85, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v87[0] = v6;
  v83[0] = CFSTR("nameMatch");
  v83[1] = CFSTR("modelContain");
  v84[0] = CFSTR("MyLink");
  v84[1] = CFSTR("1.0");
  v83[2] = CFSTR("overrideCurrentLimit");
  v84[2] = &unk_24D909440;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v84, v83, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v87[1] = v7;
  v81[0] = CFSTR("nameMatch");
  v81[1] = CFSTR("manufacturerMatch");
  v82[0] = CFSTR("iPL24Z");
  v82[1] = CFSTR("SDI Technologies");
  v81[2] = CFSTR("overrideCurrentLimit");
  v82[2] = &unk_24D909440;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v82, v81, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v87[2] = v8;
  v79[0] = CFSTR("modelMatch");
  v79[1] = CFSTR("manufacturerMatch");
  v80[0] = CFSTR("MIB2");
  v80[1] = CFSTR("HARMAN");
  v79[2] = CFSTR("overrideCurrentLimit");
  v80[2] = &unk_24D909458;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v80, v79, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v87[3] = v9;
  v77[0] = CFSTR("modelMatch");
  v77[1] = CFSTR("manufacturerMatch");
  v78[0] = CFSTR("Range Rover Velar");
  v78[1] = CFSTR("Land Rover");
  v77[2] = CFSTR("overrideCurrentLimit");
  v78[2] = &unk_24D909440;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v78, v77, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v87[4] = v10;
  v75[0] = CFSTR("modelMatch");
  v75[1] = CFSTR("manufacturerMatch");
  v76[0] = CFSTR("Jaguar I-PACE");
  v76[1] = CFSTR("Jaguar");
  v75[2] = CFSTR("overrideCurrentLimit");
  v76[2] = &unk_24D909440;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v76, v75, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v87[5] = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v87, 6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = acc_userDefaultsIapd_copyIntegerForKey((uint64_t)CFSTR("ChargingPowerOverride"));
  v14 = acc_userDefaultsIapd_copyIntegerForKey((uint64_t)CFSTR("ChargingPowerBehavior"));
  v15 = acc_userDefaultsIapd_copyIntegerForKey((uint64_t)CFSTR("ChargingPowerBehavior"));
  if (v15 <= 0)
    v16 = a5;
  else
    v16 = v15;
  if ((v14 - 3) < 6)
  {
    v17 = 10 * v14 - 5;
    v18 = a4;
LABEL_7:
    v19 = 1;
    goto LABEL_8;
  }
  v17 = 45;
  v18 = a4;
  if (v14 != 1)
    goto LABEL_7;
  v19 = 0;
LABEL_8:
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67110656;
    v62 = a2;
    v63 = 1024;
    v64 = a3;
    v65 = 1024;
    v66 = v19;
    v67 = 1024;
    v68 = v13;
    v69 = 1024;
    v70 = v18;
    v71 = 1024;
    v72 = v14;
    v73 = 1024;
    v74 = v17;
    _os_log_impl(&dword_217DCB000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "RequiresChargingCurrentLimit: isApple=%d deviceType=%d checkChargingCurrentLimit=%d chargingCurrentLimit=%d inLimit=%d behavior=%d batteryThreshold=%d", buf, 0x2Cu);
  }
  if (!v19)
    goto LABEL_66;
  v55 = 0;
  v20 = v13;
  v21 = v13 < v18 && v13 != 0;
  if (a1 && !v21)
  {
    v22 = *(CFTypeRef **)(a1 + 64);
    if (v22)
    {
      if (*v22)
        v55 = (void *)CFRetain(*v22);
      else
        v55 = 0;
      v23 = *(const void **)(*(_QWORD *)(a1 + 64) + 16);
      if (v23)
        v54 = (void *)CFRetain(v23);
      else
        v54 = 0;
      v24 = *(const void **)(*(_QWORD *)(a1 + 64) + 8);
      if (v24)
        v53 = (void *)CFRetain(v24);
      else
        v53 = 0;
      if (v55 && v54)
      {
        v45 = v17;
        v58 = 0u;
        v59 = 0u;
        v56 = 0u;
        v57 = 0u;
        obj = v12;
        v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v60, 16);
        if (v25)
        {
          v26 = v25;
          LODWORD(v44) = v13;
          HIDWORD(v44) = v16;
          v27 = *(_QWORD *)v57;
          while (2)
          {
            for (i = 0; i != v26; ++i)
            {
              if (*(_QWORD *)v57 != v27)
                objc_enumerationMutation(obj);
              v29 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * i);
              objc_msgSend(v29, "objectForKey:", CFSTR("nameMatch"), v44);
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "objectForKey:", CFSTR("nameContain"));
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              v32 = _matchOrContainString(v55, v30, v31);

              objc_msgSend(v29, "objectForKey:", CFSTR("modelMatch"));
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "objectForKey:", CFSTR("modelContain"));
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              v35 = _matchOrContainString(v54, v33, v34);

              objc_msgSend(v29, "objectForKey:", CFSTR("manufacturerMatch"));
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "objectForKey:", CFSTR("manufacturerContain"));
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              v38 = _matchOrContainString(v53, v36, v37);

              if (v32 && v35 && v38)
              {
                objc_msgSend(v29, "objectForKey:", CFSTR("overrideCurrentLimit"));
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                v20 = (unsigned __int16)objc_msgSend(v39, "intValue");

                v18 = a4;
                v16 = HIDWORD(v44);
                goto LABEL_40;
              }
            }
            v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v60, 16);
            if (v26)
              continue;
            break;
          }
          v18 = a4;
          v20 = v44;
          v16 = HIDWORD(v44);
        }
LABEL_40:

        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 67110400;
          v62 = a2;
          v63 = 1024;
          v64 = a3;
          v65 = 1024;
          v66 = v20;
          v67 = 1024;
          v68 = v18;
          v69 = 1024;
          v70 = v16;
          v71 = 1024;
          v72 = v45;
          _os_log_debug_impl(&dword_217DCB000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "RequiresChargingCurrentLimit: isApple=%d deviceType=%d chargingCurrentLimit=%d inLimit=%d battery=%d threshold=%d", buf, 0x26u);
        }
        if (a3 != 3 && v16 >= v45 && (a2 & 1) == 0 && (v18 > 0x5DC || v20 >= 0x5DD) && v20 - 1501 < 0xFFFFFA24)
          v20 = 1500;
        if (v20)
          v40 = v20 >= v18;
        else
          v40 = 1;
        v21 = !v40;
        goto LABEL_55;
      }
LABEL_67:
      v21 = 0;
      v41 = a6 != 0;
      goto LABEL_58;
    }
LABEL_66:
    v54 = 0;
    v55 = 0;
    v53 = 0;
    goto LABEL_67;
  }
  v53 = 0;
  v54 = 0;
LABEL_55:
  v41 = a6 != 0;
  if (a6 && v21)
  {
    *a6 = v20;
    v41 = 1;
    v21 = 1;
  }
LABEL_58:
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    if (v41)
      v42 = (unsigned __int16)*a6;
    else
      v42 = -1;
    *(_DWORD *)buf = 67110656;
    v62 = a2;
    v63 = 1024;
    v64 = a3;
    v65 = 1024;
    v66 = a5;
    v67 = 1024;
    v68 = v16;
    v69 = 1024;
    v70 = v18;
    v71 = 1024;
    v72 = v42;
    v73 = 1024;
    v74 = v21;
    _os_log_impl(&dword_217DCB000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "RequiresChargingCurrentLimit: isApple=%d, deviceType=%d, batt=%d(%d), %d->%d, return %d", buf, 0x2Cu);
  }

  return v21;
}

BOOL _matchOrContainString(void *a1, void *a2, void *a3)
{
  id v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  _BOOL8 v9;
  uint64_t v10;

  v5 = a1;
  v6 = a2;
  v7 = a3;
  v8 = (void *)v7;
  v9 = (v6 | v7) == 0;
  if (v5)
  {
    if (v6)
    {
      v10 = objc_msgSend(v5, "isEqualToString:", v6);
LABEL_6:
      v9 = v10;
      goto LABEL_7;
    }
    if (v7)
    {
      v10 = objc_msgSend(v5, "containsString:", v7);
      goto LABEL_6;
    }
  }
LABEL_7:

  return v9;
}

BOOL acc_policies_shouldFailAuthOnOOBPairingFailure(_BOOL8 result)
{
  if (result)
    return *(_DWORD *)(result + 24) == 9;
  return result;
}

uint64_t acc_policies_allowACCAuthProtocolOnAllTransport()
{
  void *v0;
  uint64_t v1;

  +[ACCUserDefaults sharedDefaults](ACCUserDefaults, "sharedDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "BOOLForKey:", CFSTR("AllowACCAuthProtocolOnAllTransport"));

  return v1;
}

uint64_t acc_policies_allowACCAuthProtocolOnTransport(int a1)
{
  void *v2;
  char v3;
  void *v4;
  int v5;
  void *v6;
  unsigned int v7;
  int v9;

  +[ACCUserDefaults sharedDefaults](ACCUserDefaults, "sharedDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("EnableACCAuthProtocolOnNFC"));

  +[ACCUserDefaults sharedDefaults](ACCUserDefaults, "sharedDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLForKey:", CFSTR("DisableACCAuthProtocolOnInductive"));

  +[ACCUserDefaults sharedDefaults](ACCUserDefaults, "sharedDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLForKey:", CFSTR("AllowACCAuthProtocolOnAllTransport"));

  if (a1 == 13 && (v3 & 1) != 0)
    return 1;
  v9 = v5 ^ 1;
  if (a1 != 12)
    v9 = 0;
  return v9 | v7;
}

uint64_t acc_policies_productTypeNeedsPreArmDeviceIdentity(const __CFString *a1)
{
  CFTypeID v2;
  BOOL v3;

  if (a1)
  {
    v2 = CFGetTypeID(a1);
    if (v2 == CFStringGetTypeID())
    {
      v3 = CFStringCompare(a1, CFSTR("iPhone13,1"), 0) == kCFCompareEqualTo
        || CFStringCompare(a1, CFSTR("iPhone13,2"), 0) == kCFCompareEqualTo
        || CFStringCompare(a1, CFSTR("iPhone13,3"), 0) == kCFCompareEqualTo
        || CFStringCompare(a1, CFSTR("iPhone13,4"), 0) == kCFCompareEqualTo;
      acc_policies_productTypeNeedsPreArmDeviceIdentity_modelNeedsPreArm = v3;
    }
  }
  return acc_policies_productTypeNeedsPreArmDeviceIdentity_modelNeedsPreArm;
}

uint64_t acc_policies_deviceNeedsPreArmDeviceIdentity()
{
  void *v0;
  void *v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  _BOOL4 v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  int v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  if (acc_policies_deviceNeedsPreArmDeviceIdentity_alreadyPreArmed)
  {
    v18 = 0;
    v16 = 0;
  }
  else
  {
    +[ACCUserDefaults sharedDefaults](ACCUserDefaults, "sharedDefaults");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "stringForKey:", CFSTR("DeviceIdentityPreArmDateOverride"));
    v1 = (void *)objc_claimAutoreleasedReturnValue();

    if (v1)
    {
      v2 = v1;
      objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v21) = 0;
        _os_log_impl(&dword_217DCB000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "acc_policies_deviceNeedsPreArmDeviceIdentity: _parseDate", (uint8_t *)&v21, 2u);
      }
      objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "stringByTrimmingCharactersInSet:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD14A8], "punctuationCharacterSet");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "componentsSeparatedByCharactersInSet:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = objc_msgSend(v7, "count");
      v9 = v8 > 2;
      if (v8 < 3)
      {
        v14 = 0;
      }
      else
      {
        v10 = objc_alloc_init(MEMORY[0x24BDBCE68]);
        objc_msgSend(v7, "objectAtIndexedSubscript:", 2);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setDay:", objc_msgSend(v11, "integerValue"));

        objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setMonth:", objc_msgSend(v12, "integerValue"));

        objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setYear:", objc_msgSend(v13, "integerValue"));

        objc_msgSend(v3, "dateFromComponents:", v10);
        v14 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
        {
          v21 = 138412290;
          v22 = v14;
          _os_log_impl(&dword_217DCB000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "acc_policies_deviceNeedsPreArmDeviceIdentity: _parseDate: %@", (uint8_t *)&v21, 0xCu);
        }

      }
    }
    else
    {
      v14 = 0;
      v9 = 0;
    }
    v15 = v14;
    v16 = v15;
    if (v9 && v15)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v21) = 0;
        _os_log_impl(&dword_217DCB000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "acc_policies_deviceNeedsPreArmDeviceIdentity: override", (uint8_t *)&v21, 2u);
      }
      objc_storeStrong((id *)&acc_policies_deviceNeedsPreArmDeviceIdentity_preArmDate, v14);
      +[ACCUserDefaults sharedDefaults](ACCUserDefaults, "sharedDefaults");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setObject:forKey:", acc_policies_deviceNeedsPreArmDeviceIdentity_preArmDate, CFSTR("PreArmDeviceIdentityDate"));

    }
    v18 = acc_policies_deviceNeedsPreArmDeviceIdentity_preArmDate;
    if (acc_policies_deviceNeedsPreArmDeviceIdentity_preArmDate)
      goto LABEL_19;
    if (acc_policies_deviceNeedsPreArmDeviceIdentity_onceToken != -1)
      dispatch_once(&acc_policies_deviceNeedsPreArmDeviceIdentity_onceToken, &__block_literal_global_105);
    v18 = acc_policies_deviceNeedsPreArmDeviceIdentity_preArmDate;
    if (acc_policies_deviceNeedsPreArmDeviceIdentity_preArmDate)
    {
LABEL_19:
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend((id)v18, "compare:", v19) == -1;

    }
  }

  return v18;
}

void __acc_policies_deviceNeedsPreArmDeviceIdentity_block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  double v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;

  +[ACCUserDefaults sharedDefaults](ACCUserDefaults, "sharedDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  acc_policies_deviceNeedsPreArmDeviceIdentity_alreadyPreArmed = objc_msgSend(v0, "BOOLForKey:", CFSTR("DidPreArmDeviceIdentity"));

  if (!acc_policies_deviceNeedsPreArmDeviceIdentity_alreadyPreArmed)
  {
    +[ACCUserDefaults sharedDefaults](ACCUserDefaults, "sharedDefaults");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "objectForKey:", CFSTR("PreArmDeviceIdentityDate"));
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)acc_policies_deviceNeedsPreArmDeviceIdentity_preArmDate;
    acc_policies_deviceNeedsPreArmDeviceIdentity_preArmDate = v2;

    if (!acc_policies_deviceNeedsPreArmDeviceIdentity_preArmDate)
    {
      objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
      v13 = (id)objc_claimAutoreleasedReturnValue();
      v4 = objc_alloc_init(MEMORY[0x24BDBCE68]);
      objc_msgSend(v4, "setDay:", 1);
      objc_msgSend(v4, "setMonth:", 3);
      objc_msgSend(v4, "setYear:", 2021);
      objc_msgSend(v13, "dateFromComponents:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_alloc_init(MEMORY[0x24BDBCE68]);
      objc_msgSend(v6, "setDay:", 1);
      objc_msgSend(v6, "setMonth:", 9);
      objc_msgSend(v6, "setYear:", 2021);
      objc_msgSend(v13, "dateFromComponents:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1508]), "initWithStartDate:endDate:", v5, v7);
      objc_msgSend(v8, "duration");
      objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeInterval:sinceDate:", v5, (double)(int)(arc4random() % (int)v9));
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = (void *)acc_policies_deviceNeedsPreArmDeviceIdentity_preArmDate;
      acc_policies_deviceNeedsPreArmDeviceIdentity_preArmDate = v10;

      +[ACCUserDefaults sharedDefaults](ACCUserDefaults, "sharedDefaults");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKey:", acc_policies_deviceNeedsPreArmDeviceIdentity_preArmDate, CFSTR("PreArmDeviceIdentityDate"));

    }
  }
}

void acc_policies_deviceDidPreArmDeviceIdentity()
{
  id v0;

  +[ACCUserDefaults sharedDefaults](ACCUserDefaults, "sharedDefaults");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setBool:forKey:", 1, CFSTR("DidPreArmDeviceIdentity"));

}

BOOL acc_policies_allowAudioProductCertsOnTransport(int a1)
{
  return (a1 & 0xFFFFFFFE) == 2;
}

uint64_t acc_policies_supportInductivePowerTX(int a1, unsigned int a2)
{
  unsigned int v2;

  if (a1 == 2)
    v2 = 1;
  else
    v2 = a2;
  if (a1 == 3)
    v2 = a2;
  if (a1 == 1)
    return 0;
  else
    return v2;
}

id _getApplicationStateMonitor()
{
  if (_getApplicationStateMonitor_onceToken != -1)
    dispatch_once(&_getApplicationStateMonitor_onceToken, &__block_literal_global_132);
  return (id)gAppStateMonitor;
}

BOOL __hasEntitlementForAuditToken(void *a1, _OWORD *a2)
{
  __CFString *v3;
  __int128 v4;
  __SecTask *v5;
  __SecTask *v6;
  const __CFBoolean *v7;
  const __CFBoolean *v8;
  CFTypeID v9;
  _BOOL8 v10;
  BOOL v11;
  id v12;
  NSObject *v13;
  id v14;
  CFErrorRef v15;
  NSObject *v16;
  NSObject *v17;
  id v18;
  CFErrorRef error;
  audit_token_t token;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v4 = a2[1];
  *(_OWORD *)token.val = *a2;
  *(_OWORD *)&token.val[4] = v4;
  v5 = SecTaskCreateWithAuditToken(0, &token);
  if (v5)
  {
    v6 = v5;
    error = 0;
    v7 = (const __CFBoolean *)SecTaskCopyValueForEntitlement(v5, v3, &error);
    if (v7)
    {
      v8 = v7;
      v9 = CFGetTypeID(v7);
      v10 = v9 == CFBooleanGetTypeID() && CFBooleanGetValue(v8) != 0;
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v13 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:].cold.1();
        v13 = MEMORY[0x24BDACB70];
        v14 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        token.val[0] = 138412546;
        *(_QWORD *)&token.val[1] = v3;
        LOWORD(token.val[3]) = 1024;
        *(unsigned int *)((char *)&token.val[3] + 2) = v10;
        _os_log_impl(&dword_217DCB000, v13, OS_LOG_TYPE_INFO, "[#ServerClient] has %@ entitlement:%d", (uint8_t *)&token, 0x12u);
      }

      CFRelease(v8);
      v15 = error;
      if (!error)
        goto LABEL_40;
      if (v10)
      {
        v10 = 1;
LABEL_39:
        CFRelease(v15);
        goto LABEL_40;
      }
    }
    else if (!error)
    {
      v10 = 0;
LABEL_40:
      CFRelease(v6);
      goto LABEL_41;
    }
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v16 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:].cold.1();
      v16 = MEMORY[0x24BDACB70];
      v18 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      token.val[0] = 138412546;
      *(_QWORD *)&token.val[1] = v3;
      LOWORD(token.val[3]) = 2112;
      *(_QWORD *)((char *)&token.val[3] + 2) = error;
      _os_log_impl(&dword_217DCB000, v16, OS_LOG_TYPE_DEFAULT, "[#ServerClient] Unable to get entitlement '%@', error: %@", (uint8_t *)&token, 0x16u);
    }

    v10 = 0;
    v15 = error;
    goto LABEL_39;
  }
  if (gLogObjects)
    v11 = gNumLogObjects < 1;
  else
    v11 = 1;
  if (v11)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:].cold.1();
    v17 = MEMORY[0x24BDACB70];
    v12 = MEMORY[0x24BDACB70];
  }
  else
  {
    v17 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(token.val[0]) = 0;
    _os_log_impl(&dword_217DCB000, v17, OS_LOG_TYPE_DEFAULT, "[#ServerClient] Unable to create security task from audit token.", (uint8_t *)&token, 2u);
  }

  v10 = 0;
LABEL_41:

  return v10;
}

void sub_217DCFB14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void ___getApplicationStateMonitor_block_invoke()
{
  uint64_t v0;
  void *v1;

  if (!gAppStateMonitor)
  {
    v0 = objc_msgSend(objc_alloc(MEMORY[0x24BE0B660]), "initWithBundleIDs:states:", 0, 0);
    v1 = (void *)gAppStateMonitor;
    gAppStateMonitor = v0;

  }
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

uint64_t acc_userDefaults_BOOLForKey(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  +[ACCUserDefaults sharedDefaults](ACCUserDefaults, "sharedDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", a1);

  return v3;
}

uint64_t acc_userDefaults_copyStringForKey(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  +[ACCUserDefaults sharedDefaults](ACCUserDefaults, "sharedDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringForKey:", a1);
  v3 = objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t acc_userDefaults_copyArrayForKey(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  +[ACCUserDefaults sharedDefaults](ACCUserDefaults, "sharedDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayForKey:", a1);
  v3 = objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t acc_userDefaults_copyDictionaryForKey(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  +[ACCUserDefaults sharedDefaults](ACCUserDefaults, "sharedDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictionaryForKey:", a1);
  v3 = objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t acc_userDefaults_copyIntegerForKey(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  +[ACCUserDefaults sharedDefaults](ACCUserDefaults, "sharedDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerForKey:", a1);

  return v3;
}

double acc_userDefaults_copyDoubleForKey(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;

  +[ACCUserDefaults sharedDefaults](ACCUserDefaults, "sharedDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleForKey:", a1);
  v4 = v3;

  return v4;
}

void acc_userDefaults_setArrayForKey(uint64_t a1, uint64_t a2)
{
  id v4;

  +[ACCUserDefaults sharedDefaults](ACCUserDefaults, "sharedDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", a2, a1);

}

void acc_userDefaults_setIntegerForKey(uint64_t a1, uint64_t a2)
{
  id v4;

  +[ACCUserDefaults sharedDefaults](ACCUserDefaults, "sharedDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInteger:forKey:", a2, a1);

}

void acc_userDefaults_setDoubleForKey(uint64_t a1, double a2)
{
  id v4;

  +[ACCUserDefaults sharedDefaults](ACCUserDefaults, "sharedDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDouble:forKey:", a1, a2);

}

uint64_t acc_userDefaultsIapd_BOOLForKey(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  +[ACCUserDefaults sharedDefaultsIapd](ACCUserDefaults, "sharedDefaultsIapd");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", a1);

  return v3;
}

uint64_t acc_userDefaultsIapd_copyStringForKey(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  +[ACCUserDefaults sharedDefaultsIapd](ACCUserDefaults, "sharedDefaultsIapd");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringForKey:", a1);
  v3 = objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t acc_userDefaultsIapd_copyArrayForKey(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  +[ACCUserDefaults sharedDefaultsIapd](ACCUserDefaults, "sharedDefaultsIapd");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayForKey:", a1);
  v3 = objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t acc_userDefaultsIapd_copyDictionaryForKey(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  +[ACCUserDefaults sharedDefaultsIapd](ACCUserDefaults, "sharedDefaultsIapd");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictionaryForKey:", a1);
  v3 = objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t acc_userDefaultsIapd_copyIntegerForKey(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  +[ACCUserDefaults sharedDefaultsIapd](ACCUserDefaults, "sharedDefaultsIapd");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerForKey:", a1);

  return v3;
}

double acc_userDefaultsIapd_copyDoubleForKey(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;

  +[ACCUserDefaults sharedDefaultsIapd](ACCUserDefaults, "sharedDefaultsIapd");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleForKey:", a1);
  v4 = v3;

  return v4;
}

uint64_t acc_userDefaultsLogging_BOOLForKey(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  +[ACCUserDefaults sharedDefaultsLogging](ACCUserDefaults, "sharedDefaultsLogging");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", a1);

  return v3;
}

unint64_t systemInfo_getCurrentUnixTime()
{
  void *v0;
  double v1;
  double v2;
  unint64_t v3;

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "timeIntervalSince1970");
  v2 = v1;

  v3 = vcvtad_u64_f64(v2);
  if (v2 <= 0.0)
    return 0;
  else
    return v3;
}

unint64_t systemInfo_getCurrentUnixTimeMS()
{
  void *v0;
  double v1;
  double v2;
  unint64_t v3;

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "timeIntervalSince1970");
  v2 = v1;

  v3 = vcvtad_u64_f64(v2 * 1000.0);
  if (v2 <= 0.0)
    return 0;
  else
    return v3;
}

uint64_t systemInfo_isInternalBuild()
{
  if (systemInfo_isInternalBuild_onceToken != -1)
    dispatch_once(&systemInfo_isInternalBuild_onceToken, &__block_literal_global_3);
  return systemInfo_isInternalBuild_internalBuild;
}

uint64_t __systemInfo_isInternalBuild_block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  systemInfo_isInternalBuild_internalBuild = result;
  return result;
}

uint64_t systemInfo_isDeveloperBuild()
{
  if (systemInfo_isDeveloperBuild_onceToken != -1)
    dispatch_once(&systemInfo_isDeveloperBuild_onceToken, &__block_literal_global_2);
  return systemInfo_isDeveloperBuild_developerBuild;
}

void __systemInfo_isDeveloperBuild_block_invoke()
{
  const void *v0;
  const void *v1;

  v0 = (const void *)MGCopyAnswer();
  if (v0)
  {
    v1 = v0;
    systemInfo_isDeveloperBuild_developerBuild = CFEqual(v0, CFSTR("Beta")) != 0;
    CFRelease(v1);
  }
  else
  {
    systemInfo_isDeveloperBuild_developerBuild = 0;
  }
}

uint64_t systemInfo_systemSupportsPearl()
{
  if (systemInfo_systemSupportsPearl_onceToken != -1)
    dispatch_once(&systemInfo_systemSupportsPearl_onceToken, &__block_literal_global_7);
  return systemInfo_systemSupportsPearl_supportsPearl;
}

uint64_t __systemInfo_systemSupportsPearl_block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  systemInfo_systemSupportsPearl_supportsPearl = result;
  return result;
}

uint64_t systemInfo_systemSupportsWAPI()
{
  if (systemInfo_systemSupportsWAPI_onceToken != -1)
    dispatch_once(&systemInfo_systemSupportsWAPI_onceToken, &__block_literal_global_10);
  return systemInfo_systemSupportsWAPI_supportsWAPI;
}

uint64_t __systemInfo_systemSupportsWAPI_block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  systemInfo_systemSupportsWAPI_supportsWAPI = result;
  return result;
}

uint64_t systemInfo_copyDeviceClass()
{
  return MGCopyAnswer();
}

uint64_t systemInfo_isHomePod()
{
  void *v0;
  uint64_t v1;

  v0 = (void *)MGCopyAnswer();
  v1 = objc_msgSend(v0, "isEqualToString:", CFSTR("AudioAccessory"));

  return v1;
}

uint64_t systemInfo_copyRegionCode()
{
  CFTypeID v0;
  uint64_t result;

  if (systemInfo_copyRegionCode_onceToken != -1)
    dispatch_once(&systemInfo_copyRegionCode_onceToken, &__block_literal_global_15);
  if (systemInfo_copyRegionCode_regionCode)
  {
    v0 = CFGetTypeID((CFTypeRef)systemInfo_copyRegionCode_regionCode);
    if (v0 == CFStringGetTypeID())
      return systemInfo_copyRegionCode_regionCode;
  }
  result = 0;
  systemInfo_copyRegionCode_regionCode = 0;
  return result;
}

uint64_t __systemInfo_copyRegionCode_block_invoke()
{
  uint64_t result;

  result = MGCopyAnswer();
  systemInfo_copyRegionCode_regionCode = result;
  return result;
}

const void *systemInfo_copyProductType()
{
  const void *result;
  const void *v1;
  CFTypeID v2;

  result = (const void *)MGCopyAnswer();
  if (result)
  {
    v1 = result;
    v2 = CFGetTypeID(result);
    if (v2 == CFStringGetTypeID())
      return v1;
    else
      return 0;
  }
  return result;
}

const void *systemInfo_copyProductVersion()
{
  const void *result;
  const void *v1;
  CFTypeID v2;

  result = (const void *)MGCopyAnswer();
  if (result)
  {
    v1 = result;
    v2 = CFGetTypeID(result);
    if (v2 == CFStringGetTypeID())
      return v1;
    else
      return 0;
  }
  return result;
}

id logObjectForModule()
{
  BOOL v0;
  _BOOL8 v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;

  if (gLogObjects)
    v0 = gNumLogObjects < 1;
  else
    v0 = 1;
  if (v0)
  {
    v1 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v1)
      logObjectForModule_cold_1(v1, v2, v3, v4, v5, v6, v7, v8);
    v10 = (id)MEMORY[0x24BDACB70];
    v9 = MEMORY[0x24BDACB70];
  }
  else
  {
    v10 = *(id *)gLogObjects;
  }
  return v10;
}

void sub_217DD1B1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
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

void sub_217DD3D38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void ___xpc_iap2d_handle_incoming_request_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  const char *v5;
  NSObject *v6;
  id v7;
  const char *string;
  id v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  xpc_object_t reply;
  uint64_t uint64;
  NSObject *v15;
  xpc_object_t v16;
  BOOL v17;
  int v18;
  NSObject *v19;
  xpc_object_t v20;
  void *v21;
  uint64_t v22;
  const char *v23;
  void *v24;
  NSObject *v25;
  id v26;
  void *v27;
  NSObject *v28;
  NSObject *v29;
  id v30;
  id v31;
  NSObject *v32;
  NSObject *v33;
  id v34;
  uint64_t v35;
  const void *data;
  _BOOL4 v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  xpc_object_t v42;
  id v43;
  id v44;
  NSObject *v45;
  NSObject *v46;
  id v47;
  uint64_t v48;
  void *v49;
  NSObject *v50;
  id v51;
  void *v52;
  id v53;
  id v54;
  const void *v55;
  size_t v56;
  id v57;
  _BOOL8 v58;
  __int128 v59;
  NSObject *v60;
  id v61;
  void *v62;
  uint64_t v63;
  unsigned int v64;
  NSObject *v65;
  void *v66;
  id v67;
  NSObject *v68;
  void *v69;
  void *v70;
  uint64_t v71;
  id v72;
  _QWORD v73[4];
  NSObject *v74;
  uint64_t v75;
  size_t length;
  _BYTE v77[32];
  uint8_t buf[16];
  __int128 v79;
  uint64_t v80;

  v80 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (MEMORY[0x219A176E4]() != MEMORY[0x24BDACFA0])
  {
    if (MEMORY[0x219A176E4](v3) == MEMORY[0x24BDACFB8])
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v4 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:].cold.1();
        v4 = MEMORY[0x24BDACB70];
        v7 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        string = xpc_dictionary_get_string(v3, (const char *)*MEMORY[0x24BDACF40]);
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)&buf[4] = string;
        _os_log_impl(&dword_217DCB000, v4, OS_LOG_TYPE_INFO, "[#Server] _xpc_iap2d_handle_incoming_request event error: %s\n", buf, 0xCu);
      }

      objc_msgSend(*(id *)(a1 + 40), "processDetachXPCConnection:", *(_QWORD *)(a1 + 32));
      xpc_connection_cancel(*(xpc_connection_t *)(a1 + 32));
    }
    goto LABEL_175;
  }
  v5 = xpc_dictionary_get_string(v3, "requestType");
  if (!v5)
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v6 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:].cold.1();
      v6 = MEMORY[0x24BDACB70];
      v9 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_217DCB000, v6, OS_LOG_TYPE_DEFAULT, "[#Server] RequestType not specified in xpc message!", buf, 2u);
    }

    v5 = "<nil>";
  }
  if (gLogObjects && gNumLogObjects >= 1)
  {
    v10 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:].cold.1();
    v10 = MEMORY[0x24BDACB70];
    v11 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    ___xpc_iap2d_handle_incoming_request_block_invoke_cold_19();

  if (!strcmp(v5, "OwnsConnectionID"))
  {
    reply = xpc_dictionary_create_reply(v3);
    if (reply)
    {
      uint64 = xpc_dictionary_get_uint64(v3, "connectionID");
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v15 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:].cold.1();
        v15 = MEMORY[0x24BDACB70];
        v26 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = uint64;
        _os_log_impl(&dword_217DCB000, v15, OS_LOG_TYPE_INFO, "[#Server] OwnsConnectionID: connectionID = %u\n", buf, 8u);
      }

      +[ACCiAP2ShimServer sharedInstance](ACCiAP2ShimServer, "sharedInstance");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "findAccessoryForConnectionID:", uint64);
      v25 = objc_claimAutoreleasedReturnValue();

      xpc_dictionary_set_BOOL(reply, "result", v25 != 0);
      xpc_connection_send_message(*(xpc_connection_t *)(a1 + 32), reply);
    }
    else
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v25 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:].cold.1();
        v25 = MEMORY[0x24BDACB70];
        v31 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        ___xpc_iap2d_handle_incoming_request_block_invoke_cold_1();
    }
LABEL_173:

LABEL_174:
    goto LABEL_175;
  }
  if (!strcmp(v5, "IAPCheckIn"))
  {
    v16 = xpc_dictionary_create_reply(v3);
    reply = v16;
    if (gLogObjects)
      v17 = gNumLogObjects <= 0;
    else
      v17 = 1;
    v18 = !v17;
    if (v16)
    {
      if (v18)
      {
        v19 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:].cold.1();
        v19 = MEMORY[0x24BDACB70];
        v30 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_217DCB000, v19, OS_LOG_TYPE_INFO, "[#Server] IAPCheckIn\n", buf, 2u);
      }

      xpc_dictionary_set_BOOL(reply, "result", 1);
      xpc_connection_send_message(*(xpc_connection_t *)(a1 + 32), reply);
    }
    else
    {
      if (v18)
      {
        v29 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:].cold.1();
        v29 = MEMORY[0x24BDACB70];
        v40 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        ___xpc_iap2d_handle_incoming_request_block_invoke_cold_4();

    }
    goto LABEL_174;
  }
  if (strcmp(v5, "IAPAppRegisterClient"))
  {
    if (strcmp(v5, "IAPAppConnectedAccessories"))
    {
      if ((objc_msgSend(*(id *)(a1 + 40), "processXPCMessage:connection:", v3, *(_QWORD *)(a1 + 32)) & 1) == 0)
      {
        if (gLogObjects && gNumLogObjects >= 1)
        {
          v12 = *(id *)gLogObjects;
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:].cold.1();
          v12 = MEMORY[0x24BDACB70];
          v41 = MEMORY[0x24BDACB70];
        }
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          ___xpc_iap2d_handle_incoming_request_block_invoke_cold_17();

        v42 = xpc_dictionary_create_reply(v3);
        if (v42)
        {
          xpc_connection_send_message(*(xpc_connection_t *)(a1 + 32), v42);
        }
        else
        {
          logObjectForModule();
          v46 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
            ___xpc_iap2d_handle_incoming_request_block_invoke_cold_16();

        }
      }
      goto LABEL_175;
    }
    reply = xpc_dictionary_create_reply(v3);
    if (reply)
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v28 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:].cold.1();
        v28 = MEMORY[0x24BDACB70];
        v43 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_217DCB000, v28, OS_LOG_TYPE_INFO, "[#Server] IAPAppConnectedAccessories", buf, 2u);
      }

      v44 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v45 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:].cold.1();
        v45 = MEMORY[0x24BDACB70];
        v47 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
      {
        v48 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v48;
        _os_log_impl(&dword_217DCB000, v45, OS_LOG_TYPE_INFO, "[#Server] IAPAppConnectedAccessories call [sharediAP2Server(%@) iterateAccessoriesSync:]", buf, 0xCu);
      }

      v49 = *(void **)(a1 + 40);
      v73[0] = MEMORY[0x24BDAC760];
      v73[1] = 3221225472;
      v73[2] = ___xpc_iap2d_handle_incoming_request_block_invoke_174;
      v73[3] = &unk_24D9069E0;
      v25 = v44;
      v74 = v25;
      objc_msgSend(v49, "iterateAccessoriesSync:", v73);
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v50 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:].cold.1();
        v50 = MEMORY[0x24BDACB70];
        v51 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v25;
        _os_log_impl(&dword_217DCB000, v50, OS_LOG_TYPE_INFO, "[#Server] IAPAppConnectedAccessories connectedAccessories=%@", buf, 0xCu);
      }

      if (v25 && -[NSObject count](v25, "count"))
      {
        v72 = 0;
        objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", v25, 100, 0, &v72);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = v72;
        if (v52)
        {
          v54 = objc_retainAutorelease(v52);
          v55 = (const void *)objc_msgSend(v54, "bytes");
          v56 = objc_msgSend(v54, "length");
        }
        else
        {
          logObjectForModule();
          v68 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v53, "description");
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = v69;
            _os_log_impl(&dword_217DCB000, v68, OS_LOG_TYPE_DEFAULT, "[#Server] ERROR - unable to convert accessories array to plist: %@", buf, 0xCu);

          }
          v55 = 0;
          v56 = 0;
        }

        if (v55)
          xpc_dictionary_set_data(reply, "plistData", v55, v56);
        v25 = 0;
      }
      xpc_connection_send_message(*(xpc_connection_t *)(a1 + 32), reply);

    }
    else
    {
      logObjectForModule();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        ___xpc_iap2d_handle_incoming_request_block_invoke_cold_12();
    }
    goto LABEL_173;
  }
  v20 = xpc_dictionary_create_reply(v3);
  if (v20)
  {
    v21 = v20;
    v22 = MEMORY[0x219A173B4]();
    v23 = xpc_dictionary_get_string(v3, "eaClientBundleID");
    if (v23 && *v23)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v24 = 0;
    }
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v32 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:].cold.1();
      v32 = MEMORY[0x24BDACB70];
      v34 = MEMORY[0x24BDACB70];
    }
    v70 = (void *)v22;
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v24;
      _os_log_impl(&dword_217DCB000, v32, OS_LOG_TYPE_INFO, "[#Server] IAPAppRegisterClient %@", buf, 0xCu);
    }

    v35 = xpc_dictionary_get_uint64(v3, "eaClientCapabilities");
    v71 = xpc_dictionary_get_uint64(v3, "eaClientID");
    length = 0;
    data = xpc_dictionary_get_data(v3, "eaClientSupportedProtocols", &length);
    v37 = xpc_dictionary_get_BOOL(v3, "eaClientHasCheckedForConnectedAccessories");
    v38 = 0;
    if (data && length)
    {
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", data);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      if (v39)
      {
        v75 = 0;
        objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", v39, 0, 0, &v75);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v38 = 0;
      }

    }
    v58 = !v37;
    *(_QWORD *)&v59 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v59 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)buf = v59;
    v79 = v59;
    xpc_dictionary_get_audit_token();
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v60 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:].cold.1();
      v60 = MEMORY[0x24BDACB70];
      v61 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v77 = 138412802;
      *(_QWORD *)&v77[4] = v24;
      *(_WORD *)&v77[12] = 1024;
      *(_DWORD *)&v77[14] = v35;
      *(_WORD *)&v77[18] = 1024;
      *(_DWORD *)&v77[20] = v58;
      _os_log_impl(&dword_217DCB000, v60, OS_LOG_TYPE_INFO, "[#Server] IAPAppRegisterClient %@ call addClientWithCapabilites:%xh notifyClientOfAlreadyConnectedAccessories:%d", v77, 0x18u);
    }

    v63 = *(_QWORD *)(a1 + 32);
    v62 = *(void **)(a1 + 40);
    *(_OWORD *)v77 = *(_OWORD *)buf;
    *(_OWORD *)&v77[16] = v79;
    v64 = objc_msgSend(v62, "addClientWithCapabilities:auditToken:currentClientID:xpcConnection:eaProtocols:notifyOfAlreadyConnectedAccessories:andBundleId:", v35, v77, v71, v63, v38, v58, v24);
    xpc_dictionary_set_uint64(v21, "eaClientID", v64);
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v65 = *(id *)gLogObjects;
      v66 = v70;
    }
    else
    {
      v66 = v70;
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:].cold.1();
      v65 = MEMORY[0x24BDACB70];
      v67 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v77 = 138412546;
      *(_QWORD *)&v77[4] = v24;
      *(_WORD *)&v77[12] = 1024;
      *(_DWORD *)&v77[14] = v64;
      _os_log_impl(&dword_217DCB000, v65, OS_LOG_TYPE_INFO, "[#Server] IAPAppRegisterClient %@ send back reply, clientID=%u", v77, 0x12u);
    }

    xpc_connection_send_message(*(xpc_connection_t *)(a1 + 32), v21);
    objc_autoreleasePoolPop(v66);
  }
  else
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v33 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:].cold.1();
      v33 = MEMORY[0x24BDACB70];
      v57 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      ___xpc_iap2d_handle_incoming_request_block_invoke_cold_7();

  }
LABEL_175:

}

void ___xpc_iap2d_handle_incoming_request_block_invoke_174(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  BOOL v6;
  id v7;
  BOOL v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  int v12;
  id v13;
  __int16 v14;
  NSObject *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  if ((objc_msgSend(v5, "dontPublish") & 1) != 0)
  {
    if (gLogObjects)
      v6 = gNumLogObjects < 1;
    else
      v6 = 1;
    if (v6)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:].cold.1();
      v10 = MEMORY[0x24BDACB70];
      v7 = MEMORY[0x24BDACB70];
    }
    else
    {
      v10 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v12 = 138412546;
      v13 = v5;
      v14 = 1024;
      LODWORD(v15) = objc_msgSend(v5, "dontPublish");
      _os_log_impl(&dword_217DCB000, v10, OS_LOG_TYPE_INFO, "[#Server] IAPAppConnectedAccessories iterateAccessoriesSync, accessory=%@, dontPublish=%d, skip adding!", (uint8_t *)&v12, 0x12u);
    }
  }
  else
  {
    objc_msgSend(v5, "accessoryInfoDict");
    v10 = objc_claimAutoreleasedReturnValue();
    if (gLogObjects)
      v8 = gNumLogObjects < 1;
    else
      v8 = 1;
    if (v8)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCiAP2ShimServerUnregisteredClient takeProcessAssertion:].cold.1();
      v11 = MEMORY[0x24BDACB70];
      v9 = MEMORY[0x24BDACB70];
    }
    else
    {
      v11 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = 138412546;
      v13 = v5;
      v14 = 2112;
      v15 = v10;
      _os_log_impl(&dword_217DCB000, v11, OS_LOG_TYPE_INFO, "[#Server] IAPAppConnectedAccessories iterateAccessoriesSync, accessory=%@, accessoryInfo=%@", (uint8_t *)&v12, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 32), "addObject:", v10);
  }

  *a3 = 1;
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_6(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_10(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x2Au);
}

void OUTLINED_FUNCTION_11(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x20u);
}

void init_logging()
{
  init_logging_modules((uint64_t)&_gLogObjects, 1, (uint64_t)_kLoggingModuleEntries);
  init_logging_signposts();
}

void init_logging_modules(uint64_t a1, char a2, uint64_t a3)
{
  _QWORD block[6];
  char v4;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 0x40000000;
  block[2] = __init_logging_modules_block_invoke;
  block[3] = &__block_descriptor_tmp_0;
  v4 = a2;
  block[4] = a3;
  block[5] = a1;
  if (init_logging_modules_onceToken != -1)
    dispatch_once(&init_logging_modules_onceToken, block);
}

void __init_logging_modules_block_invoke(uint64_t a1)
{
  char *__ptr32 *v2;
  uint64_t v3;
  unint64_t v4;
  int v5;
  NSObject *v6;
  uint64_t v7;
  const char *v8;
  const char *v9;
  os_log_t v10;
  unint64_t v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  const char *v15;
  uint8_t v16[4];
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v2 = &off_217DDA000;
  if (*(_BYTE *)(a1 + 48))
  {
    v3 = 0;
    v4 = 0;
    v5 = 0;
    v6 = MEMORY[0x24BDACB70];
    do
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = *(const char **)(v7 + v3);
      if (!v8)
      {
        v8 = "<Undefined>";
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v13) = v4;
          _os_log_error_impl(&dword_217DCB000, v6, OS_LOG_TYPE_ERROR, "Subsystem missing for logging module %d!\n(Check LoggingModuleEntry_t table)", buf, 8u);
          v7 = *(_QWORD *)(a1 + 32);
          v8 = "<Undefined>";
        }
      }
      v9 = *(const char **)(v7 + v3 + 8);
      if (!v9)
      {
        v9 = "<Undefined>";
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          __init_logging_modules_block_invoke_cold_1(v16, v4, &v17);
          v9 = "<Undefined>";
        }
      }
      v10 = os_log_create(v8, v9);
      *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8 * v4) = v10;
      if (v10)
      {
        ++v5;
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315394;
          v13 = v8;
          v14 = 2080;
          v15 = v9;
          _os_log_debug_impl(&dword_217DCB000, v6, OS_LOG_TYPE_DEBUG, "Created log object %s: %s", buf, 0x16u);
        }
      }
      else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v13 = v8;
        v14 = 2080;
        v15 = v9;
        _os_log_error_impl(&dword_217DCB000, v6, OS_LOG_TYPE_ERROR, "Failed to create os_log_t object %s: %s!", buf, 0x16u);
      }
      ++v4;
      v11 = *(unsigned __int8 *)(a1 + 48);
      v3 += 16;
    }
    while (v4 < v11);
    v2 = &off_217DDA000;
  }
  else
  {
    LODWORD(v11) = 0;
    v5 = 0;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = *((_QWORD *)v2 + 137);
    LODWORD(v13) = v5;
    _os_log_impl(&dword_217DCB000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Created %d log object(s)!", buf, 8u);
    LODWORD(v11) = *(unsigned __int8 *)(a1 + 48);
  }
  gLogObjects = *(_QWORD *)(a1 + 40);
  gNumLogObjects = v11;
}

void __init_logging_signpost_modules_block_invoke_cold_1(uint8_t *buf, int a2, _DWORD *a3)
{
  *(_DWORD *)buf = 67109120;
  *a3 = a2;
  _os_log_error_impl(&dword_217DCB000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Category missing for logging module %d!\n(Check LoggingSignpostModuleEntry_t table)", buf, 8u);
}

void logObjectForModule_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_217DCB000, MEMORY[0x24BDACB70], a3, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

void ___xpc_iap2d_handle_incoming_request_block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_4(&dword_217DCB000, v0, v1, "[#Server] ERROR: Client sent kXPCOwnsConnectionIDStr xpc message without a reply context", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

void ___xpc_iap2d_handle_incoming_request_block_invoke_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_4(&dword_217DCB000, v0, v1, "[#Server] ERROR: Client sent kXPCIAPCheckInStr xpc message without a reply context", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

void ___xpc_iap2d_handle_incoming_request_block_invoke_cold_7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_4(&dword_217DCB000, v0, v1, "[#Server] ERROR: Client sent kXPCIAPAppRegisterClientStr xpc message without a reply context", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

void ___xpc_iap2d_handle_incoming_request_block_invoke_cold_12()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_4(&dword_217DCB000, v0, v1, "[#Server] ERROR: Client sent kXPCIAPAppConnectedAccessoriesStr xpc message without a reply context", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

void ___xpc_iap2d_handle_incoming_request_block_invoke_cold_16()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_3(&dword_217DCB000, v0, v1, "[#Server] Client sent '%s' xpc message without a reply context", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void ___xpc_iap2d_handle_incoming_request_block_invoke_cold_17()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_3(&dword_217DCB000, v0, v1, "[#Server] Client sent unknown '%s' xpc message ", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void ___xpc_iap2d_handle_incoming_request_block_invoke_cold_19()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_3(&dword_217DCB000, v0, v1, "[#Server] _xpc_iap2d_handle_incoming_request: received messagetype %s", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __init_logging_modules_block_invoke_cold_1(uint8_t *buf, int a2, _DWORD *a3)
{
  *(_DWORD *)buf = 67109120;
  *a3 = a2;
  _os_log_error_impl(&dword_217DCB000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Category missing for logging module %d!\n(Check LoggingModuleEntry_t table)", buf, 8u);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x24BDBBA18]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x24BDBBA20](BOOLean);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x24BDBBE68](cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x24BDBC050]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
  MEMORY[0x24BDBC070](center, name, object, userInfo, deliverImmediately);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x24BDBC4D0](theString1, theString2, compareOptions);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x24BDBC698]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x24BED8448]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x24BED8470]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x24BDD1268](aSelector);
}

uint64_t SBSProcessAssertionCreateForPID()
{
  return MEMORY[0x24BEB0CF8]();
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x24BDE8D48](task, entitlement, error);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return (SecTaskRef)MEMORY[0x24BDE8D78](allocator, token);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
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

uint32_t arc4random(void)
{
  return MEMORY[0x24BDAD158]();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x24BDAD170](*(_QWORD *)&__upper_bound);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x24BDADF18](object);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x24BDADF68](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x24BDADF70](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x24BDADFB0](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x24BDADFD0](source, start, interval, leeway);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x24BDAE780](a1, a2);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x24BDAF138](*(_QWORD *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x24BDAF148](*(_QWORD *)&token, state64);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x24BDAF160](name);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x24BDAF168](name, out_token);
}

uint32_t notify_set_state(int token, uint64_t state64)
{
  return MEMORY[0x24BDAF198](*(_QWORD *)&token, state64);
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

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
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

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3D0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
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

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8D0](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8E0](a1);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x24BDAFEF0](__s1, __s2);
}

time_t time(time_t *a1)
{
  return MEMORY[0x24BDB0240](a1);
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

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
  MEMORY[0x24BDB07C8](connection, handler);
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
  MEMORY[0x24BDB07E8](connection, targetq);
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return (char *)MEMORY[0x24BDB0820](object);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x24BDB08C0](keys, values, count);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x24BDB08D8](original);
}

uint64_t xpc_dictionary_get_audit_token()
{
  return MEMORY[0x24BDB0900]();
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x24BDB0908](xdict, key);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return (const void *)MEMORY[0x24BDB0918](xdict, key, length);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x24BDB0950](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x24BDB0958](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
  MEMORY[0x24BDB0978](xdict, key, value);
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
  MEMORY[0x24BDB0988](xdict, key, bytes, length);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
  MEMORY[0x24BDB09C8](xdict, key, string);
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
  MEMORY[0x24BDB09D0](xdict, key, value);
}

BOOL xpc_equal(xpc_object_t object1, xpc_object_t object2)
{
  return MEMORY[0x24BDB0A08](object1, object2);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x24BDB0A70](object);
}

