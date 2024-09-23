@implementation FCOngoingPurchaseEntry

- (FCOngoingPurchaseEntry)initWithEntryID:(id)a3 tagID:(id)a4 purchaseID:(id)a5 productID:(id)a6 bundleID:(id)a7 webAccessOptIn:(BOOL)a8 appAdamID:(id)a9 storeExternalVersion:(id)a10 vendorIdentifier:(id)a11 purchaseInitiatedTime:(id)a12 price:(id)a13
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  FCOngoingPurchaseEntry *v26;
  FCOngoingPurchaseEntry *v27;
  uint64_t v28;
  NSString *identifier;
  uint64_t v30;
  NSString *tagID;
  uint64_t v32;
  NSString *purchaseID;
  uint64_t v34;
  NSString *productID;
  uint64_t v36;
  NSString *bundleID;
  uint64_t v38;
  NSNumber *appAdamID;
  uint64_t v40;
  NSNumber *storeExternalVersion;
  uint64_t v42;
  NSString *vendorIdentifier;
  uint64_t v44;
  NSDate *purchaseInitiatedTime;
  uint64_t v46;
  void *price;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  id v55;
  objc_super v56;
  uint8_t buf[4];
  const char *v58;
  __int16 v59;
  char *v60;
  __int16 v61;
  int v62;
  __int16 v63;
  void *v64;
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a6;
  v55 = a7;
  v21 = a9;
  v22 = a10;
  v23 = a11;
  v24 = a12;
  v25 = a13;
  if (!v17 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v49 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("ongoing purchase entry must have an identifier"));
    *(_DWORD *)buf = 136315906;
    v58 = "-[FCOngoingPurchaseEntry initWithEntryID:tagID:purchaseID:productID:bundleID:webAccessOptIn:appAdamID:storeExt"
          "ernalVersion:vendorIdentifier:purchaseInitiatedTime:price:]";
    v59 = 2080;
    v60 = "FCOngoingPurchaseEntry.m";
    v61 = 1024;
    v62 = 53;
    v63 = 2114;
    v64 = v49;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v18)
      goto LABEL_6;
  }
  else if (v18)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v50 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("ongoing purchase entry must have an tag ID"));
    *(_DWORD *)buf = 136315906;
    v58 = "-[FCOngoingPurchaseEntry initWithEntryID:tagID:purchaseID:productID:bundleID:webAccessOptIn:appAdamID:storeExt"
          "ernalVersion:vendorIdentifier:purchaseInitiatedTime:price:]";
    v59 = 2080;
    v60 = "FCOngoingPurchaseEntry.m";
    v61 = 1024;
    v62 = 54;
    v63 = 2114;
    v64 = v50;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
LABEL_6:
  if (!v20 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v51 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("ongoing purchase entry must have an product identifier"));
    *(_DWORD *)buf = 136315906;
    v58 = "-[FCOngoingPurchaseEntry initWithEntryID:tagID:purchaseID:productID:bundleID:webAccessOptIn:appAdamID:storeExt"
          "ernalVersion:vendorIdentifier:purchaseInitiatedTime:price:]";
    v59 = 2080;
    v60 = "FCOngoingPurchaseEntry.m";
    v61 = 1024;
    v62 = 55;
    v63 = 2114;
    v64 = v51;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v19)
      goto LABEL_11;
  }
  else if (v19)
  {
    goto LABEL_11;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v52 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("ongoing purchase entry must have an purchase ID"));
    *(_DWORD *)buf = 136315906;
    v58 = "-[FCOngoingPurchaseEntry initWithEntryID:tagID:purchaseID:productID:bundleID:webAccessOptIn:appAdamID:storeExt"
          "ernalVersion:vendorIdentifier:purchaseInitiatedTime:price:]";
    v59 = 2080;
    v60 = "FCOngoingPurchaseEntry.m";
    v61 = 1024;
    v62 = 56;
    v63 = 2114;
    v64 = v52;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
