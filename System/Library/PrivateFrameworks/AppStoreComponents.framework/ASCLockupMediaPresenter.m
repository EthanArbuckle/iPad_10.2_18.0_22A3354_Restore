@implementation ASCLockupMediaPresenter

+ (id)log
{
  if (log_onceToken_2 != -1)
    dispatch_once(&log_onceToken_2, &__block_literal_global_10);
  return (id)log_log_2;
}

void __30__ASCLockupMediaPresenter_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.AppStoreComponents", "ASCLockupMediaPresenter");
  v1 = (void *)log_log_2;
  log_log_2 = (uint64_t)v0;

}

- (ASCLockupMediaPresenter)initWithView:(id)a3 lockupPresenter:(id)a4 context:(id)a5
{
  id v9;
  id v10;
  id v11;
  ASCLockupMediaPresenter *v12;
  ASCPendingPromises *v13;
  ASCPendingPromises *pendingArtworkPromises;
  void *v15;
  uint64_t v16;
  ASCLockup *lockup;
  void *v18;
  objc_super v20;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v20.receiver = self;
  v20.super_class = (Class)ASCLockupMediaPresenter;
  v12 = -[ASCLockupMediaPresenter init](&v20, sel_init);
  if (v12)
  {
    v13 = objc_alloc_init(ASCPendingPromises);
    pendingArtworkPromises = v12->_pendingArtworkPromises;
    v12->_pendingArtworkPromises = v13;

    objc_storeStrong((id *)&v12->_view, a3);
    objc_storeStrong((id *)&v12->_context, a5);
    objc_msgSend(v10, "lockup");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "copy");
    lockup = v12->_lockup;
    v12->_lockup = (ASCLockup *)v16;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObserver:selector:name:object:", v12, sel_lockupPresenterDidChange_, 0x1E7564C88, v10);

  }
  return v12;
}

- (ASCLockupMediaPresenter)initWithView:(id)a3 lockupPresenter:(id)a4
{
  id v6;
  id v7;
  void *v8;
  ASCLockupMediaPresenter *v9;

  v6 = a4;
  v7 = a3;
  +[ASCPresenterContext sharedContext](ASCPresenterContext, "sharedContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[ASCLockupMediaPresenter initWithView:lockupPresenter:context:](self, "initWithView:lockupPresenter:context:", v7, v6, v8);

  return v9;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)ASCLockupMediaPresenter;
  -[ASCLockupMediaPresenter dealloc](&v4, sel_dealloc);
}

- (void)lockupPresenterDidChange:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "object");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lockup");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCLockupMediaPresenter setLockup:](self, "setLockup:", v4);

}

- (void)setLockup:(id)a3
{
  ASCLockup *v4;
  ASCLockup *lockup;
  BOOL v6;
  ASCLockup *v7;
  ASCLockup *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  ASCLockup *v19;

  v4 = (ASCLockup *)a3;
  lockup = self->_lockup;
  v19 = v4;
  if (v4 && lockup)
  {
    v6 = -[ASCLockup isEqual:](lockup, "isEqual:", v4);
    v4 = v19;
    if (v6)
      goto LABEL_12;
  }
  else if (lockup == v4)
  {
    goto LABEL_12;
  }
  v7 = (ASCLockup *)-[ASCLockup copy](v4, "copy");
  v8 = self->_lockup;
  self->_lockup = v7;

  -[ASCLockupMediaPresenter pendingArtworkPromises](self, "pendingArtworkPromises");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hasPromises");

  if (v10)
  {
    -[ASCLockupMediaPresenter pendingArtworkPromises](self, "pendingArtworkPromises");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "cancelAll");

    -[ASCLockupMediaPresenter observer](self, "observer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "lockupMediaPresenterDidCancelScreenshotsFetchRequest");

  }
  -[ASCLockupMediaPresenter view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    -[ASCLockup screenshots](v19, "screenshots");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCLockup trailers](v19, "trailers");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setScreenshots:andTrailers:", v14, v15);

    -[ASCLockupMediaPresenter view](self, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCLockupMediaPresenter videoViewForLockup:](self, "videoViewForLockup:", v19);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setVideoView:", v17);

    -[ASCLockupMediaPresenter performScreenshotsFetch](self, "performScreenshotsFetch");
  }
  else
  {
    objc_msgSend(v13, "setVideoView:", 0);

    -[ASCLockupMediaPresenter view](self, "view");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setScreenshots:andTrailers:", 0, 0);

  }
  v4 = v19;
