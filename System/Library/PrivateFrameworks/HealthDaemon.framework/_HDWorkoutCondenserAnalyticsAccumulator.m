@implementation _HDWorkoutCondenserAnalyticsAccumulator

- (_HDWorkoutCondenserAnalyticsAccumulator)init
{
  _HDWorkoutCondenserAnalyticsAccumulator *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_HDWorkoutCondenserAnalyticsAccumulator;
  result = -[_HDWorkoutCondenserAnalyticsAccumulator init](&v3, sel_init);
  if (result)
  {
    result->_hasProcessedWorkout = 0;
    *(_OWORD *)&result->_workoutsToCondense = 0u;
    *(_OWORD *)&result->_condensedWorkouts = 0u;
    *(_OWORD *)&result->_createdSeries = 0u;
  }
  return result;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)_HDWorkoutCondenserAnalyticsAccumulator;
  -[_HDWorkoutCondenserAnalyticsAccumulator description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ workoutsToCondense (%ld) workoutsToRecondense (%ld) condensedWorkouts (%ld) processedWorkouts (%ld) createdSeries (%ld) deletedSamples (%ld)>"), v4, self->_workoutsToCondense, self->_workoutsToRecondense, self->_condensedWorkouts, self->_processedWorkouts, self->_createdSeries, self->_deletedSamples);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
