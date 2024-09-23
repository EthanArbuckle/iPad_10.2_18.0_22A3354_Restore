@implementation _HKFeatureFlags

- (BOOL)pauseRings
{
  os_unfair_lock_s *p_loadLock;
  char value;
  _QWORD *v5;
  uint64_t v6;
  _QWORD v8[3];
  _QWORD *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v8[0] = &unk_1E37F61A0;
  v8[1] = &__block_literal_global_119;
  v9 = v8;
  p_loadLock = &self->_pauseRings._loadLock;
  os_unfair_lock_lock(&self->_pauseRings._loadLock);
  if (self->_pauseRings._hasLoaded)
  {
    value = self->_pauseRings._value;
  }
  else
  {
    if (!v9)
      std::__throw_bad_function_call[abi:ne180100]();
    value = (*(uint64_t (**)(_QWORD *))(*v9 + 48))(v9);
    self->_pauseRings._value = value;
    self->_pauseRings._hasLoaded = 1;
  }
  os_unfair_lock_unlock(p_loadLock);
  v5 = v9;
  if (v9 == v8)
  {
    v6 = 4;
    v5 = v8;
    goto LABEL_9;
  }
  if (v9)
  {
    v6 = 5;
LABEL_9:
    (*(void (**)(void))(*v5 + 8 * v6))();
  }
  return value;
}

- (void)setPauseRings:(BOOL)a3
{
  os_unfair_lock_s *p_loadLock;

  p_loadLock = &self->_pauseRings._loadLock;
  os_unfair_lock_lock(&self->_pauseRings._loadLock);
  self->_pauseRings._hasLoaded = 1;
  self->_pauseRings._value = a3;
  os_unfair_lock_unlock(p_loadLock);
}

- (BOOL)scheduledGoals
{
  os_unfair_lock_s *p_loadLock;
  char value;
  _QWORD *v5;
  uint64_t v6;
  _QWORD v8[3];
  _QWORD *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v8[0] = &unk_1E37F61A0;
  v8[1] = &__block_literal_global_6_0;
  v9 = v8;
  p_loadLock = &self->_scheduledGoals._loadLock;
  os_unfair_lock_lock(&self->_scheduledGoals._loadLock);
  if (self->_scheduledGoals._hasLoaded)
  {
    value = self->_scheduledGoals._value;
  }
  else
  {
    if (!v9)
      std::__throw_bad_function_call[abi:ne180100]();
    value = (*(uint64_t (**)(_QWORD *))(*v9 + 48))(v9);
    self->_scheduledGoals._value = value;
    self->_scheduledGoals._hasLoaded = 1;
  }
  os_unfair_lock_unlock(p_loadLock);
  v5 = v9;
  if (v9 == v8)
  {
    v6 = 4;
    v5 = v8;
    goto LABEL_9;
  }
  if (v9)
  {
    v6 = 5;
LABEL_9:
    (*(void (**)(void))(*v5 + 8 * v6))();
  }
  return value;
}

- (void)setScheduledGoals:(BOOL)a3
{
  os_unfair_lock_s *p_loadLock;

  p_loadLock = &self->_scheduledGoals._loadLock;
  os_unfair_lock_lock(&self->_scheduledGoals._loadLock);
  self->_scheduledGoals._hasLoaded = 1;
  self->_scheduledGoals._value = a3;
  os_unfair_lock_unlock(p_loadLock);
}

- (BOOL)bloodPressureTrends
{
  os_unfair_lock_s *p_loadLock;
  char value;
  _QWORD *v5;
  uint64_t v6;
  _QWORD v8[3];
  _QWORD *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v8[0] = &unk_1E37F61A0;
  v8[1] = &__block_literal_global_8;
  v9 = v8;
  p_loadLock = &self->_bloodPressureTrends._loadLock;
  os_unfair_lock_lock(&self->_bloodPressureTrends._loadLock);
  if (self->_bloodPressureTrends._hasLoaded)
  {
    value = self->_bloodPressureTrends._value;
  }
  else
  {
    if (!v9)
      std::__throw_bad_function_call[abi:ne180100]();
    value = (*(uint64_t (**)(_QWORD *))(*v9 + 48))(v9);
    self->_bloodPressureTrends._value = value;
    self->_bloodPressureTrends._hasLoaded = 1;
  }
  os_unfair_lock_unlock(p_loadLock);
  v5 = v9;
  if (v9 == v8)
  {
    v6 = 4;
    v5 = v8;
    goto LABEL_9;
  }
  if (v9)
  {
    v6 = 5;
LABEL_9:
    (*(void (**)(void))(*v5 + 8 * v6))();
  }
  return value;
}

- (void)setBloodPressureTrends:(BOOL)a3
{
  os_unfair_lock_s *p_loadLock;

  p_loadLock = &self->_bloodPressureTrends._loadLock;
  os_unfair_lock_lock(&self->_bloodPressureTrends._loadLock);
  self->_bloodPressureTrends._hasLoaded = 1;
  self->_bloodPressureTrends._value = a3;
  os_unfair_lock_unlock(p_loadLock);
}

- (BOOL)chamomile
{
  os_unfair_lock_s *p_loadLock;
  char value;
  _QWORD *v5;
  uint64_t v6;
  _QWORD v8[3];
  _QWORD *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v8[0] = &unk_1E37F61A0;
  v8[1] = &__block_literal_global_11;
  v9 = v8;
  p_loadLock = &self->_chamomile._loadLock;
  os_unfair_lock_lock(&self->_chamomile._loadLock);
  if (self->_chamomile._hasLoaded)
  {
    value = self->_chamomile._value;
  }
  else
  {
    if (!v9)
      std::__throw_bad_function_call[abi:ne180100]();
    value = (*(uint64_t (**)(_QWORD *))(*v9 + 48))(v9);
    self->_chamomile._value = value;
    self->_chamomile._hasLoaded = 1;
  }
  os_unfair_lock_unlock(p_loadLock);
  v5 = v9;
  if (v9 == v8)
  {
    v6 = 4;
    v5 = v8;
    goto LABEL_9;
  }
  if (v9)
  {
    v6 = 5;
LABEL_9:
    (*(void (**)(void))(*v5 + 8 * v6))();
  }
  return value;
}

- (void)setChamomile:(BOOL)a3
{
  os_unfair_lock_s *p_loadLock;

  p_loadLock = &self->_chamomile._loadLock;
  os_unfair_lock_lock(&self->_chamomile._loadLock);
  self->_chamomile._hasLoaded = 1;
  self->_chamomile._value = a3;
  os_unfair_lock_unlock(p_loadLock);
}

- (BOOL)conceptAPIAndAuthorization
{
  os_unfair_lock_s *p_loadLock;
  char value;
  _QWORD *v5;
  uint64_t v6;
  _QWORD v8[3];
  _QWORD *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v8[0] = &unk_1E37F61A0;
  v8[1] = &__block_literal_global_13_2;
  v9 = v8;
  p_loadLock = &self->_conceptAPIAndAuthorization._loadLock;
  os_unfair_lock_lock(&self->_conceptAPIAndAuthorization._loadLock);
  if (self->_conceptAPIAndAuthorization._hasLoaded)
  {
    value = self->_conceptAPIAndAuthorization._value;
  }
  else
  {
    if (!v9)
      std::__throw_bad_function_call[abi:ne180100]();
    value = (*(uint64_t (**)(_QWORD *))(*v9 + 48))(v9);
    self->_conceptAPIAndAuthorization._value = value;
    self->_conceptAPIAndAuthorization._hasLoaded = 1;
  }
  os_unfair_lock_unlock(p_loadLock);
  v5 = v9;
  if (v9 == v8)
  {
    v6 = 4;
    v5 = v8;
    goto LABEL_9;
  }
  if (v9)
  {
    v6 = 5;
LABEL_9:
    (*(void (**)(void))(*v5 + 8 * v6))();
  }
  return value;
}

