@implementation _HKCurrentWorkoutSnapshot

- (id)_initWithSessionIdentifier:(id)a3 workoutConfiguration:(id)a4 sessionServerState:(int64_t)a5 isBuilderPaused:(BOOL)a6 applicationIdentifier:(id)a7 elapsedTime:(double)a8 snapshotDate:(id)a9 builderStartDate:(id)a10
{
  id v18;
  id v19;
  id v20;
  id v21;
  _HKCurrentWorkoutSnapshot *v22;
  _HKCurrentWorkoutSnapshot *v23;
  uint64_t v24;
  NSString *applicationIdentifier;
  uint64_t v26;
  NSDate *builderStartDate;
  id v29;
  objc_super v30;

  v29 = a3;
  v18 = a4;
  v19 = a7;
  v20 = a9;
  v21 = a10;
  v30.receiver = self;
  v30.super_class = (Class)_HKCurrentWorkoutSnapshot;
  v22 = -[_HKCurrentWorkoutSnapshot init](&v30, sel_init);
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_sessionIdentifier, a3);
    objc_storeStrong((id *)&v23->_configuration, a4);
    v23->_internalState = a5;
    v23->_sessionState = HKWorkoutSessionStateFromServerState(a5);
    v23->_isBuilderPaused = a6;
    v24 = objc_msgSend(v19, "copy");
    applicationIdentifier = v23->_applicationIdentifier;
    v23->_applicationIdentifier = (NSString *)v24;

    v23->_elapsedTime = a8;
    objc_storeStrong((id *)&v23->_snapshotDate, a9);
    v26 = objc_msgSend(v21, "copy");
    builderStartDate = v23->_builderStartDate;
    v23->_builderStartDate = (NSDate *)v26;

  }
  return v23;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  HKWorkoutConfiguration *configuration;
  void *v6;
  void *v7;
  NSString *applicationIdentifier;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  configuration = self->_configuration;
  HKWorkoutSessionStateToString(self->_sessionState);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _HKWorkoutSessionServerStateToString(self->_internalState);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  applicationIdentifier = self->_applicationIdentifier;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_elapsedTime);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p, configuration:%@, state:%@, internalState:%@, applicationIdentifier:%@, elapsedTime:%@, snapshotDate:%@>"), v4, self, configuration, v6, v7, applicationIdentifier, v9, self->_snapshotDate);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)isFirstPartyWorkout
{
  return -[NSString isEqualToString:](self->_applicationIdentifier, "isEqualToString:", CFSTR("com.apple.SessionTrackerApp"));
}

- (double)elapsedTimeAtDate:(id)a3
{
  id v4;
  void *v5;
  double elapsedTime;
  double v7;

  v4 = a3;
  v5 = v4;
  elapsedTime = 0.0;
  if (self->_elapsedTime != 0.0 && (objc_msgSend(v4, "hk_isBeforeDate:", self->_snapshotDate) & 1) == 0)
  {
    elapsedTime = self->_elapsedTime;
    if (!self->_isBuilderPaused)
    {
      objc_msgSend(v5, "timeIntervalSinceDate:", self->_snapshotDate);
      elapsedTime = elapsedTime + v7;
    }
  }

  return elapsedTime;
}

- (int64_t)state
{
  unint64_t v2;

  v2 = self->_sessionState - 2;
  if (v2 > 4)
    return 1;
  else
    return qword_19A44C6A0[v2];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_HKCurrentWorkoutSnapshot)initWithCoder:(id)a3
{
  id v4;
  _HKCurrentWorkoutSnapshot *v5;
  uint64_t v6;
  NSUUID *sessionIdentifier;
  uint64_t v8;
  HKWorkoutConfiguration *configuration;
  uint64_t v10;
  NSString *applicationIdentifier;
  double v12;
  uint64_t v13;
  NSDate *snapshotDate;
  uint64_t v15;
  NSDate *builderStartDate;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)_HKCurrentWorkoutSnapshot;
  v5 = -[_HKCurrentWorkoutSnapshot init](&v18, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sessionIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    sessionIdentifier = v5->_sessionIdentifier;
    v5->_sessionIdentifier = (NSUUID *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("configuration"));
    v8 = objc_claimAutoreleasedReturnValue();
    configuration = v5->_configuration;
    v5->_configuration = (HKWorkoutConfiguration *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("applicationIdentifier"));
    v10 = objc_claimAutoreleasedReturnValue();
    applicationIdentifier = v5->_applicationIdentifier;
    v5->_applicationIdentifier = (NSString *)v10;

    v5->_sessionState = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("state"));
    v5->_internalState = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("internalState"));
    v5->_isBuilderPaused = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isBuilderPaused"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("elapsedTime"));
    v5->_elapsedTime = v12;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("snapshotDate"));
    v13 = objc_claimAutoreleasedReturnValue();
    snapshotDate = v5->_snapshotDate;
    v5->_snapshotDate = (NSDate *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("startDate"));
    v15 = objc_claimAutoreleasedReturnValue();
    builderStartDate = v5->_builderStartDate;
    v5->_builderStartDate = (NSDate *)v15;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *sessionIdentifier;
  id v5;

  sessionIdentifier = self->_sessionIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", sessionIdentifier, CFSTR("sessionIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_configuration, CFSTR("configuration"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_applicationIdentifier, CFSTR("applicationIdentifier"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_sessionState, CFSTR("state"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_internalState, CFSTR("internalState"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isBuilderPaused, CFSTR("isBuilderPaused"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("elapsedTime"), self->_elapsedTime);
  objc_msgSend(v5, "encodeObject:forKey:", self->_snapshotDate, CFSTR("snapshotDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_builderStartDate, CFSTR("startDate"));

}

- (NSUUID)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (HKWorkoutConfiguration)configuration
{
  return self->_configuration;
}

- (NSString)applicationIdentifier
{
  return self->_applicationIdentifier;
}

- (int64_t)sessionState
{
  return self->_sessionState;
}

- (int64_t)internalState
{
  return self->_internalState;
}

- (BOOL)isBuilderPaused
{
  return self->_isBuilderPaused;
}

- (NSDate)snapshotDate
{
  return self->_snapshotDate;
}

- (double)elapsedTime
{
  return self->_elapsedTime;
}

- (NSDate)builderStartDate
{
  return self->_builderStartDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_builderStartDate, 0);
  objc_storeStrong((id *)&self->_snapshotDate, 0);
  objc_storeStrong((id *)&self->_applicationIdentifier, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
}

@end
