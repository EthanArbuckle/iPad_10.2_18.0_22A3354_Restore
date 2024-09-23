@implementation MPCSonicAVItem

- (MPCSonicAVItem)initWithGenericObject:(id)a3 itemProperties:(id)a4 playbackRequestEnvironment:(id)a5 identityPropertySet:(id)a6 contentID:(id)a7
{
  id v11;
  id v12;
  MPCSonicAVItem *v13;
  MPCSonicAVItem_Swift *v14;
  void *v15;
  MPCSonicAVItem_Swift *v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)MPCSonicAVItem;
  v11 = a7;
  v12 = a5;
  v13 = -[MPCModelGenericAVItem initWithGenericObject:itemProperties:playbackRequestEnvironment:identityPropertySet:](&v18, sel_initWithGenericObject_itemProperties_playbackRequestEnvironment_identityPropertySet_, a3, a4, v12, a6);
  v14 = [MPCSonicAVItem_Swift alloc];
  objc_msgSend(v12, "userIdentity", v18.receiver, v18.super_class);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = -[MPCSonicAVItem_Swift initWithItem:contentID:userIdentity:](v14, "initWithItem:contentID:userIdentity:", v13, v11, v15);
  -[MPCSonicAVItem setSwift:](v13, "setSwift:", v16);

  return v13;
}

- (void)loadAssetAndPlayerItemWithTask:(id)a3 completion:(id)a4
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  -[MPCSonicAVItem swift](self, "swift");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __60__MPCSonicAVItem_loadAssetAndPlayerItemWithTask_completion___block_invoke;
  v8[3] = &unk_24CAB96F8;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  objc_msgSend(v6, "renderWithCompletion:", v8);

}

- (void)prepareForRate:(float)a3 completionHandler:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  id v10;
  double v11;
  void *v12;
  _QWORD v13[4];
  id v14;

  v7 = a4;
  -[MPCSonicAVItem swiftAsset](self, "swiftAsset");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPCSonicAVItem.m"), 62, CFSTR("Asset has not been loaded!"));

  }
  -[MPCSonicAVItem swiftAsset](self, "swiftAsset");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __51__MPCSonicAVItem_prepareForRate_completionHandler___block_invoke;
  v13[3] = &unk_24CAB9A98;
  v14 = v7;
  v10 = v7;
  *(float *)&v11 = a3;
  objc_msgSend(v9, "prepareForRate:completion:", v13, v11);

}

- (int64_t)loadedAudioAssetType
{
  void *v3;

  -[MPCSonicAVItem swiftAsset](self, "swiftAsset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  if (-[MPCSonicAVItem isHLSAsset](self, "isHLSAsset"))
    return 2;
  return 1;
}

- (BOOL)isHLSAsset
{
  void *v2;
  char v3;

  -[MPCSonicAVItem swiftAsset](self, "swiftAsset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isHLS");

  return v3;
}

- (id)contentIdentifier
{
  void *v2;
  void *v3;

  -[MPCSonicAVItem swift](self, "swift");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_contentID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int64_t)playerItemType
{
  return 1;
}

- (void)emitEventType:(id)a3 payload:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[MPCModelGenericAVItem eventStream](self, "eventStream");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "emitEventType:payload:", v7, v6);

}

- (MPCSonicAVItem_Swift)swift
{
  return self->_swift;
}

- (void)setSwift:(id)a3
{
  objc_storeStrong((id *)&self->_swift, a3);
}

- (MPCSonicAVItemAsset)swiftAsset
{
  return self->_swiftAsset;
}

- (void)setSwiftAsset:(id)a3
{
  objc_storeStrong((id *)&self->_swiftAsset, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_swiftAsset, 0);
  objc_storeStrong((id *)&self->_swift, 0);
}

void __51__MPCSonicAVItem_prepareForRate_completionHandler___block_invoke(uint64_t a1)
{
  id v1;

  v1 = *(id *)(a1 + 32);
  msv_dispatch_on_main_queue();

}

uint64_t __51__MPCSonicAVItem_prepareForRate_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __60__MPCSonicAVItem_loadAssetAndPlayerItemWithTask_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 32);
  if (v5)
  {
    objc_msgSend(v7, "setSwiftAsset:", v5);
    v8 = (void *)MEMORY[0x24BDB2618];
    objc_msgSend(v5, "avAsset");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "playerItemWithAsset:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = *(void **)(a1 + 32);
    objc_msgSend(v5, "avAsset");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAsset:", v12);

    objc_msgSend(*(id *)(a1 + 32), "setPlayerItem:", v10);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __60__MPCSonicAVItem_loadAssetAndPlayerItemWithTask_completion___block_invoke_2;
    v13[3] = &unk_24CAB96D0;
    v13[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v5, "loadEnhancedHLSAudioFormatsWithCompletion:", v13);

  }
  else
  {
    objc_msgSend(v7, "setItemError:", v6);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __60__MPCSonicAVItem_loadAssetAndPlayerItemWithTask_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "updateAudioFormatsDictionary:", a2);
  }
  else
  {
    v6 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = 138543362;
      v8 = v5;
      _os_log_impl(&dword_210BD8000, v6, OS_LOG_TYPE_ERROR, "Failed to load enhanced HLS format error=%{public}@", (uint8_t *)&v7, 0xCu);
    }

  }
}

@end
