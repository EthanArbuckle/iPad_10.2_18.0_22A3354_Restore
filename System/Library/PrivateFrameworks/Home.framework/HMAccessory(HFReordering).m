@implementation HMAccessory(HFReordering)

- (HFServiceNameComponents)hf_serviceNameComponents
{
  void *v2;
  HFServiceNameComponents *v3;
  void *v4;
  void *v5;
  void *v6;
  HFServiceNameComponents *v7;

  +[HFNamingComponents namingComponentFromAccessory:](HFNamingComponents, "namingComponentFromAccessory:", a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = [HFServiceNameComponents alloc];
  objc_msgSend(v2, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "room");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HFServiceNameComponents initWithRawServiceName:rawRoomName:](v3, "initWithRawServiceName:rawRoomName:", v4, v6);

  return v7;
}

- (id)hf_displayName
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "hf_serviceNameComponents");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "composedString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)hf_updateDateAdded:()HFReordering
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  id (*v17)(uint64_t, void *);
  void *v18;
  id v19;
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  HFUpdateDateAddedForApplicationDataContainer(a1, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "services");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __48__HMAccessory_HFReordering__hf_updateDateAdded___block_invoke;
  v18 = &unk_1EA72DFA0;
  v19 = v4;
  v7 = v4;
  objc_msgSend(v6, "na_map:", &v15);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0D519C0];
  v20[0] = v5;
  v20[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2, v15, v16, v17, v18);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "na_arrayByFlattening");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "combineAllFutures:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "flatMap:", &__block_literal_global_236);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

@end
