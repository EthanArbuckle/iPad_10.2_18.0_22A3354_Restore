@implementation CSDeviceActivationEvent

- (CSDeviceActivationEvent)initWithType:(unint64_t)a3 deviceId:(id)a4 activationInfo:(id)a5 vadScore:(float)a6 hosttime:(unint64_t)a7
{
  id v13;
  id v14;
  CSDeviceActivationEvent *v15;
  void *v16;
  uint64_t v17;
  NSString *UUID;
  objc_super v20;

  v13 = a4;
  v14 = a5;
  v20.receiver = self;
  v20.super_class = (Class)CSDeviceActivationEvent;
  v15 = -[CSDeviceActivationEvent init](&v20, sel_init);
  if (v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "UUIDString");
    v17 = objc_claimAutoreleasedReturnValue();
    UUID = v15->_UUID;
    v15->_UUID = (NSString *)v17;

    v15->_type = a3;
    objc_storeStrong((id *)&v15->_deviceId, a4);
    objc_storeStrong((id *)&v15->_activationInfo, a5);
    v15->_hosttime = a7;
    v15->_vadScore = a6;
  }

  return v15;
}

- (CSDeviceActivationEvent)initWithType:(unint64_t)a3 deviceId:(id)a4 activationInfo:(id)a5 hosttime:(unint64_t)a6
{
  double v6;

  LODWORD(v6) = 0;
  return -[CSDeviceActivationEvent initWithType:deviceId:activationInfo:vadScore:hosttime:](self, "initWithType:deviceId:activationInfo:vadScore:hosttime:", a3, a4, a5, a6, v6);
}

- (CSDeviceActivationEvent)initWithXPCObject:(id)a3
{
  id v4;
  CSDeviceActivationEvent *v5;
  void *v6;
  uint64_t v7;
  void *UUID;
  uint64_t v9;
  NSString *v10;
  void *v11;
  uint64_t v12;
  NSString *deviceId;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  NSDictionary *activationInfo;
  float v19;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CSDeviceActivationEvent;
  v5 = -[CSDeviceActivationEvent init](&v21, sel_init);
  if (v5)
  {
    xpc_dictionary_get_value(v4, "uuid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", xpc_dictionary_get_string(v4, "uuid"));
      v7 = objc_claimAutoreleasedReturnValue();
      UUID = v5->_UUID;
      v5->_UUID = (NSString *)v7;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      UUID = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(UUID, "UUIDString");
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = v5->_UUID;
      v5->_UUID = (NSString *)v9;

    }
    v5->_type = xpc_dictionary_get_uint64(v4, "type");
    xpc_dictionary_get_value(v4, "deviceId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", xpc_dictionary_get_string(v4, "deviceId"));
      v12 = objc_claimAutoreleasedReturnValue();
      deviceId = v5->_deviceId;
      v5->_deviceId = (NSString *)v12;

    }
    xpc_dictionary_get_value(v4, "activationInfo");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      xpc_dictionary_get_dictionary(v4, "activationInfo");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_alloc(MEMORY[0x1E0C99D80]);
      objc_msgSend(v16, "_cs_initWithXPCObject:", v15);
      v17 = objc_claimAutoreleasedReturnValue();
      activationInfo = v5->_activationInfo;
      v5->_activationInfo = (NSDictionary *)v17;

    }
    v19 = xpc_dictionary_get_double(v4, "vadScore");
    v5->_vadScore = v19;
    v5->_hosttime = xpc_dictionary_get_uint64(v4, "hosttime");
  }

  return v5;
}

