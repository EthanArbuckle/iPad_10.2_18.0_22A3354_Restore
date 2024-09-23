@implementation MBProperties

+ (id)properties
{
  return objc_alloc_init(MBProperties);
}

+ (id)propertiesWithFile:(id)a3 error:(id *)a4
{
  id v5;
  MBProperties *v6;

  v5 = a3;
  v6 = -[MBProperties initWithFile:error:]([MBProperties alloc], "initWithFile:error:", v5, a4);

  return v6;
}

- (MBProperties)init
{
  return -[MBProperties initWithVersion:minVersion:maxVersion:](self, "initWithVersion:minVersion:maxVersion:", 10.0, 7.4, 11.0);
}

- (MBProperties)initWithVersion:(double)a3 minVersion:(double)a4 maxVersion:(double)a5
{
  MBProperties *v8;
  uint64_t v9;
  id plist;
  MBSystemDomainsVersions *v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)MBProperties;
  v8 = -[MBProperties init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 0);
    plist = v8->_plist;
    v8->_plist = (id)v9;

    -[MBProperties setVersion:](v8, "setVersion:", a3);
    -[MBProperties setMinSupportedVersion:](v8, "setMinSupportedVersion:", a4);
    -[MBProperties setMaxSupportedVersion:](v8, "setMaxSupportedVersion:", a5);
    v11 = -[MBSystemDomainsVersions initWithDefaultSystemDomainsPlist]([MBSystemDomainsVersions alloc], "initWithDefaultSystemDomainsPlist");
    -[MBSystemDomainsVersions version](v11, "version");
    -[MBProperties setSystemDomainsVersion:](v8, "setSystemDomainsVersion:");
    v8->_protected = 1;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[MBProperties setDate:](v8, "setDate:", v12);

  }
  return v8;
}

- (MBProperties)initWithData:(id)a3 error:(id *)a4
{
  void *v6;
  MBProperties *v7;
  MBProperties *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  uint64_t v21;
  uint64_t v22;
  id v24;

  v24 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListFromData:mutabilityOption:format:errorDescription:", a3, 1, 0, &v24);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    if (a4)
    {
      +[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 11, CFSTR("Error deserializing properties: %@"), v24);
      v8 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_16:

      goto LABEL_17;
    }
LABEL_15:
    v8 = 0;
    goto LABEL_16;
  }
  v7 = -[MBProperties init](self, "init");
  v8 = v7;
  if (v7)
  {
    objc_storeStrong(&v7->_plist, v6);
    v8->_protected = 1;
    -[MBProperties minSupportedVersion](v8, "minSupportedVersion");
    v10 = v9;
    -[MBProperties version](v8, "version");
    if (v10 > v11
      || (-[MBProperties version](v8, "version"),
          v13 = v12,
          -[MBProperties maxSupportedVersion](v8, "maxSupportedVersion"),
          v13 >= v14))
    {
      if (a4)
      {
        -[MBProperties version](v8, "version");
        +[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 203, CFSTR("Unsupported properties version: %0.1f"), v22);
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      self = v8;
    }
    else
    {
      self = -[MBSystemDomainsVersions initWithDefaultSystemDomainsPlist]([MBSystemDomainsVersions alloc], "initWithDefaultSystemDomainsPlist");
      -[MBProperties minSupportedVersion](self, "minSupportedVersion");
      v16 = v15;
      -[MBProperties systemDomainsVersion](v8, "systemDomainsVersion");
      if (v16 <= v17)
      {
        -[MBProperties systemDomainsVersion](v8, "systemDomainsVersion");
        v19 = v18;
        -[MBProperties maxSupportedVersion](self, "maxSupportedVersion");
        if (v19 < v20)
          goto LABEL_16;
      }
      if (a4)
      {
        -[MBProperties systemDomainsVersion](v8, "systemDomainsVersion");
        +[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 203, CFSTR("Unsupported system domains version: %0.1f"), v21);
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }

    }
    goto LABEL_15;
  }
LABEL_17:

  return v8;
}

- (MBProperties)initWithFile:(id)a3 error:(id *)a4
{
  void *v6;
  MBProperties *v7;

  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:options:error:", a3, 0, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = -[MBProperties initWithData:error:](self, "initWithData:error:", v6, a4);
  }
  else
  {

    v7 = 0;
  }

  return v7;
}

