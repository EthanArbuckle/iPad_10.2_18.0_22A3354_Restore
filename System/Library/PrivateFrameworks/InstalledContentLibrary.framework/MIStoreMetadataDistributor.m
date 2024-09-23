@implementation MIStoreMetadataDistributor

- (MIStoreMetadataDistributor)initWithCoder:(id)a3
{
  id v4;
  MIStoreMetadataDistributor *v5;
  uint64_t v6;
  NSString *distributorID;
  uint64_t v8;
  NSString *accountID;
  uint64_t v10;
  NSString *domain;
  uint64_t v12;
  NSURL *supportPageURL;
  uint64_t v14;
  NSURL *sourceURL;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSDictionary *localizedDistributorName;
  uint64_t v21;
  NSString *developerID;
  uint64_t v23;
  NSString *developerName;
  uint64_t v25;
  NSURL *shareURL;

  v4 = a3;
  v5 = -[MIStoreMetadataDistributor init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("distributorID"));
    v6 = objc_claimAutoreleasedReturnValue();
    distributorID = v5->_distributorID;
    v5->_distributorID = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accountID"));
    v8 = objc_claimAutoreleasedReturnValue();
    accountID = v5->_accountID;
    v5->_accountID = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("domain"));
    v10 = objc_claimAutoreleasedReturnValue();
    domain = v5->_domain;
    v5->_domain = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("supportPageURL"));
    v12 = objc_claimAutoreleasedReturnValue();
    supportPageURL = v5->_supportPageURL;
    v5->_supportPageURL = (NSURL *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sourceURL"));
    v14 = objc_claimAutoreleasedReturnValue();
    sourceURL = v5->_sourceURL;
    v5->_sourceURL = (NSURL *)v14;

    v16 = (void *)MEMORY[0x1E0C99E60];
    v17 = objc_opt_class();
    objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("localizedDistributorName"));
    v19 = objc_claimAutoreleasedReturnValue();
    localizedDistributorName = v5->_localizedDistributorName;
    v5->_localizedDistributorName = (NSDictionary *)v19;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("developerID"));
    v21 = objc_claimAutoreleasedReturnValue();
    developerID = v5->_developerID;
    v5->_developerID = (NSString *)v21;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("developerName"));
    v23 = objc_claimAutoreleasedReturnValue();
    developerName = v5->_developerName;
    v5->_developerName = (NSString *)v23;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("shareURL"));
    v25 = objc_claimAutoreleasedReturnValue();
    shareURL = v5->_shareURL;
    v5->_shareURL = (NSURL *)v25;

  }
  return v5;
}

