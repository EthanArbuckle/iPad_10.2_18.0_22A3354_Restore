@implementation HFWallpaperManagerRegisterWithDispatcher

void __HFWallpaperManagerRegisterWithDispatcher_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addHomeManagerObserver:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v4, "addHomeObserver:", *(_QWORD *)(a1 + 32));
  if (objc_msgSend(v4, "hasLoadedHomes"))
  {
    v2 = *(void **)(a1 + 32);
    objc_msgSend(v4, "homeManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "homeManagerDidFinishInitialDatabaseLoad:", v3);

  }
}

@end
