@implementation BMNowPlayingOutputDevice

- (BMNowPlayingOutputDevice)initWithDeviceType:(unint64_t)a3 deviceSubType:(unint64_t)a4 deviceId:(id)a5
{
  id v8;
  BMNowPlayingOutputDevice *v9;
  BMNowPlayingOutputDevice *v10;
  uint64_t v11;
  NSString *deviceId;
  objc_super v14;

  v8 = a5;
  v14.receiver = self;
  v14.super_class = (Class)BMNowPlayingOutputDevice;
  v9 = -[BMNowPlayingOutputDevice init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_deviceType = a3;
    v9->_deviceSubType = a4;
    v11 = objc_msgSend(v8, "copy");
    deviceId = v10->_deviceId;
    v10->_deviceId = (NSString *)v11;

  }
  return v10;
}

- (id)proto
{
  void *v3;
  unint64_t deviceType;
  uint64_t v5;
  int v6;
  NSObject *v7;
  unint64_t deviceSubType;
  id v9;
  NSObject *v10;

  v3 = (void *)objc_opt_new();
  deviceType = self->_deviceType;
  v5 = 0;
  v6 = 1;
  switch(deviceType)
  {
    case 0uLL:
      break;
    case 1uLL:
      v5 = 1;
      break;
    case 2uLL:
      v5 = 2;
      break;
    case 3uLL:
      v5 = 3;
      break;
    case 4uLL:
      v5 = 4;
      break;
    case 5uLL:
      v5 = 5;
      break;
    default:
      __biome_log_for_category();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        -[BMNowPlayingOutputDevice proto].cold.2(deviceType);

      v6 = 0;
      v5 = 0xFFFFFFFFLL;
      break;
  }
  deviceSubType = self->_deviceSubType;
  if (deviceSubType >= 0x15)
  {
    __biome_log_for_category();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[BMNowPlayingOutputDevice proto].cold.1(deviceSubType);

    goto LABEL_16;
  }
  if (!v6)
  {
LABEL_16:
    v9 = 0;
    goto LABEL_17;
  }
  objc_msgSend(v3, "setOutputDeviceType:", v5);
  objc_msgSend(v3, "setOutputDeviceSubType:", deviceSubType);
  objc_msgSend(v3, "setOutputDeviceId:", self->_deviceId);
  v9 = v3;
LABEL_17:

  return v9;
}

- (unint64_t)hash
{
  unint64_t v2;

  v2 = self->_deviceSubType - self->_deviceType + 32 * self->_deviceType;
  return -[NSString hash](self->_deviceId, "hash") - v2 + 32 * v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  unint64_t deviceType;
  void *deviceSubType;
  NSString *deviceId;
  NSString *v9;
  void *v10;
  char v11;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    deviceType = self->_deviceType;
    if (deviceType == objc_msgSend(v5, "deviceType")
      && (deviceSubType = (void *)self->_deviceSubType, deviceSubType == (void *)objc_msgSend(v5, "deviceSubType")))
    {
      deviceId = self->_deviceId;
      v9 = deviceId;
      if (!deviceId)
      {
        objc_msgSend(v5, "deviceId");
        deviceSubType = (void *)objc_claimAutoreleasedReturnValue();
        if (!deviceSubType)
        {
          v11 = 1;
LABEL_14:

          goto LABEL_11;
        }
        v9 = self->_deviceId;
      }
      objc_msgSend(v5, "deviceId");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[NSString isEqual:](v9, "isEqual:", v10);

      if (!deviceId)
        goto LABEL_14;
    }
    else
    {
      v11 = 0;
    }
LABEL_11:

    goto LABEL_12;
  }
  v11 = 0;
LABEL_12:

  return v11;
}

- (unint64_t)deviceType
{
  return self->_deviceType;
}

- (unint64_t)deviceSubType
{
  return self->_deviceSubType;
}

- (NSString)deviceId
{
  return self->_deviceId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceId, 0);
}

- (void)proto
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_1_5(&dword_18D810000, v2, v3, "BMNowPlayingEvent: unable to convert BMNowPlayingAVOutputDeviceType enum value: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_0_0();
}

@end
