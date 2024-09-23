@implementation HMDBulletinCategory

+ (id)_enumerationValueLocalizationKeys
{
  if (_enumerationValueLocalizationKeys_onceToken != -1)
    dispatch_once(&_enumerationValueLocalizationKeys_onceToken, &__block_literal_global_127066);
  return (id)_enumerationValueLocalizationKeys_localizationKeys;
}

+ (id)_secureStateMap
{
  if (_secureStateMap_onceToken != -1)
    dispatch_once(&_secureStateMap_onceToken, &__block_literal_global_36_127064);
  return (id)_secureStateMap_secureStateMap;
}

+ (id)_sensorMap
{
  if (_sensorMap_onceToken != -1)
    dispatch_once(&_sensorMap_onceToken, &__block_literal_global_48_127051);
  return (id)_sensorMap_sensorMap;
}

+ (id)localizedStringForItems:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v18[4];
  id v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_msgSend(v4, "count");
  if (v5 == 2)
  {
    v11 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    HMDLocalizedStringForKey(CFSTR("AND"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectAtIndexedSubscript:", 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("%@%@%@"), v12, v13, v14);
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else if (v5 == 1)
  {
    objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else if (v5)
  {
    objc_msgSend(MEMORY[0x24BDD16A8], "string");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __47__HMDBulletinCategory_localizedStringForItems___block_invoke;
    v18[3] = &unk_24E7868F0;
    v19 = v4;
    v20 = v15;
    v16 = v15;
    objc_msgSend(v19, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v18);
    v10 = (__CFString *)objc_msgSend(v16, "copy");

  }
  else
  {
    v6 = (void *)MEMORY[0x227676638]();
    v7 = a1;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v22 = v9;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_ERROR, "%{public}@Could not determine localized string from empty items", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
    v10 = &stru_24E79DB48;
  }

  return v10;
}

+ (id)localizedActionForCharacteristic:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  objc_msgSend(v4, "type");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_presentationTypeForType:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "type");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "presentationValueForValue:type:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_localizedStateForValue:characteristicType:", v9, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringByCapitalizingFirstWord");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)localizedStateForCharacteristic:(id)a3 doorbellBulletinUtilities:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  int v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  __CFString *v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  NSObject *v48;
  void *v49;
  void *v50;
  void *v51;
  __CFString *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  int v57;
  __CFString *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  __CFString *v64;
  id v65;
  __CFString *v66;
  __CFString *v67;
  void *v68;
  NSObject *v69;
  void *v70;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  id v77;
  void *v78;
  id v79;
  id v80;
  id v81;
  id v82;
  uint8_t buf[4];
  void *v84;
  __int16 v85;
  __CFString *v86;
  __int16 v87;
  const __CFString *v88;
  __int16 v89;
  id v90;
  uint64_t v91;

  v91 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "accessory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "service");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "type");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", *MEMORY[0x24BE1B558]);

  if (!v11)
  {
    if (+[HMDBulletinCategory isSensorDetectedCharacteristic:](HMDBulletinCategory, "isSensorDetectedCharacteristic:", v6))
    {
      v79 = v7;
      objc_msgSend(v8, "room");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "name");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "type");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "isEqualToString:", *MEMORY[0x24BE1B570]);

      if (v18)
      {
        objc_msgSend(v9, "name");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        HMDLocalizedStringForKey(CFSTR("BULLETIN_ACTION_ROOM_SERVICE"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        +[HMDServiceNameComponents componentsWithRawServiceName:rawRoomName:localizedFormat:](HMDServiceNameComponents, "componentsWithRawServiceName:rawRoomName:localizedFormat:", v19, v16, v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v21, "composedName");
        v22 = objc_claimAutoreleasedReturnValue();

        v16 = (void *)v22;
      }
      v23 = (void *)MEMORY[0x24BDD17C8];
      +[HMDBulletinCategory _sensorMap](HMDBulletinCategory, "_sensorMap");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "type");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "valueForKey:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      HMDLocalizedStringForKey(v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v82 = 0;
      v75 = v16;
      +[HMDBulletinCategory trimLeadingAndTailingSpacesInName:](HMDBulletinCategory, "trimLeadingAndTailingSpacesInName:", v16);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v27, CFSTR("%@"), &v82, v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v77 = v82;

      if (v29)
      {
        v30 = v29;
      }
      else
      {
        v47 = (void *)MEMORY[0x227676638]();
        HMFGetOSLogHandle();
        v48 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          +[HMDBulletinCategory _sensorMap](HMDBulletinCategory, "_sensorMap");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "type");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "valueForKey:", v51);
          v52 = (__CFString *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v84 = v49;
          v85 = 2112;
          v86 = v52;
          v87 = 2112;
          v88 = CFSTR("%@");
          v89 = 2112;
          v90 = v77;
          _os_log_impl(&dword_2218F0000, v48, OS_LOG_TYPE_ERROR, "%{public}@Failed to determined localized string for format key %@ and valid format specifiers %@: %@", buf, 0x2Au);

        }
        objc_autoreleasePoolPop(v47);
        +[HMDBulletinCategory _sensorMap](HMDBulletinCategory, "_sensorMap");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "type");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "valueForKey:", v54);
        v30 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      v7 = v79;

      goto LABEL_31;
    }
    objc_msgSend(v6, "type");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v32, "isEqualToString:", *MEMORY[0x24BE1B4A8]) & 1) != 0)
    {
      objc_msgSend(v9, "type");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v33, "isEqualToString:", CFSTR("00000260-0000-1000-8000-0026BB765291"));

      if (v34)
      {
        HMDLocalizedStringForKey(CFSTR("BULLETIN_KEYPAD_DISABLED_MESSAGE"));
        v14 = objc_claimAutoreleasedReturnValue();
        goto LABEL_13;
      }
    }
    else
    {

    }
    objc_msgSend(v6, "type");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_presentationTypeForType:", v35);
    v36 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "value");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "type");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "presentationValueForValue:type:", v37, v38);
    v39 = objc_claimAutoreleasedReturnValue();

    v73 = (void *)v39;
    v76 = (void *)v36;
    objc_msgSend(a1, "_localizedStateForValue:characteristicType:", v39, v36);
    v40 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "name");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "room");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "name");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    HMDLocalizedStringForKey(CFSTR("BULLETIN_ACTION_ROOM_SERVICE"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDServiceNameComponents componentsWithRawServiceName:rawRoomName:localizedFormat:](HMDServiceNameComponents, "componentsWithRawServiceName:rawRoomName:localizedFormat:", v41, v43, v44);
    v78 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "type");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = *MEMORY[0x24BE1B898];
    v80 = v7;
    v74 = v8;
    if (objc_msgSend(v45, "isEqualToString:", *MEMORY[0x24BE1B898]))
    {

LABEL_23:
      v58 = CFSTR("BULLETIN_ACTION_WINDOW_COVERING");
LABEL_26:
      v59 = v78;
      v60 = (void *)MEMORY[0x24BDD17C8];
      HMDLocalizedStringForKey(v58);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v81 = 0;
      objc_msgSend(v78, "composedName");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v61, CFSTR("%@ %@"), &v81, v62, v40);
      v63 = (void *)v40;
      v64 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v65 = v81;

      v66 = v64;
      v7 = v80;
      if (!v64)
      {
        v67 = v58;
        v72 = v63;
        v68 = (void *)MEMORY[0x227676638]();
        HMFGetOSLogHandle();
        v69 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v84 = v70;
          v85 = 2112;
          v86 = v67;
          v87 = 2112;
          v88 = CFSTR("%@ %@");
          v89 = 2112;
          v90 = v65;
          _os_log_impl(&dword_2218F0000, v69, OS_LOG_TYPE_ERROR, "%{public}@Failed to determined localized string for format key %@ and valid format specifiers %@: %@", buf, 0x2Au);

        }
        objc_autoreleasePoolPop(v68);
        v66 = v67;
        v63 = v72;
        v59 = v78;
      }
      v30 = v66;

      v8 = v74;
      goto LABEL_31;
    }
    objc_msgSend(v9, "type");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v55, "isEqualToString:", *MEMORY[0x24BE1B828]) & 1) != 0)
    {
      objc_msgSend(v9, "associatedServiceType");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = objc_msgSend(v56, "isEqualToString:", v46);

      if (v57)
        goto LABEL_23;
    }
    else
    {

    }
    v58 = CFSTR("BULLETIN_ACTION_DEFAULT");
    goto LABEL_26;
  }
  objc_msgSend(v9, "type");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isEqualToString:", *MEMORY[0x24BE1B7B0]);

  if (v13)
  {
    objc_msgSend(v7, "localizedMessageForCharacteristic:", v6);
    v14 = objc_claimAutoreleasedReturnValue();
LABEL_13:
    v30 = (__CFString *)v14;
    goto LABEL_31;
  }
  objc_msgSend(v9, "name");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDBulletinCategory trimLeadingAndTailingSpacesInName:](HMDBulletinCategory, "trimLeadingAndTailingSpacesInName:", v31);
  v30 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_31:
  return v30;
}