- (BOOL)databaseStateCacheTransactionScoped
{
  os_unfair_lock_s *p_loadLock;
  char value;
  _QWORD *v5;
  uint64_t v6;
  _QWORD v8[3];
  _QWORD *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v8[0] = &unk_1E37F61A0;
  v8[1] = &__block_literal_global_15_3;
  v9 = v8;
  p_loadLock = &self->_databaseStateCacheTransactionScoped._loadLock;
  os_unfair_lock_lock(&self->_databaseStateCacheTransactionScoped._loadLock);
  if (self->_databaseStateCacheTransactionScoped._hasLoaded)
  {
    value = self->_databaseStateCacheTransactionScoped._value;
  }
  else
  {
    if (!v9)
      std::__throw_bad_function_call[abi:ne180100]();
    value = (*(uint64_t (**)(_QWORD *))(*v9 + 48))(v9);
    self->_databaseStateCacheTransactionScoped._value = value;
    self->_databaseStateCacheTransactionScoped._hasLoaded = 1;
  }
  os_unfair_lock_unlock(p_loadLock);
  v5 = v9;
  if (v9 == v8)
  {
    v6 = 4;
    v5 = v8;
    goto LABEL_9;
  }
  if (v9)
  {
    v6 = 5;
LABEL_9:
    (*(void (**)(void))(*v5 + 8 * v6))();
  }
  return value;
}

- (void)setDatabaseStateCacheTransactionScoped:(BOOL)a3
{
  os_unfair_lock_s *p_loadLock;

  p_loadLock = &self->_databaseStateCacheTransactionScoped._loadLock;
  os_unfair_lock_lock(&self->_databaseStateCacheTransactionScoped._loadLock);
  self->_databaseStateCacheTransactionScoped._hasLoaded = 1;
  self->_databaseStateCacheTransactionScoped._value = a3;
  os_unfair_lock_unlock(p_loadLock);
}

- (BOOL)extendedLocalWatchData
{
  os_unfair_lock_s *p_loadLock;
  char value;
  _QWORD *v5;
  uint64_t v6;
  _QWORD v8[3];
  _QWORD *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v8[0] = &unk_1E37F61A0;
  v8[1] = &__block_literal_global_18_0;
  v9 = v8;
  p_loadLock = &self->_extendedLocalWatchData._loadLock;
  os_unfair_lock_lock(&self->_extendedLocalWatchData._loadLock);
  if (self->_extendedLocalWatchData._hasLoaded)
  {
    value = self->_extendedLocalWatchData._value;
  }
  else
  {
    if (!v9)
      std::__throw_bad_function_call[abi:ne180100]();
    value = (*(uint64_t (**)(_QWORD *))(*v9 + 48))(v9);
    self->_extendedLocalWatchData._value = value;
    self->_extendedLocalWatchData._hasLoaded = 1;
  }
  os_unfair_lock_unlock(p_loadLock);
  v5 = v9;
  if (v9 == v8)
  {
    v6 = 4;
    v5 = v8;
    goto LABEL_9;
  }
  if (v9)
  {
    v6 = 5;
LABEL_9:
    (*(void (**)(void))(*v5 + 8 * v6))();
  }
  return value;
}

- (void)setExtendedLocalWatchData:(BOOL)a3
{
  os_unfair_lock_s *p_loadLock;

  p_loadLock = &self->_extendedLocalWatchData._loadLock;
  os_unfair_lock_lock(&self->_extendedLocalWatchData._loadLock);
  self->_extendedLocalWatchData._hasLoaded = 1;
  self->_extendedLocalWatchData._value = a3;
  os_unfair_lock_unlock(p_loadLock);
}

- (BOOL)experimentalOrchestrationAdoption
{
  os_unfair_lock_s *p_loadLock;
  char value;
  _QWORD *v5;
  uint64_t v6;
  _QWORD v8[3];
  _QWORD *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v8[0] = &unk_1E37F61A0;
  v8[1] = &__block_literal_global_20;
  v9 = v8;
  p_loadLock = &self->_experimentalOrchestrationAdoption._loadLock;
  os_unfair_lock_lock(&self->_experimentalOrchestrationAdoption._loadLock);
  if (self->_experimentalOrchestrationAdoption._hasLoaded)
  {
    value = self->_experimentalOrchestrationAdoption._value;
  }
  else
  {
    if (!v9)
      std::__throw_bad_function_call[abi:ne180100]();
    value = (*(uint64_t (**)(_QWORD *))(*v9 + 48))(v9);
    self->_experimentalOrchestrationAdoption._value = value;
    self->_experimentalOrchestrationAdoption._hasLoaded = 1;
  }
  os_unfair_lock_unlock(p_loadLock);
  v5 = v9;
  if (v9 == v8)
  {
    v6 = 4;
    v5 = v8;
    goto LABEL_9;
  }
  if (v9)
  {
    v6 = 5;
LABEL_9:
    (*(void (**)(void))(*v5 + 8 * v6))();
  }
  return value;
}

- (void)setExperimentalOrchestrationAdoption:(BOOL)a3
{
  os_unfair_lock_s *p_loadLock;

  p_loadLock = &self->_experimentalOrchestrationAdoption._loadLock;
  os_unfair_lock_lock(&self->_experimentalOrchestrationAdoption._loadLock);
  self->_experimentalOrchestrationAdoption._hasLoaded = 1;
  self->_experimentalOrchestrationAdoption._value = a3;
  os_unfair_lock_unlock(p_loadLock);
}

- (BOOL)orchestrationCategories
{
  os_unfair_lock_s *p_loadLock;
  char value;
  _QWORD *v5;
  uint64_t v6;
  _QWORD v8[3];
  _QWORD *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v8[0] = &unk_1E37F61A0;
  v8[1] = &__block_literal_global_22_3;
  v9 = v8;
  p_loadLock = &self->_orchestrationCategories._loadLock;
  os_unfair_lock_lock(&self->_orchestrationCategories._loadLock);
  if (self->_orchestrationCategories._hasLoaded)
  {
    value = self->_orchestrationCategories._value;
  }
  else
  {
    if (!v9)
      std::__throw_bad_function_call[abi:ne180100]();
    value = (*(uint64_t (**)(_QWORD *))(*v9 + 48))(v9);
    self->_orchestrationCategories._value = value;
    self->_orchestrationCategories._hasLoaded = 1;
  }
  os_unfair_lock_unlock(p_loadLock);
  v5 = v9;
  if (v9 == v8)
  {
    v6 = 4;
    v5 = v8;
    goto LABEL_9;
  }
  if (v9)
  {
    v6 = 5;
LABEL_9:
    (*(void (**)(void))(*v5 + 8 * v6))();
  }
  return value;
}

- (void)setOrchestrationCategories:(BOOL)a3
{
  os_unfair_lock_s *p_loadLock;

  p_loadLock = &self->_orchestrationCategories._loadLock;
  os_unfair_lock_lock(&self->_orchestrationCategories._loadLock);
  self->_orchestrationCategories._hasLoaded = 1;
  self->_orchestrationCategories._value = a3;
  os_unfair_lock_unlock(p_loadLock);
}

- (BOOL)orchestrationProfiles
{
  os_unfair_lock_s *p_loadLock;
  char value;
  _QWORD *v5;
  uint64_t v6;
  _QWORD v8[3];
  _QWORD *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v8[0] = &unk_1E37F61A0;
  v8[1] = &__block_literal_global_24;
  v9 = v8;
  p_loadLock = &self->_orchestrationProfiles._loadLock;
  os_unfair_lock_lock(&self->_orchestrationProfiles._loadLock);
  if (self->_orchestrationProfiles._hasLoaded)
  {
    value = self->_orchestrationProfiles._value;
  }
  else
  {
    if (!v9)
      std::__throw_bad_function_call[abi:ne180100]();
    value = (*(uint64_t (**)(_QWORD *))(*v9 + 48))(v9);
    self->_orchestrationProfiles._value = value;
    self->_orchestrationProfiles._hasLoaded = 1;
  }
  os_unfair_lock_unlock(p_loadLock);
  v5 = v9;
  if (v9 == v8)
  {
    v6 = 4;
    v5 = v8;
    goto LABEL_9;
  }
  if (v9)
  {
    v6 = 5;
LABEL_9:
    (*(void (**)(void))(*v5 + 8 * v6))();
  }
  return value;
}

- (void)setOrchestrationProfiles:(BOOL)a3
{
  os_unfair_lock_s *p_loadLock;

  p_loadLock = &self->_orchestrationProfiles._loadLock;
  os_unfair_lock_lock(&self->_orchestrationProfiles._loadLock);
  self->_orchestrationProfiles._hasLoaded = 1;
  self->_orchestrationProfiles._value = a3;
  os_unfair_lock_unlock(p_loadLock);
}

