@implementation HDDemoDataWorkoutPrototype

+ (id)workoutPrototypeWithActivityType:(unint64_t)a3 goalType:(unint64_t)a4 goal:(id)a5 startTime:(double)a6 duration:(double)a7 energyBurned:(double)a8 distanceWalking:(double)a9 distanceCycling:(double)a10
{
  HKQuantity *v17;
  HDDemoDataWorkoutPrototype *v18;
  HKQuantity *goal;

  v17 = (HKQuantity *)a5;
  v18 = objc_alloc_init(HDDemoDataWorkoutPrototype);
  v18->_workoutActivityType = a3;
  v18->_goalType = a4;
  goal = v18->_goal;
  v18->_goal = v17;

  v18->_startTimeOffsetInDay = a6;
  v18->_duration = a7;
  v18->_totalEnergyBurnedInKcal = a8;
  v18->_totalDistanceWalkingInMiles = a9;
  v18->_totalDistanceCyclingInMiles = a10;
  return v18;
}

+ (id)workoutPrototypeWithActivityType:(unint64_t)a3 goalType:(unint64_t)a4 goal:(id)a5 startTime:(double)a6 duration:(double)a7 energyBurned:(double)a8 distanceWalking:(double)a9 distanceCycling:(double)a10 distanceSwimming:(double)a11 distanceSwimmingSegment:(double)a12 totalSwimmingSegments:(int64_t)a13 numLapsPerSegment:(int64_t)a14 swimTimePerSegment:(double)a15 restTimePerSegment:(double)a16 swimmingStrokeStyle:(int64_t)a17
{
  HKQuantity *v29;
  HDDemoDataWorkoutPrototype *v30;
  HKQuantity *goal;

  v29 = (HKQuantity *)a5;
  v30 = objc_alloc_init(HDDemoDataWorkoutPrototype);
  v30->_workoutActivityType = a3;
  v30->_goalType = a4;
  goal = v30->_goal;
  v30->_goal = v29;

  v30->_startTimeOffsetInDay = a6;
  v30->_duration = a7;
  v30->_totalEnergyBurnedInKcal = a8;
  v30->_totalDistanceWalkingInMiles = a9;
  v30->_totalDistanceCyclingInMiles = a10;
  v30->_totalDistanceSwimmingInYards = a11;
  v30->_swimmingSegmentDistanceInYards = a12;
  v30->_totalSwimmingSegments = a13;
  v30->_numLapsPerSegment = a14;
  v30->_swimTimePerSegment = a15;
  v30->_restTimePerSegment = a16;
  v30->_swimmingStrokeStyle = a17;
  return v30;
}

+ (id)workoutPrototypeWithActivityType:(unint64_t)a3 goalType:(unint64_t)a4 goal:(id)a5 startTime:(double)a6 duration:(double)a7 energyBurned:(double)a8 distanceWalking:(double)a9 distanceCycling:(double)a10 distanceCrossCountrySkiing:(double)a11 distanceRowing:(double)a12 distanceSkatingSports:(double)a13 distancePaddleSports:(double)a14 distanceDownhillSnowSports:(double)a15
{
  HKQuantity *v23;
  HDDemoDataWorkoutPrototype *v24;
  HKQuantity *goal;

  v23 = (HKQuantity *)a5;
  v24 = objc_alloc_init(HDDemoDataWorkoutPrototype);
  v24->_workoutActivityType = a3;
  v24->_goalType = a4;
  goal = v24->_goal;
  v24->_goal = v23;

  v24->_startTimeOffsetInDay = a6;
  v24->_duration = a7;
  v24->_totalEnergyBurnedInKcal = a8;
  v24->_totalDistanceWalkingInMiles = a9;
  v24->_totalDistanceCyclingInMiles = a10;
  v24->_totalDistanceCrossCountrySkiingInMeters = a11;
  v24->_totalDistanceRowingInMeters = a12;
  v24->_totalDistanceSkatingSportsInMeters = a13;
  v24->_totalDistancePaddleSportsInMeters = a14;
  v24->_totalDistanceDownhillSnowSportsInMeters = a15;
  return v24;
}

