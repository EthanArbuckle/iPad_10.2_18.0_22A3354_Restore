@implementation NUErrorMessageFactory

- (NUErrorMessageFactory)initWithNetworkReachability:(id)a3
{
  id v5;
  NUErrorMessageFactory *v6;
  NUErrorMessageFactory *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NUErrorMessageFactory;
  v6 = -[NUErrorMessageFactory init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_networkReachability, a3);

  return v7;
}

- (id)errorMessageForArticleView
{
  void *v3;
  void *v4;

  -[NUErrorMessageFactory networkReachability](self, "networkReachability");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUErrorMessageFactory errorMessageForArticleViewWithOfflineReason:](self, "errorMessageForArticleViewWithOfflineReason:", objc_msgSend(v3, "offlineReason"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)errorMessageForArticleViewWithOfflineReason:(int64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  switch(a3)
  {
    case 1:
    case 2:
      NUBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("NUStoryUnavailableAlertTitle"), &stru_24D5A3F98, 0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      NUBundle();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      v7 = CFSTR("Apple News isn’t connected to the internet.");
      goto LABEL_7;
    case 3:
      NUBundle();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("NUStoryUnavailableAlertTitle"), &stru_24D5A3F98, 0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      NUBundle();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      v7 = CFSTR("Apple News isn’t supported in your current region.");
      goto LABEL_7;
    case 4:
    case 5:
      NUBundle();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("NUStoryUnavailableAlertTitle"), &stru_24D5A3F98, 0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      NUBundle();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      v7 = CFSTR("NUOpenStoryRequiresLatestVersionOS");
      goto LABEL_7;
    case 6:
      NUBundle();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("NUStoryUnavailableAlertTitle"), &stru_24D5A3F98, 0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      NUBundle();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      v7 = CFSTR("Sorry, Apple News is no longer fully supported on older devices.");
LABEL_7:
      objc_msgSend(v5, "localizedStringForKey:value:table:", v7, &stru_24D5A3F98, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    default:
      v4 = 0;
      v9 = 0;
      break;
  }
  +[NUErrorMessageFactory errorMessageForTitle:subtitle:](NUErrorMessageFactory, "errorMessageForTitle:subtitle:", v4, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)errorMessageForArticleViewWithOfflineReason:(int64_t)a3
{
  return +[NUErrorMessageFactory errorMessageForArticleViewWithOfflineReason:](NUErrorMessageFactory, "errorMessageForArticleViewWithOfflineReason:", a3);
}

+ (id)errorMessageForTitle:(id)a3 subtitle:(id)a4
{
  NUErrorMessage *v4;
  id v6;
  id v7;

  v4 = 0;
  if (a3 && a4)
  {
    v6 = a4;
    v7 = a3;
    v4 = -[NUErrorMessage initWithTitle:subtitle:]([NUErrorMessage alloc], "initWithTitle:subtitle:", v7, v6);

  }
  return v4;
}

- (FCNetworkReachabilityType)networkReachability
{
  return self->_networkReachability;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkReachability, 0);
}

@end
