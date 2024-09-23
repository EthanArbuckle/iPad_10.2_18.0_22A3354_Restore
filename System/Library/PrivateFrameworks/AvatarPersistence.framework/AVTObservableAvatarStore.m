@implementation AVTObservableAvatarStore

- (AVTObservableAvatarStore)initWithStore:(id)a3 callbackQueue:(id)a4
{
  id v7;
  id v8;
  AVTObservableAvatarStore *v9;
  AVTObservableAvatarStore *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AVTObservableAvatarStore;
  v9 = -[AVTObservableAvatarStore init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_store, a3);
    objc_storeStrong((id *)&v10->_callbackQueue, a4);
  }

  return v10;
}

- (BOOL)canCreateAvatar
{
  return -[AVTObservableAvatarStore canCreateAvatarWithError:](self, "canCreateAvatarWithError:", 0);
}

- (BOOL)canCreateAvatarWithError:(id *)a3
{
  void *v4;

  -[AVTObservableAvatarStore store](self, "store");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v4, "canCreateAvatarWithError:", a3);

  return (char)a3;
}

- (id)avatarsForFetchRequest:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[AVTObservableAvatarStore store](self, "store");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "avatarsForFetchRequest:error:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)fetchAvatarsForFetchRequest:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v6 = a4;
  v7 = a3;
  -[AVTObservableAvatarStore store](self, "store");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __74__AVTObservableAvatarStore_fetchAvatarsForFetchRequest_completionHandler___block_invoke;
  v10[3] = &unk_24DD326F8;
  v10[4] = self;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "fetchAvatarsForFetchRequest:completionHandler:", v7, v10);

}

void __74__AVTObservableAvatarStore_fetchAvatarsForFetchRequest_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "callbackQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __74__AVTObservableAvatarStore_fetchAvatarsForFetchRequest_completionHandler___block_invoke_2;
  block[3] = &unk_24DD326D0;
  v8 = *(id *)(a1 + 40);
  v13 = v6;
  v14 = v8;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, block);

}

uint64_t __74__AVTObservableAvatarStore_fetchAvatarsForFetchRequest_completionHandler___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)deleteAvatar:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  objc_msgSend(a3, "identifier");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[AVTObservableAvatarStore deleteAvatarWithIdentifier:completionBlock:](self, "deleteAvatarWithIdentifier:completionBlock:", v7, v6);

}

- (void)deleteAvatarWithIdentifier:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[AVTObservableAvatarStore store](self, "store");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __71__AVTObservableAvatarStore_deleteAvatarWithIdentifier_completionBlock___block_invoke;
  v11[3] = &unk_24DD32770;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "deleteAvatarWithIdentifier:completionBlock:", v10, v11);

}

void __71__AVTObservableAvatarStore_deleteAvatarWithIdentifier_completionBlock___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;
  id v13;
  char v14;

  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "callbackQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __71__AVTObservableAvatarStore_deleteAvatarWithIdentifier_completionBlock___block_invoke_2;
  block[3] = &unk_24DD32748;
  v14 = a2;
  v7 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v11 = v7;
  v8 = *(id *)(a1 + 48);
  v12 = v5;
  v13 = v8;
  v9 = v5;
  dispatch_async(v6, block);

}

void __71__AVTObservableAvatarStore_deleteAvatarWithIdentifier_completionBlock___block_invoke_2(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__2;
  v13 = __Block_byref_object_dispose__2;
  v14 = 0;
  if (*(_BYTE *)(a1 + 64))
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_opt_respondsToSelector();

    if ((v3 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(_QWORD *)(a1 + 40);
      v8[0] = MEMORY[0x24BDAC760];
      v8[1] = 3221225472;
      v8[2] = __71__AVTObservableAvatarStore_deleteAvatarWithIdentifier_completionBlock___block_invoke_4;
      v8[3] = &unk_24DD32720;
      v8[4] = &v9;
      objc_msgSend(v4, "store:didDeleteAvatarWithIdentifier:postCompletionHandler:", v5, v6, v8);

    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  v7 = v10[5];
  if (v7)
    (*(void (**)(void))(v7 + 16))();
  _Block_object_dispose(&v9, 8);

}

void __71__AVTObservableAvatarStore_deleteAvatarWithIdentifier_completionBlock___block_invoke_4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v3 = MEMORY[0x22074B1E8](a2);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (void)saveAvatarRecord:(id)a3 thumbnailAvatar:(id)a4 completionBlock:(id)a5 thumbnailGenerationCompletionBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = a4;
  -[AVTObservableAvatarStore store](self, "store");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __112__AVTObservableAvatarStore_saveAvatarRecord_thumbnailAvatar_completionBlock_thumbnailGenerationCompletionBlock___block_invoke;
  v17[3] = &unk_24DD32770;
  v17[4] = self;
  v18 = v10;
  v19 = v11;
  v15 = v11;
  v16 = v10;
  objc_msgSend(v14, "saveAvatarRecord:thumbnailAvatar:completionBlock:thumbnailGenerationCompletionBlock:", v16, v13, v17, v12);

}

void __112__AVTObservableAvatarStore_saveAvatarRecord_thumbnailAvatar_completionBlock_thumbnailGenerationCompletionBlock___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;
  id v13;
  char v14;

  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "callbackQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __112__AVTObservableAvatarStore_saveAvatarRecord_thumbnailAvatar_completionBlock_thumbnailGenerationCompletionBlock___block_invoke_2;
  block[3] = &unk_24DD32748;
  v14 = a2;
  v7 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v11 = v7;
  v8 = *(id *)(a1 + 48);
  v12 = v5;
  v13 = v8;
  v9 = v5;
  dispatch_async(v6, block);

}

