@implementation BUManagedRestrictionsProvider

- (BOOL)isExplicitContentAllowed
{
  NSObject *accessQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = sub_212E47BF4;
  v5[3] = &unk_24CED9AC8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isBookStoreAllowed
{
  NSObject *accessQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = sub_212E47DA4;
  v5[3] = &unk_24CED9AC8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)addObserver:(id)a3
{
  id v4;
  os_unfair_lock_s *p_observersLock;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  p_observersLock = &self->_observersLock;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_212E495B8;
  v7[3] = &unk_24CED9CD0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  os_unfair_lock_lock(p_observersLock);
  ((void (*)(_QWORD *))sub_212E495B8)(v7);
  os_unfair_lock_unlock(p_observersLock);

}

- (BOOL)isAccountModificationAllowed
{
  NSObject *accessQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = sub_212E497B8;
  v5[3] = &unk_24CED9AC8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setIsExplicitContentAllowed:(BOOL)a3
{
  self->_isExplicitContentAllowed = a3;
}

- (void)setIsBookStoreAllowed:(BOOL)a3
{
  self->_isBookStoreAllowed = a3;
}

- (void)setIsAccountModificationAllowed:(BOOL)a3
{
  self->_isAccountModificationAllowed = a3;
}

- (BUManagedRestrictionsProvider)init
{
  BUManagedRestrictionsProvider *v2;
  BUManagedRestrictionsProvider *v3;
  NSObject *v4;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *accessQueue;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  NSHashTable *observers;
  NSObject *v12;
  _QWORD block[4];
  BUManagedRestrictionsProvider *v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)BUManagedRestrictionsProvider;
  v2 = -[BUManagedRestrictionsProvider init](&v16, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_observersLock._os_unfair_lock_opaque = 0;
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_USER_INITIATED, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create("BUManagedRestrictionsProvider.accessQueue", v5);
    accessQueue = v3->_accessQueue;
    v3->_accessQueue = (OS_dispatch_queue *)v6;

    objc_msgSend_weakObjectsHashTable(MEMORY[0x24BDD15C0], v8, v9);
    v10 = objc_claimAutoreleasedReturnValue();
    observers = v3->_observers;
    v3->_observers = (NSHashTable *)v10;

    v12 = v3->_accessQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = sub_212E49444;
    block[3] = &unk_24CED9E10;
    v15 = v3;
    dispatch_async(v12, block);

  }
  return v3;
}

- (void)dealloc
{
  uint64_t v2;
  void *v4;
  const char *v5;
  objc_super v6;

  objc_msgSend_sharedConnection(MEMORY[0x24BE63CB0], a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_unregisterObserver_(v4, v5, (uint64_t)self);

  v6.receiver = self;
  v6.super_class = (Class)BUManagedRestrictionsProvider;
  -[BUManagedRestrictionsProvider dealloc](&v6, sel_dealloc);
}

- (void)removeObserver:(id)a3
{
  id v4;
  os_unfair_lock_s *p_observersLock;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  p_observersLock = &self->_observersLock;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_212E643C0;
  v7[3] = &unk_24CED9CD0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  os_unfair_lock_lock(p_observersLock);
  ((void (*)(_QWORD *))sub_212E643C0)(v7);
  os_unfair_lock_unlock(p_observersLock);

}

- (id)_currentObserversCopy
{
  os_unfair_lock_s *p_observersLock;
  _QWORD *v3;
  id v4;
  _QWORD v6[2];
  void (*v7)(uint64_t, const char *, uint64_t);
  void *v8;
  BUManagedRestrictionsProvider *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = sub_212E644B8;
  v15 = sub_212E644C8;
  v16 = 0;
  p_observersLock = &self->_observersLock;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v7 = sub_212E644D0;
  v8 = &unk_24CED9AC8;
  v9 = self;
  v10 = &v11;
  v3 = v6;
  os_unfair_lock_lock(p_observersLock);
  ((void (*)(_QWORD *))v7)(v3);
  os_unfair_lock_unlock(p_observersLock);

  v4 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v4;
}

- (void)_uq_notifyObserversForBookStoreRestrictionsChange
{
  BOOL isBookStoreAllowed;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  _QWORD v15[5];
  BOOL v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  isBookStoreAllowed = self->_isBookStoreAllowed;
  objc_msgSend__currentObserversCopy(self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    v11 = MEMORY[0x24BDAC9B8];
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v6);
        v13 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v12);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v15[0] = MEMORY[0x24BDAC760];
          v15[1] = 3221225472;
          v15[2] = sub_212E64694;
          v15[3] = &unk_24CEDA0B0;
          v15[4] = v13;
          v16 = isBookStoreAllowed;
          dispatch_async(v11, v15);
        }
        ++v12;
      }
      while (v9 != v12);
      v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v14, (uint64_t)&v17, v21, 16);
    }
    while (v9);
  }

}

