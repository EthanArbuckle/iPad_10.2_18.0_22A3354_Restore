@implementation ACDKeychainItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dirtyProperties, 0);
  objc_storeStrong((id *)&self->_properties, 0);
}

- (ACDKeychainItem)initWithPersistentRef:(__CFData *)a3 properties:(id)a4
{
  id v6;
  ACDKeychainItem *v7;
  uint64_t v8;
  NSMutableDictionary *properties;
  objc_super v11;

  v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)ACDKeychainItem;
  v7 = -[ACDKeychainItem init](&v11, sel_init);
  if (v7)
  {
    v7->_persistentRef = (__CFData *)CFRetain(a3);
    v8 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithDictionary:", v6);
    properties = v7->_properties;
    v7->_properties = (NSMutableDictionary *)v8;

  }
  return v7;
}

- (void)dealloc
{
  __CFData *persistentRef;
  objc_super v4;

  persistentRef = self->_persistentRef;
  if (persistentRef)
    CFRelease(persistentRef);
  v4.receiver = self;
  v4.super_class = (Class)ACDKeychainItem;
  -[ACDKeychainItem dealloc](&v4, sel_dealloc);
}

- (BOOL)hasCustomAccessControl
{
  uint64_t v2;

  v2 = -[NSMutableDictionary valueForKey:](self->_properties, "valueForKey:", *MEMORY[0x24BDE8F48]);
  if (v2)
    LOBYTE(v2) = SecAccessControlGetConstraints() != 0;
  return v2;
}

- (__CFData)persistentRef
{
  return self->_persistentRef;
}

+ (id)new
{
  objc_msgSend(a1, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (ACDKeychainItem)init
{
  -[ACDKeychainItem doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (ACDKeychainItem)initWithPersistentRef:(__CFData *)a3
{
  ACDKeychainItem *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ACDKeychainItem;
  v4 = -[ACDKeychainItem init](&v6, sel_init);
  if (v4)
  {
    v4->_persistentRef = (__CFData *)CFRetain(a3);
    -[ACDKeychainItem _reloadProperties](v4, "_reloadProperties");
  }
  return v4;
}

- (void)reload
{
  -[ACDKeychainItem _clearDirtyProperties](self, "_clearDirtyProperties");
  -[ACDKeychainItem _reloadProperties](self, "_reloadProperties");
}

- (BOOL)save:(id *)a3
{
  void *v5;
  void *v6;
  const __CFDictionary *v7;
  const __CFDictionary *v8;
  OSStatus v9;
  BOOL v10;
  void *values[2];
  void *keys[3];

  keys[2] = *(void **)MEMORY[0x24BDAC8D0];
  if (self->_persistentRef)
  {
    if (-[NSMutableSet count](self->_dirtyProperties, "count"))
    {
      v5 = (void *)*MEMORY[0x24BDE9528];
      keys[0] = *(void **)MEMORY[0x24BDE9558];
      keys[1] = v5;
      v6 = (void *)*MEMORY[0x24BDBD270];
      values[0] = self->_persistentRef;
      values[1] = v6;
      v7 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], (const void **)keys, (const void **)values, 2, MEMORY[0x24BDBD2A8], MEMORY[0x24BDBD6B0]);
      -[ACDKeychainItem _modifiedProperties](self, "_modifiedProperties");
      v8 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
      v9 = SecItemUpdate(v7, v8);
      CFRelease(v7);
      v10 = v9 == 0;
      if (v9)
      {
        if (a3)
        {
          objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDB4208], v9, 0);
          *a3 = (id)objc_claimAutoreleasedReturnValue();
        }
      }
      else
      {
        -[ACDKeychainItem _clearDirtyProperties](self, "_clearDirtyProperties");
      }

    }
    else
    {
      return 1;
    }
  }
  else if (a3)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDB4200], 10003, 0);
    v10 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    return 0;
  }
  return v10;
}

- (NSString)account
{
  void *v2;
  void *v3;

  -[NSMutableDictionary stringValueForKey:](self->_properties, "stringValueForKey:", *MEMORY[0x24BDE8FA8]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSString *)v3;
}

