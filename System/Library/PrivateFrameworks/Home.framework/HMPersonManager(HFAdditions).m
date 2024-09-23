@implementation HMPersonManager(HFAdditions)

- (id)hf_personWithIdentifier:()HFAdditions
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D519C0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __56__HMPersonManager_HFAdditions__hf_personWithIdentifier___block_invoke;
  v9[3] = &unk_1EA729F18;
  v9[4] = a1;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "futureWithBlock:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)hf_faceCropsForPersonWithIdentifier:()HFAdditions
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v12[5];
  id v13;
  _QWORD v14[5];
  id v15;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v6 = (void *)MEMORY[0x1E0D519C0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __68__HMPersonManager_HFAdditions__hf_faceCropsForPersonWithIdentifier___block_invoke;
  v14[3] = &unk_1EA72BB28;
  v14[4] = a1;
  v7 = v4;
  v15 = v7;
  objc_msgSend(v6, "futureWithCompletionHandlerAdapterBlock:", v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v5;
  v12[1] = 3221225472;
  v12[2] = __68__HMPersonManager_HFAdditions__hf_faceCropsForPersonWithIdentifier___block_invoke_2;
  v12[3] = &unk_1EA736118;
  v12[4] = a1;
  v13 = v7;
  v9 = v7;
  objc_msgSend(v8, "flatMap:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)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:()HFAdditions
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "hf_faceCropsForPersonWithIdentifier:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "flatMap:", &__block_literal_global_10_8);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)hf_namePerson:()HFAdditions name:
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, a1);
  v8 = (void *)MEMORY[0x1E0D519C0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __51__HMPersonManager_HFAdditions__hf_namePerson_name___block_invoke;
  v13[3] = &unk_1EA736AB0;
  objc_copyWeak(&v16, &location);
  v9 = v6;
  v14 = v9;
  v10 = v7;
  v15 = v10;
  objc_msgSend(v8, "futureWithBlock:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

  return v11;
}

- (id)hf_removePersonWithUUID:()HFAdditions
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[5];
  id v10;
  id v11;
  id location;

  v4 = a3;
  objc_initWeak(&location, a1);
  v5 = (void *)MEMORY[0x1E0D519C0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __56__HMPersonManager_HFAdditions__hf_removePersonWithUUID___block_invoke;
  v9[3] = &unk_1EA736EF0;
  v9[4] = a1;
  v6 = v4;
  v10 = v6;
  objc_copyWeak(&v11, &location);
  objc_msgSend(v5, "futureWithBlock:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v11);

  objc_destroyWeak(&location);
  return v7;
}

- (id)hf_removeFaceCropsWithUUIDs:()HFAdditions
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[5];
  id v10;
  id v11;
  id location;

  v4 = a3;
  objc_initWeak(&location, a1);
  v5 = (void *)MEMORY[0x1E0D519C0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __60__HMPersonManager_HFAdditions__hf_removeFaceCropsWithUUIDs___block_invoke;
  v9[3] = &unk_1EA736EF0;
  v9[4] = a1;
  v6 = v4;
  v10 = v6;
  objc_copyWeak(&v11, &location);
  objc_msgSend(v5, "futureWithBlock:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v11);

  objc_destroyWeak(&location);
  return v7;
}

- (id)hf_associateFaceCropsWithUUIDs:()HFAdditions toPersonWithUUID:
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, a1);
  v8 = (void *)MEMORY[0x1E0D519C0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __80__HMPersonManager_HFAdditions__hf_associateFaceCropsWithUUIDs_toPersonWithUUID___block_invoke;
  v13[3] = &unk_1EA736AB0;
  objc_copyWeak(&v16, &location);
  v9 = v6;
  v14 = v9;
  v10 = v7;
  v15 = v10;
  objc_msgSend(v8, "futureWithBlock:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

  return v11;
}

- (id)hf_reassociateFaceCropsFromPersonWithUUID:()HFAdditions toPersonWithUUID:removePerson:
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v13[5];
  id v14;
  id v15;
  char v16;

  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v8, "isEqual:", v9))
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = (void *)MEMORY[0x1E0D519C0];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __104__HMPersonManager_HFAdditions__hf_reassociateFaceCropsFromPersonWithUUID_toPersonWithUUID_removePerson___block_invoke;
    v13[3] = &unk_1EA736FD8;
    v13[4] = a1;
    v14 = v8;
    v15 = v9;
    v16 = a5;
    objc_msgSend(v11, "futureWithBlock:", v13);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

- (id)hf_linkFromPerson:()HFAdditions toPerson:toPersonManagerUUID:
{
  id v8;
  id v9;
  objc_class *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  _QWORD v24[5];
  id v25;
  id v26;
  id v27;

  v8 = a3;
  v9 = a4;
  v10 = (objc_class *)MEMORY[0x1E0CBA748];
  v11 = a5;
  v12 = [v10 alloc];
  objc_msgSend(v9, "UUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithPersonUUID:personManagerUUID:", v13, v11);

  v15 = (void *)objc_msgSend(v8, "mutableCopy");
  objc_msgSend(v15, "personLinks");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v16, "mutableCopy");

  objc_msgSend(v17, "addObject:", v14);
  objc_msgSend(v15, "setPersonLinks:", v17);
  v18 = (void *)MEMORY[0x1E0D519C0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __79__HMPersonManager_HFAdditions__hf_linkFromPerson_toPerson_toPersonManagerUUID___block_invoke;
  v24[3] = &unk_1EA737000;
  v24[4] = a1;
  v25 = v15;
  v26 = v8;
  v27 = v9;
  v19 = v9;
  v20 = v8;
  v21 = v15;
  objc_msgSend(v18, "futureWithBlock:", v24);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

@end
