@implementation MFAddressAtomStatusManager

+ (BOOL)shouldDecorateAtomListForSender:(id)a3 replyTo:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "count") == 1 && objc_msgSend(v5, "count"))
  {
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "emailAddressValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "displayName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "emailAddressValue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "displayName");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v9, "isEqualToString:", v12);

    objc_msgSend(v6, "firstObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "emailAddressValue");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "simpleAddress");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "emailAddressValue");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "simpleAddress");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v12) = objc_msgSend(v16, "isEqualToString:", v19);

    v20 = v13 & (v12 ^ 1);
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (MFAddressAtomStatusManager)initWithAccount:(id)a3
{
  id v5;
  MFAddressAtomStatusManager *v6;
  MFAddressAtomStatusManager *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MFAddressAtomStatusManager;
  v6 = -[MFAddressAtomStatusManager init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_account, a3);
    -[MFAddressAtomStatusManager _commonInit](v7, "_commonInit");
  }

  return v7;
}

- (void)_commonInit
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__trustDidChange_, *MEMORY[0x1E0D4D480], 0);
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__legacyAccountsDidChange_, *MEMORY[0x1E0D1E4F8], 0);
  +[VIPManager defaultInstance](VIPManager, "defaultInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__vipSendersDidChange_, *MEMORY[0x1E0D1E0A8], v3);

  objc_msgSend(MEMORY[0x1E0CC6888], "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addClient:", self);

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CC6888], "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeClient:", self);

  v4.receiver = self;
  v4.super_class = (Class)MFAddressAtomStatusManager;
  -[MFAddressAtomStatusManager dealloc](&v4, sel_dealloc);
}

- (void)setAtomProvider:(id)a3
{
  id WeakRetained;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_atomProvider);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_atomProvider, obj);
    -[MFAddressAtomStatusManager updateTrustForDisplayedAtoms](self, "updateTrustForDisplayedAtoms");
  }

}

- (void)_invalidateAtoms
{
  id v2;

  -[MFAddressAtomStatusManager atomProvider](self, "atomProvider");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "iterateDisplayedAtomListsWithBlock:", &__block_literal_global_1);

}

uint64_t __46__MFAddressAtomStatusManager__invalidateAtoms__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "addressBookDidChange:", 0);
}

- (void)updateWithSecurityInformation:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[MFAddressAtomStatusManager setSecurityInformation:](self, "setSecurityInformation:");
  objc_msgSend(v5, "smimeError");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFAddressAtomStatusManager setSMIMEError:](self, "setSMIMEError:", v4);

  -[MFAddressAtomStatusManager updateTrustForDisplayedAtoms](self, "updateTrustForDisplayedAtoms");
}

- (id)otherSigners
{
  void *v2;
  void *v3;
  void *v4;

  -[MFAddressAtomStatusManager securityInformation](self, "securityInformation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "signers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v3, "count") < 2)
  {
    v4 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    objc_msgSend(v3, "subarrayWithRange:", 1, objc_msgSend(v3, "count") - 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

- (void)updateTrustForDisplayedAtoms
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];

  -[MFAddressAtomStatusManager atomProvider](self, "atomProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFAddressAtomStatusManager securityInformation](self, "securityInformation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "signers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v5, "count") >= 2)
  {
    -[MFAddressAtomStatusManager otherSigners](self, "otherSigners");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "ef_map:", &__block_literal_global_39);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "setOtherSigners:", v7);
  }
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __58__MFAddressAtomStatusManager_updateTrustForDisplayedAtoms__block_invoke_2;
  v8[3] = &unk_1E9A03110;
  v8[4] = self;
  objc_msgSend(v3, "iterateDisplayedAtomListsWithBlock:", v8);

}

id __58__MFAddressAtomStatusManager_updateTrustForDisplayedAtoms__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "signingCertificateTrustInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sender");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __58__MFAddressAtomStatusManager_updateTrustForDisplayedAtoms__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateAtomsInList:", a2);
}

