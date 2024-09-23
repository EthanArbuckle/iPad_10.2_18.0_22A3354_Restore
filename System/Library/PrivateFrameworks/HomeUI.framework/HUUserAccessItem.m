@implementation HUUserAccessItem

id __49___HUUserAccessItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;

  v3 = a2;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31578]), "initWithResults:", v3);
  v5 = v4;
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(v4, "results");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "mutableCopy");

    objc_msgSend(v7, "addEntriesFromDictionary:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v5, "setResults:", v7);

  }
  v8 = *MEMORY[0x1E0D30B80];
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D30B80]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "mutableCopy");
  v11 = v10;
  if (v10)
    v12 = v10;
  else
    v12 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v13 = v12;

  objc_msgSend(*(id *)(a1 + 40), "user");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObject:", v14);

  objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, v8);
  v15 = *MEMORY[0x1E0D30B78];
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D30B78]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v16, "mutableCopy");
  v18 = v17;
  if (v17)
    v19 = v17;
  else
    v19 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v20 = v19;

  objc_msgSend(v20, "addObject:", objc_opt_class());
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v20, v15);
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v5);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

@end
