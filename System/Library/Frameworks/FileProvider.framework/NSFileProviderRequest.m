@implementation NSFileProviderRequest

- (void)setRequestingApplicationIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_requestingApplicationIdentifier, a3);
}

- (NSFileProviderRequest)init
{
  NSFileProviderRequest *v2;
  uint64_t v3;
  NSUUID *requestingApplicationIdentifier;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NSFileProviderRequest;
  v2 = -[NSFileProviderRequest init](&v6, sel_init);
  if (v2)
  {
    +[NSFileProviderRequest _fpdIdentifier](NSFileProviderRequest, "_fpdIdentifier");
    v3 = objc_claimAutoreleasedReturnValue();
    requestingApplicationIdentifier = v2->_requestingApplicationIdentifier;
    v2->_requestingApplicationIdentifier = (NSUUID *)v3;

  }
  return v2;
}

- (NSFileProviderRequest)initWithIsSpeculativeDownload:(BOOL)a3
{
  NSFileProviderRequest *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NSFileProviderRequest;
  result = -[NSFileProviderRequest init](&v5, sel_init);
  if (result)
    result->_speculativeDownload = a3;
  return result;
}

- (NSFileProviderRequest)initWithCoder:(id)a3
{
  id v4;
  NSFileProviderRequest *v5;
  uint64_t v6;
  NSUUID *requestingApplicationIdentifier;
  uint64_t v8;
  NSFileProviderDomainVersion *domainVersion;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NSFileProviderRequest;
  v5 = -[NSFileProviderRequest init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_requestingApplicationIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    requestingApplicationIdentifier = v5->_requestingApplicationIdentifier;
    v5->_requestingApplicationIdentifier = (NSUUID *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_domainVersion"));
    v8 = objc_claimAutoreleasedReturnValue();
    domainVersion = v5->_domainVersion;
    v5->_domainVersion = (NSFileProviderDomainVersion *)v8;

    v5->_speculativeDownload = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_speculativeDownload"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *requestingApplicationIdentifier;
  id v5;

  requestingApplicationIdentifier = self->_requestingApplicationIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", requestingApplicationIdentifier, CFSTR("_requestingApplicationIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_domainVersion, CFSTR("_domainVersion"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_speculativeDownload, CFSTR("_speculativeDownload"));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestingApplicationIdentifier, 0);
  objc_storeStrong((id *)&self->_domainVersion, 0);
  objc_storeStrong((id *)&self->_requestingExecutable, 0);
}

+ (NSUUID)_fpdIdentifier
{
  return (NSUUID *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("A7CE4FBB-64E6-4A9C-8EAA-0D8F07492B44"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (NSUUID)_finderIdentifier
{
  return (NSUUID *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("2DAAE428-7239-4A8A-8C1F-30A787A5EBE1"));
}

+ (NSUUID)_dsIdentifier
{
  return (NSUUID *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("AD8D660C-2BFE-47A3-BB78-0D8A1C98D143"));
}

+ (NSUUID)_filesIdentifier
{
  return (NSUUID *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("B847DC19-D25E-43A1-BBC8-2A18289DFB00"));
}

+ (NSUUID)_dmIdentifier
{
  return (NSUUID *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("651152F6-CE30-4450-A618-522D30241F50"));
}

- (BOOL)isSystemRequest
{
  void *v2;
  void *v3;
  char v4;

  -[NSFileProviderRequest requestingApplicationIdentifier](self, "requestingApplicationIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_fpdIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqual:", v3);

  return v4;
}

- (BOOL)isFileViewerRequest
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  -[NSFileProviderRequest requestingApplicationIdentifier](self, "requestingApplicationIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_finderIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqual:", v4) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    -[NSFileProviderRequest requestingApplicationIdentifier](self, "requestingApplicationIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "_dsIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "isEqual:", v7) & 1) != 0)
    {
      v5 = 1;
    }
    else
    {
      -[NSFileProviderRequest requestingApplicationIdentifier](self, "requestingApplicationIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "_dmIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v8, "isEqual:", v9) & 1) != 0)
      {
        v5 = 1;
      }
      else
      {
        -[NSFileProviderRequest requestingApplicationIdentifier](self, "requestingApplicationIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)objc_opt_class(), "_filesIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = objc_msgSend(v10, "isEqual:", v11);

      }
    }

  }
  return v5;
}

- (id)description
{
  const char *v3;
  _BOOL4 v4;
  const char *v5;

  if (-[NSFileProviderRequest isSystemRequest](self, "isSystemRequest"))
  {
    v3 = "system";
  }
  else
  {
    v4 = -[NSFileProviderRequest isFileViewerRequest](self, "isFileViewerRequest");
    v3 = "other";
    if (v4)
      v3 = "viewer";
  }
  if (self->_speculativeDownload)
    v5 = "y";
  else
    v5 = "n";
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<NSFileProviderRequest from:%s version:%@ speculative:%s>"), v3, self->_domainVersion, v5);
}

+ (id)requestFromTheSystem
{
  return (id)objc_opt_new();
}

- (NSURL)requestingExecutable
{
  return self->_requestingExecutable;
}

- (void)setRequestingExecutable:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSFileProviderDomainVersion)domainVersion
{
  return self->_domainVersion;
}

- (void)setDomainVersion:(id)a3
{
  objc_storeStrong((id *)&self->_domainVersion, a3);
}

- (BOOL)isSpeculativeDownload
{
  return self->_speculativeDownload;
}

- (NSUUID)requestingApplicationIdentifier
{
  return self->_requestingApplicationIdentifier;
}

@end
