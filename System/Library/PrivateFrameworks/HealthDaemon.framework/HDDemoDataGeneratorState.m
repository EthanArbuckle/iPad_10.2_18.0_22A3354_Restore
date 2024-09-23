@implementation HDDemoDataGeneratorState

- (HDDemoDataGeneratorState)init
{
  HDDemoDataGeneratorState *v2;
  HDDemoDataGeneratorState *v3;
  NSDate *firstSampleDate;
  NSDate *lastSampleDate;
  NSDate *lastRunDate;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HDDemoDataGeneratorState;
  v2 = -[HDDemoDataGeneratorState init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    *(_WORD *)&v2->_createdFromNSKeyedUnarchiver = 0;
    firstSampleDate = v2->_firstSampleDate;
    v2->_firstSampleDate = 0;

    lastSampleDate = v3->_lastSampleDate;
    v3->_lastSampleDate = 0;

    lastRunDate = v3->_lastRunDate;
    v3->_lastRunDate = 0;

    v3->_endTime = 0.0;
    v3->_firstRun = 0;
    v3->_currentDay = 0;
    v3->_startTime = 0.0;
  }
  return v3;
}

- (BOOL)createdFromNSKeyedUnarchiver
{
  return self->_createdFromNSKeyedUnarchiver;
}

