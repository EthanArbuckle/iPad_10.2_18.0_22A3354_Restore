@implementation AFSiriWorkoutReminder

- (AFSiriWorkoutReminder)initWithPredictionIdentifier:(id)a3 predictionType:(int64_t)a4 workoutType:(int64_t)a5
{
  id v9;
  AFSiriWorkoutReminder *v10;
  AFSiriWorkoutReminder *v11;
  objc_super v13;

  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)AFSiriWorkoutReminder;
  v10 = -[AFSiriWorkoutReminder init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_predictionIdentifier, a3);
    v11->_workoutSwimmingLocationType = 0;
    v11->_predictionType = a4;
    v11->_workoutType = a5;
    v11->_workoutActivityType = 0;
    v11->_workoutLocationType = 0;
  }

  return v11;
}

- (AFSiriWorkoutReminder)initWithPredictionIdentifier:(id)a3 predictionType:(int64_t)a4 workoutActivityType:(unint64_t)a5 locationType:(int64_t)a6 swimmingLocationType:(int64_t)a7
{
  id v13;
  AFSiriWorkoutReminder *v14;
  AFSiriWorkoutReminder *v15;
  objc_super v17;

  v13 = a3;
  v17.receiver = self;
  v17.super_class = (Class)AFSiriWorkoutReminder;
  v14 = -[AFSiriWorkoutReminder init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_predictionIdentifier, a3);
    v15->_workoutSwimmingLocationType = a7;
    v15->_predictionType = a4;
    v15->_workoutType = 0;
    v15->_workoutActivityType = a5;
    v15->_workoutLocationType = a6;
  }

  return v15;
}

- (AFSiriWorkoutReminder)initWithPredictionIdentifier:(id)a3 predictionType:(int64_t)a4 workoutType:(int64_t)a5 workoutActivityType:(unint64_t)a6 locationType:(int64_t)a7 swimmingLocationType:(int64_t)a8
{
  id v15;
  AFSiriWorkoutReminder *v16;
  AFSiriWorkoutReminder *v17;
  objc_super v19;

  v15 = a3;
  v19.receiver = self;
  v19.super_class = (Class)AFSiriWorkoutReminder;
  v16 = -[AFSiriWorkoutReminder init](&v19, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_predictionIdentifier, a3);
    v17->_workoutSwimmingLocationType = a8;
    v17->_predictionType = a4;
    v17->_workoutType = a5;
    v17->_workoutActivityType = a6;
    v17->_workoutLocationType = a7;
  }

  return v17;
}

- (id)description
{
  void *v3;
  unint64_t workoutType;
  __CFString *v5;
  __CFString *v6;
  unint64_t workoutActivityType;
  int64_t workoutLocationType;
  unint64_t predictionType;
  int64_t workoutSwimmingLocationType;
  __CFString *v11;
  __CFString *v12;
  void *v13;

  v3 = (void *)MEMORY[0x1E0CB3940];
  workoutType = self->_workoutType;
  if (workoutType > 0xA)
    v5 = CFSTR("(unknown)");
  else
    v5 = off_1E3A33FD8[workoutType];
  v6 = v5;
  workoutActivityType = self->_workoutActivityType;
  workoutLocationType = self->_workoutLocationType;
  workoutSwimmingLocationType = self->_workoutSwimmingLocationType;
  predictionType = self->_predictionType;
  if (predictionType > 3)
    v11 = CFSTR("(unknown)");
  else
    v11 = off_1E3A34678[predictionType];
  v12 = v11;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("AFSiriWorkoutReminder<workoutType: %@ workoutActivityType: %lu workoutLocationType: %lu workoutSwimmingLocationType: %lu predictionType: %@>"), v6, workoutActivityType, workoutLocationType, workoutSwimmingLocationType, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[AFSiriWorkoutReminder predictionIdentifier](self, "predictionIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("predictionIdentifier"));

  objc_msgSend(v5, "encodeInteger:forKey:", -[AFSiriWorkoutReminder predictionType](self, "predictionType"), CFSTR("predictionType"));
  objc_msgSend(v5, "encodeInteger:forKey:", -[AFSiriWorkoutReminder workoutType](self, "workoutType"), CFSTR("workoutType"));
  objc_msgSend(v5, "encodeInteger:forKey:", -[AFSiriWorkoutReminder workoutActivityType](self, "workoutActivityType"), CFSTR("workoutActivityType"));
  objc_msgSend(v5, "encodeInteger:forKey:", -[AFSiriWorkoutReminder workoutLocationType](self, "workoutLocationType"), CFSTR("workoutLocationType"));
  objc_msgSend(v5, "encodeInteger:forKey:", -[AFSiriWorkoutReminder workoutSwimmingLocationType](self, "workoutSwimmingLocationType"), CFSTR("workoutSwimmingLocationType"));

}

- (AFSiriWorkoutReminder)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  AFSiriWorkoutReminder *v11;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("predictionIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("predictionType"));
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("workoutType")))
    v7 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("workoutType"));
  else
    v7 = 0;
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("workoutActivityType")))
    v8 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("workoutActivityType"));
  else
    v8 = 0;
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("workoutLocationType")))
    v9 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("workoutLocationType"));
  else
    v9 = 0;
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("workoutSwimmingLocationType")))
    v10 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("workoutSwimmingLocationType"));
  else
    v10 = 0;
  v11 = -[AFSiriWorkoutReminder initWithPredictionIdentifier:predictionType:workoutType:workoutActivityType:locationType:swimmingLocationType:](self, "initWithPredictionIdentifier:predictionType:workoutType:workoutActivityType:locationType:swimmingLocationType:", v5, v6, v7, v8, v9, v10);

  return v11;
}

- (NSString)predictionIdentifier
{
  return self->_predictionIdentifier;
}

- (int64_t)workoutType
{
  return self->_workoutType;
}

- (unint64_t)workoutActivityType
{
  return self->_workoutActivityType;
}

- (int64_t)workoutLocationType
{
  return self->_workoutLocationType;
}

- (int64_t)workoutSwimmingLocationType
{
  return self->_workoutSwimmingLocationType;
}

- (int64_t)predictionType
{
  return self->_predictionType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predictionIdentifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
