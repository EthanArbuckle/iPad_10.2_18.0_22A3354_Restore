@implementation CNContactViewCache

- (void)setContactStore:(id)a3
{
  objc_storeStrong((id *)&self->_contactStore, a3);
}

uint64_t __34__CNContactViewCache_contactStore__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "nts_lazyContactStore");
}

- (CNContactViewCache)init
{
  CNContactViewCache *v2;
  CNContactViewCache *v3;
  CNContactViewCache *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CNContactViewCache;
  v2 = -[CNContactViewCache init](&v6, sel_init);
  v3 = v2;
  if (v2)
    v4 = v2;

  return v3;
}

- (id)nts_lazyContactStore
{
  CNContactStore *contactStore;
  CNContactStore *v4;
  CNContactStore *v5;

  contactStore = self->_contactStore;
  if (!contactStore)
  {
    v4 = (CNContactStore *)objc_alloc_init(MEMORY[0x1E0C97298]);
    v5 = self->_contactStore;
    self->_contactStore = v4;

    contactStore = self->_contactStore;
  }
  return contactStore;
}

- (id)containerForContact:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[5];
  id v12;
  id v13;

  v4 = a3;
  if (v4)
  {
    -[CNContactViewCache contactStore](self, "contactStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactViewCache containerIdentifierForContact:](self, "containerIdentifierForContact:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      -[CNContactViewCache cachedContainers](self, "cachedContainers");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __42__CNContactViewCache_containerForContact___block_invoke;
      v11[3] = &unk_1E204D3A0;
      v11[4] = self;
      v12 = v4;
      v13 = v5;
      objc_msgSend(v7, "objectForKey:onCacheMiss:", v6, v11);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      (*(void (**)(void))(*MEMORY[0x1E0D13880] + 16))();
      v9 = (void *)objc_claimAutoreleasedReturnValue();

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

- (CNContactStore)contactStore
{
  cn_objectResultWithObjectLock();
  return (CNContactStore *)(id)objc_claimAutoreleasedReturnValue();
}

- (CNCache)cachedContainers
{
  CNCache *cachedContainers;
  CNCache *v4;
  CNCache *v5;

  cachedContainers = self->_cachedContainers;
  if (!cachedContainers)
  {
    objc_msgSend(MEMORY[0x1E0D139B0], "cache");
    v4 = (CNCache *)objc_claimAutoreleasedReturnValue();
    v5 = self->_cachedContainers;
    self->_cachedContainers = v4;

    cachedContainers = self->_cachedContainers;
  }
  return cachedContainers;
}

- (id)policyForContact:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[5];
  id v14;

  v4 = a3;
  -[CNContactViewCache containerIdentifierForContact:](self, "containerIdentifierForContact:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[CNContactViewCache cachedPolicies](self, "cachedPolicies");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __39__CNContactViewCache_policyForContact___block_invoke;
    v13[3] = &unk_1E204D300;
    v13[4] = self;
    v14 = v4;
    objc_msgSend(v9, "objectForKey:onCacheMiss:", v8, v13);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }
  (*(void (**)(_QWORD, void *, uint64_t, uint64_t, uint64_t))(*MEMORY[0x1E0D13880] + 16))(*MEMORY[0x1E0D13880], v10, v5, v6, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)containerIdentifierForContact:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD v14[5];
  id v15;

  v4 = a3;
  if (objc_msgSend(v4, "hasBeenPersisted"))
  {
    -[CNContactViewCache cachedContactToContainerIDs](self, "cachedContactToContainerIDs");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __52__CNContactViewCache_containerIdentifierForContact___block_invoke;
    v14[3] = &unk_1E204D378;
    v14[4] = self;
    v15 = v4;
    objc_msgSend(v5, "objectForKey:onCacheMiss:", v6, v14);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[CNContactViewCache contactStore](self, "contactStore");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "defaultContainerIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  (*(void (**)(_QWORD, void *, uint64_t, uint64_t, uint64_t))(*MEMORY[0x1E0D13880] + 16))(*MEMORY[0x1E0D13880], v7, v8, v9, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (CNCache)cachedContactToContainerIDs
{
  CNCache *cachedContactToContainerIDs;
  CNCache *v4;
  CNCache *v5;

  cachedContactToContainerIDs = self->_cachedContactToContainerIDs;
  if (!cachedContactToContainerIDs)
  {
    objc_msgSend(MEMORY[0x1E0D139B0], "cache");
    v4 = (CNCache *)objc_claimAutoreleasedReturnValue();
    v5 = self->_cachedContactToContainerIDs;
    self->_cachedContactToContainerIDs = v4;

    cachedContactToContainerIDs = self->_cachedContactToContainerIDs;
  }
  return cachedContactToContainerIDs;
}

- (CNCache)cachedPolicies
{
  CNCache *cachedPolicies;
  CNCache *v4;
  CNCache *v5;

  cachedPolicies = self->_cachedPolicies;
  if (!cachedPolicies)
  {
    objc_msgSend(MEMORY[0x1E0D139B0], "cache");
    v4 = (CNCache *)objc_claimAutoreleasedReturnValue();
    v5 = self->_cachedPolicies;
    self->_cachedPolicies = v4;

    cachedPolicies = self->_cachedPolicies;
  }
  return cachedPolicies;
}

- (void)setCachedTopAccounts:(id)a3
{
  objc_storeStrong((id *)&self->_cachedTopAccounts, a3);
}

- (void)resetCache
{
  -[CNContactViewCache setCachedContactToContainerIDs:](self, "setCachedContactToContainerIDs:", 0);
  -[CNContactViewCache setCachedContainers:](self, "setCachedContainers:", 0);
  -[CNContactViewCache setCachedPolicies:](self, "setCachedPolicies:", 0);
  -[CNContactViewCache setCachedAccounts:](self, "setCachedAccounts:", 0);
  -[CNContactViewCache setCachedTopAccounts:](self, "setCachedTopAccounts:", 0);
}

- (void)setCachedPolicies:(id)a3
{
  objc_storeStrong((id *)&self->_cachedPolicies, a3);
}

- (void)setCachedContainers:(id)a3
{
  objc_storeStrong((id *)&self->_cachedContainers, a3);
}

- (void)setCachedContactToContainerIDs:(id)a3
{
  objc_storeStrong((id *)&self->_cachedContactToContainerIDs, a3);
}

- (void)setCachedAccounts:(id)a3
{
  objc_storeStrong((id *)&self->_cachedAccounts, a3);
}

id __39__CNContactViewCache_policyForContact___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;

  v1 = *MEMORY[0x1E0D13878];
  objc_msgSend(*(id *)(a1 + 32), "_policyForContact:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_policyForContact:(id)a3
{
  if (a3)
    -[CNContactViewCache bestPolicyForContact:](self, "bestPolicyForContact:");
  else
    -[CNContactViewCache defaultContainerPolicy](self, "defaultContainerPolicy");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)bestPolicyForContact:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  id v18;
  id v20;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _QWORD v27[3];

  v27[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_msgSend(v4, "isUnified") & 1) != 0)
  {
    objc_msgSend(v4, "linkedContacts");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v27[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (!v7)
  {

    goto LABEL_22;
  }
  v8 = v7;
  v20 = v4;
  obj = v6;
  v9 = 0;
  v10 = 0;
  v11 = *(_QWORD *)v23;
  do
  {
    for (i = 0; i != v8; ++i)
    {
      if (*(_QWORD *)v23 != v11)
        objc_enumerationMutation(obj);
      -[CNContactViewCache containerForContact:](self, "containerForContact:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i), v20);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        -[CNContactViewCache contactStore](self, "contactStore");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "identifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "policyForContainerWithIdentifier:error:", v15, 0);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          v17 = objc_msgSend((id)objc_opt_class(), "isCandidatePolicy:ofContactInCandidateContainerWithType:preferredOverPolicy:ofContactInContainerWithType:", v16, objc_msgSend(v13, "type"), v9, v10);
          if (objc_msgSend((id)objc_opt_class(), "shouldIgnorePolicyOfContactInGuarianRestrictedContainer:", v13))
          {
            objc_msgSend(MEMORY[0x1E0C97390], "sharedPermissivePolicy");
            v18 = (id)objc_claimAutoreleasedReturnValue();
            v10 = 3;
            goto LABEL_15;
          }
          if (v17)
          {
            v10 = objc_msgSend(v13, "type");
            v18 = v16;
LABEL_15:

            v9 = v18;
          }
        }

      }
    }
    v6 = obj;
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  }
  while (v8);

  v4 = v20;
  if (!v9)
  {
LABEL_22:
    objc_msgSend(MEMORY[0x1E0C97390], "sharedPermissivePolicy");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

+ (BOOL)shouldIgnorePolicyOfContactInGuarianRestrictedContainer:(id)a3
{
  return objc_msgSend(a3, "isGuardianRestricted");
}

+ (BOOL)isCandidatePolicy:(id)a3 ofContactInCandidateContainerWithType:(int64_t)a4 preferredOverPolicy:(id)a5 ofContactInContainerWithType:(int64_t)a6
{
  id v9;
  id v10;
  void *v11;
  BOOL v12;
  id v13;
  int v14;
  void *v15;
  unint64_t v16;
  void *v17;
  unint64_t v18;

  v9 = a3;
  v10 = a5;
  v11 = v10;
  if (!v9 || v10)
  {
    if (isCandidatePolicy_ofContactInCandidateContainerWithType_preferredOverPolicy_ofContactInContainerWithType__cn_once_token_1 != -1)
      dispatch_once(&isCandidatePolicy_ofContactInCandidateContainerWithType_preferredOverPolicy_ofContactInContainerWithType__cn_once_token_1, &__block_literal_global_42008);
    v13 = (id)isCandidatePolicy_ofContactInCandidateContainerWithType_preferredOverPolicy_ofContactInContainerWithType__cn_once_object_1;
    if (objc_msgSend(v11, "isReadonly"))
      v14 = objc_msgSend(v9, "isReadonly") ^ 1;
    else
      LOBYTE(v14) = 0;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v13, "indexOfObject:", v15);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a6);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v13, "indexOfObject:", v17);

    if (v16 < v18)
      v12 = 1;
    else
      v12 = v14;
  }
  else
  {
    v12 = 1;
  }

  return v12;
}

id __52__CNContactViewCache_containerIdentifierForContact___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v2, "contactStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_uncachedContainerForContact:inStore:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "cachedContainers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v5, v7);

  }
  v8 = *MEMORY[0x1E0D13878];
  objc_msgSend(v5, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_uncachedContainerForContact:(id)a3 inStore:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a4;
  -[CNContactViewCache predicateForContainerForContact:inStore:](self, "predicateForContainerForContact:inStore:", a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v6, "containersMatchingPredicate:error:", v7, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (id)predicateForContainerForContact:(id)a3 inStore:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "hasBeenPersisted"))
  {
    v7 = (void *)MEMORY[0x1E0C972C0];
    objc_msgSend(v5, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "predicateForContainerOfContactWithIdentifier:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v6, "defaultContainerIdentifier");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (v10)
    {
      v12 = (void *)MEMORY[0x1E0C972C0];
      v15[0] = v10;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "predicateForContainersWithIdentifiers:", v13);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v9 = 0;
    }

  }
  return v9;
}

