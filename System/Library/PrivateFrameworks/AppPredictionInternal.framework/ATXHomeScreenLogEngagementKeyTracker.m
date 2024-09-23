@implementation ATXHomeScreenLogEngagementKeyTracker

- (ATXHomeScreenLogEngagementKeyTracker)initWithRotationAggregationKey:(id)a3 rotationBooleanKey:(id)a4 rotationFinalOutcomeKey:(id)a5
{
  id v9;
  id v10;
  id v11;
  ATXHomeScreenLogEngagementKeyTracker *v12;
  ATXHomeScreenLogEngagementKeyTracker *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)ATXHomeScreenLogEngagementKeyTracker;
  v12 = -[ATXHomeScreenLogEngagementKeyTracker init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_rotationAggregationKey, a3);
    objc_storeStrong((id *)&v13->_rotationBooleanKey, a4);
    objc_storeStrong((id *)&v13->_rotationFinalOutcomeKey, a5);
  }

  return v13;
}

+ (id)keyTrackerForStackEngagementStatus:(unint64_t)a3
{
  void *v3;
  NSObject *v4;
  id result;
  _QWORD v6[5];
  _QWORD v7[5];
  _QWORD v8[5];
  _QWORD v9[5];
  _QWORD v10[5];
  _QWORD v11[5];
  _QWORD v12[5];
  _QWORD block[5];

  switch(a3)
  {
    case 0uLL:
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __75__ATXHomeScreenLogEngagementKeyTracker_keyTrackerForStackEngagementStatus___block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0l;
      block[4] = a1;
      if (keyTrackerForStackEngagementStatus___pasOnceToken6 != -1)
        dispatch_once(&keyTrackerForStackEngagementStatus___pasOnceToken6, block);
      v3 = (void *)keyTrackerForStackEngagementStatus___pasExprOnceResult;
      goto LABEL_29;
    case 1uLL:
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __75__ATXHomeScreenLogEngagementKeyTracker_keyTrackerForStackEngagementStatus___block_invoke_2;
      v12[3] = &__block_descriptor_40_e5_v8__0l;
      v12[4] = a1;
      if (keyTrackerForStackEngagementStatus___pasOnceToken7 != -1)
        dispatch_once(&keyTrackerForStackEngagementStatus___pasOnceToken7, v12);
      v3 = (void *)keyTrackerForStackEngagementStatus___pasExprOnceResult_80;
      goto LABEL_29;
    case 2uLL:
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __75__ATXHomeScreenLogEngagementKeyTracker_keyTrackerForStackEngagementStatus___block_invoke_3;
      v11[3] = &__block_descriptor_40_e5_v8__0l;
      v11[4] = a1;
      if (keyTrackerForStackEngagementStatus___pasOnceToken8 != -1)
        dispatch_once(&keyTrackerForStackEngagementStatus___pasOnceToken8, v11);
      v3 = (void *)keyTrackerForStackEngagementStatus___pasExprOnceResult_81;
      goto LABEL_29;
    case 3uLL:
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __75__ATXHomeScreenLogEngagementKeyTracker_keyTrackerForStackEngagementStatus___block_invoke_4;
      v10[3] = &__block_descriptor_40_e5_v8__0l;
      v10[4] = a1;
      if (keyTrackerForStackEngagementStatus___pasOnceToken9 != -1)
        dispatch_once(&keyTrackerForStackEngagementStatus___pasOnceToken9, v10);
      v3 = (void *)keyTrackerForStackEngagementStatus___pasExprOnceResult_82;
      goto LABEL_29;
    case 4uLL:
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __75__ATXHomeScreenLogEngagementKeyTracker_keyTrackerForStackEngagementStatus___block_invoke_5;
      v9[3] = &__block_descriptor_40_e5_v8__0l;
      v9[4] = a1;
      if (keyTrackerForStackEngagementStatus___pasOnceToken10 != -1)
        dispatch_once(&keyTrackerForStackEngagementStatus___pasOnceToken10, v9);
      v3 = (void *)keyTrackerForStackEngagementStatus___pasExprOnceResult_83;
      goto LABEL_29;
    case 5uLL:
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __75__ATXHomeScreenLogEngagementKeyTracker_keyTrackerForStackEngagementStatus___block_invoke_7;
      v7[3] = &__block_descriptor_40_e5_v8__0l;
      v7[4] = a1;
      if (keyTrackerForStackEngagementStatus___pasOnceToken12 != -1)
        dispatch_once(&keyTrackerForStackEngagementStatus___pasOnceToken12, v7);
      v3 = (void *)keyTrackerForStackEngagementStatus___pasExprOnceResult_85;
      goto LABEL_29;
    case 6uLL:
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __75__ATXHomeScreenLogEngagementKeyTracker_keyTrackerForStackEngagementStatus___block_invoke_8;
      v6[3] = &__block_descriptor_40_e5_v8__0l;
      v6[4] = a1;
      if (keyTrackerForStackEngagementStatus___pasOnceToken13 != -1)
        dispatch_once(&keyTrackerForStackEngagementStatus___pasOnceToken13, v6);
      v3 = (void *)keyTrackerForStackEngagementStatus___pasExprOnceResult_86;
      goto LABEL_29;
    case 7uLL:
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __75__ATXHomeScreenLogEngagementKeyTracker_keyTrackerForStackEngagementStatus___block_invoke_6;
      v8[3] = &__block_descriptor_40_e5_v8__0l;
      v8[4] = a1;
      if (keyTrackerForStackEngagementStatus___pasOnceToken11 != -1)
        dispatch_once(&keyTrackerForStackEngagementStatus___pasOnceToken11, v8);
      v3 = (void *)keyTrackerForStackEngagementStatus___pasExprOnceResult_84;
LABEL_29:
      result = v3;
      break;
    default:
      __atxlog_handle_home_screen();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
        +[ATXHomeScreenLogEngagementKeyTracker keyTrackerForStackEngagementStatus:].cold.1(v4);

      result = 0;
      break;
  }
  return result;
}

