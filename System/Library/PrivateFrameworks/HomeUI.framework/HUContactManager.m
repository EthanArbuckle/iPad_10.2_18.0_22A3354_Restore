@implementation HUContactManager

+ (id)sharedManager
{
  if (qword_1ED580E08 != -1)
    dispatch_once(&qword_1ED580E08, &__block_literal_global_290);
  return (id)_MergedGlobals_643;
}

void __33__HUContactManager_sharedManager__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)_MergedGlobals_643;
  _MergedGlobals_643 = v0;

}

- (HUContactManager)init
{
  HUContactManager *v2;
  HUContactManager *v3;
  NSDictionary *cachedContactByEmails;
  CNContactStore *v5;
  CNContactStore *contactStore;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HUContactManager;
  v2 = -[HUContactManager init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    cachedContactByEmails = v2->_cachedContactByEmails;
    v2->_cachedContactByEmails = (NSDictionary *)MEMORY[0x1E0C9AA70];

    v5 = (CNContactStore *)objc_alloc_init(MEMORY[0x1E0C97298]);
    contactStore = v3->_contactStore;
    v3->_contactStore = v5;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", v3, sel_contactStoreDidChange_, *MEMORY[0x1E0C96870], 0);

  }
  return v3;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)HUContactManager;
  -[HUContactManager dealloc](&v4, sel_dealloc);
}

- (void)contactStoreDidChange:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__HUContactManager_contactStoreDidChange___block_invoke;
  block[3] = &unk_1E6F4D988;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __42__HUContactManager_contactStoreDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setCachedContactByEmails:", MEMORY[0x1E0C9AA70]);
}

- (id)contactForEmailAddress:(id)a3 keysToFetch:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  _QWORD v22[4];
  id v23;
  _BYTE *v24;
  id v25;
  _BYTE buf[24];
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    -[HUContactManager cachedContactByEmails](self, "cachedContactByEmails");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9 && objc_msgSend(v9, "areKeysAvailable:", v7))
    {
      v10 = v9;
    }
    else
    {
      objc_msgSend(v7, "arrayByAddingObject:", *MEMORY[0x1E0C966A8]);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUContactManager contactStore](self, "contactStore");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C97200], "predicateForContactsMatchingEmailAddress:", v6);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 0;
      objc_msgSend(v12, "unifiedContactsMatchingPredicate:keysToFetch:error:", v13, v11, &v25);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v25;

      if (v14)
      {
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x3032000000;
        v27 = __Block_byref_object_copy__33;
        v28 = __Block_byref_object_dispose__33;
        v29 = 0;
        v22[0] = MEMORY[0x1E0C809B0];
        v22[1] = 3221225472;
        v22[2] = __55__HUContactManager_contactForEmailAddress_keysToFetch___block_invoke;
        v22[3] = &unk_1E6F5FF18;
        v16 = v6;
        v23 = v16;
        v24 = buf;
        objc_msgSend(v14, "enumerateObjectsUsingBlock:", v22);
        v17 = *(void **)(*(_QWORD *)&buf[8] + 40);
        if (v17)
        {
          -[HUContactManager cachedContactByEmails](self, "cachedContactByEmails");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = (void *)objc_msgSend(v18, "mutableCopy");

          objc_msgSend(v19, "setObject:forKey:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40), v16);
          -[HUContactManager setCachedContactByEmails:](self, "setCachedContactByEmails:", v19);

          v17 = *(void **)(*(_QWORD *)&buf[8] + 40);
        }
        v10 = v17;

        _Block_object_dispose(buf, 8);
      }
      else
      {
        HFLogForCategory();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = v6;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v15;
          _os_log_error_impl(&dword_1B8E1E000, v20, OS_LOG_TYPE_ERROR, "unifiedContactsMatching email %@ error: %@", buf, 0x16u);
        }

        v10 = 0;
      }

    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

void __55__HUContactManager_contactForEmailAddress_keysToFetch___block_invoke(uint64_t a1, void *a2)
{
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v6 = a2;
  objc_msgSend(v6, "emailAddresses");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__HUContactManager_contactForEmailAddress_keysToFetch___block_invoke_2;
  v7[3] = &unk_1E6F5FEF0;
  v8 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "indexOfObjectPassingTest:", v7);

  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);

}

uint64_t __55__HUContactManager_contactForEmailAddress_keysToFetch___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (id)userDataFromEmail:(id)a3 monogramDiameter:(double)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  _QWORD v24[2];
  _QWORD v25[2];
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[HUContactManager setMonogramDiameter:](self, "setMonogramDiameter:", a4);
  if (!v6)
  {
    _HULocalizedStringWithDefaultValue(CFSTR("HUUnknownUser"), CFSTR("HUUnknownUser"), 1);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    v14 = 0;
    v9 = 0;
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x1E0C97518], "descriptorForRequiredKeysIncludingImage:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUContactManager contactForEmailAddress:keysToFetch:](self, "contactForEmailAddress:keysToFetch:", v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUContactManager monogrammer](self, "monogrammer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "monogramForContact:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "givenName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "familyName");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  if (!v11)
  {
    if (v12 && v13)
    {
      -[HUContactManager monogrammer](self, "monogrammer");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "monogramForPersonWithFirstName:lastName:", v12, v14);
      v16 = objc_claimAutoreleasedReturnValue();
LABEL_8:
      v11 = (void *)v16;

      goto LABEL_9;
    }
LABEL_7:
    -[HUContactManager monogrammer](self, "monogrammer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "silhouetteMonogram");
    v16 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
LABEL_9:
  v24[0] = CFSTR("kHUUserDataEmailNameKey");
  v24[1] = CFSTR("kHUUserDataImageKey");
  v25[0] = v6;
  v25[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "mutableCopy");

  v19 = v6;
  v20 = v19;
  if (v12 && v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), v12, v14);
    v21 = (id)objc_claimAutoreleasedReturnValue();
  }
  else if (v12)
  {
    v21 = v12;
  }
  else
  {
    v22 = v19;
    if (!v14)
      goto LABEL_17;
    v21 = v14;
  }
  v22 = v21;

LABEL_17:
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v22, CFSTR("kHUUserDisplayableNameKey"));
  if (v9)
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v9, CFSTR("kHUUserDataContactKey"));

  return v18;
}

- (CNMonogrammer)monogrammer
{
  CNMonogrammer *monogrammer;
  CNMonogrammer *v4;
  CNMonogrammer *v5;

  monogrammer = self->_monogrammer;
  if (!monogrammer)
  {
    v4 = (CNMonogrammer *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97518]), "initWithStyle:diameter:", 0, 40.0);
    v5 = self->_monogrammer;
    self->_monogrammer = v4;

    monogrammer = self->_monogrammer;
  }
  return monogrammer;
}

- (void)setMonogramDiameter:(double)a3
{
  CNMonogrammer *v5;
  CNMonogrammer *monogrammer;

  if (self->_monogramDiameter != a3 || !self->_monogrammer)
  {
    v5 = (CNMonogrammer *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97518]), "initWithStyle:diameter:", 0, a3);
    monogrammer = self->_monogrammer;
    self->_monogrammer = v5;

    self->_monogramDiameter = a3;
  }
}

- (NSDictionary)cachedContactByEmails
{
  return self->_cachedContactByEmails;
}

- (void)setCachedContactByEmails:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (void)setMonogrammer:(id)a3
{
  objc_storeStrong((id *)&self->_monogrammer, a3);
}

- (double)monogramDiameter
{
  return self->_monogramDiameter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_monogrammer, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_cachedContactByEmails, 0);
}

@end
