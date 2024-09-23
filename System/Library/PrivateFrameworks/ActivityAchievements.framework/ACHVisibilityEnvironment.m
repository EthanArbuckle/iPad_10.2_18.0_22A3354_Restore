@implementation ACHVisibilityEnvironment

- (void)setPrerequisiteMet:(BOOL)a3
{
  self->_prerequisiteMet = a3;
}

- (void)setIsWheelchairUser:(BOOL)a3
{
  self->_isWheelchairUser = a3;
}

- (void)setIsStandalonePhoneFitnessMode:(BOOL)a3
{
  self->_isStandalonePhoneFitnessMode = a3;
}

- (void)setExperienceType:(unint64_t)a3
{
  self->_experienceType = a3;
}

- (void)setEarnedInstanceCount:(int64_t)a3
{
  self->_earnedInstanceCount = a3;
}

- (void)setActivityMoveMode:(int64_t)a3
{
  self->_activityMoveMode = a3;
}

- (BOOL)isStandalonePhoneFitnessMode
{
  return self->_isStandalonePhoneFitnessMode;
}

- (BOOL)prerequisiteMet
{
  return self->_prerequisiteMet;
}

- (int64_t)activityMoveMode
{
  return self->_activityMoveMode;
}

- (int64_t)earnedInstanceCount
{
  return self->_earnedInstanceCount;
}

- (id)valueForUndefinedKey:(id)a3
{
  id v3;
  NSObject *v4;

  v3 = a3;
  ACHLogDefault();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    -[ACHVisibilityEnvironment valueForUndefinedKey:].cold.1((uint64_t)v3, v4);

  return 0;
}

- (unint64_t)experienceType
{
  return self->_experienceType;
}

- (BOOL)isWheelchairUser
{
  return self->_isWheelchairUser;
}

- (void)valueForUndefinedKey:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_fault_impl(&dword_214029000, a2, OS_LOG_TYPE_FAULT, "Visibility environment asked for key it doesn't support: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
