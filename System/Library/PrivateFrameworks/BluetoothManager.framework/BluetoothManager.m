void _btSessionEventCallback(uint64_t a1, uint64_t a2, int a3, void *a4)
{
  void *v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  const char *v12;
  uint8_t *v13;
  NSObject *v14;
  NSObject *v15;
  uint8_t v16[16];
  __int16 v17;
  uint8_t v18[2];
  uint8_t buf[16];

  v8 = (void *)MEMORY[0x20BD0929C]();
  if (!(a3 | a2))
  {
    v9 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20847A000, v9, OS_LOG_TYPE_DEFAULT, "Got a session, lets continue with setup", buf, 2u);
    }
    v10 = objc_msgSend(a4, "_setup:", a1);
    if ((v10 & 1) != 0)
    {
      v11 = sharedBluetoothManagerLogComponent();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v17 = 0;
        v12 = "Sending attached posting BluetoothAvailabilityChangedNotification with availability set to YES";
        v13 = (uint8_t *)&v17;
LABEL_21:
        _os_log_impl(&dword_20847A000, v11, OS_LOG_TYPE_DEFAULT, v12, v13, 2u);
      }
    }
    else
    {
      objc_msgSend(a4, "_cleanup:", 1);
      v11 = sharedBluetoothManagerLogComponent();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v18 = 0;
        v12 = "Session attached posting BluetoothAvailabilityChangedNotification with availability set to NO";
        v13 = v18;
        goto LABEL_21;
      }
    }
    objc_msgSend(a4, "postNotificationName:object:", CFSTR("BluetoothAvailabilityChangedNotification"), objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v10));
    objc_msgSend(a4, "_updateBluetoothState");
    goto LABEL_23;
  }
  if (a2 >= 4)
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), a2);
  v14 = sharedBluetoothManagerLogComponent();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    _btSessionEventCallback_cold_1();
  if (objc_msgSend(a4, "available"))
  {
    if (!(_DWORD)a2)
      objc_msgSend(a4, "_updateBluetoothState");
    v15 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_20847A000, v15, OS_LOG_TYPE_DEFAULT, "Sending BluetoothAvailabilityChangedNotification with availability set to NO", v16, 2u);
    }
    objc_msgSend(a4, "postNotificationName:object:", CFSTR("BluetoothAvailabilityChangedNotification"), objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0));
  }
  objc_msgSend(a4, "_cleanup:", 0);
  objc_msgSend(a4, "_attach");
LABEL_23:
  objc_autoreleasePoolPop(v8);
}

uint64_t sharedBluetoothManagerLogComponent()
{
  if (sharedBluetoothManagerLogComponent_onceToken != -1)
    dispatch_once(&sharedBluetoothManagerLogComponent_onceToken, &__block_literal_global);
  return sharedBluetoothManagerLogComponent_sharedBTMLog;
}

Class ___bluetoothIsBeingManaged_block_invoke()
{
  Class result;

  result = NSClassFromString(CFSTR("MCProfileConnection"));
  if (result)
  {
    result = (Class)objc_msgSend((id)-[objc_class sharedConnection](result, "sharedConnection"), "isBluetoothModificationAllowed");
    _bluetoothIsBeingManaged_isManaged = result ^ 1;
  }
  return result;
}

