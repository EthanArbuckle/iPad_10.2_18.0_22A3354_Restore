@implementation NSDistributedNotificationCenter(WeakObservers)

- (uint64_t)weak_removeObserver:()WeakObservers
{
  return objc_msgSend(a1, "weak_removeObserver:name:object:", a3, 0, 0);
}

- (void)weak_removeObserver:()WeakObservers name:object:
{
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;

  v8 = (void *)MEMORY[0x24BDD16D0];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v8, "defaultCenter");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_internalNameForNotificationName:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "removeObserver:name:object:", v11, v12, v9);
}

- (void)weak_addObserver:()WeakObservers selector:name:object:
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;

  v10 = a6;
  v11 = a5;
  v12 = a3;
  objc_msgSend(a1, "removeObserver:name:object:", a1, v11, 0);
  objc_msgSend(a1, "addObserver:selector:name:object:", a1, sel__handleNotification_, v11, 0);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_internalNameForNotificationName:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "addObserver:selector:name:object:", v12, a4, v13, v10);
}

- (uint64_t)_internalNameForNotificationName:()WeakObservers
{
  return objc_msgSend(a3, "stringByAppendingString:", CFSTR("_internal"));
}

- (void)_handleNotification:()WeakObservers
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = (void *)MEMORY[0x24BDD16D0];
  v5 = a3;
  objc_msgSend(v4, "defaultCenter");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_internalNameForNotificationName:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "object");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "userInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "postNotificationName:object:userInfo:", v7, v8, v9);
}

@end
