@implementation _MKFActionSet

+ (Class)cd_modelClass
{
  return (Class)objc_opt_class();
}

- (BOOL)shouldIncludeForRestrictedGuestWithContext:(id)a3
{
  return 0;
}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("MKFActionSet"));
}

+ (id)modelIDForParentRelationshipTo:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v5 = (void *)MEMORY[0x24BDBCE88];
  v6 = *MEMORY[0x24BDBCAB0];
  v7 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v9, 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v10);
}

+ (NSPredicate)homeRelation
{
  if (homeRelation__hmf_once_t0_190316 != -1)
    dispatch_once(&homeRelation__hmf_once_t0_190316, &__block_literal_global_190317);
  return (NSPredicate *)(id)homeRelation__hmf_once_v1_190318;
}

+ (Protocol)backingModelProtocol
{
  return (Protocol *)&unk_2558748D0;
}

- (MKFActionSetDatabaseID)databaseID
{
  return -[MKFObjectDatabaseID initWithMKFObject:]([MKFActionSetDatabaseID alloc], "initWithMKFObject:", self);
}

- (NSArray)actions
{
  void *v2;
  void *v3;

  -[_MKFActionSet valueForKey:](self, "valueForKey:", CFSTR("actions_"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (id)materializeOrCreateActionsRelationOfType:(id)a3 modelID:(id)a4 createdNew:(BOOL *)a5
{
  id v8;
  void *v9;
  void *v10;

  v8 = a4;
  NSStringFromProtocol((Protocol *)a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSManagedObject mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:](self, "mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:", CFSTR("actions_"), v9, v8, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)createActionsRelationOfType:(id)a3 modelID:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  NSStringFromProtocol((Protocol *)a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSManagedObject mkf_createRelationOnProperty:modelProtocol:keyValue:](self, "mkf_createRelationOnProperty:modelProtocol:keyValue:", CFSTR("actions_"), v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)materializeOrCreateActionsRelationOfTypeAppleMediaAccessoryPowerActionWithModelID:(id)a3 createdNew:(BOOL *)a4
{
  return -[NSManagedObject mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:](self, "mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:", CFSTR("actions_"), CFSTR("MKFAppleMediaAccessoryPowerAction"), a3, a4);
}

- (id)createActionsRelationOfTypeAppleMediaAccessoryPowerActionWithModelID:(id)a3
{
  return -[NSManagedObject mkf_createRelationOnProperty:modelProtocol:keyValue:](self, "mkf_createRelationOnProperty:modelProtocol:keyValue:", CFSTR("actions_"), CFSTR("MKFAppleMediaAccessoryPowerAction"), a3);
}

- (id)findActionsRelationOfTypeAppleMediaAccessoryPowerActionWithModelID:(id)a3
{
  return -[NSManagedObject mkf_findRelationOnProperty:modelProtocol:keyValue:](self, "mkf_findRelationOnProperty:modelProtocol:keyValue:", CFSTR("actions_"), CFSTR("MKFAppleMediaAccessoryPowerAction"), a3);
}

- (id)materializeOrCreateActionsRelationOfTypeCharacteristicWriteActionWithModelID:(id)a3 createdNew:(BOOL *)a4
{
  return -[NSManagedObject mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:](self, "mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:", CFSTR("actions_"), CFSTR("MKFCharacteristicWriteAction"), a3, a4);
}

- (id)createActionsRelationOfTypeCharacteristicWriteActionWithModelID:(id)a3
{
  return -[NSManagedObject mkf_createRelationOnProperty:modelProtocol:keyValue:](self, "mkf_createRelationOnProperty:modelProtocol:keyValue:", CFSTR("actions_"), CFSTR("MKFCharacteristicWriteAction"), a3);
}

- (id)findActionsRelationOfTypeCharacteristicWriteActionWithModelID:(id)a3
{
  return -[NSManagedObject mkf_findRelationOnProperty:modelProtocol:keyValue:](self, "mkf_findRelationOnProperty:modelProtocol:keyValue:", CFSTR("actions_"), CFSTR("MKFCharacteristicWriteAction"), a3);
}

- (id)materializeOrCreateActionsRelationOfTypeMediaPlaybackActionWithModelID:(id)a3 createdNew:(BOOL *)a4
{
  return -[NSManagedObject mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:](self, "mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:", CFSTR("actions_"), CFSTR("MKFMediaPlaybackAction"), a3, a4);
}

- (id)createActionsRelationOfTypeMediaPlaybackActionWithModelID:(id)a3
{
  return -[NSManagedObject mkf_createRelationOnProperty:modelProtocol:keyValue:](self, "mkf_createRelationOnProperty:modelProtocol:keyValue:", CFSTR("actions_"), CFSTR("MKFMediaPlaybackAction"), a3);
}

- (id)findActionsRelationOfTypeMediaPlaybackActionWithModelID:(id)a3
{
  return -[NSManagedObject mkf_findRelationOnProperty:modelProtocol:keyValue:](self, "mkf_findRelationOnProperty:modelProtocol:keyValue:", CFSTR("actions_"), CFSTR("MKFMediaPlaybackAction"), a3);
}

- (id)materializeOrCreateActionsRelationOfTypeNaturalLightingActionWithModelID:(id)a3 createdNew:(BOOL *)a4
{
  return -[NSManagedObject mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:](self, "mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:", CFSTR("actions_"), CFSTR("MKFNaturalLightingAction"), a3, a4);
}

- (id)createActionsRelationOfTypeNaturalLightingActionWithModelID:(id)a3
{
  return -[NSManagedObject mkf_createRelationOnProperty:modelProtocol:keyValue:](self, "mkf_createRelationOnProperty:modelProtocol:keyValue:", CFSTR("actions_"), CFSTR("MKFNaturalLightingAction"), a3);
}

- (id)findActionsRelationOfTypeNaturalLightingActionWithModelID:(id)a3
{
  return -[NSManagedObject mkf_findRelationOnProperty:modelProtocol:keyValue:](self, "mkf_findRelationOnProperty:modelProtocol:keyValue:", CFSTR("actions_"), CFSTR("MKFNaturalLightingAction"), a3);
}

- (id)materializeOrCreateActionsRelationOfTypeShortcutActionWithModelID:(id)a3 createdNew:(BOOL *)a4
{
  return -[NSManagedObject mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:](self, "mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:", CFSTR("actions_"), CFSTR("MKFShortcutAction"), a3, a4);
}

- (id)createActionsRelationOfTypeShortcutActionWithModelID:(id)a3
{
  return -[NSManagedObject mkf_createRelationOnProperty:modelProtocol:keyValue:](self, "mkf_createRelationOnProperty:modelProtocol:keyValue:", CFSTR("actions_"), CFSTR("MKFShortcutAction"), a3);
}

- (id)findActionsRelationOfTypeShortcutActionWithModelID:(id)a3
{
  return -[NSManagedObject mkf_findRelationOnProperty:modelProtocol:keyValue:](self, "mkf_findRelationOnProperty:modelProtocol:keyValue:", CFSTR("actions_"), CFSTR("MKFShortcutAction"), a3);
}

- (void)synchronizeActionsRelationWith:(id)a3
{
  -[NSManagedObject mkf_synchronizeRelation:items:allowCreation:](self, "mkf_synchronizeRelation:items:allowCreation:", CFSTR("actions_"), a3, 1);
}

- (id)materializeOrCreateApplicationDataRelation:(BOOL *)a3
{
  return -[NSManagedObject mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:](self, "mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:", CFSTR("applicationData"), CFSTR("MKFApplicationData"), 0, a3);
}

- (NSArray)notificationRegistrations
{
  void *v2;
  void *v3;

  -[_MKFActionSet valueForKey:](self, "valueForKey:", CFSTR("notificationRegistrations_"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSArray)triggers
{
  void *v2;
  void *v3;

  -[_MKFActionSet valueForKey:](self, "valueForKey:", CFSTR("triggers_"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

@end
