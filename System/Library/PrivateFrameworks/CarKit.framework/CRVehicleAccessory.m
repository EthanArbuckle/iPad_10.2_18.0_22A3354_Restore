@implementation CRVehicleAccessory

+ (int64_t)_transportTypeForExternalAccessoryTransportType:(int)a3
{
  if (a3 > 8)
    return 0;
  else
    return qword_1A83E7BE0[a3];
}

- (BOOL)isBluetoothConnected
{
  void *v2;
  BOOL v3;

  -[CRVehicleAccessory bluetoothAddress](self, "bluetoothAddress");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length") != 0;

  return v3;
}

- (id)displayName
{
  void *v3;
  void *v4;
  uint64_t v5;
  const __CFString *v6;

  -[CRVehicleAccessory vehicleName](self, "vehicleName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "length"))
  {
    -[CRVehicleAccessory bluetoothAddress](self, "bluetoothAddress");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "length");

    if (v5)
    {
      -[CRVehicleAccessory bluetoothAddress](self, "bluetoothAddress");
      v6 = (const __CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = &stru_1E542A520;
    }

    v3 = (void *)v6;
  }
  return v3;
}

- (NSString)description
{
  void *v3;
  __CFString *v4;
  int64_t v5;
  const __CFString *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[CRVehicleAccessory vehicleName](self, "vehicleName");
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v5 = -[CRVehicleAccessory transportType](self, "transportType");
  if ((unint64_t)(v5 - 1) > 3)
    v6 = CFSTR("unknown");
  else
    v6 = off_1E5429428[v5 - 1];
  if (v4)
    v7 = v4;
  else
    v7 = CFSTR("<unnamed>");
  -[CRVehicleAccessory accessoryProtocols](self, "accessoryProtocols");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRVehicleAccessory bluetoothAddress](self, "bluetoothAddress");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ (transport: %@, protocols: %@, bluetoothAddress: %@)"), v7, v6, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

- (NSString)radarDescription
{
  void *v3;
  int64_t v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  const __CFString *v17;
  void *v18;
  void *v19;

  -[CRVehicleAccessory accessory](self, "accessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)MEMORY[0x1E0CB3940];
  -[CRVehicleAccessory vehicleName](self, "vehicleName");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CRVehicleAccessory transportType](self, "transportType");
  if ((unint64_t)(v4 - 1) > 3)
    v5 = CFSTR("unknown");
  else
    v5 = off_1E5429428[v4 - 1];
  v17 = v5;
  objc_msgSend(v3, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "manufacturer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "modelNumber");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firmwareRevision");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hardwareRevision");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "serialNumber");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = CFSTR("YES");
  if (objc_msgSend(v3, "supportsWirelessCarPlay"))
    v13 = CFSTR("YES");
  else
    v13 = CFSTR("NO");
  if ((objc_msgSend(v3, "accessoryCapabilities") & 8) == 0)
    v12 = CFSTR("NO");
  objc_msgSend(v3, "ppid");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringWithFormat:", CFSTR("Name: %@\nTransport: %@\nAccessory Name: %@\nManufacturer: %@\nModel Number: %@\nFirmware Revision: %@\nHardware Revision: %@\nSerial Number: %@\nSupports Wireless: %@\nProvides Location: %@\nPPID: %@\n"), v19, v17, v6, v7, v8, v9, v10, v11, v13, v12, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v15;
}

- (NSDictionary)analyticsDescription
{
  void *v2;
  void *v3;
  void *v4;
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
  void *v15;
  void *v16;

  -[CRVehicleAccessory vehicleAccessoryInfoKeys](self, "vehicleAccessoryInfoKeys");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("name"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("name"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("name"));

  }
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("modelName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("modelName"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("modelName"));

  }
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("manufacturer"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("manufacturer"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("manufacturer"));

  }
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("ppid"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("ppid"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("ppid"));

  }
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("firmwareVersion"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("firmwareVersion"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("firmwareVersion"));

  }
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("hardwareVersion"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("hardwareVersion"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("hardwareVersion"));

  }
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v16;
}

- (NSDictionary)vehicleAccessoryInfoKeys
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v27;
  char v28;
  void *v29;
  void *v30;
  void *v31;
  uint8_t buf[16];

  -[CRVehicleAccessory vehicleInfoDataCache](self, "vehicleInfoDataCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRVehicleAccessory accessory](self, "accessory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    if (!objc_msgSend(v3, "count"))
    {
      objc_msgSend(v4, "vehicleInfoInitialData");
      v5 = objc_claimAutoreleasedReturnValue();

      v3 = (void *)v5;
    }
    goto LABEL_8;
  }
  -[CRVehicleAccessory vehicleAccessoryInfoKeysCache](self, "vehicleAccessoryInfoKeysCache");
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
LABEL_8:
    objc_msgSend(v4, "manufacturer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "modelNumber");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "serialNumber");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0CAA640]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ppid");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firmwareRevision");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "hardwareRevision");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v4, "destinationSharingOptions");
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v15;
    if (v9)
      objc_msgSend(v15, "setObject:forKey:", v9, CFSTR("manufacturer"));
    if (v10)
      objc_msgSend(v7, "setObject:forKey:", v10, CFSTR("modelName"));
    if (v11)
      objc_msgSend(v7, "setObject:forKey:", v11, CFSTR("name"));
    if (v14)
      objc_msgSend(v7, "setObject:forKey:", v14, CFSTR("firmwareVersion"));
    if (v31)
      objc_msgSend(v7, "setObject:forKey:", v31, CFSTR("hardwareVersion"));
    if (v12)
      objc_msgSend(v7, "setObject:forKey:", v12, CFSTR("serialNumber"));
    v30 = v13;
    if (v13)
    {
      v16 = objc_msgSend(v13, "unsignedIntegerValue");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v16 & 1);
      v27 = v12;
      v17 = v11;
      v18 = v10;
      v19 = v9;
      v20 = v3;
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKey:", v21, CFSTR("engineTypeGasoline"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v16 & 2);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKey:", v22, CFSTR("engineTypeDiesel"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v16 & 4);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKey:", v23, CFSTR("engineTypeElectric"));

      v3 = v20;
      v9 = v19;
      v10 = v18;
      v11 = v17;
      v12 = v27;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v16 & 8);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKey:", v24, CFSTR("engineTypeCNG"));

    }
    if (v29)
      objc_msgSend(v7, "setObject:forKey:", v29, CFSTR("ppid"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v28 & 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v25, CFSTR("destinationSharing"));

    -[CRVehicleAccessory setVehicleAccessoryInfoKeysCache:](self, "setVehicleAccessoryInfoKeysCache:", v7);
    goto LABEL_25;
  }
  v7 = (void *)v6;
  CarGeneralLogging();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A83A2000, v8, OS_LOG_TYPE_DEFAULT, "Falling back to cached vehicleAccessoryInfoKeys while accessory is not available", buf, 2u);
  }

