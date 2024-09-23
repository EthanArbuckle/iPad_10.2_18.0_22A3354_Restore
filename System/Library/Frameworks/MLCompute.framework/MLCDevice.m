@implementation MLCDevice

+ (MLCDevice)cpuDevice
{
  return (MLCDevice *)objc_msgSend(a1, "deviceWithType:", 0);
}

+ (MLCDevice)gpuDevice
{
  return (MLCDevice *)objc_msgSend(a1, "deviceWithType:", 1);
}

+ (MLCDevice)aneDevice
{
  return (MLCDevice *)objc_msgSend(a1, "deviceWithType:", 3);
}

+ (MLCDevice)deviceWithType:(MLCDeviceType)type
{
  return (MLCDevice *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithType:selectsMultipleComputeDevices:", *(_QWORD *)&type, 0);
}

+ (MLCDevice)deviceWithType:(MLCDeviceType)type selectsMultipleComputeDevices:(BOOL)selectsMultipleComputeDevices
{
  return (MLCDevice *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithType:selectsMultipleComputeDevices:", *(_QWORD *)&type, selectsMultipleComputeDevices);
}

+ (MLCDevice)deviceWithGPUDevices:(NSArray *)gpus
{
  NSArray *v5;
  void *v6;
  NSObject *v7;

  v5 = gpus;
  if (-[NSArray count](v5, "count"))
  {
    v6 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithGPUs:", v5);
  }
  else
  {
    +[MLCLog framework](MLCLog, "framework");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      +[MLCDevice deviceWithGPUDevices:].cold.1(a2, v7);

    v6 = 0;
  }

  return (MLCDevice *)v6;
}

- (MLCDevice)init
{
  return -[MLCDevice initWithType:selectsMultipleComputeDevices:](self, "initWithType:selectsMultipleComputeDevices:", 2, 0);
}

- (MLCDevice)initWithType:(int)a3 selectsMultipleComputeDevices:(BOOL)a4
{
  uint64_t v5;
  MLCDeviceANE *v6;
  MLCDevice *v7;
  void *v8;
  uint64_t v9;

  if (a3 == 2)
    v5 = 0;
  else
    v5 = a3;
  if ((_DWORD)v5 == 3)
  {
    v6 = -[MLCDeviceANE initWithType:]([MLCDeviceANE alloc], "initWithType:", 3);
    if (v6)
      goto LABEL_10;
  }
  else
  {
    if (!(_DWORD)v5)
    {
      v6 = -[MLCDeviceCPU initWithType:]([MLCDeviceCPU alloc], "initWithType:", 0);
LABEL_10:
      self = -[MLCDevice initWithType:engine:](self, "initWithType:engine:", v5, v6);
      v7 = self;
      goto LABEL_11;
    }
    v6 = -[MLCDeviceGPU initWithType:selectsMultipleComputeDevices:]([MLCDeviceGPU alloc], "initWithType:selectsMultipleComputeDevices:", v5, a4);
    -[MLCDeviceANE deviceList](v6, "deviceList");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    if (v9)
      goto LABEL_10;
  }
  v7 = 0;
LABEL_11:

  return v7;
}

- (MLCDevice)initWithGPUs:(id)a3
{
  id v4;
  MLCDeviceGPU *v5;
  MLCDeviceGPU *v6;
  void *v7;
  uint64_t v8;
  MLCDevice *v9;

  v4 = a3;
  v5 = -[MLCDeviceGPU initWithDeviceList:]([MLCDeviceGPU alloc], "initWithDeviceList:", v4);

  if (v5
    && (v6 = v5,
        -[MLCDeviceGPU deviceList](v6, "deviceList"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "count"),
        v7,
        v8))
  {
    self = -[MLCDevice initWithType:engine:](self, "initWithType:engine:", 1, v6);
    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (MLCDevice)initWithType:(int)a3 engine:(id)a4
{
  id v7;
  MLCDevice *v8;
  MLCDevice *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MLCDevice;
  v8 = -[MLCDevice init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_type = a3;
    objc_storeStrong((id *)&v8->_engine, a4);
    objc_storeStrong((id *)&v9->_computeEngine, a4);
  }

  return v9;
}

- (void)switchToCPUDevice
{
  void *v3;
  MLCDeviceCPU *v4;

  -[MLCDevice setType:](self, "setType:", 0);
  v4 = -[MLCDeviceCPU initWithType:]([MLCDeviceCPU alloc], "initWithType:", 0);
  v3 = (void *)MEMORY[0x1D8263D2C]();
  -[MLCDevice setEngine:](self, "setEngine:", v4);
  -[MLCDevice setComputeEngine:](self, "setComputeEngine:", v4);
  objc_autoreleasePoolPop(v3);

}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MLCDevice type](self, "type");
  -[MLCDevice computeEngine](self, "computeEngine");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: { deviceType=%d : computeEngine=%@ }"), v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSArray)gpuDevices
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;

  -[MLCDevice engine](self, "engine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deviceList");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "conformsToProtocol:", &unk_1EFEE2530);

  if (v6)
  {
    -[MLCDevice engine](self, "engine");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "deviceList");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");

  }
  else
  {
    v9 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "copy");
  }
  return (NSArray *)v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  v5 = -[MLCDevice type](self, "type");
  -[MLCDevice computeEngine](self, "computeEngine");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithType:engine:", v5, v6);

  return v7;
}

- (BOOL)isEqualToDevice:(id)a3
{
  id v4;
  MLCDeviceType v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  char v10;

  v4 = a3;
  if (v4 && (v5 = -[MLCDevice type](self, "type"), v5 == objc_msgSend(v4, "type")))
  {
    -[MLCDevice computeEngine](self, "computeEngine");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      -[MLCDevice computeEngine](self, "computeEngine");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "computeEngine");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqual:", v9);

    }
    else
    {
      v10 = 1;
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  MLCDevice *v4;
  MLCDevice *v5;
  BOOL v6;

  v4 = (MLCDevice *)a3;
  v5 = v4;
  if (self == v4)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[MLCDevice isEqualToDevice:](self, "isEqualToDevice:", v5);

  return v6;
}

- (unint64_t)hash
{
  return -[MLCDevice type](self, "type");
}

- (MLCDeviceType)actualDeviceType
{
  MLCDeviceType result;
  void *v4;
  char isKindOfClass;

  result = -[MLCDevice type](self, "type");
  if (result == MLCDeviceTypeAny)
  {
    -[MLCDevice engine](self, "engine");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    return isKindOfClass & 1;
  }
  return result;
}

- (MLCDeviceType)type
{
  return self->_type;
}

- (void)setType:(int)a3
{
  self->_type = a3;
}

- (MLCDeviceProperties)engine
{
  return self->_engine;
}

- (void)setEngine:(id)a3
{
  objc_storeStrong((id *)&self->_engine, a3);
}

- (MLComputeEngineControl)computeEngine
{
  return self->_computeEngine;
}

- (void)setComputeEngine:(id)a3
{
  objc_storeStrong((id *)&self->_computeEngine, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_computeEngine, 0);
  objc_storeStrong((id *)&self->_engine, 0);
}

+ (void)deviceWithGPUDevices:(const char *)a1 .cold.1(const char *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_1D4999000, a2, OS_LOG_TYPE_ERROR, "%@: No GPUs specified", (uint8_t *)&v4, 0xCu);

}

@end