os_log_t __sharedBluetoothManagerLogComponent_block_invoke()
{
  os_log_t result;

  result = os_log_create("com.apple.bluetooth", "BluetoothManager");
  sharedBluetoothManagerLogComponent_sharedBTMLog = (uint64_t)result;
  return result;
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_5(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

uint64_t AddressForBTDevice()
{
  NSObject *v0;
  _OWORD v2[15];
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v3 = 0;
  memset(v2, 0, sizeof(v2));
  if (!BTDeviceGetAddressString())
    return objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v2);
  v0 = sharedBluetoothManagerLogComponent();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    AddressForBTDevice_cold_1();
  return 0;
}

void _btServiceEventCallback(uint64_t a1, int a2, int a3, int a4, uint64_t a5)
{
  void *v10;
  BluetoothManager *v11;
  id v12;
  void *v13;
  NSObject *v14;
  const __CFString *v15;
  NSObject *v16;
  NSObject *v17;
  BluetoothManager *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  const __CFString *v23;
  const __CFString *v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  uint64_t v29;
  NSObject *v30;
  NSObject *v31;
  NSObject *v32;
  NSObject *v33;
  NSObject *v34;
  uint8_t buf[32];
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint64_t v49;
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v10 = (void *)MEMORY[0x20BD0929C]();
  v11 = +[BluetoothManager sharedInstance](BluetoothManager, "sharedInstance");
  v12 = -[BluetoothManager addDeviceIfNeeded:](v11, "addDeviceIfNeeded:", a1);
  v13 = v12;
  if (a2 != -1 && (a2 & 0x40) != 0)
    goto LABEL_66;
  if (a3 == 2)
  {
    switch(a2)
    {
      case -1:
        if (a4 != 701 || (_DWORD)a5)
          goto LABEL_66;
        objc_msgSend(v12, "_clearName");
        v24 = CFSTR("BluetoothDeviceUpdatedNotification");
        goto LABEL_65;
      case 16:
        if (a4 == 201 && !(_DWORD)a5)
        {
          v26 = sharedBluetoothManagerLogComponent();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
            _btServiceEventCallback_cold_10();
        }
        goto LABEL_66;
      case 2:
        if (a4 != 303 || (_DWORD)a5)
          goto LABEL_66;
        v27 = sharedBluetoothManagerLogComponent();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
          _btServiceEventCallback_cold_9();
        break;
      case 1:
        v16 = sharedBluetoothManagerLogComponent();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          _btServiceEventCallback_cold_8();
        if (a4 == 101 && !(_DWORD)a5)
        {
          v17 = sharedBluetoothManagerLogComponent();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
            _btServiceEventCallback_cold_1();
          v18 = v11;
          v19 = 1;
LABEL_54:
          -[BluetoothManager setAudioConnected:](v18, "setAudioConnected:", v19);
          goto LABEL_66;
        }
        if (a4 == 102 && !(_DWORD)a5)
        {
          v28 = sharedBluetoothManagerLogComponent();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
            _btServiceEventCallback_cold_2();
          v18 = v11;
          v19 = 0;
          goto LABEL_54;
        }
        if (a4 == 103 && !(_DWORD)a5)
        {
          v30 = sharedBluetoothManagerLogComponent();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
            _btServiceEventCallback_cold_3();
          v24 = CFSTR("BluetoothHandsfreeInitiatedVoiceCommand");
          goto LABEL_65;
        }
        if (a4 == 104 && !(_DWORD)a5)
        {
          v31 = sharedBluetoothManagerLogComponent();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
            _btServiceEventCallback_cold_4();
          v24 = CFSTR("BluetoothHandsfreeEndedVoiceCommand");
          goto LABEL_65;
        }
        if (a4 != 303 || (_DWORD)a5)
        {
          if (a4 != 702 || (_DWORD)a5)
          {
            if (a4 != 703 || (_DWORD)a5)
              goto LABEL_66;
            v34 = sharedBluetoothManagerLogComponent();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
              _btServiceEventCallback_cold_7();
            v24 = CFSTR("BluetoothHighPowerDisabled");
          }
          else
          {
            v33 = sharedBluetoothManagerLogComponent();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
              _btServiceEventCallback_cold_6();
            v24 = CFSTR("BluetoothHighPowerEnabled");
          }
          goto LABEL_65;
        }
        v32 = sharedBluetoothManagerLogComponent();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
          _btServiceEventCallback_cold_5();
        break;
      default:
        goto LABEL_66;
    }
    v24 = CFSTR("BluetoothDeviceSupportsContactSyncNotification");
    goto LABEL_65;
  }
  if (a3 == 1)
  {
    v20 = objc_msgSend(v12, "connectedServicesCount");
    if (a4 == 12)
    {
      v21 = v20;
      v22 = sharedBluetoothManagerLogComponent();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        if ((_DWORD)a5)
          v23 = (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("failed with error %d"), a5);
        else
          v23 = CFSTR("succeeded");
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)&buf[4] = a2;
        *(_WORD *)&buf[8] = 2112;
        *(_QWORD *)&buf[10] = v13;
        *(_WORD *)&buf[18] = 2112;
        *(_QWORD *)&buf[20] = v23;
        _os_log_impl(&dword_20847A000, v22, OS_LOG_TYPE_INFO, "disconnection to service 0x%08x on device %@ %@", buf, 0x1Cu);
      }
      if (!v21)
      {
        if ((_DWORD)a5)
        {
          -[BluetoothManager postNotificationName:object:error:](v11, "postNotificationName:object:error:", CFSTR("BluetoothDeviceDisconnectFailedNotification"), v13, objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", a5));
          goto LABEL_66;
        }
        v24 = CFSTR("BluetoothDeviceDisconnectSuccessNotification");
        goto LABEL_65;
      }
    }
  }
  else
  {
    if (a3)
      goto LABEL_66;
    if ((objc_msgSend(v12, "_isNameCached") & 1) == 0)
    {
      v49 = 0;
      v47 = 0u;
      v48 = 0u;
      v45 = 0u;
      v46 = 0u;
      v43 = 0u;
      v44 = 0u;
      v41 = 0u;
      v42 = 0u;
      v39 = 0u;
      v40 = 0u;
      v37 = 0u;
      v38 = 0u;
      v36 = 0u;
      memset(buf, 0, sizeof(buf));
      if (!BTDeviceGetName())
        -[BluetoothManager postNotificationName:object:](v11, "postNotificationName:object:", CFSTR("BluetoothDeviceUpdatedNotification"), v13);
    }
    if (a4 != 1)
    {
      if (a4 != 11)
        goto LABEL_66;
      v14 = sharedBluetoothManagerLogComponent();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        if ((_DWORD)a5)
          v15 = (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("failed with error %d"), a5);
        else
          v15 = CFSTR("succeeded");
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)&buf[4] = a2;
        *(_WORD *)&buf[8] = 2112;
        *(_QWORD *)&buf[10] = v13;
        *(_WORD *)&buf[18] = 2112;
        *(_QWORD *)&buf[20] = v15;
        _os_log_impl(&dword_20847A000, v14, OS_LOG_TYPE_INFO, "connection to service 0x%08x on device %@ %@", buf, 0x1Cu);
      }
      if (a2 == 512)
        -[BluetoothManager postNotificationName:object:](v11, "postNotificationName:object:", CFSTR("BluetoothDeviceSupportsMAPClientNotification"), v13);
      v29 = objc_msgSend(v13, "getConnectingServiceMask") & ~a2;
      objc_msgSend(v13, "setConnectingServicemask:", v29);
      if ((_DWORD)a5)
      {
        if (!(_DWORD)v29 && !objc_msgSend(v13, "connectedServicesCount"))
        {
          -[BluetoothManager postNotificationName:object:error:](v11, "postNotificationName:object:error:", CFSTR("BluetoothDeviceConnectFailedNotification"), v13, objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", a5));
          -[BluetoothManager _updateBluetoothState](v11, "_updateBluetoothState");
        }
        goto LABEL_66;
      }
      v24 = CFSTR("BluetoothDeviceConnectSuccessNotification");
LABEL_65:
      -[BluetoothManager postNotificationName:object:](v11, "postNotificationName:object:", v24, v13);
      goto LABEL_66;
    }
    v25 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)&buf[4] = a2;
      *(_WORD *)&buf[8] = 2112;
      *(_QWORD *)&buf[10] = v13;
      _os_log_impl(&dword_20847A000, v25, OS_LOG_TYPE_INFO, "attempting to connect to service 0x%08x on device %@", buf, 0x12u);
    }
    objc_msgSend(v13, "setConnectingServicemask:", objc_msgSend(v13, "getConnectingServiceMask") | a2);
  }
LABEL_66:
  objc_autoreleasePoolPop(v10);
}

float getFloatFromLittleEndianByteStream(uint64_t a1)
{
  return *(float *)a1;
}

BOOL isDebugModeEnabled()
{
  int AppBooleanValue;
  BOOL v1;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  CFPreferencesAppSynchronize(CFSTR("com.apple.BTServer"));
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("FitTestOptions"), CFSTR("com.apple.BTServer"), &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
    v1 = AppBooleanValue == 0;
  else
    v1 = 1;
  return !v1;
}