LABEL_25:
  return (NSDictionary *)v7;
}

- (id)coreAccessoriesEndpointUUID
{
  void *v2;
  void *v3;

  -[CRVehicleAccessory accessory](self, "accessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "coreAccessoriesPrimaryUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)_updateName
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  BOOL v14;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[CRVehicleAccessory accessory](self, "accessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRVehicleAccessory vehicleInfoDataCache](self, "vehicleInfoDataCache");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0CAA638]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length"))
  {
    v6 = v5;
    if (!v5)
      goto LABEL_9;
  }
  else
  {
    objc_msgSend(v3, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    CarGeneralLogging();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 138412290;
      v17 = v6;
      _os_log_impl(&dword_1A83A2000, v7, OS_LOG_TYPE_DEFAULT, "Vehicle did not have display name, falling back to \"%@\", (uint8_t *)&v16, 0xCu);
    }

    if (!v6)
      goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "componentsSeparatedByCharactersInSet:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "componentsJoinedByString:", CFSTR(" "));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringByTrimmingCharactersInSet:", v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[CRVehicleAccessory vehicleName](self, "vehicleName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v6, "isEqualToString:", v12);

    if ((v13 & 1) == 0)
    {
      -[CRVehicleAccessory setVehicleName:](self, "setVehicleName:", v6);
      v14 = 1;
      goto LABEL_10;
    }
  }
LABEL_9:
  v14 = 0;
LABEL_10:

  return v14;
}

- (void)beginWiredBluetoothPairing:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  -[CRVehicleAccessory accessory](self, "accessory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __49__CRVehicleAccessory_beginWiredBluetoothPairing___block_invoke;
    v6[3] = &unk_1E5429338;
    v7 = v4;
    objc_msgSend(v5, "beginOOBBTPairingWithCompletionBlock:", v6);

  }
  else if (v4)
  {
    (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, 0, 0);
  }

}

