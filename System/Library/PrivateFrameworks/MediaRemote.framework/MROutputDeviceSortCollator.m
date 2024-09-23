@implementation MROutputDeviceSortCollator

- (id)collateOutputDevices:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD v14[5];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    v9 = MEMORY[0x1E0C809B0];
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v10);
        v14[0] = v9;
        v14[1] = 3221225472;
        v14[2] = __51__MROutputDeviceSortCollator_collateOutputDevices___block_invoke;
        v14[3] = &__block_descriptor_40_e43_q24__0__MROutputDevice_8__MROutputDevice_16l;
        v14[4] = 577;
        objc_msgSend(v11, "sortedArrayUsingComparator:", v14);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v12);

        ++v10;
      }
      while (v7 != v10);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  return v4;
}

uint64_t __51__MROutputDeviceSortCollator_collateOutputDevices___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v5 = a2;
  v6 = a3;
  v7 = objc_msgSend(v5, "priority");
  v8 = objc_msgSend(v6, "priority");
  if (v7 > v8)
    goto LABEL_2;
  if (v7 < v8)
    goto LABEL_4;
  if (objc_msgSend(v5, "isGroupable") && !objc_msgSend(v6, "isGroupable"))
  {
LABEL_2:
    v9 = -1;
    goto LABEL_11;
  }
  if (objc_msgSend(v6, "isGroupable") && !objc_msgSend(v5, "isGroupable"))
  {
LABEL_4:
    v9 = 1;
    goto LABEL_11;
  }
  objc_msgSend(v5, "title");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "title");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v10, "compare:options:", v11, *(_QWORD *)(a1 + 32));

  if (!v9)
  {
    objc_msgSend(v5, "deviceID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "deviceID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v12, "compare:options:", v13, *(_QWORD *)(a1 + 32));

  }
LABEL_11:

  return v9;
}

@end