LABEL_12:

}

- (void)setBackgroundView:(id)a3
{
  objc_storeWeak((id *)&self->_backgroundView, a3);
}

- (id)videoViewForLockup:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  ASCScreenshotDisplayConfiguration *v13;
  void *v14;
  void *v15;
  void *v16;
  ASCScreenshotDisplayConfiguration *v17;
  ASCVideoView *v18;
  void *v19;
  ASCVideoView *v20;

  v4 = a3;
  objc_msgSend(v4, "trailers");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_4;
  v6 = (void *)v5;
  objc_msgSend(v4, "trailers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "videos");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v4, "trailers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "videos");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = [ASCScreenshotDisplayConfiguration alloc];
    objc_msgSend(v4, "trailers");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "mediaPlatform");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "deviceCornerRadiusFactor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[ASCScreenshotDisplayConfiguration initWithDeviceCornerRadiusFactor:](v13, "initWithDeviceCornerRadiusFactor:", v16);

    v18 = [ASCVideoView alloc];
    objc_msgSend(v12, "videoURL");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[ASCVideoView initWithFrame:videoURL:screenshotDisplayConfiguration:](v18, "initWithFrame:videoURL:screenshotDisplayConfiguration:", v19, v17, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));

    -[ASCVideoView setDelegate:](v20, "setDelegate:", self);
  }
  else
  {
LABEL_4:
    v20 = 0;
  }

  return v20;
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  int v4;
  void *v5;
  void *v6;

  -[ASCLockupMediaPresenter pendingArtworkPromises](self, "pendingArtworkPromises");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasPromises");

  if (v4)
  {
    -[ASCLockupMediaPresenter pendingArtworkPromises](self, "pendingArtworkPromises");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cancelAll");

    -[ASCLockupMediaPresenter observer](self, "observer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lockupMediaPresenterDidCancelScreenshotsFetchRequest");

  }
  -[ASCLockupMediaPresenter performScreenshotsFetch](self, "performScreenshotsFetch");
}

- (id)artworkForLockup:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a3, "screenshots");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCLockupMediaPresenter lockup](self, "lockup");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "trailers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[__ASCLayoutProxy artworkFrom:and:](__ASCLayoutProxy, "artworkFrom:and:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)performScreenshotsFetch
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  _QWORD v11[7];

  -[ASCLockupMediaPresenter observer](self, "observer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lockupMediaPresenterDidBeginScreenshotsFetchRequest");

  -[ASCLockupMediaPresenter lockup](self, "lockup");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCLockupMediaPresenter artworkForLockup:](self, "artworkForLockup:", v4);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  -[ASCLockupMediaPresenter view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredScreenshotSize");
  v7 = v6;
  v9 = v8;

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __50__ASCLockupMediaPresenter_performScreenshotsFetch__block_invoke;
  v11[3] = &unk_1E7560C00;
  v11[4] = self;
  v11[5] = v7;
  v11[6] = v9;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v11);

}

void __50__ASCLockupMediaPresenter_performScreenshotsFetch__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15[2];
  _QWORD v16[4];
  id v17;
  id v18[2];
  id location;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "artworkFetcher");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "imageForContentsOfArtwork:withSize:", v5, *(double *)(a1 + 40), *(double *)(a1 + 48));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "pendingArtworkPromises");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addPromise:", v8);

  objc_initWeak(&location, *(id *)(a1 + 32));
  v10 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __50__ASCLockupMediaPresenter_performScreenshotsFetch__block_invoke_2;
  v16[3] = &unk_1E7560BB0;
  objc_copyWeak(v18, &location);
  v11 = v5;
  v17 = v11;
  v18[1] = a3;
  objc_msgSend(v8, "addSuccessBlock:", v16);
  v13[0] = v10;
  v13[1] = 3221225472;
  v13[2] = __50__ASCLockupMediaPresenter_performScreenshotsFetch__block_invoke_3;
  v13[3] = &unk_1E7560BD8;
  objc_copyWeak(v15, &location);
  v12 = v11;
  v14 = v12;
  v15[1] = a3;
  objc_msgSend(v8, "addErrorBlock:", v13);

  objc_destroyWeak(v15);
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);

}

