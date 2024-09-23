@implementation BMDSLMerge

- (id)bpsPublisher
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[BMDSLMerge a](self, "a");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bpsPublisher");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[BMDSLMerge b](self, "b");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bpsPublisher");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "mergeWithOther:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BMDSLMerge)initWithA:(id)a3 b:(id)a4 name:(id)a5 version:(unsigned int)a6
{
  id v11;
  id v12;
  BMDSLMerge *v13;
  id *p_isa;
  BMDSLMerge *v15;
  NSObject *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  if (a6 == 1)
  {
    v18.receiver = self;
    v18.super_class = (Class)BMDSLMerge;
    v13 = -[BMDSLBaseCodable initWithName:version:](&v18, sel_initWithName_version_, a5, 1);
    p_isa = (id *)&v13->super.super.super.isa;
    if (v13)
    {
      objc_storeStrong((id *)&v13->_a, a3);
      objc_storeStrong(p_isa + 4, a4);
    }
    self = p_isa;
    v15 = self;
  }
  else
  {
    __biome_log_for_category();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      -[BMDSLMerge initWithA:b:name:version:].cold.1(a6, v16);

    v15 = 0;
  }

  return v15;
}

- (BMDSLMerge)initWithA:(id)a3 b:(id)a4
{
  return -[BMDSLMerge initWithA:b:name:version:](self, "initWithA:b:name:version:", a3, a4, CFSTR("merge"), 1);
}

- (id)upstreams
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  -[BMDSLMerge a](self, "a");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  -[BMDSLMerge b](self, "b");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
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
  v7.super_class = (Class)BMDSLMerge;
  v4 = a3;
  -[BMDSLBaseCodable encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  -[BMDSLMerge a](self, "a", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("first"));

  -[BMDSLMerge b](self, "b");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("second"));

}

- (BMDSLMerge)initWithCoder:(id)a3
{
  id v4;
  BMDSLMerge *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)BMDSLMerge;
  v5 = -[BMDSLBaseCodable initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (v5)
  {
    +[BMDSLClasses allowed](BMDSLClasses, "allowed");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("first"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    +[BMDSLClasses allowed](BMDSLClasses, "allowed");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("second"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[BMDSLBaseCodable name](v5, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[BMDSLMerge initWithA:b:name:version:](v5, "initWithA:b:name:version:", v7, v9, v10, -[BMDSLBaseCodable version](v5, "version"));

  }
  return v5;
}

- (BMDSL)a
{
  return self->_a;
}

- (BMDSL)b
{
  return self->_b;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_b, 0);
  objc_storeStrong((id *)&self->_a, 0);
}

- (void)initWithA:(int)a1 b:(NSObject *)a2 name:version:.cold.1(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_fault_impl(&dword_1AEB18000, a2, OS_LOG_TYPE_FAULT, "Unexpected version %u. Failed to initialize BMDSLMerge", (uint8_t *)v2, 8u);
}

@end