LABEL_11:
  v56.receiver = self;
  v56.super_class = (Class)FCOngoingPurchaseEntry;
  v26 = -[FCOngoingPurchaseEntry init](&v56, sel_init);
  v27 = v26;
  if (v26)
  {
    if (v17)
    {
      v28 = objc_msgSend(v17, "copy");
      identifier = v27->_identifier;
      v27->_identifier = (NSString *)v28;

      v30 = objc_msgSend(v18, "copy");
      tagID = v27->_tagID;
      v27->_tagID = (NSString *)v30;

      v32 = objc_msgSend(v19, "copy");
      purchaseID = v27->_purchaseID;
      v27->_purchaseID = (NSString *)v32;

      v34 = objc_msgSend(v20, "copy");
      productID = v27->_productID;
      v27->_productID = (NSString *)v34;

      v36 = objc_msgSend(v55, "copy");
      bundleID = v27->_bundleID;
      v27->_bundleID = (NSString *)v36;

      v38 = objc_msgSend(v21, "copy");
      appAdamID = v27->_appAdamID;
      v27->_appAdamID = (NSNumber *)v38;

      v27->_webAccessOptIn = a8;
      v40 = objc_msgSend(v22, "copy");
      storeExternalVersion = v27->_storeExternalVersion;
      v27->_storeExternalVersion = (NSNumber *)v40;

      v42 = objc_msgSend(v23, "copy");
      vendorIdentifier = v27->_vendorIdentifier;
      v27->_vendorIdentifier = (NSString *)v42;

      v44 = objc_msgSend(v24, "copy");
      purchaseInitiatedTime = v27->_purchaseInitiatedTime;
      v27->_purchaseInitiatedTime = (NSDate *)v44;

      v46 = objc_msgSend(v25, "copy");
      price = v27->_price;
      v27->_price = (NSNumber *)v46;
    }
    else
    {
      price = v26;
      v27 = 0;
    }

  }
  return v27;
}

