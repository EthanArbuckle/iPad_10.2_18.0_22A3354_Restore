@implementation FPItemID

+ (id)fpIdentifierFromCoreSpotlightIdentifier:(id)a3 domainIdentifier:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  objc_msgSend(a1, "coreSpotlightEncodedDomainIdentifier:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "stringByRemovingPrefix:fromIdentifier:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)stringByRemovingPrefix:(id)a3 fromIdentifier:(id)a4
{
  id v5;
  id v6;
  void *v7;
  unint64_t v8;
  id v9;
  void *v10;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5 && objc_msgSend(v6, "hasPrefix:", v5))
  {
    v8 = objc_msgSend(v7, "length");
    if (v8 <= objc_msgSend(v5, "length") + 1)
    {
      v10 = 0;
      goto LABEL_7;
    }
    objc_msgSend(v7, "substringFromIndex:", objc_msgSend(v5, "length") + 1);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = v7;
  }
  v10 = v9;
LABEL_7:

  return v10;
}

+ (id)coreSpotlightEncodedDomainIdentifier:(id)a3
{
  __CFString *v3;
  __CFString *v4;
  id v5;
  void *v6;
  void *v7;

  if (a3)
    v3 = (__CFString *)a3;
  else
    v3 = CFSTR("NSFileProviderDomainDefaultIdentifier");
  v4 = v3;
  if (-[__CFString isEqualToString:](v4, "isEqualToString:", CFSTR("NSFileProviderDomainDefaultIdentifier")))
  {
    v5 = (id)defaultDomainPrefix;
  }
  else
  {
    -[__CFString dataUsingEncoding:](v4, "dataUsingEncoding:", 4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "base64EncodedStringWithOptions:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)domainPrefix, "stringByAppendingPathComponent:", v7);
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domainIdentifier, 0);
  objc_storeStrong((id *)&self->_providerID, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (FPItemID)initWithProviderID:(id)a3 domainIdentifier:(id)a4 itemIdentifier:(id)a5
{
  id v10;
  id v11;
  id v12;
  FPItemID *v13;
  FPItemID *v14;
  void *v15;
  objc_super v17;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v17.receiver = self;
  v17.super_class = (Class)FPItemID;
  v13 = -[FPItemID init](&v17, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_providerID, a3);
    objc_storeStrong((id *)&v14->_identifier, a5);
    objc_storeStrong((id *)&v14->_domainIdentifier, a4);
    if (!v14->_domainIdentifier)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, v14, CFSTR("FPItem.m"), 124, CFSTR("domainIdentifier must not be nil"));

    }
  }

  return v14;
}

