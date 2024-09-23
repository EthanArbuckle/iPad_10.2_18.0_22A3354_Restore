@implementation MAsendPMVDownload

void ___MAsendPMVDownload_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  int64_t int64;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  dispatch_time_t v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD block[4];
  id v28;
  id v29;

  v3 = a2;
  v4 = MEMORY[0x1AF44F218]();
  int64 = xpc_dictionary_get_int64(v3, "Result");
  if (v4 == MEMORY[0x1E0C81310])
  {
    _MobileAssetLog(0, 6, (uint64_t)"_MAsendPMVDownload_block_invoke", CFSTR("PMV download failed due to XPC"), v6, v7, v8, v9, v26);
    v10 = 1;
  }
  else
  {
    v10 = int64;
    if (int64 == 13)
    {
      if (*(_BYTE *)(a1 + 48))
      {
        _MobileAssetLog(0, 6, (uint64_t)"_MAsendPMVDownload_block_invoke", CFSTR("Will retry download PMV, after %ld seconds"), v6, v7, v8, v9, 2);
        v11 = dispatch_time(0, 2000000000);
        getRetryXpcDelayQueue();
        v12 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = ___MAsendPMVDownload_block_invoke_2;
        block[3] = &unk_1E5D5CC20;
        v28 = *(id *)(a1 + 32);
        v29 = *(id *)(a1 + 40);
        dispatch_after(v11, v12, block);

        v13 = 0;
LABEL_16:
        v22 = 0;
        goto LABEL_17;
      }
      v10 = 13;
    }
  }
  if (!MAIsDownloadResultFailure(v10))
  {
    getLoadDictionaryFromMessage(v3, CFSTR("productMarketingVersions"));
    v24 = objc_claimAutoreleasedReturnValue();
    if (v24)
      v13 = (void *)v24;
    else
      v13 = (void *)MEMORY[0x1E0C9AA70];
    v25 = *(_QWORD *)(a1 + 40);
    if (v25)
      (*(void (**)(uint64_t, unint64_t, void *, _QWORD))(v25 + 16))(v25, v10, v13, 0);
    goto LABEL_16;
  }
  v14 = objc_opt_class();
  getLoadClassFromMessage(v3, CFSTR("CFNetworkError"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  errorStringForMADownloadResult(v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  MAErrorForDownloadResultWithUnderlying(v10, v15, CFSTR("Failed downloading SoftwareLookup: %@"), v17, v18, v19, v20, v21, (uint64_t)v16);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = *(_QWORD *)(a1 + 40);
  if (v23)
    (*(void (**)(uint64_t, unint64_t, _QWORD, void *))(v23 + 16))(v23, v10, 0, v22);

  v13 = 0;
LABEL_17:

}

void ___MAsendPMVDownload_block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  _QWORD v2[4];
  id v3;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = ___MAsendPMVDownload_block_invoke_3;
  v2[3] = &unk_1E5D5CDD0;
  v1 = *(_QWORD *)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  _MAsendPMVDownload(v1, 0, v2);

}

uint64_t ___MAsendPMVDownload_block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

@end
