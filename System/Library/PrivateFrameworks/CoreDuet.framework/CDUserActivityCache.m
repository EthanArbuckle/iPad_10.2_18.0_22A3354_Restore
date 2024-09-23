@implementation CDUserActivityCache

uint64_t __29___CDUserActivityCache_count__block_invoke(uint64_t result)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_DWORD *)(*(_QWORD *)(result + 32) + 24);
  return result;
}

void __61___CDUserActivityCache_hashArrayForSourceID_bundleID_itemID___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  _QWORD v20[3];
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "computeHashesForString:reuse:", a1[4], *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1[7] + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  v7 = a1[5];
  v21[0] = a1[4];
  v21[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "componentsJoinedByString:", CFSTR(":"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "computeHashesForString:reuse:", v9, *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40));
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = *(_QWORD *)(a1[7] + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v10;

  v13 = a1[6];
  if (v13)
  {
    v14 = a1[5];
    v20[0] = a1[4];
    v20[1] = v14;
    v20[2] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "componentsJoinedByString:", CFSTR(":"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "computeHashesForString:reuse:", v16, *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40));
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = *(_QWORD *)(a1[7] + 8);
    v19 = *(void **)(v18 + 40);
    *(_QWORD *)(v18 + 40) = v17;

  }
}

uint64_t __52___CDUserActivityCache_addSourceID_bundleID_itemID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "setWithHashes:", *(_QWORD *)(a1 + 32));
  ++*(_DWORD *)(*(_QWORD *)(a1 + 40) + 24);
  return result;
}

uint64_t __66___CDUserActivityCache_containsObjectForSourceID_bundleID_itemID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "getWithHashes:", *(_QWORD *)(a1 + 32));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void __58___CDUserActivityCache__populateAppLocationActivityStream__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "source");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sourceID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "source");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "source");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "itemID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addSourceID:bundleID:itemID:", v4, v6, v8);

}

@end
