@implementation CNAuthorizationContext

id __62__CNAuthorizationContext_shouldAlwaysQueryAuthorizationStatus__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = (void *)v2[5];
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v2, "shouldAlwaysQueryAuthorizationStatusImpl"));
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  }
  return v3;
}

id __44__CNAuthorizationContext_isClientTCCAllowed__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = (void *)v2[8];
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v2, "isClientTCCAllowedImpl"));
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 64);
    *(_QWORD *)(v5 + 64) = v4;

    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
  }
  return v3;
}

- (BOOL)shouldAlwaysQueryAuthorizationStatusImpl
{
  _BOOL4 v3;

  if (-[CNAuthorizationContext isUnitTesting](self, "isUnitTesting"))
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    v3 = -[CNAuthorizationContext isGreenTeaDevice](self, "isGreenTeaDevice");
    if (v3
      && (-[CNAuthorizationContext isClientTCCUncoupledProcess](self, "isClientTCCUncoupledProcess")
       || (v3 = -[CNAuthorizationContext isClientTCCCoupledProcess](self, "isClientTCCCoupledProcess"))))
    {
      LOBYTE(v3) = !-[CNAuthorizationContext isClientTCCKilledOnAuthorizationChange](self, "isClientTCCKilledOnAuthorizationChange");
    }
  }
  return v3;
}

- (BOOL)isUnitTesting
{
  void *v2;
  char v3;

  -[CNAuthorizationContext tccServices](self, "tccServices");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isUnitTesting");

  return v3;
}

id __52__CNAuthorizationContext_isClientTCCRegionalAllowed__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = (void *)v2[9];
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v2, "isClientTCCRegionalAllowedImpl"));
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 72);
    *(_QWORD *)(v5 + 72) = v4;

    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 72);
  }
  return v3;
}

+ (CNAuthorizationContext)sharedInstance
{
  if (sharedInstance_cn_once_token_2_1 != -1)
    dispatch_once(&sharedInstance_cn_once_token_2_1, &__block_literal_global_3_3);
  return (CNAuthorizationContext *)(id)sharedInstance_cn_once_object_2_1;
}

- (BOOL)cachedNotesAccessGranted
{
  CNUnfairLock *notesAccessStatusLock;
  void *v3;
  char v4;
  _QWORD v6[5];

  notesAccessStatusLock = self->_notesAccessStatusLock;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __50__CNAuthorizationContext_cachedNotesAccessGranted__block_invoke;
  v6[3] = &unk_1E29BA248;
  v6[4] = self;
  CNResultWithLock(notesAccessStatusLock, v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)cachedAddressingGrammarAccessGranted
{
  CNUnfairLock *notesAccessStatusLock;
  void *v3;
  char v4;
  _QWORD v6[5];

  notesAccessStatusLock = self->_notesAccessStatusLock;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __62__CNAuthorizationContext_cachedAddressingGrammarAccessGranted__block_invoke;
  v6[3] = &unk_1E29BA248;
  v6[4] = self;
  CNResultWithLock(notesAccessStatusLock, v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)requestAccessWithError:(id *)a3
{
  BOOL v4;
  void *v5;
  void *v6;

  v4 = -[CNAuthorizationContext isAccessGrantedRequestingAccessIfNeeded](self, "isAccessGrantedRequestingAccessIfNeeded");
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CNContactsFoundationErrorDomain"), 7, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (a3)
      *a3 = objc_retainAutorelease(v5);

  }
  return v4;
}

- (BOOL)isAccessGrantedRequestingAccessIfNeeded
{
  int64_t v3;
  void *v4;

  v3 = -[CNAuthorizationContext authorizationStatus](self, "authorizationStatus");
  if (!v3)
  {
    -[CNAuthorizationContext requestAuthorizationFuture:](self, "requestAuthorizationFuture:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = -[CNAuthorizationContext resolveRequestAuthorizationFuture:](self, "resolveRequestAuthorizationFuture:", v4);

  }
  return (v3 & 0xFFFFFFFFFFFFFFFELL) == 2;
}

id __50__CNAuthorizationContext_cachedNotesAccessGranted__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;

  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 48);
  if ((objc_msgSend(*(id *)(a1 + 32), "shouldAlwaysQueryAuthorizationStatus") & 1) != 0 || !v2)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "isNotesAccessGrantedImpl"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 48), v3);
    v2 = v3;
  }
  v4 = v2;

  return v4;
}

id __62__CNAuthorizationContext_cachedAddressingGrammarAccessGranted__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;

  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 56);
  if ((objc_msgSend(*(id *)(a1 + 32), "shouldAlwaysQueryAuthorizationStatus") & 1) != 0 || !v2)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "isAddressingGrammarAccessGrantedImpl"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 56), v3);
    v2 = v3;
  }
  v4 = v2;

  return v4;
}

