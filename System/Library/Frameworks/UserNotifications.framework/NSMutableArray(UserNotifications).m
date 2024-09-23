@implementation NSMutableArray(UserNotifications)

- (void)un_safeAddObject:()UserNotifications class:
{
  void *v5;
  void *v6;

  UNSafeCast(a4, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = v5;
    objc_msgSend(a1, "addObject:", v5);
    v5 = v6;
  }

}

- (void)un_safeAddObject:()UserNotifications classes:
{
  void *v5;
  void *v6;

  UNSafeCastAny(a4, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = v5;
    objc_msgSend(a1, "addObject:", v5);
    v5 = v6;
  }

}

@end
