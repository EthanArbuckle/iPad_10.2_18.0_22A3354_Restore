@implementation CDPDDefaultKeychainSyncPolicyProvider

- (CDPDDefaultKeychainSyncPolicyProvider)initWithContext:(id)a3
{
  id v5;
  CDPDDefaultKeychainSyncPolicyProvider *v6;
  CDPDAccount *v7;
  CDPDAccount *account;
  CDPDDefaultKeychainSyncPolicyProvider *v9;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CDPDDefaultKeychainSyncPolicyProvider;
  v6 = -[CDPDDefaultKeychainSyncPolicyProvider init](&v11, sel_init);
  if (v6)
  {
    v7 = -[CDPDAccount initWithContext:]([CDPDAccount alloc], "initWithContext:", v5);
    account = v6->_account;
    v6->_account = v7;

    objc_storeStrong((id *)&v6->_context, a3);
    v9 = v6;
  }

  return v6;
}

- (BOOL)keychainSyncAllowedByMDM
{
  void *v2;
  char v3;

  -[CDPDDefaultKeychainSyncPolicyProvider context](self, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "keychainSyncAllowedByMDM");

  return v3;
}

- (BOOL)keychainSyncAllowedByServer
{
  void *v2;
  char v3;

  -[CDPDDefaultKeychainSyncPolicyProvider context](self, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "keychainSyncAllowedByServer");

  return v3;
}

- (BOOL)userHasExplicitlyDisabledSync
{
  void *v2;
  char v3;

  -[CDPDDefaultKeychainSyncPolicyProvider account](self, "account");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasDisabledKeychainExplicitly");

  return v3;
}

- (BOOL)isBuddyFinished
{
  return objc_msgSend(MEMORY[0x24BE1A4A0], "isBuddyFinished");
}

- (void)setUserHasExplicitlyDisabledSync:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[CDPDDefaultKeychainSyncPolicyProvider account](self, "account");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHasDisabledKeychainExplicitly:", v3);

}

- (CDPDAccount)account
{
  return self->_account;
}

- (CDPContext)context
{
  return self->_context;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end