- (id)policyForContainer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = v4;
  if (!v4)
  {
    -[CNContactViewCache contactStore](self, "contactStore");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "defaultContainerIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
      goto LABEL_3;
LABEL_5:
    v7 = 0;
    goto LABEL_6;
  }
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
    goto LABEL_5;
LABEL_3:
  -[CNContactViewCache policyForContainerWithIdentifier:](self, "policyForContainerWithIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:

  return v7;
}

- (id)policyForDefaultContainer
{
  void *v3;
  void *v4;
  void *v5;

  -[CNContactViewCache contactStore](self, "contactStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "defaultContainerIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactViewCache policyForContainerWithIdentifier:](self, "policyForContainerWithIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)policyForContainerWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _QWORD v13[5];
  id v14;

  v4 = a3;
  -[CNContactViewCache cachedPolicies](self, "cachedPolicies");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __55__CNContactViewCache_policyForContainerWithIdentifier___block_invoke;
  v13[3] = &unk_1E204D300;
  v13[4] = self;
  v14 = v4;
  v6 = v4;
  objc_msgSend(v5, "objectForKey:onCacheMiss:", v6, v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(_QWORD, void *, uint64_t, uint64_t, uint64_t))(*MEMORY[0x1E0D13880] + 16))(*MEMORY[0x1E0D13880], v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)accountForContact:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  id (*v16)(uint64_t);
  void *v17;
  CNContactViewCache *v18;
  id v19;

  v4 = a3;
  if (v4)
  {
    -[CNContactViewCache containerIdentifierForContact:](self, "containerIdentifierForContact:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      -[CNContactViewCache cachedContainers](self, "cachedContainers");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = MEMORY[0x1E0C809B0];
      v15 = 3221225472;
      v16 = __40__CNContactViewCache_accountForContact___block_invoke;
      v17 = &unk_1E204D328;
      v18 = self;
      v19 = v4;
      objc_msgSend(v6, "objectForKey:onCacheMiss:", v5, &v14);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      (*(void (**)(_QWORD, void *, uint64_t, uint64_t, uint64_t))(*MEMORY[0x1E0D13880] + 16))(*MEMORY[0x1E0D13880], v7, v8, v9, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactViewCache accountForContainer:](self, "accountForContainer:", v11, v14, v15, v16, v17, v18);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)accountForContainer:(id)a3
{
  return -[CNContactViewCache accountForContainer:shouldUseTopLevelAccount:](self, "accountForContainer:shouldUseTopLevelAccount:", a3, 1);
}

- (id)accountForContainer:(id)a3 shouldUseTopLevelAccount:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[5];
  id v13;
  BOOL v14;

  v6 = a3;
  if (v6)
  {
    if (a4)
      -[CNContactViewCache cachedTopAccounts](self, "cachedTopAccounts");
    else
      -[CNContactViewCache cachedAccounts](self, "cachedAccounts");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __67__CNContactViewCache_accountForContainer_shouldUseTopLevelAccount___block_invoke;
    v12[3] = &unk_1E204D350;
    v12[4] = self;
    v13 = v6;
    v14 = a4;
    objc_msgSend(v8, "objectForKey:onCacheMiss:", v9, v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*MEMORY[0x1E0D13880] + 16))();
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (CNCache)cachedAccounts
{
  CNCache *cachedAccounts;
  CNCache *v4;
  CNCache *v5;

  cachedAccounts = self->_cachedAccounts;
  if (!cachedAccounts)
  {
    objc_msgSend(MEMORY[0x1E0D139B0], "cache");
    v4 = (CNCache *)objc_claimAutoreleasedReturnValue();
    v5 = self->_cachedAccounts;
    self->_cachedAccounts = v4;

    cachedAccounts = self->_cachedAccounts;
  }
  return cachedAccounts;
}

- (CNCache)cachedTopAccounts
{
  CNCache *cachedTopAccounts;
  CNCache *v4;
  CNCache *v5;

  cachedTopAccounts = self->_cachedTopAccounts;
  if (!cachedTopAccounts)
  {
    objc_msgSend(MEMORY[0x1E0D139B0], "cache");
    v4 = (CNCache *)objc_claimAutoreleasedReturnValue();
    v5 = self->_cachedTopAccounts;
    self->_cachedTopAccounts = v4;

    cachedTopAccounts = self->_cachedTopAccounts;
  }
  return cachedTopAccounts;
}

- (id)defaultContainerPolicy
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C97390], "sharedPermissivePolicy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactViewCache contactStore](self, "contactStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "defaultContainerIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((*(unsigned int (**)(void))(*MEMORY[0x1E0D13848] + 16))())
  {
    v6 = v3;
  }
  else
  {
    -[CNContactViewCache contactStore](self, "contactStore");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "policyForContainerWithIdentifier:error:", v5, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[CNContactViewCache contactStore](self, "contactStore");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)MEMORY[0x1E0C972C0];
      v17[0] = v5;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "predicateForContainersWithIdentifiers:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "containersMatchingPredicate:error:", v12, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "firstObject");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend((id)objc_opt_class(), "shouldIgnorePolicyOfContactInGuarianRestrictedContainer:", v14))v15 = v3;
      else
        v15 = v8;
      v6 = v15;

    }
    else
    {
      v6 = v3;
    }

  }
  return v6;
}

