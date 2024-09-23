@implementation DDSAsset

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  BOOL v20;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (v6)
  {
    -[DDSAsset attributes](self, "attributes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "attributes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!DDSObjectsAreEqualOrNil((unint64_t)v7, (uint64_t)v8))
    {
      v20 = 0;
LABEL_33:

      goto LABEL_34;
    }
    -[DDSAsset localURL](self, "localURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!DDSObjectsAreEqualOrNil((unint64_t)v9, (uint64_t)v10))
    {
      v20 = 0;
LABEL_32:

      goto LABEL_33;
    }
    -[DDSAsset assetUUID](self, "assetUUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "assetUUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!DDSObjectsAreEqualOrNil((unint64_t)v11, (uint64_t)v12))
    {
      v20 = 0;
LABEL_31:

      goto LABEL_32;
    }
    -[DDSAsset uniqueIdentifier](self, "uniqueIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "uniqueIdentifier");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (!DDSObjectsAreEqualOrNil((unint64_t)v13, (uint64_t)v32))
    {
      v20 = 0;
LABEL_30:

      goto LABEL_31;
    }
    v29 = v11;
    -[DDSAsset shortName](self, "shortName");
    v14 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "shortName");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (void *)v14;
    if (DDSObjectsAreEqualOrNil(v14, (uint64_t)v30))
    {
      v28 = v13;
      v15 = -[DDSAsset compatibilityVersion](self, "compatibilityVersion");
      if (v15 == objc_msgSend(v6, "compatibilityVersion"))
      {
        -[DDSAsset locale](self, "locale");
        v16 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "locale");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = (void *)v16;
        if (DDSObjectsAreEqualOrNil(v16, (uint64_t)v26))
        {
          -[DDSAsset installDate](self, "installDate");
          v17 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "installDate");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = (void *)v17;
          if (DDSObjectsAreEqualOrNil(v17, (uint64_t)v24))
          {
            -[DDSAsset debuggingID](self, "debuggingID");
            v18 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "debuggingID");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = (void *)v18;
            if (DDSObjectsAreEqualOrNil(v18, (uint64_t)v22))
            {
              v19 = -[DDSAsset contentVersion](self, "contentVersion");
              v20 = v19 == objc_msgSend(v6, "contentVersion");
            }
            else
            {
              v20 = 0;
            }
            v13 = v28;
            v11 = v29;

          }
          else
          {
            v20 = 0;
            v13 = v28;
            v11 = v29;
          }

        }
        else
        {
          v20 = 0;
          v13 = v28;
          v11 = v29;
        }

        goto LABEL_29;
      }
      v20 = 0;
      v13 = v28;
    }
    else
    {
      v20 = 0;
    }
    v11 = v29;
LABEL_29:

    goto LABEL_30;
  }
  v20 = 0;
LABEL_34:

  return v20;
}

