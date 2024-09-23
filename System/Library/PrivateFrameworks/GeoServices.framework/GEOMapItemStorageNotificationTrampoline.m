@implementation GEOMapItemStorageNotificationTrampoline

void __75___GEOMapItemStorageNotificationTrampoline_initWithMapItem_mapItemStorage___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id v2;
  void *v3;
  id *v4;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    v2 = objc_loadWeakRetained(WeakRetained + 2);
    if (v2)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "postNotificationName:object:", CFSTR("GEOMapItemDidResolveAttribution"), v2);

    }
    WeakRetained = v4;
  }

}

@end
