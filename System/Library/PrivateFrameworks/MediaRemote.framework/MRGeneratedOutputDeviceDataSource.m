@implementation MRGeneratedOutputDeviceDataSource

- (MRGeneratedOutputDeviceDataSource)initWithConfiguration:(id)a3
{
  id v5;
  MRGeneratedOutputDeviceDataSource *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSString *identifier;
  void *v13;
  uint64_t i;
  MROutputDevice *v15;
  uint64_t v16;
  NSSet *availableOutputDevices;
  objc_super v19;

  v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)MRGeneratedOutputDeviceDataSource;
  v6 = -[MRGeneratedOutputDeviceDataSource init](&v19, sel_init);
  if (v6)
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "description");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("%@ | %@"), v9, v10);
    v11 = objc_claimAutoreleasedReturnValue();
    identifier = v6->_identifier;
    v6->_identifier = (NSString *)v11;

    objc_storeStrong((id *)&v6->_configuration, a3);
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    for (i = 0; i != 10; ++i)
    {
      v15 = objc_alloc_init(MROutputDevice);
      -[MRGeneratedOutputDeviceDataSource customizeOutputDevice:atIndex:](v6, "customizeOutputDevice:atIndex:", v15, i);
      objc_msgSend(v13, "addObject:", v15);

    }
    v16 = objc_msgSend(v13, "copy");
    availableOutputDevices = v6->_availableOutputDevices;
    v6->_availableOutputDevices = (NSSet *)v16;

  }
  return v6;
}

- (void)customizeOutputDevice:(id)a3 atIndex:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  int v10;
  int v11;
  id v12;

  v12 = a3;
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setDeviceID:", v8);

  objc_msgSend(v12, "setTitle:", v6);
  if (a4 == 4)
  {
    objc_msgSend(v12, "setTitle:", CFSTR("iPhone"));
    objc_msgSend(v12, "setSymbolName:", CFSTR("iphone"));
    objc_msgSend(v12, "setSection:", 0);
    v9 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    objc_msgSend(v12, "setSymbolName:", CFSTR("homepod.fill"));
    v10 = rand();
    v11 = v10 & 1;
    if (v10 < 0)
      v11 = -v11;
    objc_msgSend(v12, "setSection:", (v11 + 1));
    v9 = rand() % 10;
  }
  objc_msgSend(v12, "setPriority:", v9);

}

- (void)setDiscoveryMode:(unint64_t)a3
{
  self->_discoveryMode = a3;
}

- (void)performModification:(id)a3 completion:(id)a4
{
  objc_msgSend(a3, "type");
}

- (BOOL)compatibleWithConfiguration:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[MRGeneratedOutputDeviceDataSource configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqual:", v4);

  return v6;
}

+ (BOOL)compatibleWithConfiguration:(id)a3
{
  return 0;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (MROutputDeviceConfiguration)configuration
{
  return self->_configuration;
}

- (unint64_t)discoveryMode
{
  return self->_discoveryMode;
}

- (NSSet)availableOutputDevices
{
  return self->_availableOutputDevices;
}

- (NSSet)pendingOutputDevices
{
  return self->_pendingOutputDevices;
}

- (NSSet)selectedOutputDevices
{
  return self->_selectedOutputDevices;
}

- (MROutputDeviceDataSourceDelegate)delegate
{
  return (MROutputDeviceDataSourceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_selectedOutputDevices, 0);
  objc_storeStrong((id *)&self->_pendingOutputDevices, 0);
  objc_storeStrong((id *)&self->_availableOutputDevices, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