- (id)_accountForContainer:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  if (a3)
  {
    v4 = (void *)MEMORY[0x1E0C971B0];
    objc_msgSend(a3, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "predicateForAccountForContainerWithIdentifier:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[CNContactViewCache contactStore](self, "contactStore");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "accountsMatchingPredicate:error:", v6, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedTopAccounts, 0);
  objc_storeStrong((id *)&self->_cachedAccounts, 0);
  objc_storeStrong((id *)&self->_cachedPolicies, 0);
  objc_storeStrong((id *)&self->_cachedContainers, 0);
  objc_storeStrong((id *)&self->_cachedContactToContainerIDs, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
}

id __42__CNContactViewCache_containerForContact___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_uncachedContainerForContact:inStore:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*MEMORY[0x1E0D13878] + 16))();
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id __67__CNContactViewCache_accountForContainer_shouldUseTopLevelAccount___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(*(id *)(a1 + 32), "_accountForContainer:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C971B0], "_cnui_accountStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "externalIdentifierString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accountWithIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(v5, "displayAccount");
    v6 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v6;
  }
  (*(void (**)(void))(*MEMORY[0x1E0D13878] + 16))();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __40__CNContactViewCache_accountForContact___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v1, "contactStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_uncachedContainerForContact:inStore:", v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*MEMORY[0x1E0D13878] + 16))();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __55__CNContactViewCache_policyForContainerWithIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "contactStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "policyForContainerWithIdentifier:error:", *(_QWORD *)(a1 + 40), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*MEMORY[0x1E0D13878] + 16))();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void __127__CNContactViewCache_isCandidatePolicy_ofContactInCandidateContainerWithType_preferredOverPolicy_ofContactInContainerWithType___block_invoke()
{
  void *v0;

  v0 = (void *)isCandidatePolicy_ofContactInCandidateContainerWithType_preferredOverPolicy_ofContactInContainerWithType__cn_once_object_1;
  isCandidatePolicy_ofContactInCandidateContainerWithType_preferredOverPolicy_ofContactInContainerWithType__cn_once_object_1 = (uint64_t)&unk_1E20D3898;

}

@end
