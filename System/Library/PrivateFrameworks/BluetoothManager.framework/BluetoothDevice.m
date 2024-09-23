@implementation BluetoothDevice

- (BluetoothDevice)initWithDevice:(BTDeviceImpl *)a3 address:(id)a4
{
  BluetoothDevice *v6;
  BluetoothDevice *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)BluetoothDevice;
  v6 = -[BluetoothDevice init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    -[BluetoothDevice setDevice:](v6, "setDevice:", a3);
    v7->_address = (NSString *)a4;
    v7->_connectingServiceMask = 0;
  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BluetoothDevice;
  -[BluetoothDevice dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;

  v5 = (_QWORD *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  v5[1] = -[NSString copyWithZone:](self->_name, "copyWithZone:", a3);
  v5[3] = -[NSString copyWithZone:](self->_address, "copyWithZone:", a3);
  objc_msgSend(v5, "setDevice:", self->_device);
  return v5;
}

- (int64_t)compare:(id)a3
{
  return objc_msgSend(-[BluetoothDevice name](self, "name"), "compare:options:", objc_msgSend(a3, "name"), 1);
}

- (BTDeviceImpl)device
{
  return self->_device;
}

- (void)setDevice:(BTDeviceImpl *)a3
{
  if (self->_device != a3)
    self->_device = a3;
}

- (void)_clearName
{

  self->_name = 0;
}

- (BOOL)_isNameCached
{
  return self->_name != 0;
}

- (id)name
{
  NSString *name;
  NSString *v5;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  name = self->_name;
  if (!name)
  {
    v22 = 0;
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    v7 = 0u;
    if (BTDeviceGetName()
      || (v5 = (NSString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", &v7)) == 0)
    {
      if (BTDeviceGetDefaultName())
        return -[BluetoothDevice address](self, "address", v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23);
      else
        return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", &v7);
    }
    else
    {
      name = v5;
      self->_name = v5;
    }
  }
  return name;
}

- (id)productName
{
  NSString *productName;
  NSString *v4;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  productName = self->_productName;
  if (!productName)
  {
    v21 = 0;
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v7 = 0u;
    v8 = 0u;
    v6 = 0u;
    if (BTDeviceGetProductName())
      return -[BluetoothDevice address](self, "address", v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22);
    v4 = (NSString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", &v6);
    if (!v4)
    {
      return -[BluetoothDevice address](self, "address", v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22);
    }
    else
    {
      productName = v4;
      self->_productName = v4;
    }
  }
  return productName;
}

- (id)address
{
  id result;

  result = self->_address;
  if (!result)
  {
    result = (id)AddressForBTDevice();
    self->_address = (NSString *)result;
  }
  return result;
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

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("\"%@\" %@"), -[BluetoothDevice name](self, "name"), -[BluetoothDevice address](self, "address"));
}

- (id)scoUID
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), -[BluetoothDevice address](self, "address"), CFSTR("-tsco"));
}

- (id)aclUID
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), -[BluetoothDevice address](self, "address"), CFSTR("-tacl"));
}

- (unsigned)vendorId
{
  if (BTDeviceGetDeviceId())
    return 0;
  else
    return 0;
}

- (unsigned)vendorIdSrc
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

- (BOOL)paired
{
  BTDeviceGetPairingStatus();
  return 0;
}

- (BOOL)cloudPaired
{
  BTDeviceGetCloudPairingStatus();
  return 0;
}

- (BOOL)magicPaired
{
  BTDeviceGetMagicPairingStatus();
  return 0;
}

- (BOOL)connected
{
  BTDeviceGetConnectedServices();
  return 0;
}

- (BOOL)isTemporaryPaired
{
  BTDeviceIsTemporaryPaired();
  return 0;
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

- (BOOL)supportsBatteryLevel
{
  -[BluetoothManager _accessoryManager](+[BluetoothManager sharedInstance](BluetoothManager, "sharedInstance"), "_accessoryManager");
  -[BluetoothDevice device](self, "device");
  return BTAccessoryManagerGetDeviceBatteryLevel() == 0;
}

- (int)batteryLevel
{
  -[BluetoothManager _accessoryManager](+[BluetoothManager sharedInstance](BluetoothManager, "sharedInstance"), "_accessoryManager");
  -[BluetoothDevice device](self, "device");
  if (BTAccessoryManagerGetDeviceBatteryLevel())
    return -1;
  else
    return 0;
}

- (BOOL)batteryStatus:(id *)a3
{
  _BOOL4 v4;
  NSObject *v5;

  if (a3)
  {
    -[BluetoothManager _accessoryManager](+[BluetoothManager sharedInstance](BluetoothManager, "sharedInstance"), "_accessoryManager");
    -[BluetoothDevice device](self, "device");
    LOBYTE(v4) = BTAccessoryManagerGetDeviceBatteryStatus() == 0;
  }
  else
  {
    v5 = sharedBluetoothManagerLogComponent();
    v4 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);
    if (v4)
    {
      -[BluetoothDevice batteryStatus:].cold.1();
      LOBYTE(v4) = 0;
    }
  }
  return v4;
}

- (int)primaryBudSide:(int *)a3
{
  -[BluetoothManager _accessoryManager](+[BluetoothManager sharedInstance](BluetoothManager, "sharedInstance"), "_accessoryManager");
  -[BluetoothDevice device](self, "device");
  return BTAccessoryManagerGetPrimaryBudSide();
}

- (BOOL)setIsHidden:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  const char *v6;
  int IsHidden;
  NSObject *v8;
  int v10;
  const char *v11;
  uint64_t v12;

  v3 = a3;
  v12 = *MEMORY[0x24BDAC8D0];
  v5 = sharedBluetoothManagerLogComponent();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = "no";
    if (v3)
      v6 = "yes";
    v10 = 136315138;
    v11 = v6;
    _os_log_impl(&dword_20847A000, v5, OS_LOG_TYPE_INFO, "Set isHidden : %s", (uint8_t *)&v10, 0xCu);
  }
  -[BluetoothManager _accessoryManager](+[BluetoothManager sharedInstance](BluetoothManager, "sharedInstance"), "_accessoryManager");
  -[BluetoothDevice device](self, "device");
  IsHidden = BTAccessoryManagerSetIsHidden();
  if (IsHidden)
  {
    v8 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[BluetoothDevice setIsHidden:].cold.1();
  }
  return IsHidden == 0;
}

- (BOOL)inEarDetectEnabled
{
  int v3;
  NSObject *v4;
  NSObject *v5;
  uint8_t buf[4];
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  -[BluetoothManager _accessoryManager](+[BluetoothManager sharedInstance](BluetoothManager, "sharedInstance"), "_accessoryManager");
  -[BluetoothDevice device](self, "device");
  v3 = BTAccessoryManagerGetInEarDetectionEnable();
  v4 = sharedBluetoothManagerLogComponent();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[BluetoothDevice inEarDetectEnabled].cold.1();
    return 1;
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      v8 = 1;
      _os_log_impl(&dword_20847A000, v5, OS_LOG_TYPE_INFO, "inEarDetectEnabled : %d", buf, 8u);
    }
    return 1;
  }
}

- (BOOL)setInEarDetectEnabled:(BOOL)a3
{
  int v4;
  NSObject *v5;
  int v6;
  NSObject *v7;
  _DWORD v9[2];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a3 << 31 >> 31;
  v5 = sharedBluetoothManagerLogComponent();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v9[0] = 67109120;
    v9[1] = v4;
    _os_log_impl(&dword_20847A000, v5, OS_LOG_TYPE_INFO, "Set inEarDetectEnabled : %d", (uint8_t *)v9, 8u);
  }
  -[BluetoothManager _accessoryManager](+[BluetoothManager sharedInstance](BluetoothManager, "sharedInstance"), "_accessoryManager");
  -[BluetoothDevice device](self, "device");
  v6 = BTAccessoryManagerSetInEarDetectionEnable();
  if (v6)
  {
    v7 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[BluetoothDevice setInEarDetectEnabled:].cold.1();
  }
  return v6 == 0;
}

- (BOOL)setSpatialAudioAllowed:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  int v6;
  NSObject *v7;
  _DWORD v9[2];
  uint64_t v10;

  v3 = a3;
  v10 = *MEMORY[0x24BDAC8D0];
  v5 = sharedBluetoothManagerLogComponent();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109120;
    v9[1] = v3;
    _os_log_impl(&dword_20847A000, v5, OS_LOG_TYPE_DEFAULT, "Set setSpatialAudioAllowed : %d", (uint8_t *)v9, 8u);
  }
  -[BluetoothManager _accessoryManager](+[BluetoothManager sharedInstance](BluetoothManager, "sharedInstance"), "_accessoryManager");
  -[BluetoothDevice device](self, "device");
  v6 = BTAccessoryManagerSpatialAudioAllowed();
  if (v6)
  {
    v7 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[BluetoothDevice setSpatialAudioAllowed:].cold.1();
  }
  return v6 == 0;
}

- (BOOL)spatialAudioAllowed
{
  int SpatialAudioAllowed;
  NSObject *v4;
  NSObject *v5;
  _BOOL4 v6;
  uint8_t buf[4];
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  -[BluetoothManager _accessoryManager](+[BluetoothManager sharedInstance](BluetoothManager, "sharedInstance"), "_accessoryManager");
  -[BluetoothDevice device](self, "device");
  SpatialAudioAllowed = BTAccessoryManagerGetSpatialAudioAllowed();
  v4 = sharedBluetoothManagerLogComponent();
  v5 = v4;
  if (SpatialAudioAllowed)
  {
    v6 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);
    if (v6)
    {
      -[BluetoothDevice spatialAudioAllowed].cold.1();
      LOBYTE(v6) = 0;
    }
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      v9 = 0;
      _os_log_impl(&dword_20847A000, v5, OS_LOG_TYPE_INFO, "Spatial Audio User selection : %d", buf, 8u);
    }
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (BOOL)spatialAudioActive
{
  int SpatialAudioActive;
  NSObject *v4;
  NSObject *v5;
  _BOOL4 v6;
  uint8_t buf[4];
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  -[BluetoothManager _accessoryManager](+[BluetoothManager sharedInstance](BluetoothManager, "sharedInstance"), "_accessoryManager");
  -[BluetoothDevice device](self, "device");
  SpatialAudioActive = BTAccessoryManagerGetSpatialAudioActive();
  v4 = sharedBluetoothManagerLogComponent();
  v5 = v4;
  if (SpatialAudioActive)
  {
    v6 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);
    if (v6)
    {
      -[BluetoothDevice spatialAudioAllowed].cold.1();
      LOBYTE(v6) = 0;
    }
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      v9 = 0;
      _os_log_impl(&dword_20847A000, v5, OS_LOG_TYPE_INFO, "Spatial Audio Active  : %d", buf, 8u);
    }
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (BOOL)setSpatialAudioMode:(unsigned __int8)a3
{
  int v3;
  NSObject *v5;
  int v6;
  NSObject *v7;
  _DWORD v9[2];
  uint64_t v10;

  v3 = a3;
  v10 = *MEMORY[0x24BDAC8D0];
  v5 = sharedBluetoothManagerLogComponent();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v9[0] = 67109120;
    v9[1] = v3;
    _os_log_impl(&dword_20847A000, v5, OS_LOG_TYPE_INFO, "Set SpatialAudioMode : %d", (uint8_t *)v9, 8u);
  }
  -[BluetoothManager _accessoryManager](+[BluetoothManager sharedInstance](BluetoothManager, "sharedInstance"), "_accessoryManager");
  -[BluetoothDevice device](self, "device");
  v6 = BTAccessoryManagerSpatialAudioConfig();
  if (v6)
  {
    v7 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[BluetoothDevice setSpatialAudioMode:].cold.1();
  }
  return v6 == 0;
}

- (unsigned)spatialAudioMode
{
  int SpatialAudioConfig;
  NSObject *v4;
  NSObject *v5;
  uint8_t buf[4];
  int v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  -[BluetoothManager _accessoryManager](+[BluetoothManager sharedInstance](BluetoothManager, "sharedInstance"), "_accessoryManager");
  -[BluetoothDevice device](self, "device");
  SpatialAudioConfig = BTAccessoryManagerGetSpatialAudioConfig();
  v4 = sharedBluetoothManagerLogComponent();
  v5 = v4;
  if (SpatialAudioConfig)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[BluetoothDevice spatialAudioMode].cold.1();
    return 0;
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      v9 = 255;
      v10 = 1024;
      v11 = -1;
      _os_log_impl(&dword_20847A000, v5, OS_LOG_TYPE_DEFAULT, "Spatial Audio : %d Head Tracking %d", buf, 0xEu);
    }
    return -1;
  }
}

