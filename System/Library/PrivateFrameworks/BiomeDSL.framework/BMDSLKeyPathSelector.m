@implementation BMDSLKeyPathSelector

- (BMDSLKeyPathSelector)initWithName:(id)a3 version:(unsigned int)a4 keyPaths:(id)a5
{
  uint64_t v5;
  id v8;
  BMDSLKeyPathSelector *v9;
  uint64_t v10;
  NSArray *keyPaths;
  objc_super v13;

  v5 = *(_QWORD *)&a4;
  v8 = a5;
  v13.receiver = self;
  v13.super_class = (Class)BMDSLKeyPathSelector;
  v9 = -[BMDSLBaseCodable initWithName:version:](&v13, sel_initWithName_version_, a3, v5);
  if (v9)
  {
    v10 = objc_msgSend(v8, "copy");
    keyPaths = v9->_keyPaths;
    v9->_keyPaths = (NSArray *)v10;

  }
  return v9;
}

- (BMDSLKeyPathSelector)initWithKeyPaths:(id)a3
{
  return -[BMDSLKeyPathSelector initWithName:version:keyPaths:](self, "initWithName:version:keyPaths:", CFSTR("keyPathSelector"), 1, a3);
}

+ (id)withKeyPaths:(id)a3
{
  id v3;
  BMDSLKeyPathSelector *v4;

  v3 = a3;
  v4 = -[BMDSLKeyPathSelector initWithKeyPaths:]([BMDSLKeyPathSelector alloc], "initWithKeyPaths:", v3);

  return v4;
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
  v6.super_class = (Class)BMDSLKeyPathSelector;
  v4 = a3;
  -[BMDSLBaseCodable encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[BMDSLKeyPathSelector keyPaths](self, "keyPaths", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("keyPathSelector"));

}

- (BMDSLKeyPathSelector)initWithCoder:(id)a3
{
  id v4;
  BMDSLKeyPathSelector *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BMDSLKeyPathSelector;
  v5 = -[BMDSLBaseCodable initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    +[BMDSLClasses allowed](BMDSLClasses, "allowed");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("keyPathSelector"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[BMDSLBaseCodable name](v5, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[BMDSLKeyPathSelector initWithName:version:keyPaths:](v5, "initWithName:version:keyPaths:", v8, -[BMDSLBaseCodable version](v5, "version"), v7);

  }
  return v5;
}

- (id)argumentsFromInput:(id)a3 combinedState:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[BMDSLKeyPathSelector keyPaths](self, "keyPaths");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9)
  {
    v10 = v6;
    v11 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    -[BMDSLKeyPathSelector keyPaths](self, "keyPaths", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v24 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          BMDSLValueForKeyPath(v7, v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (v18)
          {
            objc_msgSend(v11, "addObject:", v18);
          }
          else
          {
            BMDSLValueForKeyPath(v10, v17);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            if (v19)
              objc_msgSend(v11, "addObject:", v19);

          }
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v14);
    }

    if (objc_msgSend(v11, "count"))
      v20 = v11;
    else
      v20 = v10;
    v21 = (void *)objc_msgSend(v20, "copy");

  }
  else
  {
    v21 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v21;
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
