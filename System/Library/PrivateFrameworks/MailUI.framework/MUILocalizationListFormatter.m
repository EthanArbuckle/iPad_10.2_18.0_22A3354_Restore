@implementation MUILocalizationListFormatter

- (id)attributedLocalizedStringFromList:(id)a3
{
  id v3;
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  const __CFString *v23;
  uint64_t v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  id v29;
  uint64_t v30;
  id obj;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0CB3778]);
  if (objc_msgSend(v3, "count") == 2)
  {
    v5 = objc_alloc(MEMORY[0x1E0CB3498]);
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("LIST_EXACTLY_TWO_ITEMS"), &stru_1E99EB1C8, CFSTR("MUIListFormatter"));
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    if (v7)
      v9 = (const __CFString *)v7;
    else
      v9 = &stru_1E99EB1C8;
    v10 = (void *)objc_msgSend(v5, "initWithString:", v9);

    objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectAtIndexedSubscript:", 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendLocalizedFormat:", v10, v11, v12);

  }
  else if (v3)
  {
    v13 = objc_msgSend(v3, "count");
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v29 = v3;
    obj = v3;
    v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v33;
      do
      {
        v17 = 0;
        v30 = v13;
        v18 = v13 - 1;
        do
        {
          if (*(_QWORD *)v33 != v16)
            objc_enumerationMutation(obj);
          v19 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * v17);
          if (objc_msgSend(v4, "length"))
          {
            v20 = objc_alloc(MEMORY[0x1E0CB3498]);
            objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = v21;
            if (v18 == v17)
              v23 = CFSTR("LIST_FINAL_ITEM");
            else
              v23 = CFSTR("LIST_NON_FINAL_ITEM");
          }
          else
          {
            v20 = objc_alloc(MEMORY[0x1E0CB3498]);
            objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = v21;
            v23 = CFSTR("LIST_INITIAL_ITEM");
          }
          objc_msgSend(v21, "localizedStringForKey:value:table:", v23, &stru_1E99EB1C8, CFSTR("MUIListFormatter"));
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = (void *)v24;
          if (v24)
            v26 = (const __CFString *)v24;
          else
            v26 = &stru_1E99EB1C8;
          v27 = (void *)objc_msgSend(v20, "initWithString:", v26);

          objc_msgSend(v4, "appendLocalizedFormat:", v27, v19);
          ++v17;
        }
        while (v15 != v17);
        v13 = v30 - v15;
        v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      }
      while (v15);
    }

    v3 = v29;
  }

  return v4;
}

- (id)localizedStringFromList:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "ef_map:", &__block_literal_global_19);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUILocalizationListFormatter attributedLocalizedStringFromList:](self, "attributedLocalizedStringFromList:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "string");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __56__MUILocalizationListFormatter_localizedStringFromList___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  __CFString *v3;
  id v4;
  const __CFString *v5;
  void *v6;

  v2 = (objc_class *)MEMORY[0x1E0CB3498];
  v3 = a2;
  v4 = [v2 alloc];
  if (v3)
    v5 = v3;
  else
    v5 = &stru_1E99EB1C8;
  v6 = (void *)objc_msgSend(v4, "initWithString:", v5);

  return v6;
}

- (id)stringForObjectValue:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v4, "ef_all:", &__block_literal_global_17))
  {
    -[MUILocalizationListFormatter localizedStringFromList:](self, "localizedStringFromList:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

uint64_t __53__MUILocalizationListFormatter_stringForObjectValue___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end