- (BOOL)setSpatialAudioConfig:(id)a3 spatialMode:(int)a4 headTracking:(BOOL)a5
{
  _BOOL4 v5;
  NSObject *v9;
  NSObject *v10;
  _BOOL4 v11;
  int v13;
  id v14;
  __int16 v15;
  int v16;
  __int16 v17;
  _BOOL4 v18;
  uint64_t v19;

  v5 = a5;
  v19 = *MEMORY[0x24BDAC8D0];
  v9 = sharedBluetoothManagerLogComponent();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138412802;
    v14 = a3;
    v15 = 1024;
    v16 = a4;
    v17 = 1024;
    v18 = v5;
    _os_log_impl(&dword_20847A000, v9, OS_LOG_TYPE_DEFAULT, "set Spatial Audio Config : [%@] %d head Tracking %d", (uint8_t *)&v13, 0x18u);
  }
  if (!a3)
    goto LABEL_7;
  objc_msgSend(a3, "UTF8String");
  -[BluetoothManager _accessoryManager](+[BluetoothManager sharedInstance](BluetoothManager, "sharedInstance"), "_accessoryManager");
  -[BluetoothDevice device](self, "device");
  if (!BTAccessoryManagerSpatialAudioConfig())
  {
    LOBYTE(v11) = 1;
    return v11;
  }
  v10 = sharedBluetoothManagerLogComponent();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
  if (v11)
  {
    -[BluetoothDevice setSpatialAudioMode:].cold.1();
LABEL_7:
    LOBYTE(v11) = 0;
  }
  return v11;
}

- (BOOL)headTrackingAvailable
{
  return 1;
}

- (BOOL)spatialAudioConfig:(id)a3 spatialMode:(int *)a4 headTracking:(BOOL *)a5
{
  NSObject *v9;
  _BOOL4 v10;
  NSObject *v11;
  int v12;
  _BOOL4 v13;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  int v18;
  __int16 v19;
  _BOOL4 v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  *a4 = 255;
  if (!a3)
    goto LABEL_5;
  objc_msgSend(a3, "UTF8String");
  -[BluetoothManager _accessoryManager](+[BluetoothManager sharedInstance](BluetoothManager, "sharedInstance"), "_accessoryManager");
  -[BluetoothDevice device](self, "device");
  if (BTAccessoryManagerGetSpatialAudioConfig())
  {
    v9 = sharedBluetoothManagerLogComponent();
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (v10)
    {
      -[BluetoothDevice spatialAudioMode].cold.1();
LABEL_5:
      LOBYTE(v10) = 0;
    }
  }
  else
  {
    *a5 = 1;
    v11 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = *a4;
      v13 = *a5;
      *(_DWORD *)buf = 138412802;
      v16 = a3;
      v17 = 1024;
      v18 = v12;
      v19 = 1024;
      v20 = v13;
      _os_log_impl(&dword_20847A000, v11, OS_LOG_TYPE_DEFAULT, "get SpatialAudio Config : [%@] %d Head Tracking %d", buf, 0x18u);
    }
    LOBYTE(v10) = 1;
  }
  return v10;
}

- (BOOL)setSmartRouteMode:(unsigned __int8)a3
{
  int v3;
  NSObject *v5;
  int v6;
  NSObject *v7;
  _DWORD v9[2];
  uint64_t v10;

  v3 = a3;
  v10 = *MEMORY[0x24BDAC8D0];
  v5 = sharedBluetoothManagerLogComponent();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v9[0] = 67109120;
    v9[1] = v3;
    _os_log_impl(&dword_20847A000, v5, OS_LOG_TYPE_INFO, "Set smartRouteMode : %d", (uint8_t *)v9, 8u);
  }
  -[BluetoothManager _accessoryManager](+[BluetoothManager sharedInstance](BluetoothManager, "sharedInstance"), "_accessoryManager");
  -[BluetoothDevice device](self, "device");
  v6 = BTAccessoryManagerSmartRouteMode();
  if (v6)
  {
    v7 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[BluetoothDevice setSmartRouteMode:].cold.1();
  }
  return v6 == 0;
}

- (unsigned)smartRouteMode
{
  int SmartRouteMode;
  NSObject *v4;
  NSObject *v5;
  uint8_t buf[4];
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  -[BluetoothManager _accessoryManager](+[BluetoothManager sharedInstance](BluetoothManager, "sharedInstance"), "_accessoryManager");
  -[BluetoothDevice device](self, "device");
  SmartRouteMode = BTAccessoryManagerGetSmartRouteMode();
  v4 = sharedBluetoothManagerLogComponent();
  v5 = v4;
  if (SmartRouteMode)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[BluetoothDevice smartRouteMode].cold.1();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v8 = "Manual";
    _os_log_impl(&dword_20847A000, v5, OS_LOG_TYPE_INFO, "smart Routing : %s", buf, 0xCu);
  }
  return 2;
}

- (BOOL)smartRouteSupport
{
  NSObject *v3;
  uint8_t buf[4];
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  -[BluetoothManager _accessoryManager](+[BluetoothManager sharedInstance](BluetoothManager, "sharedInstance"), "_accessoryManager");
  -[BluetoothDevice device](self, "device");
  BTAccessoryManagerGetSmartRouteSupport();
  v3 = sharedBluetoothManagerLogComponent();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v6 = "NOT Supported";
    _os_log_impl(&dword_20847A000, v3, OS_LOG_TYPE_INFO, "Smart Routing : %s", buf, 0xCu);
  }
  return 0;
}

- (BOOL)inEarStatusPrimary:(int *)a3 secondary:(int *)a4
{
  int v7;
  NSObject *v8;
  NSObject *v9;
  int v10;
  int v11;
  _DWORD v13[2];
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  *a3 = 3;
  *a4 = 3;
  -[BluetoothManager _accessoryManager](+[BluetoothManager sharedInstance](BluetoothManager, "sharedInstance"), "_accessoryManager");
  -[BluetoothDevice device](self, "device");
  v7 = BTAccessoryManagerGetInEarStatus();
  v8 = sharedBluetoothManagerLogComponent();
  v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[BluetoothDevice inEarStatusPrimary:secondary:].cold.1();
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = *a3;
    v11 = *a4;
    v13[0] = 67109376;
    v13[1] = v10;
    v14 = 1024;
    v15 = v11;
    _os_log_impl(&dword_20847A000, v9, OS_LOG_TYPE_DEFAULT, "Retrieved inEarStatus Primary : %u, Secondary : %u", (uint8_t *)v13, 0xEu);
  }
  return v7 == 0;
}

- (unsigned)SendSetupCommand:(unsigned __int8)a3
{
  NSObject *v4;
  const char *v5;
  uint8_t *v6;
  uint64_t v8;
  __int16 v9;

  if (a3 == 3)
  {
    v4 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v8) = 0;
      v5 = "SendSetupCommand Stop";
      v6 = (uint8_t *)&v8;
      goto LABEL_7;
    }
LABEL_8:
    -[BluetoothManager _accessoryManager](+[BluetoothManager sharedInstance](BluetoothManager, "sharedInstance", v8), "_accessoryManager");
    -[BluetoothDevice device](self, "device");
    return BTAccessoryManagerSetupCommand();
  }
  if (a3 == 1)
  {
    v4 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 0;
      v5 = "SendSetupCommand Start";
      v6 = (uint8_t *)&v9;
LABEL_7:
      _os_log_impl(&dword_20847A000, v4, OS_LOG_TYPE_DEFAULT, v5, v6, 2u);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  return 0;
}

- (unsigned)micMode
{
  int MicMode;
  NSObject *v4;
  NSObject *v5;
  uint8_t buf[4];
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  -[BluetoothManager _accessoryManager](+[BluetoothManager sharedInstance](BluetoothManager, "sharedInstance"), "_accessoryManager");
  -[BluetoothDevice device](self, "device");
  MicMode = BTAccessoryManagerGetMicMode();
  v4 = sharedBluetoothManagerLogComponent();
  v5 = v4;
  if (MicMode)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[BluetoothDevice micMode].cold.1();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    v8 = 0;
    _os_log_impl(&dword_20847A000, v5, OS_LOG_TYPE_INFO, "micMode : %d", buf, 8u);
  }
  return 0;
}

- (BOOL)setMicMode:(unsigned int)a3
{
  NSObject *v5;
  int v6;
  NSObject *v7;
  _DWORD v9[2];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v5 = sharedBluetoothManagerLogComponent();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v9[0] = 67109120;
    v9[1] = a3;
    _os_log_impl(&dword_20847A000, v5, OS_LOG_TYPE_INFO, "Set micMode : %d", (uint8_t *)v9, 8u);
  }
  -[BluetoothManager _accessoryManager](+[BluetoothManager sharedInstance](BluetoothManager, "sharedInstance"), "_accessoryManager");
  -[BluetoothDevice device](self, "device");
  v6 = BTAccessoryManagerSetMicMode();
  if (v6)
  {
    v7 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[BluetoothDevice setMicMode:].cold.1();
  }
  return v6 == 0;
}

- (unsigned)doubleTapAction
{
  NSObject *v3;
  NSObject *v4;
  uint8_t buf[4];
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  -[BluetoothManager _accessoryManager](+[BluetoothManager sharedInstance](BluetoothManager, "sharedInstance"), "_accessoryManager");
  -[BluetoothDevice device](self, "device");
  if (BTAccessoryManagerGetDoubleTapAction())
  {
    v3 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      -[BluetoothDevice doubleTapAction].cold.1();
  }
  v4 = sharedBluetoothManagerLogComponent();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    v7 = 1;
    _os_log_impl(&dword_20847A000, v4, OS_LOG_TYPE_INFO, "doubleTapAction : %d", buf, 8u);
  }
  return 1;
}

- (BOOL)setDoubleTapAction:(unsigned int)a3
{
  NSObject *v5;
  int v6;
  NSObject *v7;
  _DWORD v9[2];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v5 = sharedBluetoothManagerLogComponent();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v9[0] = 67109120;
    v9[1] = a3;
    _os_log_impl(&dword_20847A000, v5, OS_LOG_TYPE_INFO, "Set doubleTapAction : %d", (uint8_t *)v9, 8u);
  }
  -[BluetoothManager _accessoryManager](+[BluetoothManager sharedInstance](BluetoothManager, "sharedInstance"), "_accessoryManager");
  -[BluetoothDevice device](self, "device");
  v6 = BTAccessoryManagerSetDoubleTapAction();
  if (v6)
  {
    v7 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[BluetoothDevice setDoubleTapAction:].cold.1();
  }
  return v6 == 0;
}

- (unsigned)doubleTapCapability
{
  NSObject *v3;
  NSObject *v4;
  uint8_t buf[4];
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  -[BluetoothManager _accessoryManager](+[BluetoothManager sharedInstance](BluetoothManager, "sharedInstance"), "_accessoryManager");
  -[BluetoothDevice device](self, "device");
  if (BTAccessoryManagerGetDoubleTapCapability())
  {
    v3 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      -[BluetoothDevice doubleTapCapability].cold.1();
  }
  v4 = sharedBluetoothManagerLogComponent();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    v7 = 0;
    _os_log_impl(&dword_20847A000, v4, OS_LOG_TYPE_INFO, "doubleTapCapability : %d", buf, 8u);
  }
  return 0;
}

- (BOOL)featureCapability:(int)a3
{
  NSObject *v5;
  NSObject *v6;
  uint8_t buf[4];
  int v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  -[BluetoothManager _accessoryManager](+[BluetoothManager sharedInstance](BluetoothManager, "sharedInstance"), "_accessoryManager");
  -[BluetoothDevice device](self, "device");
  if (BTAccessoryManagerGetFeatureCapability())
  {
    v5 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[BluetoothDevice featureCapability:].cold.1();
  }
  v6 = sharedBluetoothManagerLogComponent();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109376;
    v9 = a3;
    v10 = 1024;
    v11 = 0;
    _os_log_impl(&dword_20847A000, v6, OS_LOG_TYPE_INFO, "%d capability : %d", buf, 0xEu);
  }
  return 0;
}

- (unsigned)doubleTapActionEx:(unsigned int *)a3 rightAction:(unsigned int *)a4
{
  unsigned int DoubleTapAction;
  NSObject *v8;
  NSObject *v9;
  unsigned int v10;
  unsigned int v11;
  _DWORD v13[2];
  __int16 v14;
  unsigned int v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  -[BluetoothManager _accessoryManager](+[BluetoothManager sharedInstance](BluetoothManager, "sharedInstance"), "_accessoryManager");
  -[BluetoothDevice device](self, "device");
  DoubleTapAction = BTAccessoryManagerGetDoubleTapActionEx();
  if (DoubleTapAction)
  {
    v8 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[BluetoothDevice doubleTapActionEx:rightAction:].cold.1();
  }
  v9 = sharedBluetoothManagerLogComponent();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = *a3;
    v11 = *a4;
    v13[0] = 67109376;
    v13[1] = v10;
    v14 = 1024;
    v15 = v11;
    _os_log_impl(&dword_20847A000, v9, OS_LOG_TYPE_INFO, "doubleTapActionEx Left : %d, Right : %d", (uint8_t *)v13, 0xEu);
  }
  return DoubleTapAction;
}

