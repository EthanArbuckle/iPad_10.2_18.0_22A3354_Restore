@implementation NUArticlePage

- (NUArticlePage)initWithArticle:(id)a3 articleHostViewControllerFactory:(id)a4 articleActivityFactory:(id)a5 pageNextAction:(unint64_t)a6
{
  id v11;
  id v12;
  id v13;
  NUArticlePage *v14;
  NUArticlePage *v15;
  uint64_t v16;
  FCAsyncOnceOperation *asyncOnceOperation;
  objc_super v19;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v19.receiver = self;
  v19.super_class = (Class)NUArticlePage;
  v14 = -[NUArticlePage init](&v19, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_article, a3);
    objc_storeStrong((id *)&v15->_articleHostViewControllerFactory, a4);
    v15->_pageNextAction = a6;
    v16 = objc_msgSend(objc_alloc(MEMORY[0x24BE6CAD8]), "initWithTarget:selector:", v15, sel_asyncOnceLoadPageStyle_);
    asyncOnceOperation = v15->_asyncOnceOperation;
    v15->_asyncOnceOperation = (FCAsyncOnceOperation *)v16;

    objc_storeStrong((id *)&v15->_articleActivityFactory, a5);
  }

  return v15;
}

- (NSString)identifier
{
  void *v2;
  void *v3;

  -[NUArticlePage article](self, "article");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "articleID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)viewController
{
  void *v3;

  -[NUArticlePage articleViewController](self, "articleViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    -[NUArticlePage prepare](self, "prepare");
  return -[NUArticlePage articleViewController](self, "articleViewController");
}

- (void)prepare
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[NUArticlePage articleViewController](self, "articleViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[NUArticlePage articleHostViewControllerFactory](self, "articleHostViewControllerFactory");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[NUArticlePage article](self, "article");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "createArticleHostViewControllerForArticle:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NUArticlePage setArticleViewController:](self, "setArticleViewController:", v6);

  }
  -[NUArticlePage pageStyle](self, "pageStyle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    -[NUArticlePage pageStyling:](self, "pageStyling:", 0);
}

- (void)unprepare
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[NUArticlePage articleViewController](self, "articleViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "parentViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    -[NUArticlePage setArticleViewController:](self, "setArticleViewController:", 0);
  -[NUArticlePage asyncOnceCancelHandler](self, "asyncOnceCancelHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cancel");

  -[NUArticlePage pageStyle](self, "pageStyle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BE6CAD8]), "initWithTarget:selector:", self, sel_asyncOnceLoadPageStyle_);
    -[NUArticlePage setAsyncOnceOperation:](self, "setAsyncOnceOperation:", v7);

  }
}

- (BOOL)allowNeighboringAdvertising
{
  return 1;
}

- (void)pageStyling:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  void (**v10)(id, void *);
  id v11;
  id location;

  v4 = (void (**)(id, void *))a3;
  -[NUArticlePage pageStyle](self, "pageStyle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if (v4)
    {
      -[NUArticlePage pageStyle](self, "pageStyle");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v4[2](v4, v6);

    }
  }
  else
  {
    objc_initWeak(&location, self);
    -[NUArticlePage asyncOnceOperation](self, "asyncOnceOperation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __29__NUArticlePage_pageStyling___block_invoke;
    v9[3] = &unk_24D5A1B68;
    v10 = v4;
    objc_copyWeak(&v11, &location);
    objc_msgSend(v7, "executeWithCompletionHandler:", v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NUArticlePage setAsyncOnceCancelHandler:](self, "setAsyncOnceCancelHandler:", v8);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }

}

void __29__NUArticlePage_pageStyling___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id WeakRetained;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "pageStyle");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v2);

  }
}

- (void)activityProvider:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  void *v6;
  FCArticle *article;
  _QWORD v8[4];
  void (**v9)(id, void *);
  id v10;
  id location;

  v4 = (void (**)(id, void *))a3;
  -[NUArticlePage activityProvider](self, "activityProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[NUArticlePage activityProvider](self, "activityProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v6);

  }
  else
  {
    objc_initWeak(&location, self);
    article = self->_article;
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __34__NUArticlePage_activityProvider___block_invoke;
    v8[3] = &unk_24D5A1B90;
    objc_copyWeak(&v10, &location);
    v9 = v4;
    -[FCArticle performBlockWhenFullyLoaded:](article, "performBlockWhenFullyLoaded:", v8);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }

}