- (id)xpcObject
{
  xpc_object_t v3;
  NSString *deviceId;
  NSDictionary *activationInfo;
  void *v6;
  uint64_t i;
  xpc_object_t values[4];
  char *keys[5];

  keys[4] = *(char **)MEMORY[0x1E0C80C00];
  keys[0] = "uuid";
  keys[1] = "type";
  keys[2] = "vadScore";
  keys[3] = "hosttime";
  values[0] = xpc_string_create(-[NSString UTF8String](self->_UUID, "UTF8String"));
  values[1] = xpc_uint64_create(self->_type);
  values[2] = xpc_double_create(self->_vadScore);
  values[3] = xpc_uint64_create(self->_hosttime);
  v3 = xpc_dictionary_create((const char *const *)keys, values, 4uLL);
  deviceId = self->_deviceId;
  if (deviceId)
    xpc_dictionary_set_string(v3, "deviceId", -[NSString UTF8String](deviceId, "UTF8String"));
  activationInfo = self->_activationInfo;
  if (activationInfo)
  {
    -[NSDictionary _cs_xpcObject](activationInfo, "_cs_xpcObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    xpc_dictionary_set_value(v3, "activationInfo", v6);

  }
  for (i = 3; i != -1; --i)

  return v3;
}

- (NSString)localizedDescription
{
  id v3;
  void *v4;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v3, "appendFormat:", CFSTR("[%@]"), self->_UUID);
  -[CSDeviceActivationEvent _activationTypeString](self, "_activationTypeString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("[%@]"), v4);

  objc_msgSend(v3, "appendFormat:", CFSTR("[%@]"), self->_deviceId);
  objc_msgSend(v3, "appendFormat:", CFSTR("[%llu]"), self->_hosttime);
  objc_msgSend(v3, "appendFormat:", CFSTR("[%f]"), self->_vadScore);
  objc_msgSend(v3, "appendFormat:", CFSTR("[%@]"), self->_activationInfo);
  return (NSString *)v3;
}

- (id)_activationTypeString
{
  unint64_t v2;

  v2 = self->_type - 1;
  if (v2 > 7)
    return CFSTR("Unknown");
  else
    return off_1E68802C8[v2];
}

- (NSString)UUID
{
  return self->_UUID;
}

- (unint64_t)type
{
  return self->_type;
}

- (NSString)deviceId
{
  return self->_deviceId;
}

- (NSDictionary)activationInfo
{
  return self->_activationInfo;
}

- (unint64_t)hosttime
{
  return self->_hosttime;
}

- (float)vadScore
{
  return self->_vadScore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activationInfo, 0);
  objc_storeStrong((id *)&self->_deviceId, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
}

+ (id)remoteMicVoiceTriggerEvent:(id)a3 activationInfo:(id)a4 hostTime:(unint64_t)a5
{
  id v7;
  id v8;
  CSDeviceActivationEvent *v9;
  double v10;
  CSDeviceActivationEvent *v11;

  v7 = a4;
  v8 = a3;
  v9 = [CSDeviceActivationEvent alloc];
  LODWORD(v10) = 0;
  v11 = -[CSDeviceActivationEvent initWithType:deviceId:activationInfo:vadScore:hosttime:](v9, "initWithType:deviceId:activationInfo:vadScore:hosttime:", 2, v8, v7, a5, v10);

  return v11;
}

+ (id)remoteMicVADEvent:(id)a3 vadScore:(float)a4 hostTime:(unint64_t)a5
{
  id v7;
  CSDeviceActivationEvent *v8;
  double v9;
  CSDeviceActivationEvent *v10;

  v7 = a3;
  v8 = [CSDeviceActivationEvent alloc];
  *(float *)&v9 = a4;
  v10 = -[CSDeviceActivationEvent initWithType:deviceId:activationInfo:vadScore:hosttime:](v8, "initWithType:deviceId:activationInfo:vadScore:hosttime:", 3, v7, 0, a5, v9);

  return v10;
}

+ (id)builtInMicVoiceTriggerEvent:(id)a3 hostTime:(unint64_t)a4
{
  id v5;
  CSDeviceActivationEvent *v6;
  double v7;
  CSDeviceActivationEvent *v8;

  v5 = a3;
  v6 = [CSDeviceActivationEvent alloc];
  LODWORD(v7) = 0;
  v8 = -[CSDeviceActivationEvent initWithType:deviceId:activationInfo:vadScore:hosttime:](v6, "initWithType:deviceId:activationInfo:vadScore:hosttime:", 1, 0, v5, a4, v7);

  return v8;
}

+ (id)jarvisVoiceTriggerEvent:(id)a3 activationInfo:(id)a4 hostTime:(unint64_t)a5
{
  id v7;
  id v8;
  CSDeviceActivationEvent *v9;
  double v10;
  CSDeviceActivationEvent *v11;

  v7 = a4;
  v8 = a3;
  v9 = [CSDeviceActivationEvent alloc];
  LODWORD(v10) = 0;
  v11 = -[CSDeviceActivationEvent initWithType:deviceId:activationInfo:vadScore:hosttime:](v9, "initWithType:deviceId:activationInfo:vadScore:hosttime:", 6, v8, v7, a5, v10);

  return v11;
}

+ (id)remoraVoiceTriggerEvent:(id)a3 hostTime:(unint64_t)a4
{
  id v5;
  CSDeviceActivationEvent *v6;

  v5 = a3;
  v6 = -[CSDeviceActivationEvent initWithType:deviceId:activationInfo:hosttime:]([CSDeviceActivationEvent alloc], "initWithType:deviceId:activationInfo:hosttime:", 8, v5, 0, a4);

  return v6;
}

+ (id)remoraVoiceTriggerEvent:(id)a3 activationInfo:(id)a4 hostTime:(unint64_t)a5
{
  id v7;
  id v8;
  CSDeviceActivationEvent *v9;

  v7 = a4;
  v8 = a3;
  v9 = -[CSDeviceActivationEvent initWithType:deviceId:activationInfo:hosttime:]([CSDeviceActivationEvent alloc], "initWithType:deviceId:activationInfo:hosttime:", 8, v8, v7, a5);

  return v9;
}

+ (id)mediaserverdLaunchedEvent:(unint64_t)a3
{
  return -[CSDeviceActivationEvent initWithType:deviceId:activationInfo:hosttime:]([CSDeviceActivationEvent alloc], "initWithType:deviceId:activationInfo:hosttime:", 7, 0, 0, a3);
}

@end