void __49__CRVehicleAccessory_beginWiredBluetoothPairing___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  _DWORD v8[2];
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  CarGeneralLogging();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109378;
    v8[1] = a2;
    v9 = 2112;
    v10 = v5;
    _os_log_impl(&dword_1A83A2000, v6, OS_LOG_TYPE_DEFAULT, "beginOOBBTPairingWithCompletionBlock %i %@", (uint8_t *)v8, 0x12u);
  }

  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, BOOL, id))(v7 + 16))(v7, a2 == 0, v5);

}

- (void)requestWiFiCredentials
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  CarGeneralLogging();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1A83A2000, v3, OS_LOG_TYPE_DEFAULT, "requesting WiFi credentials", v5, 2u);
  }

  -[CRVehicleAccessory accessory](self, "accessory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "requestIAPAccessoryWiFiCredentials");

}

- (void)sendDeviceTransportIdentifiers
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MGGetStringAnswer();
  v4 = (void *)MGGetStringAnswer();
  CarGeneralLogging();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412546;
    v8 = v3;
    v9 = 2112;
    v10 = v4;
    _os_log_impl(&dword_1A83A2000, v5, OS_LOG_TYPE_DEFAULT, "sending device transport identifiers BT: %@ USB: %@", (uint8_t *)&v7, 0x16u);
  }

  -[CRVehicleAccessory accessory](self, "accessory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sendDeviceIdentifierNotification:usbIdentifier:", v3, v4);

}

- (void)sendWiredCarPlayAvailable:(id)a3 usbIdentifier:(id)a4 wirelessCarPlayAvailable:(id)a5 bluetoothIdentifier:(id)a6 themeAssetsAvailable:(id)a7
{
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  id v20;

  v12 = (void *)MEMORY[0x1E0CAA650];
  v13 = a7;
  v14 = a6;
  v15 = a5;
  v16 = a4;
  v17 = a3;
  objc_msgSend(v12, "sharedAccessoryManager");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  -[CRVehicleAccessory accessory](self, "accessory");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "coreAccessoriesPrimaryUUID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "sendWiredCarPlayAvailable:usbIdentifier:wirelessCarPlayAvailable:bluetoothIdentifier:themeAssetsAvailable:forUUID:", v17, v16, v15, v14, v13, v19);

}

- (NSString)vehicleName
{
  return self->_vehicleName;
}

- (void)setVehicleName:(id)a3
{
  objc_storeStrong((id *)&self->_vehicleName, a3);
}

- (NSString)vehicleModelName
{
  return self->_vehicleModelName;
}

- (void)setVehicleModelName:(id)a3
{
  objc_storeStrong((id *)&self->_vehicleModelName, a3);
}

- (NSData)certificateSerialNumber
{
  return self->_certificateSerialNumber;
}

- (void)setCertificateSerialNumber:(id)a3
{
  objc_storeStrong((id *)&self->_certificateSerialNumber, a3);
}

- (NSArray)accessoryProtocols
{
  return self->_accessoryProtocols;
}

- (void)setAccessoryProtocols:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryProtocols, a3);
}

