@implementation APUICardRequestSatisfactionCriteria

+ (id)generalSatisfactionCriteria
{
  return objc_alloc_init((Class)a1);
}

+ (id)compactSatisfactionCriteria
{
  return objc_alloc_init(_APUICardRequestCompactSatisfactionCriteria);
}

+ (id)customIntentSatisfactionCriteria
{
  return objc_alloc_init(_APUICardRequestCustomIntentSatisfactionCriteria);
}

- (BOOL)canSatisfyCardRequest:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "content");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v4 = objc_msgSend((id)objc_opt_class(), "apui_isSupportedForCardRequests");
  else
    v4 = 0;

  return v4;
}

- (unint64_t)servicePriorityForRequest:(id)a3
{
  return 0;
}

@end
