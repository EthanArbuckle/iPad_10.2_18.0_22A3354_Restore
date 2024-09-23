@implementation BBParentSectionDataProviderFactory

+ (id)factoryFromSectionInfo:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithSectionInfo:", v3);

  return v4;
}

- (BBParentSectionDataProviderFactory)initWithSectionInfo:(id)a3
{
  id v4;
  BBParentSectionDataProviderFactory *v5;
  BBParentSectionDataProviderFactory *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BBParentSectionDataProviderFactory;
  v5 = -[BBParentSectionDataProviderFactory init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[BBParentSectionDataProviderFactory setSectionInfo:](v5, "setSectionInfo:", v4);

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BBParentSectionDataProviderFactory)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BBParentSectionDataProviderFactory *v7;
  BBParentSectionDataProviderFactory *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_sectionInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_universalSectionIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[BBParentSectionDataProviderFactory initWithSectionInfo:](self, "initWithSectionInfo:", v5);
  v8 = v7;
  if (v7)
    -[BBParentSectionDataProviderFactory setUniversalSectionIdentifier:](v7, "setUniversalSectionIdentifier:", v6);

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  BBSectionInfo *sectionInfo;
  id v5;

  sectionInfo = self->_sectionInfo;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", sectionInfo, CFSTR("_sectionInfo"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_universalSectionIdentifier, CFSTR("_universalSectionIdentifier"));

}

- (id)dataProviders
{
  return 0;
}

- (id)sectionIdentifier
{
  return -[BBSectionInfo sectionID](self->_sectionInfo, "sectionID");
}

- (id)sectionDisplayName
{
  return -[BBSectionInfo displayName](self->_sectionInfo, "displayName");
}

- (id)sectionIcon
{
  return -[BBSectionInfo icon](self->_sectionInfo, "icon");
}

- (BBSectionInfo)sectionInfo
{
  return self->_sectionInfo;
}

- (void)setSectionInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)universalSectionIdentifier
{
  return self->_universalSectionIdentifier;
}

- (void)setUniversalSectionIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_universalSectionIdentifier, 0);
  objc_storeStrong((id *)&self->_sectionInfo, 0);
}

@end
