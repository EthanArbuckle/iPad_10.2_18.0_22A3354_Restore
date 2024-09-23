@implementation CRKFeatureDataStore_iOS

- (unint64_t)effectiveBoolValueForSetting:(id)a3 outAsk:(BOOL *)a4
{
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;

  v5 = (void *)MEMORY[0x24BE63CB0];
  v6 = a3;
  objc_msgSend(v5, "sharedConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "effectiveBoolValueForSetting:outAsk:", v6, a4);

  return objc_msgSend((id)objc_opt_class(), "crkBoolTypeFromMCBoolType:", v8);
}

- (void)setBoolValue:(BOOL)a3 ask:(BOOL)a4 forSetting:(id)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  void *v7;
  id v8;
  id v9;

  v5 = a4;
  v6 = a3;
  v7 = (void *)MEMORY[0x24BE63CB0];
  v8 = a5;
  objc_msgSend(v7, "sharedConnection");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBoolValue:ask:forSetting:passcode:", v6, v5, v8, 0);

}

- (unint64_t)BOOLRestrictionForFeature:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;

  v3 = (void *)MEMORY[0x24BE63CB0];
  v4 = a3;
  objc_msgSend(v3, "sharedConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLRestrictionForFeature:", v4);

  return objc_msgSend((id)objc_opt_class(), "crkBoolTypeFromMCBoolType:", v6);
}

- (unint64_t)effectiveValueForSetting:(id)a3 configurationUUID:(id)a4 outAsk:(BOOL *)a5
{
  void *v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;

  v7 = (void *)MEMORY[0x24BE63CB0];
  v8 = a4;
  v9 = a3;
  objc_msgSend(v7, "sharedConnection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "effectiveBoolValueForSetting:configurationUUID:outAsk:", v9, v8, a5);

  return objc_msgSend((id)objc_opt_class(), "crkBoolTypeFromMCBoolType:", v11);
}

- (void)setBoolValue:(BOOL)a3 ask:(BOOL)a4 forSetting:(id)a5 configurationUUID:(id)a6
{
  _BOOL8 v7;
  _BOOL8 v8;
  void *v9;
  id v10;
  id v11;
  id v12;

  v7 = a4;
  v8 = a3;
  v9 = (void *)MEMORY[0x24BE63CB0];
  v10 = a6;
  v11 = a5;
  objc_msgSend(v9, "sharedConnection");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setBoolValue:ask:forSetting:configurationUUID:toSystem:user:passcode:", v8, v7, v11, v10, 0, 1, 0);

}

- (BOOL)isClassroomUnpromptedScreenObservationForced
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isClassroomUnpromptedScreenObservationForced");

  return v3;
}

- (BOOL)isClassroomAutomaticClassJoiningForced
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isClassroomAutomaticClassJoiningForced");

  return v3;
}

- (BOOL)isClassroomRequestPermissionToLeaveClassesForced
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isClassroomRequestPermissionToLeaveClassesForced");

  return v3;
}

- (BOOL)isClassroomStudentRoleEnabled
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isClassroomStudentRoleEnabled");

  return v3;
}

- (void)setClassroomStudentRoleEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClassroomStudentRoleEnabled:", v3);

}

- (BOOL)isClassroomInstructorRoleEnabled
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isClassroomInstructorRoleEnabled");

  return v3;
}

- (void)setClassroomInstructorRoleEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClassroomInstructorRoleEnabled:", v3);

}

- (NSSet)activeClassroomRoles
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activeClassroomRoles");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v3;
}

+ (unint64_t)crkBoolTypeFromMCBoolType:(int)a3
{
  if (a3 == 2)
    return 2;
  else
    return a3 == 1;
}

+ (CRKFeatureDataStoreProtocol)sharedDataStore
{
  return +[CRKPlatformFeatureDataStore sharedDataStore](CRKPlatformFeatureDataStore, "sharedDataStore");
}

@end
