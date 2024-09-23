@implementation CNFamilyCircle

+ (id)familyCircle
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "familyCircleAsync");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNResult resultWithFuture:](CNResult, "resultWithFuture:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)familyCircleAsync
{
  CNPromise *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = objc_alloc_init(CNPromise);
  v3 = objc_alloc_init(getFAFetchFamilyCircleRequestClass());
  objc_msgSend(v3, "setPromptUserToResolveAuthenticatonFailure:", 0);
  -[CNPromise completionHandlerAdapter](v2, "completionHandlerAdapter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startRequestWithCompletionHandler:", v4);

  -[CNPromise future](v2, "future");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
