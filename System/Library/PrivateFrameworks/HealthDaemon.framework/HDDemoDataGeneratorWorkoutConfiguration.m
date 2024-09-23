@implementation HDDemoDataGeneratorWorkoutConfiguration

- (HDDemoDataGeneratorWorkoutConfiguration)initWithPrototype:(id)a3 currentDemoDataTime:(double)a4
{
  id v6;
  HDDemoDataGeneratorWorkoutConfiguration *v7;
  uint64_t v8;
  HKQuantity *goal;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;

  v6 = a3;
  v7 = -[HDDemoDataGeneratorWorkoutConfiguration init](self, "init");
  if (v7)
  {
    v7->_activityType = objc_msgSend(v6, "workoutActivityType");
    v7->_indoor = 0;
    v7->_goalType = objc_msgSend(v6, "goalType");
    objc_msgSend(v6, "goal");
    v8 = objc_claimAutoreleasedReturnValue();
    goal = v7->_goal;
    v7->_goal = (HKQuantity *)v8;

    v7->_startTime = a4;
    objc_msgSend(v6, "duration");
    v11 = v10 * 0.0000115740741;
    v7->_endTime = v10 * 0.0000115740741 + a4;
    objc_msgSend(v6, "totalEnergyBurnedInKcal");
    v7->_kcalRate = v12 / v11;
    objc_msgSend(v6, "totalDistanceCyclingInMiles");
    v7->_distanceCyclingRateInMiles = v13 / v11;
    objc_msgSend(v6, "totalDistanceWalkingInMiles");
    v7->_distanceWalkingRateInMiles = v14 / v11;
    objc_msgSend(v6, "totalDistanceCrossCountrySkiingInMeters");
    v7->_distanceCrossCountrySkiingRateInMeters = v15 / v11;
    objc_msgSend(v6, "totalDistanceRowingInMeters");
    v7->_distanceRowingRateInMeters = v16 / v11;
    objc_msgSend(v6, "totalDistanceRowingInMeters");
    v7->_distanceSkatingSportsRateInMeters = v17 / v11;
    objc_msgSend(v6, "totalDistancePaddleSportsInMeters");
    v7->_distancePaddleSportsRateInMeters = v18 / v11;
    objc_msgSend(v6, "totalDistanceDownhillSnowSportsInMeters");
    v7->_distanceDownhillSnowSportsRateInMeters = v19 / v11;
    objc_msgSend(v6, "swimmingSegmentDistanceInYards");
    v7->_distanceSwimmingSegmentInYards = v20;
    v7->_numSwimmingSegments = objc_msgSend(v6, "totalSwimmingSegments");
    v7->_swimmingNumLapsPerSegment = objc_msgSend(v6, "numLapsPerSegment");
    objc_msgSend(v6, "swimTimePerSegment");
    v7->_swimmingSwimSegmentTime = v21;
    objc_msgSend(v6, "restTimePerSegment");
    v7->_swimmingRestSegmentTime = v22;
    v7->_swimmingStrokeStyle = objc_msgSend(v6, "swimmingStrokeStyle");
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HDDemoDataGeneratorWorkoutConfiguration)initWithCoder:(id)a3
{
  id v4;
  HDDemoDataGeneratorWorkoutConfiguration *v5;
  HDDemoDataGeneratorWorkoutConfiguration *v6;
  uint64_t v7;
  HKQuantity *goal;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  objc_super v28;

  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)HDDemoDataGeneratorWorkoutConfiguration;
  v5 = -[HDDemoDataGeneratorWorkoutConfiguration init](&v28, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_createdFromNSKeyedUnarchiver = 1;
    v5->_activityType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_WorkoutConfigurationActivityTypeKey"));
    v6->_indoor = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_WorkoutConfigurationIndoorKey"));
    v6->_goalType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_WorkoutConfigurationGoalTypeKey"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_WorkoutConfigurationGoalKey"));
    v7 = objc_claimAutoreleasedReturnValue();
    goal = v6->_goal;
    v6->_goal = (HKQuantity *)v7;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_WorkoutConfigurationStartTimeKey"));
    v6->_startTime = v9;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_WorkoutConfigurationEndTimeKey"));
    v6->_endTime = v10;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_WorkoutConfigurationKCalRateKey"));
    v6->_kcalRate = v11;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_WorkoutConfigurationDistanceWalkingRateMilesKey"));
    v6->_distanceWalkingRateInMiles = v12;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_WorkoutConfigurationDistanceCyclingRateMilesKey"));
    v6->_distanceCyclingRateInMiles = v13;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_WorkoutConfigurationDistanceSwimmingRateYardsKey"));
    v6->_distanceSwimmingRateInYards = v14;
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("_WorkoutConfigurationNumSwimmingSegmentsKey")))
      v15 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_WorkoutConfigurationNumSwimmingSegmentsKey"));
    else
      v15 = 8;
    v6->_numSwimmingSegments = v15;
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("_WorkoutConfigurationSwimmingSwimSegmentTimeKey")))objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_WorkoutConfigurationSwimmingSwimSegmentTimeKey"));
    else
      v16 = 0x4066800000000000;
    *(_QWORD *)&v6->_swimmingSwimSegmentTime = v16;
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("_WorkoutConfigurationSwimmingRestSegmentTimeKey")))objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_WorkoutConfigurationSwimmingRestSegmentTimeKey"));
    else
      v17 = 0x404E000000000000;
    *(_QWORD *)&v6->_swimmingRestSegmentTime = v17;
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("_WorkoutConfigurationSwimmingNumLapsPerSegmentKey")))v18 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_WorkoutConfigurationSwimmingNumLapsPerSegmentKey"));
    else
      v18 = 2;
    v6->_swimmingNumLapsPerSegment = v18;
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("_WorkoutConfigurationSwimmingStrokeStyleKey")))
      v19 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_WorkoutConfigurationSwimmingStrokeStyleKey"));
    else
      v19 = 2;
    v6->_swimmingStrokeStyle = v19;
    v20 = objc_msgSend(v4, "containsValueForKey:", CFSTR("_WorkoutConfigurationDistanceCrossCountrySkiingRateMetersKey"));
    v21 = 0x40B8380000000000;
    v22 = 0x40B8380000000000;
    if (v20)
      objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_WorkoutConfigurationDistanceCrossCountrySkiingRateMetersKey"), 6200.0);
    *(_QWORD *)&v6->_distanceCrossCountrySkiingRateInMeters = v22;
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("_WorkoutConfigurationDistanceRowingRateMetersKey")))
    {
      objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_WorkoutConfigurationDistanceRowingRateMetersKey"));
      v21 = v23;
    }
    *(_QWORD *)&v6->_distanceRowingRateInMeters = v21;
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("_WorkoutConfigurationDistanceSkatingSportsRateMetersKey")))objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_WorkoutConfigurationDistanceSkatingSportsRateMetersKey"));
    else
      v24 = 0x409C200000000000;
    *(_QWORD *)&v6->_distanceSkatingSportsRateInMeters = v24;
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("_WorkoutConfigurationDistancePaddleSportsRateMetersKey")))objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_WorkoutConfigurationDistancePaddleSportsRateMetersKey"));
    else
      v25 = 0x4085E00000000000;
    *(_QWORD *)&v6->_distancePaddleSportsRateInMeters = v25;
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("_WorkoutConfigurationDistanceDownhillSnowSportsRateMetersKey")))objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_WorkoutConfigurationDistanceDownhillSnowSportsRateMetersKey"));
    else
      v26 = 0x40B8380000000000;
    *(_QWORD *)&v6->_distanceDownhillSnowSportsRateInMeters = v26;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t activityType;
  id v5;

  activityType = self->_activityType;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", activityType, CFSTR("_WorkoutConfigurationActivityTypeKey"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_indoor, CFSTR("_WorkoutConfigurationIndoorKey"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_goalType, CFSTR("_WorkoutConfigurationGoalTypeKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_goal, CFSTR("_WorkoutConfigurationGoalKey"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("_WorkoutConfigurationStartTimeKey"), self->_startTime);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("_WorkoutConfigurationEndTimeKey"), self->_endTime);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("_WorkoutConfigurationKCalRateKey"), self->_kcalRate);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("_WorkoutConfigurationDistanceWalkingRateMilesKey"), self->_distanceWalkingRateInMiles);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("_WorkoutConfigurationDistanceCyclingRateMilesKey"), self->_distanceCyclingRateInMiles);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("_WorkoutConfigurationDistanceCrossCountrySkiingRateMetersKey"), self->_distanceCrossCountrySkiingRateInMeters);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("_WorkoutConfigurationDistanceRowingRateMetersKey"), self->_distanceRowingRateInMeters);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("_WorkoutConfigurationDistanceSkatingSportsRateMetersKey"), self->_distanceSkatingSportsRateInMeters);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("_WorkoutConfigurationDistancePaddleSportsRateMetersKey"), self->_distancePaddleSportsRateInMeters);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("_WorkoutConfigurationDistanceDownhillSnowSportsRateMetersKey"), self->_distanceDownhillSnowSportsRateInMeters);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("_WorkoutConfigurationDistanceSwimmingRateYardsKey"), self->_distanceSwimmingRateInYards);
  objc_msgSend(v5, "encodeInteger:forKey:", self->_numSwimmingSegments, CFSTR("_WorkoutConfigurationNumSwimmingSegmentsKey"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("_WorkoutConfigurationSwimmingSwimSegmentTimeKey"), self->_swimmingSwimSegmentTime);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("_WorkoutConfigurationSwimmingRestSegmentTimeKey"), self->_swimmingRestSegmentTime);
  objc_msgSend(v5, "encodeInteger:forKey:", self->_swimmingNumLapsPerSegment, CFSTR("_WorkoutConfigurationSwimmingNumLapsPerSegmentKey"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_swimmingStrokeStyle, CFSTR("_WorkoutConfigurationSwimmingStrokeStyleKey"));

}

