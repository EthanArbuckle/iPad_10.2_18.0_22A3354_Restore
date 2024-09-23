@implementation MPStorePurchaseErrorResolver

- (MPStorePurchaseErrorResolver)initWithStoreAccountIdentifier:(id)a3
{
  id v5;
  MPStorePurchaseErrorResolver *v6;
  MPStorePurchaseErrorResolver *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MPStorePurchaseErrorResolver;
  v6 = -[MPStorePurchaseErrorResolver init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_storeAccountIdentifier, a3);

  return v7;
}

- (void)resolveError:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  BOOL v13;
  int v15;
  id v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  MPStorePurchaseErrorResolver *v29;
  _QWORD v30[5];
  id v31;

  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0CB3388];
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0CB3388]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "code");
  objc_msgSend(v4, "domain");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *MEMORY[0x1E0C8A2F8];
  if ((objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0C8A2F8]) & 1) == 0)
  {

LABEL_11:
    -[MPAVErrorResolver sendDidResolveError:withResolution:](self, "sendDidResolveError:withResolution:", v4, 0);
    goto LABEL_26;
  }
  objc_msgSend(v7, "domain");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *MEMORY[0x1E0CB2F90];
  if (objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0CB2F90]))
    v13 = v8 > 0xFFFFFFFFFFFF5BF0;
  else
    v13 = 1;
  if (!v13 && v8 >= 0xFFFFFFFFFFFF3CB1)
  {
    v29 = self;
    v16 = v4;
    v17 = v16;
    if (!v16)
      goto LABEL_18;
    objc_msgSend(v16, "domain");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "isEqualToString:", v10);

    if (!v19)
      goto LABEL_18;
    objc_msgSend(v17, "userInfo");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectForKey:", v6);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = objc_msgSend(v21, "code");
    if (!v21)
      goto LABEL_18;
    v23 = v22;
    objc_msgSend(v21, "domain");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "isEqualToString:", v12);

    if (v25 && (unint64_t)(v23 + 42597) < 3)
      v15 = 0;
    else
LABEL_18:
      v15 = 1;

    self = v29;
  }
  else
  {
    v15 = 0;
  }

  if (!v15 || v8 + 42583 > 0xFFFFFFFFFFFFFFF8)
    goto LABEL_11;
  if (self->_storeAccountIdentifier)
    objc_msgSend(MEMORY[0x1E0DDC100], "specificAccountWithDSID:");
  else
    objc_msgSend(MEMORY[0x1E0DDC100], "activeAccount");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DDC0A0]), "initWithIdentity:", v26);
  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DDBEF0]), "initWithRequestContext:", v27);
  objc_msgSend(v28, "setReason:", *MEMORY[0x1E0DDBC88]);
  objc_msgSend(v28, "setQualityOfService:", 25);
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __45__MPStorePurchaseErrorResolver_resolveError___block_invoke;
  v30[3] = &unk_1E315ED10;
  v30[4] = self;
  v31 = v4;
  objc_msgSend(v28, "performWithResponseHandler:", v30);

LABEL_26:
}

- (NSNumber)storeAccountIdentifier
{
  return self->_storeAccountIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeAccountIdentifier, 0);
}

void __45__MPStorePurchaseErrorResolver_resolveError___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  id v6;
  _QWORD block[5];
  id v8;
  id v9;

  v4 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__MPStorePurchaseErrorResolver_resolveError___block_invoke_2;
  block[3] = &unk_1E3163698;
  v5 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v8 = v5;
  v9 = v4;
  v6 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __45__MPStorePurchaseErrorResolver_resolveError___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "sendDidResolveError:withResolution:", *(_QWORD *)(a1 + 40), 2 * (*(_QWORD *)(a1 + 48) == 0));
}

@end
