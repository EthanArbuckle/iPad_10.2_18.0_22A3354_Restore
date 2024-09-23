@implementation NSMutableDictionary(CalClassAdditions)

- (id)CALsafeObjectForKey:()CalClassAdditions calculatedWithBlock:
{
  id v6;
  id v7;
  id v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  v8 = a1;
  objc_sync_enter(v8);
  CalCachedObjectForKeyWithCalculateBlock(v8, v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v8);

  return v9;
}

@end