- (BOOL)setDoubleTapActionEx:(unsigned int)a3 rightAction:(unsigned int)a4
{
  NSObject *v7;
  int v8;
  NSObject *v9;
  _DWORD v11[2];
  __int16 v12;
  unsigned int v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v7 = sharedBluetoothManagerLogComponent();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v11[0] = 67109376;
    v11[1] = a3;
    v12 = 1024;
    v13 = a4;
    _os_log_impl(&dword_20847A000, v7, OS_LOG_TYPE_INFO, "Set doubleTapActionEx Left : %d, Right : %d", (uint8_t *)v11, 0xEu);
  }
  -[BluetoothManager _accessoryManager](+[BluetoothManager sharedInstance](BluetoothManager, "sharedInstance"), "_accessoryManager");
  -[BluetoothDevice device](self, "device");
  v8 = BTAccessoryManagerSetDoubleTapActionEx();
  if (v8)
  {
    v9 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[BluetoothDevice setDoubleTapActionEx:rightAction:].cold.1();
  }
  return v8 == 0;
}

- (unsigned)listeningMode
{
  NSObject *v3;
  NSObject *v4;
  uint8_t buf[4];
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  -[BluetoothManager _accessoryManager](+[BluetoothManager sharedInstance](BluetoothManager, "sharedInstance"), "_accessoryManager");
  -[BluetoothDevice device](self, "device");
  if (BTAccessoryManagerGetControlCommand())
  {
    v3 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      -[BluetoothDevice listeningMode].cold.1();
  }
  v4 = sharedBluetoothManagerLogComponent();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    v7 = 0;
    _os_log_impl(&dword_20847A000, v4, OS_LOG_TYPE_INFO, "listening mode : %d", buf, 8u);
  }
  return 0;
}

- (BOOL)setListeningMode:(unsigned int)a3
{
  NSObject *v5;
  int v6;
  NSObject *v7;
  _DWORD v9[2];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v5 = sharedBluetoothManagerLogComponent();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v9[0] = 67109120;
    v9[1] = a3;
    _os_log_impl(&dword_20847A000, v5, OS_LOG_TYPE_INFO, "Set listening mode : %d", (uint8_t *)v9, 8u);
  }
  -[BluetoothManager _accessoryManager](+[BluetoothManager sharedInstance](BluetoothManager, "sharedInstance"), "_accessoryManager");
  -[BluetoothDevice device](self, "device");
  v6 = BTAccessoryManagerSendControlCommand();
  if (v6)
  {
    v7 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[BluetoothDevice setListeningMode:].cold.1();
  }
  return v6 == 0;
}

- (BOOL)setHeartRateMonitorEnabled:(unsigned int)a3
{
  NSObject *v5;
  int v6;
  NSObject *v7;
  _DWORD v9[2];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v5 = sharedBluetoothManagerLogComponent();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v9[0] = 67109120;
    v9[1] = a3;
    _os_log_impl(&dword_20847A000, v5, OS_LOG_TYPE_INFO, "Set Heart Rate Monitor State : %d", (uint8_t *)v9, 8u);
  }
  -[BluetoothManager _accessoryManager](+[BluetoothManager sharedInstance](BluetoothManager, "sharedInstance"), "_accessoryManager");
  -[BluetoothDevice device](self, "device");
  v6 = BTAccessoryManagerSendControlCommand();
  if (v6)
  {
    v7 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[BluetoothDevice setHeartRateMonitorEnabled:].cold.1();
  }
  return v6 == 0;
}

- (unsigned)getHeartRateMonitorEnabled
{
  NSObject *v3;
  NSObject *v4;
  uint8_t buf[4];
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  -[BluetoothManager _accessoryManager](+[BluetoothManager sharedInstance](BluetoothManager, "sharedInstance"), "_accessoryManager");
  -[BluetoothDevice device](self, "device");
  if (BTAccessoryManagerGetControlCommand())
  {
    v3 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      -[BluetoothDevice getHeartRateMonitorEnabled].cold.1();
  }
  v4 = sharedBluetoothManagerLogComponent();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    v7 = 0;
    _os_log_impl(&dword_20847A000, v4, OS_LOG_TYPE_INFO, "HRM state : %d", buf, 8u);
  }
  return 0;
}

- (unsigned)listeningModeConfigs
{
  NSObject *v3;
  NSObject *v4;
  uint8_t buf[4];
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  -[BluetoothManager _accessoryManager](+[BluetoothManager sharedInstance](BluetoothManager, "sharedInstance"), "_accessoryManager");
  -[BluetoothDevice device](self, "device");
  if (BTAccessoryManagerGetControlCommand())
  {
    v3 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      -[BluetoothDevice listeningModeConfigs].cold.1();
  }
  v4 = sharedBluetoothManagerLogComponent();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    v7 = 0;
    _os_log_impl(&dword_20847A000, v4, OS_LOG_TYPE_INFO, "listening mode configs : %d", buf, 8u);
  }
  return 0;
}

- (BOOL)setListeningModeConfigs:(unsigned int)a3
{
  NSObject *v5;
  int v6;
  NSObject *v7;
  _DWORD v9[2];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v5 = sharedBluetoothManagerLogComponent();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v9[0] = 67109120;
    v9[1] = a3;
    _os_log_impl(&dword_20847A000, v5, OS_LOG_TYPE_INFO, "Set listening mode configs : %d", (uint8_t *)v9, 8u);
  }
  -[BluetoothManager _accessoryManager](+[BluetoothManager sharedInstance](BluetoothManager, "sharedInstance"), "_accessoryManager");
  -[BluetoothDevice device](self, "device");
  v6 = BTAccessoryManagerSendControlCommand();
  if (v6)
  {
    v7 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[BluetoothDevice setListeningModeConfigs:].cold.1();
  }
  return v6 == 0;
}

- (int)singleClickMode
{
  NSObject *v3;
  NSObject *v4;
  uint8_t buf[4];
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  -[BluetoothManager _accessoryManager](+[BluetoothManager sharedInstance](BluetoothManager, "sharedInstance"), "_accessoryManager");
  -[BluetoothDevice device](self, "device");
  if (BTAccessoryManagerGetControlCommand())
  {
    v3 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      -[BluetoothDevice singleClickMode].cold.1();
  }
  v4 = sharedBluetoothManagerLogComponent();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    v7 = 0;
    _os_log_impl(&dword_20847A000, v4, OS_LOG_TYPE_INFO, "single click mode : %d", buf, 8u);
  }
  return 0;
}

- (BOOL)setSingleClickMode:(int)a3
{
  NSObject *v5;
  int v6;
  NSObject *v7;
  _DWORD v9[2];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v5 = sharedBluetoothManagerLogComponent();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v9[0] = 67109120;
    v9[1] = a3;
    _os_log_impl(&dword_20847A000, v5, OS_LOG_TYPE_INFO, "Set single click mode : %d", (uint8_t *)v9, 8u);
  }
  -[BluetoothManager _accessoryManager](+[BluetoothManager sharedInstance](BluetoothManager, "sharedInstance"), "_accessoryManager");
  -[BluetoothDevice device](self, "device");
  v6 = BTAccessoryManagerSendControlCommand();
  if (v6)
  {
    v7 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[BluetoothDevice setSingleClickMode:].cold.1();
  }
  return v6 == 0;
}

- (int)doubleClickMode
{
  NSObject *v3;
  NSObject *v4;
  uint8_t buf[4];
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  -[BluetoothManager _accessoryManager](+[BluetoothManager sharedInstance](BluetoothManager, "sharedInstance"), "_accessoryManager");
  -[BluetoothDevice device](self, "device");
  if (BTAccessoryManagerGetControlCommand())
  {
    v3 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      -[BluetoothDevice doubleClickMode].cold.1();
  }
  v4 = sharedBluetoothManagerLogComponent();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    v7 = 0;
    _os_log_impl(&dword_20847A000, v4, OS_LOG_TYPE_INFO, "double click mode : %d", buf, 8u);
  }
  return 0;
}

- (BOOL)setDoubleClickMode:(int)a3
{
  NSObject *v5;
  int v6;
  NSObject *v7;
  _DWORD v9[2];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v5 = sharedBluetoothManagerLogComponent();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v9[0] = 67109120;
    v9[1] = a3;
    _os_log_impl(&dword_20847A000, v5, OS_LOG_TYPE_INFO, "Set double click mode : %d", (uint8_t *)v9, 8u);
  }
  -[BluetoothManager _accessoryManager](+[BluetoothManager sharedInstance](BluetoothManager, "sharedInstance"), "_accessoryManager");
  -[BluetoothDevice device](self, "device");
  v6 = BTAccessoryManagerSendControlCommand();
  if (v6)
  {
    v7 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[BluetoothDevice setDoubleClickMode:].cold.1();
  }
  return v6 == 0;
}

- (unsigned)clickHoldModes:(id *)a3
{
  unsigned int ControlCommand;
  NSObject *v6;
  NSObject *v7;
  int var0;
  int var1;
  int var2;
  int var3;
  uint8_t buf[4];
  int v14;
  __int16 v15;
  int v16;
  __int16 v17;
  int v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)&a3->var0 = 0;
  *(_QWORD *)&a3->var2 = 0;
  -[BluetoothManager _accessoryManager](+[BluetoothManager sharedInstance](BluetoothManager, "sharedInstance"), "_accessoryManager");
  -[BluetoothDevice device](self, "device");
  ControlCommand = BTAccessoryManagerGetControlCommand();
  if (ControlCommand)
  {
    v6 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[BluetoothDevice clickHoldModes:].cold.1();
  }
  a3->var0 = 0;
  *(int8x8_t *)&a3->var1 = vand_s8((int8x8_t)vshl_u32((uint32x2_t)vdup_n_s32(0), (uint32x2_t)0xFFFFFFF0FFFFFFF8), (int8x8_t)0xFF000000FFLL);
  a3->var3 = 0;
  v7 = sharedBluetoothManagerLogComponent();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    var0 = a3->var0;
    var1 = a3->var1;
    var2 = a3->var2;
    var3 = a3->var3;
    *(_DWORD *)buf = 67109888;
    v14 = var0;
    v15 = 1024;
    v16 = var1;
    v17 = 1024;
    v18 = var2;
    v19 = 1024;
    v20 = var3;
    _os_log_impl(&dword_20847A000, v7, OS_LOG_TYPE_INFO, "Click Hold Modes: right 0x%02X, left 0x%02X, prevRightMode 0x%02X, prevLeftMode 0x%02X", buf, 0x1Au);
  }
  return ControlCommand;
}

- (unsigned)clickHoldMode:(int *)a3 rightAction:(int *)a4
{
  unsigned int ControlCommand;
  NSObject *v8;
  NSObject *v9;
  int v10;
  int v11;
  uint8_t buf[4];
  int v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  -[BluetoothManager _accessoryManager](+[BluetoothManager sharedInstance](BluetoothManager, "sharedInstance"), "_accessoryManager");
  -[BluetoothDevice device](self, "device");
  ControlCommand = BTAccessoryManagerGetControlCommand();
  if (ControlCommand)
  {
    v8 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[BluetoothDevice clickHoldModes:].cold.1();
  }
  *a3 = 0;
  *a4 = 0;
  v9 = sharedBluetoothManagerLogComponent();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = *a3;
    v11 = *a4;
    *(_DWORD *)buf = 67109376;
    v14 = v10;
    v15 = 1024;
    v16 = v11;
    _os_log_impl(&dword_20847A000, v9, OS_LOG_TYPE_INFO, "click hold leftMode : %d rightMode : %d", buf, 0xEu);
  }
  return ControlCommand;
}

- (BOOL)setClickHoldMode:(int)a3 rightMode:(int)a4
{
  NSObject *v7;
  int v8;
  NSObject *v9;
  _DWORD v11[2];
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v7 = sharedBluetoothManagerLogComponent();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v11[0] = 67109376;
    v11[1] = a3;
    v12 = 1024;
    v13 = a4;
    _os_log_impl(&dword_20847A000, v7, OS_LOG_TYPE_INFO, "Set click hold leftMode : %d rightMode : %d", (uint8_t *)v11, 0xEu);
  }
  -[BluetoothManager _accessoryManager](+[BluetoothManager sharedInstance](BluetoothManager, "sharedInstance"), "_accessoryManager");
  -[BluetoothDevice device](self, "device");
  v8 = BTAccessoryManagerSendControlCommand();
  if (v8)
  {
    v9 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[BluetoothDevice setClickHoldMode:rightMode:].cold.1();
  }
  return v8 == 0;
}

