@implementation HMDRemoteAccountMessageDestination

- (HMDRemoteAccountMessageDestination)initWithTarget:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v5 = (void *)MEMORY[0x24BDBCE88];
  v6 = *MEMORY[0x24BDBCAB0];
  v7 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@ is unavailable"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v9, 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v10);
}

- (HMDRemoteAccountMessageDestination)initWithTarget:(id)a3 handle:(id)a4 multicast:(BOOL)a5
{
  return -[HMDRemoteAccountMessageDestination initWithTarget:handle:multicast:deviceCapabilities:](self, "initWithTarget:handle:multicast:deviceCapabilities:", a3, a4, a5, 0);
}

- (HMDRemoteAccountMessageDestination)initWithTarget:(id)a3 handle:(id)a4 multicast:(BOOL)a5 deviceCapabilities:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  HMDRemoteAccountMessageDestination *v14;
  uint64_t v15;
  HMDAccountHandle *handle;
  uint64_t v17;
  NSDictionary *deviceCapabilities;
  HMDRemoteAccountMessageDestination *v20;
  SEL v21;
  objc_super v22;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  if (!v10)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  if (!v11)
  {
LABEL_7:
    v20 = (HMDRemoteAccountMessageDestination *)_HMFPreconditionFailure();
    return (HMDRemoteAccountMessageDestination *)-[HMDRemoteAccountMessageDestination hash](v20, v21);
  }
  v13 = v12;
  v22.receiver = self;
  v22.super_class = (Class)HMDRemoteAccountMessageDestination;
  v14 = -[HMFMessageDestination initWithTarget:](&v22, sel_initWithTarget_, v10);
  if (v14)
  {
    v15 = objc_msgSend(v11, "copy");
    handle = v14->_handle;
    v14->_handle = (HMDAccountHandle *)v15;

    v14->_multicast = a5;
    v17 = objc_msgSend(v13, "copy");
    deviceCapabilities = v14->_deviceCapabilities;
    v14->_deviceCapabilities = (NSDictionary *)v17;

  }
  return v14;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[HMFMessageDestination target](self, "target");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[HMDRemoteAccountMessageDestination handle](self, "handle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  HMDRemoteAccountMessageDestination *v4;
  HMDRemoteAccountMessageDestination *v5;
  HMDRemoteAccountMessageDestination *v6;
  HMDRemoteAccountMessageDestination *v7;
  void *v8;
  void *v9;
  int v10;
  _BOOL4 v11;
  char v12;
  void *v14;
  void *v15;
  objc_super v16;

  v4 = (HMDRemoteAccountMessageDestination *)a3;
  if (self == v4)
  {
    v12 = 1;
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)HMDRemoteAccountMessageDestination;
    if (-[HMFMessageDestination isEqual:](&v16, sel_isEqual_, v4))
    {
      v5 = v4;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v6 = v5;
      else
        v6 = 0;
      v7 = v6;

      if (!v7)
        goto LABEL_9;
      -[HMDRemoteAccountMessageDestination handle](self, "handle");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDRemoteAccountMessageDestination handle](v7, "handle");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqual:", v9);

      if (!v10)
        goto LABEL_9;
      v11 = -[HMDRemoteAccountMessageDestination isMulticast](self, "isMulticast");
      if (v11 == -[HMDRemoteAccountMessageDestination isMulticast](v7, "isMulticast"))
      {
        -[HMDRemoteAccountMessageDestination deviceCapabilities](self, "deviceCapabilities");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDRemoteAccountMessageDestination deviceCapabilities](v7, "deviceCapabilities");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = HMFEqualObjects();

      }
      else
      {
LABEL_9:
        v12 = 0;
      }

    }
    else
    {
      v12 = 0;
    }
  }

  return v12;
}

- (id)shortDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend((id)objc_opt_class(), "shortDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMFMessageDestination target](self, "target");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)descriptionWithPointer:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = a3;
  v5 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend((id)objc_opt_class(), "shortDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR(" %p"), self);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = &stru_24E79DB48;
  }
  -[HMFMessageDestination target](self, "target");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDRemoteAccountMessageDestination handle](self, "handle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "shortDescription");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDRemoteAccountMessageDestination isMulticast](self, "isMulticast");
  HMFBooleanToString();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDRemoteAccountMessageDestination deviceCapabilities](self, "deviceCapabilities");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@%@, Target = %@, Handle = %@, Multicast = %@, Device Capabilities = %@>"), v6, v7, v9, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  return v14;
}

- (id)debugDescription
{
  return -[HMDRemoteAccountMessageDestination descriptionWithPointer:](self, "descriptionWithPointer:", 1);
}

- (id)description
{
  return -[HMDRemoteAccountMessageDestination descriptionWithPointer:](self, "descriptionWithPointer:", 0);
}

- (id)privateDescription
{
  return -[HMDRemoteAccountMessageDestination descriptionWithPointer:](self, "descriptionWithPointer:", 0);
}

- (id)remoteDestinationString
{
  void *v2;
  void *v3;

  -[HMDRemoteAccountMessageDestination handle](self, "handle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteDestinationString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (HMDAccountHandle)handle
{
  return (HMDAccountHandle *)objc_getProperty(self, a2, 24, 1);
}

- (BOOL)isMulticast
{
  return self->_multicast;
}

- (BOOL)restrictToResidentCapable
{
  return self->_restrictToResidentCapable;
}

- (void)setRestrictToResidentCapable:(BOOL)a3
{
  self->_restrictToResidentCapable = a3;
}

- (NSDictionary)deviceCapabilities
{
  return (NSDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceCapabilities, 0);
  objc_storeStrong((id *)&self->_handle, 0);
}

+ (id)shortDescription
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

@end
