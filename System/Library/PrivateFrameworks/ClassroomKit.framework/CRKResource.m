@implementation CRKResource

- (CRKResource)initWithDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  CRKResource *v7;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HostedURL"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("IsZippedBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)))
  {
    self = -[CRKResource initWithHostedURL:isZippedBundle:](self, "initWithHostedURL:isZippedBundle:", v5, objc_msgSend(v6, "BOOLValue"));
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (CRKResource)initWithHostedURL:(id)a3 isZippedBundle:(BOOL)a4
{
  id v8;
  CRKResource *v9;
  CRKResource *v10;
  void *v12;
  objc_super v13;

  v8 = a3;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKResource.m"), 42, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("hostedURL"));

  }
  v13.receiver = self;
  v13.super_class = (Class)CRKResource;
  v9 = -[CRKResource init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_hostedURL, a3);
    v10->_zippedBundle = a4;
  }

  return v10;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[CRKResource hostedURL](self, "hostedURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[CRKResource isZippedBundle](self, "isZippedBundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && -[CRKResource isEqualToHostedResource:](self, "isEqualToHostedResource:", v4);

  return v5;
}

- (BOOL)isEqualToHostedResource:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  int v8;

  v4 = a3;
  -[CRKResource hostedURL](self, "hostedURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hostedURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqual:", v6))
  {
    v7 = -[CRKResource isZippedBundle](self, "isZippedBundle");
    v8 = v7 ^ objc_msgSend(v4, "isZippedBundle") ^ 1;
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  const __CFString *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[CRKResource hostedURL](self, "hostedURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "absoluteString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[CRKResource isZippedBundle](self, "isZippedBundle");
  v8 = CFSTR("NO");
  if (v7)
    v8 = CFSTR("YES");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p { hostedURL = %@, isZippedBundle = %@ }>"), v4, self, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSDictionary)dictionaryValue
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x24BDAC8D0];
  v7[0] = CFSTR("HostedURL");
  -[CRKResource hostedURL](self, "hostedURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = CFSTR("IsZippedBundle");
  v8[0] = v3;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[CRKResource isZippedBundle](self, "isZippedBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRKResource)initWithCoder:(id)a3
{
  id v4;
  CRKResource *v5;
  void *v6;
  uint64_t v7;
  NSURL *hostedURL;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CRKResource;
  v5 = -[CRKResource init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("hostedURL"));
    v7 = objc_claimAutoreleasedReturnValue();
    hostedURL = v5->_hostedURL;
    v5->_hostedURL = (NSURL *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("zippedBundle"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_zippedBundle = objc_msgSend(v9, "BOOLValue");

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[CRKResource hostedURL](self, "hostedURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("hostedURL"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[CRKResource isZippedBundle](self, "isZippedBundle"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("zippedBundle"));

}

- (NSURL)hostedURL
{
  return self->_hostedURL;
}

- (void)setHostedURL:(id)a3
{
  objc_storeStrong((id *)&self->_hostedURL, a3);
}

- (BOOL)isZippedBundle
{
  return self->_zippedBundle;
}

- (void)setZippedBundle:(BOOL)a3
{
  self->_zippedBundle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostedURL, 0);
}

@end
