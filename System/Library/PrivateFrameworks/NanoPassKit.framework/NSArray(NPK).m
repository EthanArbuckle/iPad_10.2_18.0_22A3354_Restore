@implementation NSArray(NPK)

- (id)npkFindFirstObjectMatchingCondition:()NPK
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
  v14 = __Block_byref_object_copy__27;
  v15 = __Block_byref_object_dispose__27;
  v16 = 0;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __52__NSArray_NPK__npkFindFirstObjectMatchingCondition___block_invoke;
  v8[3] = &unk_24CFEEB88;
  v5 = v4;
  v9 = v5;
  v10 = &v11;
  objc_msgSend(a1, "enumerateObjectsUsingBlock:", v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (id)npkSafeObjectAtIndex:()NPK
{
  void *v5;
  NSObject *v6;
  _BOOL4 v7;
  NSObject *v8;
  int v10;
  unint64_t v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(a1, "count") <= a3)
  {
    pk_General_log();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);

    if (v7)
    {
      pk_General_log();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v10 = 134218498;
        v11 = a3;
        v12 = 2112;
        v13 = a1;
        v14 = 2048;
        v15 = objc_msgSend(a1, "count");
        _os_log_impl(&dword_213518000, v8, OS_LOG_TYPE_ERROR, "Error: Tried to access invalid object at index %lu in array %@ with %lu elements", (uint8_t *)&v10, 0x20u);
      }

    }
    v5 = 0;
  }
  else
  {
    objc_msgSend(a1, "objectAtIndex:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)npkComprehension:()NPK
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14;
  id v15;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x24BDAC760];
  v11 = 3221225472;
  v12 = __33__NSArray_NPK__npkComprehension___block_invoke;
  v13 = &unk_24CFEEBB0;
  v14 = v5;
  v15 = v4;
  v6 = v5;
  v7 = v4;
  objc_msgSend(a1, "enumerateObjectsUsingBlock:", &v10);
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v6, v10, v11, v12, v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
