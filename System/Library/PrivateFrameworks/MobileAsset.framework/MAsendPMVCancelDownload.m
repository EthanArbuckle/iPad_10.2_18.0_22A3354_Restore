@implementation MAsendPMVCancelDownload

void ___MAsendPMVCancelDownload_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  id v15;
  uint64_t v16;
  void *v17;
  __int128 v18;
  _QWORD block[4];
  __int128 v20;

  v3 = a2;
  v4 = MEMORY[0x1AF44F218]();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 4;
  if (v4 == MEMORY[0x1E0C81310])
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    _MobileAssetLog(0, 6, (uint64_t)"_MAsendPMVCancelDownload_block_invoke", CFSTR("Error on the cancel PMV download reply"), v5, v6, v7, v8, v16);
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = xpc_dictionary_get_int64(v3, "Result");
    v9 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    stringForMACancelDownloadResult(v9);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    _MobileAssetLog(0, 6, (uint64_t)"_MAsendPMVCancelDownload_block_invoke", CFSTR("Got the cancel PMV reply, response: %ld (%@)"), v10, v11, v12, v13, v9);

  }
  if (*(_QWORD *)(a1 + 32))
  {
    _getClientCallbackQueue();
    v14 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = ___MAsendPMVCancelDownload_block_invoke_2;
    block[3] = &unk_1E5D5CE20;
    v18 = *(_OWORD *)(a1 + 32);
    v15 = (id)v18;
    v20 = v18;
    dispatch_async(v14, block);

  }
}

void ___MAsendPMVCancelDownload_block_invoke_2(uint64_t a1)
{
  unint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  if (isCancelDownloadResultFailure(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24)))
  {
    v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    errorStringForMACancelDownloadResult(v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    MAErrorForCancelDownloadResultWithUnderlying(v2, 0, CFSTR("During software lookup: %@"), v4, v5, v6, v7, v8, (uint64_t)v3);
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void ___MAsendPMVCancelDownload_block_invoke_3(uint64_t a1)
{
  unint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  if (isCancelDownloadResultFailure(v2))
  {
    errorStringForMACancelDownloadResult(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    MAErrorForCancelDownloadResultWithUnderlying(v2, 0, CFSTR("Before software lookup: %@"), v4, v5, v6, v7, v8, (uint64_t)v3);
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

@end
