@implementation QLItemPresenterViewController

- (QLItemPresenterViewController)init
{
  QLItemPresenterViewController *v2;
  QLItemPresenterViewController *v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *previewLoadingQueue;
  QLItemPresenterViewController *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)QLItemPresenterViewController;
  v2 = -[QLItemViewController init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    -[QLItemViewController setPresentingDelegate:](v2, "setPresentingDelegate:", v2);
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UNSPECIFIED, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = dispatch_queue_create("com.apple.quicklook.preview-loading.serial-queue", v4);
    previewLoadingQueue = v3->previewLoadingQueue;
    v3->previewLoadingQueue = (OS_dispatch_queue *)v5;

    v7 = v3;
  }

  return v3;
}

- (QLItemPresenterViewController)initWithHostApplicationBundleIdentifier:(id)a3 parentApplicationDisplayIdentifier:(id)a4
{
  id v7;
  id v8;
  QLItemPresenterViewController *v9;
  QLItemPresenterViewController *v10;
  QLItemPresenterViewController *v11;

  v7 = a3;
  v8 = a4;
  v9 = -[QLItemPresenterViewController init](self, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_parentApplicationDisplayIdentifier, a4);
    objc_storeStrong((id *)&v10->_hostApplicationBundleIdentifier, a3);
    v11 = v10;
  }

  return v10;
}

- (id)initForPrinting:(BOOL)a3
{
  QLItemPresenterViewController *v4;
  QLItemPresenterViewController *v5;
  QLItemPresenterViewController *v6;

  v4 = -[QLItemPresenterViewController init](self, "init");
  v5 = v4;
  if (v4)
  {
    v4->_printing = a3;
    v6 = v4;
  }

  return v5;
}

- (void)_showLoadingViewControllerDeferredIfNeeded
{
  void *v3;
  int v4;
  dispatch_time_t v5;
  _QWORD block[5];

  -[QLItemPresenterViewController previewProvider](self, "previewProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "presenterShouldHandleLoadingView:readyToDisplay:", self->_previewItem, 0);

  if (v4)
  {
    v5 = dispatch_time(0, 500000000);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __75__QLItemPresenterViewController__showLoadingViewControllerDeferredIfNeeded__block_invoke;
    block[3] = &unk_24C724B00;
    block[4] = self;
    dispatch_after(v5, MEMORY[0x24BDAC9B8], block);
  }
}

void __75__QLItemPresenterViewController__showLoadingViewControllerDeferredIfNeeded__block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "previewProvider");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isLoaded") & 1) == 0)
  {
    v2 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 1139);

    if (v2)
      return;
    v3 = *(void **)(a1 + 32);
    objc_msgSend(v3, "loadingViewController");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "showPreviewViewController:");
  }

}

- (void)_showReadyToDisplayPreviewViewControllerDeferredIfNeeded:(id)a3
{
  QLItem *previewItem;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  dispatch_time_t v10;
  _QWORD block[5];

  previewItem = self->_previewItem;
  v5 = a3;
  v6 = maxLoadingItemForItem(previewItem);
  objc_msgSend(v5, "timeIntervalSinceNow");
  v8 = v7;

  v9 = 0.0;
  if (v6 + v8 > 0.0)
    v9 = (v6 + v8) * 1000000000.0;
  v10 = dispatch_time(0, (uint64_t)v9);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __90__QLItemPresenterViewController__showReadyToDisplayPreviewViewControllerDeferredIfNeeded___block_invoke;
  block[3] = &unk_24C724B00;
  block[4] = self;
  dispatch_after(v10, MEMORY[0x24BDAC9B8], block);
}

void __90__QLItemPresenterViewController__showReadyToDisplayPreviewViewControllerDeferredIfNeeded___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  if ((objc_msgSend(*(id *)(a1 + 32), "_currentPreviewControllerIsErrorViewController") & 1) == 0)
  {
    v2 = *(void **)(a1 + 32);
    objc_msgSend(v2, "previewProvider");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "showPreviewViewController:animatingWithCrossfade:", v3, 0);

  }
}

- (void)loadPreviewControllerWithContents:(id)a3 context:(id)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  id *p_previewItem;
  void *v13;
  NSObject **v14;
  NSObject *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  BOOL v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  _QWORD v34[4];
  id v35;
  _QWORD v36[5];
  id v37;
  _QWORD v38[4];
  id v39;
  id v40;
  uint8_t buf[4];
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  -[QLItemPresenterViewController setContents:](self, "setContents:", v9);
  p_previewItem = (id *)&self->_previewItem;
  objc_storeStrong((id *)&self->_previewItem, a3);
  -[QLItem createPreviewContext](self->_previewItem, "createPreviewContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[QLItemPresenterViewController setContext:](self, "setContext:", v13);

  if (-[QLItem previewItemType](self->_previewItem, "previewItemType") == 15)
  {
    v14 = (NSObject **)MEMORY[0x24BE7BF48];
    v15 = *MEMORY[0x24BE7BF48];
    if (!*MEMORY[0x24BE7BF48])
    {
      QLSInitLogging();
      v15 = *v14;
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      v16 = *p_previewItem;
      *(_DWORD *)buf = 138412290;
      v42 = v16;
      _os_log_impl(&dword_20D4F5000, v15, OS_LOG_TYPE_DEBUG, "Will show error view controller because can't preview item: %@. #PreviewController", buf, 0xCu);
    }
    -[QLItemPresenterViewController setLoadingCompletionHandler:](self, "setLoadingCompletionHandler:", v11);
    -[QLItemPresenterViewController errorViewController](self, "errorViewController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.quicklook.QLErrorItemViewController"), 1, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setError:", v18);

    -[QLItemPresenterViewController showPreviewViewController:](self, "showPreviewViewController:", v17);
    goto LABEL_26;
  }
  objc_msgSend(*p_previewItem, "fetcher");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    objc_initWeak((id *)buf, self);
    v38[0] = MEMORY[0x24BDAC760];
    v38[1] = 3221225472;
    v38[2] = __93__QLItemPresenterViewController_loadPreviewControllerWithContents_context_completionHandler___block_invoke;
    v38[3] = &unk_24C725118;
    v39 = v11;
    objc_copyWeak(&v40, (id *)buf);
    -[QLItemPresenterViewController setLoadingCompletionHandler:](self, "setLoadingCompletionHandler:", v38);
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[QLItemPresenterViewController previewProvider](self, "previewProvider");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = *p_previewItem;
    v36[0] = MEMORY[0x24BDAC760];
    v36[1] = 3221225472;
    v36[2] = __93__QLItemPresenterViewController_loadPreviewControllerWithContents_context_completionHandler___block_invoke_2;
    v36[3] = &unk_24C724778;
    v36[4] = self;
    v23 = v20;
    v37 = v23;
    self->_shouldHandleLoadingView = objc_msgSend(v21, "presenterShouldHandleLoadingView:readyToDisplay:", v22, v36);

    objc_msgSend(*p_previewItem, "fetcher");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v24, "isLongFetchOperation"))
    {
      v25 = !self->_shouldHandleLoadingView;

      if (!v25)
      {
        -[QLItemPresenterViewController downloadingController](self, "downloadingController");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[QLItemPresenterViewController showPreviewViewController:](self, "showPreviewViewController:", v26);
LABEL_25:

        objc_destroyWeak(&v40);
        objc_destroyWeak((id *)buf);
        goto LABEL_26;
      }
    }
    else
    {

    }
    if (!self->_shouldHandleLoadingView)
    {
      -[QLItemPresenterViewController loadingViewController](self, "loadingViewController");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[QLItemPresenterViewController showPreviewViewController:animatingWithCrossfade:updatingIsReadyForDisplay:](self, "showPreviewViewController:animatingWithCrossfade:updatingIsReadyForDisplay:", v28, 1, 0);

    }
    if (objc_msgSend(*p_previewItem, "previewItemType") != 13)
    {
      -[QLItemPresenterViewController previewProvider](self, "previewProvider");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*p_previewItem, "createPreviewContext");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "preloadViewControllerForContext:", v30);

    }
    -[QLItemPresenterViewController _showLoadingViewControllerDeferredIfNeeded](self, "_showLoadingViewControllerDeferredIfNeeded");
    v26 = (void *)objc_opt_new();
    objc_msgSend(*p_previewItem, "transformerClass");
    v31 = (void *)objc_opt_new();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v26, "addObject:", objc_opt_class());
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v26, "addObject:", objc_opt_class());
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v26, "addObject:", objc_opt_class());
    objc_msgSend(*p_previewItem, "fetcher");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (void *)objc_opt_new();
    v34[0] = MEMORY[0x24BDAC760];
    v34[1] = 3221225472;
    v34[2] = __93__QLItemPresenterViewController_loadPreviewControllerWithContents_context_completionHandler___block_invoke_3;
    v34[3] = &unk_24C725140;
    objc_copyWeak(&v35, (id *)buf);
    objc_msgSend(v32, "fetchContentWithAllowedOutputClasses:inQueue:updateBlock:completionBlock:", v26, v33, 0, v34);

    objc_destroyWeak(&v35);
    goto LABEL_25;
  }
  -[QLItemPresenterViewController loadingViewController](self, "loadingViewController");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[QLItemPresenterViewController showPreviewViewController:](self, "showPreviewViewController:", v27);

  if (v11)
    (*((void (**)(id, _QWORD))v11 + 2))(v11, 0);
