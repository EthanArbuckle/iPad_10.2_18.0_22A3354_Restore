@implementation NSDictionary

void __54__NSDictionary_BLTNSNullRemoval__objectWithNoNSNulls___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;

  v5 = a2;
  v10 = 0;
  objc_msgSend(a3, "objectWithNoNSNulls:", &v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v10;
  if (!v6)
  {
    v8 = *(void **)(a1 + 40);
    v9 = (id)MEMORY[0x24BDBD1C8];
    goto LABEL_5;
  }
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v5);
  if (objc_msgSend(v7, "count"))
  {
    v8 = *(void **)(a1 + 40);
    v9 = v7;
LABEL_5:
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, v5);
  }

}

void __52__NSDictionary_BLTNSNullRemoval__objectWithNSNulls___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  objc_msgSend(v5, "objectSentinelNull");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(void **)(a1 + 32);
  if (v6)
  {
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, v10);
  }
  else
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectWithNSNulls:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v9, v10);

  }
}

void __37__NSDictionary_BLTSizeOf__blt_sizeof__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;

  v5 = a3;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += objc_msgSend(a2, "blt_sizeof");
  v6 = objc_msgSend(v5, "blt_sizeof");

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += v6;
}

@end
