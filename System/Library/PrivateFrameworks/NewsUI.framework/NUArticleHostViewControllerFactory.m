@implementation NUArticleHostViewControllerFactory

- (NUArticleHostViewControllerFactory)initWithArticleViewControllerFactory:(id)a3 settings:(id)a4 errorMessageFactory:(id)a5 contentSizeManager:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  NUArticleHostViewControllerFactory *v15;
  NUArticleHostViewControllerFactory *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)NUArticleHostViewControllerFactory;
  v15 = -[NUArticleHostViewControllerFactory init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_articleViewControllerFactory, a3);
    objc_storeStrong((id *)&v16->_settings, a4);
    objc_storeStrong((id *)&v16->_errorMessageFactory, a5);
    objc_storeStrong((id *)&v16->_contentSizeManager, a6);
  }

  return v16;
}

- (id)createArticleHostViewControllerForArticle:(id)a3
{
  id v4;
  NUArticleHostViewController *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NUArticleHostViewController *v10;

  v4 = a3;
  v5 = [NUArticleHostViewController alloc];
  -[NUArticleHostViewControllerFactory articleViewControllerFactory](self, "articleViewControllerFactory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUArticleHostViewControllerFactory settings](self, "settings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUArticleHostViewControllerFactory errorMessageFactory](self, "errorMessageFactory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUArticleHostViewControllerFactory contentSizeManager](self, "contentSizeManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[NUArticleHostViewController initWithArticle:articleViewControllerFactory:settings:errorMessageFactory:contentSizeManager:](v5, "initWithArticle:articleViewControllerFactory:settings:errorMessageFactory:contentSizeManager:", v4, v6, v7, v8, v9);

  return v10;
}

- (NUArticleViewControllerFactory)articleViewControllerFactory
{
  return self->_articleViewControllerFactory;
}

- (NUSettings)settings
{
  return self->_settings;
}

- (NUErrorMessageFactory)errorMessageFactory
{
  return self->_errorMessageFactory;
}

- (NUArticleContentSizeManager)contentSizeManager
{
  return self->_contentSizeManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentSizeManager, 0);
  objc_storeStrong((id *)&self->_errorMessageFactory, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_articleViewControllerFactory, 0);
}

@end