- (BOOL)isPlaceholder
{
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  -[FPItemID identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pathComponents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5 < 2)
    return 0;
  -[FPItemID identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pathComponents");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("__fp"));

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  FPItemID *v4;
  FPItemID *v5;
  BOOL v6;

  v4 = (FPItemID *)a3;
  v5 = v4;
  if (!v4)
    goto LABEL_5;
  if (v4 == self)
  {
    v6 = 1;
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = -[FPItemID isEqualToItemID:](self, "isEqualToItemID:", v5);
  else
LABEL_5:
    v6 = 0;
LABEL_7:

  return v6;
}

- (BOOL)isEqualToItemID:(id)a3
{
  void *v3;
  void *v4;
  FPItemID *v6;
  FPItemID *v7;
  NSString *providerID;
  NSString *v9;
  NSString *v10;
  char v11;
  NSString *identifier;
  NSString *v13;
  NSString *v14;
  NSString *domainIdentifier;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  NSString *v20;
  void *v21;
  void *v23;

  v6 = (FPItemID *)a3;
  v7 = v6;
  if (self != v6)
  {
    providerID = self->_providerID;
    -[FPItemID providerID](v6, "providerID");
    v9 = (NSString *)objc_claimAutoreleasedReturnValue();
    if (providerID != v9)
    {
      v10 = self->_providerID;
      -[FPItemID providerID](v7, "providerID");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (!-[NSString isEqualToString:](v10, "isEqualToString:", v4))
      {
        v11 = 0;
        goto LABEL_17;
      }
    }
    identifier = self->_identifier;
    -[FPItemID identifier](v7, "identifier");
    v13 = (NSString *)objc_claimAutoreleasedReturnValue();
    if (identifier == v13
      || (v14 = self->_identifier,
          -[FPItemID identifier](v7, "identifier"),
          v3 = (void *)objc_claimAutoreleasedReturnValue(),
          -[NSString isEqualToString:](v14, "isEqualToString:", v3)))
    {
      domainIdentifier = self->_domainIdentifier;
      -[FPItemID domainIdentifier](v7, "domainIdentifier");
      v16 = objc_claimAutoreleasedReturnValue();
      if (domainIdentifier == (NSString *)v16)
      {

        v11 = 1;
      }
      else
      {
        v17 = (void *)v16;
        -[FPItemID domainIdentifier](v7, "domainIdentifier");
        v18 = objc_claimAutoreleasedReturnValue();
        if (v18)
        {
          v19 = (void *)v18;
          v20 = self->_domainIdentifier;
          -[FPItemID domainIdentifier](v7, "domainIdentifier");
          v23 = v4;
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = -[NSString isEqualToString:](v20, "isEqualToString:", v21);

          v4 = v23;
        }
        else
        {

          v11 = 0;
        }
      }
      if (identifier == v13)
      {
LABEL_16:

        if (providerID == v9)
        {
LABEL_18:

          goto LABEL_19;
        }
LABEL_17:

        goto LABEL_18;
      }
    }
    else
    {
      v11 = 0;
    }

    goto LABEL_16;
  }
  v11 = 1;
LABEL_19:

  return v11;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)providerID
{
  return self->_providerID;
}

- (NSString)providerDomainID
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "fp_providerDomainIDFromProviderID:domainIdentifier:", self->_providerID, self->_domainIdentifier);
}

- (NSString)domainIdentifier
{
  return self->_domainIdentifier;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *providerID;
  id v5;

  providerID = self->_providerID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", providerID, CFSTR("_providerIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_identifier, CFSTR("_identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_domainIdentifier, CFSTR("_domainIdentifier"));

}

- (FPItemID)initWithProviderDomainID:(id)a3 itemIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  FPItemID *v10;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "fp_toProviderID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fp_toDomainIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[FPItemID initWithProviderID:domainIdentifier:itemIdentifier:](self, "initWithProviderID:domainIdentifier:itemIdentifier:", v8, v9, v6);
  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;

  v3 = -[NSString hash](self->_providerID, "hash");
  v4 = -[NSString hash](self->_identifier, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_domainIdentifier, "hash");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FPItemID)initWithCoder:(id)a3
{
  id v4;
  FPItemID *v5;
  uint64_t v6;
  NSString *providerID;
  uint64_t v8;
  NSString *domainIdentifier;
  void *v10;
  int v11;
  uint64_t v12;
  NSString *identifier;
  FPItemID *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)FPItemID;
  v5 = -[FPItemID init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_providerIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    providerID = v5->_providerID;
    v5->_providerID = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_domainIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    domainIdentifier = v5->_domainIdentifier;
    v5->_domainIdentifier = (NSString *)v8;

    if (!v5->_domainIdentifier)
      objc_storeStrong((id *)&v5->_domainIdentifier, CFSTR("NSFileProviderDomainDefaultIdentifier"));
    objc_msgSend(MEMORY[0x1E0CB3940], "fp_providerDomainIDFromProviderID:domainIdentifier:", v5->_providerID);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v4, "fp_checkProviderIdentifier:", v10);

    if (!v11)
    {
      v14 = 0;
      goto LABEL_8;
    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_identifier"));
    v12 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v12;

  }
  v14 = v5;
LABEL_8:

  return v14;
}

- (BOOL)isDiskIdentifier
{
  return -[NSString hasPrefix:](self->_identifier, "hasPrefix:", CFSTR("__fp/fs/"));
}

