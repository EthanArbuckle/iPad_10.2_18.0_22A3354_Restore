@implementation MOSuggestionAssetWorkoutRoute

- (id)init:(id)a3 workout:(id)a4
{
  id v7;
  id v8;
  MOSuggestionAssetWorkoutRoute *v9;
  id *p_isa;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MOSuggestionAssetWorkoutRoute;
  v9 = -[MOSuggestionAssetWorkoutRoute init](&v12, sel_init);
  p_isa = (id *)&v9->super.isa;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_locationReadings, a3);
    objc_storeStrong(p_isa + 2, a4);
  }

  return p_isa;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *locationReadings;
  id v5;

  locationReadings = self->_locationReadings;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", locationReadings, CFSTR("coderKeyMOSuggestionAssetHKLocationReadings"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_workout, CFSTR("coderKeyMOSuggestionAssetHKWorkout"));

}

- (MOSuggestionAssetWorkoutRoute)initWithCoder:(id)a3
{
  id v4;
  MOSuggestionAssetWorkoutRoute *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *locationReadings;
  uint64_t v11;
  HKWorkout *workout;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MOSuggestionAssetWorkoutRoute;
  v5 = -[MOSuggestionAssetWorkoutRoute init](&v14, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("coderKeyMOSuggestionAssetHKLocationReadings"));
    v9 = objc_claimAutoreleasedReturnValue();
    locationReadings = v5->_locationReadings;
    v5->_locationReadings = (NSArray *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("coderKeyMOSuggestionAssetHKWorkout"));
    v11 = objc_claimAutoreleasedReturnValue();
    workout = v5->_workout;
    v5->_workout = (HKWorkout *)v11;

  }
  return v5;
}

- (NSArray)locationReadings
{
  return self->_locationReadings;
}

- (void)setLocationReadings:(id)a3
{
  objc_storeStrong((id *)&self->_locationReadings, a3);
}

- (HKWorkout)workout
{
  return self->_workout;
}

- (void)setWorkout:(id)a3
{
  objc_storeStrong((id *)&self->_workout, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workout, 0);
  objc_storeStrong((id *)&self->_locationReadings, 0);
}

@end
