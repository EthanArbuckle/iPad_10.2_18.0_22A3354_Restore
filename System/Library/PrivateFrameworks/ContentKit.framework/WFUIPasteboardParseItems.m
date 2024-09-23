@implementation WFUIPasteboardParseItems

WFPasteboardItem *__WFUIPasteboardParseItems_block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  int v22;
  id v23;
  void *v24;
  uint64_t v25;
  WFPasteboardItem *v26;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id obj;
  void *v33;
  void *v34;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  v34 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndex:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  obj = v4;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v37;
    v9 = *MEMORY[0x24BDF8410];
    v33 = (void *)*MEMORY[0x24BDF85E0];
    v31 = (void *)*MEMORY[0x24BDF8560];
    v28 = (void *)*MEMORY[0x24BDF83F8];
    v29 = (void *)*MEMORY[0x24BDF83B0];
    v30 = (void *)*MEMORY[0x24BDF8510];
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v37 != v8)
          objc_enumerationMutation(obj);
        v11 = *(id *)(*((_QWORD *)&v36 + 1) + 8 * v10);
        objc_msgSend(MEMORY[0x24BEC14A0], "typeWithString:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "conformsToUTType:", v9);

        v14 = *(void **)(a1 + 32);
        if (v13)
          objc_msgSend(v14, "dataForPasteboardType:inItemSet:", v11, v5);
        else
          objc_msgSend(v14, "valuesForPasteboardType:inItemSet:", v11, v5);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "firstObject", v28);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          v17 = v11;
          objc_msgSend(v33, "identifier");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v17, "isEqualToString:", v18);

          if (v19)
          {
            v20 = v30;
            goto LABEL_16;
          }
          objc_msgSend(v31, "identifier");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v17, "isEqualToString:", v21);

          if (v22)
          {
            v20 = v29;
            goto LABEL_16;
          }
          if (objc_msgSend(v17, "isEqualToString:", CFSTR("com.microsoft.HTML")))
          {
            v20 = v28;
LABEL_16:
            objc_msgSend(v20, "identifier");
            v23 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v23 = v17;
          }
          v24 = v23;

          objc_msgSend(v34, "setObject:forKey:", v16, v24);
        }

        ++v10;
      }
      while (v7 != v10);
      v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
      v7 = v25;
    }
    while (v25);
  }

  v26 = -[WFPasteboardItem initWithItemsByType:fileURLs:]([WFPasteboardItem alloc], "initWithItemsByType:fileURLs:", v34, 0);
  return v26;
}

@end
