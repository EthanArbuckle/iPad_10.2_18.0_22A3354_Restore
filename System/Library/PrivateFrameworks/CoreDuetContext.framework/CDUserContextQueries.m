@implementation CDUserContextQueries

void __53___CDUserContextQueries_keyPathForUserIsAsleepStatus__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[_CDContextualKeyPath keyPathWithKey:isUserCentric:](_CDContextualKeyPath, "keyPathWithKey:isUserCentric:", CFSTR("/isAsleep"), 1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)keyPathForUserIsAsleepStatus_userIsAsleepStatus;
  keyPathForUserIsAsleepStatus_userIsAsleepStatus = v0;

}

void __53___CDUserContextQueries_keyPathForUserIsAtHomeStatus__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[_CDContextualKeyPath keyPathWithKey:isUserCentric:](_CDContextualKeyPath, "keyPathWithKey:isUserCentric:", CFSTR("/atHome"), 1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)keyPathForUserIsAtHomeStatus_userIsAtHomeStatus;
  keyPathForUserIsAtHomeStatus_userIsAtHomeStatus = v0;

}

void __53___CDUserContextQueries_keyPathForUserIsAtWorkStatus__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[_CDContextualKeyPath keyPathWithKey:isUserCentric:](_CDContextualKeyPath, "keyPathWithKey:isUserCentric:", CFSTR("/atWork"), 1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)keyPathForUserIsAtWorkStatus_userIsAtHomeStatus;
  keyPathForUserIsAtWorkStatus_userIsAtHomeStatus = v0;

}

void __54___CDUserContextQueries_keyPathForUserIsDrivingStatus__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[_CDContextualKeyPath keyPathWithKey:isUserCentric:](_CDContextualKeyPath, "keyPathWithKey:isUserCentric:", CFSTR("/isDriving"), 1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)keyPathForUserIsDrivingStatus_userIsAtHomeStatus;
  keyPathForUserIsDrivingStatus_userIsAtHomeStatus = v0;

}

void __56___CDUserContextQueries_keyPathForUserIsTravelingStatus__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[_CDContextualKeyPath keyPathWithKey:isUserCentric:](_CDContextualKeyPath, "keyPathWithKey:isUserCentric:", CFSTR("/isTraveling"), 1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)keyPathForUserIsTravelingStatus_userIsAtHomeStatus;
  keyPathForUserIsTravelingStatus_userIsAtHomeStatus = v0;

}

void __58___CDUserContextQueries_keyPathForUserIsLeavingHomeStatus__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[_CDContextualKeyPath keyPathWithKey:isUserCentric:](_CDContextualKeyPath, "keyPathWithKey:isUserCentric:", CFSTR("/isLeavingHome"), 1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)keyPathForUserIsLeavingHomeStatus_userIsAtHomeStatus;
  keyPathForUserIsLeavingHomeStatus_userIsAtHomeStatus = v0;

}

void __61___CDUserContextQueries_keyPathForUserIsArrivingAtHomeStatus__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[_CDContextualKeyPath keyPathWithKey:isUserCentric:](_CDContextualKeyPath, "keyPathWithKey:isUserCentric:", CFSTR("/isArrivingHome"), 1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)keyPathForUserIsArrivingAtHomeStatus_userIsAtHomeStatus;
  keyPathForUserIsArrivingAtHomeStatus_userIsAtHomeStatus = v0;

}

@end