- (unint64_t)activityType
{
  return self->_activityType;
}

- (void)setActivityType:(unint64_t)a3
{
  self->_activityType = a3;
}

- (BOOL)indoor
{
  return self->_indoor;
}

- (void)setIndoor:(BOOL)a3
{
  self->_indoor = a3;
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

- (double)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

- (double)endTime
{
  return self->_endTime;
}

- (void)setEndTime:(double)a3
{
  self->_endTime = a3;
}

- (double)kcalRate
{
  return self->_kcalRate;
}

- (void)setKcalRate:(double)a3
{
  self->_kcalRate = a3;
}

- (double)distanceWalkingRateInMiles
{
  return self->_distanceWalkingRateInMiles;
}

- (void)setDistanceWalkingRateInMiles:(double)a3
{
  self->_distanceWalkingRateInMiles = a3;
}

- (double)distanceCyclingRateInMiles
{
  return self->_distanceCyclingRateInMiles;
}

- (void)setDistanceCyclingRateInMiles:(double)a3
{
  self->_distanceCyclingRateInMiles = a3;
}

- (double)distanceCrossCountrySkiingRateInMeters
{
  return self->_distanceCrossCountrySkiingRateInMeters;
}

- (void)setDistanceCrossCountrySkiingRateInMeters:(double)a3
{
  self->_distanceCrossCountrySkiingRateInMeters = a3;
}

- (double)distanceRowingRateInMeters
{
  return self->_distanceRowingRateInMeters;
}

- (void)setDistanceRowingRateInMeters:(double)a3
{
  self->_distanceRowingRateInMeters = a3;
}

- (double)distanceSkatingSportsRateInMeters
{
  return self->_distanceSkatingSportsRateInMeters;
}

- (void)setDistanceSkatingSportsRateInMeters:(double)a3
{
  self->_distanceSkatingSportsRateInMeters = a3;
}

- (double)distancePaddleSportsRateInMeters
{
  return self->_distancePaddleSportsRateInMeters;
}

- (void)setDistancePaddleSportsRateInMeters:(double)a3
{
  self->_distancePaddleSportsRateInMeters = a3;
}

- (double)distanceDownhillSnowSportsRateInMeters
{
  return self->_distanceDownhillSnowSportsRateInMeters;
}

- (void)setDistanceDownhillSnowSportsRateInMeters:(double)a3
{
  self->_distanceDownhillSnowSportsRateInMeters = a3;
}

- (double)distanceSwimmingRateInYards
{
  return self->_distanceSwimmingRateInYards;
}

- (void)setDistanceSwimmingRateInYards:(double)a3
{
  self->_distanceSwimmingRateInYards = a3;
}

- (double)distanceSwimmingSegmentInYards
{
  return self->_distanceSwimmingSegmentInYards;
}

- (void)setDistanceSwimmingSegmentInYards:(double)a3
{
  self->_distanceSwimmingSegmentInYards = a3;
}

- (int64_t)numSwimmingSegments
{
  return self->_numSwimmingSegments;
}

- (void)setNumSwimmingSegments:(int64_t)a3
{
  self->_numSwimmingSegments = a3;
}

- (int64_t)swimmingNumLapsPerSegment
{
  return self->_swimmingNumLapsPerSegment;
}

- (void)setSwimmingNumLapsPerSegment:(int64_t)a3
{
  self->_swimmingNumLapsPerSegment = a3;
}

- (double)swimmingSwimSegmentTime
{
  return self->_swimmingSwimSegmentTime;
}

- (void)setSwimmingSwimSegmentTime:(double)a3
{
  self->_swimmingSwimSegmentTime = a3;
}

- (double)swimmingRestSegmentTime
{
  return self->_swimmingRestSegmentTime;
}

- (void)setSwimmingRestSegmentTime:(double)a3
{
  self->_swimmingRestSegmentTime = a3;
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