- (void)_updateOtherSignersList:(id)a3
{
  void *v3;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
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
  int v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  id obj;
  id v29;
  uint64_t v30;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v27 = a3;
  v29 = objc_alloc_init(MEMORY[0x1E0D1E6C8]);
  objc_msgSend(v29, "setShouldIncludeDisplayName:", 1);
  objc_msgSend(v27, "addressAtoms");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFAddressAtomStatusManager otherSigners](self, "otherSigners");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v26, "count");
  if (v5 != objc_msgSend(v32, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFAddressAtomStatusManager.m"), 155, CFSTR("Signers do not match"));

  }
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  obj = v26;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v6)
  {
    v7 = 0;
    v30 = *(_QWORD *)v34;
    do
    {
      v8 = 0;
      v9 = v7;
      do
      {
        if (*(_QWORD *)v34 != v30)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v8);
        objc_msgSend(v10, "signingCertificateTrustInfo");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "firstEmailAddress");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v32, "objectAtIndexedSubscript:", v9 + v8);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          v14 = (void *)MEMORY[0x1E0D1E6C0];
          objc_msgSend(v12, "stringValue");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "componentsWithString:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v10, "signingCertificateTrustInfo");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "commonName");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setDisplayName:", v18);

          objc_msgSend(v16, "emailAddressValue");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = v19;
          if (!v19)
          {
            objc_msgSend(v12, "stringValue");
            v3 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = v3;
          }
          objc_msgSend(v29, "stringFromEmailAddressConvertible:", v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v19)

          objc_msgSend(v13, "setAddress:", v21);
        }
        objc_msgSend(v10, "signingCertificateTrustInfo");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = -[MFAddressAtomStatusManager actionForTrustInformation:](self, "actionForTrustInformation:", v22);

        if (v23 == 1)
          v24 = 32;
        else
          v24 = 257;
        objc_msgSend(v13, "setPresentationOptions:", v24);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      v7 = v9 + v8;
    }
    while (v6);
  }

  objc_msgSend(v27, "updateAtomsForVIP");
}

- (void)updateWithReplyToInformation:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];

  v4 = a3;
  -[MFAddressAtomStatusManager setReplyToList:](self, "setReplyToList:", v4);
  -[MFAddressAtomStatusManager atomProvider](self, "atomProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __59__MFAddressAtomStatusManager_updateWithReplyToInformation___block_invoke;
  v6[3] = &unk_1E9A03110;
  v6[4] = self;
  objc_msgSend(v5, "iterateDisplayedAtomListsWithBlock:", v6);

}

uint64_t __59__MFAddressAtomStatusManager_updateWithReplyToInformation___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateAtomsInList:", a2);
}

- (void)_updateAtomsInList:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  MFAddressAtomStatusManager *v12;

  v4 = a3;
  objc_msgSend(v4, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("OTHER_SIGNERS_TITLE"), &stru_1E9A04480, CFSTR("Main"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "isEqualToString:", v7);

  if (v8)
  {
    -[MFAddressAtomStatusManager _updateOtherSignersList:](self, "_updateOtherSignersList:", v4);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D1F070], "globalAsyncSchedulerWithQualityOfService:", 25);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __49__MFAddressAtomStatusManager__updateAtomsInList___block_invoke;
    v10[3] = &unk_1E9A02DD8;
    v11 = v4;
    v12 = self;
    objc_msgSend(v9, "performBlock:", v10);

  }
}

void __49__MFAddressAtomStatusManager__updateAtomsInList___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  int v9;
  uint64_t v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  _QWORD *v24;
  void *v25;
  id v26;
  void *v27;
  int8x16_t v28;
  _QWORD v29[4];
  id v30;
  int8x16_t v31;
  uint64_t v32;
  _QWORD v33[4];
  id v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  char v39;

  objc_msgSend(*(id *)(a1 + 32), "addressAtoms");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  if (*(_QWORD *)(a1 + 32)
    && (objc_msgSend(*(id *)(a1 + 40), "atomProvider"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "shouldDecorateAtomListWithSMIMEStatus:", *(_QWORD *)(a1 + 32)),
        v5,
        v6))
  {
    objc_msgSend(*(id *)(a1 + 40), "securityInformation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "smimeError");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isSigned");
    v9 = objc_msgSend(v7, "isEncrypted");
    if (v27)
    {
      v10 = 257;
    }
    else
    {
      v11 = v9;
      if (v8)
      {
        objc_msgSend(v7, "signers");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "firstObject");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        v14 = *(void **)(a1 + 40);
        v26 = v13;
        objc_msgSend(v13, "signingCertificateTrustInfo");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v14, "actionForTrustInformation:", v15);

        v10 = 257;
        v17 = v13;
        if (v13 && v16 == 1)
        {
          if (v11)
            v18 = 160;
          else
            v18 = 32;
          objc_msgSend(v17, "signingCertificateTrustInfo");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "emailAddresses");
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v3, "emailAddress");
          v36 = 0;
          v37 = &v36;
          v38 = 0x2020000000;
          v39 = 0;
          v33[0] = v4;
          v33[1] = 3221225472;
          v33[2] = __49__MFAddressAtomStatusManager__updateAtomsInList___block_invoke_2;
          v33[3] = &unk_1E9A03138;
          v34 = (id)objc_claimAutoreleasedReturnValue();
          v35 = &v36;
          v21 = v34;
          objc_msgSend(v20, "enumerateObjectsUsingBlock:", v33);
          if (*((_BYTE *)v37 + 24))
            v10 = v18;
          else
            v10 = 257;

          _Block_object_dispose(&v36, 8);
          v17 = v26;
        }

      }
      else if (v9)
      {
        v10 = 128;
      }
      else
      {
        v10 = 0;
      }
    }

  }
  else
  {
    v10 = 0;
  }
  v29[0] = v4;
  v29[1] = 3221225472;
  v29[2] = __49__MFAddressAtomStatusManager__updateAtomsInList___block_invoke_3;
  v29[3] = &unk_1E9A03160;
  v22 = v2;
  v30 = v22;
  v32 = v10;
  v28 = *(int8x16_t *)(a1 + 32);
  v23 = (id)v28.i64[0];
  v31 = vextq_s8(v28, v28, 8uLL);
  v24 = v29;
  objc_msgSend(MEMORY[0x1E0D1F070], "mainThreadScheduler");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "performSyncBlock:", v24);

}