LABEL_26:

}

void __93__QLItemPresenterViewController_loadPreviewControllerWithContents_context_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id WeakRetained;
  id v6;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v6 = v3;
  if (v4)
  {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
    v3 = v6;
  }
  if (!v3)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "_setupScreenTimeHandling");

    v3 = v6;
  }

}

uint64_t __93__QLItemPresenterViewController_loadPreviewControllerWithContents_context_completionHandler___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_showReadyToDisplayPreviewViewControllerDeferredIfNeeded:", *(_QWORD *)(a1 + 40));
}

void __93__QLItemPresenterViewController_loadPreviewControllerWithContents_context_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id *v8;
  void *v9;
  id WeakRetained;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  _QWORD aBlock[4];
  id v24;

  v5 = a2;
  v6 = a3;
  v7 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __93__QLItemPresenterViewController_loadPreviewControllerWithContents_context_completionHandler___block_invoke_4;
  aBlock[3] = &unk_24C725140;
  v8 = (id *)(a1 + 32);
  objc_copyWeak(&v24, (id *)(a1 + 32));
  v9 = _Block_copy(aBlock);
  WeakRetained = objc_loadWeakRetained(v8);
  objc_msgSend(WeakRetained, "previewItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v11, "previewItemType") == 13 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v12 = objc_alloc(MEMORY[0x24BE7BF70]);
    objc_msgSend(v11, "previewItemContentType");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v12, "initWithURL:contentType:", v5, v13);
    objc_msgSend(v11, "setGenerationFetcher:", v14);

    v15 = (void *)MEMORY[0x24BDBCEF0];
    v16 = objc_opt_class();
    objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "generationFetcher");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_opt_new();
    v20[0] = v7;
    v20[1] = 3221225472;
    v20[2] = __93__QLItemPresenterViewController_loadPreviewControllerWithContents_context_completionHandler___block_invoke_17;
    v20[3] = &unk_24C725168;
    objc_copyWeak(&v22, v8);
    v21 = v9;
    objc_msgSend(v18, "fetchContentWithAllowedOutputClasses:inQueue:updateBlock:completionBlock:", v17, v19, 0, v20);

    objc_destroyWeak(&v22);
  }
  else
  {
    (*((void (**)(void *, id, id))v9 + 2))(v9, v5, v6);
  }

  objc_destroyWeak(&v24);
}

void __93__QLItemPresenterViewController_loadPreviewControllerWithContents_context_completionHandler___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;

  v5 = a2;
  v6 = a3;
  objc_copyWeak(&v9, (id *)(a1 + 32));
  v7 = v6;
  v8 = v5;
  QLRunInMainThread();

  objc_destroyWeak(&v9);
}

void __93__QLItemPresenterViewController_loadPreviewControllerWithContents_context_completionHandler___block_invoke_5(uint64_t a1)
{
  id WeakRetained;
  NSObject **v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject **v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  int v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (*(_QWORD *)(a1 + 32) || !*(_QWORD *)(a1 + 40))
    {
      v3 = (NSObject **)MEMORY[0x24BE7BF48];
      v4 = *MEMORY[0x24BE7BF48];
      if (!*MEMORY[0x24BE7BF48])
      {
        QLSInitLogging();
        v4 = *v3;
      }
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        v5 = v4;
        objc_msgSend(WeakRetained, "previewItem");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = *(_QWORD *)(a1 + 32);
        v8 = *(_QWORD *)(a1 + 40);
        v15 = 138412802;
        v16 = v6;
        v17 = 2112;
        v18 = v7;
        v19 = 2112;
        v20 = v8;
        _os_log_impl(&dword_20D4F5000, v5, OS_LOG_TYPE_ERROR, "Will show error view because presenter could not successfully fetch content of preview item: %@, contents: %@, error: %@. #PreviewController", (uint8_t *)&v15, 0x20u);

      }
      objc_msgSend(WeakRetained, "errorViewController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "showPreviewViewController:", v9);

    }
    else
    {
      v10 = (NSObject **)MEMORY[0x24BE7BF48];
      v11 = *MEMORY[0x24BE7BF48];
      if (!*MEMORY[0x24BE7BF48])
      {
        QLSInitLogging();
        v11 = *v10;
      }
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        v12 = v11;
        objc_msgSend(WeakRetained, "previewItem");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = *(_QWORD *)(a1 + 40);
        v15 = 138412546;
        v16 = v13;
        v17 = 2112;
        v18 = v14;
        _os_log_impl(&dword_20D4F5000, v12, OS_LOG_TYPE_DEBUG, "Will _startLoadingPreviewWithContents because presenter successfully fetched content of preview item: %@, contents: %@. #PreviewController", (uint8_t *)&v15, 0x16u);

      }
      objc_msgSend(WeakRetained, "_startLoadingPreviewWithContents:", *(_QWORD *)(a1 + 40));
    }
  }

}

void __93__QLItemPresenterViewController_loadPreviewControllerWithContents_context_completionHandler___block_invoke_17(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  _QWORD *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;

  v24 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));

  if (!WeakRetained)
  {
    v21 = (void *)MEMORY[0x24BDD1540];
    v22 = *MEMORY[0x24BE7BF30];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", CFSTR("QLItemPresenterVC (weakself) is nil when fetchContentWithAllowedOutputClasses calls back"), *MEMORY[0x24BDD0FC8]);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "errorWithDomain:code:userInfo:", v22, 0, v23);
    v7 = (_QWORD *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    goto LABEL_10;
  }
  v7 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v7, "previewItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v24;
  objc_msgSend(v9, "fileURLHandler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setGeneratedURLHandler:", v10);

  objc_msgSend(v9, "contentType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setGeneratedItemContentType:", v12);

  objc_msgSend(v8, "setStringEncoding:", objc_msgSend(v9, "stringEncoding"));
  objc_msgSend(v9, "attachments");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAttachments:", v13);

  objc_msgSend(v9, "bitmapFormat");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBitmapFormat:", v14);

  objc_msgSend(v8, "setCanBeEdited:", 0);
  objc_msgSend(v8, "setEditingMode:", 0);
  v15 = (void *)v7[146];
  v7[146] = 0;

  v16 = objc_msgSend(v9, "replyType");
  if (v16 < 3 || v16 == 4)
  {
    v20 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v9, "data");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, id))(v20 + 16))(v20, v18, v5);
  }
  else
  {
    if (v16 != 3)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
      goto LABEL_8;
    }
    v17 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v9, "fileURLHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "fileURL");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, id))(v17 + 16))(v17, v19, v5);

  }
