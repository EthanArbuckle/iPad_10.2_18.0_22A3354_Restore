@implementation NSDictionary

void __92__NSDictionary_AppStoreComponents__asc_dictionaryByMergingDictionary_uniquingKeysWithBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  int v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6 || (v7 = v5) != 0 && (v8 = objc_msgSend(v6, "isEqual:", v7), v7, v8))
  {
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, v10);
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v9, v10);

  }
}

@end
