@implementation FCPurchaseLookUpEntry

- (FCPurchaseLookUpEntry)initWithEntryID:(id)a3 tagID:(id)a4 purchaseID:(id)a5 lastVerificationTime:(id)a6 lastVerificationFailureTime:(id)a7 purchaseType:(unint64_t)a8 purchaseValidationState:(unint64_t)a9 isNewsAppPurchase:(BOOL)a10 dateOfExpiration:(id)a11 hasShownRenewalNotice:(BOOL)a12
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  FCPurchaseLookUpEntry *v24;
  FCPurchaseLookUpEntry *v25;
  uint64_t v26;
  NSString *identifier;
  uint64_t v28;
  NSString *tagID;
  uint64_t v30;
  NSString *purchaseID;
  uint64_t v32;
  NSDate *lastVerificationTime;
  uint64_t v34;
  NSDate *lastVerificationFailureTime;
  void *v37;
  void *v38;
  objc_super v39;
  uint8_t buf[4];
  const char *v41;
  __int16 v42;
  char *v43;
  __int16 v44;
  int v45;
  __int16 v46;
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v18 = a3;
  v19 = a4;
  v20 = a5;
  v21 = a6;
  v22 = a7;
  v23 = a11;
  if (!v18 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("purchase lookup entry must have an identifier"));
    *(_DWORD *)buf = 136315906;
    v41 = "-[FCPurchaseLookUpEntry initWithEntryID:tagID:purchaseID:lastVerificationTime:lastVerificationFailureTime:purc"
          "haseType:purchaseValidationState:isNewsAppPurchase:dateOfExpiration:hasShownRenewalNotice:]";
    v42 = 2080;
    v43 = "FCPurchaseLookUpEntry.m";
    v44 = 1024;
    v45 = 41;
    v46 = 2114;
    v47 = v37;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v19)
      goto LABEL_6;
  }
  else if (v19)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("purchase lookup entry must have an tag ID"));
    *(_DWORD *)buf = 136315906;
    v41 = "-[FCPurchaseLookUpEntry initWithEntryID:tagID:purchaseID:lastVerificationTime:lastVerificationFailureTime:purc"
          "haseType:purchaseValidationState:isNewsAppPurchase:dateOfExpiration:hasShownRenewalNotice:]";
    v42 = 2080;
    v43 = "FCPurchaseLookUpEntry.m";
    v44 = 1024;
    v45 = 42;
    v46 = 2114;
    v47 = v38;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
LABEL_6:
  v39.receiver = self;
  v39.super_class = (Class)FCPurchaseLookUpEntry;
  v24 = -[FCPurchaseLookUpEntry init](&v39, sel_init);
  v25 = v24;
  if (v24)
  {
    if (v18)
    {
      v26 = objc_msgSend(v18, "copy");
      identifier = v25->_identifier;
      v25->_identifier = (NSString *)v26;

      v28 = objc_msgSend(v19, "copy");
      tagID = v25->_tagID;
      v25->_tagID = (NSString *)v28;

      v30 = objc_msgSend(v20, "copy");
      purchaseID = v25->_purchaseID;
      v25->_purchaseID = (NSString *)v30;

      v32 = objc_msgSend(v21, "copy");
      lastVerificationTime = v25->_lastVerificationTime;
      v25->_lastVerificationTime = (NSDate *)v32;

      v34 = objc_msgSend(v22, "copy");
      lastVerificationFailureTime = v25->_lastVerificationFailureTime;
      v25->_lastVerificationFailureTime = (NSDate *)v34;

      v25->_purchaseType = a8;
      v25->_purchaseValidationState = a9;
      v25->_isNewsAppPurchase = a10;
      objc_storeStrong((id *)&v25->_dateOfExpiration, a11);
      v25->_hasShownRenewalNotice = a12;
    }
    else
    {

      v25 = 0;
    }
  }

  return v25;
}

