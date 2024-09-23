@implementation HUSoftwareLibraryLookupResult

- (HUSoftwareLibraryLookupResult)init
{
  HUSoftwareLibraryLookupResult *v2;
  uint64_t v3;
  NSSet *matchedLibraryItems;
  uint64_t v5;
  NSDictionary *accessoriesByBundleIDs;
  uint64_t v7;
  NSSet *matchedStoreItems;
  uint64_t v9;
  NSDictionary *accessoriesByStoreIDs;
  uint64_t v11;
  NSSet *unmatchedRequests;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)HUSoftwareLibraryLookupResult;
  v2 = -[HUSoftwareLibraryLookupResult init](&v14, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v3 = objc_claimAutoreleasedReturnValue();
    matchedLibraryItems = v2->_matchedLibraryItems;
    v2->_matchedLibraryItems = (NSSet *)v3;

    objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    accessoriesByBundleIDs = v2->_accessoriesByBundleIDs;
    v2->_accessoriesByBundleIDs = (NSDictionary *)v5;

    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v7 = objc_claimAutoreleasedReturnValue();
    matchedStoreItems = v2->_matchedStoreItems;
    v2->_matchedStoreItems = (NSSet *)v7;

    objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
    v9 = objc_claimAutoreleasedReturnValue();
    accessoriesByStoreIDs = v2->_accessoriesByStoreIDs;
    v2->_accessoriesByStoreIDs = (NSDictionary *)v9;

    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v11 = objc_claimAutoreleasedReturnValue();
    unmatchedRequests = v2->_unmatchedRequests;
    v2->_unmatchedRequests = (NSSet *)v11;

  }
  return v2;
}

+ (id)resultForAccessories:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "na_map:", &__block_literal_global_279);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "resultForRequests:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

HUSoftwareLibraryLookupRequest *__54__HUSoftwareLibraryLookupResult_resultForAccessories___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  HUSoftwareLibraryLookupRequest *v3;

  v2 = a2;
  v3 = -[HUSoftwareLibraryLookupRequest initWithAccessory:]([HUSoftwareLibraryLookupRequest alloc], "initWithAccessory:", v2);

  return v3;
}

