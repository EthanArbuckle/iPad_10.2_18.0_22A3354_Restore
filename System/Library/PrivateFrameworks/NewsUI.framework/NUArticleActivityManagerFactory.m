@implementation NUArticleActivityManagerFactory

- (NUArticleActivityManagerFactory)initWithReadingHistory:(id)a3 readingList:(id)a4 subscriptionList:(id)a5 URLHandler:(id)a6 optionsProvider:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  NUArticleActivityManagerFactory *v17;
  NUArticleActivityManagerFactory *v18;
  id v20;
  objc_super v21;

  v20 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)NUArticleActivityManagerFactory;
  v17 = -[NUArticleActivityManagerFactory init](&v21, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_readingHistory, a3);
    objc_storeStrong((id *)&v18->_readingList, a4);
    objc_storeStrong((id *)&v18->_subscriptionList, a5);
    objc_storeStrong((id *)&v18->_URLHandler, a6);
    objc_storeStrong((id *)&v18->_optionsProvider, a7);
  }

  return v18;
}

- (id)activityProviderForHeadline:(id)a3 reportConcernViewPresenter:(id)a4 URLModifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  NUArticleActivityManager *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NUArticleActivityManager *v17;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = [NUArticleActivityManager alloc];
  -[NUArticleActivityManagerFactory readingHistory](self, "readingHistory");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUArticleActivityManagerFactory readingList](self, "readingList");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUArticleActivityManagerFactory subscriptionList](self, "subscriptionList");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUArticleActivityManagerFactory URLHandler](self, "URLHandler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUArticleActivityManagerFactory optionsProvider](self, "optionsProvider");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[NUArticleActivityManager initWithHeadline:readingHistory:readingList:subscriptionList:URLHandler:reportConcernViewPresenter:URLModifier:optionsProvider:](v11, "initWithHeadline:readingHistory:readingList:subscriptionList:URLHandler:reportConcernViewPresenter:URLModifier:optionsProvider:", v10, v12, v13, v14, v15, v9, v8, v16);

  return v17;
}

- (FCReadingHistory)readingHistory
{
  return self->_readingHistory;
}

- (FCReadingList)readingList
{
  return self->_readingList;
}

- (FCSubscriptionList)subscriptionList
{
  return self->_subscriptionList;
}

- (NUURLHandling)URLHandler
{
  return self->_URLHandler;
}

- (NUArticleActivityOptionsProvider)optionsProvider
{
  return self->_optionsProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_optionsProvider, 0);
  objc_storeStrong((id *)&self->_URLHandler, 0);
  objc_storeStrong((id *)&self->_subscriptionList, 0);
  objc_storeStrong((id *)&self->_readingList, 0);
  objc_storeStrong((id *)&self->_readingHistory, 0);
}

@end
