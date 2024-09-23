@implementation ICNamedEntityStore

void __53___ICNamedEntityStore_exemplarSetForSupportedLocales__block_invoke()
{
  NSObject *v0;
  int v1;
  uint8_t buf[4];
  int v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v1 = 0;
  exemplarSetForSupportedLocales_exemplarSet = _createExemplarSetForLocales(&unk_24EF76228, &v1);
  if (v1 >= 1)
  {
    _ICPersNamedEntityOSLogFacility();
    v0 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v3 = v1;
      _os_log_impl(&dword_22716D000, v0, OS_LOG_TYPE_DEFAULT, "Unable to create exemplar set for whitelisting named entities (UErrorCode=%d)", buf, 8u);
    }

  }
}

uint64_t __54___ICNamedEntityStore_areStringCharactersWhitelisted___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t result;

  v5 = *(_QWORD *)(a1 + 40);
  v6 = MEMORY[0x2276AC5B0](a2);
  result = MEMORY[0x2276AC61C](v5, v6);
  if (!(_DWORD)result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
    *a3 = 1;
  }
  return result;
}

void __43___ICNamedEntityStore_addEntity_isDurable___block_invoke(uint64_t a1, void *a2)
{
  unint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "removeObject:");
  v3 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "count");
  v4 = *(_QWORD *)(a1 + 32);
  if (v3 >= *(_QWORD *)(v4 + 16))
  {
    objc_msgSend(*(id *)(v4 + 8), "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "removeEntity:", v5);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "removeEntity:", v5);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "removeObjectAtIndex:", 0);

    v4 = *(_QWORD *)(a1 + 32);
  }
  objc_msgSend(*(id *)(v4 + 8), "addObject:", v6);

}

id __43___ICNamedEntityStore_addEntity_isDurable___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  objc_msgSend(a3, "lowercaseString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = v4;
  v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v10, "name", (_QWORD)v15);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "lowercaseString");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v5, "isEqualToString:", v12);

        if ((v13 & 1) != 0)
        {
          v7 = v10;
          goto LABEL_11;
        }
      }
      v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return v7;
}

void __32___ICNamedEntityStore_tokenize___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  void *v5;
  void *v6;
  id v7;

  if ((a4 - 500) <= 0xFFFFFE0C)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", a2, a3, 4);
    objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringByTrimmingCharactersInSet:", v6);
    v7 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);
  }
}

@end
