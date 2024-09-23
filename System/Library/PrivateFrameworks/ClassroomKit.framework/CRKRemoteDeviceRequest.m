@implementation CRKRemoteDeviceRequest

+ (Class)allowlistedClassForResultObject
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRKRemoteDeviceRequest)initWithCoder:(id)a3
{
  id v4;
  CRKRemoteDeviceRequest *v5;
  void *v6;
  uint64_t v7;
  CATTaskRequest *remoteRequest;
  void *v9;
  uint64_t v10;
  NSString *deviceIdentifier;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CRKRemoteDeviceRequest;
  v5 = -[CATTaskRequest initWithCoder:](&v13, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("remoteRequest"));
    v7 = objc_claimAutoreleasedReturnValue();
    remoteRequest = v5->_remoteRequest;
    v5->_remoteRequest = (CATTaskRequest *)v7;

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("deviceIdentifier"));
    v10 = objc_claimAutoreleasedReturnValue();
    deviceIdentifier = v5->_deviceIdentifier;
    v5->_deviceIdentifier = (NSString *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CRKRemoteDeviceRequest;
  v4 = a3;
  -[CATTaskRequest encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  -[CRKRemoteDeviceRequest remoteRequest](self, "remoteRequest", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("remoteRequest"));

  -[CRKRemoteDeviceRequest deviceIdentifier](self, "deviceIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("deviceIdentifier"));

}

- (NSString)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (void)setDeviceIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (CATTaskRequest)remoteRequest
{
  return self->_remoteRequest;
}

- (void)setRemoteRequest:(id)a3
{
  objc_storeStrong((id *)&self->_remoteRequest, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteRequest, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
}

@end
