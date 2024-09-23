@implementation FCBundleSubscriptionLookUpEntry

- (FCBundleSubscriptionLookUpEntry)initWithEntryID:(id)a3 bundleChannelIDs:(id)a4 bundleChannelIDsVersion:(id)a5 purchaseID:(id)a6 purchaseValidationState:(unint64_t)a7 dateOfExpiration:(id)a8 hasShownRenewalNotice:(BOOL)a9 inTrialPeriod:(BOOL)a10 isPurchaser:(BOOL)a11 servicesBundlePurchaseID:(id)a12 isAmplifyUser:(BOOL)a13 isPaidBundleViaOfferActivated:(BOOL)a14 initialPurchaseTimestamp:(id)a15
{
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  FCBundleSubscriptionLookUpEntry *v28;
  FCBundleSubscriptionLookUpEntry *v29;
  uint64_t v30;
  NSString *identifier;
  uint64_t v32;
  NSArray *bundleChannelIDs;
  uint64_t v34;
  NSString *bundleChannelIDsVersion;
  uint64_t v36;
  NSString *purchaseID;
  uint64_t v38;
  NSDate *dateOfExpiration;
  uint64_t v40;
  NSString *servicesBundlePurchaseID;
  uint64_t v42;
  void *initialPurchaseTimestamp;
  void *v45;
  void *v46;
  objc_super v47;
  uint8_t buf[4];
  const char *v49;
  __int16 v50;
  char *v51;
  __int16 v52;
  int v53;
  __int16 v54;
  void *v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v21 = a3;
  v22 = a4;
  v23 = a5;
  v24 = a6;
  v25 = a8;
  v26 = a12;
  v27 = a15;
  if (!v21 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v45 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("bundle subscription lookup entry must have an identifier"));
    *(_DWORD *)buf = 136315906;
    v49 = "-[FCBundleSubscriptionLookUpEntry initWithEntryID:bundleChannelIDs:bundleChannelIDsVersion:purchaseID:purchase"
          "ValidationState:dateOfExpiration:hasShownRenewalNotice:inTrialPeriod:isPurchaser:servicesBundlePurchaseID:isAm"
          "plifyUser:isPaidBundleViaOfferActivated:initialPurchaseTimestamp:]";
    v50 = 2080;
    v51 = "FCBundleSubscriptionLookUpEntry.m";
    v52 = 1024;
    v53 = 63;
    v54 = 2114;
    v55 = v45;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v22)
      goto LABEL_6;
  }
  else if (v22)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v46 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("bundle subscription lookup entry must have an array of bundle tag IDs"));
    *(_DWORD *)buf = 136315906;
    v49 = "-[FCBundleSubscriptionLookUpEntry initWithEntryID:bundleChannelIDs:bundleChannelIDsVersion:purchaseID:purchase"
          "ValidationState:dateOfExpiration:hasShownRenewalNotice:inTrialPeriod:isPurchaser:servicesBundlePurchaseID:isAm"
          "plifyUser:isPaidBundleViaOfferActivated:initialPurchaseTimestamp:]";
    v50 = 2080;
    v51 = "FCBundleSubscriptionLookUpEntry.m";
    v52 = 1024;
    v53 = 64;
    v54 = 2114;
    v55 = v46;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
