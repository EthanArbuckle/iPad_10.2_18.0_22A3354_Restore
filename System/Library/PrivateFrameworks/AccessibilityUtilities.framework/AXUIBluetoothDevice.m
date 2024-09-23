@implementation AXUIBluetoothDevice

- (AXUIBluetoothDevice)initWithDevice:(void *)a3 address:(id)a4 helper:(id)a5
{
  NSString *v8;
  id v9;
  AXUIBluetoothDevice *v10;
  NSString *address;
  objc_super v13;

  v8 = (NSString *)a4;
  v13.receiver = self;
  v13.super_class = (Class)AXUIBluetoothDevice;
  v9 = a5;
  v10 = -[AXUIBluetoothDevice init](&v13, sel_init);
  -[AXUIBluetoothDevice setDevice:](v10, "setDevice:", a3, v13.receiver, v13.super_class);
  address = v10->_address;
  v10->_address = v8;

  objc_storeWeak((id *)&v10->_helper, v9);
  return v10;
}

- (AXUIBluetoothDevice)initWithPeripheral:(id)a3 helper:(id)a4
{
  CBPeripheral *v6;
  id v7;
  AXUIBluetoothDevice *v8;
  CBPeripheral *peripheral;
  CBPeripheral *v10;
  void *v11;
  uint64_t v12;
  NSString *address;
  objc_super v15;

  v6 = (CBPeripheral *)a3;
  v15.receiver = self;
  v15.super_class = (Class)AXUIBluetoothDevice;
  v7 = a4;
  v8 = -[AXUIBluetoothDevice init](&v15, sel_init);
  peripheral = v8->_peripheral;
  v8->_peripheral = v6;
  v10 = v6;

  -[CBPeripheral identifier](v10, "identifier", v15.receiver, v15.super_class);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "UUIDString");
  v12 = objc_claimAutoreleasedReturnValue();
  address = v8->_address;
  v8->_address = (NSString *)v12;

  objc_storeWeak((id *)&v8->_helper, v7);
  return v8;
}

- (BOOL)isBTLEDevice
{
  return self->_peripheral != 0;
}

- (BOOL)isClassicDevice
{
  return self->_device != 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v5 = (_QWORD *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  v6 = -[NSString copyWithZone:](self->_name, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[NSString copyWithZone:](self->_address, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  v10 = -[CBPeripheral copyWithZone:](self->_peripheral, "copyWithZone:", a3);
  v11 = (void *)v5[4];
  v5[4] = v10;

  objc_msgSend(v5, "setDevice:", self->_device);
  return v5;
}

- (int64_t)compare:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;

  v4 = a3;
  -[AXUIBluetoothDevice name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "localizedCaseInsensitiveCompare:", v6);
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  AXUIBluetoothDevice *v4;
  BOOL v5;

  v4 = (AXUIBluetoothDevice *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[AXUIBluetoothDevice isEqualToDevice:](self, "isEqualToDevice:", v4);
  }

  return v5;
}

- (BOOL)isEqualToDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  if (!a3)
    return 0;
  v4 = a3;
  -[AXUIBluetoothDevice address](self, "address");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "address");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "isEqualToString:", v6);
  return (char)v4;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[AXUIBluetoothDevice address](self, "address");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)hasAddress:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[AXUIBluetoothDevice address](self, "address");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", v4);

  return v6;
}

- (void)device
{
  return self->_device;
}

- (void)setDevice:(void *)a3
{
  if (self->_device != a3)
    self->_device = (BTDeviceImpl *)a3;
}

- (void)clearName
{
  NSString *name;

  name = self->_name;
  self->_name = 0;

}

- (BOOL)isNameCached
{
  return self->_name != 0;
}

