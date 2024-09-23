@implementation BMDSLKeyPathRowTransform

- (BMDSLKeyPathRowTransform)initWithKeyPaths:(id)a3 columnNames:(id)a4 name:(id)a5 version:(unsigned int)a6
{
  id v11;
  id v12;
  BMDSLKeyPathRowTransform *v13;
  id *p_isa;
  BMDSLKeyPathRowTransform *v15;
  NSObject *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  if (a6 == 1)
  {
    v18.receiver = self;
    v18.super_class = (Class)BMDSLKeyPathRowTransform;
    v13 = -[BMDSLBaseCodable initWithName:version:](&v18, sel_initWithName_version_, a5, 1);
    p_isa = (id *)&v13->super.super.isa;
    if (v13)
    {
      objc_storeStrong((id *)&v13->_keyPaths, a3);
      objc_storeStrong(p_isa + 4, a4);
    }
    self = p_isa;
    v15 = self;
  }
  else
  {
    __biome_log_for_category();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[BMDSLKeyPathRowTransform initWithKeyPaths:columnNames:name:version:].cold.1(a6, v16);

    v15 = 0;
  }

  return v15;
}

- (BMDSLKeyPathRowTransform)initWithKeyPaths:(id)a3 columnNames:(id)a4
{
  return -[BMDSLKeyPathRowTransform initWithKeyPaths:columnNames:name:version:](self, "initWithKeyPaths:columnNames:name:version:", a3, a4, CFSTR("keyPathRowTransform"), 1);
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
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BMDSLKeyPathRowTransform;
  v4 = a3;
  -[BMDSLBaseCodable encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  -[BMDSLKeyPathRowTransform keyPaths](self, "keyPaths", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("keyPaths"));

  -[BMDSLKeyPathRowTransform columnNames](self, "columnNames");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("columnNames"));

}

- (BMDSLKeyPathRowTransform)initWithCoder:(id)a3
{
  id v4;
  BMDSLKeyPathRowTransform *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)BMDSLKeyPathRowTransform;
  v5 = -[BMDSLBaseCodable initWithCoder:](&v13, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("keyPaths"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("columnNames"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[BMDSLBaseCodable name](v5, "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[BMDSLKeyPathRowTransform initWithKeyPaths:columnNames:name:version:](v5, "initWithKeyPaths:columnNames:name:version:", v9, v10, v11, -[BMDSLBaseCodable version](v5, "version"));

  }
  return v5;
}

- (id)rowFromInput:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = (void *)MEMORY[0x1E0D01BB8];
  v5 = a3;
  -[BMDSLKeyPathRowTransform keyPaths](self, "keyPaths");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "withKeyPaths:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D01B80], "withSelector:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "transformInput:combinedState:", v5, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D01BE8]), "initWithValues:", v9);
  return v10;
}

- (NSArray)keyPaths
{
  return self->_keyPaths;
}

- (void)setKeyPaths:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSArray)columnNames
{
  return self->_columnNames;
}

- (void)setColumnNames:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_columnNames, 0);
  objc_storeStrong((id *)&self->_keyPaths, 0);
}

- (void)initWithKeyPaths:(int)a1 columnNames:(NSObject *)a2 name:version:.cold.1(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_18D810000, a2, OS_LOG_TYPE_ERROR, "Unexpected version %u. Failed to initialize BMDSLKeyPathRowTransform", (uint8_t *)v2, 8u);
}

@end