void _btLocalStatusEventCallback(uint64_t a1, int a2)
{
  void *v3;
  BluetoothManager *v4;
  BluetoothManager *v5;
  NSObject *v6;
  NSObject *v7;
  uint8_t v8[16];
  uint8_t buf[16];

  v3 = (void *)MEMORY[0x20BD0929C]();
  v4 = +[BluetoothManager sharedInstance](BluetoothManager, "sharedInstance");
  v5 = v4;
  switch(a2)
  {
    case 0:
      v6 = sharedBluetoothManagerLogComponent();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20847A000, v6, OS_LOG_TYPE_INFO, "local device power state changed", buf, 2u);
      }
      -[BluetoothManager _updateDenylistMode](v5, "_updateDenylistMode");
      -[BluetoothManager _powerChanged](v5, "_powerChanged");
      break;
    case 3:
      -[BluetoothManager _connectabilityChanged](v4, "_connectabilityChanged");
      break;
    case 4:
      -[BluetoothManager _pairedStatusChanged](v4, "_pairedStatusChanged");
      break;
    case 5:
      -[BluetoothManager _connectedStatusChanged](v4, "_connectedStatusChanged");
      break;
    case 6:
    case 7:
      -[BluetoothManager _discoveryStateChanged](v4, "_discoveryStateChanged");
      break;
    case 8:
      -[BluetoothManager _advertisingChanged](v4, "_advertisingChanged");
      break;
    case 9:
      v7 = sharedBluetoothManagerLogComponent();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v8 = 0;
        _os_log_impl(&dword_20847A000, v7, OS_LOG_TYPE_INFO, "local device airplane mode state changed", v8, 2u);
      }
      -[BluetoothManager _updateAirplaneModeStatus](v5, "_updateAirplaneModeStatus");
      break;
    case 10:
      -[BluetoothManager _updateDenylistMode](v4, "_updateDenylistMode");
      break;
    case 11:
      -[BluetoothManager _notifyFirstDeviceUnlockCompleted](v4, "_notifyFirstDeviceUnlockCompleted");
      break;
    default:
      break;
  }
  objc_autoreleasePoolPop(v3);
}

void _btAccessoryEventCallback(uint64_t a1, int a2, uint64_t a3, int a4, uint64_t a5)
{
  NSObject *v10;
  _QWORD v11[7];
  int v12;
  int v13;

  v10 = +[BluetoothManager sharedInstanceQueue](BluetoothManager, "sharedInstanceQueue");
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = ___btAccessoryEventCallback_block_invoke;
  v11[3] = &__block_descriptor_64_e5_v8__0l;
  v11[4] = a1;
  v11[5] = a3;
  v12 = a2;
  v13 = a4;
  v11[6] = a5;
  dispatch_async(v10, v11);
}

void _btAccessorySetupCommandCallback(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  void *v9;
  BluetoothManager *v10;
  id v11;
  NSObject *v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;
  float v21;
  float v22;
  _BOOL4 v23;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  NSObject *v29;
  NSObject *v30;
  float v31;
  float v32;
  float v33;
  float v34;
  float v35;
  float v36;
  NSObject *v37;
  float v38;
  NSObject *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  _QWORD v44[5];
  _QWORD v45[5];
  uint8_t buf[4];
  _BYTE v47[18];
  __int16 v48;
  double v49;
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v9 = (void *)MEMORY[0x20BD0929C]();
  v10 = +[BluetoothManager sharedInstance](BluetoothManager, "sharedInstance");
  v11 = -[BluetoothManager addDeviceIfNeeded:](v10, "addDeviceIfNeeded:", a2);
  v12 = sharedBluetoothManagerLogComponent();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68157954;
    *(_DWORD *)v47 = a6;
    *(_WORD *)&v47[4] = 2096;
    *(_QWORD *)&v47[6] = a5;
    _os_log_impl(&dword_20847A000, v12, OS_LOG_TYPE_DEFAULT, "DebugFitTest : Seal received data  %.*P", buf, 0x12u);
  }
  if (a6 == 178)
  {
    v13 = *(float *)(a5 + 2);
    v14 = *(float *)(a5 + 6);
    v15 = *(float *)(a5 + 18);
    v16 = *(float *)(a5 + 22);
    v17 = *(float *)(a5 + 26);
    v18 = *(float *)(a5 + 90);
    v19 = *(float *)(a5 + 94);
    v20 = *(float *)(a5 + 106);
    v21 = *(float *)(a5 + 110);
    v22 = *(float *)(a5 + 114);
    v23 = isDebugModeEnabled() || objc_msgSend(v11, "productId") == 8212;
    if (objc_msgSend(v11, "productId") == 8228 || v23)
    {
      v21 = v20;
      v22 = v20;
      v16 = v15;
      v17 = v15;
    }
    v25 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(double *)v47 = v18;
      _os_log_impl(&dword_20847A000, v25, OS_LOG_TYPE_DEFAULT, "DebugFitTest : Confidence Left : %.6f", buf, 0xCu);
    }
    v26 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(double *)v47 = v19;
      _os_log_impl(&dword_20847A000, v26, OS_LOG_TYPE_DEFAULT, "DebugFitTest : Coherence Left : %.6f", buf, 0xCu);
    }
    v27 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(double *)v47 = v13;
      _os_log_impl(&dword_20847A000, v27, OS_LOG_TYPE_DEFAULT, "DebugFitTest : Confidence Right : %.6f", buf, 0xCu);
    }
    v28 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(double *)v47 = v14;
      _os_log_impl(&dword_20847A000, v28, OS_LOG_TYPE_DEFAULT, "DebugFitTest : Coherence Right : %.6f", buf, 0xCu);
    }
    v29 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218496;
      *(double *)v47 = v20;
      *(_WORD *)&v47[8] = 2048;
      *(double *)&v47[10] = v21;
      v48 = 2048;
      v49 = v22;
      _os_log_impl(&dword_20847A000, v29, OS_LOG_TYPE_DEFAULT, "DebugFitTest : SealMetricL input : %.6f, %.6f, %.6f", buf, 0x20u);
    }
    v30 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218496;
      *(double *)v47 = v15;
      *(_WORD *)&v47[8] = 2048;
      *(double *)&v47[10] = v16;
      v48 = 2048;
      v49 = v17;
      _os_log_impl(&dword_20847A000, v30, OS_LOG_TYPE_DEFAULT, "DebugFitTest : SealMetricR input : %.6f, %.6f, %.6f", buf, 0x20u);
    }
    v31 = log10f(v20);
    v32 = (float)(log10f(v21) * 10.0) + (float)(v31 * 10.0);
    v33 = (float)(v32 + (float)(log10f(v22) * 10.0)) * 0.3333;
    v34 = log10f(v15);
    v35 = (float)(log10f(v16) * 10.0) + (float)(v34 * 10.0);
    v36 = v35 + (float)(log10f(v17) * 10.0);
    v37 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(double *)v47 = v33;
      _os_log_impl(&dword_20847A000, v37, OS_LOG_TYPE_DEFAULT, "DebugFitTest : SealMetricL %.6f", buf, 0xCu);
    }
    v38 = v36 * 0.3333;
    v39 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(double *)v47 = v38;
      _os_log_impl(&dword_20847A000, v39, OS_LOG_TYPE_DEFAULT, "DebugFitTest : SealMetricR %.6f", buf, 0xCu);
    }
    v45[0] = v11;
    *(float *)&v40 = v33;
    v45[1] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v40, CFSTR("device"), CFSTR("sealLeft"));
    v44[2] = CFSTR("sealRight");
    *(float *)&v41 = v38;
    v45[2] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v41);
    v44[3] = CFSTR("confidenceLeft");
    *(float *)&v42 = v18;
    v45[3] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v42);
    v44[4] = CFSTR("confidenceRight");
    *(float *)&v43 = v13;
    v45[4] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v43);
    -[BluetoothManager postNotificationName:object:](v10, "postNotificationName:object:", CFSTR("BluetoothAccessorySealValueStatusNotification"), objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v45, v44, 5));
  }
  objc_autoreleasePoolPop(v9);
}

