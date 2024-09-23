@implementation GCEAAccessoryManagerWrapper

+ (id)observers
{
  if (observers_onceToken != -1)
    dispatch_once(&observers_onceToken, &__block_literal_global_35);
  return (id)observers__observers;
}

void __40__GCEAAccessoryManagerWrapper_observers__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[NSHashTable weakObjectsHashTable](&off_254E12D28, "weakObjectsHashTable");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)observers__observers;
  observers__observers = v0;

}

+ (void)registerForLocalNotificationsWithObserver:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a3;
  v4 = a1;
  objc_sync_enter(v4);
  +[GCEAAccessoryManagerWrapper observers](GCEAAccessoryManagerWrapper, "observers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v11);

  if ((v6 & 1) == 0)
  {
    +[GCEAAccessoryManagerWrapper observers](GCEAAccessoryManagerWrapper, "observers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v11);

    +[GCEAAccessoryManagerWrapper observers](GCEAAccessoryManagerWrapper, "observers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    if (v9)
    {
      unk_254E00988(&off_254E02638, "sharedAccessoryManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "registerForLocalNotifications");

    }
  }
  objc_sync_exit(v4);

}

+ (void)unregisterForLocalNotificationsWithObserver:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a3;
  v4 = a1;
  objc_sync_enter(v4);
  +[GCEAAccessoryManagerWrapper observers](GCEAAccessoryManagerWrapper, "observers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v12);

  if (v6)
  {
    +[GCEAAccessoryManagerWrapper observers](GCEAAccessoryManagerWrapper, "observers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObject:", v12);

  }
  +[GCEAAccessoryManagerWrapper observers](GCEAAccessoryManagerWrapper, "observers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (!v10)
  {
    unk_254E00988(&off_254E02638, "sharedAccessoryManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "unregisterForLocalNotifications");

  }
  objc_sync_exit(v4);

}

@end
