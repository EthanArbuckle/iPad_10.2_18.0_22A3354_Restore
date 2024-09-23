@implementation HUNearbyDevice

+ (id)nearbyDeviceWithIDSDevice:(id)a3
{
  id v3;
  HUNearbyDevice *v4;

  v3 = a3;
  v4 = -[HUNearbyDevice initWithIDSDevice:]([HUNearbyDevice alloc], "initWithIDSDevice:", v3);

  return v4;
}

+ (id)nearbyDeviceWithIDSIdentifier:(id)a3
{
  id v3;
  HUNearbyDevice *v4;

  v3 = a3;
  v4 = -[HUNearbyDevice initWithIDSIdentifier:]([HUNearbyDevice alloc], "initWithIDSIdentifier:", v3);

  return v4;
}

- (HUNearbyDevice)initWithIDSDevice:(id)a3
{
  id v4;
  HUNearbyDevice *v5;
  HUNearbyDevice *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HUNearbyDevice;
  v5 = -[HUNearbyDevice init](&v11, sel_init);
  v6 = v5;
  if (v5)
  {
    -[HUNearbyDevice setIdsDevice:](v5, "setIdsDevice:", v4);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUNearbyDevice setRegisteredDomains:](v6, "setRegisteredDomains:", v7);

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUNearbyDevice setUpdateDomains:](v6, "setUpdateDomains:", v8);

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUNearbyDevice setState:](v6, "setState:", v9);

  }
  return v6;
}

- (HUNearbyDevice)initWithIDSIdentifier:(id)a3
{
  id v4;
  HUNearbyDevice *v5;
  HUNearbyDevice *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HUNearbyDevice;
  v5 = -[HUNearbyDevice init](&v11, sel_init);
  v6 = v5;
  if (v5)
  {
    -[HUNearbyDevice setIdentifierWithoutDevice:](v5, "setIdentifierWithoutDevice:", v4);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUNearbyDevice setRegisteredDomains:](v6, "setRegisteredDomains:", v7);

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUNearbyDevice setUpdateDomains:](v6, "setUpdateDomains:", v8);

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUNearbyDevice setState:](v6, "setState:", v9);

  }
  return v6;
}

- (id)name
{
  void *v2;
  void *v3;

  -[HUNearbyDevice idsDevice](self, "idsDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)identifier
{
  void *v3;
  void *v4;
  void *v5;

  -[HUNearbyDevice idsDevice](self, "idsDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HUNearbyDevice idsDevice](self, "idsDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)IDSCopyIDForDevice();

  }
  else
  {
    -[HUNearbyDevice identifierWithoutDevice](self, "identifierWithoutDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)uniqueIdentifier
{
  void *v3;
  void *v4;
  void *v5;

  -[HUNearbyDevice idsDevice](self, "idsDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HUNearbyDevice idsDevice](self, "idsDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uniqueID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[HUNearbyDevice identifierWithoutDevice](self, "identifierWithoutDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (BOOL)equalsToIdentifier:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;

  v4 = a3;
  if (v4)
  {
    -[HUNearbyDevice identifier](self, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "containsString:", v4) & 1) != 0)
    {
      v6 = 1;
    }
    else
    {
      -[HUNearbyDevice uniqueIdentifier](self, "uniqueIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v7, "containsString:", v4);

    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUNearbyDevice identifier](self, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqual:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)isCompanion
{
  void *v2;
  char v3;

  -[HUNearbyDevice idsDevice](self, "idsDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isDefaultPairedDevice");

  return v3;
}

- (BOOL)isWatch
{
  void *v2;
  BOOL v3;

  -[HUNearbyDevice idsDevice](self, "idsDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "deviceType") == 6;

  return v3;
}

- (void)setState:(id)a3 forDomain:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  if (a3)
  {
    v6 = a4;
    v7 = a3;
    -[HUNearbyDevice state](self, "state");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (id)objc_msgSend(v8, "mutableCopy");

    objc_msgSend(v9, "setObject:forKey:", v7, v6);
    -[HUNearbyDevice setState:](self, "setState:", v9);

  }
}

- (id)stateForDomain:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HUNearbyDevice state](self, "state");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)deviceTypeDescription
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  __CFString *v5;

  -[HUNearbyDevice idsDevice](self, "idsDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "deviceType");

  v4 = v3 - 1;
  if ((unint64_t)(v3 - 1) < 6 && ((0x2Bu >> v4) & 1) != 0)
  {
    v5 = off_1EA8EB2F0[v4];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DeviceType: %ld"), v3);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[HUNearbyDevice name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUNearbyDevice identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUNearbyDevice deviceTypeDescription](self, "deviceTypeDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUNearbyDevice state](self, "state");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ [%@] %@ - %@"), v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (IDSDevice)idsDevice
{
  return self->_idsDevice;
}

- (void)setIdsDevice:(id)a3
{
  objc_storeStrong((id *)&self->_idsDevice, a3);
}

- (NSMutableArray)registeredDomains
{
  return self->_registeredDomains;
}

- (void)setRegisteredDomains:(id)a3
{
  objc_storeStrong((id *)&self->_registeredDomains, a3);
}

- (NSMutableArray)updateDomains
{
  return self->_updateDomains;
}

- (void)setUpdateDomains:(id)a3
{
  objc_storeStrong((id *)&self->_updateDomains, a3);
}

- (NSMutableDictionary)state
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setState:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (NSString)identifierWithoutDevice
{
  return self->_identifierWithoutDevice;
}

- (void)setIdentifierWithoutDevice:(id)a3
{
  objc_storeStrong((id *)&self->_identifierWithoutDevice, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifierWithoutDevice, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_updateDomains, 0);
  objc_storeStrong((id *)&self->_registeredDomains, 0);
  objc_storeStrong((id *)&self->_idsDevice, 0);
}

@end
