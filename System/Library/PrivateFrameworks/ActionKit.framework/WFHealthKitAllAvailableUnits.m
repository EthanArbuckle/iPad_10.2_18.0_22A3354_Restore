@implementation WFHealthKitAllAvailableUnits

void __WFHealthKitAllAvailableUnits_block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "pathForResource:ofType:", CFSTR("WFHealthKitConstants"), CFSTR("plist"));
  v20 = (id)objc_claimAutoreleasedReturnValue();

  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithContentsOfFile:", v20);
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("Units"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("group == 'si'"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "filteredArrayUsingPredicate:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("group == 'non_si'"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "filteredArrayUsingPredicate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("group == 'compound'"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "filteredArrayUsingPredicate:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localeIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("en_US"));

  if (v12)
    v13 = v6;
  else
    v13 = v4;
  if (v12)
    v14 = v4;
  else
    v14 = v6;
  objc_msgSend(v13, "sortedArrayUsingComparator:", &__block_literal_global_314);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObjectsFromArray:", v15);

  objc_msgSend(v14, "sortedArrayUsingComparator:", &__block_literal_global_314);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObjectsFromArray:", v16);

  objc_msgSend(v8, "sortedArrayUsingComparator:", &__block_literal_global_314);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObjectsFromArray:", v17);

  objc_msgSend(v9, "if_map:", &__block_literal_global_322);
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)WFHealthKitAllAvailableUnits_units;
  WFHealthKitAllAvailableUnits_units = v18;

}

id __WFHealthKitAllAvailableUnits_block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("unitString"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD4048], "unitFromString:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __WFHealthKitAllAvailableUnits_block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  uint64_t v9;

  v4 = a3;
  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("important"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("important"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "BOOLValue");
  v9 = 1;
  if (!(v6 ^ 1 | v8))
    v9 = -1;
  if (v6 != v8)
    return v9;
  else
    return 0;
}

@end
