@implementation HDDrugInteractionFactorStateProvider

- (HDDrugInteractionFactorStateProvider)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (HDDrugInteractionFactorStateProvider)initWithDaemon:(id)a3
{
  id v4;
  HDDrugInteractionFactorStateProvider *v5;
  HDDrugInteractionFactorStateProvider *v6;
  id v7;
  void *v8;
  uint64_t v9;
  HDDrugInteractionFactorStateObserver *observers;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HDDrugInteractionFactorStateProvider;
  v5 = -[HDDrugInteractionFactorStateProvider init](&v12, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_daemon, v4);
    v7 = objc_alloc(MEMORY[0x1E0CB6988]);
    HKLogHealthOntology();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "initWithName:loggingCategory:", CFSTR("HDDrugInteractionFactorStateObserver"), v8);
    observers = v6->_observers;
    v6->_observers = (HDDrugInteractionFactorStateObserver *)v9;

    v6->_lock._os_unfair_lock_opaque = 0;
  }

  return v6;
}

- (void)dealloc
{
  os_unfair_lock_s *p_lock;
  objc_super v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self)
  {
    os_unfair_lock_assert_owner(p_lock);
    -[HDKeyValueDomain stopObservation:](self->_lock_medicationsKeyValueDomain, "stopObservation:", self);
  }
  os_unfair_lock_unlock(p_lock);
  v4.receiver = self;
  v4.super_class = (Class)HDDrugInteractionFactorStateProvider;
  -[HDDrugInteractionFactorStateProvider dealloc](&v4, sel_dealloc);
}

- (void)monitorDrugInteractionFactorsInProfile:(id)a3
{
  HDKeyValueDomain *v4;
  HDKeyValueDomain *lock_medicationsKeyValueDomain;
  id v6;

  v6 = a3;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_lock_medicationsKeyValueDomain)
  {
    objc_msgSend(MEMORY[0x1E0D294B8], "hdmd_defaultDomainWithProfile:", v6);
    v4 = (HDKeyValueDomain *)objc_claimAutoreleasedReturnValue();
    lock_medicationsKeyValueDomain = self->_lock_medicationsKeyValueDomain;
    self->_lock_medicationsKeyValueDomain = v4;

    -[HDDrugInteractionFactorStateProvider _lock_startMonitoringKeyValueDomain]((const os_unfair_lock *)self);
  }
  os_unfair_lock_unlock(&self->_lock);

}

- (const)_lock_startMonitoringKeyValueDomain
{
  const os_unfair_lock *v1;
  const os_unfair_lock *v2;

  if (result)
  {
    v1 = result;
    v2 = result + 4;
    os_unfair_lock_assert_owner(result + 4);
    os_unfair_lock_assert_owner(v2);
    objc_msgSend(*(id *)&v1[6]._os_unfair_lock_opaque, "startObservation:", v1);
    return -[HDDrugInteractionFactorStateProvider _lock_initalizeDrugInteractionFactorStates](v1);
  }
  return result;
}

- (int64_t)hasDrugInteractionFactorInProfile:(id)a3
{
  os_unfair_lock_s *p_lock;
  unsigned int v5;
  HDKeyValueDomain *lock_medicationsKeyValueDomain;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v5 = -[HDDrugInteractionFactorStateProvider _lock_hasDrugInteractionFactor]((const os_unfair_lock *)self);
  lock_medicationsKeyValueDomain = self->_lock_medicationsKeyValueDomain;
  os_unfair_lock_unlock(p_lock);
  if (lock_medicationsKeyValueDomain)
    return v5;
  else
    return 2;
}

- (const)_lock_hasDrugInteractionFactor
{
  const os_unfair_lock *v1;

  if (result)
  {
    v1 = result;
    os_unfair_lock_assert_owner(result + 4);
    if (LOBYTE(v1[8]._os_unfair_lock_opaque) || BYTE1(v1[8]._os_unfair_lock_opaque))
      return (const os_unfair_lock *)1;
    else
      return (const os_unfair_lock *)(BYTE2(v1[8]._os_unfair_lock_opaque) != 0);
  }
  return result;
}

- (void)addDrugInteractionFactorStateObserver:(id)a3 queue:(id)a4
{
  -[HDDrugInteractionFactorStateObserver registerObserver:queue:](self->_observers, "registerObserver:queue:", a3, a4);
}

- (void)removeDrugInteractionFactorStateObserver:(id)a3
{
  -[HDDrugInteractionFactorStateObserver unregisterObserver:](self->_observers, "unregisterObserver:", a3);
}

