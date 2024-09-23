@implementation BMDSLPersistentDerivatives

- (BMDSLPersistentDerivatives)initWithUpstream:(id)a3 databaseURL:(id)a4 derivedTableName:(id)a5 name:(id)a6 version:(unsigned int)a7
{
  id v13;
  id v14;
  id v15;
  BMDSLPersistentDerivatives *v16;
  BMDSLPersistentDerivatives *v17;
  uint64_t v18;
  NSURL *url;
  uint64_t v20;
  NSString *tableName;
  BMDSLPersistentDerivatives *v22;
  NSObject *v23;
  objc_super v25;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  if (a7 == 1)
  {
    v25.receiver = self;
    v25.super_class = (Class)BMDSLPersistentDerivatives;
    v16 = -[BMDSLBaseCodable initWithName:version:](&v25, sel_initWithName_version_, a6, 1);
    v17 = v16;
    if (v16)
    {
      objc_storeStrong((id *)&v16->_upstream, a3);
      v18 = objc_msgSend(v14, "copy");
      url = v17->_url;
      v17->_url = (NSURL *)v18;

      v20 = objc_msgSend(v15, "copy");
      tableName = v17->_tableName;
      v17->_tableName = (NSString *)v20;

    }
    self = v17;
    v22 = self;
  }
  else
  {
    __biome_log_for_category();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      -[BMDSLPersistentDerivatives initWithUpstream:databaseURL:derivedTableName:name:version:].cold.1(a7, v23);

    v22 = 0;
  }

  return v22;
}

- (BMDSLPersistentDerivatives)initWithUpstream:(id)a3 databaseURL:(id)a4 derivedTableName:(id)a5
{
  return -[BMDSLPersistentDerivatives initWithUpstream:databaseURL:derivedTableName:name:version:](self, "initWithUpstream:databaseURL:derivedTableName:name:version:", a3, a4, a5, CFSTR("persistentderivatives"), 1);
}

- (id)upstreams
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  -[BMDSLPersistentDerivatives upstream](self, "upstream");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)bpsPublisher
{
  BMPersistentDerivatives *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  BMPersistentDerivatives *v8;

  v3 = [BMPersistentDerivatives alloc];
  -[BMDSLPersistentDerivatives upstream](self, "upstream");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bpsPublisher");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMDSLPersistentDerivatives url](self, "url");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMDSLPersistentDerivatives tableName](self, "tableName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[BMPersistentDerivatives initWithUpstream:derivativeDatabaseURL:derivedTableName:](v3, "initWithUpstream:derivativeDatabaseURL:derivedTableName:", v5, v6, v7);

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BMDSLPersistentDerivatives;
  v4 = a3;
  -[BMDSLBaseCodable encodeWithCoder:](&v8, sel_encodeWithCoder_, v4);
  -[BMDSLPersistentDerivatives upstream](self, "upstream", v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, *MEMORY[0x1E0D01BD8]);

  -[BMDSLPersistentDerivatives url](self, "url");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("url"));

  -[BMDSLPersistentDerivatives tableName](self, "tableName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("tableName"));

}

- (BMDSLPersistentDerivatives)initWithCoder:(id)a3
{
  id v4;
  BMDSLPersistentDerivatives *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)BMDSLPersistentDerivatives;
  v5 = -[BMDSLBaseCodable initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0D01B90], "allowed");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, *MEMORY[0x1E0D01BD8]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("url"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("tableName"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[BMDSLBaseCodable name](v5, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[BMDSLPersistentDerivatives initWithUpstream:databaseURL:derivedTableName:name:version:](v5, "initWithUpstream:databaseURL:derivedTableName:name:version:", v7, v8, v9, v10, -[BMDSLBaseCodable version](v5, "version"));

  }
  return v5;
}

- (NSURL)url
{
  return self->_url;
}

- (NSString)tableName
{
  return self->_tableName;
}

- (BMDSL)upstream
{
  return self->_upstream;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_upstream, 0);
  objc_storeStrong((id *)&self->_tableName, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

- (void)initWithUpstream:(int)a1 databaseURL:(NSObject *)a2 derivedTableName:name:version:.cold.1(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_18D810000, a2, OS_LOG_TYPE_ERROR, "Unexpected version %u. Failed to initialize BMDSLPersistentDerivatives", (uint8_t *)v2, 8u);
}

@end
