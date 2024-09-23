@implementation __HMDRegisteredIdentity

- (__HMDRegisteredIdentity)init
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ is unavailable"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (__HMDRegisteredIdentity)initWithIdentity:(id)a3
{
  id v4;
  __HMDRegisteredIdentity *v5;
  uint64_t v6;
  HMFPairingIdentity *identity;
  uint64_t v8;
  NSMutableArray *registeredObjects;
  __HMDRegisteredIdentity *v10;
  objc_super v12;

  v4 = a3;
  if (v4)
  {
    v12.receiver = self;
    v12.super_class = (Class)__HMDRegisteredIdentity;
    v5 = -[__HMDRegisteredIdentity init](&v12, sel_init);
    if (v5)
    {
      v6 = objc_msgSend(v4, "copy");
      identity = v5->_identity;
      v5->_identity = (HMFPairingIdentity *)v6;

      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v8 = objc_claimAutoreleasedReturnValue();
      registeredObjects = v5->_registeredObjects;
      v5->_registeredObjects = (NSMutableArray *)v8;

    }
    self = v5;
    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)debugDescription
{
  void *v2;
  void *v3;

  -[__HMDRegisteredIdentity identity](self, "identity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "debugDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)description
{
  void *v2;
  void *v3;

  -[__HMDRegisteredIdentity identity](self, "identity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (HMFPairingIdentity)identity
{
  return (HMFPairingIdentity *)objc_getProperty(self, a2, 8, 1);
}

- (NSMutableArray)registeredObjects
{
  return (NSMutableArray *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registeredObjects, 0);
  objc_storeStrong((id *)&self->_identity, 0);
}

@end
