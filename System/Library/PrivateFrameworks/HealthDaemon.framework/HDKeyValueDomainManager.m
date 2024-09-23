@implementation HDKeyValueDomainManager

- (HDKeyValueDomainManager)initWithProfile:(id)a3
{
  id v4;
  HDKeyValueDomainManager *v5;
  HDKeyValueDomainManager *v6;
  _HKWeakObserversMap *v7;
  _HKWeakObserversMap *observers;
  uint64_t v9;
  NSMutableSet *pendingNotificationKeys;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HDKeyValueDomainManager;
  v5 = -[HDKeyValueDomainManager init](&v12, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_profile, v4);
    v7 = (_HKWeakObserversMap *)objc_alloc_init(MEMORY[0x1E0CB7030]);
    observers = v6->_observers;
    v6->_observers = v7;

    v6->_pendingNotificationLock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v9 = objc_claimAutoreleasedReturnValue();
    pendingNotificationKeys = v6->_pendingNotificationKeys;
    v6->_pendingNotificationKeys = (NSMutableSet *)v9;

    v6->_hasAddedTransactionOnCommitBlock = 0;
  }

  return v6;
}

- (id)_observerKeyForDomainName:(id)a3 category:(int64_t)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("HDKeyValueDomainManager_Observers_%@_%ld"), a3, a4);
}

- (id)_observerKeyForDomain:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  objc_msgSend(v4, "domainName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "category");

  -[HDKeyValueDomainManager _observerKeyForDomainName:category:](self, "_observerKeyForDomainName:category:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)startObservationForDomain:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HDKeyValueDomainManager _observerKeyForDomain:](self, "_observerKeyForDomain:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[_HKWeakObserversMap addObserver:forKey:](self->_observers, "addObserver:forKey:", v4, v5);

}

- (void)stopObservationForDomain:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HDKeyValueDomainManager _observerKeyForDomain:](self, "_observerKeyForDomain:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[_HKWeakObserversMap removeObserver:forKey:](self->_observers, "removeObserver:forKey:", v4, v5);

}

- (void)_notifyObserversFor:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __47__HDKeyValueDomainManager__notifyObserversFor___block_invoke;
  v3[3] = &unk_1E6CF4C80;
  v3[4] = self;
  objc_msgSend(a3, "enumerateObjectsUsingBlock:", v3);
}

uint64_t __47__HDKeyValueDomainManager__notifyObserversFor___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "notifyObserversOfKey:handler:", a2, &__block_literal_global_75);
}

uint64_t __47__HDKeyValueDomainManager__notifyObserversFor___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "notifyObservers");
}

- (void)batchNotificationForDomain:(id)a3 category:(int64_t)a4 forTransaction:(id)a5
{
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  _QWORD aBlock[5];

  v8 = a5;
  v9 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __78__HDKeyValueDomainManager_batchNotificationForDomain_category_forTransaction___block_invoke;
  aBlock[3] = &unk_1E6CE80E8;
  aBlock[4] = self;
  v10 = a3;
  v11 = _Block_copy(aBlock);
  v14[0] = v9;
  v14[1] = 3221225472;
  v14[2] = __78__HDKeyValueDomainManager_batchNotificationForDomain_category_forTransaction___block_invoke_2;
  v14[3] = &unk_1E6CE8030;
  v14[4] = self;
  v12 = _Block_copy(v14);
  -[HDKeyValueDomainManager _observerKeyForDomainName:category:](self, "_observerKeyForDomainName:category:", v10, a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_lock(&self->_pendingNotificationLock);
  -[NSMutableSet addObject:](self->_pendingNotificationKeys, "addObject:", v13);
  if (!self->_hasAddedTransactionOnCommitBlock)
  {
    self->_hasAddedTransactionOnCommitBlock = 1;
    objc_msgSend(v8, "onCommit:orRollback:", v11, v12);
  }
  os_unfair_lock_unlock(&self->_pendingNotificationLock);

}

void __78__HDKeyValueDomainManager_batchNotificationForDomain_category_forTransaction___block_invoke(uint64_t a1)
{
  id v2;

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 16));
  v2 = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "copy");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeAllObjects");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 32) = 0;
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 16));
  objc_msgSend(*(id *)(a1 + 32), "_notifyObserversFor:", v2);

}

void __78__HDKeyValueDomainManager_batchNotificationForDomain_category_forTransaction___block_invoke_2(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 16));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeAllObjects");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 32) = 0;
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 16));
}

- (HDProfile)profile
{
  return (HDProfile *)objc_loadWeakRetained((id *)&self->_profile);
}

- (void)setProfile:(id)a3
{
  objc_storeWeak((id *)&self->_profile, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_profile);
  objc_storeStrong((id *)&self->_pendingNotificationKeys, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