LABEL_8:

LABEL_10:
}

- (CGSize)preferredContentSize
{
  void *v3;
  int v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  -[QLItemAggregatedViewController currentPreviewViewController](self, "currentPreviewViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isLoaded");

  if (v4)
  {
    -[QLItemAggregatedViewController currentPreviewViewController](self, "currentPreviewViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "preferredContentSize");
  }
  else
  {
    -[QLItemPresenterViewController previewItem](self, "previewItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "predictedPreferredContentSizeForOrbPlatter");
  }
  v8 = v6;
  v9 = v7;

  v10 = v8;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)_performReadyBlockIfNedded
{
  void (**readyBlock)(id, SEL);
  id v4;

  if (self->_isReadyForDisplay)
  {
    readyBlock = (void (**)(id, SEL))self->_readyBlock;
    if (readyBlock)
    {
      readyBlock[2](readyBlock, a2);
      v4 = self->_readyBlock;
      self->_readyBlock = 0;

    }
  }
}

- (void)_performLoadingCompletionHandlerWithError:(id)a3
{
  QLItemPresenterViewController *v4;
  void (**loadingCompletionHandler)(id, id);
  id v6;
  id v7;

  v7 = a3;
  v4 = self;
  objc_sync_enter(v4);
  loadingCompletionHandler = (void (**)(id, id))v4->_loadingCompletionHandler;
  if (loadingCompletionHandler)
  {
    loadingCompletionHandler[2](loadingCompletionHandler, v7);
    v6 = v4->_loadingCompletionHandler;
    v4->_loadingCompletionHandler = 0;

  }
  objc_sync_exit(v4);

}

- (void)showErrorViewController
{
  id v3;

  -[QLItemPresenterViewController errorViewController](self, "errorViewController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[QLItemPresenterViewController showPreviewViewController:](self, "showPreviewViewController:", v3);

}

- (void)showPreviewProviderViewController
{
  id v3;

  -[QLItemPresenterViewController previewProvider](self, "previewProvider");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[QLItemPresenterViewController showPreviewViewController:](self, "showPreviewViewController:", v3);

}

- (void)showPreviewViewController:(id)a3
{
  -[QLItemPresenterViewController showPreviewViewController:animatingWithCrossfade:](self, "showPreviewViewController:animatingWithCrossfade:", a3, 1);
}

- (void)showPreviewViewController:(id)a3 animatingWithCrossfade:(BOOL)a4
{
  -[QLItemPresenterViewController showPreviewViewController:animatingWithCrossfade:updatingIsReadyForDisplay:](self, "showPreviewViewController:animatingWithCrossfade:updatingIsReadyForDisplay:", a3, a4, 1);
}

- (void)showPreviewViewController:(id)a3 animatingWithCrossfade:(BOOL)a4 updatingIsReadyForDisplay:(BOOL)a5
{
  _BOOL4 v5;
  objc_super v7;

  v5 = a5;
  v7.receiver = self;
  v7.super_class = (Class)QLItemPresenterViewController;
  -[QLItemAggregatedViewController showPreviewViewController:animatingWithCrossfade:](&v7, sel_showPreviewViewController_animatingWithCrossfade_, a3, a4);
  if (v5)
  {
    self->_isReadyForDisplay = 1;
    -[QLItemPresenterViewController _performReadyBlockIfNedded](self, "_performReadyBlockIfNedded");
  }
}

- (void)isReadyForDisplayWithCompletionHandler:(id)a3
{
  void *v4;
  void *v5;
  id readyBlock;
  id aBlock;

  aBlock = a3;
  if (self->_readyBlock)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("The presenter (%@) already has a block for isReadyForDisplayWithCompletionHandler:. Only one observer at a time is supported."), self);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("%s ERROR: %@"), "-[QLItemPresenterViewController isReadyForDisplayWithCompletionHandler:]", v4);

  }
  v5 = _Block_copy(aBlock);
  readyBlock = self->_readyBlock;
  self->_readyBlock = v5;

  -[QLItemPresenterViewController _performReadyBlockIfNedded](self, "_performReadyBlockIfNedded");
}

- (BOOL)canAnimateFromDetailViewToFullScreenPreview
{
  uint64_t v2;

  v2 = -[QLItem previewItemType](self->_previewItem, "previewItemType");
  return v2 == 1 || (v2 & 0xFFFFFFFFFFFFFFFELL) == 2;
}

- (void)_startLoadingPreviewWithContents:(id)a3
{
  id v4;
  NSObject *previewLoadingQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  previewLoadingQueue = self->previewLoadingQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __66__QLItemPresenterViewController__startLoadingPreviewWithContents___block_invoke;
  v7[3] = &unk_24C724778;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(previewLoadingQueue, v7);

}

void __66__QLItemPresenterViewController__startLoadingPreviewWithContents___block_invoke(uint64_t a1)
{
  id *v2;
  void *v3;
  BOOL v4;
  double v5;
  uint64_t v6;
  void *v7;
  dispatch_time_t v8;
  void *v9;
  void *v10;
  void *v11;
  char isKindOfClass;
  uint64_t v13;
  id *v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  id v20;
  void *v21;
  NSObject **v22;
  NSObject *v23;
  NSObject **v24;
  NSObject *v25;
  void *v26;
  id v27;
  id v28;
  id v29[11];
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD block[5];
  id v34;
  id v35;
  BOOL v36;
  id from;
  id location;
  _QWORD v39[5];
  id v40;
  uint8_t buf[4];
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v2 = *(id **)(a1 + 32);
  if (v2[149])
  {
    objc_msgSend(v2, "currentPreviewViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3 == *(void **)(*(_QWORD *)(a1 + 32) + 1192);

    v2 = *(id **)(a1 + 32);
  }
  else
  {
    v4 = 0;
  }
  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x3032000000;
  v39[3] = __Block_byref_object_copy__2;
  v39[4] = __Block_byref_object_dispose__2;
  v40 = 0;
  objc_initWeak(&location, v2[149]);
  objc_initWeak(&from, *(id *)(a1 + 32));
  v5 = maxLoadingItemForItem(*(void **)(*(_QWORD *)(a1 + 32) + 1216));
  v6 = *(_QWORD *)(a1 + 32);
  v7 = (void *)MEMORY[0x24BDAC760];
  if (*(_BYTE *)(v6 + 1141))
  {
    v8 = dispatch_time(0, (uint64_t)(v5 * 1000000000.0));
    block[0] = v7;
    block[1] = 3221225472;
    block[2] = __66__QLItemPresenterViewController__startLoadingPreviewWithContents___block_invoke_27;
    block[3] = &unk_24C725190;
    v36 = v4;
    objc_copyWeak(&v34, &from);
    objc_copyWeak(&v35, &location);
    block[4] = v39;
    dispatch_after(v8, MEMORY[0x24BDAC9B8], block);
    objc_destroyWeak(&v35);
    objc_destroyWeak(&v34);
    v6 = *(_QWORD *)(a1 + 32);
  }
  objc_msgSend(*(id *)(v6 + 1216), "transformerClass", v5);
  v9 = (void *)objc_opt_new();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1216), "createPreviewContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "traitCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setViewDynamicRange:", objc_msgSend(v11, "imageDynamicRange"));

  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v13 = *(_QWORD *)(a1 + 40);
  if ((isKindOfClass & 1) != 0)
  {
    v32 = 0;
    v14 = (id *)&v32;
    objc_msgSend(v9, "transformedContentsFromData:context:error:", v13, v10, &v32);
    v15 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    v16 = objc_opt_isKindOfClass();
    v17 = *(_QWORD *)(a1 + 40);
    if ((v16 & 1) != 0)
    {
      v31 = 0;
      v14 = (id *)&v31;
      objc_msgSend(v9, "transformedContentsFromURL:context:error:", v17, v10, &v31);
      v15 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_20;
      v18 = *(_QWORD *)(a1 + 40);
      v30 = 0;
      v14 = (id *)&v30;
      objc_msgSend(v9, "transformedContentsFromSpotlightSearchableItemInfo:context:error:", v18, v10, &v30);
      v15 = objc_claimAutoreleasedReturnValue();
    }
  }
  v19 = (id)v15;
  v20 = *v14;
  if (v20)
  {
    v21 = v20;
    v22 = (NSObject **)MEMORY[0x24BE7BF48];
    v23 = *MEMORY[0x24BE7BF48];
    if (!*MEMORY[0x24BE7BF48])
    {
      QLSInitLogging();
      v23 = *v22;
    }
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v42 = v21;
      _os_log_impl(&dword_20D4F5000, v23, OS_LOG_TYPE_ERROR, "Error while attempting to load preview item: %@ #ItemPresenter", buf, 0xCu);
    }
    v29[6] = v7;
    v29[7] = (id)3221225472;
    v29[8] = __66__QLItemPresenterViewController__startLoadingPreviewWithContents___block_invoke_28;
    v29[9] = &unk_24C724B00;
    v29[10] = *(id *)(a1 + 32);
    QLRunInMainThread();
    goto LABEL_25;
  }
  if (v19)
  {
    v19 = v19;
    v27 = v10;
    objc_copyWeak(&v28, &location);
    objc_copyWeak(v29, &from);
    QLRunInMainThread();
    objc_destroyWeak(v29);
    objc_destroyWeak(&v28);

    v21 = 0;
    goto LABEL_25;
  }