- (id)description
{
  NSString *domainIdentifier;
  NSString *v4;
  __CFString *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  if (-[NSString isEqualToString:](self->_domainIdentifier, "isEqualToString:", CFSTR("NSFileProviderDomainDefaultIdentifier")))
  {
    domainIdentifier = 0;
  }
  else
  {
    domainIdentifier = self->_domainIdentifier;
  }
  v4 = domainIdentifier;
  if (-[NSString isEqualToString:](self->_identifier, "isEqualToString:", CFSTR("NSFileProviderRootContainerItemIdentifier")))
  {
    v5 = CFSTR("root");
  }
  else if (-[NSString isEqualToString:](self->_identifier, "isEqualToString:", CFSTR("NSFileProviderTrashContainerItemIdentifier")))
  {
    v5 = CFSTR("trash");
  }
  else
  {
    v5 = self->_identifier;
  }
  v6 = (void *)MEMORY[0x1E0CB3940];
  -[NSString fp_fpIdentifier](self->_providerID, "fp_fpIdentifier");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v4)
  {
    -[NSString fp_obfuscatedFilename](v4, "fp_obfuscatedFilename");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("%@/%@/%@"), v8, v9, v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v6, "stringWithFormat:", CFSTR("%@/%@"), v7, v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

+ (id)rootItemIDWithProviderIdentifier:(id)a3 domainIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithProviderID:domainIdentifier:itemIdentifier:", v7, v6, CFSTR("NSFileProviderRootContainerItemIdentifier"));

  return v8;
}

+ (id)rootItemIDWithProviderDomainID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(v4, "fp_toProviderID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fp_toDomainIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "rootItemIDWithProviderIdentifier:domainIdentifier:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)providerIdentifier
{
  return self->_providerID;
}

- (void)setProviderDomainID:(id)a3
{
  id v4;
  NSString *v5;
  NSString *providerID;
  NSString *v7;
  NSString *domainIdentifier;

  v4 = a3;
  objc_msgSend(v4, "fp_toProviderID");
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  providerID = self->_providerID;
  self->_providerID = v5;

  objc_msgSend(v4, "fp_toDomainIdentifier");
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();

  domainIdentifier = self->_domainIdentifier;
  self->_domainIdentifier = v7;

}

- (id)transformForMigratedCloudDocsProviderDomainIdentifier:(id)a3
{
  id v5;
  void *v6;
  char v7;
  void *v8;
  char v9;
  const char *v10;
  int v11;
  unint64_t v12;
  FPItemID *v13;
  FPItemID *v14;
  unint64_t v15;
  void *v16;
  void *v18;

  v5 = a3;
  if ((-[NSString isEqual:](self->_providerID, "isEqual:", CFSTR("com.apple.CloudDocs.MobileDocumentsFileProvider")) & 1) != 0
    || -[NSString isEqual:](self->_providerID, "isEqual:", CFSTR("com.apple.CloudDocs.MobileDocumentsFileProviderManaged")))
  {
    objc_msgSend(v5, "fp_toProviderID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "fp_isiCloudDriveOrCloudDocsIdentifier");

    if ((v7 & 1) == 0)
    {
      objc_msgSend(v5, "fp_toProviderID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "fp_isiCloudDriveOrCloudDocsIdentifier");

      if ((v9 & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("FPItem.m"), 265, CFSTR("wrong migrated identifier %@"), v5);

      }
    }
    v10 = -[NSString UTF8String](self->_identifier, "UTF8String");
    v11 = *v10;
    if (v11 == 100)
    {
      v15 = strtoul(v10 + 1, 0, 16);
      v13 = [FPItemID alloc];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("__fp/fs/docID(%u)"), v15);
      goto LABEL_11;
    }
    if (v11 == 105)
    {
      v12 = strtoull(v10 + 1, 0, 16);
      v13 = [FPItemID alloc];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("__fp/fs/fileID(%llu)"), v12);
LABEL_11:
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[FPItemID initWithProviderDomainID:itemIdentifier:](v13, "initWithProviderDomainID:itemIdentifier:", v5, v16);

      goto LABEL_12;
    }
  }
  v14 = self;
LABEL_12:

  return v14;
}

- (FPItemID)initWithSearchableItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  FPItemID *v10;

  v4 = a3;
  objc_msgSend(v4, "attributeSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fileProviderID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "attributeSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fileProviderDomainIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[FPItemID initWithProviderID:domainIdentifier:coreSpotlightIdentifier:](self, "initWithProviderID:domainIdentifier:coreSpotlightIdentifier:", v6, v8, v9);
  return v10;
}

