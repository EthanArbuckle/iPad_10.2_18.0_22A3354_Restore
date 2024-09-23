@implementation LTTextTranslationRequest

void __54___LTTextTranslationRequest__paragraphRequestForText___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  _LTTranslationRange *v18;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%zd"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "string");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "substringWithRange:", a3, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend(*(id *)(a1 + 40), "ignoringAttributes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v22;
    LOBYTE(v15) = 1;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v22 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(v7, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i));
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        v15 = (v17 == 0) & v15;
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v13);
  }
  else
  {
    v15 = 1;
  }

  v18 = -[_LTTranslationRange initWithIdentifier:text:shouldTranslate:]([_LTTranslationRange alloc], "initWithIdentifier:text:shouldTranslate:", v8, v10, v15);
  objc_msgSend(*(id *)(a1 + 48), "addObject:", v18);
  v19 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 56), "uniqueID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "_saveAttributes:forRequestUniqueID:alignmentIdentifier:", v7, v20, v8);

  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
}

void __63___LTTextTranslationRequest__startTranslationWithService_done___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  NSObject *v8;
  uint8_t v9[16];

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v8 = _LTOSLogTranslationEngine();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_235438000, v8, OS_LOG_TYPE_INFO, "Received paragraph translation result", v9, 2u);
    }
    objc_msgSend(WeakRetained, "_handleParagraphResponse:error:", v5, v6);
  }

}

id __59___LTTextTranslationRequest__constructFinalParagraphResult__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id WeakRetained;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_addAlignmentAttributesToResult:requestIdentifier:", v5, v4);

  return v5;
}

@end
