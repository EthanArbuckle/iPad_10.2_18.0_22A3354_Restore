@implementation AVTUIStickerPlaceholderProviderFactory

- (AVTUIStickerPlaceholderProviderFactory)initWithImageProvider:(id)a3
{
  id v4;
  AVTUIStickerPlaceholderProviderFactory *v5;
  uint64_t v6;
  id imageProvider;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AVTUIStickerPlaceholderProviderFactory;
  v5 = -[AVTUIStickerPlaceholderProviderFactory init](&v9, sel_init);
  if (v5)
  {
    v6 = MEMORY[0x1DF0D0754](v4);
    imageProvider = v5->_imageProvider;
    v5->_imageProvider = (id)v6;

  }
  return v5;
}

- (id)placeholderProvider
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  id location;

  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __61__AVTUIStickerPlaceholderProviderFactory_placeholderProvider__block_invoke;
  v8[3] = &unk_1EA51D6F0;
  objc_copyWeak(&v9, &location);
  v2 = (void *)objc_msgSend(v8, "copy");
  v6 = (void *)MEMORY[0x1DF0D0754](v2, v3, v4, v5);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
  return v6;
}

id __61__AVTUIStickerPlaceholderProviderFactory_placeholderProvider__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void (**v12)(_QWORD, _QWORD, _QWORD);
  void *v13;
  _QWORD v15[4];
  id v16;
  id v17;
  id location;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "queuedHandlers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(WeakRetained, "queuedHandlers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x1DF0D0754](v3);
    objc_msgSend(v6, "addObject:", v7);

    v8 = 0;
  }
  else
  {
    v9 = (void *)MEMORY[0x1E0C99DE8];
    v10 = (void *)MEMORY[0x1DF0D0754](v3);
    objc_msgSend(v9, "arrayWithObject:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "setQueuedHandlers:", v11);

    objc_initWeak(&location, WeakRetained);
    objc_msgSend(WeakRetained, "imageProvider");
    v12 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __61__AVTUIStickerPlaceholderProviderFactory_placeholderProvider__block_invoke_2;
    v15[3] = &unk_1EA51D6C8;
    objc_copyWeak(&v17, &location);
    v16 = v3;
    ((void (**)(_QWORD, _QWORD *, _QWORD))v12)[2](v12, v15, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (void *)MEMORY[0x1DF0D0754](v13);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }

  return v8;
}

void __61__AVTUIStickerPlaceholderProviderFactory_placeholderProvider__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "queuedHandlers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    objc_msgSend(WeakRetained, "queuedHandlers", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v12;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(v6);
          (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++) + 16))();
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v8);
    }

    objc_msgSend(WeakRetained, "setQueuedHandlers:", 0);
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

- (NSMutableArray)queuedHandlers
{
  return self->_queuedHandlers;
}

- (void)setQueuedHandlers:(id)a3
{
  objc_storeStrong((id *)&self->_queuedHandlers, a3);
}

- (id)imageProvider
{
  return self->_imageProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_imageProvider, 0);
  objc_storeStrong((id *)&self->_queuedHandlers, 0);
}

@end
