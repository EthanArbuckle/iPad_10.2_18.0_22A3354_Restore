@implementation ACHWorkoutProgressEvaluationEnvironment

- (ACHWorkoutProgressEvaluationEnvironment)initWithNumberOfFirstPartyWorkoutsOver5MinutesDuringCurrentFitnessWeek:(unint64_t)a3
{
  ACHWorkoutProgressEvaluationEnvironment *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ACHWorkoutProgressEvaluationEnvironment;
  result = -[ACHWorkoutProgressEvaluationEnvironment init](&v5, sel_init);
  if (result)
  {
    result->_numberOfFirstPartyWorkoutsOver5MinutesDuringCurrentFitnessWeek = a3;
    result->_numberOfFirstPartyWorkoutsOver15MinutesDuringCurrentFitnessWeek = 0;
  }
  return result;
}

- (unint64_t)numberOfFirstPartyWorkoutsOver5MinutesDuringCurrentFitnessWeek
{
  return self->_numberOfFirstPartyWorkoutsOver5MinutesDuringCurrentFitnessWeek;
}

- (id)valueForUndefinedKey:(id)a3
{
  id v3;
  NSObject *v4;

  v3 = a3;
  ACHLogWorkouts();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    -[ACHWorkoutProgressEvaluationEnvironment valueForUndefinedKey:].cold.1((uint64_t)v3, v4);

  return 0;
}

- (unint64_t)numberOfFirstPartyWorkoutsOver15MinutesDuringCurrentFitnessWeek
{
  return self->_numberOfFirstPartyWorkoutsOver15MinutesDuringCurrentFitnessWeek;
}

- (void)valueForUndefinedKey:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_fault_impl(&dword_21407B000, a2, OS_LOG_TYPE_FAULT, "Workout Progress Evaluation environment asked for key it doesn't support: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
