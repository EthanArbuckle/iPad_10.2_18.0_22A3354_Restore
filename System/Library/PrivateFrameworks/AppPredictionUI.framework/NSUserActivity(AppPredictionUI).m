@implementation NSUserActivity(AppPredictionUI)

- (id)apui_intent
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "interaction");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "apui_intent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (uint64_t)apui_isSupportedForCardRequests
{
  return 1;
}

@end