LABEL_20:
  v24 = (NSObject **)MEMORY[0x24BE7BF48];
  v25 = *MEMORY[0x24BE7BF48];
  if (!*MEMORY[0x24BE7BF48])
  {
    QLSInitLogging();
    v25 = *v24;
  }
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    v26 = *(void **)(*(_QWORD *)(a1 + 32) + 1216);
    *(_DWORD *)buf = 138412290;
    v42 = v26;
    _os_log_impl(&dword_20D4F5000, v25, OS_LOG_TYPE_ERROR, "Cancelled loading view controller because transformedContent is nil for item: %@. #ItemPresenter", buf, 0xCu);
  }
  v29[1] = v7;
  v29[2] = (id)3221225472;
  v29[3] = __66__QLItemPresenterViewController__startLoadingPreviewWithContents___block_invoke_29;
  v29[4] = &unk_24C724B00;
  v29[5] = *(id *)(a1 + 32);
  QLRunInMainThread();
  v21 = 0;
  v19 = 0;
LABEL_25:

  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
  _Block_object_dispose(v39, 8);

}

void __66__QLItemPresenterViewController__startLoadingPreviewWithContents___block_invoke_27(uint64_t a1)
{
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id WeakRetained;

  if (*(_BYTE *)(a1 + 56))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    if ((objc_msgSend(WeakRetained, "isLoaded") & 1) != 0)
    {

    }
    else
    {
      v2 = objc_loadWeakRetained((id *)(a1 + 48));

      if (v2)
      {
        v3 = objc_loadWeakRetained((id *)(a1 + 48));
        objc_msgSend(v3, "setShowsLoadingPreviewSpinner:", 1);

        objc_msgSend(MEMORY[0x24BDBCE60], "date");
        v4 = objc_claimAutoreleasedReturnValue();
        v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
        v6 = *(void **)(v5 + 40);
        *(_QWORD *)(v5 + 40) = v4;

      }
    }
  }
}

void __66__QLItemPresenterViewController__startLoadingPreviewWithContents___block_invoke_28(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(v1, "errorViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "showPreviewViewController:", v2);

}

void __66__QLItemPresenterViewController__startLoadingPreviewWithContents___block_invoke_29(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(v1, "errorViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "showPreviewViewController:", v2);

}

void __66__QLItemPresenterViewController__startLoadingPreviewWithContents___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[6];
  id v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "previewProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __66__QLItemPresenterViewController__startLoadingPreviewWithContents___block_invoke_3;
  v5[3] = &unk_24C7251E0;
  v5[5] = *(_QWORD *)(a1 + 56);
  objc_copyWeak(&v6, (id *)(a1 + 64));
  objc_copyWeak(&v7, (id *)(a1 + 72));
  v5[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "loadPreviewControllerIfNeededWithContents:context:completionHandler:", v3, v4, v5);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&v6);
}

void __66__QLItemPresenterViewController__startLoadingPreviewWithContents___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  BOOL v8;
  double v9;
  int64_t v10;
  dispatch_time_t v11;
  id v12;
  _QWORD block[4];
  id v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  id v18;

  v3 = a2;
  v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (v4)
  {
    objc_msgSend(v4, "timeIntervalSinceNow");
    v6 = v5 + 0.4;
    v7 = v6 * 1000000000.0;
    v8 = v6 <= 0.0;
    v9 = 0.0;
    if (!v8)
      v9 = v7;
    v10 = (uint64_t)v9;
  }
  else
  {
    v10 = 0;
  }
  v11 = dispatch_time(0, v10);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __66__QLItemPresenterViewController__startLoadingPreviewWithContents___block_invoke_4;
  block[3] = &unk_24C7251B8;
  v16 = *(_QWORD *)(a1 + 40);
  objc_copyWeak(&v17, (id *)(a1 + 48));
  v14 = v3;
  v12 = v3;
  objc_copyWeak(&v18, (id *)(a1 + 56));
  v15 = *(_QWORD *)(a1 + 32);
  dispatch_after(v11, MEMORY[0x24BDAC9B8], block);
  objc_destroyWeak(&v18);

  objc_destroyWeak(&v17);
}

void __66__QLItemPresenterViewController__startLoadingPreviewWithContents___block_invoke_4(uint64_t a1)
{
  id WeakRetained;
  NSObject **v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  int v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(WeakRetained, "setShowsLoadingPreviewSpinner:", 0);

  }
  if (*(_QWORD *)(a1 + 32))
  {
    v3 = (NSObject **)MEMORY[0x24BE7BF48];
    v4 = *MEMORY[0x24BE7BF48];
    if (!*MEMORY[0x24BE7BF48])
    {
      QLSInitLogging();
      v4 = *v3;
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v13 = 138412290;
      v14 = v5;
      _os_log_impl(&dword_20D4F5000, v4, OS_LOG_TYPE_ERROR, "Error while attempting to load preview item: %@ #ItemPresenter", (uint8_t *)&v13, 0xCu);
    }
    v6 = objc_loadWeakRetained((id *)(a1 + 64));
    objc_msgSend(v6, "errorViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "showPreviewViewController:", v7);

  }
  else
  {
    v8 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 1141);
    v9 = objc_loadWeakRetained((id *)(a1 + 64));
    objc_msgSend(v9, "previewProvider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "showPreviewViewController:animatingWithCrossfade:", v10, v8);

    v6 = objc_loadWeakRetained((id *)(a1 + 64));
    objc_msgSend(v6, "previewProvider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "becomeFirstResponder");

  }
  v12 = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(v12, "_performLoadingCompletionHandlerWithError:", 0);

}

- (void)downloadingItemViewControllerDidFinishLoadingPreviewItem:(id)a3 withContents:(id)a4
{
  id v4;
  id v5;

  v5 = a4;
  v4 = v5;
  QLRunInMainThread();

}

uint64_t __103__QLItemPresenterViewController_downloadingItemViewControllerDidFinishLoadingPreviewItem_withContents___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startLoadingPreviewWithContents:", *(_QWORD *)(a1 + 40));
}