- (NSString)bluetoothAddress
{
  return self->_bluetoothAddress;
}

- (void)setBluetoothAddress:(id)a3
{
  objc_storeStrong((id *)&self->_bluetoothAddress, a3);
}

- (int64_t)transportType
{
  return self->_transportType;
}

- (void)setTransportType:(int64_t)a3
{
  self->_transportType = a3;
}

- (NSNumber)connectionID
{
  return self->_connectionID;
}

- (void)setConnectionID:(id)a3
{
  objc_storeStrong((id *)&self->_connectionID, a3);
}

- (BOOL)supportsUSBCarPlay
{
  return self->_supportsUSBCarPlay;
}

- (void)setSupportsUSBCarPlay:(BOOL)a3
{
  self->_supportsUSBCarPlay = a3;
}

- (BOOL)supportsWirelessCarPlay
{
  return self->_supportsWirelessCarPlay;
}

- (void)setSupportsWirelessCarPlay:(BOOL)a3
{
  self->_supportsWirelessCarPlay = a3;
}

- (BOOL)supportsWiredBluetoothPairing
{
  return self->_supportsWiredBluetoothPairing;
}

- (void)setSupportsWiredBluetoothPairing:(BOOL)a3
{
  self->_supportsWiredBluetoothPairing = a3;
}

- (BOOL)supportsCarPlayConnectionRequest
{
  return self->_supportsCarPlayConnectionRequest;
}

- (void)setSupportsCarPlayConnectionRequest:(BOOL)a3
{
  self->_supportsCarPlayConnectionRequest = a3;
}

- (BOOL)supportsBluetoothLE
{
  return self->_supportsBluetoothLE;
}

- (void)setSupportsBluetoothLE:(BOOL)a3
{
  self->_supportsBluetoothLE = a3;
}

- (BOOL)supportsThemeAssets
{
  return self->_supportsThemeAssets;
}

- (void)setSupportsThemeAssets:(BOOL)a3
{
  self->_supportsThemeAssets = a3;
}

- (BOOL)supportsEnhancedIntegration
{
  return self->_supportsEnhancedIntegration;
}

- (void)setSupportsEnhancedIntegration:(BOOL)a3
{
  self->_supportsEnhancedIntegration = a3;
}

- (EAAccessory)accessory
{
  return (EAAccessory *)objc_loadWeakRetained((id *)&self->_accessory);
}

- (void)setAccessory:(id)a3
{
  objc_storeWeak((id *)&self->_accessory, a3);
}

- (NSString)PPID
{
  return self->_PPID;
}

- (void)setPPID:(id)a3
{
  objc_storeStrong((id *)&self->_PPID, a3);
}

- (NSDictionary)vehicleInfoDataCache
{
  return self->_vehicleInfoDataCache;
}

- (void)setVehicleInfoDataCache:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSDictionary)vehicleAccessoryInfoKeysCache
{
  return self->_vehicleAccessoryInfoKeysCache;
}

- (void)setVehicleAccessoryInfoKeysCache:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSDictionary)digitalCarKeyInformation
{
  return self->_digitalCarKeyInformation;
}

- (void)setDigitalCarKeyInformation:(id)a3
{
  objc_storeStrong((id *)&self->_digitalCarKeyInformation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_digitalCarKeyInformation, 0);
  objc_storeStrong((id *)&self->_vehicleAccessoryInfoKeysCache, 0);
  objc_storeStrong((id *)&self->_vehicleInfoDataCache, 0);
  objc_storeStrong((id *)&self->_PPID, 0);
  objc_destroyWeak((id *)&self->_accessory);
  objc_storeStrong((id *)&self->_connectionID, 0);
  objc_storeStrong((id *)&self->_bluetoothAddress, 0);
  objc_storeStrong((id *)&self->_accessoryProtocols, 0);
  objc_storeStrong((id *)&self->_certificateSerialNumber, 0);
  objc_storeStrong((id *)&self->_vehicleModelName, 0);
  objc_storeStrong((id *)&self->_vehicleName, 0);
}

@end
