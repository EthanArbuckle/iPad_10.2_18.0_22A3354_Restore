@implementation HPHeadphoneFeatureManager

- (HPHeadphoneFeatureManager)initWithBluetoothAddress:(id)a3 productID:(unsigned int)a4
{
  id v5;
  HPHeadphoneFeatureManager *v6;
  NSString *v7;
  NSString *bluetoothAddressString;
  uint64_t v9;
  BluetoothManager *btManager;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)HPHeadphoneFeatureManager;
  v5 = a3;
  v6 = -[HPHeadphoneFeatureManager init](&v12, "init");
  v7 = (NSString *)objc_msgSend(v5, "copy");

  bluetoothAddressString = v6->_bluetoothAddressString;
  v6->_bluetoothAddressString = v7;

  v6->_productID = a4;
  if (dword_1000B78E0 <= 30 && (dword_1000B78E0 != -1 || _LogCategory_Initialize(&dword_1000B78E0, 30)))
    LogPrintF(&dword_1000B78E0, "-[HPHeadphoneFeatureManager initWithBluetoothAddress:productID:]", 30, "starting SVSHeadphoneFeatureManager for device with address:%@", v6->_bluetoothAddressString);
  v9 = objc_claimAutoreleasedReturnValue(+[BluetoothManager sharedInstance](BluetoothManager, "sharedInstance"));
  btManager = v6->_btManager;
  v6->_btManager = (BluetoothManager *)v9;

  return v6;
}

- (BOOL)shouldShowProxCardForFeature:(int)a3
{
  uint64_t v3;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  unsigned int v14;
  unsigned int v15;
  unsigned int v16;
  int v17;
  unsigned int v18;
  void *v19;
  const __CFString *v20;
  const __CFString *v21;
  const __CFString *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];

  v3 = *(_QWORD *)&a3;
  if (a3)
  {
    if (a3 != 1)
    {
      if (dword_1000B78E0 <= 90
        && (dword_1000B78E0 != -1 || _LogCategory_Initialize(&dword_1000B78E0, 90)))
      {
        LogPrintF(&dword_1000B78E0, "-[HPHeadphoneFeatureManager shouldShowProxCardForFeature:]", 90, "Invalid Apple Headphone Feature: %d", v3);
      }
      LOBYTE(v17) = 0;
      return v17;
    }
    v5 = 2;
  }
  else
  {
    v5 = 1;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BluetoothManager pairedDevices](self->_btManager, "pairedDevices"));
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v25;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v25 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "address"));
        v14 = objc_msgSend(v13, "isEqualToString:", self->_bluetoothAddressString);

        if (v14)
        {
          objc_storeStrong((id *)&self->_bluetoothDevice, v12);
          if (dword_1000B78E0 <= 50
            && (dword_1000B78E0 != -1 || _LogCategory_Initialize(&dword_1000B78E0, 50)))
          {
            LogPrintF(&dword_1000B78E0, "-[HPHeadphoneFeatureManager shouldShowProxCardForFeature:]", 50, "SVS Headphone Feature Manager with device:%@", self->_bluetoothDevice);
          }
          goto LABEL_21;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (v9)
        continue;
      break;
    }
  }
LABEL_21:

  v15 = -[BluetoothDevice isProxCardShowedForFeature:](self->_bluetoothDevice, "isProxCardShowedForFeature:", v5);
  v16 = -[BluetoothDevice isProxCardSupportedForFeature:](self->_bluetoothDevice, "isProxCardSupportedForFeature:", v5);
  v17 = v16 & ~v15;
  if (dword_1000B78E0 <= 50)
  {
    v18 = v16;
    if (dword_1000B78E0 != -1 || _LogCategory_Initialize(&dword_1000B78E0, 50))
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[HPHeadphoneFeatureManager getFeatureName:](self, "getFeatureName:", v3));
      v20 = CFSTR("NO");
      if (v17)
        v21 = CFSTR("YES");
      else
        v21 = CFSTR("NO");
      if (v15)
        v22 = CFSTR("YES");
      else
        v22 = CFSTR("NO");
      if (v18)
        v20 = CFSTR("YES");
      LogPrintF(&dword_1000B78E0, "-[HPHeadphoneFeatureManager shouldShowProxCardForFeature:]", 50, "Should show Prox Card for %@ -- should prompt: %@, isProxCardShowed: %@, isProxCardSupportedByDevice: %@, inDevice: %@", v19, v21, v22, v20, v20, self->_bluetoothAddressString, (_QWORD)v24);

    }
  }

  return v17;
}