+ (id)resultForRequests:(id)a3
{
  void *v4;
  void *v5;
  _QWORD v7[5];

  objc_msgSend(a1, "_libraryResultForRequests:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51__HUSoftwareLibraryLookupResult_resultForRequests___block_invoke;
  v7[3] = &__block_descriptor_40_e49___NAFuture_16__0__HUSoftwareLibraryLookupResult_8l;
  v7[4] = a1;
  objc_msgSend(v4, "flatMap:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __51__HUSoftwareLibraryLookupResult_resultForRequests___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "unmatchedRequests");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_storeResultForRequests:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __51__HUSoftwareLibraryLookupResult_resultForRequests___block_invoke_2;
  v10[3] = &unk_1E6F5F440;
  v11 = v3;
  v7 = v3;
  objc_msgSend(v6, "flatMap:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __51__HUSoftwareLibraryLookupResult_resultForRequests___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  HUSoftwareLibraryLookupResult *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a2;
  v4 = objc_alloc_init(HUSoftwareLibraryLookupResult);
  objc_msgSend(*(id *)(a1 + 32), "matchedLibraryItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUSoftwareLibraryLookupResult setMatchedLibraryItems:](v4, "setMatchedLibraryItems:", v5);

  objc_msgSend(*(id *)(a1 + 32), "accessoriesByBundleIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUSoftwareLibraryLookupResult setAccessoriesByBundleIDs:](v4, "setAccessoriesByBundleIDs:", v6);

  objc_msgSend(v3, "matchedStoreItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUSoftwareLibraryLookupResult setMatchedStoreItems:](v4, "setMatchedStoreItems:", v7);

  objc_msgSend(v3, "accessoriesByStoreIDs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUSoftwareLibraryLookupResult setAccessoriesByStoreIDs:](v4, "setAccessoriesByStoreIDs:", v8);

  objc_msgSend(v3, "unmatchedRequests");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUSoftwareLibraryLookupResult setUnmatchedRequests:](v4, "setUnmatchedRequests:", v9);
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)_libraryResultForRequests:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v3 = a3;
  v4 = (void *)MEMORY[0x1E0D519C0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __59__HUSoftwareLibraryLookupResult__libraryResultForRequests___block_invoke;
  v8[3] = &unk_1E6F4C660;
  v9 = v3;
  v5 = v3;
  objc_msgSend(v4, "futureWithBlock:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __59__HUSoftwareLibraryLookupResult__libraryResultForRequests___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  HUSoftwareLibraryLookupResult *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v3 = (void *)MEMORY[0x1E0C99E20];
  v4 = a2;
  objc_msgSend(v3, "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(void **)(a1 + 32);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __59__HUSoftwareLibraryLookupResult__libraryResultForRequests___block_invoke_2;
  v12[3] = &unk_1E6F5F4A8;
  v13 = v6;
  v14 = v5;
  v8 = v5;
  v11 = v6;
  objc_msgSend(v7, "na_map:", v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc_init(HUSoftwareLibraryLookupResult);
  -[HUSoftwareLibraryLookupResult setMatchedLibraryItems:](v10, "setMatchedLibraryItems:", v9);
  -[HUSoftwareLibraryLookupResult setAccessoriesByBundleIDs:](v10, "setAccessoriesByBundleIDs:", v11);
  -[HUSoftwareLibraryLookupResult setUnmatchedRequests:](v10, "setUnmatchedRequests:", v8);
  objc_msgSend(v4, "finishWithResult:", v10);

}

id __59__HUSoftwareLibraryLookupResult__libraryResultForRequests___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v3 = a2;
  v4 = (void *)MEMORY[0x1E0CA5860];
  objc_msgSend(v3, "bundleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "applicationProxyForIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "hf_isInstalledForLaunching")
    && (objc_msgSend(v3, "bundleID"), v7 = (void *)objc_claimAutoreleasedReturnValue(), v7, v7))
  {
    objc_msgSend(v3, "accessory");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = *(void **)(a1 + 32);
      objc_msgSend(v3, "bundleID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "na_objectForKey:withDefaultValue:", v10, &__block_literal_global_35_1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "accessory");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObject:", v12);

    }
    v13 = v6;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);
    v13 = 0;
  }

  return v13;
}

uint64_t __59__HUSoftwareLibraryLookupResult__libraryResultForRequests___block_invoke_3()
{
  return objc_msgSend(MEMORY[0x1E0C99E20], "set");
}

+ (id)_storeResultForRequests:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  HUSoftwareLibraryLookupResult *v19;
  uint64_t v21;
  id v22;
  id v23;

  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "na_map:", &__block_literal_global_38_2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)MEMORY[0x1E0CFD9E8];
    objc_msgSend(MEMORY[0x1E0CFDAF8], "bagSubProfile");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CFDAF8], "bagSubProfileVersion");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bagForProfile:profileVersion:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_alloc(MEMORY[0x1E0CFDAF8]);
    v10 = (void *)objc_msgSend(v9, "initWithBag:caller:keyProfile:", v8, *MEMORY[0x1E0D306E8], *MEMORY[0x1E0CFD888]);
    objc_msgSend(v4, "allObjects");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "performLookupWithBundleIdentifiers:itemIdentifiers:", 0, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = (void *)MEMORY[0x1E0D519C0];
    v21 = MEMORY[0x1E0C809B0];
    v22 = v12;
    v23 = v3;
    v14 = (void *)MEMORY[0x1E0D519E8];
    v15 = v12;
    objc_msgSend(v14, "mainThreadScheduler", v21, 3221225472, __57__HUSoftwareLibraryLookupResult__storeResultForRequests___block_invoke_2, &unk_1E6F4D600);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "futureWithBlock:scheduler:", &v21, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v18 = (void *)MEMORY[0x1E0D519C0];
    v19 = objc_alloc_init(HUSoftwareLibraryLookupResult);
    objc_msgSend(v18, "futureWithResult:", v19);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v17;
}

uint64_t __57__HUSoftwareLibraryLookupResult__storeResultForRequests___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "storeID");
}

