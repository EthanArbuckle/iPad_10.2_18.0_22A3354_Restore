@implementation _HKActivityStatisticsQueryResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *activeEnergyResults;
  id v5;
  void *v6;
  NSArray *appleMoveTimeResults;
  void *v8;
  NSArray *appleExerciseTimeResults;
  void *v10;
  NSArray *appleStandHourResults;
  void *v12;
  NSArray *workoutResults;
  id v14;

  activeEnergyResults = self->_activeEnergyResults;
  v5 = a3;
  NSStringFromSelector(sel_activeEnergyResults);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", activeEnergyResults, v6);

  appleMoveTimeResults = self->_appleMoveTimeResults;
  NSStringFromSelector(sel_appleMoveTimeResults);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", appleMoveTimeResults, v8);

  appleExerciseTimeResults = self->_appleExerciseTimeResults;
  NSStringFromSelector(sel_appleExerciseTimeResults);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", appleExerciseTimeResults, v10);

  appleStandHourResults = self->_appleStandHourResults;
  NSStringFromSelector(sel_appleStandHourResults);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", appleStandHourResults, v12);

  workoutResults = self->_workoutResults;
  NSStringFromSelector(sel_workoutResults);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", workoutResults, v14);

}

- (_HKActivityStatisticsQueryResult)initWithCoder:(id)a3
{
  id v4;
  _HKActivityStatisticsQueryResult *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSArray *activeEnergyResults;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSArray *appleMoveTimeResults;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSArray *appleExerciseTimeResults;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  NSArray *appleStandHourResults;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  NSArray *workoutResults;
  objc_super v37;
  _QWORD v38[2];
  _QWORD v39[2];
  _QWORD v40[2];
  _QWORD v41[2];
  _QWORD v42[3];

  v42[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)_HKActivityStatisticsQueryResult;
  v5 = -[_HKActivityStatisticsQueryResult init](&v37, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v42[0] = objc_opt_class();
    v42[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_activeEnergyResults);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, v9);
    v10 = objc_claimAutoreleasedReturnValue();
    activeEnergyResults = v5->_activeEnergyResults;
    v5->_activeEnergyResults = (NSArray *)v10;

    v12 = (void *)MEMORY[0x1E0C99E60];
    v41[0] = objc_opt_class();
    v41[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setWithArray:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_appleMoveTimeResults);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, v15);
    v16 = objc_claimAutoreleasedReturnValue();
    appleMoveTimeResults = v5->_appleMoveTimeResults;
    v5->_appleMoveTimeResults = (NSArray *)v16;

    v18 = (void *)MEMORY[0x1E0C99E60];
    v40[0] = objc_opt_class();
    v40[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setWithArray:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_appleExerciseTimeResults);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v20, v21);
    v22 = objc_claimAutoreleasedReturnValue();
    appleExerciseTimeResults = v5->_appleExerciseTimeResults;
    v5->_appleExerciseTimeResults = (NSArray *)v22;

    v24 = (void *)MEMORY[0x1E0C99E60];
    v39[0] = objc_opt_class();
    v39[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 2);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setWithArray:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_appleStandHourResults);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v26, v27);
    v28 = objc_claimAutoreleasedReturnValue();
    appleStandHourResults = v5->_appleStandHourResults;
    v5->_appleStandHourResults = (NSArray *)v28;

    v30 = (void *)MEMORY[0x1E0C99E60];
    v38[0] = objc_opt_class();
    v38[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 2);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setWithArray:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_workoutResults);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v32, v33);
    v34 = objc_claimAutoreleasedReturnValue();
    workoutResults = v5->_workoutResults;
    v5->_workoutResults = (NSArray *)v34;

  }
  return v5;
}

- (NSArray)activeEnergyResults
{
  return self->_activeEnergyResults;
}

- (void)setActiveEnergyResults:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSArray)appleMoveTimeResults
{
  return self->_appleMoveTimeResults;
}

- (void)setAppleMoveTimeResults:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)appleExerciseTimeResults
{
  return self->_appleExerciseTimeResults;
}

- (void)setAppleExerciseTimeResults:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSArray)appleStandHourResults
{
  return self->_appleStandHourResults;
}

- (void)setAppleStandHourResults:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSArray)workoutResults
{
  return self->_workoutResults;
}

- (void)setWorkoutResults:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workoutResults, 0);
  objc_storeStrong((id *)&self->_appleStandHourResults, 0);
  objc_storeStrong((id *)&self->_appleExerciseTimeResults, 0);
  objc_storeStrong((id *)&self->_appleMoveTimeResults, 0);
  objc_storeStrong((id *)&self->_activeEnergyResults, 0);
}

@end
