@implementation HMFMessage(HMDBackingStoreTransactionActions)

- (id)transactionResult
{
  void *v1;
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(a1, "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("_reserved_BackingStoreTransactionResult"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

@end
