@implementation ICCloudThrottlingPolicy

void __48__ICCloudThrottlingPolicy_startPolicyResetTimer__block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "policyResetTimer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isValid");

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "policyResetTimer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "invalidate");

    objc_msgSend(*(id *)(a1 + 32), "setPolicyResetTimer:", 0);
  }
  objc_msgSend(*(id *)(a1 + 32), "policyStartDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "resetInterval");
  objc_msgSend(v5, "dateByAddingTimeInterval:");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0C99E88];
  objc_msgSend(v8, "timeIntervalSinceNow");
  objc_msgSend(v6, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", *(_QWORD *)(a1 + 32), sel_resetPolicy, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setPolicyResetTimer:", v7);

}

- (void)setPolicyResetTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSTimer)policyResetTimer
{
  return (NSTimer *)objc_getProperty(self, a2, 48, 1);
}

- (ICCloudThrottlingPolicy)initWithThrottlingLevels:(id)a3 resetInterval:(double)a4
{
  id v6;
  ICCloudThrottlingPolicy *v7;
  ICCloudThrottlingPolicy *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  _QWORD block[4];
  ICCloudThrottlingPolicy *v16;
  objc_super v17;

  v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)ICCloudThrottlingPolicy;
  v7 = -[ICCloudThrottlingPolicy init](&v17, sel_init);
  v8 = v7;
  if (v7)
  {
    -[ICCloudThrottlingPolicy setThrottlingLevels:](v7, "setThrottlingLevels:", v6);
    -[ICCloudThrottlingPolicy setResetInterval:](v8, "setResetInterval:", a4);
    -[ICCloudThrottlingPolicy loadSavedPolicyState](v8, "loadSavedPolicyState");
    -[ICCloudThrottlingPolicy policyStartDate](v8, "policyStartDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "timeIntervalSinceNow");
    v11 = -v10;
    -[ICCloudThrottlingPolicy resetInterval](v8, "resetInterval");
    v13 = v12;

    if (v13 < v11)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __66__ICCloudThrottlingPolicy_initWithThrottlingLevels_resetInterval___block_invoke;
      block[3] = &unk_1E76C73F8;
      v16 = v8;
      dispatch_async(MEMORY[0x1E0C80D38], block);

    }
    -[ICCloudThrottlingPolicy startPolicyResetTimer](v8, "startPolicyResetTimer");
  }

  return v8;
}

- (double)resetInterval
{
  return self->_resetInterval;
}

- (NSDate)policyStartDate
{
  return (NSDate *)objc_getProperty(self, a2, 40, 1);
}

- (void)startPolicyResetTimer
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__ICCloudThrottlingPolicy_startPolicyResetTimer__block_invoke;
  block[3] = &unk_1E76C73F8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

- (void)setThrottlingLevels:(id)a3
{
  objc_storeStrong((id *)&self->_throttlingLevels, a3);
}

- (void)setResetInterval:(double)a3
{
  self->_resetInterval = a3;
}

- (void)loadSavedPolicyState
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  objc_msgSend(a1, "currentLevelIndex");
  objc_msgSend(a1, "throttlingLevels");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "count");
  objc_msgSend(a1, "currentLevel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_11();
  OUTLINED_FUNCTION_1_8(&dword_1BD918000, v4, v5, "Loaded saved throttling level (%d of %d): %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2_4();
}

- (void)setPolicyStartDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void)setCurrentLevelIndex:(unint64_t)a3
{
  self->_currentLevelIndex = a3;
}

- (void)setCurrentBatchCount:(unint64_t)a3
{
  self->_currentBatchCount = a3;
}

