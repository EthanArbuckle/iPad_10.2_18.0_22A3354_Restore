@implementation MLComputePlanDeviceUsageSupportInfo

- (MLComputePlanDeviceUsageSupportInfo)initWithComputeDevice:(id)a3 supportState:(int64_t)a4
{
  id v7;
  MLComputePlanDeviceUsageSupportInfo *v8;
  MLComputePlanDeviceUsageSupportInfo *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MLComputePlanDeviceUsageSupportInfo;
  v8 = -[MLComputePlanDeviceUsageSupportInfo init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_computeDevice, a3);
    v9->_state = a4;
  }

  return v9;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLComputePlanDeviceUsageSupportInfo computeDevice](self, "computeDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> Compute device: %@, Support state: %zd"), v5, self, v6, -[MLComputePlanDeviceUsageSupportInfo state](self, "state"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (int64_t)state
{
  return self->_state;
}

- (MLComputeDeviceProtocol)computeDevice
{
  return self->_computeDevice;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_computeDevice, 0);
}

@end
