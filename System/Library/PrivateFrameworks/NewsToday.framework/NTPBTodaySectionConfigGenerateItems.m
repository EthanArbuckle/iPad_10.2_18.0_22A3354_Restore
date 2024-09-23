@implementation NTPBTodaySectionConfigGenerateItems

void __NTPBTodaySectionConfigGenerateItems_block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  uint64_t v11;
  char v13;
  BOOL v14;

  v6 = a2;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x24BE6C7C0]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x24BE6C7B8]))
  {
    objc_msgSend(v7, "setItemType:", 0);
    v14 = 0;
    NTPBTodaySectionConfigGenerateArticle(v6, &v14);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setArticle:", v9);

    v10 = v14;
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v13 = v10 && *(_BYTE *)(v11 + 24) != 0;
    *(_BYTE *)(v11 + 24) = v13;
    if (!v10)
      *a4 = 1;
  }

}

@end
