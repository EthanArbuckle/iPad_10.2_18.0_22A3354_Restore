@implementation FAFamilyDetailsCache

+ (id)sharedCache
{
  if (sharedCache_onceToken != -1)
    dispatch_once(&sharedCache_onceToken, &__block_literal_global_16);
  return (id)sharedCache__sharedCache;
}

void __35__FAFamilyDetailsCache_sharedCache__block_invoke()
{
  FAFamilyDetailsCache *v0;
  void *v1;
  __CFNotificationCenter *DarwinNotifyCenter;
  const void *v3;
  CFStringRef *v4;
  _Unwind_Exception *v5;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v0 = objc_alloc_init(FAFamilyDetailsCache);
  v1 = (void *)sharedCache__sharedCache;
  sharedCache__sharedCache = (uint64_t)v0;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  v3 = (const void *)sharedCache__sharedCache;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v4 = (CFStringRef *)getINFamilyDidChangeNotificationSymbolLoc_ptr_0;
  v10 = getINFamilyDidChangeNotificationSymbolLoc_ptr_0;
  if (!getINFamilyDidChangeNotificationSymbolLoc_ptr_0)
  {
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __getINFamilyDidChangeNotificationSymbolLoc_block_invoke_0;
    v6[3] = &unk_24C88B7B0;
    v6[4] = &v7;
    __getINFamilyDidChangeNotificationSymbolLoc_block_invoke_0((uint64_t)v6);
    v4 = (CFStringRef *)v8[3];
  }
  _Block_object_dispose(&v7, 8);
  if (!v4)
  {
    v5 = (_Unwind_Exception *)+[FAHomeUISoftLinking getURLScheme].cold.1();
    _Block_object_dispose(&v7, 8);
    _Unwind_Resume(v5);
  }
  CFNotificationCenterAddObserver(DarwinNotifyCenter, v3, (CFNotificationCallback)_FAFamilyDetailsCacheFamilyDidChangeNotificationHandler, *v4, 0, CFNotificationSuspensionBehaviorCoalesce);
}

- (void)invalidate
{
  FAFamilyDetailsCache *obj;

  obj = self;
  objc_sync_enter(obj);
  obj->_isValid = 0;
  obj->_pendingInviteCount = 0;
  dispatch_async(MEMORY[0x24BDAC9B8], &__block_literal_global_2);
  objc_sync_exit(obj);

}

void __34__FAFamilyDetailsCache_invalidate__block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "postNotificationName:object:", CFSTR("FAFamilyDetailsCacheDidChangeNotification"), 0);

}

- (unint64_t)pendingInviteCount
{
  FAFamilyDetailsCache *v2;
  unint64_t pendingInviteCount;

  v2 = self;
  objc_sync_enter(v2);
  if (!*(_WORD *)&v2->_isValid)
  {
    v2->_isValidating = 1;
    -[FAFamilyDetailsCache _fetchPendingInviteCount](v2, "_fetchPendingInviteCount");
  }
  pendingInviteCount = v2->_pendingInviteCount;
  objc_sync_exit(v2);

  return pendingInviteCount;
}

- (void)_fetchPendingInviteCount
{
  NSObject *v3;
  _QWORD block[5];

  dispatch_get_global_queue(25, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __48__FAFamilyDetailsCache__fetchPendingInviteCount__block_invoke;
  block[3] = &unk_24C88B7F0;
  block[4] = self;
  dispatch_async(v3, block);

}

void __48__FAFamilyDetailsCache__fetchPendingInviteCount__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD v8[5];

  objc_msgSend(MEMORY[0x24BDB4398], "defaultStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "aa_primaryAppleAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(v2, "aa_grandSlamAccountForiCloudAccount:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_alloc(MEMORY[0x24BE049B0]);
    v6 = (void *)objc_msgSend(v5, "initWithAccountStore:grandSlamAccount:appTokenID:", v2, v4, *MEMORY[0x24BE04878]);
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE04980]), "initWithGrandSlamSigner:", v6);
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __48__FAFamilyDetailsCache__fetchPendingInviteCount__block_invoke_2;
    v8[3] = &unk_24C88D148;
    v8[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v7, "performRequestWithHandler:", v8);

  }
}

void __48__FAFamilyDetailsCache__fetchPendingInviteCount__block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = *(id *)(a1 + 32);
  objc_sync_enter(v8);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 17) = 0;
  objc_sync_exit(v8);

  if (v6 && !v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(*(id *)(a1 + 32), "_setPendingInviteCount:", objc_msgSend(v6, "pendingInviteCount"));
  }
  else
  {
    _AALogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138412290;
      v11 = v7;
      _os_log_impl(&dword_20DE41000, v9, OS_LOG_TYPE_DEFAULT, "FAFamilyDetailsCache _fetchPendingInviteCount error %@", (uint8_t *)&v10, 0xCu);
    }

  }
}

- (void)_setPendingInviteCount:(unint64_t)a3
{
  unint64_t pendingInviteCount;
  FAFamilyDetailsCache *obj;

  obj = self;
  objc_sync_enter(obj);
  pendingInviteCount = obj->_pendingInviteCount;
  obj->_pendingInviteCount = a3;
  obj->_isValid = 1;
  if (pendingInviteCount != a3)
    dispatch_async(MEMORY[0x24BDAC9B8], &__block_literal_global_9);
  objc_sync_exit(obj);

}

void __47__FAFamilyDetailsCache__setPendingInviteCount___block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "postNotificationName:object:", CFSTR("FAFamilyDetailsCacheDidChangeNotification"), 0);

}

@end
