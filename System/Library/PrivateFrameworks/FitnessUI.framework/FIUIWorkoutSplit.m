@implementation FIUIWorkoutSplit

- (FIUIWorkoutSplit)initWithDistance:(double)a3 duration:(double)a4
{
  FIUIWorkoutSplit *v6;
  FIUIWorkoutSplit *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)FIUIWorkoutSplit;
  v6 = -[FIUIWorkoutSplit init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    -[FIUIWorkoutSplit setDistanceInMeters:](v6, "setDistanceInMeters:", a3);
    -[FIUIWorkoutSplit setDuration:](v7, "setDuration:", a4);
  }
  return v7;
}

- (FIUIWorkoutSplit)initWithDistance:(double)a3 duration:(double)a4 dateInterval:(id)a5
{
  id v8;
  FIUIWorkoutSplit *v9;
  FIUIWorkoutSplit *v10;
  objc_super v12;

  v8 = a5;
  v12.receiver = self;
  v12.super_class = (Class)FIUIWorkoutSplit;
  v9 = -[FIUIWorkoutSplit init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    -[FIUIWorkoutSplit setDistanceInMeters:](v9, "setDistanceInMeters:", a3);
    -[FIUIWorkoutSplit setDuration:](v10, "setDuration:", a4);
    -[FIUIWorkoutSplit setDateInterval:](v10, "setDateInterval:", v8);
  }

  return v10;
}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  objc_super v10;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v10.receiver = self;
  v10.super_class = (Class)FIUIWorkoutSplit;
  -[FIUIWorkoutSplit description](&v10, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FIUIWorkoutSplit distanceInMeters](self, "distanceInMeters");
  v6 = v5;
  -[FIUIWorkoutSplit duration](self, "duration");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: distanceInMeters: %f duration: %f"), v4, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (FIUIWorkoutSplit)initWithCoder:(id)a3
{
  id v4;
  FIUIWorkoutSplit *v5;
  double v6;
  double v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FIUIWorkoutSplit;
  v5 = -[FIUIWorkoutSplit init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("distance"));
    v5->_distanceInMeters = v6;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("duration"));
    v5->_duration = v7;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  double distanceInMeters;
  id v5;

  distanceInMeters = self->_distanceInMeters;
  v5 = a3;
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("distance"), distanceInMeters);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("duration"), self->_duration);

}

- (double)distanceInMeters
{
  return self->_distanceInMeters;
}

- (void)setDistanceInMeters:(double)a3
{
  self->_distanceInMeters = a3;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (NSDateInterval)dateInterval
{
  return self->_dateInterval;
}

- (void)setDateInterval:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateInterval, 0);
}

@end
