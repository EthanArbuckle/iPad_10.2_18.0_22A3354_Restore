void __powerUpdateBatteryState(io_registry_entry_t a1)
{
  NSObject *v1;
  _QWORD v2[5];
  CFMutableDictionaryRef properties;

  properties = 0;
  if (!IORegistryEntryCreateCFProperties(a1, &properties, 0, 0))
  {
    dispatch_get_global_queue(0, 0);
    v1 = objc_claimAutoreleasedReturnValue();
    v2[0] = MEMORY[0x24BDAC760];
    v2[1] = 3221225472;
    v2[2] = ____powerUpdateBatteryState_block_invoke;
    v2[3] = &__block_descriptor_40_e5_v8__0l;
    v2[4] = properties;
    dispatch_async(v1, v2);

  }
}

void __powerBatteryInterest(uint64_t a1, io_registry_entry_t a2, int a3)
{
  if (a3 == -536723200)
    __powerUpdateBatteryState(a2);
}

void ____powerUpdateBatteryState_block_invoke(uint64_t a1)
{
  void *v2;
  int v3;

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("IsCharging"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  if (__powerUpdateBatteryState_isBatteryChargingOld != v3
    && prefetchDeviceIdentityCertificates())
  {
    acc_policies_deviceDidPreArmDeviceIdentity();
  }
  __powerUpdateBatteryState_isBatteryChargingOld = v3;
  CFRelease(*(CFTypeRef *)(a1 + 32));
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
    _os_log_impl(&dword_21722C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "shouldHideAccessory: %s, showHiddenAccessories: %s", (uint8_t *)&v8, 0x16u);
  }
  return v4;
}

void __acc_policies_shouldHideAccessoryWithModelNumber_block_invoke()
{
  void *v0;

  v0 = (void *)acc_policies_shouldHideAccessoryWithModelNumber_hiddenModelNumbers;
  acc_policies_shouldHideAccessoryWithModelNumber_hiddenModelNumbers = (uint64_t)&unk_24D726408;

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
    _os_log_impl(&dword_21722C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "shouldOverrideName: %s", (uint8_t *)&v5, 0xCu);
  }
  return v2;
}

void __acc_policies_shouldOverrideNameOnAccessoryWithModelNumber_block_invoke()
{
  void *v0;

  v0 = (void *)acc_policies_shouldOverrideNameOnAccessoryWithModelNumber_hiddenModelNumbers;
  acc_policies_shouldOverrideNameOnAccessoryWithModelNumber_hiddenModelNumbers = (uint64_t)&unk_24D726420;

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
  v86[2] = &unk_24D7264B0;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v86, v85, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v87[0] = v6;
  v83[0] = CFSTR("nameMatch");
  v83[1] = CFSTR("modelContain");
  v84[0] = CFSTR("MyLink");
  v84[1] = CFSTR("1.0");
  v83[2] = CFSTR("overrideCurrentLimit");
  v84[2] = &unk_24D7264B0;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v84, v83, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v87[1] = v7;
  v81[0] = CFSTR("nameMatch");
  v81[1] = CFSTR("manufacturerMatch");
  v82[0] = CFSTR("iPL24Z");
  v82[1] = CFSTR("SDI Technologies");
  v81[2] = CFSTR("overrideCurrentLimit");
  v82[2] = &unk_24D7264B0;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v82, v81, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v87[2] = v8;
  v79[0] = CFSTR("modelMatch");
  v79[1] = CFSTR("manufacturerMatch");
  v80[0] = CFSTR("MIB2");
  v80[1] = CFSTR("HARMAN");
  v79[2] = CFSTR("overrideCurrentLimit");
  v80[2] = &unk_24D7264C8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v80, v79, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v87[3] = v9;
  v77[0] = CFSTR("modelMatch");
  v77[1] = CFSTR("manufacturerMatch");
  v78[0] = CFSTR("Range Rover Velar");
  v78[1] = CFSTR("Land Rover");
  v77[2] = CFSTR("overrideCurrentLimit");
  v78[2] = &unk_24D7264B0;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v78, v77, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v87[4] = v10;
  v75[0] = CFSTR("modelMatch");
  v75[1] = CFSTR("manufacturerMatch");
  v76[0] = CFSTR("Jaguar I-PACE");
  v76[1] = CFSTR("Jaguar");
  v75[2] = CFSTR("overrideCurrentLimit");
  v76[2] = &unk_24D7264B0;
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
    _os_log_impl(&dword_21722C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "RequiresChargingCurrentLimit: isApple=%d deviceType=%d checkChargingCurrentLimit=%d chargingCurrentLimit=%d inLimit=%d behavior=%d batteryThreshold=%d", buf, 0x2Cu);
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
          _os_log_debug_impl(&dword_21722C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "RequiresChargingCurrentLimit: isApple=%d deviceType=%d chargingCurrentLimit=%d inLimit=%d battery=%d threshold=%d", buf, 0x26u);
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
    _os_log_impl(&dword_21722C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "RequiresChargingCurrentLimit: isApple=%d, deviceType=%d, batt=%d(%d), %d->%d, return %d", buf, 0x2Cu);
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
        _os_log_impl(&dword_21722C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "acc_policies_deviceNeedsPreArmDeviceIdentity: _parseDate", (uint8_t *)&v21, 2u);
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
          _os_log_impl(&dword_21722C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "acc_policies_deviceNeedsPreArmDeviceIdentity: _parseDate: %@", (uint8_t *)&v21, 0xCu);
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
        _os_log_impl(&dword_21722C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "acc_policies_deviceNeedsPreArmDeviceIdentity: override", (uint8_t *)&v21, 2u);
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

CFNumberRef acc_analytics_createBucketizedAnalyticEventDuration(unint64_t a1)
{
  char v1;
  char valuePtr;

  if ((uint64_t)a1 > 299)
  {
    if (a1 > 0x258)
    {
      if (a1 > 0x708)
      {
        if (a1 > 0xE10)
        {
          if (a1 > 0x3840)
          {
            if (a1 > 0xA8C0)
            {
              if (a1 > 0x15180)
              {
                if (a1 > 0x3F480)
                {
                  if (a1 > 0x93A80)
                    v1 = 10;
                  else
                    v1 = 9;
                }
                else
                {
                  v1 = 8;
                }
              }
              else
              {
                v1 = 7;
              }
            }
            else
            {
              v1 = 6;
            }
          }
          else
          {
            v1 = 5;
          }
        }
        else
        {
          v1 = 4;
        }
      }
      else
      {
        v1 = 3;
      }
    }
    else
    {
      v1 = 2;
    }
  }
  else
  {
    v1 = 1;
  }
  valuePtr = v1;
  return CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberCharType, &valuePtr);
}

CFNumberRef acc_analytics_createBucketizedUnlockDialogAnalyticEventTime(unint64_t a1)
{
  char v1;
  char valuePtr;

  if ((uint64_t)a1 > 3599)
  {
    if (a1 > 0x1518)
    {
      if (a1 > 0x1C20)
      {
        if (a1 > 0x2A30)
        {
          if (a1 > 0x3840)
          {
            if (a1 > 0x7080)
            {
              if (a1 > 0xA8C0)
              {
                if (a1 > 0x15180)
                {
                  if (a1 > 0x3F480)
                    v1 = 10;
                  else
                    v1 = 9;
                }
                else
                {
                  v1 = 8;
                }
              }
              else
              {
                v1 = 7;
              }
            }
            else
            {
              v1 = 6;
            }
          }
          else
          {
            v1 = 5;
          }
        }
        else
        {
          v1 = 4;
        }
      }
      else
      {
        v1 = 3;
      }
    }
    else
    {
      v1 = 2;
    }
  }
  else
  {
    v1 = 1;
  }
  valuePtr = v1;
  return CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberCharType, &valuePtr);
}

CFNumberRef acc_analytics_createBucketizedWiredAuthDuration(unint64_t a1)
{
  char v1;
  char valuePtr;

  if (a1 > 0x1F3)
  {
    if (a1 > 0x3E8)
    {
      if (a1 > 0x5DC)
      {
        if (a1 > 0x7D0)
        {
          if (a1 > 0x1388)
          {
            if (a1 > 0x2710)
            {
              if (a1 > 0x3A98)
              {
                if (a1 > 0x4E20)
                {
                  if (a1 > 0x7530)
                    v1 = 10;
                  else
                    v1 = 9;
                }
                else
                {
                  v1 = 8;
                }
              }
              else
              {
                v1 = 7;
              }
            }
            else
            {
              v1 = 6;
            }
          }
          else
          {
            v1 = 5;
          }
        }
        else
        {
          v1 = 4;
        }
      }
      else
      {
        v1 = 3;
      }
    }
    else
    {
      v1 = 2;
    }
  }
  else
  {
    v1 = 1;
  }
  valuePtr = v1;
  return CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberCharType, &valuePtr);
}

CFNumberRef acc_analytics_createBucketizedInductiveAuthDuration(unint64_t a1)
{
  char v1;
  char valuePtr;

  if (a1 > 0xE)
  {
    if (a1 > 0x1E)
    {
      if (a1 > 0x2D)
      {
        if (a1 > 0x3C)
        {
          if (a1 > 0x5A)
          {
            if (a1 > 0x78)
            {
              if (a1 > 0x96)
              {
                if (a1 > 0xB4)
                {
                  if (a1 > 0xFA)
                    v1 = 10;
                  else
                    v1 = 9;
                }
                else
                {
                  v1 = 8;
                }
              }
              else
              {
                v1 = 7;
              }
            }
            else
            {
              v1 = 6;
            }
          }
          else
          {
            v1 = 5;
          }
        }
        else
        {
          v1 = 4;
        }
      }
      else
      {
        v1 = 3;
      }
    }
    else
    {
      v1 = 2;
    }
  }
  else
  {
    v1 = 1;
  }
  valuePtr = v1;
  return CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberCharType, &valuePtr);
}

CFNumberRef acc_analytics_createBucketizedBatteryChargeLevel(unsigned int a1)
{
  char v1;
  char valuePtr;

  if ((int)a1 > 9)
  {
    if (a1 > 0x14)
    {
      if (a1 > 0x1E)
      {
        if (a1 > 0x28)
        {
          if (a1 > 0x32)
          {
            if (a1 > 0x3C)
            {
              if (a1 > 0x46)
              {
                if (a1 > 0x50)
                {
                  if (a1 > 0x5A)
                    v1 = 10;
                  else
                    v1 = 9;
                }
                else
                {
                  v1 = 8;
                }
              }
              else
              {
                v1 = 7;
              }
            }
            else
            {
              v1 = 6;
            }
          }
          else
          {
            v1 = 5;
          }
        }
        else
        {
          v1 = 4;
        }
      }
      else
      {
        v1 = 3;
      }
    }
    else
    {
      v1 = 2;
    }
  }
  else
  {
    v1 = 1;
  }
  valuePtr = v1;
  return CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberCharType, &valuePtr);
}

CFNumberRef acc_analytics_createBucketizedBatteryChargeDelta(int a1)
{
  char v1;
  char valuePtr;

  if (a1 > -90)
  {
    if (a1 > -80)
    {
      if (a1 > -70)
      {
        if (a1 > -60)
        {
          if (a1 > -50)
          {
            if (a1 > -40)
            {
              if (a1 > -30)
              {
                if (a1 > -20)
                {
                  if (a1 > -10)
                  {
                    if (a1 <= 0)
                    {
                      v1 = 10;
                    }
                    else if (a1 > 0xA)
                    {
                      if (a1 > 0x14)
                      {
                        if (a1 > 0x1E)
                        {
                          if (a1 > 0x28)
                          {
                            if (a1 > 0x32)
                            {
                              if (a1 > 0x3C)
                              {
                                if (a1 > 0x46)
                                {
                                  if (a1 > 0x50)
                                  {
                                    if (a1 > 0x5A)
                                      v1 = 20;
                                    else
                                      v1 = 19;
                                  }
                                  else
                                  {
                                    v1 = 18;
                                  }
                                }
                                else
                                {
                                  v1 = 17;
                                }
                              }
                              else
                              {
                                v1 = 16;
                              }
                            }
                            else
                            {
                              v1 = 15;
                            }
                          }
                          else
                          {
                            v1 = 14;
                          }
                        }
                        else
                        {
                          v1 = 13;
                        }
                      }
                      else
                      {
                        v1 = 12;
                      }
                    }
                    else
                    {
                      v1 = 11;
                    }
                  }
                  else
                  {
                    v1 = 9;
                  }
                }
                else
                {
                  v1 = 8;
                }
              }
              else
              {
                v1 = 7;
              }
            }
            else
            {
              v1 = 6;
            }
          }
          else
          {
            v1 = 5;
          }
        }
        else
        {
          v1 = 4;
        }
      }
      else
      {
        v1 = 3;
      }
    }
    else
    {
      v1 = 2;
    }
  }
  else
  {
    v1 = 1;
  }
  valuePtr = v1;
  return CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberCharType, &valuePtr);
}

CFNumberRef acc_analytics_createBucketizeBatteryPackConnectionDuration(unint64_t a1)
{
  char v1;
  char valuePtr;

  if (a1 > 0x1B773F)
  {
    if (a1 > 0x36F267)
    {
      if (a1 > 0x6DE0E7)
      {
        if (a1 > 0xDBBDE7)
        {
          if (a1 > 0x1B777E7)
          {
            if (a1 > 0x29331E7)
            {
              if (a1 > 0x5265FE7)
              {
                if (a1 > 0xF7317E7)
                {
                  if (a1 > 0x240C87E7)
                    v1 = 10;
                  else
                    v1 = 9;
                }
                else
                {
                  v1 = 8;
                }
              }
              else
              {
                v1 = 7;
              }
            }
            else
            {
              v1 = 6;
            }
          }
          else
          {
            v1 = 5;
          }
        }
        else
        {
          v1 = 4;
        }
      }
      else
      {
        v1 = 3;
      }
    }
    else
    {
      v1 = 2;
    }
  }
  else
  {
    v1 = 1;
  }
  valuePtr = v1;
  return CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberCharType, &valuePtr);
}

CFNumberRef acc_analytics_createBucketizePowerSourceChargingTime(unint64_t a1)
{
  char v1;
  char valuePtr;

  if (a1 > 0x3E7)
  {
    if (a1 > 0xDBB9F)
    {
      if (a1 > 0x1B7B27)
      {
        if (a1 > 0x36F267)
        {
          if (a1 > 0x6DE0E7)
          {
            if (a1 > 0xDBBDE7)
            {
              if (a1 > 0x1B777E7)
              {
                if (a1 > 0x29331E7)
                {
                  if (a1 > 0x5265FE7)
                  {
                    if (a1 > 0xF7317E7)
                    {
                      if (a1 > 0x240C87E7)
                        v1 = 12;
                      else
                        v1 = 11;
                    }
                    else
                    {
                      v1 = 10;
                    }
                  }
                  else
                  {
                    v1 = 9;
                  }
                }
                else
                {
                  v1 = 8;
                }
              }
              else
              {
                v1 = 7;
              }
            }
            else
            {
              v1 = 6;
            }
          }
          else
          {
            v1 = 5;
          }
        }
        else
        {
          v1 = 4;
        }
      }
      else
      {
        v1 = 3;
      }
    }
    else
    {
      v1 = 2;
    }
  }
  else
  {
    v1 = 1;
  }
  valuePtr = v1;
  return CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberCharType, &valuePtr);
}

void notifyUserHSAIDDisabled(int a1, int a2)
{
  uint64_t v2;
  uint64_t v3;
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
  uint64_t v15;
  int v16;
  NSObject *v17;
  id v18;
  _QWORD block[4];
  int v20;
  uint64_t v21;
  uint64_t v22;

  if (a2 == 3)
  {
    v21 = v2;
    v22 = v3;
    +[BootArgs configuredBootArgsString](BootArgs, "configuredBootArgsString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "componentsSeparatedByCharactersInSet:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("SELF BEGINSWITH 'serial='"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "filteredArrayUsingPredicate:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD14A8], "decimalDigitCharacterSet");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "invertedSet");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "componentsSeparatedByCharactersInSet:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "componentsJoinedByString:", &stru_24D71B4F0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = gLogObjects;
    v16 = gNumLogObjects;
    if (gLogObjects && gNumLogObjects >= 4)
    {
      v17 = *(id *)(gLogObjects + 24);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        notifyUserHSAIDDisabled_cold_2(v15, v16);
      v17 = MEMORY[0x24BDACB70];
      v18 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      notifyUserHSAIDDisabled_cold_1(v14, v17);

    if (objc_msgSend(v14, "intValue"))
    {
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __notifyUserHSAIDDisabled_block_invoke;
      block[3] = &__block_descriptor_36_e5_v8__0l;
      v20 = a1;
      if (notifyUserHSAIDDisabled_onceToken != -1)
        dispatch_once(&notifyUserHSAIDDisabled_onceToken, block);
    }

  }
}

void __notifyUserHSAIDDisabled_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  acc_userNotifications_disabledHSAID();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), *(unsigned int *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  acc_userNotifications_generateIdentifier((uint64_t)CFSTR("io-service"), (uint64_t)v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setGroupIdentifier:", v3);

  +[ACCUserNotificationManager sharedManager](ACCUserNotificationManager, "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "presentNotification:completionHandler:", v5, 0);

}

void __OOBPairingReceiveCallback(void *a1, uint64_t a2, uint64_t a3)
{
  id v5;
  BOOL v6;
  id v7;
  BOOL v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _DWORD v26[2];
  __int16 v27;
  void *v28;
  __int16 v29;
  int v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  if ((_DWORD)a2)
  {
    if (gLogObjects)
      v6 = gNumLogObjects < 8;
    else
      v6 = 1;
    if (v6)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v10 = MEMORY[0x24BDACB70];
      v7 = MEMORY[0x24BDACB70];
    }
    else
    {
      v10 = *(id *)(gLogObjects + 56);
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __OOBPairingReceiveCallback_cold_4(a2, v10, v11, v12, v13, v14, v15, v16);
LABEL_31:

    goto LABEL_32;
  }
  if (gLogObjects)
    v8 = gNumLogObjects < 8;
  else
    v8 = 1;
  if (v8)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
    v17 = MEMORY[0x24BDACB70];
    v9 = MEMORY[0x24BDACB70];
  }
  else
  {
    v17 = *(id *)(gLogObjects + 56);
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v5, "endpointUUID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = 67109634;
    v26[1] = a3;
    v27 = 2112;
    v28 = v18;
    v29 = 1024;
    v30 = objc_msgSend(v5, "ioService");
    _os_log_impl(&dword_21722C000, v17, OS_LOG_TYPE_INFO, "Incoming OOB Pairing info/data: type=%d, endpointUUID %@, ioService %d", (uint8_t *)v26, 0x18u);

  }
  if ((objc_msgSend(v5, "_handleIncomingOOBPairingInfoData:", a3) & 1) == 0)
  {
    if (gLogObjects && gNumLogObjects >= 8)
    {
      v10 = *(id *)(gLogObjects + 56);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v10 = MEMORY[0x24BDACB70];
      v19 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __OOBPairingReceiveCallback_cold_1(a3, v10, v20, v21, v22, v23, v24, v25);
    goto LABEL_31;
  }
LABEL_32:

}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void OUTLINED_FUNCTION_4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x12u);
}

void OUTLINED_FUNCTION_6(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

uint64_t OUTLINED_FUNCTION_7()
{
  void *v0;

  return objc_msgSend(v0, "ioService");
}

void acc_restrictedMode_accessoryAttached()
{
  int v0;
  _DWORD v1[2];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  v1[0] = 1;
  v0 = ACMKernelControl(34);
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    v1[0] = 67109120;
    v1[1] = v0;
    _os_log_impl(&dword_21722C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "acmStatus (accessoryAttached): %d", (uint8_t *)v1, 8u);
  }
}

void acc_restrictedMode_accessoryDetached()
{
  int v0;
  _DWORD v1[2];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  v1[0] = 1;
  v0 = ACMKernelControl(37);
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    v1[0] = 67109120;
    v1[1] = v0;
    _os_log_impl(&dword_21722C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "acmStatus (accessoryDetached): %d", (uint8_t *)v1, 8u);
  }
}

void IOAccMgrNotifyEvent(void *a1, io_registry_entry_t a2, int a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  void *v9;
  const __CFAllocator *v10;
  void *CFProperty;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  v6 = v5;
  if (v5)
  {
    if (a3 == -469794780)
    {
      objc_msgSend(v5, "handlePropertyDataReceived");
    }
    else if (a3 == -469794781)
    {
      if (gLogObjects && gNumLogObjects >= 4)
      {
        v7 = *(id *)(gLogObjects + 24);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
        v7 = MEMORY[0x24BDACB70];
        v8 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v6, "endpointUUID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = 138412546;
        v32 = v6;
        v33 = 2112;
        v34 = v9;
        _os_log_impl(&dword_21722C000, v7, OS_LOG_TYPE_INFO, "kIOAccessoryConfigStreamMessageInfoChanged! (configStream: %@, configStream.endpointUUID: %@)", (uint8_t *)&v31, 0x16u);

      }
      v10 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
      CFProperty = (void *)IORegistryEntryCreateCFProperty(a2, CFSTR("IOAccessoryAccessoryName"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
      v12 = (void *)IORegistryEntryCreateCFProperty(a2, CFSTR("IOAccessoryAccessorySerialNumber"), v10, 0);
      v13 = (void *)IORegistryEntryCreateCFProperty(a2, CFSTR("IOAccessoryAccessoryManufacturer"), v10, 0);
      v14 = (void *)IORegistryEntryCreateCFProperty(a2, CFSTR("IOAccessoryAccessoryModelNumber"), v10, 0);
      v15 = (void *)IORegistryEntryCreateCFProperty(a2, CFSTR("IOAccessoryAccessoryFirmwareVersion"), v10, 0);
      v16 = (void *)IORegistryEntryCreateCFProperty(a2, CFSTR("IOAccessoryAccessoryHardwareVersion"), v10, 0);
      v17 = (void *)IORegistryEntryCreateCFProperty(a2, CFSTR("IOAccessoryConfigStreamDevInfoPPID"), v10, 0);
      objc_msgSend(v6, "setDeviceName:", CFProperty);

      objc_msgSend(v6, "setDeviceManufacturer:", v13);
      objc_msgSend(v6, "setDeviceModel:", v14);

      objc_msgSend(v6, "setDeviceSerialNumber:", v12);
      objc_msgSend(v6, "setDeviceHardwareVersion:", v16);

      objc_msgSend(v6, "setDeviceFirmwareVersion:", v15);
      objc_msgSend(v6, "setDevicePPID:", v17);

      objc_msgSend(v6, "delegate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "IOAccessoryConfigStreamUpdateAccesssoryInfo:", v6);

      if ((objc_msgSend(v6, "categoriesAvailable") & 1) == 0)
      {
        objc_msgSend(v6, "delegate");
        v19 = objc_claimAutoreleasedReturnValue();
        if (v19)
        {
          v20 = (void *)v19;
          objc_msgSend(v6, "deviceHardwareVersion");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (v21)
          {

          }
          else
          {
            objc_msgSend(v6, "devicePPID");
            v22 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v22)
              goto LABEL_27;
          }
          if (gLogObjects && gNumLogObjects >= 4)
          {
            v23 = *(id *)(gLogObjects + 24);
          }
          else
          {
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
              -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
            v23 = MEMORY[0x24BDACB70];
            v24 = MEMORY[0x24BDACB70];
          }
          if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v6, "endpointUUID");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "deviceHardwareVersion");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "devicePPID");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = 138413058;
            v32 = v6;
            v33 = 2112;
            v34 = v25;
            v35 = 2112;
            v36 = v26;
            v37 = 2112;
            v38 = v27;
            _os_log_impl(&dword_21722C000, v23, OS_LOG_TYPE_INFO, "kIOAccessoryConfigStreamMessageInfoChanged! (configStream: %@, configStream.endpointUUID: %@), hwVer = '%@', ppid = '%@', set CategoriesAvailable", (uint8_t *)&v31, 0x2Au);

          }
          objc_msgSend(v6, "setCategoriesAvailable:", 1);
          v31 = -65536;
          v32 = 0;
          v28 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
          objc_msgSend(v28, "appendBytes:length:", &v31, 12);
          objc_msgSend(v6, "delegate");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "endpointUUID");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "IOAccessoryConfigStreamMessageArrived:endpointUUID:", v28, v30);

        }
      }
    }
  }
LABEL_27:

}

void sub_217237708(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_217238570(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 56));
  _Unwind_Resume(a1);
}

void sub_21723881C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
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

void sub_21723931C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25)
{
  id *v25;
  uint64_t v26;

  objc_destroyWeak(v25);
  _Block_object_dispose(&a19, 8);
  _Block_object_dispose(&a25, 8);
  objc_destroyWeak((id *)(v26 - 128));
  _Unwind_Resume(a1);
}

void sub_2172398A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_217239C6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v14;
  va_list va;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  va_list va1;

  va_start(va1, a13);
  va_start(va, a13);
  v14 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

id _platform()
{
  return (id)MGCopyAnswer();
}

id _productVersion()
{
  return (id)MGCopyAnswer();
}

id _modelNumber()
{
  return (id)MGCopyAnswer();
}

id _productType()
{
  return (id)MGCopyAnswer();
}

void sub_21723AA08(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t ___isDeviceAnalyticsEnabled_block_invoke()
{
  uint64_t result;

  result = DiagnosticLogSubmissionEnabled();
  _isDeviceAnalyticsEnabled_dataCollectionEnabled = result;
  return result;
}

void *ACCSQLiteJournalSuffixes()
{
  return &unk_24D726450;
}

const void *platform_systemInfo_copySystemName()
{
  const void *v0;

  v0 = (const void *)MGGetStringAnswer();
  CFRetain(v0);
  return v0;
}

const void *platform_systemInfo_copyBluetoothMACAddress()
{
  const void *v0;

  v0 = (const void *)MGGetStringAnswer();
  CFRetain(v0);
  return v0;
}

uint64_t platform_systemInfo_copyBluetoothMACAddressData()
{
  return MGCopyAnswer();
}

uint64_t platform_systemInfo_copyUniqueDeviceID()
{
  const __CFDictionary *v0;
  io_service_t MatchingService;
  io_object_t v2;
  void *CFProperty;
  void *v4;
  uint64_t v5;

  v0 = IOServiceMatching("IOUSBDeviceController");
  if (!v0)
    return 0;
  MatchingService = IOServiceGetMatchingService(*MEMORY[0x24BDD8B20], v0);
  if (!MatchingService)
    return 0;
  v2 = MatchingService;
  CFProperty = (void *)IORegistryEntryCreateCFProperty(MatchingService, CFSTR("DeviceDescription"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
  v4 = CFProperty;
  if (CFProperty)
  {
    objc_msgSend(CFProperty, "objectForKeyedSubscript:", CFSTR("serialNumber"));
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  IOObjectRelease(v2);

  return v5;
}

uint64_t platform_systemInfo_isIPad()
{
  return _isDeviceClass(CFSTR("iPad"));
}

uint64_t _isDeviceClass(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = a1;
  v2 = (void *)systemInfo_copyDeviceClass();
  v3 = objc_msgSend(v2, "isEqualToString:", v1);

  return v3;
}

uint64_t platform_systemInfo_isIPod()
{
  return _isDeviceClass(CFSTR("iPod"));
}

uint64_t platform_systemInfo_isIPhone()
{
  return _isDeviceClass(CFSTR("iPhone"));
}

uint64_t platform_systemInfo_isATV()
{
  return _isDeviceClass(CFSTR("AppleTV"));
}

uint64_t platform_systemInfo_isWatch()
{
  return _isDeviceClass(CFSTR("Watch"));
}

uint64_t platform_systemInfo_isFPGA()
{
  return _isDeviceClass(CFSTR("iFPGA"));
}

uint64_t platform_systemInfo_isRealityDevice()
{
  return 0;
}

uint64_t platform_systemInfo_isApplePencilSupported()
{
  return MGGetBoolAnswer();
}

BOOL platform_systemInfo_isApplePencilGen1Supported()
{
  const __CFString *v0;
  _BOOL8 result;

  result = 0;
  if (MGGetBoolAnswer())
  {
    v0 = (const __CFString *)MGCopyAnswer();
    if ((MGGetBoolAnswer() & 1) != 0
      || CFStringCompare(v0, CFSTR("iPad13,18"), 0) == kCFCompareEqualTo
      || CFStringCompare(v0, CFSTR("iPad13,19"), 0) == kCFCompareEqualTo)
    {
      return 1;
    }
  }
  return result;
}

uint64_t platform_systemInfo_supportsBatteryAuthentication()
{
  return MGGetBoolAnswer();
}

uint64_t platform_systemInfo_supportsQiAuth()
{
  return 1;
}

uint64_t platform_systemInfo_isLightning()
{
  return MGGetBoolAnswer();
}

uint64_t platform_systemInfo_supportsUSBC()
{
  return MGGetBoolAnswer();
}

uint64_t platform_systemInfo_deviceType()
{
  if ((_isDeviceClass(CFSTR("Watch")) & 1) != 0)
    return 4;
  if ((_isDeviceClass(CFSTR("iPod")) & 1) != 0)
    return 2;
  if ((_isDeviceClass(CFSTR("iPad")) & 1) != 0)
    return 3;
  if ((_isDeviceClass(CFSTR("iPhone")) & 1) != 0)
    return 1;
  if (_isDeviceClass(CFSTR("AppleTV")))
    return 5;
  return 0;
}

void acc_sysdiagnose_InitiateAuthFailureSysdiagnose()
{
  NSObject *v0;
  int v1;
  const char *v2;
  __int16 v3;
  int v4;
  __int16 v5;
  int v6;
  __int16 v7;
  int isWatch;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v1 = 136315906;
    v2 = "acc_sysdiagnose_InitiateAuthFailureSysdiagnose";
    v3 = 1024;
    v4 = 50;
    v5 = 1024;
    v6 = MFAAIsInternalBuild();
    v7 = 1024;
    isWatch = platform_systemInfo_isWatch();
    _os_log_impl(&dword_21722C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%s:%d MFAAIsInternalBuild %d, isWatch %d", (uint8_t *)&v1, 0x1Eu);
  }
  if (MFAAIsInternalBuild())
  {
    if ((_isSysdiagnosePending & 1) != 0)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        v1 = 136315394;
        v2 = "acc_sysdiagnose_InitiateAuthFailureSysdiagnose";
        v3 = 1024;
        v4 = 64;
        _os_log_impl(&dword_21722C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%s:%d sysdiagnose already in flight! skipped!", (uint8_t *)&v1, 0x12u);
      }
    }
    else
    {
      _isSysdiagnosePending = 1;
      dispatch_get_global_queue(0, 0);
      v0 = objc_claimAutoreleasedReturnValue();
      dispatch_async(v0, &__block_literal_global_3);

    }
  }
}

void _acc_sysdiagnose_authFailure(int a1)
{
  void *v2;
  char *v3;
  id v4;
  id v5;
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v7 = "_acc_sysdiagnose_authFailure";
    v8 = 1024;
    v9 = 28;
    v10 = 1024;
    v11 = a1;
    _os_log_impl(&dword_21722C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%s:%d timeout %d", buf, 0x18u);
  }
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 0;
  objc_msgSend(MEMORY[0x24BEDE3A8], "sysdiagnoseWithMetadata:withError:", v2, &v5);
  v3 = (char *)objc_claimAutoreleasedReturnValue();
  v4 = v5;
  if (!v3 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    _acc_sysdiagnose_authFailure_cold_1((uint64_t)v4);
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v7 = v3;
    _os_log_impl(&dword_21722C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Sysdiagnose path: %@\n", buf, 0xCu);
  }

}

void acc_sysdiagnose_InitiateAuthTimeoutSysdiagnose()
{
  NSObject *v0;
  int v1;
  const char *v2;
  __int16 v3;
  int v4;
  __int16 v5;
  int v6;
  __int16 v7;
  int isWatch;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v1 = 136315906;
    v2 = "acc_sysdiagnose_InitiateAuthTimeoutSysdiagnose";
    v3 = 1024;
    v4 = 72;
    v5 = 1024;
    v6 = MFAAIsInternalBuild();
    v7 = 1024;
    isWatch = platform_systemInfo_isWatch();
    _os_log_impl(&dword_21722C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%s:%d MFAAIsInternalBuild %d, isWatch %d", (uint8_t *)&v1, 0x1Eu);
  }
  if (MFAAIsInternalBuild())
  {
    if ((_isSysdiagnosePending & 1) != 0)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        v1 = 136315394;
        v2 = "acc_sysdiagnose_InitiateAuthTimeoutSysdiagnose";
        v3 = 1024;
        v4 = 86;
        _os_log_impl(&dword_21722C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%s:%d sysdiagnose already in flight! skipped!", (uint8_t *)&v1, 0x12u);
      }
    }
    else
    {
      _isSysdiagnosePending = 1;
      dispatch_get_global_queue(0, 0);
      v0 = objc_claimAutoreleasedReturnValue();
      dispatch_async(v0, &__block_literal_global_1);

    }
  }
}

uint64_t __convertPortStreamType(int a1, int a2)
{
  unsigned int v3;

  if (a2 == 2 && a1 == 1)
    v3 = 5;
  else
    v3 = 0;
  if (a2 == 1)
    return a1 == 1;
  else
    return v3;
}

void PortNotifyEvent(void *a1, int a2, int a3)
{
  id v5;
  BOOL v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  id v15;
  const char *v16;
  id v17;
  id v18;
  void *v19;
  int v20;
  _BYTE v21[18];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  if (a3 == -469794716 || (a3 & 0xFFFFFFF0) == -469794816)
  {
    if (gLogObjects)
      v7 = gNumLogObjects < 5;
    else
      v7 = 1;
    if (v7)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v10 = MEMORY[0x24BDACB70];
      v8 = MEMORY[0x24BDACB70];
    }
    else
    {
      v10 = *(id *)(gLogObjects + 32);
    }
    v11 = (a3 + 469794816);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v20 = 67109120;
      *(_DWORD *)v21 = v11;
      _os_log_impl(&dword_21722C000, v10, OS_LOG_TYPE_DEFAULT, "PortNotifyEvent from IOAccessoryPort: msgType resistorID value %d", (uint8_t *)&v20, 8u);
    }

    objc_msgSend(v5, "_handleResistorIDChange:", v11);
  }
  else
  {
    if (a3 <= -469794785)
    {
      if (a3 != -536870896)
      {
        if (a3 == -536870608)
        {
          if (gLogObjects && gNumLogObjects >= 5)
          {
            v9 = *(id *)(gLogObjects + 32);
          }
          else
          {
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
              -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
            v9 = MEMORY[0x24BDACB70];
            v14 = MEMORY[0x24BDACB70];
          }
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            v20 = 67109378;
            *(_DWORD *)v21 = a2;
            *(_WORD *)&v21[4] = 2112;
            *(_QWORD *)&v21[6] = v5;
            _os_log_impl(&dword_21722C000, v9, OS_LOG_TYPE_DEFAULT, "PortNotifyEvent from IOAccessoryPort: kIOMessageServicePropertyChange for service %d, accTransportIOAccPort %@", (uint8_t *)&v20, 0x12u);
          }

          objc_msgSend(v5, "_handlePropertyChange");
        }
        goto LABEL_58;
      }
      if (gLogObjects && gNumLogObjects >= 5)
      {
        v12 = *(id *)(gLogObjects + 32);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
        v12 = MEMORY[0x24BDACB70];
        v17 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v20 = 67109120;
        *(_DWORD *)v21 = a2;
        v16 = "PortNotifyEvent from IOAccessoryPort: kIOMessageServiceIsTerminated(%d)";
        goto LABEL_50;
      }
      goto LABEL_51;
    }
    if (a3 != -469794784)
    {
      if (a3 != -469794782)
        goto LABEL_58;
      if (gLogObjects && gNumLogObjects >= 5)
      {
        v12 = *(id *)(gLogObjects + 32);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
        v12 = MEMORY[0x24BDACB70];
        v15 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v20 = 67109120;
        *(_DWORD *)v21 = a2;
        v16 = "PortNotifyEvent from IOAccessoryPort: kIOAccessoryPortMessageUSBRoleSwitch for service %d";
LABEL_50:
        _os_log_impl(&dword_21722C000, v12, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v20, 8u);
      }
LABEL_51:

      goto LABEL_58;
    }
    if (gLogObjects && gNumLogObjects >= 5)
    {
      v13 = *(id *)(gLogObjects + 32);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v13 = MEMORY[0x24BDACB70];
      v18 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "ioAccPortEndpointUUID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138412546;
      *(_QWORD *)v21 = v5;
      *(_WORD *)&v21[8] = 2112;
      *(_QWORD *)&v21[10] = v19;
      _os_log_impl(&dword_21722C000, v13, OS_LOG_TYPE_DEFAULT, "PortNotifyEvent from IOAccessoryPort: kIOAccessoryPortMessageDetach for port %@, endpointUUID %@", (uint8_t *)&v20, 0x16u);

    }
    objc_msgSend(v5, "_handleAccessoryPortDetach");
  }
LABEL_58:

}

void PortReceiveBuffer(unsigned __int16 *a1, void *a2)
{
  id v3;

  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", a1 + 1, *a1);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "_handleIncomingData:", v3);

}

void OUTLINED_FUNCTION_5_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_6_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
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

id acc_userNotifications_generateIdentifier(uint64_t a1, uint64_t a2)
{
  void *v2;

  v2 = 0;
  if (a1 && a2)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@_%@"), a1, a2);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

ACCUserNotification *acc_userNotifications_accessoryNotSupported()
{
  ACCUserNotification *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v0 = objc_alloc_init(ACCUserNotification);
  -[ACCUserNotification setType:](v0, "setType:", 2);
  acc_strings_bundle();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "localizedStringForKey:value:table:", CFSTR("Accessory Not Supported"), &stru_24D71B4F0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACCUserNotification setTitle:](v0, "setTitle:", v2);

  acc_strings_bundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("This accessory is not supported by this device."), &stru_24D71B4F0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACCUserNotification setMessage:](v0, "setMessage:", v4);

  -[ACCUserNotification setIsModal:](v0, "setIsModal:", 0);
  -[ACCUserNotification setPresentViaSystemAperture:](v0, "setPresentViaSystemAperture:", 1);
  return v0;
}

ACCUserNotification *acc_userNotifications_chargingNotSupported()
{
  ACCUserNotification *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v0 = objc_alloc_init(ACCUserNotification);
  -[ACCUserNotification setType:](v0, "setType:", 2);
  acc_strings_bundle();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "localizedStringForKey:value:table:", CFSTR("Charging Not Supported"), &stru_24D71B4F0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACCUserNotification setTitle:](v0, "setTitle:", v2);

  acc_strings_bundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Charging with this accessory is not supported by Apple Device."), &stru_24D71B4F0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACCUserNotification setMessage:](v0, "setMessage:", v4);

  acc_strings_bundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Dismiss"), &stru_24D71B4F0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACCUserNotification setDefaultButtonName:](v0, "setDefaultButtonName:", v6);

  -[ACCUserNotification setIsModal:](v0, "setIsModal:", 0);
  return v0;
}

ACCUserNotification *acc_userNotifications_unlockToUseAccessories()
{
  ACCUserNotification *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v0 = objc_alloc_init(ACCUserNotification);
  -[ACCUserNotification setType:](v0, "setType:", 2);
  acc_strings_bundle();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "localizedStringForKey:value:table:", CFSTR("Accessory Connected"), &stru_24D71B4F0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACCUserNotification setTitle:](v0, "setTitle:", v2);

  v3 = (void *)MEMORY[0x24BDD17C8];
  acc_strings_bundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Unlock %@ to use accessories"), &stru_24D71B4F0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", v5, systemInfo_copyDeviceClass());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACCUserNotification setMessage:](v0, "setMessage:", v6);

  -[ACCUserNotification setIsModal:](v0, "setIsModal:", 0);
  -[ACCUserNotification setDismissOnUnlock:](v0, "setDismissOnUnlock:", 1);
  -[ACCUserNotification setIgnoreQuietMode:](v0, "setIgnoreQuietMode:", 1);
  -[ACCUserNotification setSystemSoundID:](v0, "setSystemSoundID:", &unk_24D7264E0);
  return v0;
}

ACCUserNotification *acc_userNotifications_disabledHSAID()
{
  ACCUserNotification *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v0 = objc_alloc_init(ACCUserNotification);
  -[ACCUserNotification setType:](v0, "setType:", 1);
  acc_strings_bundle();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "localizedStringForKey:value:table:", CFSTR("Serial Boot-Arg Detected"), &stru_24D71B4F0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACCUserNotification setTitle:](v0, "setTitle:", v2);

  acc_strings_bundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("There are known compatibility issues with the 'serial' boot-arg and Smart Connector accessories, even for those not using HSAID. Please disable the 'serial' boot-arg when using Smart Connector accessories."), &stru_24D71B4F0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACCUserNotification setMessage:](v0, "setMessage:", v4);

  -[ACCUserNotification setIsModal:](v0, "setIsModal:", 0);
  return v0;
}

void init_logging()
{
  init_logging_modules((uint64_t)&_gLogObjects, 11, (uint64_t)_kLoggingModuleEntries);
  init_logging_signposts();
}

uint64_t logModuleForTransport(unsigned int a1)
{
  uint64_t result;
  uint64_t v3;
  int v4;
  BOOL v5;
  NSObject *v6;

  if (a1 < 8)
    return a1 + 3;
  v3 = gLogObjects;
  v4 = gNumLogObjects;
  if (gLogObjects)
    v5 = gNumLogObjects < 1;
  else
    v5 = 1;
  if (v5)
  {
    v6 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      notifyUserHSAIDDisabled_cold_2(v3, v4);
  }
  else
  {
    v6 = *(NSObject **)gLogObjects;
  }
  result = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);
  if ((_DWORD)result)
  {
    logModuleForTransport_cold_1(a1, v6);
    return 0;
  }
  return result;
}

void *WeakLinkSymbol(const char *a1, unint64_t a2)
{
  void *result;

  result = (void *)__HandleForSource(a2);
  if (result)
    return dlsym(result, a1);
  return result;
}

const void *__HandleForSource(unint64_t a1)
{
  const __CFDictionary *Mutable;
  const void *Value;
  void *v4;

  pthread_mutex_lock(&__HandlesLock);
  Mutable = (const __CFDictionary *)__Handles;
  if (!__Handles)
  {
    Mutable = CFDictionaryCreateMutable(0, 0, 0, 0);
    __Handles = (uint64_t)Mutable;
  }
  Value = CFDictionaryGetValue(Mutable, (const void *)a1);
  if (!Value)
  {
    if (a1 <= 8
      && ((0x1BFu >> a1) & 1) != 0
      && (v4 = dlopen((const char *)-[__CFString UTF8String](off_24D71A840[a1], "UTF8String"), 1)) != 0)
    {
      Value = v4;
      CFDictionarySetValue((CFMutableDictionaryRef)__Handles, (const void *)a1, v4);
    }
    else
    {
      NSLog(CFSTR("Could not load source: %ld"), a1);
      Value = 0;
    }
  }
  pthread_mutex_unlock(&__HandlesLock);
  return Value;
}

id WeakLinkClass(void *a1, unint64_t a2)
{
  NSString *v3;
  void *v4;

  v3 = a1;
  if (__HandleForSource(a2))
  {
    NSClassFromString(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

id *WeakLinkStringConstant(const char *a1, unint64_t a2)
{
  id *v3;

  v3 = (id *)__HandleForSource(a2);
  if (v3)
  {
    v3 = (id *)dlsym(v3, a1);
    if (v3)
      v3 = (id *)*v3;
  }
  return v3;
}

const __CFString *__getStateForUarpNotificationName(const __CFString *result)
{
  const char *CStringPtr;
  int out_token;
  uint64_t state64;

  state64 = 0;
  if (result)
  {
    out_token = -1;
    CStringPtr = CFStringGetCStringPtr(result, 0x8000100u);
    notify_register_check(CStringPtr, &out_token);
    notify_get_state(out_token, &state64);
    notify_cancel(out_token);
    return (const __CFString *)state64;
  }
  return result;
}

id logObjectForModule(int a1)
{
  BOOL v1;
  id v2;
  id v3;

  if (gLogObjects)
    v1 = gNumLogObjects <= a1;
  else
    v1 = 1;
  if (v1)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      logObjectForModule_cold_1();
    v3 = (id)MEMORY[0x24BDACB70];
    v2 = MEMORY[0x24BDACB70];
  }
  else
  {
    v3 = *(id *)(gLogObjects + 8 * a1);
  }
  return v3;
}

void IOAccMgrNotifyEvent_0(void *a1, uint64_t a2, int a3)
{
  id v5;
  void *v6;
  BOOL v8;
  id v9;
  int v10;
  unsigned int v11;
  ACCUserNotification *v12;
  char v13;
  NSObject *v14;
  NSObject *v15;
  char v16;
  NSObject *v17;
  int v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  int isLightning;
  NSObject *v23;
  NSObject *v24;
  int v25;
  NSObject *v26;
  int v27;
  NSObject *v28;
  NSObject *v29;
  NSObject *v30;
  id v31;
  const char *v32;
  uint64_t v33;
  NSObject *v34;
  NSObject *v35;
  NSObject *v36;
  NSObject *v37;
  NSObject *v38;
  id v39;
  void *v40;
  char v41;
  id v42;
  id v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  id v52;
  uint64_t v53;
  void *v54;
  const __CFString *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  int v59;
  NSObject *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  NSObject *v65;
  NSObject *v66;
  void *v67;
  void *v68;
  const __CFString *v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  id v73;
  NSObject *v74;
  id v75;
  void *v76;
  id v77;
  void *v78;
  const __CFAllocator *v79;
  void *CFProperty;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  int v90;
  NSObject *v91;
  __CFRunLoop *Main;
  __CFRunLoopSource *RunLoopSource;
  id v94;
  uint64_t AccessoryID;
  NSObject *v96;
  id v97;
  char v98;
  NSObject *v99;
  uint64_t v100;
  id v101;
  void *v102;
  void *v103;
  id v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  id v109;
  uint64_t v110;
  void *v111;
  void *v112;
  void *v113;
  id v114;
  uint64_t v115;
  id v116;
  NSObject *v117;
  const __CFBoolean *v118;
  const __CFBoolean *v119;
  int Value;
  int v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  NSObject *v129;
  int v130;
  int v131;
  int v132;
  int v133;
  char v134;
  int v135;
  int v136;
  void *v137;
  void *v138;
  void *v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  unsigned int v147;
  unsigned int v148;
  NSObject *v149;
  NSObject *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  id v156;
  dispatch_time_t v157;
  id v158;
  NSObject *v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  int v167;
  int v168;
  uint64_t v169;
  __CFString *v170;
  unsigned int v171;
  uint64_t v172;
  uint64_t v173;
  void *v174;
  __CFString *v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  _QWORD v180[2];
  _QWORD v181[2];
  uint8_t v182[128];
  uint8_t buf[4];
  _BYTE v184[20];
  __int16 v185;
  int v186;
  __int16 v187;
  int v188;
  uint64_t v189;

  v189 = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  v6 = v5;
  if (a3 == -469794716 || (a3 & 0xFFFFFFF0) == -469794816)
  {
    if (gLogObjects)
      v8 = gNumLogObjects < 4;
    else
      v8 = 1;
    if (v8)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v15 = MEMORY[0x24BDACB70];
      v9 = MEMORY[0x24BDACB70];
    }
    else
    {
      v15 = *(id *)(gLogObjects + 24);
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v184 = a3 + 469794816;
      *(_WORD *)&v184[4] = 1024;
      *(_DWORD *)&v184[6] = a2;
      _os_log_impl(&dword_21722C000, v15, OS_LOG_TYPE_DEFAULT, "MgrNotifyEvent from IOAccessoryManager: msgType resistorID value %d (svc:%d)", buf, 0xEu);
    }

    objc_msgSend(v6, "_handleResistorIDChangeNotification:", (a3 + 469794816));
    v12 = 0;
  }
  else
  {
    v10 = objc_msgSend(v5, "bAccConnected");
    v11 = objc_msgSend(v6, "bAccConnected");
    v171 = v11;
    v12 = 0;
    if (a3 <= -469794726)
    {
      v174 = v6;
      switch(a3)
      {
        case -469794800:
          goto LABEL_23;
        case -469794799:
          v13 = v10;
          if (gLogObjects && gNumLogObjects >= 4)
          {
            v14 = *(id *)(gLogObjects + 24);
          }
          else
          {
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
              -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
            v14 = MEMORY[0x24BDACB70];
            v39 = MEMORY[0x24BDACB70];
          }
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315394;
            *(_QWORD *)v184 = "kIOAccessoryManagerMessageDetach";
            *(_WORD *)&v184[8] = 1024;
            *(_DWORD *)&v184[10] = a2;
            _os_log_impl(&dword_21722C000, v14, OS_LOG_TYPE_DEFAULT, "Got %s (svc:%d) for manager, bAccConnectedNew = no", buf, 0x12u);
          }

          +[ACCTransportIOAccessorySharedManager sharedManager](ACCTransportIOAccessorySharedManager, "sharedManager");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          if (v40 && (objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v40, "IOAccessoryManagerServiceDetached:", a2);
          objc_msgSend(v6, "setIsAuthTimedOut:", 0);
          objc_msgSend(v6, "_clearAccessoryInfo");
          objc_msgSend(v6, "_handleResistorIDChangeNotification:", 100);
          v41 = v13;
          if (objc_msgSend(v6, "connectionType") == 8)
          {
            objc_msgSend(v6, "setAccessoryPowerMode:", 2);
            goto LABEL_235;
          }
          v90 = objc_msgSend(v6, "connectionType");
          if (v90 != 4)
            goto LABEL_235;
          logObjectForModule(3);
          v91 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v91, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_21722C000, v91, OS_LOG_TYPE_DEFAULT, "unregistering battery notifications", buf, 2u);
          }

          if (objc_msgSend(v6, "batteryNotifyPortRef"))
          {
            Main = CFRunLoopGetMain();
            RunLoopSource = IONotificationPortGetRunLoopSource((IONotificationPortRef)objc_msgSend(v6, "batteryNotifyPortRef"));
            CFRunLoopRemoveSource(Main, RunLoopSource, (CFRunLoopMode)*MEMORY[0x24BDBD5A0]);
            IONotificationPortDestroy((IONotificationPortRef)objc_msgSend(v6, "batteryNotifyPortRef"));
            objc_msgSend(v6, "setBatteryNotifyPortRef:", 0);
            objc_msgSend(v6, "setBatteryChargeLevelPercent:", 0);
          }
          if (objc_msgSend(v6, "notificationRef"))
          {
            IOObjectRelease(objc_msgSend(v6, "notificationRef"));
            objc_msgSend(v6, "setNotificationRef:", 0);
          }
          goto LABEL_234;
        case -469794798:
          v18 = v10;
          if (gLogObjects && gNumLogObjects >= 4)
          {
            v20 = *(id *)(gLogObjects + 24);
          }
          else
          {
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
              -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
            v20 = MEMORY[0x24BDACB70];
            v42 = MEMORY[0x24BDACB70];
          }
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
            IOAccMgrNotifyEvent_cold_24();

          objc_msgSend(v6, "_handlePowerChangeNotification");
          goto LABEL_258;
        case -469794797:
        case -469794792:
        case -469794791:
        case -469794790:
        case -469794789:
        case -469794788:
        case -469794787:
        case -469794786:
        case -469794784:
        case -469794783:
        case -469794782:
          goto LABEL_260;
        case -469794796:
          v168 = v10;
          if (gLogObjects && gNumLogObjects >= 4)
          {
            v21 = *(id *)(gLogObjects + 24);
          }
          else
          {
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
              -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
            v21 = MEMORY[0x24BDACB70];
            v43 = MEMORY[0x24BDACB70];
          }
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
            IOAccMgrNotifyEvent_cold_20();
          v169 = a2;

          +[ACCTransportIOAccessorySharedManager sharedManager](ACCTransportIOAccessorySharedManager, "sharedManager");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "lockAccessoryPorts");

          v178 = 0u;
          v179 = 0u;
          v176 = 0u;
          v177 = 0u;
          objc_msgSend(v6, "ioAccessoryChildPorts");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v176, v182, 16);
          if (v46)
          {
            v47 = v46;
            v48 = *(_QWORD *)v177;
            v173 = *MEMORY[0x24BE1A080];
            v172 = *MEMORY[0x24BE1A088];
            v49 = *MEMORY[0x24BE1A090];
            do
            {
              v50 = 0;
              do
              {
                if (*(_QWORD *)v177 != v48)
                  objc_enumerationMutation(v45);
                v51 = *(void **)(*((_QWORD *)&v176 + 1) + 8 * v50);
                if (objc_msgSend(v51, "ioServiceClassType") == 1)
                {
                  v52 = v51;
                  v53 = objc_msgSend(v6, "getUSBMode");
                  v180[0] = v173;
                  objc_msgSend(v52, "ioAccPortEndpointUUID");
                  v54 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v54)
                  {
                    objc_msgSend(v52, "ioAccPortEndpointUUID");
                    v175 = (__CFString *)objc_claimAutoreleasedReturnValue();
                    v55 = v175;
                  }
                  else
                  {
                    v55 = &stru_24D71B4F0;
                  }
                  v181[0] = v55;
                  v180[1] = v172;
                  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v53);
                  v56 = (void *)objc_claimAutoreleasedReturnValue();
                  v181[1] = v56;
                  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v181, v180, 2);
                  v57 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v54)
                  v58 = gLogObjects;
                  v59 = gNumLogObjects;
                  if (gLogObjects && gNumLogObjects >= 4)
                  {
                    v60 = *(id *)(gLogObjects + 24);
                  }
                  else
                  {
                    v61 = v47;
                    v62 = v49;
                    v63 = v48;
                    v64 = v45;
                    v65 = MEMORY[0x24BDACB70];
                    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 134218240;
                      *(_QWORD *)v184 = v58;
                      *(_WORD *)&v184[8] = 1024;
                      *(_DWORD *)&v184[10] = v59;
                      _os_log_error_impl(&dword_21722C000, v65, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
                    }
                    v66 = v65;
                    v60 = v65;
                    v45 = v64;
                    v48 = v63;
                    v49 = v62;
                    v47 = v61;
                  }
                  if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
                  {
                    objc_msgSend(v52, "ioAccPortEndpointUUID");
                    v68 = (void *)objc_claimAutoreleasedReturnValue();
                    v69 = &stru_24D71B4F0;
                    if (v68)
                    {
                      objc_msgSend(v52, "ioAccPortEndpointUUID");
                      v170 = (__CFString *)objc_claimAutoreleasedReturnValue();
                      v69 = v170;
                    }
                    *(_DWORD *)buf = 138412290;
                    *(_QWORD *)v184 = v69;
                    _os_log_debug_impl(&dword_21722C000, v60, OS_LOG_TYPE_DEBUG, "Sending ACCPlatformUSBModePlugin_USBModeDidChangeNotification for endpointUUID %@", buf, 0xCu);
                    if (v68)

                  }
                  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
                  v67 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v67, "postNotificationName:object:userInfo:", v49, 0, v57);

                  v6 = v174;
                }
                ++v50;
              }
              while (v47 != v50);
              v70 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v176, v182, 16);
              v47 = v70;
            }
            while (v70);
          }

          +[ACCTransportIOAccessorySharedManager sharedManager](ACCTransportIOAccessorySharedManager, "sharedManager");
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v71, "unlockAccessoryPorts");
          goto LABEL_159;
        case -469794795:
          v18 = v10;
          isLightning = platform_systemInfo_isLightning();
          logObjectForModule(3);
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = v23;
          if (isLightning)
          {
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
              IOAccMgrNotifyEvent_cold_23();

            objc_msgSend(v6, "_handleUSBCurrentLimitNotification");
            goto LABEL_258;
          }
          if (!os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
            goto LABEL_257;
          *(_WORD *)buf = 0;
          v72 = "Not Lightning device, Ignore kIOAccessoryManagerMessageUSBCurrentLimitChange!!!";
          goto LABEL_132;
        case -469794794:
          v18 = v10;
          v25 = platform_systemInfo_isLightning();
          logObjectForModule(3);
          v26 = objc_claimAutoreleasedReturnValue();
          v24 = v26;
          if (v25)
          {
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
              IOAccMgrNotifyEvent_cold_22();

            objc_msgSend(v6, "_handleBatteryPackNotification");
            goto LABEL_258;
          }
          if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            v72 = "Not Lightning device, Ignore kIOAccessoryManagerMessageUSBBatteryPackChange!!!";
LABEL_132:
            _os_log_impl(&dword_21722C000, v24, OS_LOG_TYPE_INFO, v72, buf, 2u);
          }
          goto LABEL_257;
        case -469794793:
          v27 = v10;
          if (gLogObjects && gNumLogObjects >= 4)
          {
            v28 = *(id *)(gLogObjects + 24);
          }
          else
          {
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
              -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
            v28 = MEMORY[0x24BDACB70];
            v73 = MEMORY[0x24BDACB70];
          }
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)v184 = a2;
            _os_log_impl(&dword_21722C000, v28, OS_LOG_TYPE_DEFAULT, "MgrNotifyEvent from IOAccessoryManager service %d: msgType kIOAccessoryManagerMessageConfigChange, checking resistorID", buf, 8u);
          }

          if (gLogObjects && gNumLogObjects >= 4)
          {
            v74 = *(id *)(gLogObjects + 24);
          }
          else
          {
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
              -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
            v74 = MEMORY[0x24BDACB70];
            v94 = MEMORY[0x24BDACB70];
          }
          if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)v184 = a2;
            _os_log_impl(&dword_21722C000, v74, OS_LOG_TYPE_DEFAULT, "Not setting bAccConnectedNew for kIOAccessoryManagerMessageConfigChange service %d", buf, 8u);
          }

          AccessoryID = IOAccessoryManagerGetAccessoryID();
          if (AccessoryID > 0xF)
          {
            logObjectForModule(3);
            v96 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v96, OS_LOG_TYPE_DEBUG))
              IOAccMgrNotifyEvent_cold_9();

          }
          else
          {
            objc_msgSend(v6, "_handleResistorIDChangeNotification:", AccessoryID);
          }
          objc_msgSend(v6, "_processAccessoryInfo");
          v12 = 0;
          v10 = v27;
          goto LABEL_260;
        case -469794785:
          v18 = v10;
          if (gLogObjects && gNumLogObjects >= 4)
          {
            v29 = *(id *)(gLogObjects + 24);
          }
          else
          {
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
              -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
            v29 = MEMORY[0x24BDACB70];
            v75 = MEMORY[0x24BDACB70];
          }
          if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v6, "connectionUUID");
            v76 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            *(_QWORD *)v184 = v6;
            *(_WORD *)&v184[8] = 2112;
            *(_QWORD *)&v184[10] = v76;
            _os_log_impl(&dword_21722C000, v29, OS_LOG_TYPE_INFO, "kIOAccessoryManagerMessageSupervisedTransportsRestrictedChange! (accTransportIOAccMgr: %@, accTransportIOAccMgr.connectionUUID: %@)", buf, 0x16u);

          }
          +[ACCTransportIOAccessorySharedManager sharedManager](ACCTransportIOAccessorySharedManager, "sharedManager");
          v24 = objc_claimAutoreleasedReturnValue();
          if (v24 && (objc_opt_respondsToSelector() & 1) != 0)
            -[NSObject IOAccessoryManagerSupervisedTransportsRestrictedDidChange:forManager:](v24, "IOAccessoryManagerSupervisedTransportsRestrictedDidChange:forManager:", objc_msgSend(v6, "supervisedTransportsRestricted"), v6);
          goto LABEL_257;
        case -469794781:
          v168 = v10;
          if (gLogObjects && gNumLogObjects >= 4)
          {
            v30 = *(id *)(gLogObjects + 24);
          }
          else
          {
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
              -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
            v30 = MEMORY[0x24BDACB70];
            v77 = MEMORY[0x24BDACB70];
          }
          if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v6, "connectionUUID");
            v78 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            *(_QWORD *)v184 = v6;
            *(_WORD *)&v184[8] = 2112;
            *(_QWORD *)&v184[10] = v78;
            _os_log_impl(&dword_21722C000, v30, OS_LOG_TYPE_INFO, "kIOAccessoryConfigStreamMessageInfoChanged! (accTransportIOAccMgr: %@, accTransportIOAccMgr.connectionUUID: %@)", buf, 0x16u);

          }
          +[ACCTransportIOAccessorySharedManager sharedManager](ACCTransportIOAccessorySharedManager, "sharedManager");
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          v79 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
          CFProperty = (void *)IORegistryEntryCreateCFProperty(a2, CFSTR("IOAccessoryAccessoryName"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
          v81 = (void *)IORegistryEntryCreateCFProperty(a2, CFSTR("IOAccessoryAccessorySerialNumber"), v79, 0);
          v82 = (void *)IORegistryEntryCreateCFProperty(a2, CFSTR("IOAccessoryAccessoryManufacturer"), v79, 0);
          v83 = (void *)IORegistryEntryCreateCFProperty(a2, CFSTR("IOAccessoryAccessoryModelNumber"), v79, 0);
          v84 = (void *)IORegistryEntryCreateCFProperty(a2, CFSTR("IOAccessoryAccessoryFirmwareVersion"), v79, 0);
          v85 = (void *)IORegistryEntryCreateCFProperty(a2, CFSTR("IOAccessoryAccessoryHardwareVersion"), v79, 0);
          v86 = (void *)IORegistryEntryCreateCFProperty(a2, CFSTR("IOAccessoryAccessoryPPID"), v79, 0);
          v169 = a2;
          v87 = (void *)IORegistryEntryCreateCFProperty(a2, CFSTR("IOAccessoryManagerInductiveRegionCodeData"), v79, 0);
          objc_msgSend(v174, "setDeviceName:", CFProperty);

          objc_msgSend(v174, "setDeviceVendorName:", v82);
          objc_msgSend(v174, "setDeviceModelNumber:", v83);

          v6 = v174;
          objc_msgSend(v174, "setDeviceSerialNumber:", v81);

          objc_msgSend(v174, "setDeviceHardwareRevision:", v85);
          objc_msgSend(v174, "setDeviceFirmwareRevision:", v84);

          objc_msgSend(v174, "setPpid:", v86);
          objc_msgSend(v174, "setRegionCode:", v87);

          if (v71 && (objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v71, "IOAccessoryManagerServiceInfoSet:", a2);
          objc_msgSend(v174, "deviceModelNumber");
          v88 = (void *)objc_claimAutoreleasedReturnValue();

          if (v88)
          {
            objc_msgSend(v174, "deviceModelNumber");
            v89 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v174, "_registerForUarpActivityForModel:", v89);

          }
LABEL_159:

          v12 = 0;
          a2 = v169;
          v10 = v168;
          goto LABEL_260;
        default:
          if (a3 == -536870896)
          {
            v13 = v10;
            if (gLogObjects && gNumLogObjects >= 4)
            {
              v38 = *(id *)(gLogObjects + 24);
            }
            else
            {
              if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
              v38 = MEMORY[0x24BDACB70];
              v116 = MEMORY[0x24BDACB70];
            }
            if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 67109120;
              *(_DWORD *)v184 = a2;
              _os_log_impl(&dword_21722C000, v38, OS_LOG_TYPE_DEFAULT, "Got kIOMessageServiceIsTerminated (svc:%d) for manager, informing ACCTransportIOAccessorySharedManager", buf, 8u);
            }

            +[ACCTransportIOAccessorySharedManager sharedManager](ACCTransportIOAccessorySharedManager, "sharedManager");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "_clearAccessoryInfo");
            if (v40)
            {
              v41 = v13;
              if ((objc_opt_respondsToSelector() & 1) != 0)
                objc_msgSend(v40, "IOAccessoryManagerServiceTerminated:", a2);
            }
            else
            {
LABEL_234:
              v41 = v13;
            }
LABEL_235:

            v12 = 0;
            if ((v41 & 1) != 0)
            {
              v100 = 0;
              goto LABEL_261;
            }
            goto LABEL_287;
          }
          if (a3 != -536870608)
            goto LABEL_260;
          v18 = v10;
          if (gLogObjects && gNumLogObjects >= 4)
          {
            v19 = *(id *)(gLogObjects + 24);
          }
          else
          {
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
              -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
            v19 = MEMORY[0x24BDACB70];
            v114 = MEMORY[0x24BDACB70];
          }
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)v184 = a2;
            _os_log_impl(&dword_21722C000, v19, OS_LOG_TYPE_DEFAULT, "Got kIOMessageServicePropertyChange (svc:%d) for manager, checking resistorID", buf, 8u);
          }

          v115 = IOAccessoryManagerGetAccessoryID();
          if (v115 > 0xF)
          {
            logObjectForModule(3);
            v117 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v117, OS_LOG_TYPE_DEBUG))
              IOAccMgrNotifyEvent_cold_18();

          }
          else
          {
            objc_msgSend(v6, "_handleResistorIDChangeNotification:", v115);
          }
          objc_msgSend(v6, "_processAccessoryInfo");
          v118 = (const __CFBoolean *)IORegistryEntryCreateCFProperty(a2, CFSTR("IOAccessoryManagerInductiveAuthTimedOut"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
          if (!v118)
            goto LABEL_258;
          v119 = v118;
          Value = CFBooleanGetValue(v118);
          if (!Value)
            goto LABEL_258;
          v121 = Value;
          if ((objc_msgSend(v6, "isAuthTimedOut") & 1) != 0)
          {
            if (!objc_msgSend(v6, "isAuthTimedOut"))
            {
LABEL_258:
              v12 = 0;
              goto LABEL_259;
            }
            logObjectForModule(6);
            v24 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
              IOAccMgrNotifyEvent_cold_15(v24, v122, v123, v124, v125, v126, v127, v128);
LABEL_257:

            goto LABEL_258;
          }
          logObjectForModule(3);
          v129 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v129, OS_LOG_TYPE_DEFAULT))
          {
            v130 = objc_msgSend(v6, "isAuthTimedOut");
            v131 = objc_msgSend(v6, "bIsInductive");
            *(_DWORD *)buf = 67110146;
            *(_DWORD *)v184 = a2;
            *(_WORD *)&v184[4] = 2112;
            *(_QWORD *)&v184[6] = v119;
            *(_WORD *)&v184[14] = 1024;
            *(_DWORD *)&v184[16] = v130;
            v185 = 1024;
            v186 = v121;
            v187 = 1024;
            v188 = v131;
            _os_log_impl(&dword_21722C000, v129, OS_LOG_TYPE_DEFAULT, "(svc:%d) kIOAccessoryManagerInductiveAuthTimedOutKey = %@, authTimedOut %d -> %d, bIsInductive=%d", buf, 0x24u);
          }

          objc_msgSend(v6, "setIsAuthTimedOut:", 1);
          if (!acc_userDefaults_BOOLForKey((uint64_t)CFSTR("EnableAuthTimeoutTTR")))
          {
            logObjectForModule(6);
            v24 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
              IOAccMgrNotifyEvent_cold_17(v24, v140, v141, v142, v143, v144, v145, v146);
            goto LABEL_257;
          }
          v132 = objc_msgSend(v6, "bIsInductive");
          v133 = objc_msgSend(v6, "bIsInductivePowerToAccessory");
          v134 = acc_userDefaults_BOOLForKey((uint64_t)CFSTR("AuthTTRForAllTransports"));
          v135 = MGGetSInt32Answer();
          v136 = v135;
          if ((v132 & (v133 ^ 1) & 1) == 0 && (v134 & 1) == 0 && v135 != 6 || !CFBooleanGetValue(v119))
            goto LABEL_258;
          if (v136 == 6)
          {
            acc_userNotifications_chargingNotSupported();
            v24 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), objc_msgSend(v6, "ioService"));
            v137 = (void *)objc_claimAutoreleasedReturnValue();
            acc_userNotifications_generateIdentifier((uint64_t)CFSTR("io-service"), (uint64_t)v137);
            v138 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject setGroupIdentifier:](v24, "setGroupIdentifier:", v138);

            +[ACCUserNotificationManager sharedManager](ACCUserNotificationManager, "sharedManager");
            v139 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v139, "presentNotification:completionHandler:", v24, 0);

            goto LABEL_257;
          }
          logObjectForModule(3);
          v159 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v159, OS_LOG_TYPE_DEBUG))
            IOAccMgrNotifyEvent_cold_16(v159, v160, v161, v162, v163, v164, v165, v166);

          v167 = acc_userDefaultsIapd_copyIntegerForKey((uint64_t)CFSTR("PretendBatteryLevel"));
          v12 = 0;
          if (objc_msgSend(v6, "batteryChargeLevelPercent") > 0x4F || v167 > 79)
          {
LABEL_259:
            v10 = v18;
          }
          else
          {
            v10 = v18;
            if (acc_userDefaults_BOOLForKey((uint64_t)CFSTR("SysdiagnoseInsteadOfAuthTTR")))
              acc_sysdiagnose_InitiateAuthTimeoutSysdiagnose();
            else
              acc_tapToRadar_InitiateAuthTimeoutTTR();
            v12 = 0;
          }
LABEL_260:
          v100 = v171;
          if (v10 != v171)
            goto LABEL_261;
          goto LABEL_287;
      }
    }
    switch(a3)
    {
      case -469794725:
LABEL_23:
        v16 = v10;
        if (gLogObjects && gNumLogObjects >= 4)
        {
          v17 = *(id *)(gLogObjects + 24);
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
          v17 = MEMORY[0x24BDACB70];
          v31 = MEMORY[0x24BDACB70];
        }
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          v32 = "kIOAccessoryManagerMessageAccIDDigitalID";
          if (a3 == -469794800)
            v32 = "kIOAccessoryManagerMessageAttach";
          *(_DWORD *)buf = 136315394;
          *(_QWORD *)v184 = v32;
          *(_WORD *)&v184[8] = 1024;
          *(_DWORD *)&v184[10] = a2;
          _os_log_impl(&dword_21722C000, v17, OS_LOG_TYPE_DEFAULT, "Got %s (svc:%d) for manager, bAccConnectedNew = yes", buf, 0x12u);
        }

        v33 = IOAccessoryManagerGetAccessoryID();
        if (v33 > 0xF)
        {
          if (gLogObjects && gNumLogObjects >= 4)
          {
            v34 = *(id *)(gLogObjects + 24);
          }
          else
          {
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
              -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
            v34 = MEMORY[0x24BDACB70];
            v97 = MEMORY[0x24BDACB70];
          }
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
            IOAccMgrNotifyEvent_cold_6();

        }
        else
        {
          objc_msgSend(v6, "_handleResistorIDChangeNotification:", v33);
        }
        v98 = v16;
        if (a3 == -469794800)
        {
          if (objc_msgSend(v6, "connectionType") == 8)
          {
            objc_msgSend(v6, "setAccessoryPowerMode:", 4);
          }
          else if (objc_msgSend(v6, "connectionType") == 4)
          {
            logObjectForModule(3);
            v99 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v99, OS_LOG_TYPE_DEBUG))
              IOAccMgrNotifyEvent_cold_5();

            objc_msgSend(v6, "_registerForBatteryNotifications");
            v98 = v16;
          }
        }
        objc_msgSend(v6, "_processAccessoryInfo");
        goto LABEL_192;
      case -469794724:
        v18 = v10;
        if (gLogObjects && gNumLogObjects >= 4)
        {
          v37 = *(id *)(gLogObjects + 24);
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
          v37 = MEMORY[0x24BDACB70];
          v109 = MEMORY[0x24BDACB70];
        }
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
          IOAccMgrNotifyEvent_cold_28();

        if (objc_msgSend(v6, "bIsInductive"))
          goto LABEL_214;
        acc_userNotifications_accessoryNotSupported();
        v110 = objc_claimAutoreleasedReturnValue();
        goto LABEL_216;
      case -469794723:
        v18 = v10;
        if (gLogObjects && gNumLogObjects >= 4)
        {
          v35 = *(id *)(gLogObjects + 24);
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
          v35 = MEMORY[0x24BDACB70];
          v101 = MEMORY[0x24BDACB70];
        }
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
          IOAccMgrNotifyEvent_cold_30();

        if (objc_msgSend(v6, "bIsInductive"))
        {
LABEL_214:
          acc_userNotifications_chargingNotSupported();
          v110 = objc_claimAutoreleasedReturnValue();
LABEL_216:
          v12 = (ACCUserNotification *)v110;
        }
        else
        {
          acc_userNotifications_accessoryNotSupported();
          v12 = (ACCUserNotification *)objc_claimAutoreleasedReturnValue();
          acc_strings_bundle();
          v102 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v102, "localizedStringForKey:value:table:", CFSTR("This cable or accessory is not certified and may not work reliably with this device."), &stru_24D71B4F0, 0);
          v103 = (void *)objc_claimAutoreleasedReturnValue();
          -[ACCUserNotification setMessage:](v12, "setMessage:", v103);

        }
        goto LABEL_217;
      case -469794722:
        v18 = v10;
        if (gLogObjects && gNumLogObjects >= 4)
        {
          v36 = *(id *)(gLogObjects + 24);
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
          v36 = MEMORY[0x24BDACB70];
          v104 = MEMORY[0x24BDACB70];
        }
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
          IOAccMgrNotifyEvent_cold_26();

        v98 = v18;
        if (MFAAIsInternalBuild())
        {
          v12 = objc_alloc_init(ACCUserNotification);
          -[ACCUserNotification setType:](v12, "setType:", 2);
          acc_strings_bundle();
          v105 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v105, "localizedStringForKey:value:table:", CFSTR("Connector Wrong Orientation"), &stru_24D71B4F0, 0);
          v106 = (void *)objc_claimAutoreleasedReturnValue();
          -[ACCUserNotification setTitle:](v12, "setTitle:", v106);

          acc_strings_bundle();
          v107 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v107, "localizedStringForKey:value:table:", CFSTR("This connector orientation is wrong and must be inverted."), &stru_24D71B4F0, 0);
          v108 = (void *)objc_claimAutoreleasedReturnValue();
          -[ACCUserNotification setMessage:](v12, "setMessage:", v108);

          -[ACCUserNotification setIsModal:](v12, "setIsModal:", 0);
          v171 = 1;
LABEL_217:
          if (v12)
          {
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), a2);
            v111 = (void *)objc_claimAutoreleasedReturnValue();
            acc_userNotifications_generateIdentifier((uint64_t)CFSTR("io-service"), (uint64_t)v111);
            v112 = (void *)objc_claimAutoreleasedReturnValue();
            -[ACCUserNotification setGroupIdentifier:](v12, "setGroupIdentifier:", v112);

            +[ACCUserNotificationManager sharedManager](ACCUserNotificationManager, "sharedManager");
            v113 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v113, "presentNotification:completionHandler:", v12, 0);

          }
          goto LABEL_259;
        }
LABEL_192:
        v12 = 0;
        if ((v98 & 1) != 0)
          goto LABEL_287;
        v100 = 1;
        break;
      default:
        goto LABEL_260;
    }
LABEL_261:
    if (objc_msgSend(v6, "bIsInductive") && (objc_msgSend(v6, "bIsInductivePowerToAccessory") & 1) == 0)
    {
      if ((v100 & 1) == 0)
      {
        +[ACCUserNotificationManager sharedManager](ACCUserNotificationManager, "sharedManager");
        v153 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), a2);
        v154 = (void *)objc_claimAutoreleasedReturnValue();
        acc_userNotifications_generateIdentifier((uint64_t)CFSTR("io-service"), (uint64_t)v154);
        v155 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v153, "dismissNotificationsWithGroupIdentifier:", v155);

      }
    }
    else
    {
      if ((_DWORD)v100)
      {
        v147 = objc_msgSend(v6, "connectionType");
        v148 = v147;
        if (v147 <= 8 && ((1 << v147) & 0x10A) != 0)
        {
          if (gLogObjects && gNumLogObjects >= 4)
          {
            v149 = *(id *)(gLogObjects + 24);
          }
          else
          {
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
              -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
            v149 = MEMORY[0x24BDACB70];
            v156 = MEMORY[0x24BDACB70];
          }
          if (os_log_type_enabled(v149, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134218496;
            *(_QWORD *)v184 = 30;
            *(_WORD *)&v184[8] = 1024;
            *(_DWORD *)&v184[10] = a2;
            *(_WORD *)&v184[14] = 1024;
            *(_DWORD *)&v184[16] = v148;
            _os_log_impl(&dword_21722C000, v149, OS_LOG_TYPE_DEFAULT, "Starting AppleIDBus auth timer timeout secs:[%02lld] for IOAccMgr service:%d, connectionType:%{coreacc:ACCConnection_Type_t}d", buf, 0x18u);
          }

          objc_msgSend(v6, "authTimerAccessory");
          v150 = objc_claimAutoreleasedReturnValue();
          v157 = dispatch_time(0, 30000000000);
          dispatch_source_set_timer(v150, v157, 0xFFFFFFFFFFFFFFFFLL, 0);
        }
        else
        {
          if (gLogObjects && gNumLogObjects >= 4)
          {
            v150 = *(id *)(gLogObjects + 24);
          }
          else
          {
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
              -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
            v150 = MEMORY[0x24BDACB70];
            v158 = MEMORY[0x24BDACB70];
          }
          if (os_log_type_enabled(v150, OS_LOG_TYPE_DEBUG))
            IOAccMgrNotifyEvent_cold_2();
        }
      }
      else
      {
        objc_msgSend(v6, "_stopAuthTimer");
        +[ACCUserNotificationManager sharedManager](ACCUserNotificationManager, "sharedManager");
        v150 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), a2);
        v151 = (void *)objc_claimAutoreleasedReturnValue();
        acc_userNotifications_generateIdentifier((uint64_t)CFSTR("io-service"), (uint64_t)v151);
        v152 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject dismissNotificationsWithGroupIdentifier:](v150, "dismissNotificationsWithGroupIdentifier:", v152);

      }
      objc_msgSend(v6, "setBAccConnected:", v100);
    }
  }
LABEL_287:

}

void __IOAMBatteryMatch(void *a1, io_iterator_t a2)
{
  id v3;
  void *v4;
  IONotificationPort *v5;
  io_object_t v6;
  io_object_t v7;
  NSObject *v8;
  kern_return_t v9;
  kern_return_t v10;
  uint64_t v11;
  int v12;
  BOOL v13;
  NSObject *v14;
  NSObject *v15;
  io_object_t notification;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v4 = v3;
  if (v3)
  {
    v5 = (IONotificationPort *)objc_msgSend(v3, "batteryNotifyPortRef");
    notification = -1431655766;
    v6 = IOIteratorNext(a2);
    if (v6)
    {
      if (v5)
      {
        v7 = v6;
        v8 = MEMORY[0x24BDACB70];
        do
        {
          __IOAMUpdateBatteryState(v4, v7);
          v9 = IOServiceAddInterestNotification(v5, v7, "IOGeneralInterest", (IOServiceInterestCallback)__IOAMBatteryInterest, v4, &notification);
          if (v9)
          {
            v10 = v9;
            objc_msgSend(v4, "setBatteryChargeLevelPercent:", 0);
            v11 = gLogObjects;
            v12 = gNumLogObjects;
            if (gLogObjects)
              v13 = gNumLogObjects < 4;
            else
              v13 = 1;
            if (v13)
            {
              if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 134218240;
                v18 = (const char *)v11;
                v19 = 1024;
                v20 = v12;
                _os_log_error_impl(&dword_21722C000, v8, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
              }
              v14 = v8;
              v15 = v8;
            }
            else
            {
              v15 = *(id *)(gLogObjects + 24);
            }
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              v18 = "void __IOAMBatteryMatch(void *, io_iterator_t)";
              v19 = 1024;
              v20 = v10;
              _os_log_error_impl(&dword_21722C000, v15, OS_LOG_TYPE_ERROR, "%s IOServiceAddInterestNotification failed: %08x", buf, 0x12u);
            }

          }
          IOObjectRelease(v7);
          v7 = IOIteratorNext(a2);
        }
        while (v7);
      }
    }
  }

}

void sub_21724FA4C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void __handleNotificationUarpStartUpdate(uint64_t a1, void *a2, void *a3)
{
  BOOL v5;
  id v6;
  NSObject *v7;
  id v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (gLogObjects)
    v5 = gNumLogObjects < 4;
  else
    v5 = 1;
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
    v7 = MEMORY[0x24BDACB70];
    v6 = MEMORY[0x24BDACB70];
  }
  else
  {
    v7 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315394;
    v11 = "__handleNotificationUarpStartUpdate";
    v12 = 2112;
    v13 = a3;
    _os_log_impl(&dword_21722C000, v7, OS_LOG_TYPE_DEFAULT, "%s: %@", (uint8_t *)&v10, 0x16u);
  }

  if (a2)
  {
    v8 = a2;
    __copyModelFromUarpNotificationName(a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_handleNotificationUarpStartUpdateForModel:", v9);

  }
}

void __handleNotificationUarpEndUpdate(uint64_t a1, void *a2, void *a3)
{
  BOOL v5;
  id v6;
  NSObject *v7;
  id v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (gLogObjects)
    v5 = gNumLogObjects < 4;
  else
    v5 = 1;
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
    v7 = MEMORY[0x24BDACB70];
    v6 = MEMORY[0x24BDACB70];
  }
  else
  {
    v7 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315394;
    v11 = "__handleNotificationUarpEndUpdate";
    v12 = 2112;
    v13 = a3;
    _os_log_impl(&dword_21722C000, v7, OS_LOG_TYPE_DEFAULT, "%s: %@", (uint8_t *)&v10, 0x16u);
  }

  if (a2)
  {
    v8 = a2;
    __copyModelFromUarpNotificationName(a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_handleNotificationUarpEndUpdateForModel:", v9);

  }
}

void __handleNotificationUarpStagingStatus(uint64_t a1, void *a2, __CFString *a3)
{
  BOOL v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  void *v10;

  if (gLogObjects)
    v5 = gNumLogObjects < 4;
  else
    v5 = 1;
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
    v7 = MEMORY[0x24BDACB70];
    v6 = MEMORY[0x24BDACB70];
  }
  else
  {
    v7 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __handleNotificationUarpStagingStatus_cold_1((uint64_t)a3, v7, v8);

  if (a2)
  {
    v9 = a2;
    __copyModelFromUarpNotificationName(a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_handleNotificationUarpStagingStatusForModel:state:", v10, __getStateForUarpNotificationName(a3));

  }
}

id __copyModelFromUarpNotificationName(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  if (a1)
  {
    v1 = (void *)MEMORY[0x24BDD14A8];
    v2 = a1;
    objc_msgSend(v1, "characterSetWithCharactersInString:", CFSTR("."));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "componentsSeparatedByCharactersInSet:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "lastObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "copy");

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

void sub_217251038(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_217251340(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void __IOAMUpdateBatteryState(void *a1, io_registry_entry_t entry)
{
  uint64_t v3;
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  BOOL v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  CFMutableDictionaryRef properties;

  properties = 0;
  v3 = IORegistryEntryCreateCFProperties(entry, &properties, 0, 0);
  v4 = a1;
  if (v4 && !(_DWORD)v3 && properties)
  {
    -[__CFDictionary objectForKey:](properties, "objectForKey:", CFSTR("MaxCapacity"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "intValue");

    if (!v6)
    {
      objc_msgSend(v4, "setBatteryChargeLevelPercent:", 0);
      goto LABEL_17;
    }
    -[__CFDictionary objectForKey:](properties, "objectForKey:", CFSTR("CurrentCapacity"));
    v7 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setBatteryChargeLevelPercent:", ((int)(100 * -[NSObject intValue](v7, "intValue")) / v6));
  }
  else
  {
    objc_msgSend(v4, "setBatteryChargeLevelPercent:", 0);
    if (gLogObjects)
      v8 = gNumLogObjects < 4;
    else
      v8 = 1;
    if (v8)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v7 = MEMORY[0x24BDACB70];
      v9 = MEMORY[0x24BDACB70];
    }
    else
    {
      v7 = *(id *)(gLogObjects + 24);
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __IOAMUpdateBatteryState_cold_1(v3, v7, v10, v11, v12, v13, v14, v15);
  }

LABEL_17:
  CFRelease(properties);

}

void __IOAMBatteryInterest(void *a1, io_registry_entry_t entry, int a3)
{
  if (a3 == -536723200)
    __IOAMUpdateBatteryState(a1, entry);
}

void OUTLINED_FUNCTION_3_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xEu);
}

void OUTLINED_FUNCTION_4_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 8u);
}

void OUTLINED_FUNCTION_8_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0xEu);
}

void OUTLINED_FUNCTION_10(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xEu);
}

void OUTLINED_FUNCTION_13(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

uint64_t OUTLINED_FUNCTION_16(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "ioService");
}

uint64_t OUTLINED_FUNCTION_18(void *a1, const char *a2)
{
  return objc_msgSend(a1, "ioService");
}

void OUTLINED_FUNCTION_24(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x16u);
}

void OUTLINED_FUNCTION_25(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x18u);
}

void OUTLINED_FUNCTION_26(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x18u);
}

uint64_t OUTLINED_FUNCTION_27(void *a1, const char *a2)
{
  return objc_msgSend(a1, "primaryPortNumber");
}

uint64_t OUTLINED_FUNCTION_31()
{
  void *v0;

  return objc_msgSend(v0, "ioServiceClassType");
}

uint64_t __isForcePassthroughIOAccessoryManagerPort()
{
  uint64_t result;
  CFIndex AppIntegerValue;

  result = __isForcePassthroughIOAccessoryManagerPort__forcePassthroughIOAccessoryManagerPort;
  if (__isForcePassthroughIOAccessoryManagerPort__forcePassthroughIOAccessoryManagerPort == -1)
  {
    AppIntegerValue = CFPreferencesGetAppIntegerValue(CFSTR("forcePassThroughIOAccessoryManagerPort"), CFSTR("com.apple.accessoryd"), 0);
    __isForcePassthroughIOAccessoryManagerPort__forcePassthroughIOAccessoryManagerPort = AppIntegerValue;
    NSLog(CFSTR("Read _forcePassthroughIOAccessoryManagerPort=%d"), AppIntegerValue);
    return __isForcePassthroughIOAccessoryManagerPort__forcePassthroughIOAccessoryManagerPort;
  }
  return result;
}

uint64_t EnableAccessoryPowerForPortService(io_service_t a1, int a2)
{
  uint64_t v4;
  uint64_t v5;
  BOOL v6;
  id v7;
  BOOL v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  id v13;
  io_connect_t connect;
  uint8_t buf[4];
  int v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  connect = 0;
  v4 = IOServiceOpen(a1, *MEMORY[0x24BDAEC58], 0, &connect);
  if ((_DWORD)v4)
  {
    v5 = v4;
    if (gLogObjects)
      v6 = gNumLogObjects < 2;
    else
      v6 = 1;
    if (v6)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v9 = MEMORY[0x24BDACB70];
      v7 = MEMORY[0x24BDACB70];
    }
    else
    {
      v9 = *(id *)(gLogObjects + 8);
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      EnableAccessoryPowerForPortService_cold_4();

  }
  else
  {
    if (a1)
    {
      while (IOAccessoryManagerGetUpstreamService())
        ;
      v8 = IOAccessoryManagerGetPrimaryPort() == 256;
    }
    else
    {
      v8 = 0;
    }
    v5 = 0;
    if (a2 == 1 && !v8)
    {
      if (gLogObjects && gNumLogObjects >= 2)
      {
        v10 = *(id *)(gLogObjects + 8);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
        v10 = MEMORY[0x24BDACB70];
        v11 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109376;
        v17 = 1;
        v18 = 1024;
        v19 = 1;
        _os_log_impl(&dword_21722C000, v10, OS_LOG_TYPE_DEFAULT, "turning acc power to %d on first run, off = %d", buf, 0xEu);
      }

      v5 = IOAccessoryManagerConfigurePower();
      if ((_DWORD)v5)
      {
        if (gLogObjects && gNumLogObjects >= 2)
        {
          v12 = *(id *)(gLogObjects + 8);
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
          v12 = MEMORY[0x24BDACB70];
          v13 = MEMORY[0x24BDACB70];
        }
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          EnableAccessoryPowerForPortService_cold_1();

      }
    }
    IOServiceClose(connect);
  }
  return v5;
}

id logObjectForModule_0(int a1)
{
  BOOL v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;

  if (gLogObjects)
    v1 = gNumLogObjects <= a1;
  else
    v1 = 1;
  if (v1)
  {
    v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v2)
      logObjectForModule_cold_1_0(v2, v3, v4, v5, v6, v7, v8, v9);
    v11 = (id)MEMORY[0x24BDACB70];
    v10 = MEMORY[0x24BDACB70];
  }
  else
  {
    v11 = *(id *)(gLogObjects + 8 * a1);
  }
  return v11;
}

void sub_217252984(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
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

void sub_217252E6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21725443C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_217254E94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_217255280(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

void sub_217255AA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_217255F80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21725B4C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21725C9E0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_2_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x12u);
}

void OUTLINED_FUNCTION_5_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x18u);
}

void OUTLINED_FUNCTION_7_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_8_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_9_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x12u);
}

void OUTLINED_FUNCTION_12_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_15_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 8u);
}

char *OUTLINED_FUNCTION_19_0(mach_error_t error_value)
{
  return mach_error_string(error_value);
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
    dispatch_once(&systemInfo_isInternalBuild_onceToken, &__block_literal_global_6);
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

void __IOAccessoryManagerAdded(void *a1, io_iterator_t a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  int PrimaryPort;
  uint64_t v8;
  int v9;
  BOOL v10;
  NSObject *v11;
  NSObject *v12;
  uint8_t buf[4];
  _BYTE v14[10];
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v4 = IOIteratorNext(a2);
  if ((_DWORD)v4)
  {
    v5 = v4;
    v6 = MEMORY[0x24BDACB70];
    do
    {
      PrimaryPort = IOAccessoryManagerGetPrimaryPort();
      v8 = gLogObjects;
      v9 = gNumLogObjects;
      if (gLogObjects)
        v10 = gNumLogObjects < 4;
      else
        v10 = 1;
      if (v10)
      {
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218240;
          *(_QWORD *)v14 = v8;
          *(_WORD *)&v14[8] = 1024;
          v15 = v9;
          _os_log_error_impl(&dword_21722C000, v6, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
        }
        v11 = v6;
        v12 = v6;
      }
      else
      {
        v12 = *(id *)(gLogObjects + 24);
      }
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)v14 = PrimaryPort;
        *(_WORD *)&v14[4] = 1024;
        *(_DWORD *)&v14[6] = v5;
        _os_log_impl(&dword_21722C000, v12, OS_LOG_TYPE_DEFAULT, "Connected manager with primary port type %d and service %d", buf, 0xEu);
      }

      objc_msgSend(v3, "_ioAccessoryManagerAttached:", v5);
      IOObjectRelease(v5);
      v5 = IOIteratorNext(a2);
    }
    while ((_DWORD)v5);
  }

}

void __IOAccessoryManagerTerminated(void *a1, io_iterator_t a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  BOOL v9;
  NSObject *v10;
  NSObject *v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v4 = IOIteratorNext(a2);
  if ((_DWORD)v4)
  {
    v5 = v4;
    v6 = MEMORY[0x24BDACB70];
    do
    {
      v7 = gLogObjects;
      v8 = gNumLogObjects;
      if (gLogObjects)
        v9 = gNumLogObjects < 4;
      else
        v9 = 1;
      if (v9)
      {
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218240;
          v13 = v7;
          v14 = 1024;
          v15 = v8;
          _os_log_error_impl(&dword_21722C000, v6, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
        }
        v10 = v6;
        v11 = v6;
      }
      else
      {
        v11 = *(id *)(gLogObjects + 24);
      }
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v13) = v5;
        _os_log_impl(&dword_21722C000, v11, OS_LOG_TYPE_DEFAULT, "Terminated manager with service %d", buf, 8u);
      }

      objc_msgSend(v3, "_ioAccessoryManagerTerminated:", v5);
      IOObjectRelease(v5);
      v5 = IOIteratorNext(a2);
    }
    while ((_DWORD)v5);
  }

}

void __IOAccessoryPortAdded(void *a1, io_iterator_t a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  int Port;
  int TransportType;
  uint64_t v9;
  int v10;
  BOOL v11;
  NSObject *v12;
  NSObject *v13;
  uint8_t buf[4];
  _BYTE v15[10];
  _DWORD v16[2];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v4 = IOIteratorNext(a2);
  if ((_DWORD)v4)
  {
    v5 = v4;
    v6 = MEMORY[0x24BDACB70];
    do
    {
      Port = IOAccessoryPortGetPort();
      TransportType = IOAccessoryPortGetTransportType();
      v9 = gLogObjects;
      v10 = gNumLogObjects;
      if (gLogObjects)
        v11 = gNumLogObjects < 5;
      else
        v11 = 1;
      if (v11)
      {
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218240;
          *(_QWORD *)v15 = v9;
          *(_WORD *)&v15[8] = 1024;
          v16[0] = v10;
          _os_log_error_impl(&dword_21722C000, v6, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
        }
        v12 = v6;
        v13 = v6;
      }
      else
      {
        v13 = *(id *)(gLogObjects + 32);
      }
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109632;
        *(_DWORD *)v15 = Port;
        *(_WORD *)&v15[4] = 1024;
        *(_DWORD *)&v15[6] = TransportType;
        LOWORD(v16[0]) = 1024;
        *(_DWORD *)((char *)v16 + 2) = v5;
        _os_log_impl(&dword_21722C000, v13, OS_LOG_TYPE_DEFAULT, "Connected port with port number %d, type %d and service %d", buf, 0x14u);
      }

      objc_msgSend(v3, "_ioAccessoryPortAttached:", v5);
      IOObjectRelease(v5);
      v5 = IOIteratorNext(a2);
    }
    while ((_DWORD)v5);
  }

}

void __IOAccessoryPortTerminated(void *a1, io_iterator_t a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  BOOL v9;
  NSObject *v10;
  NSObject *v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v4 = IOIteratorNext(a2);
  if ((_DWORD)v4)
  {
    v5 = v4;
    v6 = MEMORY[0x24BDACB70];
    do
    {
      v7 = gLogObjects;
      v8 = gNumLogObjects;
      if (gLogObjects)
        v9 = gNumLogObjects < 5;
      else
        v9 = 1;
      if (v9)
      {
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218240;
          v13 = v7;
          v14 = 1024;
          v15 = v8;
          _os_log_error_impl(&dword_21722C000, v6, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
        }
        v10 = v6;
        v11 = v6;
      }
      else
      {
        v11 = *(id *)(gLogObjects + 32);
      }
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v13) = v5;
        _os_log_impl(&dword_21722C000, v11, OS_LOG_TYPE_DEFAULT, "Terminated port with service %d", buf, 8u);
      }

      objc_msgSend(v3, "_ioAccessoryPortTerminated:", v5);
      IOObjectRelease(v5);
      v5 = IOIteratorNext(a2);
    }
    while ((_DWORD)v5);
  }

}

void __IOAccessoryAuthCPAdded(void *a1, io_iterator_t a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  BOOL v9;
  NSObject *v10;
  NSObject *v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v4 = IOIteratorNext(a2);
  if ((_DWORD)v4)
  {
    v5 = v4;
    v6 = MEMORY[0x24BDACB70];
    do
    {
      v7 = gLogObjects;
      v8 = gNumLogObjects;
      if (gLogObjects)
        v9 = gNumLogObjects < 7;
      else
        v9 = 1;
      if (v9)
      {
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218240;
          v13 = v7;
          v14 = 1024;
          v15 = v8;
          _os_log_error_impl(&dword_21722C000, v6, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
        }
        v10 = v6;
        v11 = v6;
      }
      else
      {
        v11 = *(id *)(gLogObjects + 48);
      }
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v13) = v5;
        _os_log_impl(&dword_21722C000, v11, OS_LOG_TYPE_DEFAULT, "Connected auth CP with service %d", buf, 8u);
      }

      objc_msgSend(v3, "_ioAccessoryAuthCPAttached:", v5);
      IOObjectRelease(v5);
      v5 = IOIteratorNext(a2);
    }
    while ((_DWORD)v5);
  }

}

void __IOAccessoryAuthCPTerminated(void *a1, io_iterator_t a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  BOOL v9;
  NSObject *v10;
  NSObject *v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v4 = IOIteratorNext(a2);
  if ((_DWORD)v4)
  {
    v5 = v4;
    v6 = MEMORY[0x24BDACB70];
    do
    {
      v7 = gLogObjects;
      v8 = gNumLogObjects;
      if (gLogObjects)
        v9 = gNumLogObjects < 7;
      else
        v9 = 1;
      if (v9)
      {
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218240;
          v13 = v7;
          v14 = 1024;
          v15 = v8;
          _os_log_error_impl(&dword_21722C000, v6, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
        }
        v10 = v6;
        v11 = v6;
      }
      else
      {
        v11 = *(id *)(gLogObjects + 48);
      }
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v13) = v5;
        _os_log_impl(&dword_21722C000, v11, OS_LOG_TYPE_DEFAULT, "Terminated auth CP with service %d", buf, 8u);
      }

      objc_msgSend(v3, "_ioAccessoryAuthCPTerminated:", v5);
      IOObjectRelease(v5);
      v5 = IOIteratorNext(a2);
    }
    while ((_DWORD)v5);
  }

}

void __IOAccessoryEAAdded(void *a1, io_iterator_t a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  BOOL v9;
  NSObject *v10;
  NSObject *v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v4 = IOIteratorNext(a2);
  if ((_DWORD)v4)
  {
    v5 = v4;
    v6 = MEMORY[0x24BDACB70];
    do
    {
      v7 = gLogObjects;
      v8 = gNumLogObjects;
      if (gLogObjects)
        v9 = gNumLogObjects < 6;
      else
        v9 = 1;
      if (v9)
      {
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218240;
          v13 = v7;
          v14 = 1024;
          v15 = v8;
          _os_log_error_impl(&dword_21722C000, v6, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
        }
        v10 = v6;
        v11 = v6;
      }
      else
      {
        v11 = *(id *)(gLogObjects + 40);
      }
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v13) = v5;
        _os_log_impl(&dword_21722C000, v11, OS_LOG_TYPE_DEFAULT, "Connected EA service with service %d", buf, 8u);
      }

      objc_msgSend(v3, "_ioAccessoryEAAttached:", v5);
      IOObjectRelease(v5);
      v5 = IOIteratorNext(a2);
    }
    while ((_DWORD)v5);
  }

}

void __IOAccessoryEATerminated(void *a1, io_iterator_t a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  BOOL v9;
  NSObject *v10;
  NSObject *v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v4 = IOIteratorNext(a2);
  if ((_DWORD)v4)
  {
    v5 = v4;
    v6 = MEMORY[0x24BDACB70];
    do
    {
      v7 = gLogObjects;
      v8 = gNumLogObjects;
      if (gLogObjects)
        v9 = gNumLogObjects < 6;
      else
        v9 = 1;
      if (v9)
      {
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218240;
          v13 = v7;
          v14 = 1024;
          v15 = v8;
          _os_log_error_impl(&dword_21722C000, v6, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
        }
        v10 = v6;
        v11 = v6;
      }
      else
      {
        v11 = *(id *)(gLogObjects + 40);
      }
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v13) = v5;
        _os_log_impl(&dword_21722C000, v11, OS_LOG_TYPE_DEFAULT, "Terminated EA service with service %d", buf, 8u);
      }

      objc_msgSend(v3, "_ioAccessoryEATerminated:", v5);
      IOObjectRelease(v5);
      v5 = IOIteratorNext(a2);
    }
    while ((_DWORD)v5);
  }

}

void __IOAccessoryOOBPairingAdded(void *a1, io_iterator_t a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  BOOL v9;
  NSObject *v10;
  NSObject *v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v4 = IOIteratorNext(a2);
  if ((_DWORD)v4)
  {
    v5 = v4;
    v6 = MEMORY[0x24BDACB70];
    do
    {
      v7 = gLogObjects;
      v8 = gNumLogObjects;
      if (gLogObjects)
        v9 = gNumLogObjects < 8;
      else
        v9 = 1;
      if (v9)
      {
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218240;
          v13 = v7;
          v14 = 1024;
          v15 = v8;
          _os_log_error_impl(&dword_21722C000, v6, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
        }
        v10 = v6;
        v11 = v6;
      }
      else
      {
        v11 = *(id *)(gLogObjects + 56);
      }
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v13) = v5;
        _os_log_impl(&dword_21722C000, v11, OS_LOG_TYPE_DEFAULT, "Connected OOBPairing service with service %d", buf, 8u);
      }

      objc_msgSend(v3, "_ioAccessoryOOBPairingAttached:", v5);
      IOObjectRelease(v5);
      v5 = IOIteratorNext(a2);
    }
    while ((_DWORD)v5);
  }

}

void __IOAccessoryOOBPairingTerminated(void *a1, io_iterator_t a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  BOOL v9;
  NSObject *v10;
  NSObject *v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v4 = IOIteratorNext(a2);
  if ((_DWORD)v4)
  {
    v5 = v4;
    v6 = MEMORY[0x24BDACB70];
    do
    {
      v7 = gLogObjects;
      v8 = gNumLogObjects;
      if (gLogObjects)
        v9 = gNumLogObjects < 8;
      else
        v9 = 1;
      if (v9)
      {
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218240;
          v13 = v7;
          v14 = 1024;
          v15 = v8;
          _os_log_error_impl(&dword_21722C000, v6, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
        }
        v10 = v6;
        v11 = v6;
      }
      else
      {
        v11 = *(id *)(gLogObjects + 56);
      }
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v13) = v5;
        _os_log_impl(&dword_21722C000, v11, OS_LOG_TYPE_DEFAULT, "Terminated OOBPairing service with service %d", buf, 8u);
      }

      objc_msgSend(v3, "_ioAccessoryOOBPairingTerminated:", v5);
      IOObjectRelease(v5);
      v5 = IOIteratorNext(a2);
    }
    while ((_DWORD)v5);
  }

}

void __IOAccessoryConfigStreamAdded(void *a1, io_iterator_t a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  BOOL v9;
  NSObject *v10;
  NSObject *v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v4 = IOIteratorNext(a2);
  if ((_DWORD)v4)
  {
    v5 = v4;
    v6 = MEMORY[0x24BDACB70];
    do
    {
      v7 = gLogObjects;
      v8 = gNumLogObjects;
      if (gLogObjects)
        v9 = gNumLogObjects < 10;
      else
        v9 = 1;
      if (v9)
      {
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218240;
          v13 = v7;
          v14 = 1024;
          v15 = v8;
          _os_log_error_impl(&dword_21722C000, v6, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
        }
        v10 = v6;
        v11 = v6;
      }
      else
      {
        v11 = *(id *)(gLogObjects + 72);
      }
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v13) = v5;
        _os_log_impl(&dword_21722C000, v11, OS_LOG_TYPE_DEFAULT, "Connected ConfigStream service with service %d", buf, 8u);
      }

      objc_msgSend(v3, "_ioAccessoryConfigStreamAttached:", v5);
      IOObjectRelease(v5);
      v5 = IOIteratorNext(a2);
    }
    while ((_DWORD)v5);
  }

}

void __IOAccessoryConfigStreamTerminated(void *a1, io_iterator_t a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  BOOL v9;
  NSObject *v10;
  NSObject *v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v4 = IOIteratorNext(a2);
  if ((_DWORD)v4)
  {
    v5 = v4;
    v6 = MEMORY[0x24BDACB70];
    do
    {
      v7 = gLogObjects;
      v8 = gNumLogObjects;
      if (gLogObjects)
        v9 = gNumLogObjects < 10;
      else
        v9 = 1;
      if (v9)
      {
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218240;
          v13 = v7;
          v14 = 1024;
          v15 = v8;
          _os_log_error_impl(&dword_21722C000, v6, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
        }
        v10 = v6;
        v11 = v6;
      }
      else
      {
        v11 = *(id *)(gLogObjects + 72);
      }
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v13) = v5;
        _os_log_impl(&dword_21722C000, v11, OS_LOG_TYPE_DEFAULT, "Terminated ConfigStream service with service %d", buf, 8u);
      }

      objc_msgSend(v3, "_ioAccessoryConfigStreamTerminated:", v5);
      IOObjectRelease(v5);
      v5 = IOIteratorNext(a2);
    }
    while ((_DWORD)v5);
  }

}

void loadFrontBoard()
{
  void *v0;

  if (!_FBSOpenApplicationOptionKeyPromptUnlockDevice)
  {
    v0 = dlopen("/System/Library/PrivateFrameworks/FrontBoardServices.framework/FrontBoardServices", 4);
    if (v0)
      _FBSOpenApplicationOptionKeyPromptUnlockDevice = (uint64_t)dlsym(v0, "FBSOpenApplicationOptionKeyPromptUnlockDevice");
  }
}

void acc_tapToRadar_authFailure()
{
  _acc_tapToRadar_authFailure(0);
}

void _acc_tapToRadar_authFailure(int a1)
{
  void *v2;
  const char *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (a1)
    v3 = "Accessory Authentication Timeout Detected!\n\n";
  else
    v3 = "Accessory Authentication Failure Detected!\n\n";
  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithUTF8String:", v3);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "appendString:", CFSTR("• What kind of accessory was connected?  \n\n"));
  objc_msgSend(v14, "appendString:", CFSTR("• What is the build phase of the accessory? (e.g. evt) \n\n"));
  objc_msgSend(v14, "appendString:", CFSTR("• Was the device asleep when the accessory was connected? \n\n"));
  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithString:", CFSTR("tap-to-radar://new?ComponentName=CoreAccessories&ComponentVersion=TTR&ComponentID=941369&Classification=Other Bug&Reproducibility=Not Applicable&"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("Description=%@&"), v14);
  v5 = (void *)MEMORY[0x24BDBCF48];
  objc_msgSend(MEMORY[0x24BDD14A8], "URLQueryAllowedCharacterSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAddingPercentEncodingWithAllowedCharacters:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLWithString:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  loadFrontBoard();
  if (!_FBSOpenApplicationOptionKeyPromptUnlockDevice)
  {
    objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "openURL:", v8);
    goto LABEL_8;
  }
  v9 = objc_alloc(MEMORY[0x24BDD17C8]);
  v10 = objc_msgSend(v9, "initWithBytes:length:encoding:", _FBSOpenApplicationOptionKeyPromptUnlockDevice, 8, 1);
  if (v10)
  {
    v11 = (void *)v10;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKey:", v12, v11);

    objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "openSensitiveURL:withOptions:", v8, v2);

LABEL_8:
  }

}

void acc_tapToRadar_authTimeout()
{
  _acc_tapToRadar_authFailure(1);
}

void acc_tapToRadar_InitiateAuthFailureTTR()
{
  NSObject *v0;

  if (MFAAIsInternalBuild()
    && (platform_systemInfo_isWatch() & 1) == 0
    && (acc_tapToRadar_InitiateAuthFailureTTR_isAlertPending & 1) == 0)
  {
    acc_tapToRadar_InitiateAuthFailureTTR_isAlertPending = 1;
    dispatch_get_global_queue(0, 0);
    v0 = objc_claimAutoreleasedReturnValue();
    dispatch_async(v0, &__block_literal_global_7);

  }
}

void acc_tapToRadar_InitiateAuthTimeoutTTR()
{
  NSObject *v0;

  if (MFAAIsInternalBuild()
    && (platform_systemInfo_isWatch() & 1) == 0
    && (acc_tapToRadar_InitiateAuthTimeoutTTR_isAlertPending & 1) == 0)
  {
    acc_tapToRadar_InitiateAuthTimeoutTTR_isAlertPending = 1;
    dispatch_get_global_queue(0, 0);
    v0 = objc_claimAutoreleasedReturnValue();
    dispatch_async(v0, &__block_literal_global_8);

  }
}

void sub_217269274(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 88), 8);
  _Unwind_Resume(a1);
}

uint64_t __receivedNotification(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "update");
}

void __EASessionReceiveCallback(void *a1, uint64_t a2)
{
  id v3;
  BOOL v4;
  int v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  int v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  if (gLogObjects)
    v4 = gNumLogObjects <= 5;
  else
    v4 = 1;
  v5 = !v4;
  if ((_DWORD)a2)
  {
    if (v5)
    {
      v6 = *(id *)(gLogObjects + 40);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v6 = MEMORY[0x24BDACB70];
      v8 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __EASessionReceiveCallback_cold_4(a2, v6, v9, v10, v11, v12, v13, v14);
LABEL_31:

    goto LABEL_32;
  }
  if (v5)
  {
    v7 = *(id *)(gLogObjects + 40);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
    v7 = MEMORY[0x24BDACB70];
    v15 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v3, "eaProtocol");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138412290;
    v19 = v16;
    _os_log_impl(&dword_21722C000, v7, OS_LOG_TYPE_INFO, "Incoming EA session data for protocol %@", (uint8_t *)&v18, 0xCu);

  }
  if ((objc_msgSend(v3, "_handleIncomingEAData") & 1) == 0)
  {
    if (gLogObjects && gNumLogObjects >= 6)
    {
      v6 = *(id *)(gLogObjects + 40);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v6 = MEMORY[0x24BDACB70];
      v17 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __EASessionReceiveCallback_cold_1(v3);
    goto LABEL_31;
  }
LABEL_32:

}

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
  v2 = &off_21728F000;
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
          _os_log_error_impl(&dword_21722C000, v6, OS_LOG_TYPE_ERROR, "Subsystem missing for logging module %d!\n(Check LoggingSignpostModuleEntry_t table)", buf, 8u);
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
          _os_log_debug_impl(&dword_21722C000, v6, OS_LOG_TYPE_DEBUG, "Created log object %s: %s", buf, 0x16u);
        }
      }
      else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v13 = v8;
        v14 = 2080;
        v15 = v9;
        _os_log_error_impl(&dword_21722C000, v6, OS_LOG_TYPE_ERROR, "Failed to create os_log_t object %s: %s!", buf, 0x16u);
      }
      ++v4;
      v11 = *(unsigned __int8 *)(a1 + 48);
      v3 += 16;
    }
    while (v4 < v11);
    v2 = &off_21728F000;
  }
  else
  {
    LODWORD(v11) = 0;
    v5 = 0;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = *((_QWORD *)v2 + 34);
    LODWORD(v13) = v5;
    _os_log_impl(&dword_21722C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Created %d log object(s)!", buf, 8u);
    LODWORD(v11) = *(unsigned __int8 *)(a1 + 48);
  }
  gLogSignpostObjects = *(_QWORD *)(a1 + 40);
  gNumLogSignpostObjects = v11;
}

_OWORD *getDEVNTempCertCapsForCable()
{
  _OWORD *v0;
  _OWORD *v1;
  BOOL v2;
  id v3;
  NSObject *v4;

  v0 = malloc_type_malloc(0x20uLL, 0x1000040E0EAB150uLL);
  v1 = v0;
  if (v0)
  {
    *v0 = getDEVNTempCertCapsForCable_kDEVNTempCertCapsForCable;
    v0[1] = unk_21728F360;
  }
  else
  {
    if (gLogObjects)
      v2 = gNumLogObjects < 7;
    else
      v2 = 1;
    if (v2)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v4 = MEMORY[0x24BDACB70];
      v3 = MEMORY[0x24BDACB70];
    }
    else
    {
      v4 = *(id *)(gLogObjects + 48);
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      getDEVNTempCertCapsForCable_cold_1();

  }
  return v1;
}

id logObjectForModule_1(int a1)
{
  BOOL v1;
  id v2;
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  if (a1 < 0 || (gLogObjects ? (v1 = gNumLogObjects <= a1) : (v1 = 1), v1))
  {
    if (a1 != -1)
    {
      v3 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v3)
        logObjectForModule_cold_1_0(v3, v4, v5, v6, v7, v8, v9, v10);
    }
    v2 = (id)MEMORY[0x24BDACB70];
    v11 = MEMORY[0x24BDACB70];
  }
  else
  {
    v2 = *(id *)(gLogObjects + 8 * a1);
  }
  return v2;
}

BOOL enhanced_apfs_enabled()
{
  io_registry_entry_t v0;
  io_object_t v1;
  CFTypeRef CFProperty;
  _BOOL8 v3;

  v0 = IORegistryEntryFromPath(*MEMORY[0x24BDD8B20], "IODeviceTree:/filesystems");
  if (!v0)
    return 0;
  v1 = v0;
  CFProperty = IORegistryEntryCreateCFProperty(v0, CFSTR("e-apfs"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
  v3 = CFProperty != 0;
  if (CFProperty)
    CFRelease(CFProperty);
  IOObjectRelease(v1);
  return v3;
}

void AuthCPNotifyEvent(void *a1, uint64_t a2, int a3)
{
  id v3;
  BOOL v4;
  id v5;
  NSObject *v6;
  _DWORD v7[2];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (a3 == -469794816)
  {
    v3 = a1;
    objc_msgSend(v3, "setForcedReAuthCount:", objc_msgSend(v3, "forcedReAuthCount") + 1);
    if (gLogObjects)
      v4 = gNumLogObjects < 7;
    else
      v4 = 1;
    if (v4)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v6 = MEMORY[0x24BDACB70];
      v5 = MEMORY[0x24BDACB70];
    }
    else
    {
      v6 = *(id *)(gLogObjects + 48);
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7[0] = 67109120;
      v7[1] = objc_msgSend(v3, "forcedReAuthCount");
      _os_log_impl(&dword_21722C000, v6, OS_LOG_TYPE_DEFAULT, "kAppleAuthCPMessageNewAuthRequested received.  Re-Starting authentication process.  ForcedReAuthCount: %d", (uint8_t *)v7, 8u);
    }

    objc_msgSend(v3, "startAuthenticationProcess");
  }
}

const char *_getAuthErrorString(unsigned int a1)
{
  if (a1 > 0x1D)
    return "UninitializedAuthError";
  else
    return kACCTransport_IOAccessoryAuthCP_AuthError_Strings[a1];
}

const char *_getFDRStatusString(unsigned int a1)
{
  if (a1 > 2)
    return "AuthSuccess";
  else
    return kACCTransport_IOAccessoryAuthCP_FDRStatus_Strings[a1];
}

BOOL _checkSpringBoardStarted()
{
  _BOOL8 v0;
  uint64_t v2;
  int out_token;

  out_token = -1;
  notify_register_check("com.apple.springboard.finishedstartup", &out_token);
  if (out_token == -1)
    return 0;
  v2 = 0;
  notify_get_state(out_token, &v2);
  v0 = v2 != 0;
  notify_cancel(out_token);
  return v0;
}

uint64_t prefetchDeviceIdentityCertificates()
{
  const __CFString *v0;
  int v1;
  int v2;
  const __CFNumber *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  uint64_t valuePtr;
  uint8_t buf[4];
  int v14;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x24BDAC8D0];
  valuePtr = 4;
  if (prefetchDeviceIdentityCertificates_needsPreArm
    && (v0 = (const __CFString *)systemInfo_copyProductType(),
        v1 = acc_policies_productTypeNeedsPreArmDeviceIdentity(v0),
        prefetchDeviceIdentityCertificates_needsPreArm = v1,
        v1)
    && (v2 = acc_policies_deviceNeedsPreArmDeviceIdentity(), prefetchDeviceIdentityCertificates_needsPreArm = v2, v2))
  {
    v3 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberSInt64Type, &valuePtr);
    v4 = (void *)MEMORY[0x24BDBCED8];
    v15[0] = CFSTR("Count");
    v15[1] = CFSTR("RefreshInterval");
    v16[0] = v3;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", 86400.0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v16[1] = v5;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryWithDictionary:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = MFAADeviceIdentityCopyCertificate();
    if (gLogObjects && gNumLogObjects >= 7)
    {
      v9 = *(id *)(gLogObjects + 48);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
      v9 = MEMORY[0x24BDACB70];
      v10 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v14 = v8;
      _os_log_impl(&dword_21722C000, v9, OS_LOG_TYPE_DEFAULT, "Test DeviceIdentity: MFAADeviceIdentityCopyCertificate completed: %d\n", buf, 8u);
    }

  }
  else
  {
    v7 = 0;
    v3 = 0;
    v8 = 1;
  }

  return v8;
}

void __transportInterest(void *a1, io_registry_entry_t a2, int a3)
{
  BOOL v6;
  id v7;
  NSObject *v8;
  id v9;
  CFTypeRef CFProperty;
  CFTypeID v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  uint8_t v15[16];
  uint8_t buf[16];

  if (gLogObjects)
    v6 = gNumLogObjects < 7;
  else
    v6 = 1;
  if (v6)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
    v8 = MEMORY[0x24BDACB70];
    v7 = MEMORY[0x24BDACB70];
  }
  else
  {
    v8 = *(id *)(gLogObjects + 48);
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21722C000, v8, OS_LOG_TYPE_DEFAULT, "__transportInterest", buf, 2u);
  }

  v9 = a1;
  if (a3 == -536870608)
  {
    CFProperty = IORegistryEntryCreateCFProperty(a2, CFSTR("ActualPairedCertSN"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
    if (CFProperty)
    {
      v11 = CFGetTypeID(CFProperty);
      if (v11 == CFStringGetTypeID())
      {
        if (gLogObjects && gNumLogObjects >= 7)
        {
          v12 = *(id *)(gLogObjects + 48);
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
          v12 = MEMORY[0x24BDACB70];
          v13 = MEMORY[0x24BDACB70];
        }
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v15 = 0;
          _os_log_impl(&dword_21722C000, v12, OS_LOG_TYPE_DEFAULT, "__transportInterest: found ActualPairedCertSN", v15, 2u);
        }

        objc_msgSend(v9, "pairedSema");
        v14 = objc_claimAutoreleasedReturnValue();
        dispatch_semaphore_signal(v14);

      }
    }
  }

}

uint64_t __powerBatteryMatch(IONotificationPort **a1, io_iterator_t iterator)
{
  IONotificationPort *v3;
  uint64_t result;
  io_registry_entry_t v5;
  io_object_t notification;

  v3 = *a1;
  notification = -1431655766;
  result = IOIteratorNext(iterator);
  if ((_DWORD)result)
  {
    v5 = result;
    do
    {
      __powerUpdateBatteryState(v5);
      IOServiceAddInterestNotification(v3, v5, "IOGeneralInterest", (IOServiceInterestCallback)__powerBatteryInterest, 0, &notification);
      IOObjectRelease(v5);
      result = IOIteratorNext(iterator);
      v5 = result;
    }
    while ((_DWORD)result);
  }
  return result;
}

void sub_21726F7CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose(&a35, 8);
  _Unwind_Resume(a1);
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

void sub_217270358(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_5_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_9_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
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
  v2 = &off_21728F000;
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
          _os_log_error_impl(&dword_21722C000, v6, OS_LOG_TYPE_ERROR, "Subsystem missing for logging module %d!\n(Check LoggingModuleEntry_t table)", buf, 8u);
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
          _os_log_debug_impl(&dword_21722C000, v6, OS_LOG_TYPE_DEBUG, "Created log object %s: %s", buf, 0x16u);
        }
      }
      else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v13 = v8;
        v14 = 2080;
        v15 = v9;
        _os_log_error_impl(&dword_21722C000, v6, OS_LOG_TYPE_ERROR, "Failed to create os_log_t object %s: %s!", buf, 0x16u);
      }
      ++v4;
      v11 = *(unsigned __int8 *)(a1 + 48);
      v3 += 16;
    }
    while (v4 < v11);
    v2 = &off_21728F000;
  }
  else
  {
    LODWORD(v11) = 0;
    v5 = 0;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = *((_QWORD *)v2 + 34);
    LODWORD(v13) = v5;
    _os_log_impl(&dword_21722C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Created %d log object(s)!", buf, 8u);
    LODWORD(v11) = *(unsigned __int8 *)(a1 + 48);
  }
  gLogObjects = *(_QWORD *)(a1 + 40);
  gNumLogObjects = v11;
}

uint64_t acm_explicit_bzero(void *a1, rsize_t __n)
{
  return memset_s(a1, __n, 0, __n);
}

uint64_t acm_get_mem()
{
  return _allocatedMem_0;
}

void *acm_mem_alloc_data(size_t size)
{
  void *result;

  result = malloc_type_calloc(1uLL, size, 0xCB62F0E9uLL);
  if (result)
    _allocatedMem_2 += size;
  return result;
}

void acm_mem_free_data(void *a1, rsize_t __n)
{
  uint64_t v4;

  if (a1)
  {
    memset_s(a1, __n, 0, __n);
    free(a1);
    v4 = _allocatedMem_2 - __n;
    if (_allocatedMem_2 < __n)
      v4 = 0;
    _allocatedMem_2 = v4;
  }
}

void *acm_mem_alloc(size_t size)
{
  void *result;

  result = malloc_type_calloc(1uLL, size, 0xDB9956F0uLL);
  if (result)
    _allocatedMem_3 += size;
  return result;
}

void acm_mem_free(void *a1, rsize_t __n)
{
  uint64_t v4;

  if (a1)
  {
    memset_s(a1, __n, 0, __n);
    free(a1);
    v4 = _allocatedMem_3 - __n;
    if (_allocatedMem_3 < __n)
      v4 = 0;
    _allocatedMem_3 = v4;
  }
}

const char *acm_mem_alloc_info(const char *result, const void *a2, uint64_t a3, const char *a4, int a5, const char *a6)
{
  const char *v6;
  const char *v7;
  const char *v8;

  if (a2)
    _allocatedMem_0 += a3;
  if (gACMLoggingLevel <= 0x1Eu)
  {
    v6 = "NULL";
    if (result)
      v7 = result;
    else
      v7 = "NULL";
    if (a4)
      v8 = a4;
    else
      v8 = "NULL";
    if (a6)
      v6 = a6;
    return (const char *)printf("%s: %s: mem: type=%s ptr=%p size=%u (total=%u raw=%u data=%u types=%u) %s:%d (%s).\n", "ACM", "acm_mem_alloc_info", v7, a2, a3, _allocatedMem_0, 0, _allocatedMem_2, _allocatedMem_3, v8, a5, v6);
  }
  return result;
}

const char *acm_mem_free_info(const char *result, const void *a2, unint64_t a3, const char *a4, int a5, const char *a6)
{
  uint64_t v6;
  const char *v7;
  const char *v8;
  const char *v9;

  if (a2)
  {
    v6 = _allocatedMem_0 - a3;
    if (_allocatedMem_0 < a3)
      v6 = 0;
    _allocatedMem_0 = v6;
  }
  if (gACMLoggingLevel <= 0x1Eu)
  {
    v7 = "NULL";
    if (result)
      v8 = result;
    else
      v8 = "NULL";
    if (a4)
      v9 = a4;
    else
      v9 = "NULL";
    if (a6)
      v7 = a6;
    return (const char *)printf("%s: %s: mem: type=%s ptr=%p size=%u (total=%u raw=%u data=%u types=%u) %s:%d (%s).\n", "ACM", "acm_mem_free_info", v8, a2, a3, _allocatedMem_0, 0, _allocatedMem_2, _allocatedMem_3, v9, a5, v7);
  }
  return result;
}

uint64_t GetSerializedVerifyPolicySize(uint64_t a1, char *__s1, uint64_t a3, uint64_t a4, _DWORD *a5, unsigned int a6, _QWORD *a7)
{
  uint64_t result;
  size_t v12;
  size_t v13;
  unsigned int v14;

  v14 = 0;
  result = 4294967293;
  if (a1 && __s1 && a7)
  {
    v12 = strnlen(__s1, 0x81uLL);
    if (v12 > 0x80)
    {
      return 4294967293;
    }
    else
    {
      v13 = v12;
      result = getLengthOfParameters(a5, a6, &v14);
      if (!(_DWORD)result)
        *a7 = v13 + v14 + 26;
    }
  }
  return result;
}

uint64_t getLengthOfParameters(_DWORD *a1, unsigned int a2, _DWORD *a3)
{
  int v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  int v10;
  uint64_t v11;
  unsigned int v12;

  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "getLengthOfParameters");
  if (a3)
  {
    *a3 = 0;
    v6 = 0;
    if (a2)
    {
      v7 = a2;
      while (1)
      {
        v8 = checkParameter(a1);
        if ((_DWORD)v8)
          break;
        v9 = v6 + 8;
        v10 = a1[4];
        v6 += v10 + 8;
        if (__CFADD__(v10, v9))
          goto LABEL_10;
        a1 += 6;
        if (!--v7)
          goto LABEL_9;
      }
      v11 = v8;
      v12 = 70;
    }
    else
    {
LABEL_9:
      v11 = 0;
      *a3 = v6;
      v12 = 10;
    }
  }
  else
  {
LABEL_10:
    v12 = 70;
    v11 = 4294967293;
  }
  if (v12 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "getLengthOfParameters", (int)v11);
  return v11;
}

uint64_t SerializeVerifyPolicy(_OWORD *a1, char *__s1, char a3, uint64_t a4, _DWORD *a5, unsigned int a6, _OWORD *a7, size_t *a8)
{
  uint64_t result;
  int v15;
  size_t v17;
  size_t v18;
  char *v19;
  size_t v20;
  unint64_t v21;

  v21 = 0;
  result = 4294967293;
  if (a1)
  {
    if (__s1)
    {
      if (a8)
      {
        if (a7)
        {
          if (a6 <= 0xA && (a5 != 0) == (a6 != 0))
          {
            v15 = a4;
            result = GetSerializedVerifyPolicySize((uint64_t)a1, __s1, 0, a4, a5, a6, &v21);
            if (!(_DWORD)result)
            {
              if (*a8 < v21)
                return 4294967293;
              *a7 = *a1;
              v17 = strnlen(__s1, 0x81uLL);
              if (v17 > 0x80)
              {
                return 4294967293;
              }
              else
              {
                v18 = v17;
                memcpy(a7 + 1, __s1, v17 + 1);
                v19 = (char *)a7 + v18;
                v19[17] = a3;
                *(_DWORD *)(v19 + 18) = v15;
                v20 = v18 + 22;
                result = serializeParameters((uint64_t)a5, a6, (uint64_t)a7, (uint64_t *)&v20);
                if (!(_DWORD)result)
                  *a8 = v20;
              }
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t serializeParameters(uint64_t a1, int a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v6;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _DWORD *v13;
  size_t v14;
  void *__src[2];
  size_t __n;

  LODWORD(v6) = a2;
  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "serializeParameters");
  v8 = 70;
  v9 = 4294967293;
  if (a3 && a4)
  {
    v10 = *a4;
    *(_DWORD *)(a3 + v10) = v6;
    v11 = v10 + 4;
    if ((_DWORD)v6)
    {
      v6 = v6;
      while (1)
      {
        *(_OWORD *)__src = *(_OWORD *)a1;
        __n = *(_QWORD *)(a1 + 16);
        v12 = checkParameter(__src);
        if ((_DWORD)v12)
          break;
        v13 = (_DWORD *)(a3 + v11);
        v14 = __n;
        *v13 = __src[0];
        v13[1] = v14;
        v11 += 8;
        if ((_DWORD)v14)
        {
          memcpy((void *)(a3 + v11), __src[1], v14);
          v11 += v14;
        }
        a1 += 24;
        if (!--v6)
          goto LABEL_11;
      }
      v9 = v12;
      v8 = 70;
    }
    else
    {
LABEL_11:
      v9 = 0;
      *a4 = v11;
      v8 = 10;
    }
  }
  if (v8 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "serializeParameters", (int)v9);
  return v9;
}

uint64_t DeserializeVerifyPolicy(uint64_t a1, unint64_t a2, _OWORD *a3, _QWORD *a4, BOOL *a5, _DWORD *a6, _QWORD *a7, _DWORD *a8)
{
  uint64_t v8;
  unint64_t v9;
  unint64_t v17;
  unint64_t v18;
  void *v19;
  BOOL *v20;
  BOOL v21;
  _DWORD *v22;
  int v23;
  unint64_t v25;
  _QWORD *v26;
  unsigned int v27;
  unsigned int *v28;
  unint64_t v29;

  v28 = 0;
  v27 = 0;
  v8 = 4294967293;
  v9 = a2 - 16;
  if (a2 >= 0x10 && a1 && a3 && a4 && a5 && a6 && a7 && a8)
  {
    *a3 = *(_OWORD *)a1;
    v17 = strnlen((const char *)(a1 + 16), a2 - 16);
    if (v17 > 0x80 || v9 <= v17)
      return 4294967293;
    v26 = a4;
    v18 = v17 + 1;
    v19 = acm_mem_alloc_data(v17 + 1);
    acm_mem_alloc_info("<data>", v19, v17 + 1, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibSerialization.c", 349, "DeserializeVerifyPolicy");
    if (!v19)
      return 4294967292;
    memcpy(v19, (const void *)(a1 + 16), v17 + 1);
    v29 = v17 + 17;
    if (v17 + 17 == a2 || (v20 = a5, v21 = *(_BYTE *)(a1 + v17 + 17) != 0, v29 = v17 + 18, a2 - (v17 + 18) < 4))
    {
      v8 = 4294967293;
    }
    else
    {
      v25 = v17 + 1;
      v22 = a8;
      v23 = *(_DWORD *)(a1 + v17 + 18);
      v29 = v17 + 22;
      v8 = deserializeParameters(a1, a2, &v29, &v28, &v27);
      if (!(_DWORD)v8)
      {
        *v26 = v19;
        *v20 = v21;
        *a6 = v23;
        *a7 = v28;
        *v22 = v27;
        return v8;
      }
      v18 = v25;
    }
    acm_mem_free_info("<data>", v19, v18, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibSerialization.c", 378, "DeserializeVerifyPolicy");
    acm_mem_free_data(v19, v18);
    if (v28)
      Util_SafeDeallocParameters(v28, v27);
  }
  return v8;
}

uint64_t deserializeParameters(uint64_t a1, unint64_t a2, unint64_t *a3, _QWORD *a4, _DWORD *a5)
{
  unint64_t v10;
  unsigned int v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  char *v19;
  size_t v20;
  uint64_t v21;
  void *v22;
  _QWORD *v24;
  _DWORD *v25;
  unint64_t *v26;
  int v27;

  v10 = 0x254EE8000uLL;
  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "deserializeParameters");
  v11 = 70;
  v12 = 4294967293;
  if (!a1 || !a3 || !a4 || !a5)
    goto LABEL_25;
  v13 = *a3;
  if (a2 <= *a3)
  {
    LODWORD(v14) = 0;
LABEL_23:
    v16 = 0;
LABEL_24:
    v12 = 0;
    *a4 = v16;
    *a5 = v14;
    v11 = 10;
    *a3 = v13;
    goto LABEL_25;
  }
  if (a2 - *a3 < 4 || (v14 = *(unsigned int *)(a1 + v13), v14 > 0xA))
  {
    v11 = 70;
    v12 = 4294967293;
    goto LABEL_25;
  }
  v13 += 4;
  if (!(_DWORD)v14)
    goto LABEL_23;
  v27 = v14;
  v15 = 24 * v14;
  v16 = (char *)acm_mem_alloc(24 * v14);
  acm_mem_alloc_info("array of ACMParameter", v16, v15, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibSerialization.c", 194, "deserializeParameters");
  if (!v16)
  {
    v11 = 70;
    v12 = 4294967292;
    goto LABEL_25;
  }
  v24 = a4;
  v25 = a5;
  v26 = a3;
  v17 = 0;
  while (1)
  {
    v18 = &v16[v17];
    *(_QWORD *)&v16[v17 + 8] = 0;
    if (a2 - v13 < 8
      || (*(_DWORD *)v18 = *(_DWORD *)(a1 + v13), a2 - (v13 + 4) < 4)
      || (v19 = &v16[v17],
          v20 = *(unsigned int *)(a1 + v13 + 4),
          *(_DWORD *)&v16[v17 + 16] = v20,
          v13 += 8,
          a2 - v13 < v20))
    {
      v11 = 70;
      v12 = 4294967293;
      goto LABEL_31;
    }
    v21 = checkParameter(&v16[v17]);
    if ((_DWORD)v21)
    {
      v12 = v21;
      v11 = 70;
      goto LABEL_31;
    }
    if ((_DWORD)v20)
      break;
LABEL_20:
    v17 += 24;
    if (v15 == v17)
    {
      v10 = 0x254EE8000;
      a5 = v25;
      a3 = v26;
      a4 = v24;
      LODWORD(v14) = v27;
      goto LABEL_24;
    }
  }
  v22 = acm_mem_alloc_data(v20);
  acm_mem_alloc_info("<data>", v22, v20, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibSerialization.c", 212, "deserializeParameters");
  *((_QWORD *)v18 + 1) = v22;
  if (v22)
  {
    memcpy(v22, (const void *)(a1 + v13), *((unsigned int *)v19 + 4));
    v13 += *((unsigned int *)v19 + 4);
    goto LABEL_20;
  }
  v11 = 70;
  v12 = 4294967292;
LABEL_31:
  v10 = 0x254EE8000;
LABEL_25:
  if (v11 >= *(unsigned __int8 *)(v10 + 3779))
    printf("%s: %s: returning, err = %ld.\n", "ACM", "deserializeParameters", (int)v12);
  return v12;
}

uint64_t GetSerializedVerifyAclConstraintSize(int a1, uint64_t a2, uint64_t a3, unsigned int a4, uint64_t a5, unsigned int a6, uint64_t a7, uint64_t a8, _DWORD *a9, unsigned int a10, _QWORD *a11)
{
  uint64_t result;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unsigned int v18;

  v18 = 0;
  result = 4294967293;
  if (a3)
  {
    if (a11)
    {
      if (a10 <= 0xA && (a9 != 0) == (a10 != 0))
      {
        result = getLengthOfParameters(a9, a10, &v18);
        if (!(_DWORD)result)
        {
          v15 = 29;
          if (a1 == 32)
            v15 = 33;
          v16 = v15 + a4;
          if (a1 == 32)
            v17 = a6;
          else
            v17 = 0;
          *a11 = v16 + v17 + v18;
        }
      }
    }
  }
  return result;
}

uint64_t SerializeVerifyAclConstraint(int a1, _OWORD *a2, const void *a3, unsigned int a4, const void *a5, unsigned int a6, char a7, int a8, _DWORD *a9, unsigned int a10, uint64_t a11, _QWORD *a12)
{
  uint64_t result;
  BOOL v14;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int v28;
  uint64_t v30;
  unsigned int v31;

  if (!a3)
    return 4294967293;
  result = 4294967293;
  if (a12)
    v14 = a11 == 0;
  else
    v14 = 1;
  if (!v14 && a10 <= 0xA && (a9 != 0) == (a10 != 0))
  {
    v31 = 0;
    result = getLengthOfParameters(a9, a10, &v31);
    if (!(_DWORD)result)
    {
      v21 = 29;
      if (a1 == 32)
        v21 = 33;
      v22 = v21 + a4;
      if (a1 == 32)
        v23 = a6;
      else
        v23 = 0;
      if (*a12 < v22 + v23 + (unint64_t)v31)
      {
        return 4294967293;
      }
      else
      {
        v28 = a8;
        if (a2)
        {
          *(_OWORD *)a11 = *a2;
        }
        else
        {
          *(_QWORD *)a11 = 0;
          *(_QWORD *)(a11 + 8) = 0;
        }
        *(_DWORD *)(a11 + 16) = a4;
        memcpy((void *)(a11 + 20), a3, a4);
        v24 = a4 + 20;
        if (a1 == 32)
        {
          *(_DWORD *)(a11 + v24) = a6;
          v25 = a4 + 24;
          memcpy((void *)(a11 + v25), a5, a6);
          v24 = v25 + a6;
        }
        v26 = a11 + v24;
        *(_BYTE *)v26 = a7;
        *(_DWORD *)(v26 + 1) = v28;
        v30 = v24 + 5;
        result = serializeParameters((uint64_t)a9, a10, a11, &v30);
        if (!(_DWORD)result)
          *a12 = v30;
      }
    }
  }
  return result;
}

uint64_t DeserializeVerifyAclConstraint(int a1, uint64_t a2, unsigned int a3, _OWORD *a4, _QWORD *a5, _DWORD *a6, size_t *a7, _DWORD *a8, BOOL *a9, _DWORD *a10, _QWORD *a11, _DWORD *a12)
{
  uint64_t v12;
  unint64_t v16;
  unint64_t v20;
  void *v21;
  unint64_t v22;
  size_t v23;
  unint64_t v24;
  void *v25;
  BOOL v26;
  int v27;
  int v28;
  unint64_t v30;
  _QWORD *v31;
  unsigned int v32;
  unsigned int *v33;
  unint64_t v34;

  v33 = 0;
  v34 = 0;
  v32 = 0;
  v12 = 4294967293;
  if (a2 && a4 && a5 && a6 && a9 && a10 && a11 && a12 && a3 >= 0x10)
  {
    v16 = a3;
    *a4 = *(_OWORD *)a2;
    v34 = 16;
    if ((a3 & 0xFFFFFFFC) == 0x10)
    {
      v12 = 4294967293;
    }
    else
    {
      v20 = *(unsigned int *)(a2 + 16);
      v34 = 20;
      v21 = acm_mem_alloc_data(v20);
      acm_mem_alloc_info("<data>", v21, v20, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibSerialization.c", 532, "DeserializeVerifyAclConstraint");
      if (v21)
      {
        if (v16 - 20 < v20)
          goto LABEL_24;
        memcpy(v21, (const void *)(a2 + 20), v20);
        v22 = v20 + 20;
        v34 = v20 + 20;
        v31 = a5;
        if (a1 != 32)
        {
          v25 = 0;
          LODWORD(v23) = 0;
          goto LABEL_19;
        }
        if (v16 - v22 < 4)
        {
LABEL_24:
          v25 = 0;
          LODWORD(v23) = 0;
        }
        else
        {
          v23 = *(unsigned int *)(a2 + v22);
          v24 = v20 + 24;
          v34 = v20 + 24;
          v25 = acm_mem_alloc_data(v23);
          acm_mem_alloc_info("<data>", v25, v23, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibSerialization.c", 544, "DeserializeVerifyAclConstraint");
          if (!v25)
          {
            v12 = 4294967292;
LABEL_26:
            acm_mem_free_info("<data>", v21, v20, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibSerialization.c", 580, "DeserializeVerifyAclConstraint");
            acm_mem_free_data(v21, v20);
            if (v25)
            {
              acm_mem_free_info("<data>", v25, v23, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibSerialization.c", 583, "DeserializeVerifyAclConstraint");
              acm_mem_free_data(v25, v23);
            }
            goto LABEL_30;
          }
          if (v16 - v24 >= v23)
          {
            memcpy(v25, (const void *)(a2 + v24), v23);
            v22 = v24 + v23;
            v34 = v24 + v23;
LABEL_19:
            if (v22 != v16)
            {
              v26 = *(_BYTE *)(a2 + v22) != 0;
              v34 = v22 + 1;
              if (v16 - (v22 + 1) >= 4)
              {
                v30 = v20;
                v27 = v23;
                v23 = (size_t)v25;
                v28 = *(_DWORD *)(a2 + v22 + 1);
                v34 = v22 + 5;
                v12 = deserializeParameters(a2, v16, &v34, &v33, &v32);
                if (!(_DWORD)v12)
                {
                  *v31 = v21;
                  *a7 = v23;
                  *a8 = v27;
                  *a6 = v30;
                  *a9 = v26;
                  *a10 = v28;
                  *a11 = v33;
                  *a12 = v32;
                  return v12;
                }
                v25 = (void *)v23;
                LODWORD(v23) = v27;
                v20 = v30;
                goto LABEL_26;
              }
            }
          }
        }
        v12 = 4294967293;
        goto LABEL_26;
      }
      v12 = 4294967292;
    }
  }
LABEL_30:
  if (v33)
    Util_SafeDeallocParameters(v33, v32);
  return v12;
}

uint64_t GetSerializedProcessAclSize(uint64_t a1, uint64_t a2, unsigned int a3, uint64_t a4, unsigned int a5, uint64_t a6, _DWORD *a7, unsigned int a8, _QWORD *a9)
{
  uint64_t result;
  unsigned int v12;

  v12 = 0;
  result = 4294967293;
  if (a2 && a3 && a9 && a8 <= 0xA && (a7 != 0) == (a8 != 0))
  {
    result = getLengthOfParameters(a7, a8, &v12);
    if (!(_DWORD)result)
      *a9 = a3 + (unint64_t)a5 + v12 + 36;
  }
  return result;
}

uint64_t SerializeProcessAcl(_OWORD *a1, const void *a2, unsigned int a3, const void *a4, unsigned int a5, uint64_t a6, _DWORD *a7, unsigned int a8, uint64_t a9, unint64_t *a10)
{
  uint64_t result;
  BOOL v15;
  int v17;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;

  v23 = 0;
  result = 4294967293;
  if (a2 && a3)
  {
    v15 = !a10 || a9 == 0;
    if (!v15 && a8 <= 0xA && (a7 != 0) == (a8 != 0))
    {
      v17 = a6;
      result = GetSerializedProcessAclSize(4294967293, (uint64_t)a2, a3, (uint64_t)a4, a5, a6, a7, a8, &v23);
      if (!(_DWORD)result)
      {
        if (*a10 < v23)
        {
          return 4294967293;
        }
        else
        {
          if (a1)
          {
            *(_OWORD *)a9 = *a1;
          }
          else
          {
            *(_QWORD *)a9 = 0;
            *(_QWORD *)(a9 + 8) = 0;
          }
          *(_DWORD *)(a9 + 16) = a3;
          memcpy((void *)(a9 + 20), a2, a3);
          *(_DWORD *)(a9 + a3 + 20) = a5;
          v21 = a3 + 24;
          if (a5)
          {
            memcpy((void *)(a9 + v21), a4, a5);
            v21 += a5;
          }
          *(_DWORD *)(a9 + v21) = v17;
          v22 = v21 + 4;
          result = serializeParameters((uint64_t)a7, a8, a9, (uint64_t *)&v22);
          if (!(_DWORD)result)
            *a10 = v22;
        }
      }
    }
  }
  return result;
}

uint64_t DeserializeProcessAcl(uint64_t a1, unsigned int a2, _OWORD *a3, _QWORD *a4, _DWORD *a5, _QWORD *a6, unsigned int *a7, _DWORD *a8, _QWORD *a9, _DWORD *a10)
{
  uint64_t v10;
  _QWORD *v11;
  _DWORD *v12;
  _QWORD *v13;
  unsigned int *v14;
  _DWORD *v15;
  unint64_t v17;
  unint64_t v18;
  void *v19;
  size_t v20;
  unint64_t v21;
  _QWORD *v22;
  unsigned int *v23;
  _DWORD *v24;
  size_t v25;
  void *v26;
  void *v27;
  void *v28;
  _DWORD *v29;
  int v30;
  void *v32;
  _DWORD *v33;
  _QWORD *v34;
  unint64_t v35;
  void *v36;
  unsigned int v37;
  unsigned int v38;
  unsigned int *v39;
  unint64_t v40;

  v39 = 0;
  v40 = 0;
  v38 = 0;
  v10 = 4294967293;
  if (a1)
  {
    if (a3)
    {
      v11 = a4;
      if (a4)
      {
        v12 = a5;
        if (a5)
        {
          v13 = a6;
          if (a6)
          {
            v14 = a7;
            if (a7)
            {
              v15 = a8;
              if (a8)
              {
                if (a9 && a10 && a2 >= 0x10)
                {
                  v17 = a2;
                  *a3 = *(_OWORD *)a1;
                  v40 = 16;
                  if ((a2 & 0xFFFFFFFC) == 0x10)
                  {
                    v10 = 4294967293;
                  }
                  else
                  {
                    v18 = *(unsigned int *)(a1 + 16);
                    v40 = 20;
                    v19 = acm_mem_alloc_data(v18);
                    acm_mem_alloc_info("<data>", v19, v18, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibSerialization.c", 722, "DeserializeProcessAcl");
                    if (v19)
                    {
                      if (v17 - 20 < v18
                        || (memcpy(v19, (const void *)(a1 + 20), v18), v40 = v18 + 20, v17 - (v18 + 20) < 4))
                      {
                        v32 = 0;
                        v37 = 0;
                        v10 = 4294967293;
                      }
                      else
                      {
                        v20 = *(unsigned int *)(a1 + v18 + 20);
                        v21 = v18 + 24;
                        v40 = v18 + 24;
                        v37 = v20;
                        if (!(_DWORD)v20)
                        {
                          v36 = 0;
                          goto LABEL_20;
                        }
                        v33 = v12;
                        v34 = v11;
                        v22 = v13;
                        v23 = v14;
                        v24 = v15;
                        v25 = v20;
                        v26 = acm_mem_alloc_data(v20);
                        acm_mem_alloc_info("<data>", v26, v25, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibSerialization.c", 734, "DeserializeProcessAcl");
                        if (v26)
                        {
                          v27 = v26;
                          v11 = v34;
                          if (v17 - v21 >= v25)
                          {
                            v36 = v27;
                            memcpy(v27, (const void *)(a1 + v21), v25);
                            v21 += v25;
                            v40 = v21;
                            v15 = v24;
                            v14 = v23;
                            v13 = v22;
                            v12 = v33;
LABEL_20:
                            if (v17 - v21 < 4)
                            {
                              v10 = 4294967293;
                            }
                            else
                            {
                              v35 = v18;
                              v28 = v19;
                              v29 = v15;
                              v30 = *(_DWORD *)(a1 + v21);
                              v40 = v21 + 4;
                              v10 = deserializeParameters(a1, v17, &v40, &v39, &v38);
                              if (!(_DWORD)v10)
                              {
                                *v11 = v28;
                                *v12 = v35;
                                *v13 = v36;
                                *v14 = v37;
                                *v29 = v30;
                                *a9 = v39;
                                *a10 = v38;
                                return v10;
                              }
                              v19 = v28;
                              v18 = v35;
                            }
                            v32 = v36;
                            goto LABEL_32;
                          }
                          v10 = 4294967293;
                          v32 = v27;
                        }
                        else
                        {
                          v32 = 0;
                          v10 = 4294967292;
                        }
                      }
LABEL_32:
                      acm_mem_free_info("<data>", v19, v18, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibSerialization.c", 763, "DeserializeProcessAcl");
                      acm_mem_free_data(v19, v18);
                      if (v32)
                      {
                        acm_mem_free_info("<data>", v32, v37, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibSerialization.c", 766, "DeserializeProcessAcl");
                        acm_mem_free_data(v32, v37);
                      }
                      goto LABEL_34;
                    }
                    v10 = 4294967292;
                  }
                }
              }
            }
          }
        }
      }
    }
  }
LABEL_34:
  if (v39)
    Util_SafeDeallocParameters(v39, v38);
  return v10;
}

uint64_t GetSerializedRequirementSize(_DWORD *a1, uint64_t *a2)
{
  uint64_t result;
  int v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;

  v12 = 0;
  result = 4294967293;
  if (!a1)
    return result;
  if (!a2)
    return result;
  v5 = *a1;
  if (*a1 > 0x1Cu)
    return result;
  if (((1 << v5) & 0x1FFCFF4E) != 0)
  {
    result = 0;
    *a2 = a1[3] + 16;
    return result;
  }
  if (((1 << v5) & 0x30) == 0)
  {
    if (v5 != 7)
      return result;
    *a2 = 24;
    v9 = a1[5];
    if ((_DWORD)v9)
    {
      v10 = a1 + 6;
      v11 = 24;
      do
      {
        result = GetSerializedRequirementSize(*v10, &v12);
        if ((_DWORD)result)
          break;
        v11 += v12;
        *a2 = v11;
        ++v10;
        --v9;
      }
      while (v9);
      return result;
    }
    return 0;
  }
  *a2 = 20;
  v6 = a1[4];
  if (!(_DWORD)v6)
    return 0;
  v7 = a1 + 5;
  v8 = 20;
  while (1)
  {
    result = GetSerializedRequirementSize(*v7, &v12);
    if ((_DWORD)result)
      break;
    v8 += v12;
    *a2 = v8;
    ++v7;
    if (!--v6)
      return 0;
  }
  return result;
}

uint64_t SerializeRequirement(_DWORD *a1, _OWORD *a2, uint64_t *a3)
{
  uint64_t result;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;

  v12 = 0;
  result = 4294967293;
  if (a1)
  {
    if (a2)
    {
      if (a3)
      {
        result = GetSerializedRequirementSize(a1, (uint64_t *)&v12);
        if (!(_DWORD)result)
        {
          if (v12 > *a3)
            return 4294967293;
          *a2 = *(_OWORD *)a1;
          v7 = *a1;
          result = 4294967293;
          if (*a1 <= 0x1Cu)
          {
            if (((1 << v7) & 0x1FFCFF4E) != 0)
            {
              memcpy(a2 + 1, a1 + 4, a1[3]);
              v8 = a1[3] + 16;
LABEL_9:
              result = 0;
              *a3 = v8;
              return result;
            }
            if (((1 << v7) & 0x30) != 0)
            {
              *((_DWORD *)a2 + 4) = a1[4];
              if (!a1[4])
              {
                v8 = 20;
                goto LABEL_9;
              }
              v9 = 0;
              v8 = 20;
              while (1)
              {
                v11 = *a3 - v8;
                result = SerializeRequirement(*(_QWORD *)&a1[2 * v9 + 5], (char *)a2 + v8, &v11);
                if ((_DWORD)result)
                  break;
                v8 += v11;
                if (++v9 >= (unint64_t)a1[4])
                  goto LABEL_9;
              }
            }
            else if (v7 == 7)
            {
              *((_QWORD *)a2 + 2) = *((_QWORD *)a1 + 2);
              if (!a1[5])
              {
                v8 = 24;
                goto LABEL_9;
              }
              v10 = 0;
              v8 = 24;
              while (1)
              {
                v11 = *a3 - v8;
                result = SerializeRequirement(*(_QWORD *)&a1[2 * v10 + 6], (char *)a2 + v8, &v11);
                if ((_DWORD)result)
                  break;
                v8 += v11;
                if (++v10 >= (unint64_t)a1[5])
                  goto LABEL_9;
              }
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t DeserializeRequirement(unsigned int *a1, unint64_t a2, void **a3, size_t *a4)
{
  uint64_t v4;
  unsigned int v9;
  size_t v10;
  uint64_t v11;
  uint64_t v13;
  _OWORD *v14;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;
  _OWORD *v18;
  __int128 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *__dst;

  __dst = 0;
  v4 = 4294967293;
  if (a1)
  {
    if (a2 >= 0x10)
    {
      if (a3)
      {
        if (a4)
        {
          v9 = *a1;
          if (v9 <= 0x1C)
          {
            if (((1 << v9) & 0x1FFCFF4E) != 0)
            {
              v10 = a1[3] + 16;
              if (v10 > a2)
                goto LABEL_36;
              v11 = Util_AllocRequirement(v9, 0, &__dst);
              if (!(_DWORD)v11)
              {
                if (__dst)
                {
                  memcpy(__dst, a1, v10);
LABEL_11:
                  v4 = 0;
                  *a4 = v10;
                  *a3 = __dst;
                  return v4;
                }
                return 4294967292;
              }
              goto LABEL_35;
            }
            if (((1 << v9) & 0x30) != 0)
            {
              v13 = a1[4];
              if (8 * v13 + 20 > a2)
                goto LABEL_36;
              v11 = Util_AllocRequirement(v9, v13, &__dst);
              if ((_DWORD)v11)
                goto LABEL_35;
              v14 = __dst;
              if (!__dst)
                return 4294967292;
              if (*((_DWORD *)__dst + 3) == 84)
              {
                v15 = *(_OWORD *)a1;
                *((_DWORD *)__dst + 4) = a1[4];
                *v14 = v15;
                *((_DWORD *)__dst + 3) = 84;
                if (!a1[4])
                {
                  v10 = 20;
                  goto LABEL_11;
                }
                v16 = 0;
                v10 = 20;
                while (1)
                {
                  v21 = 0;
                  v22 = 0;
                  v11 = DeserializeRequirement((char *)a1 + v10, a2 - v10, &v22, &v21);
                  if ((_DWORD)v11)
                    goto LABEL_35;
                  *(_QWORD *)((char *)__dst + 8 * v16 + 20) = v22;
                  v10 += v21;
                  if (++v16 >= (unint64_t)a1[4])
                    goto LABEL_11;
                }
              }
              goto LABEL_39;
            }
            if (v9 == 7)
            {
              v17 = a1[5];
              if (8 * v17 + 24 <= a2)
              {
                v11 = Util_AllocRequirement(7, v17, &__dst);
                if (!(_DWORD)v11)
                {
                  v18 = __dst;
                  if (!__dst)
                    return 4294967292;
                  if (*((_DWORD *)__dst + 3) != 88)
                  {
LABEL_39:
                    v4 = 4294967291;
                    goto LABEL_36;
                  }
                  v19 = *(_OWORD *)a1;
                  *((_QWORD *)__dst + 2) = *((_QWORD *)a1 + 2);
                  *v18 = v19;
                  *((_DWORD *)__dst + 3) = 88;
                  if (!a1[5])
                  {
                    v10 = 24;
                    goto LABEL_11;
                  }
                  v20 = 0;
                  v10 = 24;
                  while (1)
                  {
                    v21 = 0;
                    v22 = 0;
                    v11 = DeserializeRequirement((char *)a1 + v10, a2 - v10, &v22, &v21);
                    if ((_DWORD)v11)
                      break;
                    *((_QWORD *)__dst + v20 + 3) = v22;
                    v10 += v21;
                    if (++v20 >= (unint64_t)a1[5])
                      goto LABEL_11;
                  }
                }
LABEL_35:
                v4 = v11;
              }
            }
          }
        }
      }
    }
  }
LABEL_36:
  if (__dst)
    Util_DeallocRequirement((int *)__dst);
  return v4;
}

uint64_t GetSerializedCredentialSize(_DWORD *a1, _QWORD *a2)
{
  uint64_t result;

  result = 4294967293;
  if (a1 && a2 && *a1 <= 0x17u && ((1 << *a1) & 0xFFF7FE) != 0)
  {
    result = 0;
    *a2 = a1[7] + 32;
  }
  return result;
}

uint64_t SerializeCredential(unsigned int *__src, void *__dst, size_t *a3)
{
  uint64_t result;
  unsigned int v6;
  size_t v8;

  result = 4294967293;
  if (__src && __dst && a3)
  {
    v6 = *__src;
    if (*__src <= 0x17 && ((1 << *__src) & 0xFFF7FE) != 0)
    {
      v8 = __src[7] + 32;
      if (v8 <= *a3 && v6 <= 0x17 && ((1 << v6) & 0xFFF7FE) != 0)
      {
        memcpy(__dst, __src, v8);
        result = 0;
        *a3 = __src[7] + 32;
      }
    }
  }
  return result;
}

uint64_t DeserializeCredential(unsigned int *a1, unint64_t a2, void **a3, _QWORD *a4)
{
  uint64_t v4;
  unsigned int v8;
  uint64_t v10;
  void *__dst;

  __dst = 0;
  v4 = 4294967293;
  if (a2 >= 0x20 && a1 && a3 && a4)
  {
    v8 = *a1;
    v10 = a1[7];
    switch(*a1)
    {
      case 1u:
        if ((_DWORD)v10 == 28)
          goto LABEL_7;
        return v4;
      case 2u:
        if ((_DWORD)v10 == 136)
          goto LABEL_7;
        return v4;
      case 3u:
        if ((_DWORD)v10 == 305)
          goto LABEL_7;
        return v4;
      case 4u:
      case 5u:
      case 6u:
      case 8u:
      case 0xEu:
      case 0x10u:
      case 0x13u:
      case 0x16u:
      case 0x17u:
        if (!(_DWORD)v10)
          goto LABEL_7;
        return v4;
      case 7u:
        if ((_DWORD)v10 == 56)
          goto LABEL_7;
        return v4;
      case 9u:
        if ((_DWORD)v10 == 24)
          goto LABEL_7;
        return v4;
      case 0xAu:
        if ((_DWORD)v10 == 52)
          goto LABEL_7;
        return v4;
      case 0xCu:
      case 0xFu:
        if ((_DWORD)v10 == 8)
          goto LABEL_7;
        return v4;
      case 0xDu:
      case 0x15u:
        if ((_DWORD)v10 == 132)
          goto LABEL_7;
        return v4;
      case 0x11u:
        if ((_DWORD)v10 == 81)
          goto LABEL_7;
        return v4;
      case 0x12u:
        if ((_DWORD)v10 == 20)
          goto LABEL_7;
        return v4;
      case 0x14u:
        if ((_DWORD)v10 != 32)
          return v4;
LABEL_7:
        v4 = Util_AllocCredential(*a1, &__dst);
        if ((_DWORD)v4)
        {
          if (__dst)
          {
LABEL_16:
            Util_DeallocCredential(__dst);
            return v4;
          }
        }
        else
        {
          if (__dst)
          {
            if (*((_DWORD *)__dst + 1) > 3u || *((_DWORD *)__dst + 2) > 0x50u)
            {
              v4 = 4294967293;
            }
            else
            {
              v4 = 4294967293;
              if (v8 <= 0x17 && ((1 << v8) & 0xFFF7FE) != 0 && v10 + 32 <= a2)
              {
                memcpy(__dst, a1, v10 + 32);
                v4 = 0;
                *a3 = __dst;
                *a4 = v10 + 32;
                return v4;
              }
            }
            goto LABEL_16;
          }
          v4 = 4294967292;
        }
        break;
      default:
        return v4;
    }
  }
  return v4;
}

uint64_t CopyCredential(uint64_t a1, void **a2)
{
  uint64_t v2;
  void *__dst;

  __dst = 0;
  v2 = 4294967293;
  if (a1 && a2)
  {
    v2 = Util_AllocCredential(*(_DWORD *)a1, &__dst);
    if ((_DWORD)v2)
    {
      if (__dst)
        Util_DeallocCredential(__dst);
    }
    else if (__dst)
    {
      memcpy(__dst, (const void *)a1, *(unsigned int *)(a1 + 28) + 32);
      v2 = 0;
      *a2 = __dst;
    }
    else
    {
      return 4294967292;
    }
  }
  return v2;
}

uint64_t CompareCredentials(_QWORD *__s1, _QWORD *__s2, _BYTE *a3)
{
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v6;
  uint64_t v7;
  size_t v8;
  _BOOL4 isNullOrEqualMem2;
  char *v13;
  char *v14;
  size_t v21;
  uint64_t v22;

  v3 = 4294967293;
  if (__s1)
  {
    v4 = __s2;
    if (__s2)
    {
      if (a3)
      {
        v6 = __s1;
        if (*(_DWORD *)__s1 == *(_DWORD *)__s2)
        {
          v7 = *((unsigned int *)__s1 + 7);
          if ((_DWORD)v7 == *((_DWORD *)__s2 + 7))
          {
            v3 = 4294967293;
            switch(*(_DWORD *)__s1)
            {
              case 1:
                if (*__s1 != *__s2 || __s1[1] != __s2[1] || __s1[2] != __s2[2] || __s1[3] != __s2[3])
                  break;
                v13 = (char *)__s1 + 44;
                v14 = (char *)__s2 + 44;
                goto LABEL_74;
              case 2:
                if (*((_DWORD *)__s1 + 8) != *((_DWORD *)__s2 + 8))
                  break;
                v8 = *((unsigned int *)__s1 + 9);
                if ((_DWORD)v8 != *((_DWORD *)__s2 + 9))
                  break;
                __s2 += 5;
                __s1 += 5;
                goto LABEL_8;
              case 3:
                if (*__s1 != *__s2 || __s1[1] != __s2[1] || __s1[2] != __s2[2] || __s1[3] != __s2[3])
                  break;
                v13 = (char *)(__s1 + 13);
                v14 = (char *)(__s2 + 13);
                goto LABEL_74;
              case 4:
              case 5:
              case 6:
              case 8:
              case 0xC:
              case 0xE:
              case 0xF:
              case 0x10:
              case 0x11:
              case 0x12:
              case 0x13:
              case 0x16:
              case 0x17:
                v8 = v7 + 32;
                goto LABEL_8;
              case 7:
                if (*__s1 != *__s2 || __s1[1] != __s2[1] || __s1[2] != __s2[2] || __s1[3] != __s2[3])
                  break;
                isNullOrEqualMem2 = _isNullOrEqualMem2((unint64_t)(__s1 + 4), 0x20uLL, (unint64_t)(__s2 + 4), 32);
                if (!isNullOrEqualMem2)
                  goto LABEL_100;
                v13 = (char *)(v6 + 8);
                v14 = (char *)(v4 + 8);
                v21 = 24;
                v22 = 24;
                goto LABEL_103;
              case 9:
                if (*__s1 != *__s2 || __s1[1] != __s2[1] || __s1[2] != __s2[2] || __s1[3] != __s2[3])
                  break;
                v13 = (char *)(__s1 + 5);
                v14 = (char *)(__s2 + 5);
                goto LABEL_74;
              case 0xA:
                if (*__s1 != *__s2 || __s1[1] != __s2[1] || __s1[2] != __s2[2] || __s1[3] != __s2[3])
                  break;
                isNullOrEqualMem2 = _isNullOrEqualMem2((unint64_t)__s1 + 36, 0x10uLL, (unint64_t)__s2 + 36, 16);
                if (!isNullOrEqualMem2)
                  goto LABEL_100;
                v13 = (char *)v6 + 52;
                v14 = (char *)v4 + 52;
LABEL_74:
                v21 = 16;
                v22 = 16;
                goto LABEL_103;
              case 0xD:
                v8 = *((unsigned int *)__s1 + 8);
                if ((_DWORD)v8 != *((_DWORD *)__s2 + 8))
                  break;
                __s2 = (_QWORD *)((char *)__s2 + 36);
                __s1 = (_QWORD *)((char *)__s1 + 36);
LABEL_8:
                LOBYTE(isNullOrEqualMem2) = memcmp(__s1, __s2, v8) == 0;
                goto LABEL_100;
              case 0x14:
                if (*__s1 != *__s2 || __s1[1] != __s2[1] || __s1[2] != __s2[2] || __s1[3] != __s2[3])
                  break;
                v14 = (char *)(__s2 + 4);
                v13 = (char *)(__s1 + 4);
                v21 = 32;
                v22 = 32;
                goto LABEL_103;
              case 0x15:
                if (*__s1 != *__s2 || __s1[1] != __s2[1] || __s1[2] != __s2[2] || __s1[3] != __s2[3])
                  break;
                v13 = (char *)__s1 + 36;
                v14 = (char *)__s2 + 36;
                v21 = 128;
                v22 = 128;
LABEL_103:
                LOBYTE(isNullOrEqualMem2) = _isNullOrEqualMem2((unint64_t)v13, v21, (unint64_t)v14, v22);
                goto LABEL_100;
              default:
                return v3;
            }
          }
        }
        LOBYTE(isNullOrEqualMem2) = 0;
LABEL_100:
        v3 = 0;
        *a3 = isNullOrEqualMem2;
      }
    }
  }
  return v3;
}

BOOL _isNullOrEqualMem2(unint64_t __s1, size_t __n, unint64_t __s2, uint64_t a4)
{
  _BOOL8 result;
  BOOL v6;
  BOOL v7;

  if (__n != a4)
    return 0;
  if (!(__s1 | __s2))
    return 1;
  result = 0;
  v6 = __s1 == 0;
  if (__s2)
  {
    v7 = 1;
  }
  else
  {
    v6 = 0;
    v7 = __s1 == 0;
  }
  if (v7 && !v6)
    return memcmp((const void *)__s1, (const void *)__s2, __n) == 0;
  return result;
}

uint64_t GetSerializedAddCredentialSize(uint64_t a1, _DWORD *a2, int a3, _QWORD *a4)
{
  BOOL v4;
  char v5;
  uint64_t result;

  if (a1)
    v4 = 1;
  else
    v4 = a3 == 2;
  v5 = !v4;
  result = 4294967293;
  if (a4 && a2 && (v5 & 1) == 0 && *a2 <= 0x17u && ((1 << *a2) & 0xFFF7FE) != 0)
  {
    result = 0;
    *a4 = a2[7] + 52;
  }
  return result;
}

uint64_t SerializeAddCredential(_OWORD *a1, unsigned int *__src, int a3, uint64_t a4, _QWORD *a5)
{
  BOOL v6;
  char v7;
  uint64_t result;
  size_t v12;
  uint64_t v13;

  if (a1)
    v6 = 1;
  else
    v6 = a3 == 2;
  v7 = !v6;
  result = 4294967293;
  if (a5)
  {
    if (a4)
    {
      if (__src)
      {
        if ((v7 & 1) == 0)
        {
          result = 4294967293;
          if (*__src <= 0x17 && ((1 << *__src) & 0xFFF7FE) != 0 && *a5 >= (unint64_t)__src[7] + 52)
          {
            if (a1)
            {
              *(_OWORD *)a4 = *a1;
            }
            else
            {
              *(_QWORD *)a4 = 0;
              *(_QWORD *)(a4 + 8) = 0;
            }
            v13 = *a5 - 16;
            result = SerializeCredential(__src, (void *)(a4 + 16), (size_t *)&v13);
            if (!(_DWORD)result)
            {
              v12 = v13;
              *(_DWORD *)(v13 + a4 + 16) = a3;
              *a5 = v12 + 20;
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t DeserializeAddCredential(uint64_t a1, unint64_t a2, _OWORD *a3, _QWORD *a4, _DWORD *a5)
{
  uint64_t v5;
  uint64_t v10;
  _DWORD *v12;
  uint64_t v13;

  v12 = 0;
  v13 = 0;
  v5 = 4294967293;
  if (a1 && a2 >= 0x34 && a3 && a4 && a5)
  {
    *a3 = *(_OWORD *)a1;
    v10 = DeserializeCredential((unsigned int *)(a1 + 16), a2 - 16, (void **)&v12, &v13);
    if ((_DWORD)v10)
    {
      v5 = v10;
    }
    else if (a2 - (v13 + 16) >= 4)
    {
      v5 = 0;
      *a5 = *(_DWORD *)(a1 + v13 + 16);
      *a4 = v12;
      return v5;
    }
  }
  if (v12)
    Util_DeallocCredential(v12);
  return v5;
}

uint64_t DeserializeAddCredentialType(uint64_t a1, unint64_t a2, _DWORD *a3)
{
  uint64_t result;

  result = 4294967293;
  if (a2 >= 0x34 && a1)
  {
    if (a3)
    {
      result = 0;
      *a3 = *(_DWORD *)(a1 + 16);
    }
  }
  return result;
}

uint64_t GetSerializedRemoveCredentialSize(uint64_t a1, _DWORD *a2, int a3, _QWORD *a4)
{
  BOOL v4;
  char v5;
  uint64_t result;

  if (a1)
    v4 = 1;
  else
    v4 = a3 == 2;
  v5 = !v4;
  result = 4294967293;
  if (a4 && a2 && (v5 & 1) == 0 && *a2 <= 0x17u && ((1 << *a2) & 0xFFF7FE) != 0)
  {
    result = 0;
    *a4 = a2[7] + 52;
  }
  return result;
}

uint64_t GetSerializedReplacePassphraseCredentialSize(uint64_t a1, _DWORD *a2, int a3, _QWORD *a4)
{
  BOOL v4;
  char v5;
  uint64_t result;

  if (a1)
    v4 = 1;
  else
    v4 = a3 == 2;
  v5 = !v4;
  result = 4294967293;
  if (a4 && a2 && (v5 & 1) == 0 && *a2 <= 0x17u && ((1 << *a2) & 0xFFF7FE) != 0)
  {
    result = 0;
    *a4 = a2[7] + 52;
  }
  return result;
}

uint64_t SerializeCredentialList(unsigned int **a1, unsigned int a2, unsigned int *a3, _QWORD *a4)
{
  size_t v4;
  size_t v5;
  BOOL v6;
  unsigned int **v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int *v14;
  uint64_t result;
  size_t v16[9];

  if (a2)
    v6 = a1 == 0;
  else
    v6 = 0;
  if (v6 || a3 == 0 || a4 == 0)
    return 4294967293;
  v16[7] = v4;
  v16[8] = v5;
  *a3 = a2;
  if (a2)
  {
    v11 = a1;
    v12 = a2;
    v13 = 4;
    while (1)
    {
      v14 = *v11;
      if (!*v11)
        return 4294967293;
      v16[0] = *a4 - v13;
      result = SerializeCredential(v14, (char *)a3 + v13, v16);
      if ((_DWORD)result)
        return result;
      v13 += v16[0];
      ++v11;
      if (!--v12)
        goto LABEL_18;
    }
  }
  else
  {
    v13 = 4;
LABEL_18:
    result = 0;
    *a4 = v13;
  }
  return result;
}

uint64_t DeserializeCredentialList(unsigned int *a1, uint64_t a2, _QWORD *a3, _DWORD *a4)
{
  uint64_t v4;
  uint64_t v8;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;

  v15 = 0;
  v4 = 4294967293;
  if (a1)
  {
    if (a3)
    {
      if (a4)
      {
        v8 = *a1;
        if (v8 <= 0x3E8)
        {
          if ((_DWORD)v8)
          {
            v10 = (char *)acm_mem_alloc(8 * v8);
            acm_mem_alloc_info("array of ACMCredentialRef", v10, 8 * v8, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibSerialization.c", 1778, "DeserializeCredentialList");
            if (v10)
            {
              v11 = 0;
              v12 = 4;
              while (1)
              {
                v13 = DeserializeCredential((unsigned int *)((char *)a1 + v12), a2 - v12, (void **)&v10[v11], &v15);
                if ((_DWORD)v13)
                  break;
                v12 += v15;
                v11 += 8;
                if (8 * v8 == v11)
                  goto LABEL_12;
              }
              v4 = v13;
              DeallocCredentialList((_DWORD **)v10, v8);
            }
            else
            {
              return 4294967292;
            }
          }
          else
          {
            v10 = 0;
LABEL_12:
            v4 = 0;
            *a4 = v8;
            *a3 = v10;
          }
        }
      }
    }
  }
  return v4;
}

void DeallocCredentialList(_DWORD **a1, unsigned int a2)
{
  uint64_t v3;
  _DWORD **v4;
  uint64_t v5;
  unint64_t v6;

  if (a1)
  {
    v3 = a2;
    if (a2)
    {
      v4 = a1;
      v5 = a2;
      do
      {
        if (*v4)
        {
          Util_DeallocCredential(*v4);
          *v4 = 0;
        }
        ++v4;
        --v5;
      }
      while (v5);
    }
    v6 = 8 * v3;
    acm_mem_free_info("array of ACMCredentialRef", a1, v6, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibSerialization.c", 1816, "DeallocCredentialList");
    acm_mem_free(a1, v6);
  }
}

uint64_t GetSerializedGetContextPropertySize(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t result;

  if (!a3)
    return 4294967293;
  result = 0;
  *a3 = 20;
  return result;
}

__n128 SerializeGetContextProperty(__n128 *a1, unsigned __int32 a2, __n128 *a3, _QWORD *a4)
{
  __n128 result;

  if (a1 && a3 && a4 && *a4 >= 0x14uLL)
  {
    result = *a1;
    *a3 = *a1;
    a3[1].n128_u32[0] = a2;
    *a4 = 20;
  }
  return result;
}

uint64_t DeserializeGetContextProperty(uint64_t a1, unint64_t a2, _OWORD *a3, _DWORD *a4)
{
  uint64_t result;

  result = 4294967293;
  if (a2 >= 0x10 && a1 && a3 && a4)
  {
    *a3 = *(_OWORD *)a1;
    if ((a2 & 0xFFFFFFFFFFFFFFFCLL) != 0x10)
    {
      result = 0;
      *a4 = *(_DWORD *)(a1 + 16);
    }
  }
  return result;
}

uint64_t LibSer_GetAclAuthMethod_GetSize(uint64_t a1, _QWORD *a2)
{
  uint64_t result;

  if (!a2)
    return 4294967293;
  result = 0;
  *a2 = 16;
  return result;
}

__n128 LibSer_GetAclAuthMethod_Serialize(__n128 *a1, __n128 *a2, _QWORD *a3)
{
  __n128 result;

  if (a1 && a2 && a3 && *a3 >= 0x10uLL)
  {
    result = *a1;
    *a2 = *a1;
    *a3 = 16;
  }
  return result;
}

__n128 LibSer_GetAclAuthMethod_Deserialize(__n128 *a1, unint64_t a2, __n128 *a3)
{
  __n128 result;

  if (a2 >= 0x10 && a1)
  {
    if (a3)
    {
      result = *a1;
      *a3 = *a1;
    }
  }
  return result;
}

uint64_t LibSer_ContextCredentialGetProperty_GetSize(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t result;

  if (!a4)
    return 4294967293;
  result = 0;
  *a4 = 24;
  return result;
}

__n128 LibSer_ContextCredentialGetProperty_Serialize(__n128 *a1, unsigned __int32 a2, unsigned __int32 a3, __n128 *a4, _QWORD *a5)
{
  __n128 result;

  if (a1 && a4 && a5 && *a5 >= 0x18uLL)
  {
    result = *a1;
    *a4 = *a1;
    a4[1].n128_u32[0] = a2;
    a4[1].n128_u32[1] = a3;
    *a5 = 24;
  }
  return result;
}

__n128 LibSer_ContextCredentialGetProperty_Deserialize(__n128 *a1, unint64_t a2, __n128 *a3, _DWORD *a4, _DWORD *a5)
{
  __n128 result;

  if (a2 >= 0x18 && a1 && a3 && a4)
  {
    if (a5)
    {
      result = *a1;
      *a3 = *a1;
      *a4 = a1[1].n128_u32[0];
      *a5 = a1[1].n128_u32[1];
    }
  }
  return result;
}

uint64_t LibSer_GlobalContextCredentialGetProperty_GetSize(_QWORD *a1)
{
  uint64_t result;

  if (!a1)
    return 4294967293;
  result = 0;
  *a1 = 8;
  return result;
}

uint64_t LibSer_GlobalContextCredentialGetProperty_Serialize(int a1, int a2, _DWORD *a3, _QWORD *a4)
{
  uint64_t result;

  result = 4294967293;
  if (a3 && a4 && *a4 >= 8uLL)
  {
    result = 0;
    *a3 = a1;
    a3[1] = a2;
    *a4 = 8;
  }
  return result;
}

uint64_t LibSer_GlobalContextCredentialGetProperty_Deserialize(_DWORD *a1, unint64_t a2, _DWORD *a3, _DWORD *a4)
{
  uint64_t result;

  result = 4294967293;
  if (a2 >= 8 && a1 && a3)
  {
    if (a4)
    {
      result = 0;
      *a3 = *a1;
      *a4 = a1[1];
    }
  }
  return result;
}

uint64_t LibSer_RemoveCredentialByType_GetSize(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t result;

  if (!a4)
    return 4294967293;
  result = 0;
  *a4 = 24;
  return result;
}

__n128 LibSer_RemoveCredentialByType_Serialize(__n128 *a1, unsigned __int32 a2, unsigned __int32 a3, __n128 *a4, _QWORD *a5)
{
  __n128 result;

  if (a1 && a4 && a5 && *a5 >= 0x18uLL)
  {
    result = *a1;
    *a4 = *a1;
    a4[1].n128_u32[0] = a2;
    a4[1].n128_u32[1] = a3;
    *a5 = 24;
  }
  return result;
}

__n128 LibSer_RemoveCredentialByType_Deserialize(__n128 *a1, unint64_t a2, __n128 *a3, _DWORD *a4, _DWORD *a5)
{
  __n128 result;

  if (a2 >= 0x18 && a1 && a3 && a4)
  {
    if (a5)
    {
      result = *a1;
      *a3 = *a1;
      *a4 = a1[1].n128_u32[0];
      *a5 = a1[1].n128_u32[1];
    }
  }
  return result;
}

uint64_t LibSer_DeleteContext_GetSize(uint64_t a1, _QWORD *a2)
{
  uint64_t result;

  if (!a2)
    return 4294967293;
  result = 0;
  *a2 = 16;
  return result;
}

__n128 LibSer_DeleteContext_Serialize(__n128 *a1, __n128 *a2, _QWORD *a3)
{
  __n128 result;

  if (a1 && a2 && a3 && *a3 >= 0x10uLL)
  {
    result = *a1;
    *a2 = *a1;
    *a3 = 16;
  }
  return result;
}

__n128 LibSer_DeleteContext_Deserialize(__n128 *a1, unint64_t a2, __n128 *a3)
{
  __n128 result;

  if (a2 >= 0x10 && a1)
  {
    if (a3)
    {
      result = *a1;
      *a3 = *a1;
    }
  }
  return result;
}

uint64_t LibSer_StorageAnyCmd_DeserializeCommonFields(uint64_t a1, unint64_t a2, _OWORD *a3, _DWORD *a4)
{
  uint64_t result;

  result = 4294967293;
  if (a1 && a2 >= 0x14)
  {
    if (a3)
      *a3 = *(_OWORD *)a1;
    result = 0;
    if (a4)
      *a4 = *(_DWORD *)(a1 + 16);
  }
  return result;
}

uint64_t LibSer_StorageSetData_GetSize(uint64_t a1, _DWORD *a2, unsigned int a3, _QWORD *a4)
{
  uint64_t result;
  unsigned int v7;

  v7 = 0;
  if (!a4)
    return 4294967291;
  result = getLengthOfParameters(a2, a3, &v7);
  if (!(_DWORD)result)
    *a4 = a1 + v7 + 28;
  return result;
}

uint64_t LibSer_StorageSetData_Serialize(_OWORD *a1, int a2, const void *a3, size_t a4, _DWORD *a5, unsigned int a6, uint64_t a7, size_t *a8)
{
  uint64_t result;
  size_t v17;
  unsigned int v18;

  result = 4294967293;
  if (a1)
  {
    if (a2)
    {
      if (a7)
      {
        if (a8)
        {
          v18 = 0;
          result = getLengthOfParameters(a5, a6, &v18);
          if (!(_DWORD)result)
          {
            if (*a8 < a4 + v18 + 28)
            {
              return 4294967293;
            }
            else
            {
              *(_OWORD *)a7 = *a1;
              *(_DWORD *)(a7 + 16) = a2;
              *(_DWORD *)(a7 + 20) = a4;
              memcpy((void *)(a7 + 24), a3, a4);
              v17 = a4 + 24;
              result = serializeParameters((uint64_t)a5, a6, a7, (uint64_t *)&v17);
              if (!(_DWORD)result)
                *a8 = v17;
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t LibSer_StorageSetData_Deserialize(uint64_t a1, unint64_t a2, _OWORD *a3, _DWORD *a4, _QWORD *a5, _QWORD *a6, _QWORD *a7, _DWORD *a8)
{
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v14[3];

  v10 = 4294967293;
  if (a1 && a2 >= 0x18 && a6 && a3 && a4 && a5 && a7 && a8)
  {
    v14[1] = v8;
    v14[2] = v9;
    *a3 = *(_OWORD *)a1;
    *a4 = *(_DWORD *)(a1 + 16);
    v11 = *(unsigned int *)(a1 + 20);
    v14[0] = 24;
    *a6 = v11;
    if ((_DWORD)v11)
    {
      v12 = v11 + 24;
      if (v12 > a2)
        return 4294967293;
      *a5 = a1 + 24;
      v14[0] = v12;
    }
    else
    {
      *a5 = 0;
    }
    return deserializeParameters(a1, a2, v14, a7, a8);
  }
  return v10;
}

uint64_t LibSer_StorageGetData_GetSize(_DWORD *a1, unsigned int a2, _QWORD *a3)
{
  uint64_t result;
  unsigned int v5;

  v5 = 0;
  if (!a3)
    return 4294967291;
  result = getLengthOfParameters(a1, a2, &v5);
  if (!(_DWORD)result)
    *a3 = v5 + 25;
  return result;
}

uint64_t LibSer_StorageGetData_Serialize(_OWORD *a1, int a2, char a3, _DWORD *a4, unsigned int a5, uint64_t a6, _QWORD *a7)
{
  uint64_t result;
  uint64_t v15;
  unsigned int v16;

  result = 4294967293;
  if (a1)
  {
    if (a2)
    {
      if (a6)
      {
        if (a7)
        {
          v16 = 0;
          result = getLengthOfParameters(a4, a5, &v16);
          if (!(_DWORD)result)
          {
            if (*a7 < (unint64_t)v16 + 25)
            {
              return 4294967293;
            }
            else
            {
              *(_OWORD *)a6 = *a1;
              *(_DWORD *)(a6 + 16) = a2;
              *(_BYTE *)(a6 + 20) = a3;
              v15 = 21;
              result = serializeParameters((uint64_t)a4, a5, a6, &v15);
              if (!(_DWORD)result)
                *a7 = v15;
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t LibSer_StorageGetData_Deserialize(uint64_t a1, unint64_t a2, _OWORD *a3, _DWORD *a4, BOOL *a5, _QWORD *a6, _DWORD *a7)
{
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v11[3];

  v9 = 4294967293;
  if (a1 && a2 >= 0x15 && a3 && a4 && a5)
  {
    v11[1] = v7;
    v11[2] = v8;
    *a3 = *(_OWORD *)a1;
    *a4 = *(_DWORD *)(a1 + 16);
    *a5 = *(_BYTE *)(a1 + 20) != 0;
    v11[0] = 21;
    return deserializeParameters(a1, a2, v11, a6, a7);
  }
  return v9;
}

uint64_t LibSer_GetUnlockSecret_GetSize(_DWORD *a1, unsigned int a2, _QWORD *a3)
{
  uint64_t result;
  unsigned int v5;

  v5 = 0;
  if (!a3)
    return 4294967291;
  result = getLengthOfParameters(a1, a2, &v5);
  if (!(_DWORD)result)
    *a3 = v5 + 20;
  return result;
}

uint64_t LibSer_GetUnlockSecret_Serialize(_OWORD *a1, _DWORD *a2, unsigned int a3, _OWORD *a4, _QWORD *a5)
{
  uint64_t result;
  uint64_t v11;
  unsigned int v12;

  result = 4294967293;
  if (a1)
  {
    if (a4)
    {
      if (a5)
      {
        v12 = 0;
        result = getLengthOfParameters(a2, a3, &v12);
        if (!(_DWORD)result)
        {
          if (*a5 < (unint64_t)v12 + 20)
          {
            return 4294967293;
          }
          else
          {
            *a4 = *a1;
            v11 = 16;
            result = serializeParameters((uint64_t)a2, a3, (uint64_t)a4, &v11);
            if (!(_DWORD)result)
              *a5 = v11;
          }
        }
      }
    }
  }
  return result;
}

uint64_t LibSer_GetUnlockSecret_Deserialize(_OWORD *a1, unint64_t a2, _OWORD *a3, _QWORD *a4, _DWORD *a5)
{
  unint64_t v5;
  unint64_t v6;
  uint64_t result;
  unint64_t v9[3];

  if (!a1)
    return 4294967293;
  result = 4294967293;
  if (a2 >= 0x10 && a3 && a4)
  {
    if (a5)
    {
      v9[1] = v5;
      v9[2] = v6;
      *a3 = *a1;
      v9[0] = 16;
      return deserializeParameters((uint64_t)a1, a2, v9, a4, a5);
    }
  }
  return result;
}

uint64_t LibSer_GetUnlockSecretResponse_GetSize(uint64_t a1, _QWORD *a2)
{
  uint64_t result;

  if (!a2)
    return 4294967291;
  result = 0;
  *a2 = a1 + 1;
  return result;
}

uint64_t LibSer_GetUnlockSecretResponse_Serialize(void *__src, size_t __n, char a3, _BYTE *a4, _QWORD *a5)
{
  uint64_t result;
  size_t v9;

  result = 4294967293;
  if (__src && __n && a4 && a5)
  {
    v9 = __n + 1;
    if (*a5 < __n + 1)
    {
      return 4294967293;
    }
    else
    {
      *a4 = a3;
      memcpy(a4 + 1, __src, __n);
      result = 0;
      *a5 = v9;
    }
  }
  return result;
}

uint64_t LibSer_GetUnlockSecretResponse_Deserialize(_BYTE *a1, uint64_t a2, _QWORD *a3, _QWORD *a4, _BYTE *a5)
{
  uint64_t result;

  result = 4294967293;
  if (a2 && a5 && a1 && a3)
  {
    if (a4)
    {
      result = 0;
      *a5 = *a1;
      *a3 = a1 + 1;
      *a4 = a2 - 1;
    }
  }
  return result;
}

uint64_t LibSer_SEPControl_GetSize(uint64_t a1, _DWORD *a2, unsigned int a3, _QWORD *a4)
{
  uint64_t result;
  unsigned int v7;

  v7 = 0;
  if (!a4)
    return 4294967291;
  result = getLengthOfParameters(a2, a3, &v7);
  if (!(_DWORD)result)
    *a4 = a1 + v7 + 24;
  return result;
}

uint64_t LibSer_SEPControl_Serialize(_OWORD *a1, _DWORD *a2, unsigned int a3, const void *a4, size_t a5, uint64_t a6, _QWORD *a7)
{
  uint64_t result;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unsigned int v18;

  result = 4294967293;
  if (a6)
  {
    if (a7)
    {
      v18 = 0;
      result = getLengthOfParameters(a2, a3, &v18);
      if (!(_DWORD)result)
      {
        if (*a7 < a5 + v18 + 24)
        {
          return 4294967293;
        }
        else
        {
          if (a1)
          {
            *(_OWORD *)a6 = *a1;
          }
          else
          {
            *(_QWORD *)a6 = 0;
            *(_QWORD *)(a6 + 8) = 0;
          }
          v17 = 16;
          result = serializeParameters((uint64_t)a2, a3, a6, &v17);
          if (!(_DWORD)result)
          {
            v15 = v17;
            *(_DWORD *)(a6 + v17) = a5;
            v16 = v15 + 4;
            memcpy((void *)(a6 + v15 + 4), a4, a5);
            result = 0;
            *a7 = v16 + a5;
          }
        }
      }
    }
  }
  return result;
}

uint64_t LibSer_SEPControl_Deserialize(_OWORD *a1, unint64_t a2, _OWORD *a3, _QWORD *a4, _DWORD *a5, unint64_t *a6, _QWORD *a7)
{
  uint64_t result;
  unint64_t v11;
  unint64_t v12;

  if (!a1)
    return 4294967293;
  result = 4294967293;
  if (a2 >= 0x18 && a7 && a3 && a4 && a5 && a6)
  {
    *a3 = *a1;
    v12 = 16;
    result = deserializeParameters((uint64_t)a1, a2, &v12, a4, a5);
    if (!(_DWORD)result)
    {
      v11 = (unint64_t)a1 + v12 + 4;
      *a7 = *(unsigned int *)((char *)a1 + v12);
      *a6 = v11;
    }
  }
  return result;
}

uint64_t LibSer_SEPControlResponse_GetSize(uint64_t a1, _QWORD *a2)
{
  uint64_t result;

  if (!a2)
    return 4294967291;
  result = 0;
  *a2 = a1 + 4;
  return result;
}

uint64_t LibSer_SEPControlResponse_Serialize(void *__src, size_t __n, _DWORD *a3, uint64_t *a4)
{
  uint64_t result;
  uint64_t v8;

  result = 4294967293;
  if (a3 && a4)
  {
    v8 = __n + 4;
    if (*a4 < __n + 4)
    {
      return 4294967293;
    }
    else
    {
      *a3 = __n;
      if (__src)
        memcpy(a3 + 1, __src, __n);
      else
        v8 = 4;
      result = 0;
      *a4 = v8;
    }
  }
  return result;
}

uint64_t LibSer_SEPControlResponse_Deserialize(unsigned int *a1, unint64_t a2, _QWORD *a3, _QWORD *a4)
{
  uint64_t result;
  _DWORD *v6;
  unsigned int v7;

  if (!a1)
    return 4294967293;
  result = 4294967293;
  if (a2 >= 4 && a3 && a4)
  {
    result = 0;
    v7 = *a1;
    v6 = a1 + 1;
    *a4 = v7;
    if (!v7)
      v6 = 0;
    *a3 = v6;
  }
  return result;
}

uint64_t checkParameter(_DWORD *a1)
{
  if (!a1)
    return 4294967293;
  switch(*a1)
  {
    case 0:
    case 0xC:
      if (a1[4])
        return 4294967293;
      break;
    case 1:
    case 4:
    case 5:
    case 0xA:
      if (a1[4] != 4)
        return 4294967293;
      break;
    case 2:
    case 6:
    case 7:
      if (a1[4] != 16)
        return 4294967293;
      break;
    case 3:
      if ((a1[4] - 1001) < 0xFFFFFC18)
        return 4294967293;
      break;
    case 8:
    case 9:
      if (a1[4] != 1)
        return 4294967293;
      break;
    case 0xB:
      if (a1[4] > 0x400u)
        return 4294967293;
      break;
    default:
      return 4294967293;
  }
  return 0;
}

uint64_t LibCall_ACMKernelControl_Block(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  size_t v4;
  size_t v5;
  const void *v6;
  const void *v7;
  int v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t, _QWORD, char *, size_t, uint64_t, uint64_t);
  uint64_t v13;
  _BYTE *v14;
  unsigned int v15;
  uint64_t v17;
  _BYTE v18[8192];
  uint64_t v19;

  v1 = MEMORY[0x24BDAC7A8](a1);
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v12 = (uint64_t (*)(uint64_t, uint64_t, _QWORD, char *, size_t, uint64_t, uint64_t))v1;
  v19 = *MEMORY[0x24BDAC8D0];
  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMKernelControl_Block");
  v17 = 0x2000;
  v13 = LibCall_ACMKernelControl(v12, v11, v9, v7, v5, (uint64_t)v18, (uint64_t)&v17);
  if (v3)
  {
    if (v17)
      v14 = v18;
    else
      v14 = 0;
    (*(void (**)(uint64_t, _BYTE *))(v3 + 16))(v3, v14);
  }
  if ((_DWORD)v13)
    v15 = 70;
  else
    v15 = 10;
  if (v15 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMKernelControl_Block", (int)v13);
  return v13;
}

uint64_t LibCall_ACMSEPControl_Block(uint64_t (*a1)(uint64_t, uint64_t, _QWORD, char *, uint64_t, unsigned int *, unint64_t *), uint64_t a2, const void *a3, size_t a4, uint64_t a5, _DWORD *a6, unsigned int a7, uint64_t a8)
{
  uint64_t v16;
  _BYTE *v17;
  unsigned int v18;
  size_t v20;
  _BYTE v21[1024];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMSEPControl_Block");
  v20 = 1024;
  v16 = LibCall_ACMSEPControl(a1, a2, a3, a4, a5, a6, a7, v21, &v20);
  if (a8)
  {
    if (v20)
      v17 = v21;
    else
      v17 = 0;
    (*(void (**)(uint64_t, _BYTE *))(a8 + 16))(a8, v17);
  }
  if ((_DWORD)v16)
    v18 = 70;
  else
    v18 = 10;
  if (v18 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMSEPControl_Block", (int)v16);
  return v16;
}

uint64_t LibCall_ACMGlobalContextCredentialGetProperty_Block(uint64_t result, uint64_t a2, int a3, int a4, uint64_t a5)
{
  uint64_t (*v9)(uint64_t, uint64_t, _QWORD, int *, uint64_t, _BYTE *, uint64_t *);
  uint64_t v10;
  _BYTE *v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  _BYTE v16[256];
  uint64_t v17;

  v9 = (uint64_t (*)(uint64_t, uint64_t, _QWORD, int *, uint64_t, _BYTE *, uint64_t *))result;
  v17 = *MEMORY[0x24BDAC8D0];
  if (gACMLoggingLevel <= 0xAu)
    result = printf("%s: %s: called.\n", "ACM", "LibCall_ACMGlobalContextCredentialGetProperty_Block");
  v14 = 256;
  if (v9)
  {
    v13 = 8;
    result = LibSer_GlobalContextCredentialGetProperty_Serialize(a3, a4, &v15, &v13);
    if ((_DWORD)result)
    {
LABEL_7:
      v10 = result;
      goto LABEL_8;
    }
    if (v13 == 8)
    {
      result = v9(a2, 27, 0, &v15, 8, v16, &v14);
      goto LABEL_7;
    }
    v10 = 4294967291;
  }
  else
  {
    v10 = 4294967293;
  }
LABEL_8:
  if (a5)
  {
    if (v14)
      v11 = v16;
    else
      v11 = 0;
    result = (*(uint64_t (**)(uint64_t, uint64_t, _BYTE *))(a5 + 16))(a5, v10, v11);
  }
  if ((_DWORD)v10)
    v12 = 70;
  else
    v12 = 10;
  if (v12 >= gACMLoggingLevel)
    return printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMGlobalContextCredentialGetProperty_Block", (int)v10);
  return result;
}

uint64_t LibCall_ACMContextVerifyPolicy_Block(uint64_t (*a1)(uint64_t, uint64_t, _QWORD, _OWORD *, size_t, unsigned int *, unint64_t *), uint64_t a2, _OWORD *a3, char *a4, uint64_t a5)
{
  return LibCall_ACMContextVerifyPolicyWithPreflight_Block(a1, a2, a3, a4, 0, a5);
}

uint64_t LibCall_ACMContextVerifyPolicyWithPreflight_Block(uint64_t (*a1)(uint64_t, uint64_t, _QWORD, _OWORD *, size_t, unsigned int *, unint64_t *), uint64_t a2, _OWORD *a3, char *__s1, uint64_t a5, uint64_t a6)
{
  unsigned int v12;
  uint64_t v13;
  int *v14;
  BOOL v16;
  int *v17;

  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMContextVerifyPolicyWithPreflight_Block");
  v17 = 0;
  v16 = 0;
  v12 = 70;
  v13 = 4294967293;
  if (a3 && __s1 && a6)
  {
    v13 = LibCall_ACMContextVerifyPolicyEx(a1, a2, a3, __s1, a5, 0, 0, 0, &v16, &v17);
    v14 = v17;
    if (!(_DWORD)v13)
    {
      (*(void (**)(uint64_t, BOOL, int *))(a6 + 16))(a6, v16, v17);
      v14 = v17;
    }
    if (v14)
      Util_DeallocRequirement(v14);
    if ((_DWORD)v13)
      v12 = 70;
    else
      v12 = 10;
  }
  if (v12 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMContextVerifyPolicyWithPreflight_Block", (int)v13);
  return v13;
}

int *LibCall_ACMContextVerifyPolicyEx_Block(uint64_t (*a1)(uint64_t, uint64_t, _QWORD, _OWORD *, size_t, unsigned int *, unint64_t *), uint64_t a2, _OWORD *a3, char *__s1, uint64_t a5, _DWORD *a6, unsigned int a7, uint64_t a8, uint64_t a9)
{
  _BOOL8 v17;
  int *v18;
  uint64_t v19;
  int *result;
  BOOL v21;
  int *v22;

  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMContextVerifyPolicyEx_Block");
  v17 = 0;
  v18 = 0;
  v22 = 0;
  v21 = 0;
  v19 = 4294967293;
  if (a3 && __s1 && a9)
  {
    v19 = LibCall_ACMContextVerifyPolicyEx(a1, a2, a3, __s1, a5, a6, a7, a8, &v21, &v22);
    v18 = v22;
    v17 = v21;
  }
  (*(void (**)(uint64_t, uint64_t, _BOOL8, int *))(a9 + 16))(a9, v19, v17, v18);
  result = v22;
  if (v22)
    result = (int *)Util_DeallocRequirement(v22);
  if (gACMLoggingLevel <= 0xAu)
    return (int *)printf("%s: %s: returning.\n", "ACM", "LibCall_ACMContextVerifyPolicyEx_Block");
  return result;
}

uint64_t LibCall_ACMGlobalContextVerifyPolicy_Block(uint64_t (*a1)(uint64_t, uint64_t, _QWORD, _OWORD *, size_t, unsigned int *, unint64_t *), uint64_t a2, char *a3, uint64_t a4, _DWORD *a5, unsigned int a6, uint64_t a7)
{
  uint64_t result;
  int v15[2];

  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMGlobalContextVerifyPolicy_Block");
  *(_QWORD *)v15 = 0;
  result = LibCall_ACMContextCreate((uint64_t (*)(uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _BYTE *, uint64_t *))a1, a2, v15, 0, 1);
  if ((_DWORD)result)
  {
    if (a7)
      result = (*(uint64_t (**)(uint64_t, uint64_t, _QWORD, _QWORD))(a7 + 16))(a7, result, 0, 0);
  }
  else
  {
    result = (uint64_t)LibCall_ACMContextVerifyPolicyEx_Block(a1, a2, *(_OWORD **)v15, a3, a4, a5, a6, 0xFFFFFFFFLL, a7);
  }
  if (*(_QWORD *)v15)
    result = LibCall_ACMContextDelete((void (*)(uint64_t, uint64_t, _QWORD, void *, uint64_t, _QWORD, _QWORD))a1, a2, *(void **)v15, 1);
  if (gACMLoggingLevel <= 0xAu)
    return printf("%s: %s: returning.\n", "ACM", "LibCall_ACMGlobalContextVerifyPolicy_Block");
  return result;
}

uint64_t LibCall_ACMGetEnvironmentVariable_Block(uint64_t (*a1)(uint64_t, uint64_t, _QWORD, int *, uint64_t, uint64_t, uint64_t), uint64_t a2, int a3, uint64_t a4)
{
  void *v8;
  uint64_t v9;
  void *v10;
  _BYTE *v11;
  unsigned int v12;
  uint64_t v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMGetEnvironmentVariable_Block");
  v14 = 128;
  if (!a4)
  {
    v12 = 70;
    v9 = 4294967293;
    goto LABEL_17;
  }
  if (a3 == 36)
  {
    v8 = acm_mem_alloc_data(0x800uLL);
    acm_mem_alloc_info("<data>", v8, 2048, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCallBlock.c", 162, "LibCall_ACMGetEnvironmentVariable_Block");
    if (!v8)
    {
      v12 = 70;
      v9 = 4294967292;
      goto LABEL_17;
    }
    v14 = 2048;
    v9 = LibCall_ACMGetEnvironmentVariable(a1, a2, 36, (uint64_t)v8, (uint64_t)&v14);
    if (!(_DWORD)v9)
    {
      if (v14)
        v10 = v8;
      else
        v10 = 0;
      (*(void (**)(uint64_t, void *))(a4 + 16))(a4, v10);
      acm_mem_free_info("<data>", v8, 0x800uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCallBlock.c", 176, "LibCall_ACMGetEnvironmentVariable_Block");
      acm_mem_free_data(v8, 0x800uLL);
LABEL_16:
      v12 = 10;
      goto LABEL_17;
    }
    acm_mem_free_info("<data>", v8, 0x800uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCallBlock.c", 176, "LibCall_ACMGetEnvironmentVariable_Block");
    acm_mem_free_data(v8, 0x800uLL);
  }
  else
  {
    v9 = LibCall_ACMGetEnvironmentVariable(a1, a2, a3, (uint64_t)v15, (uint64_t)&v14);
    if (!(_DWORD)v9)
    {
      if (v14)
        v11 = v15;
      else
        v11 = 0;
      (*(void (**)(uint64_t, _BYTE *))(a4 + 16))(a4, v11);
      goto LABEL_16;
    }
  }
  v12 = 70;
LABEL_17:
  if (v12 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMGetEnvironmentVariable_Block", (int)v9);
  return v9;
}

uint64_t LibCall_ACMTRMLoadState_Block(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, uint64_t, uint64_t);
  uint64_t v7;
  _BYTE *v8;
  unsigned int v9;
  uint64_t v11;
  _BYTE v12[8192];
  uint64_t v13;

  v1 = MEMORY[0x24BDAC7A8](a1);
  v3 = v2;
  v5 = v4;
  v6 = (uint64_t (*)(uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, uint64_t, uint64_t))v1;
  v13 = *MEMORY[0x24BDAC8D0];
  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMTRMLoadState_Block");
  v11 = 0x2000;
  if (v3)
  {
    v7 = LibCall_ACMTRMLoadState(v6, v5, (uint64_t)v12, (uint64_t)&v11);
    if ((_DWORD)v7)
    {
      v9 = 70;
    }
    else
    {
      if (v11)
        v8 = v12;
      else
        v8 = 0;
      (*(void (**)(uint64_t, _BYTE *))(v3 + 16))(v3, v8);
      v9 = 10;
    }
  }
  else
  {
    v9 = 70;
    v7 = 4294967293;
  }
  if (v9 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMTRMLoadState_Block", (int)v7);
  return v7;
}

uint64_t LibCall_ACMContextUnloadToImage_Block(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  _BYTE v8[4096];
  uint64_t v9;

  v1 = MEMORY[0x24BDAC7A8](a1);
  v3 = v2;
  v4 = v1;
  v9 = *MEMORY[0x24BDAC8D0];
  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMContextUnloadToImage_Block");
  if (v3)
  {
    v5 = LibCall_ACMContextUnloadToImage(v4);
    if ((_DWORD)v5)
    {
      v6 = 70;
    }
    else
    {
      (*(void (**)(uint64_t, _BYTE *))(v3 + 16))(v3, v8);
      v6 = 10;
    }
  }
  else
  {
    v6 = 70;
    v5 = 4294967293;
  }
  if (v6 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMContextUnloadToImage_Block", (int)v5);
  return v5;
}

uint64_t LibCall_ACMGetAclAuthMethod_Block(uint64_t result, uint64_t a2, __n128 *a3, uint64_t a4)
{
  void (*v7)(uint64_t, uint64_t, _QWORD, __n128 *, uint64_t, _BYTE *, uint64_t *, __n128);
  __n128 AclAuthMethod_Serialize;
  int v9;
  uint64_t v10;
  uint64_t v11;
  __n128 v12;
  _BYTE v13[256];
  uint64_t v14;

  v7 = (void (*)(uint64_t, uint64_t, _QWORD, __n128 *, uint64_t, _BYTE *, uint64_t *, __n128))result;
  v14 = *MEMORY[0x24BDAC8D0];
  if (gACMLoggingLevel <= 0xAu)
    result = printf("%s: %s: called.\n", "ACM", "LibCall_ACMGetAclAuthMethod_Block");
  v11 = 256;
  if (v7 && a3 && a4)
  {
    v10 = 16;
    AclAuthMethod_Serialize = LibSer_GetAclAuthMethod_Serialize(a3, &v12, &v10);
    if (!v9 && v10 == 16)
      v7(a2, 31, 0, &v12, 16, v13, &v11, AclAuthMethod_Serialize);
    goto LABEL_9;
  }
  if (a4)
LABEL_9:
    result = (*(uint64_t (**)(uint64_t))(a4 + 16))(a4);
  if (gACMLoggingLevel <= 0xAu)
    return printf("%s: %s: returning.\n", "ACM", "LibCall_ACMGetAclAuthMethod_Block");
  return result;
}

uint64_t LibCall_ACMContextVerifyAclConstraint(uint64_t a1, uint64_t a2, _OWORD *a3, const void *a4, uint64_t a5, unsigned __int8 a6, _DWORD *a7, unsigned int a8, unsigned int a9, uint64_t a10)
{
  return verifyAclConstraintForOperationCommandInternal(a1, a2, 0xBu, a3, a4, a5, 0, 0, a6, a7, a8, a9, a10);
}

uint64_t verifyAclConstraintForOperationCommandInternal(uint64_t result, uint64_t a2, unsigned __int8 a3, _OWORD *a4, const void *a5, uint64_t a6, const void *a7, unsigned int a8, unsigned __int8 a9, _DWORD *a10, unsigned int a11, unsigned int a12, uint64_t a13)
{
  uint64_t (*v20)(uint64_t, uint64_t, _QWORD, void *, size_t, unsigned int *, unint64_t *);
  uint64_t v21;
  int *v22;
  _BOOL8 v23;
  BOOL v24;
  int *v25;

  v20 = (uint64_t (*)(uint64_t, uint64_t, _QWORD, void *, size_t, unsigned int *, unint64_t *))result;
  if (gACMLoggingLevel <= 0xAu)
    result = printf("%s: %s: called.\n", "ACM", "verifyAclConstraintForOperationCommandInternal");
  v25 = 0;
  v24 = 0;
  if (a4 && a5 && a6 && a13)
  {
    v21 = verifyAclConstraintInternal(v20, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, &v24, &v25);
    v22 = v25;
    v23 = v24;
  }
  else
  {
    if (!a13)
      goto LABEL_10;
    v22 = 0;
    v23 = 0;
    v21 = 4294967293;
  }
  (*(void (**)(uint64_t, uint64_t, _BOOL8, int *))(a13 + 16))(a13, v21, v23, v22);
  result = (uint64_t)v25;
  if (v25)
    result = Util_DeallocRequirement(v25);
LABEL_10:
  if (gACMLoggingLevel <= 0xAu)
    return printf("%s: %s: returning.\n", "ACM", "verifyAclConstraintForOperationCommandInternal");
  return result;
}

uint64_t LibCall_ACMContextVerifyAclConstraintForOperation(uint64_t a1, uint64_t a2, _OWORD *a3, const void *a4, uint64_t a5, const void *a6, unsigned int a7, unsigned __int8 a8, _DWORD *a9, unsigned int a10, unsigned int a11, uint64_t a12)
{
  return verifyAclConstraintForOperationCommandInternal(a1, a2, 0x20u, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12);
}

uint64_t Util_GetBitCount(uint64_t a1)
{
  uint8x8_t v1;

  v1 = (uint8x8_t)vcnt_s8((int8x8_t)a1);
  v1.i16[0] = vaddlv_u8(v1);
  return v1.u32[0];
}

BOOL Util_isNullOrZeroMemory(_BYTE *a1, uint64_t a2)
{
  if (!a1)
    return 1;
  if (*a1)
    return 0;
  return memcmp(a1, a1 + 1, a2 - 1) == 0;
}

BOOL Util_isNonNullEqualMemory(void *__s1, size_t __n, void *__s2, uint64_t a4)
{
  _BOOL8 result;

  if (__n != a4)
    return 0;
  result = 0;
  if (__s1)
  {
    if (__s2)
      return memcmp(__s1, __s2, __n) == 0;
  }
  return result;
}

char *Util_hexDumpToStrHelper(char *result, unint64_t a2, uint64_t a3, unint64_t a4)
{
  unint64_t v4;
  _BYTE *v5;
  char v6;

  if (!result && a2)
    Util_hexDumpToStrHelper_cold_1();
  if (!a3 && a4)
    Util_hexDumpToStrHelper_cold_2();
  if (a2 >= a4)
    v4 = a4;
  else
    v4 = a2;
  if (v4)
  {
    v5 = (_BYTE *)(a3 + 1);
    do
    {
      *(v5 - 1) = a0123456789abcd_0[(unint64_t)*result >> 4];
      v6 = *result++;
      *v5 = a0123456789abcd_0[v6 & 0xF];
      v5 += 2;
      --v4;
    }
    while (v4);
  }
  return result;
}

uint64_t Util_WriteToBuffer(uint64_t a1, size_t a2, _QWORD *a3, void *__src, size_t __n)
{
  uint64_t v10;
  size_t v11;
  uint64_t v12;
  unsigned int v13;

  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "Util_WriteToBuffer");
  if (a3)
  {
    v10 = *a3;
    v11 = *a3 + __n;
    if (!__CFADD__(*a3, __n))
    {
      if (a1 && v11 > a2)
      {
        v12 = 4294967276;
        goto LABEL_19;
      }
      if (!a1 || !__src || !__n)
        goto LABEL_12;
      if (!__CFADD__(a1, v10))
      {
        memcpy((void *)(a1 + v10), __src, __n);
LABEL_12:
        v12 = 0;
        *a3 = v11;
        v13 = 10;
        goto LABEL_13;
      }
    }
    v12 = 4294967291;
  }
  else
  {
    v12 = 4294967293;
  }
LABEL_19:
  v13 = 70;
LABEL_13:
  if (v13 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "Util_WriteToBuffer", (int)v12);
  return v12;
}

uint64_t Util_ReadFromBuffer(uint64_t a1, size_t a2, _QWORD *a3, void *__dst, size_t __n)
{
  uint64_t v10;
  unsigned int v11;
  uint64_t v12;
  size_t v13;

  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "Util_ReadFromBuffer");
  v10 = 4294967293;
  v11 = 70;
  if (a1 && a3)
  {
    v12 = *a3;
    v13 = *a3 + __n;
    if (!__CFADD__(*a3, __n))
    {
      if (v13 > a2)
      {
        v10 = 4294967276;
        goto LABEL_17;
      }
      if (!__dst || !__n)
        goto LABEL_11;
      if (!__CFADD__(a1, v12))
      {
        memcpy(__dst, (const void *)(a1 + v12), __n);
LABEL_11:
        v10 = 0;
        *a3 = v13;
        v11 = 10;
        goto LABEL_12;
      }
    }
    v10 = 4294967291;
LABEL_17:
    v11 = 70;
  }
LABEL_12:
  if (v11 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "Util_ReadFromBuffer", (int)v10);
  return v10;
}

unint64_t Util_KeybagLockStateToEnvVar(unsigned int a1)
{
  unint64_t v1;

  v1 = 0x2010103020201uLL >> (8 * a1);
  if (a1 >= 7)
    LOBYTE(v1) = 1;
  return v1 & 3;
}

void Util_SafeDeallocParameters(unsigned int *a1, unsigned int a2)
{
  uint64_t v3;
  unsigned int *v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;

  if (a1)
  {
    v3 = a2;
    if (a2)
    {
      v4 = a1 + 4;
      v5 = a2;
      do
      {
        v6 = (void *)*((_QWORD *)v4 - 1);
        if (v6)
        {
          v7 = *v4;
          acm_mem_free_info("<data>", *((const void **)v4 - 1), v7, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 118, "Util_SafeDeallocParameters");
          acm_mem_free_data(v6, v7);
        }
        v4 += 6;
        --v5;
      }
      while (v5);
    }
    acm_mem_free_info("array of ACMParameter", a1, 24 * v3, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 121, "Util_SafeDeallocParameters");
    acm_mem_free(a1, 24 * v3);
  }
}

uint64_t Util_DeallocCredential(_DWORD *a1)
{
  uint64_t v2;
  unsigned int v3;
  const char *v4;
  rsize_t v5;
  const void *v6;
  unint64_t v7;
  int v8;

  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "Util_DeallocCredential");
  if (a1)
  {
    v2 = 4294967293;
    v3 = 70;
    switch(*a1)
    {
      case 1:
        v4 = "ACMCredential - ACMCredentialDataPasscodeValidated";
        v5 = 60;
        v6 = a1;
        v7 = 60;
        v8 = 144;
        goto LABEL_6;
      case 2:
        v4 = "ACMCredential - ACMCredentialDataPassphraseEntered";
        v5 = 168;
        v6 = a1;
        v7 = 168;
        v8 = 136;
        goto LABEL_6;
      case 3:
        v4 = "ACMCredential - ACMCredentialDataBiometryMatched";
        v5 = 337;
        v6 = a1;
        v7 = 337;
        v8 = 140;
        goto LABEL_6;
      case 4:
      case 5:
      case 6:
      case 8:
      case 0xE:
      case 0x10:
      case 0x13:
      case 0x16:
      case 0x17:
        v4 = "ACMCredential";
        v5 = 32;
        v6 = a1;
        v7 = 32;
        v8 = 189;
        goto LABEL_6;
      case 7:
        v4 = "ACMCredential - ACMCredentialDataUserOutputDisplayed";
        v5 = 88;
        v6 = a1;
        v7 = 88;
        v8 = 152;
        goto LABEL_6;
      case 9:
        v4 = "ACMCredential - ACMCredentialDataContinuityUnlock";
        v5 = 56;
        v6 = a1;
        v7 = 56;
        v8 = 156;
        goto LABEL_6;
      case 0xA:
        v4 = "ACMCredential - ACMCredentialDataPasscodeValidated2";
        v5 = 84;
        v6 = a1;
        v7 = 84;
        v8 = 148;
        goto LABEL_6;
      case 0xC:
      case 0xF:
        v4 = "ACMCredential - ACMCredentialDataKextDenyList";
        v5 = 40;
        v6 = a1;
        v7 = 40;
        v8 = 161;
        goto LABEL_6;
      case 0xD:
        v4 = "ACMCredential - ACMCredentialDataPassphraseExtractable";
        v5 = 164;
        v6 = a1;
        v7 = 164;
        v8 = 132;
        goto LABEL_6;
      case 0x11:
        v4 = "ACMCredential - ACMCredentialDataSecureIntent";
        v5 = 113;
        v6 = a1;
        v7 = 113;
        v8 = 165;
        goto LABEL_6;
      case 0x12:
        v4 = "ACMCredential - ACMCredentialDataBiometryMatchAttempted";
        v5 = 52;
        v6 = a1;
        v7 = 52;
        v8 = 169;
        goto LABEL_6;
      case 0x14:
        v4 = "ACMCredential - ACMCredentialDataAP";
        v5 = 64;
        v6 = a1;
        v7 = 64;
        v8 = 173;
        goto LABEL_6;
      case 0x15:
        v4 = "ACMCredential - ACMCredentialDataSignature";
        v5 = 164;
        v6 = a1;
        v7 = 164;
        v8 = 177;
LABEL_6:
        acm_mem_free_info(v4, v6, v7, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", v8, "Util_DeallocCredential");
        acm_mem_free(a1, v5);
        v2 = 0;
        v3 = 10;
        break;
      default:
        break;
    }
  }
  else
  {
    v2 = 4294967293;
    v3 = 70;
  }
  if (v3 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "Util_DeallocCredential", (int)v2);
  return v2;
}

uint64_t Util_AllocCredential(int a1, _QWORD *a2)
{
  uint64_t result;
  _DWORD *v5;
  int v6;
  const char *v7;
  const void *v8;
  int v9;

  if (!a2)
    return 4294967293;
  result = 4294967293;
  switch(a1)
  {
    case 1:
      v5 = acm_mem_alloc(0x3CuLL);
      acm_mem_alloc_info("ACMCredential - ACMCredentialDataPasscodeValidated", v5, 60, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 226, "Util_AllocCredential");
      v6 = 28;
      goto LABEL_4;
    case 2:
      v5 = acm_mem_alloc(0xA8uLL);
      acm_mem_alloc_info("ACMCredential - ACMCredentialDataPassphraseEntered", v5, 168, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 216, "Util_AllocCredential");
      v6 = 136;
      goto LABEL_4;
    case 3:
      v5 = acm_mem_alloc(0x151uLL);
      acm_mem_alloc_info("ACMCredential - ACMCredentialDataBiometryMatched", v5, 337, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 221, "Util_AllocCredential");
      v6 = 305;
      goto LABEL_4;
    case 4:
    case 5:
    case 6:
    case 8:
    case 14:
    case 16:
    case 19:
    case 22:
    case 23:
      v5 = acm_mem_alloc(0x20uLL);
      acm_mem_alloc_info("ACMCredential", v5, 32, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 280, "Util_AllocCredential");
      v6 = 0;
      goto LABEL_4;
    case 7:
      v5 = acm_mem_alloc(0x58uLL);
      acm_mem_alloc_info("ACMCredential - ACMCredentialDataUserOutputDisplayed", v5, 88, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 236, "Util_AllocCredential");
      v6 = 56;
      goto LABEL_4;
    case 9:
      v5 = acm_mem_alloc(0x38uLL);
      acm_mem_alloc_info("ACMCredential - ACMCredentialDataContinuityUnlock", v5, 56, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 241, "Util_AllocCredential");
      v6 = 24;
      goto LABEL_4;
    case 10:
      v5 = acm_mem_alloc(0x54uLL);
      acm_mem_alloc_info("ACMCredential - ACMCredentialDataPasscodeValidated2", v5, 84, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 231, "Util_AllocCredential");
      v6 = 52;
      goto LABEL_4;
    case 12:
    case 15:
      v5 = acm_mem_alloc(0x28uLL);
      acm_mem_alloc_info("ACMCredential - ACMCredentialDataKextDenyList", v5, 40, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 247, "Util_AllocCredential");
      v6 = 8;
      goto LABEL_4;
    case 13:
      v5 = acm_mem_alloc(0xA4uLL);
      v7 = "ACMCredential - ACMCredentialDataPassphraseExtractable";
      v8 = v5;
      v9 = 211;
      goto LABEL_18;
    case 17:
      v5 = acm_mem_alloc(0x71uLL);
      acm_mem_alloc_info("ACMCredential - ACMCredentialDataSecureIntent", v5, 113, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 252, "Util_AllocCredential");
      v6 = 81;
      goto LABEL_4;
    case 18:
      v5 = acm_mem_alloc(0x34uLL);
      acm_mem_alloc_info("ACMCredential - ACMCredentialDataBiometryMatchAttempted", v5, 52, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 257, "Util_AllocCredential");
      v6 = 20;
      goto LABEL_4;
    case 20:
      v5 = acm_mem_alloc(0x40uLL);
      acm_mem_alloc_info("ACMCredential - ACMCredentialDataAP", v5, 64, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 262, "Util_AllocCredential");
      v6 = 32;
      goto LABEL_4;
    case 21:
      v5 = acm_mem_alloc(0xA4uLL);
      v7 = "ACMCredential - ACMCredentialDataSignature";
      v8 = v5;
      v9 = 267;
LABEL_18:
      acm_mem_alloc_info(v7, v8, 164, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", v9, "Util_AllocCredential");
      v6 = 132;
LABEL_4:
      if (v5)
      {
        result = 0;
        *v5 = a1;
        v5[1] = 1;
        v5[7] = v6;
        v5[3] = -1;
        *a2 = v5;
      }
      else
      {
        result = 4294967292;
      }
      break;
    default:
      return result;
  }
  return result;
}

uint64_t Util_AllocRequirement(int a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v6;
  unsigned int v7;
  _DWORD *v8;
  int v9;
  const char *v11;
  const void *v12;
  int v13;
  const char *v14;
  const void *v15;
  int v16;

  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "Util_AllocRequirement");
  if (a3)
  {
    v6 = 4294967293;
    v7 = 70;
    switch(a1)
    {
      case 1:
        v8 = acm_mem_alloc(0x14uLL);
        v11 = "ACMRequirement - ACMRequirementDataPasscodeValidated";
        v12 = v8;
        v13 = 338;
        goto LABEL_49;
      case 2:
        v8 = acm_mem_alloc(0x14uLL);
        v11 = "ACMRequirement - ACMRequirementDataPassphraseEntered";
        v12 = v8;
        v13 = 343;
        goto LABEL_49;
      case 3:
        v8 = acm_mem_alloc(0xACuLL);
        acm_mem_alloc_info("ACMRequirement - ACMRequirementDataBiometryMatched", v8, 172, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 348, "Util_AllocRequirement");
        v9 = 156;
        if (!v8)
          goto LABEL_50;
        goto LABEL_6;
      case 4:
        if ((unint64_t)(a2 - 11) < 0xFFFFFFFFFFFFFFF6)
          goto LABEL_53;
        v8 = acm_mem_alloc(0x64uLL);
        v14 = "ACMRequirement - ACMRequirementDataOr";
        v15 = v8;
        v16 = 406;
        goto LABEL_28;
      case 5:
        if ((unint64_t)(a2 - 11) < 0xFFFFFFFFFFFFFFF6)
          goto LABEL_53;
        v8 = acm_mem_alloc(0x64uLL);
        v14 = "ACMRequirement - ACMRequirementDataAnd";
        v15 = v8;
        v16 = 398;
LABEL_28:
        acm_mem_alloc_info(v14, v15, 100, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", v16, "Util_AllocRequirement");
        v9 = 84;
        if (!v8)
          goto LABEL_50;
        goto LABEL_6;
      case 6:
      case 9:
      case 10:
      case 11:
      case 12:
      case 14:
      case 15:
      case 18:
      case 19:
      case 22:
      case 23:
      case 27:
      case 28:
        v8 = acm_mem_alloc(0x10uLL);
        acm_mem_alloc_info("ACMRequirement", v8, 16, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 333, "Util_AllocRequirement");
        v9 = 0;
        if (v8)
          goto LABEL_6;
        goto LABEL_50;
      case 7:
        if ((unint64_t)(a2 - 11) < 0xFFFFFFFFFFFFFFF6)
          goto LABEL_53;
        v8 = acm_mem_alloc(0x68uLL);
        acm_mem_alloc_info("ACMRequirement - ACMRequirementDataKofN", v8, 104, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 391, "Util_AllocRequirement");
        v9 = 88;
        if (!v8)
          goto LABEL_50;
        goto LABEL_6;
      case 8:
        v8 = acm_mem_alloc(0x410uLL);
        acm_mem_alloc_info("ACMRequirement - ACMRequirementDataAccessGroups", v8, 1040, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 378, "Util_AllocRequirement");
        v9 = 1024;
        if (!v8)
          goto LABEL_50;
        goto LABEL_6;
      case 13:
        v8 = acm_mem_alloc(0x30uLL);
        acm_mem_alloc_info("ACMRequirement - ACMRequirementDataUserOutputDisplayed", v8, 48, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 363, "Util_AllocRequirement");
        v9 = 32;
        if (!v8)
          goto LABEL_50;
        goto LABEL_6;
      case 16:
      case 17:
        break;
      case 20:
        v8 = acm_mem_alloc(0x14uLL);
        v11 = "ACMRequirement - ACMRequirementDataSecureIntent";
        v12 = v8;
        v13 = 353;
        goto LABEL_49;
      case 21:
        v8 = acm_mem_alloc(0x14uLL);
        v11 = "ACMRequirement - ACMRequirementDataBiometryMatchAttempted";
        v12 = v8;
        v13 = 358;
LABEL_49:
        acm_mem_alloc_info(v11, v12, 20, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", v13, "Util_AllocRequirement");
        v9 = 4;
        if (!v8)
          goto LABEL_50;
        goto LABEL_6;
      case 24:
        v8 = acm_mem_alloc(0x434uLL);
        acm_mem_alloc_info("ACMRequirement - ACMRequirementDataAP", v8, 1076, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 368, "Util_AllocRequirement");
        v9 = 1060;
        if (!v8)
          goto LABEL_50;
        goto LABEL_6;
      case 25:
        v8 = acm_mem_alloc(0x3BuLL);
        acm_mem_alloc_info("ACMRequirement - ACMRequirementDataKeyRef", v8, 59, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 373, "Util_AllocRequirement");
        v9 = 43;
        if (!v8)
          goto LABEL_50;
        goto LABEL_6;
      case 26:
        v8 = acm_mem_alloc(0x2CuLL);
        acm_mem_alloc_info("ACMRequirement - ACMRequirementDataRatchet", v8, 44, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 384, "Util_AllocRequirement");
        v9 = 28;
        if (!v8)
        {
LABEL_50:
          v6 = 4294967292;
          goto LABEL_54;
        }
LABEL_6:
        *v8 = a1;
        *(_QWORD *)(v8 + 1) = 0x100000001;
        v8[3] = v9;
        if ((a1 & 0xFFFFFFFE) == 4)
        {
          v8[4] = a2;
        }
        else if (a1 == 1000)
        {
          v8[13] = a2;
        }
        else if (a1 == 7)
        {
          v8[5] = a2;
        }
        v6 = 0;
        *a3 = v8;
        v7 = 10;
        break;
      default:
        switch(a1)
        {
          case 1000:
            if ((unint64_t)(a2 - 11) < 0xFFFFFFFFFFFFFFF6)
              goto LABEL_53;
            v8 = acm_mem_alloc(0x88uLL);
            acm_mem_alloc_info("ACMRequirement - ACMRequirementDataKofNWithAttributes", v8, 136, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 414, "Util_AllocRequirement");
            v9 = 120;
            if (!v8)
              goto LABEL_50;
            goto LABEL_6;
          case 1001:
            v8 = acm_mem_alloc(0xB8uLL);
            acm_mem_alloc_info("ACMRequirement - ACMRequirementDataBiometryMatchedWithAttributes", v8, 184, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 419, "Util_AllocRequirement");
            v9 = 168;
            if (!v8)
              goto LABEL_50;
            goto LABEL_6;
          case 1002:
            v8 = acm_mem_alloc(0x14uLL);
            v11 = "ACMRequirement - ACMRequirementDataPushButtonWithAttributes";
            v12 = v8;
            v13 = 424;
            goto LABEL_49;
          case 1003:
            v8 = acm_mem_alloc(0x14uLL);
            v11 = "ACMRequirement - ACMRequirementDataSecureStateWithAttributes";
            v12 = v8;
            v13 = 429;
            goto LABEL_49;
          case 1004:
            v8 = acm_mem_alloc(0x20uLL);
            acm_mem_alloc_info("ACMRequirement - ACMRequirementDataPasscodeValidatedWithAttributes", v8, 32, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 434, "Util_AllocRequirement");
            v9 = 16;
            if (!v8)
              goto LABEL_50;
            goto LABEL_6;
          default:
            goto LABEL_17;
        }
    }
  }
  else
  {
LABEL_53:
    v6 = 4294967293;
LABEL_54:
    v7 = 70;
  }
LABEL_17:
  if (v7 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "Util_AllocRequirement", (int)v6);
  return v6;
}

uint64_t Util_CreateRequirement(int a1, uint64_t a2)
{
  uint64_t v5;

  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "Util_CreateRequirement");
  v5 = 0;
  Util_AllocRequirement(a1, a2, &v5);
  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: returning.\n", "ACM", "Util_CreateRequirement");
  return v5;
}

uint64_t Util_DeallocRequirement(int *a1)
{
  int v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unsigned int v8;
  const char *v9;
  rsize_t v10;
  int *v11;
  unint64_t v12;
  int v13;

  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "Util_DeallocRequirement");
  if (!a1)
  {
    v7 = 4294967293;
    v8 = 70;
    goto LABEL_28;
  }
  v2 = *a1;
  if (*a1 > 6)
  {
    if (v2 == 7)
    {
      if (a1[5])
      {
        v6 = 0;
        do
          Util_DeallocRequirement(*(_QWORD *)&a1[2 * v6++ + 6]);
        while (v6 < a1[5]);
      }
    }
    else
    {
      if (v2 != 1000)
        goto LABEL_25;
      if (a1[13])
      {
        v4 = 0;
        do
          Util_DeallocRequirement(*(_QWORD *)&a1[2 * v4++ + 14]);
        while (v4 < a1[13]);
      }
    }
  }
  else if (v2 == 4)
  {
    if (a1[4])
    {
      v5 = 0;
      do
        Util_DeallocRequirement(*(_QWORD *)&a1[2 * v5++ + 5]);
      while (v5 < a1[4]);
    }
  }
  else
  {
    if (v2 != 5)
      goto LABEL_25;
    if (a1[4])
    {
      v3 = 0;
      do
        Util_DeallocRequirement(*(_QWORD *)&a1[2 * v3++ + 5]);
      while (v3 < a1[4]);
    }
  }
  v2 = *a1;
LABEL_25:
  v7 = 4294967293;
  v8 = 70;
  switch(v2)
  {
    case 1:
      v9 = "ACMRequirement - ACMRequirementDataPasscodeValidated";
      v10 = 20;
      v11 = a1;
      v12 = 20;
      v13 = 542;
      goto LABEL_27;
    case 2:
      v9 = "ACMRequirement - ACMRequirementDataPassphraseEntered";
      v10 = 20;
      v11 = a1;
      v12 = 20;
      v13 = 546;
      goto LABEL_27;
    case 3:
      v9 = "ACMRequirement - ACMRequirementDataBiometryMatched";
      v10 = 172;
      v11 = a1;
      v12 = 172;
      v13 = 550;
      goto LABEL_27;
    case 4:
      v9 = "ACMRequirement - ACMRequirementDataOr";
      v10 = 100;
      v11 = a1;
      v12 = 100;
      v13 = 595;
      goto LABEL_27;
    case 5:
      v9 = "ACMRequirement - ACMRequirementDataAnd";
      v10 = 100;
      v11 = a1;
      v12 = 100;
      v13 = 589;
      goto LABEL_27;
    case 6:
    case 9:
    case 10:
    case 11:
    case 12:
    case 14:
    case 15:
    case 18:
    case 19:
    case 22:
    case 23:
    case 27:
    case 28:
      v9 = "ACMRequirement";
      v10 = 16;
      v11 = a1;
      v12 = 16;
      v13 = 538;
      goto LABEL_27;
    case 7:
      v9 = "ACMRequirement - ACMRequirementDataKofN";
      v10 = 104;
      v11 = a1;
      v12 = 104;
      v13 = 584;
      goto LABEL_27;
    case 8:
      v9 = "ACMRequirement - ACMRequirementDataAccessGroups";
      v10 = 1040;
      v11 = a1;
      v12 = 1040;
      v13 = 574;
      goto LABEL_27;
    case 13:
      v9 = "ACMRequirement - ACMRequirementDataUserOutputDisplayed";
      v10 = 48;
      v11 = a1;
      v12 = 48;
      v13 = 562;
      goto LABEL_27;
    case 16:
    case 17:
      break;
    case 20:
      v9 = "ACMRequirement - ACMRequirementDataSecureIntent";
      v10 = 20;
      v11 = a1;
      v12 = 20;
      v13 = 554;
      goto LABEL_27;
    case 21:
      v9 = "ACMRequirement - ACMRequirementDataBiometryMatchAttempted";
      v10 = 20;
      v11 = a1;
      v12 = 20;
      v13 = 558;
      goto LABEL_27;
    case 24:
      v9 = "ACMRequirement - ACMRequirementDataAP";
      v10 = 1076;
      v11 = a1;
      v12 = 1076;
      v13 = 566;
      goto LABEL_27;
    case 25:
      v9 = "ACMRequirement - ACMRequirementDataKeyRef";
      v10 = 59;
      v11 = a1;
      v12 = 59;
      v13 = 570;
      goto LABEL_27;
    case 26:
      v9 = "ACMRequirement - ACMRequirementDataRatchet";
      v10 = 44;
      v11 = a1;
      v12 = 44;
      v13 = 579;
LABEL_27:
      acm_mem_free_info(v9, v11, v12, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", v13, "Util_DeallocRequirement");
      acm_mem_free(a1, v10);
      v7 = 0;
      v8 = 10;
      break;
    default:
      switch(v2)
      {
        case 1000:
          v9 = "ACMRequirement - ACMRequirementDataKofNWithAttributes";
          v10 = 136;
          v11 = a1;
          v12 = 136;
          v13 = 601;
          goto LABEL_27;
        case 1001:
          v9 = "ACMRequirement - ACMRequirementDataBiometryMatchedWithAttributes";
          v10 = 184;
          v11 = a1;
          v12 = 184;
          v13 = 605;
          goto LABEL_27;
        case 1002:
          v9 = "ACMRequirement - ACMRequirementDataPushButtonWithAttributes";
          v10 = 20;
          v11 = a1;
          v12 = 20;
          v13 = 609;
          goto LABEL_27;
        case 1003:
          v9 = "ACMRequirement - ACMRequirementDataSecureStateWithAttributes";
          v10 = 20;
          v11 = a1;
          v12 = 20;
          v13 = 613;
          goto LABEL_27;
        case 1004:
          v9 = "ACMRequirement - ACMRequirementDataPasscodeValidatedWithAttributes";
          v10 = 32;
          v11 = a1;
          v12 = 32;
          v13 = 617;
          goto LABEL_27;
        default:
          goto LABEL_28;
      }
  }
LABEL_28:
  if (v8 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "Util_DeallocRequirement", (int)v7);
  return v7;
}

void Util_hexDumpToStrHelper_cold_1()
{
  __assert_rtn("Util_hexDumpToStrHelper", "CommonUtil.c", 32, "src || !srcLen");
}

void Util_hexDumpToStrHelper_cold_2()
{
  __assert_rtn("Util_hexDumpToStrHelper", "CommonUtil.c", 33, "dst || !dstCapacity");
}

uint64_t ACMContextCreate(uint64_t *a1)
{
  uint64_t v2;
  unsigned int v3;
  uint64_t v4;
  uint64_t v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v8 = "ACMLib";
    v9 = 2080;
    v10 = "ACMContextCreate";
    _os_log_impl(&dword_21722C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  v6 = 0;
  v2 = LibCall_ACMContextCreate((uint64_t (*)(uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _BYTE *, uint64_t *))ioKitTransport, (uint64_t)&v6, a1, &_logLevel, 1);
  if ((_DWORD)v2)
  {
    updateLogLevelFromKext();
    v3 = 70;
  }
  else
  {
    v3 = 10;
    if (a1 && _logLevel <= 0x28u)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
      {
        v4 = *a1;
        if (*a1)
          LODWORD(v4) = *(_DWORD *)(v4 + 16);
        *(_DWORD *)buf = 136315650;
        v8 = "ACMLib";
        v9 = 2080;
        v10 = "ACMContextCreate";
        v11 = 1024;
        LODWORD(v12) = v4;
        _os_log_impl(&dword_21722C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: CS[%u] created.\n", buf, 0x1Cu);
      }
      v3 = 10;
    }
  }
  if (v3 >= _logLevel && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v8 = "ACMLib";
    v9 = 2080;
    v10 = "ACMContextCreate";
    v11 = 2048;
    v12 = (int)v2;
    _os_log_impl(&dword_21722C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }
  return v2;
}

uint64_t ioKitTransport(uint64_t *a1, int a2, char a3, const void *a4, size_t a5, void *a6, size_t *a7)
{
  uint64_t v14;
  unsigned int v15;
  uint64_t v16;
  int v18;
  const char *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    v18 = 136315394;
    v19 = "ACMLib";
    v20 = 2080;
    v21 = "ioKitTransport";
    _os_log_impl(&dword_21722C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: called.\n", (uint8_t *)&v18, 0x16u);
  }
  if (a1)
  {
    v14 = init();
    v15 = 70;
    if ((_DWORD)v14)
    {
      v16 = v14;
    }
    else
    {
      v16 = performCommand(*a1, a2, a3, a4, a5, a6, a7);
      if ((_DWORD)v16)
        v15 = 70;
      else
        v15 = 10;
    }
  }
  else
  {
    v15 = 70;
    v16 = 4294967293;
  }
  if (v15 >= _logLevel && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    v18 = 136315650;
    v19 = "ACMLib";
    v20 = 2080;
    v21 = "ioKitTransport";
    v22 = 2048;
    v23 = (int)v16;
    _os_log_impl(&dword_21722C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", (uint8_t *)&v18, 0x20u);
  }
  return v16;
}

_DWORD *ACMContextCreateWithExternalForm(_OWORD *a1, uint64_t a2)
{
  _DWORD *v4;
  int v5;
  unsigned int v6;
  uint64_t v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  _DWORD *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v10 = "ACMLib";
    v11 = 2080;
    v12 = "ACMContextCreateWithExternalForm";
    _os_log_impl(&dword_21722C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  v8 = 0;
  v4 = LibCall_ACMContextCreateWithExternalForm((uint64_t (*)(uint64_t, uint64_t, _QWORD, _OWORD *, uint64_t, _QWORD *, uint64_t *))ioKitTransport, (uint64_t)&v8, a1, a2, &_logLevel, 1);
  if (v4)
  {
    if (_logLevel <= 0x28u && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
    {
      v5 = v4[4];
      *(_DWORD *)buf = 136315650;
      v10 = "ACMLib";
      v11 = 2080;
      v12 = "ACMContextCreateWithExternalForm";
      v13 = 1024;
      LODWORD(v14) = v5;
      _os_log_impl(&dword_21722C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: CS[%u] acquired.\n", buf, 0x1Cu);
    }
    v6 = 30;
  }
  else
  {
    updateLogLevelFromKext();
    v6 = 70;
  }
  if (v6 >= _logLevel && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v10 = "ACMLib";
    v11 = 2080;
    v12 = "ACMContextCreateWithExternalForm";
    v13 = 2048;
    v14 = v4;
    _os_log_impl(&dword_21722C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: returning, -> ctx = %p.\n", buf, 0x20u);
  }
  return v4;
}

uint64_t ACMContextDelete(_DWORD *a1, int a2)
{
  unsigned int v4;
  int v5;
  const char *v6;
  uint64_t v7;
  unsigned int v8;
  _DWORD *v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x24BDAC8D0];
  v4 = _logLevel;
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v12 = "ACMLib";
    v13 = 2080;
    v14 = "ACMContextDelete";
    _os_log_impl(&dword_21722C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
    v4 = _logLevel;
  }
  if (a1 && v4 <= 0x28 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    v5 = a1[4];
    v6 = "deleted";
    *(_DWORD *)buf = 136315906;
    v12 = "ACMLib";
    v14 = "ACMContextDelete";
    v13 = 2080;
    if (a2)
      v6 = "destroyed";
    v15 = 1024;
    LODWORD(v16[0]) = v5;
    WORD2(v16[0]) = 2080;
    *(_QWORD *)((char *)v16 + 6) = v6;
    _os_log_impl(&dword_21722C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: CS[%u] %s.\n", buf, 0x26u);
  }
  v10 = a1;
  v7 = LibCall_ACMContextDelete((void (*)(uint64_t, uint64_t, _QWORD, void *, uint64_t, _QWORD, _QWORD))ioKitTransport, (uint64_t)&v10, a1, a2);
  if ((_DWORD)v7)
    v8 = 70;
  else
    v8 = 10;
  if (v8 >= _logLevel && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v12 = "ACMLib";
    v13 = 2080;
    v14 = "ACMContextDelete";
    v15 = 2048;
    v16[0] = (int)v7;
    _os_log_impl(&dword_21722C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }
  return v7;
}

void ACMContextGetExternalForm(const void *a1, uint64_t a2)
{
  int v4;
  const char *v5;
  __int16 v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    v4 = 136315394;
    v5 = "ACMLib";
    v6 = 2080;
    v7 = "ACMContextGetExternalForm";
    _os_log_impl(&dword_21722C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: called.\n", (uint8_t *)&v4, 0x16u);
  }
  if (!a1 || !a2 || init() || performCommand((uint64_t)a1, 19, 0, a1, 0x10uLL, 0, 0))
    (*(void (**)(uint64_t, _QWORD, _QWORD))(a2 + 16))(a2, 0, 0);
  else
    (*(void (**)(uint64_t, const void *, uint64_t))(a2 + 16))(a2, a1, 16);
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    v4 = 136315394;
    v5 = "ACMLib";
    v6 = 2080;
    v7 = "ACMContextGetExternalForm";
    _os_log_impl(&dword_21722C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: returning.\n", (uint8_t *)&v4, 0x16u);
  }
}

uint64_t init()
{
  uint64_t v0;
  mach_port_t v1;
  const __CFDictionary *v2;
  io_service_t MatchingService;
  io_object_t v4;
  unsigned int v5;
  int v7;
  const char *v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    v7 = 136315394;
    v8 = "ACMLib";
    v9 = 2080;
    v10 = "init";
    _os_log_impl(&dword_21722C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: called.\n", (uint8_t *)&v7, 0x16u);
  }
  if ((_initialized & 1) != 0)
  {
    v0 = 0;
  }
  else
  {
    v1 = *MEMORY[0x24BDD8B20];
    v2 = IOServiceMatching("AppleCredentialManager");
    MatchingService = IOServiceGetMatchingService(v1, v2);
    if (!MatchingService)
    {
      v5 = 70;
      v0 = 4294967291;
      goto LABEL_10;
    }
    v4 = MatchingService;
    v0 = IOServiceOpen(MatchingService, *MEMORY[0x24BDAEC58], 0, (io_connect_t *)&_connect);
    if ((_DWORD)v0)
    {
      v5 = 70;
      goto LABEL_10;
    }
    IOObjectRelease(v4);
    _initialized = 1;
  }
  v5 = 10;
LABEL_10:
  if (v5 >= _logLevel && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    v7 = 136315650;
    v8 = "ACMLib";
    v9 = 2080;
    v10 = "init";
    v11 = 2048;
    v12 = (int)v0;
    _os_log_impl(&dword_21722C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", (uint8_t *)&v7, 0x20u);
  }
  return v0;
}

uint64_t performCommand(uint64_t a1, int a2, char a3, const void *a4, size_t a5, void *a6, size_t *a7)
{
  _BYTE *v14;
  void *v15;
  size_t v16;
  uint64_t v17;
  uint64_t v18;
  size_t v19;
  unsigned int v20;
  size_t v22;
  size_t inputStructCnt;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  _BYTE v29[10];
  __int16 v30;
  int v31;
  __int16 v32;
  int v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v25 = "ACMLib";
    v26 = 2080;
    v27 = "performCommand";
    _os_log_impl(&dword_21722C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  inputStructCnt = 0;
  v14 = LibCall_BuildCommand(a2, 0, a3, a4, a5, &inputStructCnt);
  if (v14)
  {
    v15 = v14;
    if (!a6 && a7)
    {
      v18 = 4294967293;
    }
    else
    {
      if (a7)
        v16 = *a7;
      else
        v16 = 0;
      v22 = v16;
      v17 = IOConnectCallStructMethod(_connect, 0, v14, inputStructCnt, a6, &v22);
      v18 = v17;
      if (a1)
        LODWORD(a1) = *(_DWORD *)(a1 + 16);
      if ((_DWORD)v17)
      {
        if (_logLevel <= 0x46u && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136316418;
          v25 = "ACMLib";
          v26 = 2080;
          v27 = "performCommand";
          v28 = 1024;
          *(_DWORD *)v29 = a2;
          *(_WORD *)&v29[4] = 1024;
          *(_DWORD *)&v29[6] = a1;
          v30 = 1024;
          v31 = v18;
          v32 = 1024;
          v33 = v18;
          _os_log_impl(&dword_21722C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: cmd(%u) on CS[%u] -> err 0x%x (%d).\n", buf, 0x2Eu);
        }
      }
      else
      {
        if (_logLevel <= 0x28u && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315906;
          v25 = "ACMLib";
          v26 = 2080;
          v27 = "performCommand";
          v28 = 1024;
          *(_DWORD *)v29 = a2;
          *(_WORD *)&v29[4] = 1024;
          *(_DWORD *)&v29[6] = a1;
          _os_log_impl(&dword_21722C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: cmd(%u) on CS[%u] -> ok.\n", buf, 0x22u);
        }
        v18 = 0;
        if (a7)
          *a7 = v22;
      }
    }
    v19 = inputStructCnt;
    acm_mem_free_info("<data>", v15, inputStructCnt, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 134, "performCommand");
    acm_mem_free_data(v15, v19);
    if ((_DWORD)v18)
      v20 = 70;
    else
      v20 = 10;
  }
  else
  {
    v20 = 70;
    v18 = 4294967291;
  }
  if (v20 >= _logLevel && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v25 = "ACMLib";
    v26 = 2080;
    v27 = "performCommand";
    v28 = 2048;
    *(_QWORD *)v29 = (int)v18;
    _os_log_impl(&dword_21722C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }
  return v18;
}

uint64_t ACMContextAddCredential(_OWORD *a1, unsigned int *a2)
{
  int v5;
  const char *v6;
  __int16 v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    v5 = 136315394;
    v6 = "ACMLib";
    v7 = 2080;
    v8 = "ACMContextAddCredential";
    _os_log_impl(&dword_21722C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: called.\n", (uint8_t *)&v5, 0x16u);
  }
  return ACMContextAddCredentialWithScope(a1, a2, 1);
}

uint64_t ACMContextAddCredentialWithScope(_OWORD *a1, unsigned int *a2, int a3)
{
  BOOL v6;
  char v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t SerializedAddCredentialSize;
  size_t v11;
  void *v12;
  uint64_t v13;
  size_t v14;
  size_t size;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v18 = "ACMLib";
    v19 = 2080;
    v20 = "ACMContextAddCredentialWithScope";
    _os_log_impl(&dword_21722C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  size = 0;
  if (a1)
    v6 = 1;
  else
    v6 = a3 == 2;
  v7 = !v6;
  v8 = 70;
  v9 = 4294967293;
  if (a2 && (v7 & 1) == 0)
  {
    SerializedAddCredentialSize = init();
    if ((_DWORD)SerializedAddCredentialSize
      || (SerializedAddCredentialSize = GetSerializedAddCredentialSize((uint64_t)a1, a2, a3, &size),
          (_DWORD)SerializedAddCredentialSize))
    {
      v9 = SerializedAddCredentialSize;
      v8 = 70;
    }
    else
    {
      v11 = size;
      v12 = acm_mem_alloc_data(size);
      acm_mem_alloc_info("<data>", v12, v11, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 325, "ACMContextAddCredentialWithScope");
      if (v12)
      {
        v13 = SerializeAddCredential(a1, a2, a3, (uint64_t)v12, &size);
        if (!(_DWORD)v13)
          v13 = performCommand((uint64_t)a1, 5, 0, v12, size, 0, 0);
        v9 = v13;
        v14 = size;
        acm_mem_free_info("<data>", v12, size, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 338, "ACMContextAddCredentialWithScope");
        acm_mem_free_data(v12, v14);
        if ((_DWORD)v9)
          v8 = 70;
        else
          v8 = 10;
      }
      else
      {
        v8 = 70;
        v9 = 4294967292;
      }
    }
  }
  if (v8 >= _logLevel && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v18 = "ACMLib";
    v19 = 2080;
    v20 = "ACMContextAddCredentialWithScope";
    v21 = 2048;
    v22 = (int)v9;
    _os_log_impl(&dword_21722C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }
  return v9;
}

uint64_t ACMContextRemoveCredentialsByType(_OWORD *a1, int a2)
{
  int v5;
  const char *v6;
  __int16 v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    v5 = 136315394;
    v6 = "ACMLib";
    v7 = 2080;
    v8 = "ACMContextRemoveCredentialsByType";
    _os_log_impl(&dword_21722C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: called.\n", (uint8_t *)&v5, 0x16u);
  }
  return ACMContextRemoveCredentialsByTypeAndScope(a1, a2, 1);
}

uint64_t ACMContextRemoveCredentialsByTypeAndScope(_OWORD *a1, int a2, int a3)
{
  uint64_t v6;
  _OWORD *v7;
  uint64_t v8;
  unsigned int v9;
  int v11;
  const char *v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    v11 = 136315394;
    v12 = "ACMLib";
    v13 = 2080;
    v14 = "ACMContextRemoveCredentialsByTypeAndScope";
    _os_log_impl(&dword_21722C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: called.\n", (uint8_t *)&v11, 0x16u);
  }
  if (a1 || a3 == 2)
  {
    v6 = init();
    if ((_DWORD)v6)
    {
      v8 = v6;
      v9 = 70;
    }
    else
    {
      v7 = acm_mem_alloc_data(0x18uLL);
      acm_mem_alloc_info("<data>", v7, 24, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 386, "ACMContextRemoveCredentialsByTypeAndScope");
      if (v7)
      {
        if (a1)
        {
          *v7 = *a1;
        }
        else
        {
          *(_QWORD *)v7 = 0;
          *((_QWORD *)v7 + 1) = 0;
        }
        *((_DWORD *)v7 + 4) = a2;
        *((_DWORD *)v7 + 5) = a3;
        v8 = performCommand((uint64_t)a1, 9, 0, v7, 0x18uLL, 0, 0);
        acm_mem_free_info("<data>", v7, 0x18uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 407, "ACMContextRemoveCredentialsByTypeAndScope");
        acm_mem_free_data(v7, 0x18uLL);
        if ((_DWORD)v8)
          v9 = 70;
        else
          v9 = 10;
      }
      else
      {
        v9 = 70;
        v8 = 4294967292;
      }
    }
  }
  else
  {
    v9 = 70;
    v8 = 4294967293;
  }
  if (v9 >= _logLevel && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    v11 = 136315650;
    v12 = "ACMLib";
    v13 = 2080;
    v14 = "ACMContextRemoveCredentialsByTypeAndScope";
    v15 = 2048;
    v16 = (int)v8;
    _os_log_impl(&dword_21722C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", (uint8_t *)&v11, 0x20u);
  }
  return v8;
}

uint64_t ACMContextRemoveCredentialsByValue(uint64_t a1, _DWORD *a2)
{
  int v5;
  const char *v6;
  __int16 v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    v5 = 136315394;
    v6 = "ACMLib";
    v7 = 2080;
    v8 = "ACMContextRemoveCredentialsByValue";
    _os_log_impl(&dword_21722C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: called.\n", (uint8_t *)&v5, 0x16u);
  }
  return ACMContextRemoveCredentialsByValueAndScope(a1, a2, 1);
}

uint64_t ACMContextRemoveCredentialsByValueAndScope(uint64_t a1, _DWORD *a2, uint64_t a3)
{
  BOOL v6;
  char v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  size_t v11;
  void *v12;
  uint64_t v13;
  size_t v14;
  size_t size;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v18 = "ACMLib";
    v19 = 2080;
    v20 = "ACMContextRemoveCredentialsByValueAndScope";
    _os_log_impl(&dword_21722C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  size = 0;
  if (a1)
    v6 = 1;
  else
    v6 = (_DWORD)a3 == 2;
  v7 = !v6;
  v8 = 70;
  v9 = 4294967293;
  if (a2 && (v7 & 1) == 0)
  {
    v10 = init();
    if ((_DWORD)v10 || (v10 = GetSerializedRemoveCredentialSize(a1, a2, a3, &size), (_DWORD)v10))
    {
      v9 = v10;
      v8 = 70;
    }
    else
    {
      v11 = size;
      v12 = acm_mem_alloc_data(size);
      acm_mem_alloc_info("<data>", v12, v11, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 457, "ACMContextRemoveCredentialsByValueAndScope");
      if (v12)
      {
        v13 = SerializeRemoveCredential(a1, a2, a3, v12, &size);
        if (!(_DWORD)v13)
          v13 = performCommand(a1, 6, 0, v12, size, 0, 0);
        v9 = v13;
        v14 = size;
        acm_mem_free_info("<data>", v12, size, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 470, "ACMContextRemoveCredentialsByValueAndScope");
        acm_mem_free_data(v12, v14);
        if ((_DWORD)v9)
          v8 = 70;
        else
          v8 = 10;
      }
      else
      {
        v8 = 70;
        v9 = 4294967292;
      }
    }
  }
  if (v8 >= _logLevel && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v18 = "ACMLib";
    v19 = 2080;
    v20 = "ACMContextRemoveCredentialsByValueAndScope";
    v21 = 2048;
    v22 = (int)v9;
    _os_log_impl(&dword_21722C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }
  return v9;
}

uint64_t ACMContextContainsCredentialType(_OWORD *a1, int a2)
{
  int v5;
  const char *v6;
  __int16 v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    v5 = 136315394;
    v6 = "ACMLib";
    v7 = 2080;
    v8 = "ACMContextContainsCredentialType";
    _os_log_impl(&dword_21722C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: called.\n", (uint8_t *)&v5, 0x16u);
  }
  return ACMContextContainsCredentialTypeEx(a1, a2, 0);
}

uint64_t ACMContextContainsCredentialTypeEx(_OWORD *a1, int a2, int a3)
{
  uint64_t v6;
  _DWORD *v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  uint64_t v11;
  size_t v13;
  int v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v16 = "ACMLib";
    v17 = 2080;
    v18 = "ACMContextContainsCredentialTypeEx";
    _os_log_impl(&dword_21722C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  v14 = 0;
  v13 = 4;
  if (a1)
  {
    v6 = init();
    if ((_DWORD)v6)
    {
      v11 = v6;
      v8 = 70;
    }
    else
    {
      v7 = acm_mem_alloc_data(0x18uLL);
      acm_mem_alloc_info("<data>", v7, 24, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 576, "ACMContextContainsCredentialTypeEx");
      v8 = 70;
      if (v7)
      {
        *(_OWORD *)v7 = *a1;
        v7[4] = a2;
        v7[5] = a3;
        v9 = performCommand((uint64_t)a1, 4, 0, v7, 0x18uLL, &v14, &v13);
        if (v14)
          v10 = 0;
        else
          v10 = -7;
        if (v9)
          v11 = v9;
        else
          v11 = v10;
        acm_mem_free_info("<data>", v7, 0x18uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 590, "ACMContextContainsCredentialTypeEx");
        acm_mem_free_data(v7, 0x18uLL);
        if ((_DWORD)v11)
          v8 = 70;
        else
          v8 = 10;
      }
      else
      {
        v11 = 4294967292;
      }
    }
  }
  else
  {
    v8 = 70;
    v11 = 4294967293;
  }
  if (v8 >= _logLevel && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v16 = "ACMLib";
    v17 = 2080;
    v18 = "ACMContextContainsCredentialTypeEx";
    v19 = 2048;
    v20 = (int)v11;
    _os_log_impl(&dword_21722C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }
  return v11;
}

uint64_t ACMGlobalContextAddCredential(unsigned int *a1)
{
  uint64_t v2;
  uint64_t v3;
  unsigned int v4;
  _DWORD *v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v8 = "ACMLib";
    v9 = 2080;
    v10 = "ACMGlobalContextAddCredential";
    _os_log_impl(&dword_21722C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  v6 = 0;
  if (a1)
  {
    v2 = ACMContextCreate((uint64_t *)&v6);
    if (!(_DWORD)v2)
      v2 = ACMContextAddCredentialWithScope(v6, a1, 2);
    v3 = v2;
    if (v6)
      ACMContextDelete(v6, 1);
    if ((_DWORD)v3)
      v4 = 70;
    else
      v4 = 10;
  }
  else
  {
    v4 = 70;
    v3 = 4294967293;
  }
  if (v4 >= _logLevel && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v8 = "ACMLib";
    v9 = 2080;
    v10 = "ACMGlobalContextAddCredential";
    v11 = 2048;
    v12 = (int)v3;
    _os_log_impl(&dword_21722C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }
  return v3;
}

uint64_t ACMGlobalContextRemoveCredentialsByType(int a1)
{
  uint64_t v2;
  uint64_t v3;
  unsigned int v4;
  _DWORD *v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v8 = "ACMLib";
    v9 = 2080;
    v10 = "ACMGlobalContextRemoveCredentialsByType";
    _os_log_impl(&dword_21722C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  v6 = 0;
  v2 = ACMContextCreate((uint64_t *)&v6);
  if (!(_DWORD)v2)
    v2 = ACMContextRemoveCredentialsByTypeAndScope(v6, a1, 2);
  v3 = v2;
  if (v6)
    ACMContextDelete(v6, 1);
  if ((_DWORD)v3)
    v4 = 70;
  else
    v4 = 10;
  if (v4 >= _logLevel && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v8 = "ACMLib";
    v9 = 2080;
    v10 = "ACMGlobalContextRemoveCredentialsByType";
    v11 = 2048;
    v12 = (int)v3;
    _os_log_impl(&dword_21722C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }
  return v3;
}

uint64_t ACMContextRemovePassphraseCredentialsByPurposeAndScope(_OWORD *a1, int a2, int a3)
{
  uint64_t v6;
  _OWORD *v7;
  uint64_t v8;
  unsigned int v9;
  int v11;
  const char *v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    v11 = 136315394;
    v12 = "ACMLib";
    v13 = 2080;
    v14 = "ACMContextRemovePassphraseCredentialsByPurposeAndScope";
    _os_log_impl(&dword_21722C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: called.\n", (uint8_t *)&v11, 0x16u);
  }
  if (a1 || a3 == 2)
  {
    v6 = init();
    if ((_DWORD)v6)
    {
      v8 = v6;
      v9 = 70;
    }
    else
    {
      v7 = acm_mem_alloc_data(0x18uLL);
      acm_mem_alloc_info("<data>", v7, 24, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 492, "ACMContextRemovePassphraseCredentialsByPurposeAndScope");
      if (v7)
      {
        if (a1)
        {
          *v7 = *a1;
        }
        else
        {
          *(_QWORD *)v7 = 0;
          *((_QWORD *)v7 + 1) = 0;
        }
        *((_DWORD *)v7 + 4) = a2;
        *((_DWORD *)v7 + 5) = a3;
        v8 = performCommand((uint64_t)a1, 16, 0, v7, 0x18uLL, 0, 0);
        acm_mem_free_info("<data>", v7, 0x18uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 513, "ACMContextRemovePassphraseCredentialsByPurposeAndScope");
        acm_mem_free_data(v7, 0x18uLL);
        if ((_DWORD)v8)
          v9 = 70;
        else
          v9 = 10;
      }
      else
      {
        v9 = 70;
        v8 = 4294967292;
      }
    }
  }
  else
  {
    v9 = 70;
    v8 = 4294967293;
  }
  if (v9 >= _logLevel && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    v11 = 136315650;
    v12 = "ACMLib";
    v13 = 2080;
    v14 = "ACMContextRemovePassphraseCredentialsByPurposeAndScope";
    v15 = 2048;
    v16 = (int)v8;
    _os_log_impl(&dword_21722C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", (uint8_t *)&v11, 0x20u);
  }
  return v8;
}

uint64_t ACMContextReplacePassphraseCredentialsWithScope(uint64_t a1, _DWORD *a2, uint64_t a3)
{
  BOOL v6;
  char v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t SerializedReplacePassphraseCredentialSize;
  size_t v11;
  void *v12;
  uint64_t v13;
  size_t v14;
  size_t size;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v18 = "ACMLib";
    v19 = 2080;
    v20 = "ACMContextReplacePassphraseCredentialsWithScope";
    _os_log_impl(&dword_21722C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  size = 0;
  if (a1)
    v6 = 1;
  else
    v6 = (_DWORD)a3 == 2;
  v7 = !v6;
  v8 = 70;
  v9 = 4294967293;
  if (a2 && (v7 & 1) == 0)
  {
    SerializedReplacePassphraseCredentialSize = init();
    if ((_DWORD)SerializedReplacePassphraseCredentialSize
      || (SerializedReplacePassphraseCredentialSize = GetSerializedReplacePassphraseCredentialSize(a1, a2, a3, &size),
          (_DWORD)SerializedReplacePassphraseCredentialSize))
    {
      v9 = SerializedReplacePassphraseCredentialSize;
      v8 = 70;
    }
    else
    {
      v11 = size;
      v12 = acm_mem_alloc_data(size);
      acm_mem_alloc_info("<data>", v12, v11, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 538, "ACMContextReplacePassphraseCredentialsWithScope");
      if (v12)
      {
        v13 = SerializeReplacePassphraseCredential(a1, a2, a3, v12, &size);
        if (!(_DWORD)v13)
          v13 = performCommand(a1, 15, 0, v12, size, 0, 0);
        v9 = v13;
        bzero(v12, size);
        v14 = size;
        acm_mem_free_info("<data>", v12, size, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 552, "ACMContextReplacePassphraseCredentialsWithScope");
        acm_mem_free_data(v12, v14);
        if ((_DWORD)v9)
          v8 = 70;
        else
          v8 = 10;
      }
      else
      {
        v8 = 70;
        v9 = 4294967292;
      }
    }
  }
  if (v8 >= _logLevel && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v18 = "ACMLib";
    v19 = 2080;
    v20 = "ACMContextReplacePassphraseCredentialsWithScope";
    v21 = 2048;
    v22 = (int)v9;
    _os_log_impl(&dword_21722C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }
  return v9;
}

uint64_t ACMContextContainsPassphraseCredentialWithPurpose(_OWORD *a1, int a2, int a3)
{
  uint64_t v6;
  _DWORD *v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  uint64_t v11;
  size_t v13;
  int v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v16 = "ACMLib";
    v17 = 2080;
    v18 = "ACMContextContainsPassphraseCredentialWithPurpose";
    _os_log_impl(&dword_21722C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  v14 = 0;
  v13 = 4;
  if (a1)
  {
    v6 = init();
    if ((_DWORD)v6)
    {
      v11 = v6;
      v8 = 70;
    }
    else
    {
      v7 = acm_mem_alloc_data(0x18uLL);
      acm_mem_alloc_info("<data>", v7, 24, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 614, "ACMContextContainsPassphraseCredentialWithPurpose");
      v8 = 70;
      if (v7)
      {
        *(_OWORD *)v7 = *a1;
        v7[4] = a2;
        v7[5] = a3;
        v9 = performCommand((uint64_t)a1, 13, 0, v7, 0x18uLL, &v14, &v13);
        if (v14)
          v10 = 0;
        else
          v10 = -7;
        if (v9)
          v11 = v9;
        else
          v11 = v10;
        acm_mem_free_info("<data>", v7, 0x18uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 628, "ACMContextContainsPassphraseCredentialWithPurpose");
        acm_mem_free_data(v7, 0x18uLL);
        if ((_DWORD)v11)
          v8 = 70;
        else
          v8 = 10;
      }
      else
      {
        v11 = 4294967292;
      }
    }
  }
  else
  {
    v8 = 70;
    v11 = 4294967293;
  }
  if (v8 >= _logLevel && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v16 = "ACMLib";
    v17 = 2080;
    v18 = "ACMContextContainsPassphraseCredentialWithPurpose";
    v19 = 2048;
    v20 = (int)v11;
    _os_log_impl(&dword_21722C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }
  return v11;
}

uint64_t ACMContextVerifyPolicy(_OWORD *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  unsigned int v7;
  _OWORD *v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v11 = "ACMLib";
    v12 = 2080;
    v13 = "ACMContextVerifyPolicy";
    _os_log_impl(&dword_21722C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  v9 = a1;
  v6 = LibCall_ACMContextVerifyPolicy_Block((uint64_t (*)(uint64_t, uint64_t, _QWORD, _OWORD *, size_t, unsigned int *, unint64_t *))ioKitTransport, (uint64_t)&v9, a1, a2, a3);
  if ((_DWORD)v6)
    v7 = 70;
  else
    v7 = 10;
  if (v7 >= _logLevel && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v11 = "ACMLib";
    v12 = 2080;
    v13 = "ACMContextVerifyPolicy";
    v14 = 2048;
    v15 = (int)v6;
    _os_log_impl(&dword_21722C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }
  return v6;
}

uint64_t ACMContextVerifyPolicyWithPreflight(_OWORD *a1, char *__s1, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  unsigned int v9;
  _OWORD *v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v13 = "ACMLib";
    v14 = 2080;
    v15 = "ACMContextVerifyPolicyWithPreflight";
    _os_log_impl(&dword_21722C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  v11 = a1;
  v8 = LibCall_ACMContextVerifyPolicyWithPreflight_Block((uint64_t (*)(uint64_t, uint64_t, _QWORD, _OWORD *, size_t, unsigned int *, unint64_t *))ioKitTransport, (uint64_t)&v11, a1, __s1, a3, a4);
  if ((_DWORD)v8)
    v9 = 70;
  else
    v9 = 10;
  if (v9 >= _logLevel && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v13 = "ACMLib";
    v14 = 2080;
    v15 = "ACMContextVerifyPolicyWithPreflight";
    v16 = 2048;
    v17 = (int)v8;
    _os_log_impl(&dword_21722C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }
  return v8;
}

void ACMContextVerifyPolicyEx(_OWORD *a1, char *__s1, uint64_t a3, _DWORD *a4, unsigned int a5, uint64_t a6, uint64_t a7)
{
  _OWORD *v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v16 = "ACMLib";
    v17 = 2080;
    v18 = "ACMContextVerifyPolicyEx";
    _os_log_impl(&dword_21722C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  v14 = a1;
  LibCall_ACMContextVerifyPolicyEx_Block((uint64_t (*)(uint64_t, uint64_t, _QWORD, _OWORD *, size_t, unsigned int *, unint64_t *))ioKitTransport, (uint64_t)&v14, a1, __s1, a3, a4, a5, a6, a7);
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v16 = "ACMLib";
    v17 = 2080;
    v18 = "ACMContextVerifyPolicyEx";
    _os_log_impl(&dword_21722C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: returning.\n", buf, 0x16u);
  }
}

void ACMGlobalContextVerifyPolicy(char *a1, uint64_t a2, _DWORD *a3, unsigned int a4, uint64_t a5)
{
  uint64_t v10;
  int v11[2];
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v13 = "ACMLib";
    v14 = 2080;
    v15 = "ACMGlobalContextVerifyPolicy";
    _os_log_impl(&dword_21722C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  *(_QWORD *)v11 = 0;
  v10 = ACMContextCreate((uint64_t *)v11);
  if ((_DWORD)v10)
  {
    if (a5)
      (*(void (**)(uint64_t, uint64_t, _QWORD, _QWORD))(a5 + 16))(a5, v10, 0, 0);
  }
  else
  {
    ACMContextVerifyPolicyEx(*(_OWORD **)v11, a1, a2, a3, a4, 0xFFFFFFFFLL, a5);
  }
  if (*(_QWORD *)v11)
    ACMContextDelete(*(_DWORD **)v11, 1);
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v13 = "ACMLib";
    v14 = 2080;
    v15 = "ACMGlobalContextVerifyPolicy";
    _os_log_impl(&dword_21722C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: returning.\n", buf, 0x16u);
  }
}

uint64_t ACMContextVerifyAclConstraint(_OWORD *a1, const void *a2, uint64_t a3, unsigned __int8 a4, _DWORD *a5, unsigned int a6, unsigned int a7, uint64_t a8)
{
  _OWORD *v9;

  v9 = a1;
  return LibCall_ACMContextVerifyAclConstraint((uint64_t)ioKitTransport, (uint64_t)&v9, a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t ACMContextVerifyAclConstraintForOperation(_OWORD *a1, const void *a2, uint64_t a3, const void *a4, unsigned int a5, unsigned __int8 a6, _DWORD *a7, unsigned int a8, unsigned int a9, uint64_t a10)
{
  _OWORD *v11;

  v11 = a1;
  return LibCall_ACMContextVerifyAclConstraintForOperation((uint64_t)ioKitTransport, (uint64_t)&v11, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10);
}

uint64_t ACMContextGetTrackingNumber(uint64_t result)
{
  if (result)
    return *(unsigned int *)(result + 16);
  return result;
}

uint64_t ACMParseAclAndCopyConstraintCharacteristics(const void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t SerializedProcessAclSize;
  size_t v8;
  void *v9;
  uint64_t v10;
  size_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  size_t v15;
  size_t v16;
  unsigned int v17;
  size_t __n;
  size_t size;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  __n = 4096;
  size = 0;
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v22 = "ACMLib";
    v23 = 2080;
    v24 = "ACMParseAclAndCopyConstraintCharacteristics";
    _os_log_impl(&dword_21722C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  v6 = 4294967293;
  if (!a1 || !a2 || !a3)
    goto LABEL_28;
  SerializedProcessAclSize = init();
  if ((_DWORD)SerializedProcessAclSize
    || (SerializedProcessAclSize = GetSerializedProcessAclSize(0, (uint64_t)a1, a2, 0, 0, 0, 0, 0, &size),
        (_DWORD)SerializedProcessAclSize))
  {
    v6 = SerializedProcessAclSize;
LABEL_28:
    (*(void (**)(uint64_t, uint64_t, _QWORD, uint64_t))(a3 + 16))(a3, v6, 0, 4096);
    goto LABEL_19;
  }
  v8 = size;
  v9 = acm_mem_alloc_data(size);
  acm_mem_alloc_info("<data>", v9, v8, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 744, "ACMParseAclAndCopyConstraintCharacteristics");
  if (!v9)
  {
    v6 = 4294967292;
    goto LABEL_28;
  }
  v10 = SerializeProcessAcl(0, a1, a2, 0, 0, 0, 0, 0, (uint64_t)v9, &size);
  if ((_DWORD)v10)
  {
    v6 = v10;
    v12 = 0;
    v14 = 0;
    v11 = 4096;
    goto LABEL_15;
  }
  v11 = 4096;
  v12 = acm_mem_alloc_data(0x1000uLL);
  acm_mem_alloc_info("<data>", v12, 4096, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 750, "ACMParseAclAndCopyConstraintCharacteristics");
  if (!v12)
  {
    v14 = 0;
LABEL_31:
    v6 = 4294967292;
    goto LABEL_15;
  }
  v13 = performCommand(0, 20, 0, v9, size, v12, &__n);
  v11 = __n;
  if ((_DWORD)v13)
  {
    v6 = v13;
    v14 = 0;
    goto LABEL_15;
  }
  v14 = acm_mem_alloc_data(__n);
  acm_mem_alloc_info("<data>", v14, v11, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 756, "ACMParseAclAndCopyConstraintCharacteristics");
  v11 = __n;
  if (!v14)
    goto LABEL_31;
  memcpy(v14, v12, __n);
  v6 = 0;
  v11 = __n;
LABEL_15:
  (*(void (**)(uint64_t, uint64_t, void *, size_t))(a3 + 16))(a3, v6, v14, v11);
  v15 = size;
  acm_mem_free_info("<data>", v9, size, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 767, "ACMParseAclAndCopyConstraintCharacteristics");
  acm_mem_free_data(v9, v15);
  if (v12)
  {
    acm_mem_free_info("<data>", v12, 0x1000uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 770, "ACMParseAclAndCopyConstraintCharacteristics");
    acm_mem_free_data(v12, 0x1000uLL);
  }
  if (v14)
  {
    v16 = __n;
    acm_mem_free_info("<data>", v14, __n, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 773, "ACMParseAclAndCopyConstraintCharacteristics");
    acm_mem_free_data(v14, v16);
  }
LABEL_19:
  if ((_DWORD)v6)
    v17 = 70;
  else
    v17 = 10;
  if (v17 >= _logLevel && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v22 = "ACMLib";
    v23 = 2080;
    v24 = "ACMParseAclAndCopyConstraintCharacteristics";
    v25 = 2048;
    v26 = (int)v6;
    _os_log_impl(&dword_21722C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }
  return v6;
}

uint64_t ACMCredentialGetProperty(int *a1, int a2, uint64_t a3)
{
  unsigned int v6;
  uint64_t v7;
  uint64_t v9;
  int *v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v12 = "ACMLib";
    v13 = 2080;
    v14 = "ACMCredentialGetProperty";
    _os_log_impl(&dword_21722C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  v9 = 0;
  v10 = 0;
  v6 = 70;
  v7 = 4294967293;
  if (a1 && a3)
  {
    v7 = LibCall_ACMCredentialGetPropertyData(a1, a2, &v10, &v9);
    if ((_DWORD)v7)
    {
      v6 = 70;
    }
    else
    {
      (*(void (**)(uint64_t, int *, uint64_t))(a3 + 16))(a3, v10, v9);
      v6 = 10;
    }
  }
  if (v6 >= _logLevel && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v12 = "ACMLib";
    v13 = 2080;
    v14 = "ACMCredentialGetProperty";
    v15 = 2048;
    v16 = (int)v7;
    _os_log_impl(&dword_21722C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }
  return v7;
}

void ACMRequirementGetSubrequirements(int *a1, uint64_t a2)
{
  int v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  int v8;
  const char *v9;
  __int16 v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    v8 = 136315394;
    v9 = "ACMLib";
    v10 = 2080;
    v11 = "ACMRequirementGetSubrequirements";
    _os_log_impl(&dword_21722C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: called.\n", (uint8_t *)&v8, 0x16u);
  }
  if (a1 && a2)
  {
    v4 = *a1;
    if (*a1 == 4)
    {
      if (a1[4])
      {
        v6 = 0;
        do
          (*(void (**)(uint64_t, _QWORD))(a2 + 16))(a2, *(_QWORD *)&a1[2 * v6++ + 5]);
        while (v6 < a1[4]);
      }
    }
    else if (v4 == 5)
    {
      if (a1[4])
      {
        v7 = 0;
        do
          (*(void (**)(uint64_t, _QWORD))(a2 + 16))(a2, *(_QWORD *)&a1[2 * v7++ + 5]);
        while (v7 < a1[4]);
      }
    }
    else if (v4 == 7 && a1[5])
    {
      v5 = 0;
      do
        (*(void (**)(uint64_t, _QWORD))(a2 + 16))(a2, *(_QWORD *)&a1[2 * v5++ + 6]);
      while (v5 < a1[5]);
    }
  }
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    v8 = 136315394;
    v9 = "ACMLib";
    v10 = 2080;
    v11 = "ACMRequirementGetSubrequirements";
    _os_log_impl(&dword_21722C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: returning.\n", (uint8_t *)&v8, 0x16u);
  }
}

uint64_t ACMRequirementGetProperty(int *a1, int a2, uint64_t a3)
{
  unsigned int v6;
  uint64_t v7;
  unint64_t v9;
  int *v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v12 = "ACMLib";
    v13 = 2080;
    v14 = "ACMRequirementGetProperty";
    _os_log_impl(&dword_21722C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  v9 = 0;
  v10 = 0;
  v6 = 70;
  v7 = 4294967293;
  if (a1 && a3)
  {
    v7 = LibCall_ACMRequirementGetPropertyData(a1, a2, &v10, &v9);
    if ((_DWORD)v7)
    {
      v6 = 70;
    }
    else
    {
      (*(void (**)(uint64_t, int *, unint64_t))(a3 + 16))(a3, v10, v9);
      v6 = 10;
    }
  }
  if (v6 >= _logLevel && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v12 = "ACMLib";
    v13 = 2080;
    v14 = "ACMRequirementGetProperty";
    v15 = 2048;
    v16 = (int)v7;
    _os_log_impl(&dword_21722C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }
  return v7;
}

uint64_t ACMRequirementGetProperties(int *a1, uint64_t a2)
{
  uint64_t v4;
  unsigned int v5;
  int v6;
  int v8;
  const char *v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    v8 = 136315394;
    v9 = "ACMLib";
    v10 = 2080;
    v11 = "ACMRequirementGetProperties";
    _os_log_impl(&dword_21722C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: called.\n", (uint8_t *)&v8, 0x16u);
  }
  v4 = 4294967293;
  v5 = 70;
  if (a1 && a2)
  {
    (*(void (**)(uint64_t, uint64_t, int *, uint64_t))(a2 + 16))(a2, 1, a1, 4);
    (*(void (**)(uint64_t, uint64_t, int *, uint64_t))(a2 + 16))(a2, 2, a1 + 1, 4);
    (*(void (**)(uint64_t, uint64_t, int *, uint64_t))(a2 + 16))(a2, 3, a1 + 2, 4);
    v4 = 0;
    v6 = *a1;
    v5 = 10;
    switch(*a1)
    {
      case 1:
        goto LABEL_10;
      case 2:
        (*(void (**)(uint64_t, uint64_t, int *, uint64_t))(a2 + 16))(a2, 200, a1 + 4, 4);
        goto LABEL_13;
      case 3:
        (*(void (**)(uint64_t, uint64_t, int *, uint64_t))(a2 + 16))(a2, 100, a1 + 4, 4);
        (*(void (**)(uint64_t, uint64_t, int *, uint64_t))(a2 + 16))(a2, 300, a1 + 5, 8);
        (*(void (**)(uint64_t, uint64_t, int *, uint64_t))(a2 + 16))(a2, 302, a1 + 9, 8);
        (*(void (**)(uint64_t, uint64_t, int *, uint64_t))(a2 + 16))(a2, 301, a1 + 13, 8);
        goto LABEL_13;
      case 4:
      case 5:
      case 6:
        break;
      case 7:
        (*(void (**)(uint64_t, uint64_t, int *, uint64_t))(a2 + 16))(a2, 700, a1 + 4, 4);
        goto LABEL_13;
      default:
        if (v6 != 20 && v6 != 21)
          break;
LABEL_10:
        (*(void (**)(uint64_t, uint64_t, int *, uint64_t))(a2 + 16))(a2, 100, a1 + 4, 4);
LABEL_13:
        v4 = 0;
        v5 = 10;
        break;
    }
  }
  if (v5 >= _logLevel && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    v8 = 136315650;
    v9 = "ACMLib";
    v10 = 2080;
    v11 = "ACMRequirementGetProperties";
    v12 = 2048;
    v13 = (int)v4;
    _os_log_impl(&dword_21722C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", (uint8_t *)&v8, 0x20u);
  }
  return v4;
}

void ACMGetAclAuthMethod(__n128 *a1, uint64_t a2)
{
  __n128 *v4;
  uint8_t buf[4];
  const char *v6;
  __int16 v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v6 = "ACMLib";
    v7 = 2080;
    v8 = "ACMGetAclAuthMethod";
    _os_log_impl(&dword_21722C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  v4 = a1;
  LibCall_ACMGetAclAuthMethod_Block((uint64_t)ioKitTransport, (uint64_t)&v4, a1, a2);
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v6 = "ACMLib";
    v7 = 2080;
    v8 = "ACMGetAclAuthMethod";
    _os_log_impl(&dword_21722C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: returning.\n", buf, 0x16u);
  }
}

uint64_t ACMSetEnvironmentVariable(int a1, const void *a2, size_t a3)
{
  uint64_t v6;
  unsigned int v7;
  uint64_t v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v11 = "ACMLib";
    v12 = 2080;
    v13 = "ACMSetEnvironmentVariable";
    _os_log_impl(&dword_21722C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  v9 = 0;
  v6 = LibCall_ACMSetEnvironmentVariable((uint64_t (*)(uint64_t, uint64_t, _QWORD, char *, size_t, _QWORD, _QWORD))ioKitTransport, (uint64_t)&v9, a1, 0, 0, 0, a2, a3);
  if ((_DWORD)v6)
    v7 = 70;
  else
    v7 = 10;
  if (v7 >= _logLevel && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    v11 = "ACMLib";
    v12 = 2080;
    v13 = "ACMSetEnvironmentVariable";
    v14 = 2048;
    v15 = (int)v6;
    v16 = 1024;
    v17 = a1;
    _os_log_impl(&dword_21722C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld, var=%u.\n", buf, 0x26u);
  }
  return v6;
}

uint64_t ACMSetEnvironmentVariableWithAccessPolicy(int a1, _OWORD *a2, _OWORD *a3, uint64_t a4, const void *a5, size_t a6)
{
  uint64_t v12;
  unsigned int v13;
  uint64_t v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v17 = "ACMLib";
    v18 = 2080;
    v19 = "ACMSetEnvironmentVariableWithAccessPolicy";
    _os_log_impl(&dword_21722C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  v15 = 0;
  v12 = LibCall_ACMSetEnvironmentVariable((uint64_t (*)(uint64_t, uint64_t, _QWORD, char *, size_t, _QWORD, _QWORD))ioKitTransport, (uint64_t)&v15, a1, a2, a3, a4, a5, a6);
  if ((_DWORD)v12)
    v13 = 70;
  else
    v13 = 10;
  if (v13 >= _logLevel && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    v17 = "ACMLib";
    v18 = 2080;
    v19 = "ACMSetEnvironmentVariableWithAccessPolicy";
    v20 = 2048;
    v21 = (int)v12;
    v22 = 1024;
    v23 = a1;
    _os_log_impl(&dword_21722C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld, var=%u.\n", buf, 0x26u);
  }
  return v12;
}

uint64_t ACMGetEnvironmentVariable(int a1, uint64_t a2)
{
  uint64_t v4;
  unsigned int v5;
  uint64_t v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v9 = "ACMLib";
    v10 = 2080;
    v11 = "ACMGetEnvironmentVariable";
    _os_log_impl(&dword_21722C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  v7 = 0;
  v4 = LibCall_ACMGetEnvironmentVariable_Block((uint64_t (*)(uint64_t, uint64_t, _QWORD, int *, uint64_t, uint64_t, uint64_t))ioKitTransport, (uint64_t)&v7, a1, a2);
  if ((_DWORD)v4)
    v5 = 70;
  else
    v5 = 10;
  if (v5 >= _logLevel && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    v9 = "ACMLib";
    v10 = 2080;
    v11 = "ACMGetEnvironmentVariable";
    v12 = 2048;
    v13 = (int)v4;
    v14 = 1024;
    v15 = a1;
    _os_log_impl(&dword_21722C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld, var=%u.\n", buf, 0x26u);
  }
  return v4;
}

uint64_t ACMKernelControl(int a1)
{
  uint64_t v2;
  unsigned int v3;
  uint8_t buf[4];
  const char *v6;
  __int16 v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v6 = "ACMLib";
    v7 = 2080;
    v8 = "ACMKernelControl";
    _os_log_impl(&dword_21722C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  v2 = LibCall_ACMKernelControl_Block((uint64_t)ioKitTransport);
  if ((_DWORD)v2)
    v3 = 70;
  else
    v3 = 10;
  if (v3 >= _logLevel && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    v6 = "ACMLib";
    v7 = 2080;
    v8 = "ACMKernelControl";
    v9 = 2048;
    v10 = (int)v2;
    v11 = 1024;
    v12 = a1;
    _os_log_impl(&dword_21722C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld, code=%u.\n", buf, 0x26u);
  }
  return v2;
}

uint64_t ACMSEPControl(const void *a1, size_t a2, uint64_t a3)
{
  uint64_t v4;

  v4 = 0;
  return LibCall_ACMSEPControl_Block((uint64_t (*)(uint64_t, uint64_t, _QWORD, char *, uint64_t, unsigned int *, unint64_t *))ioKitTransport, (uint64_t)&v4, a1, a2, 0, 0, 0, a3);
}

uint64_t ACMSEPControlEx(uint64_t a1, _DWORD *a2, unsigned int a3, const void *a4, size_t a5, uint64_t a6)
{
  uint64_t v7;

  v7 = 0;
  return LibCall_ACMSEPControl_Block((uint64_t (*)(uint64_t, uint64_t, _QWORD, char *, uint64_t, unsigned int *, unint64_t *))ioKitTransport, (uint64_t)&v7, a4, a5, a1, a2, a3, a6);
}

void ACMGlobalContextCredentialGetProperty(int a1, int a2, uint64_t a3)
{
  uint64_t v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v8 = "ACMLib";
    v9 = 2080;
    v10 = "ACMGlobalContextCredentialGetProperty";
    _os_log_impl(&dword_21722C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  v6 = 0;
  LibCall_ACMGlobalContextCredentialGetProperty_Block((uint64_t)ioKitTransport, (uint64_t)&v6, a1, a2, a3);
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v8 = "ACMLib";
    v9 = 2080;
    v10 = "ACMGlobalContextCredentialGetProperty";
    _os_log_impl(&dword_21722C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: returning.\n", buf, 0x16u);
  }
}

void ACMContextCredentialGetProperty(__n128 *a1, unsigned __int32 a2, unsigned __int32 a3, uint64_t a4)
{
  uint64_t v8;
  __n128 *v9;
  uint64_t v10;
  uint8_t v11[4];
  const char *v12;
  __int16 v13;
  const char *v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v16 = "ACMLib";
    v17 = 2080;
    v18 = "ACMContextCredentialGetProperty";
    _os_log_impl(&dword_21722C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  v10 = 256;
  if (a4)
  {
    v9 = a1;
    v8 = LibCall_ACMContextCredentialGetProperty((uint64_t (*)(uint64_t, uint64_t, _QWORD, __n128 *, uint64_t, uint64_t, uint64_t, __n128))ioKitTransport, (uint64_t)&v9, a1, a2, a3, (uint64_t)buf, (uint64_t)&v10);
    (*(void (**)(uint64_t, uint64_t, uint8_t *, uint64_t))(a4 + 16))(a4, v8, buf, v10);
  }
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v11 = 136315394;
    v12 = "ACMLib";
    v13 = 2080;
    v14 = "ACMContextCredentialGetProperty";
    _os_log_impl(&dword_21722C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: returning.\n", v11, 0x16u);
  }
}

uint64_t ACMContextSetData(_OWORD *a1, int a2, const void *a3, size_t a4)
{
  uint64_t v8;
  unsigned int v9;
  int v11;
  const char *v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    v11 = 136315394;
    v12 = "ACMLib";
    v13 = 2080;
    v14 = "ACMContextSetData";
    _os_log_impl(&dword_21722C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: called.\n", (uint8_t *)&v11, 0x16u);
  }
  v8 = ACMContextSetDataEx(a1, a2, 0, 0, a3, a4);
  if ((_DWORD)v8)
    v9 = 70;
  else
    v9 = 10;
  if (v9 >= _logLevel && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    v11 = 136315650;
    v12 = "ACMLib";
    v13 = 2080;
    v14 = "ACMContextSetData";
    v15 = 2048;
    v16 = (int)v8;
    _os_log_impl(&dword_21722C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", (uint8_t *)&v11, 0x20u);
  }
  return v8;
}

uint64_t ACMContextSetDataEx(_OWORD *a1, int a2, _DWORD *a3, unsigned int a4, const void *a5, size_t a6)
{
  uint64_t v12;
  unsigned int v13;
  _OWORD *v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v17 = "ACMLib";
    v18 = 2080;
    v19 = "ACMContextSetDataEx";
    _os_log_impl(&dword_21722C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  v15 = a1;
  v12 = LibCall_ACMContextSetData((uint64_t (*)(uint64_t, uint64_t, _QWORD, void *, size_t, _QWORD, _QWORD))ioKitTransport, (uint64_t)&v15, a1, a2, a3, a4, a5, a6);
  if ((_DWORD)v12)
    v13 = 70;
  else
    v13 = 10;
  if (v13 >= _logLevel && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v17 = "ACMLib";
    v18 = 2080;
    v19 = "ACMContextSetDataEx";
    v20 = 2048;
    v21 = (int)v12;
    _os_log_impl(&dword_21722C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }
  return v12;
}

uint64_t ACMContextGetData(_OWORD *a1, int a2, uint64_t a3)
{
  uint64_t Data;
  unsigned int v7;
  int v9;
  const char *v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    v9 = 136315394;
    v10 = "ACMLib";
    v11 = 2080;
    v12 = "ACMContextGetData";
    _os_log_impl(&dword_21722C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: called.\n", (uint8_t *)&v9, 0x16u);
  }
  Data = ACMContextGetDataEx(a1, a2, 0, 0, a3);
  if ((_DWORD)Data)
    v7 = 70;
  else
    v7 = 10;
  if (v7 >= _logLevel && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    v9 = 136315650;
    v10 = "ACMLib";
    v11 = 2080;
    v12 = "ACMContextGetData";
    v13 = 2048;
    v14 = (int)Data;
    _os_log_impl(&dword_21722C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", (uint8_t *)&v9, 0x20u);
  }
  return Data;
}

uint64_t ACMContextGetDataEx(_OWORD *a1, int a2, _DWORD *a3, unsigned int a4, uint64_t a5)
{
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  rsize_t v15;
  unsigned int v16;
  _OWORD *v18;
  _OWORD *v19;
  uint64_t v20;
  uint64_t v21;
  unsigned int size;
  int size_4;
  const char *v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    size_4 = 136315394;
    v24 = "ACMLib";
    v25 = 2080;
    v26 = "ACMContextGetDataEx";
    _os_log_impl(&dword_21722C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: called.\n", (uint8_t *)&size_4, 0x16u);
  }
  size = 0;
  v20 = 0;
  v21 = 4;
  v19 = a1;
  v10 = LibCall_ACMContextGetData((uint64_t (*)(uint64_t, uint64_t, _QWORD, void *, size_t, uint64_t, uint64_t))ioKitTransport, (uint64_t)&v19, a1, a2, 1, a3, a4, (uint64_t)&size, (uint64_t)&v21);
  if (!(_DWORD)v10)
  {
    v11 = size;
    if (size)
    {
      v12 = acm_mem_alloc_data(size);
      acm_mem_alloc_info("<data>", v12, v11, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 1199, "ACMContextGetDataEx");
      if (!v12)
      {
        v16 = 70;
        v14 = 4294967292;
        goto LABEL_15;
      }
      v20 = size;
      v18 = a1;
      v13 = LibCall_ACMContextGetData((uint64_t (*)(uint64_t, uint64_t, _QWORD, void *, size_t, uint64_t, uint64_t))ioKitTransport, (uint64_t)&v18, a1, a2, 0, a3, a4, (uint64_t)v12, (uint64_t)&v20);
      v14 = v13;
      if (a5 && !(_DWORD)v13)
        (*(void (**)(uint64_t, void *, uint64_t))(a5 + 16))(a5, v12, v20);
      v15 = size;
      acm_mem_free_info("<data>", v12, size, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 1213, "ACMContextGetDataEx");
      acm_mem_free_data(v12, v15);
      if ((_DWORD)v14)
        goto LABEL_11;
    }
    else if (a5)
    {
      (*(void (**)(uint64_t, _QWORD, _QWORD))(a5 + 16))(a5, 0, 0);
    }
    v14 = 0;
    v16 = 10;
    goto LABEL_15;
  }
  v14 = v10;
LABEL_11:
  v16 = 70;
LABEL_15:
  if (v16 >= _logLevel && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    size_4 = 136315650;
    v24 = "ACMLib";
    v25 = 2080;
    v26 = "ACMContextGetDataEx";
    v27 = 2048;
    v28 = (int)v14;
    _os_log_impl(&dword_21722C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", (uint8_t *)&size_4, 0x20u);
  }
  return v14;
}

uint64_t ACMContextGetDataProperty(_OWORD *a1, unsigned __int16 a2, unsigned __int16 a3, uint64_t a4)
{
  uint64_t Data;
  unsigned int v9;
  int v11;
  const char *v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    v11 = 136315394;
    v12 = "ACMLib";
    v13 = 2080;
    v14 = "ACMContextGetDataProperty";
    _os_log_impl(&dword_21722C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: called.\n", (uint8_t *)&v11, 0x16u);
  }
  Data = ACMContextGetData(a1, a2 | (a3 << 16), a4);
  if ((_DWORD)Data)
    v9 = 70;
  else
    v9 = 10;
  if (v9 >= _logLevel && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    v11 = 136315650;
    v12 = "ACMLib";
    v13 = 2080;
    v14 = "ACMContextGetDataProperty";
    v15 = 2048;
    v16 = (int)Data;
    _os_log_impl(&dword_21722C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", (uint8_t *)&v11, 0x20u);
  }
  return Data;
}

uint64_t ACMContextGetInfo(__int128 *a1, int a2, _QWORD *a3)
{
  uint64_t v6;
  unsigned int v7;
  __int128 *v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v11 = "ACMLib";
    v12 = 2080;
    v13 = "ACMContextGetInfo";
    _os_log_impl(&dword_21722C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  v9 = a1;
  v6 = LibCall_ACMContextGetInfo((uint64_t (*)(uint64_t, uint64_t, _QWORD, int *, uint64_t, _OWORD *, unint64_t *))ioKitTransport, (uint64_t)&v9, a1, a2, a3);
  if ((_DWORD)v6)
    v7 = 70;
  else
    v7 = 10;
  if (v7 >= _logLevel && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v11 = "ACMLib";
    v12 = 2080;
    v13 = "ACMContextGetInfo";
    v14 = 2048;
    v15 = (int)v6;
    _os_log_impl(&dword_21722C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }
  return v6;
}

uint64_t ACMPing()
{
  uint64_t v1;

  v1 = 0;
  return LibCall_ACMPing((uint64_t (*)(uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))ioKitTransport, (uint64_t)&v1, 29);
}

void updateLogLevelFromKext()
{
  unsigned __int8 v0;
  unsigned int v1;
  uint32_t outputCnt;
  uint64_t output;
  uint8_t buf[4];
  const char *v5;
  __int16 v6;
  const char *v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v5 = "ACMLib";
    v6 = 2080;
    v7 = "updateLogLevelFromKext";
    _os_log_impl(&dword_21722C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  output = 0;
  outputCnt = 1;
  if (IOConnectCallScalarMethod(_connect, 2u, 0, 0, &output, &outputCnt))
    goto LABEL_8;
  v0 = output;
  v1 = output;
  _logLevel = output;
  if (output <= 0x1EuLL && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v5 = "ACMLib";
    v6 = 2080;
    v7 = "updateLogLevelFromKext";
    v8 = 1024;
    v9 = v0;
    _os_log_impl(&dword_21722C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: log level set to %d.\n", buf, 0x1Cu);
LABEL_8:
    v1 = _logLevel;
  }
  if (v1 <= 0xA && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v5 = "ACMLib";
    v6 = 2080;
    v7 = "updateLogLevelFromKext";
    _os_log_impl(&dword_21722C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s: returning.\n", buf, 0x16u);
  }
}

_BYTE *LibCall_BuildCommand(char a1, char a2, char a3, const void *a4, size_t a5, _QWORD *a6)
{
  _BYTE *v12;
  BOOL v13;

  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "LibCall_BuildCommand");
  v12 = 0;
  if (a5)
    v13 = a4 == 0;
  else
    v13 = 0;
  if (!v13 && a6)
  {
    if (a5 >= 0xFFFFFFFFFFFFFFF8)
    {
      v12 = 0;
    }
    else
    {
      v12 = acm_mem_alloc_data(a5 + 8);
      acm_mem_alloc_info("<data>", v12, a5 + 8, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 22, "LibCall_BuildCommand");
      if (v12)
      {
        *a6 = a5 + 8;
        *(_DWORD *)v12 = 1396920900;
        v12[4] = a1;
        v12[5] = a2;
        v12[6] = a3;
        if (a5)
          memcpy(v12 + 8, a4, a5);
      }
    }
  }
  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: returning.\n", "ACM", "LibCall_BuildCommand");
  return v12;
}

uint64_t LibCall_ACMContextCreate(uint64_t (*a1)(uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _BYTE *, uint64_t *), uint64_t a2, _QWORD *a3, _BYTE *a4, int a5)
{
  unsigned int v10;
  uint64_t v11;
  _DWORD *v12;
  uint64_t v13;
  unsigned int v14;
  unsigned int v15;
  int v16;
  uint64_t v18;
  _BYTE v19[21];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMContextCreate");
  v10 = 70;
  v11 = 4294967293;
  if (!a1 || !a3)
    goto LABEL_25;
  v12 = acm_mem_alloc(0x14uLL);
  acm_mem_alloc_info("ACMHandleWithPayload", v12, 20, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 50, "LibCall_ACMContextCreate");
  if (!v12)
  {
    v10 = 70;
    v11 = 4294967292;
    goto LABEL_25;
  }
  memset(v19, 0, sizeof(v19));
  if (a5)
  {
    v18 = 21;
    v13 = a1(a2, 36, 0, 0, 0, v19, &v18);
    if (!(_DWORD)v13)
    {
      if (v18 != 21)
      {
        v11 = 4294967291;
        goto LABEL_23;
      }
      v11 = 0;
      goto LABEL_20;
    }
    v11 = v13;
    if ((_DWORD)v13 != -3)
    {
LABEL_23:
      acm_mem_free_info("ACMHandleWithPayload", v12, 0x14uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 89, "LibCall_ACMContextCreate");
      acm_mem_free(v12, 0x14uLL);
      v10 = 70;
      goto LABEL_25;
    }
  }
  v18 = 17;
  v14 = a1(a2, 1, 0, 0, 0, v19, &v18);
  if (v18 == 17)
    v15 = 0;
  else
    v15 = -5;
  if (v14)
    v11 = v14;
  else
    v11 = v15;
  if (!v14 && v18 == 17)
  {
LABEL_20:
    v16 = *(_DWORD *)&v19[17];
    *(_OWORD *)v12 = *(_OWORD *)v19;
    v12[4] = v16;
    *a3 = v12;
    if (a4)
      *a4 = v19[16];
  }
  if ((_DWORD)v11)
    goto LABEL_23;
  v10 = 10;
LABEL_25:
  if (v10 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMContextCreate", (int)v11);
  return v11;
}

_DWORD *LibCall_ACMContextCreateWithExternalForm(uint64_t (*a1)(uint64_t, uint64_t, _QWORD, _OWORD *, uint64_t, _QWORD *, uint64_t *), uint64_t a2, _OWORD *a3, uint64_t a4, _BYTE *a5, int a6)
{
  _DWORD *v12;
  unsigned int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  uint64_t v20;
  _QWORD v21[2];

  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMContextCreateWithExternalForm");
  v12 = 0;
  v13 = 70;
  v14 = -3;
  if (a1 && a3 && a4 == 16)
  {
    memset(v21, 0, 9);
    if (a6)
    {
      v20 = 9;
      v15 = a1(a2, 37, 0, a3, 16, v21, &v20);
      if (!v15)
      {
        if (v20 == 9)
        {
          v14 = 0;
          goto LABEL_19;
        }
        v14 = -5;
        goto LABEL_28;
      }
      v14 = v15;
      if (v15 != -3)
        goto LABEL_28;
    }
    v20 = 5;
    v16 = a1(a2, 18, 0, a3, 16, v21, &v20);
    if (v20 == 5)
      v17 = 0;
    else
      v17 = -5;
    if (v16)
      v14 = v16;
    else
      v14 = v17;
    if (!v16 && v20 == 5)
    {
LABEL_19:
      if (LODWORD(v21[0]))
      {
        v12 = acm_mem_alloc(0x14uLL);
        acm_mem_alloc_info("ACMHandleWithPayload", v12, 20, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 128, "LibCall_ACMContextCreateWithExternalForm");
        if (!v12)
        {
          v13 = 70;
          v14 = -4;
          goto LABEL_31;
        }
        v18 = *(_DWORD *)((char *)v21 + 5);
        *(_OWORD *)v12 = *a3;
        v12[4] = v18;
        if (a5)
          *a5 = BYTE4(v21[0]);
        if (v14)
        {
          acm_mem_free_info("ACMHandleWithPayload", v12, 0x14uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 147, "LibCall_ACMContextCreateWithExternalForm");
          acm_mem_free(v12, 0x14uLL);
LABEL_29:
          v13 = 70;
          goto LABEL_31;
        }
      }
      else
      {
        v12 = 0;
      }
      goto LABEL_30;
    }
LABEL_28:
    v12 = 0;
    if (v14)
      goto LABEL_29;
LABEL_30:
    v14 = 0;
    v13 = 10;
  }
LABEL_31:
  if (v13 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMContextCreateWithExternalForm", v14);
  return v12;
}

uint64_t LibCall_ACMContextDelete(void (*a1)(uint64_t, uint64_t, _QWORD, void *, uint64_t, _QWORD, _QWORD), uint64_t a2, void *a3, int a4)
{
  uint64_t v8;
  unsigned int v9;

  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMContextDelete");
  if (a1 && a3)
  {
    if (a4)
      a1(a2, 2, 0, a3, 16, 0, 0);
    goto LABEL_7;
  }
  if (a3)
  {
LABEL_7:
    acm_mem_free_info("ACMHandleWithPayload", a3, 0x14uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 172, "LibCall_ACMContextDelete");
    acm_mem_free(a3, 0x14uLL);
    v8 = 0;
    v9 = 10;
    goto LABEL_8;
  }
  v9 = 70;
  v8 = 4294967293;
LABEL_8:
  if (v9 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMContextDelete", (int)v8);
  return v8;
}

uint64_t LibCall_ACMContexAddCredentialWithScope(uint64_t (*a1)(uint64_t, uint64_t, _QWORD, void *, size_t, _QWORD, _QWORD), uint64_t a2, _OWORD *a3, unsigned int *a4, int a5)
{
  BOOL v10;
  char v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t SerializedAddCredentialSize;
  size_t v15;
  void *v16;
  uint64_t v17;
  size_t v18;
  size_t size;

  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMContexAddCredentialWithScope");
  size = 0;
  if (a3)
    v10 = 1;
  else
    v10 = a5 == 2;
  v11 = !v10;
  v12 = 70;
  v13 = 4294967293;
  if (a4 && (v11 & 1) == 0)
  {
    SerializedAddCredentialSize = GetSerializedAddCredentialSize((uint64_t)a3, a4, a5, &size);
    if ((_DWORD)SerializedAddCredentialSize)
    {
      v13 = SerializedAddCredentialSize;
      v12 = 70;
    }
    else
    {
      v15 = size;
      v16 = acm_mem_alloc_data(size);
      acm_mem_alloc_info("<data>", v16, v15, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 192, "LibCall_ACMContexAddCredentialWithScope");
      if (v16)
      {
        v17 = SerializeAddCredential(a3, a4, a5, (uint64_t)v16, &size);
        if (!(_DWORD)v17)
          v17 = a1(a2, 5, 0, v16, size, 0, 0);
        v13 = v17;
        v18 = size;
        acm_mem_free_info("<data>", v16, size, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 203, "LibCall_ACMContexAddCredentialWithScope");
        acm_mem_free_data(v16, v18);
        if ((_DWORD)v13)
          v12 = 70;
        else
          v12 = 10;
      }
      else
      {
        v12 = 70;
        v13 = 4294967292;
      }
    }
  }
  if (v12 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMContexAddCredentialWithScope", (int)v13);
  return v13;
}

uint64_t LibCall_ACMContexRemoveCredentialsByTypeAndScope(uint64_t (*a1)(uint64_t, uint64_t, _QWORD, _OWORD *, uint64_t, _QWORD, _QWORD), uint64_t a2, _OWORD *a3, int a4, int a5)
{
  _OWORD *v10;
  uint64_t v11;
  unsigned int v12;

  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMContexRemoveCredentialsByTypeAndScope");
  if (a3 || a5 == 2)
  {
    v10 = acm_mem_alloc_data(0x18uLL);
    acm_mem_alloc_info("<data>", v10, 24, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 217, "LibCall_ACMContexRemoveCredentialsByTypeAndScope");
    if (v10)
    {
      if (a3)
      {
        *v10 = *a3;
      }
      else
      {
        *(_QWORD *)v10 = 0;
        *((_QWORD *)v10 + 1) = 0;
      }
      *((_DWORD *)v10 + 4) = a4;
      *((_DWORD *)v10 + 5) = a5;
      v11 = a1(a2, 9, 0, v10, 24, 0, 0);
      acm_mem_free_info("<data>", v10, 0x18uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 233, "LibCall_ACMContexRemoveCredentialsByTypeAndScope");
      acm_mem_free_data(v10, 0x18uLL);
      if ((_DWORD)v11)
        v12 = 70;
      else
        v12 = 10;
    }
    else
    {
      v12 = 70;
      v11 = 4294967292;
    }
  }
  else
  {
    v12 = 70;
    v11 = 4294967293;
  }
  if (v12 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMContexRemoveCredentialsByTypeAndScope", (int)v11);
  return v11;
}

uint64_t LibCall_ACMContextRemoveCredentialsByValueAndScope(uint64_t (*a1)(uint64_t, uint64_t, _QWORD, void *, size_t, _QWORD, _QWORD), uint64_t a2, uint64_t a3, _DWORD *a4, uint64_t a5)
{
  BOOL v10;
  char v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  size_t v15;
  void *v16;
  uint64_t v17;
  size_t v18;
  size_t size;

  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMContextRemoveCredentialsByValueAndScope");
  size = 0;
  if (a3)
    v10 = 1;
  else
    v10 = (_DWORD)a5 == 2;
  v11 = !v10;
  v12 = 70;
  v13 = 4294967293;
  if (a4 && (v11 & 1) == 0)
  {
    v14 = GetSerializedRemoveCredentialSize(a3, a4, a5, &size);
    if ((_DWORD)v14)
    {
      v13 = v14;
      v12 = 70;
    }
    else
    {
      v15 = size;
      v16 = acm_mem_alloc_data(size);
      acm_mem_alloc_info("<data>", v16, v15, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 251, "LibCall_ACMContextRemoveCredentialsByValueAndScope");
      if (v16)
      {
        v17 = SerializeRemoveCredential(a3, a4, a5, v16, &size);
        if (!(_DWORD)v17)
          v17 = a1(a2, 6, 0, v16, size, 0, 0);
        v13 = v17;
        v18 = size;
        acm_mem_free_info("<data>", v16, size, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 264, "LibCall_ACMContextRemoveCredentialsByValueAndScope");
        acm_mem_free_data(v16, v18);
        if ((_DWORD)v13)
          v12 = 70;
        else
          v12 = 10;
      }
      else
      {
        v12 = 70;
        v13 = 4294967292;
      }
    }
  }
  if (v12 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMContextRemoveCredentialsByValueAndScope", (int)v13);
  return v13;
}

uint64_t LibCall_ACMContextVerifyPolicyAndCopyRequirementEx(uint64_t (*a1)(uint64_t, uint64_t, _QWORD, _OWORD *, size_t, unsigned int *, unint64_t *), uint64_t a2, _OWORD *a3, char *__s1, uint64_t a5, _DWORD *a6, unsigned int a7, uint64_t a8, BOOL *a9, _QWORD *a10)
{
  unsigned int v18;
  uint64_t v19;
  uint64_t SerializedVerifyPolicySize;
  size_t v21;
  _OWORD *v22;
  uint64_t v23;
  unsigned int *v24;
  uint64_t v25;
  unint64_t v26;
  size_t v27;
  size_t v29;
  void *v30;
  unint64_t v31;
  size_t v32;
  size_t size;

  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMContextVerifyPolicyAndCopyRequirementEx");
  v32 = 0;
  size = 0;
  v30 = 0;
  v31 = 4096;
  v18 = 70;
  v19 = 4294967293;
  v29 = 0;
  if (a1 && a3 && __s1 && a9)
  {
    if ((a6 != 0) != (a7 != 0))
    {
      v18 = 70;
      v19 = 4294967293;
    }
    else
    {
      SerializedVerifyPolicySize = GetSerializedVerifyPolicySize((uint64_t)a3, __s1, a5, a8, a6, a7, &size);
      if ((_DWORD)SerializedVerifyPolicySize)
      {
        v19 = SerializedVerifyPolicySize;
        v18 = 70;
      }
      else
      {
        v21 = size;
        v22 = acm_mem_alloc_data(size);
        acm_mem_alloc_info("<data>", v22, v21, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 293, "LibCall_ACMContextVerifyPolicyAndCopyRequirementEx");
        if (v22)
        {
          v32 = size;
          v23 = SerializeVerifyPolicy(a3, __s1, a5, a8, a6, a7, v22, &v32);
          if ((_DWORD)v23)
          {
            v19 = v23;
            v24 = 0;
          }
          else
          {
            v24 = (unsigned int *)acm_mem_alloc_data(0x1000uLL);
            acm_mem_alloc_info("<data>", v24, 4096, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 300, "LibCall_ACMContextVerifyPolicyAndCopyRequirementEx");
            if (v24)
            {
              v25 = a1(a2, 3, 0, v22, v32, v24, &v31);
              if ((_DWORD)v25)
              {
                v19 = v25;
              }
              else
              {
                v26 = v31 - 4;
                if (v31 < 4)
                {
                  v19 = 4294967291;
                }
                else
                {
                  *a9 = *v24 != 0;
                  if (a10)
                  {
                    v19 = DeserializeRequirement(v24 + 1, v26, &v30, &v29);
                    if (!(_DWORD)v19)
                      *a10 = v30;
                  }
                  else
                  {
                    v19 = 0;
                  }
                }
              }
            }
            else
            {
              v19 = 4294967292;
            }
          }
          v27 = size;
          acm_mem_free_info("<data>", v22, size, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 324, "LibCall_ACMContextVerifyPolicyAndCopyRequirementEx");
          acm_mem_free_data(v22, v27);
          if (v24)
          {
            acm_mem_free_info("<data>", v24, 0x1000uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 327, "LibCall_ACMContextVerifyPolicyAndCopyRequirementEx");
            acm_mem_free_data(v24, 0x1000uLL);
          }
          if ((_DWORD)v19)
            v18 = 70;
          else
            v18 = 10;
        }
        else
        {
          v18 = 70;
          v19 = 4294967292;
        }
      }
    }
  }
  if (v18 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMContextVerifyPolicyAndCopyRequirementEx", (int)v19);
  return v19;
}

uint64_t LibCall_ACMRequirementDelete(uint64_t a1, int *a2)
{
  unsigned int v4;
  uint64_t v5;

  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMRequirementDelete");
  v4 = 70;
  v5 = 4294967293;
  if (a1 && a2)
  {
    v5 = Util_DeallocRequirement(a2);
    if ((_DWORD)v5)
      v4 = 70;
    else
      v4 = 10;
  }
  if (v4 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMRequirementDelete", (int)v5);
  return v5;
}

uint64_t LibCall_ACMKernelControl(uint64_t (*a1)(uint64_t, uint64_t, _QWORD, char *, size_t, uint64_t, uint64_t), uint64_t a2, int a3, const void *a4, size_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t (*v13)(uint64_t, uint64_t, _QWORD, char *, size_t, uint64_t, uint64_t);
  BOOL v14;
  _DWORD *v15;
  _DWORD *v16;
  uint64_t v17;
  unsigned int v18;
  _QWORD v20[2];

  v13 = a1;
  v20[1] = *MEMORY[0x24BDAC8D0];
  if (gACMLoggingLevel <= 0xAu)
    a1 = (uint64_t (*)(uint64_t, uint64_t, _QWORD, char *, size_t, uint64_t, uint64_t))printf("%s: %s: called.\n", "ACM", "LibCall_ACMKernelControl");
  if (!v13)
    goto LABEL_16;
  v14 = a5 != 0;
  if (a4)
    v14 = a5 - 4097 < 0xFFFFFFFFFFFFF000;
  if (v14)
  {
LABEL_16:
    v18 = 70;
    v17 = 4294967293;
  }
  else
  {
    v20[0] = v20;
    MEMORY[0x24BDAC7A8](a1);
    v15 = (_DWORD *)((char *)v20 - ((a5 + 19) & 0xFFFFFFFFFFFFFFF0));
    *v15 = a3;
    v16 = v15 + 1;
    if (a5)
    {
      memcpy(v15 + 1, a4, a5);
      v16 = (_DWORD *)((char *)v16 + a5);
    }
    if (v16 != (_DWORD *)((char *)v15 + a5 + 4))
      LibCall_ACMKernelControl_cold_1();
    v17 = v13(a2, 26, 0, (char *)v20 - ((a5 + 19) & 0xFFFFFFFFFFFFFFF0), a5 + 4, a6, a7);
    if ((_DWORD)v17)
      v18 = 70;
    else
      v18 = 10;
  }
  if (v18 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMKernelControl", (int)v17);
  return v17;
}

_DWORD *LibCall_ACMCredentialDelete(_DWORD *a1)
{
  if (a1)
    return (_DWORD *)Util_DeallocCredential(a1);
  return a1;
}

unsigned int *LibCall_ACMCredentialGetType(unsigned int *result)
{
  if (result)
    return (unsigned int *)*result;
  return result;
}

uint64_t LibCall_ACMCredentialSetProperty(int *a1, int a2, _OWORD *__src, size_t __n)
{
  int v4;
  uint64_t result;
  int v7;
  _OWORD *v8;
  BOOL v9;
  _BOOL4 v10;
  __int128 v11;
  _BOOL4 v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;

  if (!a1)
    return 4294967293;
  v4 = __n;
  if ((__src != 0) != (__n != 0))
    return 4294967293;
  result = 4294967293;
  if (a2 > 399)
  {
    if (a2 > 601)
    {
      if (a2 <= 801)
      {
        if (a2 != 602)
        {
          if (a2 == 701)
          {
            if (__n <= 0x80 && *a1 == 13)
            {
              a1[8] = __n;
              v14 = a1 + 9;
LABEL_118:
              memcpy(v14, __src, __n);
              return 0;
            }
          }
          else if (a2 == 801 && __n == 16 && *a1 == 17)
          {
            result = 0;
            *((_OWORD *)a1 + 2) = *__src;
          }
          return result;
        }
        v13 = *a1 == 12 || *a1 == 15;
        if (__n != 4 || !v13)
          return result;
LABEL_79:
        result = 0;
        a1[9] = *(_DWORD *)__src;
        return result;
      }
      if (a2 == 802)
      {
        if (__n != 65 || *a1 != 17)
          return result;
        result = 0;
        *((_OWORD *)a1 + 3) = *__src;
        v11 = __src[1];
        v16 = __src[2];
        v17 = __src[3];
        *((_BYTE *)a1 + 112) = *((_BYTE *)__src + 64);
        *((_OWORD *)a1 + 5) = v16;
        *((_OWORD *)a1 + 6) = v17;
        goto LABEL_92;
      }
      if (a2 != 901)
      {
        if (a2 == 1001 && __n <= 0x80 && *a1 == 21)
        {
          memcpy(a1 + 9, __src, __n);
          result = 0;
          a1[8] = v4;
        }
        return result;
      }
      if (__n != 32 || *a1 != 20)
        return result;
    }
    else
    {
      if (a2 > 501)
      {
        switch(a2)
        {
          case 502:
            if (__n == 16 && *a1 == 10)
            {
LABEL_102:
              result = 0;
              *(_OWORD *)(a1 + 13) = *__src;
            }
            break;
          case 503:
            if (__n == 16 && *a1 == 10)
            {
              result = 0;
              v15 = *__src;
LABEL_99:
              *(_OWORD *)(a1 + 17) = v15;
            }
            break;
          case 601:
            v9 = *a1 == 12 || *a1 == 15;
            v10 = v9;
            if (__n == 4 && v10)
            {
LABEL_64:
              result = 0;
              a1[8] = *(_DWORD *)__src;
            }
            break;
        }
        return result;
      }
      if (a2 != 400)
      {
        if (a2 != 401)
        {
          if (a2 == 501 && __n == 16 && *a1 == 10)
          {
LABEL_16:
            result = 0;
            *(_OWORD *)(a1 + 9) = *__src;
          }
          return result;
        }
        if (__n != 24 || *a1 != 7)
          return result;
        result = 0;
        v11 = *__src;
        *((_QWORD *)a1 + 10) = *((_QWORD *)__src + 2);
LABEL_92:
        *((_OWORD *)a1 + 4) = v11;
        return result;
      }
      if (__n != 32 || *a1 != 7)
        return result;
    }
    result = 0;
    v18 = __src[1];
    *((_OWORD *)a1 + 2) = *__src;
    *((_OWORD *)a1 + 3) = v18;
    return result;
  }
  if (a2 > 199)
  {
    switch(a2)
    {
      case 300:
        if (__n == 16 && *a1 == 3)
          goto LABEL_16;
        break;
      case 301:
        if (__n == 32 && *a1 == 3)
        {
          result = 0;
          v15 = *__src;
          *(_OWORD *)(a1 + 21) = __src[1];
          goto LABEL_99;
        }
        break;
      case 302:
        if (__n == 16 && *a1 == 3)
          goto LABEL_102;
        break;
      case 303:
        if (__n == 65 && *a1 == 3)
        {
          result = 0;
          *(_OWORD *)(a1 + 30) = *__src;
          v19 = __src[1];
          v20 = __src[2];
          v21 = __src[3];
          *((_BYTE *)a1 + 184) = *((_BYTE *)__src + 64);
          *(_OWORD *)(a1 + 42) = v21;
          *(_OWORD *)(a1 + 38) = v20;
          *(_OWORD *)(a1 + 34) = v19;
        }
        break;
      case 304:
        if (__n == 16 && *a1 == 3)
        {
          result = 0;
          *(_OWORD *)((char *)a1 + 185) = *__src;
        }
        break;
      case 305:
        if (__n == 4 && *a1 == 3)
        {
          result = 0;
          *(int *)((char *)a1 + 201) = *(_DWORD *)__src;
        }
        break;
      case 306:
        if (__n <= 0x80 && *a1 == 3)
        {
          memcpy((char *)a1 + 209, __src, __n);
          result = 0;
          *(int *)((char *)a1 + 205) = v4;
        }
        break;
      default:
        if (a2 == 200)
        {
          if (__n <= 0x80 && *a1 == 2)
          {
            a1[9] = __n;
            v14 = a1 + 10;
            goto LABEL_118;
          }
        }
        else if (a2 == 201 && __n == 4 && *a1 == 2)
        {
          goto LABEL_64;
        }
        break;
    }
    return result;
  }
  if (a2 > 100)
  {
    if (a2 == 101)
    {
      if (__n == 4)
      {
        switch(*a1)
        {
          case 1:
          case 3:
          case 9:
          case 10:
            goto LABEL_64;
          case 2:
          case 4:
          case 5:
          case 6:
          case 7:
          case 8:
            return result;
          default:
            if (*a1 == 18)
              goto LABEL_64;
            break;
        }
      }
      return result;
    }
    if (a2 != 102 || __n != 4 || *a1 != 1)
      return result;
    goto LABEL_79;
  }
  if (a2 == 5)
  {
    if (__n == 4)
    {
      result = 0;
      a1[3] = *(_DWORD *)__src;
    }
  }
  else if (a2 == 100 && __n == 16)
  {
    v7 = *a1;
    if (*a1 > 8)
    {
      if (v7 == 9)
      {
        v8 = a1 + 10;
        a1[9] = 16;
      }
      else
      {
        if (v7 != 18)
          return result;
        v8 = a1 + 9;
      }
    }
    else if (v7 == 1)
    {
      v8 = a1 + 11;
      a1[10] = 16;
    }
    else
    {
      if (v7 != 3)
        return result;
      v8 = a1 + 26;
      a1[25] = 16;
    }
    result = 0;
    *v8 = *__src;
  }
  return result;
}

uint64_t LibCall_ACMCredentialGetPropertyData(int *a1, int a2, int **a3, uint64_t *a4)
{
  uint64_t result;
  int *v8;
  int *v9;
  uint64_t v10;
  _BYTE *v11;
  uint64_t v12;
  _BYTE *v13;
  uint64_t v14;
  int *v15;
  int *v16;
  int *v17;
  int v18;
  _BOOL4 isNullOrZeroMemory;
  BOOL v20;
  int *v21;
  uint64_t v22;
  int *v23;

  result = 4294967293;
  if (!a1 || !a3 || !a4)
    return result;
  if (a2 > 399)
  {
    if (a2 > 601)
    {
      if (a2 > 801)
      {
        if (a2 == 802)
        {
          if (*a1 != 17)
            return result;
          v11 = a1 + 12;
LABEL_87:
          v12 = 65;
          v13 = v11;
          v14 = 65;
        }
        else
        {
          if (a2 != 901)
          {
            if (a2 != 1001 || *a1 != 21)
              return result;
            v15 = a1 + 9;
            if (Util_isNullOrZeroMemory((_BYTE *)a1 + 36, 128))
            {
              v15 = 0;
              v10 = 0;
            }
            else
            {
              v10 = a1[8];
            }
            result = 0;
            *a3 = v15;
LABEL_99:
            *a4 = v10;
            return result;
          }
          if (*a1 != 20)
            return result;
          v11 = a1 + 8;
          v12 = 32;
          v13 = v11;
          v14 = 32;
        }
      }
      else
      {
        if (a2 == 602)
        {
          if (*a1 != 15 && *a1 != 12)
            return result;
          goto LABEL_61;
        }
        if (a2 == 701)
        {
          if (*a1 != 13)
            return result;
          result = 0;
          *a3 = a1 + 9;
          v10 = a1[8];
          goto LABEL_99;
        }
        if (a2 != 801 || *a1 != 17)
          return result;
        v11 = a1 + 8;
        v12 = 16;
        v13 = v11;
        v14 = 16;
      }
      isNullOrZeroMemory = Util_isNullOrZeroMemory(v13, v14);
      result = 0;
      v20 = !isNullOrZeroMemory;
      if (isNullOrZeroMemory)
        v21 = 0;
      else
        v21 = (int *)v11;
      if (v20)
        v22 = v12;
      else
        v22 = 0;
      *a3 = v21;
      *a4 = v22;
      return result;
    }
    if (a2 > 501)
    {
      if (a2 == 502)
      {
        if (*a1 != 10)
          return result;
        v9 = a1 + 13;
      }
      else
      {
        if (a2 != 503)
        {
          if (a2 != 601 || *a1 != 15 && *a1 != 12)
            return result;
          goto LABEL_77;
        }
        if (*a1 != 10)
          return result;
        v9 = a1 + 17;
      }
LABEL_68:
      *a3 = v9;
      result = Util_isNullOrZeroMemory(v9, 16);
      if ((_DWORD)result)
      {
        result = 0;
        *a4 = 0;
        *a3 = 0;
        return result;
      }
LABEL_70:
      v10 = 16;
      goto LABEL_99;
    }
    if (a2 == 400)
    {
      if (*a1 != 7)
        return result;
      result = 0;
      v16 = a1 + 8;
LABEL_84:
      *a3 = v16;
      v10 = 32;
      goto LABEL_99;
    }
    if (a2 == 401)
    {
      if (*a1 != 7)
        return result;
      result = 0;
      *a3 = a1 + 16;
      v10 = 24;
      goto LABEL_99;
    }
    if (a2 != 501 || *a1 != 10)
      return result;
LABEL_15:
    v9 = a1 + 9;
    goto LABEL_68;
  }
  if (a2 > 199)
  {
    switch(a2)
    {
      case 300:
        if (*a1 == 3)
        {
          result = 0;
          v8 = a1 + 9;
          goto LABEL_50;
        }
        break;
      case 301:
        if (*a1 == 3)
        {
          result = 0;
          v16 = a1 + 17;
          goto LABEL_84;
        }
        break;
      case 302:
        if (*a1 == 3)
        {
          result = 0;
          v8 = a1 + 13;
          goto LABEL_50;
        }
        break;
      case 303:
        if (*a1 == 3)
        {
          v11 = a1 + 30;
          goto LABEL_87;
        }
        break;
      case 304:
        if (*a1 == 3)
        {
          result = 0;
          v8 = (int *)((char *)a1 + 185);
LABEL_50:
          *a3 = v8;
          goto LABEL_70;
        }
        break;
      case 305:
        if (*a1 == 3)
        {
          result = 0;
          v17 = (int *)((char *)a1 + 201);
          goto LABEL_97;
        }
        break;
      case 306:
        if (*a1 == 3)
        {
          result = 0;
          v10 = *(unsigned int *)((char *)a1 + 205);
          v23 = (int *)((char *)a1 + 209);
          if (!*(int *)((char *)a1 + 205))
            v23 = 0;
          *a3 = v23;
          goto LABEL_99;
        }
        break;
      default:
        if (a2 == 200)
        {
          if (*a1 == 2)
          {
            result = 0;
            *a3 = a1 + 10;
            v10 = a1[9];
            goto LABEL_99;
          }
        }
        else if (a2 == 201 && *a1 == 2)
        {
          goto LABEL_77;
        }
        break;
    }
    return result;
  }
  if (a2 > 99)
  {
    if (a2 != 100)
    {
      if (a2 != 101)
      {
        if (a2 != 102 || *a1 != 1)
          return result;
LABEL_61:
        result = 0;
        v17 = a1 + 9;
        goto LABEL_97;
      }
      if (*a1 > 0x12 || ((1 << *a1) & 0x4060A) == 0)
        return result;
LABEL_77:
      result = 0;
      v17 = a1 + 8;
LABEL_97:
      *a3 = v17;
LABEL_98:
      v10 = 4;
      goto LABEL_99;
    }
    v18 = *a1;
    if (*a1 <= 8)
    {
      if (v18 == 1)
      {
        v9 = a1 + 11;
      }
      else
      {
        if (v18 != 3)
          return result;
        v9 = a1 + 26;
      }
      goto LABEL_68;
    }
    if (v18 == 9)
    {
      v9 = a1 + 10;
      goto LABEL_68;
    }
    if (v18 != 18)
      return result;
    goto LABEL_15;
  }
  switch(a2)
  {
    case 1:
      result = 0;
      *a3 = a1 + 4;
      v10 = 8;
      goto LABEL_99;
    case 2:
      result = 0;
      v17 = a1 + 6;
      goto LABEL_97;
    case 3:
      result = 0;
      *a3 = a1;
      goto LABEL_98;
    case 4:
      result = 0;
      v17 = a1 + 1;
      goto LABEL_97;
    case 5:
      result = 0;
      v17 = a1 + 3;
      goto LABEL_97;
    default:
      return result;
  }
  return result;
}

unsigned int *LibCall_ACMRequirementGetType(unsigned int *result)
{
  if (result)
    return (unsigned int *)*result;
  return result;
}

uint64_t LibCall_ACMRequirementGetState(uint64_t result)
{
  if (result)
    return *(unsigned int *)(result + 4);
  return result;
}

uint64_t LibCall_ACMRequirementGetPriority(uint64_t result)
{
  if (result)
    return *(unsigned int *)(result + 8);
  return result;
}

uint64_t LibCall_ACMRequirementGetPropertyData(int *a1, int a2, int **a3, unint64_t *a4)
{
  uint64_t v4;
  int *v7;
  int *v8;
  int *v9;
  unint64_t v10;
  _DWORD *v11;
  BOOL v12;
  int v13;

  v4 = 4294967293;
  if (!a1 || !a3 || !a4)
    return v4;
  v4 = 4294967293;
  if (a2 > 399)
  {
    if (a2 > 600)
    {
      if (a2 == 601)
      {
        if (*a1 == 26)
        {
          if (a1[3] >= 0x1C)
          {
            v7 = a1 + 7;
LABEL_45:
            *a3 = v7;
            v10 = 16;
            goto LABEL_72;
          }
          return 4294967282;
        }
        return 4294967293;
      }
      if (a2 != 602)
      {
        if (a2 != 700)
          return v4;
        if (*a1 == 7)
        {
LABEL_28:
          v8 = a1 + 4;
          goto LABEL_58;
        }
        return 4294967293;
      }
      if (*a1 != 26)
        return 4294967293;
      if (a1[3] < 0x1C)
        return 4294967282;
      *a3 = a1 + 4;
      v10 = 8;
    }
    else
    {
      if (a2 == 400)
      {
        if (*a1 == 13)
        {
          v9 = a1 + 4;
LABEL_64:
          *a3 = v9;
          v10 = 32;
          goto LABEL_72;
        }
        return 4294967293;
      }
      if (a2 != 500)
      {
        if (a2 != 600)
          return v4;
        if (*a1 == 26)
        {
          if (a1[3] >= 0x1C)
          {
            v8 = a1 + 6;
LABEL_58:
            *a3 = v8;
            goto LABEL_59;
          }
          return 4294967282;
        }
        return 4294967293;
      }
      if (*a1 != 25)
        return 4294967293;
      *a3 = a1 + 4;
      v10 = 43;
    }
LABEL_72:
    v4 = 0;
    *a4 = v10;
    return v4;
  }
  if (a2 > 99)
  {
    switch(a2)
    {
      case 300:
        if (*a1 != 3)
          return 4294967293;
        v7 = a1 + 5;
        goto LABEL_45;
      case 301:
        if (*a1 != 3)
          return 4294967293;
        v9 = a1 + 13;
        goto LABEL_64;
      case 302:
        if (*a1 != 3)
          return 4294967293;
        v7 = a1 + 9;
        goto LABEL_45;
      case 303:
        if (*a1 != 3)
          return 4294967293;
        v10 = 0;
        v11 = a1 + 21;
        break;
      case 304:
        if (*a1 != 3)
          return 4294967293;
        if (a1[3] < 0x9C)
          return 4294967282;
        v8 = a1 + 41;
        goto LABEL_58;
      case 305:
        if (*a1 != 3)
          return 4294967293;
        if (a1[3] < 0x9C)
          return 4294967282;
        v8 = a1 + 42;
        goto LABEL_58;
      case 306:
        if (*a1 != 24)
          return 4294967293;
        *a3 = a1 + 5;
        v10 = a1[4];
        goto LABEL_72;
      case 307:
        if (*a1 != 24)
          return 4294967293;
        v9 = a1 + 261;
        goto LABEL_64;
      default:
        if (a2 == 100)
        {
          v13 = *a1;
          if (*a1 > 19)
          {
            if (v13 == 20 || v13 == 21)
              goto LABEL_28;
          }
          else if (v13 == 1 || v13 == 3)
          {
            goto LABEL_28;
          }
          return v4;
        }
        if (a2 != 200)
          return v4;
        if (*a1 != 2)
          return 4294967293;
        goto LABEL_28;
    }
    while (!Util_isNullOrZeroMemory((_BYTE *)v11 + v10, 16))
    {
      v12 = v10 >= 0x40;
      v10 += 16;
      if (v12)
      {
        v10 = 80;
        goto LABEL_71;
      }
    }
    if (!v10)
      v11 = 0;
LABEL_71:
    *a3 = v11;
    goto LABEL_72;
  }
  switch(a2)
  {
    case 1:
      *a3 = a1;
LABEL_59:
      v10 = 4;
      goto LABEL_72;
    case 2:
      v8 = a1 + 1;
      goto LABEL_58;
    case 3:
      v8 = a1 + 2;
      goto LABEL_58;
  }
  return v4;
}

uint64_t LibCall_ACMPing(uint64_t (*a1)(uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD), uint64_t a2, uint64_t a3)
{
  unsigned int v6;
  uint64_t v7;

  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMPing");
  v6 = 70;
  if (a1 && ((_DWORD)a3 == 47 || (_DWORD)a3 == 29))
  {
    v7 = a1(a2, a3, 0, 0, 0, 0, 0);
    if ((_DWORD)v7)
      v6 = 70;
    else
      v6 = 10;
  }
  else
  {
    v7 = 4294967293;
  }
  if (v6 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMPing", (int)v7);
  return v7;
}

uint64_t LibCall_ACMKernDoubleClickNotify(uint64_t (*a1)(uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD), uint64_t a2)
{
  unsigned int v4;
  uint64_t v5;

  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMKernDoubleClickNotify");
  v4 = 70;
  if (a1)
  {
    v5 = a1(a2, 28, 0, 0, 0, 0, 0);
    if ((_DWORD)v5)
      v4 = 70;
    else
      v4 = 10;
  }
  else
  {
    v5 = 4294967293;
  }
  if (v4 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMKernDoubleClickNotify", (int)v5);
  return v5;
}

uint64_t LibCall_ACMContextCredentialGetProperty(uint64_t (*a1)(uint64_t, uint64_t, _QWORD, __n128 *, uint64_t, uint64_t, uint64_t, __n128), uint64_t a2, __n128 *a3, unsigned __int32 a4, unsigned __int32 a5, uint64_t a6, uint64_t a7)
{
  unsigned int v14;
  uint64_t v15;
  uint64_t v16;
  __n128 Property_Serialize;
  uint64_t v19;
  __n128 v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMContextCredentialGetProperty");
  v14 = 70;
  v15 = 4294967293;
  if (a1)
  {
    if (a3)
    {
      v15 = 4294967293;
      if (a6)
      {
        if (a7)
        {
          v19 = 24;
          Property_Serialize = LibSer_ContextCredentialGetProperty_Serialize(a3, a4, a5, &v20, &v19);
          if ((_DWORD)v16)
          {
            v15 = v16;
          }
          else if (v19 == 24)
          {
            v15 = a1(a2, 33, 0, &v20, 24, a6, a7, Property_Serialize);
            if (!(_DWORD)v15)
            {
              v14 = 10;
              goto LABEL_11;
            }
          }
          else
          {
            v15 = 4294967291;
          }
          v14 = 70;
        }
      }
    }
  }
LABEL_11:
  if (v14 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMContextCredentialGetProperty", (int)v15);
  return v15;
}

uint64_t LibCall_ACMGlobalContextCredentialGetProperty(uint64_t (*a1)(uint64_t, uint64_t, _QWORD, int *, uint64_t, uint64_t, uint64_t), uint64_t a2, int a3, int a4, uint64_t a5, uint64_t a6)
{
  unsigned int v12;
  uint64_t v13;
  uint64_t Property_Serialize;
  uint64_t v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMGlobalContextCredentialGetProperty");
  v12 = 70;
  v13 = 4294967293;
  if (a1 && a5 && a6)
  {
    v16 = 8;
    Property_Serialize = LibSer_GlobalContextCredentialGetProperty_Serialize(a3, a4, &v17, &v16);
    if ((_DWORD)Property_Serialize)
    {
      v13 = Property_Serialize;
    }
    else if (v16 == 8)
    {
      v13 = a1(a2, 27, 0, &v17, 8, a5, a6);
      if (!(_DWORD)v13)
      {
        v12 = 10;
        goto LABEL_10;
      }
    }
    else
    {
      v13 = 4294967291;
    }
    v12 = 70;
  }
LABEL_10:
  if (v12 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMGlobalContextCredentialGetProperty", (int)v13);
  return v13;
}

uint64_t LibCall_ACMContextVerifyPolicyEx(uint64_t (*a1)(uint64_t, uint64_t, _QWORD, _OWORD *, size_t, unsigned int *, unint64_t *), uint64_t a2, _OWORD *a3, char *__s1, uint64_t a5, _DWORD *a6, unsigned int a7, uint64_t a8, BOOL *a9, int **a10)
{
  uint64_t v18;
  uint64_t SerializedVerifyPolicySize;
  size_t v20;
  _OWORD *v21;
  uint64_t v22;
  unsigned int *v23;
  uint64_t v24;
  unint64_t v25;
  size_t v26;
  unsigned int v27;
  size_t v29;
  int *v30;
  unint64_t v31;
  size_t size;

  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMContextVerifyPolicyEx");
  v31 = 4096;
  size = 0;
  v29 = 0;
  v30 = 0;
  v18 = 4294967293;
  if (!a3 || !__s1 || !a9)
  {
LABEL_18:
    if (!(_DWORD)v18)
      goto LABEL_21;
    goto LABEL_19;
  }
  SerializedVerifyPolicySize = GetSerializedVerifyPolicySize((uint64_t)a3, __s1, a5, a8, a6, a7, &size);
  if (!(_DWORD)SerializedVerifyPolicySize)
  {
    v20 = size;
    v21 = acm_mem_alloc_data(size);
    acm_mem_alloc_info("<data>", v21, v20, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1257, "LibCall_ACMContextVerifyPolicyEx");
    if (v21)
    {
      v22 = SerializeVerifyPolicy(a3, __s1, a5, a8, a6, a7, v21, &size);
      if ((_DWORD)v22)
      {
        v18 = v22;
        v23 = 0;
      }
      else
      {
        v23 = (unsigned int *)acm_mem_alloc_data(0x1000uLL);
        acm_mem_alloc_info("<data>", v23, 4096, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1263, "LibCall_ACMContextVerifyPolicyEx");
        if (v23)
        {
          v24 = a1(a2, 3, 0, v21, size, v23, &v31);
          if ((_DWORD)v24)
          {
            v18 = v24;
          }
          else
          {
            v25 = v31 - 4;
            if (v31 < 4)
            {
              v18 = 4294967291;
            }
            else
            {
              *a9 = *v23 != 0;
              if (a10)
              {
                v18 = DeserializeRequirement(v23 + 1, v25, (void **)&v30, &v29);
                if (!(_DWORD)v18)
                  *a10 = v30;
              }
              else
              {
                v18 = 0;
              }
            }
          }
        }
        else
        {
          v18 = 4294967292;
        }
      }
      v26 = size;
      acm_mem_free_info("<data>", v21, size, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1288, "LibCall_ACMContextVerifyPolicyEx");
      acm_mem_free_data(v21, v26);
      if (v23)
      {
        acm_mem_free_info("<data>", v23, 0x1000uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1291, "LibCall_ACMContextVerifyPolicyEx");
        acm_mem_free_data(v23, 0x1000uLL);
      }
    }
    else
    {
      v18 = 4294967292;
    }
    goto LABEL_18;
  }
  v18 = SerializedVerifyPolicySize;
LABEL_19:
  if (v30)
    Util_DeallocRequirement(v30);
LABEL_21:
  if ((_DWORD)v18)
    v27 = 70;
  else
    v27 = 10;
  if (v27 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMContextVerifyPolicyEx", (int)v18);
  return v18;
}

uint64_t LibCall_ACMGlobalContextVerifyPolicyEx(uint64_t (*a1)(uint64_t, uint64_t, _QWORD, _OWORD *, size_t, unsigned int *, unint64_t *), uint64_t a2, char *a3, uint64_t a4, _DWORD *a5, unsigned int a6, BOOL *a7, int **a8)
{
  uint64_t v16;
  uint64_t v17;
  unsigned int v18;
  int v20[2];

  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMGlobalContextVerifyPolicyEx");
  *(_QWORD *)v20 = 0;
  v16 = LibCall_ACMContextCreate((uint64_t (*)(uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _BYTE *, uint64_t *))a1, a2, v20, 0, 1);
  if (!(_DWORD)v16)
    v16 = LibCall_ACMContextVerifyPolicyEx(a1, a2, *(_OWORD **)v20, a3, a4, a5, a6, 0xFFFFFFFFLL, a7, a8);
  v17 = v16;
  if (*(_QWORD *)v20)
    LibCall_ACMContextDelete((void (*)(uint64_t, uint64_t, _QWORD, void *, uint64_t, _QWORD, _QWORD))a1, a2, *(void **)v20, 1);
  if ((_DWORD)v17)
    v18 = 70;
  else
    v18 = 10;
  if (v18 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMGlobalContextVerifyPolicyEx", (int)v17);
  return v17;
}

uint64_t LibCall_ACMGetEnvironmentVariable(uint64_t (*a1)(uint64_t, uint64_t, _QWORD, int *, uint64_t, uint64_t, uint64_t), uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  unsigned int v9;
  uint64_t v10;
  int v12;

  v12 = a3;
  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMGetEnvironmentVariable");
  v9 = 70;
  v10 = 4294967293;
  if (a1 && a4 && a5)
  {
    v10 = a1(a2, 25, 0, &v12, 4, a4, a5);
    if ((_DWORD)v10)
      v9 = 70;
    else
      v9 = 10;
  }
  if (v9 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMGetEnvironmentVariable", (int)v10);
  return v10;
}

uint64_t LibCall_ACMSetEnvironmentVariable(uint64_t (*a1)(uint64_t, uint64_t, _QWORD, char *, size_t, _QWORD, _QWORD), uint64_t a2, int a3, _OWORD *a4, _OWORD *a5, uint64_t a6, const void *a7, size_t a8)
{
  uint64_t (*v15)(uint64_t, uint64_t, _QWORD, char *, size_t, _QWORD, _QWORD);
  BOOL v16;
  char *v17;
  uint64_t v18;
  unsigned int v19;
  _QWORD v21[2];

  v15 = a1;
  v21[1] = *MEMORY[0x24BDAC8D0];
  if (gACMLoggingLevel <= 0xAu)
    a1 = (uint64_t (*)(uint64_t, uint64_t, _QWORD, char *, size_t, _QWORD, _QWORD))printf("%s: %s: called.\n", "ACM", "LibCall_ACMSetEnvironmentVariable");
  if (!v15 || a6 != 16 * (a5 != 0))
    goto LABEL_20;
  v16 = a8 != 0;
  if (a7)
    v16 = a8 - 129 < 0xFFFFFFFFFFFFFF80;
  if (!v16)
  {
    MEMORY[0x24BDAC7A8](a1);
    v17 = (char *)v21 - ((a8 + 59) & 0xFFFFFFFFFFFFFFF0);
    *(_DWORD *)v17 = a3;
    *((_DWORD *)v17 + 1) = 2;
    *((_DWORD *)v17 + 2) = a8;
    *(_OWORD *)(v17 + 12) = 0u;
    *(_OWORD *)(v17 + 28) = 0u;
    if (a4)
      *(_OWORD *)(v17 + 12) = *a4;
    if (a5)
      *(_OWORD *)(v17 + 28) = *a5;
    if (a8)
      memcpy(v17 + 44, a7, a8);
    v18 = v15(a2, 44, 0, (char *)v21 - ((a8 + 59) & 0xFFFFFFFFFFFFFFF0), a8 + 44, 0, 0);
    if ((_DWORD)v18)
      v19 = 70;
    else
      v19 = 10;
  }
  else
  {
LABEL_20:
    v19 = 70;
    v18 = 4294967293;
  }
  if (v19 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMSetEnvironmentVariable", (int)v18);
  return v18;
}

uint64_t LibCall_ACMTRMLoadState(uint64_t (*a1)(uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  unsigned int v8;
  uint64_t v9;

  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMTRMLoadState");
  v8 = 70;
  v9 = 4294967293;
  if (a1 && a3 && a4)
  {
    v9 = a1(a2, 38, 0, 0, 0, a3, a4);
    if ((_DWORD)v9)
      v8 = 70;
    else
      v8 = 10;
  }
  if (v8 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMTRMLoadState", (int)v9);
  return v9;
}

uint64_t LibCall_ACMTRMSaveState(uint64_t (*a1)(uint64_t, uint64_t, _QWORD, uint64_t, uint64_t, _QWORD, _QWORD), uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  BOOL v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;

  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMTRMSaveState");
  if (a1)
  {
    v10 = (unint64_t)(a4 - 8193) < 0xFFFFFFFFFFFFE000;
    if (!a3)
      v10 = a4 != 0;
    v11 = 70;
    if (!v10)
    {
      if (a5)
        v12 = 43;
      else
        v12 = 39;
      v13 = a1(a2, v12, 0, a3, a4, 0, 0);
      if ((_DWORD)v13)
        v11 = 70;
      else
        v11 = 10;
      goto LABEL_13;
    }
  }
  else
  {
    v11 = 70;
  }
  v13 = 4294967293;
LABEL_13:
  if (v11 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMTRMSaveState", (int)v13);
  return v13;
}

uint64_t LibCall_ACMContextLoadFromImage(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t, _QWORD, char *, uint64_t, _OWORD *, unint64_t *);
  unsigned int v11;
  uint64_t v12;
  _DWORD *v13;
  uint64_t v14;
  int v15;
  unint64_t v17;
  _OWORD v18[17];
  uint64_t v19;
  char v20;
  _BYTE v21[3];
  __int16 v22;
  uint64_t v23;

  v1 = MEMORY[0x24BDAC7A8](a1);
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v10 = (uint64_t (*)(uint64_t, uint64_t, _QWORD, char *, uint64_t, _OWORD *, unint64_t *))v1;
  v23 = *MEMORY[0x24BDAC8D0];
  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMContextLoadFromImage");
  v11 = 70;
  v12 = 4294967293;
  if (v10 && v7 && (unint64_t)(v5 - 4097) >= 0xFFFFFFFFFFFFF000)
  {
    v13 = acm_mem_alloc(0x14uLL);
    acm_mem_alloc_info("ACMHandleWithPayload", v13, 20, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1447, "LibCall_ACMContextLoadFromImage");
    if (v13)
    {
      bzero(v21, 0x1005uLL);
      v20 = 1;
      *(_WORD *)&v21[1] = 6;
      v22 = v5;
      __memcpy_chk();
      memset(v18, 0, sizeof(v18));
      v19 = 0;
      v17 = 280;
      v14 = v10(v9, 48, 0, &v20, 4102, v18, &v17);
      if ((_DWORD)v14)
      {
        v12 = v14;
      }
      else if (v17 < 0x18)
      {
        v12 = 4294967291;
      }
      else
      {
        if (LOBYTE(v18[0]))
        {
          v12 = 0;
          v15 = DWORD1(v18[1]);
          *(_OWORD *)v13 = *(_OWORD *)((char *)v18 + 4);
          v13[4] = v15;
          *v3 = v13;
          v11 = 10;
          goto LABEL_11;
        }
        v12 = 4294967280;
      }
      acm_mem_free_info("ACMHandleWithPayload", v13, 0x14uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1508, "LibCall_ACMContextLoadFromImage");
      acm_mem_free(v13, 0x14uLL);
      v11 = 70;
    }
    else
    {
      v11 = 70;
      v12 = 4294967292;
    }
  }
LABEL_11:
  if (v11 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMContextLoadFromImage", (int)v12);
  return v12;
}

uint64_t LibCall_ACMContextUnloadToImage(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  void *v4;
  void *v5;
  __int128 *v6;
  __int128 *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t, _QWORD, int *, uint64_t, _BYTE *, int *);
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  int v16[2];
  _BYTE v17[2];
  unsigned __int16 v18;
  size_t __n;
  int v20;
  __int128 v21;
  uint64_t v22;

  v1 = MEMORY[0x24BDAC7A8](a1);
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v10 = (uint64_t (*)(uint64_t, uint64_t, _QWORD, int *, uint64_t, _BYTE *, int *))v1;
  v22 = *MEMORY[0x24BDAC8D0];
  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMContextUnloadToImage");
  v11 = 70;
  v12 = 4294967293;
  if (v10 && v5 && v3)
  {
    v21 = 0uLL;
    v20 = 1310721;
    if (v7)
      v21 = *v7;
    else
      v21 = 0uLL;
    bzero(v17, 0x1106uLL);
    *(_QWORD *)v16 = 4358;
    v13 = v10(v9, 49, 0, &v20, 20, v17, v16);
    if ((_DWORD)v13)
    {
      v12 = v13;
LABEL_18:
      v11 = 70;
      goto LABEL_14;
    }
    if (*(_QWORD *)v16 < 6uLL)
    {
      v11 = 70;
      v12 = 4294967291;
    }
    else
    {
      if (v17[0])
      {
        v15 = v18;
        v12 = Util_ReadFromBuffer((uint64_t)v17, *(size_t *)v16, &v15, v5, (unsigned __int16)__n);
        if (!(_DWORD)v12)
        {
          *v3 = v15 - v18;
          v11 = 10;
          goto LABEL_14;
        }
        goto LABEL_18;
      }
      v11 = 70;
      v12 = 4294967280;
    }
  }
LABEL_14:
  if (v11 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMContextUnloadToImage", (int)v12);
  return v12;
}

uint64_t LibCall_ACMContextSetData(uint64_t (*a1)(uint64_t, uint64_t, _QWORD, void *, size_t, _QWORD, _QWORD), uint64_t a2, _OWORD *a3, int a4, _DWORD *a5, unsigned int a6, const void *a7, size_t a8)
{
  unsigned int v16;
  uint64_t v17;
  uint64_t v18;
  size_t v19;
  void *v20;
  uint64_t v21;
  size_t v22;
  size_t size;

  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMContextSetData");
  size = 0;
  v16 = 70;
  v17 = 4294967293;
  if (a1 && a3)
  {
    if ((a7 != 0) != (a8 != 0))
    {
      v16 = 70;
      v17 = 4294967293;
    }
    else if (a8 > 0xE00)
    {
      v16 = 70;
      v17 = 4294967276;
    }
    else
    {
      v18 = LibSer_StorageSetData_GetSize(a8, a5, a6, &size);
      if ((_DWORD)v18)
      {
        v17 = v18;
        v16 = 70;
      }
      else
      {
        v19 = size;
        v20 = acm_mem_alloc_data(size);
        acm_mem_alloc_info("<data>", v20, v19, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1593, "LibCall_ACMContextSetData");
        if (v20)
        {
          v21 = LibSer_StorageSetData_Serialize(a3, a4, a7, a8, a5, a6, (uint64_t)v20, &size);
          if (!(_DWORD)v21)
            v21 = a1(a2, 40, 0, v20, size, 0, 0);
          v17 = v21;
          v22 = size;
          acm_mem_free_info("<data>", v20, size, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1605, "LibCall_ACMContextSetData");
          acm_mem_free_data(v20, v22);
          if ((_DWORD)v17)
            v16 = 70;
          else
            v16 = 10;
        }
        else
        {
          v16 = 70;
          v17 = 4294967292;
        }
      }
    }
  }
  if (v16 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMContextSetData", (int)v17);
  return v17;
}

uint64_t LibCall_ACMContextGetData(uint64_t (*a1)(uint64_t, uint64_t, _QWORD, void *, size_t, uint64_t, uint64_t), uint64_t a2, _OWORD *a3, int a4, char a5, _DWORD *a6, unsigned int a7, uint64_t a8, uint64_t a9)
{
  uint64_t v16;
  unsigned int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  size_t v21;
  void *v22;
  uint64_t Data_Serialize;
  size_t v24;
  uint64_t v26;
  size_t size;

  if (gACMLoggingLevel <= 0xAu)
  {
    v16 = a8;
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMContextGetData");
    a8 = v16;
  }
  size = 0;
  v17 = 70;
  v18 = 4294967293;
  if (a1)
  {
    v26 = a2;
    if (a3)
    {
      v18 = 4294967293;
      if (a8)
      {
        if (a9)
        {
          v19 = a8;
          v20 = LibSer_StorageGetData_GetSize(a6, a7, &size);
          if ((_DWORD)v20)
          {
            v18 = v20;
            v17 = 70;
          }
          else
          {
            v21 = size;
            v22 = acm_mem_alloc_data(size);
            acm_mem_alloc_info("<data>", v22, v21, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1628, "LibCall_ACMContextGetData");
            if (v22)
            {
              Data_Serialize = LibSer_StorageGetData_Serialize(a3, a4, a5, a6, a7, (uint64_t)v22, &size);
              if (!(_DWORD)Data_Serialize)
                Data_Serialize = a1(v26, 41, 0, v22, size, v19, a9);
              v18 = Data_Serialize;
              v24 = size;
              acm_mem_free_info("<data>", v22, size, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1640, "LibCall_ACMContextGetData");
              acm_mem_free_data(v22, v24);
              if ((_DWORD)v18)
                v17 = 70;
              else
                v17 = 10;
            }
            else
            {
              v17 = 70;
              v18 = 4294967292;
            }
          }
        }
      }
    }
  }
  if (v17 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMContextGetData", (int)v18);
  return v18;
}

uint64_t LibCall_ACMPublishTrustedAccessories(uint64_t (*a1)(uint64_t, uint64_t, _QWORD, char *, size_t, _QWORD, _QWORD), uint64_t a2, const void *a3, size_t a4)
{
  uint64_t (*v7)(uint64_t, uint64_t, _QWORD, char *, size_t, _QWORD, _QWORD);
  BOOL v8;
  char v9;
  unsigned int v10;
  uint64_t v11;
  _DWORD *v12;
  _QWORD v14[2];

  v7 = a1;
  v14[1] = *MEMORY[0x24BDAC8D0];
  if (gACMLoggingLevel <= 0xAu)
    a1 = (uint64_t (*)(uint64_t, uint64_t, _QWORD, char *, size_t, _QWORD, _QWORD))printf("%s: %s: called.\n", "ACM", "LibCall_ACMPublishTrustedAccessories");
  if (v7)
  {
    if (a3)
      v8 = 1;
    else
      v8 = a4 == 0;
    v9 = !v8;
    v10 = 70;
    v11 = 4294967293;
    if ((a4 & 0xF) == 0 && a4 <= 0x100 && (v9 & 1) == 0)
    {
      MEMORY[0x24BDAC7A8](a1);
      v12 = (_DWORD *)((char *)v14 - ((a4 + 23) & 0xFFFFFFFFFFFFFFF0));
      *v12 = 1;
      v12[1] = a4;
      if (a4)
        memcpy(v12 + 2, a3, a4);
      v11 = v7(a2, 45, 0, (char *)v14 - ((a4 + 23) & 0xFFFFFFFFFFFFFFF0), a4 + 8, 0, 0);
      if ((_DWORD)v11)
        v10 = 70;
      else
        v10 = 10;
    }
  }
  else
  {
    v10 = 70;
    v11 = 4294967293;
  }
  if (v10 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMPublishTrustedAccessories", (int)v11);
  return v11;
}

uint64_t LibCall_ACMContextGetInfo(uint64_t (*a1)(uint64_t, uint64_t, _QWORD, int *, uint64_t, _OWORD *, unint64_t *), uint64_t a2, __int128 *a3, int a4, _QWORD *a5)
{
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v14;
  _OWORD v15[9];
  int v16;
  __int128 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMContextGetInfo");
  v10 = 70;
  v11 = 4294967293;
  if (a3 && a1 && a5)
  {
    v16 = 1;
    v18 = a4;
    v17 = *a3;
    memset(v15, 0, 140);
    v14 = 140;
    v12 = a1(a2, 46, 0, &v16, 24, v15, &v14);
    if ((_DWORD)v12)
    {
      v11 = v12;
    }
    else if (v14 < 0xC)
    {
      v11 = 4294967291;
    }
    else
    {
      if (LODWORD(v15[0]))
      {
        v11 = 0;
        *a5 = *(_QWORD *)((char *)v15 + 4);
        v10 = 10;
        goto LABEL_10;
      }
      v11 = 4294967281;
    }
    v10 = 70;
  }
LABEL_10:
  if (v10 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMContextGetInfo", (int)v11);
  return v11;
}

uint64_t verifyAclConstraintInternal(uint64_t (*a1)(uint64_t, uint64_t, _QWORD, void *, size_t, unsigned int *, unint64_t *), uint64_t a2, uint64_t a3, _OWORD *a4, const void *a5, uint64_t a6, const void *a7, unsigned int a8, unsigned __int8 a9, _DWORD *a10, unsigned int a11, unsigned int a12, BOOL *a13, int **a14)
{
  uint64_t v20;
  uint64_t SerializedVerifyAclConstraintSize;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  unsigned int *v25;
  uint64_t v26;
  unint64_t v27;
  rsize_t v28;
  unsigned int v29;
  size_t v33;
  int *v34;
  unint64_t v35;
  size_t v36;

  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "verifyAclConstraintInternal");
  v36 = 0;
  v34 = 0;
  v35 = 4096;
  v33 = 0;
  v20 = 4294967293;
  if (!a4 || !a5 || !a6 || !a13)
  {
LABEL_19:
    if (!(_DWORD)v20)
      goto LABEL_22;
    goto LABEL_20;
  }
  SerializedVerifyAclConstraintSize = GetSerializedVerifyAclConstraintSize(a3, (uint64_t)a4, (uint64_t)a5, a6, (uint64_t)a7, a8, a9, a12, a10, a11, &v36);
  if (!(_DWORD)SerializedVerifyAclConstraintSize)
  {
    v22 = v36;
    v23 = acm_mem_alloc_data(v36);
    acm_mem_alloc_info("<data>", v23, v22, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1929, "verifyAclConstraintInternal");
    if (v23)
    {
      v24 = SerializeVerifyAclConstraint(a3, a4, a5, a6, a7, a8, a9, a12, a10, a11, (uint64_t)v23, &v36);
      if ((_DWORD)v24)
      {
        v20 = v24;
        v25 = 0;
      }
      else
      {
        v25 = (unsigned int *)acm_mem_alloc_data(0x1000uLL);
        acm_mem_alloc_info("<data>", v25, 4096, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1935, "verifyAclConstraintInternal");
        if (v25)
        {
          v26 = a1(a2, a3, 0, v23, v36, v25, &v35);
          if ((_DWORD)v26)
          {
            v20 = v26;
          }
          else
          {
            v27 = v35 - 4;
            if (v35 < 4)
            {
              v20 = 4294967291;
            }
            else
            {
              *a13 = *v25 != 0;
              if (a14)
              {
                v20 = DeserializeRequirement(v25 + 1, v27, (void **)&v34, &v33);
                if (!(_DWORD)v20)
                  *a14 = v34;
              }
              else
              {
                v20 = 0;
              }
            }
          }
        }
        else
        {
          v20 = 4294967292;
        }
      }
      v28 = v36;
      acm_mem_free_info("<data>", v23, v36, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1958, "verifyAclConstraintInternal");
      acm_mem_free_data(v23, v28);
      if (v25)
      {
        acm_mem_free_info("<data>", v25, 0x1000uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1961, "verifyAclConstraintInternal");
        acm_mem_free_data(v25, 0x1000uLL);
      }
    }
    else
    {
      v20 = 4294967292;
    }
    goto LABEL_19;
  }
  v20 = SerializedVerifyAclConstraintSize;
LABEL_20:
  if (v34)
    Util_DeallocRequirement(v34);
LABEL_22:
  if ((_DWORD)v20)
    v29 = 70;
  else
    v29 = 10;
  if (v29 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "verifyAclConstraintInternal", (int)v20);
  return v20;
}

uint64_t LibCall_ACMSecContextProcessAcl(uint64_t (*a1)(uint64_t, uint64_t, _QWORD, char *, uint64_t, int *, uint64_t *), uint64_t a2, _OWORD *a3, unsigned __int8 *a4, uint64_t a5, unsigned __int8 *a6, uint64_t a7, _DWORD *a8, unsigned int a9, unsigned int a10, _DWORD *a11, BOOL *a12)
{
  return processAclCommandInternal(a1, a2, 12, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, 0, 0);
}

uint64_t processAclCommandInternal(uint64_t (*a1)(uint64_t, uint64_t, _QWORD, char *, uint64_t, int *, uint64_t *), uint64_t a2, int a3, _OWORD *a4, unsigned __int8 *a5, uint64_t a6, unsigned __int8 *a7, uint64_t a8, _DWORD *a9, unsigned int a10, unsigned int a11, _DWORD *a12, BOOL *a13, _QWORD *a14, unint64_t *a15)
{
  unsigned int v19;
  uint64_t v20;
  unsigned __int8 *v21;
  uint64_t v22;
  unsigned __int8 *v23;
  unsigned int v24;
  uint64_t v25;
  BOOL v26;
  int v27;
  uint64_t SerializedProcessAclSize;
  uint64_t v29;
  void *v30;
  _DWORD *v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  void *v35;
  rsize_t v36;
  unsigned int v37;
  int v39;
  unint64_t v44;
  size_t v45;

  v19 = gACMLoggingLevel;
  if (gACMLoggingLevel <= 0xAu)
  {
    printf("%s: %s: called.\n", "ACM", "processAclCommandInternal");
    v19 = gACMLoggingLevel;
  }
  if (v19 <= 0x14)
  {
    printf("%s: %s: command = %u.\n", "ACM", "processAclCommandInternal", a3);
    v19 = gACMLoggingLevel;
    if (gACMLoggingLevel <= 0x14u)
    {
      printf("%s: %s: context = %p.\n", "ACM", "processAclCommandInternal", a4);
      v19 = gACMLoggingLevel;
      if (gACMLoggingLevel <= 0x14u)
      {
        printf("%s: %s: acl = %p, aclLength = %zu.\n", "ACM", "processAclCommandInternal", a5, a6);
        v19 = gACMLoggingLevel;
        if (gACMLoggingLevel <= 0x14u)
        {
          printf("%s: %s (len=%u): acl:", "ACM", "processAclCommandInternal", a6);
          v19 = gACMLoggingLevel;
        }
      }
    }
  }
  if (a6)
  {
    v20 = a6;
    v21 = a5;
    do
    {
      if (v19 <= 0x14)
      {
        printf("%02x ", *v21);
        v19 = gACMLoggingLevel;
      }
      ++v21;
      --v20;
    }
    while (v20);
  }
  if (v19 < 0x15)
  {
    putchar(10);
    v19 = gACMLoggingLevel;
    if (gACMLoggingLevel <= 0x14u)
    {
      printf("%s: %s: operation = %p, operationLength = %zu.\n", "ACM", "processAclCommandInternal", a7, a8);
      v19 = gACMLoggingLevel;
      if (gACMLoggingLevel <= 0x14u)
      {
        printf("%s: %s (len=%u): operation:", "ACM", "processAclCommandInternal", a8);
        v19 = gACMLoggingLevel;
      }
    }
  }
  v39 = a3;
  if (a8)
  {
    v22 = a8;
    v23 = a7;
    do
    {
      if (v19 <= 0x14)
      {
        printf("%02x ", *v23);
        v19 = gACMLoggingLevel;
      }
      ++v23;
      --v22;
    }
    while (v22);
  }
  if (v19 < 0x15)
  {
    putchar(10);
    if (gACMLoggingLevel <= 0x14u)
    {
      printf("%s: %s: parameters = %p, parameterCount = %u.\n", "ACM", "processAclCommandInternal", a9, a10);
      if (gACMLoggingLevel <= 0x14u)
      {
        printf("%s: %s: maxGlobalCredentialAge = %u.\n", "ACM", "processAclCommandInternal", a11);
        if (gACMLoggingLevel <= 0x14u)
        {
          printf("%s: %s: constraintState = %p.\n", "ACM", "processAclCommandInternal", a12);
          if (gACMLoggingLevel <= 0x14u)
            printf("%s: %s: requirePasscode = %p.\n", "ACM", "processAclCommandInternal", a13);
        }
      }
    }
  }
  if (a7 || a9 || a12)
  {
    if (a5)
      v26 = a6 == 0;
    else
      v26 = 1;
    v27 = v26;
    v24 = 70;
    v25 = 4294967293;
    if (!a7)
      goto LABEL_79;
    if (!a8)
      goto LABEL_79;
    if (v27)
      goto LABEL_79;
    v24 = 70;
    v25 = 4294967293;
    if ((a9 != 0) != (a10 != 0) || !a12)
      goto LABEL_79;
    v45 = 0;
    v44 = 4096;
    if (gACMLoggingLevel <= 0xAu)
      printf("%s: %s: called.\n", "ACM", "processAclInternal");
    SerializedProcessAclSize = GetSerializedProcessAclSize((uint64_t)a4, (uint64_t)a5, a6, (uint64_t)a7, a8, a11, a9, a10, &v45);
    if ((_DWORD)SerializedProcessAclSize)
    {
      v25 = SerializedProcessAclSize;
      v37 = 70;
      goto LABEL_74;
    }
    v29 = v45;
    v30 = acm_mem_alloc_data(v45);
    acm_mem_alloc_info("<data>", v30, v29, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1776, "processAclInternal");
    if (!v30)
    {
      v37 = 70;
      v25 = 4294967292;
      goto LABEL_74;
    }
    v44 = 4096;
    v31 = acm_mem_alloc_data(0x1000uLL);
    acm_mem_alloc_info("<data>", v31, 4096, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1780, "processAclInternal");
    if (!v31)
    {
      v35 = 0;
      v34 = 0;
      v25 = 4294967292;
      goto LABEL_68;
    }
    v32 = SerializeProcessAcl(a4, a5, a6, a7, a8, a11, a9, a10, (uint64_t)v30, &v45);
    if ((_DWORD)v32 || (v32 = a1(a2, v39, 0, (char *)v30, v45, v31, (uint64_t *)&v44), (_DWORD)v32))
    {
      v25 = v32;
      v34 = 0;
      v35 = 0;
      goto LABEL_67;
    }
    v33 = v44;
    if (v44 >= 8)
    {
      *a12 = *v31;
      if (a13)
        *a13 = v31[1] != 0;
      v25 = 0;
      v34 = 0;
      if (v39 != 30 || !a14)
      {
        v35 = 0;
        goto LABEL_67;
      }
      v35 = 0;
      if (!a15)
      {
LABEL_67:
        acm_mem_free_info("<data>", v31, 0x1000uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1817, "processAclInternal");
        acm_mem_free_data(v31, 0x1000uLL);
LABEL_68:
        v36 = v45;
        acm_mem_free_info("<data>", v30, v45, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1821, "processAclInternal");
        acm_mem_free_data(v30, v36);
        if ((_DWORD)v25 && v35)
        {
          acm_mem_free_info("<data>", v35, v34, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1825, "processAclInternal");
          acm_mem_free_data(v35, v34);
          v37 = 70;
        }
        else if ((_DWORD)v25)
        {
          v37 = 70;
        }
        else
        {
          v37 = 10;
        }
LABEL_74:
        if (v37 >= gACMLoggingLevel)
          printf("%s: %s: returning, err = %ld.\n", "ACM", "processAclInternal", (int)v25);
        goto LABEL_76;
      }
      if (v33 >= 0xC)
      {
        v34 = v31[2];
        if ((_DWORD)v34)
        {
          if (v33 >= v34 + 12)
          {
            v35 = acm_mem_alloc_data(v31[2]);
            acm_mem_alloc_info("<data>", v35, v34, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1805, "processAclInternal");
            if (v35)
            {
              memcpy(v35, v31 + 3, v34);
              v25 = 0;
              *a14 = v35;
              *a15 = v34;
            }
            else
            {
              v25 = 4294967292;
            }
            goto LABEL_67;
          }
          goto LABEL_84;
        }
        v34 = 0;
        v35 = 0;
        v25 = 0;
        goto LABEL_67;
      }
    }
    v34 = 0;
LABEL_84:
    v35 = 0;
    v25 = 4294967291;
    goto LABEL_67;
  }
  if (a4)
  {
    v24 = 70;
    v25 = 4294967293;
    goto LABEL_79;
  }
  v24 = 70;
  v25 = 4294967293;
  if (a5 && a13 && a6)
  {
    v25 = aclRequiresPasscodeInternal(a1, a2, a5, a6, a13);
LABEL_76:
    if ((_DWORD)v25)
      v24 = 70;
    else
      v24 = 10;
  }
LABEL_79:
  if (v24 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "processAclCommandInternal", (int)v25);
  return v25;
}

uint64_t LibCall_ACMSecContextProcessAclAndCopyAuthMethod(uint64_t (*a1)(uint64_t, uint64_t, _QWORD, char *, uint64_t, int *, uint64_t *), uint64_t a2, _OWORD *a3, unsigned __int8 *a4, uint64_t a5, unsigned __int8 *a6, uint64_t a7, _DWORD *a8, unsigned int a9, unsigned int a10, _DWORD *a11, BOOL *a12, _QWORD *a13, unint64_t *a14)
{
  return processAclCommandInternal(a1, a2, 30, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14);
}

uint64_t LibCall_ACMSecContextVerifyAclConstraintAndCopyRequirement(uint64_t (*a1)(uint64_t, uint64_t, _QWORD, void *, size_t, unsigned int *, unint64_t *), uint64_t a2, _OWORD *a3, const void *a4, uint64_t a5, const void *a6, unsigned int a7, unsigned __int8 a8, _DWORD *a9, unsigned int a10, unsigned int a11, BOOL *a12, int **a13)
{
  unsigned int v21;
  uint64_t v22;

  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMSecContextVerifyAclConstraintAndCopyRequirement");
  v21 = 70;
  v22 = 4294967293;
  if (a3)
  {
    if (a4)
    {
      if (a5)
      {
        v21 = 70;
        v22 = 4294967293;
        if ((a9 != 0) == (a10 != 0))
        {
          if (a12)
          {
            v22 = verifyAclConstraintInternal(a1, a2, 11, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13);
            if ((_DWORD)v22)
              v21 = 70;
            else
              v21 = 10;
          }
        }
      }
    }
  }
  if (v21 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMSecContextVerifyAclConstraintAndCopyRequirement", (int)v22);
  return v22;
}

uint64_t LibCall_ACMSecCredentialProviderEnrollmentStateChangedForUser(uint64_t (*a1)(uint64_t, uint64_t, _QWORD, char *, uint64_t, _QWORD, _QWORD), uint64_t a2, const void *a3, unsigned int a4, _OWORD *a5, uint64_t a6, int a7, _OWORD *a8, uint64_t a9)
{
  uint64_t (*v16)(uint64_t, uint64_t, _QWORD, char *, uint64_t, _QWORD, _QWORD);
  BOOL v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  size_t v21;
  char *v22;
  _QWORD v24[2];

  v16 = a1;
  v24[1] = *MEMORY[0x24BDAC8D0];
  if (gACMLoggingLevel <= 0xAu)
    a1 = (uint64_t (*)(uint64_t, uint64_t, _QWORD, char *, uint64_t, _QWORD, _QWORD))printf("%s: %s: called.\n", "ACM", "LibCall_ACMSecCredentialProviderEnrollmentStateChangedForUser");
  v17 = a4 - 113 < 0xFFFFFF90;
  if (!a3)
    v17 = a4 != 0;
  if (v17)
  {
    v18 = 70;
    v19 = 4294967293;
  }
  else
  {
    v18 = 70;
    v19 = 4294967293;
    if (a8)
    {
      if (a9 == 16)
      {
        v19 = 4294967293;
        if (a5)
        {
          if (a6 == 16)
          {
            v20 = a4 + 36;
            MEMORY[0x24BDAC7A8](a1);
            v22 = (char *)v24 - ((v21 + 51) & 0x1FFFFFFF0);
            *(_DWORD *)v22 = a7;
            *(_OWORD *)(v22 + 4) = *a8;
            *(_OWORD *)(v22 + 20) = *a5;
            if (a3)
              memcpy(v22 + 36, a3, v21);
            v19 = v16(a2, 14, 0, v22, v20, 0, 0);
            if ((_DWORD)v19)
              v18 = 70;
            else
              v18 = 10;
          }
        }
      }
    }
  }
  if (v18 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMSecCredentialProviderEnrollmentStateChangedForUser", (int)v19);
  return v19;
}

uint64_t LibCall_ACMSecSetBuiltinBiometry(uint64_t (*a1)(uint64_t, uint64_t, _QWORD, char *, size_t, _QWORD, _QWORD), uint64_t a2, char a3)
{
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  char v9;

  v9 = a3;
  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMSecSetBuiltinBiometry");
  v5 = LibCall_ACMSetEnvironmentVariable(a1, a2, 30, 0, 0, 0, &v9, 1uLL);
  v6 = v5;
  if ((_DWORD)v5)
    v7 = 70;
  else
    v7 = 10;
  if (v7 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMSecSetBuiltinBiometry", (int)v5);
  return v6;
}

uint64_t LibCall_ACMSecSetBiometryAvailability(uint64_t (*a1)(uint64_t, uint64_t, _QWORD, int *, uint64_t, uint64_t, uint64_t), uint64_t a2, char a3, int a4)
{
  uint64_t v8;
  unsigned int v9;
  char v10;
  uint64_t v11;
  char v13;
  unint64_t v14;
  char v15;

  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMSecSetBiometryAvailability");
  v15 = 0;
  v14 = 1;
  v13 = 0;
  v8 = LibCall_ACMGetEnvironmentVariable(a1, a2, 6, (uint64_t)&v15, (uint64_t)&v14);
  if ((_DWORD)v8)
  {
    v11 = v8;
    v9 = 70;
  }
  else
  {
    v9 = 70;
    if (v14 > 1)
    {
      v11 = 4294967291;
    }
    else
    {
      v10 = v15 & ~a3;
      if (a4)
        v10 = v15 | a3;
      v13 = v10;
      v11 = LibCall_ACMSetEnvironmentVariable((uint64_t (*)(uint64_t, uint64_t, _QWORD, char *, size_t, _QWORD, _QWORD))a1, a2, 6, 0, 0, 0, &v13, 1uLL);
      if ((_DWORD)v11)
        v9 = 70;
      else
        v9 = 10;
    }
  }
  if (v9 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMSecSetBiometryAvailability", (int)v11);
  return v11;
}

uint64_t LibCall_ACMSecContextGetUnlockSecret(uint64_t (*a1)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD), uint64_t a2, _OWORD *a3, _DWORD *a4, unsigned int a5, void *a6, size_t *a7, _BYTE *a8)
{
  unsigned int v16;
  uint64_t v17;
  uint64_t UnlockSecret_Serialize;
  size_t v19;
  char v21;
  size_t __n;
  void *__src;
  uint64_t v24;
  uint64_t v25;
  _BYTE v26[129];
  _OWORD v27[4];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMSecContextGetUnlockSecret");
  memset(v27, 0, sizeof(v27));
  v25 = 64;
  v24 = 129;
  if (!a3)
    goto LABEL_18;
  v16 = 70;
  v17 = 4294967293;
  if (!a6 || !a7 || !a8)
    goto LABEL_14;
  if ((a4 != 0) != (a5 != 0))
  {
LABEL_18:
    v16 = 70;
    v17 = 4294967293;
    goto LABEL_14;
  }
  UnlockSecret_Serialize = LibSer_GetUnlockSecret_Serialize(a3, a4, a5, v27, &v25);
  if ((_DWORD)UnlockSecret_Serialize
    || (UnlockSecret_Serialize = a1(a2, 50, 0, v27, v25, v26, &v24), (_DWORD)UnlockSecret_Serialize)
    || (__n = 0,
        __src = 0,
        v21 = 0,
        UnlockSecret_Serialize = LibSer_GetUnlockSecretResponse_Deserialize(v26, v24, &__src, &__n, &v21),
        (_DWORD)UnlockSecret_Serialize))
  {
    v17 = UnlockSecret_Serialize;
  }
  else
  {
    v19 = __n;
    if (*a7 < __n)
    {
      v17 = 4294967276;
    }
    else
    {
      if (__src)
      {
        memcpy(a6, __src, __n);
        v17 = 0;
        *a7 = v19;
        *a8 = v21;
        v16 = 10;
        goto LABEL_14;
      }
      v17 = 4294967291;
    }
  }
  v16 = 70;
LABEL_14:
  if (v16 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMSecContextGetUnlockSecret", (int)v17);
  return v17;
}

uint64_t LibCall_ACMSEPControl(uint64_t (*a1)(uint64_t, uint64_t, _QWORD, char *, uint64_t, unsigned int *, unint64_t *), uint64_t a2, const void *a3, size_t a4, uint64_t a5, _DWORD *a6, unsigned int a7, void *a8, size_t *a9)
{
  BOOL v16;
  uint64_t Size;
  uint64_t v18;
  uint64_t v19;
  _OWORD *v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  unsigned int v25;
  void *v26;
  size_t v27;
  uint64_t v29;
  void *v30;
  size_t v31;
  const void *v32;
  unint64_t v33;
  uint64_t v34;
  unsigned int v35[256];
  uint64_t v36;

  v30 = a8;
  v36 = *MEMORY[0x24BDAC8D0];
  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMSEPControl");
  v33 = 1024;
  v34 = 0;
  if (!a1)
    goto LABEL_17;
  v16 = a4 - 4097 < 0xFFFFFFFFFFFFF000;
  if (!a3)
    v16 = a4 != 0;
  if (v16)
  {
LABEL_17:
    v25 = 70;
    v24 = 4294967293;
    goto LABEL_21;
  }
  Size = LibSer_SEPControl_GetSize(a4, a6, a7, &v34);
  if ((_DWORD)Size)
  {
LABEL_18:
    v24 = Size;
LABEL_25:
    v25 = 70;
    goto LABEL_21;
  }
  v18 = a5;
  v19 = a2;
  v20 = (_OWORD *)MEMORY[0x24BDAC7A8](v18);
  v22 = (char *)&v29 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = LibSer_SEPControl_Serialize(v20, a6, a7, a3, a4, (uint64_t)v22, &v34);
  if ((_DWORD)v23)
  {
    v24 = v23;
    goto LABEL_20;
  }
  v24 = a1(v19, 51, 0, v22, v34, v35, &v33);
  if ((_DWORD)v24)
  {
LABEL_20:
    v25 = 70;
    goto LABEL_21;
  }
  v25 = 10;
  v26 = v30;
  if (!v30 || !a9)
    goto LABEL_21;
  v31 = 0;
  v32 = 0;
  Size = LibSer_SEPControlResponse_Deserialize(v35, v33, &v32, &v31);
  if ((_DWORD)Size)
    goto LABEL_18;
  v27 = v31;
  if (*a9 < v31)
  {
    v24 = 4294967276;
    goto LABEL_25;
  }
  if (v32)
    memcpy(v26, v32, v31);
  v24 = 0;
  *a9 = v27;
  v25 = 10;
LABEL_21:
  if (v25 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMSEPControl", (int)v24);
  return v24;
}

uint64_t aclRequiresPasscodeInternal(uint64_t (*a1)(uint64_t, uint64_t, _QWORD, char *, uint64_t, int *, uint64_t *), uint64_t a2, const void *a3, unsigned int a4, _BYTE *a5)
{
  size_t v10;
  uint64_t v11;
  unsigned int *v12;
  unsigned int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v19 = 0;
  v18 = 4;
  v10 = a4;
  v11 = a4 + 4;
  MEMORY[0x24BDAC7A8](a1);
  v12 = (unsigned int *)((char *)&v17 - ((v10 + 19) & 0x1FFFFFFF0));
  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "aclRequiresPasscodeInternal");
  v13 = 70;
  v14 = 4294967293;
  if (a3 && a5)
  {
    *v12 = a4;
    memcpy(v12 + 1, a3, v10);
    v15 = a1(a2, 17, 0, (char *)&v17 - ((v10 + 19) & 0x1FFFFFFF0), v11, &v19, &v18);
    if ((_DWORD)v15)
    {
      v14 = v15;
      v13 = 70;
    }
    else if (v18 == 4)
    {
      v14 = 0;
      *a5 = 1;
      v13 = 10;
    }
    else
    {
      v13 = 70;
      v14 = 4294967291;
    }
  }
  if (v13 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "aclRequiresPasscodeInternal", (int)v14);
  return v14;
}

void LibCall_ACMKernelControl_cold_1()
{
  __assert_rtn("LibCall_ACMKernelControl", "LibCall.c", 373, "commandCursor == commandBuffer + sizeof(commandBuffer)");
}

uint64_t cpGetDeviceInfo(io_registry_entry_t entry, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  uint64_t v11;
  CFAllocatorRef *v12;
  const __CFNumber *CFProperty;
  const __CFNumber *v15;
  int Value;
  const __CFNumber *v17;
  const __CFNumber *v18;
  int v19;
  const __CFNumber *v20;
  const __CFNumber *v21;
  int v22;
  const __CFNumber *v23;
  const __CFNumber *v24;
  int v25;
  const __CFNumber *v26;
  const __CFNumber *v27;
  int v28;

  v11 = 3758097084;
  v12 = (CFAllocatorRef *)MEMORY[0x24BDBD240];
  if (a2)
  {
    CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(entry, CFSTR("DeviceVersion"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
    if (!CFProperty)
      return 3758097136;
    v15 = CFProperty;
    Value = CFNumberGetValue(CFProperty, kCFNumberSInt8Type, a2);
    CFRelease(v15);
    if (!Value)
      return v11;
  }
  if (a3)
  {
    v17 = (const __CFNumber *)IORegistryEntryCreateCFProperty(entry, CFSTR("FirmwareVersion"), *v12, 0);
    if (!v17)
      return 3758097136;
    v18 = v17;
    v19 = CFNumberGetValue(v17, kCFNumberSInt8Type, a3);
    CFRelease(v18);
    if (!v19)
      return v11;
  }
  if (a4)
  {
    v20 = (const __CFNumber *)IORegistryEntryCreateCFProperty(entry, CFSTR("AuthMajorVersion"), *v12, 0);
    if (!v20)
      return 3758097136;
    v21 = v20;
    v22 = CFNumberGetValue(v20, kCFNumberSInt8Type, a4);
    CFRelease(v21);
    if (!v22)
      return v11;
  }
  if (a5)
  {
    v23 = (const __CFNumber *)IORegistryEntryCreateCFProperty(entry, CFSTR("AuthMinorVersion"), *v12, 0);
    if (!v23)
      return 3758097136;
    v24 = v23;
    v25 = CFNumberGetValue(v23, kCFNumberSInt8Type, a5);
    CFRelease(v24);
    if (!v25)
      return v11;
  }
  if (!a6)
    return 0;
  v26 = (const __CFNumber *)IORegistryEntryCreateCFProperty(entry, CFSTR("DeviceID"), *v12, 0);
  if (!v26)
    return 3758097136;
  v27 = v26;
  v28 = CFNumberGetValue(v26, kCFNumberSInt32Type, a6);
  CFRelease(v27);
  if (v28)
    return 0;
  return v11;
}

uint64_t cpGetDeviceIDSN(io_registry_entry_t a1, UInt8 **a2, CFIndex *a3)
{
  uint64_t v3;
  const __CFData *CFProperty;
  const __CFData *v7;
  CFIndex Length;
  UInt8 *v9;
  UInt8 *v10;
  CFRange v12;

  v3 = 3758097090;
  if (a2)
  {
    CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty(a1, CFSTR("IDSN"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
    if (CFProperty)
    {
      v7 = CFProperty;
      Length = CFDataGetLength(CFProperty);
      v9 = (UInt8 *)malloc_type_malloc(Length, 0xC0846878uLL);
      if (v9)
      {
        v10 = v9;
        v12.location = 0;
        v12.length = Length;
        CFDataGetBytes(v7, v12, v9);
        v3 = 0;
        *a2 = v10;
        *a3 = Length;
      }
      else
      {
        v3 = 3758097115;
      }
      CFRelease(v7);
    }
    else
    {
      return 3758097136;
    }
  }
  return v3;
}

CFTypeRef cpCopyCertificate(io_registry_entry_t a1)
{
  return IORegistryEntryCreateCFProperty(a1, CFSTR("AccessoryCertificate"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
}

uint64_t cpClearCertificate(mach_port_t a1)
{
  return IOConnectCallScalarMethod(a1, 0xDu, 0, 0, 0, 0);
}

CFTypeRef cpCopyCertificateSerialNumber(io_registry_entry_t a1)
{
  return IORegistryEntryCreateCFProperty(a1, CFSTR("AccessoryCertificateSerialNumber"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
}

uint64_t cpGetChallengeSignatureLengths(mach_port_t a1, uint64_t *a2, _QWORD *a3)
{
  uint64_t result;
  uint64_t v7;
  uint32_t outputCnt;
  uint64_t output;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  output = 0;
  v10 = 0;
  outputCnt = 2;
  puts("cpGetChallengeSignatureLengths");
  result = IOConnectCallScalarMethod(a1, 0x14u, 0, 0, &output, &outputCnt);
  v7 = v10;
  *a2 = output;
  *a3 = v7;
  return result;
}

uint64_t cpCreateFormattedChallengeFromServerRequest(mach_port_t a1, const __CFData *a2, CFDataRef *a3)
{
  const UInt8 *BytePtr;
  size_t Length;
  uint64_t v8;
  size_t outputStructCnt;
  _OWORD outputStruct[8];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  puts("cpCreateFormattedChallengeFromServerRequest");
  memset(outputStruct, 0, sizeof(outputStruct));
  outputStructCnt = 128;
  BytePtr = CFDataGetBytePtr(a2);
  Length = CFDataGetLength(a2);
  v8 = IOConnectCallStructMethod(a1, 0x15u, BytePtr, Length, outputStruct, &outputStructCnt);
  if (!(_DWORD)v8 && outputStructCnt)
    *a3 = CFDataCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], (const UInt8 *)outputStruct, outputStructCnt);
  return v8;
}

uint64_t cpCreateFormattedResponseForServerResponse(mach_port_t a1, const __CFData *a2, CFDataRef *a3, uint64_t a4)
{
  const UInt8 *BytePtr;
  size_t v8;
  uint64_t v9;
  CFIndex length;
  uint64_t input;
  UInt8 bytes[16];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  input = a4;
  puts("cpCreateFormattedResponseForServerResponse");
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  *(_OWORD *)bytes = 0u;
  v14 = 0u;
  length = 128;
  BytePtr = CFDataGetBytePtr(a2);
  v8 = CFDataGetLength(a2);
  v9 = IOConnectCallMethod(a1, 0x16u, &input, 1u, BytePtr, v8, 0, 0, bytes, (size_t *)&length);
  if (!(_DWORD)v9)
    *a3 = CFDataCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], bytes, length);
  return v9;
}

uint64_t cpCreateSignature(mach_port_t a1, CFDataRef theData, CFDataRef *a3)
{
  const UInt8 *BytePtr;
  size_t v7;
  uint64_t v8;
  CFIndex length;
  UInt8 outputStruct[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  length = 128;
  BytePtr = CFDataGetBytePtr(theData);
  v7 = CFDataGetLength(theData);
  v8 = IOConnectCallStructMethod(a1, 0, BytePtr, v7, outputStruct, (size_t *)&length);
  if (!(_DWORD)v8)
    *a3 = CFDataCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], outputStruct, length);
  return v8;
}

uint64_t cpCreateSignatureWithIndexAndToken(mach_port_t a1, const __CFData *a2, CFDataRef *a3, uint64_t *a4, int a5)
{
  CFIndex v10;
  const UInt8 *BytePtr;
  size_t v12;
  uint64_t v13;
  CFIndex length;
  uint32_t outputCnt;
  uint64_t input[3];
  UInt8 bytes[16];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  puts("cpCreateSignatureWithIndexAndToken");
  if (a2)
  {
    v10 = CFDataGetLength(a2);
    if (v10)
      CFDataGetBytePtr(a2);
  }
  else
  {
    v10 = 0;
  }
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  *(_OWORD *)bytes = 0u;
  v19 = 0u;
  input[0] = a5;
  input[1] = v10;
  input[2] = 128;
  outputCnt = 1;
  length = 128;
  BytePtr = CFDataGetBytePtr(a2);
  v12 = CFDataGetLength(a2);
  v13 = IOConnectCallMethod(a1, 0x13u, input, 3u, BytePtr, v12, a4, &outputCnt, bytes, (size_t *)&length);
  if (!(_DWORD)v13)
    *a3 = CFDataCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], bytes, length);
  return v13;
}

CFTypeRef cpCopyDeviceNonce(io_registry_entry_t a1)
{
  return IORegistryEntryCreateCFProperty(a1, CFSTR("DeviceNonce"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
}

uint64_t cpSetAuthStatus(mach_port_t a1, unsigned int a2)
{
  uint64_t input;

  input = a2;
  return IOConnectCallScalarMethod(a1, 4u, &input, 1u, 0, 0);
}

uint64_t cpSetTrustStatus(mach_port_t a1, unsigned int a2)
{
  uint64_t input;

  input = a2;
  return IOConnectCallScalarMethod(a1, 8u, &input, 1u, 0, 0);
}

uint64_t cpSetTrustStatusForUI(mach_port_t a1, unsigned int a2)
{
  uint64_t input;

  input = a2;
  return IOConnectCallScalarMethod(a1, 9u, &input, 1u, 0, 0);
}

uint64_t cpSetFdrValidationStatus(mach_port_t a1, unsigned int a2)
{
  uint64_t input;

  input = a2;
  return IOConnectCallScalarMethod(a1, 5u, &input, 1u, 0, 0);
}

uint64_t cpSetAuthFullPass(mach_port_t a1, unsigned int a2)
{
  uint64_t input;

  input = a2;
  return IOConnectCallScalarMethod(a1, 0xAu, &input, 1u, 0, 0);
}

uint64_t cpSetAuthErrorDescription(mach_port_t a1, CFStringRef theString)
{
  uint64_t v4;
  CFIndex v5;
  char *v6;
  char *v7;

  v4 = 3758097085;
  v5 = CFStringGetLength(theString) + 1;
  v6 = (char *)malloc_type_malloc(v5, 0x100004077774924uLL);
  if (v6)
  {
    v7 = v6;
    if (CFStringGetCString(theString, v6, v5, 0x8000100u))
      v4 = IOConnectCallStructMethod(a1, 0xBu, v7, v5, 0, 0);
    else
      v4 = 3758097090;
    free(v7);
  }
  return v4;
}

uint64_t cpSetAuthError(mach_port_t a1, unsigned int a2)
{
  uint64_t v3;
  uint64_t input;

  v3 = a2;
  printf("cpSetAuthError %d\n", a2);
  input = v3;
  return IOConnectCallScalarMethod(a1, 0xCu, &input, 1u, 0, 0);
}

uint64_t cpCopyDownstreamCertificateSerialNumber(mach_port_t a1, CFStringRef *a2)
{
  uint64_t v3;
  CFStringRef v4;
  size_t outputStructCnt;
  char outputStruct[33];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  outputStructCnt = 33;
  v3 = IOConnectCallStructMethod(a1, 1u, 0, 0, outputStruct, &outputStructCnt);
  v4 = 0;
  if (!(_DWORD)v3)
    v4 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x24BDBD240], outputStruct, 0x600u);
  *a2 = v4;
  return v3;
}

uint64_t cpSetDownstreamRevokeStatus(mach_port_t a1, unsigned int a2)
{
  uint64_t input;

  input = a2;
  return IOConnectCallScalarMethod(a1, 2u, &input, 1u, 0, 0);
}

uint64_t cpGetDownstreamAuthMajorVer(mach_port_t a1, _BYTE *a2)
{
  uint64_t result;
  uint32_t outputCnt;
  uint64_t output;

  output = 0;
  outputCnt = 1;
  result = IOConnectCallScalarMethod(a1, 3u, 0, 0, &output, &outputCnt);
  *a2 = output;
  return result;
}

uint64_t cpClearAuthState(mach_port_t a1)
{
  return IOConnectCallScalarMethod(a1, 6u, 0, 0, 0, 0);
}

uint64_t cpRequestAuthRestart(mach_port_t a1)
{
  return IOConnectCallScalarMethod(a1, 7u, 0, 0, 0, 0);
}

uint64_t cpSetExpectedPairedCertSN(mach_port_t a1, CFStringRef theString)
{
  uint64_t v4;
  CFIndex v5;
  char *v6;
  char *v7;

  v4 = 3758097085;
  v5 = CFStringGetLength(theString) + 1;
  v6 = (char *)malloc_type_malloc(v5, 0x100004077774924uLL);
  if (v6)
  {
    v7 = v6;
    if (CFStringGetCString(theString, v6, v5, 0x8000100u))
    {
      v4 = IOConnectCallStructMethod(a1, 0x11u, v7, v5, 0, 0);
    }
    else
    {
      puts("cpSetExpectedPairedCertSN: !CFStringGetCString");
      v4 = 3758097090;
    }
    free(v7);
  }
  return v4;
}

uint64_t cpSetActualPairedCertSN(mach_port_t a1, CFStringRef theString)
{
  uint64_t v4;
  CFIndex v5;
  char *v6;
  char *v7;

  v4 = 3758097085;
  v5 = CFStringGetLength(theString) + 1;
  v6 = (char *)malloc_type_malloc(v5, 0x100004077774924uLL);
  if (v6)
  {
    v7 = v6;
    if (CFStringGetCString(theString, v6, v5, 0x8000100u))
    {
      v4 = IOConnectCallStructMethod(a1, 0x12u, v7, v5, 0, 0);
    }
    else
    {
      puts("cpSetActualPairedCertSN: !CFStringGetCString");
      v4 = 3758097090;
    }
    free(v7);
  }
  return v4;
}

uint64_t cpGetTransportEntryId(mach_port_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint32_t outputCnt;
  uint64_t output;

  output = 0;
  outputCnt = 1;
  v3 = IOConnectCallScalarMethod(a1, 0x10u, 0, 0, &output, &outputCnt);
  v4 = v3;
  if ((_DWORD)v3)
    printf("cpGetTransportEntryId: IOConnectCallScalarMethod failed: 0x%x\n", v3);
  else
    *a2 = output;
  return v4;
}

uint64_t cpGetUpstreamAccessoryManager(io_registry_entry_t a1)
{
  io_registry_entry_t parent;

  parent = 0;
  if (IORegistryEntryGetParentEntry(a1, "IOAccessory", &parent))
    return 0;
  else
    return parent;
}

uint64_t cpGetInternalComponents(__CFArray **a1)
{
  uint64_t v1;
  __CFDictionary *v3;
  uint64_t MatchingServices;
  const __CFAllocator *v5;
  io_object_t v6;
  io_object_t v7;
  const __CFBoolean *CFProperty;
  const __CFBoolean *v9;
  __CFDictionary *Mutable;
  kern_return_t RegistryEntryID;
  CFNumberRef v12;
  CFNumberRef v13;
  CFTypeRef v14;
  int v15;
  int v16;
  const __CFString *v17;
  CFTypeRef v18;
  CFTypeRef v19;
  CFTypeRef v20;
  const void *v21;
  CFTypeRef v22;
  __CFDictionary *v23;
  __CFArray **v25;
  __CFArray *theArray;
  const __CFAllocator *v27;
  const __CFBoolean *cf;
  io_iterator_t existing;
  uint64_t entryID;
  int valuePtr;

  v1 = 3758097090;
  if (a1)
  {
    existing = 0;
    v3 = IOServiceMatching("AppleAuthCP");
    CFDictionarySetValue(v3, CFSTR("InternalComponent"), (const void *)*MEMORY[0x24BDBD270]);
    MatchingServices = IOServiceGetMatchingServices(*MEMORY[0x24BDD8B20], v3, &existing);
    if ((_DWORD)MatchingServices)
    {
      return MatchingServices;
    }
    else
    {
      v25 = a1;
      v5 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
      theArray = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD690]);
      v6 = IOIteratorNext(existing);
      if (v6)
      {
        v7 = v6;
        v27 = v5;
        do
        {
          CFProperty = (const __CFBoolean *)IORegistryEntryCreateCFProperty(v7, CFSTR("InternalComponent"), v5, 0);
          if (!CFProperty)
          {
            v23 = 0;
LABEL_38:
            v16 = -536870206;
            goto LABEL_40;
          }
          v9 = CFProperty;
          valuePtr = 0;
          entryID = 0;
          if (!CFBooleanGetValue(CFProperty))
          {
            v23 = 0;
            Mutable = 0;
            v22 = v9;
            v16 = -536870206;
            goto LABEL_34;
          }
          Mutable = CFDictionaryCreateMutable(v5, 5, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
          if (!Mutable)
            goto LABEL_45;
          RegistryEntryID = IORegistryEntryGetRegistryEntryID(v7, &entryID);
          if (RegistryEntryID)
          {
            v16 = RegistryEntryID;
            v23 = 0;
LABEL_49:
            v22 = v9;
LABEL_34:
            CFRelease(v22);
            goto LABEL_35;
          }
          v12 = CFNumberCreate(v5, kCFNumberSInt64Type, &entryID);
          if (!v12)
          {
LABEL_45:
            v23 = 0;
            v16 = -536870181;
            goto LABEL_49;
          }
          v13 = v12;
          CFDictionaryAddValue(Mutable, CFSTR("IORegistryEntryID"), v12);
          v14 = IORegistryEntryCreateCFProperty(v7, CFSTR("flags"), v5, 0);
          if (v14)
            CFDictionaryAddValue(Mutable, CFSTR("flags"), v14);
          CFNumberGetValue((CFNumberRef)v14, kCFNumberSInt32Type, &valuePtr);
          v15 = BYTE2(valuePtr) << 16;
          v16 = -536870201;
          cf = v9;
          if (v15 == 0x10000)
          {
            v17 = CFSTR("Battery");
          }
          else
          {
            if (v15 != 196608)
            {
              v23 = 0;
              v19 = 0;
              v21 = 0;
              v22 = 0;
              v18 = 0;
              goto LABEL_25;
            }
            v17 = CFSTR("TouchController");
          }
          CFDictionaryAddValue(Mutable, CFSTR("ComponentName"), v17);
          v18 = IORegistryEntryCreateCFProperty(v7, CFSTR("authErrorDescription"), v5, 0);
          if (v18)
          {
            CFDictionaryAddValue(Mutable, CFSTR("authErrorDescription"), v18);
            v19 = IORegistryEntryCreateCFProperty(v7, CFSTR("AuthPassed"), v5, 0);
            if (v19)
              CFDictionaryAddValue(Mutable, CFSTR("AuthPassed"), v19);
            v20 = IORegistryEntryCreateCFProperty(v7, CFSTR("isTrusted"), v5, 0);
            v21 = v20;
            if (v20)
              CFDictionaryAddValue(Mutable, CFSTR("isTrusted"), v20);
            v22 = IORegistryEntryCreateCFProperty(v7, CFSTR("isTrustedForUI"), v5, 0);
            if (v22)
              CFDictionaryAddValue(Mutable, CFSTR("isTrustedForUI"), v22);
            v16 = 0;
            v23 = Mutable;
          }
          else
          {
            v23 = 0;
            v19 = 0;
            v21 = 0;
            v22 = 0;
          }
LABEL_25:
          CFRelease(cf);
          CFRelease(v13);
          if (v14)
            CFRelease(v14);
          if (v18)
            CFRelease(v18);
          if (v19)
            CFRelease(v19);
          if (v21)
            CFRelease(v21);
          if (v22)
            goto LABEL_34;
LABEL_35:
          if (Mutable)
          {
            v5 = v27;
            if (!v16)
              goto LABEL_40;
            CFRelease(Mutable);
            goto LABEL_38;
          }
          v5 = v27;
LABEL_40:
          IOObjectRelease(v7);
          if (v23 && !v16)
          {
            CFArrayAppendValue(theArray, v23);
            CFRelease(v23);
          }
          v7 = IOIteratorNext(existing);
        }
        while (v7);
      }
      IOObjectRelease(existing);
      v1 = 0;
      *v25 = theArray;
    }
  }
  return v1;
}

uint64_t AuthCPI2CRead(mach_port_t a1, char a2, unsigned int a3, void *outputStruct)
{
  size_t outputStructCnt;
  uint64_t input;

  LOBYTE(input) = a2;
  outputStructCnt = a3;
  return IOConnectCallMethod(a1, 0xEu, &input, 1u, 0, 0, 0, 0, outputStruct, &outputStructCnt);
}

uint64_t AuthCPI2CWrite(mach_port_t a1, char a2, size_t inputStructCnt, void *inputStruct)
{
  uint64_t input;

  LOBYTE(input) = a2;
  return IOConnectCallMethod(a1, 0xFu, &input, 1u, inputStruct, inputStructCnt, 0, 0, 0, 0);
}

void notifyUserHSAIDDisabled_cold_1(void *a1, NSObject *a2)
{
  int v3;
  void *v4;
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138412546;
  v4 = a1;
  v5 = 1024;
  v6 = objc_msgSend(a1, "intValue");
  _os_log_debug_impl(&dword_21722C000, a2, OS_LOG_TYPE_DEBUG, "Serial boot-arg value: %@, intValue:%d", (uint8_t *)&v3, 0x12u);
}

void notifyUserHSAIDDisabled_cold_2(uint64_t a1, int a2)
{
  int v2;
  uint64_t v3;
  __int16 v4;
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 134218240;
  v3 = a1;
  v4 = 1024;
  v5 = a2;
  _os_log_error_impl(&dword_21722C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", (uint8_t *)&v2, 0x12u);
}

void __OOBPairingReceiveCallback_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_21722C000, a2, a3, "Could not process incoming OOB Pairing info/data, type=%d", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_9();
}

void __OOBPairingReceiveCallback_cold_4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_21722C000, a2, a3, "ERROR in receive callback - result = 0x%X", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_9();
}

void _acc_sysdiagnose_authFailure_cold_1(uint64_t a1)
{
  int v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 138412290;
  v2 = a1;
  _os_log_error_impl(&dword_21722C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Failed to create sysdiagnose: %@\n", (uint8_t *)&v1, 0xCu);
}

void logModuleForTransport_cold_1(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_21722C000, a2, OS_LOG_TYPE_ERROR, "unknown classType %d", (uint8_t *)v2, 8u);
}

void logObjectForModule_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_1(&dword_21722C000, MEMORY[0x24BDACB70], v0, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", v1, v2, v3, v4, 0);
  OUTLINED_FUNCTION_2();
}

void IOAccMgrNotifyEvent_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_4_0(&dword_21722C000, v0, v1, "Unknown connection type:%d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

void IOAccMgrNotifyEvent_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_5_1(&dword_21722C000, v0, v1, "Got inductive accessory attach, registering for battery notifications", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

void IOAccMgrNotifyEvent_cold_6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_4_0(&dword_21722C000, v0, v1, "Got a resistorID on Attach, but it's %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

void IOAccMgrNotifyEvent_cold_9()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_4_0(&dword_21722C000, v0, v1, "Got a resistorID on ConfigChange, but it's %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

void IOAccMgrNotifyEvent_cold_15(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_13(&dword_21722C000, a1, a3, "IOAccessoryManager:%s timeout TTR already processed", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void IOAccMgrNotifyEvent_cold_16(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_13(&dword_21722C000, a1, a3, "IOAccessoryManager:%s timeout TTR", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void IOAccMgrNotifyEvent_cold_17(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_13(&dword_21722C000, a1, a3, "IOAccessoryManager:%s timeout TTR disabled", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void IOAccMgrNotifyEvent_cold_18()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_4_0(&dword_21722C000, v0, v1, "Got a resistorID on PropertyChange, but it's %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

void IOAccMgrNotifyEvent_cold_20()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_4_0(&dword_21722C000, v0, v1, "Got kIOAccessoryManagerMessageUSBConnectChange (svc:%d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

void IOAccMgrNotifyEvent_cold_22()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_5_1(&dword_21722C000, v0, v1, "Got kIOAccessoryManagerMessageUSBBatteryPackChange", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

void IOAccMgrNotifyEvent_cold_23()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_5_1(&dword_21722C000, v0, v1, "Got kIOAccessoryManagerMessageUSBCurrentLimitChange", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

void IOAccMgrNotifyEvent_cold_24()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_5_1(&dword_21722C000, v0, v1, "Got kIOAccessoryManagerPowerChange", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

void IOAccMgrNotifyEvent_cold_26()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_4_0(&dword_21722C000, v0, v1, "Got kIOAccessoryManagerMessageAccIDDigitalWrongOrientation (svc:%d), bAccConnected = yes", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

void IOAccMgrNotifyEvent_cold_28()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_4_0(&dword_21722C000, v0, v1, "Got kIOAccessoryManagerMessageAccIDDigitalUnsupported (svc:%d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

void IOAccMgrNotifyEvent_cold_30()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_4_0(&dword_21722C000, v0, v1, "Got kIOAccessoryManagerMessageAccIDDigitalUnreliable (svc:%d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

void __handleNotificationUarpStagingStatus_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  const char *v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 136315394;
  v4 = "__handleNotificationUarpStagingStatus";
  v5 = 2112;
  v6 = a1;
  OUTLINED_FUNCTION_24(&dword_21722C000, a2, a3, "%s: %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_2();
}

void __IOAMUpdateBatteryState_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_21722C000, a2, a3, "%s IORegistryEntryCreateCFProperties failed: %08x", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void EnableAccessoryPowerForPortService_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[10];
  int v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_22_0();
  v3 = 1;
  OUTLINED_FUNCTION_10(&dword_21722C000, v0, v1, "IOAccessoryManagerConfigurePower failed %#x, didn't set powerMode(%d)", v2);
  OUTLINED_FUNCTION_2();
}

void EnableAccessoryPowerForPortService_cold_4()
{
  int v0;
  NSObject *v1;
  uint8_t v2[10];
  int v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_22_0();
  v3 = v0;
  OUTLINED_FUNCTION_10(&dword_21722C000, v1, (uint64_t)v1, "IOServiceOpen failed %#x, didn't set powerMode(%d)", v2);
  OUTLINED_FUNCTION_2();
}

void logObjectForModule_cold_1_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_21722C000, MEMORY[0x24BDACB70], a3, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

void __EASessionReceiveCallback_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "eaProtocol");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7_1(&dword_21722C000, v2, v3, "Could not process incoming EA data for protocol %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_6_1();
}

void __EASessionReceiveCallback_cold_4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_21722C000, a2, a3, "ERROR in receive callback - result = 0x%X", a5, a6, a7, a8, 0);
}

void __init_logging_signpost_modules_block_invoke_cold_1(uint8_t *buf, int a2, _DWORD *a3)
{
  *(_DWORD *)buf = 67109120;
  *a3 = a2;
  _os_log_error_impl(&dword_21722C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Category missing for logging module %d!\n(Check LoggingSignpostModuleEntry_t table)", buf, 8u);
}

void getDEVNTempCertCapsForCable_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_12_0(&dword_21722C000, v0, v1, "Object allocation failed pAccCaps = NULL\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

void __init_logging_modules_block_invoke_cold_1(uint8_t *buf, int a2, _DWORD *a3)
{
  *(_DWORD *)buf = 67109120;
  *a3 = a2;
  _os_log_error_impl(&dword_21722C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Category missing for logging module %d!\n(Check LoggingModuleEntry_t table)", buf, 8u);
}

uint64_t AMFDRSealingMapCopyLocalDataForClass()
{
  return MEMORY[0x24BED4328]();
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x24BE1A1B0]();
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x24BDAC358](data, *(_QWORD *)&len, md);
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x24BDBB7C8](theArray, value);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x24BDBB808](allocator, capacity, callBacks);
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

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
  MEMORY[0x24BDBBCE8](theData, range.location, range.length, buffer);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x24BDBBCF8](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x24BDBBD08]();
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBDB0](theDict, key, value);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF0](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF8](allocator, capacity, theDict);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x24BDBBE30](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBE60](theDict, key, value);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x24BDBBE68](cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x24BDBC040](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x24BDBC050]();
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
  MEMORY[0x24BDBC088](center, observer, name, object);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x24BDBC0A0](allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x24BDBC118]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x24BDBC130](number, theType, valuePtr);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC160](key, applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x24BDBC188](key, applicationID, keyExistsAndHasValidFormat);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x24BDBC190](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  MEMORY[0x24BDBC1A8](key, value, applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
  MEMORY[0x24BDBC2C8](rl, source, mode);
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return (CFRunLoopRef)MEMORY[0x24BDBC300]();
}

void CFRunLoopRemoveSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
  MEMORY[0x24BDBC348](rl, source, mode);
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
  MEMORY[0x24BDBC4A8](theString, appendedString);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x24BDBC4D0](theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFStringRef)MEMORY[0x24BDBC520](alloc, theString);
}

CFMutableStringRef CFStringCreateMutableCopy(CFAllocatorRef alloc, CFIndex maxLength, CFStringRef theString)
{
  return (CFMutableStringRef)MEMORY[0x24BDBC540](alloc, maxLength, theString);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x24BDBC568](alloc, cStr, *(_QWORD *)&encoding);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x24BDBC600](theString, buffer, bufferSize, *(_QWORD *)&encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x24BDBC610](theString, *(_QWORD *)&encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x24BDBC658](theString);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x24BDBC698]();
}

SInt32 CFUserNotificationCancel(CFUserNotificationRef userNotification)
{
  return MEMORY[0x24BDBC918](userNotification);
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return (CFUserNotificationRef)MEMORY[0x24BDBC920](allocator, flags, error, dictionary, timeout);
}

SInt32 CFUserNotificationDisplayAlert(CFTimeInterval timeout, CFOptionFlags flags, CFURLRef iconURL, CFURLRef soundURL, CFURLRef localizationURL, CFStringRef alertHeader, CFStringRef alertMessage, CFStringRef defaultButtonTitle, CFStringRef alternateButtonTitle, CFStringRef otherButtonTitle, CFOptionFlags *responseFlags)
{
  return MEMORY[0x24BDBC930](flags, iconURL, soundURL, localizationURL, alertHeader, alertMessage, defaultButtonTitle, alternateButtonTitle, timeout);
}

SInt32 CFUserNotificationReceiveResponse(CFUserNotificationRef userNotification, CFTimeInterval timeout, CFOptionFlags *responseFlags)
{
  return MEMORY[0x24BDBC950](userNotification, responseFlags, timeout);
}

uint64_t DiagnosticLogSubmissionEnabled()
{
  return MEMORY[0x24BE29F70]();
}

uint64_t IOAccesoryManagerGetDigitalIDAccessoryVersionInfo()
{
  return MEMORY[0x24BED4868]();
}

uint64_t IOAccessoryConfigStreamInterfaceGetCategories()
{
  return MEMORY[0x24BED4870]();
}

uint64_t IOAccessoryConfigStreamInterfaceGetCategoryProperties()
{
  return MEMORY[0x24BED4878]();
}

uint64_t IOAccessoryConfigStreamInterfaceGetProperty()
{
  return MEMORY[0x24BED4880]();
}

uint64_t IOAccessoryConfigStreamInterfaceRequestGetProperty()
{
  return MEMORY[0x24BED4888]();
}

uint64_t IOAccessoryConfigStreamInterfaceSetProperty()
{
  return MEMORY[0x24BED4890]();
}

uint64_t IOAccessoryEAInterfaceCopyDeviceDockType()
{
  return MEMORY[0x24BED4898]();
}

uint64_t IOAccessoryEAInterfaceCopyDeviceFirmwareRevision()
{
  return MEMORY[0x24BED48A0]();
}

uint64_t IOAccessoryEAInterfaceCopyDeviceHardwareRevision()
{
  return MEMORY[0x24BED48A8]();
}

uint64_t IOAccessoryEAInterfaceCopyDeviceModelNumber()
{
  return MEMORY[0x24BED48B0]();
}

uint64_t IOAccessoryEAInterfaceCopyDeviceName()
{
  return MEMORY[0x24BED48B8]();
}

uint64_t IOAccessoryEAInterfaceCopyDeviceSerialNumber()
{
  return MEMORY[0x24BED48C0]();
}

uint64_t IOAccessoryEAInterfaceCopyDeviceVendorName()
{
  return MEMORY[0x24BED48C8]();
}

uint64_t IOAccessoryEAInterfaceCopyProtocolString()
{
  return MEMORY[0x24BED48D0]();
}

uint64_t IOAccessoryEAInterfaceReceiveData()
{
  return MEMORY[0x24BED48D8]();
}

uint64_t IOAccessoryEAInterfaceRegisterReceiveCallback()
{
  return MEMORY[0x24BED48E0]();
}

uint64_t IOAccessoryEAInterfaceSendData()
{
  return MEMORY[0x24BED48E8]();
}

uint64_t IOAccessoryManagerAllowFeatures()
{
  return MEMORY[0x24BED48F0]();
}

uint64_t IOAccessoryManagerConfigurePower()
{
  return MEMORY[0x24BED4900]();
}

uint64_t IOAccessoryManagerConfigureUSBMode()
{
  return MEMORY[0x24BED4908]();
}

uint64_t IOAccessoryManagerCopyAccessoryDeviceUID()
{
  return MEMORY[0x24BED4910]();
}

uint64_t IOAccessoryManagerCopyDeviceInfo()
{
  return MEMORY[0x24BED4918]();
}

uint64_t IOAccessoryManagerGetAccessoryID()
{
  return MEMORY[0x24BED4920]();
}

uint64_t IOAccessoryManagerGetActivePowerMode()
{
  return MEMORY[0x24BED4928]();
}

uint64_t IOAccessoryManagerGetBatteryPackMode()
{
  return MEMORY[0x24BED4930]();
}

uint64_t IOAccessoryManagerGetDigitalID()
{
  return MEMORY[0x24BED4938]();
}

uint64_t IOAccessoryManagerGetPowerDuringSleep()
{
  return MEMORY[0x24BED4940]();
}

uint64_t IOAccessoryManagerGetPrimaryPort()
{
  return MEMORY[0x24BED4948]();
}

uint64_t IOAccessoryManagerGetServiceWithPrimaryPort()
{
  return MEMORY[0x24BED4950]();
}

uint64_t IOAccessoryManagerGetSleepPowerCurrentLimit()
{
  return MEMORY[0x24BED4958]();
}

uint64_t IOAccessoryManagerGetType()
{
  return MEMORY[0x24BED4960]();
}

uint64_t IOAccessoryManagerGetUSBChargingVoltage()
{
  return MEMORY[0x24BED4968]();
}

uint64_t IOAccessoryManagerGetUSBConnectType()
{
  return MEMORY[0x24BED4970]();
}

uint64_t IOAccessoryManagerGetUSBCurrentLimit()
{
  return MEMORY[0x24BED4978]();
}

uint64_t IOAccessoryManagerGetUSBCurrentLimitBase()
{
  return MEMORY[0x24BED4980]();
}

uint64_t IOAccessoryManagerGetUSBCurrentLimitOffset()
{
  return MEMORY[0x24BED4988]();
}

uint64_t IOAccessoryManagerGetUpstreamService()
{
  return MEMORY[0x24BED4990]();
}

uint64_t IOAccessoryManagerPowerDuringSleepIsSupported()
{
  return MEMORY[0x24BED4998]();
}

uint64_t IOAccessoryManagerPowerModeCurrentLimit()
{
  return MEMORY[0x24BED49A0]();
}

uint64_t IOAccessoryManagerRestoreUSBCurrentLimitBase()
{
  return MEMORY[0x24BED49A8]();
}

uint64_t IOAccessoryManagerRevokeFeatures()
{
  return MEMORY[0x24BED49B0]();
}

uint64_t IOAccessoryManagerSetAccessoryRequestedCurrent()
{
  return MEMORY[0x24BED49B8]();
}

uint64_t IOAccessoryManagerSetAccessoryUsedCurrent()
{
  return MEMORY[0x24BED49C0]();
}

uint64_t IOAccessoryManagerSetBatteryPackMode()
{
  return MEMORY[0x24BED49C8]();
}

uint64_t IOAccessoryManagerSetPowerDuringSleep()
{
  return MEMORY[0x24BED49D0]();
}

uint64_t IOAccessoryManagerSetUSBCurrentLimitBase()
{
  return MEMORY[0x24BED49D8]();
}

uint64_t IOAccessoryManagerSetUSBCurrentOffset()
{
  return MEMORY[0x24BED49E0]();
}

uint64_t IOAccessoryOOBPairingInterfaceCopyDeviceDockType()
{
  return MEMORY[0x24BED49E8]();
}

uint64_t IOAccessoryOOBPairingInterfaceCopyDeviceFirmwareRevision()
{
  return MEMORY[0x24BED49F0]();
}

uint64_t IOAccessoryOOBPairingInterfaceCopyDeviceHardwareRevision()
{
  return MEMORY[0x24BED49F8]();
}

uint64_t IOAccessoryOOBPairingInterfaceCopyDeviceModelNumber()
{
  return MEMORY[0x24BED4A00]();
}

uint64_t IOAccessoryOOBPairingInterfaceCopyDeviceName()
{
  return MEMORY[0x24BED4A08]();
}

uint64_t IOAccessoryOOBPairingInterfaceCopyDevicePlatformID()
{
  return MEMORY[0x24BED4A10]();
}

uint64_t IOAccessoryOOBPairingInterfaceCopyDeviceSerialNumber()
{
  return MEMORY[0x24BED4A18]();
}

uint64_t IOAccessoryOOBPairingInterfaceCopyDeviceVendorName()
{
  return MEMORY[0x24BED4A20]();
}

uint64_t IOAccessoryOOBPairingInterfaceGetActivePairingType()
{
  return MEMORY[0x24BED4A28]();
}

uint64_t IOAccessoryOOBPairingInterfaceGetPairingData()
{
  return MEMORY[0x24BED4A30]();
}

uint64_t IOAccessoryOOBPairingInterfaceGetPairingInfo()
{
  return MEMORY[0x24BED4A38]();
}

uint64_t IOAccessoryOOBPairingInterfaceGetSupportedPairingTypes()
{
  return MEMORY[0x24BED4A40]();
}

uint64_t IOAccessoryOOBPairingInterfaceRegisterReceiveCallback()
{
  return MEMORY[0x24BED4A48]();
}

uint64_t IOAccessoryOOBPairingInterfaceSendPairingData()
{
  return MEMORY[0x24BED4A50]();
}

uint64_t IOAccessoryOOBPairingInterfaceSendPairingInfo()
{
  return MEMORY[0x24BED4A58]();
}

uint64_t IOAccessoryOOBPairingInterfaceSupports2Way()
{
  return MEMORY[0x24BED4A60]();
}

uint64_t IOAccessoryPortCreateRunLoopSource()
{
  return MEMORY[0x24BED4A68]();
}

uint64_t IOAccessoryPortGetManagerPrimaryPort()
{
  return MEMORY[0x24BED4A70]();
}

uint64_t IOAccessoryPortGetManagerService()
{
  return MEMORY[0x24BED4A78]();
}

uint64_t IOAccessoryPortGetPort()
{
  return MEMORY[0x24BED4A80]();
}

uint64_t IOAccessoryPortGetServiceWithPort()
{
  return MEMORY[0x24BED4A88]();
}

uint64_t IOAccessoryPortGetStreamType()
{
  return MEMORY[0x24BED4A90]();
}

uint64_t IOAccessoryPortGetTransportType()
{
  return MEMORY[0x24BED4A98]();
}

uint64_t IOAccessoryPortTransmitData()
{
  return MEMORY[0x24BED4AA0]();
}

kern_return_t IOConnectCallMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x24BDD7EF8](*(_QWORD *)&connection, *(_QWORD *)&selector, input, *(_QWORD *)&inputCnt, inputStruct, inputStructCnt, output, outputCnt);
}

kern_return_t IOConnectCallScalarMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, uint64_t *output, uint32_t *outputCnt)
{
  return MEMORY[0x24BDD7F00](*(_QWORD *)&connection, *(_QWORD *)&selector, input, *(_QWORD *)&inputCnt, output, outputCnt);
}

kern_return_t IOConnectCallStructMethod(mach_port_t connection, uint32_t selector, const void *inputStruct, size_t inputStructCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x24BDD7F08](*(_QWORD *)&connection, *(_QWORD *)&selector, inputStruct, inputStructCnt, outputStruct, outputStructCnt);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return MEMORY[0x24BDD8668](*(_QWORD *)&iterator);
}

IONotificationPortRef IONotificationPortCreate(mach_port_t mainPort)
{
  return (IONotificationPortRef)MEMORY[0x24BDD8690](*(_QWORD *)&mainPort);
}

void IONotificationPortDestroy(IONotificationPortRef notify)
{
  MEMORY[0x24BDD8698](notify);
}

CFRunLoopSourceRef IONotificationPortGetRunLoopSource(IONotificationPortRef notify)
{
  return (CFRunLoopSourceRef)MEMORY[0x24BDD86A8](notify);
}

void IONotificationPortSetDispatchQueue(IONotificationPortRef notify, dispatch_queue_t queue)
{
  MEMORY[0x24BDD86B0](notify, queue);
}

BOOLean_t IOObjectConformsTo(io_object_t object, const io_name_t className)
{
  return MEMORY[0x24BDD86B8](*(_QWORD *)&object, className);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x24BDD86F8](*(_QWORD *)&object);
}

kern_return_t IOObjectRetain(io_object_t object)
{
  return MEMORY[0x24BDD8700](*(_QWORD *)&object);
}

kern_return_t IORegistryEntryCreateCFProperties(io_registry_entry_t entry, CFMutableDictionaryRef *properties, CFAllocatorRef allocator, IOOptionBits options)
{
  return MEMORY[0x24BDD88A8](*(_QWORD *)&entry, properties, allocator, *(_QWORD *)&options);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x24BDD88B0](*(_QWORD *)&entry, key, allocator, *(_QWORD *)&options);
}

io_registry_entry_t IORegistryEntryFromPath(mach_port_t mainPort, const io_string_t path)
{
  return MEMORY[0x24BDD88C0](*(_QWORD *)&mainPort, path);
}

kern_return_t IORegistryEntryGetName(io_registry_entry_t entry, io_name_t name)
{
  return MEMORY[0x24BDD88E0](*(_QWORD *)&entry, name);
}

kern_return_t IORegistryEntryGetParentEntry(io_registry_entry_t entry, const io_name_t plane, io_registry_entry_t *parent)
{
  return MEMORY[0x24BDD88F0](*(_QWORD *)&entry, plane, parent);
}

kern_return_t IORegistryEntryGetRegistryEntryID(io_registry_entry_t entry, uint64_t *entryID)
{
  return MEMORY[0x24BDD8910](*(_QWORD *)&entry, entryID);
}

CFTypeRef IORegistryEntrySearchCFProperty(io_registry_entry_t entry, const io_name_t plane, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x24BDD8928](*(_QWORD *)&entry, plane, key, allocator, *(_QWORD *)&options);
}

kern_return_t IOServiceAddInterestNotification(IONotificationPortRef notifyPort, io_service_t service, const io_name_t interestType, IOServiceInterestCallback callback, void *refCon, io_object_t *notification)
{
  return MEMORY[0x24BDD8958](notifyPort, *(_QWORD *)&service, interestType, callback, refCon, notification);
}

kern_return_t IOServiceAddMatchingNotification(IONotificationPortRef notifyPort, const io_name_t notificationType, CFDictionaryRef matching, IOServiceMatchingCallback callback, void *refCon, io_iterator_t *notification)
{
  return MEMORY[0x24BDD8960](notifyPort, notificationType, matching, callback, refCon, notification);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x24BDD8970](*(_QWORD *)&connect);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x24BDD8988](*(_QWORD *)&mainPort, matching);
}

kern_return_t IOServiceGetMatchingServices(mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return MEMORY[0x24BDD8990](*(_QWORD *)&mainPort, matching, existing);
}

uint64_t IOServiceGetState()
{
  return MEMORY[0x24BDD8998]();
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDD89A8](name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x24BDD89B8](*(_QWORD *)&service, *(_QWORD *)&owningTask, *(_QWORD *)&type, connect);
}

uint64_t MFAAAddCertDataEntryToCache()
{
  return MEMORY[0x24BE61490]();
}

uint64_t MFAACanChargeHighVoltage()
{
  return MEMORY[0x24BE61498]();
}

uint64_t MFAACanChargeInductive()
{
  return MEMORY[0x24BE614A0]();
}

uint64_t MFAACanReceiveInductivePower()
{
  return MEMORY[0x24BE614A8]();
}

uint64_t MFAACanUseAccPwrLoV()
{
  return MEMORY[0x24BE614B0]();
}

uint64_t MFAACanUseAccPwrUHPM()
{
  return MEMORY[0x24BE614B8]();
}

uint64_t MFAACertificateAuthV2Class()
{
  return MEMORY[0x24BE614C0]();
}

uint64_t MFAACertificateAuthVersionNumber()
{
  return MEMORY[0x24BE614C8]();
}

uint64_t MFAACreateCapsFromAuthCert()
{
  return MEMORY[0x24BE614D0]();
}

uint64_t MFAACreateCertDataFromSerialNumber()
{
  return MEMORY[0x24BE614D8]();
}

uint64_t MFAACreateCertificateCache()
{
  return MEMORY[0x24BE614E0]();
}

uint64_t MFAACreateCertificateSerialNumber()
{
  return MEMORY[0x24BE614E8]();
}

uint64_t MFAACreateDEVNCertCapsForCable()
{
  return MEMORY[0x24BE614F0]();
}

uint64_t MFAACreateRandomNonce()
{
  return MEMORY[0x24BE614F8]();
}

uint64_t MFAACreateSerialNumberDataFromString()
{
  return MEMORY[0x24BE61500]();
}

uint64_t MFAACreateSerialNumberStringFromData()
{
  return MEMORY[0x24BE61508]();
}

uint64_t MFAADeallocAuthCertCaps()
{
  return MEMORY[0x24BE61510]();
}

uint64_t MFAADeallocCertificateCache()
{
  return MEMORY[0x24BE61518]();
}

uint64_t MFAADeviceIdentityCopyCertificate()
{
  return MEMORY[0x24BE61520]();
}

uint64_t MFAAIsAppleBatteryModule()
{
  return MEMORY[0x24BE61528]();
}

uint64_t MFAAIsAppleTouchControllerModule()
{
  return MEMORY[0x24BE61530]();
}

uint64_t MFAAIsDesenseBuild()
{
  return MEMORY[0x24BE61538]();
}

uint64_t MFAAIsDevelopmentHW()
{
  return MEMORY[0x24BE61540]();
}

uint64_t MFAAIsInternalBuild()
{
  return MEMORY[0x24BE61548]();
}

uint64_t MFAARemoveCertDataEntryFromCache()
{
  return MEMORY[0x24BE61550]();
}

uint64_t MFAAVerifyCertificateSerialNumber()
{
  return MEMORY[0x24BE61560]();
}

uint64_t MFAAVerifyCertificateSerialNumberBySerialNumber()
{
  return MEMORY[0x24BE61568]();
}

uint64_t MFAAVerifyNonceSignature()
{
  return MEMORY[0x24BE61570]();
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

uint64_t MGGetStringAnswer()
{
  return MEMORY[0x24BED84B0]();
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return MEMORY[0x24BE67140]();
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

uint64_t SecCertificateCopyComponentAttributes()
{
  return MEMORY[0x24BDE8838]();
}

SecCertificateRef SecCertificateCreateWithData(CFAllocatorRef allocator, CFDataRef data)
{
  return (SecCertificateRef)MEMORY[0x24BDE8918](allocator, data);
}

OSStatus SecTrustEvaluate(SecTrustRef trust, SecTrustResultType *result)
{
  return MEMORY[0x24BDE8DE0](trust, result);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

uint64_t _CFCopySystemVersionDictionary()
{
  return MEMORY[0x24BDBCFB0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x24BDAC848]();
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

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACC10](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

uint64_t acc_strings_bundle()
{
  return MEMORY[0x24BE1A0E0]();
}

uint32_t arc4random(void)
{
  return MEMORY[0x24BDAD158]();
}

void arc4random_buf(void *__buf, size_t __nbytes)
{
  MEMORY[0x24BDAD160](__buf, __nbytes);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCA8](queue);
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

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEB8](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x24BDADF18](object);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x24BDADF28](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x24BDADF30](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADF38](dsema, timeout);
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

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x24BDAE070](__path, *(_QWORD *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x24BDAE088](__handle, __symbol);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return (char *)MEMORY[0x24BDAEB58](*(_QWORD *)&error_value);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED70](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x24BDAEE78](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x24BDAEEA8](__b, *(_QWORD *)&__c, __len);
}

errno_t memset_s(void *__s, rsize_t __smax, int __c, rsize_t __n)
{
  return MEMORY[0x24BDAEEC8](__s, __smax, *(_QWORD *)&__c, __n);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x24BDAF138](*(_QWORD *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x24BDAF148](*(_QWORD *)&token, state64);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x24BDAF168](name, out_token);
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

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
  MEMORY[0x24BEDD020](dest, src, size, atomic, hasStrong);
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

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x24BEDD080](object, key);
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

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
  MEMORY[0x24BEDD3C0](object, key, value, policy);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3D0](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
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

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x24BDAF400](log);
}

int printf(const char *a1, ...)
{
  return MEMORY[0x24BDAF6A8](a1);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8D0](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8E0](a1);
}

int putchar(int a1)
{
  return MEMORY[0x24BDAF9F0](*(_QWORD *)&a1);
}

int puts(const char *a1)
{
  return MEMORY[0x24BDAF9F8](a1);
}

int sqlite3_bind_blob(sqlite3_stmt *a1, int a2, const void *a3, int n, void (__cdecl *a5)(void *))
{
  return MEMORY[0x24BEDDF48](a1, *(_QWORD *)&a2, a3, *(_QWORD *)&n, a5);
}

int sqlite3_bind_double(sqlite3_stmt *a1, int a2, double a3)
{
  return MEMORY[0x24BEDDF58](a1, *(_QWORD *)&a2, a3);
}

int sqlite3_bind_int(sqlite3_stmt *a1, int a2, int a3)
{
  return MEMORY[0x24BEDDF60](a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

int sqlite3_bind_int64(sqlite3_stmt *a1, int a2, sqlite3_int64 a3)
{
  return MEMORY[0x24BEDDF68](a1, *(_QWORD *)&a2, a3);
}

int sqlite3_bind_null(sqlite3_stmt *a1, int a2)
{
  return MEMORY[0x24BEDDF70](a1, *(_QWORD *)&a2);
}

int sqlite3_bind_text(sqlite3_stmt *a1, int a2, const char *a3, int a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x24BEDDF98](a1, *(_QWORD *)&a2, a3, *(_QWORD *)&a4, a5);
}

int sqlite3_busy_timeout(sqlite3 *a1, int ms)
{
  return MEMORY[0x24BEDDFF0](a1, *(_QWORD *)&ms);
}

int sqlite3_changes(sqlite3 *a1)
{
  return MEMORY[0x24BEDDFF8](a1);
}

int sqlite3_clear_bindings(sqlite3_stmt *a1)
{
  return MEMORY[0x24BEDE008](a1);
}

int sqlite3_close(sqlite3 *a1)
{
  return MEMORY[0x24BEDE010](a1);
}

int sqlite3_close_v2(sqlite3 *a1)
{
  return MEMORY[0x24BEDE018](a1);
}

const void *__cdecl sqlite3_column_blob(sqlite3_stmt *a1, int iCol)
{
  return (const void *)MEMORY[0x24BEDE020](a1, *(_QWORD *)&iCol);
}

int sqlite3_column_bytes(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x24BEDE028](a1, *(_QWORD *)&iCol);
}

int sqlite3_column_count(sqlite3_stmt *pStmt)
{
  return MEMORY[0x24BEDE038](pStmt);
}

double sqlite3_column_double(sqlite3_stmt *a1, int iCol)
{
  double result;

  MEMORY[0x24BEDE048](a1, *(_QWORD *)&iCol);
  return result;
}

int sqlite3_column_int(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x24BEDE050](a1, *(_QWORD *)&iCol);
}

sqlite3_int64 sqlite3_column_int64(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x24BEDE058](a1, *(_QWORD *)&iCol);
}

const char *__cdecl sqlite3_column_name(sqlite3_stmt *a1, int N)
{
  return (const char *)MEMORY[0x24BEDE060](a1, *(_QWORD *)&N);
}

const unsigned __int8 *__cdecl sqlite3_column_text(sqlite3_stmt *a1, int iCol)
{
  return (const unsigned __int8 *)MEMORY[0x24BEDE068](a1, *(_QWORD *)&iCol);
}

int sqlite3_column_type(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x24BEDE078](a1, *(_QWORD *)&iCol);
}

int sqlite3_exec(sqlite3 *a1, const char *sql, int (__cdecl *callback)(void *, int, char **, char **), void *a4, char **errmsg)
{
  return MEMORY[0x24BEDE118](a1, sql, callback, a4, errmsg);
}

int sqlite3_extended_result_codes(sqlite3 *a1, int onoff)
{
  return MEMORY[0x24BEDE130](a1, *(_QWORD *)&onoff);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return MEMORY[0x24BEDE140](pStmt);
}

sqlite3_int64 sqlite3_last_insert_rowid(sqlite3 *a1)
{
  return MEMORY[0x24BEDE180](a1);
}

int sqlite3_open_v2(const char *filename, sqlite3 **ppDb, int flags, const char *zVfs)
{
  return MEMORY[0x24BEDE1C0](filename, ppDb, *(_QWORD *)&flags, zVfs);
}

int sqlite3_prepare_v2(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return MEMORY[0x24BEDE1D0](db, zSql, *(_QWORD *)&nByte, ppStmt, pzTail);
}

int sqlite3_reset(sqlite3_stmt *pStmt)
{
  return MEMORY[0x24BEDE1E0](pStmt);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return MEMORY[0x24BEDE2A8](a1);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return MEMORY[0x24BDAFF80](__s1, __n);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x24BDB02E8](*(_QWORD *)&a1);
}

