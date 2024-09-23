@implementation QLDownloadingItemViewController

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  UIImage *v5;
  UIImage *cloudImage;
  UIImageView *v7;
  UIImageView *downloadImageView;
  void *v9;
  QLDetailItemViewControllerState *v10;
  QLDetailItemViewControllerState *readyForDownloadState;
  QLRoundProgressView *v12;
  QLRoundProgressView *progressView;
  void *v14;
  QLDetailItemViewControllerState *v15;
  QLDetailItemViewControllerState *cancelableDownloadingState;
  QLDetailItemViewControllerState *v17;
  QLDetailItemViewControllerState *nonCancelableDownloadingState;
  QLDetailItemViewControllerState *v19;
  QLDetailItemViewControllerState *completedDownloadState;
  void *v21;
  void *v22;
  QLDetailItemViewControllerState *v23;
  QLDetailItemViewControllerState *previewLoadingState;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)QLDownloadingItemViewController;
  -[QLDetailItemViewController viewDidLoad](&v25, sel_viewDidLoad);
  self->_didDisappear = 1;
  v3 = (void *)MEMORY[0x24BEBD640];
  QLFrameworkBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("Cloudload"), v4, 0);
  v5 = (UIImage *)objc_claimAutoreleasedReturnValue();
  cloudImage = self->_cloudImage;
  self->_cloudImage = v5;

  v7 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD668]), "initWithFrame:", 0.0, 0.0, 32.0, 32.0);
  downloadImageView = self->_downloadImageView;
  self->_downloadImageView = v7;

  -[UIImageView setImage:](self->_downloadImageView, "setImage:", self->_cloudImage);
  -[QLItem canBePreviewed](self->_previewItem, "canBePreviewed");
  QLLocalizedString();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[QLDetailItemViewControllerState detailItemViewControllerStateWithActionButtonTitle:actionButtonView:informationVisible:](QLDetailItemViewControllerState, "detailItemViewControllerStateWithActionButtonTitle:actionButtonView:informationVisible:", v9, self->_downloadImageView, 1);
  v10 = (QLDetailItemViewControllerState *)objc_claimAutoreleasedReturnValue();
  readyForDownloadState = self->_readyForDownloadState;
  self->_readyForDownloadState = v10;

  v12 = -[QLRoundProgressView initWithFrame:]([QLRoundProgressView alloc], "initWithFrame:", 0.0, 0.0, 32.0, 32.0);
  progressView = self->_progressView;
  self->_progressView = v12;

  QLLocalizedStringWithDefaultValue();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[QLDetailItemViewControllerState detailItemViewControllerStateWithActionButtonTitle:actionButtonView:informationVisible:](QLDetailItemViewControllerState, "detailItemViewControllerStateWithActionButtonTitle:actionButtonView:informationVisible:", v14, self->_progressView, 1);
  v15 = (QLDetailItemViewControllerState *)objc_claimAutoreleasedReturnValue();
  cancelableDownloadingState = self->_cancelableDownloadingState;
  self->_cancelableDownloadingState = v15;

  +[QLDetailItemViewControllerState detailItemViewControllerStateWithActionButtonTitle:actionButtonView:informationVisible:](QLDetailItemViewControllerState, "detailItemViewControllerStateWithActionButtonTitle:actionButtonView:informationVisible:", 0, self->_progressView, 1);
  v17 = (QLDetailItemViewControllerState *)objc_claimAutoreleasedReturnValue();
  nonCancelableDownloadingState = self->_nonCancelableDownloadingState;
  self->_nonCancelableDownloadingState = v17;

  +[QLDetailItemViewControllerState detailItemViewControllerStateWithActionButtonTitle:actionButtonView:informationVisible:](QLDetailItemViewControllerState, "detailItemViewControllerStateWithActionButtonTitle:actionButtonView:informationVisible:", 0, 0, 0);
  v19 = (QLDetailItemViewControllerState *)objc_claimAutoreleasedReturnValue();
  completedDownloadState = self->_completedDownloadState;
  self->_completedDownloadState = v19;

  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD398]), "initWithActivityIndicatorStyle:", 9);
  objc_msgSend(MEMORY[0x24BEBD4B8], "secondaryLabelColor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setColor:", v22);

  objc_msgSend(v21, "startAnimating");
  +[QLDetailItemViewControllerState detailItemViewControllerStateWithActionButtonTitle:actionButtonView:informationVisible:](QLDetailItemViewControllerState, "detailItemViewControllerStateWithActionButtonTitle:actionButtonView:informationVisible:", 0, v21, 0);
  v23 = (QLDetailItemViewControllerState *)objc_claimAutoreleasedReturnValue();
  previewLoadingState = self->_previewLoadingState;
  self->_previewLoadingState = v23;

  -[QLDetailItemViewController setState:animated:](self, "setState:animated:", self->_readyForDownloadState, 0);
}

