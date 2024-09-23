@implementation ComponentAirPodsBase

- (ComponentAirPodsBase)init
{
  ComponentAirPodsBase *v2;
  dispatch_semaphore_t v3;
  OS_dispatch_semaphore *btManagerAvailableSemaphore;
  _QWORD *v5;
  const char *label;
  _QWORD v8[4];
  ComponentAirPodsBase *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)ComponentAirPodsBase;
  v2 = -[ComponentAirPodsBase init](&v10, "init");
  if (v2)
  {
    v3 = dispatch_semaphore_create(0);
    btManagerAvailableSemaphore = v2->_btManagerAvailableSemaphore;
    v2->_btManagerAvailableSemaphore = (OS_dispatch_semaphore *)v3;

    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100008E9C;
    v8[3] = &unk_100010488;
    v9 = v2;
    v5 = objc_retainBlock(v8);
    label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
    if (label == dispatch_queue_get_label(0))
    {
      ((void (*)(_QWORD *))v5[2])(v5);
    }
    else
    {
      dispatch_sync((dispatch_queue_t)&_dispatch_main_q, v5);

    }
  }
  return v2;
}

- (id)getPairedAppleAudioDevices
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  __int128 v13;
  id v14;
  uint64_t v15;
  void *i;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  void *v31;
  _BYTE v32[128];

  v3 = objc_alloc_init((Class)NSMutableArray);
  v4 = objc_alloc_init((Class)NSMutableArray);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentAirPodsBase btManager](self, "btManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "pairedDevices"));
  objc_msgSend(v4, "addObjectsFromArray:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentAirPodsBase btManager](self, "btManager"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "connectedDevices"));
  objc_msgSend(v4, "addObjectsFromArray:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentAirPodsBase btManager](self, "btManager"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "connectingDevices"));
  objc_msgSend(v4, "addObjectsFromArray:", v10);

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v11 = v4;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
  if (v12)
  {
    v14 = v12;
    v15 = *(_QWORD *)v27;
    *(_QWORD *)&v13 = 138412290;
    v25 = v13;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(_QWORD *)v27 != v15)
          objc_enumerationMutation(v11);
        v17 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i);
        if (((objc_msgSend(v17, "isAppleAudioDevice", v25, (_QWORD)v26) & 1) != 0
           || -[ComponentAirPodsBase _isBeatsDevice:](self, "_isBeatsDevice:", v17))
          && (objc_msgSend(v3, "containsObject:", v17) & 1) == 0)
        {
          v19 = DiagnosticLogHandleForCategory(6, v18);
          v20 = objc_claimAutoreleasedReturnValue(v19);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v25;
            v31 = v17;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Supported Apple Audio device found: %@", buf, 0xCu);
          }

          objc_msgSend(v3, "addObject:", v17);
        }
      }
      v14 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
    }
    while (v14);
  }

  if (!objc_msgSend(v3, "count"))
  {
    v22 = DiagnosticLogHandleForCategory(6, v21);
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "No supported Apple Audio Devices found", buf, 2u);
    }

  }
  return v3;
}

- (id)getCBDevices
{
  void *v2;
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  id v17;
  _BYTE v18[128];

  v17 = 0;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CBDiscovery devicesWithDiscoveryFlags:error:](CBDiscovery, "devicesWithDiscoveryFlags:error:", 0x80000200000, &v17));
  v3 = v17;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v2;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "serialNumber", (_QWORD)v13));
        if (v11)
          objc_msgSend(v4, "setObject:forKey:", v10, v11);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)audioOutputForDevice:(id)a3
{
  id v3;
  id v4;
  unsigned int v5;
  const __CFString *v6;
  const __CFString *v7;
  unsigned int v8;
  const __CFString *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  void *v14;
  void *v15;
  unsigned int v16;
  const __CFString *v17;

  v3 = a3;
  v4 = objc_alloc_init((Class)NSMutableDictionary);
  if (objc_msgSend(v3, "getAdaptiveVolumeSupport"))
  {
    v5 = objc_msgSend(v3, "getAdaptiveVolumeMode");
    if (v5 == 2)
      v6 = CFSTR("Disabled");
    else
      v6 = CFSTR("Unknown");
    if (v5 == 1)
      v7 = CFSTR("Enabled");
    else
      v7 = v6;
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("PersonalizedVolume"));
  }
  if (objc_msgSend(v3, "getConversationDetectSupport"))
  {
    v8 = objc_msgSend(v3, "getConversationDetectMode");
    if (v8 == 2)
      v9 = CFSTR("Disabled");
    else
      v9 = CFSTR("Unknown");
    if (v8 == 1)
      v10 = CFSTR("Enabled");
    else
      v10 = v9;
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, CFSTR("ConversationAwareness"));
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[HUAccessoryHearingSettings sharedInstance](HUAccessoryHearingSettings, "sharedInstance"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "address"));
  v13 = objc_msgSend(v11, "activeHearingProtectionAvailableForAddress:", v12);

  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[HUAccessoryHearingSettings sharedInstance](HUAccessoryHearingSettings, "sharedInstance"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "address"));
    v16 = objc_msgSend(v14, "activeHearingProtectionEnabledForAddress:", v15);

    if (v16)
      v17 = CFSTR("Enabled");
    else
      v17 = CFSTR("Disabled");
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v17, CFSTR("LoudSoundReduction"));
  }

  return v4;
}

