@implementation DNDWebApplicationIdentifier

- (DNDWebApplicationIdentifier)initWithWebIdentifier:(id)a3 givenName:(id)a4
{
  id v6;
  id v7;
  DNDWebApplicationIdentifier *v8;
  uint64_t v9;
  NSString *webIdentifier;
  uint64_t v11;
  NSString *givenName;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)DNDWebApplicationIdentifier;
  v8 = -[DNDWebApplicationIdentifier init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    webIdentifier = v8->_webIdentifier;
    v8->_webIdentifier = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    givenName = v8->_givenName;
    v8->_givenName = (NSString *)v11;

  }
  return v8;
}

- (unint64_t)platform
{
  return 1;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[DNDWebApplicationIdentifier webIdentifier](self, "webIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[DNDWebApplicationIdentifier givenName](self, "givenName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  DNDWebApplicationIdentifier *v4;
  DNDWebApplicationIdentifier *v5;
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

  v4 = (DNDWebApplicationIdentifier *)a3;
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
      -[DNDWebApplicationIdentifier webIdentifier](self, "webIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[DNDWebApplicationIdentifier webIdentifier](v5, "webIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6 != v7)
      {
        -[DNDWebApplicationIdentifier webIdentifier](self, "webIdentifier");
        v8 = objc_claimAutoreleasedReturnValue();
        if (!v8)
        {
          v13 = 0;
LABEL_24:

          goto LABEL_25;
        }
        v9 = (void *)v8;
        -[DNDWebApplicationIdentifier webIdentifier](v5, "webIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v10)
        {
          v13 = 0;
LABEL_23:

          goto LABEL_24;
        }
        -[DNDWebApplicationIdentifier webIdentifier](self, "webIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[DNDWebApplicationIdentifier webIdentifier](v5, "webIdentifier");
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
      -[DNDWebApplicationIdentifier givenName](self, "givenName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[DNDWebApplicationIdentifier givenName](v5, "givenName");
      v15 = objc_claimAutoreleasedReturnValue();
      if (v14 == (void *)v15)
      {

        v13 = 1;
      }
      else
      {
        v16 = (void *)v15;
        -[DNDWebApplicationIdentifier givenName](self, "givenName");
        v17 = objc_claimAutoreleasedReturnValue();
        if (v17)
        {
          v18 = (void *)v17;
          -[DNDWebApplicationIdentifier givenName](v5, "givenName");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (v19)
          {
            -[DNDWebApplicationIdentifier givenName](self, "givenName");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            -[DNDWebApplicationIdentifier givenName](v5, "givenName");
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

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p; webIdentifier: %@; givenName: %@>"),
                       objc_opt_class(),
                       self,
                       self->_webIdentifier,
                       self->_givenName);
}

- (void)diffAgainstObject:(id)a3 usingDiffBuilder:(id)a4 withDescription:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v13;
    -[DNDWebApplicationIdentifier webIdentifier](self, "webIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "webIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "diffObject:againstObject:withDescription:", v9, v10, CFSTR("webIdentifier"));

    -[DNDWebApplicationIdentifier givenName](self, "givenName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "givenName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "diffObject:againstObject:withDescription:", v11, v12, CFSTR("givenName"));
  }

}

- (id)diffDescription
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("webIdentifier:%@;givenName:%@"),
               self->_webIdentifier,
               self->_givenName);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DNDWebApplicationIdentifier)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  DNDWebApplicationIdentifier *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("webIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("givenName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[DNDWebApplicationIdentifier initWithWebIdentifier:givenName:](self, "initWithWebIdentifier:givenName:", v5, v6);
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *webIdentifier;
  id v5;

  webIdentifier = self->_webIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", webIdentifier, CFSTR("webIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_givenName, CFSTR("givenName"));

}

- (NSString)webIdentifier
{
  return self->_webIdentifier;
}

- (NSString)givenName
{
  return self->_givenName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_givenName, 0);
  objc_storeStrong((id *)&self->_webIdentifier, 0);
}

@end
