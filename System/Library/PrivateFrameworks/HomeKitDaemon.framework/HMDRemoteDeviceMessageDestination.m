@implementation HMDRemoteDeviceMessageDestination

- (HMDRemoteDeviceMessageDestination)initWithTarget:(id)a3
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

- (HMDRemoteDeviceMessageDestination)initWithTarget:(id)a3 device:(id)a4
{
  id v7;
  HMDRemoteDeviceMessageDestination *v8;
  HMDRemoteDeviceMessageDestination *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HMDRemoteDeviceMessageDestination;
  v8 = -[HMFMessageDestination initWithTarget:](&v11, sel_initWithTarget_, a3);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_device, a4);

  return v9;
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
  -[HMDRemoteDeviceMessageDestination device](self, "device");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  HMDRemoteDeviceMessageDestination *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  char v10;

  v4 = (HMDRemoteDeviceMessageDestination *)a3;
  if (self == v4)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (-[HMFMessageDestination target](self, "target"),
          v5 = (void *)objc_claimAutoreleasedReturnValue(),
          -[HMFMessageDestination target](v4, "target"),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          v7 = objc_msgSend(v5, "isEqual:", v6),
          v6,
          v5,
          v7))
    {
      -[HMDRemoteDeviceMessageDestination device](self, "device");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDRemoteDeviceMessageDestination device](v4, "device");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqual:", v9);

    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
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
  char v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = a3;
  v5 = shouldLogPrivateInformation();
  -[HMDRemoteDeviceMessageDestination device](self, "device");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((v5 & 1) == 0)
  {
    objc_msgSend(v6, "privateDescription");
    v8 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v8;
  }
  v9 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend((id)objc_opt_class(), "shortDescription");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR(" %p"), self);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = &stru_24E79DB48;
  }
  -[HMFMessageDestination target](self, "target");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "UUIDString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("<%@%@, Target = %@, Device %@>"), v10, v11, v13, v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  return v14;
}

- (id)debugDescription
{
  return -[HMDRemoteDeviceMessageDestination descriptionWithPointer:](self, "descriptionWithPointer:", 1);
}

- (id)description
{
  return -[HMDRemoteDeviceMessageDestination descriptionWithPointer:](self, "descriptionWithPointer:", 0);
}

- (id)privateDescription
{
  return -[HMDRemoteDeviceMessageDestination descriptionWithPointer:](self, "descriptionWithPointer:", 0);
}

- (id)remoteDestinationString
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  uint64_t v25;
  id v26;

  -[HMDRemoteDeviceMessageDestination preferredHandle](self, "preferredHandle");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3)
    goto LABEL_4;
  v4 = (void *)v3;
  -[HMDRemoteDeviceMessageDestination device](self, "device");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handles");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDRemoteDeviceMessageDestination preferredHandle](self, "preferredHandle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "containsObject:", v7);

  if (v8)
  {
    -[HMDRemoteDeviceMessageDestination preferredHandle](self, "preferredHandle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "destination");
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_4:
    -[HMDRemoteDeviceMessageDestination device](self, "device");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "remoteDestinationString");
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v11 = (void *)v10;

  if (v11 && (objc_msgSend(v11, "hasSuffix:", CFSTR("inbox.appleid.apple.com")) & 1) == 0)
  {
    v26 = v11;
    goto LABEL_17;
  }
  -[HMDRemoteDeviceMessageDestination device](self, "device");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "account");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isCurrentAccount");

  if (!v14)
    goto LABEL_10;
  -[HMDRemoteDeviceMessageDestination device](self, "device");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localHandles");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "firstObject");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    v18 = v17;
  }
  else
  {
LABEL_10:
    -[HMDRemoteDeviceMessageDestination preferredHandle](self, "preferredHandle");
    v19 = objc_claimAutoreleasedReturnValue();
    if (!v19)
      goto LABEL_14;
    v20 = (void *)v19;
    -[HMDRemoteDeviceMessageDestination device](self, "device");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handles");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDRemoteDeviceMessageDestination preferredHandle](self, "preferredHandle");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v22, "containsObject:", v23);

    if (!v24)
    {
LABEL_14:
      -[HMDRemoteDeviceMessageDestination device](self, "device");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "remoteDestinationString");
      v25 = objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    }
    -[HMDRemoteDeviceMessageDestination preferredHandle](self, "preferredHandle");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v18;
  }
  objc_msgSend(v18, "destination");
  v25 = objc_claimAutoreleasedReturnValue();
LABEL_15:
  v26 = (id)v25;

LABEL_17:
  return v26;
}

- (HMDDevice)device
{
  return self->_device;
}

- (HMDDeviceHandle)preferredHandle
{
  return self->_preferredHandle;
}

- (void)setPreferredHandle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredHandle, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

+ (id)shortDescription
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

@end
