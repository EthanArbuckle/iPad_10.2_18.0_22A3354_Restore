@implementation NUANFArticleDataProvider

void __59__NUANFArticleDataProvider_loadContextWithCompletionBlock___block_invoke_19(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  CFTimeInterval v5;
  void (**v6)(_QWORD);
  void *v7;
  char v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20[2];
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  CFTimeInterval v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  NUArticleLoadLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "article");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "articleID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = CACurrentMediaTime() - *(double *)(a1 + 72);
    *(_DWORD *)buf = 138543618;
    v22 = v4;
    v23 = 2048;
    v24 = v5;
    _os_log_impl(&dword_216817000, v2, OS_LOG_TYPE_DEFAULT, "Article data loader start loading linked content, articleID=%{public}@, duration=%f", buf, 0x16u);

  }
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __59__NUANFArticleDataProvider_loadContextWithCompletionBlock___block_invoke_20;
  v18[3] = &unk_24D5A3808;
  objc_copyWeak(v20, (id *)(a1 + 64));
  v19 = *(id *)(a1 + 48);
  v20[1] = *(id *)(a1 + 72);
  v6 = (void (**)(_QWORD))MEMORY[0x2199FC190](v18);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "documentController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "requiresLinkedContentForLayout");

  if ((v8 & 1) == 0)
  {
    v6[2](v6);

    v6 = (void (**)(_QWORD))&__block_literal_global_23;
  }
  objc_msgSend(*(id *)(a1 + 32), "linkedContentManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  objc_msgSend(*(id *)(a1 + 32), "linkedContentManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "article");
  if ((v10 & 1) != 0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "headline");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "contextLoader");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "context");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (id)objc_msgSend(v11, "loadLinkedContentForHeadline:withContext:priority:completion:", v13, v15, objc_msgSend(*(id *)(a1 + 40), "relativePriority"), v6);
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "headline");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "contextLoader");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "context");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (id)objc_msgSend(v11, "loadLinkedContentForHeadline:withContext:completion:", v13, v15, v6);
  }

  objc_destroyWeak(v20);
}

- (void)loadArticleWithCompletionBlock:(id)a3
{
  void (**v4)(id, _QWORD);
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  void (**v10)(id, _QWORD);
  id v11;
  id location;

  v4 = (void (**)(id, _QWORD))a3;
  -[NUANFArticleDataProvider reloadArticleIfNeeded](self, "reloadArticleIfNeeded");
  -[NUANFArticleDataProvider contextLoader](self, "contextLoader");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5
    && (v6 = (void *)v5,
        -[NUANFArticleDataProvider fontLoader](self, "fontLoader"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        v7))
  {
    v4[2](v4, 0);
  }
  else
  {
    objc_initWeak(&location, self);
    -[NUANFArticleDataProvider article](self, "article");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __59__NUANFArticleDataProvider_loadArticleWithCompletionBlock___block_invoke;
    v9[3] = &unk_24D5A1B90;
    objc_copyWeak(&v11, &location);
    v10 = v4;
    objc_msgSend(v8, "performBlockWhenFullyLoaded:", v9);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }

}

