@implementation ML3MigrationFunction2200020to2200030

void __ML3MigrationFunction2200020to2200030_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_msgSend(v3, "int64ForColumnIndex:", 0);
  v18 = objc_msgSend(v3, "int64ForColumnIndex:", 1);
  v5 = objc_msgSend(v3, "int64ForColumnIndex:", 2);
  v6 = objc_msgSend(v3, "int64ForColumnIndex:", 3);
  objc_msgSend(v3, "stringForColumnIndex:", 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v3, "int64ForColumnIndex:", 5);
  v9 = objc_msgSend(v3, "int64ForColumnIndex:", 6);
  v10 = objc_msgSend(v3, "int64ForColumnIndex:", 7);
  v11 = objc_msgSend(v3, "int64ForColumnIndex:", 8);

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) != v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "removeAllObjects");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v4;
  }
  ML3ContainerItemOccurrencePrefix(v6, v7, v8, v5, v9, v10 != 0, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(*(id *)(a1 + 32), "countForObject:", v12);
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v12);
  objc_msgSend(v12, "stringByAppendingFormat:", CFSTR("_%lld"), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v18);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v16;
  v19[1] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addObject:", v17);

}

id __ML3MigrationFunction2200020to2200030_block_invoke_2(int a1, id a2)
{
  return a2;
}

@end
