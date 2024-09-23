@implementation CPAccNavParam

+ (CPAccNavParam)paramWithProperty:(id)a3 keys:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setProperty:", v6);

  objc_msgSend(v7, "setKeys:", v5);
  return (CPAccNavParam *)v7;
}

- (CPAccNavParam)init
{
  CPAccNavParam *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CPAccNavParam;
  result = -[CPAccNavParam init](&v3, sel_init);
  if (result)
    result->_encodeable = 1;
  return result;
}

- (id)description
{
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromClass(-[CPAccNavParam objcType](self, "objcType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = &stru_24C77F1E0;
  if (-[CPAccNavParam collectionGeneric](self, "collectionGeneric"))
  {
    v6 = (void *)MEMORY[0x24BDD17C8];
    NSStringFromClass(-[CPAccNavParam collectionGeneric](self, "collectionGeneric"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("(%@)"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR(" objcType=%@%@"), v4, v8);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v3, "stringWithFormat:", CFSTR(" objcType=%@%@"), v4, &stru_24C77F1E0);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  v10 = (void *)MEMORY[0x24BDD17C8];
  v11 = objc_opt_class();
  -[CPAccNavParam property](self, "property");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CPAccNavParam objcType](self, "objcType"))
    v5 = v9;
  -[CPAccNavParam keys](self, "keys");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("<%@: %p property=%@%@ %@>"), v11, self, v12, v5, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_opt_new();
  -[CPAccNavParam property](self, "property");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setProperty:", v5);

  -[CPAccNavParam keys](self, "keys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setKeys:", v6);

  objc_msgSend(v4, "setCollectionGeneric:", -[CPAccNavParam collectionGeneric](self, "collectionGeneric"));
  objc_msgSend(v4, "setEncodeable:", -[CPAccNavParam encodeable](self, "encodeable"));
  objc_msgSend(v4, "setObjcType:", -[CPAccNavParam objcType](self, "objcType"));
  return v4;
}

- (CPAccNavParamKey)primaryKey
{
  void *v2;
  void *v3;

  -[CPAccNavParam keys](self, "keys");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CPAccNavParamKey *)v3;
}

- (id)copySettingCollectionGeneric:(Class)a3
{
  void *v4;

  v4 = (void *)-[CPAccNavParam copy](self, "copy");
  objc_msgSend(v4, "setCollectionGeneric:", a3);
  return v4;
}

- (id)copySettingEncodeable:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;

  v3 = a3;
  v4 = (void *)-[CPAccNavParam copy](self, "copy");
  objc_msgSend(v4, "setEncodeable:", v3);
  return v4;
}

- (NSString)property
{
  return self->_property;
}

- (void)setProperty:(id)a3
{
  objc_storeStrong((id *)&self->_property, a3);
}

- (NSArray)keys
{
  return self->_keys;
}

- (void)setKeys:(id)a3
{
  objc_storeStrong((id *)&self->_keys, a3);
}

- (Class)collectionGeneric
{
  return self->_collectionGeneric;
}

- (void)setCollectionGeneric:(Class)a3
{
  objc_storeStrong((id *)&self->_collectionGeneric, a3);
}

- (BOOL)encodeable
{
  return self->_encodeable;
}

- (void)setEncodeable:(BOOL)a3
{
  self->_encodeable = a3;
}

- (Class)objcType
{
  return self->_objcType;
}

- (void)setObjcType:(Class)a3
{
  objc_storeStrong((id *)&self->_objcType, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objcType, 0);
  objc_storeStrong((id *)&self->_collectionGeneric, 0);
  objc_storeStrong((id *)&self->_keys, 0);
  objc_storeStrong((id *)&self->_property, 0);
}

- (void)configureTypesForUpdate:(Class)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (!-[CPAccNavParam objcType](self, "objcType")
    && -[objc_class conformsToProtocol:](a3, "conformsToProtocol:", &unk_2549DB9A0))
  {
    -[CPAccNavParam setObjcType:](self, "setObjcType:", +[CPAccNavParam _objcTypeForUpdate:parameter:](CPAccNavParam, "_objcTypeForUpdate:parameter:", a3, self));
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    -[CPAccNavParam keys](self, "keys", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v12;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
          objc_msgSend(v10, "setAccNavType:", +[CPAccNavParam _accNavTypeForUpdate:parameter:key:](CPAccNavParam, "_accNavTypeForUpdate:parameter:key:", a3, self, v10));
          objc_msgSend(v10, "setParam:", self);
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v7);
    }

  }
}