void __59__NUANFArticleDataProvider_loadContextWithCompletionBlock___block_invoke_17(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  CFTimeInterval v5;
  int v6;
  void *v7;
  __int16 v8;
  CFTimeInterval v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  NUArticleLoadLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "article");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "articleID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = CACurrentMediaTime() - *(double *)(a1 + 48);
    v6 = 138543618;
    v7 = v4;
    v8 = 2048;
    v9 = v5;
    _os_log_impl(&dword_216817000, v2, OS_LOG_TYPE_DEFAULT, "Article data loader did finish loading fonts, articleID=%{public}@, duration=%f", (uint8_t *)&v6, 0x16u);

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __59__NUANFArticleDataProvider_loadContextWithCompletionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  CFTimeInterval v7;
  id WeakRetained;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  BOOL v15;
  NSObject *v16;
  void *v17;
  void *v18;
  CFTimeInterval v19;
  void *v20;
  void *v21;
  _BOOL4 v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  uint64_t v31;
  NSObject *v32;
  id v33;
  void *v34;
  NSObject *v35;
  id v36;
  void *v37;
  NSObject *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  _QWORD block[6];
  id v43;
  _BYTE *v44;
  id v45[2];
  _QWORD v46[5];
  NSObject *v47;
  uint64_t v48;
  _QWORD v49[5];
  NSObject *v50;
  uint64_t v51;
  _QWORD v52[5];
  NSObject *v53;
  _BYTE *v54;
  uint64_t v55;
  _QWORD v56[5];
  _BYTE buf[24];
  uint64_t (*v58)(uint64_t, uint64_t);
  void (*v59)(uint64_t);
  id v60;
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  NUArticleLoadLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "article");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "articleID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = CACurrentMediaTime() - *(double *)(a1 + 56);
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v6;
    *(_WORD *)&buf[12] = 2048;
    *(CFTimeInterval *)&buf[14] = v7;
    _os_log_impl(&dword_216817000, v4, OS_LOG_TYPE_DEFAULT, "Article data loader did finish loading model, articleID=%{public}@, duration=%f", buf, 0x16u);

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v9 = WeakRetained;
  if (WeakRetained)
  {
    v10 = WeakRetained;
    v11 = v10;
    if (v3)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }
    else
    {
      objc_msgSend(v10, "contextLoader");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v12, "hasLoaded")
        && (objc_msgSend(v11, "fontLoader"), (v13 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        objc_msgSend(v11, "embedDataManger");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v14 == 0;

        if (!v15)
        {
          NUArticleLoadLog();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v11, "article");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "articleID");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = CACurrentMediaTime() - *(double *)(a1 + 56);
            *(_DWORD *)buf = 138543618;
            *(_QWORD *)&buf[4] = v18;
            *(_WORD *)&buf[12] = 2048;
            *(CFTimeInterval *)&buf[14] = v19;
            _os_log_impl(&dword_216817000, v16, OS_LOG_TYPE_DEFAULT, "Article data loader did finish with prewarmed article, articleID=%{public}@, duration=%f", buf, 0x16u);

          }
          objc_msgSend(v11, "contextLoader");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "context");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = v21 == 0;

          if (v22)
          {
            v39 = *(_QWORD *)(a1 + 40);
            v40 = (void *)MEMORY[0x24BDD1540];
            objc_msgSend(v11, "article");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "contextLoader");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "contextError");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "nu_errorArticleDownloadFailed:underlyingError:", v26, v28);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v39 + 16))(v39, 0, 0, v41);

          }
          else
          {
            objc_msgSend(v11, "contextLoader");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "assetLoader");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "setAssetLoader:", v24);

            v25 = *(_QWORD *)(a1 + 40);
            objc_msgSend(v11, "contextLoader");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "context");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "fontLoader");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            (*(void (**)(uint64_t, void *, void *, _QWORD))(v25 + 16))(v25, v27, v28, 0);
          }

          v56[0] = MEMORY[0x24BDAC760];
          v56[1] = 3221225472;
          v56[2] = __59__NUANFArticleDataProvider_loadContextWithCompletionBlock___block_invoke_13;
          v56[3] = &unk_24D5A1D88;
          v56[4] = v11;
          dispatch_async(MEMORY[0x24BDAC9B8], v56);
          goto LABEL_16;
        }
      }
      else
      {

      }
      v29 = dispatch_group_create();
      dispatch_group_enter(v29);
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v58 = __Block_byref_object_copy__1;
      v59 = __Block_byref_object_dispose__1;
      v60 = 0;
      objc_msgSend(v11, "contextLoader");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = MEMORY[0x24BDAC760];
      v52[0] = MEMORY[0x24BDAC760];
      v52[1] = 3221225472;
      v52[2] = __59__NUANFArticleDataProvider_loadContextWithCompletionBlock___block_invoke_14;
      v52[3] = &unk_24D5A37B8;
      v52[4] = v11;
      v32 = v29;
      v55 = *(_QWORD *)(a1 + 56);
      v53 = v32;
      v54 = buf;
      v33 = (id)objc_msgSend(v30, "loadContextWithCompletion:", v52);

      dispatch_group_enter(v32);
      objc_msgSend(v11, "fontLoader");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v49[0] = v31;
      v49[1] = 3221225472;
      v49[2] = __59__NUANFArticleDataProvider_loadContextWithCompletionBlock___block_invoke_17;
      v49[3] = &unk_24D5A37E0;
      v49[4] = v11;
      v51 = *(_QWORD *)(a1 + 56);
      v35 = v32;
      v50 = v35;
      v36 = (id)objc_msgSend(v34, "loadFontsWithCompletion:", v49);

      dispatch_group_enter(v35);
      objc_msgSend(v11, "embedDataManger");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v46[0] = v31;
      v46[1] = 3221225472;
      v46[2] = __59__NUANFArticleDataProvider_loadContextWithCompletionBlock___block_invoke_18;
      v46[3] = &unk_24D5A37E0;
      v46[4] = v11;
      v48 = *(_QWORD *)(a1 + 56);
      v38 = v35;
      v47 = v38;
      objc_msgSend(v37, "loadEmbedDataWithCompletion:", v46);

      block[0] = v31;
      block[1] = 3221225472;
      block[2] = __59__NUANFArticleDataProvider_loadContextWithCompletionBlock___block_invoke_19;
      block[3] = &unk_24D5A3850;
      block[4] = v11;
      v45[1] = *(id *)(a1 + 56);
      objc_copyWeak(v45, (id *)(a1 + 48));
      v43 = *(id *)(a1 + 40);
      v44 = buf;
      block[5] = *(_QWORD *)(a1 + 32);
      dispatch_group_notify(v38, MEMORY[0x24BDAC9B8], block);

      objc_destroyWeak(v45);
      _Block_object_dispose(buf, 8);

    }