- (double)maximumBatchIntervalFactor
{
  void *v2;
  double v3;
  double v4;

  -[ICCloudThrottlingPolicy currentLevel](self, "currentLevel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "maximumBatchIntervalFactor");
  v4 = v3;

  return v4;
}

- (double)batchInterval
{
  void *v2;
  double v3;
  double v4;

  -[ICCloudThrottlingPolicy currentLevel](self, "currentLevel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "batchInterval");
  v4 = v3;

  return v4;
}

- (ICCloudThrottlingLevel)currentLevel
{
  unint64_t v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;

  v3 = -[ICCloudThrottlingPolicy currentLevelIndex](self, "currentLevelIndex");
  -[ICCloudThrottlingPolicy throttlingLevels](self, "throttlingLevels");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count") - 1;

  if (v3 >= v5)
    v3 = v5;
  -[ICCloudThrottlingPolicy throttlingLevels](self, "throttlingLevels");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (ICCloudThrottlingLevel *)v7;
}

- (NSArray)throttlingLevels
{
  return self->_throttlingLevels;
}

- (unint64_t)currentLevelIndex
{
  return self->_currentLevelIndex;
}

- (ICCloudThrottlingPolicy)init
{
  -[ICCloudThrottlingPolicy doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

uint64_t __66__ICCloudThrottlingPolicy_initWithThrottlingLevels_resetInterval___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "resetPolicy");
}

- (void)dealloc
{
  void *v3;
  objc_super v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t);
  void *v8;
  ICCloudThrottlingPolicy *v9;

  v5 = MEMORY[0x1E0C809B0];
  v6 = 3221225472;
  v7 = __34__ICCloudThrottlingPolicy_dealloc__block_invoke;
  v8 = &unk_1E76C73F8;
  v9 = self;
  performBlockOnMainThreadAndWait();
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)ICCloudThrottlingPolicy;
  -[ICCloudThrottlingPolicy dealloc](&v4, sel_dealloc);
}

uint64_t __34__ICCloudThrottlingPolicy_dealloc__block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "policyResetTimer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidate");

  return objc_msgSend(*(id *)(a1 + 32), "setPolicyResetTimer:", 0);
}

- (void)incrementBatchCount
{
  int v6;
  int v7;
  void *v8;
  int v9;
  void *v10;
  _DWORD v11[2];
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  int v15;
  __int16 v16;
  int v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = objc_msgSend(a1, "currentBatchCount");
  v7 = objc_msgSend(a1, "currentLevelIndex") + 1;
  objc_msgSend(a1, "throttlingLevels");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");
  objc_msgSend(a1, "currentLevel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = 67110146;
  v11[1] = v6;
  v12 = 2112;
  v13 = a2;
  v14 = 1024;
  v15 = v7;
  v16 = 1024;
  v17 = v9;
  v18 = 2112;
  v19 = v10;
  _os_log_debug_impl(&dword_1BD918000, a3, OS_LOG_TYPE_DEBUG, "Processing cloud batch (%d of %@) in throttling level (%d of %d): %@", (uint8_t *)v11, 0x28u);

}

uint64_t __46__ICCloudThrottlingPolicy_incrementBatchCount__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "savePolicyState");
}

- (void)changeLevelIfNecessary
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  objc_msgSend(a1, "currentLevelIndex");
  objc_msgSend(a1, "throttlingLevels");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "count");
  objc_msgSend(a1, "currentLevel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_11();
  OUTLINED_FUNCTION_1_8(&dword_1BD918000, v4, v5, "Switching to cloud throttling level (%d of %d): %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2_4();
}

- (void)resetPolicy
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "currentLevel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_debug_impl(&dword_1BD918000, a2, OS_LOG_TYPE_DEBUG, "Resetting cloud throttling policy to the first level: %@", (uint8_t *)&v4, 0xCu);

}

uint64_t __38__ICCloudThrottlingPolicy_resetPolicy__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "savePolicyState");
}

+ (void)resetSavedPolicyState
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0D64188], "sharedAppGroupDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObjectForKey:", CFSTR("ThrottlingPolicyCurrentBatchCount"));

  objc_msgSend(MEMORY[0x1E0D64188], "sharedAppGroupDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObjectForKey:", CFSTR("ThrottlingPolicyCurrentLevelIndex"));

  objc_msgSend(MEMORY[0x1E0D64188], "sharedAppGroupDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObjectForKey:", CFSTR("ThrottlingPolicyStartTime"));

}

- (void)savePolicyState
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0D64188], "sharedAppGroupDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ICCloudThrottlingPolicy currentBatchCount](self, "currentBatchCount"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("ThrottlingPolicyCurrentBatchCount"));

  objc_msgSend(MEMORY[0x1E0D64188], "sharedAppGroupDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ICCloudThrottlingPolicy currentLevelIndex](self, "currentLevelIndex"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v6, CFSTR("ThrottlingPolicyCurrentLevelIndex"));

  objc_msgSend(MEMORY[0x1E0D64188], "sharedAppGroupDefaults");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[ICCloudThrottlingPolicy policyStartDate](self, "policyStartDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeIntervalSinceReferenceDate");
  objc_msgSend(v8, "setDouble:forKey:", CFSTR("ThrottlingPolicyStartTime"));

}

- (unint64_t)currentBatchCount
{
  return self->_currentBatchCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_policyResetTimer, 0);
  objc_storeStrong((id *)&self->_policyStartDate, 0);
  objc_storeStrong((id *)&self->_throttlingLevels, 0);
}

@end