- (int64_t)cachedAuthorizationStatus
{
  CNUnfairLock *authorizationStatusLock;
  void *v3;
  int64_t v4;
  _QWORD v6[5];

  authorizationStatusLock = self->_authorizationStatusLock;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __51__CNAuthorizationContext_cachedAuthorizationStatus__block_invoke;
  v6[3] = &unk_1E29BA248;
  v6[4] = self;
  CNResultWithLock(authorizationStatusLock, v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  return v4;
}

id __51__CNAuthorizationContext_cachedAuthorizationStatus__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "integerValue");
  if ((objc_msgSend(*(id *)(a1 + 32), "shouldAlwaysQueryAuthorizationStatus") & 1) != 0 || !v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "tccServices");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "cnAuditToken");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "assumedIdentity");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v4, "checkAuthorizationStatusOfAuditToken:assumedIdentity:", v5, v6);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v7);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 32), v3);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (BOOL)shouldAlwaysQueryAuthorizationStatus
{
  void *v2;
  char v3;
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __62__CNAuthorizationContext_shouldAlwaysQueryAuthorizationStatus__block_invoke;
  v5[3] = &unk_1E29B8C60;
  v5[4] = self;
  cn_objectResultWithObjectLock(self, v5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (BOOL)isAccessRestricted
{
  void *v2;
  char v3;

  -[CNAuthorizationContext tccServices](self, "tccServices");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isAuthorizationRestricted");

  return v3;
}

- (CNTCC)tccServices
{
  return self->_tccServices;
}

- (CNAuditToken)cnAuditToken
{
  return self->_cnAuditToken;
}

- (OS_tcc_identity)assumedIdentity
{
  return self->_assumedIdentity;
}

- (BOOL)isAddressingGrammarAccessGrantedImpl
{
  _BOOL4 v3;

  v3 = -[CNAuthorizationContext isAccessGranted](self, "isAccessGranted");
  if (v3)
    LOBYTE(v3) = -[CNAuthorizationContext isFirstPartyAddressingGrammarEntitled](self, "isFirstPartyAddressingGrammarEntitled");
  return v3;
}

- (BOOL)isNotesAccessGrantedImpl
{
  _BOOL4 v3;

  v3 = -[CNAuthorizationContext isAccessGranted](self, "isAccessGranted");
  if (v3)
    LOBYTE(v3) = -[CNAuthorizationContext isFirstPartyNotesEntitled](self, "isFirstPartyNotesEntitled")
              || -[CNAuthorizationContext isThirdPartyNotesEntitled](self, "isThirdPartyNotesEntitled");
  return v3;
}

- (BOOL)isAccessGranted
{
  return -[CNAuthorizationContext isFullAccessGranted](self, "isFullAccessGranted")
      || -[CNAuthorizationContext isLimitedAccessGranted](self, "isLimitedAccessGranted");
}

- (BOOL)isFirstPartyAddressingGrammarEntitled
{
  return -[CNAuthorizationContext isClientTCCAllowed](self, "isClientTCCAllowed")
      || -[CNAuthorizationContext isClientTCCRegionalAllowed](self, "isClientTCCRegionalAllowed");
}

- (BOOL)isFirstPartyNotesEntitled
{
  return -[CNAuthorizationContext isClientTCCAllowed](self, "isClientTCCAllowed")
      || -[CNAuthorizationContext isClientTCCRegionalAllowed](self, "isClientTCCRegionalAllowed");
}

- (BOOL)isClientTCCAllowed
{
  void *v2;
  char v3;
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __44__CNAuthorizationContext_isClientTCCAllowed__block_invoke;
  v5[3] = &unk_1E29B8C60;
  v5[4] = self;
  cn_objectResultWithObjectLock(self, v5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (BOOL)isClientTCCRegionalAllowedImpl
{
  void *v3;
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  v5[0] = CFSTR("com.apple.private.tcc.allow-or-regional-prompt");
  v5[1] = CFSTR("com.apple.private.tcc.allow-or-regional-prompt.overridable");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[CNAuthorizationContext checkTCCEntitlementNamesAllowContacts:](self, "checkTCCEntitlementNamesAllowContacts:", v3);

  return (char)self;
}

- (BOOL)isClientTCCAllowedImpl
{
  void *v3;
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  v5[0] = CFSTR("com.apple.private.tcc.allow");
  v5[1] = CFSTR("com.apple.private.tcc.allow.overridable");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[CNAuthorizationContext checkTCCEntitlementNamesAllowContacts:](self, "checkTCCEntitlementNamesAllowContacts:", v3);

  return (char)self;
}

- (BOOL)checkTCCEntitlementNamesAllowContacts:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  NSObject *v13;
  id v15;
  id v16;
  _OWORD v17[2];

  v4 = a3;
  -[CNAuthorizationContext cnAuditToken](self, "cnAuditToken");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[CNEnvironmentBase currentEnvironment](CNEnvironment, "currentEnvironment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "entitlementVerifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v5)
  {
    -[CNAuthorizationContext cnAuditToken](self, "cnAuditToken");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
      objc_msgSend(v9, "audit_token");
    else
      memset(v17, 0, sizeof(v17));
    v16 = 0;
    LOBYTE(v11) = objc_msgSend(v8, "auditToken:hasArrayWithStringValue:forAnyEntitlement:error:", v17, CFSTR("kTCCServiceAddressBook"), v4, &v16);
    v12 = v16;

  }
  else
  {
    v15 = 0;
    v11 = objc_msgSend(v7, "currentProcessHasArrayWithStringValue:forAnyEntitlement:error:", CFSTR("kTCCServiceAddressBook"), v4, &v15);
    v12 = v15;
  }

  if (v12)
  {
    objc_msgSend((id)objc_opt_class(), "os_log");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[CNAuthorizationContext checkTCCEntitlementNamesAllowContacts:].cold.1();

  }
  return v11;
}

- (BOOL)isGreenTeaDevice
{
  void *v2;
  char v3;

  +[CNEnvironmentBase currentEnvironment](CNEnvironment, "currentEnvironment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isGreenTeaDevice");

  return v3;
}

- (CNAuthorizationContext)initWithAuditToken:(id)a3 assumedIdentity:(id)a4
{
  id v6;
  id v7;
  char v8;
  CNAuthorizationContext *v9;
  CNAuthorizationContext *v10;

  v6 = a3;
  v7 = a4;
  if (v6)
    v8 = 0;
  else
    v8 = objc_msgSend((id)objc_opt_class(), "shouldIgnoreAssumedIdentity:", v7);
  objc_msgSend((id)objc_opt_class(), "sharedInstance");
  v9 = (CNAuthorizationContext *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if ((v8 & 1) == 0)
  {

    self = -[CNAuthorizationContext initWithAuditToken:assumedIdentity:tccServices:](self, "initWithAuditToken:assumedIdentity:tccServices:", v6, v7, 0);
    v10 = self;
  }

  return v10;
}

void __40__CNAuthorizationContext_sharedInstance__block_invoke()
{
  CNAuthorizationContext *v0;
  void *v1;

  v0 = -[CNAuthorizationContext initWithAuditToken:assumedIdentity:tccServices:]([CNAuthorizationContext alloc], "initWithAuditToken:assumedIdentity:tccServices:", 0, 0, 0);
  v1 = (void *)sharedInstance_cn_once_object_2_1;
  sharedInstance_cn_once_object_2_1 = (uint64_t)v0;

}

- (CNAuthorizationContext)initWithAuditToken:(id)a3 assumedIdentity:(id)a4 tccServices:(id)a5
{
  id v9;
  id v10;
  id v11;
  CNAuthorizationContext *v12;
  CNTCC *v13;
  CNTCC *tccServices;
  NSNumber *authorizationStatusCachedValue;
  CNUnfairLock *v16;
  CNUnfairLock *authorizationStatusLock;
  CNUnfairLock *v18;
  CNUnfairLock *notesAccessStatusLock;
  CNUnfairLock *v20;
  CNUnfairLock *addressingGrammarAccessStatusLock;
  CNAuthorizationContext *v22;
  objc_super v24;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v24.receiver = self;
  v24.super_class = (Class)CNAuthorizationContext;
  v12 = -[CNAuthorizationContext init](&v24, sel_init);
  if (v12)
  {
    if (v11)
    {
      v13 = (CNTCC *)v11;
    }
    else
    {
      +[CNTCCFactory defaultTCC](CNTCCFactory, "defaultTCC");
      v13 = (CNTCC *)objc_claimAutoreleasedReturnValue();
    }
    tccServices = v12->_tccServices;
    v12->_tccServices = v13;

    objc_storeStrong((id *)&v12->_cnAuditToken, a3);
    objc_storeStrong((id *)&v12->_assumedIdentity, a4);
    authorizationStatusCachedValue = v12->_authorizationStatusCachedValue;
    v12->_authorizationStatusCachedValue = (NSNumber *)&unk_1E29F0028;

    v16 = objc_alloc_init(CNUnfairLock);
    authorizationStatusLock = v12->_authorizationStatusLock;
    v12->_authorizationStatusLock = v16;

    v18 = objc_alloc_init(CNUnfairLock);
    notesAccessStatusLock = v12->_notesAccessStatusLock;
    v12->_notesAccessStatusLock = v18;

    v20 = objc_alloc_init(CNUnfairLock);
    addressingGrammarAccessStatusLock = v12->_addressingGrammarAccessStatusLock;
    v12->_addressingGrammarAccessStatusLock = v20;

    v22 = v12;
  }

  return v12;
}

+ (BOOL)shouldIgnoreAssumedIdentity:(id)a3
{
  id v4;
  void *v5;
  char v6;
  NSObject *v7;

  if (!a3)
    return 1;
  v4 = a3;
  -[objc_class bundleIdentifierForIdentity:](+[CNTCCFactory defaultClass](CNTCCFactory, "defaultClass"), "bundleIdentifierForIdentity:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(a1, "shouldIgnoreAssumedIdentityForBundleIdentifier:", v5);
  objc_msgSend((id)objc_opt_class(), "os_log");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    +[CNAuthorizationContext shouldIgnoreAssumedIdentity:].cold.1(v6, (uint64_t)v5, v7);

  return v6;
}

+ (BOOL)shouldIgnoreAssumedIdentityForBundleIdentifier:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  v4 = v3;
  if (v3 && objc_msgSend(v3, "length"))
    v5 = objc_msgSend(&unk_1E29F0058, "containsObject:", v4);
  else
    v5 = 0;

  return v5;
}

+ (id)os_log
{
  if (os_log_cn_once_token_1_5 != -1)
    dispatch_once(&os_log_cn_once_token_1_5, &__block_literal_global_34);
  return (id)os_log_cn_once_object_1_5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addressingGrammarAccessStatusLock, 0);
  objc_storeStrong((id *)&self->_notesAccessStatusLock, 0);
  objc_storeStrong((id *)&self->_authorizationStatusLock, 0);
  objc_storeStrong((id *)&self->_clientBundleIdentifierCachedValue, 0);
  objc_storeStrong((id *)&self->_isClientFirstOrSecondPartyCachedValue, 0);
  objc_storeStrong((id *)&self->_isClientTCCRegionalAllowedCachedValue, 0);
  objc_storeStrong((id *)&self->_isClientTCCAllowedCachedValue, 0);
  objc_storeStrong((id *)&self->_isAddressingGrammarAccessGrantedCachedValue, 0);
  objc_storeStrong((id *)&self->_isNotesAccessGrantedCachedValue, 0);
  objc_storeStrong((id *)&self->_shouldAlwaysQueryAuthorizationStatusCachedValue, 0);
  objc_storeStrong((id *)&self->_authorizationStatusCachedValue, 0);
  objc_storeStrong((id *)&self->_tccServices, 0);
  objc_storeStrong((id *)&self->_assumedIdentity, 0);
  objc_storeStrong((id *)&self->_cnAuditToken, 0);
}

void __32__CNAuthorizationContext_os_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contacts", "authorization-context");
  v1 = (void *)os_log_cn_once_object_1_5;
  os_log_cn_once_object_1_5 = (uint64_t)v0;

}

- (void)requestAuthorization:(int64_t)a3 completionHandler:(id)a4
{
  void (**v6)(id, _QWORD, void *);
  int64_t v7;
  int64_t v8;
  void *v9;
  uint64_t v10;
  void (**v11)(id, _QWORD, void *);
  _QWORD v12[4];
  void (**v13)(id, _QWORD, void *);
  _QWORD v14[5];
  id v15;

  v6 = (void (**)(id, _QWORD, void *))a4;
  v7 = -[CNAuthorizationContext authorizationStatus](self, "authorizationStatus");
  if (v7)
  {
    v8 = v7;
    -[CNAuthorizationContext errorForStatus:](self, "errorForStatus:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, v8, v9);
  }
  else
  {
    -[CNAuthorizationContext requestAuthorizationFuture:](self, "requestAuthorizationFuture:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __65__CNAuthorizationContext_requestAuthorization_completionHandler___block_invoke;
    v14[3] = &unk_1E29BA1F8;
    v14[4] = self;
    v11 = v6;
    v15 = v11;
    objc_msgSend(v9, "addSuccessBlock:", v14);
    v12[0] = v10;
    v12[1] = 3221225472;
    v12[2] = __65__CNAuthorizationContext_requestAuthorization_completionHandler___block_invoke_2;
    v12[3] = &unk_1E29BA220;
    v13 = v11;
    objc_msgSend(v9, "addFailureBlock:", v12);

  }
}

- (id)errorForStatus:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;

  if (a3 != 1)
    return 0;
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CNContactsFoundationErrorDomain"), 7, 0, v3, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)isClientTCCRegionalAllowed
{
  void *v2;
  char v3;
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __52__CNAuthorizationContext_isClientTCCRegionalAllowed__block_invoke;
  v5[3] = &unk_1E29B8C60;
  v5[4] = self;
  cn_objectResultWithObjectLock(self, v5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (CNAuthorizationContext)init
{
  return -[CNAuthorizationContext initWithAuditToken:assumedIdentity:](self, "initWithAuditToken:assumedIdentity:", 0, 0);
}

- (BOOL)isFullAccessGranted
{
  return -[CNAuthorizationContext authorizationStatus](self, "authorizationStatus") == 3;
}

- (BOOL)isLimitedAccessGranted
{
  return -[CNAuthorizationContext authorizationStatus](self, "authorizationStatus") == 2;
}

- (BOOL)isAccessDenied
{
  return -[CNAuthorizationContext authorizationStatus](self, "authorizationStatus") == 1;
}

- (BOOL)isAccessUnknown
{
  return -[CNAuthorizationContext authorizationStatus](self, "authorizationStatus") == 0;
}

- (BOOL)isClientFirstOrSecondParty
{
  void *v2;
  char v3;
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __52__CNAuthorizationContext_isClientFirstOrSecondParty__block_invoke;
  v5[3] = &unk_1E29B8C60;
  v5[4] = self;
  cn_objectResultWithObjectLock(self, v5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

id __52__CNAuthorizationContext_isClientFirstOrSecondParty__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = (void *)v2[10];
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v2, "isClientFirstOrSecondPartyImpl"));
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 80);
    *(_QWORD *)(v5 + 80) = v4;

    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 80);
  }
  return v3;
}

- (NSString)clientBundleIdentifier
{
  void *v2;
  void *v3;
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __48__CNAuthorizationContext_clientBundleIdentifier__block_invoke;
  v5[3] = &unk_1E29B8C60;
  v5[4] = self;
  cn_objectResultWithObjectLock(self, v5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  CNNullToNil_block_invoke_3((uint64_t)&__block_literal_global_2_1, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

id __48__CNAuthorizationContext_clientBundleIdentifier__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = (void *)v2[11];
  if (!v3)
  {
    objc_msgSend(v2, "clientBundleIdentifierImpl");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 88);
    *(_QWORD *)(v5 + 88) = v4;

    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 88);
  }
  return v3;
}

void __65__CNAuthorizationContext_requestAuthorization_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "errorForStatus:", objc_msgSend(a2, "integerValue"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __65__CNAuthorizationContext_requestAuthorization_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)simulateStatus:(int64_t)a3
{
  id v4;

  -[CNAuthorizationContext tccServices](self, "tccServices");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "simulateStatus:", a3);

}

- (void)stopSimulation
{
  id v2;

  -[CNAuthorizationContext tccServices](self, "tccServices");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stopSimulation");

}

- (BOOL)isClientTCCUncoupledProcess
{
  void *v3;

  -[CNAuthorizationContext assumedIdentity](self, "assumedIdentity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3
      && -[CNAuthorizationContext doesClientHaveEntitlement:](self, "doesClientHaveEntitlement:", CFSTR("com.apple.private.attribution.explicitly-assumed-identities"));
}

- (BOOL)isClientTCCCoupledProcess
{
  return -[CNAuthorizationContext doesClientHaveEntitlement:](self, "doesClientHaveEntitlement:", CFSTR("com.apple.private.attribution.implicitly-assumed-identity"));
}

- (BOOL)doesClientHaveEntitlement:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  NSObject *v13;
  BOOL v14;
  void *v16;
  const __CFString *v17;
  void *v18;
  id v19;
  id v20;
  _OWORD v21[2];
  uint8_t buf[4];
  const __CFString *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  __int16 v28;
  void *v29;
  id v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CNAuthorizationContext cnAuditToken](self, "cnAuditToken");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[CNEnvironmentBase currentEnvironment](CNEnvironment, "currentEnvironment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "entitlementVerifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[CNAuthorizationContext cnAuditToken](self, "cnAuditToken");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
      objc_msgSend(v8, "audit_token");
    else
      memset(v21, 0, sizeof(v21));
    v31[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0;
    objc_msgSend(v7, "valuesForAuditToken:forEntitlements:error:", v21, v12, &v20);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v20;

  }
  else
  {
    v30 = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v30, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0;
    objc_msgSend(v7, "valuesForCurrentProcessForEntitlements:error:", v9, &v19);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v19;
  }

  if (v11)
  {
    objc_msgSend((id)objc_opt_class(), "os_log");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      -[CNAuthorizationContext cnAuditToken](self, "cnAuditToken");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16)
        v17 = CFSTR("audit token");
      else
        v17 = CFSTR("current process");
      objc_msgSend(v11, "userInfo");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v23 = v17;
      v24 = 2112;
      v25 = v4;
      v26 = 2112;
      v27 = v11;
      v28 = 2112;
      v29 = v18;
      _os_log_error_impl(&dword_18F80C000, v13, OS_LOG_TYPE_ERROR, "Error checking %@ entitlement %@: %@ %@", buf, 0x2Au);

    }
  }
  v14 = CNIsDictionaryEmpty_block_invoke((uint64_t)&__block_literal_global_24, v10);

  return !v14;
}