- (id)getFeatureName:(int)a3
{
  const __CFString *v3;

  v3 = CFSTR("Unknown");
  if (a3 == 1)
    v3 = CFSTR("Adaptive Controls");
  if (a3)
    return (id)v3;
  else
    return CFSTR("Mute Call");
}

- (BOOL)shouldShowMuteCallProxCard
{
  return 0;
}

- (void)setMuteCallConfig
{
  if (dword_1000B78E0 <= 50 && (dword_1000B78E0 != -1 || _LogCategory_Initialize(&dword_1000B78E0, 50)))
    LogPrintF(&dword_1000B78E0, "-[HPHeadphoneFeatureManager setMuteCallConfig]", 50, "Mute Call: Set Mute Call Config");
  -[BluetoothDevice setCallConfig:](self->_bluetoothDevice, "setCallConfig:", (unint64_t)-[BluetoothDevice getCallManagementConfig](self->_bluetoothDevice, "getCallManagementConfig") & 0xFFFFFF | 0x2020302000000);
}

- (void)setMuteCallStatus
{
  if (dword_1000B78E0 <= 50 && (dword_1000B78E0 != -1 || _LogCategory_Initialize(&dword_1000B78E0, 50)))
    LogPrintF(&dword_1000B78E0, "-[HPHeadphoneFeatureManager setMuteCallStatus]", 50, "Mute Call: Set Status Showed");
  -[BluetoothDevice setCallConfig:](self->_bluetoothDevice, "setCallConfig:", (unint64_t)-[BluetoothDevice getCallManagementConfig](self->_bluetoothDevice, "getCallManagementConfig") & 0xFF00FF00FFFFFFLL | 0x20002000000);
}

- (unsigned)getColorCode
{
  int v3;

  v3 = 1;
  -[BluetoothDevice getDeviceColor:](self->_bluetoothDevice, "getDeviceColor:", &v3);
  return v3;
}

- (BOOL)shouldShowAdaptiveControlsProxCard
{
  return -[HPHeadphoneFeatureManager shouldShowProxCardForFeature:](self, "shouldShowProxCardForFeature:", 1);
}

- (void)setAdaptiveControlsConfigEnabled
{
  if (dword_1000B78E0 <= 50 && (dword_1000B78E0 != -1 || _LogCategory_Initialize(&dword_1000B78E0, 50)))
    LogPrintF(&dword_1000B78E0, "-[HPHeadphoneFeatureManager setAdaptiveControlsConfigEnabled]", 50, "Adaptive Controls: Set Config Enabled");
  -[BluetoothDevice setListeningMode:](self->_bluetoothDevice, "setListeningMode:", 4);
  -[BluetoothDevice setListeningModeConfigs:](self->_bluetoothDevice, "setListeningModeConfigs:", 10);
  -[BluetoothDevice setAdaptiveVolumeMode:](self->_bluetoothDevice, "setAdaptiveVolumeMode:", 1);
  -[BluetoothDevice setConversationDetectMode:](self->_bluetoothDevice, "setConversationDetectMode:", 1);
}

- (void)setAdaptiveControlsConfigDisabled
{
  if (dword_1000B78E0 <= 50 && (dword_1000B78E0 != -1 || _LogCategory_Initialize(&dword_1000B78E0, 50)))
    LogPrintF(&dword_1000B78E0, "-[HPHeadphoneFeatureManager setAdaptiveControlsConfigDisabled]", 50, "Adaptive Controls: Set Config Disabled");
  -[BluetoothDevice setAdaptiveVolumeMode:](self->_bluetoothDevice, "setAdaptiveVolumeMode:", 2);
  -[BluetoothDevice setConversationDetectMode:](self->_bluetoothDevice, "setConversationDetectMode:", 2);
}

- (void)setAdaptiveControlsStatus
{
  if (dword_1000B78E0 <= 50 && (dword_1000B78E0 != -1 || _LogCategory_Initialize(&dword_1000B78E0, 50)))
    LogPrintF(&dword_1000B78E0, "-[HPHeadphoneFeatureManager setAdaptiveControlsStatus]", 50, "Adaptive Controls: Set Status Showed");
  -[BluetoothDevice setProxCardShowedForFeature:showed:](self->_bluetoothDevice, "setProxCardShowedForFeature:showed:", 2, 1);
}