- (BOOL)downloadingItemViewControllerShouldForceAutodownloadFile:(id)a3
{
  QLItemPresenterViewController *v3;
  void *v4;

  v3 = self;
  -[QLItemAggregatedViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v4, "itemPresenterViewControllerShouldForceAutodownloadFile:", v3);

  return (char)v3;
}

- (void)setAppearance:(id)a3 animated:(BOOL)a4
{
  void *v5;
  uint64_t v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)QLItemPresenterViewController;
  -[QLItemAggregatedViewController setAppearance:animated:](&v7, sel_setAppearance_animated_, a3, a4);
  -[QLItemAggregatedViewController appearance](self, "appearance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "presentationMode");

  if (v6 == 4)
  {
    self->_isPeekingSession = 1;
    self->_shouldDeferAppearanceUpdates = 0;
  }
}

- (BOOL)isLoaded
{
  void *v2;
  char v3;

  if (!self->_previewProvider)
    return 0;
  -[QLItemPresenterViewController previewProvider](self, "previewProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isLoaded");

  return v3;
}

- (BOOL)isLoading
{
  void *v2;
  char v3;

  if (!self->_previewProvider)
    return 1;
  -[QLItemPresenterViewController previewProvider](self, "previewProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isLoading");

  return v3;
}

- (BOOL)loadingFailed
{
  void *v2;
  char v3;

  if (!self->_previewProvider)
    return 0;
  -[QLItemPresenterViewController previewProvider](self, "previewProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "loadingFailed");

  return v3;
}

- (QLErrorItemViewController)errorViewController
{
  QLErrorItemViewController *errorViewController;
  QLErrorItemViewController *v4;
  QLErrorItemViewController *v5;
  QLErrorItemViewController *v6;
  void *v7;

  errorViewController = self->_errorViewController;
  if (!errorViewController)
  {
    v4 = (QLErrorItemViewController *)objc_opt_new();
    v5 = self->_errorViewController;
    self->_errorViewController = v4;

    v6 = self->_errorViewController;
    -[QLItem createPreviewContext](self->_previewItem, "createPreviewContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[QLItemViewController loadPreviewControllerIfNeededWithContents:context:completionHandler:](v6, "loadPreviewControllerIfNeededWithContents:context:completionHandler:", 0, v7, 0);

    self->_failureOccurred = 1;
    errorViewController = self->_errorViewController;
  }
  return errorViewController;
}

- (BOOL)_currentPreviewControllerIsErrorViewController
{
  void *v3;
  QLErrorItemViewController *v4;
  BOOL v5;

  -[QLItemAggregatedViewController currentPreviewViewController](self, "currentPreviewViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[QLItemAggregatedViewController currentPreviewViewController](self, "currentPreviewViewController");
    v4 = (QLErrorItemViewController *)objc_claimAutoreleasedReturnValue();
    v5 = v4 == self->_errorViewController;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (QLLoadingItemViewController)loadingViewController
{
  QLLoadingItemViewController *loadingViewController;
  QLLoadingItemViewController *v4;
  QLLoadingItemViewController *v5;
  QLLoadingItemViewController *v6;
  void *v7;

  loadingViewController = self->_loadingViewController;
  if (!loadingViewController)
  {
    v4 = (QLLoadingItemViewController *)objc_opt_new();
    v5 = self->_loadingViewController;
    self->_loadingViewController = v4;

    v6 = self->_loadingViewController;
    -[QLItem createPreviewContext](self->_previewItem, "createPreviewContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[QLLoadingItemViewController loadPreviewControllerWithContents:context:completionHandler:](v6, "loadPreviewControllerWithContents:context:completionHandler:", 0, v7, 0);

    loadingViewController = self->_loadingViewController;
  }
  return loadingViewController;
}

- (QLDownloadingItemViewController)downloadingController
{
  QLDownloadingItemViewController *downloadingController;
  QLDownloadingItemViewController *v4;
  QLDownloadingItemViewController *v5;
  QLDownloadingItemViewController *v6;
  QLItem *previewItem;
  void *v8;

  downloadingController = self->_downloadingController;
  if (!downloadingController)
  {
    v4 = (QLDownloadingItemViewController *)objc_opt_new();
    v5 = self->_downloadingController;
    self->_downloadingController = v4;

    -[QLDownloadingItemViewController setDownloadingDelegate:](self->_downloadingController, "setDownloadingDelegate:", self);
    v6 = self->_downloadingController;
    previewItem = self->_previewItem;
    -[QLItem createPreviewContext](previewItem, "createPreviewContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[QLDownloadingItemViewController loadPreviewControllerWithContents:context:completionHandler:](v6, "loadPreviewControllerWithContents:context:completionHandler:", previewItem, v8, 0);

    downloadingController = self->_downloadingController;
  }
  return downloadingController;
}

- (QLItemViewController)previewProvider
{
  QLItemViewController *previewProvider;
  _BOOL4 printing;
  QLItem *previewItem;
  NSString *v6;
  QLItemViewController *v7;
  QLItemViewController *v8;
  void *v9;
  void *v10;

  previewProvider = self->_previewProvider;
  if (!previewProvider)
  {
    printing = self->_printing;
    previewItem = self->_previewItem;
    if (printing)
      -[QLItem previewItemPrintingViewControllerClassName](previewItem, "previewItemPrintingViewControllerClassName");
    else
      -[QLItem previewItemViewControllerClassName](previewItem, "previewItemViewControllerClassName");
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    NSClassFromString(v6);
    v7 = (QLItemViewController *)objc_opt_new();
    v8 = self->_previewProvider;
    self->_previewProvider = v7;

    if (self->_previewControllerMissedTransitionDidStart && (objc_opt_respondsToSelector() & 1) != 0)
      -[QLItemViewController transitionDidStart:](self->_previewProvider, "transitionDidStart:", 1);

    -[QLItemViewController presentingDelegate](self, "presentingDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[QLItemViewController setPresentingDelegate:](self->_previewProvider, "setPresentingDelegate:", v9);

    -[QLItemAggregatedViewController delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[QLItemViewController setDelegate:](self->_previewProvider, "setDelegate:", v10);

    previewProvider = self->_previewProvider;
  }
  return previewProvider;
}

- (QLItem)previewItem
{
  return self->_previewItem;
}

- (void)previewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v6;
  objc_super v7;

  v3 = a3;
  -[QLItemPresenterViewController _cancelAllDeferredApperanceUpdates](self, "_cancelAllDeferredApperanceUpdates");
  if (self->_shouldDeferAppearanceUpdates)
  {
    if (v3)
      v6 = MEMORY[0x24BDBD1C8];
    else
      v6 = 0;
    -[QLItemPresenterViewController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", a2, v6, 0.1);
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)QLItemPresenterViewController;
    -[QLItemAggregatedViewController previewWillAppear:](&v7, sel_previewWillAppear_, v3);
  }
}

- (void)previewDidAppear:(BOOL)a3
{
  uint64_t v4;
  objc_super v5;

  if (self->_shouldDeferAppearanceUpdates)
  {
    if (a3)
      v4 = MEMORY[0x24BDBD1C8];
    else
      v4 = 0;
    -[QLItemPresenterViewController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", a2, v4, 0.1);
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)QLItemPresenterViewController;
    -[QLItemAggregatedViewController previewDidAppear:](&v5, sel_previewDidAppear_, a3);
  }
  -[QLItemPresenterViewController _cancelAllDeferredApperanceUpdates](self, "_cancelAllDeferredApperanceUpdates");
  self->_shouldDeferAppearanceUpdates = 0;
}

- (void)previewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v6;
  void *v7;
  void *v8;
  QLDownloadingItemViewController *v9;
  BOOL *p_shouldDeferAppearanceUpdates;
  uint64_t v11;
  objc_super v12;

  v3 = a3;
  if (!self->_isPeekingSession)
  {
    self->_shouldDeferAppearanceUpdates = 0;
LABEL_14:
    v12.receiver = self;
    v12.super_class = (Class)QLItemPresenterViewController;
    -[QLItemAggregatedViewController previewWillDisappear:](&v12, sel_previewWillDisappear_, v3);
    return;
  }
  -[QLItemAggregatedViewController currentPreviewViewController](self, "currentPreviewViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[QLItemAggregatedViewController currentPreviewViewController](self, "currentPreviewViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[QLItemPresenterViewController previewProvider](self, "previewProvider");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7 == v8)
    {
      p_shouldDeferAppearanceUpdates = &self->_shouldDeferAppearanceUpdates;
      self->_shouldDeferAppearanceUpdates = 1;
    }
    else
    {
      -[QLItemAggregatedViewController currentPreviewViewController](self, "currentPreviewViewController");
      v9 = (QLDownloadingItemViewController *)objc_claimAutoreleasedReturnValue();
      p_shouldDeferAppearanceUpdates = &self->_shouldDeferAppearanceUpdates;
      self->_shouldDeferAppearanceUpdates = v9 == self->_downloadingController;

    }
  }
  else
  {
    p_shouldDeferAppearanceUpdates = &self->_shouldDeferAppearanceUpdates;
    self->_shouldDeferAppearanceUpdates = 0;
  }

  if (!*p_shouldDeferAppearanceUpdates)
    goto LABEL_14;
  if (v3)
    v11 = MEMORY[0x24BDBD1C8];
  else
    v11 = 0;
  -[QLItemPresenterViewController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", a2, v11, 0.1);
}

- (void)previewDidDisappear:(BOOL)a3
{
  uint64_t v3;
  objc_super v4;

  self->_isPeekingSession = 0;
  if (self->_shouldDeferAppearanceUpdates)
  {
    if (a3)
      v3 = MEMORY[0x24BDBD1C8];
    else
      v3 = 0;
    -[QLItemPresenterViewController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", a2, v3, 0.1);
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)QLItemPresenterViewController;
    -[QLItemAggregatedViewController previewDidDisappear:](&v4, sel_previewDidDisappear_, a3);
  }
}

- (void)_cancelAllDeferredApperanceUpdates
{
  objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:", self);
}

- (void)transitionDidStart:(BOOL)a3
{
  _BOOL8 v3;
  QLItemViewController *previewProvider;
  id v5;

  v3 = a3;
  previewProvider = self->_previewProvider;
  if (previewProvider
    || (self->_previewControllerMissedTransitionDidStart = 1, (previewProvider = self->_previewProvider) != 0))
  {
    -[QLItemViewController transitionDidStart:](previewProvider, "transitionDidStart:", a3);
  }
  else
  {
    -[QLItemAggregatedViewController currentPreviewViewController](self, "currentPreviewViewController");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "transitionDidStart:", v3);

  }
}

- (void)transitionDidFinish:(BOOL)a3 didComplete:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  id v6;

  v4 = a4;
  v5 = a3;
  if (self->_previewProvider)
  {
    -[QLItemViewController transitionDidFinish:didComplete:](self->_previewProvider, "transitionDidFinish:didComplete:", a3, a4);
  }
  else
  {
    -[QLItemAggregatedViewController currentPreviewViewController](self, "currentPreviewViewController");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "transitionDidFinish:didComplete:", v5, v4);

  }
}

- (void)transitionWillFinish:(BOOL)a3 didComplete:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  id v6;

  v4 = a4;
  v5 = a3;
  if (self->_previewProvider)
  {
    -[QLItemViewController transitionWillFinish:didComplete:](self->_previewProvider, "transitionWillFinish:didComplete:", a3, a4);
  }
  else
  {
    -[QLItemAggregatedViewController currentPreviewViewController](self, "currentPreviewViewController");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "transitionWillFinish:didComplete:", v5, v4);

  }
}

- (id)additionalItemViewControllerDescription
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v7.receiver = self;
  v7.super_class = (Class)QLItemPresenterViewController;
  -[QLItemViewController additionalItemViewControllerDescription](&v7, sel_additionalItemViewControllerDescription);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@\n\tPreview item: %@"), v4, self->_previewItem);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)updatePreviewItemDisplayState:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[QLItemAggregatedViewController currentPreviewViewController](self, "currentPreviewViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[QLItemAggregatedViewController currentPreviewViewController](self, "currentPreviewViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "updatePreviewItemDisplayState:", v7);

  }
}

