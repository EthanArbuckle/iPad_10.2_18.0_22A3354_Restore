@implementation BMDSLKeyPathTransform

- (BMDSLKeyPathTransform)initWithKeyPath:(id)a3 name:(id)a4 version:(unsigned int)a5
{
  uint64_t v5;
  id v8;
  BMDSLKeyPathTransform *v9;
  uint64_t v10;
  NSString *keyPath;
  BMDSLKeyPathTransform *v12;
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
    v21.super_class = (Class)BMDSLKeyPathTransform;
    v9 = -[BMDSLBaseCodable initWithName:version:](&v21, sel_initWithName_version_, a4, 1);
    if (v9)
    {
      v10 = objc_msgSend(v8, "copy");
      keyPath = v9->_keyPath;
      v9->_keyPath = (NSString *)v10;

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

+ (id)withKeyPath:(id)a3
{
  id v3;
  BMDSLKeyPathTransform *v4;

  v3 = a3;
  v4 = -[BMDSLKeyPathTransform initWithKeyPath:]([BMDSLKeyPathTransform alloc], "initWithKeyPath:", v3);

  return v4;
}

- (BMDSLKeyPathTransform)initWithKeyPath:(id)a3
{
  return -[BMDSLKeyPathTransform initWithKeyPath:name:version:](self, "initWithKeyPath:name:version:", a3, CFSTR("keyPath"), 1);
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
  v6.super_class = (Class)BMDSLKeyPathTransform;
  v4 = a3;
  -[BMDSLBaseCodable encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[BMDSLKeyPathTransform keyPath](self, "keyPath", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("keyPath"));

}

- (BMDSLKeyPathTransform)initWithCoder:(id)a3
{
  id v4;
  BMDSLKeyPathTransform *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BMDSLKeyPathTransform;
  v5 = -[BMDSLBaseCodable initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("keyPath"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[BMDSLBaseCodable name](v5, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[BMDSLKeyPathTransform initWithKeyPath:name:version:](v5, "initWithKeyPath:name:version:", v6, v7, -[BMDSLBaseCodable version](v5, "version"));

  }
  return v5;
}

- (id)transformInput:(id)a3 combinedState:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  -[BMDSLKeyPathTransform keyPath](self, "keyPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  BMDSLValueForKeyPath(v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = v9;
  }
  else
  {
    -[BMDSLKeyPathTransform keyPath](self, "keyPath");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    BMDSLValueForKeyPath(v6, v11);
    v10 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

- (NSString)keyPath
{
  return self->_keyPath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyPath, 0);
}

- (void)initWithKeyPath:(uint64_t)a3 name:(uint64_t)a4 version:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1AEB18000, a2, a3, "Unexpected version %u. Failed to initialize BMDSLKeyPathTransform", a5, a6, a7, a8, 0);
}

@end