- (FPItemID)initWithProviderID:(id)a3 domainIdentifier:(id)a4 coreSpotlightIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  FPItemID *v14;
  id v16;
  id v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v16 = 0;
  v17 = 0;
  v10 = a3;
  +[FPItemID getDomainIdentifier:andIdentifier:fromCoreSpotlightIdentifier:](FPItemID, "getDomainIdentifier:andIdentifier:fromCoreSpotlightIdentifier:", &v17, &v16, v9);
  v11 = v17;
  v12 = v16;
  if ((objc_msgSend(v11, "isEqual:", v8) & 1) == 0)
  {
    fp_current_or_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446978;
      v19 = "-[FPItemID(CSSearchableItem) initWithProviderID:domainIdentifier:coreSpotlightIdentifier:]";
      v20 = 2112;
      v21 = v8;
      v22 = 2112;
      v23 = v9;
      v24 = 2112;
      v25 = v12;
      _os_log_impl(&dword_1A0A34000, v13, OS_LOG_TYPE_DEFAULT, "[WARNING] %{public}s called with a domain identifier %@ that does not match the corresponding csIdentifier %@ (inferred %@)", buf, 0x2Au);
    }

  }
  v14 = -[FPItemID initWithProviderID:domainIdentifier:itemIdentifier:]([FPItemID alloc], "initWithProviderID:domainIdentifier:itemIdentifier:", v10, v11, v12);

  return v14;
}

- (id)coreSpotlightIdentifier
{
  void *v3;
  void *v4;
  void *v5;

  -[FPItemID identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPItemID domainIdentifier](self, "domainIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[FPItemID csIdentifierFromFPIdentifier:domainIdentifier:](FPItemID, "csIdentifierFromFPIdentifier:domainIdentifier:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (void)getDomainIdentifier:(id *)a3 andIdentifier:(id *)a4 fromCoreSpotlightIdentifier:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v7 = a5;
  v16 = v7;
  if (a3)
  {
    *a3 = objc_retainAutorelease(CFSTR("NSFileProviderDomainDefaultIdentifier"));
    v7 = v16;
  }
  if (a4)
  {
    *a4 = objc_retainAutorelease(v16);
    v7 = v16;
  }
  objc_msgSend(v7, "pathComponents");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("__fpdefault")))
    {
      v11 = CFSTR("NSFileProviderDomainDefaultIdentifier");
      v12 = 1;
    }
    else
    {
      if (!objc_msgSend(v10, "isEqualToString:", domainPrefix))
      {
        v11 = 0;
LABEL_20:

        goto LABEL_21;
      }
      objc_msgSend(v8, "objectAtIndexedSubscript:", 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v13, 0);
      if (v14)
        v11 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v14, 4);
      else
        v11 = 0;

      v12 = 2;
    }
    if (objc_msgSend(v8, "count") >= v12 && v11)
    {
      if (a3)
        *a3 = objc_retainAutorelease(v11);
      if (a4)
      {
        objc_msgSend(v8, "subarrayWithRange:", v12, objc_msgSend(v8, "count") - v12);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "componentsJoinedByString:", CFSTR("/"));
        *a4 = (id)objc_claimAutoreleasedReturnValue();

      }
    }
    goto LABEL_20;
  }
LABEL_21:

}

+ (id)getFPIdentifierFromCoreSpotlightIdentifier:(id)a3
{
  id v4;

  v4 = 0;
  +[FPItemID getDomainIdentifier:andIdentifier:fromCoreSpotlightIdentifier:](FPItemID, "getDomainIdentifier:andIdentifier:fromCoreSpotlightIdentifier:", 0, &v4, a3);
  return v4;
}

+ (id)csIdentifierFromFPIdentifier:(id)a3 domainIdentifier:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;

  v6 = a3;
  objc_msgSend(a1, "coreSpotlightEncodedDomainIdentifier:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "stringByAppendingPathComponent:", v6);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = v6;
  }
  v10 = v9;

  return v10;
}

@end
