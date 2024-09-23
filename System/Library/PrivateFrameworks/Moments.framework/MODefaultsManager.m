@implementation MODefaultsManager

+ (id)onboardingDateKey:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;

  v3 = onboardingDateKey__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&onboardingDateKey__onceToken, &__block_literal_global_0);
  objc_msgSend((id)onboardingDateKey__mapping, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __64__MODefaultsManager_MOEventBundleSourceType__onboardingDateKey___block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[8];
  _QWORD v3[9];

  v3[8] = *MEMORY[0x1E0C80C00];
  v2[0] = MOEventBundleSourceTypeMedia;
  v2[1] = MOEventBundleSourceTypePhoto;
  v3[0] = CFSTR("OnboardingEarliestCollectDateMedia");
  v3[1] = CFSTR("OnboardingEarliestCollectDatePhoto");
  v2[2] = MOEventBundleSourceTypeContact;
  v2[3] = MOEventBundleSourceTypeActivity;
  v3[2] = CFSTR("OnboardingEarliestCollectDateCommunication");
  v3[3] = CFSTR("OnboardingEarliestCollectDateActivity");
  v2[4] = MOEventBundleSourceTypeVisitLocation;
  v2[5] = MOEventBundleSourceTypeThirdPartyMedia;
  v3[4] = CFSTR("OnboardingEarliestCollectDateLocation");
  v3[5] = CFSTR("OnboardingEarliestCollectDateMedia");
  v2[6] = MOEventBundleSourceTypePeopleContext;
  v2[7] = MOEventBundleSourceTypeStateOfMind;
  v3[6] = CFSTR("OnboardingEarliestCollectDatePeople");
  v3[7] = CFSTR("OnboardingEarliestCollectDateStateOfMind");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)onboardingDateKey__mapping;
  onboardingDateKey__mapping = v0;

}

- (id)onboardingDateFor:(id)a3
{
  void *v4;
  void *v5;

  +[MODefaultsManager onboardingDateKey:](MODefaultsManager, "onboardingDateKey:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[MODefaultsManager objectForKey:](self, "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)onboardingDateForJournalingSuggestions
{
  return -[MODefaultsManager objectForKey:](self, "objectForKey:", CFSTR("OnboardingDate"));
}

- (MODefaultsManager)init
{
  return -[MODefaultsManager initWithUniverse:](self, "initWithUniverse:", 0);
}

- (MODefaultsManager)initWithUniverse:(id)a3
{
  MODefaultsManager *v3;
  uint64_t v4;
  NSUserDefaults *userDefaults;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MODefaultsManager;
  v3 = -[MODefaultsManager init](&v7, sel_init, a3);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v4 = objc_claimAutoreleasedReturnValue();
    userDefaults = v3->_userDefaults;
    v3->_userDefaults = (NSUserDefaults *)v4;

  }
  return v3;
}