void __112__AVTObservableAvatarStore_saveAvatarRecord_thumbnailAvatar_completionBlock_thumbnailGenerationCompletionBlock___block_invoke_2(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__2;
  v13 = __Block_byref_object_dispose__2;
  v14 = 0;
  if (*(_BYTE *)(a1 + 64))
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_opt_respondsToSelector();

    if ((v3 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(_QWORD *)(a1 + 40);
      v8[0] = MEMORY[0x24BDAC760];
      v8[1] = 3221225472;
      v8[2] = __112__AVTObservableAvatarStore_saveAvatarRecord_thumbnailAvatar_completionBlock_thumbnailGenerationCompletionBlock___block_invoke_3;
      v8[3] = &unk_24DD32720;
      v8[4] = &v9;
      objc_msgSend(v4, "store:didSaveAvatar:postCompletionHandler:", v5, v6, v8);

    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  v7 = v10[5];
  if (v7)
    (*(void (**)(void))(v7 + 16))();
  _Block_object_dispose(&v9, 8);

}

void __112__AVTObservableAvatarStore_saveAvatarRecord_thumbnailAvatar_completionBlock_thumbnailGenerationCompletionBlock___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v3 = MEMORY[0x22074B1E8](a2);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (void)duplicateAvatar:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[AVTObservableAvatarStore store](self, "store");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __60__AVTObservableAvatarStore_duplicateAvatar_completionBlock___block_invoke;
  v11[3] = &unk_24DD327C0;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "duplicateAvatar:completionBlock:", v10, v11);

}

void __60__AVTObservableAvatarStore_duplicateAvatar_completionBlock___block_invoke(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;
  id v18;
  char v19;

  v7 = a3;
  v8 = a4;
  objc_msgSend(*(id *)(a1 + 32), "callbackQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __60__AVTObservableAvatarStore_duplicateAvatar_completionBlock___block_invoke_2;
  v14[3] = &unk_24DD32798;
  v19 = a2;
  v10 = *(void **)(a1 + 40);
  v14[4] = *(_QWORD *)(a1 + 32);
  v15 = v7;
  v16 = v10;
  v11 = *(id *)(a1 + 48);
  v17 = v8;
  v18 = v11;
  v12 = v8;
  v13 = v7;
  dispatch_async(v9, v14);

}

void __60__AVTObservableAvatarStore_duplicateAvatar_completionBlock___block_invoke_2(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__2;
  v14 = __Block_byref_object_dispose__2;
  v15 = 0;
  if (*(_BYTE *)(a1 + 72))
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_opt_respondsToSelector();

    if ((v3 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(_QWORD *)(a1 + 40);
      v7 = *(_QWORD *)(a1 + 48);
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = __60__AVTObservableAvatarStore_duplicateAvatar_completionBlock___block_invoke_3;
      v9[3] = &unk_24DD32720;
      v9[4] = &v10;
      objc_msgSend(v4, "store:didCreateDuplicateAvatar:forOriginal:postCompletionHandler:", v5, v6, v7, v9);

    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  v8 = v11[5];
  if (v8)
    (*(void (**)(void))(v8 + 16))();
  _Block_object_dispose(&v10, 8);

}

void __60__AVTObservableAvatarStore_duplicateAvatar_completionBlock___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v3 = MEMORY[0x22074B1E8](a2);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

+ (unint64_t)maximumNumberOfSavableAvatars
{
  return +[AVTPAvatarStore maximumNumberOfSavableAvatars](AVTPAvatarStore, "maximumNumberOfSavableAvatars");
}

+ (unint64_t)maximumNumberOfFetchableAvatars
{
  return +[AVTPAvatarStore maximumNumberOfFetchableAvatars](AVTPAvatarStore, "maximumNumberOfFetchableAvatars");
}

- (void)deleteRecentStickersWithAvatarIdentifier:(id)a3 stickerIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[AVTObservableAvatarStore store](self, "store");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "deleteRecentStickersWithAvatarIdentifier:stickerIdentifier:completionHandler:", v10, v9, v8);

}

- (void)didUseStickerWithAvatarIdentifier:(id)a3 stickerIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[AVTObservableAvatarStore store](self, "store");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "didUseStickerWithAvatarIdentifier:stickerIdentifier:completionHandler:", v10, v9, v8);

}

- (id)recentStickersForFetchRequest:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[AVTObservableAvatarStore store](self, "store");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "recentStickersForFetchRequest:error:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)deleteRecentStickersForChangeTracker:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[AVTObservableAvatarStore store](self, "store");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "deleteRecentStickersForChangeTracker:completionHandler:", v7, v6);

}

- (AVTAvatarStoreDelegate)delegate
{
  return (AVTAvatarStoreDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (AVTAvatarStoreInternal)store
{
  return self->_store;
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
