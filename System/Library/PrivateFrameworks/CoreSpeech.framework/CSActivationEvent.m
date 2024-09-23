@implementation CSActivationEvent

- (CSActivationEvent)initWithType:(unint64_t)a3 deviceId:(id)a4 activationInfo:(id)a5 vadScore:(float)a6 hosttime:(unint64_t)a7
{
  id v12;
  id v13;
  CSActivationEvent *v14;
  id v15;
  double v16;
  uint64_t v17;
  CSDeviceActivationEvent *deviceActivationEvent;
  objc_super v20;

  v12 = a4;
  v13 = a5;
  v20.receiver = self;
  v20.super_class = (Class)CSActivationEvent;
  v14 = -[CSActivationEvent init](&v20, sel_init);
  if (v14)
  {
    v15 = objc_alloc(MEMORY[0x1E0D190A0]);
    *(float *)&v16 = a6;
    v17 = objc_msgSend(v15, "initWithType:deviceId:activationInfo:vadScore:hosttime:", a3, v12, v13, a7, v16);
    deviceActivationEvent = v14->_deviceActivationEvent;
    v14->_deviceActivationEvent = (CSDeviceActivationEvent *)v17;

  }
  return v14;
}

- (CSActivationEvent)initWithType:(unint64_t)a3 deviceId:(id)a4 activationInfo:(id)a5 hosttime:(unint64_t)a6
{
  double v6;

  LODWORD(v6) = 0;
  return -[CSActivationEvent initWithType:deviceId:activationInfo:vadScore:hosttime:](self, "initWithType:deviceId:activationInfo:vadScore:hosttime:", a3, a4, a5, a6, v6);
}

- (CSActivationEvent)initWithXPCObject:(id)a3
{
  id v4;
  CSActivationEvent *v5;
  CSActivationEvent *v6;
  uint64_t v7;
  CSDeviceActivationEvent *deviceActivationEvent;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CSActivationEvent;
  v5 = -[CSActivationEvent init](&v10, sel_init);
  if (!v5)
    goto LABEL_4;
  xpc_dictionary_get_value(v4, "deviceActivationEvent");
  v6 = (CSActivationEvent *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0D190A0]), "initWithXPCObject:", v6);
    deviceActivationEvent = v5->_deviceActivationEvent;
    v5->_deviceActivationEvent = (CSDeviceActivationEvent *)v7;

LABEL_4:
    v6 = v5;
  }

  return v6;
}

- (id)xpcObject
{
  xpc_object_t v2;
  xpc_object_t values;
  char *keys[2];

  keys[1] = *(char **)MEMORY[0x1E0C80C00];
  keys[0] = "deviceActivationEvent";
  -[CSDeviceActivationEvent xpcObject](self->_deviceActivationEvent, "xpcObject");
  values = (xpc_object_t)objc_claimAutoreleasedReturnValue();
  v2 = xpc_dictionary_create((const char *const *)keys, &values, 1uLL);

  return v2;
}

- (NSString)UUID
{
  return (NSString *)-[CSDeviceActivationEvent UUID](self->_deviceActivationEvent, "UUID");
}

- (unint64_t)type
{
  return -[CSDeviceActivationEvent type](self->_deviceActivationEvent, "type");
}

- (NSString)deviceId
{
  return (NSString *)-[CSDeviceActivationEvent deviceId](self->_deviceActivationEvent, "deviceId");
}

- (NSDictionary)activationInfo
{
  return (NSDictionary *)-[CSDeviceActivationEvent activationInfo](self->_deviceActivationEvent, "activationInfo");
}

- (unint64_t)hosttime
{
  return -[CSDeviceActivationEvent hosttime](self->_deviceActivationEvent, "hosttime");
}

- (float)vadScore
{
  float result;

  -[CSDeviceActivationEvent vadScore](self->_deviceActivationEvent, "vadScore");
  return result;
}