- (NSDictionary)attributes
{
  return self->_attributes;
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (NSString)shortName
{
  return self->_shortName;
}

- (NSString)locale
{
  return self->_locale;
}

- (NSString)installDate
{
  return self->_installDate;
}

- (unint64_t)contentVersion
{
  return self->_contentVersion;
}

- (unint64_t)compatibilityVersion
{
  return self->_compatibilityVersion;
}

- (NSString)assetUUID
{
  return self->_assetUUID;
}

- (NSURL)localURL
{
  return self->_localURL;
}

+ (id)debuggingIDsForAssets:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "debuggingID", (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

- (NSString)debuggingID
{
  return self->_debuggingID;
}

- (DDSAsset)initWithAttributes:(id)a3 localURL:(id)a4
{
  id v6;
  id v7;
  DDSAsset *v8;
  uint64_t v9;
  NSDictionary *attributes;
  uint64_t v11;
  NSURL *localURL;
  uint64_t v13;
  NSString *assetUUID;
  uint64_t v15;
  NSString *uniqueIdentifier;
  uint64_t v17;
  NSString *shortName;
  void *v19;
  void *v20;
  uint64_t v21;
  NSString *locale;
  uint64_t v23;
  NSString *installDate;
  id v25;
  void *v26;
  void *v27;
  uint64_t v28;
  NSString *debuggingID;
  uint64_t v30;
  NSString *description;
  objc_super v33;

  v6 = a3;
  v7 = a4;
  v33.receiver = self;
  v33.super_class = (Class)DDSAsset;
  v8 = -[DDSAsset init](&v33, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    attributes = v8->_attributes;
    v8->_attributes = (NSDictionary *)v9;

    v11 = objc_msgSend(v7, "copy");
    localURL = v8->_localURL;
    v8->_localURL = (NSURL *)v11;

    assetUUIDWithLocalURL(v7);
    v13 = objc_claimAutoreleasedReturnValue();
    assetUUID = v8->_assetUUID;
    v8->_assetUUID = (NSString *)v13;

    uniqueIdentifierWithAttributes(v6);
    v15 = objc_claimAutoreleasedReturnValue();
    uniqueIdentifier = v8->_uniqueIdentifier;
    v8->_uniqueIdentifier = (NSString *)v15;

    shortNameWithAttributes(v6);
    v17 = objc_claimAutoreleasedReturnValue();
    shortName = v8->_shortName;
    v8->_shortName = (NSString *)v17;

    objc_msgSend(v6, "dds_numberForKey:", CFSTR("_CompatibilityVersion"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_compatibilityVersion = objc_msgSend(v19, "unsignedIntegerValue");

    objc_msgSend(v6, "dds_numberForKey:", CFSTR("_ContentVersion"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_contentVersion = objc_msgSend(v20, "unsignedIntegerValue");

    objc_msgSend(v6, "dds_stringForKey:", CFSTR("AssetLocale"));
    v21 = objc_claimAutoreleasedReturnValue();
    locale = v8->_locale;
    v8->_locale = (NSString *)v21;

    objc_msgSend(v6, "dds_stringForKey:", CFSTR("__InstallDate"));
    v23 = objc_claimAutoreleasedReturnValue();
    installDate = v8->_installDate;
    v8->_installDate = (NSString *)v23;

    v25 = v6;
    assetUUIDWithLocalURL(v7);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (DDS_LOG_REDACTED())
      uniqueIdentifierWithAttributes(v25);
    else
      shortNameWithAttributes(v25);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@::%@"), v27, v26);
    v28 = objc_claimAutoreleasedReturnValue();

    debuggingID = v8->_debuggingID;
    v8->_debuggingID = (NSString *)v28;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p, %@>"), objc_opt_class(), v8, v8->_debuggingID);
    v30 = objc_claimAutoreleasedReturnValue();
    description = v8->_description;
    v8->_description = (NSString *)v30;

  }
  return v8;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;

  -[DDSAsset attributes](self, "attributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  -[DDSAsset localURL](self, "localURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  -[DDSAsset assetUUID](self, "assetUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");

  -[DDSAsset uniqueIdentifier](self, "uniqueIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");

  -[DDSAsset shortName](self, "shortName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hash");

  v13 = v12 ^ -[DDSAsset compatibilityVersion](self, "compatibilityVersion");
  -[DDSAsset locale](self, "locale");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v10 ^ v13 ^ objc_msgSend(v14, "hash");

  -[DDSAsset installDate](self, "installDate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "hash");

  -[DDSAsset debuggingID](self, "debuggingID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v17 ^ objc_msgSend(v18, "hash");

  return v15 ^ v19 ^ -[DDSAsset contentVersion](self, "contentVersion");
}

- (id)description
{
  return objc_getProperty(self, a2, 8, 1);
}

- (unint64_t)assetState
{
  return self->_assetState;
}

- (NSString)dataType
{
  return self->_dataType;
}

- (NSString)assetType
{
  return self->_assetType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debuggingID, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_assetUUID, 0);
  objc_storeStrong((id *)&self->_shortName, 0);
  objc_storeStrong((id *)&self->_installDate, 0);
  objc_storeStrong((id *)&self->_assetType, 0);
  objc_storeStrong((id *)&self->_dataType, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_localURL, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_description, 0);
}

@end
