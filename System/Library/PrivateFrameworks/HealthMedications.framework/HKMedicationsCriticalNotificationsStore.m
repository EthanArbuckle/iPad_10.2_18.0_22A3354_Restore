@implementation HKMedicationsCriticalNotificationsStore

- (HKMedicationsCriticalNotificationsStore)initWithUserDefaults:(id)a3
{
  id v5;
  HKMedicationsCriticalNotificationsStore *v6;
  HKMedicationsCriticalNotificationsStore *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKMedicationsCriticalNotificationsStore;
  v6 = -[HKMedicationsCriticalNotificationsStore init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_medicationsUserDefaults, a3);
    v7->_lock._os_unfair_lock_opaque = 0;
  }

  return v7;
}

- (HKMedicationsCriticalNotificationsStore)init
{
  void *v3;
  HKMedicationsCriticalNotificationsStore *v4;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.private.health.medications"));
  v4 = -[HKMedicationsCriticalNotificationsStore initWithUserDefaults:](self, "initWithUserDefaults:", v3);

  return v4;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_0);
  return (id)sharedInstance_sharedInstance;
}

void __57__HKMedicationsCriticalNotificationsStore_sharedInstance__block_invoke()
{
  HKMedicationsCriticalNotificationsStore *v0;
  void *v1;

  v0 = objc_alloc_init(HKMedicationsCriticalNotificationsStore);
  v1 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = (uint64_t)v0;

}

- (void)addMedications:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  -[HKMedicationsCriticalNotificationsStore _getIdentifiersSetFromMedications:](self, "_getIdentifiersSetFromMedications:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock(&self->_lock);
  -[HKMedicationsCriticalNotificationsStore _lock_getIdentifiersSet](self, "_lock_getIdentifiersSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setByAddingObjectsFromSet:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKMedicationsCriticalNotificationsStore _lock_writeToUserDefaultsWithNewIdentifier:](self, "_lock_writeToUserDefaultsWithNewIdentifier:", v5);
  os_unfair_lock_unlock(&self->_lock);

}

- (void)removeMedication:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[HKMedicationsCriticalNotificationsStore _lock_removeMedication:](self, "_lock_removeMedication:", v5);

  os_unfair_lock_unlock(p_lock);
}

- (void)setMedications:(id)a3
{
  id v4;

  -[HKMedicationsCriticalNotificationsStore _getIdentifiersSetFromMedications:](self, "_getIdentifiersSetFromMedications:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock(&self->_lock);
  -[HKMedicationsCriticalNotificationsStore _lock_writeToUserDefaultsWithNewIdentifier:](self, "_lock_writeToUserDefaultsWithNewIdentifier:", v4);
  os_unfair_lock_unlock(&self->_lock);

}

- (void)removeAll
{
  os_unfair_lock_s *p_lock;
  _QWORD v4[5];

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __52__HKMedicationsCriticalNotificationsStore_removeAll__block_invoke;
  v4[3] = &unk_1E6CD5038;
  v4[4] = self;
  -[HKMedicationsCriticalNotificationsStore _lock_syncUserDefaultUpdateToNanoPreferences:](self, "_lock_syncUserDefaultUpdateToNanoPreferences:", v4);
  os_unfair_lock_unlock(p_lock);
}

uint64_t __52__HKMedicationsCriticalNotificationsStore_removeAll__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "removeObjectForKey:", CFSTR("MedicationsCriticalNotificationIdentifiersSet"));
}

- (BOOL)containsAtLeastOneOfIdentifiers:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[HKMedicationsCriticalNotificationsStore _lock_getIdentifiersSet](self, "_lock_getIdentifiersSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "intersectsSet:", v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)containsAtLeastOneOfMedications:(id)a3
{
  void *v4;

  objc_msgSend(a3, "hk_map:", &__block_literal_global_187);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[HKMedicationsCriticalNotificationsStore containsAtLeastOneOfIdentifiers:](self, "containsAtLeastOneOfIdentifiers:", v4);

  return (char)self;
}

id __75__HKMedicationsCriticalNotificationsStore_containsAtLeastOneOfMedications___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "semanticIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int64_t)identifiersCount
{
  os_unfair_lock_s *p_lock;
  void *v4;
  int64_t v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[HKMedicationsCriticalNotificationsStore _lock_getIdentifiersSet](self, "_lock_getIdentifiersSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (void)_lock_removeMedication:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  -[HKMedicationsCriticalNotificationsStore _lock_getIdentifiersSet](self, "_lock_getIdentifiersSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v8, "semanticIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObject:", v7);

    -[HKMedicationsCriticalNotificationsStore _lock_writeToUserDefaultsWithNewIdentifier:](self, "_lock_writeToUserDefaultsWithNewIdentifier:", v5);
  }

}

- (void)_lock_writeToUserDefaultsWithNewIdentifier:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __86__HKMedicationsCriticalNotificationsStore__lock_writeToUserDefaultsWithNewIdentifier___block_invoke;
  v6[3] = &unk_1E6CD50A0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[HKMedicationsCriticalNotificationsStore _lock_syncUserDefaultUpdateToNanoPreferences:](self, "_lock_syncUserDefaultUpdateToNanoPreferences:", v6);

}

void __86__HKMedicationsCriticalNotificationsStore__lock_writeToUserDefaultsWithNewIdentifier___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  objc_msgSend(*(id *)(a1 + 40), "allObjects");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setObject:forKey:", v2, CFSTR("MedicationsCriticalNotificationIdentifiersSet"));

}

- (void)_lock_syncUserDefaultUpdateToNanoPreferences:(id)a3
{
  os_unfair_lock_s *p_lock;
  void (**v4)(_QWORD);
  id v5;

  p_lock = &self->_lock;
  v4 = (void (**)(_QWORD))a3;
  os_unfair_lock_assert_owner(p_lock);
  v4[2](v4);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("MedicationsFollowUpNotificationsEnabled"), CFSTR("MedicationsCriticalNotificationIdentifiersSet"), 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  HKSynchronizeNanoPreferencesUserDefaults();

}

- (id)_lock_getIdentifiersSet
{
  void *v3;
  void *v4;

  os_unfair_lock_assert_owner(&self->_lock);
  -[NSUserDefaults objectForKey:](self->_medicationsUserDefaults, "objectForKey:", CFSTR("MedicationsCriticalNotificationIdentifiersSet"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v3);
  else
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_getIdentifiersSetFromMedications:(id)a3
{
  return (id)objc_msgSend(a3, "hk_mapToSet:", &__block_literal_global_188);
}

id __77__HKMedicationsCriticalNotificationsStore__getIdentifiersSetFromMedications___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "semanticIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_medicationsUserDefaults, 0);
}

@end
