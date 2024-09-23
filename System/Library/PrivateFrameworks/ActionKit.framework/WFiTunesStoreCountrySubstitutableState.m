@implementation WFiTunesStoreCountrySubstitutableState

- (void)processWithContext:(id)a3 userInputRequiredHandler:(id)a4 valueHandler:(id)a5
{
  id v8;
  objc_super v9;
  _QWORD v10[4];
  id v11;

  v10[1] = 3221225472;
  v10[2] = __99__WFiTunesStoreCountrySubstitutableState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke;
  v10[3] = &unk_24F8B72E0;
  v11 = a5;
  v9.receiver = self;
  v9.super_class = (Class)WFiTunesStoreCountrySubstitutableState;
  v10[0] = MEMORY[0x24BDAC760];
  v8 = v11;
  -[WFVariableSubstitutableParameterState processWithContext:userInputRequiredHandler:valueHandler:](&v9, sel_processWithContext_userInputRequiredHandler_valueHandler_, a3, a4, v10);

}

void __99__WFiTunesStoreCountrySubstitutableState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  int v16;
  uint64_t v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    v17 = a1;
    v18 = v6;
    objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    objc_msgSend(MEMORY[0x24BDBCEA0], "ISOCountryCodes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v20;
      v13 = *MEMORY[0x24BDBCAE8];
      while (2)
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v20 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(v8, "displayNameForKey:value:", v13, *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v14));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v5, "isEqualToString:", v15);

          if (v16)
          {
            v7 = v18;
            (*(void (**)(void))(*(_QWORD *)(v17 + 32) + 16))();

            goto LABEL_12;
          }
          ++v14;
        }
        while (v11 != v14);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        if (v11)
          continue;
        break;
      }
    }

    v7 = v18;
    (*(void (**)(void))(*(_QWORD *)(v17 + 32) + 16))();
LABEL_12:

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

@end
