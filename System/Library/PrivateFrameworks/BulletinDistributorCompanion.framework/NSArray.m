@implementation NSArray

void __49__NSArray_BLTNSNullRemoval__objectWithNoNSNulls___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;

  v13 = 0;
  objc_msgSend(a2, "objectWithNoNSNulls:", &v13);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v13;
  if (!v5)
  {
    v12 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (id)MEMORY[0x24BDBD1C8];
    v10 = v12;
    goto LABEL_5;
  }
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
  if (objc_msgSend(v6, "count"))
  {
    v7 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v7;
    v11 = v6;
LABEL_5:
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, v9);

  }
}

uint64_t __47__NSArray_BLTNSNullRemoval__objectWithNSNulls___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "integerValue");
  if (v6 <= objc_msgSend(v5, "integerValue"))
  {
    v8 = objc_msgSend(v4, "integerValue");
    if (v8 >= objc_msgSend(v5, "integerValue"))
      v7 = 0;
    else
      v7 = -1;
  }
  else
  {
    v7 = 1;
  }

  return v7;
}

uint64_t __32__NSArray_BLTSizeOf__blt_sizeof__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "blt_sizeof");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += result;
  return result;
}

@end