- (BOOL)setClickHoldModes:(id)a3
{
  int var2;
  int var0;
  int var1;
  int var3;
  NSObject *v8;
  int v9;
  NSObject *v10;
  _DWORD v12[2];
  __int16 v13;
  int v14;
  __int16 v15;
  int v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  var2 = a3.var2;
  var0 = a3.var0;
  v19 = *MEMORY[0x24BDAC8D0];
  var1 = a3.var1;
  var3 = a3.var3;
  v8 = sharedBluetoothManagerLogComponent();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v12[0] = 67109888;
    v12[1] = var1;
    v13 = 1024;
    v14 = var3;
    v15 = 1024;
    v16 = var0;
    v17 = 1024;
    v18 = var2;
    _os_log_impl(&dword_20847A000, v8, OS_LOG_TYPE_INFO, "Set click hold currentLeftMode : %d previousLeftMode : %d currentRightMode : %d previousRightMode %d", (uint8_t *)v12, 0x1Au);
  }
  -[BluetoothManager _accessoryManager](+[BluetoothManager sharedInstance](BluetoothManager, "sharedInstance"), "_accessoryManager");
  -[BluetoothDevice device](self, "device");
  v9 = BTAccessoryManagerSendControlCommand();
  if (v9)
  {
    v10 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[BluetoothDevice setClickHoldMode:rightMode:].cold.1();
  }
  return v9 == 0;
}

- (int)crownRotationDirection
{
  NSObject *v3;

  -[BluetoothManager _accessoryManager](+[BluetoothManager sharedInstance](BluetoothManager, "sharedInstance"), "_accessoryManager");
  -[BluetoothDevice device](self, "device");
  if (BTAccessoryManagerGetControlCommand())
  {
    v3 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      -[BluetoothDevice crownRotationDirection].cold.1();
  }
  return 0;
}

- (BOOL)setCrownRotationDirection:(int)a3
{
  NSObject *v5;
  int v6;
  NSObject *v7;
  _DWORD v9[2];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v5 = sharedBluetoothManagerLogComponent();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v9[0] = 67109120;
    v9[1] = a3;
    _os_log_impl(&dword_20847A000, v5, OS_LOG_TYPE_INFO, "Set crown rotation dir : %d", (uint8_t *)v9, 8u);
  }
  -[BluetoothManager _accessoryManager](+[BluetoothManager sharedInstance](BluetoothManager, "sharedInstance"), "_accessoryManager");
  -[BluetoothDevice device](self, "device");
  v6 = BTAccessoryManagerSendControlCommand();
  if (v6)
  {
    v7 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[BluetoothDevice setCrownRotationDirection:].cold.1();
  }
  return v6 == 0;
}

- (unsigned)chimeVolume
{
  NSObject *v3;

  -[BluetoothManager _accessoryManager](+[BluetoothManager sharedInstance](BluetoothManager, "sharedInstance"), "_accessoryManager");
  -[BluetoothDevice device](self, "device");
  if (BTAccessoryManagerGetControlCommand())
  {
    v3 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      -[BluetoothDevice chimeVolume].cold.1();
  }
  return 0;
}

- (BOOL)setChimeVolume:(unsigned int)a3
{
  NSObject *v5;
  int v6;
  NSObject *v7;
  _DWORD v9[2];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v5 = sharedBluetoothManagerLogComponent();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v9[0] = 67109120;
    v9[1] = a3;
    _os_log_impl(&dword_20847A000, v5, OS_LOG_TYPE_INFO, "Set chime volume : %d", (uint8_t *)v9, 8u);
  }
  -[BluetoothManager _accessoryManager](+[BluetoothManager sharedInstance](BluetoothManager, "sharedInstance"), "_accessoryManager");
  -[BluetoothDevice device](self, "device");
  v6 = BTAccessoryManagerSendControlCommand();
  if (v6)
  {
    v7 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[BluetoothDevice setChimeVolume:].cold.1();
  }
  return v6 == 0;
}

- (int)autoAnswerMode
{
  NSObject *v3;

  -[BluetoothManager _accessoryManager](+[BluetoothManager sharedInstance](BluetoothManager, "sharedInstance"), "_accessoryManager");
  -[BluetoothDevice device](self, "device");
  if (BTAccessoryManagerGetControlCommand())
  {
    v3 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      -[BluetoothDevice autoAnswerMode].cold.1();
  }
  return 0;
}

- (BOOL)setAutoAnswerMode:(int)a3
{
  NSObject *v5;
  int v6;
  NSObject *v7;
  _DWORD v9[2];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v5 = sharedBluetoothManagerLogComponent();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v9[0] = 67109120;
    v9[1] = a3;
    _os_log_impl(&dword_20847A000, v5, OS_LOG_TYPE_INFO, "Set auto answer mode : %d", (uint8_t *)v9, 8u);
  }
  -[BluetoothManager _accessoryManager](+[BluetoothManager sharedInstance](BluetoothManager, "sharedInstance"), "_accessoryManager");
  -[BluetoothDevice device](self, "device");
  v6 = BTAccessoryManagerSendControlCommand();
  if (v6)
  {
    v7 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[BluetoothDevice setAutoAnswerMode:].cold.1();
  }
  return v6 == 0;
}

- (int)accessorySettingFeatureBitMask
{
  NSObject *v3;
  NSObject *v4;
  uint8_t buf[4];
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  -[BluetoothManager _accessoryManager](+[BluetoothManager sharedInstance](BluetoothManager, "sharedInstance"), "_accessoryManager");
  -[BluetoothDevice device](self, "device");
  if (BTAccessoryManagerGetSettingFeatureBitMask())
  {
    v3 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      -[BluetoothDevice accessorySettingFeatureBitMask].cold.1();
  }
  v4 = sharedBluetoothManagerLogComponent();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    v7 = 0;
    _os_log_impl(&dword_20847A000, v4, OS_LOG_TYPE_INFO, "Accessory feature bitmask : %x", buf, 8u);
  }
  return 0;
}

- (BOOL)pairedDeviceNameUpdated
{
  uint64_t v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  _OWORD v13[15];
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v14 = 0;
  memset(v13, 0, sizeof(v13));
  if (BTDeviceGetName())
  {
LABEL_2:
    LOBYTE(v3) = 0;
    return v3;
  }
  v3 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v13);
  if (!v3)
    return v3;
  v4 = (void *)v3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_opt_respondsToSelector() & 1) == 0)
  {
    v6 = sharedBluetoothManagerLogComponent();
    LODWORD(v3) = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);
    if (!(_DWORD)v3)
      return v3;
    -[BluetoothDevice pairedDeviceNameUpdated].cold.1((uint64_t)v4, v6, v7);
    goto LABEL_2;
  }
  v5 = sharedBluetoothManagerLogComponent();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v9 = 138412546;
    v10 = v4;
    v11 = 2048;
    v12 = objc_msgSend(v4, "length");
    _os_log_impl(&dword_20847A000, v5, OS_LOG_TYPE_INFO, "Magic paired device name updated to %@ (%lu)", (uint8_t *)&v9, 0x16u);
  }
  -[BluetoothDevice _clearName](self, "_clearName");
  self->_name = (NSString *)objc_msgSend(v4, "copy");
  LOBYTE(v3) = 1;
  return v3;
}

- (id)accessoryInfo
{
  void *v3;
  void *v4;
  int AccessoryInfo;
  uint64_t v7;
  void *v8;
  _BOOL4 v9;
  NSObject *v11;
  _BOOL4 v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v16;
  uint64_t v17;
  uint8_t buf[4];
  int v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = malloc_type_malloc(0x1F40uLL, 0xAFA720BAuLL);
  if (!v3)
    return (id)MEMORY[0x24BDBD1B8];
  v4 = v3;
  v16 = 0;
  v17 = 0;
  -[BluetoothManager _accessoryManager](+[BluetoothManager sharedInstance](BluetoothManager, "sharedInstance"), "_accessoryManager");
  -[BluetoothDevice device](self, "device");
  AccessoryInfo = BTAccessoryManagerGetAccessoryInfo();
  if (AccessoryInfo || v17 == 0)
  {
    v9 = 0;
    v8 = 0;
  }
  else
  {
    v7 = objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v4);
    v8 = (void *)objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v7, 0, &v16);
    v9 = v16 != 0;
  }
  free(v4);
  if (!AccessoryInfo && !v9)
  {
    v13 = 0;
  }
  else
  {
    v11 = sharedBluetoothManagerLogComponent();
    v12 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);
    v13 = v16;
    if (v12)
    {
      *(_DWORD *)buf = 67109378;
      v19 = AccessoryInfo;
      v20 = 2112;
      v21 = v16;
      _os_log_error_impl(&dword_20847A000, v11, OS_LOG_TYPE_ERROR, "BTAccessoryManagerGetAccessoryInfo result %d, JSON error %@", buf, 0x12u);
      v13 = v16;
    }
  }
  v14 = !AccessoryInfo && v13 == 0;
  if (v14 && objc_msgSend(v8, "count"))
    return (id)objc_msgSend(v8, "copy");
  else
    return (id)MEMORY[0x24BDBD1B8];
}

- (BOOL)getAACPCapabilityBit:(int)a3
{
  void *v5;
  void *v6;
  NSObject *v7;
  uint8_t buf[4];
  int v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = malloc_type_malloc(0x3E8uLL, 0xC17A1536uLL);
  if (v5)
  {
    v6 = v5;
    -[BluetoothManager _accessoryManager](+[BluetoothManager sharedInstance](BluetoothManager, "sharedInstance"), "_accessoryManager");
    -[BluetoothDevice device](self, "device");
    BTAccessoryManagerGetAACPCapabilityBits();
    v7 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      v10 = a3;
      v11 = 1024;
      v12 = 0;
      _os_log_impl(&dword_20847A000, v7, OS_LOG_TYPE_DEFAULT, "getAACPCapabilityBit: bit %d retval %d", buf, 0xEu);
    }
    free(v6);
  }
  return 0;
}

- (id)getAACPCapabilityBits
{
  id result;
  id v4;

  result = malloc_type_malloc(0x3E8uLL, 0x58670634uLL);
  if (result)
  {
    v4 = result;
    -[BluetoothManager _accessoryManager](+[BluetoothManager sharedInstance](BluetoothManager, "sharedInstance"), "_accessoryManager");
    -[BluetoothDevice device](self, "device");
    BTAccessoryManagerGetAACPCapabilityBits();
    free(v4);
    return (id)objc_msgSend(0, "copy");
  }
  return result;
}

- (unsigned)getAACPCapabilityInteger:(int)a3
{
  NSObject *v5;

  if (a3 > 0xFF)
    return 3;
  -[BluetoothManager _accessoryManager](+[BluetoothManager sharedInstance](BluetoothManager, "sharedInstance"), "_accessoryManager");
  -[BluetoothDevice device](self, "device");
  if (BTAccessoryManagerGetAACPCapabilityInteger())
  {
    v5 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[BluetoothDevice getAACPCapabilityInteger:].cold.1();
  }
  return 0;
}

- (BOOL)isAccessory
{
  -[BluetoothManager _accessoryManager](+[BluetoothManager sharedInstance](BluetoothManager, "sharedInstance"), "_accessoryManager");
  -[BluetoothDevice device](self, "device");
  BTAccessoryManagerIsAccessory();
  return 0;
}

- (BOOL)isServiceSupported:(unsigned int)a3
{
  int SupportedServices;
  NSObject *v5;
  uint8_t buf[4];
  unsigned int v8;
  __int16 v9;
  int v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  SupportedServices = BTDeviceGetSupportedServices();
  v5 = sharedBluetoothManagerLogComponent();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109632;
    v8 = a3;
    v9 = 1024;
    v10 = 0;
    v11 = 1024;
    v12 = SupportedServices;
    _os_log_impl(&dword_20847A000, v5, OS_LOG_TYPE_INFO, "Asking for service 0x%x supported, services 0x%x, result %d", buf, 0x14u);
  }
  return 0;
}

- (id)getServiceSetting:(unsigned int)a3 key:(id)a4
{
  __int128 v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a4, "UTF8String", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0);
  if (BTDeviceGetServiceSettings())
    return 0;
  else
    return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", &v5);
}

- (void)setServiceSetting:(unsigned int)a3 key:(id)a4 value:(id)a5
{
  NSObject *v7;

  objc_msgSend(a4, "UTF8String");
  objc_msgSend(a5, "UTF8String");
  if (BTDeviceSetServiceSettings())
  {
    v7 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[BluetoothDevice setServiceSetting:key:value:].cold.1(self, v7);
  }
}

