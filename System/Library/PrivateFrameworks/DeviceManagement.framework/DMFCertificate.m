@implementation DMFCertificate

- (DMFCertificate)initWithCommonName:(id)a3 data:(id)a4 isIdentity:(BOOL)a5
{
  id v8;
  id v9;
  DMFCertificate *v10;
  uint64_t v11;
  NSString *commonName;
  uint64_t v13;
  NSData *data;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)DMFCertificate;
  v10 = -[DMFCertificate init](&v16, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    commonName = v10->_commonName;
    v10->_commonName = (NSString *)v11;

    v13 = objc_msgSend(v9, "copy");
    data = v10->_data;
    v10->_data = (NSData *)v13;

    v10->_isIdentity = a5;
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = objc_alloc((Class)objc_opt_class());
  -[DMFCertificate commonName](self, "commonName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMFCertificate data](self, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithCommonName:data:isIdentity:", v5, v6, -[DMFCertificate isIdentity](self, "isIdentity"));

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMFCertificate)initWithCoder:(id)a3
{
  id v4;
  DMFCertificate *v5;
  void *v6;
  uint64_t v7;
  NSString *commonName;
  void *v9;
  uint64_t v10;
  NSData *data;
  void *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)DMFCertificate;
  v5 = -[DMFCertificate init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("commonName"));
    v7 = objc_claimAutoreleasedReturnValue();
    commonName = v5->_commonName;
    v5->_commonName = (NSString *)v7;

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("data"));
    v10 = objc_claimAutoreleasedReturnValue();
    data = v5->_data;
    v5->_data = (NSData *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("isIdentity"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_isIdentity = objc_msgSend(v12, "BOOLValue");

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[DMFCertificate commonName](self, "commonName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("commonName"));

  -[DMFCertificate data](self, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("data"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[DMFCertificate isIdentity](self, "isIdentity"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("isIdentity"));

}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;

  -[DMFCertificate commonName](self, "commonName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[DMFCertificate data](self, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  v7 = v6 ^ -[DMFCertificate isIdentity](self, "isIdentity");

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  DMFCertificate *v4;
  DMFCertificate *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  int v10;
  void *v11;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  int v15;
  _BOOL4 v16;
  _BOOL4 v17;

  v4 = (DMFCertificate *)a3;
  if (self == v4)
  {
    LOBYTE(v17) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[DMFCertificate commonName](self, "commonName");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMFCertificate commonName](v5, "commonName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v6;
      v9 = v7;
      if (v8 | v9 && (v10 = objc_msgSend((id)v8, "isEqual:", v9), (id)v9, (id)v8, !v10))
      {
        LOBYTE(v17) = 0;
      }
      else
      {
        -[DMFCertificate data](self, "data");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[DMFCertificate data](v5, "data");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v11;
        v14 = v12;
        if (v13 | v14
          && (v15 = objc_msgSend((id)v13, "isEqual:", v14), (id)v14, (id)v13, !v15))
        {
          LOBYTE(v17) = 0;
        }
        else
        {
          v16 = -[DMFCertificate isIdentity](self, "isIdentity");
          v17 = v16 ^ -[DMFCertificate isIdentity](v5, "isIdentity") ^ 1;
        }

      }
    }
    else
    {
      LOBYTE(v17) = 0;
    }
  }

  return v17;
}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _BOOL4 v10;
  const __CFString *v11;
  void *v12;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@:%p {\n"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMFCertificate commonName](self, "commonName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (v5)
  {
    -[DMFCertificate commonName](self, "commonName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("\tCommon Name     : “%@”\n"), v6);

  }
  -[DMFCertificate data](self, "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");

  if (v8)
  {
    -[DMFCertificate data](self, "data");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("\tData            : %@\n"), v9);

  }
  v10 = -[DMFCertificate isIdentity](self, "isIdentity");
  v11 = CFSTR("NO");
  if (v10)
    v11 = CFSTR("YES");
  objc_msgSend(v3, "appendFormat:", CFSTR("\tIs Identity     : %@\n"), v11);
  objc_msgSend(v3, "appendString:", CFSTR("}>"));
  v12 = (void *)objc_msgSend(v3, "copy");

  return v12;
}

- (NSString)commonName
{
  return self->_commonName;
}

- (NSData)data
{
  return self->_data;
}

- (BOOL)isIdentity
{
  return self->_isIdentity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_commonName, 0);
}

@end
