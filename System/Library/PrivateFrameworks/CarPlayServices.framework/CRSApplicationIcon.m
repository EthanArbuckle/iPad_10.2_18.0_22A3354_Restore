@implementation CRSApplicationIcon

- (CRSApplicationIcon)initWithBundleIdentifier:(id)a3
{
  id v4;
  CRSApplicationIcon *v5;
  uint64_t v6;
  NSString *bundleIdentifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRSApplicationIcon;
  v5 = -[CRSApplicationIcon init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v6;

  }
  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD16A8];
  v8.receiver = self;
  v8.super_class = (Class)CRSApplicationIcon;
  -[CRSApplicationIcon description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[CRSApplicationIcon bundleIdentifier](self, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR(" %@"), v6);

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRSApplicationIcon)initWithCoder:(id)a3
{
  id v4;
  CRSApplicationIcon *v5;
  uint64_t v6;
  NSString *bundleIdentifier;
  uint64_t v8;
  NSData *iconImageData;
  float v10;
  uint64_t v11;
  NSString *localizedDisplayName;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CRSApplicationIcon;
  v5 = -[CRSApplicationIcon init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CRSApplicationIconBundleID"));
    v6 = objc_claimAutoreleasedReturnValue();
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CRSApplicationIconImageData"));
    v8 = objc_claimAutoreleasedReturnValue();
    iconImageData = v5->_iconImageData;
    v5->_iconImageData = (NSData *)v8;

    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("CRSApplicationIconImageScale"));
    v5->_iconImageScale = v10;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CRSApplicationIconDisplayName"));
    v11 = objc_claimAutoreleasedReturnValue();
    localizedDisplayName = v5->_localizedDisplayName;
    v5->_localizedDisplayName = (NSString *)v11;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  id v8;

  v4 = a3;
  -[CRSApplicationIcon bundleIdentifier](self, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("CRSApplicationIconBundleID"));

  -[CRSApplicationIcon iconImageData](self, "iconImageData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("CRSApplicationIconImageData"));

  -[CRSApplicationIcon iconImageScale](self, "iconImageScale");
  *(float *)&v7 = v7;
  objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("CRSApplicationIconImageScale"), v7);
  -[CRSApplicationIcon localizedDisplayName](self, "localizedDisplayName");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("CRSApplicationIconDisplayName"));

}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSData)iconImageData
{
  return self->_iconImageData;
}

- (void)setIconImageData:(id)a3
{
  objc_storeStrong((id *)&self->_iconImageData, a3);
}

- (double)iconImageScale
{
  return self->_iconImageScale;
}

- (void)setIconImageScale:(double)a3
{
  self->_iconImageScale = a3;
}

- (NSString)localizedDisplayName
{
  return self->_localizedDisplayName;
}

- (void)setLocalizedDisplayName:(id)a3
{
  objc_storeStrong((id *)&self->_localizedDisplayName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedDisplayName, 0);
  objc_storeStrong((id *)&self->_iconImageData, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end
