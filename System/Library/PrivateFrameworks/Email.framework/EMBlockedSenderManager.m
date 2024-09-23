@implementation EMBlockedSenderManager

uint64_t __54__EMBlockedSenderManager_areAnyEmailAddressesBlocked___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "emailAddressValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "simpleAddress");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    v5 = objc_msgSend(*(id *)(a1 + 32), "containsObject:", v4);
  else
    v5 = 0;

  return v5;
}

- (BOOL)areAnyEmailAddressesBlocked:(id)a3
{
  id v4;
  void *v5;
  id v6;
  char v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  if (-[EMBlockedSenderManager isBlockedSenderEnabled](self, "isBlockedSenderEnabled"))
  {
    -[EMBlockedSenderManager blockedSenderEmailAddresses](self, "blockedSenderEmailAddresses");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __54__EMBlockedSenderManager_areAnyEmailAddressesBlocked___block_invoke;
    v9[3] = &unk_1E70F2350;
    v10 = v5;
    v6 = v5;
    v7 = objc_msgSend(v4, "ef_any:", v9);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)isBlockedSenderEnabled
{
  void *v2;
  char v3;

  if (!objc_msgSend(MEMORY[0x1E0C99EA0], "em_defaultExistsForKey:", CFSTR("BlockedSenderEnabled")))
    return 1;
  objc_msgSend(MEMORY[0x1E0C99EA0], "em_userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("BlockedSenderEnabled"));

  return v3;
}

- (NSSet)blockedSenderEmailAddresses
{
  void *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy_;
  v11 = __Block_byref_object_dispose_;
  v12 = 0;
  -[EMBlockedSenderManager blockedSenderCache](self, "blockedSenderCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __53__EMBlockedSenderManager_blockedSenderEmailAddresses__block_invoke;
  v6[3] = &unk_1E70F22B0;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v3, "performWhileLocked:", v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSSet *)v4;
}

- (EFLocked)blockedSenderCache
{
  return self->_blockedSenderCache;
}

- (EMBlockedSenderManager)init
{
  EMBlockedSenderManager *v2;
  uint64_t v3;
  EFScheduler *notificationScheduler;
  id v5;
  _EMBlockedSenderState *v6;
  uint64_t v7;
  EFLocked *blockedSenderCache;
  void *v9;
  __CFNotificationCenter *DarwinNotifyCenter;
  const void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)EMBlockedSenderManager;
  v2 = -[EMBlockedSenderManager init](&v13, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0D1F070], "serialDispatchQueueSchedulerWithName:", CFSTR("com.apple.email.BlockedSenderManager.notification"));
    v3 = objc_claimAutoreleasedReturnValue();
    notificationScheduler = v2->_notificationScheduler;
    v2->_notificationScheduler = (EFScheduler *)v3;

    v2->_didRemoveObservers._Value = 0;
    v5 = objc_alloc(MEMORY[0x1E0D1EEF0]);
    v6 = objc_alloc_init(_EMBlockedSenderState);
    v7 = objc_msgSend(v5, "initWithObject:", v6);
    blockedSenderCache = v2->_blockedSenderCache;
    v2->_blockedSenderCache = (EFLocked *)v7;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", v2, sel__blockedSenderListDidChange_, *MEMORY[0x1E0D13278], 0);

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)_blockedSenderOptionsDidChange, CFSTR("com.apple.mail.EMBlockedSenderOptionsDidChangeNotification"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    v11 = (const void *)CMFItemCreateWithEmailAddress();
    if (v11)
    {
      CMFBlockListIsItemBlocked();
      CFRelease(v11);
    }
  }
  return v2;
}