- (BOOL)isClientTCCKilledOnAuthorizationChange
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  NSObject *v11;
  id v13;
  id v14;
  _OWORD v15[2];

  -[CNAuthorizationContext cnAuditToken](self, "cnAuditToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  +[CNEnvironmentBase currentEnvironment](CNEnvironment, "currentEnvironment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entitlementVerifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v3)
  {
    -[CNAuthorizationContext cnAuditToken](self, "cnAuditToken");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
      objc_msgSend(v7, "audit_token");
    else
      memset(v15, 0, sizeof(v15));
    v14 = 0;
    LOBYTE(v9) = objc_msgSend(v6, "auditToken:hasBooleanEntitlement:error:", v15, CFSTR("com.apple.private.tcc.kill-on-assumed-identity-authorization-change"), &v14);
    v10 = v14;

  }
  else
  {
    v13 = 0;
    v9 = objc_msgSend(v5, "currentProcessHasBooleanEntitlement:error:", CFSTR("com.apple.private.tcc.kill-on-assumed-identity-authorization-change"), &v13);
    v10 = v13;
  }

  if (v10)
  {
    objc_msgSend((id)objc_opt_class(), "os_log");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[CNAuthorizationContext isClientTCCKilledOnAuthorizationChange].cold.1();

  }
  return v9;
}