- (void)connect
{
  -[BluetoothManager connectDevice:](+[BluetoothManager sharedInstance](BluetoothManager, "sharedInstance"), "connectDevice:", self);
}

- (void)connectWithServices:(unsigned int)a3
{
  -[BluetoothManager connectDevice:withServices:](+[BluetoothManager sharedInstance](BluetoothManager, "sharedInstance"), "connectDevice:withServices:", self, *(_QWORD *)&a3);
}

- (void)disconnect
{
  -[BluetoothManager disconnectDevice:](+[BluetoothManager sharedInstance](BluetoothManager, "sharedInstance"), "disconnectDevice:", self);
}

- (void)setPIN:(id)a3
{
  -[BluetoothManager setPincode:forDevice:](+[BluetoothManager sharedInstance](BluetoothManager, "sharedInstance"), "setPincode:forDevice:", a3, self);
}

- (void)acceptSSP:(int64_t)a3
{
  -[BluetoothManager acceptSSP:forDevice:](+[BluetoothManager sharedInstance](BluetoothManager, "sharedInstance"), "acceptSSP:forDevice:", a3, self);
}

- (void)unpair
{
  -[BluetoothManager unpairDevice:](+[BluetoothManager sharedInstance](BluetoothManager, "sharedInstance"), "unpairDevice:", self);
}

- (void)startVoiceCommand
{
  -[BluetoothManager startVoiceCommand:](+[BluetoothManager sharedInstance](BluetoothManager, "sharedInstance"), "startVoiceCommand:", self);
}

- (void)endVoiceCommand
{
  -[BluetoothManager endVoiceCommand:](+[BluetoothManager sharedInstance](BluetoothManager, "sharedInstance"), "endVoiceCommand:", self);
}

- ($9BEB610D0CE1B1EDC3D89DA2464F985F)syncSettings
{
  uint32x4_t v2;
  int8x16_t v3;
  int8x16_t v4;
  uint64x2_t v5;
  int8x16_t v6;

  BTDeviceGetSyncSettings();
  v2 = vmovl_u16((uint16x4_t)(*(_QWORD *)&vshl_u16((uint16x4_t)(*(_QWORD *)&vdup_n_s16(0) & 0xFF00FF00FF00FFLL), (uint16x4_t)0xFFFFFFFDFFFCFFFELL) & 0xFF01FF01FF01FF01));
  v3.i64[0] = v2.u32[0];
  v3.i64[1] = v2.u32[1];
  v4.i64[0] = 255;
  v4.i64[1] = 255;
  v5 = (uint64x2_t)vandq_s8(v3, v4);
  v3.i64[0] = v2.u32[2];
  v3.i64[1] = v2.u32[3];
  v6 = vorrq_s8((int8x16_t)vshlq_u64(v5, (uint64x2_t)xmmword_20848C770), (int8x16_t)vshlq_u64((uint64x2_t)vandq_s8(v3, v4), (uint64x2_t)xmmword_20848C760));
  return ($9BEB610D0CE1B1EDC3D89DA2464F985F)*(_QWORD *)&vorr_s8(*(int8x8_t *)v6.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v6, v6, 8uLL));
}

- (void)setSyncSettings:(id)a3
{
  BTDeviceSetSyncSettings();
}

- (id)syncGroups
{
  void *v2;
  _BYTE v4[1024];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  bzero(v4, 0x400uLL);
  BTDeviceGetGroups();
  return v2;
}

- (void)setSyncGroup:(int)a3 enabled:(BOOL)a4
{
  BTDeviceSetGroup();
}

- (BOOL)isAppleAudioDevice
{
  uint64_t IsAppleAudioDevice;

  IsAppleAudioDevice = BTDeviceIsAppleAudioDevice();
  if ((_DWORD)IsAppleAudioDevice)
    NSLog(CFSTR("BTM : Failed to check apple audio device with error: %d"), IsAppleAudioDevice);
  return 0;
}

- (BOOL)supportsHS
{
  uint64_t v2;

  v2 = BTDeviceSupportsHS();
  if ((_DWORD)v2)
    NSLog(CFSTR("BTM : Failed to check device supports HS with error: %d"), v2);
  return 0;
}

- (BOOL)isProController
{
  uint64_t IsProController;

  IsProController = BTDeviceIsProController();
  if ((_DWORD)IsProController)
    NSLog(CFSTR("BTM : Failed to check device is Pro Controller with error: %d"), IsProController);
  return 0;
}

- (BOOL)setUserName:(id)a3
{
  uint64_t v5;

  if (!-[NSString isEqualToString:](self->_name, "isEqualToString:"))
  {
    objc_msgSend(a3, "cStringUsingEncoding:", 4);
    v5 = BTDeviceSetUserName();
    if ((_DWORD)v5)
    {
      NSLog(CFSTR("BTM : Failed to set user-defined name with error: %d"), v5);
      return 0;
    }
    -[BluetoothDevice _clearName](self, "_clearName");
    self->_name = (NSString *)objc_msgSend(a3, "copy");
  }
  return 1;
}

- (void)setConnectingServicemask:(unsigned int)a3
{
  self->_connectingServiceMask = a3;
}

- (unsigned)getConnectingServiceMask
{
  return self->_connectingServiceMask;
}

- (int)getLowSecurityStatus
{
  uint64_t LowSecurityStatus;

  LowSecurityStatus = BTDeviceGetLowSecurityStatus();
  if ((_DWORD)LowSecurityStatus)
    NSLog(CFSTR("BTM : Failed to check getLowSecurityStatus with error: %d"), LowSecurityStatus);
  return 0;
}

- (int)getBehaviorForHIDDevice
{
  NSObject *v2;

  if (BTDeviceGetHIDDeviceBehavior())
  {
    v2 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      -[BluetoothDevice getBehaviorForHIDDevice].cold.1();
  }
  return 0;
}

- (int)getStereoHFPSupport
{
  NSObject *v3;
  int result;
  NSObject *v5;
  uint8_t buf[4];
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  -[BluetoothManager _accessoryManager](+[BluetoothManager sharedInstance](BluetoothManager, "sharedInstance"), "_accessoryManager");
  -[BluetoothDevice device](self, "device");
  if (BTAccessoryManagerGetStereoHFPSupport())
  {
    v3 = sharedBluetoothManagerLogComponent();
    result = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);
    if (result)
    {
      -[BluetoothDevice getStereoHFPSupport].cold.1();
      return 0;
    }
  }
  else
  {
    v5 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v7 = "spatial not supported";
      _os_log_impl(&dword_20847A000, v5, OS_LOG_TYPE_INFO, "Support for Stereo HFP : %s", buf, 0xCu);
    }
    return 0;
  }
  return result;
}

- (BOOL)getDeviceSoundProfileSupport
{
  int DeviceSoundProfileSupport;
  NSObject *v4;
  NSObject *v5;
  _BOOL4 v6;
  uint8_t buf[4];
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  -[BluetoothManager _accessoryManager](+[BluetoothManager sharedInstance](BluetoothManager, "sharedInstance"), "_accessoryManager");
  -[BluetoothDevice device](self, "device");
  DeviceSoundProfileSupport = BTAccessoryManagerGetDeviceSoundProfileSupport();
  v4 = sharedBluetoothManagerLogComponent();
  v5 = v4;
  if (DeviceSoundProfileSupport)
  {
    v6 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);
    if (v6)
    {
      -[BluetoothDevice getDeviceSoundProfileSupport].cold.1();
      LOBYTE(v6) = 0;
    }
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v9 = "NOT Supported";
      _os_log_impl(&dword_20847A000, v5, OS_LOG_TYPE_INFO, "Accessory support for Spatial Profile: : %s", buf, 0xCu);
    }
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (BOOL)getDeviceSoundProfileAllowed
{
  int DeviceSoundProfileAllowed;
  NSObject *v4;
  NSObject *v5;
  _BOOL4 v6;
  uint8_t buf[4];
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  -[BluetoothManager _accessoryManager](+[BluetoothManager sharedInstance](BluetoothManager, "sharedInstance"), "_accessoryManager");
  -[BluetoothDevice device](self, "device");
  DeviceSoundProfileAllowed = BTAccessoryManagerGetDeviceSoundProfileAllowed();
  v4 = sharedBluetoothManagerLogComponent();
  v5 = v4;
  if (DeviceSoundProfileAllowed)
  {
    v6 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);
    if (v6)
    {
      -[BluetoothDevice getDeviceSoundProfileAllowed].cold.1();
      LOBYTE(v6) = 0;
    }
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v9 = "NOT Allowed";
      _os_log_impl(&dword_20847A000, v5, OS_LOG_TYPE_INFO, "Accessory Allowed for Spatial Profile: %s", buf, 0xCu);
    }
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (void)setDeviceSoundProfileAllowed:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v3 = a3;
  v10 = *MEMORY[0x24BDAC8D0];
  v5 = sharedBluetoothManagerLogComponent();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = "NOT Allowed";
    if (v3)
      v6 = "Allowed";
    v8 = 136315138;
    v9 = v6;
    _os_log_impl(&dword_20847A000, v5, OS_LOG_TYPE_INFO, "Accessory Allowed for Spatial Profile: %s", (uint8_t *)&v8, 0xCu);
  }
  -[BluetoothManager _accessoryManager](+[BluetoothManager sharedInstance](BluetoothManager, "sharedInstance"), "_accessoryManager");
  -[BluetoothDevice device](self, "device");
  if (BTAccessoryManagerSetDeviceSoundProfileAllowed())
  {
    v7 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[BluetoothDevice getDeviceSoundProfileAllowed].cold.1();
  }
}

- (unsigned)getSpatialAudioPlatformSupport
{
  int SpatialAudioPlatformSupport;
  NSObject *v4;
  NSObject *v5;
  uint8_t buf[4];
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  -[BluetoothManager _accessoryManager](+[BluetoothManager sharedInstance](BluetoothManager, "sharedInstance"), "_accessoryManager");
  -[BluetoothDevice device](self, "device");
  SpatialAudioPlatformSupport = BTAccessoryManagerGetSpatialAudioPlatformSupport();
  v4 = sharedBluetoothManagerLogComponent();
  v5 = v4;
  if (SpatialAudioPlatformSupport)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[BluetoothDevice getSpatialAudioPlatformSupport].cold.1();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v8 = "NOT Supported";
    _os_log_impl(&dword_20847A000, v5, OS_LOG_TYPE_INFO, "Platform Spatial Audio Support : %s", buf, 0xCu);
  }
  return 2;
}

- (int)getUserSelectedDeviceType
{
  if (BTDeviceGetUserSelectedDeviceType())
    return 0;
  else
    return 0;
}

- (BOOL)setUserSelectedDeviceType:(int)a3
{
  uint64_t v3;
  int v4;

  v3 = BTDeviceSetUserSelectedDeviceType();
  v4 = v3;
  if ((_DWORD)v3)
    NSLog(CFSTR("BTM : Failed to set user selected device type with error: %d"), v3);
  return v4 == 0;
}

- (id)gyroInformation
{
  void *v3;
  NSObject *v4;
  NSObject *v5;
  uint8_t buf[4];
  void *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  -[BluetoothManager _accessoryManager](+[BluetoothManager sharedInstance](BluetoothManager, "sharedInstance"), "_accessoryManager");
  -[BluetoothDevice device](self, "device");
  if (BTAccessoryManagerGetGyroInformation())
  {
    v4 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[BluetoothDevice gyroInformation].cold.1();
  }
  else
  {
    v5 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v8 = v3;
      v9 = 1024;
      v10 = 0;
      _os_log_impl(&dword_20847A000, v5, OS_LOG_TYPE_DEFAULT, "gyroInformation - Generated gyro information %@ from data with length %u", buf, 0x12u);
    }
  }
  return v3;
}

- (int)getHexDeviceAddress:(id *)a3
{
  -[NSString UTF8String](self->_address, "UTF8String");
  return BTDeviceAddressFromString();
}

- (int)getDeviceColor:(unsigned int *)a3
{
  -[BluetoothManager _accessoryManager](+[BluetoothManager sharedInstance](BluetoothManager, "sharedInstance"), "_accessoryManager");
  -[BluetoothDevice device](self, "device");
  return BTAccessoryManagerGetDeviceColor();
}

