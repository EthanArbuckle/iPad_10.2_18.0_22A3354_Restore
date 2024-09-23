@implementation HFAccessoryProfileGroup

+ (id)groupProfiles:(id)a3 options:(id)a4
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  id v12;

  objc_msgSend(a1, "_groupProfilesKeyedByIdentifier:options:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __49__HFAccessoryProfileGroup_groupProfiles_options___block_invoke;
  v10[3] = &unk_1EA73AAD8;
  v11 = v5;
  v12 = a1;
  v7 = v5;
  objc_msgSend(v6, "na_map:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __49__HFAccessoryProfileGroup_groupProfiles_options___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(*(Class *)(a1 + 40)), "initWithProfiles:groupIdentifier:", v5, v4);

  return v6;
}

- (HFAccessoryProfileGroup)initWithProfiles:(id)a3 groupIdentifier:(id)a4
{
  id v7;
  id v8;
  HFAccessoryProfileGroup *v9;
  HFAccessoryProfileGroup *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HFAccessoryProfileGroup;
  v9 = -[HFAccessoryProfileGroup init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_profiles, a3);
    objc_storeStrong((id *)&v10->_groupIdentifier, a4);
  }

  return v10;
}

+ (id)_groupProfilesKeyedByIdentifier:(id)a3 options:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;

  v6 = a4;
  v7 = (void *)MEMORY[0x1E0C99E08];
  v8 = a3;
  objc_msgSend(v7, "dictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __67__HFAccessoryProfileGroup__groupProfilesKeyedByIdentifier_options___block_invoke;
  v15[3] = &unk_1EA73AB00;
  v18 = a1;
  v16 = v6;
  v10 = v9;
  v17 = v10;
  v11 = v6;
  objc_msgSend(v8, "na_each:", v15);

  v12 = v17;
  v13 = v10;

  return v13;
}

void __67__HFAccessoryProfileGroup__groupProfilesKeyedByIdentifier_options___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 48), "_groupIdentifierForProfile:options:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "objectForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "addObject:", v5);
  objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v4, v3);

}

+ (id)_groupIdentifierForProfile:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_class *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
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

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "byCategoryType"))
  {
    v9 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v6, "accessory");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "category");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "categoryType");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "numberWithUnsignedInteger:", objc_msgSend(v12, "hash"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v13);

  }
  if (objc_msgSend(v7, "byClass"))
  {
    v14 = (void *)MEMORY[0x1E0CB37E8];
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "numberWithUnsignedInteger:", objc_msgSend(v16, "hash"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v17);

  }
  if (objc_msgSend(v7, "byManufacturer"))
  {
    v18 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v6, "accessory");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "manufacturer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "numberWithUnsignedInteger:", objc_msgSend(v20, "hash"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v21);

  }
  if (objc_msgSend(v7, "byModel"))
  {
    v22 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v6, "accessory");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "model");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "numberWithUnsignedInteger:", objc_msgSend(v24, "hash"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v25);

  }
  if (objc_msgSend(v7, "byRoom"))
  {
    v26 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v6, "accessory");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "room");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "uniqueIdentifier");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "numberWithUnsignedInteger:", objc_msgSend(v29, "hash"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v30);

  }
  objc_msgSend(a1, "_hashCombiningHashes:", v8);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  return v31;
}

+ (id)_hashCombiningHashes:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v3);
        v6 = objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "unsignedIntegerValue") + 131 * v6;
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSArray)profiles
{
  return self->_profiles;
}

- (NSNumber)groupIdentifier
{
  return self->_groupIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupIdentifier, 0);
  objc_storeStrong((id *)&self->_profiles, 0);
}

@end
