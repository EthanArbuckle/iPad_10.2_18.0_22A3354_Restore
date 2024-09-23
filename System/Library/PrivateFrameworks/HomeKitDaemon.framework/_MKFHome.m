@implementation _MKFHome

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("MKFHome"));
}

- (id)guestAccessCode:(id)a3 withLabel:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  _MKFHome *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  +[_MKFGuestAccessCode fetchRequest](_MKFGuestAccessCode, "fetchRequest");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("(%K == %@) AND (%K == %@) AND (%K == %@)"), CFSTR("accessCode"), v8, CFSTR("label"), v9, CFSTR("home"), self);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setPredicate:", v12);

  v23 = 0;
  objc_msgSend(v10, "executeFetchRequest:error:", v11, &v23);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v23;
  if (v13)
  {
    objc_msgSend(v13, "firstObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = (void *)MEMORY[0x227676638]();
    v17 = self;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[_MKFHome modelID](v17, "modelID");
      v22 = v16;
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v25 = v19;
      v26 = 2112;
      v27 = v8;
      v28 = 2112;
      v29 = v20;
      v30 = 2112;
      v31 = v14;
      _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch guestAccessCodes with access code %@ and  %@: %@", buf, 0x2Au);

      v16 = v22;
    }

    objc_autoreleasePoolPop(v16);
    v15 = 0;
  }

  return v15;
}

- (void)setDidOnboardEventLog:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[_MKFHome setDidOnboardMemory:](self, "setDidOnboardMemory:", v4);

}

- (id)findHomeMemberWithUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  -[_MKFHome managedObjectContext](self, "managedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "findHomeMemberWithUUID:context:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)homeMembers
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MKFHome users](self, "users");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v4);

  +[HMDCoreData featuresDataSource](HMDCoreData, "featuresDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isRestrictedGuestEnabled");

  if (v6)
  {
    -[_MKFHome guests](self, "guests");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v7);

  }
  v8 = (void *)objc_msgSend(v3, "copy");

  return v8;
}

- (id)accessoryWithModelID:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  _MKFHome *v14;
  NSObject *v15;
  void *v16;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  +[_MKFAccessory fetchRequest](_MKFAccessory, "fetchRequest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("(%K == %@) AND (%K == %@)"), CFSTR("home"), self, CFSTR("modelID"), v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPredicate:", v9);

  v18 = 0;
  objc_msgSend(v7, "executeFetchRequest:error:", v8, &v18);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v18;
  if (v10)
  {
    objc_msgSend(v10, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = (void *)MEMORY[0x227676638]();
    v14 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v20 = v16;
      v21 = 2112;
      v22 = v6;
      v23 = 2112;
      v24 = v11;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch accessories for modelID %@: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v13);
    v12 = 0;
  }

  return v12;
}

- (BOOL)residentSyncClientDidSync
{
  void *v2;
  void *v3;
  BOOL v4;

  -[_MKFHome residentSyncMetadata](self, "residentSyncMetadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastSyncTimestamp");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (BOOL)validateForInsertOrUpdate:(id *)a3
{
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)_MKFHome;
  v5 = -[_MKFModel validateForInsertOrUpdate:](&v11, sel_validateForInsertOrUpdate_);
  if (v5)
  {
    -[_MKFHome defaultRoom](self, "defaultRoom");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[_MKFHome owner](self, "owner");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        LOBYTE(v5) = 1;
        return v5;
      }
      if (a3)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "hmd_validationErrorWithDescription:managedObject:attributeName:", CFSTR("owner is required"), self, CFSTR("owner"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_9;
      }
    }
    else if (a3)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hmd_validationErrorWithDescription:", CFSTR("defaultRoom is required"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:
      v9 = v8;
      LOBYTE(v5) = 0;
      *a3 = v9;
      return v5;
    }
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (MKFHomeDatabaseID)databaseID
{
  return -[MKFObjectDatabaseID initWithMKFObject:]([MKFHomeDatabaseID alloc], "initWithMKFObject:", self);
}

