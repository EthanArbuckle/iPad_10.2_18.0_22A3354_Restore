@implementation CSRemoteDeviceProtocolInfo

- (CSRemoteDeviceProtocolInfo)initWithProtocolVersion:(unint64_t)a3 buildVersion:(id)a4 deviceProductVersion:(id)a5 deviceProductType:(id)a6 deviceCategory:(unint64_t)a7
{
  id v13;
  id v14;
  id v15;
  CSRemoteDeviceProtocolInfo *v16;
  CSRemoteDeviceProtocolInfo *v17;
  objc_super v19;

  v13 = a4;
  v14 = a5;
  v15 = a6;
  v19.receiver = self;
  v19.super_class = (Class)CSRemoteDeviceProtocolInfo;
  v16 = -[CSRemoteDeviceProtocolInfo init](&v19, sel_init);
  v17 = v16;
  if (v16)
  {
    v16->_protocolVersion = a3;
    objc_storeStrong((id *)&v16->_buildVersion, a4);
    objc_storeStrong((id *)&v17->_deviceProductVersion, a5);
    objc_storeStrong((id *)&v17->_deviceProductType, a6);
    v17->_deviceCategory = a7;
  }

  return v17;
}

- (CSRemoteDeviceProtocolInfo)initWithXPCObject:(id)a3
{
  id v4;
  CSRemoteDeviceProtocolInfo *v5;
  void *v6;
  uint64_t v7;
  NSString *buildVersion;
  void *v9;
  uint64_t v10;
  NSString *deviceProductVersion;
  void *v12;
  uint64_t v13;
  NSString *deviceProductType;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CSRemoteDeviceProtocolInfo;
  v5 = -[CSRemoteDeviceProtocolInfo init](&v16, sel_init);
  if (v5)
  {
    v5->_protocolVersion = xpc_dictionary_get_uint64(v4, "protocolVersion");
    v5->_deviceCategory = xpc_dictionary_get_uint64(v4, "deviceCategory");
    xpc_dictionary_get_value(v4, "buildVersion");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", xpc_dictionary_get_string(v4, "buildVersion"));
      v7 = objc_claimAutoreleasedReturnValue();
      buildVersion = v5->_buildVersion;
      v5->_buildVersion = (NSString *)v7;

    }
    xpc_dictionary_get_value(v4, "deviceProductVersion");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", xpc_dictionary_get_string(v4, "deviceProductVersion"));
      v10 = objc_claimAutoreleasedReturnValue();
      deviceProductVersion = v5->_deviceProductVersion;
      v5->_deviceProductVersion = (NSString *)v10;

    }
    xpc_dictionary_get_value(v4, "deviceProductType");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", xpc_dictionary_get_string(v4, "deviceProductType"));
      v13 = objc_claimAutoreleasedReturnValue();
      deviceProductType = v5->_deviceProductType;
      v5->_deviceProductType = (NSString *)v13;

    }
  }

  return v5;
}

- (OS_xpc_object)xpcObject
{
  xpc_object_t v3;
  NSString *buildVersion;
  NSString *deviceProductVersion;
  NSString *deviceProductType;
  uint64_t i;
  xpc_object_t values[2];
  char *keys[3];

  keys[2] = *(char **)MEMORY[0x1E0C80C00];
  keys[0] = "protocolVersion";
  keys[1] = "deviceCategory";
  values[0] = xpc_uint64_create(self->_protocolVersion);
  values[1] = xpc_uint64_create(self->_deviceCategory);
  v3 = xpc_dictionary_create((const char *const *)keys, values, 2uLL);
  buildVersion = self->_buildVersion;
  if (buildVersion)
    xpc_dictionary_set_string(v3, "buildVersion", -[NSString UTF8String](buildVersion, "UTF8String"));
  deviceProductVersion = self->_deviceProductVersion;
  if (deviceProductVersion)
    xpc_dictionary_set_string(v3, "deviceProductVersion", -[NSString UTF8String](deviceProductVersion, "UTF8String"));
  deviceProductType = self->_deviceProductType;
  if (deviceProductType)
    xpc_dictionary_set_string(v3, "deviceProductType", -[NSString UTF8String](deviceProductType, "UTF8String"));
  for (i = 1; i != -1; --i)

  return (OS_xpc_object *)v3;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("protocolVersion=%lu, deviceCategory=%lu, buildVersion=%@, deviceProductVersion=%@, deviceProductType=%@"), self->_protocolVersion, self->_deviceCategory, self->_buildVersion, self->_deviceProductVersion, self->_deviceProductType);
}

- (unint64_t)protocolVersion
{
  return self->_protocolVersion;
}

- (NSString)buildVersion
{
  return self->_buildVersion;
}

- (NSString)deviceProductVersion
{
  return self->_deviceProductVersion;
}

- (NSString)deviceProductType
{
  return self->_deviceProductType;
}

- (unint64_t)deviceCategory
{
  return self->_deviceCategory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceProductType, 0);
  objc_storeStrong((id *)&self->_deviceProductVersion, 0);
  objc_storeStrong((id *)&self->_buildVersion, 0);
}

+ (id)defaultProtocolInfo
{
  return -[CSRemoteDeviceProtocolInfo initWithProtocolVersion:buildVersion:deviceProductVersion:deviceProductType:deviceCategory:]([CSRemoteDeviceProtocolInfo alloc], "initWithProtocolVersion:buildVersion:deviceProductVersion:deviceProductType:deviceCategory:", 1, CFSTR("Unknown"), CFSTR("Unknown"), CFSTR("Unknown"), 0);
}

+ (id)localDeviceProtocolInfo
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  CSRemoteDeviceProtocolInfo *v7;
  int v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D19260], "deviceBuildVersion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D19260], "deviceProductVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D19260], "deviceProductType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = objc_msgSend(MEMORY[0x1E0D19260], "isDarwinOS");
  if ((CSIsIPad() & 1) != 0)
  {
    v5 = 5;
  }
  else if (CSIsOSX())
  {
    if ((objc_msgSend(MEMORY[0x1E0D19260], "hasRemoteBuiltInMic") & 1) != 0)
    {
      v5 = 2;
    }
    else if (CSIsASMacWithAOP())
    {
      v5 = 3;
    }
    else
    {
      v5 = 4;
    }
  }
  else
  {
    v5 = v5;
    v6 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
    {
      v9 = 136315138;
      v10 = "+[CSRemoteDeviceProtocolInfo localDeviceProtocolInfo]";
      _os_log_error_impl(&dword_1C2614000, v6, OS_LOG_TYPE_ERROR, "%s Unsupported protocol for this device", (uint8_t *)&v9, 0xCu);
    }
  }
  v7 = -[CSRemoteDeviceProtocolInfo initWithProtocolVersion:buildVersion:deviceProductVersion:deviceProductType:deviceCategory:]([CSRemoteDeviceProtocolInfo alloc], "initWithProtocolVersion:buildVersion:deviceProductVersion:deviceProductType:deviceCategory:", 4, v2, v3, v4, v5);

  return v7;
}

@end
