@implementation HKMobileAssetDownloadOperation

uint64_t __38___HKMobileAssetDownloadOperation_run__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_run");
}

void __55___HKMobileAssetDownloadOperation__queue_downloadAsset__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  _QWORD v8[6];
  _QWORD block[5];

  dispatch_assert_queue_not_V2(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 56));
  if (a2 != 10 && a2)
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(NSObject **)(v6 + 56);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __55___HKMobileAssetDownloadOperation__queue_downloadAsset__block_invoke_3;
    v8[3] = &unk_1E37E8940;
    v8[4] = v6;
    v8[5] = a2;
    dispatch_sync(v7, v8);
  }
  else
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(NSObject **)(v4 + 56);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __55___HKMobileAssetDownloadOperation__queue_downloadAsset__block_invoke_2;
    block[3] = &unk_1E37E6770;
    block[4] = v4;
    dispatch_async(v5, block);
  }
}

uint64_t __55___HKMobileAssetDownloadOperation__queue_downloadAsset__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_transitionToCompleted");
}

uint64_t __55___HKMobileAssetDownloadOperation__queue_downloadAsset__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_transitionToFailureWithDownloadResult:", *(_QWORD *)(a1 + 40));
}

@end
