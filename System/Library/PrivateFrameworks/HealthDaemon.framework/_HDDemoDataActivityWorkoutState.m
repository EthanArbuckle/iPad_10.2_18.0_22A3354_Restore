@implementation _HDDemoDataActivityWorkoutState

- (_HDDemoDataActivityWorkoutState)init
{
  _HDDemoDataActivityWorkoutState *v2;
  NSMutableData *v3;
  NSMutableData *associatedObjectUUIDs;
  NSMutableData *v5;
  NSMutableData *looseAssociatedObjectUUIDs;
  NSMutableArray *v7;
  NSMutableArray *workoutEvents;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_HDDemoDataActivityWorkoutState;
  v2 = -[_HDDemoDataActivityWorkoutState init](&v10, sel_init);
  if (v2)
  {
    v3 = (NSMutableData *)objc_alloc_init(MEMORY[0x1E0C99DF0]);
    associatedObjectUUIDs = v2->_associatedObjectUUIDs;
    v2->_associatedObjectUUIDs = v3;

    v5 = (NSMutableData *)objc_alloc_init(MEMORY[0x1E0C99DF0]);
    looseAssociatedObjectUUIDs = v2->_looseAssociatedObjectUUIDs;
    v2->_looseAssociatedObjectUUIDs = v5;

    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    workoutEvents = v2->_workoutEvents;
    v2->_workoutEvents = v7;

    v2->_workoutActivityType = 37;
  }
  return v2;
}

- (_HDDemoDataActivityWorkoutState)initWithCoder:(id)a3
{
  id v4;
  _HDDemoDataActivityWorkoutState *v5;
  void *v6;
  uint64_t v7;
  NSMutableData *associatedObjectUUIDs;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  uint64_t v19;
  NSMutableArray *workoutEvents;
  uint64_t v21;
  HKQuantity *goal;
  uint64_t v23;
  NSDate *startDate;
  uint64_t v25;
  objc_super v27;

  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)_HDDemoDataActivityWorkoutState;
  v5 = -[_HDDemoDataActivityWorkoutState init](&v27, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("objectUUIDs"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithData:", v6);
    associatedObjectUUIDs = v5->_associatedObjectUUIDs;
    v5->_associatedObjectUUIDs = (NSMutableData *)v7;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("totalEnergy"));
    v5->_totalEnergyBurnedInKilocalories = v9;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("totalWalkingDistance"));
    v5->_totalDistanceWalkingInMeters = v10;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("totalCyclingDistance"));
    v5->_totalDistanceCyclingInMeters = v11;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("totalSwimmingDistance"));
    v5->_totalDistanceSwimmingInYards = v12;
    v5->_totalDistanceCrossCountrySkiingInMeters = (double)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("totalCrossCountrySkiingDistance"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("totalRowingDistance"));
    v5->_totalDistanceRowingInMeters = v13;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("totalSkatingSportsDistance"));
    v5->_totalDistanceSkatingSportsInMeters = v14;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("totalPaddleSportsDistance"));
    v5->_totalDistancePaddleSportsInMeters = v15;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("totalDownhillSnowSportsDistance"));
    v5->_totalDistanceDownhillSnowSportsInMeters = v16;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("totalSwimmingStrokes"));
    v5->_totalSwimmingStrokes = v17;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("workoutEvents"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "mutableCopy");
    workoutEvents = v5->_workoutEvents;
    v5->_workoutEvents = (NSMutableArray *)v19;

    v5->_workoutActivityType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("activityType"));
    v5->_goalType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("goalType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("goal"));
    v21 = objc_claimAutoreleasedReturnValue();
    goal = v5->_goal;
    v5->_goal = (HKQuantity *)v21;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("startDate"));
    v23 = objc_claimAutoreleasedReturnValue();
    startDate = v5->_startDate;
    v5->_startDate = (NSDate *)v23;

    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("swimmingStrokeStyle")))
      v25 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("swimmingStrokeStyle"));
    else
      v25 = 2;
    v5->_swimmingStrokeStyle = v25;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSMutableData *associatedObjectUUIDs;
  id v5;

  associatedObjectUUIDs = self->_associatedObjectUUIDs;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", associatedObjectUUIDs, CFSTR("objectUUIDs"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("totalEnergy"), self->_totalEnergyBurnedInKilocalories);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("totalWalkingDistance"), self->_totalDistanceWalkingInMeters);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("totalCyclingDistance"), self->_totalDistanceCyclingInMeters);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("totalSwimmingDistance"), self->_totalDistanceSwimmingInYards);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("totalCrossCountrySkiingDistance"), self->_totalDistanceCrossCountrySkiingInMeters);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("totalRowingDistance"), self->_totalDistanceRowingInMeters);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("totalSkatingSportsDistance"), self->_totalDistanceSkatingSportsInMeters);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("totalPaddleSportsDistance"), self->_totalDistancePaddleSportsInMeters);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("totalDownhillSnowSportsDistance"), self->_totalDistanceDownhillSnowSportsInMeters);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("totalSwimmingStrokes"), self->_totalSwimmingStrokes);
  objc_msgSend(v5, "encodeObject:forKey:", self->_workoutEvents, CFSTR("workoutEvents"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_workoutActivityType, CFSTR("activityType"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_goalType, CFSTR("goalType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_goal, CFSTR("goal"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_startDate, CFSTR("startDate"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_swimmingStrokeStyle, CFSTR("swimmingStrokeStyle"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_goal, 0);
  objc_storeStrong((id *)&self->_workoutEvents, 0);
  objc_storeStrong((id *)&self->_looseAssociatedObjectUUIDs, 0);
  objc_storeStrong((id *)&self->_associatedObjectUUIDs, 0);
}

@end