- (void)setAppearance:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  objc_super v7;

  v4 = a4;
  v6 = a3;
  v7.receiver = self;
  v7.super_class = (Class)QLDownloadingItemViewController;
  -[QLDetailItemViewController setAppearance:animated:](&v7, sel_setAppearance_animated_, v6, v4);
  -[QLDownloadingItemViewController loadViewIfNeeded](self, "loadViewIfNeeded");
  if (!*(_WORD *)&self->_downloading)
  {
    if (objc_msgSend(v6, "presentationMode") == 4)
      -[QLDownloadingItemViewController _startDownload:](self, "_startDownload:", 0);
    else
      -[QLDownloadingItemViewController startDownloadIfNeeded](self, "startDownloadIfNeeded");
  }

}

- (void)loadPreviewControllerWithContents:(id)a3 context:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  objc_super v9;
  _QWORD v10[4];
  QLDownloadingItemViewController *v11;
  id v12;
  id v13;

  v10[1] = 3221225472;
  v10[2] = __95__QLDownloadingItemViewController_loadPreviewControllerWithContents_context_completionHandler___block_invoke;
  v10[3] = &unk_24C726D38;
  v11 = self;
  v12 = a3;
  v13 = a5;
  v9.receiver = v11;
  v9.super_class = (Class)QLDownloadingItemViewController;
  v10[0] = MEMORY[0x24BDAC760];
  v7 = v13;
  v8 = v12;
  -[QLDetailItemViewController loadPreviewControllerWithContents:context:completionHandler:](&v9, sel_loadPreviewControllerWithContents_context_completionHandler_, v8, a4, v10);

}

uint64_t __95__QLDownloadingItemViewController_loadPreviewControllerWithContents_context_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 1256), *(id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_updateFileSizeWithProgress:animated:", 0, 0.0);
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

- (BOOL)shouldAutoDownloadInNetworkState:(unint64_t)a3 downloadSize:(id)a4 forceIfPossible:(BOOL)a5
{
  id v7;
  void *v8;
  NSObject **v9;
  NSObject *v10;
  NSObject *v11;
  __CFString *v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  const __CFString *v18;
  NSObject *v19;
  void *v20;
  NSObject **v22;
  int v23;
  const __CFString *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = v7;
  if (a3 > 2)
  {
    if (a5)
    {
      v13 = 1;
    }
    else
    {
      v14 = objc_msgSend(v7, "integerValue");
      v15 = v14;
      if (a3 == 3)
        v16 = 6291456;
      else
        v16 = 102400;
      v13 = v14 < v16;
      v17 = *MEMORY[0x24BE7BF48];
      if (!*MEMORY[0x24BE7BF48])
      {
        v22 = (NSObject **)MEMORY[0x24BE7BF48];
        QLSInitLogging();
        v17 = *v22;
      }
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        if (v15 >= v16)
          v18 = CFSTR("NO");
        else
          v18 = CFSTR("YES");
        v19 = v17;
        NSStringFromQLNetworkState();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 138412546;
        v24 = v18;
        v25 = 2112;
        v26 = v20;
        _os_log_impl(&dword_20D4F5000, v19, OS_LOG_TYPE_INFO, "Should auto-download: '%@', state is %@ #Downloading", (uint8_t *)&v23, 0x16u);

      }
    }
  }
  else
  {
    v9 = (NSObject **)MEMORY[0x24BE7BF48];
    v10 = *MEMORY[0x24BE7BF48];
    if (!*MEMORY[0x24BE7BF48])
    {
      QLSInitLogging();
      v10 = *v9;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = v10;
      NSStringFromQLNetworkState();
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v23 = 138412290;
      v24 = v12;
      _os_log_impl(&dword_20D4F5000, v11, OS_LOG_TYPE_INFO, "Avoid auto-download, since state is %@ #Downloading", (uint8_t *)&v23, 0xCu);

    }
    v13 = 0;
  }

  return v13;
}