- (FCPurchaseLookUpEntry)initWithEntryID:(id)a3 dictionaryRepresentation:(id)a4
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
  int v14;
  int v15;
  uint64_t v16;
  void *v17;
  char v18;
  void *v19;
  FCPurchaseLookUpEntry *v20;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  void *v28;
  void *v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  char *v34;
  __int16 v35;
  int v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v30 = v5;
  if (!v5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("purchase lookup entry must have an identifier"));
    *(_DWORD *)buf = 136315906;
    v32 = "-[FCPurchaseLookUpEntry initWithEntryID:dictionaryRepresentation:]";
    v33 = 2080;
    v34 = "FCPurchaseLookUpEntry.m";
    v35 = 1024;
    v36 = 69;
    v37 = 2114;
    v38 = v22;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("PurchaseLookUpEntrypurchaseType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("PurchaseLookUpEntryPurchaseValidationState"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("PurchaseLookUpEntryLastVerificationTime"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("PurchaseLookUpEntryLastVerificationFailureTime"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("PurchaseLookUpEntryTagID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("PurchaseLookUpEntryPurchaseID"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("PurchaseLookUpEntryIsNewsAppPurchase"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v13, "BOOLValue");

  v28 = v7;
  v14 = objc_msgSend(v7, "intValue");
  if (!v14 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Purchase mode cannot be unknown"));
    *(_DWORD *)buf = 136315906;
    v32 = "-[FCPurchaseLookUpEntry initWithEntryID:dictionaryRepresentation:]";
    v33 = 2080;
    v34 = "FCPurchaseLookUpEntry.m";
    v35 = 1024;
    v36 = 79;
    v37 = 2114;
    v38 = v23;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v15 = objc_msgSend(v8, "intValue");
  if (!v15 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Purchase validation state cannot be unknown"));
    *(_DWORD *)buf = 136315906;
    v32 = "-[FCPurchaseLookUpEntry initWithEntryID:dictionaryRepresentation:]";
    v33 = 2080;
    v34 = "FCPurchaseLookUpEntry.m";
    v35 = 1024;
    v36 = 82;
    v37 = 2114;
    v38 = v24;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v16 = v15;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("PurchaseLookUpEntryHasShownRenewalNotice"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "BOOLValue");

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("PurchaseLookUpEntryDateOfExpiration"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v26) = v18;
  LOBYTE(v25) = v27;
  v20 = -[FCPurchaseLookUpEntry initWithEntryID:tagID:purchaseID:lastVerificationTime:lastVerificationFailureTime:purchaseType:purchaseValidationState:isNewsAppPurchase:dateOfExpiration:hasShownRenewalNotice:](self, "initWithEntryID:tagID:purchaseID:lastVerificationTime:lastVerificationFailureTime:purchaseType:purchaseValidationState:isNewsAppPurchase:dateOfExpiration:hasShownRenewalNotice:", v30, v11, v12, v9, v10, v14, v16, v25, v19, v26);

  return v20;
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[FCPurchaseLookUpEntry purchaseType](self, "purchaseType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("PurchaseLookUpEntrypurchaseType"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[FCPurchaseLookUpEntry purchaseValidationState](self, "purchaseValidationState"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("PurchaseLookUpEntryPurchaseValidationState"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[FCPurchaseLookUpEntry isNewsAppPurchase](self, "isNewsAppPurchase"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("PurchaseLookUpEntryIsNewsAppPurchase"));

  -[FCPurchaseLookUpEntry tagID](self, "tagID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fc_safelySetObjectAllowingNil:forKey:", v7, CFSTR("PurchaseLookUpEntryTagID"));

  -[FCPurchaseLookUpEntry purchaseID](self, "purchaseID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fc_safelySetObjectAllowingNil:forKey:", v8, CFSTR("PurchaseLookUpEntryPurchaseID"));

  -[FCPurchaseLookUpEntry lastVerificationTime](self, "lastVerificationTime");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fc_safelySetObjectAllowingNil:forKey:", v9, CFSTR("PurchaseLookUpEntryLastVerificationTime"));

  -[FCPurchaseLookUpEntry lastVerificationFailureTime](self, "lastVerificationFailureTime");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fc_safelySetObjectAllowingNil:forKey:", v10, CFSTR("PurchaseLookUpEntryLastVerificationFailureTime"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[FCPurchaseLookUpEntry hasShownRenewalNotice](self, "hasShownRenewalNotice"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fc_safelySetObject:forKey:", v11, CFSTR("PurchaseLookUpEntryHasShownRenewalNotice"));

  -[FCPurchaseLookUpEntry dateOfExpiration](self, "dateOfExpiration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fc_safelySetObjectAllowingNil:forKey:", v12, CFSTR("PurchaseLookUpEntryDateOfExpiration"));

  v13 = (void *)objc_msgSend(v3, "copy");
  return v13;
}

- (id)description
{
  unint64_t v3;
  unint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v15;
  __CFString *v16;

  v3 = -[FCPurchaseLookUpEntry purchaseType](self, "purchaseType");
  if (v3 > 2)
    v16 = 0;
  else
    v16 = off_1E46480E8[v3];
  v4 = -[FCPurchaseLookUpEntry purchaseValidationState](self, "purchaseValidationState");
  if (v4 > 4)
    v15 = 0;
  else
    v15 = off_1E4648100[v4];
  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = objc_opt_class();
  -[FCPurchaseLookUpEntry identifier](self, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCPurchaseLookUpEntry tagID](self, "tagID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCPurchaseLookUpEntry purchaseID](self, "purchaseID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCPurchaseLookUpEntry lastVerificationTime](self, "lastVerificationTime");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCPurchaseLookUpEntry lastVerificationFailureTime](self, "lastVerificationFailureTime");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCPurchaseLookUpEntry dateOfExpiration](self, "dateOfExpiration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@: %p; id: %@ tagID: %@ purchaseID: %@ purchaseType: %@ validationState: %@ lastVerificationTime: %@ lastVerificationFailureTime: %@ dateOfExpiration: %@ isNewsAppPurchase: %d hasShownRenewalNotice: %d>"),
    v6,
    self,
    v7,
    v8,
    v9,
    v16,
    v15,
    v10,
    v11,
    v12,
    -[FCPurchaseLookUpEntry isNewsAppPurchase](self, "isNewsAppPurchase"),
    -[FCPurchaseLookUpEntry hasShownRenewalNotice](self, "hasShownRenewalNotice"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  BOOL v10;
  void *v11;
  void *v12;
  FCPurchaseLookUpEntry *v13;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  FCPurchaseLookUpEntry *v20;
  void *v21;
  void *v22;
  void *v23;

  v20 = [FCPurchaseLookUpEntry alloc];
  -[FCPurchaseLookUpEntry identifier](self, "identifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v23, "copy");
  -[FCPurchaseLookUpEntry tagID](self, "tagID");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v22, "copy");
  -[FCPurchaseLookUpEntry purchaseID](self, "purchaseID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v21, "copy");
  -[FCPurchaseLookUpEntry lastVerificationTime](self, "lastVerificationTime");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");
  -[FCPurchaseLookUpEntry lastVerificationFailureTime](self, "lastVerificationFailureTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");
  v8 = -[FCPurchaseLookUpEntry purchaseType](self, "purchaseType");
  v9 = -[FCPurchaseLookUpEntry purchaseValidationState](self, "purchaseValidationState");
  v10 = -[FCPurchaseLookUpEntry isNewsAppPurchase](self, "isNewsAppPurchase");
  -[FCPurchaseLookUpEntry dateOfExpiration](self, "dateOfExpiration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  LOBYTE(v16) = -[FCPurchaseLookUpEntry hasShownRenewalNotice](self, "hasShownRenewalNotice");
  LOBYTE(v15) = v10;
  v13 = -[FCPurchaseLookUpEntry initWithEntryID:tagID:purchaseID:lastVerificationTime:lastVerificationFailureTime:purchaseType:purchaseValidationState:isNewsAppPurchase:dateOfExpiration:hasShownRenewalNotice:](v20, "initWithEntryID:tagID:purchaseID:lastVerificationTime:lastVerificationFailureTime:purchaseType:purchaseValidationState:isNewsAppPurchase:dateOfExpiration:hasShownRenewalNotice:", v19, v18, v17, v5, v7, v8, v9, v15, v12, v16);

  return v13;
}

- (unint64_t)purchaseType
{
  return self->_purchaseType;
}

- (void)setPurchaseType:(unint64_t)a3
{
  self->_purchaseType = a3;
}

- (unint64_t)purchaseValidationState
{
  return self->_purchaseValidationState;
}

- (void)setPurchaseValidationState:(unint64_t)a3
{
  self->_purchaseValidationState = a3;
}

- (NSDate)lastVerificationTime
{
  return self->_lastVerificationTime;
}

- (void)setLastVerificationTime:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSDate)lastVerificationFailureTime
{
  return self->_lastVerificationFailureTime;
}

- (void)setLastVerificationFailureTime:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)purchaseID
{
  return self->_purchaseID;
}

- (void)setPurchaseID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)tagID
{
  return self->_tagID;
}

- (void)setTagID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (BOOL)isNewsAppPurchase
{
  return self->_isNewsAppPurchase;
}

- (void)setIsNewsAppPurchase:(BOOL)a3
{
  self->_isNewsAppPurchase = a3;
}

- (NSDate)dateOfExpiration
{
  return self->_dateOfExpiration;
}

- (void)setDateOfExpiration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (BOOL)hasShownRenewalNotice
{
  return self->_hasShownRenewalNotice;
}

- (void)setHasShownRenewalNotice:(BOOL)a3
{
  self->_hasShownRenewalNotice = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateOfExpiration, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_tagID, 0);
  objc_storeStrong((id *)&self->_purchaseID, 0);
  objc_storeStrong((id *)&self->_lastVerificationFailureTime, 0);
  objc_storeStrong((id *)&self->_lastVerificationTime, 0);
}

@end
