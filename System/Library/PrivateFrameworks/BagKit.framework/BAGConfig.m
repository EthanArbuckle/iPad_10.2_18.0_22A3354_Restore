@implementation BAGConfig

- (BAGConfig)initWithDictionary:(id)a3 options:(id)a4
{
  id v8;
  id v9;
  void *v10;
  BAGConfig *v11;
  BAGConfig *v12;
  void *v14;
  void *v15;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BAGConfig.m"), 22, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("dictionary"));

    if (v10)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BAGConfig.m"), 23, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("options"));

LABEL_3:
  v16.receiver = self;
  v16.super_class = (Class)BAGConfig;
  v11 = -[BAGConfig init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_configuration, a3);
    objc_storeStrong((id *)&v12->_options, a4);
    v12->_defaultKeyType = 1;
  }

  return v12;
}

- (unint64_t)type
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BAGConfig)initWithCoder:(id)a3
{
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  BAGConfig *v15;
  BAGConfig *v16;
  void *v18;

  v5 = (void *)MEMORY[0x24BDBCF20];
  v6 = a3;
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  objc_msgSend(v5, "setWithObjects:", v7, v8, v9, v10, objc_opt_class(), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "decodeObjectOfClasses:forKey:", v11, CFSTR("config"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("options"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v6, "decodeIntegerForKey:", CFSTR("keyType"));

  if (!BAGIsValidConfigKeyType(v14))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BAGConfig.m"), 49, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("BAGIsValidConfigKeyType(defaultKeyType)"));

  }
  v15 = -[BAGConfig initWithDictionary:options:](self, "initWithDictionary:options:", v12, v13);
  v16 = v15;
  if (v15)
    v15->_defaultKeyType = v14;

  return v16;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[BAGConfig configuration](self, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("config"));

  -[BAGConfig options](self, "options");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("options"));

  objc_msgSend(v6, "encodeInteger:forKey:", -[BAGConfig defaultKeyType](self, "defaultKeyType"), CFSTR("keyType"));
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  BOOL v11;

  v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = v4;
    objc_msgSend(v5, "configuration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[BAGConfig configuration](self, "configuration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqualToDictionary:", v7))
    {
      objc_msgSend(v5, "options");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[BAGConfig options](self, "options");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "isEqual:", v9))
      {
        v10 = objc_msgSend(v5, "defaultKeyType");
        v11 = v10 == -[BAGConfig defaultKeyType](self, "defaultKeyType");
      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;

  -[BAGConfig configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[BAGConfig options](self, "options");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  v7 = v6 ^ -[BAGConfig defaultKeyType](self, "defaultKeyType");

  return v7;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[BAGConfig options](self, "options");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ : %p options: %@>"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (NSString)debugDescription
{
  void *v2;
  void *v3;

  -[BAGConfig configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)_traverseKeyList:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  unsigned int v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[BAGConfig configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v7 = v4;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v18;
      while (2)
      {
        v11 = 0;
        v12 = v6;
        do
        {
          if (*(_QWORD *)v18 != v10)
            objc_enumerationMutation(v7);
          v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v11);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v12, "objectForKey:", v13);
            v6 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
              goto LABEL_17;
            v14 = v12;
            v15 = objc_msgSend(v13, "intValue", (_QWORD)v17);
            if (objc_msgSend(v14, "count") <= (unint64_t)v15)
            {

LABEL_17:
              v6 = 0;
              goto LABEL_18;
            }
            objc_msgSend(v14, "objectAtIndexedSubscript:", v15);
            v6 = (void *)objc_claimAutoreleasedReturnValue();

          }
          ++v11;
          v12 = v6;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v9)
          continue;
        break;
      }
    }
LABEL_18:

  }
  else
  {

    v6 = 0;
  }

  return v6;
}

- (id)_BOOLNumberFromString:(id)a3
{
  id v3;
  void *v4;
  id v5;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("true")) & 1) != 0)
  {
    v4 = (void *)MEMORY[0x24BDBD1C8];
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("false")))
  {
    v4 = (void *)MEMORY[0x24BDBD1C0];
  }
  else
  {
    v4 = 0;
  }
  v5 = v4;

  return v5;
}

