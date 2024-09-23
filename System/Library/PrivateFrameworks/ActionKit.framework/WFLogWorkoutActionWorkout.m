@implementation WFLogWorkoutActionWorkout

- (WFLogWorkoutActionWorkout)initWithStartDate:(id)a3 endDate:(id)a4 caloriesSample:(id)a5 calorieUnit:(id)a6 distanceSample:(id)a7 distanceUnit:(id)a8
{
  id v15;
  id v16;
  id v17;
  WFLogWorkoutActionWorkout *v18;
  WFLogWorkoutActionWorkout *v19;
  WFLogWorkoutActionWorkout *v20;
  id v22;
  id v23;
  id v24;
  objc_super v25;

  v24 = a3;
  v23 = a4;
  v22 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v25.receiver = self;
  v25.super_class = (Class)WFLogWorkoutActionWorkout;
  v18 = -[WFLogWorkoutActionWorkout init](&v25, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_startDate, a3);
    objc_storeStrong((id *)&v19->_endDate, a4);
    objc_storeStrong((id *)&v19->_caloriesSample, a5);
    objc_storeStrong((id *)&v19->_calorieUnit, a6);
    objc_storeStrong((id *)&v19->_distanceSample, a7);
    objc_storeStrong((id *)&v19->_distanceUnit, a8);
    v20 = v19;
  }

  return v19;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_startDate, a3);
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
  objc_storeStrong((id *)&self->_endDate, a3);
}

- (HKQuantitySample)caloriesSample
{
  return self->_caloriesSample;
}

- (void)setCaloriesSample:(id)a3
{
  objc_storeStrong((id *)&self->_caloriesSample, a3);
}

- (HKQuantitySample)distanceSample
{
  return self->_distanceSample;
}

- (void)setDistanceSample:(id)a3
{
  objc_storeStrong((id *)&self->_distanceSample, a3);
}

- (HKUnit)calorieUnit
{
  return self->_calorieUnit;
}

- (void)setCalorieUnit:(id)a3
{
  objc_storeStrong((id *)&self->_calorieUnit, a3);
}

- (HKUnit)distanceUnit
{
  return self->_distanceUnit;
}

- (void)setDistanceUnit:(id)a3
{
  objc_storeStrong((id *)&self->_distanceUnit, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_distanceUnit, 0);
  objc_storeStrong((id *)&self->_calorieUnit, 0);
  objc_storeStrong((id *)&self->_distanceSample, 0);
  objc_storeStrong((id *)&self->_caloriesSample, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end