- (NSString)localizedDescription
{
  return (NSString *)-[CSDeviceActivationEvent localizedDescription](self->_deviceActivationEvent, "localizedDescription");
}

- (CSDeviceActivationEvent)deviceActivationEvent
{
  return self->_deviceActivationEvent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceActivationEvent, 0);
}

+ (id)remoteMicVoiceTriggerEvent:(id)a3 activationInfo:(id)a4 hostTime:(unint64_t)a5
{
  id v7;
  id v8;
  CSActivationEvent *v9;
  double v10;
  CSActivationEvent *v11;

  v7 = a4;
  v8 = a3;
  v9 = [CSActivationEvent alloc];
  LODWORD(v10) = 0;
  v11 = -[CSActivationEvent initWithType:deviceId:activationInfo:vadScore:hosttime:](v9, "initWithType:deviceId:activationInfo:vadScore:hosttime:", 2, v8, v7, a5, v10);

  return v11;
}

+ (id)remoteMicVADEvent:(id)a3 vadScore:(float)a4 hostTime:(unint64_t)a5
{
  id v7;
  CSActivationEvent *v8;
  double v9;
  CSActivationEvent *v10;

  v7 = a3;
  v8 = [CSActivationEvent alloc];
  *(float *)&v9 = a4;
  v10 = -[CSActivationEvent initWithType:deviceId:activationInfo:vadScore:hosttime:](v8, "initWithType:deviceId:activationInfo:vadScore:hosttime:", 3, v7, 0, a5, v9);

  return v10;
}

+ (id)builtInMicVoiceTriggerEvent:(id)a3 hostTime:(unint64_t)a4
{
  id v5;
  CSActivationEvent *v6;
  double v7;
  CSActivationEvent *v8;

  v5 = a3;
  v6 = [CSActivationEvent alloc];
  LODWORD(v7) = 0;
  v8 = -[CSActivationEvent initWithType:deviceId:activationInfo:vadScore:hosttime:](v6, "initWithType:deviceId:activationInfo:vadScore:hosttime:", 1, 0, v5, a4, v7);

  return v8;
}

+ (id)jarvisVoiceTriggerEvent:(id)a3 activationInfo:(id)a4 hostTime:(unint64_t)a5
{
  id v7;
  id v8;
  CSActivationEvent *v9;
  double v10;
  CSActivationEvent *v11;

  v7 = a4;
  v8 = a3;
  v9 = [CSActivationEvent alloc];
  LODWORD(v10) = 0;
  v11 = -[CSActivationEvent initWithType:deviceId:activationInfo:vadScore:hosttime:](v9, "initWithType:deviceId:activationInfo:vadScore:hosttime:", 6, v8, v7, a5, v10);

  return v11;
}

+ (id)remoraVoiceTriggerEvent:(id)a3 hostTime:(unint64_t)a4
{
  id v5;
  CSActivationEvent *v6;

  v5 = a3;
  v6 = -[CSActivationEvent initWithType:deviceId:activationInfo:hosttime:]([CSActivationEvent alloc], "initWithType:deviceId:activationInfo:hosttime:", 8, v5, 0, a4);

  return v6;
}

+ (id)remoraVoiceTriggerEvent:(id)a3 activationInfo:(id)a4 hostTime:(unint64_t)a5
{
  id v7;
  id v8;
  CSActivationEvent *v9;

  v7 = a4;
  v8 = a3;
  v9 = -[CSActivationEvent initWithType:deviceId:activationInfo:hosttime:]([CSActivationEvent alloc], "initWithType:deviceId:activationInfo:hosttime:", 8, v8, v7, a5);

  return v9;
}

+ (id)mediaserverdLaunchedEvent:(unint64_t)a3
{
  return -[CSActivationEvent initWithType:deviceId:activationInfo:hosttime:]([CSActivationEvent alloc], "initWithType:deviceId:activationInfo:hosttime:", 7, 0, 0, a3);
}

@end