LABEL_16:

    goto LABEL_17;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
LABEL_17:

}

- (NUANFContextLoader)contextLoader
{
  return self->_contextLoader;
}

- (FCArticle)article
{
  return self->_article;
}

- (NULinkedContentManager)linkedContentManager
{
  return self->_linkedContentManager;
}

void __59__NUANFArticleDataProvider_loadContextWithCompletionBlock___block_invoke_20(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  CFTimeInterval v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  __int16 v23;
  CFTimeInterval v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = WeakRetained;
    NUArticleLoadLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "article");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "articleID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = CACurrentMediaTime() - *(double *)(a1 + 48);
      v21 = 138543618;
      v22 = v7;
      v23 = 2048;
      v24 = v8;
      _os_log_impl(&dword_216817000, v5, OS_LOG_TYPE_DEFAULT, "Article data loader did finish, articleID=%{public}@, duration=%f", (uint8_t *)&v21, 0x16u);

    }
    objc_msgSend(v4, "contextLoader");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "context");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v4, "contextLoader");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "assetLoader");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setAssetLoader:", v12);

      v13 = *(_QWORD *)(a1 + 32);
      objc_msgSend(v4, "contextLoader");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "context");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "fontLoader");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *, void *, _QWORD))(v13 + 16))(v13, v15, v16, 0);
    }
    else
    {
      v17 = *(_QWORD *)(a1 + 32);
      v18 = (void *)MEMORY[0x24BDD1540];
      objc_msgSend(v4, "article");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "contextLoader");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "contextError");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "nu_errorArticleDownloadFailed:underlyingError:", v14, v16);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v17 + 16))(v17, 0, 0, v19);

    }
    objc_msgSend(v4, "eventManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "fireEvent:", CFSTR("contextDidLoadEvent"));

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __59__NUANFArticleDataProvider_loadArticleWithCompletionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NUArticleResourceURLTranslator *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NUANFContextLoader *v22;
  uint64_t v23;
  void *v24;
  NUANFFontLoader *v25;
  void *v26;
  void *v27;
  void *v28;
  NUANFFontLoader *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  NUANFContextLoader *v38;
  void *v39;
  NUArticleResourceURLTranslator *v40;
  void *v41;
  void *v42;
  id v43;

  v43 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    v8 = WeakRetained;
    if (v5)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    }
    else
    {
      objc_msgSend(v43, "headline");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        objc_msgSend(v43, "headline");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "contentType");

        if (v11 == 2)
        {
          objc_msgSend(v43, "headline");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "contentContext");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "contentWithContext:", v13);
          v41 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v41, "anfContent");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = [NUArticleResourceURLTranslator alloc];
          objc_msgSend(v8, "contentContext");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "appConfigurationManager");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = -[NUArticleResourceURLTranslator initWithAppConfigurationManager:](v14, "initWithAppConfigurationManager:", v16);

          v38 = [NUANFContextLoader alloc];
          objc_msgSend(v8, "contentContext");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "flintResourceManager");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "contentContext");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "networkReachability");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "host");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "headline");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = -[NUANFContextLoader initWithANFContent:flintResourceManager:networkReachability:host:resourceURLTranslator:headline:](v38, "initWithANFContent:flintResourceManager:networkReachability:host:resourceURLTranslator:headline:", v42, v17, v19, v20, v40, v21);
          objc_msgSend(v8, "setContextLoader:", v22);

          v23 = objc_msgSend(v8, "relativePriority");
          objc_msgSend(v8, "contextLoader");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "setRelativePriority:", v23);

          v25 = [NUANFFontLoader alloc];
          objc_msgSend(v8, "contentContext");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "flintResourceManager");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "fontRegistration");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = -[NUANFFontLoader initWithANFContent:flintResourceManager:fontRegistration:](v25, "initWithANFContent:flintResourceManager:fontRegistration:", v42, v27, v28);
          objc_msgSend(v8, "setFontLoader:", v29);

          v30 = objc_msgSend(v8, "relativePriority");
          objc_msgSend(v8, "fontLoader");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "setRelativePriority:", v30);

          (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
        }
        else
        {
          v34 = *(_QWORD *)(a1 + 32);
          v35 = (void *)MEMORY[0x24BDD1540];
          objc_msgSend(v43, "headline");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "nu_errorArticleContentTypeUnsupported:", v36);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          (*(void (**)(uint64_t, void *))(v34 + 16))(v34, v37);

        }
      }
      else
      {
        v32 = *(_QWORD *)(a1 + 32);
        objc_msgSend(MEMORY[0x24BDD1540], "nu_errorArticleMissingHeadline:", v43);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, void *))(v32 + 16))(v32, v33);

      }
    }

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

