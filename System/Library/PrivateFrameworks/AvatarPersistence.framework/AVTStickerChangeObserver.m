@implementation AVTStickerChangeObserver

- (AVTStickerChangeObserver)initWithStickerBackend:(id)a3 environment:(id)a4
{
  id v7;
  id v8;
  AVTStickerChangeObserver *v9;
  AVTStickerChangeObserver *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AVTStickerChangeObserver;
  v9 = -[AVTStickerChangeObserver init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_environment, a4);
    objc_storeStrong((id *)&v10->_stickerBackend, a3);
  }

  return v10;
}

- (void)processChangesForChangeTracker:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  AVTCoreEnvironment *v8;
  void *v9;
  AVTStickerBackend *v10;
  id WeakRetained;
  void *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id from;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = self->_environment;
  -[AVTCoreEnvironment stickerImageStoreLocation](v8, "stickerImageStoreLocation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = self->_stickerBackend;
  WeakRetained = objc_loadWeakRetained((id *)&self->_imageHandlingDelegate);
  objc_initWeak(&location, v10);
  objc_initWeak(&from, WeakRetained);
  -[AVTCoreEnvironment logger](self->_environment, "logger");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __77__AVTStickerChangeObserver_processChangesForChangeTracker_completionHandler___block_invoke;
  v16[3] = &unk_24DD32D40;
  objc_copyWeak(&v20, &location);
  objc_copyWeak(&v21, &from);
  v13 = v6;
  v17 = v13;
  v14 = v9;
  v18 = v14;
  v15 = v7;
  v19 = v15;
  objc_msgSend(v12, "deletingStickerRecentsForRemoteChanges:", v16);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

}

void __77__AVTStickerChangeObserver_processChangesForChangeTracker_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v3 = a2;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __77__AVTStickerChangeObserver_processChangesForChangeTracker_completionHandler___block_invoke_2;
  v11[3] = &unk_24DD32D18;
  objc_copyWeak(&v12, (id *)(a1 + 56));
  objc_copyWeak(&v13, (id *)(a1 + 64));
  v4 = (void *)MEMORY[0x22074B1E8](v11);
  v5 = *(void **)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v10 = 0;
  v7 = objc_msgSend(v5, "processChangeTransactionsWithChangeTokenLocation:handler:error:", v6, v4, &v10);
  v8 = v10;
  v9 = *(_QWORD *)(a1 + 48);
  if (v9)
    (*(void (**)(uint64_t, uint64_t, id))(v9 + 16))(v9, v7, v8);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&v12);

}

uint64_t __77__AVTStickerChangeObserver_processChangesForChangeTracker_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v3, "avt_map:", &__block_literal_global_8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v5, "deleteImagesForAvatarRecordIdentifier:error:", v11, 0);
        objc_msgSend(WeakRetained, "deleteRecentStickersWithAvatarIdentifier:stickerIdentifier:completionHandler:", v11, 0, 0);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return 1;
}

uint64_t __77__AVTStickerChangeObserver_processChangesForChangeTracker_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "recordIdentifier");
}

- (AVTPBackendImageHandlingDelegate)imageHandlingDelegate
{
  return (AVTPBackendImageHandlingDelegate *)objc_loadWeakRetained((id *)&self->_imageHandlingDelegate);
}

- (void)setImageHandlingDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_imageHandlingDelegate, a3);
}

- (AVTCoreEnvironment)environment
{
  return self->_environment;
}

- (AVTStickerBackend)stickerBackend
{
  return self->_stickerBackend;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stickerBackend, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_destroyWeak((id *)&self->_imageHandlingDelegate);
}

@end
