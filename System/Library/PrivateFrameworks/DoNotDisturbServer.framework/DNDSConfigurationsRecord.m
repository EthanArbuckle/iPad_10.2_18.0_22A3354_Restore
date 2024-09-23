@implementation DNDSConfigurationsRecord

- (DNDSConfigurationsRecord)init
{
  return (DNDSConfigurationsRecord *)-[DNDSConfigurationsRecord _initWithRecord:](self, "_initWithRecord:", 0);
}

- (id)_initWithRecord:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "modeConfigurations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[DNDSConfigurationsRecord _initWithModeConfigurations:](self, "_initWithModeConfigurations:", v4);

  return v5;
}

- (id)_initWithModeConfigurations:(id)a3
{
  id v4;
  DNDSConfigurationsRecord *v5;
  void *v6;
  void *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *modeConfigurations;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DNDSConfigurationsRecord;
  v5 = -[DNDSConfigurationsRecord init](&v11, sel_init);
  if (v5)
  {
    v6 = (void *)objc_msgSend(v4, "mutableCopy");
    v7 = v6;
    if (v6)
      v8 = v6;
    else
      v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    modeConfigurations = v5->_modeConfigurations;
    v5->_modeConfigurations = v8;

  }
  return v5;
}

- (id)configurationForModeIdentifier:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_modeConfigurations, "objectForKey:", a3);
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[DNDSConfigurationsRecord modeConfigurations](self, "modeConfigurations");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  DNDSConfigurationsRecord *v4;
  DNDSConfigurationsRecord *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;

  v4 = (DNDSConfigurationsRecord *)a3;
  if (self == v4)
  {
    v12 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[DNDSConfigurationsRecord modeConfigurations](self, "modeConfigurations");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[DNDSConfigurationsRecord modeConfigurations](v5, "modeConfigurations");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6 == v7)
      {
        v12 = 1;
      }
      else
      {
        -[DNDSConfigurationsRecord modeConfigurations](self, "modeConfigurations");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
        {
          -[DNDSConfigurationsRecord modeConfigurations](v5, "modeConfigurations");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if (v9)
          {
            -[DNDSConfigurationsRecord modeConfigurations](self, "modeConfigurations");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            -[DNDSConfigurationsRecord modeConfigurations](v5, "modeConfigurations");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = objc_msgSend(v10, "isEqual:", v11);

          }
          else
          {
            v12 = 0;
          }

        }
        else
        {
          v12 = 0;
        }

      }
    }
    else
    {
      v12 = 0;
    }
  }

  return v12;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[DNDSConfigurationsRecord modeConfigurations](self, "modeConfigurations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; modeConfigurations: %@>"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[DNDSConfigurationsRecord _initWithRecord:]([DNDSMutableConfigurationsRecord alloc], "_initWithRecord:", self);
}

+ (id)migrateDictionaryRepresentation:(id)a3 fromVersionNumber:(unint64_t)a4 toVersionNumber:(unint64_t)a5
{
  return a3;
}

+ (id)newWithDictionaryRepresentation:(id)a3 context:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  objc_class *v17;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v17 = (objc_class *)a1;
  v24 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(a3, "objectForKey:", CFSTR("modeConfigurations"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_opt_new();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend(v6, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(obj);
        v12 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v6, "objectForKey:", v12, v17);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = +[DNDSConfigurationRecord newWithDictionaryRepresentation:context:](DNDSConfigurationRecord, "newWithDictionaryRepresentation:context:", v13, v5);

        objc_msgSend(v7, "setObject:forKey:", v14, v12);
      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v9);
  }

  v15 = (void *)objc_msgSend([v17 alloc], "_initWithModeConfigurations:", v7);
  return v15;
}

- (id)dictionaryRepresentationWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[DNDSConfigurationsRecord modeConfigurations](self, "modeConfigurations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v19;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v11);
        -[DNDSConfigurationsRecord modeConfigurations](self, "modeConfigurations");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKey:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v14, "dictionaryRepresentationWithContext:", v4);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKey:", v15, v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v9);
  }

  objc_msgSend(v17, "setObject:forKey:", v5, CFSTR("modeConfigurations"));
  return v17;
}

- (NSDictionary)modeConfigurations
{
  return &self->_modeConfigurations->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modeConfigurations, 0);
}

@end
