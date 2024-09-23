@implementation _LTLanguageStatus

- (_LTLanguageStatus)initWithObservationType:(unint64_t)a3 useDedicatedMachPort:(BOOL)a4 observations:(id)a5
{
  id v8;
  _LTLanguageStatus *v9;
  _LTLanguageStatus *v10;
  uint64_t v11;
  NSUUID *identifier;
  void *v13;
  id observations;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _LTLanguageStatus *v22;
  _QWORD aBlock[4];
  id v25;
  id v26;
  id location;
  objc_super v28;

  v8 = a5;
  v28.receiver = self;
  v28.super_class = (Class)_LTLanguageStatus;
  v9 = -[_LTLanguageStatus init](&v28, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_lock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v11 = objc_claimAutoreleasedReturnValue();
    identifier = v10->_identifier;
    v10->_identifier = (NSUUID *)v11;

    v10->_observationType = a3;
    v10->_useDedicatedMachPort = a4;
    objc_initWeak(&location, v10);
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = __79___LTLanguageStatus_initWithObservationType_useDedicatedMachPort_observations___block_invoke;
    aBlock[3] = &unk_2506937D0;
    objc_copyWeak(&v26, &location);
    v25 = v8;
    v13 = _Block_copy(aBlock);
    observations = v10->_observations;
    v10->_observations = v13;

    -[_LTLanguageStatus _start](v10, "_start");
    v15 = _LTOSLogAssets();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      -[_LTLanguageStatus initWithObservationType:useDedicatedMachPort:observations:].cold.1((uint64_t)v10, v15, v16, v17, v18, v19, v20, v21);
    v22 = v10;

    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
  }

  return v10;
}

- (void)dealloc
{
  OUTLINED_FUNCTION_0_2(&dword_235438000, a2, a3, "LTLanguageStatus dealloc %@", a5, a6, a7, a8, 2u);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<LTLanguageStatus %p> %@ retainCount: %ld"), self, self->_identifier, CFGetRetainCount(self));
}

- (void)_start
{
  id v3;

  +[_LTLanguageStatusMulticaster shared](_LTLanguageStatusMulticaster, "shared");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:", self);

}

- (void)cancel
{
  os_unfair_lock_s *p_lock;
  void *v4;
  _QWORD v5[5];

  p_lock = &self->_lock;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __27___LTLanguageStatus_cancel__block_invoke;
  v5[3] = &unk_2506938E8;
  v5[4] = self;
  os_unfair_lock_lock(&self->_lock);
  __27___LTLanguageStatus_cancel__block_invoke((uint64_t)v5);
  os_unfair_lock_unlock(p_lock);
  +[_LTLanguageStatusMulticaster shared](_LTLanguageStatusMulticaster, "shared");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

}

- (NSArray)cachedStatus
{
  return self->_cachedStatus;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (unint64_t)observationType
{
  return self->_observationType;
}

- (BOOL)useDedicatedMachPort
{
  return self->_useDedicatedMachPort;
}

- (id)observations
{
  return self->_observations;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_observations, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_cachedStatus, 0);
}

- (void)initWithObservationType:(uint64_t)a3 useDedicatedMachPort:(uint64_t)a4 observations:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_235438000, a2, a3, "LTLanguageStatus alloc %@", a5, a6, a7, a8, 2u);
}

@end
