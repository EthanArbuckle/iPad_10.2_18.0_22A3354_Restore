@implementation NUArticlePageStyleOperation

- (NUArticlePageStyleOperation)initWithArticle:(id)a3 pageNextAction:(unint64_t)a4 completion:(id)a5
{
  id v9;
  id v10;
  NUArticlePageStyleOperation *v11;
  NUArticlePageStyleOperation *v12;
  uint64_t v13;
  id completion;
  objc_super v16;

  v9 = a3;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)NUArticlePageStyleOperation;
  v11 = -[FCOperation init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_article, a3);
    v12->_pageNextAction = a4;
    v13 = MEMORY[0x2199FC190](v10);
    completion = v12->_completion;
    v12->_completion = (id)v13;

  }
  return v12;
}

- (BOOL)validateOperation
{
  void *v2;
  BOOL v3;

  -[NUArticlePageStyleOperation article](self, "article");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)performOperation
{
  void *v3;
  _QWORD v4[5];

  -[NUArticlePageStyleOperation article](self, "article");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __47__NUArticlePageStyleOperation_performOperation__block_invoke;
  v4[3] = &unk_24D5A3F78;
  v4[4] = self;
  objc_msgSend(v3, "performBlockWhenFullyLoaded:", v4);

}

void __47__NUArticlePageStyleOperation_performOperation__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  id v15;

  v3 = a2;
  objc_msgSend(v3, "headline");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v3, "headline");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sourceChannel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "theme");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "nameImageAssetHandle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __47__NUArticlePageStyleOperation_performOperation__block_invoke_2;
    v12[3] = &unk_24D5A3790;
    v9 = *(_QWORD *)(a1 + 32);
    v13 = v8;
    v14 = v9;
    v15 = v3;
    v10 = v8;
    v11 = (id)objc_msgSend(v10, "downloadIfNeededWithCompletion:", v12);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "operationDidFinishWithError:", 0);
  }

}

void __47__NUArticlePageStyleOperation_performOperation__block_invoke_2(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  NUPageStyle *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  id v15;
  id v16;

  objc_msgSend(a1[4], "filePath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v3 = (void *)MEMORY[0x24BDF6AC8];
    objc_msgSend(a1[4], "filePath");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "imageWithContentsOfFile:", v4);
    v16 = (id)objc_claimAutoreleasedReturnValue();

    v5 = objc_alloc_init(NUPageStyle);
    objc_msgSend(a1[5], "setPageStyle:", v5);

    objc_msgSend(a1[5], "pageStyle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTitleImage:", v16);

    objc_msgSend(a1[6], "headline");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sourceName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[5], "pageStyle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTitle:", v8);

    NUBundle();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("Next Story"), &stru_24D5A3F98, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[5], "pageStyle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setNextButtonTitle:", v11);

    v13 = a1[5];
    v14 = 0;
  }
  else
  {
    v15 = a1[5];
    objc_msgSend(a1[4], "downloadError");
    v14 = objc_claimAutoreleasedReturnValue();
    v13 = v15;
    v16 = (id)v14;
  }
  objc_msgSend(v13, "operationDidFinishWithError:", v14);

}

- (void)operationDidFinishWithError:(id)a3
{
  id v4;
  void *v5;
  void (**v6)(id, void *, id);

  v4 = a3;
  -[NUArticlePageStyleOperation completion](self, "completion");
  v6 = (void (**)(id, void *, id))objc_claimAutoreleasedReturnValue();
  -[NUArticlePageStyleOperation pageStyle](self, "pageStyle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2](v6, v5, v4);

}

- (FCArticle)article
{
  return self->_article;
}

- (unint64_t)pageNextAction
{
  return self->_pageNextAction;
}

- (id)completion
{
  return self->_completion;
}

- (NUPageStyle)pageStyle
{
  return self->_pageStyle;
}

- (void)setPageStyle:(id)a3
{
  objc_storeStrong((id *)&self->_pageStyle, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pageStyle, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_article, 0);
}

@end
