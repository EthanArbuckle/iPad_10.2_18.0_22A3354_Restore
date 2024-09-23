@implementation MRAVRoutingDiscoverySession(MPAVOutputDeviceRoutingDataSource)

- (id)availableOutputDevicesForEndpoint:()MPAVOutputDeviceRoutingDataSource
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(a1, "availableOutputDevices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resolvedOutputDevices");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_replaceOutputDevices:withOutputDevices:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_replaceOutputDevices:()MPAVOutputDeviceRoutingDataSource withOutputDevices:
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, void *);
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t (*v20)(uint64_t, void *);
  uint64_t v21;
  id v22;
  uint64_t v23;
  void *v24;
  uint64_t v26;
  _QWORD v27[5];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v5, "count"));
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v29;
    v12 = MEMORY[0x1E0C809B0];
    v13 = __106__MRAVRoutingDiscoverySession_MPAVOutputDeviceRoutingDataSource___replaceOutputDevices_withOutputDevices___block_invoke;
    do
    {
      v14 = 0;
      v26 = v10;
      do
      {
        if (*(_QWORD *)v29 != v11)
          objc_enumerationMutation(v8);
        v15 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v14);
        v27[0] = v12;
        v27[1] = 3221225472;
        v27[2] = v13;
        v27[3] = &unk_1E3161950;
        v27[4] = v15;
        objc_msgSend(v6, "msv_firstWhere:", v27);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v15, "isGroupable")
          && (objc_msgSend(v16, "isGroupable") & 1) == 0
          && (objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v16, "groupableOutputDevice");
          v17 = v11;
          v18 = v7;
          v19 = v6;
          v20 = v13;
          v21 = v12;
          v22 = v8;
          v23 = objc_claimAutoreleasedReturnValue();

          v16 = (void *)v23;
          v8 = v22;
          v12 = v21;
          v13 = v20;
          v6 = v19;
          v7 = v18;
          v11 = v17;
          v10 = v26;
        }
        if (v16)
          v24 = v16;
        else
          v24 = v15;
        objc_msgSend(v7, "addObject:", v24);

        ++v14;
      }
      while (v10 != v14);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v10);
  }

  return v7;
}

@end
