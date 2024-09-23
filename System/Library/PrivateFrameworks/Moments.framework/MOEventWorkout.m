@implementation MOEventWorkout

- (MOEventWorkout)init
{
  MOEventWorkout *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MOEventWorkout;
  result = -[MOEventWorkout init](&v3, sel_init);
  if (result)
    *(_WORD *)&result->_isFitnessPlusSession = 0;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *workoutType;
  id v5;

  workoutType = self->_workoutType;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", workoutType, CFSTR("workoutType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_workoutTotalDistance, CFSTR("workoutTotalDistance"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_workoutTotalEnergyBurned, CFSTR("workoutTotalEnergyBurned"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_workoutDuration, CFSTR("workoutDuration"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_workoutLocationStart, CFSTR("workoutLocationStart"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_workoutLocationRoute, CFSTR("workoutLocationRoute"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isFitnessPlusSession, CFSTR("isFitnessPlusSession"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isIndoors, CFSTR("isIndoors"));

}

- (MOEventWorkout)initWithCoder:(id)a3
{
  id v4;
  MOEventWorkout *v5;
  uint64_t v6;
  NSString *workoutType;
  uint64_t v8;
  NSNumber *workoutTotalDistance;
  uint64_t v10;
  NSNumber *workoutTotalEnergyBurned;
  uint64_t v12;
  NSNumber *workoutDuration;
  uint64_t v14;
  CLLocation *workoutLocationStart;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  NSArray *workoutLocationRoute;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)MOEventWorkout;
  v5 = -[MOEventWorkout init](&v23, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("workoutType"));
    v6 = objc_claimAutoreleasedReturnValue();
    workoutType = v5->_workoutType;
    v5->_workoutType = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("workoutTotalDistance"));
    v8 = objc_claimAutoreleasedReturnValue();
    workoutTotalDistance = v5->_workoutTotalDistance;
    v5->_workoutTotalDistance = (NSNumber *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("workoutTotalEnergyBurned"));
    v10 = objc_claimAutoreleasedReturnValue();
    workoutTotalEnergyBurned = v5->_workoutTotalEnergyBurned;
    v5->_workoutTotalEnergyBurned = (NSNumber *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("workoutDuration"));
    v12 = objc_claimAutoreleasedReturnValue();
    workoutDuration = v5->_workoutDuration;
    v5->_workoutDuration = (NSNumber *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("workoutLocationStart"));
    v14 = objc_claimAutoreleasedReturnValue();
    workoutLocationStart = v5->_workoutLocationStart;
    v5->_workoutLocationStart = (CLLocation *)v14;

    v16 = (void *)MEMORY[0x1D1798EEC]();
    v17 = objc_alloc(MEMORY[0x1E0C99E60]);
    v18 = objc_opt_class();
    v19 = (void *)objc_msgSend(v17, "initWithObjects:", v18, objc_opt_class(), 0);
    objc_autoreleasePoolPop(v16);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v19, CFSTR("workoutLocationRoute"));
    v20 = objc_claimAutoreleasedReturnValue();
    workoutLocationRoute = v5->_workoutLocationRoute;
    v5->_workoutLocationRoute = (NSArray *)v20;

    v5->_isFitnessPlusSession = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isFitnessPlusSession"));
    v5->_isIndoors = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isIndoors"));
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MOEventWorkout *v4;

  v4 = objc_alloc_init(MOEventWorkout);
  objc_storeStrong((id *)&v4->_workoutType, self->_workoutType);
  objc_storeStrong((id *)&v4->_workoutTotalDistance, self->_workoutTotalDistance);
  objc_storeStrong((id *)&v4->_workoutTotalEnergyBurned, self->_workoutTotalEnergyBurned);
  objc_storeStrong((id *)&v4->_workoutDuration, self->_workoutDuration);
  objc_storeStrong((id *)&v4->_workoutLocationStart, self->_workoutLocationStart);
  objc_storeStrong((id *)&v4->_workoutLocationRoute, self->_workoutLocationRoute);
  v4->_isFitnessPlusSession = self->_isFitnessPlusSession;
  v4->_isIndoors = self->_isIndoors;
  return v4;
}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("workoutType, %@"), self->_workoutType);
}

- (NSString)workoutType
{
  return self->_workoutType;
}

- (void)setWorkoutType:(id)a3
{
  objc_storeStrong((id *)&self->_workoutType, a3);
}

- (NSNumber)workoutTotalDistance
{
  return self->_workoutTotalDistance;
}

- (void)setWorkoutTotalDistance:(id)a3
{
  objc_storeStrong((id *)&self->_workoutTotalDistance, a3);
}

- (NSNumber)workoutTotalEnergyBurned
{
  return self->_workoutTotalEnergyBurned;
}

- (void)setWorkoutTotalEnergyBurned:(id)a3
{
  objc_storeStrong((id *)&self->_workoutTotalEnergyBurned, a3);
}

- (NSNumber)workoutDuration
{
  return self->_workoutDuration;
}

- (void)setWorkoutDuration:(id)a3
{
  objc_storeStrong((id *)&self->_workoutDuration, a3);
}

- (CLLocation)workoutLocationStart
{
  return self->_workoutLocationStart;
}

- (void)setWorkoutLocationStart:(id)a3
{
  objc_storeStrong((id *)&self->_workoutLocationStart, a3);
}

- (NSArray)workoutLocationRoute
{
  return self->_workoutLocationRoute;
}

- (void)setWorkoutLocationRoute:(id)a3
{
  objc_storeStrong((id *)&self->_workoutLocationRoute, a3);
}

- (BOOL)isFitnessPlusSession
{
  return self->_isFitnessPlusSession;
}

- (void)setIsFitnessPlusSession:(BOOL)a3
{
  self->_isFitnessPlusSession = a3;
}

- (BOOL)isIndoors
{
  return self->_isIndoors;
}

- (void)setIsIndoors:(BOOL)a3
{
  self->_isIndoors = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workoutLocationRoute, 0);
  objc_storeStrong((id *)&self->_workoutLocationStart, 0);
  objc_storeStrong((id *)&self->_workoutDuration, 0);
  objc_storeStrong((id *)&self->_workoutTotalEnergyBurned, 0);
  objc_storeStrong((id *)&self->_workoutTotalDistance, 0);
  objc_storeStrong((id *)&self->_workoutType, 0);
}

@end
