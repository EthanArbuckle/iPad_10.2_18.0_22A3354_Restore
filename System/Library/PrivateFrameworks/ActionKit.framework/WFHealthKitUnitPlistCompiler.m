@implementation WFHealthKitUnitPlistCompiler

+ (void)compileUnitDataIntoPlistAtPath:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _QWORD v23[4];
  id v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (void *)objc_msgSend(&unk_24F93C2E8, "mutableCopy");
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __63__WFHealthKitUnitPlistCompiler_compileUnitDataIntoPlistAtPath___block_invoke;
  v23[3] = &unk_24F8B6680;
  v24 = &unk_24F93C330;
  objc_msgSend(&unk_24F93C2E8, "if_map:", v23);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(v4, "addObjectsFromArray:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
    }
    while (v7);
  }
  __63__WFHealthKitUnitPlistCompiler_compileUnitDataIntoPlistAtPath___block_invoke_3(CFSTR("si"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v4, "if_map:", v10);

  __63__WFHealthKitUnitPlistCompiler_compileUnitDataIntoPlistAtPath___block_invoke_3(CFSTR("non_si"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(&unk_24F93C300, "if_map:", v12);

  __63__WFHealthKitUnitPlistCompiler_compileUnitDataIntoPlistAtPath___block_invoke_3(CFSTR("compound"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (id)objc_msgSend(&unk_24F93C318, "if_map:", v14);

  v16 = (void *)objc_opt_new();
  objc_msgSend(v16, "addObjectsFromArray:", v4);
  objc_msgSend(v16, "addObjectsFromArray:", &unk_24F93C300);
  objc_msgSend(v16, "addObjectsFromArray:", &unk_24F93C318);
  v18 = 0;
  objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", v16, 100, 0, &v18);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "writeToFile:atomically:", v3, 1);

}

id __63__WFHealthKitUnitPlistCompiler_compileUnitDataIntoPlistAtPath___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __63__WFHealthKitUnitPlistCompiler_compileUnitDataIntoPlistAtPath___block_invoke_2;
  v8[3] = &unk_24F8B2B88;
  v9 = v3;
  v5 = v3;
  objc_msgSend(v4, "if_map:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __63__WFHealthKitUnitPlistCompiler_compileUnitDataIntoPlistAtPath___block_invoke_3(void *a1)
{
  id v1;
  id v2;
  void *v3;
  _QWORD aBlock[4];
  id v6;

  v1 = a1;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __63__WFHealthKitUnitPlistCompiler_compileUnitDataIntoPlistAtPath___block_invoke_4;
  aBlock[3] = &unk_24F8B2BB0;
  v6 = v1;
  v2 = v1;
  v3 = _Block_copy(aBlock);

  return v3;
}

id __63__WFHealthKitUnitPlistCompiler_compileUnitDataIntoPlistAtPath___block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  _QWORD v6[3];
  _QWORD v7[4];

  v7[3] = *MEMORY[0x24BDAC8D0];
  v6[0] = CFSTR("unitString");
  v6[1] = CFSTR("important");
  v7[0] = a2;
  v7[1] = MEMORY[0x24BDBD1C0];
  v6[2] = CFSTR("group");
  v7[2] = *(_QWORD *)(a1 + 32);
  v2 = (void *)MEMORY[0x24BDBCE70];
  v3 = a2;
  objc_msgSend(v2, "dictionaryWithObjects:forKeys:count:", v7, v6, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __63__WFHealthKitUnitPlistCompiler_compileUnitDataIntoPlistAtPath___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "stringByAppendingString:", *(_QWORD *)(a1 + 32));
}

@end
