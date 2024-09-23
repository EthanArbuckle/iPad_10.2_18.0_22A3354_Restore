@implementation BMSubscriptionEvent

- (id)endEvent
{
  id v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v1 = a1;
  if (a1)
  {
    v2 = objc_alloc(MEMORY[0x1E0D024F0]);
    objc_msgSend(v1, "client");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "useCase");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v1 = (id)objc_msgSend(v2, "initWithClient:identifier:useCase:starting:", v3, v4, v5, 0);

  }
  return v1;
}

@end
