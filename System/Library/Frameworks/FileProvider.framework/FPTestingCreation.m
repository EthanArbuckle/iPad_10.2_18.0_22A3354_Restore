@implementation FPTestingCreation

- (FPTestingCreation)initWithOperationIdentifier:(id)a3 sourceItem:(id)a4 domainVersion:(id)a5 snapshotVersion:(int64_t)a6
{
  id v11;
  id v12;
  FPTestingCreation *v13;
  FPTestingCreation *v14;
  objc_super v16;

  v11 = a4;
  v12 = a5;
  v16.receiver = self;
  v16.super_class = (Class)FPTestingCreation;
  v13 = -[FPTestingOperation initWithOperationIdentifier:](&v16, sel_initWithOperationIdentifier_, a3);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_sourceItem, a4);
    v14->_snapshotVersion = a6;
    objc_storeStrong((id *)&v14->_domainVersion, a5);
  }

  return v14;
}

- (int64_t)type
{
  return 2;
}

- (unint64_t)targetSide
{
  void *v2;
  unsigned int v3;

  -[NSFileProviderItem itemIdentifier](self->_sourceItem, "itemIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasPrefix:", CFSTR("__fp/fs/"));

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FPTestingCreation;
  v4 = a3;
  -[FPTestingOperation encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_sourceItem, CFSTR("_sourceItem"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_snapshotVersion, CFSTR("_snapshotVersion"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_domainVersion, CFSTR("_domainVersion"));

}

- (FPTestingCreation)initWithCoder:(id)a3
{
  id v4;
  FPTestingCreation *v5;
  uint64_t v6;
  NSFileProviderItem *sourceItem;
  uint64_t v8;
  NSFileProviderDomainVersion *domainVersion;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FPTestingCreation;
  v5 = -[FPTestingOperation initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_sourceItem"));
    v6 = objc_claimAutoreleasedReturnValue();
    sourceItem = v5->_sourceItem;
    v5->_sourceItem = (NSFileProviderItem *)v6;

    v5->_snapshotVersion = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_snapshotVersion"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_domainVersion"));
    v8 = objc_claimAutoreleasedReturnValue();
    domainVersion = v5->_domainVersion;
    v5->_domainVersion = (NSFileProviderDomainVersion *)v8;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSFileProviderItem)sourceItem
{
  return self->_sourceItem;
}

- (NSFileProviderDomainVersion)domainVersion
{
  return self->_domainVersion;
}

- (int64_t)snapshotVersion
{
  return self->_snapshotVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domainVersion, 0);
  objc_storeStrong((id *)&self->_sourceItem, 0);
}

@end
