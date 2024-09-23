@implementation BMDSLMap

- (id)bpsPublisher
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[5];

  -[BMDSLMap upstream](self, "upstream");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bpsPublisher");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __35__BMDSLMap_BPSPubSub__bpsPublisher__block_invoke;
  v7[3] = &unk_1E5E363D0;
  v7[4] = self;
  objc_msgSend(v4, "mapWithTransform:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __35__BMDSLMap_BPSPubSub__bpsPublisher__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = *(id *)(a1 + 32);
  v8.super_class = (Class)BMDSLMap;
  v3 = a2;
  objc_msgSendSuper2(&v8, sel_combinedState);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "transform", v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "transformInput:combinedState:", v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)name
{
  return CFSTR("map");
}

- (BMDSLMap)initWithUpstream:(id)a3 transform:(id)a4 name:(id)a5 version:(unsigned int)a6
{
  id v11;
  id v12;
  BMDSLMap *v13;
  id *p_isa;
  BMDSLMap *v15;
  NSObject *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  if (a6 == 1)
  {
    v18.receiver = self;
    v18.super_class = (Class)BMDSLMap;
    v13 = -[BMDSLBaseCodable initWithName:version:](&v18, sel_initWithName_version_, a5, 1);
    p_isa = (id *)&v13->super.super.super.isa;
    if (v13)
    {
      objc_storeStrong((id *)&v13->_upstream, a3);
      objc_storeStrong(p_isa + 3, a4);
    }
    self = p_isa;
    v15 = self;
  }
  else
  {
    __biome_log_for_category();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[BMDSLMap initWithUpstream:transform:name:version:].cold.1(a6, v16);

    v15 = 0;
  }

  return v15;
}

- (BMDSLMap)initWithUpstream:(id)a3 transform:(id)a4
{
  return -[BMDSLMap initWithUpstream:transform:name:version:](self, "initWithUpstream:transform:name:version:", a3, a4, CFSTR("map"), 1);
}

- (id)upstreams
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  -[BMDSLMap upstream](self, "upstream");
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
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BMDSLMap;
  v4 = a3;
  -[BMDSLBaseCodable encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  -[BMDSLMap upstream](self, "upstream", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("upstream"));

  -[BMDSLMap transform](self, "transform");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("transform"));

}

- (BMDSLMap)initWithCoder:(id)a3
{
  id v4;
  BMDSLMap *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)BMDSLMap;
  v5 = -[BMDSLBaseCodable initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (v5)
  {
    +[BMDSLClasses allowed](BMDSLClasses, "allowed");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("upstream"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    +[BMDSLClasses allowed](BMDSLClasses, "allowed");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("transform"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[BMDSLBaseCodable name](v5, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[BMDSLMap initWithUpstream:transform:name:version:](v5, "initWithUpstream:transform:name:version:", v7, v9, v10, -[BMDSLBaseCodable version](v5, "version"));

  }
  return v5;
}

- (BMDSLTransform)transform
{
  return self->_transform;
}

- (BMDSL)upstream
{
  return self->_upstream;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_upstream, 0);
  objc_storeStrong((id *)&self->_transform, 0);
}

- (void)initWithUpstream:(int)a1 transform:(NSObject *)a2 name:version:.cold.1(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1AEB18000, a2, OS_LOG_TYPE_ERROR, "Unexpected version %u. Failed to initialize BMDSLMap", (uint8_t *)v2, 8u);
}

@end