- (id)objectForKey:(id)a3
{
  return (id)objc_msgSend(self->_plist, "objectForKeyedSubscript:", a3);
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  objc_msgSend(self->_plist, "setObject:forKeyedSubscript:", a3, a4);
}

- (void)removeObjectForKey:(id)a3
{
  objc_msgSend(self->_plist, "removeObjectForKey:", a3);
}

- (BOOL)_BOOLForKey:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  objc_msgSend(self->_plist, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      objc_exception_throw(-[MBException initWithCode:format:]([MBException alloc], "initWithCode:format:", 11, CFSTR("%@ value not an NSNumber"), v4));
  }
  v6 = objc_msgSend(v5, "BOOLValue");

  return v6;
}

- (void)_setBool:(BOOL)a3 forKey:(id)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;
  id v8;

  v4 = a3;
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a4;
  objc_msgSend(v6, "numberWithBool:", v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(self->_plist, "setObject:forKeyedSubscript:", v8, v7);

}

- (id)_dataForKey:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(self->_plist, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      objc_exception_throw(-[MBException initWithCode:format:]([MBException alloc], "initWithCode:format:", 11, CFSTR("%@ value not an NSData"), v4));
  }

  return v5;
}

- (void)_setData:(id)a3 forKey:(id)a4
{
  objc_msgSend(self->_plist, "setObject:forKeyedSubscript:", a3, a4);
}

- (id)_dictionaryForKey:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(self->_plist, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      objc_exception_throw(-[MBException initWithCode:format:]([MBException alloc], "initWithCode:format:", 11, CFSTR("%@ value not an NSDictionary"), v4));
  }

  return v5;
}

- (void)_setDictionary:(id)a3 forKey:(id)a4
{
  objc_msgSend(self->_plist, "setObject:forKeyedSubscript:", a3, a4);
}