- (void)_updateFileSizeWithProgress:(double)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[2];

  v4 = a4;
  v19[1] = *MEMORY[0x24BDAC8D0];
  -[QLItem fetcher](self->_previewItem, "fetcher");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "itemSize");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1490], "stringFromByteCount:countStyle:", objc_msgSend(v8, "longLongValue"), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 && objc_msgSend(v8, "integerValue") >= 1)
  {
    if (self->_downloading)
    {
      v10 = v9;
      v11 = objc_msgSend(v8, "longLongValue");
      objc_msgSend(MEMORY[0x24BDD1490], "stringFromByteCount:countStyle:", (uint64_t)((double)v11 * a3), 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)MEMORY[0x24BDD17C8];
      QLLocalizedString();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringWithFormat:", v14, v12, v10);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v19[0] = v15;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      -[QLDetailItemViewController setInformation:](self, "setInformation:", v16);
    }
    else
    {
      v18 = v9;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v18, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[QLDetailItemViewController setInformation:](self, "setInformation:", v17);

    }
  }
  else
  {
    -[QLDetailItemViewController setInformation:](self, "setInformation:", &unk_24C749690);
  }
  -[QLRoundProgressView setProgress:animated:](self->_progressView, "setProgress:animated:", v4, a3);

}

- (void)previewDidAppear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)QLDownloadingItemViewController;
  -[QLItemViewController previewDidAppear:](&v3, sel_previewDidAppear_, a3);
}

- (void)previewDidDisappear:(BOOL)a3
{
  self->_didDisappear = 1;
}

- (void)performAction
{
  -[QLDownloadingItemViewController _toggleDownload:](self, "_toggleDownload:", 1);
}

- (void)setShowsLoadingPreviewSpinner:(BOOL)a3
{
  int *v3;

  if (self->_showsLoadingPreviewSpinner != a3)
  {
    self->_showsLoadingPreviewSpinner = a3;
    v3 = &OBJC_IVAR___QLDownloadingItemViewController__completedDownloadState;
    if (a3)
      v3 = &OBJC_IVAR___QLDownloadingItemViewController__previewLoadingState;
    -[QLDetailItemViewController setState:animated:](self, "setState:animated:", *(Class *)((char *)&self->super.super.super.super.super.isa + *v3), 1);
  }
}

- (void)_toggleDownload:(BOOL)a3
{
  if (self->_downloading)
    -[QLDownloadingItemViewController _stopDownload:](self, "_stopDownload:", a3);
  else
    -[QLDownloadingItemViewController _startDownload:](self, "_startDownload:", a3);
}

- (void)startDownload:(BOOL)a3
{
  void *v5;
  _QWORD v6[5];
  BOOL v7;

  objc_msgSend(MEMORY[0x24BE7BFB0], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __49__QLDownloadingItemViewController_startDownload___block_invoke;
  v6[3] = &unk_24C726F10;
  v6[4] = self;
  v7 = a3;
  objc_msgSend(v5, "networkStateWithCompletionBlock:", v6);

}

void __49__QLDownloadingItemViewController_startDownload___block_invoke(uint64_t a1, uint64_t a2)
{
  id *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = *(id **)(a1 + 32);
  objc_msgSend(v4[157], "fetcher");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "itemSize");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a2) = objc_msgSend(v4, "shouldAutoDownloadInNetworkState:downloadSize:forceIfPossible:", a2, v6, *(unsigned __int8 *)(a1 + 40));

  if ((_DWORD)a2)
  {
    v7 = *(_QWORD *)(a1 + 32);
    if (!*(_BYTE *)(v7 + 1176))
    {
      if (*(_BYTE *)(v7 + 1178))
        QLRunInMainThread();
    }
  }
}

uint64_t __49__QLDownloadingItemViewController_startDownload___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startDownload:", 0);
}

