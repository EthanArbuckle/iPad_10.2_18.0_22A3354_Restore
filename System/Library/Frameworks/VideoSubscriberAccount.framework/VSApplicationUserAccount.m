@implementation VSApplicationUserAccount

- (VSApplicationUserAccount)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VSApplicationUserAccount;
  return -[VSApplicationUserAccount init](&v3, sel_init);
}

- (VSApplicationUserAccount)initWithUserAccount:(id)a3
{
  id v5;
  VSApplicationUserAccount *v6;
  VSApplicationUserAccount *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSString *updateURL;
  void *v12;
  uint64_t v13;
  NSString *bundleId;
  void *v15;
  uint64_t v16;
  NSString *identifier;
  void *v18;
  uint64_t v19;
  NSDate *subscriptionBillingCycleEndDate;
  void *v21;
  uint64_t v22;
  NSArray *tierIdentifiers;
  void *v24;
  uint64_t v25;
  NSString *billingIdentifier;
  void *v27;
  uint64_t v28;
  NSString *authenticationData;
  void *v30;
  VSApplicationAppleSubscription *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  VSApplicationAppleSubscription *appleSubscription;
  objc_super v38;

  v5 = a3;
  v38.receiver = self;
  v38.super_class = (Class)VSApplicationUserAccount;
  v6 = -[VSApplicationUserAccount init](&v38, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_originatingUserAccount, a3);
    objc_msgSend(v5, "updateURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "absoluteString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    updateURL = v7->_updateURL;
    v7->_updateURL = (NSString *)v10;

    v7->_requiresSystemTrust = objc_msgSend(v5, "requiresSystemTrust");
    if (!objc_msgSend(v5, "sourceType"))
    {
      objc_msgSend(v5, "sourceIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "copy");
      bundleId = v7->_bundleId;
      v7->_bundleId = (NSString *)v13;

    }
    objc_msgSend(v5, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "copy");
    identifier = v7->_identifier;
    v7->_identifier = (NSString *)v16;

    v7->_accountType = objc_msgSend(v5, "accountType");
    v7->_signedOut = objc_msgSend(v5, "isSignedOut");
    objc_msgSend(v5, "subscriptionBillingCycleEndDate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "copy");
    subscriptionBillingCycleEndDate = v7->_subscriptionBillingCycleEndDate;
    v7->_subscriptionBillingCycleEndDate = (NSDate *)v19;

    objc_msgSend(v5, "tierIdentifiers");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "copy");
    tierIdentifiers = v7->_tierIdentifiers;
    v7->_tierIdentifiers = (NSArray *)v22;

    objc_msgSend(v5, "billingIdentifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "copy");
    billingIdentifier = v7->_billingIdentifier;
    v7->_billingIdentifier = (NSString *)v25;

    objc_msgSend(v5, "authenticationData");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "copy");
    authenticationData = v7->_authenticationData;
    v7->_authenticationData = (NSString *)v28;

    v7->_deviceCategory = objc_msgSend(v5, "deviceCategory");
    objc_msgSend(v5, "appleSubscription");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (v30)
    {
      v31 = [VSApplicationAppleSubscription alloc];
      objc_msgSend(v5, "appleSubscription");
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v32)
        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The [userAccount appleSubscription] parameter must not be nil."));
      objc_msgSend(v5, "appleSubscription");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = (void *)objc_msgSend(v33, "copy");
      v35 = -[VSApplicationAppleSubscription initWithAppleSubscription:](v31, "initWithAppleSubscription:", v34);
      appleSubscription = v7->_appleSubscription;
      v7->_appleSubscription = (VSApplicationAppleSubscription *)v35;

    }
  }

  return v7;
}