void ___btAccessoryEventCallback_block_invoke(uint64_t a1)
{
  int v1;
  uint64_t v2;
  void *v3;
  BluetoothManager *v4;
  id v5;
  const __CFString *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  int v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  BluetoothManager *v16;
  uint64_t v17;
  _QWORD v18[3];
  _BYTE buf[24];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v1 = *(_DWORD *)(a1 + 56);
  v2 = *(_QWORD *)(a1 + 40);
  v3 = (void *)MEMORY[0x20BD0929C]();
  v4 = +[BluetoothManager sharedInstance](BluetoothManager, "sharedInstance");
  v5 = -[BluetoothManager addDeviceIfNeeded:](v4, "addDeviceIfNeeded:", v2);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    switch(v1)
    {
      case 1:
        buf[0] = 0;
        if (!BTAccessoryManagerGetDeviceBatteryLevel())
        {
          v6 = CFSTR("BluetoothDeviceBatteryChangedNotification");
          goto LABEL_30;
        }
        break;
      case 2:
      case 3:
      case 7:
      case 8:
      case 9:
      case 10:
      case 11:
      case 12:
      case 13:
        break;
      case 4:
        if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v5, "pairedDeviceNameUpdated"))
        {
          v6 = CFSTR("BluetoothMagicPairedDeviceNameChangedNotification");
          goto LABEL_30;
        }
        break;
      case 5:
        v9 = sharedBluetoothManagerLogComponent();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_20847A000, v9, OS_LOG_TYPE_DEFAULT, "BT_ACCESSORY_SETTINGS_CHANGED", buf, 2u);
        }
        v6 = CFSTR("BluetoothAccessorySettingsChanged");
        goto LABEL_30;
      case 6:
        -[BluetoothManager _accessoryManager](+[BluetoothManager sharedInstance](BluetoothManager, "sharedInstance"), "_accessoryManager");
        v10 = BTAccessoryManagerGetInEarStatus();
        v11 = sharedBluetoothManagerLogComponent();
        v12 = v11;
        if (v10)
        {
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
            ___btAccessoryEventCallback_block_invoke_cold_1();
          break;
        }
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412802;
          *(_QWORD *)&buf[4] = v5;
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 3;
          *(_WORD *)&buf[18] = 1024;
          *(_DWORD *)&buf[20] = 3;
          _os_log_impl(&dword_20847A000, v12, OS_LOG_TYPE_DEFAULT, "received 'AACP In Ear Status Changed' event from device %@ inEarStatus Primary : %u, Secondary : %u", buf, 0x18u);
        }
        *(_QWORD *)buf = v5;
        v18[0] = CFSTR("device");
        v18[1] = CFSTR("primaryInEarStatus");
        *(_QWORD *)&buf[8] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 3);
        v18[2] = CFSTR("secondaryInEarStatus");
        *(_QWORD *)&buf[16] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 3);
        v17 = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", buf, v18, 3);
        v6 = CFSTR("BluetoothAccessoryInEarStatusNotification");
        v16 = v4;
        goto LABEL_31;
      case 14:
        v13 = sharedBluetoothManagerLogComponent();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_20847A000, v13, OS_LOG_TYPE_DEFAULT, "BT_ACCESSORY_HEADTRACKING_CHANGED", buf, 2u);
        }
        v6 = CFSTR("BluetoothAccessibilityHeadTrackChanged");
        goto LABEL_30;
      case 15:
        v14 = sharedBluetoothManagerLogComponent();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_20847A000, v14, OS_LOG_TYPE_DEFAULT, "BT_ACCESSORY_HEADTRACKING_AVAILABILITY_CHANGED", buf, 2u);
        }
        v6 = CFSTR("BluetoothHeadTrackingAvailable");
        goto LABEL_30;
      default:
        if (v1 == 22)
        {
          v15 = sharedBluetoothManagerLogComponent();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_20847A000, v15, OS_LOG_TYPE_DEFAULT, "BT_ACCESSORY_AACP_CAPABILITIES_RECEIVED", buf, 2u);
          }
          v6 = CFSTR("BluetoothAccessoryAACPCapabilitiesReceived");
        }
        else
        {
          if (v1 != 23)
            break;
          v8 = sharedBluetoothManagerLogComponent();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_20847A000, v8, OS_LOG_TYPE_DEFAULT, "BT_ACCESSORY_SENSOR_STREAMING_FREQUENCY_CHANGED", buf, 2u);
          }
          v6 = CFSTR("BluetoothAccessorySensorStreamingFrequencyChanged");
        }
