@implementation CDMWarmupRequestCommand

- (CDMWarmupRequestCommand)initWithDynamicConfig:(id)a3 selfMetadata:(id)a4
{
  id v7;
  id v8;
  CDMWarmupRequestCommand *v9;
  CDMWarmupRequestCommand *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CDMWarmupRequestCommand;
  v9 = -[CDMBaseCommand init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_dynamicConfig, a3);
    objc_storeStrong((id *)&v10->_selfMetadata, a4);
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selfMetadata, 0);
  objc_storeStrong((id *)&self->_dynamicConfig, 0);
}

- (CDMWarmupRequestCommand)initWithDynamicConfig:(id)a3
{
  return -[CDMWarmupRequestCommand initWithDynamicConfig:selfMetadata:](self, "initWithDynamicConfig:selfMetadata:", a3, 0);
}

- (CDMWarmupRequestCommand)initWithCoder:(id)a3
{
  id v4;
  CDMWarmupRequestCommand *v5;
  uint64_t v6;
  NLXSchemaNLXClientEventMetadata *selfMetadata;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CDMWarmupRequestCommand;
  v5 = -[CDMServiceGraphCommand initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CDMWarmupRequestCommandSelfMetadata"));
    v6 = objc_claimAutoreleasedReturnValue();
    selfMetadata = v5->_selfMetadata;
    v5->_selfMetadata = (NLXSchemaNLXClientEventMetadata *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CDMWarmupRequestCommand;
  v4 = a3;
  -[CDMServiceGraphCommand encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_selfMetadata, CFSTR("CDMWarmupRequestCommandSelfMetadata"), v5.receiver, v5.super_class);

}

- (CDMDynamicConfig)dynamicConfig
{
  return self->_dynamicConfig;
}

- (NLXSchemaNLXClientEventMetadata)selfMetadata
{
  return self->_selfMetadata;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