- (NSString)requiredProductVersion
{
  void *v2;
  id v3;

  objc_msgSend(self->_plist, "objectForKeyedSubscript:", CFSTR("RequiredProductVersion"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;

  return (NSString *)v3;
}

- (void)setRequiredProductVersion:(id)a3
{
  id v4;

  v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      -[MBProperties setRequiredProductVersion:].cold.1();
    objc_msgSend(self->_plist, "setObject:forKeyedSubscript:", v4, CFSTR("RequiredProductVersion"));
  }
  else
  {
    objc_msgSend(self->_plist, "removeObjectForKey:", CFSTR("RequiredProductVersion"));
  }

}

- (NSNumber)accountClass
{
  void *v2;
  id v3;

  objc_msgSend(self->_plist, "objectForKeyedSubscript:", CFSTR("AccountClass"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;

  return (NSNumber *)v3;
}

- (void)setAccountClass:(id)a3
{
  id v4;

  v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      -[MBProperties setAccountClass:].cold.1();
    objc_msgSend(self->_plist, "setObject:forKeyedSubscript:", v4, CFSTR("AccountClass"));
  }
  else
  {
    objc_msgSend(self->_plist, "removeObjectForKey:", CFSTR("AccountClass"));
  }

}

- (NSNumber)accountType
{
  void *v2;
  id v3;

  objc_msgSend(self->_plist, "objectForKeyedSubscript:", CFSTR("AccountType"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;

  return (NSNumber *)v3;
}

- (void)setAccountType:(id)a3
{
  id v4;

  v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      -[MBProperties setAccountType:].cold.1();
    objc_msgSend(self->_plist, "setObject:forKeyedSubscript:", v4, CFSTR("AccountType"));
  }
  else
  {
    objc_msgSend(self->_plist, "removeObjectForKey:", CFSTR("AccountType"));
  }

}

- (double)version
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend(self->_plist, "objectForKeyedSubscript:", CFSTR("Version"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        objc_exception_throw(-[MBException initWithCode:format:]([MBException alloc], "initWithCode:format:", 11, CFSTR("Version value not an NSNumber or NSString")));
    }
    objc_msgSend(v2, "doubleValue");
    v4 = v3;
  }
  else
  {
    v4 = 0.0;
  }

  return v4;
}

- (void)setVersion:(double)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%0.1f"), *(_QWORD *)&a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(self->_plist, "setObject:forKeyedSubscript:", v4, CFSTR("Version"));

}

- (double)systemDomainsVersion
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend(self->_plist, "objectForKeyedSubscript:", CFSTR("SystemDomainsVersion"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    objc_exception_throw(-[MBException initWithCode:format:]([MBException alloc], "initWithCode:format:", 11, CFSTR("SystemDomainsVersion not an NSString")));
  objc_msgSend(v2, "doubleValue");
  v4 = v3;

  return v4;
}

- (void)setSystemDomainsVersion:(double)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%0.1f"), *(_QWORD *)&a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(self->_plist, "setObject:forKeyedSubscript:", v4, CFSTR("SystemDomainsVersion"));

}

- (NSDate)date
{
  void *v2;

  objc_msgSend(self->_plist, "objectForKeyedSubscript:", CFSTR("Date"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      objc_exception_throw(-[MBException initWithCode:format:]([MBException alloc], "initWithCode:format:", 11, CFSTR("Date value not an NSDate")));
  }
  return (NSDate *)v2;
}

- (void)setDate:(id)a3
{
  objc_msgSend(self->_plist, "setObject:forKeyedSubscript:", a3, CFSTR("Date"));
}

- (BOOL)encrypted
{
  return -[MBProperties _BOOLForKey:](self, "_BOOLForKey:", CFSTR("IsEncrypted"));
}

- (void)setEncrypted:(BOOL)a3
{
  -[MBProperties _setBool:forKey:](self, "_setBool:forKey:", a3, CFSTR("IsEncrypted"));
}

- (NSData)keybagData
{
  return (NSData *)-[MBProperties _dataForKey:](self, "_dataForKey:", CFSTR("BackupKeyBag"));
}

- (void)setKeybagData:(id)a3
{
  -[MBProperties _setData:forKey:](self, "_setData:forKey:", a3, CFSTR("BackupKeyBag"));
}

- (NSData)buddyStashData
{
  return (NSData *)-[MBProperties _dataForKey:](self, "_dataForKey:", CFSTR("BudyStashData"));
}

- (void)setBuddyStashData:(id)a3
{
  -[MBProperties _setData:forKey:](self, "_setData:forKey:", a3, CFSTR("BudyStashData"));
}

- (BOOL)wasPasscodeSet
{
  return -[MBProperties _BOOLForKey:](self, "_BOOLForKey:", CFSTR("WasPasscodeSet"));
}

- (void)setPasscodeSet:(BOOL)a3
{
  -[MBProperties _setBool:forKey:](self, "_setBool:forKey:", a3, CFSTR("WasPasscodeSet"));
}

- (NSData)manifestEncryptionKey
{
  void *v2;

  objc_msgSend(self->_plist, "objectForKeyedSubscript:", CFSTR("ManifestKey"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      objc_exception_throw(-[MBException initWithCode:format:]([MBException alloc], "initWithCode:format:", 11, CFSTR("Manifest key is not an NSData")));
  }
  return (NSData *)v2;
}

- (void)setManifestEncryptionKey:(id)a3
{
  -[MBProperties _setData:forKey:](self, "_setData:forKey:", a3, CFSTR("ManifestKey"));
}

- (NSDictionary)lockdownKeys
{
  return (NSDictionary *)-[MBProperties _dictionaryForKey:](self, "_dictionaryForKey:", CFSTR("Lockdown"));
}

- (void)setLockdownKeys:(id)a3
{
  -[MBProperties _setDictionary:forKey:](self, "_setDictionary:forKey:", a3, CFSTR("Lockdown"));
}

- (id)_stringForLockdownKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[MBProperties lockdownKeys](self, "lockdownKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      objc_exception_throw(-[MBException initWithCode:format:]([MBException alloc], "initWithCode:format:", 11, CFSTR("%@ lockdown value not an NSString"), v6));
  }

  return v6;
}

- (NSString)deviceID
{
  return (NSString *)-[MBProperties _stringForLockdownKey:](self, "_stringForLockdownKey:", *MEMORY[0x1E0DE6C40]);
}

- (NSString)deviceName
{
  return (NSString *)-[MBProperties _stringForLockdownKey:](self, "_stringForLockdownKey:", *MEMORY[0x1E0DE6C20]);
}

- (NSString)serialNumber
{
  return (NSString *)-[MBProperties _stringForLockdownKey:](self, "_stringForLockdownKey:", *MEMORY[0x1E0DE6C38]);
}

- (NSString)productType
{
  return (NSString *)-[MBProperties _stringForLockdownKey:](self, "_stringForLockdownKey:", *MEMORY[0x1E0DE6C30]);
}

- (NSString)buildVersion
{
  return (NSString *)-[MBProperties _stringForLockdownKey:](self, "_stringForLockdownKey:", *MEMORY[0x1E0DE6C08]);
}

- (BOOL)hasCorruptSQLiteDBs
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  int v9;

  v3 = -[MBProperties encrypted](self, "encrypted");
  if (v3)
  {
    -[MBProperties buildVersion](self, "buildVersion");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "hasPrefix:", CFSTR("9A")) & 1) != 0)
    {
      -[MBProperties buildVersion](self, "buildVersion");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "length");

      if (v6 >= 3)
      {
        -[MBProperties buildVersion](self, "buildVersion");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "substringFromIndex:", 2);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "intValue");

        LOBYTE(v3) = (v9 - 124) < 0x52;
        return v3;
      }
    }
    else
    {

    }
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (BOOL)hasManifestDB
{
  double v2;

  -[MBProperties version](self, "version");
  return v2 >= 10.0;
}