- (NSString)service
{
  void *v2;
  void *v3;

  -[NSMutableDictionary stringValueForKey:](self->_properties, "stringValueForKey:", *MEMORY[0x24BDE9128]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSString *)v3;
}

- (NSString)accessGroup
{
  void *v2;
  void *v3;

  -[NSMutableDictionary stringValueForKey:](self->_properties, "stringValueForKey:", *MEMORY[0x24BDE8F50]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSString *)v3;
}

- (NSString)accessibility
{
  void *v2;
  void *v3;

  -[NSMutableDictionary stringValueForKey:](self->_properties, "stringValueForKey:", *MEMORY[0x24BDE8F60]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSString *)v3;
}

- (BOOL)synchronizable
{
  return -[NSMutableDictionary BOOLValueForKey:](self->_properties, "BOOLValueForKey:", *MEMORY[0x24BDE9140]);
}

- (BOOL)useDataProtectionKeychain
{
  return -[NSMutableDictionary BOOLValueForKey:](self->_properties, "BOOLValueForKey:", *MEMORY[0x24BDE9528]);
}

- (NSDictionary)metadata
{
  return (NSDictionary *)-[ACDKeychainItem _metadataWithError:](self, "_metadataWithError:", 0);
}

- (id)_metadataWithError:(id *)a3
{
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  id v10;

  -[NSMutableDictionary dataValueForKey:](self->_properties, "dataValueForKey:", *MEMORY[0x24BDE9000]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v10 = 0;
    objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", v4, 0, 0, &v10);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v10;
    if (v6)
    {
      _ACDKeychainLogSystem();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        -[ACDKeychainItem _metadataWithError:].cold.1((uint64_t)v6, v7, v8);

      if (a3)
        *a3 = objc_retainAutorelease(v6);
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (int64_t)version
{
  void *v2;
  void *v3;
  int64_t v4;

  -[ACDKeychainItem metadata](self, "metadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("ACKeychainItemVersion"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "integerValue");
  else
    v4 = 0;

  return v4;
}

- (void)setAccount:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[ACDKeychainItem account](self, "account");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v7, "isEqualToString:", v4);

  if ((v5 & 1) == 0)
  {
    v6 = (void *)objc_msgSend(v7, "copy");
    -[ACDKeychainItem _setValue:forProperty:](self, "_setValue:forProperty:", v6, *MEMORY[0x24BDE8FA8]);

  }
}

- (void)setService:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[ACDKeychainItem service](self, "service");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v7, "isEqualToString:", v4);

  if ((v5 & 1) == 0)
  {
    v6 = (void *)objc_msgSend(v7, "copy");
    -[ACDKeychainItem _setValue:forProperty:](self, "_setValue:forProperty:", v6, *MEMORY[0x24BDE9128]);

  }
}

- (void)setAccessGroup:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[ACDKeychainItem accessGroup](self, "accessGroup");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v7, "isEqualToString:", v4);

  if ((v5 & 1) == 0)
  {
    v6 = (void *)objc_msgSend(v7, "copy");
    -[ACDKeychainItem _setValue:forProperty:](self, "_setValue:forProperty:", v6, *MEMORY[0x24BDE8F50]);

  }
}

- (void)setAccessibility:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[ACDKeychainItem accessibility](self, "accessibility");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v7, "isEqualToString:", v4);

  if ((v5 & 1) == 0)
  {
    v6 = (void *)objc_msgSend(v7, "copy");
    -[ACDKeychainItem _setValue:forProperty:](self, "_setValue:forProperty:", v6, *MEMORY[0x24BDE8F60]);

  }
}

- (void)setSynchronizable:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  if (-[ACDKeychainItem synchronizable](self, "synchronizable") != a3)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[ACDKeychainItem _setValue:forProperty:](self, "_setValue:forProperty:", v5, *MEMORY[0x24BDE9140]);

  }
}

- (void)setMetadata:(id)a3
{
  -[ACDKeychainItem _setMetadata:withError:](self, "_setMetadata:withError:", a3, 0);
}