- (void)_locked_repopulateBlockedSenderCachedState:(id)a3
{
  id v4;
  id v5;
  id v6;
  unint64_t i;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  EMBlockedSenderManager *v15;
  CFTypeRef cf;
  CFTypeRef v17;

  v4 = a3;
  v17 = (CFTypeRef)0xAAAAAAAAAAAAAAAALL;
  CMFBlockListCopyItemsForAllServicesService();
  v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v6 = (id)0xAAAAAAAAAAAAAAAALL;
  for (i = 0; i < objc_msgSend(v6, "count"); ++i)
  {
    objc_msgSend(v6, "objectAtIndex:", i);
    if (CMFItemGetType() == 1)
    {
      cf = (CFTypeRef)0xAAAAAAAAAAAAAAAALL;
      CMFItemCopyEmailAddress();
      objc_msgSend(v5, "addObject:");
      CFRelease((CFTypeRef)0xAAAAAAAAAAAAAAAALL);
    }
  }
  CFRelease(v17);

  if (objc_msgSend(v4, "valid"))
    objc_msgSend(v4, "blockedSenders");
  else
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBlockedSenders:", v5);
  objc_msgSend(v4, "setValid:", 1);
  -[EMBlockedSenderManager notificationScheduler](self, "notificationScheduler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __69__EMBlockedSenderManager__locked_repopulateBlockedSenderCachedState___block_invoke;
  v12[3] = &unk_1E70F2158;
  v10 = v5;
  v13 = v10;
  v11 = v8;
  v14 = v11;
  v15 = self;
  objc_msgSend(v9, "performBlock:", v12);

}

void __53__EMBlockedSenderManager_blockedSenderEmailAddresses__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a2;
  if ((objc_msgSend(v7, "valid") & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "_locked_repopulateBlockedSenderCachedState:", v7);
  objc_msgSend(v7, "blockedSenders");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "copy");
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (EFScheduler)notificationScheduler
{
  return self->_notificationScheduler;
}

void __69__EMBlockedSenderManager__locked_repopulateBlockedSenderCachedState___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  _QWORD v10[5];

  v10[4] = *MEMORY[0x1E0C80C00];
  v2 = a1 + 32;
  objc_msgSend(*(id *)(a1 + 32), "ef_setByRemovingObjectsFromSet:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(v2 + 8), "ef_setByRemovingObjectsFromSet:", *(_QWORD *)v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 32);
  v9[0] = CFSTR("EMBlockedSenderManagerBlockedSendersKey");
  v9[1] = CFSTR("EMBlockedSenderManagerAddedBlockedSendersKey");
  v10[0] = v5;
  v10[1] = v3;
  v10[2] = v4;
  v9[2] = CFSTR("EMBlockedSenderManagerRemovedBlockedSendersKey");
  v9[3] = CFSTR("EMBlockedSenderManagerIsBlockedSenderEnabledKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 48), "isBlockedSenderEnabled"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[3] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "postNotificationName:object:userInfo:", CFSTR("EMBlockedSenderManagerBlockedListDidChangeNotification"), *(_QWORD *)(a1 + 48), v7);

}

- (void)dealloc
{
  objc_super v3;

  -[EMBlockedSenderManager _removeObserversIfNeeded](self, "_removeObserversIfNeeded");
  v3.receiver = self;
  v3.super_class = (Class)EMBlockedSenderManager;
  -[EMBlockedSenderManager dealloc](&v3, sel_dealloc);
}

- (void)test_tearDown
{
  id v4;
  id v5;

  if ((EFIsRunningUnitTests() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EMBlockedSenderManager.m"), 87, CFSTR("%s can only be called from unit tests"), "-[EMBlockedSenderManager test_tearDown]");

  }
  -[EMBlockedSenderManager _removeObserversIfNeeded](self, "_removeObserversIfNeeded");
  -[EMBlockedSenderManager notificationScheduler](self, "notificationScheduler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "performSyncBlock:", &__block_literal_global_2);

}

- (void)_removeObserversIfNeeded
{
  atomic_flag *p_didRemoveObservers;
  unsigned __int8 v4;
  void *v5;
  __CFNotificationCenter *DarwinNotifyCenter;

  p_didRemoveObservers = &self->_didRemoveObservers;
  do
    v4 = __ldaxr((unsigned __int8 *)p_didRemoveObservers);
  while (__stlxr(1u, (unsigned __int8 *)p_didRemoveObservers));
  if ((v4 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObserver:name:object:", self, *MEMORY[0x1E0D13278], 0);

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("com.apple.mail.EMBlockedSenderOptionsDidChangeNotification"), 0);
  }
}

- (void)_blockedSenderListDidChange:(id)a3
{
  void *v4;
  _QWORD v5[5];

  -[EMBlockedSenderManager blockedSenderCache](self, "blockedSenderCache", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __54__EMBlockedSenderManager__blockedSenderListDidChange___block_invoke;
  v5[3] = &unk_1E70F22D8;
  v5[4] = self;
  objc_msgSend(v4, "performWhileLocked:", v5);

}

uint64_t __54__EMBlockedSenderManager__blockedSenderListDidChange___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_locked_repopulateBlockedSenderCachedState:", a2);
}

- (void)_postBlockedSenderListDidChangeNotificationBasedOnBlockedSenderEnabledState
{
  void *v3;
  _QWORD v4[5];

  -[EMBlockedSenderManager notificationScheduler](self, "notificationScheduler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __101__EMBlockedSenderManager__postBlockedSenderListDidChangeNotificationBasedOnBlockedSenderEnabledState__block_invoke;
  v4[3] = &unk_1E70F1FA0;
  v4[4] = self;
  objc_msgSend(v3, "performBlock:", v4);

}

void __101__EMBlockedSenderManager__postBlockedSenderListDidChangeNotificationBasedOnBlockedSenderEnabledState__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "isBlockedSenderEnabled");
  if ((v2 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "blockedSenderEmailAddresses");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = objc_opt_new();
  }
  v4 = (void *)v3;
  v8[0] = CFSTR("EMBlockedSenderManagerBlockedSendersKey");
  v8[1] = CFSTR("EMBlockedSenderManagerIsBlockedSenderEnabledKey");
  v9[0] = v3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "postNotificationName:object:userInfo:", CFSTR("EMBlockedSenderManagerBlockedListDidChangeNotification"), *(_QWORD *)(a1 + 32), v6);

}

- (void)setMoveToTrashEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "em_userDefaults");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v4, CFSTR("BlockedSenderAction"));

}

