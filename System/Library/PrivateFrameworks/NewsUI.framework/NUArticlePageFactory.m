@implementation NUArticlePageFactory

- (NUArticlePageFactory)initWithArticleFactory:(id)a3 articleActivityFactory:(id)a4 articleHostViewControllerFactory:(id)a5
{
  id v9;
  id v10;
  id v11;
  NUArticlePageFactory *v12;
  NUArticlePageFactory *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)NUArticlePageFactory;
  v12 = -[NUArticlePageFactory init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_articleFactory, a3);
    objc_storeStrong((id *)&v13->_articleHostViewControllerFactory, a5);
    objc_storeStrong((id *)&v13->_articleActivityFactory, a4);
  }

  return v13;
}

- (id)createPagesForArticleIDs:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[5];

  v4 = a3;
  -[NUArticlePageFactory articleFactory](self, "articleFactory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "createArticlesForArticleIDs:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __49__NUArticlePageFactory_createPagesForArticleIDs___block_invoke;
  v9[3] = &unk_24D5A2CA8;
  v9[4] = self;
  objc_msgSend(v6, "fc_arrayByTransformingWithBlock:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

NUArticlePage *__49__NUArticlePageFactory_createPagesForArticleIDs___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NUArticlePage *v4;
  void *v5;
  void *v6;
  NUArticlePage *v7;

  v3 = a2;
  v4 = [NUArticlePage alloc];
  objc_msgSend(*(id *)(a1 + 32), "articleHostViewControllerFactory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "articleActivityFactory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[NUArticlePage initWithArticle:articleHostViewControllerFactory:articleActivityFactory:pageNextAction:](v4, "initWithArticle:articleHostViewControllerFactory:articleActivityFactory:pageNextAction:", v3, v5, v6, 0);

  return v7;
}

- (NUArticleFactory)articleFactory
{
  return self->_articleFactory;
}

- (NUArticleHostViewControllerFactory)articleHostViewControllerFactory
{
  return self->_articleHostViewControllerFactory;
}

- (NUArticleActivityFactory)articleActivityFactory
{
  return self->_articleActivityFactory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_articleActivityFactory, 0);
  objc_storeStrong((id *)&self->_articleHostViewControllerFactory, 0);
  objc_storeStrong((id *)&self->_articleFactory, 0);
}

@end
