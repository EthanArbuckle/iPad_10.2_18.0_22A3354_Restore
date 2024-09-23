@implementation EKEventStore

void __51__EKEventStore_MobileCal__colorNamesInRainbowOrder__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[8];

  v5[7] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0DDBBE0];
  v5[0] = *MEMORY[0x1E0DDBBF0];
  v5[1] = v0;
  v1 = *MEMORY[0x1E0DDBBD8];
  v5[2] = *MEMORY[0x1E0DDBBF8];
  v5[3] = v1;
  v2 = *MEMORY[0x1E0DDBBE8];
  v5[4] = *MEMORY[0x1E0DDBBC0];
  v5[5] = v2;
  v5[6] = *MEMORY[0x1E0DDBBC8];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 7);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)colorNamesInRainbowOrder___colorNames;
  colorNamesInRainbowOrder___colorNames = v3;

}

void __49__EKEventStore_MobileCal__symbolicNameToUIColors__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;
  _QWORD v5[5];

  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v3 = (void *)symbolicNameToUIColors___symbolicColorMapping;
  symbolicNameToUIColors___symbolicColorMapping = (uint64_t)v2;

  EKSymbolicColorToRGBMapping();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __49__EKEventStore_MobileCal__symbolicNameToUIColors__block_invoke_2;
  v5[3] = &unk_1E6019078;
  v5[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v5);

}

void __49__EKEventStore_MobileCal__symbolicNameToUIColors__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  id v5;
  id v6;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v4, "_uicolorFromString:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)symbolicNameToUIColors___symbolicColorMapping, "setObject:forKeyedSubscript:", v6, v5);

}

void __62__EKEventStore_MobileCal__defaultCalendarColorsInRainbowOrder__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v3 = (void *)defaultCalendarColorsInRainbowOrder___orderedUIColors;
  defaultCalendarColorsInRainbowOrder___orderedUIColors = (uint64_t)v2;

  objc_msgSend(*(id *)(a1 + 32), "symbolicNameToUIColors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "colorNamesInRainbowOrder", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = (void *)defaultCalendarColorsInRainbowOrder___orderedUIColors;
        objc_msgSend(v4, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v11);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

}

void __63__EKEventStore_MobileCal__localizedStringForSymbolicColorName___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[7];
  _QWORD v11[8];

  v11[7] = *MEMORY[0x1E0C80C00];
  EventKitUIBundle();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = *MEMORY[0x1E0DDBBF0];
  objc_msgSend(v0, "localizedStringForKey:value:table:", CFSTR("Red"), &stru_1E601DFA8, 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v1;
  v10[1] = *MEMORY[0x1E0DDBBE0];
  objc_msgSend(v0, "localizedStringForKey:value:table:", CFSTR("Orange"), &stru_1E601DFA8, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v2;
  v10[2] = *MEMORY[0x1E0DDBBF8];
  objc_msgSend(v0, "localizedStringForKey:value:table:", CFSTR("Yellow"), &stru_1E601DFA8, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v3;
  v10[3] = *MEMORY[0x1E0DDBBD8];
  objc_msgSend(v0, "localizedStringForKey:value:table:", CFSTR("Green"), &stru_1E601DFA8, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[3] = v4;
  v10[4] = *MEMORY[0x1E0DDBBC0];
  objc_msgSend(v0, "localizedStringForKey:value:table:", CFSTR("Blue"), &stru_1E601DFA8, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[4] = v5;
  v10[5] = *MEMORY[0x1E0DDBBE8];
  objc_msgSend(v0, "localizedStringForKey:value:table:", CFSTR("Purple"), &stru_1E601DFA8, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[5] = v6;
  v10[6] = *MEMORY[0x1E0DDBBC8];
  objc_msgSend(v0, "localizedStringForKey:value:table:", CFSTR("Brown"), &stru_1E601DFA8, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[6] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 7);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)localizedStringForSymbolicColorName____localizedStringMapping;
  localizedStringForSymbolicColorName____localizedStringMapping = v8;

}

void __48__EKEventStore_MobileCal__symbolicNameForColor___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v8;

  v8 = a2;
  if (objc_msgSend(a3, "isEqual:", *(_QWORD *)(a1 + 32)))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

@end
