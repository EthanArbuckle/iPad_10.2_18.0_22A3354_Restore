@implementation DNDApplicationIdentifier

- (DNDApplicationIdentifier)initWithBundleID:(id)a3
{
  id v4;
  DNDApplicationIdentifier *v5;

  v4 = a3;
  v5 = -[DNDApplicationIdentifier initWithBundleID:platform:](self, "initWithBundleID:platform:", v4, DNDPlatformForCurrentDevice());

  return v5;
}

- (DNDApplicationIdentifier)initWithBundleID:(id)a3 platform:(unint64_t)a4
{
  id v6;
  DNDApplicationIdentifier *v7;
  uint64_t v8;
  NSString *bundleID;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DNDApplicationIdentifier;
  v7 = -[DNDApplicationIdentifier init](&v11, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    bundleID = v7->_bundleID;
    v7->_bundleID = (NSString *)v8;

    v7->_platform = a4;
  }

  return v7;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;

  -[DNDApplicationIdentifier bundleID](self, "bundleID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = -[DNDApplicationIdentifier platform](self, "platform") ^ v4;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  DNDApplicationIdentifier *v8;
  DNDApplicationIdentifier *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  unint64_t v15;

  v8 = (DNDApplicationIdentifier *)a3;
  if (self == v8)
  {
    v14 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = v8;
      -[DNDApplicationIdentifier bundleID](self, "bundleID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[DNDApplicationIdentifier bundleID](v9, "bundleID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10 != v11)
      {
        -[DNDApplicationIdentifier bundleID](self, "bundleID");
        v12 = objc_claimAutoreleasedReturnValue();
        if (!v12)
        {
          v14 = 0;
          goto LABEL_15;
        }
        v3 = (void *)v12;
        -[DNDApplicationIdentifier bundleID](v9, "bundleID");
        v13 = objc_claimAutoreleasedReturnValue();
        if (!v13)
        {
          v14 = 0;
          goto LABEL_14;
        }
        v4 = (void *)v13;
        -[DNDApplicationIdentifier bundleID](self, "bundleID");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        -[DNDApplicationIdentifier bundleID](v9, "bundleID");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v5, "isEqual:", v6))
        {
          v14 = 0;
LABEL_11:

LABEL_14:
          goto LABEL_15;
        }
      }
      v15 = -[DNDApplicationIdentifier platform](self, "platform");
      v14 = v15 == -[DNDApplicationIdentifier platform](v9, "platform");
      if (v10 != v11)
        goto LABEL_11;
LABEL_15:

      goto LABEL_16;
    }
    v14 = 0;
  }
LABEL_16:

  return v14;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[DNDApplicationIdentifier bundleID](self, "bundleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromDNDPlatform(self->_platform);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; bundleID: %@; platform: %@>"), v4, self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (id)diffDescription
{
  void *v2;
  NSString *bundleID;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB3940];
  bundleID = self->_bundleID;
  NSStringFromDNDPlatform(self->_platform);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("bundleID:%@;platform:%@"), bundleID, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DNDApplicationIdentifier)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  DNDApplicationIdentifier *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("platform"));

  v7 = -[DNDApplicationIdentifier initWithBundleID:platform:](self, "initWithBundleID:platform:", v5, v6);
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *bundleID;
  id v5;

  bundleID = self->_bundleID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", bundleID, CFSTR("bundleID"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_platform, CFSTR("platform"));

}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (unint64_t)platform
{
  return self->_platform;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end
