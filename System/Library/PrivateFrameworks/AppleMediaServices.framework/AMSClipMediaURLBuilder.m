@implementation AMSClipMediaURLBuilder

- (AMSClipMediaURLBuilder)initWithBundleID:(id)a3 bag:(id)a4
{
  id v7;
  id v8;
  AMSClipMediaURLBuilder *v9;
  AMSClipMediaURLBuilder *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AMSClipMediaURLBuilder;
  v9 = -[AMSClipMediaURLBuilder init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_bundleID, a3);
    objc_storeStrong((id *)&v10->_bag, a4);
  }

  return v10;
}

- (id)build
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[4];

  v10[3] = *MEMORY[0x1E0C80C00];
  -[AMSClipMediaURLBuilder _hostPromise](self, "_hostPromise");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSClipMediaURLBuilder _pathPromise](self, "_pathPromise");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSClipMediaURLBuilder _queryPromise](self, "_queryPromise");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v3;
  v10[1] = v4;
  v10[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSPromise promiseWithAll:](AMSPromise, "promiseWithAll:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "thenWithBlock:", &__block_literal_global_29);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __31__AMSClipMediaURLBuilder_build__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v2 = a2;
  objc_msgSend(v2, "objectAtIndexedSubscript:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectAtIndexedSubscript:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectAtIndexedSubscript:", 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_alloc_init(MEMORY[0x1E0CB3998]);
  objc_msgSend(v3, "absoluteString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHost:", v7);

  objc_msgSend(v6, "setPath:", v4);
  objc_msgSend(v6, "setQueryItems:", v5);
  objc_msgSend(v6, "setScheme:", CFSTR("https"));
  +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_devicePlatform
{
  _BOOL4 v2;
  __CFString **v3;

  v2 = +[AMSDevice deviceIsiPad](AMSDevice, "deviceIsiPad");
  v3 = AMSMediaTaskPlatformiPhone;
  if (v2)
    v3 = AMSMediaTaskPlatformiPad;
  return *v3;
}

- (id)_hostPromise
{
  void *v2;
  void *v3;
  void *v4;

  -[AMSClipMediaURLBuilder bag](self, "bag");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLForKey:", 0x1E254CA60);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "valuePromise");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_pathPromise
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  -[AMSClipMediaURLBuilder bag](self, "bag");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringForKey:", 0x1E254C520);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valuePromise");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __38__AMSClipMediaURLBuilder__pathPromise__block_invoke;
  v8[3] = &unk_1E253D750;
  v8[4] = self;
  objc_msgSend(v5, "thenWithBlock:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __38__AMSClipMediaURLBuilder__pathPromise__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __CFString *v12;
  uint64_t v13;
  __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _QWORD v25[2];
  _QWORD v26[2];
  _QWORD v27[3];

  v27[2] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
  v26[0] = CFSTR("{bundleId}");
  v26[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v5;
  v25[0] = CFSTR("{storefront}");
  v25[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v21;
    v12 = CFSTR("/v1/catalog/{storefront}/app-clips/{bundleId}");
    do
    {
      v13 = 0;
      v14 = v12;
      do
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(v8);
        v15 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v13);
        objc_msgSend(v15, "objectAtIndexedSubscript:", 0, (_QWORD)v20);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectAtIndexedSubscript:", 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[__CFString stringByReplacingOccurrencesOfString:withString:](v14, "stringByReplacingOccurrencesOfString:withString:", v16, v17);
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

        ++v13;
        v14 = v12;
      }
      while (v10 != v13);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v10);
  }
  else
  {
    v12 = CFSTR("/v1/catalog/{storefront}/app-clips/{bundleId}");
  }

  +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v12);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)_queryPromise
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  -[AMSClipMediaURLBuilder bag](self, "bag");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringForKey:", 0x1E254CA00);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valuePromise");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __39__AMSClipMediaURLBuilder__queryPromise__block_invoke;
  v8[3] = &unk_1E253D750;
  v8[4] = self;
  objc_msgSend(v5, "thenWithBlock:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __39__AMSClipMediaURLBuilder__queryPromise__block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
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
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)MEMORY[0x1E0C99DE8];
  v4 = a2;
  v5 = objc_alloc_init(v3);
  objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("l"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "addObject:", v6);
  objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("relate[app-clips]"), CFSTR("app"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v7);

  objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("include[app-clips]"), CFSTR("app-genres"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v8);

  objc_msgSend(*(id *)(a1 + 32), "_devicePlatform");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("platform"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v10);

  }
  v21[0] = CFSTR("variantsInfo");
  v21[1] = CFSTR("verifiedAssociatedDomains");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "componentsJoinedByString:", CFSTR(","));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("extend"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v13);

  v14 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  if (v14)
  {
    v15 = (void *)MEMORY[0x1E0CB39D8];
    objc_msgSend(v14, "stringValue");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "queryItemWithName:value:", CFSTR("externalVersionId"), v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v17);

    objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("fields"), CFSTR("variantsInfo"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v18);

  }
  +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v5);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (AMSBagProtocol)bag
{
  return self->_bag;
}

- (void)setBag:(id)a3
{
  objc_storeStrong((id *)&self->_bag, a3);
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
  objc_storeStrong((id *)&self->_bundleID, a3);
}

- (NSNumber)externalVersionID
{
  return self->_externalVersionID;
}

- (void)setExternalVersionID:(id)a3
{
  objc_storeStrong((id *)&self->_externalVersionID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalVersionID, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_bag, 0);
}

@end
