@implementation LPiTunesMediaLookupTask

- (id)sharedBag
{
  if (sharedBag_onceToken != -1)
    dispatch_once(&sharedBag_onceToken, &__block_literal_global_10);
  return (id)sharedBag_bag;
}

void __36__LPiTunesMediaLookupTask_sharedBag__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;

  v0 = (void *)MEMORY[0x1E0CFD9F0];
  objc_msgSend(MEMORY[0x1E0CFDAF8], "bagKeySet");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "registerBagKeySet:forProfile:profileVersion:", v1, CFSTR("AppStore"), CFSTR("1"));

  objc_msgSend(MEMORY[0x1E0CFD9E8], "bagForProfile:profileVersion:", CFSTR("AppStore"), CFSTR("1"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)sharedBag_bag;
  sharedBag_bag = v2;

}

- (id)callerID
{
  if (callerID_onceToken != -1)
    dispatch_once(&callerID_onceToken, &__block_literal_global_6);
  return (id)callerID_callerID;
}

void __35__LPiTunesMediaLookupTask_callerID__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bundleIdentifier");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)callerID_callerID;
  callerID_callerID = v1;

  if (!objc_msgSend((id)callerID_callerID, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", getprogname());
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)callerID_callerID;
    callerID_callerID = v3;

  }
}

- (LPiTunesMediaLookupTask)init
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  LPiTunesMediaLookupTask *v7;
  LPiTunesMediaLookupTask *v8;
  objc_super v10;

  objc_msgSend(MEMORY[0x1E0CFDBD0], "currentProcess");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccountMediaType:", *MEMORY[0x1E0CFD7A0]);
  -[LPiTunesMediaLookupTask sharedBag](self, "sharedBag");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPiTunesMediaLookupTask callerID](self, "callerID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0CFD890];
  v10.receiver = self;
  v10.super_class = (Class)LPiTunesMediaLookupTask;
  v7 = -[AMSLookup initWithBag:caller:keyProfile:](&v10, sel_initWithBag_caller_keyProfile_, v4, v5, v6);

  if (v7)
  {
    -[AMSLookup setPlatform:](v7, "setPlatform:", CFSTR("web"));
    -[AMSLookup setClientInfo:](v7, "setClientInfo:", v3);
    v8 = v7;
  }

  return v7;
}

- (LPiTunesMediaLookupTask)initWithIdentifier:(id)a3 storefrontCountryCode:(id)a4
{
  id v6;
  id v7;
  LPiTunesMediaLookupTask *v8;
  uint64_t v9;
  NSArray *identifiers;
  LPiTunesMediaLookupTask *v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = -[LPiTunesMediaLookupTask init](self, "init");
  if (v8)
  {
    v13[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
    v9 = objc_claimAutoreleasedReturnValue();
    identifiers = v8->_identifiers;
    v8->_identifiers = (NSArray *)v9;

    objc_storeStrong((id *)&v8->_storefrontCountryCode, a4);
    v11 = v8;
  }

  return v8;
}

- (LPiTunesMediaLookupTask)initWithBundleIdentifier:(id)a3
{
  id v4;
  LPiTunesMediaLookupTask *v5;
  uint64_t v6;
  NSArray *bundleIdentifiers;
  LPiTunesMediaLookupTask *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[LPiTunesMediaLookupTask init](self, "init");
  if (v5)
  {
    v10[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v6 = objc_claimAutoreleasedReturnValue();
    bundleIdentifiers = v5->_bundleIdentifiers;
    v5->_bundleIdentifiers = (NSArray *)v6;

    v8 = v5;
  }

  return v5;
}

- (id)_compileQueryParametersWithBundleIds:(id)a3 itemIds:(id)a4
{
  void *v5;
  void *v6;
  NSString *storefrontCountryCode;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)LPiTunesMediaLookupTask;
  -[AMSLookup _compileQueryParametersWithBundleIds:itemIds:](&v9, sel__compileQueryParametersWithBundleIds_itemIds_, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v6, "setObject:forKey:", CFSTR("omni"), CFSTR("availability"));
  storefrontCountryCode = self->_storefrontCountryCode;
  if (storefrontCountryCode)
    objc_msgSend(v6, "setObject:forKey:", storefrontCountryCode, CFSTR("cc"));
  return v6;
}

- (void)start:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[AMSLookup performLookupWithBundleIdentifiers:itemIdentifiers:](self, "performLookupWithBundleIdentifiers:itemIdentifiers:", self->_bundleIdentifiers, self->_identifiers);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __33__LPiTunesMediaLookupTask_start___block_invoke;
  v7[3] = &unk_1E44A8CC8;
  v6 = v4;
  v8 = v6;
  objc_msgSend(v5, "addFinishBlock:", v7);

}

void __33__LPiTunesMediaLookupTask_start___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;

  v15 = a2;
  v5 = a3;
  if (v5)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    objc_msgSend(v15, "allItems");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count"))
    {
      objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      v9 = *(_QWORD *)(a1 + 32);
      if (v7)
      {
        objc_msgSend(v7, "itemDictionary");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "valueForProperty:", CFSTR("meta"));
        v11 = (id)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("storefront"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("id"));
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v14 = v13;
            else
              v14 = 0;

          }
          else
          {
            v14 = 0;
          }

        }
        else
        {
          v14 = 0;
        }

        (*(void (**)(uint64_t, void *, id, _QWORD))(v9 + 16))(v9, v10, v14, 0);
      }
      else
      {
        (*(void (**)(_QWORD, _QWORD, _QWORD, _QWORD))(v9 + 16))(*(_QWORD *)(a1 + 32), 0, 0, 0);
      }

    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storefrontCountryCode, 0);
  objc_storeStrong((id *)&self->_bundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_identifiers, 0);
}

@end
