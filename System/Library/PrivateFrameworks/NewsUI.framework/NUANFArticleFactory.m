@implementation NUANFArticleFactory

- (NUANFArticleFactory)initWithArticleController:(id)a3
{
  id v5;
  NUANFArticleFactory *v6;
  NUANFArticleFactory *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NUANFArticleFactory;
  v6 = -[NUANFArticleFactory init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_articleController, a3);
    *(_OWORD *)&v7->_qualityOfService = xmmword_21684DA60;
  }

  return v7;
}

- (id)createArticleForHeadline:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[NUANFArticleFactory articleController](self, "articleController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "articleWithHeadline:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (FCArticleController)articleController
{
  return self->_articleController;
}

- (id)createArticlesForArticleIDs:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v10);
        -[NUANFArticleFactory articleController](self, "articleController", (_QWORD)v15);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "articleWithID:forceArticleUpdate:qualityOfService:relativePriority:", v11, 0, -[NUANFArticleFactory qualityOfService](self, "qualityOfService"), -[NUANFArticleFactory relativePriority](self, "relativePriority"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v5, "addObject:", v13);
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  return v5;
}

- (int64_t)qualityOfService
{
  return self->_qualityOfService;
}

- (void)setQualityOfService:(int64_t)a3
{
  self->_qualityOfService = a3;
}

- (int64_t)relativePriority
{
  return self->_relativePriority;
}

- (void)setRelativePriority:(int64_t)a3
{
  self->_relativePriority = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_articleController, 0);
}

@end
