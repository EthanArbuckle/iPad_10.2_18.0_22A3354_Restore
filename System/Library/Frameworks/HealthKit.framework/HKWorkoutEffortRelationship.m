@implementation HKWorkoutEffortRelationship

- (HKWorkoutEffortRelationship)initWithWorkout:(id)a3 activity:(id)a4 samples:(id)a5
{
  id v8;
  id v9;
  id v10;
  HKWorkoutEffortRelationship *v11;
  uint64_t v12;
  HKWorkout *workout;
  uint64_t v14;
  NSArray *samples;
  uint64_t v16;
  HKWorkoutActivity *activity;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HKWorkoutEffortRelationship;
  v11 = -[HKWorkoutEffortRelationship init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    workout = v11->_workout;
    v11->_workout = (HKWorkout *)v12;

    v14 = objc_msgSend(v10, "copy");
    samples = v11->_samples;
    v11->_samples = (NSArray *)v14;

    v16 = objc_msgSend(v9, "copy");
    activity = v11->_activity;
    v11->_activity = (HKWorkoutActivity *)v16;

  }
  return v11;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  NSArray *samples;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  samples = self->_samples;
  -[HKWorkoutActivity UUID](self->_activity, "UUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKObject UUID](self->_workout, "UUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p samples=%@, activity=%@, workout=%@>"), v5, self, samples, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  HKWorkout *workout;
  id v5;

  workout = self->_workout;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", workout, CFSTR("Workout"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_samples, CFSTR("Samples"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_activity, CFSTR("Activity"));

}

- (HKWorkoutEffortRelationship)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  HKWorkoutEffortRelationship *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Workout"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Activity"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("Samples"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[HKWorkoutEffortRelationship initWithWorkout:activity:samples:](self, "initWithWorkout:activity:samples:", v5, v6, v7);
  return v8;
}

- (HKWorkout)workout
{
  return self->_workout;
}

- (HKWorkoutActivity)activity
{
  return self->_activity;
}

- (NSArray)samples
{
  return self->_samples;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_samples, 0);
  objc_storeStrong((id *)&self->_activity, 0);
  objc_storeStrong((id *)&self->_workout, 0);
}

@end
