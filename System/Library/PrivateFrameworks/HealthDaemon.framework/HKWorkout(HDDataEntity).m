@implementation HKWorkout(HDDataEntity)

- (BOOL)hd_insertRelatedDataWithPersistentID:()HDDataEntity insertionContext:profile:transaction:error:
{
  id v12;
  id v13;
  _BOOL8 v14;
  objc_super v16;

  v12 = a3;
  v13 = a6;
  v16.receiver = a1;
  v16.super_class = (Class)&off_1EF2252E8;
  if (objc_msgSendSuper2(&v16, sel_hd_insertRelatedDataWithPersistentID_insertionContext_profile_transaction_error_, v12, a4, a5, v13, a7))v14 = +[HDWorkoutEventEntity insertWorkoutEventsFromWorkout:ownerID:transaction:error:](HDWorkoutEventEntity, "insertWorkoutEventsFromWorkout:ownerID:transaction:error:", a1, v12, v13, a7);
  else
    v14 = 0;

  return v14;
}

@end
