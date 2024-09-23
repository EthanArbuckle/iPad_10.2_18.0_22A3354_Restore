@implementation FMDAccessoryIdentifier

- (BOOL)isEqual:(id)a3
{
  FMDAccessoryIdentifier *v4;
  void *v5;
  void *v6;
  char v7;

  v4 = (FMDAccessoryIdentifier *)a3;
  if (v4 == self)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[FMDAccessoryIdentifier string](v4, "string");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[FMDAccessoryIdentifier string](self, "string");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "isEqualToString:", v6);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (BOOL)isValid
{
  void *v3;
  void *v4;
  BOOL v5;

  -[FMDAccessoryIdentifier string](self, "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[FMDAccessoryIdentifier string](self, "string");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "length") != 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[FMDAccessoryIdentifier string](self, "string");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FMDAccessoryIdentifier)initWithCoder:(id)a3
{
  id v4;
  FMDAccessoryIdentifier *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)FMDAccessoryIdentifier;
  v5 = -[FMDAccessoryIdentifier init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    NSStringFromSelector(sel_string);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMDAccessoryIdentifier setString:](v5, "setString:", v8);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[FMDAccessoryIdentifier string](self, "string");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_string);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  FMDAccessoryIdentifier *v4;
  void *v5;

  v4 = -[FMDAccessoryIdentifier init](+[FMDAccessoryIdentifier allocWithZone:](FMDAccessoryIdentifier, "allocWithZone:", a3), "init");
  -[FMDAccessoryIdentifier string](self, "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMDAccessoryIdentifier setString:](v4, "setString:", v5);

  return v4;
}

- (BOOL)encodeWithFMDCoder:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  -[FMDAccessoryIdentifier string](self, "string");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_string);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeString:forKey:", v6, v7);

  return 1;
}

- (FMDAccessoryIdentifier)initWithFMDCoder:(id)a3 error:(id *)a4
{
  id v5;
  FMDAccessoryIdentifier *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)FMDAccessoryIdentifier;
  v6 = -[FMDAccessoryIdentifier init](&v10, sel_init);
  if (v6)
  {
    NSStringFromSelector(sel_string);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "decodeStringForKey:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMDAccessoryIdentifier setString:](v6, "setString:", v8);

  }
  return v6;
}

- (NSString)string
{
  return self->_string;
}

- (void)setString:(id)a3
{
  objc_storeStrong((id *)&self->_string, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_string, 0);
}

- (FMDAccessoryIdentifier)initWithString:(id)a3
{
  __CFString *v4;
  FMDAccessoryIdentifier *v5;
  FMDAccessoryIdentifier *v6;
  const __CFString *v7;
  objc_super v9;

  v4 = (__CFString *)a3;
  v9.receiver = self;
  v9.super_class = (Class)FMDAccessoryIdentifier;
  v5 = -[FMDAccessoryIdentifier init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    if (v4)
      v7 = v4;
    else
      v7 = &stru_1E829E2C8;
    -[FMDAccessoryIdentifier setString:](v5, "setString:", v7);
  }

  return v6;
}

- (FMDAccessoryIdentifier)initWithAddress:(id)a3
{
  id v4;
  FMDAccessoryIdentifier *v5;
  FMDAccessoryIdentifier *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FMDAccessoryIdentifier;
  v5 = -[FMDAccessoryIdentifier init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    -[FMDAccessoryIdentifier computeAccessoryIdentifierWithAddress:](v5, "computeAccessoryIdentifierWithAddress:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMDAccessoryIdentifier setString:](v6, "setString:", v7);

  }
  return v6;
}

- (id)computeAccessoryIdentifierWithAddress:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("BT_%@"), a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataUsingEncoding:", 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fm_sha256Hash");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fm_hexString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lowercaseString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (FMDAccessoryIdentifier)initWithDeviceVendor:(id)a3 deviceProductId:(id)a4
{
  id v6;
  id v7;
  FMDAccessoryIdentifier *v8;
  void *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)FMDAccessoryIdentifier;
  v8 = -[FMDAccessoryIdentifier init](&v11, sel_init);
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%@"), v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMDAccessoryIdentifier setString:](v8, "setString:", v9);

  }
  return v8;
}

@end
