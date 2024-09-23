@implementation BMDSLOrderedMerge

- (BMDSLOrderedMerge)initWithA:(id)a3 b:(id)a4 key:(id)a5 selector:(SEL)a6 name:(id)a7 version:(unsigned int)a8
{
  id v15;
  id v16;
  id v17;
  BMDSLOrderedMerge *v18;
  NSString *v19;
  NSString *selectorName;
  void *v21;
  char v22;
  BMDSLOrderedMerge *v23;
  NSObject *v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  objc_super v33;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  if (a8 != 1)
  {
    __biome_log_for_category();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
      -[BMDSLOrderedMerge initWithA:b:key:selector:name:version:].cold.2(a8, v24);

    goto LABEL_11;
  }
  v33.receiver = self;
  v33.super_class = (Class)BMDSLOrderedMerge;
  v18 = -[BMDSLBaseCodable initWithName:version:](&v33, sel_initWithName_version_, a7, 1);
  self = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_a, a3);
    objc_storeStrong((id *)&self->_b, a4);
    objc_storeStrong((id *)&self->_key, a5);
    NSStringFromSelector(a6);
    v19 = (NSString *)objc_claimAutoreleasedReturnValue();
    selectorName = self->_selectorName;
    self->_selectorName = v19;

    +[BMDSLTransforms allowedTransforms](BMDSLTransforms, "allowedTransforms");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "containsObject:", self->_selectorName);

    if ((v22 & 1) == 0)
    {
      __biome_log_for_category();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
        -[BMDSLOrderedMerge initWithA:b:key:selector:name:version:].cold.1((uint64_t)&self->_selectorName, v25, v26, v27, v28, v29, v30, v31);

LABEL_11:
      v23 = 0;
      goto LABEL_12;
    }
  }
  self = self;
  v23 = self;
LABEL_12:

  return v23;
}

- (BMDSLOrderedMerge)initWithA:(id)a3 b:(id)a4 key:(id)a5 selector:(SEL)a6
{
  return -[BMDSLOrderedMerge initWithA:b:key:selector:name:version:](self, "initWithA:b:key:selector:name:version:", a3, a4, a5, a6, CFSTR("orderedMerge"), 1);
}

- (id)upstreams
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  -[BMDSLOrderedMerge a](self, "a");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  -[BMDSLOrderedMerge b](self, "b");
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
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)BMDSLOrderedMerge;
  v4 = a3;
  -[BMDSLBaseCodable encodeWithCoder:](&v9, sel_encodeWithCoder_, v4);
  -[BMDSLOrderedMerge a](self, "a", v9.receiver, v9.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("first"));

  -[BMDSLOrderedMerge b](self, "b");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("second"));

  -[BMDSLOrderedMerge key](self, "key");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("key"));

  -[BMDSLOrderedMerge selectorName](self, "selectorName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("selector"));

}

- (BMDSLOrderedMerge)initWithCoder:(id)a3
{
  id v4;
  BMDSLOrderedMerge *v5;
  BMDSLOrderedMerge *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSString *v12;
  void *v13;
  char v14;
  SEL v15;
  NSObject *v16;
  BMDSLOrderedMerge *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)BMDSLOrderedMerge;
  v5 = -[BMDSLBaseCodable initWithCoder:](&v25, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = v5;
    +[BMDSLClasses allowed](BMDSLClasses, "allowed");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v7, CFSTR("first"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    +[BMDSLClasses allowed](BMDSLClasses, "allowed");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("second"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("key"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("selector"));
    v12 = (NSString *)objc_claimAutoreleasedReturnValue();
    +[BMDSLTransforms allowedTransforms](BMDSLTransforms, "allowedTransforms");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "containsObject:", v12);

    if ((v14 & 1) != 0)
    {
      v15 = NSSelectorFromString(v12);
      -[BMDSLBaseCodable name](v6, "name");
      v16 = objc_claimAutoreleasedReturnValue();
      v6 = -[BMDSLOrderedMerge initWithA:b:key:selector:name:version:](v6, "initWithA:b:key:selector:name:version:", v8, v10, v11, v15, v16, -[BMDSLBaseCodable version](v6, "version"));
      v17 = v6;
    }
    else
    {
      __biome_log_for_category();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
        -[BMDSLOrderedMerge initWithCoder:].cold.1((uint64_t)v12, v16, v18, v19, v20, v21, v22, v23);
      v17 = 0;
    }

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (BMDSL)a
{
  return self->_a;
}

- (BMDSL)b
{
  return self->_b;
}

- (NSString)key
{
  return self->_key;
}

- (NSString)selectorName
{
  return self->_selectorName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectorName, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_b, 0);
  objc_storeStrong((id *)&self->_a, 0);
}

- (id)bpsPublisher
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[5];

  -[BMDSLOrderedMerge a](self, "a");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bpsPublisher");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[BMDSLOrderedMerge b](self, "b");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bpsPublisher");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __44__BMDSLOrderedMerge_BPSPubSub__bpsPublisher__block_invoke;
  v9[3] = &unk_1E5E364F0;
  v9[4] = self;
  objc_msgSend(v4, "orderedMergeWithOther:comparator:", v6, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __44__BMDSLOrderedMerge_BPSPubSub__bpsPublisher__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  NSString *v8;
  SEL v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "selectorName");
  v8 = (NSString *)objc_claimAutoreleasedReturnValue();
  v9 = NSSelectorFromString(v8);

  objc_msgSend(*(id *)(a1 + 32), "key");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  BMDSLValueForKeyPath(v7, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "key");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  BMDSLValueForKeyPath(v6, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = ((uint64_t (*)(void *, SEL, void *))objc_msgSend(v11, "methodForSelector:", v9))(v11, v9, v13);
  return v14;
}

- (void)initWithA:(uint64_t)a3 b:(uint64_t)a4 key:(uint64_t)a5 selector:(uint64_t)a6 name:(uint64_t)a7 version:(uint64_t)a8 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_1AEB18000, a2, a3, "Init: Selector name not in allow list (%@)", a5, a6, a7, a8, 2u);
}

- (void)initWithA:(int)a1 b:(NSObject *)a2 key:selector:name:version:.cold.2(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_fault_impl(&dword_1AEB18000, a2, OS_LOG_TYPE_FAULT, "Unexpected version %u. Failed to initialize BMDSLOrderedMerge", (uint8_t *)v2, 8u);
}

- (void)initWithCoder:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_1AEB18000, a2, a3, "Decoded selector name not in allow list for ordered merge (%@)", a5, a6, a7, a8, 2u);
}

@end