void __57__HUSoftwareLibraryLookupResult__storeResultForRequests___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __57__HUSoftwareLibraryLookupResult__storeResultForRequests___block_invoke_3;
  v6[3] = &unk_1E6F5F580;
  v4 = *(void **)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  v8 = v3;
  v5 = v3;
  objc_msgSend(v4, "addFinishBlock:", v6);

}

void __57__HUSoftwareLibraryLookupResult__storeResultForRequests___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  HUSoftwareLibraryLookupResult *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 32);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __57__HUSoftwareLibraryLookupResult__storeResultForRequests___block_invoke_4;
  v13[3] = &unk_1E6F5F558;
  v14 = v3;
  v15 = v4;
  v6 = v4;
  v12 = v3;
  objc_msgSend(v5, "na_filter:", v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc_init(HUSoftwareLibraryLookupResult);
  v9 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v12, "allItems");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setWithArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUSoftwareLibraryLookupResult setMatchedStoreItems:](v8, "setMatchedStoreItems:", v11);

  -[HUSoftwareLibraryLookupResult setAccessoriesByStoreIDs:](v8, "setAccessoriesByStoreIDs:", v6);
  -[HUSoftwareLibraryLookupResult setUnmatchedRequests:](v8, "setUnmatchedRequests:", v7);
  objc_msgSend(*(id *)(a1 + 40), "finishWithResult:", v8);

}

BOOL __57__HUSoftwareLibraryLookupResult__storeResultForRequests___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  id v14;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "allItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __57__HUSoftwareLibraryLookupResult__storeResultForRequests___block_invoke_5;
  v13[3] = &unk_1E6F5F510;
  v5 = v3;
  v14 = v5;
  objc_msgSend(v4, "na_firstObjectPassingTest:", v13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "accessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 && v6)
  {
    v8 = *(void **)(a1 + 40);
    objc_msgSend(v5, "storeID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "na_objectForKey:withDefaultValue:", v9, &__block_literal_global_42_2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "accessory");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v11);

  }
  return v6 == 0;
}

uint64_t __57__HUSoftwareLibraryLookupResult__storeResultForRequests___block_invoke_5(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "iTunesStoreIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "storeID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  return v6;
}

uint64_t __57__HUSoftwareLibraryLookupResult__storeResultForRequests___block_invoke_6()
{
  return objc_msgSend(MEMORY[0x1E0C99E20], "set");
}

- (NSSet)matchedLibraryItems
{
  return self->_matchedLibraryItems;
}

- (void)setMatchedLibraryItems:(id)a3
{
  objc_storeStrong((id *)&self->_matchedLibraryItems, a3);
}

- (NSDictionary)accessoriesByBundleIDs
{
  return self->_accessoriesByBundleIDs;
}

- (void)setAccessoriesByBundleIDs:(id)a3
{
  objc_storeStrong((id *)&self->_accessoriesByBundleIDs, a3);
}

- (NSSet)matchedStoreItems
{
  return self->_matchedStoreItems;
}

- (void)setMatchedStoreItems:(id)a3
{
  objc_storeStrong((id *)&self->_matchedStoreItems, a3);
}

- (NSDictionary)accessoriesByStoreIDs
{
  return self->_accessoriesByStoreIDs;
}

- (void)setAccessoriesByStoreIDs:(id)a3
{
  objc_storeStrong((id *)&self->_accessoriesByStoreIDs, a3);
}

- (NSSet)unmatchedRequests
{
  return self->_unmatchedRequests;
}

- (void)setUnmatchedRequests:(id)a3
{
  objc_storeStrong((id *)&self->_unmatchedRequests, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unmatchedRequests, 0);
  objc_storeStrong((id *)&self->_accessoriesByStoreIDs, 0);
  objc_storeStrong((id *)&self->_matchedStoreItems, 0);
  objc_storeStrong((id *)&self->_accessoriesByBundleIDs, 0);
  objc_storeStrong((id *)&self->_matchedLibraryItems, 0);
}

@end
