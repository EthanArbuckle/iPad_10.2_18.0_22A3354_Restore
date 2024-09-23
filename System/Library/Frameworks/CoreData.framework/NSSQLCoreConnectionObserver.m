@implementation NSSQLCoreConnectionObserver

uint64_t __48___NSSQLCoreConnectionObserver_initWithSQLCore___block_invoke(uint64_t a1, int a2)
{
  id v4;
  id *WeakRetained;
  uint64_t state;
  void *v7;
  os_unfair_lock_s *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t state64[4];

  state64[3] = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  state64[0] = 0;
  state = notify_get_state(a2, state64);
  if (WeakRetained)
  {
    v7 = (void *)MEMORY[0x18D76B4E4](state);
    v8 = (os_unfair_lock_s *)objc_loadWeakRetained(WeakRetained + 3);
    objc_autoreleasePoolPop(v7);
  }
  else
  {
    v8 = 0;
  }
  v9 = (id)-[os_unfair_lock_s persistentStoreCoordinator](v8, "persistentStoreCoordinator");
  if (+[NSSQLCore debugDefault](NSSQLCore, "debugDefault") >= 1)
  {
    v10 = -[os_unfair_lock_s identifier](v8, "identifier");
    _NSCoreDataLog(9, (uint64_t)CFSTR("Remote Change Notification - observer received for  %@ with state %lld"), v11, v12, v13, v14, v15, v16, v10);
  }
  if (v8 && v9)
  {
    os_unfair_lock_lock_with_options();
    LOBYTE(v8[64]._os_unfair_lock_opaque) = 1;
    os_unfair_lock_unlock(v8 + 36);
    if (+[NSSQLCore debugDefault](NSSQLCore, "debugDefault") >= 1)
    {
      v17 = -[os_unfair_lock_s identifier](v8, "identifier");
      _NSCoreDataLog(9, (uint64_t)CFSTR("Remote Change Notification - PSC to post notification for store  %@ with transaction ID %lld"), v18, v19, v20, v21, v22, v23, v17);
    }
    -[NSPersistentStoreCoordinator _postStoreRemoteChangeNotificationsForStore:andState:]((uint64_t)v9, v8, state64[0]);
  }

  return objc_msgSend(v4, "drain");
}

@end
