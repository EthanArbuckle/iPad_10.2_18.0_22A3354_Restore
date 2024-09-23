@implementation MRUArtworkController

- (MRUArtworkController)init
{
  MRUArtworkController *result;
  CGSize v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MRUArtworkController;
  result = -[MRUArtworkController init](&v4, sel_init);
  if (result)
  {
    result->_artworkLoadingTimeout = 1.0;
    v3 = (CGSize)*MEMORY[0x1E0C9D820];
    result->_preferredContentSize = (CGSize)*MEMORY[0x1E0C9D820];
    result->_artworkFittingSize = v3;
  }
  return result;
}

- (void)setCatalog:(id)a3
{
  id v5;
  void *v6;
  MRUImageLoader *v7;
  void *v8;
  MRUImageLoader *v9;
  void *v10;
  int v11;
  void *v12;
  double v13;
  double v14;
  id v15;
  MSVTimer *v16;
  MSVTimer *artworkTimer;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t);
  void *v25;
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id location;

  v5 = a3;
  objc_storeStrong((id *)&self->_catalog, a3);
  -[MRUArtworkController imageLoader](self, "imageLoader");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    if (!v5)
      goto LABEL_9;
  }
  else
  {
    objc_initWeak(&location, self);
    v7 = [MRUImageLoader alloc];
    -[MRUArtworkController delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __35__MRUArtworkController_setCatalog___block_invoke;
    v28[3] = &unk_1E5818BF0;
    objc_copyWeak(&v29, &location);
    v9 = -[MRUImageLoader initWithDestination:imageHandler:](v7, "initWithDestination:imageHandler:", v8, v28);
    -[MRUArtworkController setImageLoader:](self, "setImageLoader:", v9);

    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);
    if (!v5)
      goto LABEL_9;
  }
  -[MRUArtworkController imageLoader](self, "imageLoader");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "wouldLoadNewImageForCatalog:", v5);

  if (v11)
  {
    objc_initWeak(&location, self);
    v12 = (void *)MEMORY[0x1E0D4D110];
    -[MRUArtworkController artworkLoadingTimeout](self, "artworkLoadingTimeout");
    v14 = v13;
    v22 = MEMORY[0x1E0C809B0];
    v23 = 3221225472;
    v24 = __35__MRUArtworkController_setCatalog___block_invoke_2;
    v25 = &unk_1E5818C18;
    objc_copyWeak(&v27, &location);
    v15 = v5;
    v26 = v15;
    objc_msgSend(v12, "timerWithInterval:repeats:block:", 0, &v22, v14);
    v16 = (MSVTimer *)objc_claimAutoreleasedReturnValue();
    artworkTimer = self->_artworkTimer;
    self->_artworkTimer = v16;

    -[MRUArtworkController delegate](self, "delegate", v22, v23, v24, v25);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_opt_respondsToSelector();

    if ((v19 & 1) != 0)
    {
      -[MRUArtworkController delegate](self, "delegate");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "controller:didStartLoadingImageForCatalog:", self, v15);

    }
    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
  }
LABEL_9:
  -[MRUArtworkController updateArtworkFittingSize](self, "updateArtworkFittingSize");
  -[MRUArtworkController imageLoader](self, "imageLoader");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "updateCatalog:", v5);

}

void __35__MRUArtworkController_setCatalog___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  NSObject *v9;
  void *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    if (v6)
    {
      MCLogCategoryImageLoading();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v11 = 138412802;
        v12 = objc_opt_class();
        v13 = 2048;
        v14 = WeakRetained;
        v15 = 2114;
        v16 = v6;
        _os_log_impl(&dword_1AA991000, v9, OS_LOG_TYPE_ERROR, "%@<%p> Image load failed with error: %{public}@.", (uint8_t *)&v11, 0x20u);
      }

    }
    objc_msgSend(WeakRetained, "artworkTimer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "invalidate");

    objc_msgSend(v8, "controller:didLoadArtworkImage:", WeakRetained, v5);
  }

}

void __35__MRUArtworkController_setCatalog___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  id v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  MCLogCategoryImageLoading();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = objc_opt_class();
    v6 = *(_QWORD *)(a1 + 32);
    v7 = 138412802;
    v8 = v5;
    v9 = 2048;
    v10 = WeakRetained;
    v11 = 2048;
    v12 = v6;
    _os_log_impl(&dword_1AA991000, v4, OS_LOG_TYPE_ERROR, "%@<%p> clearing old artwork while waiting for catalog=%p", (uint8_t *)&v7, 0x20u);
  }

  objc_msgSend(v3, "artworkLoadingDidTimeoutInController:", WeakRetained);
}

- (void)setPreferredContentSize:(CGSize)a3
{
  if (self->_preferredContentSize.width != a3.width || self->_preferredContentSize.height != a3.height)
  {
    self->_preferredContentSize = a3;
    -[MRUArtworkController updateArtworkFittingSize](self, "updateArtworkFittingSize");
  }
}

- (void)setArtworkFittingSize:(CGSize)a3
{
  double height;
  double width;
  void *v7;
  void *v8;
  double v9;
  id v10;

  height = a3.height;
  width = a3.width;
  if (self->_artworkFittingSize.width != a3.width || self->_artworkFittingSize.height != a3.height)
  {
    self->_artworkFittingSize = a3;
    -[MRUArtworkController imageLoader](self, "imageLoader");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    -[MRUArtworkController delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "traitCollection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "displayScale");
    objc_msgSend(v10, "updateFittingSize:scale:", width, height, v9);

  }
}

- (void)updateArtworkFittingSize
{
  uint64_t v3;
  void *v4;
  void *v5;
  double v7;
  double v8;
  id v9;

  -[MRUArtworkController delegate](self, "delegate");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[MRUArtworkController imageLoader](self, "imageLoader");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      if (self->_preferredContentSize.width == *MEMORY[0x1E0C9D820]
        && self->_preferredContentSize.height == *(double *)(MEMORY[0x1E0C9D820] + 8))
      {
        -[MRUArtworkController delegate](self, "delegate");
        v9 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "bounds");
        -[MRUArtworkController setArtworkFittingSize:](self, "setArtworkFittingSize:", v7, v8);

      }
      else
      {
        -[MRUArtworkController setArtworkFittingSize:](self, "setArtworkFittingSize:");
      }
    }
  }
}

- (double)artworkLoadingTimeout
{
  return self->_artworkLoadingTimeout;
}

- (void)setArtworkLoadingTimeout:(double)a3
{
  self->_artworkLoadingTimeout = a3;
}

- (CGSize)preferredContentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_preferredContentSize.width;
  height = self->_preferredContentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (MPArtworkCatalog)catalog
{
  return self->_catalog;
}

- (MRUArtworkControllerDelegate)delegate
{
  return (MRUArtworkControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (MRUImageLoader)imageLoader
{
  return self->_imageLoader;
}

- (void)setImageLoader:(id)a3
{
  objc_storeStrong((id *)&self->_imageLoader, a3);
}

- (MSVTimer)artworkTimer
{
  return self->_artworkTimer;
}

- (void)setArtworkTimer:(id)a3
{
  objc_storeStrong((id *)&self->_artworkTimer, a3);
}

- (CGSize)artworkFittingSize
{
  double width;
  double height;
  CGSize result;

  width = self->_artworkFittingSize.width;
  height = self->_artworkFittingSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artworkTimer, 0);
  objc_storeStrong((id *)&self->_imageLoader, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_catalog, 0);
}

@end
