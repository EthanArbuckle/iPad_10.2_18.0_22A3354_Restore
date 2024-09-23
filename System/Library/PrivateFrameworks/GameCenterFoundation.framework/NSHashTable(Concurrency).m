@implementation NSHashTable(Concurrency)

- (void)_gkSafeAddObject:()Concurrency
{
  id v4;
  id v5;

  v5 = a3;
  v4 = a1;
  objc_sync_enter(v4);
  objc_msgSend(v4, "addObject:", v5);
  objc_sync_exit(v4);

}

- (void)_gkSafeRemoveObject:()Concurrency
{
  id v4;
  id v5;

  v5 = a3;
  v4 = a1;
  objc_sync_enter(v4);
  objc_msgSend(v4, "removeObject:", v5);
  objc_sync_exit(v4);

}

- (id)_gkSafeCopy
{
  id v1;
  void *v2;

  v1 = a1;
  objc_sync_enter(v1);
  v2 = (void *)objc_msgSend(v1, "copy");
  objc_sync_exit(v1);

  return v2;
}

@end
