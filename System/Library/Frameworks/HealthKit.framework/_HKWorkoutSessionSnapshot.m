@implementation _HKWorkoutSessionSnapshot

- (id)_initWithSessionState:(int64_t)a3 startDate:(id)a4 endDate:(id)a5 currentActivity:(id)a6
{
  id v10;
  id v11;
  id v12;
  _HKWorkoutSessionSnapshot *v13;
  _HKWorkoutSessionSnapshot *v14;
  uint64_t v15;
  NSDate *startDate;
  uint64_t v17;
  NSDate *endDate;
  uint64_t v19;
  HKWorkoutActivity *currentActivity;
  objc_super v22;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v22.receiver = self;
  v22.super_class = (Class)_HKWorkoutSessionSnapshot;
  v13 = -[_HKWorkoutSessionSnapshot init](&v22, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_sessionState = a3;
    v15 = objc_msgSend(v10, "copy");
    startDate = v14->_startDate;
    v14->_startDate = (NSDate *)v15;

    v17 = objc_msgSend(v11, "copy");
    endDate = v14->_endDate;
    v14->_endDate = (NSDate *)v17;

    v19 = objc_msgSend(v12, "copy");
    currentActivity = v14->_currentActivity;
    v14->_currentActivity = (HKWorkoutActivity *)v19;

  }
  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_HKWorkoutSessionSnapshot)initWithCoder:(id)a3
{
  id v4;
  _HKWorkoutSessionSnapshot *v5;
  uint64_t v6;
  NSDate *startDate;
  uint64_t v8;
  NSDate *endDate;
  uint64_t v10;
  HKWorkoutActivity *currentActivity;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_HKWorkoutSessionSnapshot;
  v5 = -[_HKWorkoutSessionSnapshot init](&v13, sel_init);
  if (v5)
  {
    v5->_sessionState = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("sessionState"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("startDate"));
    v6 = objc_claimAutoreleasedReturnValue();
    startDate = v5->_startDate;
    v5->_startDate = (NSDate *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("endDate"));
    v8 = objc_claimAutoreleasedReturnValue();
    endDate = v5->_endDate;
    v5->_endDate = (NSDate *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("currentActivity"));
    v10 = objc_claimAutoreleasedReturnValue();
    currentActivity = v5->_currentActivity;
    v5->_currentActivity = (HKWorkoutActivity *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t sessionState;
  id v5;

  sessionState = self->_sessionState;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", sessionState, CFSTR("sessionState"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_startDate, CFSTR("startDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_endDate, CFSTR("endDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_currentActivity, CFSTR("currentActivity"));

}

- (int64_t)sessionState
{
  return self->_sessionState;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (HKWorkoutActivity)currentActivity
{
  return self->_currentActivity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentActivity, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end
