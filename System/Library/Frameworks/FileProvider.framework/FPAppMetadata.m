@implementation FPAppMetadata

- (void)encodeWithCoder:(id)a3
{
  NSString *bundleID;
  id v5;

  bundleID = self->_bundleID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", bundleID, CFSTR("_bundleID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_displayName, CFSTR("_displayName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_documentsURL, CFSTR("_documentsURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_providerDomainID, CFSTR("_providerDomainID"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_useDefaultProviderDomainID, CFSTR("_useDefaultProviderDomainID"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isManaged, CFSTR("_isManaged"));

}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (NSString)displayName
{
  return self->_displayName;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FPAppMetadata)initWithCoder:(id)a3
{
  id v4;
  FPAppMetadata *v5;
  uint64_t v6;
  NSString *bundleID;
  uint64_t v8;
  NSString *displayName;
  uint64_t v10;
  NSURL *documentsURL;
  uint64_t v12;
  NSString *providerDomainID;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)FPAppMetadata;
  v5 = -[FPAppMetadata init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_bundleID"));
    v6 = objc_claimAutoreleasedReturnValue();
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_displayName"));
    v8 = objc_claimAutoreleasedReturnValue();
    displayName = v5->_displayName;
    v5->_displayName = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_documentsURL"));
    v10 = objc_claimAutoreleasedReturnValue();
    documentsURL = v5->_documentsURL;
    v5->_documentsURL = (NSURL *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_providerDomainID"));
    v12 = objc_claimAutoreleasedReturnValue();
    providerDomainID = v5->_providerDomainID;
    v5->_providerDomainID = (NSString *)v12;

    v5->_useDefaultProviderDomainID = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_useDefaultProviderDomainID"));
    v5->_isManaged = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_isManaged"));
  }

  return v5;
}

- (FPAppMetadata)initWithAppProxy:(id)a3 providerDomainID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  FPAppMetadata *v15;
  FPAppMetadata *v16;
  FPAppMetadata *v17;
  uint64_t v18;
  NSString *providerDomainID;
  void *v20;
  objc_super v22;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "bundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_localizedCustomDisplayNameForAppProxy:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v11 = v9;
  }
  else
  {
    objc_msgSend(v6, "localizedName");
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12 = v11;
  objc_msgSend(v6, "dataContainerURL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "URLByAppendingPathComponent:", CFSTR("Documents"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 && objc_msgSend(v8, "length"))
  {
    v15 = 0;
    if (objc_msgSend(v12, "length") && v14)
    {
      v22.receiver = self;
      v22.super_class = (Class)FPAppMetadata;
      v16 = -[FPAppMetadata init](&v22, sel_init);
      v17 = v16;
      if (v16)
      {
        objc_storeStrong((id *)&v16->_bundleID, v8);
        objc_storeStrong((id *)&v17->_displayName, v12);
        objc_storeStrong((id *)&v17->_documentsURL, v14);
        if (v7)
        {
          objc_storeStrong((id *)&v17->_providerDomainID, a4);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "fp_defaultProviderDomainID");
          v18 = objc_claimAutoreleasedReturnValue();
          providerDomainID = v17->_providerDomainID;
          v17->_providerDomainID = (NSString *)v18;

          v17->_useDefaultProviderDomainID = 1;
        }
        objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v17->_isManaged = objc_msgSend(v20, "isAppManaged:", v8);

      }
      self = v17;
      v15 = self;
    }
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  FPAppMetadata *v4;
  FPAppMetadata *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  _BOOL4 v16;
  _BOOL4 v17;
  _BOOL4 v18;
  void *v19;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;

  v4 = (FPAppMetadata *)a3;
  v5 = v4;
  if (self == v4)
  {
    LOBYTE(v16) = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[FPAppMetadata bundleID](self, "bundleID");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        -[FPAppMetadata bundleID](v5, "bundleID");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v6, "isEqual:", v7))
        {
          LOBYTE(v16) = 0;
LABEL_26:

          goto LABEL_27;
        }
        -[FPAppMetadata displayName](self, "displayName");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[FPAppMetadata displayName](v5, "displayName");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v8, "isEqual:", v9))
        {
          LOBYTE(v16) = 0;
LABEL_25:

          goto LABEL_26;
        }
        -[FPAppMetadata documentsURL](self, "documentsURL");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[FPAppMetadata documentsURL](v5, "documentsURL");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v10, "isEqual:", v11))
        {
          LOBYTE(v16) = 0;
LABEL_24:

          goto LABEL_25;
        }
        -[FPAppMetadata providerDomainID](self, "providerDomainID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[FPAppMetadata providerDomainID](v5, "providerDomainID");
        v13 = objc_claimAutoreleasedReturnValue();
        v14 = (void *)v13;
        if (v12 == (void *)v13)
        {
          v22 = v12;
        }
        else
        {
          v21 = (void *)v13;
          -[FPAppMetadata providerDomainID](self, "providerDomainID");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[FPAppMetadata providerDomainID](v5, "providerDomainID");
          v23 = v15;
          v24 = objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v15, "isEqual:"))
          {
            LOBYTE(v16) = 0;
            v14 = v21;
            v19 = (void *)v24;
LABEL_22:

LABEL_23:
            goto LABEL_24;
          }
          v22 = v12;
          v14 = v21;
        }
        v17 = -[FPAppMetadata useDefaultProviderDomainID](self, "useDefaultProviderDomainID");
        if (v17 == -[FPAppMetadata useDefaultProviderDomainID](v5, "useDefaultProviderDomainID"))
        {
          v18 = -[FPAppMetadata isManaged](self, "isManaged");
          v16 = v18 ^ -[FPAppMetadata isManaged](v5, "isManaged") ^ 1;
        }
        else
        {
          LOBYTE(v16) = 0;
        }
        v12 = v22;
        v19 = (void *)v24;
        if (v22 == v14)
          goto LABEL_23;
        goto LABEL_22;
      }
    }
    LOBYTE(v16) = 0;
  }