- (FCContentContext)contentContext
{
  return self->_contentContext;
}

- (int64_t)relativePriority
{
  return self->_relativePriority;
}

- (NUANFFontLoader)fontLoader
{
  return self->_fontLoader;
}

- (void)setupAssetPrefetchRequestEventsWithEvents:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id location;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BE6CF58]);
  -[NUANFArticleDataProvider setEventManager:](self, "setEventManager:", v5);

  objc_initWeak(&location, self);
  -[NUANFArticleDataProvider eventManager](self, "eventManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __70__NUANFArticleDataProvider_setupAssetPrefetchRequestEventsWithEvents___block_invoke;
  v7[3] = &unk_24D5A2B30;
  objc_copyWeak(&v8, &location);
  objc_msgSend(v6, "triggerOnceWhenAllEventsHaveOccurred:block:", v4, v7);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

- (NFEventManager)eventManager
{
  return self->_eventManager;
}

- (void)setFontLoader:(id)a3
{
  objc_storeStrong((id *)&self->_fontLoader, a3);
}

- (void)setEventManager:(id)a3
{
  objc_storeStrong((id *)&self->_eventManager, a3);
}

- (void)setContextLoader:(id)a3
{
  objc_storeStrong((id *)&self->_contextLoader, a3);
}

- (void)setAssetLoader:(id)a3
{
  objc_storeStrong((id *)&self->_assetLoader, a3);
}

- (void)reloadArticleIfNeeded
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  double v10;
  double v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[6];
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  -[NUANFArticleDataProvider article](self, "article");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "headline");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = v4;
    if (objc_msgSend(v5, "needsRapidUpdates"))
    {
      -[NUANFArticleDataProvider contentContext](self, "contentContext");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "networkReachability");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "isNetworkReachable");

      if ((v8 & 1) != 0)
      {
        objc_msgSend(v5, "lastFetchedDate");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "fc_timeIntervalUntilNow");
        v11 = v10;

        if (v11 > 30.0)
        {
          NUArticleLoadLog();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            -[NUANFArticleDataProvider article](self, "article");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "articleID");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v21 = v14;
            _os_log_impl(&dword_216817000, v12, OS_LOG_TYPE_DEFAULT, "Article data loader did reset for rapid updates, articleID=%{public}@", buf, 0xCu);

          }
          -[NUANFArticleDataProvider setContextLoader:](self, "setContextLoader:", 0);
          -[NUANFArticleDataProvider setFontLoader:](self, "setFontLoader:", 0);
          -[NUANFArticleDataProvider contentContext](self, "contentContext");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "articleController");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[NUANFArticleDataProvider articleID](self, "articleID");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[NUANFArticleDataProvider relativePriority](self, "relativePriority");
          objc_msgSend(v16, "articleWithID:forceArticleUpdate:qualityOfService:relativePriority:", v17, 1, FCInferQualityOfServiceFromRelativePriority(), -[NUANFArticleDataProvider relativePriority](self, "relativePriority"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[NUANFArticleDataProvider setArticle:](self, "setArticle:", v18);

        }
        else
        {
          v19[0] = MEMORY[0x24BDAC760];
          v19[1] = 3221225472;
          v19[2] = __49__NUANFArticleDataProvider_reloadArticleIfNeeded__block_invoke_38;
          v19[3] = &unk_24D5A1D30;
          v19[4] = v5;
          v19[5] = self;
          __49__NUANFArticleDataProvider_reloadArticleIfNeeded__block_invoke_38((uint64_t)v19);
        }
      }
      else
      {
        __49__NUANFArticleDataProvider_reloadArticleIfNeeded__block_invoke_3();
      }
    }

  }
}

