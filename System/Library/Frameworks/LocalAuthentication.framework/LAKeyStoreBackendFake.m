@implementation LAKeyStoreBackendFake

id __51___LAKeyStoreBackendFake_createKeyWithQuery_error___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  __SecAccessControl *v5;

  v1 = (void *)objc_msgSend(*(id *)(a1 + 32), "mutableCopy");
  v2 = *MEMORY[0x1E0CD6FC0];
  objc_msgSend(v1, "objectForKeyedSubscript:", *MEMORY[0x1E0CD6FC0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], *MEMORY[0x1E0CD69D8]);
  v5 = +[LASecAccessControl allowAllACL](LASecAccessControl, "allowAllACL");
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, *MEMORY[0x1E0CD6890]);

  objc_msgSend(v1, "setObject:forKeyedSubscript:", v4, v2);
  return v1;
}

id __51___LAKeyStoreBackendFake_createKeyWithQuery_error___block_invoke_2(_QWORD *a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  objc_msgSend(*(id *)(a1[4] + 8), "objectForKeyedSubscript:", a1[5]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = v2;
  else
    v4 = (id)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  v5 = v4;

  objc_msgSend(v5, "addObject:", a1[6]);
  return v5;
}

id __63___LAKeyStoreBackendFake_createGenericPasswordWithQuery_error___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  objc_msgSend(*(id *)(a1[4] + 16), "objectForKeyedSubscript:", a1[5]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = v2;
  else
    v4 = (id)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  v5 = v4;

  objc_msgSend(v5, "addObject:", a1[6]);
  return v5;
}

uint64_t __52___LAKeyStoreBackendFake_fetchItemsWithQuery_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", a2);
}

uint64_t __52___LAKeyStoreBackendFake_fetchItemsWithQuery_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", a2);
}

@end