- (id)inEarStatusForDevice:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v9;

  v4 = a3;
  v5 = objc_alloc_init((Class)NSMutableDictionary);
  v9 = 0;
  objc_msgSend(v4, "inEarStatusPrimary:secondary:", (char *)&v9 + 4, &v9);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentAirPodsBase stringForInEarStatus:](self, "stringForInEarStatus:", HIDWORD(v9)));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("primaryBud"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentAirPodsBase stringForInEarStatus:](self, "stringForInEarStatus:", v9));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("secondaryBud"));

  return v5;
}

- (id)stringForInEarStatus:(int)a3
{
  if (a3 > 4)
    return CFSTR("Unknown");
  else
    return *(&off_100010518 + a3);
}

- (id)budSide:(id)a3
{
  const __CFString *v3;
  const __CFString *v4;
  const __CFString *v5;
  const __CFString *v6;
  id v7;
  int v9;

  v9 = 3;
  objc_msgSend(a3, "primaryBudSide:", &v9);
  v3 = CFSTR("BudSideUnknown");
  v4 = CFSTR("roleLeft");
  if (v9 == 2)
    v3 = CFSTR("roleRight");
  else
    v4 = CFSTR("BudSideUnknown");
  if (v9 == 1)
    v5 = CFSTR("roleRight");
  else
    v5 = v4;
  if (v9 == 1)
    v6 = CFSTR("roleLeft");
  else
    v6 = v3;
  v7 = objc_alloc_init((Class)NSMutableDictionary);
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, CFSTR("primaryBudRole"));
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v5, CFSTR("secondaryBudRole"));
  return v7;
}

- (id)stringForListeningMode:(unsigned int)a3
{
  if (a3 - 1 > 3)
    return CFSTR("Unknown");
  else
    return *(&off_100010540 + (int)(a3 - 1));
}

- (id)generationStringForProductId:(unsigned int)a3
{
  if (a3 - 8194 > 0x11)
    return CFSTR("Unknown");
  else
    return *(&off_100010560 + (int)(a3 - 8194));
}