- (BOOL)harmonia
{
  os_unfair_lock_s *p_loadLock;
  char value;
  _QWORD *v5;
  uint64_t v6;
  _QWORD v8[3];
  _QWORD *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v8[0] = &unk_1E37F61A0;
  v8[1] = &__block_literal_global_26_1;
  v9 = v8;
  p_loadLock = &self->_harmonia._loadLock;
  os_unfair_lock_lock(&self->_harmonia._loadLock);
  if (self->_harmonia._hasLoaded)
  {
    value = self->_harmonia._value;
  }
  else
  {
    if (!v9)
      std::__throw_bad_function_call[abi:ne180100]();
    value = (*(uint64_t (**)(_QWORD *))(*v9 + 48))(v9);
    self->_harmonia._value = value;
    self->_harmonia._hasLoaded = 1;
  }
  os_unfair_lock_unlock(p_loadLock);
  v5 = v9;
  if (v9 == v8)
  {
    v6 = 4;
    v5 = v8;
    goto LABEL_9;
  }
  if (v9)
  {
    v6 = 5;
LABEL_9:
    (*(void (**)(void))(*v5 + 8 * v6))();
  }
  return value;
}

- (void)setHarmonia:(BOOL)a3
{
  os_unfair_lock_s *p_loadLock;

  p_loadLock = &self->_harmonia._loadLock;
  os_unfair_lock_lock(&self->_harmonia._loadLock);
  self->_harmonia._hasLoaded = 1;
  self->_harmonia._value = a3;
  os_unfair_lock_unlock(p_loadLock);
}

- (BOOL)lavender
{
  os_unfair_lock_s *p_loadLock;
  char value;
  _QWORD *v5;
  uint64_t v6;
  _QWORD v8[3];
  _QWORD *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v8[0] = &unk_1E37F61A0;
  v8[1] = &__block_literal_global_28_1;
  v9 = v8;
  p_loadLock = &self->_lavender._loadLock;
  os_unfair_lock_lock(&self->_lavender._loadLock);
  if (self->_lavender._hasLoaded)
  {
    value = self->_lavender._value;
  }
  else
  {
    if (!v9)
      std::__throw_bad_function_call[abi:ne180100]();
    value = (*(uint64_t (**)(_QWORD *))(*v9 + 48))(v9);
    self->_lavender._value = value;
    self->_lavender._hasLoaded = 1;
  }
  os_unfair_lock_unlock(p_loadLock);
  v5 = v9;
  if (v9 == v8)
  {
    v6 = 4;
    v5 = v8;
    goto LABEL_9;
  }
  if (v9)
  {
    v6 = 5;
LABEL_9:
    (*(void (**)(void))(*v5 + 8 * v6))();
  }
  return value;
}

- (void)setLavender:(BOOL)a3
{
  os_unfair_lock_s *p_loadLock;

  p_loadLock = &self->_lavender._loadLock;
  os_unfair_lock_lock(&self->_lavender._loadLock);
  self->_lavender._hasLoaded = 1;
  self->_lavender._value = a3;
  os_unfair_lock_unlock(p_loadLock);
}

- (BOOL)lavender_hld_writes_data
{
  os_unfair_lock_s *p_loadLock;
  char value;
  _QWORD *v5;
  uint64_t v6;
  _QWORD v8[3];
  _QWORD *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v8[0] = &unk_1E37F61A0;
  v8[1] = &__block_literal_global_30_3;
  v9 = v8;
  p_loadLock = &self->_lavender_hld_writes_data._loadLock;
  os_unfair_lock_lock(&self->_lavender_hld_writes_data._loadLock);
  if (self->_lavender_hld_writes_data._hasLoaded)
  {
    value = self->_lavender_hld_writes_data._value;
  }
  else
  {
    if (!v9)
      std::__throw_bad_function_call[abi:ne180100]();
    value = (*(uint64_t (**)(_QWORD *))(*v9 + 48))(v9);
    self->_lavender_hld_writes_data._value = value;
    self->_lavender_hld_writes_data._hasLoaded = 1;
  }
  os_unfair_lock_unlock(p_loadLock);
  v5 = v9;
  if (v9 == v8)
  {
    v6 = 4;
    v5 = v8;
    goto LABEL_9;
  }
  if (v9)
  {
    v6 = 5;
LABEL_9:
    (*(void (**)(void))(*v5 + 8 * v6))();
  }
  return value;
}

- (void)setLavender_hld_writes_data:(BOOL)a3
{
  os_unfair_lock_s *p_loadLock;

  p_loadLock = &self->_lavender_hld_writes_data._loadLock;
  os_unfair_lock_lock(&self->_lavender_hld_writes_data._loadLock);
  self->_lavender_hld_writes_data._hasLoaded = 1;
  self->_lavender_hld_writes_data._value = a3;
  os_unfair_lock_unlock(p_loadLock);
}

- (BOOL)maskRestingHeartRateSamplesWithSleepSamples
{
  os_unfair_lock_s *p_loadLock;
  char value;
  _QWORD *v5;
  uint64_t v6;
  _QWORD v8[3];
  _QWORD *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v8[0] = &unk_1E37F61A0;
  v8[1] = &__block_literal_global_32_1;
  v9 = v8;
  p_loadLock = &self->_maskRestingHeartRateSamplesWithSleepSamples._loadLock;
  os_unfair_lock_lock(&self->_maskRestingHeartRateSamplesWithSleepSamples._loadLock);
  if (self->_maskRestingHeartRateSamplesWithSleepSamples._hasLoaded)
  {
    value = self->_maskRestingHeartRateSamplesWithSleepSamples._value;
  }
  else
  {
    if (!v9)
      std::__throw_bad_function_call[abi:ne180100]();
    value = (*(uint64_t (**)(_QWORD *))(*v9 + 48))(v9);
    self->_maskRestingHeartRateSamplesWithSleepSamples._value = value;
    self->_maskRestingHeartRateSamplesWithSleepSamples._hasLoaded = 1;
  }
  os_unfair_lock_unlock(p_loadLock);
  v5 = v9;
  if (v9 == v8)
  {
    v6 = 4;
    v5 = v8;
    goto LABEL_9;
  }
  if (v9)
  {
    v6 = 5;
LABEL_9:
    (*(void (**)(void))(*v5 + 8 * v6))();
  }
  return value;
}

- (void)setMaskRestingHeartRateSamplesWithSleepSamples:(BOOL)a3
{
  os_unfair_lock_s *p_loadLock;

  p_loadLock = &self->_maskRestingHeartRateSamplesWithSleepSamples._loadLock;
  os_unfair_lock_lock(&self->_maskRestingHeartRateSamplesWithSleepSamples._loadLock);
  self->_maskRestingHeartRateSamplesWithSleepSamples._hasLoaded = 1;
  self->_maskRestingHeartRateSamplesWithSleepSamples._value = a3;
  os_unfair_lock_unlock(p_loadLock);
}

- (BOOL)medicalIDV2
{
  os_unfair_lock_s *p_loadLock;
  char value;
  _QWORD *v5;
  uint64_t v6;
  _QWORD v8[3];
  _QWORD *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v8[0] = &unk_1E37F61A0;
  v8[1] = &__block_literal_global_34_0;
  v9 = v8;
  p_loadLock = &self->_medicalIDV2._loadLock;
  os_unfair_lock_lock(&self->_medicalIDV2._loadLock);
  if (self->_medicalIDV2._hasLoaded)
  {
    value = self->_medicalIDV2._value;
  }
  else
  {
    if (!v9)
      std::__throw_bad_function_call[abi:ne180100]();
    value = (*(uint64_t (**)(_QWORD *))(*v9 + 48))(v9);
    self->_medicalIDV2._value = value;
    self->_medicalIDV2._hasLoaded = 1;
  }
  os_unfair_lock_unlock(p_loadLock);
  v5 = v9;
  if (v9 == v8)
  {
    v6 = 4;
    v5 = v8;
    goto LABEL_9;
  }
  if (v9)
  {
    v6 = 5;
LABEL_9:
    (*(void (**)(void))(*v5 + 8 * v6))();
  }
  return value;
}

