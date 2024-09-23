@implementation DDSAssertDescriptor

- (DDSAssertDescriptor)initWithPolicy:(id)a3 assertionID:(id)a4 clientID:(id)a5
{
  id v9;
  id v10;
  id v11;
  DDSAssertDescriptor *v12;
  DDSAssertDescriptor *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)DDSAssertDescriptor;
  v12 = -[DDSAssertDescriptor init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_policy, a3);
    objc_storeStrong((id *)&v13->_assertionIdentifier, a4);
    objc_storeStrong((id *)&v13->_clientIdentifier, a5);
  }

  return v13;
}

- (DDSAssertDescriptor)init
{

  return 0;
}

- (DDSAssertDescriptor)initWithCoder:(id)a3
{
  id v4;
  DDSAssertDescriptor *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  DDSAssetPolicy *policy;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSString *assertionIdentifier;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSString *clientIdentifier;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)DDSAssertDescriptor;
  v5 = -[DDSAssertDescriptor init](&v19, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    NSStringFromSelector(sel_policy);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    policy = v5->_policy;
    v5->_policy = (DDSAssetPolicy *)v8;

    v10 = objc_opt_class();
    NSStringFromSelector(sel_assertionIdentifier);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v10, v11);
    v12 = objc_claimAutoreleasedReturnValue();
    assertionIdentifier = v5->_assertionIdentifier;
    v5->_assertionIdentifier = (NSString *)v12;

    v14 = objc_opt_class();
    NSStringFromSelector(sel_clientIdentifier);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v14, v15);
    v16 = objc_claimAutoreleasedReturnValue();
    clientIdentifier = v5->_clientIdentifier;
    v5->_clientIdentifier = (NSString *)v16;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  -[DDSAssertDescriptor assertionIdentifier](self, "assertionIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_assertionIdentifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, v6);

  -[DDSAssertDescriptor clientIdentifier](self, "clientIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_clientIdentifier);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, v8);

  -[DDSAssertDescriptor policy](self, "policy");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_policy);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, v9);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && -[DDSAssertDescriptor isEqualToDescriptor:](self, "isEqualToDescriptor:", v4);

  return v5;
}

- (BOOL)isEqualToDescriptor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v4 = a3;
  -[DDSAssertDescriptor policy](self, "policy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "policy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (DDSObjectsAreEqualOrNil((unint64_t)v5, (uint64_t)v6))
  {
    -[DDSAssertDescriptor assertionIdentifier](self, "assertionIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "assertionIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqualToString:", v8))
    {
      -[DDSAssertDescriptor clientIdentifier](self, "clientIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "clientIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  -[DDSAssertDescriptor policy](self, "policy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[DDSAssertDescriptor assertionIdentifier](self, "assertionIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[DDSAssertDescriptor clientIdentifier](self, "clientIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");

  return v8;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DDSAssertDescriptor assertionIdentifier](self, "assertionIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DDSAssertDescriptor clientIdentifier](self, "clientIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p: aID: %@ cID: %@>"), v5, self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)dumpDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;

  if (DDS_IS_INTERNAL_INSTALL())
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    -[DDSAssertDescriptor assertionIdentifier](self, "assertionIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[DDSAssertDescriptor clientIdentifier](self, "clientIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[DDSAssertDescriptor policy](self, "policy");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dumpDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("%@, %@ (%@)"), v4, v5, v7);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = &stru_1EA1420B0;
  }
  return v8;
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (void)setClientIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_clientIdentifier, a3);
}

- (NSString)assertionIdentifier
{
  return self->_assertionIdentifier;
}

- (void)setAssertionIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_assertionIdentifier, a3);
}

- (DDSAssetPolicy)policy
{
  return self->_policy;
}

- (void)setPolicy:(id)a3
{
  objc_storeStrong((id *)&self->_policy, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_policy, 0);
  objc_storeStrong((id *)&self->_assertionIdentifier, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
}

@end