+ (id)ellipticalPrototype
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)objc_opt_class();
  v3 = (void *)MEMORY[0x1E0CB6A28];
  objc_msgSend(MEMORY[0x1E0CB6CD0], "minuteUnit");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "quantityWithUnit:doubleValue:", v4, 30.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "workoutPrototypeWithActivityType:goalType:goal:startTime:duration:energyBurned:distanceWalking:distanceCycling:", 16, 2, v5, 0.334027778, 1800.0, 452.0, 0.0, 0.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)HIITPrototype
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)objc_opt_class();
  v3 = (void *)MEMORY[0x1E0CB6A28];
  objc_msgSend(MEMORY[0x1E0CB6CD0], "minuteUnit");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "quantityWithUnit:doubleValue:", v4, 30.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "workoutPrototypeWithActivityType:goalType:goal:startTime:duration:energyBurned:distanceWalking:distanceCycling:", 63, 2, v5, 0.345486111, 1800.0, 322.0, 0.0, 0.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)runningPrototype
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)objc_opt_class();
  v3 = (void *)MEMORY[0x1E0CB6A28];
  objc_msgSend(MEMORY[0x1E0CB6CD0], "mileUnit");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "quantityWithUnit:doubleValue:", v4, 5.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "workoutPrototypeWithActivityType:goalType:goal:startTime:duration:energyBurned:distanceWalking:distanceCycling:", 37, 1, v5, 0.356944444, 3240.0, 545.0, 5.12, 0.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)cyclingPrototype
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)objc_opt_class();
  v3 = (void *)MEMORY[0x1E0CB6A28];
  objc_msgSend(MEMORY[0x1E0CB6CD0], "mileUnit");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "quantityWithUnit:doubleValue:", v4, 10.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "workoutPrototypeWithActivityType:goalType:goal:startTime:duration:energyBurned:distanceWalking:distanceCycling:", 13, 1, v5, 0.356944444, 2520.0, 513.0, 0.0, 10.8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)swimmingPrototype
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)objc_opt_class();
  v3 = (void *)MEMORY[0x1E0CB6A28];
  objc_msgSend(MEMORY[0x1E0CB6CD0], "yardUnit");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "quantityWithUnit:doubleValue:", v4, 1500.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "workoutPrototypeWithActivityType:goalType:goal:startTime:duration:energyBurned:distanceWalking:distanceCycling:distanceSwimming:distanceSwimmingSegment:totalSwimmingSegments:numLapsPerSegment:swimTimePerSegment:restTimePerSegment:swimmingStrokeStyle:", 46, 1, v5, 8, 2, 2, 0.348611111, 1800.0, 458.5, 0.0, 0.0, 1500.0, 200.0, 180.0, 0x404E000000000000);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)walkingPrototype
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)objc_opt_class();
  v3 = (void *)MEMORY[0x1E0CB6A28];
  objc_msgSend(MEMORY[0x1E0CB6CD0], "mileUnit");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "quantityWithUnit:doubleValue:", v4, 2.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "workoutPrototypeWithActivityType:goalType:goal:startTime:duration:energyBurned:distanceWalking:distanceCycling:", 52, 1, v5, 0.344097222, 1800.0, 205.0, 2.04, 0.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)hikingPrototype
{
  return (id)objc_msgSend((id)objc_opt_class(), "workoutPrototypeWithActivityType:goalType:goal:startTime:duration:energyBurned:distanceWalking:distanceCycling:", 24, 0, 0, 0.342013889, 3600.0, 446.0, 1.97, 0.0);
}

+ (id)yogaPrototype
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)objc_opt_class();
  v3 = (void *)MEMORY[0x1E0CB6A28];
  objc_msgSend(MEMORY[0x1E0CB6CD0], "hourUnit");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "quantityWithUnit:doubleValue:", v4, 1.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "workoutPrototypeWithActivityType:goalType:goal:startTime:duration:energyBurned:distanceWalking:distanceCycling:", 57, 2, v5, 0.345486111, 3600.0, 210.0, 0.0, 0.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)thirdPartyWorkoutPrototype
{
  return (id)objc_msgSend((id)objc_opt_class(), "workoutPrototypeWithActivityType:goalType:goal:startTime:duration:energyBurned:distanceWalking:distanceCycling:", 0, 0, 0, 0.673611111, 1260.0, 188.0, 0.0, 0.0);
}

+ (id)functionalStrengthTrainingPrototype
{
  return (id)objc_msgSend((id)objc_opt_class(), "workoutPrototypeWithActivityType:goalType:goal:startTime:duration:energyBurned:distanceWalking:distanceCycling:", 20, 0, 0, 0.340277778, 1800.0, 220.0, 0.0, 0.0);
}

+ (id)coolDownPrototype
{
  return (id)objc_msgSend((id)objc_opt_class(), "workoutPrototypeWithActivityType:goalType:goal:startTime:duration:energyBurned:distanceWalking:distanceCycling:", 80, 0, 0, 0.350347222, 600.0, 56.0, 0.0, 0.0);
}

+ (id)coreTrainingPrototype
{
  return (id)objc_msgSend((id)objc_opt_class(), "workoutPrototypeWithActivityType:goalType:goal:startTime:duration:energyBurned:distanceWalking:distanceCycling:", 59, 0, 0, 0.336805556, 1800.0, 180.0, 0.0, 0.0);
}

