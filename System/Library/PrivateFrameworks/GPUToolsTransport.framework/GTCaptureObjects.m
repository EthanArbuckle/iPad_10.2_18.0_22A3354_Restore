@implementation GTCaptureObjects

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GTCaptureObjects)initWithCoder:(id)a3
{
  id v4;
  GTCaptureObjects *v5;
  uint64_t v6;
  NSArray *devices;
  uint64_t v8;
  NSArray *commandQueues;
  uint64_t v10;
  NSArray *captureScopes;
  uint64_t v12;
  NSArray *metalLayers;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)GTCaptureObjects;
  v5 = -[GTCaptureObjects init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("devices"));
    v6 = objc_claimAutoreleasedReturnValue();
    devices = v5->_devices;
    v5->_devices = (NSArray *)v6;

    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("commandQueues"));
    v8 = objc_claimAutoreleasedReturnValue();
    commandQueues = v5->_commandQueues;
    v5->_commandQueues = (NSArray *)v8;

    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("captureScopes"));
    v10 = objc_claimAutoreleasedReturnValue();
    captureScopes = v5->_captureScopes;
    v5->_captureScopes = (NSArray *)v10;

    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("metalLayers"));
    v12 = objc_claimAutoreleasedReturnValue();
    metalLayers = v5->_metalLayers;
    v5->_metalLayers = (NSArray *)v12;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *devices;
  id v5;

  devices = self->_devices;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", devices, CFSTR("devices"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_commandQueues, CFSTR("commandQueues"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_captureScopes, CFSTR("captureScopes"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_metalLayers, CFSTR("metalLayers"));

}

- (NSArray)devices
{
  return self->_devices;
}

- (void)setDevices:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSArray)commandQueues
{
  return self->_commandQueues;
}

- (void)setCommandQueues:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)captureScopes
{
  return self->_captureScopes;
}

- (void)setCaptureScopes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSArray)metalLayers
{
  return self->_metalLayers;
}

- (void)setMetalLayers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metalLayers, 0);
  objc_storeStrong((id *)&self->_captureScopes, 0);
  objc_storeStrong((id *)&self->_commandQueues, 0);
  objc_storeStrong((id *)&self->_devices, 0);
}

@end
