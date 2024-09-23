@implementation GEORegionalResourcesTileLoader

void __118___GEORegionalResourcesTileLoader_loadResourcesForTileKey_manifestConfiguration_auditToken_signpostID_finished_error___block_invoke(_QWORD *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;

  v14 = a2;
  v7 = a3;
  v8 = a4;
  v9 = (void *)MEMORY[0x18D764E2C]();
  if (v8)
  {
    v10 = a1[5];
    if (v10)
      (*(void (**)(uint64_t, id))(v10 + 16))(v10, v8);
  }
  else
  {
    v11 = a1[6];
    if (v11)
      (*(void (**)(uint64_t, _QWORD))(v11 + 16))(v11, *(_QWORD *)(a1[4] + 8));
    notify_post("kGEORegionalResourcesTileRequesterDidDownloadNotification");
  }
  os_unfair_lock_lock_with_options();
  v12 = a1[4];
  v13 = *(void **)(v12 + 24);
  *(_QWORD *)(v12 + 24) = 0;

  os_unfair_lock_unlock((os_unfair_lock_t)(a1[4] + 32));
  objc_autoreleasePoolPop(v9);

}

@end
