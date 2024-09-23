@implementation NSDictionary(UserNotifications)

- (id)un_nonEmptyCopy
{
  void *v2;

  v2 = (void *)objc_msgSend(a1, "count");
  if (v2)
    v2 = (void *)objc_msgSend(a1, "copy");
  return v2;
}

- (id)un_safeCastObjectForKey:()UserNotifications class:
{
  void *v5;
  void *v6;

  objc_msgSend(a1, "objectForKey:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  UNSafeCast(a4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
