@implementation HPHeadphoneEndCallManager

- (HPHeadphoneEndCallManager)initWithBluetoothAddress:(id)a3
{
  id v3;
  HPHeadphoneEndCallManager *v4;
  NSString *v5;
  NSString *bluetoothAddressString;
  uint64_t v7;
  BluetoothManager *btManager;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)HPHeadphoneEndCallManager;
  v3 = a3;
  v4 = -[HPHeadphoneEndCallManager init](&v10, "init");
  v5 = (NSString *)objc_msgSend(v3, "copy");

  bluetoothAddressString = v4->_bluetoothAddressString;
  v4->_bluetoothAddressString = v5;

  if (dword_1000B7A40 <= 30 && (dword_1000B7A40 != -1 || _LogCategory_Initialize(&dword_1000B7A40, 30)))
    LogPrintF(&dword_1000B7A40, "-[HPHeadphoneEndCallManager initWithBluetoothAddress:]", 30, "starting end call manager for device with address:%@", v4->_bluetoothAddressString);
  v7 = objc_claimAutoreleasedReturnValue(+[BluetoothManager sharedInstance](BluetoothManager, "sharedInstance"));
  btManager = v4->_btManager;
  v4->_btManager = (BluetoothManager *)v7;

  return v4;
}

- (BOOL)isStatusUnknown
{
  void *v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  unsigned int v11;
  unsigned __int16 v12;
  BOOL v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BluetoothManager pairedDevices](self->_btManager, "pairedDevices"));
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "address"));
        v11 = objc_msgSend(v10, "isEqualToString:", self->_bluetoothAddressString);

        if (v11)
        {
          objc_storeStrong((id *)&self->_bluetoothDevice, v9);
          if (dword_1000B7A40 <= 30
            && (dword_1000B7A40 != -1 || _LogCategory_Initialize(&dword_1000B7A40, 30)))
          {
            LogPrintF(&dword_1000B7A40, "-[HPHeadphoneEndCallManager isStatusUnknown]", 30, "end call manager with device:%@", self->_bluetoothDevice);
          }
          goto LABEL_14;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_14:

  v12 = (unsigned __int16)-[BluetoothDevice getCallManagementConfig](self->_bluetoothDevice, "getCallManagementConfig");
  if (!-[BluetoothDevice getAACPCapabilityBit:](self->_bluetoothDevice, "getAACPCapabilityBit:", 80)
    || (_BYTE)v12)
  {
    if (dword_1000B7A40 <= 30
      && (dword_1000B7A40 != -1 || _LogCategory_Initialize(&dword_1000B7A40, 30)))
    {
      LogPrintF(&dword_1000B7A40, "-[HPHeadphoneEndCallManager isStatusUnknown]", 30, "Device doesn't support end call or already set before, {_bluetoothDevice: %@}\n", self->_bluetoothDevice);
    }
    v13 = 0;
  }
  else
  {
    v13 = (v12 & 0xFE00) == 0;
  }

  return v13;
}

- (void)setConfigForSingleTap
{
  -[BluetoothDevice setCallConfig:](self->_bluetoothDevice, "setCallConfig:", 131584);
}

- (void)setConfigForDoubleTap
{
  -[BluetoothDevice setCallConfig:](self->_bluetoothDevice, "setCallConfig:", 197120);
}

- (void)setStatusToDone
{
  -[BluetoothDevice setCallConfig:](self->_bluetoothDevice, "setCallConfig:", 512);
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