- (BOOL)isThirdPartyNotesEntitled
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  NSObject *v11;
  id v13;
  id v14;
  _OWORD v15[2];

  -[CNAuthorizationContext cnAuditToken](self, "cnAuditToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  +[CNEnvironmentBase currentEnvironment](CNEnvironment, "currentEnvironment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entitlementVerifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v3)
  {
    -[CNAuthorizationContext cnAuditToken](self, "cnAuditToken");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
      objc_msgSend(v7, "audit_token");
    else
      memset(v15, 0, sizeof(v15));
    v14 = 0;
    LOBYTE(v9) = objc_msgSend(v6, "auditToken:hasBooleanEntitlement:error:", v15, CFSTR("com.apple.developer.contacts.notes"), &v14);
    v10 = v14;

  }
  else
  {
    v13 = 0;
    v9 = objc_msgSend(v5, "currentProcessHasBooleanEntitlement:error:", CFSTR("com.apple.developer.contacts.notes"), &v13);
    v10 = v13;
  }

  if (v10)
  {
    objc_msgSend((id)objc_opt_class(), "os_log");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[CNAuthorizationContext isThirdPartyNotesEntitled].cold.1();

  }
  return v9;
}

- (BOOL)isClientFirstOrSecondPartyImpl
{
  return -[CNAuthorizationContext checkClientIsFirstOrSecondParty](self, "checkClientIsFirstOrSecondParty")
      || -[CNAuthorizationContext doesClientHaveEntitlement:](self, "doesClientHaveEntitlement:", CFSTR("com.apple.private.contacts"));
}

