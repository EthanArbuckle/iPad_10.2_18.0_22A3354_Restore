@implementation MRUHardwareVolumeController

+ (MRUHardwareVolumeController)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_36);
  return (MRUHardwareVolumeController *)(id)sharedInstance___sharedInstance_0;
}

void __45__MRUHardwareVolumeController_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance___sharedInstance_0;
  sharedInstance___sharedInstance_0 = v0;

}

- (MRUHardwareVolumeController)init
{
  MRUHardwareVolumeController *v2;
  uint64_t v3;
  NSHashTable *assertions;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MRUHardwareVolumeController;
  v2 = -[MRUHardwareVolumeController init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v3 = objc_claimAutoreleasedReturnValue();
    assertions = v2->_assertions;
    v2->_assertions = (NSHashTable *)v3;

  }
  return v2;
}

- (id)requestControlsForVolumeDataSource:(id)a3 reason:(id)a4
{
  id v6;
  id v7;
  MRUHardwareVolumeAssertion *v8;
  NSObject *v9;
  void *v10;
  int v12;
  id v13;
  __int16 v14;
  MRUHardwareVolumeAssertion *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = -[MRUHardwareVolumeAssertion initWithHardwareVolumeController:volumeDataSource:reason:]([MRUHardwareVolumeAssertion alloc], "initWithHardwareVolumeController:volumeDataSource:reason:", self, v6, v7);

  MCLogCategoryVolume();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138543618;
    v13 = v6;
    v14 = 2114;
    v15 = v8;
    _os_log_impl(&dword_1AA991000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ requesting control for: %{public}@", (uint8_t *)&v12, 0x16u);
  }

  -[MRUHardwareVolumeController assertions](self, "assertions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v8);

  -[MRUHardwareVolumeController updateControlsForAssertion:](self, "updateControlsForAssertion:", v8);
  return v8;
}

- (void)unregisterAssertion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  MCLogCategoryVolume();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138543618;
    v11 = objc_opt_class();
    v12 = 2114;
    v13 = v4;
    _os_log_impl(&dword_1AA991000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ relinquishing control for: %{public}@", (uint8_t *)&v10, 0x16u);
  }

  -[MRUHardwareVolumeController assertions](self, "assertions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObject:", v4);

  -[MRUHardwareVolumeController assertions](self, "assertions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectEnumerator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "nextObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[MRUHardwareVolumeController updateControlsForAssertion:](self, "updateControlsForAssertion:", v9);
}

- (void)updateControlsForAssertion:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  MRUHardwareVolumeDataSource *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSArray *v12;
  NSArray *invalidators;
  _QWORD v14[2];
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[MRUHardwareVolumeController relinquishHardwareVolumeButtons](self, "relinquishHardwareVolumeButtons");
  objc_msgSend(v4, "volumeDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "applicationShouldOverrideHardwareVolumeBehavior"))
  {
    MCLogCategoryVolume();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v16 = objc_opt_class();
      v17 = 2114;
      v18 = v4;
      _os_log_impl(&dword_1AA991000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ creating consumers for: %{public}@", buf, 0x16u);
    }

    v7 = -[MRUHardwareVolumeDataSource initWithVolumeDataSource:]([MRUHardwareVolumeDataSource alloc], "initWithVolumeDataSource:", v5);
    objc_msgSend(MEMORY[0x1E0DAAE70], "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "beginConsumingPressesForButtonKind:eventConsumer:priority:", 4, v7, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DAAE70], "sharedInstance", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "beginConsumingPressesForButtonKind:eventConsumer:priority:", 3, v7, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14[1] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
    v12 = (NSArray *)objc_claimAutoreleasedReturnValue();
    invalidators = self->_invalidators;
    self->_invalidators = v12;

  }
}

- (void)relinquishHardwareVolumeButtons
{
  NSArray *invalidators;

  -[NSArray makeObjectsPerformSelector:](self->_invalidators, "makeObjectsPerformSelector:", sel_invalidate);
  invalidators = self->_invalidators;
  self->_invalidators = 0;

}

- (NSHashTable)assertions
{
  return self->_assertions;
}

- (void)setAssertions:(id)a3
{
  objc_storeStrong((id *)&self->_assertions, a3);
}

- (NSArray)invalidators
{
  return self->_invalidators;
}

- (void)setInvalidators:(id)a3
{
  objc_storeStrong((id *)&self->_invalidators, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invalidators, 0);
  objc_storeStrong((id *)&self->_assertions, 0);
}

@end