+ (id)trimLeadingAndTailingSpacesInName:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD14A8];
  v4 = a3;
  objc_msgSend(v3, "whitespaceCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByTrimmingCharactersInSet:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)trimLeadingAndTailingDotInName:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD14A8];
  v4 = a3;
  objc_msgSend(v3, "characterSetWithCharactersInString:", CFSTR("."));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByTrimmingCharactersInSet:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)composedNameForCharacteristic:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = a3;
  objc_msgSend(v3, "service");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "room");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  HMDLocalizedStringForKey(CFSTR("BULLETIN_ACTION_ROOM_SERVICE"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDServiceNameComponents componentsWithRawServiceName:rawRoomName:localizedFormat:](HMDServiceNameComponents, "componentsWithRawServiceName:rawRoomName:localizedFormat:", v5, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "composedName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (BOOL)isSensorDetectedCharacteristic:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  +[HMDBulletinCategory _sensorMap](HMDBulletinCategory, "_sensorMap");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "type");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v3) = objc_msgSend(v5, "containsObject:", v6);
  return (char)v3;
}

+ (BOOL)isSecureServiceType:(id)a3
{
  uint64_t v3;
  id v4;
  char v5;

  v3 = isSecureServiceType__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&isSecureServiceType__onceToken, &__block_literal_global_89_127018);
  v5 = objc_msgSend((id)isSecureServiceType__secureServices, "containsObject:", v4);

  return v5;
}

