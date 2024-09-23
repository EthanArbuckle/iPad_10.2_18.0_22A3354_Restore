@implementation NSUserDefaults(NFAdditions)

- (void)nf_migrateObjectForKey:()NFAdditions toKey:
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  if (v8 && v6)
  {
    objc_msgSend(a1, "objectForKey:", v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(a1, "setObject:forKey:", v7, v6);
      objc_msgSend(a1, "removeObjectForKey:", v8);
    }

  }
}

@end