LABEL_27:

  return v16;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[FPAppMetadata bundleID](self, "bundleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValue:forKey:", v5, CFSTR("bundleID"));

  -[FPAppMetadata displayName](self, "displayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValue:forKey:", v6, CFSTR("displayName"));

  -[FPAppMetadata documentsURL](self, "documentsURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValue:forKey:", v7, CFSTR("documentsURL"));

  -[FPAppMetadata providerDomainID](self, "providerDomainID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValue:forKey:", v8, CFSTR("providerDomainID"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[FPAppMetadata useDefaultProviderDomainID](self, "useDefaultProviderDomainID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValue:forKey:", v9, CFSTR("useDefaultProviderDomainID"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[FPAppMetadata isManaged](self, "isManaged"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValue:forKey:", v10, CFSTR("isManaged"));

  return v4;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  const __CFString *v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[FPAppMetadata bundleID](self, "bundleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[FPAppMetadata isManaged](self, "isManaged"))
    v6 = CFSTR(" (managed)");
  else
    v6 = CFSTR(" ");
  -[FPAppMetadata displayName](self, "displayName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPAppMetadata providerDomainID](self, "providerDomainID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[FPAppMetadata useDefaultProviderDomainID](self, "useDefaultProviderDomainID");
  v10 = &stru_1E4450B40;
  if (v9)
    v10 = CFSTR("[default]");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p %@%@n:'%@' p:'%@'%@>"), v4, self, v5, v6, v7, v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)findBundleIDForCurrentPlatformInSet:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    if (objc_msgSend(v3, "count") == 1)
    {
      objc_msgSend(v3, "anyObject");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 0u;
      v27 = 0u;
      v28 = 0u;
      v29 = 0u;
      v25 = v3;
      v7 = v3;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v27;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v27 != v10)
              objc_enumerationMutation(v7);
            v12 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
            objc_msgSend(v12, "rangeOfString:options:", CFSTR("mobile"), 1);
            v13 = v5;
            if (v14)
              goto LABEL_18;
            objc_msgSend(v12, "rangeOfString:options:", CFSTR("ios"), 1);
            v13 = v5;
            if (v15)
              goto LABEL_18;
            objc_msgSend(v12, "rangeOfString:options:", CFSTR("ipad"), 1);
            v13 = v5;
            if (v16)
              goto LABEL_18;
            objc_msgSend(v12, "rangeOfString:options:", CFSTR("touch"), 1);
            v13 = v5;
            if (v17)
              goto LABEL_18;
            v18 = objc_msgSend(v12, "containsString:", CFSTR(".iWork."));
            v13 = v6;
            if ((v18 & 1) == 0)
            {
              v19 = objc_msgSend(v12, "containsString:", CFSTR(".iMovieApp"));
              v13 = v6;
              if ((v19 & 1) == 0)
              {
                objc_msgSend(v12, "rangeOfString:options:", CFSTR("mac"), 1);
                v13 = v6;
                if (!v20)
                {
                  objc_msgSend(v12, "rangeOfString:options:", CFSTR("osx"), 1);
                  v13 = v6;
                  if (!v21)
                    continue;
                }
              }
            }
LABEL_18:
            objc_msgSend(v13, "addObject:", v12);
          }
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
        }
        while (v9);
      }

      if (objc_msgSend(v5, "count"))
      {
        objc_msgSend(v5, "anyObject");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v22 = (void *)objc_msgSend(v7, "mutableCopy");
        objc_msgSend(v22, "minusSet:", v6);
        if (objc_msgSend(v22, "count"))
          v23 = v22;
        else
          v23 = v7;
        objc_msgSend(v23, "anyObject");
        v4 = (void *)objc_claimAutoreleasedReturnValue();

      }
      v3 = v25;
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)_localizedCustomDisplayNameForAppProxy:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;

  v4 = a3;
  if (v4)
  {
    objc_msgSend(v4, "objectForInfoDictionaryKey:ofClass:", CFSTR("NSUbiquitousContainers"), objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && ((objc_msgSend(a1, "_entitledCloudDocsContainerIDForAppProxy:", v4),
           (v6 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
       || (objc_msgSend(a1, "_entitledUbiquityContainerIDForAppProxy:", v4),
           (v6 = (void *)objc_claimAutoreleasedReturnValue()) != 0)))
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("NSUbiquitousContainerName"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("NSUbiquitousContainerName"));
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "localizedValuesForKeys:fromTable:", v9, CFSTR("InfoPlist"));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "stringForKey:", CFSTR("NSUbiquitousContainerName"));
          v11 = objc_claimAutoreleasedReturnValue();
          v12 = (void *)v11;
          if (v11)
            v13 = (void *)v11;
          else
            v13 = v8;
          v14 = v13;

        }
        else
        {
          v14 = 0;
        }

      }
      else
      {
        v14 = 0;
      }

    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (BOOL)_isContainerIDPermitted:(id)a3
{
  id v3;
  void *v4;
  int v5;

  v3 = a3;
  v4 = v3;
  if (_isContainerIDPermitted__onceToken != -1)
  {
    dispatch_once(&_isContainerIDPermitted__onceToken, &__block_literal_global_38);
    if (v4)
      goto LABEL_3;
LABEL_5:
    LOBYTE(v5) = 0;
    goto LABEL_6;
  }
  if (!v3)
    goto LABEL_5;
LABEL_3:
  v5 = objc_msgSend((id)_isContainerIDPermitted__prohibitedContainerIDs, "containsObject:", v4) ^ 1;
LABEL_6:

  return v5;
}

void __41__FPAppMetadata__isContainerIDPermitted___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("com.apple.CloudDocs"), CFSTR("com.apple.Desktop"), CFSTR("com.apple.Documents"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_isContainerIDPermitted__prohibitedContainerIDs;
  _isContainerIDPermitted__prohibitedContainerIDs = v0;

}

+ (id)_entitledCloudDocsContainerIDForAppProxy:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;

  v4 = a3;
  v5 = objc_opt_class();
  objc_msgSend(v4, "entitlementValueForKey:ofClass:valuesOfClass:", CFSTR("com.apple.developer.icloud-services"), v5, objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6 && objc_msgSend(v6, "containsObject:", CFSTR("CloudDocuments")))
  {
    v8 = objc_opt_class();
    objc_msgSend(v4, "entitlementValueForKey:ofClass:valuesOfClass:", CFSTR("com.apple.developer.icloud-container-identifiers"), v8, objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      objc_msgSend(v9, "firstObject");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        if (objc_msgSend(a1, "_isContainerIDPermitted:", v11))
          v12 = v11;
        else
          v12 = 0;
        v13 = v12;
        goto LABEL_12;
      }
    }
    else
    {
      objc_msgSend(v4, "entitlementValueForKey:ofClass:", CFSTR("application-identifier"), objc_opt_class());
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        objc_msgSend(CFSTR("iCloud."), "stringByAppendingString:", v11);
        v13 = (id)objc_claimAutoreleasedReturnValue();
LABEL_12:
        v14 = v13;
LABEL_14:

        goto LABEL_15;
      }
    }
    v14 = 0;
    goto LABEL_14;
  }
  v14 = 0;
LABEL_15:

  return v14;
}

+ (id)_entitledUbiquityContainerIDForAppProxy:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  v5 = objc_opt_class();
  objc_msgSend(v4, "entitlementValueForKey:ofClass:valuesOfClass:", CFSTR("com.apple.developer.ubiquity-container-identifiers"), v5, objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      if (objc_msgSend(a1, "_isContainerIDPermitted:", v7))
        v8 = v7;
      else
        v8 = 0;
      v9 = v8;
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)setDisplayName:(id)a3
{
  objc_storeStrong((id *)&self->_displayName, a3);
}

- (NSURL)documentsURL
{
  return self->_documentsURL;
}

- (NSString)providerDomainID
{
  return self->_providerDomainID;
}

- (void)setProviderDomainID:(id)a3
{
  objc_storeStrong((id *)&self->_providerDomainID, a3);
}

- (BOOL)isManaged
{
  return self->_isManaged;
}

- (BOOL)useDefaultProviderDomainID
{
  return self->_useDefaultProviderDomainID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_providerDomainID, 0);
  objc_storeStrong((id *)&self->_documentsURL, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end
