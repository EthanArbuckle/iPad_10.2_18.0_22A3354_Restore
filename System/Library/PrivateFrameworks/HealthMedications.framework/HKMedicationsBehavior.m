@implementation HKMedicationsBehavior

- (BOOL)medicationsFutureMigrationsEnabled
{
  return self->_medicationsFutureMigrationsEnabled;
}

+ (id)sharedBehavior
{
  HKMedicationsBehavior *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;

  os_unfair_lock_lock((os_unfair_lock_t)&_sharedMedicationsBehaviorLock);
  if (!sharedBehavior_defaultBehavior)
  {
    v2 = objc_alloc_init(HKMedicationsBehavior);
    v3 = (void *)sharedBehavior_defaultBehavior;
    sharedBehavior_defaultBehavior = (uint64_t)v2;

  }
  v4 = (id)_sharedMedicationsBehaviorOverride;
  os_unfair_lock_unlock((os_unfair_lock_t)&_sharedMedicationsBehaviorLock);
  if (v4)
    v5 = v4;
  else
    v5 = (void *)sharedBehavior_defaultBehavior;
  v6 = v5;

  return v6;
}

- (HKMedicationsBehavior)init
{
  return (HKMedicationsBehavior *)-[HKMedicationsBehavior _initWithFutureMigrationsEnabled:asyncMedicationReschedulesEnabled:mockPairedDevice:](self, "_initWithFutureMigrationsEnabled:asyncMedicationReschedulesEnabled:mockPairedDevice:", +[HKMedicationsBehavior _medicationFutureMigrationsEnabled](HKMedicationsBehavior, "_medicationFutureMigrationsEnabled"), 1, 0);
}

- (id)_initWithFutureMigrationsEnabled:(BOOL)a3 asyncMedicationReschedulesEnabled:(BOOL)a4 mockPairedDevice:(id)a5
{
  id v9;
  HKMedicationsBehavior *v10;
  HKMedicationsBehavior *v11;
  objc_super v13;

  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)HKMedicationsBehavior;
  v10 = -[HKMedicationsBehavior init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_medicationsFutureMigrationsEnabled = a3;
    v10->_asyncMedicationReschedulesEnabled = a4;
    objc_storeStrong((id *)&v10->_mockPairedDevice, a5);
  }

  return v11;
}

+ (void)setSharedBehavior:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&_sharedMedicationsBehaviorLock);
  v4 = (void *)_sharedMedicationsBehaviorOverride;
  _sharedMedicationsBehaviorOverride = (uint64_t)v3;

  os_unfair_lock_unlock((os_unfair_lock_t)&_sharedMedicationsBehaviorLock);
}

+ (void)resetSharedBehavior
{
  void *v2;

  os_unfair_lock_lock((os_unfair_lock_t)&_sharedMedicationsBehaviorLock);
  v2 = (void *)_sharedMedicationsBehaviorOverride;
  _sharedMedicationsBehaviorOverride = 0;

  os_unfair_lock_unlock((os_unfair_lock_t)&_sharedMedicationsBehaviorLock);
}

+ (BOOL)_medicationFutureMigrationsEnabled
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "persistentDomainForName:", *MEMORY[0x1E0CB7590]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKey:", CFSTR("EnableMedicationsDatabaseFutureMigrations"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

+ (BOOL)hasSupportedAppleWatchPaired
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend((id)objc_opt_class(), "_getActivePairedDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    if ((objc_msgSend(v2, "supportsMedicationsCapability") & 1) != 0)
      v4 = 1;
    else
      v4 = objc_msgSend(v3, "supportsMeadowCapability");
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)_getActivePairedDevice
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  +[HKMedicationsBehavior sharedBehavior](HKMedicationsBehavior, "sharedBehavior");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mockPairedDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D51838], "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "getActivePairedDevice");
    v4 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

+ (id)_unitTesting_behaviorWithMockPairedDevice:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = -[HKMedicationsBehavior _initWithFutureMigrationsEnabled:asyncMedicationReschedulesEnabled:mockPairedDevice:]([HKMedicationsBehavior alloc], "_initWithFutureMigrationsEnabled:asyncMedicationReschedulesEnabled:mockPairedDevice:", +[HKMedicationsBehavior _medicationFutureMigrationsEnabled](HKMedicationsBehavior, "_medicationFutureMigrationsEnabled"), 1, v3);

  return v4;
}

- (void)setMedicationsFutureMigrationsEnabled:(BOOL)a3
{
  self->_medicationsFutureMigrationsEnabled = a3;
}

- (BOOL)asyncMedicationReschedulesEnabled
{
  return self->_asyncMedicationReschedulesEnabled;
}

- (void)setAsyncMedicationReschedulesEnabled:(BOOL)a3
{
  self->_asyncMedicationReschedulesEnabled = a3;
}

- (HKMedicationsCapabilityProviding)mockPairedDevice
{
  return self->_mockPairedDevice;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mockPairedDevice, 0);
}

@end