- (void)setAdaptiveControlsCustomized:(BOOL)a3 autoVolumeEnabled:(BOOL)a4 conversationDetectionEnabled:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  _BOOL4 v7;
  uint64_t v9;
  uint64_t v10;

  v5 = a5;
  v6 = a4;
  v7 = a3;
  if (dword_1000B78E0 <= 50 && (dword_1000B78E0 != -1 || _LogCategory_Initialize(&dword_1000B78E0, 50)))
    LogPrintF(&dword_1000B78E0, "-[HPHeadphoneFeatureManager setAdaptiveControlsCustomized:autoVolumeEnabled:conversationDetectionEnabled:]", 50, "Adaptive Controls: Set Config Customized: Auto ANC: %u, Auto Volume: %u, Conversation Detection: %u", v7, v6, v5);
  if (v7)
  {
    -[BluetoothDevice setListeningMode:](self->_bluetoothDevice, "setListeningMode:", 4);
    -[BluetoothDevice setListeningModeConfigs:](self->_bluetoothDevice, "setListeningModeConfigs:", 10);
  }
  if (v6)
    v9 = 1;
  else
    v9 = 2;
  -[BluetoothDevice setAdaptiveVolumeMode:](self->_bluetoothDevice, "setAdaptiveVolumeMode:", v9);
  if (v5)
    v10 = 1;
  else
    v10 = 2;
  -[BluetoothDevice setConversationDetectMode:](self->_bluetoothDevice, "setConversationDetectMode:", v10);
}

- (void)setAdaptiveControlsAdaptiveMode:(BOOL)a3
{
  _BOOL4 v3;
  const char *v5;

  v3 = a3;
  if (dword_1000B78E0 <= 50 && (dword_1000B78E0 != -1 || _LogCategory_Initialize(&dword_1000B78E0, 50)))
  {
    v5 = "Disabled";
    if (v3)
      v5 = "Enabled";
    LogPrintF(&dword_1000B78E0, "-[HPHeadphoneFeatureManager setAdaptiveControlsAdaptiveMode:]", 50, "Adaptive Controls: Set Adaptive Mode: %s", v5);
  }
  if (v3)
  {
    -[BluetoothDevice setListeningMode:](self->_bluetoothDevice, "setListeningMode:", 4);
    -[BluetoothDevice setListeningModeConfigs:](self->_bluetoothDevice, "setListeningModeConfigs:", 10);
  }
}

- (void)setAdaptiveControlsPersonalizedVolume:(BOOL)a3
{
  _BOOL4 v3;
  const char *v5;
  uint64_t v6;

  v3 = a3;
  if (dword_1000B78E0 <= 50 && (dword_1000B78E0 != -1 || _LogCategory_Initialize(&dword_1000B78E0, 50)))
  {
    v5 = "Disabled";
    if (v3)
      v5 = "Enabled";
    LogPrintF(&dword_1000B78E0, "-[HPHeadphoneFeatureManager setAdaptiveControlsPersonalizedVolume:]", 50, "Adaptive Controls: Set Personalized Volume: %s", v5);
  }
  if (v3)
    v6 = 1;
  else
    v6 = 2;
  -[BluetoothDevice setAdaptiveVolumeMode:](self->_bluetoothDevice, "setAdaptiveVolumeMode:", v6);
}

- (void)setAdaptiveControlsConversationAwareness:(BOOL)a3
{
  _BOOL4 v3;
  const char *v5;

  v3 = a3;
  if (dword_1000B78E0 <= 50 && (dword_1000B78E0 != -1 || _LogCategory_Initialize(&dword_1000B78E0, 50)))
  {
    v5 = "Disabled";
    if (v3)
      v5 = "Enabled";
    LogPrintF(&dword_1000B78E0, "-[HPHeadphoneFeatureManager setAdaptiveControlsConversationAwareness:]", 50, "Adaptive Controls: Set ConversationAwareness: %s", v5);
  }
  if (v3)
    -[BluetoothDevice setConversationDetectMode:](self->_bluetoothDevice, "setConversationDetectMode:", 1);
  else
    -[BluetoothDevice setConversationDetectMode:](self->_bluetoothDevice, "setConversationDetectMode:", 2);
}

- (NSString)bluetoothAddressString
{
  return self->_bluetoothAddressString;
}

- (BluetoothDevice)bluetoothDevice
{
  return self->_bluetoothDevice;
}

- (void)setBluetoothDevice:(id)a3
{
  objc_storeStrong((id *)&self->_bluetoothDevice, a3);
}

- (BluetoothManager)btManager
{
  return self->_btManager;
}

- (void)setBtManager:(id)a3
{
  objc_storeStrong((id *)&self->_btManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_btManager, 0);
  objc_storeStrong((id *)&self->_bluetoothDevice, 0);
  objc_storeStrong((id *)&self->_bluetoothAddressString, 0);
}

@end
