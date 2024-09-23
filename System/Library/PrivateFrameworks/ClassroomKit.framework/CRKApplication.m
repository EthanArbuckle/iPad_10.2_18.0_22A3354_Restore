@implementation CRKApplication

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRKApplication)initWithCoder:(id)a3
{
  id v4;
  CRKApplication *v5;
  void *v6;
  uint64_t v7;
  NSString *bundleIdentifier;
  void *v9;
  uint64_t v10;
  NSString *name;
  void *v12;
  uint64_t v13;
  NSData *iconData;
  void *v15;
  uint64_t v16;
  NSData *badgeIconData;
  void *v18;
  uint64_t v19;
  NSString *shortVersionString;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)CRKApplication;
  v5 = -[CRKApplication init](&v22, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("bundleIdentifier"));
    v7 = objc_claimAutoreleasedReturnValue();
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v7;

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("name"));
    v10 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v10;

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("iconData"));
    v13 = objc_claimAutoreleasedReturnValue();
    iconData = v5->_iconData;
    v5->_iconData = (NSData *)v13;

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("badgeIconData"));
    v16 = objc_claimAutoreleasedReturnValue();
    badgeIconData = v5->_badgeIconData;
    v5->_badgeIconData = (NSData *)v16;

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("shortVersionString"));
    v19 = objc_claimAutoreleasedReturnValue();
    shortVersionString = v5->_shortVersionString;
    v5->_shortVersionString = (NSString *)v19;

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
  id v9;

  v4 = a3;
  -[CRKApplication bundleIdentifier](self, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("bundleIdentifier"));

  -[CRKApplication name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("name"));

  -[CRKApplication iconData](self, "iconData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("iconData"));

  -[CRKApplication badgeIconData](self, "badgeIconData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("badgeIconData"));

  -[CRKApplication shortVersionString](self, "shortVersionString");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("shortVersionString"));

}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSData)iconData
{
  return self->_iconData;
}

- (void)setIconData:(id)a3
{
  objc_storeStrong((id *)&self->_iconData, a3);
}

- (NSData)badgeIconData
{
  return self->_badgeIconData;
}

- (void)setBadgeIconData:(id)a3
{
  objc_storeStrong((id *)&self->_badgeIconData, a3);
}

- (NSString)shortVersionString
{
  return self->_shortVersionString;
}

- (void)setShortVersionString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shortVersionString, 0);
  objc_storeStrong((id *)&self->_badgeIconData, 0);
  objc_storeStrong((id *)&self->_iconData, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end