- (id)_checkIsArrayObject:(id)a3 typeBlock:(id)a4
{
  id v5;
  void (**v6)(id, _QWORD);
  id v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = (void (**)(id, _QWORD))a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v5;
    v8 = v7;
    if (v6)
    {
      v9 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v19 = 0u;
      v20 = 0u;
      v21 = 0u;
      v22 = 0u;
      v10 = v8;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v20;
        while (2)
        {
          v14 = 0;
          do
          {
            if (*(_QWORD *)v20 != v13)
              objc_enumerationMutation(v10);
            v6[2](v6, *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v14));
            v15 = objc_claimAutoreleasedReturnValue();
            if (!v15)
            {

              v17 = 0;
              goto LABEL_14;
            }
            v16 = (void *)v15;
            objc_msgSend(v9, "addObject:", v15, (_QWORD)v19);

            ++v14;
          }
          while (v12 != v14);
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
          if (v12)
            continue;
          break;
        }
      }

      v17 = (void *)objc_msgSend(v9, "copy");
LABEL_14:

    }
    else
    {
      v17 = (void *)objc_msgSend(v7, "copy");
    }

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (BOOL)_checkIsBoolObject:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[BAGConfig _BOOLNumberFromString:](self, "_BOOLNumberFromString:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "BOOLValue");

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = objc_msgSend(v4, "BOOLValue");
    else
      v6 = 0;
  }

  return v6;
}

- (id)_checkIsDataObject:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBase64EncodedString:options:", v3, 0);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v5 = 0;
      goto LABEL_7;
    }
    v4 = objc_msgSend(v3, "copy");
  }
  v5 = (void *)v4;
LABEL_7:

  return v5;
}

- (id)_checkIsDictionaryObject:(id)a3 typeBlock:(id)a4
{
  id v5;
  void (**v6)(id, void *);
  id v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = (void (**)(id, void *))a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v5;
    v8 = v7;
    if (v6)
    {
      v9 = objc_alloc_init(MEMORY[0x24BDBCED8]);
      v21 = 0u;
      v22 = 0u;
      v23 = 0u;
      v24 = 0u;
      v10 = v8;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v22;
        v20 = v8;
        while (2)
        {
          v14 = 0;
          do
          {
            if (*(_QWORD *)v22 != v13)
              objc_enumerationMutation(v10);
            v15 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v14);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0
              || (objc_msgSend(v10, "objectForKeyedSubscript:", v15),
                  v16 = (void *)objc_claimAutoreleasedReturnValue(),
                  v6[2](v6, v16),
                  v17 = (void *)objc_claimAutoreleasedReturnValue(),
                  v16,
                  !v17))
            {

              v18 = 0;
              v8 = v20;
              goto LABEL_15;
            }
            objc_msgSend(v9, "setObject:forKey:", v17, v15);

            ++v14;
          }
          while (v12 != v14);
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
          v8 = v20;
          if (v12)
            continue;
          break;
        }
      }

      v18 = (void *)objc_msgSend(v9, "copy");
LABEL_15:

    }
    else
    {
      v18 = (void *)objc_msgSend(v7, "copy");
    }

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (id)_checkIsNumberObject:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[BAGConfig _BOOLNumberFromString:](self, "_BOOLNumberFromString:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      v6 = objc_alloc_init(MEMORY[0x24BDD16F0]);
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEA0]), "initWithLocaleIdentifier:", CFSTR("en_US"));
      objc_msgSend(v6, "setLocale:", v7);

      objc_msgSend(v6, "numberFromString:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = (void *)objc_msgSend(v4, "copy");
    else
      v5 = 0;
  }

  return v5;
}

- (id)_checkIsStringObject:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = (void *)objc_msgSend(v3, "copy");
  else
    v4 = 0;

  return v4;
}

