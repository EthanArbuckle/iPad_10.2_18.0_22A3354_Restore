@implementation MPActiveUserChangeMonitor

void __53___MPActiveUserChangeMonitor_ingestNotificationName___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "activeUserChangeDidFinish");

}

void __53___MPActiveUserChangeMonitor_ingestNotificationName___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD block[5];
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  v2 = os_log_create("com.apple.amp.mediaplayer", "Library");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 32);
    objc_msgSend(v3, "notificationTimer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "receivedNotifications");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v15, "count");
    objc_msgSend(*(id *)(a1 + 32), "expectedNotifications");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v14, "count");
    objc_msgSend(*(id *)(a1 + 32), "receivedNotifications");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "allObjects");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "componentsJoinedByString:", CFSTR(", "));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "expectedNotifications");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "allObjects");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "componentsJoinedByString:", CFSTR(", "));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134219266;
    v18 = v3;
    v19 = 2048;
    v20 = v13;
    v21 = 2048;
    v22 = v12;
    v23 = 2048;
    v24 = v4;
    v25 = 2114;
    v26 = v7;
    v27 = 2114;
    v28 = v10;
    _os_log_impl(&dword_193B9B000, v2, OS_LOG_TYPE_DEFAULT, "<_MPActiveUserChangeMonitor %p> - Firing notification timer %p [%ld of %ld notifications received] - received=[%{public}@] - expected=[%{public}@]", buf, 0x3Eu);

  }
  objc_msgSend(*(id *)(a1 + 32), "receivedNotifications");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "removeAllObjects");

  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53___MPActiveUserChangeMonitor_ingestNotificationName___block_invoke_7;
  block[3] = &unk_1E3163508;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __53___MPActiveUserChangeMonitor_ingestNotificationName___block_invoke_7(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "activeUserChangeDidFinish");

}

@end
