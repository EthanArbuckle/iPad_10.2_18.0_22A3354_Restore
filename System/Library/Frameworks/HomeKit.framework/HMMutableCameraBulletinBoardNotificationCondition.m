@implementation HMMutableCameraBulletinBoardNotificationCondition

- (id)copyWithZone:(_NSZone *)a3
{
  HMCameraBulletinBoardNotificationCondition *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = objc_alloc_init(HMCameraBulletinBoardNotificationCondition);
  -[HMCameraBulletinBoardNotificationCondition significantEventReasonCondition](self, "significantEventReasonCondition");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMCameraBulletinBoardNotificationCondition setSignificantEventReasonCondition:](v4, "setSignificantEventReasonCondition:", v5);

  -[HMCameraBulletinBoardNotificationCondition significantEventPersonFamiliarityCondition](self, "significantEventPersonFamiliarityCondition");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMCameraBulletinBoardNotificationCondition setSignificantEventPersonFamiliarityCondition:](v4, "setSignificantEventPersonFamiliarityCondition:", v6);

  -[HMCameraBulletinBoardNotificationCondition dateComponentsPredicate](self, "dateComponentsPredicate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMCameraBulletinBoardNotificationCondition setDateComponentsPredicate:](v4, "setDateComponentsPredicate:", v7);

  -[HMCameraBulletinBoardNotificationCondition presencePredicate](self, "presencePredicate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMCameraBulletinBoardNotificationCondition setPresencePredicate:](v4, "setPresencePredicate:", v8);

  return v4;
}

@end
