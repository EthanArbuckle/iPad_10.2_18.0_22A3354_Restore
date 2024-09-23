@implementation CRKFeatureDataStore_MCX

- (CRKFeatureDataStore_MCX)initWithMCXPrimitives:(id)a3
{
  id v5;
  CRKFeatureDataStore_MCX *v6;
  CRKFeatureDataStoreHeuristics_MCX *v7;
  CRKFeatureDataStoreHeuristics_MCX *heuristicsManager;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CRKFeatureDataStore_MCX;
  v6 = -[CRKFeatureDataStore_MCX init](&v10, sel_init);
  if (v6)
  {
    v7 = -[CRKFeatureDataStoreHeuristics_MCX initWithDataStore:]([CRKFeatureDataStoreHeuristics_MCX alloc], "initWithDataStore:", v6);
    heuristicsManager = v6->_heuristicsManager;
    v6->_heuristicsManager = v7;

    objc_storeStrong((id *)&v6->_MCXPrimitives, a3);
    -[CRKFeatureDataStore_MCX removeDuplicateEntriesFromStoredClassroomRoles](v6, "removeDuplicateEntriesFromStoredClassroomRoles");
  }

  return v6;
}

- (unint64_t)effectiveBoolValueForSetting:(id)a3 outAsk:(BOOL *)a4
{
  return -[CRKFeatureDataStore_MCX effectiveValueForSetting:configurationUUID:outAsk:](self, "effectiveValueForSetting:configurationUUID:outAsk:", a3, 0, a4);
}

- (void)setBoolValue:(BOOL)a3 ask:(BOOL)a4 forSetting:(id)a5
{
  -[CRKFeatureDataStore_MCX setBoolValue:ask:forSetting:configurationUUID:](self, "setBoolValue:ask:forSetting:configurationUUID:", a3, a4, a5, 0);
}

- (unint64_t)BOOLRestrictionForFeature:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;

  v4 = a3;
  v5 = -[CRKFeatureDataStore_MCX isFeatureForced:](self, "isFeatureForced:", v4);
  -[CRKFeatureDataStore_MCX heuristicsManager](self, "heuristicsManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = objc_msgSend(v6, "applyIsForcedHeuristicsToFeature:isForced:", v4, v5);

  if ((_DWORD)v5)
    v7 = -[CRKFeatureDataStore_MCX effectiveValueForSetting:configurationUUID:outAsk:](self, "effectiveValueForSetting:configurationUUID:outAsk:", v4, 0, 0);
  else
    v7 = 0;

  return v7;
}

- (unint64_t)effectiveValueForSetting:(id)a3 configurationUUID:(id)a4 outAsk:(BOOL *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  BOOL v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  unint64_t v20;

  v8 = a3;
  v9 = a4;
  if (a5)
  {
    -[CRKFeatureDataStore_MCX keyForFeature:configurationUUID:ask:](self, "keyForFeature:configurationUUID:ask:", v8, v9, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRKFeatureDataStore_MCX MCXPrimitives](self, "MCXPrimitives");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "numberForKey:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_msgSend(MEMORY[0x24BDD16E0], "crk_featureBoolTypeFromNumber:", v12);
    if (v13)
      v14 = v13 == 1;
    else
      v14 = +[CRKFeatureDataStoreDefaults_MCX defaultAskValueForFeature:](CRKFeatureDataStoreDefaults_MCX, "defaultAskValueForFeature:", v8);
    *a5 = v14;

  }
  -[CRKFeatureDataStore_MCX keyForFeature:configurationUUID:ask:](self, "keyForFeature:configurationUUID:ask:", v8, v9, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKFeatureDataStore_MCX MCXPrimitives](self, "MCXPrimitives");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "numberForKey:", v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = objc_msgSend(MEMORY[0x24BDD16E0], "crk_featureBoolTypeFromNumber:", v17);
  if (!v18)
    v18 = +[CRKFeatureDataStoreDefaults_MCX defaultValueForFeature:](CRKFeatureDataStoreDefaults_MCX, "defaultValueForFeature:", v8);
  -[CRKFeatureDataStore_MCX heuristicsManager](self, "heuristicsManager");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "applyHeuristicsToFeature:BOOLType:", v8, v18);

  return v20;
}