- (void)setMedicalIDV2:(BOOL)a3
{
  os_unfair_lock_s *p_loadLock;

  p_loadLock = &self->_medicalIDV2._loadLock;
  os_unfair_lock_lock(&self->_medicalIDV2._loadLock);
  self->_medicalIDV2._hasLoaded = 1;
  self->_medicalIDV2._value = a3;
  os_unfair_lock_unlock(p_loadLock);
}

- (BOOL)heartRatePush
{
  os_unfair_lock_s *p_loadLock;
  char value;
  _QWORD *v5;
  uint64_t v6;
  _QWORD v8[3];
  _QWORD *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v8[0] = &unk_1E37F61A0;
  v8[1] = &__block_literal_global_36;
  v9 = v8;
  p_loadLock = &self->_heartRatePush._loadLock;
  os_unfair_lock_lock(&self->_heartRatePush._loadLock);
  if (self->_heartRatePush._hasLoaded)
  {
    value = self->_heartRatePush._value;
  }
  else
  {
    if (!v9)
      std::__throw_bad_function_call[abi:ne180100]();
    value = (*(uint64_t (**)(_QWORD *))(*v9 + 48))(v9);
    self->_heartRatePush._value = value;
    self->_heartRatePush._hasLoaded = 1;
  }
  os_unfair_lock_unlock(p_loadLock);
  v5 = v9;
  if (v9 == v8)
  {
    v6 = 4;
    v5 = v8;
    goto LABEL_9;
  }
  if (v9)
  {
    v6 = 5;
LABEL_9:
    (*(void (**)(void))(*v5 + 8 * v6))();
  }
  return value;
}

- (void)setHeartRatePush:(BOOL)a3
{
  os_unfair_lock_s *p_loadLock;

  p_loadLock = &self->_heartRatePush._loadLock;
  os_unfair_lock_lock(&self->_heartRatePush._loadLock);
  self->_heartRatePush._hasLoaded = 1;
  self->_heartRatePush._value = a3;
  os_unfair_lock_unlock(p_loadLock);
}

- (BOOL)nebula
{
  os_unfair_lock_s *p_loadLock;
  char value;
  _QWORD *v5;
  uint64_t v6;
  _QWORD v8[3];
  _QWORD *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v8[0] = &unk_1E37F61A0;
  v8[1] = &__block_literal_global_38;
  v9 = v8;
  p_loadLock = &self->_nebula._loadLock;
  os_unfair_lock_lock(&self->_nebula._loadLock);
  if (self->_nebula._hasLoaded)
  {
    value = self->_nebula._value;
  }
  else
  {
    if (!v9)
      std::__throw_bad_function_call[abi:ne180100]();
    value = (*(uint64_t (**)(_QWORD *))(*v9 + 48))(v9);
    self->_nebula._value = value;
    self->_nebula._hasLoaded = 1;
  }
  os_unfair_lock_unlock(p_loadLock);
  v5 = v9;
  if (v9 == v8)
  {
    v6 = 4;
    v5 = v8;
    goto LABEL_9;
  }
  if (v9)
  {
    v6 = 5;
LABEL_9:
    (*(void (**)(void))(*v5 + 8 * v6))();
  }
  return value;
}

- (void)setNebula:(BOOL)a3
{
  os_unfair_lock_s *p_loadLock;

  p_loadLock = &self->_nebula._loadLock;
  os_unfair_lock_lock(&self->_nebula._loadLock);
  self->_nebula._hasLoaded = 1;
  self->_nebula._value = a3;
  os_unfair_lock_unlock(p_loadLock);
}

- (BOOL)percentInRange
{
  os_unfair_lock_s *p_loadLock;
  char value;
  _QWORD *v5;
  uint64_t v6;
  _QWORD v8[3];
  _QWORD *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v8[0] = &unk_1E37F61A0;
  v8[1] = &__block_literal_global_40;
  v9 = v8;
  p_loadLock = &self->_percentInRange._loadLock;
  os_unfair_lock_lock(&self->_percentInRange._loadLock);
  if (self->_percentInRange._hasLoaded)
  {
    value = self->_percentInRange._value;
  }
  else
  {
    if (!v9)
      std::__throw_bad_function_call[abi:ne180100]();
    value = (*(uint64_t (**)(_QWORD *))(*v9 + 48))(v9);
    self->_percentInRange._value = value;
    self->_percentInRange._hasLoaded = 1;
  }
  os_unfair_lock_unlock(p_loadLock);
  v5 = v9;
  if (v9 == v8)
  {
    v6 = 4;
    v5 = v8;
    goto LABEL_9;
  }
  if (v9)
  {
    v6 = 5;
LABEL_9:
    (*(void (**)(void))(*v5 + 8 * v6))();
  }
  return value;
}

- (void)setPercentInRange:(BOOL)a3
{
  os_unfair_lock_s *p_loadLock;

  p_loadLock = &self->_percentInRange._loadLock;
  os_unfair_lock_lock(&self->_percentInRange._loadLock);
  self->_percentInRange._hasLoaded = 1;
  self->_percentInRange._value = a3;
  os_unfair_lock_unlock(p_loadLock);
}

- (BOOL)pulse
{
  os_unfair_lock_s *p_loadLock;
  char value;
  _QWORD *v5;
  uint64_t v6;
  _QWORD v8[3];
  _QWORD *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v8[0] = &unk_1E37F61A0;
  v8[1] = &__block_literal_global_42_0;
  v9 = v8;
  p_loadLock = &self->_pulse._loadLock;
  os_unfair_lock_lock(&self->_pulse._loadLock);
  if (self->_pulse._hasLoaded)
  {
    value = self->_pulse._value;
  }
  else
  {
    if (!v9)
      std::__throw_bad_function_call[abi:ne180100]();
    value = (*(uint64_t (**)(_QWORD *))(*v9 + 48))(v9);
    self->_pulse._value = value;
    self->_pulse._hasLoaded = 1;
  }
  os_unfair_lock_unlock(p_loadLock);
  v5 = v9;
  if (v9 == v8)
  {
    v6 = 4;
    v5 = v8;
    goto LABEL_9;
  }
  if (v9)
  {
    v6 = 5;
LABEL_9:
    (*(void (**)(void))(*v5 + 8 * v6))();
  }
  return value;
}

- (void)setPulse:(BOOL)a3
{
  os_unfair_lock_s *p_loadLock;

  p_loadLock = &self->_pulse._loadLock;
  os_unfair_lock_lock(&self->_pulse._loadLock);
  self->_pulse._hasLoaded = 1;
  self->_pulse._value = a3;
  os_unfair_lock_unlock(p_loadLock);
}

- (BOOL)regulatoryDomain
{
  return _os_feature_enabled_impl();
}

- (BOOL)seahorse
{
  os_unfair_lock_s *p_loadLock;
  char value;
  _QWORD *v5;
  uint64_t v6;
  _QWORD v8[3];
  _QWORD *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v8[0] = &unk_1E37F61A0;
  v8[1] = &__block_literal_global_45_0;
  v9 = v8;
  p_loadLock = &self->_seahorse._loadLock;
  os_unfair_lock_lock(&self->_seahorse._loadLock);
  if (self->_seahorse._hasLoaded)
  {
    value = self->_seahorse._value;
  }
  else
  {
    if (!v9)
      std::__throw_bad_function_call[abi:ne180100]();
    value = (*(uint64_t (**)(_QWORD *))(*v9 + 48))(v9);
    self->_seahorse._value = value;
    self->_seahorse._hasLoaded = 1;
  }
  os_unfair_lock_unlock(p_loadLock);
  v5 = v9;
  if (v9 == v8)
  {
    v6 = 4;
    v5 = v8;
    goto LABEL_9;
  }
  if (v9)
  {
    v6 = 5;
LABEL_9:
    (*(void (**)(void))(*v5 + 8 * v6))();
  }
  return value;
}

- (void)setSeahorse:(BOOL)a3
{
  os_unfair_lock_s *p_loadLock;

  p_loadLock = &self->_seahorse._loadLock;
  os_unfair_lock_lock(&self->_seahorse._loadLock);
  self->_seahorse._hasLoaded = 1;
  self->_seahorse._value = a3;
  os_unfair_lock_unlock(p_loadLock);
}