- (void)_uq_notifyObserversForExplicitContentRestrictionsChange
{
  BOOL isExplicitContentAllowed;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  _QWORD v15[5];
  BOOL v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  isExplicitContentAllowed = self->_isExplicitContentAllowed;
  objc_msgSend__currentObserversCopy(self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    v11 = MEMORY[0x24BDAC9B8];
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v6);
        v13 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v12);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v15[0] = MEMORY[0x24BDAC760];
          v15[1] = 3221225472;
          v15[2] = sub_212E64814;
          v15[3] = &unk_24CEDA0B0;
          v15[4] = v13;
          v16 = isExplicitContentAllowed;
          dispatch_async(v11, v15);
        }
        ++v12;
      }
      while (v9 != v12);
      v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v14, (uint64_t)&v17, v21, 16);
    }
    while (v9);
  }

}

- (void)_uq_notifyObserversForAccountModificationRestrictionsChange
{
  BOOL isAccountModificationAllowed;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  _QWORD v15[5];
  BOOL v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  isAccountModificationAllowed = self->_isAccountModificationAllowed;
  objc_msgSend__currentObserversCopy(self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    v11 = MEMORY[0x24BDAC9B8];
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v6);
        v13 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v12);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v15[0] = MEMORY[0x24BDAC760];
          v15[1] = 3221225472;
          v15[2] = sub_212E64994;
          v15[3] = &unk_24CEDA0B0;
          v15[4] = v13;
          v16 = isAccountModificationAllowed;
          dispatch_async(v11, v15);
        }
        ++v12;
      }
      while (v9 != v12);
      v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v14, (uint64_t)&v17, v21, 16);
    }
    while (v9);
  }

}

- (void)_uq_updateRestrictionsIfNeeded
{
  const char *v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  _BOOL4 v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  _BOOL4 v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  _BOOL4 v17;
  const char *v18;
  uint64_t v19;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  objc_msgSend_sharedConnection(MEMORY[0x24BE63CB0], v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend_effectiveBoolValueForSetting_(v5, v6, *MEMORY[0x24BE63828]) != 2;

  objc_msgSend_sharedConnection(MEMORY[0x24BE63CB0], v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend_effectiveBoolValueForSetting_(v10, v11, *MEMORY[0x24BE63830]) != 2;

  objc_msgSend_sharedConnection(MEMORY[0x24BE63CB0], v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend_effectiveBoolValueForSetting_(v15, v16, *MEMORY[0x24BE63770]) != 2;

  if (self->_isBookStoreAllowed != v7)
  {
    self->_isBookStoreAllowed = v7;
    objc_msgSend__uq_notifyObserversForBookStoreRestrictionsChange(self, v18, v19);
  }
  if (self->_isExplicitContentAllowed != v12)
  {
    self->_isExplicitContentAllowed = v12;
    objc_msgSend__uq_notifyObserversForExplicitContentRestrictionsChange(self, v18, v19);
  }
  if (self->_isAccountModificationAllowed != v17)
  {
    self->_isAccountModificationAllowed = v17;
    MEMORY[0x24BEDD108](self, sel__uq_notifyObserversForAccountModificationRestrictionsChange, v19);
  }
}

- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4
{
  NSObject *accessQueue;
  _QWORD block[5];

  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_212E64B10;
  block[3] = &unk_24CED9E10;
  block[4] = self;
  dispatch_async(accessQueue, block);
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

@end
