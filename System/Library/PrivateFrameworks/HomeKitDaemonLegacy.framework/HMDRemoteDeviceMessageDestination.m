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
  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = *MEMORY[0x1E0C99768];
  v7 = (void *)MEMORY[0x1E0CB3940];
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

  v3 = (void *)MEMORY[0x1E0CB3940];
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
  v9 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "shortDescription");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" %p"), self);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = &stru_1E89C3E38;
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
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  uint64_t v16;
  void *v17;

  -[HMDRemoteDeviceMessageDestination device](self, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "account");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isCurrentAccount");

  if (!v5)
    goto LABEL_4;
  -[HMDRemoteDeviceMessageDestination device](self, "device");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localHandles");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = v8;
  }
  else
  {
LABEL_4:
    -[HMDRemoteDeviceMessageDestination preferredHandle](self, "preferredHandle");
    v10 = objc_claimAutoreleasedReturnValue();
    if (!v10)
      goto LABEL_8;
    v11 = (void *)v10;
    -[HMDRemoteDeviceMessageDestination device](self, "device");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handles");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDRemoteDeviceMessageDestination preferredHandle](self, "preferredHandle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v13, "containsObject:", v14);

    if (!v15)
    {
LABEL_8:
      -[HMDRemoteDeviceMessageDestination device](self, "device");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "remoteDestinationString");
      v16 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
    -[HMDRemoteDeviceMessageDestination preferredHandle](self, "preferredHandle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v9;
  }
  objc_msgSend(v9, "destination");
  v16 = objc_claimAutoreleasedReturnValue();
LABEL_9:
  v17 = (void *)v16;

  return v17;
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