void __50__ASCLockupMediaPresenter_performScreenshotsFetch__block_invoke_2(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "screenshotArtwork:didFetchImage:atIndex:", *(_QWORD *)(a1 + 32), v4, *(_QWORD *)(a1 + 48));

}

void __50__ASCLockupMediaPresenter_performScreenshotsFetch__block_invoke_3(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "screenshotArtwork:didFailFetchWithError:atIndex:", *(_QWORD *)(a1 + 32), v4, *(_QWORD *)(a1 + 48));

}

- (void)performFollowUpWork:(id)a3
{
  void *v3;
  void (**block)(void);

  v3 = (void *)MEMORY[0x1E0CB3978];
  block = (void (**)(void))a3;
  if (objc_msgSend(v3, "isMainThread"))
    block[2]();
  else
    dispatch_async(MEMORY[0x1E0C80D38], block);

}

- (void)screenshotArtwork:(id)a3 didFetchImage:(id)a4 atIndex:(int64_t)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  int64_t v15;

  v8 = a3;
  v9 = a4;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __67__ASCLockupMediaPresenter_screenshotArtwork_didFetchImage_atIndex___block_invoke;
  v12[3] = &unk_1E7560C28;
  v12[4] = self;
  v13 = v8;
  v14 = v9;
  v15 = a5;
  v10 = v9;
  v11 = v8;
  -[ASCLockupMediaPresenter performFollowUpWork:](self, "performFollowUpWork:", v12);

}

void __67__ASCLockupMediaPresenter_screenshotArtwork_didFetchImage_atIndex___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  unint64_t v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  BOOL v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  int v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "lockup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "artworkForLockup:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = *(_QWORD *)(a1 + 56);
  if (v5 >= objc_msgSend(v4, "count"))
  {
    +[ASCLockupMediaPresenter log](ASCLockupMediaPresenter, "log");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v12 = *(_QWORD *)(a1 + 32);
      v18 = 138543362;
      v19 = v12;
      _os_log_impl(&dword_1BCB7B000, v7, OS_LOG_TYPE_INFO, "%{public}@: Ignoring out of bounds screenshot artwork", (uint8_t *)&v18, 0xCu);
    }
  }
  else
  {
    objc_msgSend(v4, "objectAtIndexedSubscript:", *(_QWORD *)(a1 + 56));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = *(NSObject **)(a1 + 40);
    if (v6)
      v9 = v8 == 0;
    else
      v9 = 1;
    if (v9)
    {
      if (v6 == v8)
      {
LABEL_14:
        objc_msgSend(*(id *)(a1 + 32), "view");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setImage:atIndex:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

        if (!*(_QWORD *)(a1 + 56))
        {
          objc_msgSend(*(id *)(a1 + 32), "backgroundView");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setImage:", *(_QWORD *)(a1 + 48));

        }
        objc_msgSend(*(id *)(a1 + 32), "pendingArtworkPromises");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "hasPromises");

        if ((v16 & 1) == 0)
        {
          objc_msgSend(*(id *)(a1 + 32), "observer");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "lockupMediaPresenterDidFinishScreenshotsFetchRequest");

        }
        goto LABEL_18;
      }
    }
    else if ((-[NSObject isEqual:](v6, "isEqual:") & 1) != 0)
    {
      goto LABEL_14;
    }
    +[ASCLockupMediaPresenter log](ASCLockupMediaPresenter, "log");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = *(_QWORD *)(a1 + 32);
      v18 = 138543362;
      v19 = v11;
      _os_log_impl(&dword_1BCB7B000, v10, OS_LOG_TYPE_INFO, "%{public}@: Ignoring screenshot artwork for mismatched lockup", (uint8_t *)&v18, 0xCu);
    }

  }
