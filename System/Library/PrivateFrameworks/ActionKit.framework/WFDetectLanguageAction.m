@implementation WFDetectLanguageAction

- (void)runAsynchronouslyWithInput:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __53__WFDetectLanguageAction_runAsynchronouslyWithInput___block_invoke;
  v3[3] = &unk_24F8BB6B0;
  v3[4] = self;
  objc_msgSend(a3, "getStringRepresentations:", v3);
}

void __53__WFDetectLanguageAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v5, "count"))
  {
    v16 = v6;
    v17 = v5;
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v19;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v19 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(MEMORY[0x24BDDFD50], "dominantLanguageForString:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v11), v16, v17, (_QWORD)v18);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "localizedStringForLanguageCode:", v12);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (v14)
          {
            objc_msgSend(*(id *)(a1 + 32), "output");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "addObject:", v14);

          }
          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v9);
    }

    objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", 0);
    v6 = v16;
    v5 = v17;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v6);
  }

}

@end