void __34__NUArticlePage_activityProvider___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id WeakRetained;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "articleActivityFactory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "headline");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "activityProviderForHeadline:reportConcernViewPresenter:URLModifier:", v6, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "setActivityProvider:", v7);

  v8 = *(_QWORD *)(a1 + 32);
  objc_msgSend(WeakRetained, "activityProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);

}

- (id)asyncOnceLoadPageStyle:(id)a3
{
  id v4;
  NUArticlePageStyleOperation *v5;
  void *v6;
  unint64_t v7;
  id v8;
  NUArticlePageStyleOperation *v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  id v14;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = [NUArticlePageStyleOperation alloc];
  -[NUArticlePage article](self, "article");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[NUArticlePage pageNextAction](self, "pageNextAction");
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __40__NUArticlePage_asyncOnceLoadPageStyle___block_invoke;
  v12[3] = &unk_24D5A1BE0;
  objc_copyWeak(&v14, &location);
  v8 = v4;
  v13 = v8;
  v9 = -[NUArticlePageStyleOperation initWithArticle:pageNextAction:completion:](v5, "initWithArticle:pageNextAction:completion:", v6, v7, v12);

  objc_msgSend(MEMORY[0x24BDD1710], "fc_sharedConcurrentQueue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addOperation:", v9);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

  return v9;
}

void __40__NUArticlePage_asyncOnceLoadPageStyle___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD block[4];
  id v6;
  id v7;
  id v8;

  v3 = a2;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __40__NUArticlePage_asyncOnceLoadPageStyle___block_invoke_2;
  block[3] = &unk_24D5A1BB8;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  v6 = v3;
  v7 = *(id *)(a1 + 32);
  v4 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(&v8);
}

uint64_t __40__NUArticlePage_asyncOnceLoadPageStyle___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;

  v2 = *(_QWORD *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "setPageStyle:", v2);

  return (*(uint64_t (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32) != 0);
}

- (FCArticle)article
{
  return self->_article;
}

- (NUArticleHostViewControllerFactory)articleHostViewControllerFactory
{
  return self->_articleHostViewControllerFactory;
}

- (NUArticleActivityFactory)articleActivityFactory
{
  return self->_articleActivityFactory;
}

- (NUPageStyle)pageStyle
{
  return self->_pageStyle;
}

- (void)setPageStyle:(id)a3
{
  objc_storeStrong((id *)&self->_pageStyle, a3);
}

- (NUActivityProvider)activityProvider
{
  return self->_activityProvider;
}

- (void)setActivityProvider:(id)a3
{
  objc_storeStrong((id *)&self->_activityProvider, a3);
}

- (FCAsyncOnceOperation)asyncOnceOperation
{
  return self->_asyncOnceOperation;
}

- (void)setAsyncOnceOperation:(id)a3
{
  objc_storeStrong((id *)&self->_asyncOnceOperation, a3);
}

- (FCOperationCanceling)asyncOnceCancelHandler
{
  return self->_asyncOnceCancelHandler;
}

- (void)setAsyncOnceCancelHandler:(id)a3
{
  objc_storeStrong((id *)&self->_asyncOnceCancelHandler, a3);
}

- (NUPageable)articleViewController
{
  return self->_articleViewController;
}

- (void)setArticleViewController:(id)a3
{
  objc_storeStrong((id *)&self->_articleViewController, a3);
}

- (unint64_t)pageNextAction
{
  return self->_pageNextAction;
}

- (void)setPageNextAction:(unint64_t)a3
{
  self->_pageNextAction = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_articleViewController, 0);
  objc_storeStrong((id *)&self->_asyncOnceCancelHandler, 0);
  objc_storeStrong((id *)&self->_asyncOnceOperation, 0);
  objc_storeStrong((id *)&self->_activityProvider, 0);
  objc_storeStrong((id *)&self->_pageStyle, 0);
  objc_storeStrong((id *)&self->_articleActivityFactory, 0);
  objc_storeStrong((id *)&self->_articleHostViewControllerFactory, 0);
  objc_storeStrong((id *)&self->_article, 0);
}

@end