- (SXHost)host
{
  return self->_host;
}

- (NUFontRegistration)fontRegistration
{
  return self->_fontRegistration;
}

- (NUEmbedDataManager)embedDataManger
{
  return self->_embedDataManger;
}

- (void)loadContextWithCompletionBlock:(id)a3
{
  id v4;
  CFTimeInterval v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12[2];
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = CACurrentMediaTime();
  NUArticleLoadLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    -[NUANFArticleDataProvider article](self, "article");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "articleID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v14 = v8;
    _os_log_impl(&dword_216817000, v6, OS_LOG_TYPE_DEFAULT, "Article data loader did start loading, articleID=%{public}@", buf, 0xCu);

  }
  objc_initWeak((id *)buf, self);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __59__NUANFArticleDataProvider_loadContextWithCompletionBlock___block_invoke;
  v10[3] = &unk_24D5A3878;
  v10[4] = self;
  v12[1] = *(id *)&v5;
  objc_copyWeak(v12, (id *)buf);
  v9 = v4;
  v11 = v9;
  -[NUANFArticleDataProvider loadArticleWithCompletionBlock:](self, "loadArticleWithCompletionBlock:", v10);

  objc_destroyWeak(v12);
  objc_destroyWeak((id *)buf);

}

- (NUANFArticleDataProvider)initWithArticle:(id)a3 contentContext:(id)a4 fontRegistration:(id)a5 host:(id)a6 embedDataManager:(id)a7 linkedContentManager:(id)a8
{
  id v15;
  id v16;
  id v17;
  NUANFArticleDataProvider *v18;
  NUANFArticleDataProvider *v19;
  uint64_t v20;
  NSArray *linkedContentProviders;
  void *v22;
  void *v23;
  void *v24;
  id v26;
  id v27;
  id v28;
  objc_super v29;
  _QWORD v30[3];

  v30[2] = *MEMORY[0x24BDAC8D0];
  v28 = a3;
  v27 = a4;
  v26 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v29.receiver = self;
  v29.super_class = (Class)NUANFArticleDataProvider;
  v18 = -[NUANFArticleDataProvider init](&v29, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_article, a3);
    objc_storeStrong((id *)&v19->_contentContext, a4);
    objc_storeStrong((id *)&v19->_fontRegistration, a5);
    objc_storeStrong((id *)&v19->_host, a6);
    objc_storeStrong((id *)&v19->_embedDataManger, a7);
    objc_storeStrong((id *)&v19->_linkedContentManager, a8);
    objc_msgSend(v17, "linkedContentProviders", v26, v27, v28);
    v20 = objc_claimAutoreleasedReturnValue();
    linkedContentProviders = v19->_linkedContentProviders;
    v19->_linkedContentProviders = (NSArray *)v20;

    v19->_relativePriority = 0;
    v22 = (void *)MEMORY[0x24BDBCF20];
    v30[0] = CFSTR("contextDidLoadEvent");
    v30[1] = CFSTR("assetPrefetchRequestEvent");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v30, 2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setWithArray:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[NUANFArticleDataProvider setupAssetPrefetchRequestEventsWithEvents:](v19, "setupAssetPrefetchRequestEventsWithEvents:", v24);

  }
  return v19;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[NUANFArticleDataProvider fontLoader](self, "fontLoader");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unregisterFontsWithCompletion:", &__block_literal_global_13);

  v4.receiver = self;
  v4.super_class = (Class)NUANFArticleDataProvider;
  -[NUANFArticleDataProvider dealloc](&v4, sel_dealloc);
}

