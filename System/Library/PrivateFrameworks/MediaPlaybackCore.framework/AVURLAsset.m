@implementation AVURLAsset

void __101__AVURLAsset_MPCModelPlaybackAssetCacheProvidingInternalAdditions__mpc_addDownloadCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id WeakRetained;
  void *v5;
  id v6;

  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
    objc_setAssociatedObject(WeakRetained, (const void *)_MPCAVURLAssetAssociatedKeyModelPlaybackDownloadCompletionObserver, 0, (void *)1);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __101__AVURLAsset_MPCModelPlaybackAssetCacheProvidingInternalAdditions__mpc_addDownloadCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t, id);
  id v7;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void (**)(uint64_t, uint64_t, id))(v5 + 16);
  v7 = a3;
  v6(v5, a2, v7);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

intptr_t __80__AVURLAsset_MPCHLSSessionData__mpc_synchronousHLSSessionDataWithTimeout_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id obj;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  obj = *(id *)(v3 + 40);
  v4 = objc_msgSend(v2, "statusOfValueForKey:error:", CFSTR("metadata"), &obj);
  objc_storeStrong((id *)(v3 + 40), obj);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v4;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

@end