LABEL_30:
        v16 = v4;
        v17 = (uint64_t)v5;
LABEL_31:
        -[BluetoothManager postNotificationName:object:](v16, "postNotificationName:object:", v6, v17);
        break;
    }
  }
  else
  {
    v7 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      ___btAccessoryEventCallback_block_invoke_cold_2();
  }
  objc_autoreleasePoolPop(v3);
}

void _btDiscoveryStatusEventCallback(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  void *v7;

  v7 = (void *)MEMORY[0x20BD0929C]();
  objc_msgSend(a5, "_setScanState:", a2);
  if ((_DWORD)a2 == 1)
    objc_msgSend(a5, "_restartScan");
  objc_autoreleasePoolPop(v7);
}

void _btDiscoveryEventCallback(uint64_t a1, int a2, uint64_t a3, uint64_t a4, void *a5)
{
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  const __CFString *v12;
  NSObject *v13;
  id v14;

  v8 = (void *)MEMORY[0x20BD0929C]();
  v9 = objc_msgSend(a5, "addDeviceIfNeeded:", a3);
  if (v9)
  {
    v10 = (void *)v9;
    if (a2 == 1)
    {
      v13 = sharedBluetoothManagerLogComponent();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        _btDiscoveryEventCallback_cold_2();
      v14 = v10;
      objc_msgSend(a5, "_removeDevice:", v10);
      v12 = CFSTR("BluetoothDeviceRemovedNotification");
      goto LABEL_10;
    }
    if (!a2)
    {
      v11 = sharedBluetoothManagerLogComponent();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        _btDiscoveryEventCallback_cold_1();
      v12 = CFSTR("BluetoothDeviceDiscoveredNotification");
LABEL_10:
      objc_msgSend(a5, "postNotificationName:object:", v12, v10);
    }
  }
  objc_autoreleasePoolPop(v8);
}

void pairingAgentStatusEventCallback(uint64_t a1, int a2, uint64_t a3, uint64_t a4, void *a5)
{
  void *v9;
  uint64_t v10;
  NSObject *v11;

  v9 = (void *)MEMORY[0x20BD0929C]();
  if (a3 == 4294901761)
    v10 = 0;
  else
    v10 = objc_msgSend(a5, "addDeviceIfNeeded:", a3);
  if (a2 == 3)
  {
    v11 = sharedBluetoothManagerLogComponent();
    if ((_DWORD)a4)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        pairingAgentStatusEventCallback_cold_2();
      objc_msgSend(a5, "postNotificationName:object:error:", CFSTR("BluetoothPairingPINResultFailedNotification"), v10, objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", a4));
    }
    else
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        pairingAgentStatusEventCallback_cold_1();
      objc_msgSend(a5, "postNotificationName:object:", CFSTR("BluetoothPairingPINResultSuccessNotification"), v10);
    }
  }
  objc_autoreleasePoolPop(v9);
}

void pairingAgentPincodeCallback(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  void *v6;
  uint64_t v7;
  NSObject *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v6 = (void *)MEMORY[0x20BD0929C]();
  v7 = objc_msgSend(a4, "addDeviceIfNeeded:", a2);
  v8 = sharedBluetoothManagerLogComponent();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = 138412290;
    v10 = v7;
    _os_log_impl(&dword_20847A000, v8, OS_LOG_TYPE_INFO, "received pincode request for device %@", (uint8_t *)&v9, 0xCu);
  }
  objc_msgSend(a4, "postNotificationName:object:", CFSTR("BluetoothPairingPINRequestNotification"), v7);
  objc_autoreleasePoolPop(v6);
}

void pairingAgentUserConfirmationCallback(uint64_t a1, uint64_t a2, uint64_t a3, int a4, void *a5)
{
  void *v9;
  uint64_t v10;
  NSObject *v11;
  _BOOL4 v12;
  uint64_t v13;
  const __CFString *v14;
  void *v15;
  uint8_t buf[4];
  _DWORD v17[7];

  *(_QWORD *)&v17[5] = *MEMORY[0x24BDAC8D0];
  v9 = (void *)MEMORY[0x20BD0929C]();
  v10 = objc_msgSend(a5, "addDeviceIfNeeded:", a2);
  v11 = sharedBluetoothManagerLogComponent();
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);
  if (a4)
  {
    if (v12)
    {
      *(_DWORD *)buf = 67109378;
      v17[0] = a3;
      LOWORD(v17[1]) = 2112;
      *(_QWORD *)((char *)&v17[1] + 2) = v10;
      _os_log_impl(&dword_20847A000, v11, OS_LOG_TYPE_INFO, "received user confirmation request (numeric comparison to %06u) for device %@", buf, 0x12u);
    }
    v13 = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", v10, CFSTR("device"), objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", a3), CFSTR("value"), 0);
    v14 = CFSTR("BluetoothPairingUserNumericComparisionNotification");
    v15 = a5;
  }
  else
  {
    if (v12)
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v17 = v10;
      _os_log_impl(&dword_20847A000, v11, OS_LOG_TYPE_INFO, "received user confirmation request for device %@", buf, 0xCu);
    }
    v14 = CFSTR("BluetoothPairingUserConfirmationNotification");
    v15 = a5;
    v13 = v10;
  }
  objc_msgSend(v15, "postNotificationName:object:", v14, v13);
  objc_autoreleasePoolPop(v9);
}

void pairingAgentPassKeyDisplayCallback(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  void *v7;
  uint64_t v8;
  NSObject *v9;
  uint8_t buf[4];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = (void *)MEMORY[0x20BD0929C]();
  v8 = objc_msgSend(a4, "addDeviceIfNeeded:", a2);
  v9 = sharedBluetoothManagerLogComponent();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v11 = v8;
    _os_log_impl(&dword_20847A000, v9, OS_LOG_TYPE_INFO, "received passkey display request for device %@", buf, 0xCu);
  }
  objc_msgSend(a4, "postNotificationName:object:", CFSTR("BluetoothPairingPassKeyDisplayNotification"), objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", v8, CFSTR("device"), objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", a3), CFSTR("value"), 0));
  objc_autoreleasePoolPop(v7);
}