- (void)_setupScreenTimeHandling
{
  void *v3;
  _BOOL4 v4;
  NSObject **v5;
  NSObject *v6;
  const char *v7;
  NSObject **v8;
  void *v9;
  NSObject **v10;
  int v11;
  QLItemPresenterViewController *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (!-[QLItemPresenterViewController _processIsEntitledToCheckScreenTimePolicy](self, "_processIsEntitledToCheckScreenTimePolicy"))
  {
    v5 = (NSObject **)MEMORY[0x24BE7BF48];
    v6 = *MEMORY[0x24BE7BF48];
    if (!*MEMORY[0x24BE7BF48])
    {
      QLSInitLogging();
      v6 = *v5;
    }
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      return;
    v11 = 138412290;
    v12 = self;
    v7 = "Can't set up screen time management because process is not entitled to check screen time policy. %@ #PreviewController";
LABEL_13:
    _os_log_impl(&dword_20D4F5000, v6, OS_LOG_TYPE_INFO, v7, (uint8_t *)&v11, 0xCu);
    return;
  }
  if (!-[QLItemPresenterViewController _processIsEntitledToConfigureScreenTime](self, "_processIsEntitledToConfigureScreenTime"))
  {
    v8 = (NSObject **)MEMORY[0x24BE7BF48];
    v6 = *MEMORY[0x24BE7BF48];
    if (!*MEMORY[0x24BE7BF48])
    {
      QLSInitLogging();
      v6 = *v8;
    }
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      return;
    v11 = 138412290;
    v12 = self;
    v7 = "Can't set up screen time management because process is not entitled to configure screen time. %@ #PreviewController";
    goto LABEL_13;
  }
  -[QLItemPresenterViewController previewItem](self, "previewItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[QLItemPresenterViewController _shouldApplyScreenTimeMoviePolicyForItem:](self, "_shouldApplyScreenTimeMoviePolicyForItem:", v3);

  if (v4)
  {
    -[QLItemPresenterViewController _setupScreenTimeCategoryHandling](self, "_setupScreenTimeCategoryHandling");
    return;
  }
  -[QLItemPresenterViewController screenTimePolicyBundleIdentifier](self, "screenTimePolicyBundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[QLItemPresenterViewController _setupScreenTimeApplicationHandling](self, "_setupScreenTimeApplicationHandling");
    return;
  }
  v10 = (NSObject **)MEMORY[0x24BE7BF48];
  v6 = *MEMORY[0x24BE7BF48];
  if (!*MEMORY[0x24BE7BF48])
  {
    QLSInitLogging();
    v6 = *v10;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v11 = 138412290;
    v12 = self;
    v7 = "No need to set up screen time management for preview controller: %@. #PreviewController";
    goto LABEL_13;
  }
}

- (void)_setupScreenTimeCategoryHandling
{
  id v3;
  DMFCategoryPolicyMonitor *v4;
  DMFCategoryPolicyMonitor *screenTimeCategoryMonitor;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t);
  void *v9;
  id v10;
  id location;

  objc_initWeak(&location, self);
  v3 = objc_alloc(MEMORY[0x24BE2C7C8]);
  v6 = MEMORY[0x24BDAC760];
  v7 = 3221225472;
  v8 = __65__QLItemPresenterViewController__setupScreenTimeCategoryHandling__block_invoke;
  v9 = &unk_24C725230;
  objc_copyWeak(&v10, &location);
  v4 = (DMFCategoryPolicyMonitor *)objc_msgSend(v3, "initWithPolicyChangeHandler:", &v6);
  screenTimeCategoryMonitor = self->_screenTimeCategoryMonitor;
  self->_screenTimeCategoryMonitor = v4;

  -[QLItemPresenterViewController _queryScreenTimeCategoryPolicy](self, "_queryScreenTimeCategoryPolicy", v6, v7, v8, v9);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __65__QLItemPresenterViewController__setupScreenTimeCategoryHandling__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_queryScreenTimeCategoryPolicy");

}

