@implementation _MKFAccessory

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
  if (homeRelation__hmf_once_t0_20990 != -1)
    dispatch_once(&homeRelation__hmf_once_t0_20990, &__block_literal_global_20991);
  return (NSPredicate *)(id)homeRelation__hmf_once_v1_20992;
}

+ (Protocol)backingModelProtocol
{
  return (Protocol *)&unk_2557AE758;
}

- (BOOL)hasRGCapableService
{
  return 0;
}

- (MKFAccessoryDatabaseID)databaseID
{
  return -[MKFObjectDatabaseID initWithMKFObject:]([MKFAccessoryDatabaseID alloc], "initWithMKFObject:", self);
}

- (NSArray)actionMediaPlaybacks
{
  void *v2;
  void *v3;

  -[_MKFAccessory valueForKey:](self, "valueForKey:", CFSTR("actionMediaPlaybacks_"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSArray)analysisEventBulletinRegistrations
{
  void *v2;
  void *v3;

  -[_MKFAccessory valueForKey:](self, "valueForKey:", CFSTR("analysisEventBulletinRegistrations_"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (id)materializeOrCreateApplicationDataRelation:(BOOL *)a3
{
  return -[NSManagedObject mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:](self, "mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:", CFSTR("applicationData"), CFSTR("MKFApplicationData"), 0, a3);
}

- (NSArray)cameraAccessModeBulletinRegistrations
{
  void *v2;
  void *v3;

  -[_MKFAccessory valueForKey:](self, "valueForKey:", CFSTR("cameraAccessModeBulletinRegistrations_"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSArray)cameraReachabilityBulletinRegistrations
{
  void *v2;
  void *v3;

  -[_MKFAccessory valueForKey:](self, "valueForKey:", CFSTR("cameraReachabilityBulletinRegistrations_"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSArray)cameraSignificantEventBulletinRegistrations
{
  void *v2;
  void *v3;

  -[_MKFAccessory valueForKey:](self, "valueForKey:", CFSTR("cameraSignificantEventBulletinRegistrations_"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSArray)hostedAccessories
{
  void *v2;
  void *v3;

  -[_MKFAccessory valueForKey:](self, "valueForKey:", CFSTR("hostedAccessories_"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)addHostedAccessoriesObject:(id)a3
{
  -[NSManagedObject mkf_addToRelationship:object:](self, "mkf_addToRelationship:object:", CFSTR("hostedAccessories_"), a3);
}

- (void)removeHostedAccessoriesObject:(id)a3
{
  -[NSManagedObject mkf_removeFromRelationship:object:](self, "mkf_removeFromRelationship:object:", CFSTR("hostedAccessories_"), a3);
}

- (NSArray)mediaPropertyNotificationRegistrations
{
  void *v2;
  void *v3;

  -[_MKFAccessory valueForKey:](self, "valueForKey:", CFSTR("mediaPropertyNotificationRegistrations_"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (id)materializeOrCreateSoftwareUpdateRelation:(BOOL *)a3
{
  return -[NSManagedObject mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:](self, "mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:", CFSTR("softwareUpdate"), CFSTR("MKFSoftwareUpdate"), 0, a3);
}

- (NSArray)usersWithListeningHistoryEnabled
{
  void *v2;
  void *v3;

  -[_MKFAccessory valueForKey:](self, "valueForKey:", CFSTR("usersWithListeningHistoryEnabled_"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)addUsersWithListeningHistoryEnabledObject:(id)a3
{
  -[NSManagedObject mkf_addToRelationship:object:](self, "mkf_addToRelationship:object:", CFSTR("usersWithListeningHistoryEnabled_"), a3);
}

- (void)removeUsersWithListeningHistoryEnabledObject:(id)a3
{
  -[NSManagedObject mkf_removeFromRelationship:object:](self, "mkf_removeFromRelationship:object:", CFSTR("usersWithListeningHistoryEnabled_"), a3);
}

- (NSArray)usersWithMediaContentProfileEnabled
{
  void *v2;
  void *v3;

  -[_MKFAccessory valueForKey:](self, "valueForKey:", CFSTR("usersWithMediaContentProfileEnabled_"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)addUsersWithMediaContentProfileEnabledObject:(id)a3
{
  -[NSManagedObject mkf_addToRelationship:object:](self, "mkf_addToRelationship:object:", CFSTR("usersWithMediaContentProfileEnabled_"), a3);
}

- (void)removeUsersWithMediaContentProfileEnabledObject:(id)a3
{
  -[NSManagedObject mkf_removeFromRelationship:object:](self, "mkf_removeFromRelationship:object:", CFSTR("usersWithMediaContentProfileEnabled_"), a3);
}

- (NSArray)usersWithPersonalRequestsEnabled
{
  void *v2;
  void *v3;

  -[_MKFAccessory valueForKey:](self, "valueForKey:", CFSTR("usersWithPersonalRequestsEnabled_"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)addUsersWithPersonalRequestsEnabledObject:(id)a3
{
  -[NSManagedObject mkf_addToRelationship:object:](self, "mkf_addToRelationship:object:", CFSTR("usersWithPersonalRequestsEnabled_"), a3);
}

- (void)removeUsersWithPersonalRequestsEnabledObject:(id)a3
{
  -[NSManagedObject mkf_removeFromRelationship:object:](self, "mkf_removeFromRelationship:object:", CFSTR("usersWithPersonalRequestsEnabled_"), a3);
}

- (NSArray)allowedGuests
{
  void *v2;
  void *v3;

  -[_MKFAccessory valueForKey:](self, "valueForKey:", CFSTR("allowedGuests_"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (id)materializeOrCreateAllowedGuestsRelationWithModelID:(id)a3 createdNew:(BOOL *)a4
{
  return -[NSManagedObject mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:](self, "mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:", CFSTR("allowedGuests_"), CFSTR("MKFGuest"), a3, a4);
}

- (id)findAllowedGuestsRelationWithModelID:(id)a3
{
  return -[NSManagedObject mkf_findRelationOnProperty:modelProtocol:keyValue:](self, "mkf_findRelationOnProperty:modelProtocol:keyValue:", CFSTR("allowedGuests_"), CFSTR("MKFGuest"), a3);
}

- (void)addAllowedGuestsObject:(id)a3
{
  -[NSManagedObject mkf_addToRelationship:object:](self, "mkf_addToRelationship:object:", CFSTR("allowedGuests_"), a3);
}

- (void)removeAllowedGuestsObject:(id)a3
{
  -[NSManagedObject mkf_removeFromRelationship:object:](self, "mkf_removeFromRelationship:object:", CFSTR("allowedGuests_"), a3);
}

- (NSArray)outgoingInvitations
{
  void *v2;
  void *v3;

  -[_MKFAccessory valueForKey:](self, "valueForKey:", CFSTR("outgoingInvitations_"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (id)materializeOrCreateOutgoingInvitationsRelationWithModelID:(id)a3 createdNew:(BOOL *)a4
{
  return -[NSManagedObject mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:](self, "mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:", CFSTR("outgoingInvitations_"), CFSTR("MKFOutgoingInvitation"), a3, a4);
}

- (id)findOutgoingInvitationsRelationWithModelID:(id)a3
{
  return -[NSManagedObject mkf_findRelationOnProperty:modelProtocol:keyValue:](self, "mkf_findRelationOnProperty:modelProtocol:keyValue:", CFSTR("outgoingInvitations_"), CFSTR("MKFOutgoingInvitation"), a3);
}

- (void)addOutgoingInvitationsObject:(id)a3
{
  -[NSManagedObject mkf_addToRelationship:object:](self, "mkf_addToRelationship:object:", CFSTR("outgoingInvitations_"), a3);
}

- (void)removeOutgoingInvitationsObject:(id)a3
{
  -[NSManagedObject mkf_removeFromRelationship:object:](self, "mkf_removeFromRelationship:object:", CFSTR("outgoingInvitations_"), a3);
}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("MKFAccessory"));
}

- (BOOL)shouldIncludeForRestrictedGuestWithContext:(id)a3
{
  id v4;
  _MKFAccessory *v5;
  _MKFAccessory *v6;
  _MKFAccessory *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = a3;
  if (-[_MKFAccessory hasRGCapableService](self, "hasRGCapableService"))
  {
    v5 = self;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
    v7 = v6;

    if (v7)
    {
      objc_msgSend(v4, "targetUser");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "allowedAccessories");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "containsObject:", v7);

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (Class)cd_modelClass
{
  return (Class)objc_opt_class();
}

@end