void pairingAgentLocalOOBDataReadyCallback()
{
  NSObject *v0;
  uint8_t v1[16];

  v0 = sharedBluetoothManagerLogComponent();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_20847A000, v0, OS_LOG_TYPE_INFO, "received Local OOB Data Ready callback, unsupported", v1, 2u);
  }
}

void OUTLINED_FUNCTION_1_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x12u);
}

void OUTLINED_FUNCTION_2_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_11(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void AddressForBTDevice_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  const void *v2;
  int v3;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_1_0(&dword_20847A000, v0, v1, "BTDeviceGetAddressString(%p) failed with error %d.", v2, v3);
  OUTLINED_FUNCTION_5_0();
}

void _btServiceEventCallback_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0(&dword_20847A000, v0, v1, "received 'audio connected' handsfree event from device %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5_0();
}

void _btServiceEventCallback_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0(&dword_20847A000, v0, v1, "received 'audio disconnected' handsfree event from device %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5_0();
}

void _btServiceEventCallback_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0(&dword_20847A000, v0, v1, "received 'start voice command' handsfree event from device %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5_0();
}

void _btServiceEventCallback_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0(&dword_20847A000, v0, v1, "received 'end voice command' handsfree event from device %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5_0();
}

void _btServiceEventCallback_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0(&dword_20847A000, v0, v1, "received 'phonebook supported' handsfree event from device %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5_0();
}

void _btServiceEventCallback_cold_6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0(&dword_20847A000, v0, v1, "received 'high power enabled' event from device %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5_0();
}

void _btServiceEventCallback_cold_7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0(&dword_20847A000, v0, v1, "received 'high power disabled' event from device %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5_0();
}

void _btServiceEventCallback_cold_8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_11(&dword_20847A000, v0, v1, "received BT_SERVICE_DEPENDENT_EVENT event for BT_SERVICE_HANDSFREE", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void _btServiceEventCallback_cold_9()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0(&dword_20847A000, v0, v1, "received 'phonebook supported' phonebook event from device %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5_0();
}

void _btServiceEventCallback_cold_10()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0(&dword_20847A000, v0, v1, "received 'A2DP audio connected' event from device %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5_0();
}

void _btSessionEventCallback_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_1_0(&dword_20847A000, v0, v1, "Session attach called back with %@ (%x)");
  OUTLINED_FUNCTION_5_0();
}

void ___btAccessoryEventCallback_block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_20847A000, v0, v1, "Failed to get inEarStatus : %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void ___btAccessoryEventCallback_block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_8(&dword_20847A000, v0, v1, "Bad device instance: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5_0();
}

void _btDiscoveryEventCallback_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0(&dword_20847A000, v0, v1, "found device %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5_0();
}

void _btDiscoveryEventCallback_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0(&dword_20847A000, v0, v1, "lost device %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5_0();
}

void pairingAgentStatusEventCallback_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0(&dword_20847A000, v0, v1, "pairing to device %@ completed successfully", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5_0();
}

void pairingAgentStatusEventCallback_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_1_0(&dword_20847A000, v0, v1, "pairing to device %@ failed with result %d");
  OUTLINED_FUNCTION_5_0();
}

uint64_t BTAccessoryManagerAddCallbacks()
{
  return MEMORY[0x24BE66C80]();
}

uint64_t BTAccessoryManagerGetAACPCapabilityBits()
{
  return MEMORY[0x24BE66C90]();
}

uint64_t BTAccessoryManagerGetAACPCapabilityInteger()
{
  return MEMORY[0x24BE66C98]();
}

uint64_t BTAccessoryManagerGetAccessoryInfo()
{
  return MEMORY[0x24BE66CA0]();
}

uint64_t BTAccessoryManagerGetCallManagementConfig()
{
  return MEMORY[0x24BE66CA8]();
}

uint64_t BTAccessoryManagerGetControlCommand()
{
  return MEMORY[0x24BE66CB0]();
}

uint64_t BTAccessoryManagerGetDefault()
{
  return MEMORY[0x24BE66CB8]();
}

uint64_t BTAccessoryManagerGetDeviceBatteryLevel()
{
  return MEMORY[0x24BE66CC0]();
}

uint64_t BTAccessoryManagerGetDeviceBatteryStatus()
{
  return MEMORY[0x24BE66CC8]();
}

uint64_t BTAccessoryManagerGetDeviceColor()
{
  return MEMORY[0x24BE66CD0]();
}

uint64_t BTAccessoryManagerGetDeviceSoundProfileAllowed()
{
  return MEMORY[0x24BE66CD8]();
}

uint64_t BTAccessoryManagerGetDeviceSoundProfileSupport()
{
  return MEMORY[0x24BE66CE0]();
}

uint64_t BTAccessoryManagerGetDoubleTapAction()
{
  return MEMORY[0x24BE66CE8]();
}

uint64_t BTAccessoryManagerGetDoubleTapActionEx()
{
  return MEMORY[0x24BE66CF0]();
}

uint64_t BTAccessoryManagerGetDoubleTapCapability()
{
  return MEMORY[0x24BE66CF8]();
}

uint64_t BTAccessoryManagerGetFeatureCapability()
{
  return MEMORY[0x24BE66D00]();
}

uint64_t BTAccessoryManagerGetFeatureProxCardStatus()
{
  return MEMORY[0x24BE66D08]();
}

uint64_t BTAccessoryManagerGetGyroInformation()
{
  return MEMORY[0x24BE66D10]();
}

uint64_t BTAccessoryManagerGetHeadphoneFeatureValue()
{
  return MEMORY[0x24BE66D18]();
}

uint64_t BTAccessoryManagerGetInEarDetectionEnable()
{
  return MEMORY[0x24BE66D20]();
}

uint64_t BTAccessoryManagerGetInEarStatus()
{
  return MEMORY[0x24BE66D28]();
}

uint64_t BTAccessoryManagerGetMicMode()
{
  return MEMORY[0x24BE66D30]();
}

uint64_t BTAccessoryManagerGetNonAppleHAEPairedDevices()
{
  return MEMORY[0x24BE66D38]();
}