- (FCOngoingPurchaseEntry)initWithEntryID:(id)a3 dictionaryRepresentation:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  unsigned int v16;
  void *v17;
  void *v18;
  void *v19;
  FCOngoingPurchaseEntry *v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (!v5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("ongoing purchase entry must have an identifier"));
    *(_DWORD *)buf = 136315906;
    v23 = "-[FCOngoingPurchaseEntry initWithEntryID:dictionaryRepresentation:]";
    v24 = 2080;
    v25 = "FCOngoingPurchaseEntry.m";
    v26 = 1024;
    v27 = 84;
    v28 = 2114;
    v29 = v15;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("OngoingPurchaseEntryTagID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("OngoingPurchaseEntryPurchaseID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("OngoingPurchaseEntryPurchaseAppAdamID"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("OngoingPurchaseEntryProductID"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("OngoingPurchaseEntryBundleIDKey"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("OngoingPurchaseEntryStoreExternalVersion"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("OngoingPurchaseEntryVendorIdentifier"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("OngoingPurchaseEntryHasWebOptIn"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v11, "BOOLValue");

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("OngoingPurchaseEntryPurchaseInitiatedTime"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("OngoingPurchaseEntryPurchasePrice"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[FCOngoingPurchaseEntry initWithEntryID:tagID:purchaseID:productID:bundleID:webAccessOptIn:appAdamID:storeExternalVersion:vendorIdentifier:purchaseInitiatedTime:price:](self, "initWithEntryID:tagID:purchaseID:productID:bundleID:webAccessOptIn:appAdamID:storeExternalVersion:vendorIdentifier:purchaseInitiatedTime:price:", v5, v7, v8, v19, v18, v16, v17, v9, v10, v12, v13);

  return v21;
}

- (id)dictionaryRepresentation
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[FCOngoingPurchaseEntry webAccessOptIn](self, "webAccessOptIn"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("OngoingPurchaseEntryHasWebOptIn"));

  -[FCOngoingPurchaseEntry tagID](self, "tagID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fc_safelySetObjectAllowingNil:forKey:", v5, CFSTR("OngoingPurchaseEntryTagID"));

  -[FCOngoingPurchaseEntry purchaseID](self, "purchaseID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fc_safelySetObjectAllowingNil:forKey:", v6, CFSTR("OngoingPurchaseEntryPurchaseID"));

  -[FCOngoingPurchaseEntry productID](self, "productID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fc_safelySetObjectAllowingNil:forKey:", v7, CFSTR("OngoingPurchaseEntryProductID"));

  -[FCOngoingPurchaseEntry bundleID](self, "bundleID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fc_safelySetObjectAllowingNil:forKey:", v8, CFSTR("OngoingPurchaseEntryBundleIDKey"));

  -[FCOngoingPurchaseEntry appAdamID](self, "appAdamID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fc_safelySetObjectAllowingNil:forKey:", v9, CFSTR("OngoingPurchaseEntryPurchaseAppAdamID"));

  -[FCOngoingPurchaseEntry storeExternalVersion](self, "storeExternalVersion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fc_safelySetObjectAllowingNil:forKey:", v10, CFSTR("OngoingPurchaseEntryStoreExternalVersion"));

  -[FCOngoingPurchaseEntry vendorIdentifier](self, "vendorIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fc_safelySetObjectAllowingNil:forKey:", v11, CFSTR("OngoingPurchaseEntryVendorIdentifier"));

  -[FCOngoingPurchaseEntry purchaseInitiatedTime](self, "purchaseInitiatedTime");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fc_safelySetObjectAllowingNil:forKey:", v12, CFSTR("OngoingPurchaseEntryPurchaseInitiatedTime"));

  -[FCOngoingPurchaseEntry price](self, "price");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fc_safelySetObjectAllowingNil:forKey:", v13, CFSTR("OngoingPurchaseEntryPurchasePrice"));

  v14 = (void *)objc_msgSend(v3, "copy");
  return v14;
}

+ (id)dummyOngoingPurchaseEntryWithTagID:(id)a3
{
  id v3;
  FCOngoingPurchaseEntry *v4;
  void *v5;
  void *v6;
  void *v7;
  FCOngoingPurchaseEntry *v8;

  v3 = a3;
  v4 = [FCOngoingPurchaseEntry alloc];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 111);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 111);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[FCOngoingPurchaseEntry initWithEntryID:tagID:purchaseID:productID:bundleID:webAccessOptIn:appAdamID:storeExternalVersion:vendorIdentifier:purchaseInitiatedTime:price:](v4, "initWithEntryID:tagID:purchaseID:productID:bundleID:webAccessOptIn:appAdamID:storeExternalVersion:vendorIdentifier:purchaseInitiatedTime:price:", CFSTR("entryID"), v3, CFSTR("purchaseID"), CFSTR("productID"), CFSTR("bundleID"), 0, v5, v6, CFSTR("vendorIdentifier"), 0, v7);

  return v8;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)tagID
{
  return self->_tagID;
}

- (void)setTagID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)purchaseID
{
  return self->_purchaseID;
}

- (void)setPurchaseID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)productID
{
  return self->_productID;
}

- (void)setProductID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (BOOL)webAccessOptIn
{
  return self->_webAccessOptIn;
}

- (void)setWebAccessOptIn:(BOOL)a3
{
  self->_webAccessOptIn = a3;
}

- (NSNumber)appAdamID
{
  return self->_appAdamID;
}

- (void)setAppAdamID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSNumber)storeExternalVersion
{
  return self->_storeExternalVersion;
}

- (void)setStoreExternalVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)vendorIdentifier
{
  return self->_vendorIdentifier;
}

- (void)setVendorIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSDate)purchaseInitiatedTime
{
  return self->_purchaseInitiatedTime;
}

- (void)setPurchaseInitiatedTime:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSNumber)price
{
  return self->_price;
}

- (void)setPrice:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_price, 0);
  objc_storeStrong((id *)&self->_purchaseInitiatedTime, 0);
  objc_storeStrong((id *)&self->_vendorIdentifier, 0);
  objc_storeStrong((id *)&self->_storeExternalVersion, 0);
  objc_storeStrong((id *)&self->_appAdamID, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_productID, 0);
  objc_storeStrong((id *)&self->_purchaseID, 0);
  objc_storeStrong((id *)&self->_tagID, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