- (id)name
{
  NSString *name;
  NSString **p_name;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[32];

  v9[31] = *MEMORY[0x1E0C80C00];
  p_name = &self->_name;
  name = self->_name;
  if (name)
    return name;
  if (-[AXUIBluetoothDevice isClassicDevice](self, "isClassicDevice"))
  {
    if (!BTDeviceGetName())
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v9);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        v8 = v7;
        objc_storeStrong((id *)p_name, v7);
        return v8;
      }
    }
    if (BTDeviceGetDefaultName())
      -[AXUIBluetoothDevice address](self, "address");
    else
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[CBPeripheral name](self->_peripheral, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (id)address
{
  NSString *address;
  NSString *v4;
  NSString *v5;

  address = self->_address;
  if (!address)
  {
    AXUIAddressForBTDevice();
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    v5 = self->_address;
    self->_address = v4;

    address = self->_address;
  }
  return address;
}

- (id)identifier
{
  void *v3;
  void *v4;

  if (-[AXUIBluetoothDevice isBTLEDevice](self, "isBTLEDevice"))
  {
    -[CBPeripheral identifier](self->_peripheral, "identifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "UUIDString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[AXUIBluetoothDevice address](self, "address");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (int)type
{
  if (BTDeviceGetDeviceType())
    return 0;
  else
    return 0;
}

- (unsigned)majorClass
{
  if (BTDeviceGetDeviceClass())
    return 0;
  else
    return 0;
}

- (unsigned)minorClass
{
  if (BTDeviceGetDeviceClass())
    return 0;
  else
    return 0;
}

- (unsigned)deviceClass
{
  if (BTDeviceGetDeviceClass())
    return 0;
  else
    return 0;
}

- (unsigned)vendorId
{
  if (BTDeviceGetDeviceId())
    return 0;
  else
    return 0;
}

- (unsigned)productId
{
  if (BTDeviceGetDeviceId())
    return 0;
  else
    return 0;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXUIBluetoothDevice name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXUIBluetoothDevice address](self, "address");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@<%p>: name:'%@' address:'%@' BTDevice:%p, type:%d"), v5, self, v6, v7, self->_device, -[AXUIBluetoothDevice type](self, "type"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)paired
{
  id WeakRetained;
  void *v4;
  void *v5;
  char v6;

  if (-[AXUIBluetoothDevice isBTLEDevice](self, "isBTLEDevice"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_helper);
    objc_msgSend(WeakRetained, "centralManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "retrieveConnectedPeripheralsWithServices:allowAll:", 0, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "containsObject:", self->_peripheral);

    return v6;
  }
  else
  {
    BTDeviceGetPairingStatus();
    return 0;
  }
}

- (BOOL)connected
{
  if (-[AXUIBluetoothDevice isBTLEDevice](self, "isBTLEDevice"))
    return -[CBPeripheral isConnectedToSystem](self->_peripheral, "isConnectedToSystem");
  BTDeviceGetConnectedServices();
  return 0;
}

- (BOOL)connecting
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (-[AXUIBluetoothDevice isBTLEDevice](self, "isBTLEDevice"))
  {
    LOBYTE(v3) = -[CBPeripheral state](self->_peripheral, "state") == CBPeripheralStateConnecting;
  }
  else
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D03408]), "initWithDevice:address:", self->_device, self->_address);
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    objc_msgSend(MEMORY[0x1E0D03410], "sharedInstance", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "connectingDevices");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v3 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v3)
    {
      v7 = *(_QWORD *)v11;
      while (2)
      {
        for (i = 0; i != v3; ++i)
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(v6);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "isEqual:", v4) & 1) != 0)
          {
            LOBYTE(v3) = 1;
            goto LABEL_13;
          }
        }
        v3 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        if (v3)
          continue;
        break;
      }
    }
LABEL_13:

  }
  return v3;
}

- (unint64_t)connectedServices
{
  BTDeviceGetConnectedServices();
  return 0;
}

- (unint64_t)connectedServicesCount
{
  BTDeviceGetConnectedServices();
  return 0;
}

- (BOOL)isServiceSupported:(unsigned int)a3
{
  BTDeviceGetSupportedServices();
  return 0;
}

