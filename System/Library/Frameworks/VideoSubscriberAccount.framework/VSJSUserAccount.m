@implementation VSJSUserAccount

- (VSJSUserAccount)initWithUserAccount:(id)a3
{
  id v5;
  VSJSUserAccount *v6;
  VSJSUserAccount *v7;
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
  VSJSAppleSubscription *v31;
  void *v32;
  uint64_t v33;
  VSJSAppleSubscription *appleSubscription;
  objc_super v36;

  v5 = a3;
  v36.receiver = self;
  v36.super_class = (Class)VSJSUserAccount;
  v6 = -[VSJSObject init](&v36, sel_init);
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
      v31 = [VSJSAppleSubscription alloc];
      v32 = (void *)objc_msgSend(v30, "copy");
      v33 = -[VSJSAppleSubscription initWithAppleSubscription:](v31, "initWithAppleSubscription:", v32);
      appleSubscription = v7->_appleSubscription;
      v7->_appleSubscription = (VSJSAppleSubscription *)v33;

    }
  }

  return v7;
}

- (id)userAccount
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  VSUserAccount *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
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
  void *v35;
  void *v36;

  -[VSJSUserAccount bundleId](self, "bundleId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[VSJSUserAccount updateURL](self, "updateURL");
    v4 = objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = (void *)MEMORY[0x1E0C99E98];
      -[VSJSUserAccount updateURL](self, "updateURL");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v6)
        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The [self updateURL] parameter must not be nil."));
      -[VSJSUserAccount updateURL](self, "updateURL");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "URLWithString:", v7);
      v8 = objc_claimAutoreleasedReturnValue();

      if (!v8)
      {
        VSErrorLogObject();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          -[VSJSUserAccount userAccount].cold.2(v8, v9, v10, v11, v12, v13, v14, v15);
        v16 = 0;
        goto LABEL_14;
      }
    }
    else
    {
      v8 = 0;
    }
    v16 = -[VSUserAccount initWithAccountType:updateURL:sourceType:sourceIdentifier:]([VSUserAccount alloc], "initWithAccountType:updateURL:sourceType:sourceIdentifier:", -[VSJSUserAccount accountType](self, "accountType"), v8, 0, v3);
    -[VSJSUserAccount identifier](self, "identifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(v24, "copy");
    -[VSUserAccount setIdentifier:](v16, "setIdentifier:", v25);

    -[VSUserAccount setSignedOut:](v16, "setSignedOut:", -[VSJSUserAccount isSignedOut](self, "isSignedOut"));
    -[VSJSUserAccount subscriptionBillingCycleEndDate](self, "subscriptionBillingCycleEndDate");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)objc_msgSend(v26, "copy");
    -[VSUserAccount setSubscriptionBillingCycleEndDate:](v16, "setSubscriptionBillingCycleEndDate:", v27);

    -[VSJSUserAccount tierIdentifiers](self, "tierIdentifiers");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (void *)objc_msgSend(v28, "copy");
    -[VSUserAccount setTierIdentifiers:](v16, "setTierIdentifiers:", v29);

    -[VSJSUserAccount billingIdentifier](self, "billingIdentifier");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (void *)objc_msgSend(v30, "copy");
    -[VSUserAccount setBillingIdentifier:](v16, "setBillingIdentifier:", v31);

    -[VSJSUserAccount authenticationData](self, "authenticationData");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (void *)objc_msgSend(v32, "copy");
    -[VSUserAccount setAuthenticationData:](v16, "setAuthenticationData:", v33);

    -[VSJSUserAccount appleSubscription](self, "appleSubscription");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "appleSubscription");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = (void *)objc_msgSend(v35, "copy");
    -[VSUserAccount setAppleSubscription:](v16, "setAppleSubscription:", v36);

LABEL_14:
    goto LABEL_15;
  }
  VSErrorLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    -[VSJSUserAccount userAccount].cold.1(v4, v17, v18, v19, v20, v21, v22, v23);
  v16 = 0;
