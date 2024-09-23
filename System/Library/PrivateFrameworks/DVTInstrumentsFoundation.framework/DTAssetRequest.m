@implementation DTAssetRequest

- (DTAssetRequest)initWithIdentifier:(id)a3 path:(id)a4
{
  id v7;
  id v8;
  void *v9;
  DTAssetRequest *v10;
  uint64_t v11;
  NSString *identifier;
  uint64_t v13;
  NSString *assetPath;
  void *v16;
  void *v17;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DTAssetRequest.m"), 14, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DTAssetRequest.m"), 15, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("path"));

LABEL_3:
  v18.receiver = self;
  v18.super_class = (Class)DTAssetRequest;
  v10 = -[DTAssetRequest init](&v18, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v7, "copy");
    identifier = v10->_identifier;
    v10->_identifier = (NSString *)v11;

    v13 = objc_msgSend(v9, "copy");
    assetPath = v10->_assetPath;
    v10->_assetPath = (NSString *)v13;

  }
  return v10;
}

+ (id)requestWithIdentifier:(id)a3 path:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithIdentifier:path:", v7, v6);

  return v8;
}

- (DTXMessage)message
{
  return (DTXMessage *)objc_msgSend(MEMORY[0x24BE2A960], "messageWithObject:", self);
}

- (DTAssetRequest)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  DTAssetRequest *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("assetPath"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[DTAssetRequest initWithIdentifier:path:](self, "initWithIdentifier:path:", v5, v6);
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[DTAssetRequest identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("identifier"));

  -[DTAssetRequest assetPath](self, "assetPath");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("assetPath"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)assetPath
{
  return self->_assetPath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetPath, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
