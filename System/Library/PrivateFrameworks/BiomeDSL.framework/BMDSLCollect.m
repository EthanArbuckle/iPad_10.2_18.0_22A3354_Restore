@implementation BMDSLCollect

- (BMDSLCollect)initWithUpstream:(id)a3 name:(id)a4 version:(unsigned int)a5
{
  id v9;
  BMDSLCollect *v10;
  BMDSLCollect *v11;
  BMDSLCollect *v12;
  NSObject *v13;
  objc_super v15;

  v9 = a3;
  if (a5 == 1)
  {
    v15.receiver = self;
    v15.super_class = (Class)BMDSLCollect;
    v10 = -[BMDSLBaseCodable initWithName:version:](&v15, sel_initWithName_version_, a4, 1);
    v11 = v10;
    if (v10)
      objc_storeStrong((id *)&v10->_upstream, a3);
    self = v11;
    v12 = self;
  }
  else
  {
    __biome_log_for_category();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[BMDSLCollect initWithUpstream:name:version:].cold.1(a5, v13);

    v12 = 0;
  }

  return v12;
}

- (BMDSLCollect)initWithUpstream:(id)a3
{
  return -[BMDSLCollect initWithUpstream:name:version:](self, "initWithUpstream:name:version:", a3, CFSTR("collect"), 1);
}

- (id)upstreams
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  -[BMDSLCollect upstream](self, "upstream");
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
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BMDSLCollect;
  v4 = a3;
  -[BMDSLBaseCodable encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[BMDSLCollect upstream](self, "upstream", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("upstream"));

}

- (BMDSLCollect)initWithCoder:(id)a3
{
  id v4;
  BMDSLCollect *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BMDSLCollect;
  v5 = -[BMDSLBaseCodable initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    +[BMDSLClasses allowed](BMDSLClasses, "allowed");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("upstream"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[BMDSLBaseCodable name](v5, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[BMDSLCollect initWithUpstream:name:version:](v5, "initWithUpstream:name:version:", v7, v8, -[BMDSLBaseCodable version](v5, "version"));

  }
  return v5;
}

- (BMDSL)upstream
{
  return self->_upstream;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_upstream, 0);
}

- (id)bpsPublisher
{
  void *v2;
  void *v3;
  void *v4;

  -[BMDSLCollect upstream](self, "upstream");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bpsPublisher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "collect");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)initWithUpstream:(int)a1 name:(NSObject *)a2 version:.cold.1(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1AEB18000, a2, OS_LOG_TYPE_ERROR, "Unexpected version %u. Failed to initialize BMDSLCollect", (uint8_t *)v2, 8u);
}

@end