- (BOOL)isMoveToTrashEnabled
{
  void *v2;
  void *v3;
  BOOL v4;

  objc_msgSend(MEMORY[0x1E0C99EA0], "em_userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("BlockedSenderAction"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  v4 = (objc_opt_isKindOfClass() & 1) == 0 || objc_msgSend(v3, "integerValue") == 1;

  return v4;
}

- (void)setBlockedSenderEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "em_userDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBool:forKey:", v3, CFSTR("BlockedSenderEnabled"));

  -[EMBlockedSenderManager _postBlockedSenderListDidChangeNotificationBasedOnBlockedSenderEnabledState](self, "_postBlockedSenderListDidChangeNotificationBasedOnBlockedSenderEnabledState");
}

- (BOOL)isEmailAddressBlocked:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;

  v4 = a3;
  if (-[EMBlockedSenderManager isBlockedSenderEnabled](self, "isBlockedSenderEnabled"))
  {
    objc_msgSend(MEMORY[0x1E0D1E450], "rawAddressFromFullAddress:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[EMBlockedSenderManager _isEmailAddressBlocked:](self, "_isEmailAddressBlocked:", v5);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)blockContact:(id)a3
{
  -[EMBlockedSenderManager _blockContact:block:](self, "_blockContact:block:", a3, 1);
}

- (void)unblockContact:(id)a3
{
  -[EMBlockedSenderManager _blockContact:block:](self, "_blockContact:block:", a3, 0);
}

- (BOOL)isContactBlocked:(id)a3
{
  void *v4;
  _QWORD v6[5];

  objc_msgSend(a3, "emailAddresses");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __43__EMBlockedSenderManager_isContactBlocked___block_invoke;
  v6[3] = &unk_1E70F2300;
  v6[4] = self;
  LOBYTE(self) = objc_msgSend(v4, "ef_any:", v6);

  return (char)self;
}

uint64_t __43__EMBlockedSenderManager_isContactBlocked___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEmailAddressBlocked:", v3);

  return v4;
}

- (void)blockEmailAddress:(id)a3
{
  const void *v3;
  id v4;

  v4 = a3;
  v3 = (const void *)CMFItemCreateWithEmailAddress();
  CMFBlockListAddItemForAllServices();
  if (v3)
    CFRelease(v3);

}

- (void)unblockEmailAddress:(id)a3
{
  const void *v3;
  id v4;

  v4 = a3;
  v3 = (const void *)CMFItemCreateWithEmailAddress();
  CMFBlockListRemoveItemFromAllServices();
  if (v3)
    CFRelease(v3);

}

- (void)blockEmailAddresses:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v4);
        objc_msgSend(MEMORY[0x1E0D1E450], "rawAddressFromFullAddress:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v7), (_QWORD)v9);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[EMBlockedSenderManager blockEmailAddress:](self, "blockEmailAddress:", v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (void)unblockEmailAddresses:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v4);
        objc_msgSend(MEMORY[0x1E0D1E450], "rawAddressFromFullAddress:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v7), (_QWORD)v9);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[EMBlockedSenderManager unblockEmailAddress:](self, "unblockEmailAddress:", v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (BOOL)isTokenAddressIsBlocked:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  BOOL v8;

  v4 = a3;
  objc_msgSend(v4, "contact");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v4, "contact");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[EMBlockedSenderManager isContactBlocked:](self, "isContactBlocked:", v6);
  }
  else
  {
    objc_msgSend(v4, "currentRawAddress");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[EMBlockedSenderManager isEmailAddressBlocked:](self, "isEmailAddressBlocked:", v6);
  }
  v8 = v7;

  return v8;
}

