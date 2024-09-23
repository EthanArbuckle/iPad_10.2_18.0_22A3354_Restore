@implementation _HKFirstPartyWorkoutSnapshot

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshotDate, 0);
}

- (id)_initWithState:(int64_t)a3 activityType:(unint64_t)a4 elapsedTime:(double)a5 snapshotDate:(id)a6
{
  id v11;
  _HKFirstPartyWorkoutSnapshot *v12;
  _HKFirstPartyWorkoutSnapshot *v13;
  objc_super v15;

  v11 = a6;
  v15.receiver = self;
  v15.super_class = (Class)_HKFirstPartyWorkoutSnapshot;
  v12 = -[_HKFirstPartyWorkoutSnapshot init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_state = a3;
    v12->_activityType = a4;
    v12->_elapsedTime = a5;
    objc_storeStrong((id *)&v12->_snapshotDate, a6);
  }

  return v13;
}

+ (id)firstPartyWorkoutSnapshotWithCurrentWorkoutSnapshot:(id)a3
{
  id v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  double v10;
  double v11;
  void *v12;
  void *v13;

  v4 = a3;
  v5 = objc_msgSend(v4, "internalState") - 1;
  if (v5 > 0x10)
    v6 = 1;
  else
    v6 = qword_19A44CD58[v5];
  objc_msgSend(v4, "configuration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "activityType");

  v9 = objc_alloc((Class)a1);
  objc_msgSend(v4, "elapsedTime");
  v11 = v10;
  objc_msgSend(v4, "snapshotDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)objc_msgSend(v9, "_initWithState:activityType:elapsedTime:snapshotDate:", v6, v8, v12, v11);
  return v13;
}

- (double)durationForDate:(id)a3
{
  double elapsedTime;
  double v4;

  elapsedTime = self->_elapsedTime;
  if (self->_state == 1)
  {
    objc_msgSend(a3, "timeIntervalSinceDate:", self->_snapshotDate);
    return elapsedTime + v4;
  }
  return elapsedTime;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_state);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_activityType);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p, state:%@, activityType:%@>"), v4, self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (int64_t)state
{
  return self->_state;
}

- (unint64_t)activityType
{
  return self->_activityType;
}

@end