LABEL_6:
  v47.receiver = self;
  v47.super_class = (Class)FCBundleSubscriptionLookUpEntry;
  v28 = -[FCBundleSubscriptionLookUpEntry init](&v47, sel_init);
  v29 = v28;
  if (v28)
  {
    if (v21)
    {
      v30 = objc_msgSend(v21, "copy");
      identifier = v29->_identifier;
      v29->_identifier = (NSString *)v30;

      v32 = objc_msgSend(v22, "copy");
      bundleChannelIDs = v29->_bundleChannelIDs;
      v29->_bundleChannelIDs = (NSArray *)v32;

      v34 = objc_msgSend(v23, "copy");
      bundleChannelIDsVersion = v29->_bundleChannelIDsVersion;
      v29->_bundleChannelIDsVersion = (NSString *)v34;

      v36 = objc_msgSend(v24, "copy");
      purchaseID = v29->_purchaseID;
      v29->_purchaseID = (NSString *)v36;

      v29->_purchaseValidationState = a7;
      v38 = objc_msgSend(v25, "copy");
      dateOfExpiration = v29->_dateOfExpiration;
      v29->_dateOfExpiration = (NSDate *)v38;

      v29->_hasShownRenewalNotice = a9;
      v29->_inTrialPeriod = a10;
      v29->_isPurchaser = a11;
      v29->_isAmplifyUser = a13;
      v29->_isPaidBundleViaOfferActivated = a14;
      v40 = objc_msgSend(v26, "copy");
      servicesBundlePurchaseID = v29->_servicesBundlePurchaseID;
      v29->_servicesBundlePurchaseID = (NSString *)v40;

      v42 = objc_msgSend(v27, "copy");
      initialPurchaseTimestamp = v29->_initialPurchaseTimestamp;
      v29->_initialPurchaseTimestamp = (NSNumber *)v42;
    }
    else
    {
      initialPurchaseTimestamp = v28;
      v29 = 0;
    }

  }
  return v29;
}

