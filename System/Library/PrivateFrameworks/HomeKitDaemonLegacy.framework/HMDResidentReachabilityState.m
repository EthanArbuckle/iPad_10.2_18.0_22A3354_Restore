@implementation HMDResidentReachabilityState

- (HMDResidentReachabilityState)initWithResidentDeviceIdentifier:(id)a3 isReachable:(BOOL)a4
{
  id v6;
  HMDResidentReachabilityState *v7;
  uint64_t v8;
  NSUUID *residentDeviceIdentifier;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HMDResidentReachabilityState;
  v7 = -[HMDResidentReachabilityState init](&v11, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    residentDeviceIdentifier = v7->_residentDeviceIdentifier;
    v7->_residentDeviceIdentifier = (NSUUID *)v8;

    v7->_isReachable = a4;
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  int v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (v6)
  {
    -[HMDResidentReachabilityState residentDeviceIdentifier](self, "residentDeviceIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "residentDeviceIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqual:", v8))
    {
      v9 = -[HMDResidentReachabilityState isReachable](self, "isReachable");
      v10 = v9 ^ objc_msgSend(v6, "isReachable") ^ 1;
    }
    else
    {
      LOBYTE(v10) = 0;
    }

  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  uint64_t v3;
  void *v4;
  unint64_t v5;

  v3 = -[HMDResidentReachabilityState isReachable](self, "isReachable");
  -[HMDResidentReachabilityState residentDeviceIdentifier](self, "residentDeviceIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[HMDResidentReachabilityState residentDeviceIdentifier](self, "residentDeviceIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("residentDeviceIdentifier"));

  objc_msgSend(v5, "encodeBool:forKey:", -[HMDResidentReachabilityState isReachable](self, "isReachable"), CFSTR("isReachable"));
}

- (HMDResidentReachabilityState)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  HMDResidentReachabilityState *v7;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isReachable"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("residentDeviceIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    self = -[HMDResidentReachabilityState initWithResidentDeviceIdentifier:isReachable:](self, "initWithResidentDeviceIdentifier:isReachable:", v6, v5);
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)attributeDescriptions
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDResidentReachabilityState residentDeviceIdentifier](self, "residentDeviceIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("Resident device identifier"), v4);
  v11[0] = v5;
  v6 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDResidentReachabilityState isReachable](self, "isReachable");
  HMFBooleanToString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("IsReachable"), v7);
  v11[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSUUID)residentDeviceIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (BOOL)isReachable
{
  return self->_isReachable;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_residentDeviceIdentifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