- (id)arrayForKey:(id)a3 keyType:(unint64_t)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;
  void *v13;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BAGConfig.m"), 209, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("key"));

  }
  if (!BAGIsValidConfigKeyType(a4))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BAGConfig.m"), 210, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("BAGIsValidConfigKeyType(keyType)"));

  }
  -[BAGConfig configuration](self, "configuration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BAGConfig _checkIsArrayObject:typeBlock:](self, "_checkIsArrayObject:typeBlock:", v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)arrayForKey:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[BAGConfig arrayForKey:keyType:](self, "arrayForKey:keyType:", v4, -[BAGConfig defaultKeyType](self, "defaultKeyType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)arrayForKeyList:(id)a3 keyType:(unint64_t)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v11;
  void *v12;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BAGConfig.m"), 219, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("keyList"));

  }
  if (!BAGIsValidConfigKeyType(a4))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BAGConfig.m"), 220, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("BAGIsValidConfigKeyType(keyType)"));

  }
  -[BAGConfig _traverseKeyList:](self, "_traverseKeyList:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BAGConfig _checkIsArrayObject:typeBlock:](self, "_checkIsArrayObject:typeBlock:", v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)arrayForKeyList:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[BAGConfig arrayForKeyList:keyType:](self, "arrayForKeyList:keyType:", v4, -[BAGConfig defaultKeyType](self, "defaultKeyType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)arrayOfDataForKey:(id)a3 keyType:(unint64_t)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;
  void *v13;
  _QWORD v14[5];

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BAGConfig.m"), 230, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("key"));

  }
  if (!BAGIsValidConfigKeyType(a4))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BAGConfig.m"), 231, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("BAGIsValidConfigKeyType(keyType)"));

  }
  -[BAGConfig configuration](self, "configuration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __39__BAGConfig_arrayOfDataForKey_keyType___block_invoke;
  v14[3] = &unk_24D7BEAA0;
  v14[4] = self;
  -[BAGConfig _checkIsArrayObject:typeBlock:](self, "_checkIsArrayObject:typeBlock:", v9, v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

uint64_t __39__BAGConfig_arrayOfDataForKey_keyType___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_checkIsDataObject:", a2);
}

- (id)arrayOfDataForKey:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[BAGConfig arrayOfDataForKey:keyType:](self, "arrayOfDataForKey:keyType:", v4, -[BAGConfig defaultKeyType](self, "defaultKeyType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)arrayOfDataForKeyList:(id)a3 keyType:(unint64_t)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v11;
  void *v12;
  _QWORD v13[5];

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BAGConfig.m"), 242, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("keyList"));

  }
  if (!BAGIsValidConfigKeyType(a4))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BAGConfig.m"), 243, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("BAGIsValidConfigKeyType(keyType)"));

  }
  -[BAGConfig _traverseKeyList:](self, "_traverseKeyList:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __43__BAGConfig_arrayOfDataForKeyList_keyType___block_invoke;
  v13[3] = &unk_24D7BEAA0;
  v13[4] = self;
  -[BAGConfig _checkIsArrayObject:typeBlock:](self, "_checkIsArrayObject:typeBlock:", v8, v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

uint64_t __43__BAGConfig_arrayOfDataForKeyList_keyType___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_checkIsDataObject:", a2);
}

- (id)arrayOfDataForKeyList:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[BAGConfig arrayOfDataForKeyList:keyType:](self, "arrayOfDataForKeyList:keyType:", v4, -[BAGConfig defaultKeyType](self, "defaultKeyType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)arrayOfNumbersForKey:(id)a3 keyType:(unint64_t)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;
  void *v13;
  _QWORD v14[5];

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BAGConfig.m"), 255, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("key"));

  }
  if (!BAGIsValidConfigKeyType(a4))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BAGConfig.m"), 256, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("BAGIsValidConfigKeyType(keyType)"));

  }
  -[BAGConfig configuration](self, "configuration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __42__BAGConfig_arrayOfNumbersForKey_keyType___block_invoke;
  v14[3] = &unk_24D7BEAA0;
  v14[4] = self;
  -[BAGConfig _checkIsArrayObject:typeBlock:](self, "_checkIsArrayObject:typeBlock:", v9, v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

uint64_t __42__BAGConfig_arrayOfNumbersForKey_keyType___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_checkIsNumberObject:", a2);
}

- (id)arrayOfNumbersForKey:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[BAGConfig arrayOfNumbersForKey:keyType:](self, "arrayOfNumbersForKey:keyType:", v4, -[BAGConfig defaultKeyType](self, "defaultKeyType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)arrayOfNumbersForKeyList:(id)a3 keyType:(unint64_t)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v11;
  void *v12;
  _QWORD v13[5];

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BAGConfig.m"), 267, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("keyList"));

  }
  if (!BAGIsValidConfigKeyType(a4))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BAGConfig.m"), 268, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("BAGIsValidConfigKeyType(keyType)"));

  }
  -[BAGConfig _traverseKeyList:](self, "_traverseKeyList:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __46__BAGConfig_arrayOfNumbersForKeyList_keyType___block_invoke;
  v13[3] = &unk_24D7BEAA0;
  v13[4] = self;
  -[BAGConfig _checkIsArrayObject:typeBlock:](self, "_checkIsArrayObject:typeBlock:", v8, v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

uint64_t __46__BAGConfig_arrayOfNumbersForKeyList_keyType___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_checkIsNumberObject:", a2);
}

- (id)arrayOfNumbersForKeyList:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[BAGConfig arrayOfNumbersForKeyList:keyType:](self, "arrayOfNumbersForKeyList:keyType:", v4, -[BAGConfig defaultKeyType](self, "defaultKeyType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)arrayOfStringsForKey:(id)a3 keyType:(unint64_t)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;
  void *v13;
  _QWORD v14[5];

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BAGConfig.m"), 280, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("key"));

  }
  if (!BAGIsValidConfigKeyType(a4))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BAGConfig.m"), 281, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("BAGIsValidConfigKeyType(keyType)"));

  }
  -[BAGConfig configuration](self, "configuration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __42__BAGConfig_arrayOfStringsForKey_keyType___block_invoke;
  v14[3] = &unk_24D7BEAA0;
  v14[4] = self;
  -[BAGConfig _checkIsArrayObject:typeBlock:](self, "_checkIsArrayObject:typeBlock:", v9, v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

uint64_t __42__BAGConfig_arrayOfStringsForKey_keyType___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_checkIsStringObject:", a2);
}

- (id)arrayOfStringsForKey:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[BAGConfig arrayOfStringsForKey:keyType:](self, "arrayOfStringsForKey:keyType:", v4, -[BAGConfig defaultKeyType](self, "defaultKeyType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)arrayOfStringsForKeyList:(id)a3 keyType:(unint64_t)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v11;
  void *v12;
  _QWORD v13[5];

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BAGConfig.m"), 292, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("keyList"));

  }
  if (!BAGIsValidConfigKeyType(a4))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BAGConfig.m"), 293, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("BAGIsValidConfigKeyType(keyType)"));

  }
  -[BAGConfig _traverseKeyList:](self, "_traverseKeyList:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __46__BAGConfig_arrayOfStringsForKeyList_keyType___block_invoke;
  v13[3] = &unk_24D7BEAA0;
  v13[4] = self;
  -[BAGConfig _checkIsArrayObject:typeBlock:](self, "_checkIsArrayObject:typeBlock:", v8, v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

uint64_t __46__BAGConfig_arrayOfStringsForKeyList_keyType___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_checkIsStringObject:", a2);
}

- (id)arrayOfStringsForKeyList:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[BAGConfig arrayOfStringsForKeyList:keyType:](self, "arrayOfStringsForKeyList:keyType:", v4, -[BAGConfig defaultKeyType](self, "defaultKeyType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)BOOLForKey:(id)a3 keyType:(unint64_t)a4
{
  id v7;
  void *v8;
  void *v9;
  BOOL v10;
  void *v12;
  void *v13;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BAGConfig.m"), 305, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("key"));

  }
  if (!BAGIsValidConfigKeyType(a4))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BAGConfig.m"), 306, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("BAGIsValidConfigKeyType(keyType)"));

  }
  -[BAGConfig configuration](self, "configuration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[BAGConfig _checkIsBoolObject:](self, "_checkIsBoolObject:", v9);

  return v10;
}

- (BOOL)BOOLForKey:(id)a3
{
  id v4;

  v4 = a3;
  LOBYTE(self) = -[BAGConfig BOOLForKey:keyType:](self, "BOOLForKey:keyType:", v4, -[BAGConfig defaultKeyType](self, "defaultKeyType"));

  return (char)self;
}

- (BOOL)BOOLForKeyList:(id)a3 keyType:(unint64_t)a4
{
  id v7;
  void *v8;
  BOOL v9;
  void *v11;
  void *v12;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BAGConfig.m"), 315, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("keyList"));

  }
  if (!BAGIsValidConfigKeyType(a4))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BAGConfig.m"), 316, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("BAGIsValidConfigKeyType(keyType)"));

  }
  -[BAGConfig _traverseKeyList:](self, "_traverseKeyList:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[BAGConfig _checkIsBoolObject:](self, "_checkIsBoolObject:", v8);

  return v9;
}

- (BOOL)BOOLForKeyList:(id)a3
{
  id v4;

  v4 = a3;
  LOBYTE(self) = -[BAGConfig BOOLForKeyList:keyType:](self, "BOOLForKeyList:keyType:", v4, -[BAGConfig defaultKeyType](self, "defaultKeyType"));

  return (char)self;
}

- (id)dataForKey:(id)a3 keyType:(unint64_t)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;
  void *v13;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BAGConfig.m"), 326, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("key"));

  }
  if (!BAGIsValidConfigKeyType(a4))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BAGConfig.m"), 327, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("BAGIsValidConfigKeyType(keyType)"));

  }
  -[BAGConfig configuration](self, "configuration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BAGConfig _checkIsDataObject:](self, "_checkIsDataObject:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)dataForKey:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[BAGConfig dataForKey:keyType:](self, "dataForKey:keyType:", v4, -[BAGConfig defaultKeyType](self, "defaultKeyType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)dataForKeyList:(id)a3 keyType:(unint64_t)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v11;
  void *v12;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BAGConfig.m"), 336, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("keyList"));

  }
  if (!BAGIsValidConfigKeyType(a4))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BAGConfig.m"), 337, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("BAGIsValidConfigKeyType(keyType)"));

  }
  -[BAGConfig _traverseKeyList:](self, "_traverseKeyList:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BAGConfig _checkIsDataObject:](self, "_checkIsDataObject:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)dataForKeyList:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[BAGConfig dataForKeyList:keyType:](self, "dataForKeyList:keyType:", v4, -[BAGConfig defaultKeyType](self, "defaultKeyType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)dictionaryForKey:(id)a3 keyType:(unint64_t)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;
  void *v13;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BAGConfig.m"), 347, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("key"));

  }
  if (!BAGIsValidConfigKeyType(a4))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BAGConfig.m"), 348, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("BAGIsValidConfigKeyType(keyType)"));

  }
  -[BAGConfig configuration](self, "configuration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BAGConfig _checkIsDictionaryObject:typeBlock:](self, "_checkIsDictionaryObject:typeBlock:", v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)dictionaryForKey:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[BAGConfig dictionaryForKey:keyType:](self, "dictionaryForKey:keyType:", v4, -[BAGConfig defaultKeyType](self, "defaultKeyType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)dictionaryForKeyList:(id)a3 keyType:(unint64_t)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v11;
  void *v12;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BAGConfig.m"), 357, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("keyList"));

  }
  if (!BAGIsValidConfigKeyType(a4))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BAGConfig.m"), 358, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("BAGIsValidConfigKeyType(keyType)"));

  }
  -[BAGConfig _traverseKeyList:](self, "_traverseKeyList:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BAGConfig _checkIsDictionaryObject:typeBlock:](self, "_checkIsDictionaryObject:typeBlock:", v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)dictionaryForKeyList:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[BAGConfig dictionaryForKeyList:keyType:](self, "dictionaryForKeyList:keyType:", v4, -[BAGConfig defaultKeyType](self, "defaultKeyType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)dictionaryOfDataForKey:(id)a3 keyType:(unint64_t)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;
  void *v13;
  _QWORD v14[5];

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BAGConfig.m"), 368, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("key"));

  }
  if (!BAGIsValidConfigKeyType(a4))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BAGConfig.m"), 369, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("BAGIsValidConfigKeyType(keyType)"));

  }
  -[BAGConfig configuration](self, "configuration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __44__BAGConfig_dictionaryOfDataForKey_keyType___block_invoke;
  v14[3] = &unk_24D7BEAA0;
  v14[4] = self;
  -[BAGConfig _checkIsDictionaryObject:typeBlock:](self, "_checkIsDictionaryObject:typeBlock:", v9, v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

uint64_t __44__BAGConfig_dictionaryOfDataForKey_keyType___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_checkIsDataObject:", a2);
}

- (id)dictionaryOfDataForKey:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[BAGConfig dictionaryOfDataForKey:keyType:](self, "dictionaryOfDataForKey:keyType:", v4, -[BAGConfig defaultKeyType](self, "defaultKeyType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)dictionaryOfDataForKeyList:(id)a3 keyType:(unint64_t)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v11;
  void *v12;
  _QWORD v13[5];

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BAGConfig.m"), 380, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("keyList"));

  }
  if (!BAGIsValidConfigKeyType(a4))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BAGConfig.m"), 381, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("BAGIsValidConfigKeyType(keyType)"));

  }
  -[BAGConfig _traverseKeyList:](self, "_traverseKeyList:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __48__BAGConfig_dictionaryOfDataForKeyList_keyType___block_invoke;
  v13[3] = &unk_24D7BEAA0;
  v13[4] = self;
  -[BAGConfig _checkIsDictionaryObject:typeBlock:](self, "_checkIsDictionaryObject:typeBlock:", v8, v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

uint64_t __48__BAGConfig_dictionaryOfDataForKeyList_keyType___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_checkIsDataObject:", a2);
}

- (id)dictionaryOfDataForKeyList:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[BAGConfig dictionaryOfDataForKeyList:keyType:](self, "dictionaryOfDataForKeyList:keyType:", v4, -[BAGConfig defaultKeyType](self, "defaultKeyType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)dictionaryOfNumbersForKey:(id)a3 keyType:(unint64_t)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;
  void *v13;
  _QWORD v14[5];

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BAGConfig.m"), 393, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("key"));

  }
  if (!BAGIsValidConfigKeyType(a4))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BAGConfig.m"), 394, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("BAGIsValidConfigKeyType(keyType)"));

  }
  -[BAGConfig configuration](self, "configuration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __47__BAGConfig_dictionaryOfNumbersForKey_keyType___block_invoke;
  v14[3] = &unk_24D7BEAA0;
  v14[4] = self;
  -[BAGConfig _checkIsDictionaryObject:typeBlock:](self, "_checkIsDictionaryObject:typeBlock:", v9, v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

uint64_t __47__BAGConfig_dictionaryOfNumbersForKey_keyType___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_checkIsNumberObject:", a2);
}

- (id)dictionaryOfNumbersForKey:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[BAGConfig dictionaryOfNumbersForKey:keyType:](self, "dictionaryOfNumbersForKey:keyType:", v4, -[BAGConfig defaultKeyType](self, "defaultKeyType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)dictionaryOfNumbersForKeyList:(id)a3 keyType:(unint64_t)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v11;
  void *v12;
  _QWORD v13[5];

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BAGConfig.m"), 405, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("keyList"));

  }
  if (!BAGIsValidConfigKeyType(a4))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BAGConfig.m"), 406, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("BAGIsValidConfigKeyType(keyType)"));

  }
  -[BAGConfig _traverseKeyList:](self, "_traverseKeyList:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __51__BAGConfig_dictionaryOfNumbersForKeyList_keyType___block_invoke;
  v13[3] = &unk_24D7BEAA0;
  v13[4] = self;
  -[BAGConfig _checkIsDictionaryObject:typeBlock:](self, "_checkIsDictionaryObject:typeBlock:", v8, v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

uint64_t __51__BAGConfig_dictionaryOfNumbersForKeyList_keyType___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_checkIsNumberObject:", a2);
}

- (id)dictionaryOfNumbersForKeyList:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[BAGConfig dictionaryOfNumbersForKeyList:keyType:](self, "dictionaryOfNumbersForKeyList:keyType:", v4, -[BAGConfig defaultKeyType](self, "defaultKeyType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)dictionaryOfStringsForKey:(id)a3 keyType:(unint64_t)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;
  void *v13;
  _QWORD v14[5];

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BAGConfig.m"), 418, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("key"));

  }
  if (!BAGIsValidConfigKeyType(a4))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BAGConfig.m"), 419, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("BAGIsValidConfigKeyType(keyType)"));

  }
  -[BAGConfig configuration](self, "configuration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __47__BAGConfig_dictionaryOfStringsForKey_keyType___block_invoke;
  v14[3] = &unk_24D7BEAA0;
  v14[4] = self;
  -[BAGConfig _checkIsDictionaryObject:typeBlock:](self, "_checkIsDictionaryObject:typeBlock:", v9, v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

uint64_t __47__BAGConfig_dictionaryOfStringsForKey_keyType___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_checkIsStringObject:", a2);
}

- (id)dictionaryOfStringsForKey:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[BAGConfig dictionaryOfStringsForKey:keyType:](self, "dictionaryOfStringsForKey:keyType:", v4, -[BAGConfig defaultKeyType](self, "defaultKeyType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)dictionaryOfStringsForKeyList:(id)a3 keyType:(unint64_t)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v11;
  void *v12;
  _QWORD v13[5];

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BAGConfig.m"), 430, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("keyList"));

  }
  if (!BAGIsValidConfigKeyType(a4))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BAGConfig.m"), 431, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("BAGIsValidConfigKeyType(keyType)"));

  }
  -[BAGConfig _traverseKeyList:](self, "_traverseKeyList:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __51__BAGConfig_dictionaryOfStringsForKeyList_keyType___block_invoke;
  v13[3] = &unk_24D7BEAA0;
  v13[4] = self;
  -[BAGConfig _checkIsDictionaryObject:typeBlock:](self, "_checkIsDictionaryObject:typeBlock:", v8, v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

uint64_t __51__BAGConfig_dictionaryOfStringsForKeyList_keyType___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_checkIsStringObject:", a2);
}

- (id)dictionaryOfStringsForKeyList:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[BAGConfig dictionaryOfStringsForKeyList:keyType:](self, "dictionaryOfStringsForKeyList:keyType:", v4, -[BAGConfig defaultKeyType](self, "defaultKeyType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)numberForKey:(id)a3 keyType:(unint64_t)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;
  void *v13;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BAGConfig.m"), 443, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("key"));

  }
  if (!BAGIsValidConfigKeyType(a4))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BAGConfig.m"), 444, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("BAGIsValidConfigKeyType(keyType)"));

  }
  -[BAGConfig configuration](self, "configuration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BAGConfig _checkIsNumberObject:](self, "_checkIsNumberObject:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)numberForKey:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[BAGConfig numberForKey:keyType:](self, "numberForKey:keyType:", v4, -[BAGConfig defaultKeyType](self, "defaultKeyType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)numberForKeyList:(id)a3 keyType:(unint64_t)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v11;
  void *v12;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BAGConfig.m"), 453, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("keyList"));

  }
  if (!BAGIsValidConfigKeyType(a4))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BAGConfig.m"), 454, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("BAGIsValidConfigKeyType(keyType)"));

  }
  -[BAGConfig _traverseKeyList:](self, "_traverseKeyList:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BAGConfig _checkIsNumberObject:](self, "_checkIsNumberObject:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)numberForKeyList:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[BAGConfig numberForKeyList:keyType:](self, "numberForKeyList:keyType:", v4, -[BAGConfig defaultKeyType](self, "defaultKeyType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)stringForKey:(id)a3 keyType:(unint64_t)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;
  void *v13;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BAGConfig.m"), 464, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("key"));

  }
  if (!BAGIsValidConfigKeyType(a4))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BAGConfig.m"), 465, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("BAGIsValidConfigKeyType(keyType)"));

  }
  -[BAGConfig configuration](self, "configuration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BAGConfig _checkIsStringObject:](self, "_checkIsStringObject:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)stringForKey:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[BAGConfig stringForKey:keyType:](self, "stringForKey:keyType:", v4, -[BAGConfig defaultKeyType](self, "defaultKeyType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)stringForKeyList:(id)a3 keyType:(unint64_t)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v11;
  void *v12;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BAGConfig.m"), 474, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("keyList"));

  }
  if (!BAGIsValidConfigKeyType(a4))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BAGConfig.m"), 475, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("BAGIsValidConfigKeyType(keyType)"));

  }
  -[BAGConfig _traverseKeyList:](self, "_traverseKeyList:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BAGConfig _checkIsStringObject:](self, "_checkIsStringObject:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)stringForKeyList:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[BAGConfig stringForKeyList:keyType:](self, "stringForKeyList:keyType:", v4, -[BAGConfig defaultKeyType](self, "defaultKeyType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BAGResourceOptions)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
  objc_storeStrong((id *)&self->_options, a3);
}

- (unint64_t)defaultKeyType
{
  return self->_defaultKeyType;
}

- (void)setDefaultKeyType:(unint64_t)a3
{
  self->_defaultKeyType = a3;
}

- (NSDictionary)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_options, 0);
}

@end