- (unsigned)authorizedServices
{
  AXUIBluetoothDevice *v2;
  id WeakRetained;

  v2 = self;
  WeakRetained = objc_loadWeakRetained((id *)&self->_helper);
  LODWORD(v2) = objc_msgSend(WeakRetained, "authorizedServicesForDevice:", v2);

  return v2;
}

- (void)connect
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_helper);
  objc_msgSend(WeakRetained, "connectDevice:", self);

}

- (void)connectWithServices:(unsigned int)a3
{
  uint64_t v3;
  id WeakRetained;

  v3 = *(_QWORD *)&a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_helper);
  objc_msgSend(WeakRetained, "connectDevice:withServices:", self, v3);

}

- (void)disconnect
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  NSObject *v7;
  os_log_type_t v8;
  void *v9;
  void *v10;
  void *v11;
  id WeakRetained;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (-[AXUIBluetoothDevice isBTLEDevice](self, "isBTLEDevice"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_helper);
    objc_msgSend(WeakRetained, "centralManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "cancelPeripheralConnection:options:", self->_peripheral, 0);

  }
  else if (BTDeviceDisconnect())
  {
    objc_msgSend(MEMORY[0x1E0CF39B0], "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "ignoreLogging");

    if ((v5 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CF39B0], "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      AXLoggerForFacility();
      v7 = objc_claimAutoreleasedReturnValue();

      v8 = AXOSLogLevelFromAXLogLevel();
      if (os_log_type_enabled(v7, v8))
      {
        AXColorizeFormatLog();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[AXUIBluetoothDevice name](self, "name");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        _AXStringForArgs();
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v7, v8))
        {
          *(_DWORD *)buf = 138543362;
          v14 = v10;
          _os_log_impl(&dword_18C62B000, v7, v8, "%{public}@", buf, 0xCu);
        }

      }
    }
  }
}

- (void)setPIN:(id)a3
{
  AXUIBluetoothHelper **p_helper;
  id v5;
  id WeakRetained;

  p_helper = &self->_helper;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_helper);
  objc_msgSend(WeakRetained, "setPincode:forDevice:", v5, self);

}

- (void)acceptSSP:(int)a3
{
  uint64_t v3;
  id WeakRetained;

  v3 = *(_QWORD *)&a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_helper);
  objc_msgSend(WeakRetained, "acceptSSP:forDevice:", v3, self);

}

- (void)unpair
{
  _BOOL4 v3;
  id WeakRetained;
  id v5;

  v3 = -[AXUIBluetoothDevice isBTLEDevice](self, "isBTLEDevice");
  WeakRetained = objc_loadWeakRetained((id *)&self->_helper);
  v5 = WeakRetained;
  if (v3)
    objc_msgSend(WeakRetained, "unpairBTLEDevice:", self);
  else
    objc_msgSend(WeakRetained, "unpairDevice:", self);

}

- (BOOL)isAppleHIDDevice
{
  if (-[AXUIBluetoothDevice vendorId](self, "vendorId") != 1452)
    return -[AXUIBluetoothDevice vendorId](self, "vendorId") == 76
        && (-[AXUIBluetoothDevice productId](self, "productId") == 613
         || -[AXUIBluetoothDevice productId](self, "productId") == 617);
  return -[AXUIBluetoothDevice productId](self, "productId") == 777
      || -[AXUIBluetoothDevice productId](self, "productId") == 780
      || -[AXUIBluetoothDevice productId](self, "productId") == 781
      || -[AXUIBluetoothDevice productId](self, "productId") == 782
      || -[AXUIBluetoothDevice productId](self, "productId") == 784;
}

- (CBPeripheral)peripheral
{
  return self->_peripheral;
}

- (void)setPeripheral:(id)a3
{
  objc_storeStrong((id *)&self->_peripheral, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_helper);
  objc_storeStrong((id *)&self->_peripheral, 0);
  objc_storeStrong((id *)&self->_address, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