- (BOOL)sharingPlus
{
  os_unfair_lock_s *p_loadLock;
  char value;
  _QWORD *v5;
  uint64_t v6;
  _QWORD v8[3];
  _QWORD *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v8[0] = &unk_1E37F61A0;
  v8[1] = &__block_literal_global_47_0;
  v9 = v8;
  p_loadLock = &self->_sharingPlus._loadLock;
  os_unfair_lock_lock(&self->_sharingPlus._loadLock);
  if (self->_sharingPlus._hasLoaded)
  {
    value = self->_sharingPlus._value;
  }
  else
  {
    if (!v9)
      std::__throw_bad_function_call[abi:ne180100]();
    value = (*(uint64_t (**)(_QWORD *))(*v9 + 48))(v9);
    self->_sharingPlus._value = value;
    self->_sharingPlus._hasLoaded = 1;
  }
  os_unfair_lock_unlock(p_loadLock);
  v5 = v9;
  if (v9 == v8)
  {
    v6 = 4;
    v5 = v8;
    goto LABEL_9;
  }
  if (v9)
  {
    v6 = 5;
LABEL_9:
    (*(void (**)(void))(*v5 + 8 * v6))();
  }
  return value;
}

- (BOOL)shardedOntology
{
  os_unfair_lock_s *p_loadLock;
  char value;
  _QWORD *v5;
  uint64_t v6;
  _QWORD v8[3];
  _QWORD *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v8[0] = &unk_1E37F61A0;
  v8[1] = &__block_literal_global_49_0;
  v9 = v8;
  p_loadLock = &self->_shardedOntology._loadLock;
  os_unfair_lock_lock(&self->_shardedOntology._loadLock);
  if (self->_shardedOntology._hasLoaded)
  {
    value = self->_shardedOntology._value;
  }
  else
  {
    if (!v9)
      std::__throw_bad_function_call[abi:ne180100]();
    value = (*(uint64_t (**)(_QWORD *))(*v9 + 48))(v9);
    self->_shardedOntology._value = value;
    self->_shardedOntology._hasLoaded = 1;
  }
  os_unfair_lock_unlock(p_loadLock);
  v5 = v9;
  if (v9 == v8)
  {
    v6 = 4;
    v5 = v8;
    goto LABEL_9;
  }
  if (v9)
  {
    v6 = 5;
LABEL_9:
    (*(void (**)(void))(*v5 + 8 * v6))();
  }
  return value;
}

- (void)setShardedOntology:(BOOL)a3
{
  os_unfair_lock_s *p_loadLock;

  p_loadLock = &self->_shardedOntology._loadLock;
  os_unfair_lock_lock(&self->_shardedOntology._loadLock);
  self->_shardedOntology._hasLoaded = 1;
  self->_shardedOntology._value = a3;
  os_unfair_lock_unlock(p_loadLock);
}

- (BOOL)sleepCloudKitManatee
{
  os_unfair_lock_s *p_loadLock;
  char value;
  _QWORD *v5;
  uint64_t v6;
  _QWORD v8[3];
  _QWORD *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v8[0] = &unk_1E37F61A0;
  v8[1] = &__block_literal_global_51;
  v9 = v8;
  p_loadLock = &self->_sleepCloudKitManatee._loadLock;
  os_unfair_lock_lock(&self->_sleepCloudKitManatee._loadLock);
  if (self->_sleepCloudKitManatee._hasLoaded)
  {
    value = self->_sleepCloudKitManatee._value;
  }
  else
  {
    if (!v9)
      std::__throw_bad_function_call[abi:ne180100]();
    value = (*(uint64_t (**)(_QWORD *))(*v9 + 48))(v9);
    self->_sleepCloudKitManatee._value = value;
    self->_sleepCloudKitManatee._hasLoaded = 1;
  }
  os_unfair_lock_unlock(p_loadLock);
  v5 = v9;
  if (v9 == v8)
  {
    v6 = 4;
    v5 = v8;
    goto LABEL_9;
  }
  if (v9)
  {
    v6 = 5;
LABEL_9:
    (*(void (**)(void))(*v5 + 8 * v6))();
  }
  return value;
}

- (void)setSleepCloudKitManatee:(BOOL)a3
{
  os_unfair_lock_s *p_loadLock;

  p_loadLock = &self->_sleepCloudKitManatee._loadLock;
  os_unfair_lock_lock(&self->_sleepCloudKitManatee._loadLock);
  self->_sleepCloudKitManatee._hasLoaded = 1;
  self->_sleepCloudKitManatee._value = a3;
  os_unfair_lock_unlock(p_loadLock);
}

- (BOOL)sleepCloudKitSync
{
  os_unfair_lock_s *p_loadLock;
  char value;
  _QWORD *v5;
  uint64_t v6;
  _QWORD v8[3];
  _QWORD *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v8[0] = &unk_1E37F61A0;
  v8[1] = &__block_literal_global_53_1;
  v9 = v8;
  p_loadLock = &self->_sleepCloudKitSync._loadLock;
  os_unfair_lock_lock(&self->_sleepCloudKitSync._loadLock);
  if (self->_sleepCloudKitSync._hasLoaded)
  {
    value = self->_sleepCloudKitSync._value;
  }
  else
  {
    if (!v9)
      std::__throw_bad_function_call[abi:ne180100]();
    value = (*(uint64_t (**)(_QWORD *))(*v9 + 48))(v9);
    self->_sleepCloudKitSync._value = value;
    self->_sleepCloudKitSync._hasLoaded = 1;
  }
  os_unfair_lock_unlock(p_loadLock);
  v5 = v9;
  if (v9 == v8)
  {
    v6 = 4;
    v5 = v8;
    goto LABEL_9;
  }
  if (v9)
  {
    v6 = 5;
LABEL_9:
    (*(void (**)(void))(*v5 + 8 * v6))();
  }
  return value;
}

- (void)setSleepCloudKitSync:(BOOL)a3
{
  os_unfair_lock_s *p_loadLock;

  p_loadLock = &self->_sleepCloudKitSync._loadLock;
  os_unfair_lock_lock(&self->_sleepCloudKitSync._loadLock);
  self->_sleepCloudKitSync._hasLoaded = 1;
  self->_sleepCloudKitSync._value = a3;
  os_unfair_lock_unlock(p_loadLock);
}

- (BOOL)sleepOnIpad
{
  os_unfair_lock_s *p_loadLock;
  char value;
  _QWORD *v5;
  uint64_t v6;
  _QWORD v8[3];
  _QWORD *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v8[0] = &unk_1E37F61A0;
  v8[1] = &__block_literal_global_55;
  v9 = v8;
  p_loadLock = &self->_sleepOnIpad._loadLock;
  os_unfair_lock_lock(&self->_sleepOnIpad._loadLock);
  if (self->_sleepOnIpad._hasLoaded)
  {
    value = self->_sleepOnIpad._value;
  }
  else
  {
    if (!v9)
      std::__throw_bad_function_call[abi:ne180100]();
    value = (*(uint64_t (**)(_QWORD *))(*v9 + 48))(v9);
    self->_sleepOnIpad._value = value;
    self->_sleepOnIpad._hasLoaded = 1;
  }
  os_unfair_lock_unlock(p_loadLock);
  v5 = v9;
  if (v9 == v8)
  {
    v6 = 4;
    v5 = v8;
    goto LABEL_9;
  }
  if (v9)
  {
    v6 = 5;
LABEL_9:
    (*(void (**)(void))(*v5 + 8 * v6))();
  }
  return value;
}

- (void)setSleepOnIpad:(BOOL)a3
{
  os_unfair_lock_s *p_loadLock;

  p_loadLock = &self->_sleepOnIpad._loadLock;
  os_unfair_lock_lock(&self->_sleepOnIpad._loadLock);
  self->_sleepOnIpad._hasLoaded = 1;
  self->_sleepOnIpad._value = a3;
  os_unfair_lock_unlock(p_loadLock);
}

- (BOOL)sleepOnMac
{
  os_unfair_lock_s *p_loadLock;
  char value;
  _QWORD *v5;
  uint64_t v6;
  _QWORD v8[3];
  _QWORD *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v8[0] = &unk_1E37F61A0;
  v8[1] = &__block_literal_global_57_0;
  v9 = v8;
  p_loadLock = &self->_sleepOnMac._loadLock;
  os_unfair_lock_lock(&self->_sleepOnMac._loadLock);
  if (self->_sleepOnMac._hasLoaded)
  {
    value = self->_sleepOnMac._value;
  }
  else
  {
    if (!v9)
      std::__throw_bad_function_call[abi:ne180100]();
    value = (*(uint64_t (**)(_QWORD *))(*v9 + 48))(v9);
    self->_sleepOnMac._value = value;
    self->_sleepOnMac._hasLoaded = 1;
  }
  os_unfair_lock_unlock(p_loadLock);
  v5 = v9;
  if (v9 == v8)
  {
    v6 = 4;
    v5 = v8;
    goto LABEL_9;
  }
  if (v9)
  {
    v6 = 5;
LABEL_9:
    (*(void (**)(void))(*v5 + 8 * v6))();
  }
  return value;
}

