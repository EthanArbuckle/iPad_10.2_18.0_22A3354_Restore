@implementation CRKFeatures

+ (id)allClassroomCRKFeatures
{
  if (allClassroomCRKFeatures_onceToken != -1)
    dispatch_once(&allClassroomCRKFeatures_onceToken, &__block_literal_global_52);
  return (id)allClassroomCRKFeatures_allClassroomCRKFeatures;
}

void __38__CRKFeatures_allClassroomCRKFeatures__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v0 = (void *)MEMORY[0x24BDBCF20];
  +[CRKRestrictions classroomLockDeviceAllowed](CRKRestrictions, "classroomLockDeviceAllowed");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  +[CRKRestrictions classroomOpenAppAllowed](CRKRestrictions, "classroomOpenAppAllowed");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  +[CRKRestrictions classroomScreenObservationAllowed](CRKRestrictions, "classroomScreenObservationAllowed");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithObjects:", v5, v1, v2, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)allClassroomCRKFeatures_allClassroomCRKFeatures;
  allClassroomCRKFeatures_allClassroomCRKFeatures = v3;

}

+ (id)allClassroomTopLevelRestrictions
{
  if (allClassroomTopLevelRestrictions_onceToken != -1)
    dispatch_once(&allClassroomTopLevelRestrictions_onceToken, &__block_literal_global_2_3);
  return (id)allClassroomTopLevelRestrictions_allClassroomTopLevelRestrictions;
}

void __47__CRKFeatures_allClassroomTopLevelRestrictions__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v0 = (void *)MEMORY[0x24BDBCF20];
  +[CRKRestrictions remoteScreenObservationAllowed](CRKRestrictions, "remoteScreenObservationAllowed");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  +[CRKRestrictions screenShotAllowed](CRKRestrictions, "screenShotAllowed");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  +[CRKRestrictions classroomAutomaticallyJoinClassesForced](CRKRestrictions, "classroomAutomaticallyJoinClassesForced");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[CRKRestrictions classroomRequestPermissionToLeaveClassesForced](CRKRestrictions, "classroomRequestPermissionToLeaveClassesForced");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[CRKRestrictions classroomUnpromptedAppAndDeviceLockForced](CRKRestrictions, "classroomUnpromptedAppAndDeviceLockForced");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[CRKRestrictions classroomUnpromptedScreenObservationForced](CRKRestrictions, "classroomUnpromptedScreenObservationForced");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithObjects:", v8, v1, v2, v3, v4, v5, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)allClassroomTopLevelRestrictions_allClassroomTopLevelRestrictions;
  allClassroomTopLevelRestrictions_allClassroomTopLevelRestrictions = v6;

}

@end
