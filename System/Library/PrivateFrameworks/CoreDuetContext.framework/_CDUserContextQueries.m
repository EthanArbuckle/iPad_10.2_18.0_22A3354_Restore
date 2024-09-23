@implementation _CDUserContextQueries

+ (id)userNextPreferredDevice
{
  return +[_CDDevice localDevice](_CDDevice, "localDevice");
}

+ (id)keyPathForUserIsAsleepStatus
{
  if (keyPathForUserIsAsleepStatus_onceToken != -1)
    dispatch_once(&keyPathForUserIsAsleepStatus_onceToken, &__block_literal_global_22);
  return (id)keyPathForUserIsAsleepStatus_userIsAsleepStatus;
}

+ (id)keyPathForUserIsAtHomeStatus
{
  if (keyPathForUserIsAtHomeStatus_onceToken != -1)
    dispatch_once(&keyPathForUserIsAtHomeStatus_onceToken, &__block_literal_global_15);
  return (id)keyPathForUserIsAtHomeStatus_userIsAtHomeStatus;
}

+ (id)predicateForUserIsAtHomeStatus:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  +[_CDUserContextQueries keyPathForUserIsAtHomeStatus](_CDUserContextQueries, "keyPathForUserIsAtHomeStatus");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[_CDContextualPredicate predicateForKeyPath:equalToValue:](_CDContextualPredicate, "predicateForKeyPath:equalToValue:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)keyPathForUserIsAtWorkStatus
{
  if (keyPathForUserIsAtWorkStatus_onceToken != -1)
    dispatch_once(&keyPathForUserIsAtWorkStatus_onceToken, &__block_literal_global_19);
  return (id)keyPathForUserIsAtWorkStatus_userIsAtHomeStatus;
}

+ (id)keyPathForUserIsDrivingStatus
{
  if (keyPathForUserIsDrivingStatus_onceToken != -1)
    dispatch_once(&keyPathForUserIsDrivingStatus_onceToken, &__block_literal_global_20);
  return (id)keyPathForUserIsDrivingStatus_userIsAtHomeStatus;
}

+ (id)keyPathForUserIsTravelingStatus
{
  if (keyPathForUserIsTravelingStatus_onceToken != -1)
    dispatch_once(&keyPathForUserIsTravelingStatus_onceToken, &__block_literal_global_21_0);
  return (id)keyPathForUserIsTravelingStatus_userIsAtHomeStatus;
}

+ (id)keyPathForUserIsLeavingHomeStatus
{
  if (keyPathForUserIsLeavingHomeStatus_onceToken != -1)
    dispatch_once(&keyPathForUserIsLeavingHomeStatus_onceToken, &__block_literal_global_22);
  return (id)keyPathForUserIsLeavingHomeStatus_userIsAtHomeStatus;
}

+ (id)keyPathForUserIsArrivingAtHomeStatus
{
  if (keyPathForUserIsArrivingAtHomeStatus_onceToken != -1)
    dispatch_once(&keyPathForUserIsArrivingAtHomeStatus_onceToken, &__block_literal_global_23);
  return (id)keyPathForUserIsArrivingAtHomeStatus_userIsAtHomeStatus;
}

@end
