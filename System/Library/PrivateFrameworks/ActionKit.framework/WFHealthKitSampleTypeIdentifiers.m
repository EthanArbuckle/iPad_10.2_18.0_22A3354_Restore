@implementation WFHealthKitSampleTypeIdentifiers

void __WFHealthKitSampleTypeIdentifiers_block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  _QWORD v18[2];
  _QWORD v19[4];

  v19[3] = *MEMORY[0x24BDAC8D0];
  WFHealthKitQuantityTypeIdentifiers();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)WFHealthKitSampleTypeIdentifiers_identifiers;
  WFHealthKitSampleTypeIdentifiers_identifiers = v0;

  v2 = (void *)objc_msgSend((id)WFHealthKitSampleTypeIdentifiers_identifiers, "mutableCopy");
  v3 = *MEMORY[0x24BDD2A28];
  v4 = *MEMORY[0x24BDD3610];
  objc_msgSend(v2, "insertObject:atIndex:", *MEMORY[0x24BDD2A28], objc_msgSend(v2, "indexOfObject:", *MEMORY[0x24BDD3610]) + 1);
  v5 = *MEMORY[0x24BDD2A08];
  objc_msgSend(v2, "insertObject:atIndex:", *MEMORY[0x24BDD2A08], objc_msgSend(v2, "indexOfObject:", v3) + 1);
  v6 = *MEMORY[0x24BDD2890];
  objc_msgSend(v2, "insertObject:atIndex:", *MEMORY[0x24BDD2890], objc_msgSend(v2, "indexOfObject:", v5) + 1);
  v7 = *MEMORY[0x24BDD2998];
  objc_msgSend(v2, "insertObject:atIndex:", *MEMORY[0x24BDD2998], objc_msgSend(v2, "indexOfObject:", v6) + 1);
  v8 = *MEMORY[0x24BDD2948];
  objc_msgSend(v2, "insertObject:atIndex:", *MEMORY[0x24BDD2948], objc_msgSend(v2, "indexOfObject:", v7) + 1);
  objc_msgSend(v2, "insertObject:atIndex:", *MEMORY[0x24BDD29C0], objc_msgSend(v2, "indexOfObject:", v8) + 1);
  objc_msgSend(v2, "insertObject:atIndex:", *MEMORY[0x24BDD29A0], objc_msgSend(v2, "indexOfObject:", v3) + 1);
  v9 = *MEMORY[0x24BDD2980];
  v19[0] = *MEMORY[0x24BDD2930];
  v19[1] = v9;
  v19[2] = *MEMORY[0x24BDD2950];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndexesInRange:", objc_msgSend(v2, "indexOfObject:", *MEMORY[0x24BDD35C8]), objc_msgSend(v10, "count"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "insertObjects:atIndexes:", v10, v11);

  WFHealthKitSymptomsTypeIdentifiers();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndexesInRange:", objc_msgSend(v2, "indexOfObject:", v4), objc_msgSend(v12, "count"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "insertObjects:atIndexes:", v12, v13);

  v14 = *MEMORY[0x24BDD2908];
  v18[0] = *MEMORY[0x24BDD2A48];
  v18[1] = v14;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v15);

  v16 = objc_msgSend(v2, "copy");
  v17 = (void *)WFHealthKitSampleTypeIdentifiers_identifiers;
  WFHealthKitSampleTypeIdentifiers_identifiers = v16;

}

@end