- (BOOL)isGenuineAirPods
{
  int IsGenuineAirPods;
  NSObject *v4;
  NSObject *v5;
  uint8_t buf[4];
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  -[BluetoothManager _accessoryManager](+[BluetoothManager sharedInstance](BluetoothManager, "sharedInstance"), "_accessoryManager");
  -[BluetoothDevice device](self, "device");
  IsGenuineAirPods = BTAccessoryManagerIsGenuineAirPods();
  v4 = sharedBluetoothManagerLogComponent();
  v5 = v4;
  if (IsGenuineAirPods)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[BluetoothDevice isGenuineAirPods].cold.1();
    return 1;
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      v8 = -1;
      _os_log_impl(&dword_20847A000, v5, OS_LOG_TYPE_INFO, "Is Genuine AirPods : %d", buf, 8u);
    }
    return 1;
  }
}

- ($70344DAF05348A783186C1CF166707C1)getCallManagementConfig
{
  NSObject *v3;
  int v5;

  v5 = 0;
  -[BluetoothManager _accessoryManager](+[BluetoothManager sharedInstance](BluetoothManager, "sharedInstance"), "_accessoryManager");
  -[BluetoothDevice device](self, "device");
  if (BTAccessoryManagerGetCallManagementConfig())
  {
    v3 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      -[BluetoothDevice getCallManagementConfig].cold.1();
    BYTE1(v5) = 0;
  }
  return ($70344DAF05348A783186C1CF166707C1)((unint64_t)*(unsigned __int16 *)((char *)&v5 + 1) << 32);
}

- (BOOL)setCallConfig:(id)a3
{
  int v4;
  NSObject *v5;

  -[BluetoothManager _accessoryManager](+[BluetoothManager sharedInstance](BluetoothManager, "sharedInstance"), "_accessoryManager");
  -[BluetoothDevice device](self, "device");
  v4 = BTAccessoryManagerSendControlCommand();
  if (v4)
  {
    v5 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[BluetoothDevice setCallConfig:].cold.1();
  }
  return v4 == 0;
}

- (unsigned)getDeviceAdaptiveVolumeMode
{
  NSObject *v3;
  NSObject *v4;
  uint8_t buf[4];
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (_os_feature_enabled_impl()
    && (-[BluetoothManager _accessoryManager](+[BluetoothManager sharedInstance](BluetoothManager, "sharedInstance"), "_accessoryManager"), -[BluetoothDevice device](self, "device"), BTAccessoryManagerGetHeadphoneFeatureValue()))
  {
    v3 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      -[BluetoothDevice getDeviceAdaptiveVolumeMode].cold.1();
  }
  else
  {
    v4 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v7 = 0;
      _os_log_impl(&dword_20847A000, v4, OS_LOG_TYPE_DEFAULT, "Adaptive Volume: Get Mode - %d", buf, 8u);
    }
  }
  return 0;
}

- (void)setDeviceAdaptiveVolumeMode:(int)a3
{
  unsigned __int8 v3;
  NSObject *v5;
  NSObject *v6;
  _DWORD v7[2];
  uint64_t v8;

  v3 = a3;
  v8 = *MEMORY[0x24BDAC8D0];
  if (_os_feature_enabled_impl())
  {
    v5 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7[0] = 67109120;
      v7[1] = v3;
      _os_log_impl(&dword_20847A000, v5, OS_LOG_TYPE_DEFAULT, "Adaptive Volume: Set Mode - %d", (uint8_t *)v7, 8u);
    }
    -[BluetoothManager _accessoryManager](+[BluetoothManager sharedInstance](BluetoothManager, "sharedInstance"), "_accessoryManager");
    -[BluetoothDevice device](self, "device");
    if (BTAccessoryManagerSendControlCommand())
    {
      v6 = sharedBluetoothManagerLogComponent();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        -[BluetoothDevice setDeviceAdaptiveVolumeMode:].cold.1();
    }
  }
}

- (BOOL)getAdaptiveVolumeSupport
{
  NSObject *v3;

  if (_os_feature_enabled_impl())
  {
    -[BluetoothManager _accessoryManager](+[BluetoothManager sharedInstance](BluetoothManager, "sharedInstance"), "_accessoryManager");
    -[BluetoothDevice device](self, "device");
    if (BTAccessoryManagerGetHeadphoneFeatureValue())
    {
      v3 = sharedBluetoothManagerLogComponent();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
        -[BluetoothDevice getAdaptiveVolumeSupport].cold.1();
    }
  }
  return 0;
}

- (unsigned)getAdaptiveVolumeMode
{
  NSObject *v3;
  NSObject *v4;
  uint8_t buf[4];
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (_os_feature_enabled_impl()
    && (-[BluetoothManager _accessoryManager](+[BluetoothManager sharedInstance](BluetoothManager, "sharedInstance"), "_accessoryManager"), -[BluetoothDevice device](self, "device"), BTAccessoryManagerGetHeadphoneFeatureValue()))
  {
    v3 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      -[BluetoothDevice getDeviceAdaptiveVolumeMode].cold.1();
  }
  else
  {
    v4 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v7 = 0;
      _os_log_impl(&dword_20847A000, v4, OS_LOG_TYPE_DEFAULT, "Adaptive Volume: Get Mode - %d", buf, 8u);
    }
  }
  return 0;
}

- (void)setAdaptiveVolumeMode:(int)a3
{
  unsigned __int8 v3;
  NSObject *v5;
  NSObject *v6;
  _DWORD v7[2];
  uint64_t v8;

  v3 = a3;
  v8 = *MEMORY[0x24BDAC8D0];
  if (_os_feature_enabled_impl())
  {
    v5 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7[0] = 67109120;
      v7[1] = v3;
      _os_log_impl(&dword_20847A000, v5, OS_LOG_TYPE_DEFAULT, "Adaptive Volume: Set Mode - %d", (uint8_t *)v7, 8u);
    }
    -[BluetoothManager _accessoryManager](+[BluetoothManager sharedInstance](BluetoothManager, "sharedInstance"), "_accessoryManager");
    -[BluetoothDevice device](self, "device");
    if (BTAccessoryManagerSendControlCommand())
    {
      v6 = sharedBluetoothManagerLogComponent();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        -[BluetoothDevice setDeviceAdaptiveVolumeMode:].cold.1();
    }
  }
}

- (BOOL)getAutoANCSupport
{
  NSObject *v3;

  if (_os_feature_enabled_impl())
  {
    -[BluetoothManager _accessoryManager](+[BluetoothManager sharedInstance](BluetoothManager, "sharedInstance"), "_accessoryManager");
    -[BluetoothDevice device](self, "device");
    if (BTAccessoryManagerGetHeadphoneFeatureValue())
    {
      v3 = sharedBluetoothManagerLogComponent();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
        -[BluetoothDevice getAutoANCSupport].cold.1();
    }
  }
  return 0;
}

- (unsigned)getDeviceConversationDetect
{
  NSObject *v3;
  NSObject *v4;
  uint8_t buf[4];
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (_os_feature_enabled_impl()
    && (-[BluetoothManager _accessoryManager](+[BluetoothManager sharedInstance](BluetoothManager, "sharedInstance"), "_accessoryManager"), -[BluetoothDevice device](self, "device"), BTAccessoryManagerGetHeadphoneFeatureValue()))
  {
    v3 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      -[BluetoothDevice getDeviceConversationDetect].cold.1();
  }
  else
  {
    v4 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v7 = 0;
      _os_log_impl(&dword_20847A000, v4, OS_LOG_TYPE_DEFAULT, "Conversation Detect: mode - %d", buf, 8u);
    }
  }
  return 0;
}

- (void)setDeviceConversationDetect:(int)a3
{
  NSObject *v5;
  NSObject *v6;
  _DWORD v7[2];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (_os_feature_enabled_impl())
  {
    v5 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7[0] = 67109120;
      v7[1] = a3;
      _os_log_impl(&dword_20847A000, v5, OS_LOG_TYPE_DEFAULT, "Conversation Detect: Set Mode - %d", (uint8_t *)v7, 8u);
    }
    -[BluetoothManager _accessoryManager](+[BluetoothManager sharedInstance](BluetoothManager, "sharedInstance"), "_accessoryManager");
    -[BluetoothDevice device](self, "device");
    if (BTAccessoryManagerSendControlCommand())
    {
      v6 = sharedBluetoothManagerLogComponent();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        -[BluetoothDevice setDeviceConversationDetect:].cold.1();
    }
  }
}

- (BOOL)getConversationDetectSupport
{
  NSObject *v3;

  if (_os_feature_enabled_impl())
  {
    -[BluetoothManager _accessoryManager](+[BluetoothManager sharedInstance](BluetoothManager, "sharedInstance"), "_accessoryManager");
    -[BluetoothDevice device](self, "device");
    if (BTAccessoryManagerGetHeadphoneFeatureValue())
    {
      v3 = sharedBluetoothManagerLogComponent();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
        -[BluetoothDevice getConversationDetectSupport].cold.1();
    }
  }
  return 0;
}

- (unsigned)getConversationDetectMode
{
  NSObject *v3;
  NSObject *v4;
  uint8_t buf[4];
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (_os_feature_enabled_impl()
    && (-[BluetoothManager _accessoryManager](+[BluetoothManager sharedInstance](BluetoothManager, "sharedInstance"), "_accessoryManager"), -[BluetoothDevice device](self, "device"), BTAccessoryManagerGetHeadphoneFeatureValue()))
  {
    v3 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      -[BluetoothDevice getDeviceConversationDetect].cold.1();
  }
  else
  {
    v4 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v7 = 0;
      _os_log_impl(&dword_20847A000, v4, OS_LOG_TYPE_DEFAULT, "Conversation Detect: mode - %d", buf, 8u);
    }
  }
  return 0;
}

- (void)setConversationDetectMode:(int)a3
{
  NSObject *v5;
  NSObject *v6;
  _DWORD v7[2];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (_os_feature_enabled_impl())
  {
    v5 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7[0] = 67109120;
      v7[1] = a3;
      _os_log_impl(&dword_20847A000, v5, OS_LOG_TYPE_DEFAULT, "Conversation Detect: Set Mode - %d", (uint8_t *)v7, 8u);
    }
    -[BluetoothManager _accessoryManager](+[BluetoothManager sharedInstance](BluetoothManager, "sharedInstance"), "_accessoryManager");
    -[BluetoothDevice device](self, "device");
    if (BTAccessoryManagerSendControlCommand())
    {
      v6 = sharedBluetoothManagerLogComponent();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        -[BluetoothDevice setDeviceConversationDetect:].cold.1();
    }
  }
}

- (BOOL)getSSLSupport
{
  NSObject *v3;

  if (_os_feature_enabled_impl())
  {
    -[BluetoothManager _accessoryManager](+[BluetoothManager sharedInstance](BluetoothManager, "sharedInstance"), "_accessoryManager");
    -[BluetoothDevice device](self, "device");
    if (BTAccessoryManagerGetHeadphoneFeatureValue())
    {
      v3 = sharedBluetoothManagerLogComponent();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
        -[BluetoothDevice getSSLSupport].cold.1();
    }
  }
  return 0;
}

- (unsigned)getSSLMode
{
  NSObject *v3;
  NSObject *v4;
  uint8_t buf[4];
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (_os_feature_enabled_impl()
    && (-[BluetoothManager _accessoryManager](+[BluetoothManager sharedInstance](BluetoothManager, "sharedInstance"), "_accessoryManager"), -[BluetoothDevice device](self, "device"), BTAccessoryManagerGetHeadphoneFeatureValue()))
  {
    v3 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      -[BluetoothDevice getSSLMode].cold.1();
  }
  else
  {
    v4 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v7 = 0;
      _os_log_impl(&dword_20847A000, v4, OS_LOG_TYPE_DEFAULT, "SSL: mode - %d", buf, 8u);
    }
  }
  return 0;
}

- (void)setSSLMode:(int)a3
{
  NSObject *v5;
  NSObject *v6;
  _DWORD v7[2];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (_os_feature_enabled_impl())
  {
    v5 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7[0] = 67109120;
      v7[1] = a3;
      _os_log_impl(&dword_20847A000, v5, OS_LOG_TYPE_DEFAULT, "SSL: Set Mode - %d", (uint8_t *)v7, 8u);
    }
    -[BluetoothManager _accessoryManager](+[BluetoothManager sharedInstance](BluetoothManager, "sharedInstance"), "_accessoryManager");
    -[BluetoothDevice device](self, "device");
    if (BTAccessoryManagerSendControlCommand())
    {
      v6 = sharedBluetoothManagerLogComponent();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        -[BluetoothDevice setSSLMode:].cold.1();
    }
  }
}

- (BOOL)getWirelessSharingSpatialSupport
{
  NSObject *v3;
  NSObject *v5;
  uint8_t buf[4];
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (_os_feature_enabled_impl()
    && (-[BluetoothManager _accessoryManager](+[BluetoothManager sharedInstance](BluetoothManager, "sharedInstance"), "_accessoryManager"), -[BluetoothDevice device](self, "device"), BTAccessoryManagerGetWirelessSharingSpatial()))
  {
    v3 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      -[BluetoothDevice getWirelessSharingSpatialSupport].cold.1();
    return 1;
  }
  else
  {
    v5 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      v7 = 1;
      _os_log_impl(&dword_20847A000, v5, OS_LOG_TYPE_INFO, "Is Spatial Supported during Wireless splitter : %d", buf, 8u);
    }
    return 1;
  }
}

