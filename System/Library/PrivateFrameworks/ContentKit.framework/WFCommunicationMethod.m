@implementation WFCommunicationMethod

- (WFCommunicationMethod)initWithSerializedRepresentation:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  WFCommunicationMethod *v13;

  v4 = a3;
  v5 = objc_opt_class();
  WFEnforceClass(v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("WFCommunicationMethodType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_class();
  WFEnforceClass(v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("WFCommunicationMethodBundleIdentifier"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_opt_class();
  WFEnforceClass(v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[WFCommunicationMethod initWithBundleIdentifier:type:](self, "initWithBundleIdentifier:type:", v12, v9);
  return v13;
}

- (WFCommunicationMethod)initWithBundleIdentifier:(id)a3 type:(id)a4
{
  id v6;
  id v7;
  WFCommunicationMethod *v8;
  uint64_t v9;
  NSString *bundleIdentifier;
  uint64_t v11;
  NSString *type;
  WFCommunicationMethod *v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)WFCommunicationMethod;
  v8 = -[WFCommunicationMethod init](&v15, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    bundleIdentifier = v8->_bundleIdentifier;
    v8->_bundleIdentifier = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    type = v8->_type;
    v8->_type = (NSString *)v11;

    v13 = v8;
  }

  return v8;
}

- (id)serializedRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x24BDAC8D0];
  v7[0] = CFSTR("WFCommunicationMethodType");
  -[WFCommunicationMethod type](self, "type");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = CFSTR("WFCommunicationMethodBundleIdentifier");
  v8[0] = v3;
  -[WFCommunicationMethod bundleIdentifier](self, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (int64_t)preferredCallProvider
{
  void *v3;
  char v4;
  void *v6;
  int v7;

  -[WFCommunicationMethod bundleIdentifier](self, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BEC16F8]);

  if ((v4 & 1) != 0)
    return 1;
  -[WFCommunicationMethod bundleIdentifier](self, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BEC16C0]);

  if (v7)
    return 2;
  else
    return 0;
}

- (int64_t)callCapability
{
  void *v3;
  char v4;
  void *v6;
  int v7;

  -[WFCommunicationMethod type](self, "type");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("AudioCall"));

  if ((v4 & 1) != 0)
    return 1;
  -[WFCommunicationMethod type](self, "type");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("VideoCall"));

  if (v7)
    return 2;
  else
    return 0;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[WFCommunicationMethod bundleIdentifier](self, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[WFCommunicationMethod type](self, "type");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  WFCommunicationMethod *v6;
  WFCommunicationMethod *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  int v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;

  v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;
  v7 = v6;
  if (v6 != self)
  {
    -[WFCommunicationMethod bundleIdentifier](v6, "bundleIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFCommunicationMethod bundleIdentifier](self, "bundleIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v8;
    v11 = v9;
    v12 = v11;
    if (v10 == v11)
    {

    }
    else
    {
      LOBYTE(v13) = 0;
      v14 = v11;
      v15 = v10;
      if (!v10 || !v11)
      {
LABEL_20:

LABEL_21:
        goto LABEL_22;
      }
      v13 = objc_msgSend(v10, "isEqual:", v11);

      if (!v13)
        goto LABEL_21;
    }
    -[WFCommunicationMethod type](v7, "type");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFCommunicationMethod type](self, "type");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v16;
    v18 = v17;
    v14 = v18;
    if (v15 == v18)
    {
      LOBYTE(v13) = 1;
    }
    else
    {
      LOBYTE(v13) = 0;
      if (v15 && v18)
        LOBYTE(v13) = objc_msgSend(v15, "isEqual:", v18);
    }

    goto LABEL_20;
  }
  LOBYTE(v13) = 1;
LABEL_22:

  return v13;
}

- (WFCommunicationMethod)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  WFCommunicationMethod *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("type"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[WFCommunicationMethod initWithBundleIdentifier:type:](self, "initWithBundleIdentifier:type:", v6, v5);
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[WFCommunicationMethod type](self, "type");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("type"));

  -[WFCommunicationMethod bundleIdentifier](self, "bundleIdentifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("bundleIdentifier"));

}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSString)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
