@implementation GEOResourceManifestTileGroupObserverProxy

void __71___GEOResourceManifestTileGroupObserverProxy_forEachObserver_finished___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x18D764E2C]();
  os_unfair_lock_lock_with_options();
  objc_msgSend(*(id *)(a1[4] + 8), "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  os_unfair_lock_unlock((os_unfair_lock_t)(a1[4] + 16));
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = a1[5];
        if (v10)
          (*(void (**)(uint64_t, _QWORD))(v10 + 16))(v10, *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9));
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  v11 = a1[6];
  if (v11)
    (*(void (**)(uint64_t))(v11 + 16))(v11);

  objc_autoreleasePoolPop(v2);
}

@end