+ (id)bulletinReasonForChangedCharacteristic:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  id *v11;
  void *v12;
  void *v13;
  int v14;
  id v15;

  v3 = a3;
  objc_msgSend(v3, "service");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bulletinBoardNotification");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "notificationServiceGroup");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "cameraProfiles");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
    goto LABEL_9;
  objc_msgSend(v3, "type");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", *MEMORY[0x24BE1B570]);

  if (!v10)
  {
    objc_msgSend(v3, "type");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v12, "isEqualToString:", *MEMORY[0x24BE1B558]) & 1) != 0)
    {
      objc_msgSend(v4, "type");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "isEqualToString:", *MEMORY[0x24BE1B7B0]);

      if (v14)
      {
        v11 = (id *)MEMORY[0x24BDD53A0];
        goto LABEL_7;
      }
    }
    else
    {

    }
LABEL_9:
    v15 = 0;
    goto LABEL_10;
  }
  v11 = (id *)MEMORY[0x24BDD53B0];
LABEL_7:
  v15 = *v11;
LABEL_10:

  return v15;
}

+ (NSDictionary)targetCurrentCharacteristicTypeMap
{
  if (targetCurrentCharacteristicTypeMap_onceToken != -1)
    dispatch_once(&targetCurrentCharacteristicTypeMap_onceToken, &__block_literal_global_91_127016);
  return (NSDictionary *)(id)targetCurrentCharacteristicTypeMap_targetCurrentCharacteristicTypeMap;
}