- (void)setSleepOnMac:(BOOL)a3
{
  os_unfair_lock_s *p_loadLock;

  p_loadLock = &self->_sleepOnMac._loadLock;
  os_unfair_lock_lock(&self->_sleepOnMac._loadLock);
  self->_sleepOnMac._hasLoaded = 1;
  self->_sleepOnMac._value = a3;
  os_unfair_lock_unlock(p_loadLock);
}

- (BOOL)stanley
{
  os_unfair_lock_s *p_loadLock;
  char value;
  _QWORD *v5;
  uint64_t v6;
  _QWORD v8[3];
  _QWORD *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v8[0] = &unk_1E37F61A0;
  v8[1] = &__block_literal_global_59;
  v9 = v8;
  p_loadLock = &self->_stanley._loadLock;
  os_unfair_lock_lock(&self->_stanley._loadLock);
  if (self->_stanley._hasLoaded)
  {
    value = self->_stanley._value;
  }
  else
  {
    if (!v9)
      std::__throw_bad_function_call[abi:ne180100]();
    value = (*(uint64_t (**)(_QWORD *))(*v9 + 48))(v9);
    self->_stanley._value = value;
    self->_stanley._hasLoaded = 1;
  }
  os_unfair_lock_unlock(p_loadLock);
  v5 = v9;
  if (v9 == v8)
  {
    v6 = 4;
    v5 = v8;
    goto LABEL_9;
  }
  if (v9)
  {
    v6 = 5;
LABEL_9:
    (*(void (**)(void))(*v5 + 8 * v6))();
  }
  return value;
}

- (void)setStanley:(BOOL)a3
{
  os_unfair_lock_s *p_loadLock;

  p_loadLock = &self->_stanley._loadLock;
  os_unfair_lock_lock(&self->_stanley._loadLock);
  self->_stanley._hasLoaded = 1;
  self->_stanley._value = a3;
  os_unfair_lock_unlock(p_loadLock);
}

- (BOOL)snidgets
{
  os_unfair_lock_s *p_loadLock;
  char value;
  _QWORD *v5;
  uint64_t v6;
  _QWORD v8[3];
  _QWORD *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v8[0] = &unk_1E37F61A0;
  v8[1] = &__block_literal_global_61;
  v9 = v8;
  p_loadLock = &self->_snidgets._loadLock;
  os_unfair_lock_lock(&self->_snidgets._loadLock);
  if (self->_snidgets._hasLoaded)
  {
    value = self->_snidgets._value;
  }
  else
  {
    if (!v9)
      std::__throw_bad_function_call[abi:ne180100]();
    value = (*(uint64_t (**)(_QWORD *))(*v9 + 48))(v9);
    self->_snidgets._value = value;
    self->_snidgets._hasLoaded = 1;
  }
  os_unfair_lock_unlock(p_loadLock);
  v5 = v9;
  if (v9 == v8)
  {
    v6 = 4;
    v5 = v8;
    goto LABEL_9;
  }
  if (v9)
  {
    v6 = 5;
LABEL_9:
    (*(void (**)(void))(*v5 + 8 * v6))();
  }
  return value;
}

- (void)setSnidgets:(BOOL)a3
{
  os_unfair_lock_s *p_loadLock;

  p_loadLock = &self->_snidgets._loadLock;
  os_unfair_lock_lock(&self->_snidgets._loadLock);
  self->_snidgets._hasLoaded = 1;
  self->_snidgets._value = a3;
  os_unfair_lock_unlock(p_loadLock);
}

- (BOOL)snidgetsTinker
{
  os_unfair_lock_s *p_loadLock;
  char value;
  _QWORD *v5;
  uint64_t v6;
  _QWORD v8[3];
  _QWORD *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v8[0] = &unk_1E37F61A0;
  v8[1] = &__block_literal_global_63;
  v9 = v8;
  p_loadLock = &self->_snidgetsTinker._loadLock;
  os_unfair_lock_lock(&self->_snidgetsTinker._loadLock);
  if (self->_snidgetsTinker._hasLoaded)
  {
    value = self->_snidgetsTinker._value;
  }
  else
  {
    if (!v9)
      std::__throw_bad_function_call[abi:ne180100]();
    value = (*(uint64_t (**)(_QWORD *))(*v9 + 48))(v9);
    self->_snidgetsTinker._value = value;
    self->_snidgetsTinker._hasLoaded = 1;
  }
  os_unfair_lock_unlock(p_loadLock);
  v5 = v9;
  if (v9 == v8)
  {
    v6 = 4;
    v5 = v8;
    goto LABEL_9;
  }
  if (v9)
  {
    v6 = 5;
LABEL_9:
    (*(void (**)(void))(*v5 + 8 * v6))();
  }
  return value;
}

- (void)setSnidgetsTinker:(BOOL)a3
{
  os_unfair_lock_s *p_loadLock;

  p_loadLock = &self->_snidgetsTinker._loadLock;
  os_unfair_lock_lock(&self->_snidgetsTinker._loadLock);
  self->_snidgetsTinker._hasLoaded = 1;
  self->_snidgetsTinker._value = a3;
  os_unfair_lock_unlock(p_loadLock);
}

- (BOOL)snidgetAnimations
{
  os_unfair_lock_s *p_loadLock;
  char value;
  _QWORD *v5;
  uint64_t v6;
  _QWORD v8[3];
  _QWORD *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v8[0] = &unk_1E37F61A0;
  v8[1] = &__block_literal_global_65_1;
  v9 = v8;
  p_loadLock = &self->_snidgetAnimations._loadLock;
  os_unfair_lock_lock(&self->_snidgetAnimations._loadLock);
  if (self->_snidgetAnimations._hasLoaded)
  {
    value = self->_snidgetAnimations._value;
  }
  else
  {
    if (!v9)
      std::__throw_bad_function_call[abi:ne180100]();
    value = (*(uint64_t (**)(_QWORD *))(*v9 + 48))(v9);
    self->_snidgetAnimations._value = value;
    self->_snidgetAnimations._hasLoaded = 1;
  }
  os_unfair_lock_unlock(p_loadLock);
  v5 = v9;
  if (v9 == v8)
  {
    v6 = 4;
    v5 = v8;
    goto LABEL_9;
  }
  if (v9)
  {
    v6 = 5;
LABEL_9:
    (*(void (**)(void))(*v5 + 8 * v6))();
  }
  return value;
}

- (void)setSnidgetAnimations:(BOOL)a3
{
  os_unfair_lock_s *p_loadLock;

  p_loadLock = &self->_snidgetAnimations._loadLock;
  os_unfair_lock_lock(&self->_snidgetAnimations._loadLock);
  self->_snidgetAnimations._hasLoaded = 1;
  self->_snidgetAnimations._value = a3;
  os_unfair_lock_unlock(p_loadLock);
}

- (BOOL)summaryGradient
{
  os_unfair_lock_s *p_loadLock;
  char value;
  _QWORD *v5;
  uint64_t v6;
  _QWORD v8[3];
  _QWORD *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v8[0] = &unk_1E37F61A0;
  v8[1] = &__block_literal_global_67;
  v9 = v8;
  p_loadLock = &self->_summaryGradient._loadLock;
  os_unfair_lock_lock(&self->_summaryGradient._loadLock);
  if (self->_summaryGradient._hasLoaded)
  {
    value = self->_summaryGradient._value;
  }
  else
  {
    if (!v9)
      std::__throw_bad_function_call[abi:ne180100]();
    value = (*(uint64_t (**)(_QWORD *))(*v9 + 48))(v9);
    self->_summaryGradient._value = value;
    self->_summaryGradient._hasLoaded = 1;
  }
  os_unfair_lock_unlock(p_loadLock);
  v5 = v9;
  if (v9 == v8)
  {
    v6 = 4;
    v5 = v8;
    goto LABEL_9;
  }
  if (v9)
  {
    v6 = 5;
LABEL_9:
    (*(void (**)(void))(*v5 + 8 * v6))();
  }
  return value;
}

