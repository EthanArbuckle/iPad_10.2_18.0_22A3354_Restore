@implementation MLGPUComputeDevice

+ (MLGPUComputeDevice)deviceWithMetalDevice:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithMetalDevice:", v4);

  return (MLGPUComputeDevice *)v5;
}

- (MLGPUComputeDevice)initWithMetalDevice:(id)a3
{
  id v5;
  MLGPUComputeDevice *v6;
  MLGPUComputeDevice *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MLGPUComputeDevice;
  v6 = -[MLGPUComputeDevice init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_metalDevice, a3);

  return v7;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[MLGPUComputeDevice metalDevice](self, "metalDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<MLGPUComputeDevice: %p> %@"), self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (BOOL)isEqual:(id)a3
{
  MLGPUComputeDevice *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  BOOL v8;

  v4 = (MLGPUComputeDevice *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[MLGPUComputeDevice metalDevice](v4, "metalDevice");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "registryID");
      -[MLGPUComputeDevice metalDevice](self, "metalDevice");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v6 == objc_msgSend(v7, "registryID");

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  void *v2;
  void *v3;
  void *v4;
  unint64_t v5;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  -[MLGPUComputeDevice metalDevice](self, "metalDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "numberWithUnsignedLongLong:", objc_msgSend(v3, "registryID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");

  return v5;
}

- (id)metalDevice
{
  return self->_metalDevice;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metalDevice, 0);
}

@end
