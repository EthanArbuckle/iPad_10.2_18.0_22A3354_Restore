@implementation NPKThreadSafeObserverManager

- (NPKThreadSafeObserverManager)init
{
  NPKThreadSafeObserverManager *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NPKThreadSafeObserverManager;
  result = -[NPKObserverManager init](&v3, sel_init);
  if (result)
    result->_internalLock._os_unfair_lock_opaque = 0;
  return result;
}

- (void)registerObserver:(id)a3
{
  id v4;
  os_unfair_lock_s *p_internalLock;
  id v6;
  _QWORD v7[4];
  id v8;
  NPKThreadSafeObserverManager *v9;

  v4 = a3;
  p_internalLock = &self->_internalLock;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __49__NPKThreadSafeObserverManager_registerObserver___block_invoke;
  v7[3] = &unk_24CFE7E40;
  v8 = v4;
  v9 = self;
  v6 = v4;
  os_unfair_lock_lock(p_internalLock);
  __49__NPKThreadSafeObserverManager_registerObserver___block_invoke((uint64_t)v7);
  os_unfair_lock_unlock(p_internalLock);

}

id __49__NPKThreadSafeObserverManager_registerObserver___block_invoke(uint64_t a1)
{
  uint64_t v1;
  objc_super v3;

  v1 = *(_QWORD *)(a1 + 32);
  v3.receiver = *(id *)(a1 + 40);
  v3.super_class = (Class)NPKThreadSafeObserverManager;
  return objc_msgSendSuper2(&v3, sel_registerObserver_, v1);
}

- (void)registerObserver:(id)a3 withRelativePriority:(unint64_t)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  NPKThreadSafeObserverManager *v10;
  unint64_t v11;

  v6 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __70__NPKThreadSafeObserverManager_registerObserver_withRelativePriority___block_invoke;
  v8[3] = &unk_24CFE83A8;
  v10 = self;
  v11 = a4;
  v9 = v6;
  v7 = v6;
  os_unfair_lock_lock(&self->_internalLock);
  __70__NPKThreadSafeObserverManager_registerObserver_withRelativePriority___block_invoke((uint64_t)v8);
  os_unfair_lock_unlock(&self->_internalLock);

}

id __70__NPKThreadSafeObserverManager_registerObserver_withRelativePriority___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  objc_super v4;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 48);
  v4.receiver = *(id *)(a1 + 40);
  v4.super_class = (Class)NPKThreadSafeObserverManager;
  return objc_msgSendSuper2(&v4, sel_registerObserver_withRelativePriority_, v1, v2);
}

- (void)unregisterObserver:(id)a3
{
  id v4;
  os_unfair_lock_s *p_internalLock;
  id v6;
  _QWORD v7[4];
  id v8;
  NPKThreadSafeObserverManager *v9;

  v4 = a3;
  p_internalLock = &self->_internalLock;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __51__NPKThreadSafeObserverManager_unregisterObserver___block_invoke;
  v7[3] = &unk_24CFE7E40;
  v8 = v4;
  v9 = self;
  v6 = v4;
  os_unfair_lock_lock(p_internalLock);
  __51__NPKThreadSafeObserverManager_unregisterObserver___block_invoke((uint64_t)v7);
  os_unfair_lock_unlock(p_internalLock);

}

id __51__NPKThreadSafeObserverManager_unregisterObserver___block_invoke(uint64_t a1)
{
  uint64_t v1;
  objc_super v3;

  v1 = *(_QWORD *)(a1 + 32);
  v3.receiver = *(id *)(a1 + 40);
  v3.super_class = (Class)NPKThreadSafeObserverManager;
  return objc_msgSendSuper2(&v3, sel_unregisterObserver_, v1);
}

- (void)enumerateObserversUsingBlock:(id)a3
{
  id v4;
  os_unfair_lock_s *p_internalLock;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  p_internalLock = &self->_internalLock;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __61__NPKThreadSafeObserverManager_enumerateObserversUsingBlock___block_invoke;
  v7[3] = &unk_24CFE9188;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  os_unfair_lock_lock(p_internalLock);
  __61__NPKThreadSafeObserverManager_enumerateObserversUsingBlock___block_invoke((uint64_t)v7);
  os_unfair_lock_unlock(p_internalLock);

}

id __61__NPKThreadSafeObserverManager_enumerateObserversUsingBlock___block_invoke(uint64_t a1)
{
  uint64_t v1;
  objc_super v3;

  v1 = *(_QWORD *)(a1 + 40);
  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)NPKThreadSafeObserverManager;
  return objc_msgSendSuper2(&v3, sel_enumerateObserversUsingBlock_, v1);
}

- (BOOL)_hasObservers
{
  os_unfair_lock_s *p_internalLock;
  _QWORD *v3;
  _QWORD v5[2];
  id (*v6)(uint64_t);
  void *v7;
  NPKThreadSafeObserverManager *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  p_internalLock = &self->_internalLock;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v6 = __45__NPKThreadSafeObserverManager__hasObservers__block_invoke;
  v7 = &unk_24CFE8318;
  v8 = self;
  v9 = &v10;
  v3 = v5;
  os_unfair_lock_lock(p_internalLock);
  v6((uint64_t)v3);

  os_unfair_lock_unlock(p_internalLock);
  LOBYTE(p_internalLock) = *((_BYTE *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  return (char)p_internalLock;
}

id __45__NPKThreadSafeObserverManager__hasObservers__block_invoke(uint64_t a1)
{
  id result;
  objc_super v3;

  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)NPKThreadSafeObserverManager;
  result = objc_msgSendSuper2(&v3, sel_hasObservers);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = (_BYTE)result;
  return result;
}

@end