+ (Class)_objcTypeForUpdate:(Class)a3 parameter:(id)a4
{
  void *v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;
  NSString *v12;
  void *v13;

  objc_msgSend(a4, "property");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_encodedTypeForClass:property:", a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "characterAtIndex:", 0);
  v9 = 0;
  v10 = (v8 - 64);
  if (v10 <= 0x3B)
  {
    if (((1 << (v8 - 64)) & 0xA1258000A120CLL) != 0)
    {
LABEL_3:
      objc_opt_class();
      v9 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_4;
    }
    if (v8 != 64)
    {
      if (v10 != 59)
        goto LABEL_4;
      goto LABEL_3;
    }
    if ((unint64_t)objc_msgSend(v7, "length") < 3)
    {
      v9 = 0;
    }
    else
    {
      objc_msgSend(v7, "substringWithRange:", 2, objc_msgSend(v7, "length") - 3);
      v12 = (NSString *)objc_claimAutoreleasedReturnValue();
      v13 = NSClassFromString(v12);
      if (!v13)
        v13 = (void *)objc_opt_class();
      v9 = v13;

    }
  }
LABEL_4:

  return (Class)v9;
}

+ (int64_t)_accNavTypeForUpdate:(Class)a3 parameter:(id)a4 key:(id)a5
{
  id v8;
  id v9;
  int64_t v10;
  uint64_t v11;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  int v21;

  v8 = a4;
  v9 = a5;
  if (objc_msgSend(v9, "accNavType") != -1)
  {
    v10 = objc_msgSend(v9, "accNavType");
    goto LABEL_6;
  }
  v11 = objc_msgSend(v8, "objcType");
  if (objc_msgSend(v9, "enumType") || (objc_msgSend(v9, "isBoolValue") & 1) != 0)
  {
    v10 = 3;
    goto LABEL_6;
  }
  if ((objc_msgSend(v9, "isTimeIntervalValue") & 1) != 0)
  {
    v10 = 0;
    goto LABEL_6;
  }
  objc_msgSend(v9, "dimension");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD18B0], "degrees");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v13, "isEqual:", v14);

  if ((v15 & 1) != 0)
  {
    v10 = 6;
    goto LABEL_6;
  }
  objc_msgSend(v9, "dimension");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1928], "meters");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v16, "isEqual:", v17);

  if ((v18 & 1) != 0)
  {
    v10 = 1;
    goto LABEL_6;
  }
  if (objc_msgSend(v9, "hasVariants"))
    v11 = objc_msgSend(v8, "collectionGeneric");
  if (v11 == objc_opt_class())
  {
    objc_msgSend(v8, "property");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_encodedTypeForClass:property:", a3, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = objc_msgSend(v20, "characterAtIndex:", 0);
    if (v21 > 98)
    {
      v10 = 7;
      switch(v21)
      {
        case 'c':
          goto LABEL_43;
        case 'd':
        case 'f':
          goto LABEL_33;
        case 'e':
        case 'g':
        case 'h':
          goto LABEL_40;
        case 'i':
          v10 = 5;
          goto LABEL_43;
        default:
          if (v21 == 113)
          {
            v10 = 4;
          }
          else
          {
            if (v21 != 115)
              goto LABEL_40;
            v10 = 6;
          }
          break;
      }
      goto LABEL_43;
    }
    if (v21 <= 72)
    {
      if (v21 == 66 || v21 == 67)
      {
        v10 = 3;
        goto LABEL_43;
      }
    }
    else
    {
      switch(v21)
      {
        case 'I':
          v10 = 1;
          goto LABEL_43;
        case 'Q':
LABEL_33:
          v10 = 0;
          goto LABEL_43;
        case 'S':
          v10 = 2;
LABEL_43:

          goto LABEL_6;
      }
    }
LABEL_40:
    v10 = -1;
    goto LABEL_43;
  }
  if (v11 == objc_opt_class() || v11 == objc_opt_class())
  {
    v10 = 10;
  }
  else if (v11 == objc_opt_class() || v11 == objc_opt_class())
  {
    v10 = 8;
  }
  else if (v11 == objc_opt_class())
  {
    v10 = 0;
  }
  else
  {
    v10 = -1;
  }
LABEL_6:

  return v10;
}

+ (id)_encodedTypeForClass:(Class)a3 property:(id)a4
{
  objc_property *Property;
  char *v5;
  void *v6;

  Property = class_getProperty(a3, (const char *)objc_msgSend(objc_retainAutorelease(a4), "UTF8String"));
  v5 = property_copyAttributeValue(Property, "T");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  free(v5);
  return v6;
}

@end
