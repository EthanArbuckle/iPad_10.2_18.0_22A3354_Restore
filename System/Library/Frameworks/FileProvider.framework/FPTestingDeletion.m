@implementation FPTestingDeletion

- (FPTestingDeletion)initWithOperationIdentifier:(id)a3 sourceItemIdentifier:(id)a4 targetItemIdentifier:(id)a5 targetItemBaseVersion:(id)a6 domainVersion:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  FPTestingDeletion *v17;
  FPTestingDeletion *v18;
  objc_super v20;

  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)FPTestingDeletion;
  v17 = -[FPTestingOperation initWithOperationIdentifier:](&v20, sel_initWithOperationIdentifier_, a3);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_sourceItemIdentifier, a4);
    objc_storeStrong((id *)&v18->_targetItemIdentifier, a5);
    objc_storeStrong((id *)&v18->_targetItemBaseVersion, a6);
    objc_storeStrong((id *)&v18->_domainVersion, a7);
  }

  return v18;
}

- (int64_t)type
{
  return 4;
}

- (unint64_t)targetSide
{
  return -[NSString hasPrefix:](self->_sourceItemIdentifier, "hasPrefix:", CFSTR("__fp/fs/"));
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FPTestingDeletion;
  v4 = a3;
  -[FPTestingOperation encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_sourceItemIdentifier, CFSTR("_sourceItemIdentifier"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_targetItemIdentifier, CFSTR("_targetItemIdentifier"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_targetItemBaseVersion, CFSTR("_targetItemBaseVersion"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_domainVersion, CFSTR("_domainVersion"));

}

- (FPTestingDeletion)initWithCoder:(id)a3
{
  id v4;
  FPTestingDeletion *v5;
  uint64_t v6;
  NSString *sourceItemIdentifier;
  uint64_t v8;
  NSString *targetItemIdentifier;
  uint64_t v10;
  NSFileProviderItemVersion *targetItemBaseVersion;
  uint64_t v12;
  NSFileProviderDomainVersion *domainVersion;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)FPTestingDeletion;
  v5 = -[FPTestingOperation initWithCoder:](&v15, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_sourceItemIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    sourceItemIdentifier = v5->_sourceItemIdentifier;
    v5->_sourceItemIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_targetItemIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    targetItemIdentifier = v5->_targetItemIdentifier;
    v5->_targetItemIdentifier = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_targetItemBaseVersion"));
    v10 = objc_claimAutoreleasedReturnValue();
    targetItemBaseVersion = v5->_targetItemBaseVersion;
    v5->_targetItemBaseVersion = (NSFileProviderItemVersion *)v10;

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

- (NSString)sourceItemIdentifier
{
  return self->_sourceItemIdentifier;
}

- (NSString)targetItemIdentifier
{
  return self->_targetItemIdentifier;
}

- (NSFileProviderItemVersion)targetItemBaseVersion
{
  return self->_targetItemBaseVersion;
}

- (NSFileProviderDomainVersion)domainVersion
{
  return self->_domainVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domainVersion, 0);
  objc_storeStrong((id *)&self->_targetItemBaseVersion, 0);
  objc_storeStrong((id *)&self->_targetItemIdentifier, 0);
  objc_storeStrong((id *)&self->_sourceItemIdentifier, 0);
}

@end