- (BOOL)isExercising
{
  void *v2;
  BOOL v3;

  -[HDDemoDataGeneratorState workoutConfiguration](self, "workoutConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)isRunning
{
  void *v3;
  BOOL v4;

  if (!-[HDDemoDataGeneratorState isExercising](self, "isExercising"))
    return 0;
  -[HDDemoDataGeneratorState workoutConfiguration](self, "workoutConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "activityType") == 37;

  return v4;
}

- (BOOL)isCycling
{
  void *v3;
  BOOL v4;

  if (!-[HDDemoDataGeneratorState isExercising](self, "isExercising"))
    return 0;
  -[HDDemoDataGeneratorState workoutConfiguration](self, "workoutConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "activityType") == 13;

  return v4;
}

- (BOOL)isSwimming
{
  void *v3;
  BOOL v4;

  if (!-[HDDemoDataGeneratorState isExercising](self, "isExercising"))
    return 0;
  -[HDDemoDataGeneratorState workoutConfiguration](self, "workoutConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "activityType") == 46;

  return v4;
}

- (BOOL)isDoingHIIT
{
  void *v3;
  BOOL v4;

  if (!-[HDDemoDataGeneratorState isExercising](self, "isExercising"))
    return 0;
  -[HDDemoDataGeneratorState workoutConfiguration](self, "workoutConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "activityType") == 63;

  return v4;
}

- (BOOL)isDoingElliptical
{
  void *v3;
  BOOL v4;

  if (!-[HDDemoDataGeneratorState isExercising](self, "isExercising"))
    return 0;
  -[HDDemoDataGeneratorState workoutConfiguration](self, "workoutConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "activityType") == 16;

  return v4;
}

- (BOOL)isWalking
{
  void *v3;
  BOOL v4;

  if (!-[HDDemoDataGeneratorState isExercising](self, "isExercising"))
    return 0;
  -[HDDemoDataGeneratorState workoutConfiguration](self, "workoutConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "activityType") == 52;

  return v4;
}

- (BOOL)isDoingYoga
{
  void *v3;
  BOOL v4;

  if (!-[HDDemoDataGeneratorState isExercising](self, "isExercising"))
    return 0;
  -[HDDemoDataGeneratorState workoutConfiguration](self, "workoutConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "activityType") == 57;

  return v4;
}

- (BOOL)isHiking
{
  void *v3;
  BOOL v4;

  if (!-[HDDemoDataGeneratorState isExercising](self, "isExercising"))
    return 0;
  -[HDDemoDataGeneratorState workoutConfiguration](self, "workoutConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "activityType") == 24;

  return v4;
}

- (BOOL)isCoolingDown
{
  void *v3;
  BOOL v4;

  if (!-[HDDemoDataGeneratorState isExercising](self, "isExercising"))
    return 0;
  -[HDDemoDataGeneratorState workoutConfiguration](self, "workoutConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "activityType") == 80;

  return v4;
}

- (BOOL)isUnderwaterDiving
{
  void *v3;
  BOOL v4;

  if (!-[HDDemoDataGeneratorState isExercising](self, "isExercising"))
    return 0;
  -[HDDemoDataGeneratorState workoutConfiguration](self, "workoutConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "activityType") == 84;

  return v4;
}

- (BOOL)isCrossCountrySkiing
{
  void *v3;
  BOOL v4;

  if (!-[HDDemoDataGeneratorState isExercising](self, "isExercising"))
    return 0;
  -[HDDemoDataGeneratorState workoutConfiguration](self, "workoutConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "activityType") == 60;

  return v4;
}

- (BOOL)isRowing
{
  void *v3;
  BOOL v4;

  if (!-[HDDemoDataGeneratorState isExercising](self, "isExercising"))
    return 0;
  -[HDDemoDataGeneratorState workoutConfiguration](self, "workoutConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "activityType") == 35;

  return v4;
}

- (BOOL)isSkatingSports
{
  void *v3;
  BOOL v4;

  if (!-[HDDemoDataGeneratorState isExercising](self, "isExercising"))
    return 0;
  -[HDDemoDataGeneratorState workoutConfiguration](self, "workoutConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "activityType") == 39;

  return v4;
}

- (BOOL)isPaddleSports
{
  void *v3;
  BOOL v4;

  if (!-[HDDemoDataGeneratorState isExercising](self, "isExercising"))
    return 0;
  -[HDDemoDataGeneratorState workoutConfiguration](self, "workoutConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "activityType") == 31;

  return v4;
}

- (BOOL)isGolf
{
  void *v3;
  BOOL v4;

  if (!-[HDDemoDataGeneratorState isExercising](self, "isExercising"))
    return 0;
  -[HDDemoDataGeneratorState workoutConfiguration](self, "workoutConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "activityType") == 21;

  return v4;
}

- (BOOL)isDownhillSnowSports
{
  void *v3;
  BOOL v4;
  void *v5;

  if (!-[HDDemoDataGeneratorState isExercising](self, "isExercising"))
    return 0;
  -[HDDemoDataGeneratorState workoutConfiguration](self, "workoutConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "activityType") == 61)
  {
    v4 = 1;
  }
  else
  {
    -[HDDemoDataGeneratorState workoutConfiguration](self, "workoutConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "activityType") == 67;

  }
  return v4;
}

- (BOOL)isSoccer
{
  void *v3;
  BOOL v4;

  if (!-[HDDemoDataGeneratorState isExercising](self, "isExercising"))
    return 0;
  -[HDDemoDataGeneratorState workoutConfiguration](self, "workoutConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "activityType") == 41;

  return v4;
}

- (NSDate)currentDate
{
  void *v3;
  double v4;
  void *v5;

  -[HDDemoDataGeneratorState firstSampleDate](self, "firstSampleDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDDemoDataGeneratorState currentTime](self, "currentTime");
  objc_msgSend(v3, "dateByAddingTimeInterval:", v4 * 86400.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v5;
}

- (void)setCurrentDay:(int64_t)a3
{
  self->_currentDay = a3;
}

- (int64_t)calendarDay
{
  void *v3;
  void *v4;
  int64_t v5;

  objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDDemoDataGeneratorState currentDate](self, "currentDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "component:fromDate:", 512, v4);

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HDDemoDataGeneratorState)initWithCoder:(id)a3
{
  id v4;
  HDDemoDataGeneratorState *v5;
  HDDemoDataGeneratorState *v6;
  uint64_t v7;
  NSDate *firstSampleDate;
  uint64_t v9;
  NSDate *lastSampleDate;
  uint64_t v11;
  NSDate *lastRunDate;
  double v13;
  double v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)HDDemoDataGeneratorState;
  v5 = -[HDDemoDataGeneratorState init](&v16, sel_init);
  v6 = v5;
  if (v5)
  {
    *(_WORD *)&v5->_createdFromNSKeyedUnarchiver = 1;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HDDemoDataGeneratorStateFirstSampleDateKey"));
    v7 = objc_claimAutoreleasedReturnValue();
    firstSampleDate = v6->_firstSampleDate;
    v6->_firstSampleDate = (NSDate *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HDDemoDataGeneratorStateLastSampleDateKey"));
    v9 = objc_claimAutoreleasedReturnValue();
    lastSampleDate = v6->_lastSampleDate;
    v6->_lastSampleDate = (NSDate *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HDDemoDataGeneratorStateLastRunDateKey"));
    v11 = objc_claimAutoreleasedReturnValue();
    lastRunDate = v6->_lastRunDate;
    v6->_lastRunDate = (NSDate *)v11;

    v6->_currentDay = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("HDDemoDataGeneratorStateCurrentDayKey"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("HDDemoDataGeneratorStateStartTimeKey"));
    v6->_startTime = v13;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("HDDemoDataGeneratorStateEndTimeKey"));
    v6->_endTime = v14;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  NSDate *firstSampleDate;
  id v5;

  firstSampleDate = self->_firstSampleDate;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", firstSampleDate, CFSTR("HDDemoDataGeneratorStateFirstSampleDateKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lastSampleDate, CFSTR("HDDemoDataGeneratorStateLastSampleDateKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lastRunDate, CFSTR("HDDemoDataGeneratorStateLastRunDateKey"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_currentDay, CFSTR("HDDemoDataGeneratorStateCurrentDayKey"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("HDDemoDataGeneratorStateStartTimeKey"), self->_startTime);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("HDDemoDataGeneratorStateEndTimeKey"), self->_endTime);

}

- (NSDate)firstSampleDate
{
  return self->_firstSampleDate;
}

- (void)setFirstSampleDate:(id)a3
{
  objc_storeStrong((id *)&self->_firstSampleDate, a3);
}

- (NSDate)lastSampleDate
{
  return self->_lastSampleDate;
}

- (void)setLastSampleDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastSampleDate, a3);
}

- (NSDate)lastRunDate
{
  return self->_lastRunDate;
}

- (void)setLastRunDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastRunDate, a3);
}

- (int64_t)currentDay
{
  return self->_currentDay;
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

- (double)currentTime
{
  return self->_currentTime;
}

- (void)setCurrentTime:(double)a3
{
  self->_currentTime = a3;
}

- (double)endTime
{
  return self->_endTime;
}

- (void)setEndTime:(double)a3
{
  self->_endTime = a3;
}

- (BOOL)isFinished
{
  return self->_finished;
}

- (void)setFinished:(BOOL)a3
{
  self->_finished = a3;
}

- (BOOL)isFirstRun
{
  return self->_firstRun;
}

- (void)setFirstRun:(BOOL)a3
{
  self->_firstRun = a3;
}

- (BOOL)isCoreTraining
{
  return self->_coreTraining;
}

- (BOOL)isDancing
{
  return self->_dancing;
}

- (BOOL)isFunctionalStrengthTraining
{
  return self->_functionalStrengthTraining;
}

- (HDDemoDataGeneratorWorkoutConfiguration)workoutConfiguration
{
  return self->_workoutConfiguration;
}

- (void)setWorkoutConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_workoutConfiguration, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workoutConfiguration, 0);
  objc_storeStrong((id *)&self->_lastRunDate, 0);
  objc_storeStrong((id *)&self->_lastSampleDate, 0);
  objc_storeStrong((id *)&self->_firstSampleDate, 0);
}

@end