void __75__ATXHomeScreenLogEngagementKeyTracker_keyTrackerForStackEngagementStatus___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)MEMORY[0x1CAA48B6C]();
  v3 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "initWithRotationAggregationKey:rotationBooleanKey:rotationFinalOutcomeKey:", 0, 0, CFSTR("numFinalOutcomeNotSeen"));
  v4 = (void *)keyTrackerForStackEngagementStatus___pasExprOnceResult;
  keyTrackerForStackEngagementStatus___pasExprOnceResult = v3;

  objc_autoreleasePoolPop(v2);
}

void __75__ATXHomeScreenLogEngagementKeyTracker_keyTrackerForStackEngagementStatus___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)MEMORY[0x1CAA48B6C]();
  v3 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "initWithRotationAggregationKey:rotationBooleanKey:rotationFinalOutcomeKey:", CFSTR("views"), CFSTR("viewedRotations"), CFSTR("numFinalOutcomeSeen"));
  v4 = (void *)keyTrackerForStackEngagementStatus___pasExprOnceResult_80;
  keyTrackerForStackEngagementStatus___pasExprOnceResult_80 = v3;

  objc_autoreleasePoolPop(v2);
}

void __75__ATXHomeScreenLogEngagementKeyTracker_keyTrackerForStackEngagementStatus___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)MEMORY[0x1CAA48B6C]();
  v3 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "initWithRotationAggregationKey:rotationBooleanKey:rotationFinalOutcomeKey:", CFSTR("pseudoDismisses"), 0, CFSTR("numFinalOutcomePseudoDismiss"));
  v4 = (void *)keyTrackerForStackEngagementStatus___pasExprOnceResult_81;
  keyTrackerForStackEngagementStatus___pasExprOnceResult_81 = v3;

  objc_autoreleasePoolPop(v2);
}