- (BOOL)hasEncryptedManifestDB
{
  void *v3;
  BOOL v4;

  if (!-[MBProperties encrypted](self, "encrypted"))
    return 0;
  -[MBProperties manifestEncryptionKey](self, "manifestEncryptionKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (NSDictionary)appleIDs
{
  void *v4;
  void *v6;

  objc_msgSend(self->_plist, "objectForKeyedSubscript:", CFSTR("AppleIDs"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBProperties.m"), 355, CFSTR("%@ value not an NSDictionary"), CFSTR("AppleIDs"));

    }
  }
  return (NSDictionary *)v4;
}

- (void)addAppleIDsFromSet:(id)a3 dataClass:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  MBProperties *v25;
  void *v27;
  id obj;
  id v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  void *v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v29 = a4;
  -[MBProperties appleIDs](self, "appleIDs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(self->_plist, "setObject:forKeyedSubscript:", v7, CFSTR("AppleIDs"));
  }
  v25 = self;
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = v6;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  v9 = v29;
  if (v8)
  {
    v10 = v8;
    v11 = 0x1E0CB3000uLL;
    v12 = 0x1E0C99000uLL;
    v30 = *(_QWORD *)v32;
    v27 = v7;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v32 != v30)
          objc_enumerationMutation(obj);
        v14 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * v13);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, v25, CFSTR("MBProperties.m"), 372, CFSTR("Account item %@ not a string"), v14);

        }
        objc_msgSend(v7, "objectForKeyedSubscript:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0 || (v16 = v15) == 0)
        {
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          v16 = (id)objc_claimAutoreleasedReturnValue();
        }
        if (v9)
        {
          objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("dataClasses"));
          v17 = objc_claimAutoreleasedReturnValue();
          if (v17)
          {
            v18 = (void *)v17;
            objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v17);
            v19 = v10;
            v20 = v12;
            v21 = v11;
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "addObject:", v9);
            objc_msgSend(v22, "allObjects");
            v23 = (void *)objc_claimAutoreleasedReturnValue();

            v11 = v21;
            v12 = v20;
            v10 = v19;
            v7 = v27;
          }
          else
          {
            v35 = v9;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v35, 1);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v16, "setObject:forKeyedSubscript:", v23, CFSTR("dataClasses"));

          v9 = v29;
        }
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v16, v14);

        ++v13;
      }
      while (v10 != v13);
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    }
    while (v10);
  }

}

