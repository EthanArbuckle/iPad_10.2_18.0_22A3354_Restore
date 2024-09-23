@implementation ASDMediaClipTaskURLBuilder

- (id)initWithBundleID:(void *)a3 bag:
{
  id v6;
  id v7;
  id *v8;
  objc_super v10;

  v6 = a2;
  v7 = a3;
  if (a1)
  {
    v10.receiver = a1;
    v10.super_class = (Class)ASDMediaClipTaskURLBuilder;
    v8 = (id *)objc_msgSendSuper2(&v10, sel_init);
    a1 = v8;
    if (v8)
    {
      objc_storeStrong(v8 + 1, a2);
      objc_storeStrong(a1 + 2, a3);
    }
  }

  return a1;
}

- (id)build
{
  id *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  id (*v17)(uint64_t, void *);
  void *v18;
  id *v19;
  _QWORD v20[4];

  v1 = a1;
  v20[3] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    objc_msgSend(a1[2], "URLForKey:", 0x1E37C3420);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "valuePromise");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v1[2], "stringForKey:", 0x1E37C3460);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "valuePromise");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = MEMORY[0x1E0C809B0];
    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __42__ASDMediaClipTaskURLBuilder__pathPromise__block_invoke;
    v18 = &unk_1E37BE8E0;
    v19 = v1;
    objc_msgSend(v5, "thenWithBlock:", &v15);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v1[2], "stringForKey:", 0x1E37C3440);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "valuePromise");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = v6;
    v16 = 3221225472;
    v17 = __43__ASDMediaClipTaskURLBuilder__queryPromise__block_invoke;
    v18 = &unk_1E37BE8E0;
    v19 = v1;
    objc_msgSend(v9, "thenWithBlock:", &v15);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (void *)MEMORY[0x1E0CFDBD8];
    v20[0] = v3;
    v20[1] = v7;
    v20[2] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "promiseWithAll:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "thenWithBlock:", &__block_literal_global_7);
    v1 = (id *)objc_claimAutoreleasedReturnValue();

  }
  return v1;
}

id __35__ASDMediaClipTaskURLBuilder_build__block_invoke(uint64_t a1, void *a2)
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
  objc_msgSend(MEMORY[0x1E0CFDBD8], "promiseWithResult:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __42__ASDMediaClipTaskURLBuilder__pathPromise__block_invoke(uint64_t a1, void *a2)
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
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
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

  objc_msgSend(MEMORY[0x1E0CFDBD8], "promiseWithResult:", v12);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

id __43__ASDMediaClipTaskURLBuilder__queryPromise__block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  int v7;
  id *v8;
  id v9;
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
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)MEMORY[0x1E0C99DE8];
  v4 = a2;
  v5 = objc_alloc_init(v3);
  objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("l"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "addObject:", v6);
  if (*(_QWORD *)(a1 + 32))
  {
    v7 = objc_msgSend(MEMORY[0x1E0CFDA50], "deviceIsiPad");
    v8 = (id *)MEMORY[0x1E0CFD908];
    if (v7)
      v8 = (id *)MEMORY[0x1E0CFD900];
    v9 = *v8;
    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("platform"), v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v10);

    }
  }
  else
  {
    v9 = 0;
  }
  v23[0] = CFSTR("variantsInfo");
  v23[1] = CFSTR("verifiedAssociatedDomains");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
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
  objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("relate[app-clips]"), CFSTR("app"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v19);

  objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("include[app-clips]"), CFSTR("app-genres"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v20);

  objc_msgSend(MEMORY[0x1E0CFDBD8], "promiseWithResult:", v5);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (void)setExternalVersionID:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 24), a2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalVersionID, 0);
  objc_storeStrong((id *)&self->_bag, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end