- (BOOL)checkClientIsFirstOrSecondParty
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  NSObject *v11;
  id v13;
  id v14;
  _OWORD v15[2];

  -[CNAuthorizationContext cnAuditToken](self, "cnAuditToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  +[CNEnvironmentBase currentEnvironment](CNEnvironment, "currentEnvironment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entitlementVerifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v3)
  {
    -[CNAuthorizationContext cnAuditToken](self, "cnAuditToken");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
      objc_msgSend(v7, "audit_token");
    else
      memset(v15, 0, sizeof(v15));
    v14 = 0;
    LOBYTE(v9) = objc_msgSend(v6, "auditToken:isFirstOrSecondPartyWithError:", v15, &v14);
    v10 = v14;

  }
  else
  {
    v13 = 0;
    v9 = objc_msgSend(v5, "currentProcessIsFirstOrSecondPartyWithError:", &v13);
    v10 = v13;
  }

  if (v10)
  {
    objc_msgSend((id)objc_opt_class(), "os_log");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[CNAuthorizationContext checkClientIsFirstOrSecondParty].cold.1();

  }
  return v9;
}

- (id)clientBundleIdentifierImpl
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[CNAuthorizationContext tccServices](self, "tccServices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAuthorizationContext cnAuditToken](self, "cnAuditToken");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAuthorizationContext assumedIdentity](self, "assumedIdentity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifierForAuditToken:assumedIdentity:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  CNNilToNull_block_invoke_2((uint64_t)&__block_literal_global_1_2, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)requestAuthorizationFuture:(int64_t)a3
{
  CNPromise *v5;
  void *v6;
  void *v7;
  void *v8;
  CNPromise *v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t);
  void *v15;
  CNAuthorizationContext *v16;
  CNPromise *v17;

  v5 = objc_alloc_init(CNPromise);
  -[CNAuthorizationContext tccServices](self, "tccServices");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAuthorizationContext cnAuditToken](self, "cnAuditToken");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAuthorizationContext assumedIdentity](self, "assumedIdentity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __53__CNAuthorizationContext_requestAuthorizationFuture___block_invoke;
  v15 = &unk_1E29BA270;
  v16 = self;
  v17 = v5;
  v9 = v5;
  objc_msgSend(v6, "requestAuthorization:auditToken:assumedIdentity:completionHandler:", a3, v7, v8, &v12);

  -[CNPromise future](v9, "future", v12, v13, v14, v15, v16);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __53__CNAuthorizationContext_requestAuthorizationFuture___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "authorizationStatusLock");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __53__CNAuthorizationContext_requestAuthorizationFuture___block_invoke_2;
  v6[3] = &unk_1E29B8C10;
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v5 = v3;
  CNRunWithLock(v4, v6);

  objc_msgSend(*(id *)(a1 + 40), "finishWithResult:", v5);
}

