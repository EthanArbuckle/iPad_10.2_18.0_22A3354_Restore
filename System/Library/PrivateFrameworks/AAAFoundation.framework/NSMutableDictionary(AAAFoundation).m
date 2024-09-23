@implementation NSMutableDictionary(AAAFoundation)

- (id)aaf_removeObjectForKey:()AAAFoundation
{
  id v4;
  void *v5;

  v4 = a3;
  if (objc_msgSend(a1, "count"))
  {
    objc_msgSend(a1, "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "removeObjectForKey:", v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end