- (BOOL)distributorIsThirdParty
{
  return -[MIStoreMetadataDistributor distributorType](self, "distributorType") == -1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v4 = a3;
  -[MIStoreMetadataDistributor distributorID](self, "distributorID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("distributorID"));

  -[MIStoreMetadataDistributor accountID](self, "accountID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("accountID"));

  -[MIStoreMetadataDistributor domain](self, "domain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("domain"));

  -[MIStoreMetadataDistributor supportPageURL](self, "supportPageURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("supportPageURL"));

  -[MIStoreMetadataDistributor sourceURL](self, "sourceURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("sourceURL"));

  -[MIStoreMetadataDistributor localizedDistributorName](self, "localizedDistributorName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("localizedDistributorName"));

  -[MIStoreMetadataDistributor developerID](self, "developerID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("developerID"));

  -[MIStoreMetadataDistributor developerName](self, "developerName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("developerName"));

  -[MIStoreMetadataDistributor shareURL](self, "shareURL");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("shareURL"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[MIStoreMetadataDistributor distributorID](self, "distributorID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  objc_msgSend(v5, "setDistributorID:", v7);

  -[MIStoreMetadataDistributor accountID](self, "accountID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copyWithZone:", a3);
  objc_msgSend(v5, "setAccountID:", v9);

  -[MIStoreMetadataDistributor domain](self, "domain");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copyWithZone:", a3);
  objc_msgSend(v5, "setDomain:", v11);

  -[MIStoreMetadataDistributor supportPageURL](self, "supportPageURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "copyWithZone:", a3);
  objc_msgSend(v5, "setSupportPageURL:", v13);

  -[MIStoreMetadataDistributor sourceURL](self, "sourceURL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "copyWithZone:", a3);
  objc_msgSend(v5, "setSourceURL:", v15);

  -[MIStoreMetadataDistributor localizedDistributorName](self, "localizedDistributorName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v16, "copyWithZone:", a3);
  objc_msgSend(v5, "setLocalizedDistributorName:", v17);

  -[MIStoreMetadataDistributor developerID](self, "developerID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v18, "copyWithZone:", a3);
  objc_msgSend(v5, "setDeveloperID:", v19);

  -[MIStoreMetadataDistributor developerName](self, "developerName");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v20, "copyWithZone:", a3);
  objc_msgSend(v5, "setDeveloperName:", v21);

  -[MIStoreMetadataDistributor shareURL](self, "shareURL");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v22, "copyWithZone:", a3);
  objc_msgSend(v5, "setShareURL:", v23);

  return v5;
}

- (NSURL)supportPageURL
{
  return self->_supportPageURL;
}

- (NSURL)sourceURL
{
  return self->_sourceURL;
}

- (NSDictionary)localizedDistributorName
{
  return self->_localizedDistributorName;
}

- (NSString)domain
{
  return self->_domain;
}

- (NSString)developerName
{
  return self->_developerName;
}

- (NSString)developerID
{
  return self->_developerID;
}

- (NSString)accountID
{
  return self->_accountID;
}

- (void)setSupportPageURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setSourceURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)setDomain:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setDeveloperID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void)setAccountID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (unint64_t)distributorType
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[MIStoreMetadataDistributor distributorID](self, "distributorID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    if ((objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.AppStore")) & 1) != 0)
    {
      v4 = 1;
    }
    else if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.TestFlight")))
    {
      v4 = 2;
    }
    else
    {
      v4 = -1;
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (NSString)distributorID
{
  return self->_distributorID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shareURL, 0);
  objc_storeStrong((id *)&self->_developerName, 0);
  objc_storeStrong((id *)&self->_developerID, 0);
  objc_storeStrong((id *)&self->_localizedDistributorName, 0);
  objc_storeStrong((id *)&self->_sourceURL, 0);
  objc_storeStrong((id *)&self->_supportPageURL, 0);
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_accountID, 0);
  objc_storeStrong((id *)&self->_distributorID, 0);
}

- (MIStoreMetadataDistributor)initWithDictionary:(id)a3
{
  id v4;
  MIStoreMetadataDistributor *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  NSURL *supportPageURL;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  NSURL *sourceURL;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  uint64_t v27;
  NSURL *shareURL;
  uint64_t v30;

  v4 = a3;
  v5 = -[MIStoreMetadataDistributor init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", distributorID);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[MIStoreMetadataDistributor setDistributorID:](v5, "setDistributorID:", v6);
    }
    else if (v6 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
    {
      v30 = distributorID;
      MOLogWrite();
    }

    objc_msgSend(v4, "objectForKeyedSubscript:", accountID);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[MIStoreMetadataDistributor setAccountID:](v5, "setAccountID:", v7);
    }
    else if (v7 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
    {
      v30 = accountID;
      MOLogWrite();
    }

    objc_msgSend(v4, "objectForKeyedSubscript:", domain);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[MIStoreMetadataDistributor setDomain:](v5, "setDomain:", v8);
    }
    else if (v8 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
    {
      v30 = domain;
      MOLogWrite();
    }

    objc_msgSend(v4, "objectForKeyedSubscript:", ::supportPageURL);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v10 = v9;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = v10;
    else
      v11 = 0;

    if (v11)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v11);
      v12 = objc_claimAutoreleasedReturnValue();
      supportPageURL = v5->_supportPageURL;
      v5->_supportPageURL = (NSURL *)v12;

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", ::sourceURL, v30);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v15 = v14;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v16 = v15;
    else
      v16 = 0;

    if (v16)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v16);
      v17 = objc_claimAutoreleasedReturnValue();
      sourceURL = v5->_sourceURL;
      v5->_sourceURL = (NSURL *)v17;

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", localizedDistributorName);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      v20 = objc_opt_class();
      v21 = objc_opt_class();
      if (MIDictionaryContainsOnlyClasses(v19, v20, v21))
      {
        -[MIStoreMetadataDistributor setLocalizedDistributorName:](v5, "setLocalizedDistributorName:", v19);
      }
      else if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
      {
        MOLogWrite();
      }
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", developerID);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[MIStoreMetadataDistributor setDeveloperID:](v5, "setDeveloperID:", v22);
    }
    else if (v22 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
    {
      MOLogWrite();
    }

    objc_msgSend(v4, "objectForKeyedSubscript:", developerName);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[MIStoreMetadataDistributor setDeveloperName:](v5, "setDeveloperName:", v23);
    }
    else if (v23 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
    {
      MOLogWrite();
    }

    objc_msgSend(v4, "objectForKeyedSubscript:", ::shareURL);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v25 = v24;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v26 = v25;
    else
      v26 = 0;

    if (v26)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v26);
      v27 = objc_claimAutoreleasedReturnValue();
      shareURL = v5->_shareURL;
      v5->_shareURL = (NSURL *)v27;

    }
  }

  return v5;
}

- (void)setLocalizedDistributorName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void)setDistributorID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void)setDeveloperName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSDictionary)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v3 = (void *)objc_opt_new();
  -[MIStoreMetadataDistributor distributorID](self, "distributorID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, distributorID);

  -[MIStoreMetadataDistributor accountID](self, "accountID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, accountID);

  -[MIStoreMetadataDistributor domain](self, "domain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, domain);

  -[MIStoreMetadataDistributor localizedDistributorName](self, "localizedDistributorName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, localizedDistributorName);

  -[MIStoreMetadataDistributor supportPageURL](self, "supportPageURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "absoluteString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, supportPageURL);

  }
  -[MIStoreMetadataDistributor sourceURL](self, "sourceURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "absoluteString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, sourceURL);

  }
  -[MIStoreMetadataDistributor developerID](self, "developerID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, developerID);

  -[MIStoreMetadataDistributor developerName](self, "developerName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, developerName);

  -[MIStoreMetadataDistributor shareURL](self, "shareURL");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v16)
  {
    objc_msgSend(v16, "absoluteString");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, shareURL);

  }
  v19 = (void *)objc_msgSend(v3, "copy");

  return (NSDictionary *)v19;
}

- (BOOL)isEqual:(id)a3
{
  MIStoreMetadataDistributor *v4;
  MIStoreMetadataDistributor *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
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

  v4 = (MIStoreMetadataDistributor *)a3;
  if (self == v4)
  {
    v20 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[MIStoreMetadataDistributor distributorID](self, "distributorID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[MIStoreMetadataDistributor distributorID](v5, "distributorID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (MICompareObjects(v6, v7))
      {
        -[MIStoreMetadataDistributor accountID](self, "accountID");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[MIStoreMetadataDistributor accountID](v5, "accountID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (MICompareObjects(v8, v9))
        {
          -[MIStoreMetadataDistributor domain](self, "domain");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[MIStoreMetadataDistributor domain](v5, "domain");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (MICompareObjects(v10, v11))
          {
            -[MIStoreMetadataDistributor supportPageURL](self, "supportPageURL");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            -[MIStoreMetadataDistributor supportPageURL](v5, "supportPageURL");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = v12;
            if (MICompareObjects(v12, v31))
            {
              -[MIStoreMetadataDistributor sourceURL](self, "sourceURL");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              -[MIStoreMetadataDistributor sourceURL](v5, "sourceURL");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              v30 = v13;
              if (MICompareObjects(v13, v29))
              {
                -[MIStoreMetadataDistributor localizedDistributorName](self, "localizedDistributorName");
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                -[MIStoreMetadataDistributor localizedDistributorName](v5, "localizedDistributorName");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                v28 = v14;
                if (MICompareObjects(v14, v27))
                {
                  -[MIStoreMetadataDistributor developerID](self, "developerID");
                  v15 = (void *)objc_claimAutoreleasedReturnValue();
                  -[MIStoreMetadataDistributor developerID](v5, "developerID");
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  v26 = v15;
                  if (MICompareObjects(v15, v25))
                  {
                    -[MIStoreMetadataDistributor developerName](self, "developerName");
                    v16 = objc_claimAutoreleasedReturnValue();
                    -[MIStoreMetadataDistributor developerName](v5, "developerName");
                    v17 = (void *)objc_claimAutoreleasedReturnValue();
                    v24 = (void *)v16;
                    v18 = (void *)v16;
                    v19 = v17;
                    if (MICompareObjects(v18, v17))
                    {
                      -[MIStoreMetadataDistributor shareURL](self, "shareURL");
                      v23 = (void *)objc_claimAutoreleasedReturnValue();
                      -[MIStoreMetadataDistributor shareURL](v5, "shareURL");
                      v22 = (void *)objc_claimAutoreleasedReturnValue();
                      v20 = MICompareObjects(v23, v22);

                    }
                    else
                    {
                      v20 = 0;
                    }

                  }
                  else
                  {
                    v20 = 0;
                  }

                }
                else
                {
                  v20 = 0;
                }

              }
              else
              {
                v20 = 0;
              }

            }
            else
            {
              v20 = 0;
            }

          }
          else
          {
            v20 = 0;
          }

        }
        else
        {
          v20 = 0;
        }

      }
      else
      {
        v20 = 0;
      }

    }
    else
    {
      v20 = 0;
    }
  }

  return v20;
}

- (unint64_t)hash
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  unint64_t v19;
  void *v21;

  -[MIStoreMetadataDistributor distributorID](self, "distributorID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v21, "hash");
  -[MIStoreMetadataDistributor accountID](self, "accountID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;
  -[MIStoreMetadataDistributor domain](self, "domain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hash");
  -[MIStoreMetadataDistributor supportPageURL](self, "supportPageURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v5 ^ v7 ^ objc_msgSend(v8, "hash");
  -[MIStoreMetadataDistributor sourceURL](self, "sourceURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hash");
  -[MIStoreMetadataDistributor localizedDistributorName](self, "localizedDistributorName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v11 ^ objc_msgSend(v12, "hash");
  -[MIStoreMetadataDistributor developerID](self, "developerID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v9 ^ v13 ^ objc_msgSend(v14, "hash");
  -[MIStoreMetadataDistributor developerName](self, "developerName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "hash");
  -[MIStoreMetadataDistributor shareURL](self, "shareURL");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v15 ^ v17 ^ objc_msgSend(v18, "hash");

  return v19;
}

- (id)description
{
  void *v2;
  void *v3;

  -[MIStoreMetadataDistributor dictionaryRepresentation](self, "dictionaryRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)distributorIsFirstPartyApple
{
  return -[MIStoreMetadataDistributor distributorType](self, "distributorType") - 1 < 2;
}

- (NSString)distributorNameForCurrentLocale
{
  void *v3;
  void *v4;
  void *v5;
  const __CFArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[MIStoreMetadataDistributor localizedDistributorName](self, "localizedDistributorName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIStoreMetadataDistributor localizedDistributorName](self, "localizedDistributorName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v5, "count"))
    goto LABEL_11;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = CFBundleCopyLocalizationsForPreferences((CFArrayRef)v5, 0);
  v7 = -[__CFArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    while (2)
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(v3, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10), (_QWORD)v14);
        v11 = objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          v12 = (void *)v11;

          goto LABEL_13;
        }
        ++v10;
      }
      while (v8 != v10);
      v8 = -[__CFArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v8)
        continue;
      break;
    }
  }

  objc_msgSend(v3, "objectForKeyedSubscript:", &stru_1E6CC0B98);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
LABEL_11:
    -[MIStoreMetadataDistributor distributorID](self, "distributorID", (_QWORD)v14);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
LABEL_13:

  return (NSString *)v12;
}

- (NSURL)shareURL
{
  return self->_shareURL;
}

- (void)setShareURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

@end