LABEL_15:

  return v16;
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
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint8_t v43[16];

  v6 = a3;
  v7 = a4;
  -[VSJSUserAccount bundleId](self, "bundleId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSJSUserAccount bundleId](self, "bundleId");
  v9 = objc_claimAutoreleasedReturnValue();
  if (!v9)
    goto LABEL_6;
  v10 = (void *)v9;
  -[VSJSUserAccount bundleId](self, "bundleId");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The [self bundleId] parameter must not be nil."));
  -[VSJSUserAccount bundleId](self, "bundleId");
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
      *(_WORD *)v43 = 0;
      _os_log_impl(&dword_1D2419000, v15, OS_LOG_TYPE_DEFAULT, "JS User Account with no bundle ID, setting source type to VSUserAccountSourceTypeProvider", v43, 2u);
    }

    v16 = v6;
    v14 = 2;
    v8 = v16;
  }
  -[VSJSUserAccount updateURL](self, "updateURL");
  v17 = objc_claimAutoreleasedReturnValue();

  if (!v17)
    goto LABEL_13;
  v18 = (void *)MEMORY[0x1E0C99E98];
  -[VSJSUserAccount updateURL](self, "updateURL");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v19)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The [self updateURL] parameter must not be nil."));
  -[VSJSUserAccount updateURL](self, "updateURL");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "URLWithString:", v20);
  v17 = objc_claimAutoreleasedReturnValue();

  if (!v17)
  {
    VSErrorLogObject();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[VSJSUserAccount userAccount].cold.2(v17, v35, v36, v37, v38, v39, v40, v41);
    v21 = 0;
  }
  else
  {
LABEL_13:
    v21 = -[VSUserAccount initWithAccountType:updateURL:sourceType:sourceIdentifier:]([VSUserAccount alloc], "initWithAccountType:updateURL:sourceType:sourceIdentifier:", -[VSJSUserAccount accountType](self, "accountType"), v17, v14, v8);
    -[VSJSUserAccount identifier](self, "identifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(v22, "copy");
    -[VSUserAccount setIdentifier:](v21, "setIdentifier:", v23);

    -[VSUserAccount setSignedOut:](v21, "setSignedOut:", -[VSJSUserAccount isSignedOut](self, "isSignedOut"));
    -[VSJSUserAccount subscriptionBillingCycleEndDate](self, "subscriptionBillingCycleEndDate");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(v24, "copy");
    -[VSUserAccount setSubscriptionBillingCycleEndDate:](v21, "setSubscriptionBillingCycleEndDate:", v25);

    -[VSJSUserAccount tierIdentifiers](self, "tierIdentifiers");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)objc_msgSend(v26, "copy");
    -[VSUserAccount setTierIdentifiers:](v21, "setTierIdentifiers:", v27);

    -[VSJSUserAccount billingIdentifier](self, "billingIdentifier");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (void *)objc_msgSend(v28, "copy");
    -[VSUserAccount setBillingIdentifier:](v21, "setBillingIdentifier:", v29);

    -[VSJSUserAccount authenticationData](self, "authenticationData");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (void *)objc_msgSend(v30, "copy");
    -[VSUserAccount setAuthenticationData:](v21, "setAuthenticationData:", v31);

    -[VSJSUserAccount appleSubscription](self, "appleSubscription");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "appleSubscription");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = (void *)objc_msgSend(v33, "copy");
    -[VSUserAccount setAppleSubscription:](v21, "setAppleSubscription:", v34);

  }
  return v21;
}

+ (id)userAccountsFromJSUserAccounts:(id)a3
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
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "userAccount", (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
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

+ (id)jsUserAccountsFromUserAccounts:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v9);
        v11 = objc_alloc((Class)objc_opt_class());
        v12 = (void *)objc_msgSend(v11, "initWithUserAccount:", v10, (_QWORD)v14);
        objc_msgSend(v4, "addObject:", v12);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  return v4;
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)billingIdentifier
{
  return self->_billingIdentifier;
}

- (void)setBillingIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (void)setBundleId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSDate)subscriptionBillingCycleEndDate
{
  return self->_subscriptionBillingCycleEndDate;
}

- (void)setSubscriptionBillingCycleEndDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSArray)tierIdentifiers
{
  return self->_tierIdentifiers;
}

- (void)setTierIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)updateURL
{
  return self->_updateURL;
}

- (void)setUpdateURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (VSJSAppleSubscription)appleSubscription
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

- (void)userAccount
{
  OUTLINED_FUNCTION_0_0(&dword_1D2419000, a1, a3, "JS User Account with invalid URL, it will be skipped.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_0();
}

@end
