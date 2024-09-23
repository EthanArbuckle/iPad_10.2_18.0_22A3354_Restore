@implementation MPSectionedCollection

void __65__MPSectionedCollection_MQFDebugging__mpc_identifiersAsJsonValue__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t, void *);
  void *v14;
  id v15;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "mpc_jsonValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "numberOfItemsInSection:", a2));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(void **)(a1 + 32);
  v11 = MEMORY[0x24BDAC760];
  v12 = 3221225472;
  v13 = __65__MPSectionedCollection_MQFDebugging__mpc_identifiersAsJsonValue__block_invoke_2;
  v14 = &unk_24CAB5078;
  v15 = v6;
  v8 = v6;
  objc_msgSend(v7, "enumerateItemIdentifiersInSectionAtIndex:usingBlock:", a2, &v11);
  v9 = *(void **)(a1 + 40);
  v16[0] = CFSTR("section");
  v16[1] = CFSTR("items");
  v17[0] = v5;
  v17[1] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, v16, 2, v11, v12, v13, v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v10);

}

void __65__MPSectionedCollection_MQFDebugging__mpc_identifiersAsJsonValue__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  objc_msgSend(a3, "mpc_jsonValue");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);

}

@end
