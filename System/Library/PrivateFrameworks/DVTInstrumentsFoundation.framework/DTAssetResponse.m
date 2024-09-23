@implementation DTAssetResponse

+ (id)responseWithIdentifier:(id)a3 data:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithIdentifier:data:completed:", v7, v6, 0);

  return v8;
}

+ (id)completedResponseWithIdentifier:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithIdentifier:data:completed:", v4, 0, 1);

  return v5;
}

- (DTAssetResponse)initWithIdentifier:(id)a3 data:(id)a4 completed:(BOOL)a5
{
  id v8;
  id v9;
  DTAssetResponse *v10;
  uint64_t v11;
  NSString *identifier;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)DTAssetResponse;
  v10 = -[DTAssetResponse init](&v14, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    identifier = v10->_identifier;
    v10->_identifier = (NSString *)v11;

    objc_storeStrong((id *)&v10->_data, a4);
    v10->_completed = a5;
  }

  return v10;
}

- (DTAssetResponse)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  DTAssetResponse *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("data"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("completed"));

  v8 = -[DTAssetResponse initWithIdentifier:data:completed:](self, "initWithIdentifier:data:completed:", v5, v6, v7);
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[DTAssetResponse identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("identifier"));

  -[DTAssetResponse data](self, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("data"));

  objc_msgSend(v6, "encodeBool:forKey:", -[DTAssetResponse isCompleted](self, "isCompleted"), CFSTR("completed"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DTXMessage)message
{
  return (DTXMessage *)objc_msgSend(MEMORY[0x24BE2A960], "messageWithObject:", self);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _BOOL4 v7;
  const char *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[DTAssetResponse identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DTAssetResponse data](self, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");
  v7 = -[DTAssetResponse isCompleted](self, "isCompleted");
  v8 = "NO";
  if (v7)
    v8 = "YES";
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<DTAssetResponse:%@ dataLength=%lu completed:%s>"), v4, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSData)data
{
  return self->_data;
}

- (BOOL)isCompleted
{
  return self->_completed;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