- (void)addAppleID:(id)a3 DSID:(id)a4 altDSID:(id)a5 dataClass:(id)a6
{
  id v10;
  uint64_t v11;
  unint64_t v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  NSObject *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  id v58;
  uint8_t buf[4];
  uint64_t v60;
  __int16 v61;
  unint64_t v62;
  __int16 v63;
  unint64_t v64;
  __int16 v65;
  id v66;
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = (uint64_t)a4;
  v12 = (unint64_t)a5;
  v13 = a6;
  MBGetDefaultLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413058;
    v60 = (uint64_t)v10;
    v61 = 2112;
    v62 = v11;
    v63 = 2112;
    v64 = v12;
    v65 = 2112;
    v66 = v13;
    _os_log_impl(&dword_1D5213000, v14, OS_LOG_TYPE_DEBUG, "Adding appleID:%@, DSID:%@, altDSID:%@, dataClass:%@", buf, 0x2Au);
    _MBLog(CFSTR("DEBUG"), (uint64_t)"Adding appleID:%@, DSID:%@, altDSID:%@, dataClass:%@", v15, v16, v17, v18, v19, v20, (uint64_t)v10);
  }

  if (v10)
  {
    if (v11 | v12)
    {
      -[MBProperties appleIDs](self, "appleIDs");
      v21 = objc_claimAutoreleasedReturnValue();
      if (!v21)
      {
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v21 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(self->_plist, "setObject:forKeyedSubscript:", v21, CFSTR("AppleIDs"));
      }
      -[NSObject objectForKeyedSubscript:](v21, "objectForKeyedSubscript:", v10);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0 || (v23 = v22) == 0)
      {
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v23 = (id)objc_claimAutoreleasedReturnValue();
      }
      if (v11)
      {
        objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("dsid"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = v24;
        if (v24 && (objc_msgSend(v24, "isEqualToString:", v11) & 1) == 0)
        {
          MBGetDefaultLog();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v60 = (uint64_t)v25;
            v61 = 2112;
            v62 = v11;
            _os_log_impl(&dword_1D5213000, v26, OS_LOG_TYPE_ERROR, "DSID mismatch: existingDSID:%@ != DSID:%@", buf, 0x16u);
            _MBLog(CFSTR("ERROR"), (uint64_t)"DSID mismatch: existingDSID:%@ != DSID:%@", v27, v28, v29, v30, v31, v32, (uint64_t)v25);
          }

        }
        objc_msgSend(v23, "setObject:forKeyedSubscript:", v11, CFSTR("dsid"));

      }
      if (v12)
      {
        objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("altDsid"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = v33;
        if (v33 && (objc_msgSend(v33, "isEqualToString:", v12) & 1) == 0)
        {
          MBGetDefaultLog();
          v35 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v60 = (uint64_t)v34;
            v61 = 2112;
            v62 = v12;
            _os_log_impl(&dword_1D5213000, v35, OS_LOG_TYPE_ERROR, "altDSID mismatch: existingAltDSID:%@ != altDSID:%@", buf, 0x16u);
            _MBLog(CFSTR("ERROR"), (uint64_t)"altDSID mismatch: existingAltDSID:%@ != altDSID:%@", v36, v37, v38, v39, v40, v41, (uint64_t)v34);
          }

        }
        objc_msgSend(v23, "setObject:forKeyedSubscript:", v12, CFSTR("altDsid"));

      }
      if (v13)
      {
        objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("dataClasses"));
        v42 = objc_claimAutoreleasedReturnValue();
        if (v42)
        {
          v43 = (void *)v42;
          objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v42);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "addObject:", v13);
          objc_msgSend(v44, "allObjects");
          v45 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v58 = v13;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v58, 1);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v23, "setObject:forKeyedSubscript:", v45, CFSTR("dataClasses"));

      }
      -[NSObject setObject:forKeyedSubscript:](v21, "setObject:forKeyedSubscript:", v23, v10);

    }
    else
    {
      MBGetDefaultLog();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v60 = (uint64_t)v10;
        v61 = 2112;
        v62 = (unint64_t)v13;
        _os_log_impl(&dword_1D5213000, v21, OS_LOG_TYPE_ERROR, "appleID:%@, nil DSID&altDSID, dataClass:%@", buf, 0x16u);
        _MBLog(CFSTR("ERROR"), (uint64_t)"appleID:%@, nil DSID&altDSID, dataClass:%@", v52, v53, v54, v55, v56, v57, (uint64_t)v10);
      }
    }
  }
  else
  {
    MBGetDefaultLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v60 = v11;
      v61 = 2112;
      v62 = v12;
      v63 = 2112;
      v64 = (unint64_t)v13;
      _os_log_impl(&dword_1D5213000, v21, OS_LOG_TYPE_ERROR, "nil appleID, DSID:%@, altDSID:%@, dataClass:%@", buf, 0x20u);
      _MBLog(CFSTR("ERROR"), (uint64_t)"nil appleID, DSID:%@, altDSID:%@, dataClass:%@", v46, v47, v48, v49, v50, v51, v11);
    }
  }

}

- (void)addAssetDescriptionForAppleID:(id)a3 assetDescription:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6 && v7)
  {
    -[MBProperties appleIDs](self, "appleIDs");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || (v11 = v10) == 0)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("assets"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v13 = (void *)MEMORY[0x1E0C99E20];
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("assets"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setWithArray:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v15, "addObject:", v8);
      objc_msgSend(v15, "allObjects");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v17[0] = v8;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v16, CFSTR("assets"));
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v11, v6);

  }
}