- (const)_lock_initalizeDrugInteractionFactorStates
{
  const os_unfair_lock *v1;

  if (result)
  {
    v1 = result;
    os_unfair_lock_assert_owner(result + 4);
    LOBYTE(v1[8]._os_unfair_lock_opaque) = objc_msgSend(*(id *)&v1[6]._os_unfair_lock_opaque, "hdmd_numberValueAsBoolForKey:", *MEMORY[0x1E0D2C280]);
    BYTE1(v1[8]._os_unfair_lock_opaque) = objc_msgSend(*(id *)&v1[6]._os_unfair_lock_opaque, "hdmd_numberValueAsBoolForKey:", *MEMORY[0x1E0D2C2E8]);
    result = (const os_unfair_lock *)objc_msgSend(*(id *)&v1[6]._os_unfair_lock_opaque, "hdmd_numberValueAsBoolForKey:", *MEMORY[0x1E0D2C380]);
    BYTE2(v1[8]._os_unfair_lock_opaque) = (_BYTE)result;
  }
  return result;
}

- (void)didUpdateKeyValueDomain:(id)a3
{
  os_unfair_lock_s *p_lock;
  unsigned int v5;
  unsigned int v6;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v5 = -[HDDrugInteractionFactorStateProvider _lock_hasDrugInteractionFactor]((const os_unfair_lock *)self);
  -[HDDrugInteractionFactorStateProvider _lock_updateChangeForKey:]((uint64_t)self, (void *)*MEMORY[0x1E0D2C280]);
  -[HDDrugInteractionFactorStateProvider _lock_updateChangeForKey:]((uint64_t)self, (void *)*MEMORY[0x1E0D2C2E8]);
  -[HDDrugInteractionFactorStateProvider _lock_updateChangeForKey:]((uint64_t)self, (void *)*MEMORY[0x1E0D2C380]);
  v6 = -[HDDrugInteractionFactorStateProvider _lock_hasDrugInteractionFactor]((const os_unfair_lock *)self);
  os_unfair_lock_unlock(p_lock);
  if (v5 != v6)
    -[HDDrugInteractionFactorStateProvider _notifyObserversWithHasDrugInteractionFactor:]((uint64_t)self, v6);
}

- (void)_lock_updateChangeForKey:(uint64_t)a1
{
  void *v3;
  id v4;

  if (a1)
  {
    v3 = *(void **)(a1 + 24);
    v4 = a2;
    -[HDDrugInteractionFactorStateProvider _lock_updateDrugInteractionFactorForKey:newValue:]((const os_unfair_lock *)a1, v4, objc_msgSend(v3, "hdmd_numberValueAsBoolForKey:", v4));

  }
}

- (uint64_t)_notifyObserversWithHasDrugInteractionFactor:(uint64_t)result
{
  void *v2;
  _QWORD v3[6];

  if (result)
  {
    v2 = *(void **)(result + 8);
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __85__HDDrugInteractionFactorStateProvider__notifyObserversWithHasDrugInteractionFactor___block_invoke;
    v3[3] = &unk_1E6E00EF0;
    v3[4] = result;
    v3[5] = a2;
    return objc_msgSend(v2, "notifyObservers:", v3);
  }
  return result;
}

- (void)_lock_updateDrugInteractionFactorForKey:(char)a3 newValue:
{
  id v5;
  char v6;
  uint64_t v7;
  char v8;
  int v9;
  void *v10;

  v5 = a2;
  if (a1)
  {
    v10 = v5;
    os_unfair_lock_assert_owner(a1 + 4);
    v5 = v10;
    if ((void *)*MEMORY[0x1E0D2C280] == v10
      || *MEMORY[0x1E0D2C280] && (v6 = objc_msgSend(v10, "isEqualToString:"), v5 = v10, (v6 & 1) != 0))
    {
      v7 = 32;
LABEL_14:
      *((_BYTE *)&a1->_os_unfair_lock_opaque + v7) = a3;
      goto LABEL_15;
    }
    if ((id)*MEMORY[0x1E0D2C2E8] == v5
      || *MEMORY[0x1E0D2C2E8] && (v8 = objc_msgSend(v5, "isEqualToString:"), v5 = v10, (v8 & 1) != 0))
    {
      v7 = 33;
      goto LABEL_14;
    }
    if ((id)*MEMORY[0x1E0D2C380] == v5
      || *MEMORY[0x1E0D2C380] && (v9 = objc_msgSend(v5, "isEqualToString:"), v5 = v10, v9))
    {
      v7 = 34;
      goto LABEL_14;
    }
  }
LABEL_15:

}

void __85__HDDrugInteractionFactorStateProvider__notifyObserversWithHasDrugInteractionFactor___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  void *v5;
  id WeakRetained;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(v3 + 40));
  objc_msgSend(WeakRetained, "primaryProfile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "drugInteractionFactorStateProvider:didObserveChangeForProfile:hasDrugInteractionFactor:", v3, v5, *(_QWORD *)(a1 + 40));

}

- (HDDaemon)daemon
{
  return (HDDaemon *)objc_loadWeakRetained((id *)&self->_daemon);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_daemon);
  objc_storeStrong((id *)&self->_lock_medicationsKeyValueDomain, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
