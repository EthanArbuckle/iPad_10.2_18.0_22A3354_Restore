@implementation ATXAction(AppPredictionUI)

- (id)apui_intent
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  objc_msgSend(a1, "intent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    objc_msgSend(a1, "userActivity");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "apui_intent");
    v4 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

+ (uint64_t)apui_isSupportedForCardRequests
{
  return 1;
}

@end