- (NSArray)accessories
{
  void *v2;
  void *v3;

  -[_MKFHome valueForKey:](self, "valueForKey:", CFSTR("accessories_"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (id)materializeOrCreateAccessoriesRelationOfType:(id)a3 modelID:(id)a4 createdNew:(BOOL *)a5
{
  id v8;
  void *v9;
  void *v10;

  v8 = a4;
  NSStringFromProtocol((Protocol *)a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSManagedObject mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:](self, "mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:", CFSTR("accessories_"), v9, v8, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)createAccessoriesRelationOfType:(id)a3 modelID:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  NSStringFromProtocol((Protocol *)a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSManagedObject mkf_createRelationOnProperty:modelProtocol:keyValue:](self, "mkf_createRelationOnProperty:modelProtocol:keyValue:", CFSTR("accessories_"), v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)materializeOrCreateAccessoriesRelationOfTypeAirPlayAccessoryWithModelID:(id)a3 createdNew:(BOOL *)a4
{
  return -[NSManagedObject mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:](self, "mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:", CFSTR("accessories_"), CFSTR("MKFAirPlayAccessory"), a3, a4);
}

- (id)createAccessoriesRelationOfTypeAirPlayAccessoryWithModelID:(id)a3
{
  return -[NSManagedObject mkf_createRelationOnProperty:modelProtocol:keyValue:](self, "mkf_createRelationOnProperty:modelProtocol:keyValue:", CFSTR("accessories_"), CFSTR("MKFAirPlayAccessory"), a3);
}

- (id)findAccessoriesRelationOfTypeAirPlayAccessoryWithModelID:(id)a3
{
  return -[NSManagedObject mkf_findRelationOnProperty:modelProtocol:keyValue:](self, "mkf_findRelationOnProperty:modelProtocol:keyValue:", CFSTR("accessories_"), CFSTR("MKFAirPlayAccessory"), a3);
}

- (id)materializeOrCreateAccessoriesRelationOfTypeAppleMediaAccessoryWithModelID:(id)a3 createdNew:(BOOL *)a4
{
  return -[NSManagedObject mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:](self, "mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:", CFSTR("accessories_"), CFSTR("MKFAppleMediaAccessory"), a3, a4);
}

- (id)createAccessoriesRelationOfTypeAppleMediaAccessoryWithModelID:(id)a3
{
  return -[NSManagedObject mkf_createRelationOnProperty:modelProtocol:keyValue:](self, "mkf_createRelationOnProperty:modelProtocol:keyValue:", CFSTR("accessories_"), CFSTR("MKFAppleMediaAccessory"), a3);
}

- (id)findAccessoriesRelationOfTypeAppleMediaAccessoryWithModelID:(id)a3
{
  return -[NSManagedObject mkf_findRelationOnProperty:modelProtocol:keyValue:](self, "mkf_findRelationOnProperty:modelProtocol:keyValue:", CFSTR("accessories_"), CFSTR("MKFAppleMediaAccessory"), a3);
}

- (id)materializeOrCreateAccessoriesRelationOfTypeHAPAccessoryWithModelID:(id)a3 createdNew:(BOOL *)a4
{
  return -[NSManagedObject mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:](self, "mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:", CFSTR("accessories_"), CFSTR("MKFHAPAccessory"), a3, a4);
}

- (id)createAccessoriesRelationOfTypeHAPAccessoryWithModelID:(id)a3
{
  return -[NSManagedObject mkf_createRelationOnProperty:modelProtocol:keyValue:](self, "mkf_createRelationOnProperty:modelProtocol:keyValue:", CFSTR("accessories_"), CFSTR("MKFHAPAccessory"), a3);
}

- (id)findAccessoriesRelationOfTypeHAPAccessoryWithModelID:(id)a3
{
  return -[NSManagedObject mkf_findRelationOnProperty:modelProtocol:keyValue:](self, "mkf_findRelationOnProperty:modelProtocol:keyValue:", CFSTR("accessories_"), CFSTR("MKFHAPAccessory"), a3);
}

- (void)synchronizeAccessoriesRelationWith:(id)a3
{
  -[NSManagedObject mkf_synchronizeRelation:items:allowCreation:](self, "mkf_synchronizeRelation:items:allowCreation:", CFSTR("accessories_"), a3, 1);
}

- (NSArray)actionSets
{
  void *v2;
  void *v3;

  -[_MKFHome valueForKey:](self, "valueForKey:", CFSTR("actionSets_"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (id)materializeOrCreateActionSetsRelationWithModelID:(id)a3 createdNew:(BOOL *)a4
{
  return -[NSManagedObject mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:](self, "mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:", CFSTR("actionSets_"), CFSTR("MKFActionSet"), a3, a4);
}

- (id)findActionSetsRelationWithModelID:(id)a3
{
  return -[NSManagedObject mkf_findRelationOnProperty:modelProtocol:keyValue:](self, "mkf_findRelationOnProperty:modelProtocol:keyValue:", CFSTR("actionSets_"), CFSTR("MKFActionSet"), a3);
}

- (void)synchronizeActionSetsRelationWith:(id)a3
{
  -[NSManagedObject mkf_synchronizeRelation:items:allowCreation:](self, "mkf_synchronizeRelation:items:allowCreation:", CFSTR("actionSets_"), a3, 1);
}

- (id)materializeOrCreateApplicationDataRelation:(BOOL *)a3
{
  return -[NSManagedObject mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:](self, "mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:", CFSTR("applicationData"), CFSTR("MKFApplicationData"), 0, a3);
}

- (NSArray)guestAccessCodes
{
  void *v2;
  void *v3;

  -[_MKFHome valueForKey:](self, "valueForKey:", CFSTR("guestAccessCodes_"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (id)materializeOrCreateGuestAccessCodesRelationWithModelID:(id)a3 createdNew:(BOOL *)a4
{
  return -[NSManagedObject mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:](self, "mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:", CFSTR("guestAccessCodes_"), CFSTR("MKFGuestAccessCode"), a3, a4);
}

- (id)findGuestAccessCodesRelationWithModelID:(id)a3
{
  return -[NSManagedObject mkf_findRelationOnProperty:modelProtocol:keyValue:](self, "mkf_findRelationOnProperty:modelProtocol:keyValue:", CFSTR("guestAccessCodes_"), CFSTR("MKFGuestAccessCode"), a3);
}

- (void)addGuestAccessCodesObject:(id)a3
{
  -[NSManagedObject mkf_addToRelationship:object:](self, "mkf_addToRelationship:object:", CFSTR("guestAccessCodes_"), a3);
}

- (void)removeGuestAccessCodesObject:(id)a3
{
  -[NSManagedObject mkf_removeFromRelationship:object:](self, "mkf_removeFromRelationship:object:", CFSTR("guestAccessCodes_"), a3);
}

- (NSArray)invitations
{
  void *v2;
  void *v3;

  -[_MKFHome valueForKey:](self, "valueForKey:", CFSTR("invitations_"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (id)materializeOrCreateInvitationsRelationWithModelID:(id)a3 createdNew:(BOOL *)a4
{
  return -[NSManagedObject mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:](self, "mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:", CFSTR("invitations_"), CFSTR("MKFOutgoingInvitation"), a3, a4);
}

- (id)findInvitationsRelationWithModelID:(id)a3
{
  return -[NSManagedObject mkf_findRelationOnProperty:modelProtocol:keyValue:](self, "mkf_findRelationOnProperty:modelProtocol:keyValue:", CFSTR("invitations_"), CFSTR("MKFOutgoingInvitation"), a3);
}

- (void)synchronizeInvitationsRelationWith:(id)a3
{
  -[NSManagedObject mkf_synchronizeRelation:items:allowCreation:](self, "mkf_synchronizeRelation:items:allowCreation:", CFSTR("invitations_"), a3, 1);
}

- (NSArray)matterControllerLocalKeyValuePairs
{
  void *v2;
  void *v3;

  -[_MKFHome valueForKey:](self, "valueForKey:", CFSTR("matterControllerLocalKeyValuePairs_"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (id)materializeOrCreateMatterControllerLocalKeyValuePairsRelationWithKey:(id)a3 createdNew:(BOOL *)a4
{
  return -[NSManagedObject mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:](self, "mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:", CFSTR("matterControllerLocalKeyValuePairs_"), CFSTR("MKFMatterLocalKeyValuePair"), a3, a4);
}

- (id)findMatterControllerLocalKeyValuePairsRelationWithKey:(id)a3
{
  return -[NSManagedObject mkf_findRelationOnProperty:modelProtocol:keyValue:](self, "mkf_findRelationOnProperty:modelProtocol:keyValue:", CFSTR("matterControllerLocalKeyValuePairs_"), CFSTR("MKFMatterLocalKeyValuePair"), a3);
}

- (void)addMatterControllerLocalKeyValuePairsObject:(id)a3
{
  -[NSManagedObject mkf_addToRelationship:object:](self, "mkf_addToRelationship:object:", CFSTR("matterControllerLocalKeyValuePairs_"), a3);
}

- (void)removeMatterControllerLocalKeyValuePairsObject:(id)a3
{
  -[NSManagedObject mkf_removeFromRelationship:object:](self, "mkf_removeFromRelationship:object:", CFSTR("matterControllerLocalKeyValuePairs_"), a3);
}

- (NSArray)networkProtectionGroups
{
  void *v2;
  void *v3;

  -[_MKFHome valueForKey:](self, "valueForKey:", CFSTR("networkProtectionGroups_"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (id)materializeOrCreateNetworkProtectionGroupsRelation:(BOOL *)a3
{
  return -[NSManagedObject mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:](self, "mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:", CFSTR("networkProtectionGroups_"), CFSTR("MKFAccessoryNetworkProtectionGroup"), 0, a3);
}

- (NSArray)persons
{
  void *v2;
  void *v3;

  -[_MKFHome valueForKey:](self, "valueForKey:", CFSTR("persons_"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (id)materializeOrCreatePersonsRelationWithModelID:(id)a3 createdNew:(BOOL *)a4
{
  return -[NSManagedObject mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:](self, "mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:", CFSTR("persons_"), CFSTR("MKFHomePerson"), a3, a4);
}

- (id)findPersonsRelationWithModelID:(id)a3
{
  return -[NSManagedObject mkf_findRelationOnProperty:modelProtocol:keyValue:](self, "mkf_findRelationOnProperty:modelProtocol:keyValue:", CFSTR("persons_"), CFSTR("MKFHomePerson"), a3);
}

- (void)addPersonsObject:(id)a3
{
  -[NSManagedObject mkf_addToRelationship:object:](self, "mkf_addToRelationship:object:", CFSTR("persons_"), a3);
}

- (void)removePersonsObject:(id)a3
{
  -[NSManagedObject mkf_removeFromRelationship:object:](self, "mkf_removeFromRelationship:object:", CFSTR("persons_"), a3);
}

- (NSArray)removedAccessCodes
{
  void *v2;
  void *v3;

  -[_MKFHome valueForKey:](self, "valueForKey:", CFSTR("removedAccessCodes_"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (id)materializeOrCreateRemovedAccessCodesRelationWithModelID:(id)a3 createdNew:(BOOL *)a4
{
  return -[NSManagedObject mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:](self, "mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:", CFSTR("removedAccessCodes_"), CFSTR("MKFRemovedUserAccessCode"), a3, a4);
}

- (id)findRemovedAccessCodesRelationWithModelID:(id)a3
{
  return -[NSManagedObject mkf_findRelationOnProperty:modelProtocol:keyValue:](self, "mkf_findRelationOnProperty:modelProtocol:keyValue:", CFSTR("removedAccessCodes_"), CFSTR("MKFRemovedUserAccessCode"), a3);
}

- (void)addRemovedAccessCodesObject:(id)a3
{
  -[NSManagedObject mkf_addToRelationship:object:](self, "mkf_addToRelationship:object:", CFSTR("removedAccessCodes_"), a3);
}

- (void)removeRemovedAccessCodesObject:(id)a3
{
  -[NSManagedObject mkf_removeFromRelationship:object:](self, "mkf_removeFromRelationship:object:", CFSTR("removedAccessCodes_"), a3);
}

- (NSArray)residentSelections
{
  void *v2;
  void *v3;

  -[_MKFHome valueForKey:](self, "valueForKey:", CFSTR("residentSelections_"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (id)materializeOrCreateResidentSelectionsRelationWithModelID:(id)a3 createdNew:(BOOL *)a4
{
  return -[NSManagedObject mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:](self, "mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:", CFSTR("residentSelections_"), CFSTR("MKFResidentSelection"), a3, a4);
}

- (id)findResidentSelectionsRelationWithModelID:(id)a3
{
  return -[NSManagedObject mkf_findRelationOnProperty:modelProtocol:keyValue:](self, "mkf_findRelationOnProperty:modelProtocol:keyValue:", CFSTR("residentSelections_"), CFSTR("MKFResidentSelection"), a3);
}

- (void)addResidentSelectionsObject:(id)a3
{
  -[NSManagedObject mkf_addToRelationship:object:](self, "mkf_addToRelationship:object:", CFSTR("residentSelections_"), a3);
}

- (void)removeResidentSelectionsObject:(id)a3
{
  -[NSManagedObject mkf_removeFromRelationship:object:](self, "mkf_removeFromRelationship:object:", CFSTR("residentSelections_"), a3);
}

- (NSArray)residents
{
  void *v2;
  void *v3;

  -[_MKFHome valueForKey:](self, "valueForKey:", CFSTR("residents_"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (id)materializeOrCreateResidentsRelationWithModelID:(id)a3 createdNew:(BOOL *)a4
{
  return -[NSManagedObject mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:](self, "mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:", CFSTR("residents_"), CFSTR("MKFResident"), a3, a4);
}

- (id)findResidentsRelationWithModelID:(id)a3
{
  return -[NSManagedObject mkf_findRelationOnProperty:modelProtocol:keyValue:](self, "mkf_findRelationOnProperty:modelProtocol:keyValue:", CFSTR("residents_"), CFSTR("MKFResident"), a3);
}

- (void)addResidentsObject:(id)a3
{
  -[NSManagedObject mkf_addToRelationship:object:](self, "mkf_addToRelationship:object:", CFSTR("residents_"), a3);
}

- (void)removeResidentsObject:(id)a3
{
  -[NSManagedObject mkf_removeFromRelationship:object:](self, "mkf_removeFromRelationship:object:", CFSTR("residents_"), a3);
}

- (NSArray)rooms
{
  void *v2;
  void *v3;

  -[_MKFHome valueForKey:](self, "valueForKey:", CFSTR("rooms_"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (id)materializeOrCreateRoomsRelationWithModelID:(id)a3 createdNew:(BOOL *)a4
{
  return -[NSManagedObject mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:](self, "mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:", CFSTR("rooms_"), CFSTR("MKFRoom"), a3, a4);
}

- (id)findRoomsRelationWithModelID:(id)a3
{
  return -[NSManagedObject mkf_findRelationOnProperty:modelProtocol:keyValue:](self, "mkf_findRelationOnProperty:modelProtocol:keyValue:", CFSTR("rooms_"), CFSTR("MKFRoom"), a3);
}

- (void)synchronizeRoomsRelationWith:(id)a3
{
  -[NSManagedObject mkf_synchronizeRelation:items:allowCreation:](self, "mkf_synchronizeRelation:items:allowCreation:", CFSTR("rooms_"), a3, 1);
}

- (NSArray)serviceGroups
{
  void *v2;
  void *v3;

  -[_MKFHome valueForKey:](self, "valueForKey:", CFSTR("serviceGroups_"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (id)materializeOrCreateServiceGroupsRelationWithModelID:(id)a3 createdNew:(BOOL *)a4
{
  return -[NSManagedObject mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:](self, "mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:", CFSTR("serviceGroups_"), CFSTR("MKFServiceGroup"), a3, a4);
}

- (id)findServiceGroupsRelationWithModelID:(id)a3
{
  return -[NSManagedObject mkf_findRelationOnProperty:modelProtocol:keyValue:](self, "mkf_findRelationOnProperty:modelProtocol:keyValue:", CFSTR("serviceGroups_"), CFSTR("MKFServiceGroup"), a3);
}

- (void)synchronizeServiceGroupsRelationWith:(id)a3
{
  -[NSManagedObject mkf_synchronizeRelation:items:allowCreation:](self, "mkf_synchronizeRelation:items:allowCreation:", CFSTR("serviceGroups_"), a3, 1);
}

- (NSArray)settings
{
  void *v2;
  void *v3;

  -[_MKFHome valueForKey:](self, "valueForKey:", CFSTR("settings_"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (id)materializeOrCreateSettingsRelationOfTypeHomeMediaSetting:(BOOL *)a3
{
  return -[NSManagedObject mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:](self, "mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:", CFSTR("settings_"), CFSTR("MKFHomeMediaSetting"), 0, a3);
}

- (id)findSettingsRelationOfTypeHomeMediaSetting
{
  return -[NSManagedObject mkf_findRelationOnProperty:modelProtocol:keyValue:](self, "mkf_findRelationOnProperty:modelProtocol:keyValue:", CFSTR("settings_"), CFSTR("MKFHomeMediaSetting"), 0);
}

- (id)materializeOrCreateSettingsRelationOfTypeHomeNetworkRouterManagingDeviceSetting:(BOOL *)a3
{
  return -[NSManagedObject mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:](self, "mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:", CFSTR("settings_"), CFSTR("MKFHomeNetworkRouterManagingDeviceSetting"), 0, a3);
}

- (id)findSettingsRelationOfTypeHomeNetworkRouterManagingDeviceSetting
{
  return -[NSManagedObject mkf_findRelationOnProperty:modelProtocol:keyValue:](self, "mkf_findRelationOnProperty:modelProtocol:keyValue:", CFSTR("settings_"), CFSTR("MKFHomeNetworkRouterManagingDeviceSetting"), 0);
}

- (id)materializeOrCreateSettingsRelationOfTypeHomeNetworkRouterSetting:(BOOL *)a3
{
  return -[NSManagedObject mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:](self, "mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:", CFSTR("settings_"), CFSTR("MKFHomeNetworkRouterSetting"), 0, a3);
}

- (id)findSettingsRelationOfTypeHomeNetworkRouterSetting
{
  return -[NSManagedObject mkf_findRelationOnProperty:modelProtocol:keyValue:](self, "mkf_findRelationOnProperty:modelProtocol:keyValue:", CFSTR("settings_"), CFSTR("MKFHomeNetworkRouterSetting"), 0);
}

- (id)materializeOrCreateSettingsRelationOfTypeHomePersonManagerSetting:(BOOL *)a3
{
  return -[NSManagedObject mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:](self, "mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:", CFSTR("settings_"), CFSTR("MKFHomePersonManagerSetting"), 0, a3);
}

- (id)findSettingsRelationOfTypeHomePersonManagerSetting
{
  return -[NSManagedObject mkf_findRelationOnProperty:modelProtocol:keyValue:](self, "mkf_findRelationOnProperty:modelProtocol:keyValue:", CFSTR("settings_"), CFSTR("MKFHomePersonManagerSetting"), 0);
}

- (id)materializeOrCreateSettingsRelationOfTypeHomeSoftwareUpdateSetting:(BOOL *)a3
{
  return -[NSManagedObject mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:](self, "mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:", CFSTR("settings_"), CFSTR("MKFHomeSoftwareUpdateSetting"), 0, a3);
}

- (id)findSettingsRelationOfTypeHomeSoftwareUpdateSetting
{
  return -[NSManagedObject mkf_findRelationOnProperty:modelProtocol:keyValue:](self, "mkf_findRelationOnProperty:modelProtocol:keyValue:", CFSTR("settings_"), CFSTR("MKFHomeSoftwareUpdateSetting"), 0);
}

- (id)materializeOrCreateThreadNetworkRelation:(BOOL *)a3
{
  return -[NSManagedObject mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:](self, "mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:", CFSTR("threadNetwork"), CFSTR("MKFHomeThreadNetwork"), 0, a3);
}

- (NSArray)triggers
{
  void *v2;
  void *v3;

  -[_MKFHome valueForKey:](self, "valueForKey:", CFSTR("triggers_"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (id)materializeOrCreateTriggersRelationOfType:(id)a3 modelID:(id)a4 createdNew:(BOOL *)a5
{
  id v8;
  void *v9;
  void *v10;

  v8 = a4;
  NSStringFromProtocol((Protocol *)a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSManagedObject mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:](self, "mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:", CFSTR("triggers_"), v9, v8, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)createTriggersRelationOfType:(id)a3 modelID:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  NSStringFromProtocol((Protocol *)a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSManagedObject mkf_createRelationOnProperty:modelProtocol:keyValue:](self, "mkf_createRelationOnProperty:modelProtocol:keyValue:", CFSTR("triggers_"), v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)materializeOrCreateTriggersRelationOfTypeEventTriggerWithModelID:(id)a3 createdNew:(BOOL *)a4
{
  return -[NSManagedObject mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:](self, "mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:", CFSTR("triggers_"), CFSTR("MKFEventTrigger"), a3, a4);
}

- (id)createTriggersRelationOfTypeEventTriggerWithModelID:(id)a3
{
  return -[NSManagedObject mkf_createRelationOnProperty:modelProtocol:keyValue:](self, "mkf_createRelationOnProperty:modelProtocol:keyValue:", CFSTR("triggers_"), CFSTR("MKFEventTrigger"), a3);
}

- (id)findTriggersRelationOfTypeEventTriggerWithModelID:(id)a3
{
  return -[NSManagedObject mkf_findRelationOnProperty:modelProtocol:keyValue:](self, "mkf_findRelationOnProperty:modelProtocol:keyValue:", CFSTR("triggers_"), CFSTR("MKFEventTrigger"), a3);
}

- (id)materializeOrCreateTriggersRelationOfTypeTimerTriggerWithModelID:(id)a3 createdNew:(BOOL *)a4
{
  return -[NSManagedObject mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:](self, "mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:", CFSTR("triggers_"), CFSTR("MKFTimerTrigger"), a3, a4);
}

- (id)createTriggersRelationOfTypeTimerTriggerWithModelID:(id)a3
{
  return -[NSManagedObject mkf_createRelationOnProperty:modelProtocol:keyValue:](self, "mkf_createRelationOnProperty:modelProtocol:keyValue:", CFSTR("triggers_"), CFSTR("MKFTimerTrigger"), a3);
}

- (id)findTriggersRelationOfTypeTimerTriggerWithModelID:(id)a3
{
  return -[NSManagedObject mkf_findRelationOnProperty:modelProtocol:keyValue:](self, "mkf_findRelationOnProperty:modelProtocol:keyValue:", CFSTR("triggers_"), CFSTR("MKFTimerTrigger"), a3);
}

- (void)synchronizeTriggersRelationWith:(id)a3
{
  -[NSManagedObject mkf_synchronizeRelation:items:allowCreation:](self, "mkf_synchronizeRelation:items:allowCreation:", CFSTR("triggers_"), a3, 1);
}

- (NSArray)users
{
  void *v2;
  void *v3;

  -[_MKFHome valueForKey:](self, "valueForKey:", CFSTR("users_"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (id)materializeOrCreateUsersRelationWithModelID:(id)a3 createdNew:(BOOL *)a4
{
  return -[NSManagedObject mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:](self, "mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:", CFSTR("users_"), CFSTR("MKFUser"), a3, a4);
}

- (id)findUsersRelationWithModelID:(id)a3
{
  return -[NSManagedObject mkf_findRelationOnProperty:modelProtocol:keyValue:](self, "mkf_findRelationOnProperty:modelProtocol:keyValue:", CFSTR("users_"), CFSTR("MKFUser"), a3);
}

- (void)synchronizeUsersRelationWith:(id)a3
{
  -[NSManagedObject mkf_synchronizeRelation:items:allowCreation:](self, "mkf_synchronizeRelation:items:allowCreation:", CFSTR("users_"), a3, 1);
}

- (NSArray)zones
{
  void *v2;
  void *v3;

  -[_MKFHome valueForKey:](self, "valueForKey:", CFSTR("zones_"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (id)materializeOrCreateZonesRelationWithModelID:(id)a3 createdNew:(BOOL *)a4
{
  return -[NSManagedObject mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:](self, "mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:", CFSTR("zones_"), CFSTR("MKFZone"), a3, a4);
}

- (id)findZonesRelationWithModelID:(id)a3
{
  return -[NSManagedObject mkf_findRelationOnProperty:modelProtocol:keyValue:](self, "mkf_findRelationOnProperty:modelProtocol:keyValue:", CFSTR("zones_"), CFSTR("MKFZone"), a3);
}

- (void)synchronizeZonesRelationWith:(id)a3
{
  -[NSManagedObject mkf_synchronizeRelation:items:allowCreation:](self, "mkf_synchronizeRelation:items:allowCreation:", CFSTR("zones_"), a3, 1);
}

- (NSArray)guests
{
  void *v2;
  void *v3;

  -[_MKFHome valueForKey:](self, "valueForKey:", CFSTR("guests_"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (id)materializeOrCreateGuestsRelationWithModelID:(id)a3 createdNew:(BOOL *)a4
{
  return -[NSManagedObject mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:](self, "mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:", CFSTR("guests_"), CFSTR("MKFGuest"), a3, a4);
}

- (id)findGuestsRelationWithModelID:(id)a3
{
  return -[NSManagedObject mkf_findRelationOnProperty:modelProtocol:keyValue:](self, "mkf_findRelationOnProperty:modelProtocol:keyValue:", CFSTR("guests_"), CFSTR("MKFGuest"), a3);
}

- (void)addGuestsObject:(id)a3
{
  -[NSManagedObject mkf_addToRelationship:object:](self, "mkf_addToRelationship:object:", CFSTR("guests_"), a3);
}

- (void)removeGuestsObject:(id)a3
{
  -[NSManagedObject mkf_removeFromRelationship:object:](self, "mkf_removeFromRelationship:object:", CFSTR("guests_"), a3);
}

+ (id)findHomeMemberWithUUID:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  int v11;
  void *v12;

  v5 = a3;
  v6 = a4;
  +[_MKFModel modelWithModelID:context:](_MKFUser, "modelWithModelID:context:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    +[HMDCoreData featuresDataSource](HMDCoreData, "featuresDataSource");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isRestrictedGuestEnabled");

    if (!v11)
    {
      v12 = 0;
      goto LABEL_7;
    }
    +[_MKFModel modelWithModelID:context:](_MKFGuest, "modelWithModelID:context:", v5, v6);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12 = v9;
LABEL_7:

  return v12;
}

+ (id)findHomeMemberUsingReverseShareID:(id)a3 homeModelID:(id)a4 context:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  int v14;
  void *v15;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  +[_MKFUser findUserUsingReverseShareID:homeModelID:context:](_MKFUser, "findUserUsingReverseShareID:homeModelID:context:", v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    v12 = v10;
  }
  else
  {
    +[HMDCoreData featuresDataSource](HMDCoreData, "featuresDataSource");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isRestrictedGuestEnabled");

    if (!v14)
    {
      v15 = 0;
      goto LABEL_7;
    }
    +[_MKFGuest findGuestUsingReverseShareID:homeModelID:context:](_MKFGuest, "findGuestUsingReverseShareID:homeModelID:context:", v7, v8, v9);
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  v15 = v12;
LABEL_7:

  return v15;
}

+ (Protocol)backingModelProtocol
{
  return (Protocol *)&unk_2557D65F0;
}

- (void)residentSyncContextualizeConditions:(id)a3 userContext:(id)a4
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  int v9;
  void *v10;
  id v11;

  v11 = a3;
  v5 = a4;
  if (objc_msgSend(v5, "targetIsResident"))
    objc_msgSend(v11, "addCondition:", CFSTR("resident"));
  objc_msgSend(v5, "targetUser");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isOwner");

  if (v7)
    objc_msgSend(v11, "addCondition:", CFSTR("owner"));
  objc_msgSend(v5, "targetUser");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isOwnerOrAdmin");

  if (v9)
    objc_msgSend(v11, "addCondition:", CFSTR("admin"));
  objc_msgSend(v5, "targetDeviceAddress");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    objc_msgSend(v11, "addCondition:", CFSTR("fetch"));

}

+ (Class)cd_modelClass
{
  return (Class)objc_opt_class();
}

- (void)willSave
{
  void *v3;
  int v4;
  void *v5;
  int v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  void *v28;
  unsigned int v29;
  uint64_t v30;
  void *v31;
  _MKFHome *v32;
  uint64_t v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  objc_super v39;
  _BYTE v40[128];
  _QWORD v41[4];

  v41[2] = *MEMORY[0x24BDAC8D0];
  v39.receiver = self;
  v39.super_class = (Class)_MKFHome;
  -[_MKFModel willSave](&v39, sel_willSave);
  +[HMDCoreData featuresDataSource](HMDCoreData, "featuresDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isRestrictedGuestEnabled");

  if (v4
    && ((-[_MKFHome isUpdated](self, "isUpdated") & 1) != 0 || -[_MKFHome isInserted](self, "isInserted")))
  {
    -[_MKFHome owned](self, "owned");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "BOOLValue");

    if (v6)
    {
      -[_MKFHome managedObjectContext](self, "managedObjectContext");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "hmd_transactionAuthor");

      if (v8 <= 0xB && ((1 << v8) & 0xC58) != 0)
      {
        -[_MKFHome changedValues](self, "changedValues");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "count"))
        {
          objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("accessories_"));
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          if (v10)
          {
            -[_MKFHome accessories](self, "accessories");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = objc_msgSend(v11, "count");

            -[_MKFHome numberOfCameras](self, "numberOfCameras");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = v13;
            if (v12)
            {
              v34 = v9;
              v33 = objc_msgSend(v13, "unsignedIntValue");

              +[HMDHAPMetadata getSharedInstance](HMDHAPMetadata, "getSharedInstance");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = (void *)MEMORY[0x24BDBCF20];
              v17 = *MEMORY[0x24BDD49E8];
              v41[0] = *MEMORY[0x24BDD4A78];
              v41[1] = v17;
              objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v41, 2);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "setWithArray:", v18);
              v19 = (void *)objc_claimAutoreleasedReturnValue();

              v37 = 0u;
              v38 = 0u;
              v35 = 0u;
              v36 = 0u;
              v32 = self;
              -[_MKFHome accessories](self, "accessories");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
              if (v21)
              {
                v22 = v21;
                v23 = 0;
                v24 = *(_QWORD *)v36;
                do
                {
                  for (i = 0; i != v22; ++i)
                  {
                    if (*(_QWORD *)v36 != v24)
                      objc_enumerationMutation(v20);
                    objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * i), "accessoryCategory");
                    v26 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v15, "categoryForIdentifier:", v26);
                    v27 = (void *)objc_claimAutoreleasedReturnValue();

                    objc_msgSend(v27, "uuidStr");
                    v28 = (void *)objc_claimAutoreleasedReturnValue();
                    v29 = objc_msgSend(v19, "containsObject:", v28);

                    v23 += v29;
                  }
                  v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
                }
                while (v22);
              }
              else
              {
                v23 = 0;
              }

              if (v23 != v33)
              {
                objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v23);
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                -[_MKFHome setNumberOfCameras:](v32, "setNumberOfCameras:", v31);

              }
              v9 = v34;
            }
            else
            {
              v30 = objc_msgSend(v13, "isEqualToNumber:", &unk_24E96D418);

              if ((v30 & 1) == 0)
                -[_MKFHome setNumberOfCameras:](self, "setNumberOfCameras:", &unk_24E96D418);
            }
          }
        }

      }
    }
  }
}

@end