- (id)objectForKey:(id)a3
{
  id v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v5 = a3;
  if (v5)
  {
    -[NSUserDefaults objectForKey:](self->_userDefaults, "objectForKey:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    _mo_log_facility_get_os_log(MOLogFacilityDefaults);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[MODefaultsManager objectForKey:].cold.3((uint64_t)v5, (uint64_t)v6, v7);
  }
  else
  {
    _mo_log_facility_get_os_log(MOLogFacilityGeneral);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[MODefaultsManager objectForKey:].cold.2();

    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MODefaultsManager.m"), 32, CFSTR("Invalid parameter not satisfying: key (in %s:%d)"), "-[MODefaultsManager objectForKey:]", 32);

    _mo_log_facility_get_os_log(MOLogFacilityDefaults);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[MODefaultsManager objectForKey:].cold.1(v7, v10, v11, v12, v13, v14, v15, v16);
    v6 = 0;
  }

  return v6;
}

- (id)objectForKeyWithoutLog:(id)a3
{
  void *v4;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  if (a3)
  {
    -[NSUserDefaults objectForKey:](self->_userDefaults, "objectForKey:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    _mo_log_facility_get_os_log(MOLogFacilityGeneral);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[MODefaultsManager objectForKeyWithoutLog:].cold.2();

    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MODefaultsManager.m"), 52, CFSTR("Invalid parameter not satisfying: key (in %s:%d)"), "-[MODefaultsManager objectForKeyWithoutLog:]", 52);

    _mo_log_facility_get_os_log(MOLogFacilityDefaults);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[MODefaultsManager objectForKeyWithoutLog:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);

    v4 = 0;
  }
  return v4;
}

- (void)deleteObjectForKey:(id)a3
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    _mo_log_facility_get_os_log(MOLogFacilityDefaults);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v10 = "-[MODefaultsManager deleteObjectForKey:]";
      v11 = 2112;
      v12 = v5;
      _os_log_impl(&dword_1CAE42000, v6, OS_LOG_TYPE_INFO, "%s, deleting key, %@", buf, 0x16u);
    }

    -[NSUserDefaults removeObjectForKey:](self->_userDefaults, "removeObjectForKey:", v5);
  }
  else
  {
    _mo_log_facility_get_os_log(MOLogFacilityGeneral);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[MODefaultsManager deleteObjectForKey:].cold.1();

    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MODefaultsManager.m"), 66, CFSTR("Invalid parameter not satisfying: key (in %s:%d)"), "-[MODefaultsManager deleteObjectForKey:]", 66);

  }
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (v8)
  {
    _mo_log_facility_get_os_log(MOLogFacilityDefaults);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v13 = "-[MODefaultsManager setObject:forKey:]";
      v14 = 2112;
      v15 = v8;
      v16 = 2112;
      v17 = v7;
      _os_log_impl(&dword_1CAE42000, v9, OS_LOG_TYPE_INFO, "%s, key, %@, value, %@", buf, 0x20u);
    }

    -[NSUserDefaults setObject:forKey:](self->_userDefaults, "setObject:forKey:", v7, v8);
  }
  else
  {
    _mo_log_facility_get_os_log(MOLogFacilityGeneral);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[MODefaultsManager setObject:forKey:].cold.1();

    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MODefaultsManager.m"), 80, CFSTR("Invalid parameter not satisfying: key (in %s:%d)"), "-[MODefaultsManager setObject:forKey:]", 80);

  }
}

- (void)setObjectWithoutLog:(id)a3 forKey:(id)a4
{
  NSObject *v6;
  void *v7;

  if (a4)
  {
    -[NSUserDefaults setObject:forKey:](self->_userDefaults, "setObject:forKey:", a3);
  }
  else
  {
    _mo_log_facility_get_os_log(MOLogFacilityGeneral);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[MODefaultsManager setObjectWithoutLog:forKey:].cold.1();

    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MODefaultsManager.m"), 97, CFSTR("Invalid parameter not satisfying: key (in %s:%d)"), "-[MODefaultsManager setObjectWithoutLog:forKey:]", 97);

  }
}

- (MODefaultsManager)initWithSuiteName:(id)a3
{
  id v4;
  MODefaultsManager *v5;
  uint64_t v6;
  NSUserDefaults *userDefaults;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MODefaultsManager;
  v5 = -[MODefaultsManager init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", v4);
    userDefaults = v5->_userDefaults;
    v5->_userDefaults = (NSUserDefaults *)v6;

  }
  return v5;
}

- (NSUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userDefaults, 0);
}

- (void)objectForKey:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_1(&dword_1CAE42000, a1, a3, "%s, key cannot be nil!", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)objectForKey:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CAE42000, v0, v1, "Invalid parameter not satisfying: key (in %s:%d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)objectForKey:(os_log_t)log .cold.3(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  const char *v4;
  __int16 v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = 136315650;
  v4 = "-[MODefaultsManager objectForKey:]";
  v5 = 2112;
  v6 = a1;
  v7 = 2112;
  v8 = a2;
  _os_log_debug_impl(&dword_1CAE42000, log, OS_LOG_TYPE_DEBUG, "%s, key, %@, value, %@", (uint8_t *)&v3, 0x20u);
}

- (void)objectForKeyWithoutLog:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_1(&dword_1CAE42000, a1, a3, "%s, key cannot be nil!", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)objectForKeyWithoutLog:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CAE42000, v0, v1, "Invalid parameter not satisfying: key (in %s:%d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)deleteObjectForKey:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CAE42000, v0, v1, "Invalid parameter not satisfying: key (in %s:%d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)setObject:forKey:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CAE42000, v0, v1, "Invalid parameter not satisfying: key (in %s:%d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)setObjectWithoutLog:forKey:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CAE42000, v0, v1, "Invalid parameter not satisfying: key (in %s:%d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