LABEL_18:

}

- (void)screenshotArtwork:(id)a3 didFailFetchWithError:(id)a4 atIndex:(unint64_t)a5
{
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;
  unint64_t v11;

  v7 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __75__ASCLockupMediaPresenter_screenshotArtwork_didFailFetchWithError_atIndex___block_invoke;
  v9[3] = &unk_1E7560C50;
  v10 = v7;
  v11 = a5;
  v9[4] = self;
  v8 = v7;
  -[ASCLockupMediaPresenter performFollowUpWork:](self, "performFollowUpWork:", v9);

}

void __75__ASCLockupMediaPresenter_screenshotArtwork_didFailFetchWithError_atIndex___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  unint64_t v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  BOOL v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  char v14;
  void *v15;
  int v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "lockup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "artworkForLockup:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = *(_QWORD *)(a1 + 48);
  if (v5 >= objc_msgSend(v4, "count"))
  {
    +[ASCLockupMediaPresenter log](ASCLockupMediaPresenter, "log");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v12 = *(_QWORD *)(a1 + 32);
      v16 = 138543362;
      v17 = v12;
      _os_log_impl(&dword_1BCB7B000, v7, OS_LOG_TYPE_INFO, "%{public}@: Ignoring out of bounds screenshot artwork", (uint8_t *)&v16, 0xCu);
    }
  }
  else
  {
    objc_msgSend(v4, "objectAtIndexedSubscript:", *(_QWORD *)(a1 + 48));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = *(NSObject **)(a1 + 40);
    if (v6)
      v9 = v8 == 0;
    else
      v9 = 1;
    if (v9)
    {
      if (v6 == v8)
        goto LABEL_14;
    }
    else if ((-[NSObject isEqual:](v6, "isEqual:") & 1) != 0)
    {
LABEL_14:
      objc_msgSend(*(id *)(a1 + 32), "pendingArtworkPromises");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "hasPromises");

      if ((v14 & 1) == 0)
      {
        objc_msgSend(*(id *)(a1 + 32), "observer");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "lockupMediaPresenterDidFinishScreenshotsFetchRequest");

      }
      goto LABEL_16;
    }
    +[ASCLockupMediaPresenter log](ASCLockupMediaPresenter, "log");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = *(_QWORD *)(a1 + 32);
      v16 = 138543362;
      v17 = v11;
      _os_log_impl(&dword_1BCB7B000, v10, OS_LOG_TYPE_INFO, "%{public}@: Ignoring screenshot artwork for mismatched lockup", (uint8_t *)&v16, 0xCu);
    }

  }
LABEL_16:

}

- (void)videoView:(id)a3 videoStateDidChange:(int64_t)a4
{
  void *v6;
  char v7;
  id v8;

  -[ASCLockupMediaPresenter observer](self, "observer", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[ASCLockupMediaPresenter observer](self, "observer");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "lockupMediaPresenterVideoStateDidChange:", a4);

  }
}

- (ASCLockupMediaPresenterObserver)observer
{
  return (ASCLockupMediaPresenterObserver *)objc_loadWeakRetained((id *)&self->_observer);
}

- (void)setObserver:(id)a3
{
  objc_storeWeak((id *)&self->_observer, a3);
}

- (ASCLockupMediaPresenterBackgroundView)backgroundView
{
  return (ASCLockupMediaPresenterBackgroundView *)objc_loadWeakRetained((id *)&self->_backgroundView);
}

- (ASCLockupMediaPresenterView)view
{
  return self->_view;
}

- (ASCPresenterContext)context
{
  return self->_context;
}

- (ASCLockup)lockup
{
  return self->_lockup;
}

- (ASCPendingPromises)pendingArtworkPromises
{
  return self->_pendingArtworkPromises;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingArtworkPromises, 0);
  objc_storeStrong((id *)&self->_lockup, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_view, 0);
  objc_destroyWeak((id *)&self->_backgroundView);
  objc_destroyWeak((id *)&self->_observer);
}

@end
