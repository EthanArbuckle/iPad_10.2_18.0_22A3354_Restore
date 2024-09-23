@implementation BMDSLMultiKeyPathsTransform

- (BMDSLMultiKeyPathsTransform)initWithKeyPaths:(id)a3 name:(id)a4 version:(unsigned int)a5
{
  uint64_t v5;
  id v8;
  BMDSLMultiKeyPathsTransform *v9;
  uint64_t v10;
  NSArray *keyPaths;
  BMDSLMultiKeyPathsTransform *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  objc_super v21;

  v5 = *(_QWORD *)&a5;
  v8 = a3;
  if ((_DWORD)v5 == 1)
  {
    v21.receiver = self;
    v21.super_class = (Class)BMDSLMultiKeyPathsTransform;
    v9 = -[BMDSLBaseCodable initWithName:version:](&v21, sel_initWithName_version_, a4, 1);
    if (v9)
    {
      v10 = objc_msgSend(v8, "copy");
      keyPaths = v9->_keyPaths;
      v9->_keyPaths = (NSArray *)v10;

    }
    self = v9;
    v12 = self;
  }
  else
  {
    __biome_log_for_category();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[BMDSLKeyPathTransform initWithKeyPath:name:version:].cold.1(v5, v13, v14, v15, v16, v17, v18, v19);

    v12 = 0;
  }

  return v12;
}

+ (id)withKeyPaths:(id)a3
{
  id v3;
  BMDSLMultiKeyPathsTransform *v4;

  v3 = a3;
  v4 = -[BMDSLMultiKeyPathsTransform initWithKeyPaths:]([BMDSLMultiKeyPathsTransform alloc], "initWithKeyPaths:", v3);

  return v4;
}

- (BMDSLMultiKeyPathsTransform)initWithKeyPaths:(id)a3
{
  return -[BMDSLMultiKeyPathsTransform initWithKeyPaths:name:version:](self, "initWithKeyPaths:name:version:", a3, CFSTR("multiKeyPaths"), 1);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BMDSLMultiKeyPathsTransform;
  v4 = a3;
  -[BMDSLBaseCodable encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[BMDSLMultiKeyPathsTransform keyPaths](self, "keyPaths", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("keyPaths"));

}

- (BMDSLMultiKeyPathsTransform)initWithCoder:(id)a3
{
  id v4;
  BMDSLMultiKeyPathsTransform *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)BMDSLMultiKeyPathsTransform;
  v5 = -[BMDSLBaseCodable initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("keyPaths"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[BMDSLBaseCodable name](v5, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[BMDSLMultiKeyPathsTransform initWithKeyPaths:name:version:](v5, "initWithKeyPaths:name:version:", v9, v10, -[BMDSLBaseCodable version](v5, "version"));

  }
  return v5;
}

- (id)transformInput:(id)a3 combinedState:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_opt_new();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[BMDSLMultiKeyPathsTransform keyPaths](self, "keyPaths", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        BMDSLValueForKeyPath(v7, v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v15, v14);
        }
        else
        {
          BMDSLValueForKeyPath(v6, v14);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (v16)
            objc_msgSend(v8, "setObject:forKeyedSubscript:", v16, v14);

        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v11);
  }

  return v8;
}

- (NSArray)keyPaths
{
  return self->_keyPaths;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyPaths, 0);
}

@end
