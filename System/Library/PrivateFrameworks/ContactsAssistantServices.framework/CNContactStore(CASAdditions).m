@implementation CNContactStore(CASAdditions)

- (id)contactWithIdentifier:()CASAdditions keysToFetch:error:
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy_;
  v21 = __Block_byref_object_dispose_;
  v22 = 0;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBACB8]), "initWithKeysToFetch:", v9);
  objc_msgSend(v10, "setUnifyResults:", 0);
  v11 = (void *)MEMORY[0x24BDBACA0];
  v23[0] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "predicateForContactsWithIdentifiers:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPredicate:", v13);

  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __72__CNContactStore_CASAdditions__contactWithIdentifier_keysToFetch_error___block_invoke;
  v16[3] = &unk_24CE7BF80;
  v16[4] = &v17;
  objc_msgSend(a1, "enumerateContactsWithFetchRequest:error:usingBlock:", v10, a5, v16);
  v14 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v14;
}

@end