- (void)setSummaryGradient:(BOOL)a3
{
  os_unfair_lock_s *p_loadLock;

  p_loadLock = &self->_summaryGradient._loadLock;
  os_unfair_lock_lock(&self->_summaryGradient._loadLock);
  self->_summaryGradient._hasLoaded = 1;
  self->_summaryGradient._value = a3;
  os_unfair_lock_unlock(p_loadLock);
}

- (BOOL)summaryOrchestration
{
  os_unfair_lock_s *p_loadLock;
  char value;
  _QWORD *v5;
  uint64_t v6;
  _QWORD v8[3];
  _QWORD *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v8[0] = &unk_1E37F61A0;
  v8[1] = &__block_literal_global_69;
  v9 = v8;
  p_loadLock = &self->_summaryOrchestration._loadLock;
  os_unfair_lock_lock(&self->_summaryOrchestration._loadLock);
  if (self->_summaryOrchestration._hasLoaded)
  {
    value = self->_summaryOrchestration._value;
  }
  else
  {
    if (!v9)
      std::__throw_bad_function_call[abi:ne180100]();
    value = (*(uint64_t (**)(_QWORD *))(*v9 + 48))(v9);
    self->_summaryOrchestration._value = value;
    self->_summaryOrchestration._hasLoaded = 1;
  }
  os_unfair_lock_unlock(p_loadLock);
  v5 = v9;
  if (v9 == v8)
  {
    v6 = 4;
    v5 = v8;
    goto LABEL_9;
  }
  if (v9)
  {
    v6 = 5;
LABEL_9:
    (*(void (**)(void))(*v5 + 8 * v6))();
  }
  return value;
}

- (void)setSummaryOrchestration:(BOOL)a3
{
  os_unfair_lock_s *p_loadLock;

  p_loadLock = &self->_summaryOrchestration._loadLock;
  os_unfair_lock_lock(&self->_summaryOrchestration._loadLock);
  self->_summaryOrchestration._hasLoaded = 1;
  self->_summaryOrchestration._value = a3;
  os_unfair_lock_unlock(p_loadLock);
}

- (BOOL)urgentNotificationDismiss
{
  os_unfair_lock_s *p_loadLock;
  char value;
  _QWORD *v5;
  uint64_t v6;
  _QWORD v8[3];
  _QWORD *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v8[0] = &unk_1E37F61A0;
  v8[1] = &__block_literal_global_71_1;
  v9 = v8;
  p_loadLock = &self->_urgentNotificationDismiss._loadLock;
  os_unfair_lock_lock(&self->_urgentNotificationDismiss._loadLock);
  if (self->_urgentNotificationDismiss._hasLoaded)
  {
    value = self->_urgentNotificationDismiss._value;
  }
  else
  {
    if (!v9)
      std::__throw_bad_function_call[abi:ne180100]();
    value = (*(uint64_t (**)(_QWORD *))(*v9 + 48))(v9);
    self->_urgentNotificationDismiss._value = value;
    self->_urgentNotificationDismiss._hasLoaded = 1;
  }
  os_unfair_lock_unlock(p_loadLock);
  v5 = v9;
  if (v9 == v8)
  {
    v6 = 4;
    v5 = v8;
    goto LABEL_9;
  }
  if (v9)
  {
    v6 = 5;
LABEL_9:
    (*(void (**)(void))(*v5 + 8 * v6))();
  }
  return value;
}

- (BOOL)timeInBedTracking
{
  os_unfair_lock_s *p_loadLock;
  char value;
  _QWORD *v5;
  uint64_t v6;
  _QWORD v8[3];
  _QWORD *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v8[0] = &unk_1E37F61A0;
  v8[1] = &__block_literal_global_73;
  v9 = v8;
  p_loadLock = &self->_timeInBedTracking._loadLock;
  os_unfair_lock_lock(&self->_timeInBedTracking._loadLock);
  if (self->_timeInBedTracking._hasLoaded)
  {
    value = self->_timeInBedTracking._value;
  }
  else
  {
    if (!v9)
      std::__throw_bad_function_call[abi:ne180100]();
    value = (*(uint64_t (**)(_QWORD *))(*v9 + 48))(v9);
    self->_timeInBedTracking._value = value;
    self->_timeInBedTracking._hasLoaded = 1;
  }
  os_unfair_lock_unlock(p_loadLock);
  v5 = v9;
  if (v9 == v8)
  {
    v6 = 4;
    v5 = v8;
    goto LABEL_9;
  }
  if (v9)
  {
    v6 = 5;
LABEL_9:
    (*(void (**)(void))(*v5 + 8 * v6))();
  }
  return value;
}

- (void)setTimeInBedTracking:(BOOL)a3
{
  os_unfair_lock_s *p_loadLock;

  p_loadLock = &self->_timeInBedTracking._loadLock;
  os_unfair_lock_lock(&self->_timeInBedTracking._loadLock);
  self->_timeInBedTracking._hasLoaded = 1;
  self->_timeInBedTracking._value = a3;
  os_unfair_lock_unlock(p_loadLock);
}

- (BOOL)vrx
{
  os_unfair_lock_s *p_loadLock;
  char value;
  _QWORD *v5;
  uint64_t v6;
  _QWORD v8[3];
  _QWORD *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v8[0] = &unk_1E37F61A0;
  v8[1] = &__block_literal_global_75_0;
  v9 = v8;
  p_loadLock = &self->_vrx._loadLock;
  os_unfair_lock_lock(&self->_vrx._loadLock);
  if (self->_vrx._hasLoaded)
  {
    value = self->_vrx._value;
  }
  else
  {
    if (!v9)
      std::__throw_bad_function_call[abi:ne180100]();
    value = (*(uint64_t (**)(_QWORD *))(*v9 + 48))(v9);
    self->_vrx._value = value;
    self->_vrx._hasLoaded = 1;
  }
  os_unfair_lock_unlock(p_loadLock);
  v5 = v9;
  if (v9 == v8)
  {
    v6 = 4;
    v5 = v8;
    goto LABEL_9;
  }
  if (v9)
  {
    v6 = 5;
LABEL_9:
    (*(void (**)(void))(*v5 + 8 * v6))();
  }
  return value;
}

- (void)setVrx:(BOOL)a3
{
  os_unfair_lock_s *p_loadLock;

  p_loadLock = &self->_vrx._loadLock;
  os_unfair_lock_lock(&self->_vrx._loadLock);
  self->_vrx._hasLoaded = 1;
  self->_vrx._value = a3;
  os_unfair_lock_unlock(p_loadLock);
}

- (BOOL)workoutCondenseOnLock
{
  os_unfair_lock_s *p_loadLock;
  char value;
  _QWORD *v5;
  uint64_t v6;
  _QWORD v8[3];
  _QWORD *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v8[0] = &unk_1E37F61A0;
  v8[1] = &__block_literal_global_77_0;
  v9 = v8;
  p_loadLock = &self->_workoutCondenseOnLock._loadLock;
  os_unfair_lock_lock(&self->_workoutCondenseOnLock._loadLock);
  if (self->_workoutCondenseOnLock._hasLoaded)
  {
    value = self->_workoutCondenseOnLock._value;
  }
  else
  {
    if (!v9)
      std::__throw_bad_function_call[abi:ne180100]();
    value = (*(uint64_t (**)(_QWORD *))(*v9 + 48))(v9);
    self->_workoutCondenseOnLock._value = value;
    self->_workoutCondenseOnLock._hasLoaded = 1;
  }
  os_unfair_lock_unlock(p_loadLock);
  v5 = v9;
  if (v9 == v8)
  {
    v6 = 4;
    v5 = v8;
    goto LABEL_9;
  }
  if (v9)
  {
    v6 = 5;
LABEL_9:
    (*(void (**)(void))(*v5 + 8 * v6))();
  }
  return value;
}