- (void)startDownloadIfNeeded
{
  void *v3;
  char v4;
  void *v5;
  uint64_t v6;

  -[QLDownloadingItemViewController downloadingDelegate](self, "downloadingDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[QLDownloadingItemViewController downloadingDelegate](self, "downloadingDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "downloadingItemViewControllerShouldForceAutodownloadFile:", self);

  }
  else
  {
    v6 = 0;
  }
  -[QLDownloadingItemViewController startDownload:](self, "startDownload:", v6);
}

- (void)_startDownload:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BE7BFB0], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isConnected");

  if (v6)
  {
    if (!self->_downloading)
    {
      -[QLDownloadingItemViewController _startDownloadOperation](self, "_startDownloadOperation");
      -[QLDownloadingItemViewController _setDownloading:animated:](self, "_setDownloading:animated:", 1, v3);
    }
  }
  else
  {
    -[QLDownloadingItemViewController _setDownloading:animated:](self, "_setDownloading:animated:", 0, v3);
    -[QLItemViewController appearance](self, "appearance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "presentationMode");

    if (v8 != 4)
      -[QLDownloadingItemViewController _presentConnectivityAlert](self, "_presentConnectivityAlert");
  }
}

- (void)_stopDownload:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  int v6;
  void *v7;

  if (self->_downloading)
  {
    v3 = a3;
    -[QLItem fetcher](self->_previewItem, "fetcher");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "canBeCanceled");

    if (v6)
    {
      -[QLItem fetcher](self->_previewItem, "fetcher");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "cancelFetch");

      -[QLDownloadingItemViewController _setDownloading:animated:](self, "_setDownloading:animated:", 0, v3);
    }
  }
}

- (void)_setDownloading:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  int v7;
  int *v8;
  uint64_t v9;
  double v10;

  if (self->_downloading != a3)
  {
    v4 = a4;
    self->_downloading = a3;
    if (a3)
    {
      -[QLItem fetcher](self->_previewItem, "fetcher");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "canBeCanceled");
      v8 = &OBJC_IVAR___QLDownloadingItemViewController__nonCancelableDownloadingState;
      if (v7)
        v8 = &OBJC_IVAR___QLDownloadingItemViewController__cancelableDownloadingState;
      -[QLDetailItemViewController setState:animated:](self, "setState:animated:", *(Class *)((char *)&self->super.super.super.super.super.isa + *v8), v4);

    }
    else
    {
      if (self->_downloaded)
        v9 = 1224;
      else
        v9 = 1200;
      -[QLDetailItemViewController setState:animated:](self, "setState:animated:", *(Class *)((char *)&self->super.super.super.super.super.isa + v9), a4);
    }
    v10 = 1.0;
    if (!self->_downloaded)
      v10 = 0.0;
    -[QLDownloadingItemViewController _updateFileSizeWithProgress:animated:](self, "_updateFileSizeWithProgress:animated:", 0, v10);
  }
}

- (void)_presentConnectivityAlert
{
  id v3;

  -[QLItemViewController delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "previewItemViewControllerWantsToShowNoInternetConnectivityAlert:", self);

}

- (void)_startDownloadOperation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[5];
  id v9;
  _QWORD v10[4];
  id v11;
  id location;

  v3 = (void *)objc_opt_new();
  -[QLItem transformerClass](self->_previewItem, "transformerClass");
  v4 = (void *)objc_opt_new();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "addObject:", objc_opt_class());
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "addObject:", objc_opt_class());
  objc_initWeak(&location, self);
  -[QLItem fetcher](self->_previewItem, "fetcher");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_opt_new();
  v7 = MEMORY[0x24BDAC760];
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __58__QLDownloadingItemViewController__startDownloadOperation__block_invoke;
  v10[3] = &unk_24C726F38;
  objc_copyWeak(&v11, &location);
  v8[0] = v7;
  v8[1] = 3221225472;
  v8[2] = __58__QLDownloadingItemViewController__startDownloadOperation__block_invoke_3;
  v8[3] = &unk_24C726F88;
  v8[4] = self;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v5, "fetchContentWithAllowedOutputClasses:inQueue:updateBlock:completionBlock:", v3, v6, v10, v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

void __58__QLDownloadingItemViewController__startDownloadOperation__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;

  v3 = a2;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  v4 = v3;
  QLRunInMainThread();

  objc_destroyWeak(&v5);
}

