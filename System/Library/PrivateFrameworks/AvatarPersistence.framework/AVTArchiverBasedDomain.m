@implementation AVTArchiverBasedDomain

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AVTArchiverBasedDomain)initWithDomainIdentifier:(id)a3 primaryAvatarIdentifier:(id)a4
{
  id v6;
  id v7;
  AVTArchiverBasedDomain *v8;
  uint64_t v9;
  NSString *domainIdentifier;
  uint64_t v11;
  NSString *primaryAvatarIdentifier;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)AVTArchiverBasedDomain;
  v8 = -[AVTArchiverBasedDomain init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    domainIdentifier = v8->_domainIdentifier;
    v8->_domainIdentifier = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    primaryAvatarIdentifier = v8->_primaryAvatarIdentifier;
    v8->_primaryAvatarIdentifier = (NSString *)v11;

  }
  return v8;
}

- (id)domainBySettingPrimaryAvatarIdentifier:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = objc_alloc((Class)objc_opt_class());
  -[AVTArchiverBasedDomain domainIdentifier](self, "domainIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithDomainIdentifier:primaryAvatarIdentifier:", v6, v4);

  return v7;
}

- (AVTArchiverBasedDomain)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  AVTArchiverBasedDomain *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("domainIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("primaryAvatarIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[AVTArchiverBasedDomain initWithDomainIdentifier:primaryAvatarIdentifier:](self, "initWithDomainIdentifier:primaryAvatarIdentifier:", v5, v6);
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[AVTArchiverBasedDomain domainIdentifier](self, "domainIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("domainIdentifier"));

  -[AVTArchiverBasedDomain primaryAvatarIdentifier](self, "primaryAvatarIdentifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("primaryAvatarIdentifier"));

}

- (NSString)domainIdentifier
{
  return self->_domainIdentifier;
}

- (NSString)primaryAvatarIdentifier
{
  return self->_primaryAvatarIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_primaryAvatarIdentifier, 0);
  objc_storeStrong((id *)&self->_domainIdentifier, 0);
}

@end
