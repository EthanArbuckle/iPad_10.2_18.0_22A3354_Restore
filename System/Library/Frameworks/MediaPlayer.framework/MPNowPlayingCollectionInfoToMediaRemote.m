@implementation MPNowPlayingCollectionInfoToMediaRemote

void __MPNowPlayingCollectionInfoToMediaRemote_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v11 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (v6)
      v7 = v6;
    else
      v7 = v11;
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v7, v5);
  }
  if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D4C958]))
  {
    objc_msgSend(*(id *)(a1 + 40), "objectForKey:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __MPNowPlayingCollectionInfoToMediaRemote_block_invoke_2;
    v12[3] = &unk_1E315EFE8;
    v13 = *(id *)(a1 + 32);
    v14 = v9;
    v10 = v9;
    objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v12);
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v10, v5);

  }
}

void __MPNowPlayingCollectionInfoToMediaRemote_block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "objectForKey:", v7);
  v8 = objc_claimAutoreleasedReturnValue();
  v10 = (id)v8;
  if (v8)
    v9 = (id)v8;
  else
    v9 = v7;
  objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v6, v9);

}

@end