- (void)_setupScreenTimeApplicationHandling
{
  void *v3;
  id v4;
  DMFApplicationPolicyMonitor *v5;
  DMFApplicationPolicyMonitor *screenTimeApplicationMonitor;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  id v11;
  id location;

  -[QLItemPresenterViewController screenTimePolicyBundleIdentifier](self, "screenTimePolicyBundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v4 = objc_alloc(MEMORY[0x24BE2C7C0]);
  v7 = MEMORY[0x24BDAC760];
  v8 = 3221225472;
  v9 = __68__QLItemPresenterViewController__setupScreenTimeApplicationHandling__block_invoke;
  v10 = &unk_24C725230;
  objc_copyWeak(&v11, &location);
  v5 = (DMFApplicationPolicyMonitor *)objc_msgSend(v4, "initWithPolicyChangeHandler:", &v7);
  screenTimeApplicationMonitor = self->_screenTimeApplicationMonitor;
  self->_screenTimeApplicationMonitor = v5;

  -[QLItemPresenterViewController _queryScreenTimePolicyForBundleIdentifier:](self, "_queryScreenTimePolicyForBundleIdentifier:", v3, v7, v8, v9, v10);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

void __68__QLItemPresenterViewController__setupScreenTimeApplicationHandling__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v2 = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v2, "screenTimePolicyBundleIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_queryScreenTimePolicyForBundleIdentifier:", v1);

}

- (void)_queryScreenTimePolicyForBundleIdentifier:(id)a3
{
  id v4;
  DMFApplicationPolicyMonitor *screenTimeApplicationMonitor;
  void *v6;
  _QWORD v7[4];
  id v8;
  id location;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_initWeak(&location, self);
  screenTimeApplicationMonitor = self->_screenTimeApplicationMonitor;
  v10[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __75__QLItemPresenterViewController__queryScreenTimePolicyForBundleIdentifier___block_invoke;
  v7[3] = &unk_24C725258;
  objc_copyWeak(&v8, &location);
  -[DMFApplicationPolicyMonitor requestPoliciesForBundleIdentifiers:completionHandler:](screenTimeApplicationMonitor, "requestPoliciesForBundleIdentifiers:completionHandler:", v6, v7);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

void __75__QLItemPresenterViewController__queryScreenTimePolicyForBundleIdentifier___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;

  v5 = a2;
  v6 = a3;
  objc_copyWeak(&v9, (id *)(a1 + 32));
  v7 = v5;
  v8 = v6;
  QLRunInMainThread();

  objc_destroyWeak(&v9);
}

void __75__QLItemPresenterViewController__queryScreenTimePolicyForBundleIdentifier___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_didReceiveNewScreenTimeApplicationPolicies:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)_queryScreenTimeCategoryPolicy
{
  DMFCategoryPolicyMonitor *screenTimeCategoryMonitor;
  void *v4;
  _QWORD v5[4];
  id v6;
  id location;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  objc_initWeak(&location, self);
  screenTimeCategoryMonitor = self->_screenTimeCategoryMonitor;
  v8[0] = *MEMORY[0x24BE15790];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __63__QLItemPresenterViewController__queryScreenTimeCategoryPolicy__block_invoke;
  v5[3] = &unk_24C725258;
  objc_copyWeak(&v6, &location);
  -[DMFCategoryPolicyMonitor requestPoliciesForCategoryIdentifiers:completionHandler:](screenTimeCategoryMonitor, "requestPoliciesForCategoryIdentifiers:completionHandler:", v4, v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __63__QLItemPresenterViewController__queryScreenTimeCategoryPolicy__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;

  v5 = a2;
  v6 = a3;
  objc_copyWeak(&v9, (id *)(a1 + 32));
  v7 = v5;
  v8 = v6;
  QLRunInMainThread();

  objc_destroyWeak(&v9);
}

void __63__QLItemPresenterViewController__queryScreenTimeCategoryPolicy__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_didReceiveNewScreenTimeCategoryPolicy:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)_didReceiveNewScreenTimeCategoryPolicy:(id)a3 error:(id)a4
{
  void *v6;
  id v7;

  v7 = a3;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  if (!a4)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x24BE15790]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[QLItemPresenterViewController _didReceiveNewScreenTimePolicy:](self, "_didReceiveNewScreenTimePolicy:", objc_msgSend(v6, "integerValue"));

  }
}

- (void)_didReceiveNewScreenTimeApplicationPolicies:(id)a3 error:(id)a4
{
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  if (!a4)
  {
    -[QLItemPresenterViewController screenTimePolicyBundleIdentifier](self, "screenTimePolicyBundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[QLItemPresenterViewController _didReceiveNewScreenTimePolicy:](self, "_didReceiveNewScreenTimePolicy:", objc_msgSend(v7, "integerValue"));
  }

}

- (void)_didReceiveNewScreenTimePolicy:(int64_t)a3
{
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  if (a3)
    -[QLItemPresenterViewController _showScreenTimeViewControllerWithPolicy:](self, "_showScreenTimeViewControllerWithPolicy:", a3);
  else
    -[QLItemPresenterViewController _hideScreenTimeViewControllerIfNeeded](self, "_hideScreenTimeViewControllerIfNeeded");
}

- (void)_showScreenTimeViewControllerWithPolicy:(int64_t)a3
{
  id v5;

  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  -[QLItemPresenterViewController screenTimeController](self, "screenTimeController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[QLItemPresenterViewController showPreviewViewController:](self, "showPreviewViewController:", v5);
  objc_msgSend(v5, "showBlockingViewControllerWithPolicy:", a3);

}

- (void)_hideScreenTimeViewControllerIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];

  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  -[QLItemAggregatedViewController currentPreviewViewController](self, "currentPreviewViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[QLItemPresenterViewController screenTimeController](self, "screenTimeController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 == v4)
  {
    -[QLItemPresenterViewController screenTimeController](self, "screenTimeController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __70__QLItemPresenterViewController__hideScreenTimeViewControllerIfNeeded__block_invoke;
    v6[3] = &unk_24C724B00;
    v6[4] = self;
    objc_msgSend(v5, "hideBlockingViewControllerWithCompletionHandler:", v6);

  }
}

void __70__QLItemPresenterViewController__hideScreenTimeViewControllerIfNeeded__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "showPreviewProviderViewController");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 1200);
  *(_QWORD *)(v2 + 1200) = 0;

}

