@implementation ATXHomeScreenLogSystemEventRotationSessionEngagementKeyTracker

- (ATXHomeScreenLogSystemEventRotationSessionEngagementKeyTracker)initWithStatusAggregationKey:(id)a3 proactiveStatusAggregationKey:(id)a4 proactiveStatusBooleanKey:(id)a5 userScrollStatusBooleanKey:(id)a6 userScrollFinalOutcomeKey:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  ATXHomeScreenLogSystemEventRotationSessionEngagementKeyTracker *v17;
  ATXHomeScreenLogSystemEventRotationSessionEngagementKeyTracker *v18;
  id v20;
  objc_super v21;

  v20 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)ATXHomeScreenLogSystemEventRotationSessionEngagementKeyTracker;
  v17 = -[ATXHomeScreenLogSystemEventRotationSessionEngagementKeyTracker init](&v21, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_statusAggregationKey, a3);
    objc_storeStrong((id *)&v18->_proactiveStatusAggregationKey, a4);
    objc_storeStrong((id *)&v18->_proactiveStatusBooleanKey, a5);
    objc_storeStrong((id *)&v18->_userScrollStatusBooleanKey, a6);
    objc_storeStrong((id *)&v18->_userScrollFinalOutcomeKey, a7);
  }

  return v18;
}

+ (id)keyTrackerForRotationSessionStackEngagementStatus:(unint64_t)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  id result;
  _QWORD v7[5];
  _QWORD v8[5];
  _QWORD block[5];

  v3 = 0;
  switch(a3)
  {
    case 0uLL:
    case 2uLL:
      goto LABEL_15;
    case 1uLL:
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __116__ATXHomeScreenLogSystemEventRotationSessionEngagementKeyTracker_keyTrackerForRotationSessionStackEngagementStatus___block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0l;
      block[4] = a1;
      if (keyTrackerForRotationSessionStackEngagementStatus___pasOnceToken6 != -1)
        dispatch_once(&keyTrackerForRotationSessionStackEngagementStatus___pasOnceToken6, block);
      v4 = (void *)keyTrackerForRotationSessionStackEngagementStatus___pasExprOnceResult;
      goto LABEL_14;
    case 3uLL:
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __116__ATXHomeScreenLogSystemEventRotationSessionEngagementKeyTracker_keyTrackerForRotationSessionStackEngagementStatus___block_invoke_2;
      v8[3] = &__block_descriptor_40_e5_v8__0l;
      v8[4] = a1;
      if (keyTrackerForRotationSessionStackEngagementStatus___pasOnceToken7 != -1)
        dispatch_once(&keyTrackerForRotationSessionStackEngagementStatus___pasOnceToken7, v8);
      v4 = (void *)keyTrackerForRotationSessionStackEngagementStatus___pasExprOnceResult_116;
      goto LABEL_14;
    case 4uLL:
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __116__ATXHomeScreenLogSystemEventRotationSessionEngagementKeyTracker_keyTrackerForRotationSessionStackEngagementStatus___block_invoke_3;
      v7[3] = &__block_descriptor_40_e5_v8__0l;
      v7[4] = a1;
      if (keyTrackerForRotationSessionStackEngagementStatus___pasOnceToken8 != -1)
        dispatch_once(&keyTrackerForRotationSessionStackEngagementStatus___pasOnceToken8, v7);
      v4 = (void *)keyTrackerForRotationSessionStackEngagementStatus___pasExprOnceResult_117;
LABEL_14:
      v3 = v4;
LABEL_15:
      result = v3;
      break;
    default:
      __atxlog_handle_home_screen();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
        +[ATXHomeScreenLogEngagementKeyTracker keyTrackerForStackEngagementStatus:].cold.1(v5);

      result = 0;
      break;
  }
  return result;
}

void __116__ATXHomeScreenLogSystemEventRotationSessionEngagementKeyTracker_keyTrackerForRotationSessionStackEngagementStatus___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)MEMORY[0x1CAA48B6C]();
  v3 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "initWithStatusAggregationKey:proactiveStatusAggregationKey:proactiveStatusBooleanKey:userScrollStatusBooleanKey:userScrollFinalOutcomeKey:", CFSTR("NumberOfViewsForStackWidgetsOn"), CFSTR("NumberOfProactiveViewsOn"), CFSTR("NumberOfProactiveViewedRotationsOn"), 0, 0);
  v4 = (void *)keyTrackerForRotationSessionStackEngagementStatus___pasExprOnceResult;
  keyTrackerForRotationSessionStackEngagementStatus___pasExprOnceResult = v3;

  objc_autoreleasePoolPop(v2);
}

void __116__ATXHomeScreenLogSystemEventRotationSessionEngagementKeyTracker_keyTrackerForRotationSessionStackEngagementStatus___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)MEMORY[0x1CAA48B6C]();
  v3 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "initWithStatusAggregationKey:proactiveStatusAggregationKey:proactiveStatusBooleanKey:userScrollStatusBooleanKey:userScrollFinalOutcomeKey:", CFSTR("NumberOfPseudoTapsForStackWidgetsOn"), CFSTR("NumberOfProactivePseudoTapsOn"), CFSTR("NumberOfProactivePseudoTappedRotationsOn"), CFSTR("NumberOfUserScrollPseudoTappedRotationsOn"), CFSTR("NumberOfUserScrollFinalOutcomePseudoTappedOn"));
  v4 = (void *)keyTrackerForRotationSessionStackEngagementStatus___pasExprOnceResult_116;
  keyTrackerForRotationSessionStackEngagementStatus___pasExprOnceResult_116 = v3;

  objc_autoreleasePoolPop(v2);
}

void __116__ATXHomeScreenLogSystemEventRotationSessionEngagementKeyTracker_keyTrackerForRotationSessionStackEngagementStatus___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)MEMORY[0x1CAA48B6C]();
  v3 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "initWithStatusAggregationKey:proactiveStatusAggregationKey:proactiveStatusBooleanKey:userScrollStatusBooleanKey:userScrollFinalOutcomeKey:", CFSTR("NumberOfTapsForStackWidgetsOn"), CFSTR("NumberOfProactiveTapsByLocationOn"), CFSTR("NumberOfProactiveTappedRotationsOn"), CFSTR("NumberOfUserScrollPseudoTappedRotationsOn"), 0);
  v4 = (void *)keyTrackerForRotationSessionStackEngagementStatus___pasExprOnceResult_117;
  keyTrackerForRotationSessionStackEngagementStatus___pasExprOnceResult_117 = v3;

  objc_autoreleasePoolPop(v2);
}

- (NSString)statusAggregationKey
{
  return self->_statusAggregationKey;
}

- (NSString)proactiveStatusAggregationKey
{
  return self->_proactiveStatusAggregationKey;
}

- (NSString)proactiveStatusBooleanKey
{
  return self->_proactiveStatusBooleanKey;
}

- (NSString)userScrollStatusBooleanKey
{
  return self->_userScrollStatusBooleanKey;
}

- (NSString)userScrollFinalOutcomeKey
{
  return self->_userScrollFinalOutcomeKey;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userScrollFinalOutcomeKey, 0);
  objc_storeStrong((id *)&self->_userScrollStatusBooleanKey, 0);
  objc_storeStrong((id *)&self->_proactiveStatusBooleanKey, 0);
  objc_storeStrong((id *)&self->_proactiveStatusAggregationKey, 0);
  objc_storeStrong((id *)&self->_statusAggregationKey, 0);
}

@end