- (NSString)articleID
{
  void *v2;
  void *v3;

  -[NUANFArticleDataProvider article](self, "article");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "articleID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

void __59__NUANFArticleDataProvider_loadContextWithCompletionBlock___block_invoke_13(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "eventManager");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "fireEvent:", CFSTR("contextDidLoadEvent"));

}

void __59__NUANFArticleDataProvider_loadContextWithCompletionBlock___block_invoke_14(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  CFTimeInterval v13;
  uint64_t v14;
  _QWORD v15[7];
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  CFTimeInterval v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    NUArticleLoadLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "article");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "articleID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = CACurrentMediaTime() - *(double *)(a1 + 56);
      *(_DWORD *)buf = 138543618;
      v17 = v12;
      v18 = 2048;
      v19 = v13;
      _os_log_impl(&dword_216817000, v10, OS_LOG_TYPE_DEFAULT, "Article data loader did finish loading context, articleID=%{public}@, duration=%f", buf, 0x16u);

    }
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  }
  else
  {
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __59__NUANFArticleDataProvider_loadContextWithCompletionBlock___block_invoke_2_15;
    v15[3] = &unk_24D5A3790;
    v14 = *(_QWORD *)(a1 + 40);
    v15[4] = *(_QWORD *)(a1 + 32);
    v15[5] = v8;
    v15[6] = v14;
    __59__NUANFArticleDataProvider_loadContextWithCompletionBlock___block_invoke_2_15((uint64_t)v15);
  }

}

void __59__NUANFArticleDataProvider_loadContextWithCompletionBlock___block_invoke_2_15(uint64_t a1)
{
  NSObject *v2;

  NUArticleLoadLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __59__NUANFArticleDataProvider_loadContextWithCompletionBlock___block_invoke_2_15_cold_1(a1, v2);

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __59__NUANFArticleDataProvider_loadContextWithCompletionBlock___block_invoke_18(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  CFTimeInterval v5;
  int v6;
  void *v7;
  __int16 v8;
  CFTimeInterval v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  NUArticleLoadLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "article");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "articleID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = CACurrentMediaTime() - *(double *)(a1 + 48);
    v6 = 138543618;
    v7 = v4;
    v8 = 2048;
    v9 = v5;
    _os_log_impl(&dword_216817000, v2, OS_LOG_TYPE_DEFAULT, "Article data loader did finish embed data, articleID=%{public}@, duration=%f", (uint8_t *)&v6, 0x16u);

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

- (void)prefetchAssets
{
  void *v3;
  char v4;
  void *v5;
  char v6;
  id v7;

  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isLowPowerModeEnabled");

  if ((v4 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BE6CC58], "sharedNetworkReachability");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isLowDataModeEnabled");

    if ((v6 & 1) == 0)
    {
      -[NUANFArticleDataProvider eventManager](self, "eventManager");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "fireEvent:", CFSTR("assetPrefetchRequestEvent"));

    }
  }
}

- (void)cancelAssetPrefetch
{
  id v2;

  -[NUANFArticleDataProvider eventManager](self, "eventManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fireEvent:", CFSTR("assetPrefetchCancelEvent"));

}

- (void)setRelativePriority:(int64_t)a3
{
  void *v5;
  id v6;

  self->_relativePriority = a3;
  -[NUANFArticleDataProvider contextLoader](self, "contextLoader");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRelativePriority:", a3);

  -[NUANFArticleDataProvider fontLoader](self, "fontLoader");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setRelativePriority:", a3);

}

void __49__NUANFArticleDataProvider_reloadArticleIfNeeded__block_invoke_3()
{
  NSObject *v0;
  uint8_t v1[16];

  NUArticleLoadLog();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_216817000, v0, OS_LOG_TYPE_DEFAULT, "Article data loader did not reload rapid-updates because network is not reachable", v1, 2u);
  }

}

void __49__NUANFArticleDataProvider_reloadArticleIfNeeded__block_invoke_38(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  NUArticleLoadLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "lastFetchedDate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "article");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "articleID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138543618;
    v7 = v3;
    v8 = 2114;
    v9 = v5;
    _os_log_impl(&dword_216817000, v2, OS_LOG_TYPE_DEFAULT, "Article data loader will not reload rapid-updates article because it's up-to-date, fetchDate=%{public}@, articleID=%{public}@", (uint8_t *)&v6, 0x16u);

  }
}