+ (id)dancePrototype
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)objc_opt_class();
  v3 = (void *)MEMORY[0x1E0CB6A28];
  objc_msgSend(MEMORY[0x1E0CB6CD0], "minuteUnit");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "quantityWithUnit:doubleValue:", v4, 30.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "workoutPrototypeWithActivityType:goalType:goal:startTime:duration:energyBurned:distanceWalking:distanceCycling:", 77, 2, v5, 0.346875, 3600.0, 322.0, 0.0, 0.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)underwaterDivingPrototype
{
  return (id)objc_msgSend((id)objc_opt_class(), "workoutPrototypeWithActivityType:goalType:goal:startTime:duration:energyBurned:distanceWalking:distanceCycling:", 84, 0, 0, 0.352233796, 3600.0, 450.0, 0.0, 0.0);
}

+ (id)crossCountrySkiingPrototype
{
  return (id)objc_msgSend((id)objc_opt_class(), "workoutPrototypeWithActivityType:goalType:goal:startTime:duration:energyBurned:distanceWalking:distanceCycling:distanceCrossCountrySkiing:distanceRowing:distanceSkatingSports:distancePaddleSports:distanceDownhillSnowSports:", 60, 0, 0, 0.380243056, 1800.0, 443.0, 0.0, 0.0, 6200.0, 0.0, 0.0, 0, 0);
}

+ (id)rowingPrototype
{
  return (id)objc_msgSend((id)objc_opt_class(), "workoutPrototypeWithActivityType:goalType:goal:startTime:duration:energyBurned:distanceWalking:distanceCycling:distanceCrossCountrySkiing:distanceRowing:distanceSkatingSports:distancePaddleSports:distanceDownhillSnowSports:", 35, 0, 0, 0.263009259, 3240.0, 687.0, 0.0, 0.0, 0.0, 6200.0, 0.0, 0, 0);
}

+ (id)skatingSportsPrototype
{
  return (id)objc_msgSend((id)objc_opt_class(), "workoutPrototypeWithActivityType:goalType:goal:startTime:duration:energyBurned:distanceWalking:distanceCycling:distanceCrossCountrySkiing:distanceRowing:distanceSkatingSports:distancePaddleSports:distanceDownhillSnowSports:", 39, 0, 0, 0.64400463, 1800.0, 250.0, 0.0, 0.0, 0.0, 0.0, 1800.0, 0, 0);
}

+ (id)paddleSportsPrototype
{
  return (id)objc_msgSend((id)objc_opt_class(), "workoutPrototypeWithActivityType:goalType:goal:startTime:duration:energyBurned:distanceWalking:distanceCycling:distanceCrossCountrySkiing:distanceRowing:distanceSkatingSports:distancePaddleSports:distanceDownhillSnowSports:", 31, 0, 0, 0.511898148, 3600.0, 326.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0x40A7D40000000000, 0);
}

+ (id)golfPrototype
{
  return (id)objc_msgSend((id)objc_opt_class(), "workoutPrototypeWithActivityType:goalType:goal:startTime:duration:energyBurned:distanceWalking:distanceCycling:", 21, 0, 0, 0.338252315, 3600.0, 200.0, 3.43, 0.0);
}

+ (id)downhillSnowSportsPrototype
{
  uint64_t v2;

  if (arc4random_uniform(2u))
    v2 = 61;
  else
    v2 = 67;
  return (id)objc_msgSend((id)objc_opt_class(), "workoutPrototypeWithActivityType:goalType:goal:startTime:duration:energyBurned:distanceWalking:distanceCycling:distanceCrossCountrySkiing:distanceRowing:distanceSkatingSports:distancePaddleSports:distanceDownhillSnowSports:", v2, 0, 0, 0.336828704, 1800.0, 326.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0, 0x40B83D0000000000);
}

+ (id)soccerPrototype
{
  return (id)objc_msgSend((id)objc_opt_class(), "workoutPrototypeWithActivityType:goalType:goal:startTime:duration:energyBurned:distanceWalking:distanceCycling:", 41, 0, 0, 0.709733796, 1800.0, 350.0, 6.43, 0.0);
}

