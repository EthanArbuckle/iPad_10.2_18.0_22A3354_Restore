@implementation BMDSLState

- (id)upstreamCombinedState
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BMDSLState;
  -[BMDSL combinedState](&v3, sel_combinedState);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)bpsPublisher
{
  void *v3;
  void *v4;
  _BMDSLStatePublisher *v5;
  void *v6;
  _BMDSLStatePublisher *v7;

  -[BMDSLState upstream](self, "upstream");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bpsPublisher");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = [_BMDSLStatePublisher alloc];
  -[BMDSLState value](self, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[_BMDSLStatePublisher initWithUpstream:state:DSLState:](v5, "initWithUpstream:state:DSLState:", v4, v6, self);

  return v7;
}

+ (id)name
{
  return CFSTR("state");
}

- (BMDSLState)initWithName:(id)a3 version:(unsigned int)a4 upstream:(id)a5 key:(id)a6 value:(id)a7
{
  id v13;
  id v14;
  id v15;
  BMDSLState *v16;
  BMDSLState *v17;
  uint64_t v18;
  NSString *key;
  BMDSLState *v20;
  NSObject *v21;
  objc_super v23;

  v13 = a5;
  v14 = a6;
  v15 = a7;
  if (a4 == 1)
  {
    v23.receiver = self;
    v23.super_class = (Class)BMDSLState;
    v16 = -[BMDSLBaseCodable initWithName:version:](&v23, sel_initWithName_version_, a3, 1);
    v17 = v16;
    if (v16)
    {
      objc_storeStrong((id *)&v16->_upstream, a5);
      v18 = objc_msgSend(v14, "copy");
      key = v17->_key;
      v17->_key = (NSString *)v18;

      objc_storeStrong((id *)&v17->_value, a7);
    }
    self = v17;
    v20 = self;
  }
  else
  {
    __biome_log_for_category();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[BMDSLState initWithName:version:upstream:key:value:].cold.1(a4, v21);

    v20 = 0;
  }

  return v20;
}

- (BMDSLState)initWithUpstream:(id)a3 key:(id)a4 value:(id)a5
{
  return -[BMDSLState initWithName:version:upstream:key:value:](self, "initWithName:version:upstream:key:value:", CFSTR("state"), 1, a3, a4, a5);
}

- (id)upstreams
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  -[BMDSLState upstream](self, "upstream");
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
  v9.super_class = (Class)BMDSLState;
  -[BMDSLBaseCodable encodeWithCoder:](&v9, sel_encodeWithCoder_, v4);
  -[BMDSLState key](self, "key");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("key"));

  -[BMDSLState value](self, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[BMDSLState value](self, "value");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("value"));

  }
  -[BMDSLState upstream](self, "upstream");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("upstream"));

}

- (BMDSLState)initWithCoder:(id)a3
{
  id v4;
  BMDSLState *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)BMDSLState;
  v5 = -[BMDSLBaseCodable initWithCoder:](&v13, sel_initWithCoder_, v4);
  if (v5)
  {
    +[BMDSLClasses allowed](BMDSLClasses, "allowed");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("upstream"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("key"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[BMDSLClasses allowed](BMDSLClasses, "allowed");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("value"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[BMDSLBaseCodable name](v5, "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[BMDSLState initWithName:version:upstream:key:value:](v5, "initWithName:version:upstream:key:value:", v11, -[BMDSLBaseCodable version](v5, "version"), v7, v8, v10);

  }
  return v5;
}

- (BMDSL)upstream
{
  return self->_upstream;
}

- (NSString)key
{
  return self->_key;
}

- (BMDSLStateValue)value
{
  return self->_value;
}

- (BMDSLStateValue)combinedValue
{
  return self->_combinedValue;
}

- (void)setCombinedValue:(id)a3
{
  objc_storeStrong((id *)&self->_combinedValue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_combinedValue, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_upstream, 0);
}

- (void)initWithName:(int)a1 version:(NSObject *)a2 upstream:key:value:.cold.1(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1AEB18000, a2, OS_LOG_TYPE_ERROR, "Unexpected version %u. Failed to initialize BMDSLState", (uint8_t *)v2, 8u);
}

@end
