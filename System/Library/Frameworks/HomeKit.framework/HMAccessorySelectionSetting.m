@implementation HMAccessorySelectionSetting

- (HMAccessorySelectionSetting)initWithKey:(id)a3 properties:(unint64_t)a4 value:(id)a5
{
  return -[HMAccessorySelectionSetting initWithKey:properties:value:items:](self, "initWithKey:properties:value:items:", a3, a4, a5, 0);
}

- (HMAccessorySelectionSetting)initWithKey:(id)a3 properties:(unint64_t)a4 value:(id)a5 items:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  HMAccessorySettingConstraint *v18;
  _HMAccessorySetting *v19;
  HMAccessorySelectionSetting *v20;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  v11 = a6;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v13 = v11;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v24;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v24 != v16)
          objc_enumerationMutation(v13);
        v18 = -[HMAccessorySettingConstraint initWithType:value:]([HMAccessorySettingConstraint alloc], "initWithType:value:", 4, *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v17));
        objc_msgSend(v12, "addObject:", v18);

        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v15);
  }

  v19 = -[_HMAccessorySetting initWithType:properties:name:constraints:]([_HMAccessorySetting alloc], "initWithType:properties:name:constraints:", 4, a4, v9, v12);
  -[_HMAccessorySetting setValue:](v19, "setValue:", v10);
  v20 = -[HMAccessorySelectionSetting initWithInternal:](self, "initWithInternal:", v19);

  return v20;
}

- (void)updateValue:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[HMAccessorySetting internal](self, "internal");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:", v4);

  -[HMAccessorySetting internal](self, "internal");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[HMAccessorySetting _settingDidUpdateValue:](self, "_settingDidUpdateValue:", v6);

}

- (HMAccessorySelectionSetting)initWithInternal:(id)a3
{
  id v4;
  HMAccessorySelectionSetting *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  objc_super v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)HMAccessorySelectionSetting;
  v5 = -[HMAccessorySetting initWithInternal:](&v19, sel_initWithInternal_, v4);
  if (v5)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    objc_msgSend(v4, "constraints", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v16;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v10), "value");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v12 = v11;
          else
            v12 = 0;
          v13 = v12;

          objc_msgSend(v13, "setSetting:", v5);
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
      }
      while (v8);
    }

  }
  return v5;
}

- (NSArray)items
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[HMAccessorySetting internal](self, "internal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "constraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v10, "type", (_QWORD)v16) == 4)
        {
          objc_msgSend(v10, "value");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v12 = v11;
          else
            v12 = 0;
          v13 = v12;

          if (v13)
            objc_msgSend(v4, "addObject:", v13);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

  v14 = (void *)objc_msgSend(v4, "copy");
  return (NSArray *)v14;
}

- (void)addItem:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  HMAccessorySettingConstraint *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id from;
  id location;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v8 = -[HMAccessorySettingConstraint initWithType:value:]([HMAccessorySettingConstraint alloc], "initWithType:value:", 4, v6);
    objc_initWeak(&location, self);
    objc_initWeak(&from, v6);
    -[HMAccessorySetting internal](self, "internal");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __57__HMAccessorySelectionSetting_addItem_completionHandler___block_invoke;
    v13[3] = &unk_1E3AB5478;
    objc_copyWeak(&v15, &location);
    objc_copyWeak(&v16, &from);
    v14 = v7;
    objc_msgSend(v9, "addConstraint:completionHandler:", v8, v13);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }
  else
  {
    -[HMAccessorySetting internal](self, "internal");
    v8 = (HMAccessorySettingConstraint *)objc_claimAutoreleasedReturnValue();
    -[HMAccessorySettingConstraint context](v8, "context");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "delegateCaller");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 20);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "callCompletion:error:", v7, v12);

  }
}

- (void)removeItem:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id location;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v22 = a4;
  if (v6)
  {
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    -[HMAccessorySetting internal](self, "internal");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "constraints");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (id)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v28;
      while (2)
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v28 != v10)
            objc_enumerationMutation(v8);
          v12 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v12, "value", v22);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v14 = v13;
          else
            v14 = 0;
          v15 = v14;

          if (objc_msgSend(v6, "isEqual:", v15))
          {
            v9 = v12;

            goto LABEL_15;
          }

        }
        v9 = (id)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
        if (v9)
          continue;
        break;
      }
    }
LABEL_15:

    objc_initWeak(&location, v6);
    -[HMAccessorySetting internal](self, "internal");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __60__HMAccessorySelectionSetting_removeItem_completionHandler___block_invoke;
    v23[3] = &unk_1E3AB54A0;
    objc_copyWeak(&v25, &location);
    v24 = v22;
    objc_msgSend(v16, "removeConstraint:completionHandler:", v9, v23);

    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);

    v17 = v22;
  }
  else
  {
    -[HMAccessorySetting internal](self, "internal");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "context");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "delegateCaller");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v22;
    objc_msgSend(v20, "callCompletion:error:", v22, v21);

  }
}

- (void)_setting:(id)a3 didAddConstraint:(id)a4
{
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(a4, "value", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  objc_msgSend(v7, "setSetting:", self);
}

void __60__HMAccessorySelectionSetting_removeItem_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  uint64_t v5;
  id v6;

  v3 = a2;
  v6 = v3;
  if (!v3)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "setSetting:", 0);

    v3 = 0;
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
  {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v6);
    v3 = v6;
  }

}

void __57__HMAccessorySelectionSetting_addItem_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  id v5;
  uint64_t v6;
  id v7;

  v3 = a2;
  v7 = v3;
  if (!v3)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v5 = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(v5, "setSetting:", WeakRetained);

    v3 = 0;
  }
  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
  {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v7);
    v3 = v7;
  }

}

@end