- (void)setBoolValue:(BOOL)a3 ask:(BOOL)a4 forSetting:(id)a5 configurationUUID:(id)a6
{
  _BOOL8 v7;
  _BOOL8 v8;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v7 = a4;
  v8 = a3;
  v10 = a6;
  v11 = a5;
  -[CRKFeatureDataStore_MCX keyForFeature:configurationUUID:ask:](self, "keyForFeature:configurationUUID:ask:", v11, v10, 0);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  -[CRKFeatureDataStore_MCX MCXPrimitives](self, "MCXPrimitives");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setNumber:forKey:", v13, v17);

  -[CRKFeatureDataStore_MCX keyForFeature:configurationUUID:ask:](self, "keyForFeature:configurationUUID:ask:", v11, v10, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[CRKFeatureDataStore_MCX MCXPrimitives](self, "MCXPrimitives");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setNumber:forKey:", v16, v14);

}

- (BOOL)isClassroomUnpromptedScreenObservationForced
{
  void *v3;

  +[CRKRestrictions classroomUnpromptedScreenObservationForced](CRKRestrictions, "classroomUnpromptedScreenObservationForced");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[CRKFeatureDataStore_MCX BOOLRestrictionForFeature:](self, "BOOLRestrictionForFeature:", v3) == 1;

  return (char)self;
}

- (BOOL)isClassroomAutomaticClassJoiningForced
{
  void *v3;

  +[CRKRestrictions classroomAutomaticallyJoinClassesForced](CRKRestrictions, "classroomAutomaticallyJoinClassesForced");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[CRKFeatureDataStore_MCX BOOLRestrictionForFeature:](self, "BOOLRestrictionForFeature:", v3) == 1;

  return (char)self;
}

- (BOOL)isClassroomRequestPermissionToLeaveClassesForced
{
  void *v3;

  +[CRKRestrictions classroomRequestPermissionToLeaveClassesForced](CRKRestrictions, "classroomRequestPermissionToLeaveClassesForced");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[CRKFeatureDataStore_MCX BOOLRestrictionForFeature:](self, "BOOLRestrictionForFeature:", v3) == 1;

  return (char)self;
}

- (BOOL)isClassroomStudentRoleEnabled
{
  return -[CRKFeatureDataStore_MCX isRoleEnabled:](self, "isRoleEnabled:", CFSTR("student"));
}

- (void)setClassroomStudentRoleEnabled:(BOOL)a3
{
  -[CRKFeatureDataStore_MCX setRole:enabled:](self, "setRole:enabled:", CFSTR("student"), a3);
}

- (BOOL)isClassroomInstructorRoleEnabled
{
  return -[CRKFeatureDataStore_MCX isRoleEnabled:](self, "isRoleEnabled:", CFSTR("instructor"));
}

- (void)setClassroomInstructorRoleEnabled:(BOOL)a3
{
  -[CRKFeatureDataStore_MCX setRole:enabled:](self, "setRole:enabled:", CFSTR("instructor"), a3);
}

- (NSSet)activeClassroomRoles
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  -[CRKFeatureDataStore_MCX MCXPrimitives](self, "MCXPrimitives");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[CRKRestrictions classroomRoles](CRKRestrictions, "classroomRoles");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayForKey:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  v6 = (void *)MEMORY[0x24BDBD1A8];
  if (v4)
    v6 = (void *)v4;
  v7 = v6;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v8;
}

- (BOOL)isFeatureForced:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[CRKFeatureDataStore_MCX MCXPrimitives](self, "MCXPrimitives");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isKeyUserModifiable:", v4);

  return v6 ^ 1;
}

- (void)setActiveClassroomRoles:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(v7, "allObjects");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  -[CRKFeatureDataStore_MCX MCXPrimitives](self, "MCXPrimitives");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[CRKRestrictions classroomRoles](CRKRestrictions, "classroomRoles");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setArray:forKey:", v4, v6);

}

- (void)addActiveClassroomRole:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[CRKFeatureDataStore_MCX activeClassroomRoles](self, "activeClassroomRoles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v6, "addObject:", v4);
  -[CRKFeatureDataStore_MCX setActiveClassroomRoles:](self, "setActiveClassroomRoles:", v6);

}

- (void)removeActiveClassroomRole:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[CRKFeatureDataStore_MCX activeClassroomRoles](self, "activeClassroomRoles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v6, "removeObject:", v4);
  -[CRKFeatureDataStore_MCX setActiveClassroomRoles:](self, "setActiveClassroomRoles:", v6);

}

- (BOOL)isRoleEnabled:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[CRKFeatureDataStore_MCX activeClassroomRoles](self, "activeClassroomRoles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

- (void)setRole:(id)a3 enabled:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  char v7;
  id v8;

  v4 = a4;
  v8 = a3;
  -[CRKFeatureDataStore_MCX activeClassroomRoles](self, "activeClassroomRoles");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", v8);
  if (v4)
  {
    if ((v7 & 1) == 0)
    {
      -[CRKFeatureDataStore_MCX addActiveClassroomRole:](self, "addActiveClassroomRole:", v8);
LABEL_6:
      notify_post((const char *)objc_msgSend(CFSTR("CRKStudentEnrollmentStatusDidChangeNotification"), "UTF8String"));
    }
  }
  else if ((v7 & 1) != 0)
  {
    -[CRKFeatureDataStore_MCX removeActiveClassroomRole:](self, "removeActiveClassroomRole:", v8);
    goto LABEL_6;
  }

}

- (id)keyForFeature:(id)a3 configurationUUID:(id)a4 ask:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = a5;
  v7 = a4;
  v8 = a3;
  v9 = (void *)objc_opt_new();
  objc_msgSend(v9, "appendString:", v8);

  if (objc_msgSend(v7, "length"))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), CFSTR("-"), v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "appendString:", v10);

  }
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ask"), CFSTR("-"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "appendString:", v11);

  }
  return v9;
}

- (void)removeDuplicateEntriesFromStoredClassroomRoles
{
  id v3;

  -[CRKFeatureDataStore_MCX activeClassroomRoles](self, "activeClassroomRoles");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[CRKFeatureDataStore_MCX setActiveClassroomRoles:](self, "setActiveClassroomRoles:", v3);

}

- (CRKMCXPrimitives)MCXPrimitives
{
  return self->_MCXPrimitives;
}

- (CRKFeatureDataStoreHeuristics_MCX)heuristicsManager
{
  return self->_heuristicsManager;
}

- (void)setHeuristicsManager:(id)a3
{
  objc_storeStrong((id *)&self->_heuristicsManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heuristicsManager, 0);
  objc_storeStrong((id *)&self->_MCXPrimitives, 0);
}

@end