- (BOOL)_setMetadata:(id)a3 withError:(id *)a4
{
  void *v6;
  id v7;
  BOOL v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  id v13;

  if (a3)
  {
    v13 = 0;
    objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", a3, 100, 0, &v13);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v13;
    v8 = v7 == 0;
    if (v7)
    {
      _ACDKeychainLogSystem();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[ACDKeychainItem _setMetadata:withError:].cold.1((uint64_t)v7, v9, v10);

      if (a4)
        *a4 = objc_retainAutorelease(v7);
    }
    else
    {
      -[ACDKeychainItem _setValue:forProperty:](self, "_setValue:forProperty:", v6, *MEMORY[0x24BDE9000]);
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE50], "data", 0, a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACDKeychainItem _setValue:forProperty:](self, "_setValue:forProperty:", v11, *MEMORY[0x24BDE9000]);

    return 1;
  }
  return v8;
}

- (void)setVersion:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v5 = (void *)MEMORY[0x24BDBCED8];
  -[ACDKeychainItem metadata](self, "metadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dictionaryWithDictionary:", v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v7, CFSTR("ACKeychainItemVersion"));

  -[ACDKeychainItem setMetadata:](self, "setMetadata:", v8);
}

- (void)_setValue:(id)a3 forProperty:(id)a4
{
  NSMutableDictionary *properties;
  id v7;

  properties = self->_properties;
  v7 = a4;
  -[NSMutableDictionary setObject:forKey:](properties, "setObject:forKey:", a3, v7);
  -[ACDKeychainItem _markPropertyDirty:](self, "_markPropertyDirty:", v7);

}

- (void)_markPropertyDirty:(id)a3
{
  id v4;
  NSMutableSet *dirtyProperties;
  NSMutableSet *v6;
  NSMutableSet *v7;
  id v8;

  v4 = a3;
  dirtyProperties = self->_dirtyProperties;
  v8 = v4;
  if (!dirtyProperties)
  {
    v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    v7 = self->_dirtyProperties;
    self->_dirtyProperties = v6;

    v4 = v8;
    dirtyProperties = self->_dirtyProperties;
  }
  -[NSMutableSet addObject:](dirtyProperties, "addObject:", v4);

}

- (void)_clearDirtyProperties
{
  NSMutableSet *dirtyProperties;

  dirtyProperties = self->_dirtyProperties;
  self->_dirtyProperties = 0;

}

- (id)_modifiedProperties
{
  void *v3;
  NSMutableDictionary *properties;
  void *v5;
  void *v6;
  void *v7;

  -[NSMutableSet allObjects](self->_dirtyProperties, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  properties = self->_properties;
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectsForKeys:notFoundMarker:](properties, "objectsForKeys:notFoundMarker:", v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:", v6, v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)_reloadProperties
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v3;
  OUTLINED_FUNCTION_4(&dword_20D8CB000, a2, v4, "Got invalid status from keychain: %@", (uint8_t *)&v5);

  OUTLINED_FUNCTION_2_3();
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  const __CFString *v9;
  void *v10;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACDKeychainItem account](self, "account");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACDKeychainItem service](self, "service");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[ACDKeychainItem synchronizable](self, "synchronizable");
  v9 = CFSTR("NO");
  if (v8)
    v9 = CFSTR("YES");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p {username: %@, service: %@, synchronizable: %@}>"), v5, self, v6, v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)debugDescription
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  const __CFString *v11;
  void *v12;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACDKeychainItem account](self, "account");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACDKeychainItem service](self, "service");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACDKeychainItem accessGroup](self, "accessGroup");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACDKeychainItem accessibility](self, "accessibility");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[ACDKeychainItem synchronizable](self, "synchronizable");
  v11 = CFSTR("NO");
  if (v10)
    v11 = CFSTR("YES");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p {\n\taccount: %@,\n\tservice: %@,\n\taccessGroup: %@,\n\taccessibility: %@,\n\tsynchronizable: %@,\n\tdirtyProperties: %@\n}>"), v5, self, v6, v7, v8, v9, v11, self->_dirtyProperties);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)_metadataWithError:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_4(&dword_20D8CB000, a2, a3, "Failed to decode keychain metadata: %@", (uint8_t *)&v3);
}

- (void)_setMetadata:(uint64_t)a3 withError:.cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_4(&dword_20D8CB000, a2, a3, "Failed to encode keychain metadata: %@", (uint8_t *)&v3);
}

@end
