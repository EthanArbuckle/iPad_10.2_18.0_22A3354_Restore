@implementation PKPaletteInputAssistantButtonProvider

- (PKPaletteInputAssistantButtonProvider)init
{
  return -[PKPaletteInputAssistantButtonProvider initWithInputAssistantItem:](self, "initWithInputAssistantItem:", 0);
}

- (PKPaletteInputAssistantButtonProvider)initWithInputAssistantItem:(id)a3
{
  id v5;
  PKPaletteInputAssistantButtonProvider *v6;
  PKPaletteInputAssistantButtonProvider *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPaletteInputAssistantButtonProvider;
  v6 = -[PKPaletteInputAssistantButtonProvider init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_inputAssistantItem, a3);

  return v7;
}

- (id)buttonsForCurrentConfiguration
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  uint64_t v14;
  PKPaletteBarButton *v15;
  void *v16;
  void *v17;
  void *v18;
  PKPaletteDictationBarButton *v19;
  void *v20;
  id obj;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  -[PKPaletteInputAssistantButtonProvider _nonSystemBarButtonItemGroups](self, "_nonSystemBarButtonItemGroups");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v5)
  {
    v6 = v5;
    v23 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v29 != v23)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        objc_msgSend(v8, "barButtonItems");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v25;
          do
          {
            for (j = 0; j != v11; ++j)
            {
              if (*(_QWORD *)v25 != v12)
                objc_enumerationMutation(v9);
              v14 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * j);
              if (-[PKPaletteInputAssistantButtonProvider _shouldIncludeBarButtonItem:](self, "_shouldIncludeBarButtonItem:", v14))
              {
                v15 = -[PKPaletteBarButton initWithBarButtonItem:]([PKPaletteBarButton alloc], "initWithBarButtonItem:", v14);
                objc_msgSend(v4, "addObject:", v15);

              }
            }
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
          }
          while (v11);
        }

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v6);
  }

  if (_os_feature_enabled_impl()
    && objc_msgSend(MEMORY[0x1E0DC3968], "dictationInputModeIsFunctional"))
  {
    v16 = (void *)MEMORY[0x1E0DC34A8];
    -[PKPaletteInputAssistantButtonProvider inputAssistantItem](self, "inputAssistantItem");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "barButtonItemForAssistantItemStyle:target:", 12, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = -[PKPaletteDictationBarButton initWithBarButtonItem:]([PKPaletteDictationBarButton alloc], "initWithBarButtonItem:", v18);
    objc_msgSend(v4, "addObject:", v19);

  }
  v20 = (void *)objc_msgSend(v4, "copy");

  return v20;
}

- (id)_nonSystemBarButtonItemGroups
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  -[PKPaletteInputAssistantButtonProvider inputAssistantItem](self, "inputAssistantItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0C9AA60];
  if (v2)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v2, "leadingBarButtonGroups");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    if (v5)
      v7 = (void *)v5;
    else
      v7 = v3;
    v8 = v7;

    objc_msgSend(v2, "trailingBarButtonGroups");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v9)
      v11 = (void *)v9;
    else
      v11 = v3;
    v12 = v11;

    objc_msgSend(v8, "arrayByAddingObjectsFromArray:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v21 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          if ((objc_msgSend(v18, "_isSystemGroup") & 1) == 0)
            objc_msgSend(v4, "addObject:", v18);
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v15);
    }
    v3 = (void *)objc_msgSend(v4, "copy");

  }
  return v3;
}

- (BOOL)_shouldIncludeBarButtonItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char isKindOfClass;
  char v8;
  uint64_t v10;
  void *v11;

  v4 = a3;
  objc_msgSend(v4, "customView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5
    || (objc_msgSend(v4, "target"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        isKindOfClass = objc_opt_isKindOfClass(),
        v6,
        (isKindOfClass & 1) != 0))
  {
    v8 = 0;
  }
  else
  {
    -[PKPaletteInputAssistantButtonProvider inclusionFilter](self, "inclusionFilter");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (v10)
      v8 = (*(uint64_t (**)(uint64_t, PKPaletteInputAssistantButtonProvider *, id))(v10 + 16))(v10, self, v4);
    else
      v8 = 1;

  }
  return v8;
}

- (UITextInputAssistantItem)inputAssistantItem
{
  return self->_inputAssistantItem;
}

- (void)setInputAssistantItem:(id)a3
{
  objc_storeStrong((id *)&self->_inputAssistantItem, a3);
}

- (id)inclusionFilter
{
  return self->_inclusionFilter;
}

- (void)setInclusionFilter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_inclusionFilter, 0);
  objc_storeStrong((id *)&self->_inputAssistantItem, 0);
}

@end