void __49__MFAddressAtomStatusManager__updateAtomsInList___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  int v8;
  void *v9;

  objc_msgSend(a2, "emailAddressValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "simpleAddress");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v9;
  if (v9)
  {
    v8 = objc_msgSend(v9, "ef_caseInsensitiveIsEqualToString:", *(_QWORD *)(a1 + 32));
    v7 = v9;
    if (v8)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
      *a4 = 1;
    }
  }

}

void __49__MFAddressAtomStatusManager__updateAtomsInList___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  _BOOL4 v3;
  uint64_t i;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;
  int v11;
  void *v12;
  void *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _BOOL4 v20;
  id obj;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = *(id *)(a1 + 32);
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (!v2)
  {

    return;
  }
  LOBYTE(v3) = 0;
  v22 = *(_QWORD *)v25;
  do
  {
    for (i = 0; i != v2; ++i)
    {
      if (*(_QWORD *)v25 != v22)
        objc_enumerationMutation(obj);
      v5 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
      v23 = *(_QWORD *)(a1 + 56);
      if (objc_msgSend(*(id *)(a1 + 40), "_atomContainsVIPSender:", v5))
        v23 |= 0x10uLL;
      objc_msgSend(MEMORY[0x1E0D1EEA8], "currentDevice");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "isInternal"))
      {
        objc_msgSend(MEMORY[0x1E0C99EA0], "em_userDefaults");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "BOOLForKey:", CFSTR("PresentationOptionsEncodedIntoAddress"));

        if (!v8)
          goto LABEL_12;
        v9 = (void *)MEMORY[0x1E0D13620];
        objc_msgSend(v5, "emailAddress");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "presentationOptions:encodedIntoAddress:", &v23, v6);
      }

LABEL_12:
      if (v3)
      {
        v3 = 1;
        v10 = v23;
      }
      else
      {
        v11 = objc_msgSend(v5, "presentationOptions");
        v10 = v23;
        v3 = ((v23 ^ v11) & 0x1F0) != 0;
      }
      objc_msgSend(v5, "setPresentationOptions:", v10);
      objc_msgSend(*(id *)(a1 + 40), "replyToList");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        objc_msgSend(*(id *)(a1 + 32), "lastObject");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v5 == v13;

        if (v14)
        {
          objc_msgSend(*(id *)(a1 + 40), "replyToList");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "firstObject");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "emailAddressValue");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "simpleAddress");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "emailAddress");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = v18 == v19;

          if (v20)
          {
            objc_msgSend(v5, "setPresentationOptions:", objc_msgSend(v5, "presentationOptions") | 0x100);
            v3 = 1;
          }
        }
      }
    }
    v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  }
  while (v2);

  if (v3)
    objc_msgSend(*(id *)(a1 + 48), "updateAtomsForVIP");
}

- (int)actionForTrustInformation:(id)a3
{
  id v3;
  void *v4;
  int v5;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4D548]), "initWithTrustInformation:", v3);
  v5 = objc_msgSend(v4, "action");

  return v5;
}

