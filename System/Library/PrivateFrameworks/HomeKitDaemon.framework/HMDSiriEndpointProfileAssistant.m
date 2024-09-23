@implementation HMDSiriEndpointProfileAssistant

- (HMDSiriEndpointProfileAssistant)initWithService:(id)a3
{
  id v5;
  HMDSiriEndpointProfileAssistant *v6;
  HMDSiriEndpointProfileAssistant *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDSiriEndpointProfileAssistant;
  v6 = -[HMDSiriEndpointProfileAssistant init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_service, a3);

  return v7;
}

- (id)_identifierCharacteristic
{
  void *v2;
  void *v3;

  -[HMDSiriEndpointProfileAssistant service](self, "service");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "findCharacteristicWithType:", *MEMORY[0x24BDD58E0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_nameCharacteristic
{
  void *v2;
  void *v3;

  -[HMDSiriEndpointProfileAssistant service](self, "service");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "findCharacteristicWithType:", *MEMORY[0x24BDD5928]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_activeCharacteristic
{
  void *v2;
  void *v3;

  -[HMDSiriEndpointProfileAssistant service](self, "service");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "findCharacteristicWithType:", *MEMORY[0x24BDD5770]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSNumber)identifier
{
  os_unfair_lock_s *p_lock;
  NSNumber *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_identifier;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setIdentifier:(id)a3
{
  NSNumber *v4;
  NSNumber *identifier;
  id v6;

  v6 = a3;
  os_unfair_lock_lock_with_options();
  v4 = (NSNumber *)objc_msgSend(v6, "copy");
  identifier = self->_identifier;
  self->_identifier = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSString)name
{
  os_unfair_lock_s *p_lock;
  NSString *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_name;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setName:(id)a3
{
  NSString *v4;
  NSString *name;
  id v6;

  v6 = a3;
  os_unfair_lock_lock_with_options();
  v4 = (NSString *)objc_msgSend(v6, "copy");
  name = self->_name;
  self->_name = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSNumber)active
{
  os_unfair_lock_s *p_lock;
  NSNumber *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_active;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setActive:(id)a3
{
  NSNumber *v4;
  NSNumber *active;
  id v6;

  v6 = a3;
  os_unfair_lock_lock_with_options();
  v4 = (NSNumber *)objc_msgSend(v6, "copy");
  active = self->_active;
  self->_active = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSArray)characteristicsToMonitor
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 1);
  -[HMDSiriEndpointProfileAssistant _activeCharacteristic](self, "_activeCharacteristic");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v3, "addObject:", v4);
  v5 = (void *)objc_msgSend(v3, "copy");

  return (NSArray *)v5;
}

- (NSArray)allCharacteristics
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 3);
  -[HMDSiriEndpointProfileAssistant _identifierCharacteristic](self, "_identifierCharacteristic");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v3, "addObject:", v4);
  -[HMDSiriEndpointProfileAssistant _nameCharacteristic](self, "_nameCharacteristic");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    objc_msgSend(v3, "addObject:", v5);
  -[HMDSiriEndpointProfileAssistant _activeCharacteristic](self, "_activeCharacteristic");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    objc_msgSend(v3, "addObject:", v6);
  v7 = (void *)objc_msgSend(v3, "copy");

  return (NSArray *)v7;
}

- (BOOL)containsCharacteristic:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  BOOL v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "service");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "serviceType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "isEqualToString:", CFSTR("0000026A-0000-1000-8000-0026BB765291")) & 1) != 0)
    {
      objc_msgSend(v6, "instanceID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDSiriEndpointProfileAssistant service](self, "service");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "instanceID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v8, "isEqual:", v10);

      if (v11)
      {
        v26 = 0u;
        v27 = 0u;
        v24 = 0u;
        v25 = 0u;
        -[HMDSiriEndpointProfileAssistant service](self, "service", 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "characteristics");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v25;
          while (2)
          {
            for (i = 0; i != v15; ++i)
            {
              if (*(_QWORD *)v25 != v16)
                objc_enumerationMutation(v13);
              v18 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
              objc_msgSend(v5, "instanceID");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "instanceID");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              v21 = objc_msgSend(v19, "isEqual:", v20);

              if ((v21 & 1) != 0)
              {

                v22 = 1;
                goto LABEL_16;
              }
            }
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
            if (v15)
              continue;
            break;
          }
        }

      }
    }
    else
    {

    }
    v22 = 0;
LABEL_16:

  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (BOOL)updateCharacteristic:(id)a3 value:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  int v14;
  id v15;
  void *v16;
  void *v17;
  int v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  BOOL v25;

  v6 = a3;
  v7 = a4;
  if (!-[HMDSiriEndpointProfileAssistant containsCharacteristic:](self, "containsCharacteristic:", v6))
    goto LABEL_26;
  objc_msgSend(v6, "type");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x24BDD58E0]);

  if (v9)
  {
    v10 = v7;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = v10;
    else
      v11 = 0;
    v12 = v11;

    -[HMDSiriEndpointProfileAssistant setIdentifier:](self, "setIdentifier:", v12);
    goto LABEL_24;
  }
  objc_msgSend(v6, "type");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isEqualToString:", *MEMORY[0x24BDD5928]);

  if (v14)
  {
    v15 = v7;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v16 = v15;
    else
      v16 = 0;
    v12 = v16;

    -[HMDSiriEndpointProfileAssistant setName:](self, "setName:", v12);
    goto LABEL_24;
  }
  objc_msgSend(v6, "type");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "isEqualToString:", *MEMORY[0x24BDD5770]);

  if (!v18)
  {
LABEL_26:
    v25 = 0;
    goto LABEL_27;
  }
  v19 = v7;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v20 = v19;
  else
    v20 = 0;
  v12 = v20;

  if (!v12)
  {
    v25 = 0;
    goto LABEL_25;
  }
  v21 = objc_msgSend(v12, "integerValue");
  if (v21 == 1)
    v22 = 1;
  else
    v22 = -1;
  if (v21)
    v23 = v22;
  else
    v23 = 0;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDSiriEndpointProfileAssistant setActive:](self, "setActive:", v24);

LABEL_24:
  v25 = 1;
LABEL_25:

LABEL_27:
  return v25;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[HMDSiriEndpointProfileAssistant identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, *MEMORY[0x24BDD6D28]);

  -[HMDSiriEndpointProfileAssistant name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, *MEMORY[0x24BDD6D30]);

  -[HMDSiriEndpointProfileAssistant active](self, "active");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, *MEMORY[0x24BDD6D20]);

}

- (HMDSiriEndpointProfileAssistant)initWithCoder:(id)a3
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

- (HMDService)service
{
  return (HMDService *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_active, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)shortDescription
{
  return CFSTR("HMDSiriEndpointProfileAssistant");
}

@end
