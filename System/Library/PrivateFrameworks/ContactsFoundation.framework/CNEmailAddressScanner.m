@implementation CNEmailAddressScanner

- (id)firstEmailAddressInString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  char v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (CNIsStringEmpty_block_invoke((uint64_t)&__block_literal_global_108, v3))
  {
    v4 = 0;
  }
  else
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    objc_msgSend(MEMORY[0x1E0D1CE70], "scanString:", v3, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v16;
      v9 = *MEMORY[0x1E0D1CAB0];
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v16 != v8)
            objc_enumerationMutation(v5);
          v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          objc_msgSend(v11, "type");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "isEqualToString:", v9);

          if ((v13 & 1) != 0)
          {
            objc_msgSend(v11, "matchedString");
            v4 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_13;
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v7)
          continue;
        break;
      }
    }
    v4 = 0;
LABEL_13:

  }
  return v4;
}

- (void)enumerateEmailAddressesInString:(id)a3 usingBlock:(id)a4
{
  id v5;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v5 = a3;
  v6 = a4;
  if (!CNIsStringEmpty_block_invoke((uint64_t)&__block_literal_global_108, v5))
  {
    +[CNObservable observableWithScannerResultsOfType:inString:](CNObservable, "observableWithScannerResultsOfType:inString:", 2, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __68__CNEmailAddressScanner_enumerateEmailAddressesInString_usingBlock___block_invoke;
    v8[3] = &unk_1E29B9D80;
    v9 = v6;
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", v8);

  }
}

void __68__CNEmailAddressScanner_enumerateEmailAddressesInString_usingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = a2;
  objc_msgSend(v6, "matchedString");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "range");
  v9 = v8;

  (*(void (**)(uint64_t, id, uint64_t, uint64_t, uint64_t))(v5 + 16))(v5, v10, v7, v9, a4);
}

- (void)withEmailAddressesInString:(id)a3 each:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __57__CNEmailAddressScanner_withEmailAddressesInString_each___block_invoke;
  v8[3] = &unk_1E29B9DA8;
  v9 = v6;
  v7 = v6;
  -[CNEmailAddressScanner enumerateEmailAddressesInString:usingBlock:](self, "enumerateEmailAddressesInString:usingBlock:", a3, v8);

}

uint64_t __57__CNEmailAddressScanner_withEmailAddressesInString_each___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