- (NSString)activeAppleID
{
  return (NSString *)objc_msgSend(self->_plist, "objectForKeyedSubscript:", CFSTR("ActiveAppleID"));
}

- (void)setActiveAppleID:(id)a3
{
  id plist;

  plist = self->_plist;
  if (a3)
    objc_msgSend(plist, "setObject:forKeyedSubscript:", a3, CFSTR("ActiveAppleID"));
  else
    objc_msgSend(plist, "removeObjectForKey:", CFSTR("ActiveAppleID"));
}

- (NSDictionary)containers
{
  void *v4;
  void *v6;

  objc_msgSend(self->_plist, "objectForKeyedSubscript:", CFSTR("Applications"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBProperties.m"), 496, CFSTR("Containers value not an NSDictionary"));

    }
  }
  return (NSDictionary *)v4;
}

- (id)containerWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[MBProperties containers](self, "containers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    +[MBContainer containerWithPropertyList:volumeMountPoint:](MBContainer, "containerWithPropertyList:volumeMountPoint:", v6, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)addContainer:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  if ((objc_msgSend(v12, "isSystemContainer") & 1) == 0 && (objc_msgSend(v12, "isSystemSharedContainer") & 1) == 0)
  {
    -[MBProperties containers](self, "containers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 32);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(self->_plist, "setObject:forKeyedSubscript:", v5, CFSTR("Applications"));
    }
    objc_msgSend(v12, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MBProperties.m"), 514, CFSTR("Duplicate container ID: %@"), v11);

    }
    objc_msgSend(v12, "propertyListForBackupProperties");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, v9);

  }
}

- (void)addContainersFromArray:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[MBProperties addContainer:](self, "addContainer:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)removeAllContainers
{
  id v3;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 32);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(self->_plist, "setObject:forKeyedSubscript:", v3, CFSTR("Applications"));

}

- (id)dataWithError:(id *)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", self->_plist, 200, 0, a3);
}

- (BOOL)writeToFile:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  char v10;
  id v12;

  v6 = a3;
  v12 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataFromPropertyList:format:errorDescription:", self->_plist, 200, &v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    if (self->_protected)
      v9 = 536870913;
    else
      v9 = 1;
    v10 = objc_msgSend(v7, "writeToFile:options:error:", v6, v9, a4);
  }
  else if (a4)
  {
    +[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 100, CFSTR("Error serializing properties: %@"), v12);
    v10 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  void *v15;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[MBProperties version](self, "version");
  v6 = v5;
  -[MBProperties systemDomainsVersion](self, "systemDomainsVersion");
  v8 = v7;
  -[MBProperties requiredProductVersion](self, "requiredProductVersion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MBProperties date](self, "date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[MBProperties encrypted](self, "encrypted");
  v12 = -[MBProperties wasPasscodeSet](self, "wasPasscodeSet");
  -[MBProperties lockdownKeys](self, "lockdownKeys");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  MBStringWithDictionary(v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: version=%0.1f, systemDomainsVersion=%0.1f, requiredProductVersion=%@, date=\"%@\", encrypted=%d, passcodeSet=%d, lockdownKeys=%@>"), v4, v6, v8, v9, v10, v11, v12, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)propertyList
{
  return self->_plist;
}

- (BOOL)isProtected
{
  return self->_protected;
}

- (void)setProtected:(BOOL)a3
{
  self->_protected = a3;
}

- (double)minSupportedVersion
{
  return self->_minSupportedVersion;
}

- (void)setMinSupportedVersion:(double)a3
{
  self->_minSupportedVersion = a3;
}

- (double)maxSupportedVersion
{
  return self->_maxSupportedVersion;
}

- (void)setMaxSupportedVersion:(double)a3
{
  self->_maxSupportedVersion = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_plist, 0);
}

- (void)setRequiredProductVersion:.cold.1()
{
  __assert_rtn("-[MBProperties setRequiredProductVersion:]", "MBProperties.m", 171, "!requiredProductVersion || [requiredProductVersion isKindOfClass:NSString.class]");
}

- (void)setAccountClass:.cold.1()
{
  __assert_rtn("-[MBProperties setAccountClass:]", "MBProperties.m", 188, "!accountClass || [accountClass isKindOfClass:NSNumber.class]");
}

- (void)setAccountType:.cold.1()
{
  __assert_rtn("-[MBProperties setAccountType:]", "MBProperties.m", 203, "!accountType || [accountType isKindOfClass:NSNumber.class]");
}

@end
