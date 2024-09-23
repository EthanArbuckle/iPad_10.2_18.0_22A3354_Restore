@implementation FPTestingModification

- (FPTestingModification)initWithOperationIdentifier:(id)a3 sourceItem:(id)a4 targetItemIdentifier:(id)a5 targetItemBaseVersion:(id)a6 changedFields:(unint64_t)a7 domainVersion:(id)a8 rawFields:(int64_t)a9 snapshotVersion:(int64_t)a10
{
  id v17;
  id v18;
  id v19;
  FPTestingModification *v20;
  FPTestingModification *v21;
  id v23;
  objc_super v24;

  v17 = a4;
  v18 = a5;
  v19 = a6;
  v23 = a8;
  v24.receiver = self;
  v24.super_class = (Class)FPTestingModification;
  v20 = -[FPTestingOperation initWithOperationIdentifier:](&v24, sel_initWithOperationIdentifier_, a3);
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_sourceItem, a4);
    objc_storeStrong((id *)&v21->_targetItemIdentifier, a5);
    objc_storeStrong((id *)&v21->_targetItemBaseVersion, a6);
    v21->_changedFields = a7;
    v21->_rawFields = a9;
    v21->_snapshotVersion = a10;
    objc_storeStrong((id *)&v21->_domainVersion, a8);
  }

  return v21;
}

- (int64_t)type
{
  return 3;
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
  v5.super_class = (Class)FPTestingModification;
  v4 = a3;
  -[FPTestingOperation encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_sourceItem, CFSTR("_sourceItem"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_targetItemIdentifier, CFSTR("_targetItemIdentifier"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_targetItemBaseVersion, CFSTR("_targetItemBaseVersion"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_changedFields, CFSTR("_changedFields"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_rawFields, CFSTR("_rawFields"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_snapshotVersion, CFSTR("_snapshotVersion"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_domainVersion, CFSTR("_domainVersion"));

}

- (FPTestingModification)initWithCoder:(id)a3
{
  id v4;
  FPTestingModification *v5;
  uint64_t v6;
  NSFileProviderItem *sourceItem;
  uint64_t v8;
  NSString *targetItemIdentifier;
  uint64_t v10;
  NSFileProviderItemVersion *targetItemBaseVersion;
  uint64_t v12;
  NSFileProviderDomainVersion *domainVersion;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)FPTestingModification;
  v5 = -[FPTestingOperation initWithCoder:](&v15, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_sourceItem"));
    v6 = objc_claimAutoreleasedReturnValue();
    sourceItem = v5->_sourceItem;
    v5->_sourceItem = (NSFileProviderItem *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_targetItemIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    targetItemIdentifier = v5->_targetItemIdentifier;
    v5->_targetItemIdentifier = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_targetItemBaseVersion"));
    v10 = objc_claimAutoreleasedReturnValue();
    targetItemBaseVersion = v5->_targetItemBaseVersion;
    v5->_targetItemBaseVersion = (NSFileProviderItemVersion *)v10;

    v5->_changedFields = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_changedFields"));
    v5->_rawFields = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_rawFields"));
    v5->_snapshotVersion = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_snapshotVersion"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_domainVersion"));
    v12 = objc_claimAutoreleasedReturnValue();
    domainVersion = v5->_domainVersion;
    v5->_domainVersion = (NSFileProviderDomainVersion *)v12;

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

- (NSString)targetItemIdentifier
{
  return self->_targetItemIdentifier;
}

- (NSFileProviderItemVersion)targetItemBaseVersion
{
  return self->_targetItemBaseVersion;
}

- (unint64_t)changedFields
{
  return self->_changedFields;
}

- (NSFileProviderDomainVersion)domainVersion
{
  return self->_domainVersion;
}

- (int64_t)rawFields
{
  return self->_rawFields;
}

- (int64_t)snapshotVersion
{
  return self->_snapshotVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domainVersion, 0);
  objc_storeStrong((id *)&self->_targetItemBaseVersion, 0);
  objc_storeStrong((id *)&self->_targetItemIdentifier, 0);
  objc_storeStrong((id *)&self->_sourceItem, 0);
}

@end
