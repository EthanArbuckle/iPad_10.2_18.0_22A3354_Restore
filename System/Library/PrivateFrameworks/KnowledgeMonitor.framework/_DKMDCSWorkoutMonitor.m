@implementation _DKMDCSWorkoutMonitor

+ (id)eventStream
{
  return CFSTR("MDCSWorkout");
}

+ (id)entitlements
{
  return (id)MEMORY[0x24BDBD1A8];
}

- (_DKMDCSWorkoutMonitor)init
{
  _DKMDCSWorkoutMonitor *v2;
  NSObject *v3;
  uint8_t v5[16];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_DKMDCSWorkoutMonitor;
  v2 = -[_DKMonitor init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BE1AFC8], "knowledgeChannel");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_219056000, v3, OS_LOG_TYPE_DEFAULT, "Enabling MDCS Workout monitor", v5, 2u);
    }

  }
  return v2;
}

- (void)start
{
  OUTLINED_FUNCTION_1_1(&dword_219056000, a1, a3, "Could not register for MDCS Workout Context", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_1();
}

- (void)stop
{
  _CDContextualChangeRegistration *registration;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_DKMDCSWorkoutMonitor;
  if (-[_DKMonitor instantMonitorNeedsDeactivation](&v4, sel_instantMonitorNeedsDeactivation))
  {
    if (self->_registration)
    {
      -[_CDClientContext deregisterCallback:](self->_userContext, "deregisterCallback:");
      registration = self->_registration;
      self->_registration = 0;

    }
  }
}

- (id)createWorkoutPredicate
{
  void *v2;
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v19[5];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;

  v20 = 0;
  v21 = &v20;
  v22 = 0x2050000000;
  v2 = (void *)getHKWorkoutClass_softClass;
  v23 = getHKWorkoutClass_softClass;
  if (!getHKWorkoutClass_softClass)
  {
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __getHKWorkoutClass_block_invoke;
    v19[3] = &unk_24DA670A8;
    v19[4] = &v20;
    __getHKWorkoutClass_block_invoke((uint64_t)v19);
    v2 = (void *)v21[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v20, 8);
  objc_msgSend(v3, "_allWorkoutActivityTypes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = objc_opt_new();
    __HKWorkoutSessionStateName(2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject addObject:](v5, "addObject:", v6);

    __HKWorkoutSessionStateName(3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject addObject:](v5, "addObject:", v7);

    v8 = (void *)MEMORY[0x24BE1B1B0];
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "predicateForFirstPartyWorkoutMatchingTypes:states:", v9, v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BE1AFC8], "knowledgeChannel");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[_DKMDCSWorkoutMonitor createWorkoutPredicate].cold.1(v5, v11, v12, v13, v14, v15, v16, v17);
    v10 = 0;
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registration, 0);
  objc_storeStrong((id *)&self->_userContext, 0);
}

- (void)createWorkoutPredicate
{
  OUTLINED_FUNCTION_1_1(&dword_219056000, a1, a3, "Unable to retrieve all workout types from HealthKit", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_1();
}

@end
