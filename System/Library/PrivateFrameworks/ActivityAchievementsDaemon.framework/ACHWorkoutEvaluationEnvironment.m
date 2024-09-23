@implementation ACHWorkoutEvaluationEnvironment

- (ACHWorkoutEvaluationEnvironment)initWithWorkout:(id)a3 numberOfFirstPartyWorkoutsOver5MinutesWithType:(unint64_t)a4 numberOfFirstPartyWorkoutsOver5MinutesDuringCurrentFitnessWeek:(unint64_t)a5 bestKilocaloriesForType:(double)a6 bestKilometersForType:(double)a7 bestElevationGainedForType:(double)a8 best5KDuration:(double)a9 best10KDuration:(double)a10 bestWheelchair5KDuration:(double)a11 bestWheelchair10KDuration:(double)a12 bestHalfMarathonDuration:(double)a13 bestMarathonDuration:(double)a14 bestWheelchairHalfMarathonDuration:(double)a15 bestWheelchairMarathonDuration:(double)a16 experienceType:(unint64_t)a17 isMetricLocale:(BOOL)a18
{
  id v31;
  ACHWorkoutEvaluationEnvironment *v32;
  ACHWorkoutEvaluationWorkoutProperties *v33;
  ACHWorkoutEvaluationWorkoutProperties *workout;
  objc_super v36;

  v31 = a3;
  v36.receiver = self;
  v36.super_class = (Class)ACHWorkoutEvaluationEnvironment;
  v32 = -[ACHWorkoutEvaluationEnvironment init](&v36, sel_init);
  if (v32)
  {
    v33 = -[ACHWorkoutEvaluationWorkoutProperties initWithWorkout:]([ACHWorkoutEvaluationWorkoutProperties alloc], "initWithWorkout:", v31);
    workout = v32->_workout;
    v32->_workout = v33;

    v32->_numberOfFirstPartyWorkoutsOver5MinutesWithType = a4;
    v32->_numberOfFirstPartyWorkoutsOver5MinutesDuringCurrentFitnessWeek = a5;
    v32->_numberOfFirstPartyWorkoutsOver15MinutesWithType = 0;
    v32->_numberOfFirstPartyWorkoutsOver15MinutesDuringCurrentFitnessWeek = 0;
    v32->_bestKilocaloriesForType = a6;
    v32->_bestKilometersForType = a7;
    v32->_bestElevationGainedForType = a8;
    v32->_best5KDuration = a9;
    v32->_best10KDuration = a10;
    v32->_bestWheelchair5KDuration = a11;
    v32->_bestWheelchair10KDuration = a12;
    v32->_bestHalfMarathonDuration = a13;
    v32->_bestMarathonDuration = a14;
    v32->_bestWheelchairHalfMarathonDuration = a15;
    v32->_bestWheelchairMarathonDuration = a16;
    v32->_experienceType = a17;
    v32->_isMetricLocale = a18;
  }

  return v32;
}

- (id)valueForUndefinedKey:(id)a3
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a3;
  ACHLogWorkouts();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    -[ACHWorkoutEvaluationEnvironment valueForUndefinedKey:].cold.1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);

  return 0;
}

- (ACHWorkoutEvaluationWorkoutProperties)workout
{
  return self->_workout;
}

- (unint64_t)numberOfFirstPartyWorkoutsOver5MinutesWithType
{
  return self->_numberOfFirstPartyWorkoutsOver5MinutesWithType;
}

- (unint64_t)numberOfFirstPartyWorkoutsOver5MinutesDuringCurrentFitnessWeek
{
  return self->_numberOfFirstPartyWorkoutsOver5MinutesDuringCurrentFitnessWeek;
}

- (unint64_t)numberOfFirstPartyWorkoutsOver15MinutesWithType
{
  return self->_numberOfFirstPartyWorkoutsOver15MinutesWithType;
}

- (unint64_t)numberOfFirstPartyWorkoutsOver15MinutesDuringCurrentFitnessWeek
{
  return self->_numberOfFirstPartyWorkoutsOver15MinutesDuringCurrentFitnessWeek;
}

- (double)bestKilocaloriesForType
{
  return self->_bestKilocaloriesForType;
}

- (double)bestKilometersForType
{
  return self->_bestKilometersForType;
}

- (double)bestElevationGainedForType
{
  return self->_bestElevationGainedForType;
}

- (double)best5KDuration
{
  return self->_best5KDuration;
}

- (double)best10KDuration
{
  return self->_best10KDuration;
}

- (double)bestWheelchair5KDuration
{
  return self->_bestWheelchair5KDuration;
}

- (double)bestWheelchair10KDuration
{
  return self->_bestWheelchair10KDuration;
}

- (double)bestHalfMarathonDuration
{
  return self->_bestHalfMarathonDuration;
}

- (double)bestMarathonDuration
{
  return self->_bestMarathonDuration;
}

- (double)bestWheelchairHalfMarathonDuration
{
  return self->_bestWheelchairHalfMarathonDuration;
}

- (double)bestWheelchairMarathonDuration
{
  return self->_bestWheelchairMarathonDuration;
}

- (unint64_t)experienceType
{
  return self->_experienceType;
}

- (BOOL)isMetricLocale
{
  return self->_isMetricLocale;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workout, 0);
}

- (void)valueForUndefinedKey:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_21407B000, a2, a3, "Workout Evaluation environment asked for key it doesn't support: %{public}@", a5, a6, a7, a8, 2u);
}

@end
