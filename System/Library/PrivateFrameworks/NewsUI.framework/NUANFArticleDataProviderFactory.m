@implementation NUANFArticleDataProviderFactory

- (NUANFArticleDataProviderFactory)initWithContentContext:(id)a3 fontRegistration:(id)a4 host:(id)a5 embedDataManager:(id)a6 linkedContentManagerFactory:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  NUANFArticleDataProviderFactory *v17;
  NUANFArticleDataProviderFactory *v18;
  id v20;
  objc_super v21;

  v20 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)NUANFArticleDataProviderFactory;
  v17 = -[NUANFArticleDataProviderFactory init](&v21, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_contentContext, a3);
    objc_storeStrong((id *)&v18->_fontRegistration, a4);
    objc_storeStrong((id *)&v18->_host, a5);
    objc_storeStrong((id *)&v18->_embedDataManager, a6);
    objc_storeStrong((id *)&v18->_linkedContentManagerFactory, a7);
  }

  return v18;
}

- (id)createArticleDataProviderWithArticle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  NUBundledArticleDataProvider *v9;
  void *v10;
  NUBundledArticleDataProvider *v11;
  NUANFArticleDataProvider *v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = a3;
  -[NUANFArticleDataProviderFactory linkedContentManagerFactory](self, "linkedContentManagerFactory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "createLinkedContentManagerForArticle:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "headline");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isLocalDraft");

  if (v8)
  {
    v9 = [NUBundledArticleDataProvider alloc];
    -[NUANFArticleDataProviderFactory embedDataManager](self, "embedDataManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[NUBundledArticleDataProvider initWithArticle:embedDataManager:linkedContentManager:](v9, "initWithArticle:embedDataManager:linkedContentManager:", v4, v10, v6);
  }
  else
  {
    v12 = [NUANFArticleDataProvider alloc];
    -[NUANFArticleDataProviderFactory contentContext](self, "contentContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NUANFArticleDataProviderFactory fontRegistration](self, "fontRegistration");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NUANFArticleDataProviderFactory host](self, "host");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NUANFArticleDataProviderFactory embedDataManager](self, "embedDataManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[NUANFArticleDataProvider initWithArticle:contentContext:fontRegistration:host:embedDataManager:linkedContentManager:](v12, "initWithArticle:contentContext:fontRegistration:host:embedDataManager:linkedContentManager:", v4, v10, v13, v14, v15, v6);

  }
  return v11;
}

- (NULinkedContentManagerFactory)linkedContentManagerFactory
{
  return self->_linkedContentManagerFactory;
}

- (SXHost)host
{
  return self->_host;
}

- (NUFontRegistration)fontRegistration
{
  return self->_fontRegistration;
}

- (NUEmbedDataManager)embedDataManager
{
  return self->_embedDataManager;
}

- (FCContentContext)contentContext
{
  return self->_contentContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkedContentManagerFactory, 0);
  objc_storeStrong((id *)&self->_embedDataManager, 0);
  objc_storeStrong((id *)&self->_host, 0);
  objc_storeStrong((id *)&self->_fontRegistration, 0);
  objc_storeStrong((id *)&self->_contentContext, 0);
}

@end