- (id)userAccountForProviderID:(id)a3 allowedBundleIDs:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  uint64_t v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  VSUserAccount *v21;
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
  void *v33;
  void *v34;
  uint8_t v36[16];

  v6 = a3;
  v7 = a4;
  -[VSApplicationUserAccount bundleId](self, "bundleId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSApplicationUserAccount bundleId](self, "bundleId");
  v9 = objc_claimAutoreleasedReturnValue();
  if (!v9)
    goto LABEL_6;
  v10 = (void *)v9;
  -[VSApplicationUserAccount bundleId](self, "bundleId");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The [self bundleId] parameter must not be nil."));
  -[VSApplicationUserAccount bundleId](self, "bundleId");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v7, "containsObject:", v12);

  if ((v13 & 1) != 0)
  {
    v14 = 0;
  }
  else
  {
LABEL_6:
    VSDefaultLogObject();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v36 = 0;
      _os_log_impl(&dword_1D2419000, v15, OS_LOG_TYPE_DEFAULT, "JS User Account with no bundle ID, setting source type to VSUserAccountSourceTypeProvider", v36, 2u);
    }

    v16 = v6;
    v14 = 2;
    v8 = v16;
  }
  -[VSApplicationUserAccount updateURL](self, "updateURL");
  v17 = objc_claimAutoreleasedReturnValue();

  if (!v17)
    goto LABEL_13;
  v18 = (void *)MEMORY[0x1E0C99E98];
  -[VSApplicationUserAccount updateURL](self, "updateURL");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v19)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The [self updateURL] parameter must not be nil."));
  -[VSApplicationUserAccount updateURL](self, "updateURL");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "URLWithString:", v20);
  v17 = objc_claimAutoreleasedReturnValue();

  if (!v17)
  {
    VSErrorLogObject();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[VSApplicationUserAccount userAccountForProviderID:allowedBundleIDs:].cold.1(v17);
    v21 = 0;
  }
  else
  {
LABEL_13:
    v21 = -[VSUserAccount initWithAccountType:updateURL:sourceType:sourceIdentifier:]([VSUserAccount alloc], "initWithAccountType:updateURL:sourceType:sourceIdentifier:", -[VSApplicationUserAccount accountType](self, "accountType"), v17, v14, v8);
    -[VSApplicationUserAccount identifier](self, "identifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(v22, "copy");
    -[VSUserAccount setIdentifier:](v21, "setIdentifier:", v23);

    -[VSUserAccount setSignedOut:](v21, "setSignedOut:", -[VSApplicationUserAccount isSignedOut](self, "isSignedOut"));
    -[VSApplicationUserAccount subscriptionBillingCycleEndDate](self, "subscriptionBillingCycleEndDate");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(v24, "copy");
    -[VSUserAccount setSubscriptionBillingCycleEndDate:](v21, "setSubscriptionBillingCycleEndDate:", v25);

    -[VSApplicationUserAccount tierIdentifiers](self, "tierIdentifiers");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)objc_msgSend(v26, "copy");
    -[VSUserAccount setTierIdentifiers:](v21, "setTierIdentifiers:", v27);

    -[VSApplicationUserAccount billingIdentifier](self, "billingIdentifier");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (void *)objc_msgSend(v28, "copy");
    -[VSUserAccount setBillingIdentifier:](v21, "setBillingIdentifier:", v29);

    -[VSApplicationUserAccount authenticationData](self, "authenticationData");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (void *)objc_msgSend(v30, "copy");
    -[VSUserAccount setAuthenticationData:](v21, "setAuthenticationData:", v31);

    -[VSApplicationUserAccount appleSubscription](self, "appleSubscription");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "appleSubscription");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = (void *)objc_msgSend(v33, "copy");
    -[VSUserAccount setAppleSubscription:](v21, "setAppleSubscription:", v34);

  }
  return v21;
}

+ (id)userAccountsFromApplicationUserAccounts:(id)a3 ForProviderID:(id)a4 allowedBundleIDs:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v11 = v7;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v19;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v19 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v15), "userAccountForProviderID:allowedBundleIDs:", v8, v9, (_QWORD)v18);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
          objc_msgSend(v10, "addObject:", v16);

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v13);
  }

  return v10;
}

+ (id)applicationUserAccountsFromUserAccounts:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v7);
        v9 = objc_alloc((Class)objc_opt_class());
        v10 = (void *)objc_msgSend(v9, "initWithUserAccount:", v8, (_QWORD)v12);
        objc_msgSend(v3, "addObject:", v10);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

  return v3;
}

- (int64_t)accountType
{
  return self->_accountType;
}

- (void)setAccountType:(int64_t)a3
{
  self->_accountType = a3;
}

- (NSString)authenticationData
{
  return self->_authenticationData;
}

- (void)setAuthenticationData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)billingIdentifier
{
  return self->_billingIdentifier;
}

- (void)setBillingIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (void)setBundleId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)isSignedOut
{
  return self->_signedOut;
}

- (void)setSignedOut:(BOOL)a3
{
  self->_signedOut = a3;
}

- (int64_t)deviceCategory
{
  return self->_deviceCategory;
}

- (void)setDeviceCategory:(int64_t)a3
{
  self->_deviceCategory = a3;
}

- (BOOL)requiresSystemTrust
{
  return self->_requiresSystemTrust;
}

- (void)setRequiresSystemTrust:(BOOL)a3
{
  self->_requiresSystemTrust = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSDate)subscriptionBillingCycleEndDate
{
  return self->_subscriptionBillingCycleEndDate;
}

- (void)setSubscriptionBillingCycleEndDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSArray)tierIdentifiers
{
  return self->_tierIdentifiers;
}

- (void)setTierIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)updateURL
{
  return self->_updateURL;
}

- (void)setUpdateURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (VSApplicationAppleSubscription)appleSubscription
{
  return self->_appleSubscription;
}

- (void)setAppleSubscription:(id)a3
{
  objc_storeStrong((id *)&self->_appleSubscription, a3);
}

- (VSUserAccount)originatingUserAccount
{
  return self->_originatingUserAccount;
}

- (void)setOriginatingUserAccount:(id)a3
{
  objc_storeStrong((id *)&self->_originatingUserAccount, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originatingUserAccount, 0);
  objc_storeStrong((id *)&self->_appleSubscription, 0);
  objc_storeStrong((id *)&self->_updateURL, 0);
  objc_storeStrong((id *)&self->_tierIdentifiers, 0);
  objc_storeStrong((id *)&self->_subscriptionBillingCycleEndDate, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
  objc_storeStrong((id *)&self->_billingIdentifier, 0);
  objc_storeStrong((id *)&self->_authenticationData, 0);
}

- (void)userAccountForProviderID:(os_log_t)log allowedBundleIDs:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D2419000, log, OS_LOG_TYPE_ERROR, "JS User Account with invalid URL, it will be skipped.", v1, 2u);
}

@end