- (void)_legacyAccountsDidChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[MFAddressAtomStatusManager legacyAccount](self, "legacyAccount", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0D4D620];
    -[MFAddressAtomStatusManager legacyAccount](self, "legacyAccount");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "uniqueID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "accountWithUniqueId:", v7);
    v8 = (id)objc_claimAutoreleasedReturnValue();

    -[MFAddressAtomStatusManager setLegacyAccount:](self, "setLegacyAccount:", v8);
    -[MFAddressAtomStatusManager updateTrustForDisplayedAtoms](self, "updateTrustForDisplayedAtoms");

  }
}

- (void)_updateVIPStatus
{
  void *v3;
  _QWORD v4[5];

  -[MFAddressAtomStatusManager atomProvider](self, "atomProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __46__MFAddressAtomStatusManager__updateVIPStatus__block_invoke;
  v4[3] = &unk_1E9A03110;
  v4[4] = self;
  objc_msgSend(v3, "iterateDisplayedAtomListsWithBlock:", v4);

}

void __46__MFAddressAtomStatusManager__updateVIPStatus__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  unint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(v3, "addressAtoms", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        if (objc_msgSend(*(id *)(a1 + 32), "_atomContainsVIPSender:", v8))
          v9 = objc_msgSend(v8, "presentationOptions") | 0x10;
        else
          v9 = objc_msgSend(v8, "presentationOptions") & 0xFFFFFFFFFFFFFFEFLL;
        objc_msgSend(v8, "setPresentationOptions:", v9);
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  objc_msgSend(v3, "updateAtomsForVIP");
}

- (BOOL)_atomContainsVIPSender:(id)a3
{
  id v3;
  id v4;
  id v5;
  const void *v6;
  CFTypeRef v7;
  const void *v8;
  CFArrayRef v9;
  const void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0D1E458]);
  v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v6 = (const void *)objc_msgSend(v3, "ABPerson");
  if (v6)
  {
    v7 = ABRecordCopyValue(v6, *MEMORY[0x1E0CF5F98]);
    v8 = v7;
    if (v7)
    {
      v9 = ABMultiValueCopyArrayOfAllValues(v7);
      objc_msgSend(v4, "addObjectsFromArray:", v9);
      CFRelease(v8);

    }
    v10 = (const void *)ABPersonCopyPreferredLinkedPersonForName();
    v11 = (void *)ABPersonCopyCompositeName();
    if (v11)
      objc_msgSend(v5, "addObject:", v11);
    CFRelease(v10);

  }
  objc_msgSend(v3, "emailAddress");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    objc_msgSend(v3, "unmodifiedAddressString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "addObject:", v12);
  objc_msgSend(v3, "unmodifiedAddressString");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "emailAddressValue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "displayName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    v17 = v15;
  }
  else
  {
    objc_msgSend(v13, "stringValue");
    v17 = (id)objc_claimAutoreleasedReturnValue();
  }
  v18 = v17;

  if (v18)
    objc_msgSend(v5, "addObject:", v18);
  +[VIPManager defaultInstance](VIPManager, "defaultInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allObjects");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "vipForEmailAddresses:andDisplayNames:", v4, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21 != 0;
}

- (MFAddressAtomProvider)atomProvider
{
  return (MFAddressAtomProvider *)objc_loadWeakRetained((id *)&self->_atomProvider);
}

- (MFMessageLoadingContext)context
{
  return (MFMessageLoadingContext *)objc_loadWeakRetained((id *)&self->_context);
}

- (void)setContext:(id)a3
{
  objc_storeWeak((id *)&self->_context, a3);
}

- (EMAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
  objc_storeStrong((id *)&self->_account, a3);
}

- (MailAccount)legacyAccount
{
  return self->_legacyAccount;
}

- (void)setLegacyAccount:(id)a3
{
  objc_storeStrong((id *)&self->_legacyAccount, a3);
}

- (EMSecurityInformation)securityInformation
{
  return self->_securityInformation;
}

- (void)setSecurityInformation:(id)a3
{
  objc_storeStrong((id *)&self->_securityInformation, a3);
}

- (NSArray)replyToList
{
  return self->_replyToList;
}

- (void)setReplyToList:(id)a3
{
  objc_storeStrong((id *)&self->_replyToList, a3);
}

- (NSError)smimeError
{
  return self->_smimeError;
}

- (void)setSMIMEError:(id)a3
{
  objc_storeStrong((id *)&self->_smimeError, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_smimeError, 0);
  objc_storeStrong((id *)&self->_replyToList, 0);
  objc_storeStrong((id *)&self->_securityInformation, 0);
  objc_storeStrong((id *)&self->_legacyAccount, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_destroyWeak((id *)&self->_context);
  objc_destroyWeak((id *)&self->_atomProvider);
}

@end
