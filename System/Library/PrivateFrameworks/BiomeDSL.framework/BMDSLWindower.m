@implementation BMDSLWindower

+ (id)name
{
  return CFSTR("windower");
}

- (BMDSLWindower)initWithUpstream:(id)a3 keyedPath:(id)a4 assigner:(id)a5 name:(id)a6 version:(unsigned int)a7
{
  uint64_t v7;
  id v13;
  id v14;
  id v15;
  BMDSLWindower *v16;
  BMDSLWindower *v17;
  uint64_t v18;
  NSString *keyedPath;
  BMDSLWindower *v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  objc_super v29;

  v7 = *(_QWORD *)&a7;
  v13 = a3;
  v14 = a4;
  v15 = a5;
  if ((_DWORD)v7 == 1)
  {
    v29.receiver = self;
    v29.super_class = (Class)BMDSLWindower;
    v16 = -[BMDSLBaseCodable initWithName:version:](&v29, sel_initWithName_version_, a6, 1);
    v17 = v16;
    if (v16)
    {
      objc_storeStrong((id *)&v16->_upstream, a3);
      v18 = objc_msgSend(v14, "copy");
      keyedPath = v17->_keyedPath;
      v17->_keyedPath = (NSString *)v18;

      objc_storeStrong((id *)&v17->_assigner, a5);
    }
    self = v17;
    v20 = self;
  }
  else
  {
    __biome_log_for_category();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[BMDSLWindower initWithUpstream:keyedPath:assigner:name:version:].cold.1(v7, v21, v22, v23, v24, v25, v26, v27);

    v20 = 0;
  }

  return v20;
}

- (BMDSLWindower)initWithUpstream:(id)a3 keyedPath:(id)a4 assigner:(id)a5
{
  return -[BMDSLWindower initWithUpstream:keyedPath:assigner:name:version:](self, "initWithUpstream:keyedPath:assigner:name:version:", a3, a4, a5, CFSTR("windower"), 1);
}

- (id)upstreams
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  -[BMDSLWindower upstream](self, "upstream");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
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
  void *v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BMDSLWindower;
  -[BMDSLBaseCodable encodeWithCoder:](&v9, sel_encodeWithCoder_, v4);
  -[BMDSLWindower upstream](self, "upstream");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("upstream"));

  -[BMDSLWindower assigner](self, "assigner");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("assigner"));

  -[BMDSLWindower keyedPath](self, "keyedPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[BMDSLWindower keyedPath](self, "keyedPath");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("keyedPath"));

  }
}

- (BMDSLWindower)initWithCoder:(id)a3
{
  id v4;
  BMDSLWindower *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)BMDSLWindower;
  v5 = -[BMDSLBaseCodable initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (v5)
  {
    +[BMDSLClasses allowed](BMDSLClasses, "allowed");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("upstream"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("keyedPath"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("assigner"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[BMDSLBaseCodable name](v5, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[BMDSLWindower initWithUpstream:keyedPath:assigner:name:version:](v5, "initWithUpstream:keyedPath:assigner:name:version:", v7, v8, v9, v10, -[BMDSLBaseCodable version](v5, "version"));

  }
  return v5;
}

- (NSString)keyedPath
{
  return self->_keyedPath;
}

- (BMDSLWindowAssigner)assigner
{
  return self->_assigner;
}

- (BMDSL)upstream
{
  return self->_upstream;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_upstream, 0);
  objc_storeStrong((id *)&self->_assigner, 0);
  objc_storeStrong((id *)&self->_keyedPath, 0);
}

- (id)bpsPublisher
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v11[5];

  -[BMDSLWindower upstream](self, "upstream");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bpsPublisher");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[BMDSLWindower assigner](self, "assigner");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bpsWindowAssigner");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[BMDSLWindower keyedPath](self, "keyedPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __40__BMDSLWindower_BPSPubSub__bpsPublisher__block_invoke;
    v11[3] = &unk_1E5E36450;
    v11[4] = self;
    objc_msgSend(v4, "windowByKey:assigner:", v11, v6);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "windowWithAssigner:", v6);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v8;

  return v9;
}

id __40__BMDSLWindower_BPSPubSub__bpsPublisher__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "keyedPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMDSLValueForKeyPath(v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)initWithUpstream:(uint64_t)a3 keyedPath:(uint64_t)a4 assigner:(uint64_t)a5 name:(uint64_t)a6 version:(uint64_t)a7 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1AEB18000, a2, a3, "Unexpected version %u. Failed to initialize BMDSLWindower", a5, a6, a7, a8, 0);
}

@end
