@implementation CNLoadMetadataTrackForVideoTrack

void ___CNLoadMetadataTrackForVideoTrack_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void (**v18)(id, uint64_t, _QWORD);
  id obj;
  id v20;
  _QWORD v21[4];
  id v22;
  void *v23;
  NSObject *v24;
  uint64_t *v25;
  uint64_t *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  char v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  v20 = *(id *)(a1 + 32);
  v8 = v5;
  v18 = v7;
  v35 = 0;
  v36 = &v35;
  v37 = 0x3032000000;
  v38 = __Block_byref_object_copy_;
  v39 = __Block_byref_object_dispose_;
  v40 = 0;
  v31 = 0;
  v32 = &v31;
  v33 = 0x2020000000;
  v34 = 0;
  v9 = dispatch_group_create();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = v8;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v41, 16);
  v17 = v6;
  if (v10)
  {
    v11 = *(_QWORD *)v28;
    v12 = (void *)*MEMORY[0x24BDB20E8];
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v28 != v11)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v13);
        dispatch_group_enter(v9);
        v21[0] = MEMORY[0x24BDAC760];
        v21[1] = 3221225472;
        v21[2] = ___CNFindMetadataTrackForVideoTrack_block_invoke;
        v21[3] = &unk_25044F710;
        v22 = v20;
        v23 = v14;
        v25 = &v35;
        v26 = &v31;
        v24 = v9;
        _CNLoadFirstAssociatedTrack(v14, v12, v21);

        ++v13;
      }
      while (v10 != v13);
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v41, 16);
    }
    while (v10);
  }

  dispatch_group_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  if (*((_BYTE *)v32 + 24))
  {
    v18[2](v18, v36[5], 0);
  }
  else
  {
    _CNLogSystem();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      ___CNLoadMetadataTrackForVideoTrack_block_invoke_cold_1((uint64_t)v20, v15);

    _CNCinematicError(3, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, uint64_t, void *))v18)[2](v18, 0, v16);

  }
  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v35, 8);

}

void ___CNLoadMetadataTrackForVideoTrack_block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_23307F000, a2, OS_LOG_TYPE_ERROR, "Error: Unable to find metadata track for video track %@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_2();
}

@end
