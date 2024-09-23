@implementation LNConnectionAction

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (LNConnectionAction)initWithBSXPCCoder:(id)a3
{
  id v4;
  void *v5;
  LNConnectionAction *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    self = -[LNConnectionAction initWithIdentifier:metadataVersion:](self, "initWithIdentifier:metadataVersion:", v5, objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("metadataVersion")));
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (LNConnectionAction)initWithIdentifier:(id)a3 metadataVersion:(int64_t)a4
{
  id v8;
  LNConnectionAction *v9;
  LNConnectionAction *v10;
  LNConnectionAction *v11;
  void *v13;
  objc_super v14;

  v8 = a3;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNConnectionAction.m"), 92, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

  }
  v14.receiver = self;
  v14.super_class = (Class)LNConnectionAction;
  v9 = -[LNConnectionAction init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identifier, a3);
    v10->_metadataVersion = a4;
    v11 = v10;
  }

  return v10;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNConnectionAction identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, identifier: %@>"), v5, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[LNConnectionAction identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("identifier"));

  objc_msgSend(v5, "encodeInt64:forKey:", -[LNConnectionAction metadataVersion](self, "metadataVersion"), CFSTR("metadataVersion"));
}

- (int64_t)metadataVersion
{
  return self->_metadataVersion;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[LNConnectionAction identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("identifier"));

  objc_msgSend(v5, "encodeInteger:forKey:", -[LNConnectionAction metadataVersion](self, "metadataVersion"), CFSTR("metadataVersion"));
}

- (LNConnectionAction)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  LNConnectionAction *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    self = -[LNConnectionAction initWithIdentifier:metadataVersion:](self, "initWithIdentifier:metadataVersion:", v5, objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("metadataVersion")));
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