uint64_t BTAccessoryManagerGetPrimaryBudSide()
{
  return MEMORY[0x24BE66D40]();
}

uint64_t BTAccessoryManagerGetSettingFeatureBitMask()
{
  return MEMORY[0x24BE66D48]();
}

uint64_t BTAccessoryManagerGetSmartRouteMode()
{
  return MEMORY[0x24BE66D50]();
}

uint64_t BTAccessoryManagerGetSmartRouteSupport()
{
  return MEMORY[0x24BE66D58]();
}

uint64_t BTAccessoryManagerGetSpatialAudioActive()
{
  return MEMORY[0x24BE66D60]();
}

uint64_t BTAccessoryManagerGetSpatialAudioAllowed()
{
  return MEMORY[0x24BE66D68]();
}

uint64_t BTAccessoryManagerGetSpatialAudioConfig()
{
  return MEMORY[0x24BE66D70]();
}

uint64_t BTAccessoryManagerGetSpatialAudioPlatformSupport()
{
  return MEMORY[0x24BE66D78]();
}

uint64_t BTAccessoryManagerGetStereoHFPSupport()
{
  return MEMORY[0x24BE66D80]();
}

uint64_t BTAccessoryManagerGetWirelessSharingSpatial()
{
  return MEMORY[0x24BE66D90]();
}

uint64_t BTAccessoryManagerIsAccessory()
{
  return MEMORY[0x24BE66D98]();
}

uint64_t BTAccessoryManagerIsGenuineAirPods()
{
  return MEMORY[0x24BE66DA0]();
}

uint64_t BTAccessoryManagerRemoveCallbacks()
{
  return MEMORY[0x24BE66DC8]();
}

uint64_t BTAccessoryManagerSendControlCommand()
{
  return MEMORY[0x24BE66DD0]();
}

uint64_t BTAccessoryManagerSetDeviceSoundProfileAllowed()
{
  return MEMORY[0x24BE66DE0]();
}

uint64_t BTAccessoryManagerSetDoubleTapAction()
{
  return MEMORY[0x24BE66DE8]();
}

uint64_t BTAccessoryManagerSetDoubleTapActionEx()
{
  return MEMORY[0x24BE66DF0]();
}

uint64_t BTAccessoryManagerSetFeatureProxCardStatus()
{
  return MEMORY[0x24BE66DF8]();
}

uint64_t BTAccessoryManagerSetHeadphoneFeatureValue()
{
  return MEMORY[0x24BE66E00]();
}

uint64_t BTAccessoryManagerSetInEarDetectionEnable()
{
  return MEMORY[0x24BE66E08]();
}

uint64_t BTAccessoryManagerSetIsHidden()
{
  return MEMORY[0x24BE66E10]();
}

uint64_t BTAccessoryManagerSetMicMode()
{
  return MEMORY[0x24BE66E20]();
}

uint64_t BTAccessoryManagerSetupCommand()
{
  return MEMORY[0x24BE66E28]();
}

uint64_t BTAccessoryManagerSmartRouteMode()
{
  return MEMORY[0x24BE66E30]();
}

uint64_t BTAccessoryManagerSpatialAudioAllowed()
{
  return MEMORY[0x24BE66E38]();
}

uint64_t BTAccessoryManagerSpatialAudioConfig()
{
  return MEMORY[0x24BE66E40]();
}

uint64_t BTDeviceAddressFromString()
{
  return MEMORY[0x24BE66E50]();
}

uint64_t BTDeviceConnectServices()
{
  return MEMORY[0x24BE66E68]();
}

uint64_t BTDeviceDisconnect()
{
  return MEMORY[0x24BE66E70]();
}

uint64_t BTDeviceFromAddress()
{
  return MEMORY[0x24BE66E78]();
}

uint64_t BTDeviceFromIdentifier()
{
  return MEMORY[0x24BE66E80]();
}

uint64_t BTDeviceGetAddressString()
{
  return MEMORY[0x24BE66E88]();
}

uint64_t BTDeviceGetCloudPairingStatus()
{
  return MEMORY[0x24BE66E90]();
}

uint64_t BTDeviceGetConnectedServices()
{
  return MEMORY[0x24BE66E98]();
}

uint64_t BTDeviceGetDefaultName()
{
  return MEMORY[0x24BE66EA0]();
}

uint64_t BTDeviceGetDeviceClass()
{
  return MEMORY[0x24BE66EA8]();
}

uint64_t BTDeviceGetDeviceId()
{
  return MEMORY[0x24BE66EB0]();
}

uint64_t BTDeviceGetDeviceType()
{
  return MEMORY[0x24BE66EB8]();
}

uint64_t BTDeviceGetGroups()
{
  return MEMORY[0x24BE66EC0]();
}

uint64_t BTDeviceGetHIDDeviceBehavior()
{
  return MEMORY[0x24BE66EC8]();
}

uint64_t BTDeviceGetLowSecurityStatus()
{
  return MEMORY[0x24BE66ED0]();
}

uint64_t BTDeviceGetMagicPairingStatus()
{
  return MEMORY[0x24BE66ED8]();
}

uint64_t BTDeviceGetName()
{
  return MEMORY[0x24BE66EE0]();
}

uint64_t BTDeviceGetPairingStatus()
{
  return MEMORY[0x24BE66EE8]();
}

uint64_t BTDeviceGetProductName()
{
  return MEMORY[0x24BE66EF0]();
}

uint64_t BTDeviceGetServiceSettings()
{
  return MEMORY[0x24BE66EF8]();
}

uint64_t BTDeviceGetSupportedServices()
{
  return MEMORY[0x24BE66F00]();
}

uint64_t BTDeviceGetSyncSettings()
{
  return MEMORY[0x24BE66F08]();
}

uint64_t BTDeviceGetUserSelectedDeviceType()
{
  return MEMORY[0x24BE66F10]();
}

uint64_t BTDeviceIsAppleAudioDevice()
{
  return MEMORY[0x24BE66F18]();
}

uint64_t BTDeviceIsProController()
{
  return MEMORY[0x24BE66F20]();
}

uint64_t BTDeviceIsTemporaryPaired()
{
  return MEMORY[0x24BE66F28]();
}

uint64_t BTDevicePhysicalLinkDisconnect()
{
  return MEMORY[0x24BE66F30]();
}

