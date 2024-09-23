@implementation HDIDSDestination

- (HDIDSDestination)initWithDeviceFilterBlock:(id)a3
{
  id v4;
  HDIDSDestination *v5;
  uint64_t v6;
  id deviceFilterBlock;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HDIDSDestination;
  v5 = -[HDIDSDestination init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    deviceFilterBlock = v5->_deviceFilterBlock;
    v5->_deviceFilterBlock = (id)v6;

  }
  return v5;
}

+ (id)initWithAllowedDeviceTypes:(id)a3
{
  id v3;
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v3 = a3;
  v4 = objc_alloc((Class)objc_opt_class());
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __47__HDIDSDestination_initWithAllowedDeviceTypes___block_invoke;
  v8[3] = &unk_1E6D0F6F0;
  v9 = v3;
  v5 = v3;
  v6 = (void *)objc_msgSend(v4, "initWithDeviceFilterBlock:", v8);

  return v6;
}

uint64_t __47__HDIDSDestination_initWithAllowedDeviceTypes___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsInteger:", objc_msgSend(a2, "deviceType"));
}

+ (id)validHealthSoftwareDeviceTypes
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[5];

  v10[4] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v5;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 6);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[3] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)deviceFilterBlock
{
  return self->_deviceFilterBlock;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_deviceFilterBlock, 0);
}

@end
