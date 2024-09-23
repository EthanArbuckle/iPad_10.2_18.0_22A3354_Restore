@implementation MXMOSLogDeviceStore_Internal

+ (MXMOSLogDeviceStore_Internal)shared
{
  if (shared_onceToken != -1)
    dispatch_once(&shared_onceToken, &__block_literal_global_3);
  return (MXMOSLogDeviceStore_Internal *)(id)shared__internalStore;
}

- (MXMOSLogDeviceStore_Internal)init
{
  MXMOSLogDeviceStore_Internal *v2;
  uint64_t v3;
  NSMutableDictionary *devices;
  OSActivityStream *v5;
  OSActivityStream *stream;
  MXMOSLogDevice_Internal *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  MXMProbeableDevice *hostDevice;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)MXMOSLogDeviceStore_Internal;
  v2 = -[MXMOSLogDeviceStore_Internal init](&v13, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    devices = v2->_devices;
    v2->_devices = (NSMutableDictionary *)v3;

    v5 = (OSActivityStream *)objc_alloc_init(MEMORY[0x24BE60C58]);
    stream = v2->_stream;
    v2->_stream = v5;

    -[OSActivityStream setDeviceDelegate:](v2->_stream, "setDeviceDelegate:", v2);
    v7 = [MXMOSLogDevice_Internal alloc];
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "UUIDString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[MXMOSLogDevice_Internal initWithName:identifier:](v7, "initWithName:identifier:", CFSTR("Unknown"), v9);
    hostDevice = v2->_hostDevice;
    v2->_hostDevice = (MXMProbeableDevice *)v10;

  }
  return v2;
}

- (BOOL)activityStream:(id)a3 deviceUDID:(id)a4 deviceID:(id)a5 status:(int64_t)a6 error:(id)a7
{
  id v9;
  id v10;
  void *v11;
  MXMOSLogDevice_Internal *v12;
  void *v13;

  v9 = a4;
  v10 = a5;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_devices, "objectForKeyedSubscript:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    v12 = -[MXMOSLogDevice_Internal initWithOSLogDevice:]([MXMOSLogDevice_Internal alloc], "initWithOSLogDevice:", v10);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_devices, "setObject:forKeyedSubscript:", v12, v9);

  }
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "postNotificationName:object:", CFSTR("kMXMOSLogProbeDidUpdateConnectedDevicesList"), 0);

  return 1;
}

- (MXMProbeableDevice)hostDevice
{
  return self->_hostDevice;
}

- (NSMutableDictionary)devices
{
  return self->_devices;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_devices, 0);
  objc_storeStrong((id *)&self->_hostDevice, 0);
  objc_storeStrong((id *)&self->_stream, 0);
}

@end
