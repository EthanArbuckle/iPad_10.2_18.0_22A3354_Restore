@implementation CRKApplicationDescriptor

- (CRKApplicationDescriptor)init
{
  return -[CRKApplicationDescriptor initWithBundleIdentifier:includeIcon:includeBadgeIcon:](self, "initWithBundleIdentifier:includeIcon:includeBadgeIcon:", CFSTR("com.apple.invalid"), 0, 0);
}

- (CRKApplicationDescriptor)initWithBundleIdentifier:(id)a3 includeIcon:(BOOL)a4 includeBadgeIcon:(BOOL)a5
{
  id v9;
  CRKApplicationDescriptor *v10;
  CRKApplicationDescriptor *v11;
  objc_super v13;

  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CRKApplicationDescriptor;
  v10 = -[CRKApplicationDescriptor init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_bundleIdentifier, a3);
    v11->_includeIcon = a4;
    v11->_includeBadgeIcon = a5;
  }

  return v11;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;

  -[CRKApplicationDescriptor bundleIdentifier](self, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = v4 ^ -[CRKApplicationDescriptor includeIcon](self, "includeIcon");
  v6 = v5 ^ -[CRKApplicationDescriptor includeBadgeIcon](self, "includeBadgeIcon");

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    v5 = -[CRKApplicationDescriptor isEqualToApplicationDescriptor:](self, "isEqualToApplicationDescriptor:", v4);
  else
    v5 = 0;

  return v5;
}

- (BOOL)isEqualToApplicationDescriptor:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  int v8;
  _BOOL4 v9;

  v4 = a3;
  if (v4)
  {
    -[CRKApplicationDescriptor bundleIdentifier](self, "bundleIdentifier");
    v5 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bundleIdentifier");
    v6 = objc_claimAutoreleasedReturnValue();
    if ((!(v5 | v6) || objc_msgSend((id)v5, "isEqual:", v6))
      && (v7 = -[CRKApplicationDescriptor includeIcon](self, "includeIcon"),
          v7 == objc_msgSend(v4, "includeIcon")))
    {
      v9 = -[CRKApplicationDescriptor includeBadgeIcon](self, "includeBadgeIcon");
      v8 = v9 ^ objc_msgSend(v4, "includeBadgeIcon") ^ 1;
    }
    else
    {
      LOBYTE(v8) = 0;
    }

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
  __CFString *v6;
  __CFString *v7;
  const __CFString *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[CRKApplicationDescriptor bundleIdentifier](self, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CRKApplicationDescriptor includeIcon](self, "includeIcon"))
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  v7 = v6;
  if (-[CRKApplicationDescriptor includeBadgeIcon](self, "includeBadgeIcon"))
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p { bundleIdentifier = %@, includeIcon = %@, includeBadgeIcon = %@ }>"), v4, self, v5, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRKApplicationDescriptor)initWithCoder:(id)a3
{
  id v4;
  CRKApplicationDescriptor *v5;
  void *v6;
  uint64_t v7;
  NSString *bundleIdentifier;
  void *v9;
  void *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CRKApplicationDescriptor;
  v5 = -[CRKApplicationDescriptor init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("bundleIdentifier"));
    v7 = objc_claimAutoreleasedReturnValue();
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("includeIcon"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_includeIcon = objc_msgSend(v9, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("includeBadgeIcon"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_includeBadgeIcon = objc_msgSend(v10, "BOOLValue");

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
  -[CRKApplicationDescriptor bundleIdentifier](self, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("bundleIdentifier"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[CRKApplicationDescriptor includeIcon](self, "includeIcon"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("includeIcon"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[CRKApplicationDescriptor includeBadgeIcon](self, "includeBadgeIcon"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("includeBadgeIcon"));

}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (BOOL)includeIcon
{
  return self->_includeIcon;
}

- (BOOL)includeBadgeIcon
{
  return self->_includeBadgeIcon;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end
