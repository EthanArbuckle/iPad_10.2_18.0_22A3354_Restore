@implementation NSMutableDictionary

- (void)ae_moveObjectFromKey:(void *)a3 toKey:
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  if (a1 && v7 != v5)
  {
    objc_msgSend(a1, "objectForKeyedSubscript:", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(a1, "setObject:forKeyedSubscript:", v6, v5);
      objc_msgSend(a1, "removeObjectForKey:", v7);
    }

  }
}

@end