- (void)blockTokenAddress:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "contact");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v6, "contact");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMBlockedSenderManager blockContact:](self, "blockContact:", v5);
  }
  else
  {
    objc_msgSend(v6, "currentRawAddress");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMBlockedSenderManager blockEmailAddress:](self, "blockEmailAddress:", v5);
  }

}

- (void)unblockTokenAddress:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "contact");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v6, "contact");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMBlockedSenderManager unblockContact:](self, "unblockContact:", v5);
  }
  else
  {
    objc_msgSend(v6, "currentRawAddress");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMBlockedSenderManager unblockEmailAddress:](self, "unblockEmailAddress:", v5);
  }

}

- (void)_blockContact:(id)a3 block:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v4 = a4;
  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = objc_alloc_init(MEMORY[0x1E0D1E458]);
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  objc_msgSend(v6, "emailAddresses");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v23;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v23 != v10)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v11), "value");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v9);
  }

  if (v4)
    -[EMBlockedSenderManager blockEmailAddresses:](self, "blockEmailAddresses:", v7);
  else
    -[EMBlockedSenderManager unblockEmailAddresses:](self, "unblockEmailAddresses:", v7);
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(v6, "phoneNumbers", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v19;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v19 != v15)
          objc_enumerationMutation(v13);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v16), "value");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (v4)
          -[EMBlockedSenderManager _blockPhoneNumber:](self, "_blockPhoneNumber:", v17);
        else
          -[EMBlockedSenderManager _unblockPhoneNumber:](self, "_unblockPhoneNumber:", v17);

        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    }
    while (v14);
  }

}

- (BOOL)_isEmailAddressBlocked:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  -[EMBlockedSenderManager blockedSenderCache](self, "blockedSenderCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __49__EMBlockedSenderManager__isEmailAddressBlocked___block_invoke;
  v8[3] = &unk_1E70F2328;
  v8[4] = self;
  v10 = &v11;
  v6 = v4;
  v9 = v6;
  objc_msgSend(v5, "performWhileLocked:", v8);

  LOBYTE(v4) = *((_BYTE *)v12 + 24);
  _Block_object_dispose(&v11, 8);

  return (char)v4;
}

void __49__EMBlockedSenderManager__isEmailAddressBlocked___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  if ((objc_msgSend(v4, "valid") & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "_locked_repopulateBlockedSenderCachedState:", v4);
  objc_msgSend(v4, "blockedSenders");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v3, "containsObject:", *(_QWORD *)(a1 + 40));

}

- (void)_blockPhoneNumber:(id)a3
{
  const void *CMFItemFromString;
  id v4;

  objc_msgSend(a3, "formattedInternationalStringValue");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  CMFItemFromString = (const void *)CreateCMFItemFromString();
  if (CMFItemFromString)
  {
    CMFBlockListAddItemForAllServices();
    CFRelease(CMFItemFromString);
  }

}

- (void)_unblockPhoneNumber:(id)a3
{
  const void *CMFItemFromString;
  id v4;

  objc_msgSend(a3, "formattedInternationalStringValue");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  CMFItemFromString = (const void *)CreateCMFItemFromString();
  if (CMFItemFromString)
  {
    CMFBlockListRemoveItemFromAllServices();
    CFRelease(CMFItemFromString);
  }

}

+ (BOOL)shouldPromptForBlockedSender
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("EMPromptUserForBlockedSenderKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "BOOLValue");
  else
    v4 = 1;

  return v4;
}

+ (void)setPromptForBlockedSender:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("EMPromptUserForBlockedSenderKey"));

}

+ (BOOL)shouldMoveToTrashForMailboxType:(int64_t)a3
{
  return (unint64_t)(a3 - 7) < 0xFFFFFFFFFFFFFFFCLL;
}

- (void)setBlockedSenderCache:(id)a3
{
  objc_storeStrong((id *)&self->_blockedSenderCache, a3);
}

- (void)setNotificationScheduler:(id)a3
{
  objc_storeStrong((id *)&self->_notificationScheduler, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationScheduler, 0);
  objc_storeStrong((id *)&self->_blockedSenderCache, 0);
}

@end