void __53__CNAuthorizationContext_requestAuthorizationFuture___block_invoke_2(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 32), *(id *)(a1 + 40));
}

- (int64_t)resolveRequestAuthorizationFuture:(id)a3
{
  void *v3;
  id v4;
  NSObject *v5;
  int64_t v6;
  id v8;

  v8 = 0;
  objc_msgSend(a3, "result:", &v8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v8;
  if (!v3)
  {
    objc_msgSend((id)objc_opt_class(), "os_log");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[CNAuthorizationContext resolveRequestAuthorizationFuture:].cold.1(v4, v5);

    v3 = (void *)MEMORY[0x1E0C9AAA0];
  }
  v6 = objc_msgSend(v3, "integerValue");

  return v6;
}

- (void)saveAuthorizationRecord:(id)a3 dontKillApp:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a4;
  v6 = a3;
  -[CNAuthorizationContext tccServices](self, "tccServices");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "saveAuthorizationRecord:dontKillApp:", v6, v4);

}

- (void)setAuthorizationStatus:(int64_t)a3 forBundleIdentifier:(id)a4 noKillApp:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;

  v5 = a5;
  v8 = a4;
  -[CNAuthorizationContext tccServices](self, "tccServices");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAuthorizationStatus:forBundleIdentifier:noKillApp:", a3, v8, v5);

}