- (BOOL)isGuestPairingMode
{
  int HeadphoneFeatureValue;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  uint8_t buf[4];
  int v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (_os_feature_enabled_impl())
  {
    -[BluetoothManager _accessoryManager](+[BluetoothManager sharedInstance](BluetoothManager, "sharedInstance"), "_accessoryManager");
    -[BluetoothDevice device](self, "device");
    HeadphoneFeatureValue = BTAccessoryManagerGetHeadphoneFeatureValue();
    v4 = sharedBluetoothManagerLogComponent();
    v5 = v4;
    if (HeadphoneFeatureValue)
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
        -[BluetoothDevice isGuestPairingMode].cold.1();
    }
    else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      v9 = 0;
      v10 = 1024;
      v11 = 0;
      _os_log_impl(&dword_20847A000, v5, OS_LOG_TYPE_DEFAULT, "Guest Pairing: Result: %u, Mode:  %u", buf, 0xEu);
    }
  }
  else
  {
    v6 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[BluetoothDevice isGuestPairingMode].cold.2();
  }
  return 0;
}

- (void)setGuestPairingMode:(BOOL)a3
{
  _BOOL4 v3;
  int v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  _DWORD v9[2];
  __int16 v10;
  _BOOL4 v11;
  uint64_t v12;

  v3 = a3;
  v12 = *MEMORY[0x24BDAC8D0];
  if (_os_feature_enabled_impl())
  {
    -[BluetoothManager _accessoryManager](+[BluetoothManager sharedInstance](BluetoothManager, "sharedInstance"), "_accessoryManager");
    -[BluetoothDevice device](self, "device");
    v5 = BTAccessoryManagerSetHeadphoneFeatureValue();
    v6 = sharedBluetoothManagerLogComponent();
    v7 = v6;
    if (v5)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        -[BluetoothDevice setGuestPairingMode:].cold.1();
    }
    else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v9[0] = 67109376;
      v9[1] = 0;
      v10 = 1024;
      v11 = v3;
      _os_log_impl(&dword_20847A000, v7, OS_LOG_TYPE_DEFAULT, "Guest Pairing: Result: %u, Mode Set To:  %u", (uint8_t *)v9, 0xEu);
    }
  }
  else
  {
    v8 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[BluetoothDevice setGuestPairingMode:].cold.2();
  }
}

- (BOOL)isProxCardSupportedForFeature:(int)a3
{
  unsigned int v5;
  NSObject *v6;
  _BOOL4 v7;
  NSObject *v8;
  NSObject *v10;
  const char *v11;
  const char *v12;
  const char *v13;
  NSObject *v14;
  uint32_t v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  const char *v20;
  const char *v21;
  const char *v22;
  _BOOL4 v23;
  const char *v24;
  NSObject *v25;
  const char *v26;
  const char *v27;
  _BOOL4 v28;
  const char *v29;
  NSObject *v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  const char *v36;
  __int16 v37;
  const char *v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    v8 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[BluetoothDevice isProxCardSupportedForFeature:].cold.4();
    goto LABEL_12;
  }
  v5 = -[BluetoothDevice productId](self, "productId");
  v6 = sharedBluetoothManagerLogComponent();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v32) = v5;
    _os_log_impl(&dword_20847A000, v6, OS_LOG_TYPE_DEFAULT, "Prox Card Status: Product ID is %i", buf, 8u);
  }
  if (a3 == 2)
  {
    LOBYTE(v7) = 0;
    switch(v5)
    {
      case 0x2019u:
      case 0x201Eu:
        v7 = -[BluetoothDevice getAdaptiveVolumeSupport](self, "getAdaptiveVolumeSupport");
        v10 = sharedBluetoothManagerLogComponent();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          if (v7)
            v11 = "Yes";
          else
            v11 = "No";
          if (-[BluetoothDevice getAdaptiveVolumeSupport](self, "getAdaptiveVolumeSupport"))
            v12 = "Yes";
          else
            v12 = "No";
          *(_DWORD *)buf = 136315394;
          v32 = v11;
          v33 = 2080;
          v34 = v12;
          v13 = "Prox Card Status: Adaptive Controls: Support: %s -> AdaptiveVolume: %s";
          v14 = v10;
          v15 = 22;
          goto LABEL_67;
        }
        return v7;
      case 0x201Au:
      case 0x201Cu:
      case 0x201Du:
      case 0x201Fu:
      case 0x2021u:
      case 0x2022u:
      case 0x2023u:
        return v7;
      case 0x201Bu:
      case 0x2020u:
        if (-[BluetoothDevice getAdaptiveVolumeSupport](self, "getAdaptiveVolumeSupport"))
          v7 = -[BluetoothDevice getConversationDetectSupport](self, "getConversationDetectSupport");
        else
          v7 = 0;
        v25 = sharedBluetoothManagerLogComponent();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          if (v7)
            v26 = "Yes";
          else
            v26 = "No";
          if (-[BluetoothDevice getAdaptiveVolumeSupport](self, "getAdaptiveVolumeSupport"))
            v27 = "Yes";
          else
            v27 = "No";
          v28 = -[BluetoothDevice getConversationDetectSupport](self, "getConversationDetectSupport");
          *(_DWORD *)buf = 136315650;
          if (v28)
            v29 = "Yes";
          else
            v29 = "No";
          v32 = v26;
          v33 = 2080;
          v34 = v27;
          v35 = 2080;
          v36 = v29;
          v13 = "Prox Card Status: Adaptive Controls: Support: %s -> AdaptiveVolume: %s, CD: %s";
          v14 = v25;
          v15 = 32;
          goto LABEL_67;
        }
        return v7;
      case 0x2024u:
        goto LABEL_35;
      default:
        if (v5 != 8212)
          return v7;
LABEL_35:
        v7 = -[BluetoothDevice getSSLSupport](self, "getSSLSupport")
          && -[BluetoothDevice getAdaptiveVolumeSupport](self, "getAdaptiveVolumeSupport")
          && -[BluetoothDevice getConversationDetectSupport](self, "getConversationDetectSupport");
        v19 = sharedBluetoothManagerLogComponent();
        if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          return v7;
        if (v7)
          v20 = "Yes";
        else
          v20 = "No";
        if (-[BluetoothDevice getSSLSupport](self, "getSSLSupport"))
          v21 = "Yes";
        else
          v21 = "No";
        if (-[BluetoothDevice getAdaptiveVolumeSupport](self, "getAdaptiveVolumeSupport"))
          v22 = "Yes";
        else
          v22 = "No";
        v23 = -[BluetoothDevice getConversationDetectSupport](self, "getConversationDetectSupport");
        *(_DWORD *)buf = 136315906;
        if (v23)
          v24 = "Yes";
        else
          v24 = "No";
        v32 = v20;
        v33 = 2080;
        v34 = v21;
        v35 = 2080;
        v36 = v22;
        v37 = 2080;
        v38 = v24;
        v13 = "Prox Card Status: Adaptive Controls: Support: %s -> SSL: %s, AV: %s, CD: %s";
        v14 = v19;
        v15 = 42;
        break;
    }
    goto LABEL_67;
  }
  if (a3 == 1)
  {
    if (v5 == 8218)
    {
      v17 = sharedBluetoothManagerLogComponent();
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        goto LABEL_12;
      goto LABEL_26;
    }
    if (v5 == 8230)
    {
      v16 = sharedBluetoothManagerLogComponent();
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        goto LABEL_12;
LABEL_26:
      -[BluetoothDevice isProxCardSupportedForFeature:].cold.2();
      goto LABEL_12;
    }
    -[BluetoothManager _accessoryManager](+[BluetoothManager sharedInstance](BluetoothManager, "sharedInstance"), "_accessoryManager");
    -[BluetoothDevice device](self, "device");
    if (BTAccessoryManagerGetCallManagementConfig())
    {
      v18 = sharedBluetoothManagerLogComponent();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        -[BluetoothDevice isProxCardSupportedForFeature:].cold.1();
      goto LABEL_12;
    }
    LOBYTE(v7) = 0;
    v30 = sharedBluetoothManagerLogComponent();
    if (!os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      return v7;
    *(_DWORD *)buf = 136315394;
    v32 = "No";
    v33 = 1024;
    LODWORD(v34) = 0;
    v13 = "Prox Card Status: Mute Call: Support: %s -> Version: %d";
    v14 = v30;
    v15 = 18;
LABEL_67:
    _os_log_impl(&dword_20847A000, v14, OS_LOG_TYPE_DEFAULT, v13, buf, v15);
    return v7;
  }
  if (a3)
  {
LABEL_12:
    LOBYTE(v7) = 0;
    return v7;
  }
  if (v5 - 8203 >= 0xC)
    LOBYTE(v7) = 0;
  else
    LOBYTE(v7) = (0x8C1u >> (v5 - 11)) & 1;
  return v7;
}

- (BOOL)isProxCardShowedForFeature:(int)a3
{
  NSObject *v5;
  NSObject *v6;
  int FeatureProxCardStatus;
  NSObject *v9;
  NSObject *v10;
  BOOL v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    v6 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[BluetoothDevice isProxCardShowedForFeature:].cold.2();
    return 1;
  }
  if (a3 <= 1)
  {
    v5 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20847A000, v5, OS_LOG_TYPE_DEFAULT, "Prox Card Status: Mute Call: Card Discontinued, Return as Showed", buf, 2u);
    }
    return 1;
  }
  -[BluetoothManager _accessoryManager](+[BluetoothManager sharedInstance](BluetoothManager, "sharedInstance"), "_accessoryManager");
  -[BluetoothDevice device](self, "device");
  FeatureProxCardStatus = BTAccessoryManagerGetFeatureProxCardStatus();
  if (FeatureProxCardStatus)
  {
    v9 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[BluetoothDevice isProxCardShowedForFeature:].cold.1();
  }
  else if (a3 == 2)
  {
    v10 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v13 = "No";
      v14 = 2048;
      v15 = 0;
      _os_log_impl(&dword_20847A000, v10, OS_LOG_TYPE_DEFAULT, "Prox Card Status: Adaptive Controls: Showed: %s -> Prox Card Status: 0x%08llx", buf, 0x16u);
    }
    -[BluetoothManager _accessoryManager](+[BluetoothManager sharedInstance](BluetoothManager, "sharedInstance"), "_accessoryManager");
    -[BluetoothDevice device](self, "device");
    BTAccessoryManagerSetFeatureProxCardStatus();
    v11 = 0;
    return FeatureProxCardStatus || v11;
  }
  v11 = 1;
  return FeatureProxCardStatus || v11;
}

