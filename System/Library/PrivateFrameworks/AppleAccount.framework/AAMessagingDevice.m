@implementation AAMessagingDevice

- (AAMessagingDevice)initWithDevice:(id)a3
{
  id v5;
  AAMessagingDevice *v6;
  AAMessagingDevice *v7;
  void *v8;
  uint64_t v9;
  NSString *productBuildVersion;
  void *v11;
  uint64_t v12;
  NSString *modelIdentifier;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)AAMessagingDevice;
  v6 = -[AAMessagingDevice init](&v15, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_device, a3);
    objc_msgSend(v5, "productBuildVersion");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "copy");
    productBuildVersion = v7->_productBuildVersion;
    v7->_productBuildVersion = (NSString *)v9;

    objc_msgSend(v5, "modelIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "copy");
    modelIdentifier = v7->_modelIdentifier;
    v7->_modelIdentifier = (NSString *)v12;

  }
  return v7;
}

- (NSString)productBuildVersion
{
  return self->_productBuildVersion;
}

- (NSString)modelIdentifier
{
  return self->_modelIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelIdentifier, 0);
  objc_storeStrong((id *)&self->_productBuildVersion, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end