void __75__ATXHomeScreenLogEngagementKeyTracker_keyTrackerForStackEngagementStatus___block_invoke_4(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)MEMORY[0x1CAA48B6C]();
  v3 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "initWithRotationAggregationKey:rotationBooleanKey:rotationFinalOutcomeKey:", CFSTR("pseudotaps"), CFSTR("pseudoTappedRotations"), CFSTR("numFinalOutcomePseudoTap"));
  v4 = (void *)keyTrackerForStackEngagementStatus___pasExprOnceResult_82;
  keyTrackerForStackEngagementStatus___pasExprOnceResult_82 = v3;

  objc_autoreleasePoolPop(v2);
}

void __75__ATXHomeScreenLogEngagementKeyTracker_keyTrackerForStackEngagementStatus___block_invoke_5(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)MEMORY[0x1CAA48B6C]();
  v3 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "initWithRotationAggregationKey:rotationBooleanKey:rotationFinalOutcomeKey:", CFSTR("taps"), CFSTR("tappedRotations"), CFSTR("numFinalOutcomeTap"));
  v4 = (void *)keyTrackerForStackEngagementStatus___pasExprOnceResult_83;
  keyTrackerForStackEngagementStatus___pasExprOnceResult_83 = v3;

  objc_autoreleasePoolPop(v2);
}

void __75__ATXHomeScreenLogEngagementKeyTracker_keyTrackerForStackEngagementStatus___block_invoke_6(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)MEMORY[0x1CAA48B6C]();
  v3 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "initWithRotationAggregationKey:rotationBooleanKey:rotationFinalOutcomeKey:", 0, 0, CFSTR("timesAddedToStack"));
  v4 = (void *)keyTrackerForStackEngagementStatus___pasExprOnceResult_84;
  keyTrackerForStackEngagementStatus___pasExprOnceResult_84 = v3;

  objc_autoreleasePoolPop(v2);
}

void __75__ATXHomeScreenLogEngagementKeyTracker_keyTrackerForStackEngagementStatus___block_invoke_7(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)MEMORY[0x1CAA48B6C]();
  v3 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "initWithRotationAggregationKey:rotationBooleanKey:rotationFinalOutcomeKey:", 0, 0, CFSTR("dismissOnces"));
  v4 = (void *)keyTrackerForStackEngagementStatus___pasExprOnceResult_85;
  keyTrackerForStackEngagementStatus___pasExprOnceResult_85 = v3;

  objc_autoreleasePoolPop(v2);
}

void __75__ATXHomeScreenLogEngagementKeyTracker_keyTrackerForStackEngagementStatus___block_invoke_8(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)MEMORY[0x1CAA48B6C]();
  v3 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "initWithRotationAggregationKey:rotationBooleanKey:rotationFinalOutcomeKey:", 0, 0, CFSTR("neverShows"));
  v4 = (void *)keyTrackerForStackEngagementStatus___pasExprOnceResult_86;
  keyTrackerForStackEngagementStatus___pasExprOnceResult_86 = v3;

  objc_autoreleasePoolPop(v2);
}

- (NSString)rotationAggregationKey
{
  return self->_rotationAggregationKey;
}

- (NSString)rotationBooleanKey
{
  return self->_rotationBooleanKey;
}

- (NSString)rotationFinalOutcomeKey
{
  return self->_rotationFinalOutcomeKey;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rotationFinalOutcomeKey, 0);
  objc_storeStrong((id *)&self->_rotationBooleanKey, 0);
  objc_storeStrong((id *)&self->_rotationAggregationKey, 0);
}

+ (void)keyTrackerForStackEngagementStatus:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1C9A3B000, log, OS_LOG_TYPE_FAULT, "ATXHomeScreenLogUploader: Received unknown engagement type", v1, 2u);
}

@end