- (void)setProxCardShowedForFeature:(int)a3 showed:(BOOL)a4
{
  _BOOL4 v4;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  char v14;
  NSObject *v15;
  const char *v16;
  const char *v17;
  char v18;
  const char *v19;
  NSObject *v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint8_t buf[4];
  _BYTE v31[10];
  __int16 v32;
  int v33;
  __int16 v34;
  int v35;
  __int16 v36;
  int v37;
  __int16 v38;
  int v39;
  __int16 v40;
  int v41;
  uint64_t v42;

  v4 = a4;
  v42 = *MEMORY[0x24BDAC8D0];
  if ((_os_feature_enabled_impl() & 1) != 0)
  {
    if (a3 <= 1)
    {
      *(_DWORD *)((char *)&v29 + 3) = 0;
      LODWORD(v29) = 0;
      -[BluetoothManager _accessoryManager](+[BluetoothManager sharedInstance](BluetoothManager, "sharedInstance"), "_accessoryManager");
      -[BluetoothDevice device](self, "device");
      if (BTAccessoryManagerGetCallManagementConfig())
      {
        v7 = sharedBluetoothManagerLogComponent();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
          -[BluetoothDevice setProxCardShowedForFeature:showed:].cold.4();
        return;
      }
      v10 = sharedBluetoothManagerLogComponent();
      v11 = v10;
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67110656;
        *(_DWORD *)v31 = v29;
        *(_WORD *)&v31[4] = 1024;
        *(_DWORD *)&v31[6] = BYTE1(v29);
        v32 = 1024;
        v33 = BYTE2(v29);
        v34 = 1024;
        v35 = BYTE3(v29);
        v36 = 1024;
        v37 = BYTE4(v29);
        v38 = 1024;
        v39 = BYTE5(v29);
        v40 = 1024;
        v41 = BYTE6(v29);
        _os_log_impl(&dword_20847A000, v11, OS_LOG_TYPE_DEFAULT, "Prox Card Status: Set: Call Management Version: %d, [0] status: %u, endCall: %u, [1] End Call Status: %u, End Call Config: %u, Mute Call Status: %u, Mute Call Config: %u", buf, 0x2Cu);
      }
      v14 = v29;
      if (a3)
      {
        if (v29 != 1)
        {
          v20 = sharedBluetoothManagerLogComponent();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            -[BluetoothDevice setProxCardShowedForFeature:showed:].cold.3((uint64_t)&v29, v20, v22, v23, v24, v25, v26, v27);
          return;
        }
        if (v4)
          v14 = v29 + 1;
        BYTE5(v29) = v14;
        v15 = sharedBluetoothManagerLogComponent();
        if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
LABEL_50:
          -[BluetoothDevice setCallConfig:](self, "setCallConfig:", v29 | ((unint64_t)(WORD2(v29) | (BYTE6(v29) << 16)) << 32));
          return;
        }
        if (BYTE5(v29) == 2)
          v16 = "Set";
        else
          v16 = "Disabled";
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)v31 = v16;
        v17 = "Prox Card Status: Mute Call: Set: Version: 1, Mute Call Status: %s";
      }
      else if (v29 == 1)
      {
        if (v4)
          v14 = v29 + 1;
        BYTE3(v29) = v14;
        v15 = sharedBluetoothManagerLogComponent();
        if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          goto LABEL_50;
        if (BYTE3(v29) == 2)
          v28 = "Set";
        else
          v28 = "Disabled";
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)v31 = v28;
        v17 = "Prox Card Status: End Call: Set: Version: 1, End Call Status: %s";
      }
      else
      {
        if (v4)
          v18 = 2;
        else
          v18 = 1;
        BYTE1(v29) = v18;
        v15 = sharedBluetoothManagerLogComponent();
        if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          goto LABEL_50;
        if (BYTE1(v29) == 2)
          v19 = "Set";
        else
          v19 = "Disabled";
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)v31 = v19;
        v17 = "Prox Card Status: End Call: Set: Version: 0, End Call Status: %s";
      }
      _os_log_impl(&dword_20847A000, v15, OS_LOG_TYPE_DEFAULT, v17, buf, 0xCu);
      goto LABEL_50;
    }
    v29 = 0;
    -[BluetoothManager _accessoryManager](+[BluetoothManager sharedInstance](BluetoothManager, "sharedInstance"), "_accessoryManager");
    -[BluetoothDevice device](self, "device");
    if (BTAccessoryManagerGetFeatureProxCardStatus())
    {
      v9 = sharedBluetoothManagerLogComponent();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[BluetoothDevice setProxCardShowedForFeature:showed:].cold.6();
    }
    else
    {
      if (a3 == 2 && v4)
      {
        v29 |= 3uLL;
        v12 = sharedBluetoothManagerLogComponent();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          *(_QWORD *)v31 = "Set";
          _os_log_impl(&dword_20847A000, v12, OS_LOG_TYPE_DEFAULT, "Prox Card Status: Adaptive Controls: Set: Status: %s", buf, 0xCu);
        }
      }
      -[BluetoothManager _accessoryManager](+[BluetoothManager sharedInstance](BluetoothManager, "sharedInstance"), "_accessoryManager");
      -[BluetoothDevice device](self, "device");
      if (BTAccessoryManagerSetFeatureProxCardStatus())
      {
        v13 = sharedBluetoothManagerLogComponent();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          -[BluetoothDevice setProxCardShowedForFeature:showed:].cold.5();
      }
    }
  }
  else
  {
    v8 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[BluetoothDevice setProxCardShowedForFeature:showed:].cold.7();
  }
}

- (void)batteryStatus:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_20847A000, v0, v1, "Invalid BTDeviceBatteryStatus", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)setIsHidden:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_20847A000, v0, v1, "Failed to set isHidden : %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)inEarDetectEnabled
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_20847A000, v0, v1, "Failed to get inEar detect enabled : %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)setInEarDetectEnabled:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_20847A000, v0, v1, "Failed to set inEar detect enabled : %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)setSpatialAudioAllowed:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_20847A000, v0, v1, "Failed to set SpatialAudioAllowed : %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)spatialAudioAllowed
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_20847A000, v0, v1, "Failed to get Spatial Allowed : %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)setSpatialAudioMode:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_20847A000, v0, v1, "Failed to set SpatialAudioMode : %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)spatialAudioMode
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_20847A000, v0, v1, "Failed to get Spatial mode : %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)setSmartRouteMode:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_20847A000, v0, v1, "Failed to set smartRouteMode : %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)smartRouteMode
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_20847A000, v0, v1, "Failed to get Smart Routing mode : %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)inEarStatusPrimary:secondary:.cold.1()
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

- (void)micMode
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_20847A000, v0, v1, "Failed to get mic mode : %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)setMicMode:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_20847A000, v0, v1, "Failed to set mic mode : %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)doubleTapAction
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_20847A000, v0, v1, "Failed to get doubleTap action : %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)setDoubleTapAction:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_20847A000, v0, v1, "Failed to set doubleTap action : %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)doubleTapCapability
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_20847A000, v0, v1, "Failed to get doubleTap capabilty : %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)featureCapability:.cold.1()
{
  int v0;
  os_log_t v1;
  uint8_t v2[8];
  __int16 v3;
  int v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2();
  v3 = 1024;
  v4 = v0;
  _os_log_error_impl(&dword_20847A000, v1, OS_LOG_TYPE_ERROR, "Failed to get %d capability : %d", v2, 0xEu);
}

- (void)doubleTapActionEx:rightAction:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_20847A000, v0, v1, "Failed to get doubleTapEx action : %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)setDoubleTapActionEx:rightAction:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_20847A000, v0, v1, "Failed to set doubleTapEx action : %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)listeningMode
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_20847A000, v0, v1, "Failed to get listening mode : %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)setListeningMode:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_20847A000, v0, v1, "Failed to set listening mode : %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)setHeartRateMonitorEnabled:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_20847A000, v0, v1, "Failed to set heart rate monitor state : %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)getHeartRateMonitorEnabled
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_20847A000, v0, v1, "Failed to get heart rate monitor state : %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)listeningModeConfigs
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_20847A000, v0, v1, "Failed to get listening mode configs : %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)setListeningModeConfigs:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_20847A000, v0, v1, "Failed to set listening mode configs : %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)singleClickMode
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_20847A000, v0, v1, "Failed to get single click mode : %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)setSingleClickMode:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_20847A000, v0, v1, "Failed to set single click mode : %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)doubleClickMode
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_20847A000, v0, v1, "Failed to get double click mode : %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)setDoubleClickMode:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_20847A000, v0, v1, "Failed to set double click mode : %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)clickHoldModes:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_20847A000, v0, v1, "Failed to get click hold mode : %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)setClickHoldMode:rightMode:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_20847A000, v0, v1, "Failed to set click hold mode : %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)crownRotationDirection
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_20847A000, v0, v1, "Failed to get crown rotation dir : %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)setCrownRotationDirection:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_20847A000, v0, v1, "Failed to set crown rotation dir : %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)chimeVolume
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_20847A000, v0, v1, "Failed to get chime volume : %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)setChimeVolume:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_20847A000, v0, v1, "Failed to set chime volume : %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)autoAnswerMode
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_20847A000, v0, v1, "Failed to get auto answer mode : %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)setAutoAnswerMode:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_20847A000, v0, v1, "Failed to set auto answer mode : %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)accessorySettingFeatureBitMask
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_20847A000, v0, v1, "Error in retrieving BTAccessorySettings Feature bitmask : %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)pairedDeviceNameUpdated
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_5(&dword_20847A000, a2, a3, "Unable to clear Magic paired device name %@", (uint8_t *)&v3);
}

- (void)getAACPCapabilityInteger:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_20847A000, v0, v1, "BTAccessoryManagerGetAACPCapabilityInteger error %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)setServiceSetting:(void *)a1 key:(NSObject *)a2 value:.cold.1(void *a1, NSObject *a2)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v4 = 138412290;
  v5 = objc_msgSend(a1, "name");
  OUTLINED_FUNCTION_5(&dword_20847A000, a2, v3, "Failed to set service setting for device \"%@\", (uint8_t *)&v4);
}

- (void)getBehaviorForHIDDevice
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_20847A000, v0, v1, "BTM : Failed to get HID device behavior with error: %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)getStereoHFPSupport
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_20847A000, v0, v1, "Failed to get Accessory support Head Tracked FT : %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)getDeviceSoundProfileSupport
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_20847A000, v0, v1, "Failed to get Accessory support for Spatial Profile: : %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)getDeviceSoundProfileAllowed
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_20847A000, v0, v1, "Failed to get Accessory Allowed for Spatial Profile: %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)getSpatialAudioPlatformSupport
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_20847A000, v0, v1, "Failed to get Platform Spatial Audio Support : %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)gyroInformation
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_20847A000, v0, v1, "gyroInformation - Failed to get gyro information. result: %u", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)isGenuineAirPods
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_20847A000, v0, v1, "Failed to get Is Genuine AirPods : %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)getCallManagementConfig
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_20847A000, v0, v1, "Failed to get call managment configuration : %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)setCallConfig:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_20847A000, v0, v1, "Failed to set end call config : %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)getDeviceAdaptiveVolumeMode
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_20847A000, v0, v1, "Adaptive Volume: Failed to get mode - %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)setDeviceAdaptiveVolumeMode:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_20847A000, v0, v1, "Adaptive Volume: Failed to set mode : %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)getAdaptiveVolumeSupport
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_20847A000, v0, v1, "Adaptive Volume: Failed to get support - %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)getAutoANCSupport
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_20847A000, v0, v1, "AutoANC: Failed to get support - %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)getDeviceConversationDetect
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_20847A000, v0, v1, "Conversation Detect: Failed to get mode - %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)setDeviceConversationDetect:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_20847A000, v0, v1, "Conversation Detect: Failed to set mode - %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)getConversationDetectSupport
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_20847A000, v0, v1, "Conversation Detect: Failed to get support - %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)getSSLSupport
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_20847A000, v0, v1, "SSL: Failed to get support - %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)getSSLMode
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_20847A000, v0, v1, "SSL: Failed to get mode - %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)setSSLMode:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_20847A000, v0, v1, "SSL: Failed to set mode - %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)getWirelessSharingSpatialSupport
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_20847A000, v0, v1, "Failed spatial support in WS : %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)isGuestPairingMode
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_20847A000, v0, v1, "Guest Pairing: Failed to get mode, feature not enabled", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)setGuestPairingMode:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_20847A000, v0, v1, "Guest Pairing: Failed to set mode, result: %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)setGuestPairingMode:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_20847A000, v0, v1, "Guest Pairing: Failed to set mode, feature not enabled", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)isProxCardSupportedForFeature:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_20847A000, v0, v1, "Prox Card Status: Mute Call: Support: Failed to get Call Management Status, result: %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)isProxCardSupportedForFeature:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_20847A000, v0, v1, "Prox Card Status: Mute Call: Support: Mute Call Card is NOT supported for this device", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)isProxCardSupportedForFeature:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_20847A000, v0, v1, "Prox Card Status: Feature NOT Enabled, Return as NOT Supported", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)isProxCardShowedForFeature:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_20847A000, v0, v1, "Prox Card Status: Showed: Failed to get Prox Card Status, result: %d, Return as Showed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)isProxCardShowedForFeature:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_20847A000, v0, v1, "Prox Card Status: Feature NOT Enabled, Cannot Get, Return as Showed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)setProxCardShowedForFeature:(uint64_t)a3 showed:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_20847A000, a2, a3, "Prox Card Status: Set: Invalid Call Management Version: %u, Cannot Set", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)setProxCardShowedForFeature:(uint64_t)a3 showed:(uint64_t)a4 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_20847A000, a2, a3, "Prox Card Status: Set: End Call: Invalid Call Management Version: %u", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)setProxCardShowedForFeature:(uint64_t)a3 showed:(uint64_t)a4 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_20847A000, a2, a3, "Prox Card Status: Mute Call: Set: Invalid Call Management Version: %u", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)setProxCardShowedForFeature:showed:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_20847A000, v0, v1, "Prox Card Status: Set: Failed to set Call Management Status, result: %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)setProxCardShowedForFeature:showed:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_20847A000, v0, v1, "Prox Card Status: Failed to Set Prox Card Status, result: %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)setProxCardShowedForFeature:showed:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_20847A000, v0, v1, "Prox Card Status: Set: Failed to get Prox Card Status, result: %d, Return", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)setProxCardShowedForFeature:showed:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_20847A000, v0, v1, "Prox Card Status: Set: Feature NOT Enabled", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
