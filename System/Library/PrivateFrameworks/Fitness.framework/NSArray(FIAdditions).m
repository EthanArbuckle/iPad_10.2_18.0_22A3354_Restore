@implementation NSArray(FIAdditions)

- (id)fi_mapUsingBlock:()FIAdditions
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__3;
  v15 = __Block_byref_object_dispose__3;
  v16 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(a1, "count"));
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __41__NSArray_FIAdditions__fi_mapUsingBlock___block_invoke;
  v8[3] = &unk_24CC4EA58;
  v10 = &v11;
  v5 = v4;
  v9 = v5;
  objc_msgSend(a1, "enumerateObjectsUsingBlock:", v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (id)fi_flatMapUsingBlock:()FIAdditions
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__3;
  v15 = __Block_byref_object_dispose__3;
  v16 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(a1, "count"));
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __45__NSArray_FIAdditions__fi_flatMapUsingBlock___block_invoke;
  v8[3] = &unk_24CC4EA80;
  v5 = v4;
  v9 = v5;
  v10 = &v11;
  objc_msgSend(a1, "enumerateObjectsUsingBlock:", v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (id)fi_filteredArrayUsingBlock:()FIAdditions
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__3;
  v15 = __Block_byref_object_dispose__3;
  v16 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(a1, "count"));
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __51__NSArray_FIAdditions__fi_filteredArrayUsingBlock___block_invoke;
  v8[3] = &unk_24CC4EA80;
  v5 = v4;
  v9 = v5;
  v10 = &v11;
  objc_msgSend(a1, "enumerateObjectsUsingBlock:", v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (id)fi_reduceWithReduction:()FIAdditions block:
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v6 = a3;
  v7 = a4;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__3;
  v19 = __Block_byref_object_dispose__3;
  v8 = v6;
  v20 = v8;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __53__NSArray_FIAdditions__fi_reduceWithReduction_block___block_invoke;
  v12[3] = &unk_24CC4EA58;
  v14 = &v15;
  v9 = v7;
  v13 = v9;
  objc_msgSend(a1, "enumerateObjectsUsingBlock:", v12);
  v10 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v10;
}

+ (id)fi_arrayByEnumeratingRange:()FIAdditions usingBlock:
{
  void (**v7)(id, _QWORD);
  void *v8;
  void *v9;

  v7 = a5;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", a4);
  if (a3 < a3 + a4)
  {
    do
    {
      v7[2](v7, a3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v9);

      ++a3;
      --a4;
    }
    while (a4);
  }

  return v8;
}

@end