- (void)resetCachedStatus
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  _QWORD v8[5];
  _QWORD v9[5];

  -[CNAuthorizationContext authorizationStatusLock](self, "authorizationStatusLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __43__CNAuthorizationContext_resetCachedStatus__block_invoke;
  v9[3] = &unk_1E29B9358;
  v9[4] = self;
  CNRunWithLock(v3, v9);

  -[CNAuthorizationContext notesAccessStatusLock](self, "notesAccessStatusLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  v8[1] = 3221225472;
  v8[2] = __43__CNAuthorizationContext_resetCachedStatus__block_invoke_2;
  v8[3] = &unk_1E29B9358;
  v8[4] = self;
  CNRunWithLock(v5, v8);

  -[CNAuthorizationContext addressingGrammarAccessStatusLock](self, "addressingGrammarAccessStatusLock");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v4;
  v7[1] = 3221225472;
  v7[2] = __43__CNAuthorizationContext_resetCachedStatus__block_invoke_3;
  v7[3] = &unk_1E29B9358;
  v7[4] = self;
  CNRunWithLock(v6, v7);

}

void __43__CNAuthorizationContext_resetCachedStatus__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 32);
  *(_QWORD *)(v1 + 32) = &unk_1E29F0028;

}

void __43__CNAuthorizationContext_resetCachedStatus__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 48);
  *(_QWORD *)(v1 + 48) = 0;

}

void __43__CNAuthorizationContext_resetCachedStatus__block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 56);
  *(_QWORD *)(v1 + 56) = 0;

}

- (void)setCnAuditToken:(id)a3
{
  objc_storeStrong((id *)&self->_cnAuditToken, a3);
}

- (void)setAssumedIdentity:(id)a3
{
  objc_storeStrong((id *)&self->_assumedIdentity, a3);
}

- (void)setTccServices:(id)a3
{
  objc_storeStrong((id *)&self->_tccServices, a3);
}

- (NSNumber)authorizationStatusCachedValue
{
  return self->_authorizationStatusCachedValue;
}

- (void)setAuthorizationStatusCachedValue:(id)a3
{
  objc_storeStrong((id *)&self->_authorizationStatusCachedValue, a3);
}

- (NSNumber)shouldAlwaysQueryAuthorizationStatusCachedValue
{
  return self->_shouldAlwaysQueryAuthorizationStatusCachedValue;
}

- (void)setShouldAlwaysQueryAuthorizationStatusCachedValue:(id)a3
{
  objc_storeStrong((id *)&self->_shouldAlwaysQueryAuthorizationStatusCachedValue, a3);
}