- (FCBundleSubscriptionLookUpEntry)initWithEntryID:(id)a3 dictionaryRepresentation:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  int v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  char v16;
  void *v17;
  char v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  FCBundleSubscriptionLookUpEntry *v25;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v37;
  uint8_t buf[4];
  const char *v39;
  __int16 v40;
  char *v41;
  __int16 v42;
  int v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v37 = v5;
  if (!v5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("bundle subscription lookup entry must have an identifier"));
    *(_DWORD *)buf = 136315906;
    v39 = "-[FCBundleSubscriptionLookUpEntry initWithEntryID:dictionaryRepresentation:]";
    v40 = 2080;
    v41 = "FCBundleSubscriptionLookUpEntry.m";
    v42 = 1024;
    v43 = 95;
    v44 = 2114;
    v45 = v27;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("BundleLookUpEntryPurchaseValidationState"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("BundleLookUpEntryBundleChannelIDsKey"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "componentsSeparatedByString:", CFSTR(","));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("BundleLookUpEntryPurchaseIDKey"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("BundleLookUpEntryBundleChannelIDsVersionKey"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("BundleLookUpEntryServicesBundlePurchaseIDKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;
  }
  else
  {
    v9 = 0;
  }
  v10 = v9;

  v35 = v7;
  v11 = objc_msgSend(v7, "intValue");
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("BundleLookUpEntryHasShownRenewalNotice"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v12, "BOOLValue");

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("BundleLookUpEntryInTrialPeriod"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "BOOLValue");

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("BundleLookUpEntryIsPurchaser"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "BOOLValue");

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("BundleLookUpEntryIsAmplifyUser"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "BOOLValue");

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("BundleLookUpEntryPaidBundleViaOfferActivated"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "BOOLValue");

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("BundleLookUpEntryDateOfExpiration"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("BundleLookUpEntryInitialPurchaseTimestampKey"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v23 = v22;
    else
      v23 = 0;
  }
  else
  {
    v23 = 0;
  }
  v24 = v23;

  BYTE1(v29) = v20;
  LOBYTE(v29) = v18;
  BYTE2(v28) = v16;
  BYTE1(v28) = v14;
  LOBYTE(v28) = v30;
  v25 = -[FCBundleSubscriptionLookUpEntry initWithEntryID:bundleChannelIDs:bundleChannelIDsVersion:purchaseID:purchaseValidationState:dateOfExpiration:hasShownRenewalNotice:inTrialPeriod:isPurchaser:servicesBundlePurchaseID:isAmplifyUser:isPaidBundleViaOfferActivated:initialPurchaseTimestamp:](self, "initWithEntryID:bundleChannelIDs:bundleChannelIDsVersion:purchaseID:purchaseValidationState:dateOfExpiration:hasShownRenewalNotice:inTrialPeriod:isPurchaser:servicesBundlePurchaseID:isAmplifyUser:isPaidBundleViaOfferActivated:initialPurchaseTimestamp:", v37, v33, v31, v32, v11, v21, v28, v10, v29, v24);

  return v25;
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
  void *v15;
  void *v16;
  void *v17;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[FCBundleSubscriptionLookUpEntry purchaseValidationState](self, "purchaseValidationState"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fc_safelySetObject:forKey:", v4, CFSTR("BundleLookUpEntryPurchaseValidationState"));

  -[FCBundleSubscriptionLookUpEntry bundleChannelIDs](self, "bundleChannelIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR(","));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "fc_safelySetObjectAllowingNil:forKey:", v6, CFSTR("BundleLookUpEntryBundleChannelIDsKey"));
  -[FCBundleSubscriptionLookUpEntry purchaseID](self, "purchaseID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fc_safelySetObjectAllowingNil:forKey:", v7, CFSTR("BundleLookUpEntryPurchaseIDKey"));

  -[FCBundleSubscriptionLookUpEntry bundleChannelIDsVersion](self, "bundleChannelIDsVersion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fc_safelySetObjectAllowingNil:forKey:", v8, CFSTR("BundleLookUpEntryBundleChannelIDsVersionKey"));

  -[FCBundleSubscriptionLookUpEntry servicesBundlePurchaseID](self, "servicesBundlePurchaseID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fc_safelySetObjectAllowingNil:forKey:", v9, CFSTR("BundleLookUpEntryServicesBundlePurchaseIDKey"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[FCBundleSubscriptionLookUpEntry hasShownRenewalNotice](self, "hasShownRenewalNotice"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fc_safelySetObject:forKey:", v10, CFSTR("BundleLookUpEntryHasShownRenewalNotice"));

  -[FCBundleSubscriptionLookUpEntry dateOfExpiration](self, "dateOfExpiration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fc_safelySetObjectAllowingNil:forKey:", v11, CFSTR("BundleLookUpEntryDateOfExpiration"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[FCBundleSubscriptionLookUpEntry inTrialPeriod](self, "inTrialPeriod"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fc_safelySetObject:forKey:", v12, CFSTR("BundleLookUpEntryInTrialPeriod"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[FCBundleSubscriptionLookUpEntry isPurchaser](self, "isPurchaser"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fc_safelySetObject:forKey:", v13, CFSTR("BundleLookUpEntryIsPurchaser"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[FCBundleSubscriptionLookUpEntry isAmplifyUser](self, "isAmplifyUser"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fc_safelySetObject:forKey:", v14, CFSTR("BundleLookUpEntryIsAmplifyUser"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[FCBundleSubscriptionLookUpEntry isPaidBundleViaOfferActivated](self, "isPaidBundleViaOfferActivated"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fc_safelySetObject:forKey:", v15, CFSTR("BundleLookUpEntryPaidBundleViaOfferActivated"));

  -[FCBundleSubscriptionLookUpEntry initialPurchaseTimestamp](self, "initialPurchaseTimestamp");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fc_safelySetObjectAllowingNil:forKey:", v16, CFSTR("BundleLookUpEntryInitialPurchaseTimestampKey"));

  v17 = (void *)objc_msgSend(v3, "copy");
  return v17;
}

- (id)bundleSubscription
{
  void *v3;
  void *v4;
  void *v5;
  _BOOL8 v6;
  void *v7;
  BOOL v8;
  BOOL v9;
  id v10;
  id v11;
  id v12;
  id v13;
  FCBundleSubscription *v14;
  void *v15;
  FCBundleSubscription *v16;
  void *v17;
  void *v18;
  uint64_t v20;
  uint64_t v21;
  void *v22;

  -[FCBundleSubscriptionLookUpEntry purchaseID](self, "purchaseID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCBundleSubscriptionLookUpEntry bundleChannelIDs](self, "bundleChannelIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCBundleSubscriptionLookUpEntry bundleChannelIDsVersion](self, "bundleChannelIDsVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HIDWORD(v21) = -[FCBundleSubscriptionLookUpEntry inTrialPeriod](self, "inTrialPeriod");
  v6 = -[FCBundleSubscriptionLookUpEntry isPurchaser](self, "isPurchaser");
  -[FCBundleSubscriptionLookUpEntry servicesBundlePurchaseID](self, "servicesBundlePurchaseID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[FCBundleSubscriptionLookUpEntry isAmplifyUser](self, "isAmplifyUser");
  v9 = -[FCBundleSubscriptionLookUpEntry isPaidBundleViaOfferActivated](self, "isPaidBundleViaOfferActivated");
  -[FCBundleSubscriptionLookUpEntry initialPurchaseTimestamp](self, "initialPurchaseTimestamp");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v3;
  v11 = v4;
  v12 = v5;
  v13 = v7;
  LOBYTE(v21) = v9;
  LOBYTE(v20) = v8;
  v14 = -[FCBundleSubscription initWithBundlePurchaseID:bundleChannelIDs:bundleChannelIDsVersion:inTrialPeriod:isPurchaser:servicesBundlePurchaseID:isAmplifyUser:initialPurchaseTimestamp:isPaidBundleViaOfferActivated:]([FCBundleSubscription alloc], "initWithBundlePurchaseID:bundleChannelIDs:bundleChannelIDsVersion:inTrialPeriod:isPurchaser:servicesBundlePurchaseID:isAmplifyUser:initialPurchaseTimestamp:isPaidBundleViaOfferActivated:", v10, v11, v12, HIDWORD(v21), v6, v13, v20, v22, v21);
  v15 = (void *)MEMORY[0x1E0CB37E8];
  v16 = v14;
  objc_msgSend(v15, "numberWithUnsignedInteger:", (char *)&v14[2]._bundleChannelIDsVersion + 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -164 - (_QWORD)v14);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(v16, (char *)&v14->super.isa + 1, v17, (void *)1);
  objc_setAssociatedObject(v16, (const void *)(-164 - (_QWORD)v14), v18, (void *)1);

  return v16;
}

- (id)description
{
  unint64_t v3;
  const __CFString *v4;
  const __CFString *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = -[FCBundleSubscriptionLookUpEntry purchaseValidationState](self, "purchaseValidationState");
  v4 = CFSTR("expired");
  if (v3 != 1)
    v4 = 0;
  if (v3)
    v5 = v4;
  else
    v5 = CFSTR("valid");
  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = objc_opt_class();
  -[FCBundleSubscriptionLookUpEntry identifier](self, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCBundleSubscriptionLookUpEntry bundleChannelIDsVersion](self, "bundleChannelIDsVersion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCBundleSubscriptionLookUpEntry purchaseID](self, "purchaseID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCBundleSubscriptionLookUpEntry dateOfExpiration](self, "dateOfExpiration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("<%@: %p; id: %@ channelIDsVersion: %@ purchaseID: %@ validationState: %@ dateOfExpiration: %@ hasShownRenewalNotice: %d>"),
    v7,
    self,
    v8,
    v9,
    v10,
    v5,
    v11,
    -[FCBundleSubscriptionLookUpEntry hasShownRenewalNotice](self, "hasShownRenewalNotice"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  FCBundleSubscriptionLookUpEntry *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = -[FCBundleSubscriptionLookUpEntry init](+[FCBundleSubscriptionLookUpEntry allocWithZone:](FCBundleSubscriptionLookUpEntry, "allocWithZone:"), "init");
  v6 = (void *)-[NSString mutableCopyWithZone:](self->_identifier, "mutableCopyWithZone:", a3);
  -[FCBundleSubscriptionLookUpEntry setIdentifier:](v5, "setIdentifier:", v6);

  v7 = (void *)-[NSArray mutableCopyWithZone:](self->_bundleChannelIDs, "mutableCopyWithZone:", a3);
  -[FCBundleSubscriptionLookUpEntry setBundleChannelIDs:](v5, "setBundleChannelIDs:", v7);

  v8 = (void *)-[NSString mutableCopyWithZone:](self->_bundleChannelIDsVersion, "mutableCopyWithZone:", a3);
  -[FCBundleSubscriptionLookUpEntry setBundleChannelIDsVersion:](v5, "setBundleChannelIDsVersion:", v8);

  v9 = (void *)-[NSString mutableCopyWithZone:](self->_purchaseID, "mutableCopyWithZone:", a3);
  -[FCBundleSubscriptionLookUpEntry setPurchaseID:](v5, "setPurchaseID:", v9);

  -[FCBundleSubscriptionLookUpEntry setPurchaseValidationState:](v5, "setPurchaseValidationState:", self->_purchaseValidationState);
  v10 = (void *)-[NSDate copyWithZone:](self->_dateOfExpiration, "copyWithZone:", a3);
  -[FCBundleSubscriptionLookUpEntry setDateOfExpiration:](v5, "setDateOfExpiration:", v10);

  -[FCBundleSubscriptionLookUpEntry setHasShownRenewalNotice:](v5, "setHasShownRenewalNotice:", self->_hasShownRenewalNotice);
  -[FCBundleSubscriptionLookUpEntry setInTrialPeriod:](v5, "setInTrialPeriod:", self->_inTrialPeriod);
  -[FCBundleSubscriptionLookUpEntry setIsPurchaser:](v5, "setIsPurchaser:", self->_isPurchaser);
  -[FCBundleSubscriptionLookUpEntry setIsAmplifyUser:](v5, "setIsAmplifyUser:", self->_isAmplifyUser);
  -[FCBundleSubscriptionLookUpEntry setIsPaidBundleViaOfferActivated:](v5, "setIsPaidBundleViaOfferActivated:", self->_isPaidBundleViaOfferActivated);
  v11 = (void *)-[NSString mutableCopyWithZone:](self->_servicesBundlePurchaseID, "mutableCopyWithZone:", a3);
  -[FCBundleSubscriptionLookUpEntry setServicesBundlePurchaseID:](v5, "setServicesBundlePurchaseID:", v11);

  v12 = (void *)-[NSNumber copyWithZone:](self->_initialPurchaseTimestamp, "copyWithZone:", a3);
  -[FCBundleSubscriptionLookUpEntry setInitialPurchaseTimestamp:](v5, "setInitialPurchaseTimestamp:", v12);

  return v5;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)purchaseID
{
  return self->_purchaseID;
}

- (void)setPurchaseID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSDate)dateOfExpiration
{
  return self->_dateOfExpiration;
}

- (void)setDateOfExpiration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (unint64_t)purchaseValidationState
{
  return self->_purchaseValidationState;
}

- (void)setPurchaseValidationState:(unint64_t)a3
{
  self->_purchaseValidationState = a3;
}

- (BOOL)hasShownRenewalNotice
{
  return self->_hasShownRenewalNotice;
}

- (void)setHasShownRenewalNotice:(BOOL)a3
{
  self->_hasShownRenewalNotice = a3;
}

- (BOOL)inTrialPeriod
{
  return self->_inTrialPeriod;
}

- (void)setInTrialPeriod:(BOOL)a3
{
  self->_inTrialPeriod = a3;
}

- (BOOL)isPurchaser
{
  return self->_isPurchaser;
}

- (void)setIsPurchaser:(BOOL)a3
{
  self->_isPurchaser = a3;
}

- (BOOL)isAmplifyUser
{
  return self->_isAmplifyUser;
}

- (void)setIsAmplifyUser:(BOOL)a3
{
  self->_isAmplifyUser = a3;
}

- (BOOL)isPaidBundleViaOfferActivated
{
  return self->_isPaidBundleViaOfferActivated;
}

- (void)setIsPaidBundleViaOfferActivated:(BOOL)a3
{
  self->_isPaidBundleViaOfferActivated = a3;
}

- (NSString)servicesBundlePurchaseID
{
  return self->_servicesBundlePurchaseID;
}

- (void)setServicesBundlePurchaseID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSArray)bundleChannelIDs
{
  return self->_bundleChannelIDs;
}

- (void)setBundleChannelIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)bundleChannelIDsVersion
{
  return self->_bundleChannelIDsVersion;
}

- (void)setBundleChannelIDsVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSNumber)initialPurchaseTimestamp
{
  return self->_initialPurchaseTimestamp;
}

- (void)setInitialPurchaseTimestamp:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initialPurchaseTimestamp, 0);
  objc_storeStrong((id *)&self->_bundleChannelIDsVersion, 0);
  objc_storeStrong((id *)&self->_bundleChannelIDs, 0);
  objc_storeStrong((id *)&self->_servicesBundlePurchaseID, 0);
  objc_storeStrong((id *)&self->_dateOfExpiration, 0);
  objc_storeStrong((id *)&self->_purchaseID, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
