@implementation CSLocaleObserver

- (CSLocaleObserver)init
{
  CSLocaleObserver *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  NSLocale *currentLocale;
  NSArray *preferredLanguages;
  __CFNotificationCenter *LocalCenter;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CSLocaleObserver;
  v2 = -[CSLocaleObserver init](&v9, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.spotlight.CSLocaleObserver", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    currentLocale = v2->_currentLocale;
    v2->_currentLocale = 0;

    preferredLanguages = v2->_preferredLanguages;
    v2->_preferredLanguages = 0;

    v2->_isCJK = 0;
    -[CSLocaleObserver update](v2, "update");
    LocalCenter = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterAddObserver(LocalCenter, v2, (CFNotificationCallback)localeChangeCallback, (CFStringRef)*MEMORY[0x1E0C9B070], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  return v2;
}

- (void)update
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __26__CSLocaleObserver_update__block_invoke;
  block[3] = &unk_1E2401238;
  block[4] = self;
  dispatch_sync(queue, block);
}

void __26__CSLocaleObserver_update__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 8);
  *(_QWORD *)(v3 + 8) = v2;

  objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 16);
  *(_QWORD *)(v6 + 16) = v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lowercaseString");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v9, "hasPrefix:", CFSTR("ja")) & 1) != 0
    || (objc_msgSend(v9, "hasPrefix:", CFSTR("zh")) & 1) != 0
    || (objc_msgSend(v9, "hasPrefix:", CFSTR("yue")) & 1) != 0
    || objc_msgSend(v9, "hasPrefix:", CFSTR("ko")))
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 24) = 1;
  }

}

- (void)currentLocaleWithPreferredLanguagesBlock:(id)a3
{
  void (**v4)(id, uint64_t, uint64_t, _QWORD);
  NSObject *queue;
  _QWORD v6[8];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v4 = (void (**)(id, uint64_t, uint64_t, _QWORD))a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__7;
  v21 = __Block_byref_object_dispose__7;
  v22 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__7;
  v15 = __Block_byref_object_dispose__7;
  v16 = 0;
  v16 = (id)objc_opt_new();
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  queue = self->_queue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __61__CSLocaleObserver_currentLocaleWithPreferredLanguagesBlock___block_invoke;
  v6[3] = &unk_1E24028F0;
  v6[4] = self;
  v6[5] = &v17;
  v6[6] = &v11;
  v6[7] = &v7;
  dispatch_sync(queue, v6);
  v4[2](v4, v18[5], v12[5], *((unsigned __int8 *)v8 + 24));
  _Block_object_dispose(&v7, 8);
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
}

void __61__CSLocaleObserver_currentLocaleWithPreferredLanguagesBlock___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1[4] + 8), "copy");
  v3 = *(_QWORD *)(a1[5] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = *(id *)(a1[4] + 16);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "addObject:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++), (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = *(_BYTE *)(a1[4] + 24);
}

- (void)dealloc
{
  NSObject *queue;
  objc_super v4;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __27__CSLocaleObserver_dealloc__block_invoke;
  block[3] = &unk_1E2401238;
  block[4] = self;
  dispatch_sync(queue, block);
  v4.receiver = self;
  v4.super_class = (Class)CSLocaleObserver;
  -[CSLocaleObserver dealloc](&v4, sel_dealloc);
}

void __27__CSLocaleObserver_dealloc__block_invoke(uint64_t a1)
{
  __CFNotificationCenter *LocalCenter;

  LocalCenter = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterRemoveObserver(LocalCenter, *(const void **)(a1 + 32), (CFNotificationName)*MEMORY[0x1E0C9B070], 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_preferredLanguages, 0);
  objc_storeStrong((id *)&self->_currentLocale, 0);
}

@end