void __70__NUANFArticleDataProvider_setupAssetPrefetchRequestEventsWithEvents___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[5];
  __int128 buf;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = WeakRetained;
    NUArticleLoadLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v3, "article");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "articleID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v6;
      _os_log_impl(&dword_216817000, v4, OS_LOG_TYPE_DEFAULT, "Article data loader will prefetch assets, articleID=%{public}@", (uint8_t *)&buf, 0xCu);

    }
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v12 = 0x3032000000;
    v13 = __Block_byref_object_copy__1;
    v14 = __Block_byref_object_dispose__1;
    v15 = 0;
    objc_msgSend(v3, "assetLoader");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __70__NUANFArticleDataProvider_setupAssetPrefetchRequestEventsWithEvents___block_invoke_41;
    v10[3] = &unk_24D5A2C20;
    v10[4] = &buf;
    objc_msgSend(v7, "loadAssetsWithCompletion:", v10);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(void **)(*((_QWORD *)&buf + 1) + 40);
    *(_QWORD *)(*((_QWORD *)&buf + 1) + 40) = v8;

    objc_msgSend(v3, "setupAssetPrefetchCancellationWithOperation:", *(_QWORD *)(*((_QWORD *)&buf + 1) + 40));
    _Block_object_dispose(&buf, 8);

  }
}

void __70__NUANFArticleDataProvider_setupAssetPrefetchRequestEventsWithEvents___block_invoke_41(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v2 = *(void **)(v1 + 40);
  *(_QWORD *)(v1 + 40) = 0;

}

- (void)setupAssetPrefetchCancellationWithOperation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id from;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  objc_initWeak(&from, v4);
  -[NUANFArticleDataProvider eventManager](self, "eventManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("assetPrefetchCancelEvent"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __72__NUANFArticleDataProvider_setupAssetPrefetchCancellationWithOperation___block_invoke;
  v7[3] = &unk_24D5A38A0;
  objc_copyWeak(&v8, &from);
  objc_copyWeak(&v9, &location);
  objc_msgSend(v5, "triggerOnceWhenAllEventsHaveOccurred:block:", v6, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

}

void __72__NUANFArticleDataProvider_setupAssetPrefetchCancellationWithOperation___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "cancel");
    v4 = objc_loadWeakRetained((id *)(a1 + 40));
    v5 = v4;
    if (v4)
    {
      v6 = v4;
      NUArticleLoadLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v6, "article");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "articleID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = 138543362;
        v12 = v9;
        _os_log_impl(&dword_216817000, v7, OS_LOG_TYPE_DEFAULT, "Article data loader will cancel asset prefetch, articleID=%{public}@", (uint8_t *)&v11, 0xCu);

      }
      objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("assetPrefetchRequestEvent"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setupAssetPrefetchRequestEventsWithEvents:", v10);

    }
  }

}

- (void)setArticle:(id)a3
{
  objc_storeStrong((id *)&self->_article, a3);
}

- (NSArray)linkedContentProviders
{
  return self->_linkedContentProviders;
}

- (void)setArticleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NUANFAssetLoader)assetLoader
{
  return self->_assetLoader;
}

- (void)setEmbedDataManger:(id)a3
{
  objc_storeStrong((id *)&self->_embedDataManger, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkedContentManager, 0);
  objc_storeStrong((id *)&self->_eventManager, 0);
  objc_storeStrong((id *)&self->_embedDataManger, 0);
  objc_storeStrong((id *)&self->_assetLoader, 0);
  objc_storeStrong((id *)&self->_contextLoader, 0);
  objc_storeStrong((id *)&self->_fontLoader, 0);
  objc_storeStrong((id *)&self->_host, 0);
  objc_storeStrong((id *)&self->_fontRegistration, 0);
  objc_storeStrong((id *)&self->_contentContext, 0);
  objc_storeStrong((id *)&self->_articleID, 0);
  objc_storeStrong((id *)&self->_linkedContentProviders, 0);
  objc_storeStrong((id *)&self->_article, 0);
}

void __59__NUANFArticleDataProvider_loadContextWithCompletionBlock___block_invoke_2_15_cold_1(uint64_t a1, NSObject *a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "article");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "articleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 40);
  v7 = 138543618;
  v8 = v5;
  v9 = 2114;
  v10 = v6;
  _os_log_error_impl(&dword_216817000, a2, OS_LOG_TYPE_ERROR, "Article data loader did fail loading context, articleID=%{public}@, error=%{public}@", (uint8_t *)&v7, 0x16u);

}

@end
