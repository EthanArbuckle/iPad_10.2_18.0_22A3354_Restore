@implementation NSMutableDictionary(AppleAccount)

- (id)aa_removeObjectForKey:()AppleAccount
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "removeObjectForKey:", v4);

  return v5;
}

@end