void __58__QLDownloadingItemViewController__startDownloadOperation__block_invoke_2(uint64_t a1)
{
  float v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "floatValue");
  objc_msgSend(WeakRetained, "_updateFileSizeWithProgress:animated:", 1, v2);

}

void __58__QLDownloadingItemViewController__startDownloadOperation__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;

  v5 = a2;
  v6 = a3;
  v7 = v5;
  v8 = v6;
  objc_copyWeak(&v9, (id *)(a1 + 40));
  QLRunInMainThread();
  objc_destroyWeak(&v9);

}

void __58__QLDownloadingItemViewController__startDownloadOperation__block_invoke_4(uint64_t a1)
{
  NSObject **v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id WeakRetained;
  id v13;
  void *v14;
  char v15;
  id v16;
  void *v17;
  id v18;
  int v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  if (!*(_QWORD *)(a1 + 32) || *(_QWORD *)(a1 + 40))
  {
    v2 = (NSObject **)MEMORY[0x24BE7BF48];
    v3 = *MEMORY[0x24BE7BF48];
    if (!*MEMORY[0x24BE7BF48])
    {
      QLSInitLogging();
      v3 = *v2;
    }
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = *(_QWORD *)(a1 + 40);
      v19 = 138412290;
      v20 = v4;
      _os_log_impl(&dword_20D4F5000, v3, OS_LOG_TYPE_ERROR, "Error during downloading operation: %@ #Downloading", (uint8_t *)&v19, 0xCu);
    }
    objc_msgSend(*(id *)(a1 + 40), "domain");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *MEMORY[0x24BDD0B88];
    if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BDD0B88]))
      v7 = objc_msgSend(*(id *)(a1 + 40), "code") == 3072;
    else
      v7 = 0;

    objc_msgSend(*(id *)(a1 + 40), "userInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", *MEMORY[0x24BDD1398]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "domain");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "isEqualToString:", v6))
    {
      v11 = objc_msgSend(v9, "code");

      if (v7)
      {
LABEL_15:
        objc_msgSend(*(id *)(a1 + 48), "_setDownloading:animated:", 0, 1);
LABEL_17:

        return;
      }
      if (v11 == 4355)
      {
        objc_msgSend(*(id *)(a1 + 48), "_presentConnectivityAlert");
        goto LABEL_15;
      }
    }
    else
    {

      if (v7)
        goto LABEL_15;
    }
    objc_msgSend(*(id *)(a1 + 48), "notifyDelegatesDidFailWithError:", *(_QWORD *)(a1 + 40));
    goto LABEL_17;
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "setDownloaded:", 1);

  v13 = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(v13, "downloadingDelegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_opt_respondsToSelector();

  if ((v15 & 1) != 0)
  {
    v16 = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(v16, "downloadingDelegate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(v17, "downloadingItemViewControllerDidFinishLoadingPreviewItem:withContents:", v18, *(_QWORD *)(a1 + 32));

  }
  objc_msgSend(*(id *)(a1 + 48), "_setDownloading:animated:", 0, 1);
}

- (QLRoundProgressView)progressView
{
  return self->_progressView;
}

- (QLDownloadingItemViewControllerDelegate)downloadingDelegate
{
  return (QLDownloadingItemViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_downloadingDelegate);
}

- (void)setDownloadingDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_downloadingDelegate, a3);
}

- (BOOL)downloaded
{
  return self->_downloaded;
}

- (void)setDownloaded:(BOOL)a3
{
  self->_downloaded = a3;
}

- (BOOL)showsLoadingPreviewSpinner
{
  return self->_showsLoadingPreviewSpinner;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_downloadingDelegate);
  objc_storeStrong((id *)&self->_previewItem, 0);
  objc_storeStrong((id *)&self->_cloudImage, 0);
  objc_storeStrong((id *)&self->_downloadImageView, 0);
  objc_storeStrong((id *)&self->_previewLoadingState, 0);
  objc_storeStrong((id *)&self->_completedDownloadState, 0);
  objc_storeStrong((id *)&self->_nonCancelableDownloadingState, 0);
  objc_storeStrong((id *)&self->_cancelableDownloadingState, 0);
  objc_storeStrong((id *)&self->_readyForDownloadState, 0);
  objc_storeStrong((id *)&self->_progressView, 0);
  objc_storeStrong(&self->_progressSubscriber, 0);
}

@end
