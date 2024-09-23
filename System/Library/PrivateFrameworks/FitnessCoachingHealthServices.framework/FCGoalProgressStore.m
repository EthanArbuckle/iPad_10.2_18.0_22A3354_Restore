@implementation FCGoalProgressStore

- (FCGoalProgressStore)initWithProfile:(id)a3
{
  id v4;
  FCGoalProgressStore *v5;
  FCGoalProgressStore *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)FCGoalProgressStore;
  v5 = -[FCGoalProgressStore init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_profile, v4);

  return v6;
}

- (void)storeCurrentConfiguration:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  objc_msgSend(a3, "transportData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCGoalProgressStore _userDefaultsDomain](self, "_userDefaultsDomain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  objc_msgSend(v5, "setData:forKey:error:", v4, CFSTR("goalProgressConfigurationData"), &v14);
  v6 = v14;
  if (v6)
  {
    _HKInitializeLogging();
    v7 = *MEMORY[0x1E0CB5298];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5298], OS_LOG_TYPE_ERROR))
      -[FCGoalProgressStore storeCurrentConfiguration:].cold.1((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);
  }

}

- (id)currentConfiguration
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v14;

  -[FCGoalProgressStore _userDefaultsDomain](self, "_userDefaultsDomain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  objc_msgSend(v2, "dataForKey:error:", CFSTR("goalProgressConfigurationData"), &v14);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v14;
  if (v4)
  {
    _HKInitializeLogging();
    v5 = *MEMORY[0x1E0CB5298];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5298], OS_LOG_TYPE_ERROR))
      -[FCGoalProgressStore currentConfiguration].cold.1((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);
  }
  else if (v3)
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D22138]), "initWithTransportData:", v3);
    goto LABEL_7;
  }
  v12 = 0;
LABEL_7:

  return v12;
}

- (void)storeFiredEventDate:(id)a3 identifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  id v11;
  uint8_t buf[4];
  id v13;
  __int16 v14;
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[FCGoalProgressStore _legacyDefaultsDomain](self, "_legacyDefaultsDomain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  objc_msgSend(v8, "setDate:forKey:error:", v6, v7, &v11);
  v9 = v11;
  if (v9)
  {
    _HKInitializeLogging();
    v10 = *MEMORY[0x1E0CB5298];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5298], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v13 = v6;
      v14 = 2112;
      v15 = v7;
      v16 = 2112;
      v17 = v9;
      _os_log_error_impl(&dword_1CC30F000, v10, OS_LOG_TYPE_ERROR, "Failed to store goal progress event date %@ identifier %@, error %@", buf, 0x20u);
    }
  }

}

- (id)lastFiredEventDateForIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v17;

  v4 = a3;
  -[FCGoalProgressStore _legacyDefaultsDomain](self, "_legacyDefaultsDomain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  objc_msgSend(v5, "dateForKey:error:", v4, &v17);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v17;
  if (v7)
  {
    _HKInitializeLogging();
    v8 = *MEMORY[0x1E0CB5298];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5298], OS_LOG_TYPE_ERROR))
      -[FCGoalProgressStore lastFiredEventDateForIdentifier:].cold.1((uint64_t)v4, v8, v9, v10, v11, v12, v13, v14);
    v15 = 0;
  }
  else
  {
    v15 = v6;
  }

  return v15;
}

- (void)storeScheduledEventIdentifiers:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  v4 = a3;
  -[FCGoalProgressStore _userDefaultsDomain](self, "_userDefaultsDomain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  objc_msgSend(v5, "setPropertyListValue:forKey:error:", v6, CFSTR("goalProgressScheduledEventIdentifiers"), &v8);
  v7 = v8;

  if (v7)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5298], OS_LOG_TYPE_ERROR))
      -[FCGoalProgressStore storeScheduledEventIdentifiers:].cold.1();
  }

}

- (void)clearScheduledEventIdentifiers
{
  id v3;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E60]);
  -[FCGoalProgressStore storeScheduledEventIdentifiers:](self, "storeScheduledEventIdentifiers:", v3);

}

- (id)scheduledEventIdentifiers
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  id v7;

  -[FCGoalProgressStore _userDefaultsDomain](self, "_userDefaultsDomain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  objc_msgSend(v2, "propertyListValueForKey:error:", CFSTR("goalProgressScheduledEventIdentifiers"), &v7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v7;
  if (v4)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5298], OS_LOG_TYPE_ERROR))
      -[FCGoalProgressStore scheduledEventIdentifiers].cold.1();
    v5 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (id)_userDefaultsDomain
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__FCGoalProgressStore__userDefaultsDomain__block_invoke;
  block[3] = &unk_1E8800798;
  block[4] = self;
  if (_userDefaultsDomain_onceToken_0 != -1)
    dispatch_once(&_userDefaultsDomain_onceToken_0, block);
  return (id)_userDefaultsDomain_defaultsDomain_0;
}

void __42__FCGoalProgressStore__userDefaultsDomain__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  id WeakRetained;

  v2 = objc_alloc(MEMORY[0x1E0D294B8]);
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  v3 = objc_msgSend(v2, "initWithCategory:domainName:profile:", 1, CFSTR("com.apple.fitnesscoaching.goalProgress"), WeakRetained);
  v4 = (void *)_userDefaultsDomain_defaultsDomain_0;
  _userDefaultsDomain_defaultsDomain_0 = v3;

}

- (id)_legacyDefaultsDomain
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__FCGoalProgressStore__legacyDefaultsDomain__block_invoke;
  block[3] = &unk_1E8800798;
  block[4] = self;
  if (_legacyDefaultsDomain_onceToken != -1)
    dispatch_once(&_legacyDefaultsDomain_onceToken, block);
  return (id)_legacyDefaultsDomain_defaultsDomain;
}

void __44__FCGoalProgressStore__legacyDefaultsDomain__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id WeakRetained;

  v2 = objc_alloc(MEMORY[0x1E0D294B8]);
  v3 = *MEMORY[0x1E0D292A8];
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  v4 = objc_msgSend(v2, "initWithCategory:domainName:profile:", 1, v3, WeakRetained);
  v5 = (void *)_legacyDefaultsDomain_defaultsDomain;
  _legacyDefaultsDomain_defaultsDomain = v4;

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_profile);
}

- (void)storeCurrentConfiguration:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1CC30F000, a2, a3, "Failed to store current goal progress configuration %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)currentConfiguration
{
  OUTLINED_FUNCTION_0(&dword_1CC30F000, a2, a3, "Failed to fetch current goal progress configuration %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)lastFiredEventDateForIdentifier:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1CC30F000, a2, a3, "Failed to fetch last fired date for goal progress event: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)storeScheduledEventIdentifiers:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1CC30F000, v0, v1, "Failed to store scheduled goal progress event identifiers %{public}@, error %{public}@");
  OUTLINED_FUNCTION_3();
}

- (void)scheduledEventIdentifiers
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1CC30F000, v0, v1, "Failed to fetch scheduled goal progress event identifiers %{public}@, error %{public}@");
  OUTLINED_FUNCTION_3();
}

@end