- (QLScreenTimeItemViewController)screenTimeController
{
  QLScreenTimeItemViewController *screenTimeController;
  void *v4;
  _BOOL4 v5;
  QLScreenTimeItemViewController *v6;
  QLScreenTimeItemViewController *v7;
  QLScreenTimeItemViewController *v8;
  void *v9;
  QLScreenTimeItemViewController *v10;
  void *v11;
  QLScreenTimeItemViewController *v12;
  QLScreenTimeItemViewController *v13;
  NSObject **v14;
  NSObject *v15;
  QLScreenTimeItemViewController *v16;
  void *v17;
  int v19;
  QLItemPresenterViewController *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  screenTimeController = self->_screenTimeController;
  if (!screenTimeController)
  {
    -[QLItemPresenterViewController previewItem](self, "previewItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[QLItemPresenterViewController _shouldApplyScreenTimeMoviePolicyForItem:](self, "_shouldApplyScreenTimeMoviePolicyForItem:", v4);

    if (v5)
    {
      v6 = [QLScreenTimeItemViewController alloc];
      v7 = -[QLScreenTimeItemViewController initWithCategoryIdentifier:](v6, "initWithCategoryIdentifier:", *MEMORY[0x24BE15790]);
      v8 = self->_screenTimeController;
      self->_screenTimeController = v7;

    }
    else
    {
      -[QLItemPresenterViewController screenTimePolicyBundleIdentifier](self, "screenTimePolicyBundleIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        v10 = [QLScreenTimeItemViewController alloc];
        -[QLItemPresenterViewController screenTimePolicyBundleIdentifier](self, "screenTimePolicyBundleIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = -[QLScreenTimeItemViewController initWithBundleIdentifier:](v10, "initWithBundleIdentifier:", v11);
        v13 = self->_screenTimeController;
        self->_screenTimeController = v12;

      }
      else
      {
        v14 = (NSObject **)MEMORY[0x24BE7BF48];
        v15 = *MEMORY[0x24BE7BF48];
        if (!*MEMORY[0x24BE7BF48])
        {
          QLSInitLogging();
          v15 = *v14;
        }
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          v19 = 138412290;
          v20 = self;
          _os_log_impl(&dword_20D4F5000, v15, OS_LOG_TYPE_ERROR, "Cannot set up screen time preview controller: %@. #PreviewController", (uint8_t *)&v19, 0xCu);
        }
      }
    }
    v16 = self->_screenTimeController;
    -[QLItem createPreviewContext](self->_previewItem, "createPreviewContext");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[QLItemViewController loadPreviewControllerIfNeededWithContents:context:completionHandler:](v16, "loadPreviewControllerIfNeededWithContents:context:completionHandler:", 0, v17, 0);

    screenTimeController = self->_screenTimeController;
  }
  return screenTimeController;
}

- (id)screenTimePolicyBundleIdentifier
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  -[QLItemPresenterViewController previewItem](self, "previewItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "previewItemType");

  if (v4 == 12)
  {
    v5 = (void *)MEMORY[0x24BE7BED0];
    -[QLItemPresenterViewController previewItem](self, "previewItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "ql_applicationBundleIdentifierOfExtensionForItem:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = (void *)MEMORY[0x24BE7BFB8];
    -[QLItemPresenterViewController previewItem](self, "previewItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "previewItemContentType");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v8) = objc_msgSend(v8, "isIWorkDocumentType:", v10);

    if (!(_DWORD)v8)
    {
      v7 = 0;
      return v7;
    }
    v11 = (void *)MEMORY[0x24BE7BF08];
    -[QLItemPresenterViewController previewItem](self, "previewItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "previewItemContentType");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "screentimeiWorkBundleForUTI:", v12);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (BOOL)_shouldApplyScreenTimeMoviePolicyForItem:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  char v10;

  -[QLItemPresenterViewController previewItem](self, "previewItem", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "previewItemType") == 1)
  {
    v5 = (void *)MEMORY[0x24BDE5F18];
    -[QLItemPresenterViewController previewItem](self, "previewItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "previewItemContentType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v5, "isTypeAudioOnly:", v7) ^ 1;

  }
  else
  {
    LOBYTE(v8) = 0;
  }

  -[QLItemPresenterViewController hostApplicationBundleIdentifier](self, "hostApplicationBundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.DocumentsApp"));

  return v8 & v10;
}

- (BOOL)_processIsEntitledToCheckScreenTimePolicy
{
  if (_processIsEntitledToCheckScreenTimePolicy_onceToken != -1)
    dispatch_once(&_processIsEntitledToCheckScreenTimePolicy_onceToken, &__block_literal_global_1);
  return _processIsEntitledToCheckScreenTimePolicy_entitled;
}

BOOL __74__QLItemPresenterViewController__processIsEntitledToCheckScreenTimePolicy__block_invoke()
{
  _BOOL8 result;

  result = _QLGetBoolEntitlement(CFSTR("com.apple.private.dmd.policy"));
  _processIsEntitledToCheckScreenTimePolicy_entitled = result;
  return result;
}

- (BOOL)_processIsEntitledToConfigureScreenTime
{
  if (_processIsEntitledToConfigureScreenTime_onceToken != -1)
    dispatch_once(&_processIsEntitledToConfigureScreenTime_onceToken, &__block_literal_global_65);
  return _processIsEntitledToConfigureScreenTime_entitled;
}

BOOL __72__QLItemPresenterViewController__processIsEntitledToConfigureScreenTime__block_invoke()
{
  _BOOL8 result;

  result = _QLGetBoolEntitlement(CFSTR("com.apple.private.screen-time"));
  _processIsEntitledToConfigureScreenTime_entitled = result;
  return result;
}

- (void)setPreviewProvider:(id)a3
{
  objc_storeStrong((id *)&self->_previewProvider, a3);
}

- (void)setErrorViewController:(id)a3
{
  objc_storeStrong((id *)&self->_errorViewController, a3);
}

- (void)setLoadingViewController:(id)a3
{
  objc_storeStrong((id *)&self->_loadingViewController, a3);
}

- (void)setDownloadingController:(id)a3
{
  objc_storeStrong((id *)&self->_downloadingController, a3);
}

- (void)setScreenTimeController:(id)a3
{
  objc_storeStrong((id *)&self->_screenTimeController, a3);
}

- (id)loadingCompletionHandler
{
  return self->_loadingCompletionHandler;
}

- (void)setLoadingCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1208);
}

- (void)setPreviewItem:(id)a3
{
  objc_storeStrong((id *)&self->_previewItem, a3);
}

- (id)contents
{
  return objc_getProperty(self, a2, 1224, 1);
}

- (void)setContents:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1224);
}

- (QLPreviewContext)context
{
  return (QLPreviewContext *)objc_getProperty(self, a2, 1232, 1);
}

- (void)setContext:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1232);
}

- (BOOL)printing
{
  return self->_printing;
}

- (void)setPrinting:(BOOL)a3
{
  self->_printing = a3;
}

- (NSString)hostApplicationBundleIdentifier
{
  return self->_hostApplicationBundleIdentifier;
}

- (void)setHostApplicationBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1240);
}

- (NSString)parentApplicationDisplayIdentifier
{
  return self->_parentApplicationDisplayIdentifier;
}

- (void)setParentApplicationDisplayIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1248);
}

- (DMFApplicationPolicyMonitor)screenTimeApplicationMonitor
{
  return self->_screenTimeApplicationMonitor;
}

- (void)setScreenTimeApplicationMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_screenTimeApplicationMonitor, a3);
}

- (DMFCategoryPolicyMonitor)screenTimeCategoryMonitor
{
  return self->_screenTimeCategoryMonitor;
}

- (void)setScreenTimeCategoryMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_screenTimeCategoryMonitor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_screenTimeCategoryMonitor, 0);
  objc_storeStrong((id *)&self->_screenTimeApplicationMonitor, 0);
  objc_storeStrong((id *)&self->_parentApplicationDisplayIdentifier, 0);
  objc_storeStrong((id *)&self->_hostApplicationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong(&self->_contents, 0);
  objc_storeStrong((id *)&self->_previewItem, 0);
  objc_storeStrong(&self->_loadingCompletionHandler, 0);
  objc_storeStrong((id *)&self->_screenTimeController, 0);
  objc_storeStrong((id *)&self->_downloadingController, 0);
  objc_storeStrong((id *)&self->_loadingViewController, 0);
  objc_storeStrong((id *)&self->_errorViewController, 0);
  objc_storeStrong((id *)&self->_previewProvider, 0);
  objc_storeStrong((id *)&self->previewLoadingQueue, 0);
  objc_storeStrong(&self->_readyBlock, 0);
}

@end
