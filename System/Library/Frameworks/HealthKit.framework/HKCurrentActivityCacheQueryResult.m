@implementation HKCurrentActivityCacheQueryResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  HKActivityCache *currentActivityCache;
  id v5;
  void *v6;
  NSArray *activeEnergyResults;
  void *v8;
  NSArray *appleMoveTimeResults;
  void *v10;
  NSArray *appleExerciseTimeResults;
  void *v12;
  NSArray *appleStandHourResults;
  id v14;

  currentActivityCache = self->_currentActivityCache;
  v5 = a3;
  NSStringFromSelector(sel_currentActivityCache);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", currentActivityCache, v6);

  activeEnergyResults = self->_activeEnergyResults;
  NSStringFromSelector(sel_activeEnergyResults);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", activeEnergyResults, v8);

  appleMoveTimeResults = self->_appleMoveTimeResults;
  NSStringFromSelector(sel_appleMoveTimeResults);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", appleMoveTimeResults, v10);

  appleExerciseTimeResults = self->_appleExerciseTimeResults;
  NSStringFromSelector(sel_appleExerciseTimeResults);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", appleExerciseTimeResults, v12);

  appleStandHourResults = self->_appleStandHourResults;
  NSStringFromSelector(sel_appleStandHourResults);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", appleStandHourResults, v14);

}

- (HKCurrentActivityCacheQueryResult)initWithCoder:(id)a3
{
  id v4;
  HKCurrentActivityCacheQueryResult *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  HKActivityCache *currentActivityCache;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSArray *activeEnergyResults;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSArray *appleMoveTimeResults;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  NSArray *appleExerciseTimeResults;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  NSArray *appleStandHourResults;
  objc_super v35;
  _QWORD v36[2];
  _QWORD v37[2];
  _QWORD v38[2];
  _QWORD v39[3];

  v39[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)HKCurrentActivityCacheQueryResult;
  v5 = -[HKCurrentActivityCacheQueryResult init](&v35, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    NSStringFromSelector(sel_currentActivityCache);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    currentActivityCache = v5->_currentActivityCache;
    v5->_currentActivityCache = (HKActivityCache *)v8;

    v10 = (void *)MEMORY[0x1E0C99E60];
    v39[0] = objc_opt_class();
    v39[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setWithArray:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_activeEnergyResults);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, v13);
    v14 = objc_claimAutoreleasedReturnValue();
    activeEnergyResults = v5->_activeEnergyResults;
    v5->_activeEnergyResults = (NSArray *)v14;

    v16 = (void *)MEMORY[0x1E0C99E60];
    v38[0] = objc_opt_class();
    v38[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setWithArray:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_appleMoveTimeResults);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, v19);
    v20 = objc_claimAutoreleasedReturnValue();
    appleMoveTimeResults = v5->_appleMoveTimeResults;
    v5->_appleMoveTimeResults = (NSArray *)v20;

    v22 = (void *)MEMORY[0x1E0C99E60];
    v37[0] = objc_opt_class();
    v37[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setWithArray:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_appleExerciseTimeResults);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v24, v25);
    v26 = objc_claimAutoreleasedReturnValue();
    appleExerciseTimeResults = v5->_appleExerciseTimeResults;
    v5->_appleExerciseTimeResults = (NSArray *)v26;

    v28 = (void *)MEMORY[0x1E0C99E60];
    v36[0] = objc_opt_class();
    v36[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 2);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setWithArray:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_appleStandHourResults);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v30, v31);
    v32 = objc_claimAutoreleasedReturnValue();
    appleStandHourResults = v5->_appleStandHourResults;
    v5->_appleStandHourResults = (NSArray *)v32;

  }
  return v5;
}

- (HKActivityCache)currentActivityCache
{
  return self->_currentActivityCache;
}

- (void)setCurrentActivityCache:(id)a3
{
  objc_storeStrong((id *)&self->_currentActivityCache, a3);
}

- (NSArray)activeEnergyResults
{
  return self->_activeEnergyResults;
}

- (void)setActiveEnergyResults:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)appleMoveTimeResults
{
  return self->_appleMoveTimeResults;
}

- (void)setAppleMoveTimeResults:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSArray)appleExerciseTimeResults
{
  return self->_appleExerciseTimeResults;
}

- (void)setAppleExerciseTimeResults:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSArray)appleStandHourResults
{
  return self->_appleStandHourResults;
}

- (void)setAppleStandHourResults:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appleStandHourResults, 0);
  objc_storeStrong((id *)&self->_appleExerciseTimeResults, 0);
  objc_storeStrong((id *)&self->_appleMoveTimeResults, 0);
  objc_storeStrong((id *)&self->_activeEnergyResults, 0);
  objc_storeStrong((id *)&self->_currentActivityCache, 0);
}

@end