- (id)getBatteryInfoForAddress:(id)a3
{
  id v3;
  id v4;
  id v5;
  __int128 v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  id v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  uint64_t v17;
  NSObject *v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  void *i;
  uint64_t v24;
  void *v25;
  id v26;
  __int128 v28;
  uint64_t v29;
  id v30;
  id v31;
  id obj;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t v41[128];
  uint8_t buf[4];
  id v43;
  __int16 v44;
  id v45;
  _BYTE v46[128];

  v3 = a3;
  if (qword_1000153B8 != -1)
    dispatch_once(&qword_1000153B8, &stru_1000104A8);
  v4 = objc_alloc_init((Class)NSMutableDictionary);
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1000153B0, "connectedDevices"));
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v38;
    *(_QWORD *)&v6 = 134218242;
    v28 = v6;
    v29 = *(_QWORD *)v38;
    v30 = v3;
    do
    {
      v9 = 0;
      v31 = v7;
      do
      {
        if (*(_QWORD *)v38 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "identifier", v28));
        v12 = objc_msgSend(v11, "containsString:", v3);

        if (v12)
        {
          v13 = objc_alloc_init((Class)NSMutableArray);
          switch((unint64_t)objc_msgSend(v10, "parts"))
          {
            case 0uLL:
              v15 = v13;
              v16 = CFSTR("batteryLevel");
              goto LABEL_18;
            case 1uLL:
              v15 = v13;
              v16 = CFSTR("leftBudBatteryLevel");
              goto LABEL_18;
            case 2uLL:
              goto LABEL_17;
            case 3uLL:
              objc_msgSend(v13, "addObject:", CFSTR("leftBudBatteryLevel"));
LABEL_17:
              v15 = v13;
              v16 = CFSTR("rightBudBatteryLevel");
              goto LABEL_18;
            case 4uLL:
              v15 = v13;
              v16 = CFSTR("caseBatteryLevel");
LABEL_18:
              objc_msgSend(v15, "addObject:", v16);
              break;
            default:
              v17 = DiagnosticLogHandleForCategory(6, v14);
              v18 = objc_claimAutoreleasedReturnValue(v17);
              if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
              {
                v26 = objc_msgSend(v10, "parts");
                *(_DWORD *)buf = v28;
                v43 = v26;
                v44 = 2112;
                v45 = v3;
                _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Unsupported battery component part %ld found for device with bluetooth address %@", buf, 0x16u);
              }

              break;
          }
          v35 = 0u;
          v36 = 0u;
          v33 = 0u;
          v34 = 0u;
          v19 = v13;
          v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
          if (v20)
          {
            v21 = v20;
            v22 = *(_QWORD *)v34;
            do
            {
              for (i = 0; i != v21; i = (char *)i + 1)
              {
                if (*(_QWORD *)v34 != v22)
                  objc_enumerationMutation(v19);
                v24 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)i);
                v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v10, "percentCharge")));
                objc_msgSend(v4, "setObject:forKeyedSubscript:", v25, v24);

              }
              v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
            }
            while (v21);
          }

          v8 = v29;
          v3 = v30;
          v7 = v31;
        }
        v9 = (char *)v9 + 1;
      }
      while (v9 != v7);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)getAutoEQStateForDevice:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "gyroInformation"));
  v5 = objc_alloc_init((Class)NSMutableDictionary);
  if (v4 && objc_msgSend(v4, "count"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "gyroInformation"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("GYRO_INFO_LEFT_BUD_IS_JAMMED")));

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "gyroInformation"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("GYRO_INFO_RIGHT_BUD_IS_JAMMED")));

    if (v7)
    {
      v10 = objc_opt_class(NSNumber);
      if ((objc_opt_isKindOfClass(v7, v10) & 1) != 0)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v7, "BOOLValue")));
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, CFSTR("isLeftBudJammed"));

      }
    }
    if (v9)
    {
      v12 = objc_opt_class(NSNumber);
      if ((objc_opt_isKindOfClass(v9, v12) & 1) != 0)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v9, "BOOLValue")));
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, CFSTR("isRightBudJammed"));

      }
    }

  }
  return v5;
}

- (id)aacpInfoFromAccessoryInfo:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  int v17;
  id v18;
  __int16 v19;
  int v20;

  v3 = a3;
  v4 = objc_alloc_init((Class)NSMutableDictionary);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("AACPVersionInfo")));

  if ((unint64_t)objc_msgSend(v5, "count") < 0xB)
  {
    v12 = objc_msgSend(v5, "count");
    v14 = DiagnosticLogHandleForCategory(6, v13);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    v11 = v15;
    if (v12)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      {
        v17 = 134218240;
        v18 = objc_msgSend(v5, "count");
        v19 = 1024;
        v20 = 11;
        _os_log_fault_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_FAULT, "AACPVersionInfo is smaller than the expected size (%ld instead of %d). Format of array has changed and ComponentAccessoryAirPods needs to be updated", (uint8_t *)&v17, 0x12u);
      }
    }
    else if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v17) = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "AACPVersionInfo is empty. Unable to surface additional information for this AirPods device.", (uint8_t *)&v17, 2u);
    }
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", 1));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("modelNumber"));

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", 3));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("systemSerialNumber"));

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", 8));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("leftBudSerialNumber"));

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", 9));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, CFSTR("rightBudSerialNumber"));

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", 6));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, CFSTR("hardwareRevision"));

    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", 10));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, CFSTR("firmwareVersion"));
  }

  return v4;
}