+ (id)_localizedStateForValue:(id)a3 characteristicType:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  int v19;
  void *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BE1B508]))
  {
    HMDLocalizedStringForKey(CFSTR("BULLETIN_CATEGORY_STATE_UNKNOWN"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = (void *)MEMORY[0x227676638]();
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543874;
      v20 = v10;
      v21 = 2112;
      v22 = v6;
      v23 = 2112;
      v24 = v5;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@type : %@ value = %@", (uint8_t *)&v19, 0x20u);

    }
    objc_autoreleasePoolPop(v8);
    +[HMDBulletinCategory _enumerationValueLocalizationKeys](HMDBulletinCategory, "_enumerationValueLocalizationKeys");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && (v13 = objc_msgSend(v5, "integerValue"), v13 < objc_msgSend(v12, "count")))
    {
      objc_msgSend(v12, "objectAtIndexedSubscript:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = 0;
    }
    HMDLocalizedStringForKey(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
    {
      v17 = v15;
    }
    else
    {
      HMDLocalizedStringForKey(CFSTR("BULLETIN_CATEGORY_STATE_UNKNOWN"));
      v17 = (id)objc_claimAutoreleasedReturnValue();
    }
    v7 = v17;

  }
  return v7;
}

+ (id)_presentationTypeForType:(id)a3
{
  id v3;
  int v4;
  void *v5;
  id v6;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BE1B5B0]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BE1B580]) & 1) != 0
    || (v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BE1B508]), v5 = v3, v4))
  {
    v5 = (void *)*MEMORY[0x24BE1B4E0];
  }
  v6 = v5;

  return v6;
}

+ (id)presentationValueForValue:(id)a3 type:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v18;

  v6 = a3;
  v7 = a4;
  objc_msgSend(a1, "_presentationTypeForType:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BE1B5B0]) & 1) != 0
    || objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BE1B580]))
  {
    objc_msgSend(a1, "_secureStateMap");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    v12 = 1;
    goto LABEL_4;
  }
  if ((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BE1B508]) & 1) != 0
    || objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BE1B630]))
  {
    v14 = objc_msgSend(v6, "integerValue");
    v15 = &unk_24E96B690;
    if (!v14)
      v15 = &unk_24E96B678;
    v16 = v15;
    goto LABEL_16;
  }
  if ((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BE1B518]) & 1) != 0
    || (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BE1B558]) & 1) != 0
    || (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BE1B570]) & 1) != 0
    || objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BE1B500]))
  {
    v16 = v6;
LABEL_16:
    v13 = v16;
    goto LABEL_17;
  }
  +[HMDBulletinCategory _secureStateMap](HMDBulletinCategory, "_secureStateMap");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v13 = 0;
    goto LABEL_5;
  }
  objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqualToNumber:", v6) ^ 1;
  v10 = v9;
LABEL_4:
  objc_msgSend(v10, "objectAtIndexedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_5:
LABEL_17:

  return v13;
}

void __57__HMDBulletinCategory_targetCurrentCharacteristicTypeMap__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[4];
  _QWORD v8[5];

  v8[4] = *MEMORY[0x24BDAC8D0];
  v0 = *MEMORY[0x24BE1B4E0];
  v1 = *MEMORY[0x24BE1B628];
  v7[0] = *MEMORY[0x24BE1B608];
  v7[1] = v1;
  v2 = *MEMORY[0x24BE1B500];
  v8[0] = v0;
  v8[1] = v2;
  v3 = *MEMORY[0x24BE1B640];
  v7[2] = *MEMORY[0x24BE1B630];
  v7[3] = v3;
  v4 = *MEMORY[0x24BE1B518];
  v8[2] = *MEMORY[0x24BE1B508];
  v8[3] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, v7, 4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)targetCurrentCharacteristicTypeMap_targetCurrentCharacteristicTypeMap;
  targetCurrentCharacteristicTypeMap_targetCurrentCharacteristicTypeMap = v5;

}

