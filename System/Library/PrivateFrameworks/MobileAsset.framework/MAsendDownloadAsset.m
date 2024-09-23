@implementation MAsendDownloadAsset

void ___MAsendDownloadAsset_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  dispatch_time_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  dispatch_time_t v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  _QWORD block[4];
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;

  v3 = a2;
  v4 = v3;
  if (v3
    && MEMORY[0x1AF44F218](v3) == MEMORY[0x1E0C812F8]
    && xpc_dictionary_get_int64(v4, "Result") == 13
    && *(_BYTE *)(a1 + 112)
    && (v5 = dispatch_time(*(_QWORD *)(a1 + 96), 180000000000), v5 > dispatch_time(0, 0)))
  {
    _MobileAssetLog(0, 6, (uint64_t)"_MAsendDownloadAsset_block_invoke", CFSTR("Daemon not ready - retrying download in %d seconds [%@, %@]"), v6, v7, v8, v9, 5);
    v10 = dispatch_time(0, 5000000000);
    getRetryXpcDelayQueue();
    v11 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = ___MAsendDownloadAsset_block_invoke_2;
    block[3] = &unk_1E5D5CD60;
    v19 = *(id *)(a1 + 48);
    v20 = *(id *)(a1 + 32);
    v21 = *(id *)(a1 + 40);
    v12 = *(id *)(a1 + 56);
    v13 = *(_QWORD *)(a1 + 104);
    v22 = v12;
    v26 = v13;
    v23 = *(id *)(a1 + 64);
    v14 = *(id *)(a1 + 72);
    v15 = *(_QWORD *)(a1 + 88);
    v24 = v14;
    v25 = v15;
    dispatch_after(v10, v11, block);

  }
  else
  {
    v16 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
    v17 = *(void **)(v16 + 40);
    *(_QWORD *)(v16 + 40) = 0;

    (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
  }

}

void ___MAsendDownloadAsset_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;

  v9 = *(void **)(a1 + 32);
  if (v9 && objc_msgSend(v9, "count"))
  {
    v10 = objc_msgSend(*(id *)(a1 + 32), "count");
    _MobileAssetLog(0, 6, (uint64_t)"_MAsendDownloadAsset_block_invoke_2", CFSTR("Re-registering %lu progress callbacks"), v11, v12, v13, v14, v10);
    _getCommsManager(v15, v16, v17, v18, v19, v20, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "restoreProgressCallbacks:assetType:assetId:withPurpose:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

  }
  _MobileAssetLog(0, 6, (uint64_t)"_MAsendDownloadAsset_block_invoke_2", CFSTR("Retrying download [%@, %@]"), a5, a6, a7, a8, *(_QWORD *)(a1 + 40));
  sendIfNecessary(*(_QWORD *)(a1 + 88), *(void **)(a1 + 64), *(void **)(a1 + 72), *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40));
}

@end