- (NSNumber)isNotesAccessGrantedCachedValue
{
  return self->_isNotesAccessGrantedCachedValue;
}

- (void)setIsNotesAccessGrantedCachedValue:(id)a3
{
  objc_storeStrong((id *)&self->_isNotesAccessGrantedCachedValue, a3);
}

- (NSNumber)isAddressingGrammarAccessGrantedCachedValue
{
  return self->_isAddressingGrammarAccessGrantedCachedValue;
}

- (void)setIsAddressingGrammarAccessGrantedCachedValue:(id)a3
{
  objc_storeStrong((id *)&self->_isAddressingGrammarAccessGrantedCachedValue, a3);
}

- (NSNumber)isClientTCCAllowedCachedValue
{
  return self->_isClientTCCAllowedCachedValue;
}

- (void)setIsClientTCCAllowedCachedValue:(id)a3
{
  objc_storeStrong((id *)&self->_isClientTCCAllowedCachedValue, a3);
}

- (NSNumber)isClientTCCRegionalAllowedCachedValue
{
  return self->_isClientTCCRegionalAllowedCachedValue;
}

- (void)setIsClientTCCRegionalAllowedCachedValue:(id)a3
{
  objc_storeStrong((id *)&self->_isClientTCCRegionalAllowedCachedValue, a3);
}

- (NSNumber)isClientFirstOrSecondPartyCachedValue
{
  return self->_isClientFirstOrSecondPartyCachedValue;
}

- (void)setIsClientFirstOrSecondPartyCachedValue:(id)a3
{
  objc_storeStrong((id *)&self->_isClientFirstOrSecondPartyCachedValue, a3);
}

- (NSString)clientBundleIdentifierCachedValue
{
  return self->_clientBundleIdentifierCachedValue;
}

- (void)setClientBundleIdentifierCachedValue:(id)a3
{
  objc_storeStrong((id *)&self->_clientBundleIdentifierCachedValue, a3);
}

- (CNUnfairLock)authorizationStatusLock
{
  return self->_authorizationStatusLock;
}

- (void)setAuthorizationStatusLock:(id)a3
{
  objc_storeStrong((id *)&self->_authorizationStatusLock, a3);
}

- (CNUnfairLock)notesAccessStatusLock
{
  return self->_notesAccessStatusLock;
}

- (void)setNotesAccessStatusLock:(id)a3
{
  objc_storeStrong((id *)&self->_notesAccessStatusLock, a3);
}

- (CNUnfairLock)addressingGrammarAccessStatusLock
{
  return self->_addressingGrammarAccessStatusLock;
}

- (void)setAddressingGrammarAccessStatusLock:(id)a3
{
  objc_storeStrong((id *)&self->_addressingGrammarAccessStatusLock, a3);
}

+ (void)shouldIgnoreAssumedIdentity:(os_log_t)log .cold.1(char a1, uint64_t a2, os_log_t log)
{
  const __CFString *v3;
  int v4;
  const __CFString *v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = CFSTR("ignore");
  if ((a1 & 1) == 0)
    v3 = CFSTR("honor");
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_debug_impl(&dword_18F80C000, log, OS_LOG_TYPE_DEBUG, "Will %@ assumed identity for assumed bundle identifier %@", (uint8_t *)&v4, 0x16u);
}

- (void)isClientTCCKilledOnAuthorizationChange
{
  id v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_4_0();
  objc_msgSend(v0, "cnAuditToken");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_1_3(&dword_18F80C000, v3, v4, "Error checking %@ TCC kill on authorization change entitlement: %@ %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_2();
}

- (void)isThirdPartyNotesEntitled
{
  id v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_4_0();
  objc_msgSend(v0, "cnAuditToken");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_1_3(&dword_18F80C000, v3, v4, "Error checking %@ developer notes entitlement: %@ %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_2();
}

- (void)checkTCCEntitlementNamesAllowContacts:.cold.1()
{
  id v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_4_0();
  objc_msgSend(v0, "cnAuditToken");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_1_3(&dword_18F80C000, v3, v4, "Error checking %@ TCC allow entitlement names: %@ %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_2();
}

- (void)checkClientIsFirstOrSecondParty
{
  id v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_4_0();
  objc_msgSend(v0, "cnAuditToken");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_1_3(&dword_18F80C000, v3, v4, "Error checking %@ first or second party: %@ %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_2();
}

- (void)resolveRequestAuthorizationFuture:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v4;
  int v5;
  void *v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412546;
  v6 = a1;
  v7 = 2112;
  v8 = v4;
  _os_log_error_impl(&dword_18F80C000, a2, OS_LOG_TYPE_ERROR, "Error resolving request authorization future: %@ %@", (uint8_t *)&v5, 0x16u);

}

@end