- (id)caseInfoFromAccessoryInfo:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = a3;
  v4 = objc_alloc_init((Class)NSMutableDictionary);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("CaseInfo")));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("CaseInfoVersion")));
    v7 = objc_opt_class(NSString);
    if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0 && objc_msgSend(v6, "length"))
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("caseFirmwareVersion"));

  }
  return v4;
}

- (BOOL)spatialAudioSupportedForDevice:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  if (objc_msgSend(v3, "getAACPCapabilityBit:", 64))
    v4 = objc_msgSend(v3, "getSpatialAudioPlatformSupport") == 1;
  else
    v4 = 0;

  return v4;
}

- (BOOL)spatialAudioEnabled
{
  int AppBooleanValue;
  BOOL v3;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  CFPreferencesAppSynchronize(CFSTR("com.apple.springboard"));
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("spatial-audio-accessory-feature"), CFSTR("com.apple.springboard"), &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
    v3 = AppBooleanValue == 0;
  else
    v3 = 1;
  return !v3;
}

- (BOOL)_isBeatsDevice:(id)a3
{
  id v3;
  uint64_t v4;
  unsigned int v5;
  uint64_t v6;
  NSObject *v7;
  int v9;
  id v10;

  v3 = a3;
  v5 = objc_msgSend(v3, "productId");
  if (v5 == 8209)
  {
    v6 = DiagnosticLogHandleForCategory(1, v4);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138412290;
      v10 = v3;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Device (%@) is a AirPods-like Beats device that does not report as an Apple Audio Device", (uint8_t *)&v9, 0xCu);
    }

  }
  return v5 == 8209;
}

- (id)microphoneCalibrationResultForDevice:(id)a3
{
  id v4;
  id v5;
  dispatch_semaphore_t v6;
  NSObject *v7;
  NSObject *v8;
  dispatch_time_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  id v13;
  __int16 v15[8];
  _QWORD v16[4];
  NSObject *v17;
  _QWORD v18[4];
  id v19;
  NSObject *v20;
  uint64_t *v21;
  id v22;
  id location;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v4 = a3;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = sub_10000A2DC;
  v28 = sub_10000A2EC;
  v29 = objc_alloc_init((Class)NSMutableDictionary);
  v5 = objc_alloc_init((Class)HMServiceClient);
  if (v5)
  {
    v6 = dispatch_semaphore_create(0);
    objc_initWeak(&location, self);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10000A2F4;
    v18[3] = &unk_1000104D0;
    v19 = v4;
    objc_copyWeak(&v22, &location);
    v21 = &v24;
    v7 = v6;
    v20 = v7;
    objc_msgSend(v5, "setDeviceDiagnosticRecordFoundHandler:", v18);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10000A7D0;
    v16[3] = &unk_1000104F8;
    v8 = v7;
    v17 = v8;
    objc_msgSend(v5, "activateWithCompletion:", v16);
    v9 = dispatch_time(0, 2000000000);
    if (dispatch_semaphore_wait(v8, v9))
    {
      v11 = DiagnosticLogHandleForCategory(1, v10);
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v15[0] = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Timed out waiting for device diagnostic record handler to be called with a record for the target AirPods", (uint8_t *)v15, 2u);
      }

    }
    objc_destroyWeak(&v22);

    objc_destroyWeak(&location);
  }
  v13 = objc_msgSend((id)v25[5], "copy");

  _Block_object_dispose(&v24, 8);
  return v13;
}

- (void)addObjectIfNotNil:(id)a3 forKey:(id)a4 toDictionary:(id)a5
{
  if (a3)
    objc_msgSend(a5, "setObject:forKeyedSubscript:", a3, a4);
}

- (void)addEnumValueIfNotZero:(int64_t)a3 forKey:(id)a4 toDictionary:(id)a5
{
  id v7;
  id v8;
  id v9;

  if (a3)
  {
    v7 = a5;
    v8 = a4;
    v9 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, v8);

  }
}

- (BluetoothManager)btManager
{
  return self->_btManager;
}

- (void)setBtManager:(id)a3
{
  objc_storeStrong((id *)&self->_btManager, a3);
}

- (OS_dispatch_semaphore)btManagerAvailableSemaphore
{
  return self->_btManagerAvailableSemaphore;
}

- (void)setBtManagerAvailableSemaphore:(id)a3
{
  objc_storeStrong((id *)&self->_btManagerAvailableSemaphore, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_btManagerAvailableSemaphore, 0);
  objc_storeStrong((id *)&self->_btManager, 0);
}

@end
