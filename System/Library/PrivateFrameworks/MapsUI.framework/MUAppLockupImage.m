@implementation MUAppLockupImage

- (MUAppLockupImage)initWithRemoteURL:(id)a3 metrics:(id)a4
{
  id v7;
  id v8;
  MUAppLockupImage *v9;
  MUAppLockupImage *v10;
  NSObject *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *imageProcessingQueue;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)MUAppLockupImage;
  v9 = -[MUAppLockupImage init](&v15, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_url, a3);
    objc_storeStrong((id *)&v10->_metrics, a4);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = dispatch_queue_create("com.apple.maps.MUAppLockupImage.ImageProcessingQueue", v11);
    imageProcessingQueue = v10->_imageProcessingQueue;
    v10->_imageProcessingQueue = (OS_dispatch_queue *)v12;

  }
  return v10;
}

- (void)loadImageWithCompletion:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  void (**v9)(_QWORD);
  id v10;
  id location;

  v4 = (void (**)(_QWORD))a3;
  -[MUAppLockupImage cachedImage](self, "cachedImage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v4[2](v4);
  }
  else
  {
    objc_initWeak(&location, self);
    objc_msgSend(MEMORY[0x1E0CC1750], "sharedImageManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUAppLockupImage url](self, "url");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __44__MUAppLockupImage_loadImageWithCompletion___block_invoke;
    v8[3] = &unk_1E2E020E0;
    objc_copyWeak(&v10, &location);
    v9 = v4;
    objc_msgSend(v6, "loadAppImageAtURL:completionHandler:", v7, v8);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }

}

void __44__MUAppLockupImage_loadImageWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject **WeakRetained;
  NSObject **v5;
  NSObject *v6;
  _QWORD block[4];
  id v8;
  NSObject **v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v3 = a2;
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    if (v3)
    {
      v6 = WeakRetained[1];
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __44__MUAppLockupImage_loadImageWithCompletion___block_invoke_3;
      block[3] = &unk_1E2E01560;
      objc_copyWeak(&v11, (id *)(a1 + 40));
      v8 = v3;
      v9 = v5;
      v10 = *(id *)(a1 + 32);
      dispatch_async(v6, block);

      objc_destroyWeak(&v11);
    }
    else
    {
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __44__MUAppLockupImage_loadImageWithCompletion___block_invoke_2;
      v12[3] = &unk_1E2E017C8;
      v13 = *(id *)(a1 + 32);
      +[MapsUIUtilities performOnMainIfNecessary:](MapsUIUtilities, "performOnMainIfNecessary:", v12);

    }
  }

}

uint64_t __44__MUAppLockupImage_loadImageWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __44__MUAppLockupImage_loadImageWithCompletion___block_invoke_3(id *a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v2 = a1 + 7;
  WeakRetained = objc_loadWeakRetained(a1 + 7);
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "metrics");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "frameSize");
    v7 = v6;
    v9 = v8;

    objc_msgSend(v4, "metrics");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "scale");
    v12 = v11;

    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A7C0]), "initWithCGImage:scale:", objc_msgSend(objc_retainAutorelease(a1[4]), "CGImage"), v12);
    v14 = objc_alloc(MEMORY[0x1E0D3A820]);
    v28[0] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v14, "initWithImages:", v15);

    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A830]), "initWithSize:scale:", v7, v9, v12);
    objc_msgSend(a1[5], "metrics");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "variant");

    if (v19 == 1)
    {
      v20 = 5;
    }
    else
    {
      if (v19)
      {
LABEL_7:
        objc_msgSend(v16, "prepareImageForDescriptor:", v17);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0DC3870], "imageWithCGImage:", objc_msgSend(v21, "CGImage"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v24[0] = MEMORY[0x1E0C809B0];
        v24[1] = 3221225472;
        v24[2] = __44__MUAppLockupImage_loadImageWithCompletion___block_invoke_4;
        v24[3] = &unk_1E2E020B8;
        objc_copyWeak(&v27, v2);
        v23 = v22;
        v25 = v23;
        v26 = a1[6];
        +[MapsUIUtilities performOnMainIfNecessary:](MapsUIUtilities, "performOnMainIfNecessary:", v24);

        objc_destroyWeak(&v27);
        goto LABEL_8;
      }
      v20 = 1;
    }
    objc_msgSend(v17, "setShape:", v20);
    goto LABEL_7;
  }
LABEL_8:

}

void __44__MUAppLockupImage_loadImageWithCompletion___block_invoke_4(uint64_t a1)
{
  id *WeakRetained;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_storeStrong(WeakRetained + 2, *(id *)(a1 + 32));
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    WeakRetained = v3;
  }

}

- (UIImage)cachedImage
{
  return self->_cachedImage;
}

- (NSURL)url
{
  return self->_url;
}

- (MUAppLockupImageMetrics)metrics
{
  return self->_metrics;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_cachedImage, 0);
  objc_storeStrong((id *)&self->_imageProcessingQueue, 0);
}

@end