uint64_t BTDeviceSetGroup()
{
  return MEMORY[0x24BE66F38]();
}

uint64_t BTDeviceSetServiceSettings()
{
  return MEMORY[0x24BE66F40]();
}

uint64_t BTDeviceSetSyncSettings()
{
  return MEMORY[0x24BE66F48]();
}

uint64_t BTDeviceSetUserName()
{
  return MEMORY[0x24BE66F50]();
}

uint64_t BTDeviceSetUserSelectedDeviceType()
{
  return MEMORY[0x24BE66F58]();
}

uint64_t BTDeviceSupportsHS()
{
  return MEMORY[0x24BE66F60]();
}

uint64_t BTDiscoveryAgentCreate()
{
  return MEMORY[0x24BE66F68]();
}

uint64_t BTDiscoveryAgentDestroy()
{
  return MEMORY[0x24BE66F70]();
}

uint64_t BTDiscoveryAgentGetDevices()
{
  return MEMORY[0x24BE66F78]();
}

uint64_t BTDiscoveryAgentStartScan()
{
  return MEMORY[0x24BE66F80]();
}

uint64_t BTDiscoveryAgentStopScan()
{
  return MEMORY[0x24BE66F88]();
}

uint64_t BTLocalDeviceAddCallbacks()
{
  return MEMORY[0x24BE66F90]();
}

uint64_t BTLocalDeviceEnableDUTMode()
{
  return MEMORY[0x24BE66F98]();
}

uint64_t BTLocalDeviceGetAddressString()
{
  return MEMORY[0x24BE66FA0]();
}

uint64_t BTLocalDeviceGetAdvertisingStatus()
{
  return MEMORY[0x24BE66FA8]();
}

uint64_t BTLocalDeviceGetAirplaneModeStatus()
{
  return MEMORY[0x24BE66FB0]();
}

uint64_t BTLocalDeviceGetConnectable()
{
  return MEMORY[0x24BE66FB8]();
}

uint64_t BTLocalDeviceGetConnectedDevices()
{
  return MEMORY[0x24BE66FC0]();
}

uint64_t BTLocalDeviceGetConnectingDevices()
{
  return MEMORY[0x24BE66FC8]();
}

uint64_t BTLocalDeviceGetConnectionStatus()
{
  return MEMORY[0x24BE66FD0]();
}

uint64_t BTLocalDeviceGetDefault()
{
  return MEMORY[0x24BE66FD8]();
}

uint64_t BTLocalDeviceGetDenylistEnabled()
{
  return MEMORY[0x24BE66FE0]();
}

uint64_t BTLocalDeviceGetDeviceNamesThatMayBeDenylisted()
{
  return MEMORY[0x24BE66FE8]();
}

uint64_t BTLocalDeviceGetDiscoverable()
{
  return MEMORY[0x24BE66FF0]();
}

uint64_t BTLocalDeviceGetModulePower()
{
  return MEMORY[0x24BE66FF8]();
}

uint64_t BTLocalDeviceGetPairedDevices()
{
  return MEMORY[0x24BE67000]();
}

uint64_t BTLocalDeviceGetScanning()
{
  return MEMORY[0x24BE67008]();
}

uint64_t BTLocalDeviceGetSpatialPlatformSupport()
{
  return MEMORY[0x24BE67010]();
}

uint64_t BTLocalDeviceMaskCallbacks()
{
  return MEMORY[0x24BE67018]();
}

uint64_t BTLocalDeviceRemoveCallbacks()
{
  return MEMORY[0x24BE67020]();
}

uint64_t BTLocalDeviceSetConnectable()
{
  return MEMORY[0x24BE67028]();
}

uint64_t BTLocalDeviceSetDenylistEnabled()
{
  return MEMORY[0x24BE67030]();
}

uint64_t BTLocalDeviceSetDiscoverable()
{
  return MEMORY[0x24BE67038]();
}

uint64_t BTLocalDeviceSetModulePower()
{
  return MEMORY[0x24BE67040]();
}

uint64_t BTLocalDeviceShowPowerPrompt()
{
  return MEMORY[0x24BE67048]();
}

uint64_t BTLocalDeviceSupportsService()
{
  return MEMORY[0x24BE67050]();
}

uint64_t BTPairingAgentAcceptSSP()
{
  return MEMORY[0x24BE67058]();
}

uint64_t BTPairingAgentCancelPairing()
{
  return MEMORY[0x24BE67060]();
}

uint64_t BTPairingAgentCreate()
{
  return MEMORY[0x24BE67068]();
}

uint64_t BTPairingAgentDeletePairedDevice()
{
  return MEMORY[0x24BE67070]();
}

uint64_t BTPairingAgentDestroy()
{
  return MEMORY[0x24BE67078]();
}

uint64_t BTPairingAgentSetPincode()
{
  return MEMORY[0x24BE67080]();
}

uint64_t BTPairingAgentStart()
{
  return MEMORY[0x24BE67088]();
}

uint64_t BTPairingAgentStop()
{
  return MEMORY[0x24BE67090]();
}

uint64_t BTServiceAddCallbacks()
{
  return MEMORY[0x24BE67098]();
}

uint64_t BTServiceRemoveCallbacks()
{
  return MEMORY[0x24BE670A8]();
}

uint64_t BTSessionAttachWithQueue()
{
  return MEMORY[0x24BE670B0]();
}

uint64_t BTSessionDetachWithQueue()
{
  return MEMORY[0x24BE670B8]();
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x24BDBC050]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
  MEMORY[0x24BDBC070](center, name, object, userInfo, deliverImmediately);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x24BDBC150](applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x24BDBC188](key, applicationID, keyExistsAndHasValidFormat);
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x24BED8468]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x24BDD0B80](aClassName);
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
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

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x24BDAE6D0]();
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x24BDAE6E8]();
}

float log10f(float a1)
{
  float result;

  MEMORY[0x24BDAEAB8](a1);
  return result;
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

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
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

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x24BDB08C0](keys, values, count);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
  MEMORY[0x24BDB09C8](xdict, key, string);
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
  MEMORY[0x24BDB09E0](xdict, key, value);
}

void xpc_release(xpc_object_t object)
{
  MEMORY[0x24BDB0AE0](object);
}

