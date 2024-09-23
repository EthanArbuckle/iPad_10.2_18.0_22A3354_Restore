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
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  int v15;
  void *v16;
  int v17;
  uint64_t v18;
  void *v19;
  char *v21;
  id obj;
  id v23;
  _QWORD v24[5];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v23 = a4;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v5, "count"));
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = v5;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v26;
    do
    {
      v10 = 0;
      v21 = sel_groupableOutputDevice;
      do
      {
        if (*(_QWORD *)v26 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v10);
        v24[0] = MEMORY[0x1E0C809B0];
        v24[1] = 3221225472;
        v24[2] = __106__MRAVRoutingDiscoverySession_MPAVOutputDeviceRoutingDataSource___replaceOutputDevices_withOutputDevices___block_invoke;
        v24[3] = &unk_1E581BF68;
        v24[4] = v11;
        objc_msgSend(v23, "msv_firstWhere:", v24, v21);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "isGroupable")
          && (objc_msgSend(v12, "isGroupable") & 1) == 0
          && (objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v12, "groupableOutputDevice");
          v13 = objc_claimAutoreleasedReturnValue();

          v12 = (void *)v13;
        }
        objc_msgSend(v11, "sourceInfo");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "multipleBuiltInDevices");
        objc_msgSend(v12, "sourceInfo");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "multipleBuiltInDevices");

        if (v15 != v17)
        {
          objc_msgSend(v12, "outputDeviceWithSourceInfoFrom:", v11);
          v18 = objc_claimAutoreleasedReturnValue();

          v12 = (void *)v18;
        }
        if (v12)
          v19 = v12;
        else
          v19 = v11;
        objc_msgSend(v6, "addObject:", v19);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v8);
  }

  return v6;
}

@end