void __43__HMDBulletinCategory_isSecureServiceType___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", *MEMORY[0x24BE1B7A8], *MEMORY[0x24BE1B7C8], *MEMORY[0x24BE1B7F0], *MEMORY[0x24BE1B808], *MEMORY[0x24BE1B890], 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)isSecureServiceType__secureServices;
  isSecureServiceType__secureServices = v0;

}

void __47__HMDBulletinCategory_localizedStringForItems___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "count") - 1 == a3)
  {
    v5 = *(void **)(a1 + 40);
    HMDLocalizedStringForKey(CFSTR("AND"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("%@%@"), v6, v10);

  }
  else
  {
    v7 = objc_msgSend(*(id *)(a1 + 32), "count") - 2;
    v8 = *(void **)(a1 + 40);
    if (v7 == a3)
    {
      objc_msgSend(v8, "appendString:", v10);
    }
    else
    {
      HMDLocalizedStringForKey(CFSTR("COMMA"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "appendFormat:", CFSTR("%@%@"), v10, v9);

    }
  }

}

void __33__HMDBulletinCategory__sensorMap__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[6];
  _QWORD v6[7];

  v6[6] = *MEMORY[0x24BDAC8D0];
  v0 = *MEMORY[0x24BE1B4C8];
  v5[0] = *MEMORY[0x24BE1B570];
  v5[1] = v0;
  v6[0] = CFSTR("BULLETIN_ACTION_SENSOR_MOTION");
  v6[1] = CFSTR("BULLETIN_ACTION_SENSOR_CO");
  v1 = *MEMORY[0x24BE1B5E0];
  v5[2] = *MEMORY[0x24BE1B4C0];
  v5[3] = v1;
  v6[2] = CFSTR("BULLETIN_ACTION_SENSOR_CO2");
  v6[3] = CFSTR("BULLETIN_ACTION_SENSOR_SMOKE");
  v2 = *MEMORY[0x24BE1B588];
  v5[4] = *MEMORY[0x24BE1B560];
  v5[5] = v2;
  v6[4] = CFSTR("BULLETIN_ACTION_SENSOR_LEAK");
  v6[5] = CFSTR("BULLETIN_ACTION_SENSOR_OCCUPANCY");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, v5, 6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)_sensorMap_sensorMap;
  _sensorMap_sensorMap = v3;

}

void __38__HMDBulletinCategory__secureStateMap__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[4];
  _QWORD v5[5];

  v5[4] = *MEMORY[0x24BDAC8D0];
  v0 = *MEMORY[0x24BE1B508];
  v4[0] = *MEMORY[0x24BE1B4E0];
  v4[1] = v0;
  v5[0] = &unk_24E970F88;
  v5[1] = &unk_24E970FA0;
  v1 = *MEMORY[0x24BE1B4D0];
  v4[2] = *MEMORY[0x24BE1B518];
  v4[3] = v1;
  v5[2] = &unk_24E970FB8;
  v5[3] = &unk_24E970FD0;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v5, v4, 4);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_secureStateMap_secureStateMap;
  _secureStateMap_secureStateMap = v2;

}

void __56__HMDBulletinCategory__enumerationValueLocalizationKeys__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[6];
  _QWORD v6[7];

  v6[6] = *MEMORY[0x24BDAC8D0];
  v0 = *MEMORY[0x24BE1B500];
  v5[0] = *MEMORY[0x24BE1B4E0];
  v5[1] = v0;
  v6[0] = &unk_24E970EF8;
  v6[1] = &unk_24E970F10;
  v1 = *MEMORY[0x24BE1B558];
  v5[2] = *MEMORY[0x24BE1B518];
  v5[3] = v1;
  v6[2] = &unk_24E970F28;
  v6[3] = &unk_24E970F40;
  v2 = *MEMORY[0x24BE1B4D0];
  v5[4] = *MEMORY[0x24BE1B570];
  v5[5] = v2;
  v6[4] = &unk_24E970F58;
  v6[5] = &unk_24E970F70;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, v5, 6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)_enumerationValueLocalizationKeys_localizationKeys;
  _enumerationValueLocalizationKeys_localizationKeys = v3;

}

@end