+ (id)yogaAndRunningPrototypes
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_opt_class();
  v3 = (void *)MEMORY[0x1E0CB6A28];
  objc_msgSend(MEMORY[0x1E0CB6CD0], "hourUnit");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "quantityWithUnit:doubleValue:", v4, 1.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "workoutPrototypeWithActivityType:goalType:goal:startTime:duration:energyBurned:distanceWalking:distanceCycling:", 57, 2, v5, 0.345486111, 3600.0, 210.0, 0.0, 0.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v6;
  v7 = (void *)objc_opt_class();
  v8 = (void *)MEMORY[0x1E0CB6A28];
  objc_msgSend(MEMORY[0x1E0CB6CD0], "mileUnit");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "quantityWithUnit:doubleValue:", v9, 5.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "workoutPrototypeWithActivityType:goalType:goal:startTime:duration:energyBurned:distanceWalking:distanceCycling:", 37, 1, v10, 0.440277778, 3240.0, 545.0, 5.12, 0.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)pickRandomWorkoutFrom:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend(v3, "objectAtIndex:", arc4random() % (unint64_t)objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (unint64_t)workoutActivityType
{
  return self->_workoutActivityType;
}

- (void)setWorkoutActivityType:(unint64_t)a3
{
  self->_workoutActivityType = a3;
}

- (unint64_t)goalType
{
  return self->_goalType;
}

- (void)setGoalType:(unint64_t)a3
{
  self->_goalType = a3;
}

- (HKQuantity)goal
{
  return self->_goal;
}

- (void)setGoal:(id)a3
{
  objc_storeStrong((id *)&self->_goal, a3);
}

- (double)startTimeOffsetInDay
{
  return self->_startTimeOffsetInDay;
}

- (void)setStartTimeOffsetInDay:(double)a3
{
  self->_startTimeOffsetInDay = a3;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (double)totalEnergyBurnedInKcal
{
  return self->_totalEnergyBurnedInKcal;
}

- (void)setTotalEnergyBurnedInKcal:(double)a3
{
  self->_totalEnergyBurnedInKcal = a3;
}

- (double)totalDistanceWalkingInMiles
{
  return self->_totalDistanceWalkingInMiles;
}

- (void)setTotalDistanceWalkingInMiles:(double)a3
{
  self->_totalDistanceWalkingInMiles = a3;
}

- (double)totalDistanceCyclingInMiles
{
  return self->_totalDistanceCyclingInMiles;
}

- (void)setTotalDistanceCyclingInMiles:(double)a3
{
  self->_totalDistanceCyclingInMiles = a3;
}

- (double)totalDistanceCrossCountrySkiingInMeters
{
  return self->_totalDistanceCrossCountrySkiingInMeters;
}

- (void)setTotalDistanceCrossCountrySkiingInMeters:(double)a3
{
  self->_totalDistanceCrossCountrySkiingInMeters = a3;
}

- (double)totalDistanceRowingInMeters
{
  return self->_totalDistanceRowingInMeters;
}

- (void)setTotalDistanceRowingInMeters:(double)a3
{
  self->_totalDistanceRowingInMeters = a3;
}

- (double)totalDistanceSkatingSportsInMeters
{
  return self->_totalDistanceSkatingSportsInMeters;
}

- (void)setTotalDistanceSkatingSportsInMeters:(double)a3
{
  self->_totalDistanceSkatingSportsInMeters = a3;
}

- (double)totalDistancePaddleSportsInMeters
{
  return self->_totalDistancePaddleSportsInMeters;
}

- (void)setTotalDistancePaddleSportsInMeters:(double)a3
{
  self->_totalDistancePaddleSportsInMeters = a3;
}

- (double)totalDistanceDownhillSnowSportsInMeters
{
  return self->_totalDistanceDownhillSnowSportsInMeters;
}

- (void)setTotalDistanceDownhillSnowSportsInMeters:(double)a3
{
  self->_totalDistanceDownhillSnowSportsInMeters = a3;
}

- (double)totalDistanceSwimmingInYards
{
  return self->_totalDistanceSwimmingInYards;
}

- (void)setTotalDistanceSwimmingInYards:(double)a3
{
  self->_totalDistanceSwimmingInYards = a3;
}

- (double)swimmingSegmentDistanceInYards
{
  return self->_swimmingSegmentDistanceInYards;
}

- (void)setSwimmingSegmentDistanceInYards:(double)a3
{
  self->_swimmingSegmentDistanceInYards = a3;
}

- (int64_t)totalSwimmingSegments
{
  return self->_totalSwimmingSegments;
}

- (void)setTotalSwimmingSegments:(int64_t)a3
{
  self->_totalSwimmingSegments = a3;
}

- (int64_t)numLapsPerSegment
{
  return self->_numLapsPerSegment;
}

- (void)setNumLapsPerSegment:(int64_t)a3
{
  self->_numLapsPerSegment = a3;
}

- (double)swimTimePerSegment
{
  return self->_swimTimePerSegment;
}

- (void)setSwimTimePerSegment:(double)a3
{
  self->_swimTimePerSegment = a3;
}

- (double)restTimePerSegment
{
  return self->_restTimePerSegment;
}

- (void)setRestTimePerSegment:(double)a3
{
  self->_restTimePerSegment = a3;
}

- (int64_t)swimmingStrokeStyle
{
  return self->_swimmingStrokeStyle;
}

- (void)setSwimmingStrokeStyle:(int64_t)a3
{
  self->_swimmingStrokeStyle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_goal, 0);
}

@end
