@implementation DNDModeAssertionSource

- (DNDModeAssertionSource)initWithClientIdentifier:(id)a3 deviceIdentifier:(id)a4
{
  id v6;
  id v7;
  DNDModeAssertionSource *v8;
  uint64_t v9;
  NSString *clientIdentifier;
  uint64_t v11;
  NSString *deviceIdentifier;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)DNDModeAssertionSource;
  v8 = -[DNDModeAssertionSource init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    clientIdentifier = v8->_clientIdentifier;
    v8->_clientIdentifier = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    deviceIdentifier = v8->_deviceIdentifier;
    v8->_deviceIdentifier = (NSString *)v11;

  }
  return v8;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[DNDModeAssertionSource clientIdentifier](self, "clientIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[DNDModeAssertionSource deviceIdentifier](self, "deviceIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  DNDModeAssertionSource *v4;
  DNDModeAssertionSource *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;

  v4 = (DNDModeAssertionSource *)a3;
  if (self == v4)
  {
    v13 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[DNDModeAssertionSource clientIdentifier](self, "clientIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[DNDModeAssertionSource clientIdentifier](v5, "clientIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6 != v7)
      {
        -[DNDModeAssertionSource clientIdentifier](self, "clientIdentifier");
        v8 = objc_claimAutoreleasedReturnValue();
        if (!v8)
        {
          v13 = 0;
LABEL_24:

          goto LABEL_25;
        }
        v9 = (void *)v8;
        -[DNDModeAssertionSource clientIdentifier](v5, "clientIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v10)
        {
          v13 = 0;
LABEL_23:

          goto LABEL_24;
        }
        -[DNDModeAssertionSource clientIdentifier](self, "clientIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[DNDModeAssertionSource clientIdentifier](v5, "clientIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v11, "isEqual:", v12))
        {
          v13 = 0;
LABEL_22:

          goto LABEL_23;
        }
        v23 = v12;
        v24 = v11;
        v25 = v10;
        v26 = v9;
      }
      -[DNDModeAssertionSource deviceIdentifier](self, "deviceIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[DNDModeAssertionSource deviceIdentifier](v5, "deviceIdentifier");
      v15 = objc_claimAutoreleasedReturnValue();
      if (v14 == (void *)v15)
      {

        v13 = 1;
      }
      else
      {
        v16 = (void *)v15;
        -[DNDModeAssertionSource deviceIdentifier](self, "deviceIdentifier");
        v17 = objc_claimAutoreleasedReturnValue();
        if (v17)
        {
          v18 = (void *)v17;
          -[DNDModeAssertionSource deviceIdentifier](v5, "deviceIdentifier");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (v19)
          {
            -[DNDModeAssertionSource deviceIdentifier](self, "deviceIdentifier");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            -[DNDModeAssertionSource deviceIdentifier](v5, "deviceIdentifier");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = objc_msgSend(v22, "isEqual:", v20);

          }
          else
          {
            v13 = 0;
          }

        }
        else
        {

          v13 = 0;
        }
      }
      v10 = v25;
      v9 = v26;
      v12 = v23;
      v11 = v24;
      if (v6 == v7)
        goto LABEL_24;
      goto LABEL_22;
    }
    v13 = 0;
  }
LABEL_25:

  return v13;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[DNDModeAssertionSource clientIdentifier](self, "clientIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDModeAssertionSource deviceIdentifier](self, "deviceIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; clientIdentifier: '%@'; deviceIdentifier: '%@'>"),
    v4,
    self,
    v5,
    v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DNDModeAssertionSource)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  DNDModeAssertionSource *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("clientIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deviceIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[DNDModeAssertionSource initWithClientIdentifier:deviceIdentifier:](self, "initWithClientIdentifier:deviceIdentifier:", v5, v6);
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[DNDModeAssertionSource clientIdentifier](self, "clientIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("clientIdentifier"));

  -[DNDModeAssertionSource deviceIdentifier](self, "deviceIdentifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("deviceIdentifier"));

}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (NSString)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
}

@end
