@implementation _HKWorkoutRouteQueryServerConfiguration

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_HKWorkoutRouteQueryServerConfiguration;
  v4 = -[HKQueryServerConfiguration copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setWorkoutRoute:", self->_workoutRoute);
  objc_msgSend(v4, "setWorkoutUUID:", self->_workoutUUID);
  objc_msgSend(v4, "setDateInterval:", self->_dateInterval);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_HKWorkoutRouteQueryServerConfiguration)initWithCoder:(id)a3
{
  id v4;
  _HKWorkoutRouteQueryServerConfiguration *v5;
  uint64_t v6;
  HKWorkoutRoute *workoutRoute;
  uint64_t v8;
  NSUUID *workoutUUID;
  uint64_t v10;
  NSDateInterval *dateInterval;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_HKWorkoutRouteQueryServerConfiguration;
  v5 = -[HKQueryServerConfiguration initWithCoder:](&v13, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("series"));
    v6 = objc_claimAutoreleasedReturnValue();
    workoutRoute = v5->_workoutRoute;
    v5->_workoutRoute = (HKWorkoutRoute *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("workout_uuid"));
    v8 = objc_claimAutoreleasedReturnValue();
    workoutUUID = v5->_workoutUUID;
    v5->_workoutUUID = (NSUUID *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("date_interval"));
    v10 = objc_claimAutoreleasedReturnValue();
    dateInterval = v5->_dateInterval;
    v5->_dateInterval = (NSDateInterval *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_HKWorkoutRouteQueryServerConfiguration;
  v4 = a3;
  -[HKQueryServerConfiguration encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_workoutRoute, CFSTR("series"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_workoutUUID, CFSTR("workout_uuid"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_dateInterval, CFSTR("date_interval"));

}

- (HKWorkoutRoute)workoutRoute
{
  return self->_workoutRoute;
}

- (void)setWorkoutRoute:(id)a3
{
  objc_storeStrong((id *)&self->_workoutRoute, a3);
}

- (NSUUID)workoutUUID
{
  return self->_workoutUUID;
}

- (void)setWorkoutUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSDateInterval)dateInterval
{
  return self->_dateInterval;
}

- (void)setDateInterval:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateInterval, 0);
  objc_storeStrong((id *)&self->_workoutUUID, 0);
  objc_storeStrong((id *)&self->_workoutRoute, 0);
}

@end
