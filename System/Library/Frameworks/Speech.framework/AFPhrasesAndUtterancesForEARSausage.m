@implementation AFPhrasesAndUtterancesForEARSausage

void __AFPhrasesAndUtterancesForEARSausage_block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  int v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  uint64_t i;
  double v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", *(_QWORD *)(a1 + 56));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unsignedIntegerValue");

  objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  AFTokensForEARTokens(v9, *(_BYTE *)(a1 + 64));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "count"))
  {
    v11 = objc_alloc_init(MEMORY[0x1E0CFEA38]);
    objc_msgSend(v11, "setTokens:", v10);
    v12 = objc_msgSend(*(id *)(a1 + 48), "containsObject:", v11);
    v13 = *(void **)(a1 + 48);
    if (v12)
    {
      v14 = objc_msgSend(v13, "indexOfObject:", v11);
    }
    else
    {
      v14 = objc_msgSend(v13, "count");
      objc_msgSend(*(id *)(a1 + 48), "addObject:", v11);
    }
    objc_msgSend(v6, "interpretationIndices");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "arrayByAddingObject:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setInterpretationIndices:", v17);

    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v18 = v9;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v26;
      v22 = 0.0;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v26 != v21)
            objc_enumerationMutation(v18);
          objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "confidence", (_QWORD)v25);
          v22 = v22 + v24;
        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v20);
    }
    else
    {
      v22 = 0.0;
    }

    objc_msgSend(v6, "setConfidenceScore:", (uint64_t)(v22 + (double)objc_msgSend(v6, "confidenceScore")));
  }

}

@end