- (BOOL)workoutSeriesAggregation
{
  os_unfair_lock_s *p_loadLock;
  char value;
  _QWORD *v5;
  uint64_t v6;
  _QWORD v8[3];
  _QWORD *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v8[0] = &unk_1E37F61A0;
  v8[1] = &__block_literal_global_79;
  v9 = v8;
  p_loadLock = &self->_workoutSeriesAggregation._loadLock;
  os_unfair_lock_lock(&self->_workoutSeriesAggregation._loadLock);
  if (self->_workoutSeriesAggregation._hasLoaded)
  {
    value = self->_workoutSeriesAggregation._value;
  }
  else
  {
    if (!v9)
      std::__throw_bad_function_call[abi:ne180100]();
    value = (*(uint64_t (**)(_QWORD *))(*v9 + 48))(v9);
    self->_workoutSeriesAggregation._value = value;
    self->_workoutSeriesAggregation._hasLoaded = 1;
  }
  os_unfair_lock_unlock(p_loadLock);
  v5 = v9;
  if (v9 == v8)
  {
    v6 = 4;
    v5 = v8;
    goto LABEL_9;
  }
  if (v9)
  {
    v6 = 5;
LABEL_9:
    (*(void (**)(void))(*v5 + 8 * v6))();
  }
  return value;
}

- (void)setWorkoutSeriesAggregation:(BOOL)a3
{
  os_unfair_lock_s *p_loadLock;

  p_loadLock = &self->_workoutSeriesAggregation._loadLock;
  os_unfair_lock_lock(&self->_workoutSeriesAggregation._loadLock);
  self->_workoutSeriesAggregation._hasLoaded = 1;
  self->_workoutSeriesAggregation._value = a3;
  os_unfair_lock_unlock(p_loadLock);
}

- (BOOL)stringCache
{
  os_unfair_lock_s *p_loadLock;
  char value;
  _QWORD *v5;
  uint64_t v6;
  _QWORD v8[3];
  _QWORD *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v8[0] = &unk_1E37F61A0;
  v8[1] = &__block_literal_global_81;
  v9 = v8;
  p_loadLock = &self->_stringCache._loadLock;
  os_unfair_lock_lock(&self->_stringCache._loadLock);
  if (self->_stringCache._hasLoaded)
  {
    value = self->_stringCache._value;
  }
  else
  {
    if (!v9)
      std::__throw_bad_function_call[abi:ne180100]();
    value = (*(uint64_t (**)(_QWORD *))(*v9 + 48))(v9);
    self->_stringCache._value = value;
    self->_stringCache._hasLoaded = 1;
  }
  os_unfair_lock_unlock(p_loadLock);
  v5 = v9;
  if (v9 == v8)
  {
    v6 = 4;
    v5 = v8;
    goto LABEL_9;
  }
  if (v9)
  {
    v6 = 5;
LABEL_9:
    (*(void (**)(void))(*v5 + 8 * v6))();
  }
  return value;
}

- (void)setStringCache:(BOOL)a3
{
  os_unfair_lock_s *p_loadLock;

  p_loadLock = &self->_stringCache._loadLock;
  os_unfair_lock_lock(&self->_stringCache._loadLock);
  self->_stringCache._hasLoaded = 1;
  self->_stringCache._value = a3;
  os_unfair_lock_unlock(p_loadLock);
}

- (BOOL)xpcGatedSecondaryJournalMerge
{
  os_unfair_lock_s *p_loadLock;
  char value;
  _QWORD *v5;
  uint64_t v6;
  _QWORD v8[3];
  _QWORD *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v8[0] = &unk_1E37F61A0;
  v8[1] = &__block_literal_global_83;
  v9 = v8;
  p_loadLock = &self->_xpcGatedSecondaryJournalMerge._loadLock;
  os_unfair_lock_lock(&self->_xpcGatedSecondaryJournalMerge._loadLock);
  if (self->_xpcGatedSecondaryJournalMerge._hasLoaded)
  {
    value = self->_xpcGatedSecondaryJournalMerge._value;
  }
  else
  {
    if (!v9)
      std::__throw_bad_function_call[abi:ne180100]();
    value = (*(uint64_t (**)(_QWORD *))(*v9 + 48))(v9);
    self->_xpcGatedSecondaryJournalMerge._value = value;
    self->_xpcGatedSecondaryJournalMerge._hasLoaded = 1;
  }
  os_unfair_lock_unlock(p_loadLock);
  v5 = v9;
  if (v9 == v8)
  {
    v6 = 4;
    v5 = v8;
    goto LABEL_9;
  }
  if (v9)
  {
    v6 = 5;
LABEL_9:
    (*(void (**)(void))(*v5 + 8 * v6))();
  }
  return value;
}

- (BOOL)maritime
{
  os_unfair_lock_s *p_loadLock;
  char value;
  _QWORD *v5;
  uint64_t v6;
  _QWORD v8[3];
  _QWORD *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v8[0] = &unk_1E37F61A0;
  v8[1] = &__block_literal_global_85;
  v9 = v8;
  p_loadLock = &self->_maritime._loadLock;
  os_unfair_lock_lock(&self->_maritime._loadLock);
  if (self->_maritime._hasLoaded)
  {
    value = self->_maritime._value;
  }
  else
  {
    if (!v9)
      std::__throw_bad_function_call[abi:ne180100]();
    value = (*(uint64_t (**)(_QWORD *))(*v9 + 48))(v9);
    self->_maritime._value = value;
    self->_maritime._hasLoaded = 1;
  }
  os_unfair_lock_unlock(p_loadLock);
  v5 = v9;
  if (v9 == v8)
  {
    v6 = 4;
    v5 = v8;
    goto LABEL_9;
  }
  if (v9)
  {
    v6 = 5;
LABEL_9:
    (*(void (**)(void))(*v5 + 8 * v6))();
  }
  return value;
}

- (void)setMaritime:(BOOL)a3
{
  os_unfair_lock_s *p_loadLock;

  p_loadLock = &self->_maritime._loadLock;
  os_unfair_lock_lock(&self->_maritime._loadLock);
  self->_maritime._hasLoaded = 1;
  self->_maritime._value = a3;
  os_unfair_lock_unlock(p_loadLock);
}

- (BOOL)expirementalOrchestrationAdoption
{
  return self->_expirementalOrchestrationAdoption;
}

- (BOOL)beryllium
{
  return self->_beryllium;
}

- (void)setBeryllium:(BOOL)a3
{
  self->_beryllium = a3;
}

- (id).cxx_construct
{
  *((_DWORD *)self + 3) = 0;
  *((_DWORD *)self + 5) = 0;
  *((_DWORD *)self + 7) = 0;
  *((_DWORD *)self + 9) = 0;
  *((_DWORD *)self + 11) = 0;
  *((_DWORD *)self + 13) = 0;
  *((_DWORD *)self + 15) = 0;
  *((_DWORD *)self + 17) = 0;
  *((_DWORD *)self + 19) = 0;
  *((_DWORD *)self + 21) = 0;
  *((_DWORD *)self + 23) = 0;
  *((_DWORD *)self + 25) = 0;
  *((_DWORD *)self + 27) = 0;
  *((_DWORD *)self + 29) = 0;
  *((_DWORD *)self + 31) = 0;
  *((_DWORD *)self + 33) = 0;
  *((_DWORD *)self + 35) = 0;
  *((_DWORD *)self + 37) = 0;
  *((_DWORD *)self + 39) = 0;
  *((_DWORD *)self + 41) = 0;
  *((_DWORD *)self + 43) = 0;
  *((_DWORD *)self + 45) = 0;
  *((_DWORD *)self + 47) = 0;
  *((_DWORD *)self + 49) = 0;
  *((_DWORD *)self + 51) = 0;
  *((_DWORD *)self + 53) = 0;
  *((_DWORD *)self + 55) = 0;
  *((_DWORD *)self + 57) = 0;
  *((_DWORD *)self + 59) = 0;
  *((_DWORD *)self + 61) = 0;
  *((_DWORD *)self + 63) = 0;
  *((_DWORD *)self + 65) = 0;
  *((_DWORD *)self + 67) = 0;
  *((_DWORD *)self + 69) = 0;
  *((_DWORD *)self + 71) = 0;
  *((_DWORD *)self + 73) = 0;
  *((_DWORD *)self + 75) = 0;
  *((_DWORD *)self + 77) = 0;
  *((_DWORD *)self + 79) = 0;
  *((_DWORD *)self + 81) = 0;
  *((_DWORD *)self + 83) = 0;
  *((_DWORD *)self + 85) = 0;
  *((_DWORD *)self + 87) = 0;
  return self;
}

@end
