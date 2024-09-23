@implementation CNCardPropertyAddressingGrammarGroup

- (Class)propertyGroupItemClass
{
  return (Class)objc_opt_self();
}

- (BOOL)canAddEditingItem
{
  unsigned int v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  objc_super v9;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v9.receiver = self;
  v9.super_class = (Class)CNCardPropertyAddressingGrammarGroup;
  v3 = -[CNCardPropertyGroup canAddEditingItem](&v9, sel_canAddEditingItem);
  if (v3)
  {
    -[CNCardGroup contact](self, "contact");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "contactType");

    if (v5 == 1)
    {
      LOBYTE(v3) = 0;
    }
    else
    {
      v11 = 0;
      v12 = &v11;
      v13 = 0x2050000000;
      v6 = (void *)getIPPronounPickerViewControllerClass_softClass_54580;
      v14 = getIPPronounPickerViewControllerClass_softClass_54580;
      if (!getIPPronounPickerViewControllerClass_softClass_54580)
      {
        v10[0] = MEMORY[0x1E0C809B0];
        v10[1] = 3221225472;
        v10[2] = __getIPPronounPickerViewControllerClass_block_invoke_54581;
        v10[3] = &unk_1E204EBC0;
        v10[4] = &v11;
        __getIPPronounPickerViewControllerClass_block_invoke_54581((uint64_t)v10);
        v6 = (void *)v12[3];
      }
      v7 = objc_retainAutorelease(v6);
      _Block_object_dispose(&v11, 8);
      LOBYTE(v3) = objc_msgSend(v7, "canDisplayPronounPicker");
    }
  }
  return v3;
}

- (id)newEditingItemWithValue:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C97338], "labeledValueWithLabel:value:", 0, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNCardGroup contact](self, "contact");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNPropertyGroupAddressingGrammarItem propertyGroupItemWithLabeledValue:group:contact:](CNPropertyGroupAddressingGrammarItem, "propertyGroupItemWithLabeledValue:group:contact:", v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setWasAdded:", 1);
  return v6;
}

- (BOOL)shouldShowLanguageLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  char v10;
  _QWORD v12[4];
  id v13;
  id v14;

  objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "componentsSeparatedByString:", CFSTR("-"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNCardPropertyGroup editingItems](self, "editingItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __63__CNCardPropertyAddressingGrammarGroup_shouldShowLanguageLabel__block_invoke;
  v12[3] = &unk_1E204EB98;
  v13 = v6;
  v14 = v4;
  v8 = v4;
  v9 = v6;
  v10 = objc_msgSend(v7, "_cn_any:", v12);

  return v10;
}

- (void)saveChanges
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  -[CNCardGroup contact](self, "contact");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  if (v5)
  {
    v24 = v5;
    v6 = objc_alloc(MEMORY[0x1E0C99DE8]);
    -[CNCardPropertyGroup editingItems](self, "editingItems");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithCapacity:", objc_msgSend(v7, "count"));

    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    -[CNCardPropertyGroup editingItems](self, "editingItems");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v26;
      v13 = *MEMORY[0x1E0D137F0];
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v26 != v12)
            objc_enumerationMutation(v9);
          v15 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          objc_opt_class();
          v16 = v15;
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v17 = v16;
          else
            v17 = 0;
          v18 = v17;

          objc_msgSend(v18, "labeledValue");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "value");
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          if (((*(uint64_t (**)(uint64_t, void *))(v13 + 16))(v13, v20) & 1) == 0)
          {
            objc_msgSend(v18, "labeledValue");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "_cn_addNonNilObject:", v21);

          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v11);
    }

    v5 = v24;
    objc_msgSend(v24, "addressingGrammars");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "isEqualToArray:", v8);

    if ((v23 & 1) == 0 && !-[CNCardPropertyAddressingGrammarGroup shouldKeepNoiseValue](self, "shouldKeepNoiseValue"))
      objc_msgSend(v24, "setAddressingGrammars:", v8);

  }
}

- (BOOL)shouldKeepNoiseValue
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  char v12;

  if (-[CNCardPropertyGroup valueEditingItemsCount](self, "valueEditingItemsCount"))
    return 0;
  -[CNCardGroup contact](self, "contact");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addressingGrammars");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5 != 1)
    return 0;
  objc_opt_class();
  -[CNCardGroup contact](self, "contact");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addressingGrammars");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "value");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;
  v11 = v10;

  v12 = objc_msgSend(v11, "isUnspecified");
  return v12;
}

uint64_t __63__CNCardPropertyAddressingGrammarGroup_shouldShowLanguageLabel__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;

  v3 = a2;
  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  objc_opt_class();
  objc_msgSend(v6, "labeledValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "value");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  if (((*(uint64_t (**)(void))(*MEMORY[0x1E0D137F0] + 16))() & 1) != 0)
  {
    v11 = 0;
  }
  else
  {
    objc_msgSend(v10, "languageIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v12, "isEqualToString:", *(_QWORD *)(a1 + 32)) & 1) != 0)
    {
      v11 = 0;
    }
    else
    {
      objc_msgSend(v10, "languageIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v13, "isEqualToString:", *(_QWORD *)(a1 + 40)) ^ 1;

    }
  }

  return v11;
}

@end
