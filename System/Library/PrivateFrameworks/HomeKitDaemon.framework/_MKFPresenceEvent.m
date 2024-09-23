@implementation _MKFPresenceEvent

+ (Class)cd_modelClass
{
  return (Class)objc_opt_class();
}

- (BOOL)validateForInsertOrUpdate:(id *)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  const __CFString *v10;
  BOOL v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)_MKFPresenceEvent;
  if (-[_MKFModel validateForInsertOrUpdate:](&v13, sel_validateForInsertOrUpdate_))
  {
    -[_MKFPresenceEvent presenceType](self, "presenceType");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MKFPresenceEvent activation](self, "activation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "unsignedIntegerValue");

    v7 = eventTypeForPresenceTypeAndGranularity();
    v8 = userTypeForPresenceTypeAndGranularity();
    if (v7 == *MEMORY[0x24BDD7CB8] || v8 == *MEMORY[0x24BDD7CC0])
    {
      if (a3)
      {
        v10 = CFSTR("Invalid presenceType or activation");
LABEL_13:
        objc_msgSend(MEMORY[0x24BDD1540], "hmd_validationErrorWithDescription:", v10);
        v11 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_16:

        return v11;
      }
    }
    else
    {
      if (v8 != 1)
      {
        v11 = 1;
        goto LABEL_16;
      }
      if (a3)
      {
        v10 = CFSTR("HMPresenceEventUserTypeCurrentUser must be resolved to a user list");
        goto LABEL_13;
      }
    }
    v11 = 0;
    goto LABEL_16;
  }
  return 0;
}

- (MKFPresenceEventDatabaseID)databaseID
{
  return -[MKFObjectDatabaseID initWithMKFObject:]([MKFPresenceEventDatabaseID alloc], "initWithMKFObject:", self);
}

- (MKFHome)home
{
  void *v2;
  void *v3;

  -[_MKFPresenceEvent trigger](self, "trigger");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MKFHome *)v3;
}

- (NSArray)users
{
  void *v2;
  void *v3;

  -[_MKFPresenceEvent valueForKey:](self, "valueForKey:", CFSTR("users_"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (BOOL)synchronizeUsersRelationWith:(id)a3
{
  return -[NSManagedObject mkf_synchronizeRelation:items:allowCreation:](self, "mkf_synchronizeRelation:items:allowCreation:", CFSTR("users_"), a3, 0);
}

- (void)addUsersObject:(id)a3
{
  -[NSManagedObject mkf_addToRelationship:object:](self, "mkf_addToRelationship:object:", CFSTR("users_"), a3);
}

- (void)removeUsersObject:(id)a3
{
  -[NSManagedObject mkf_removeFromRelationship:object:](self, "mkf_removeFromRelationship:object:", CFSTR("users_"), a3);
}

- (NSArray)guests
{
  void *v2;
  void *v3;

  -[_MKFPresenceEvent valueForKey:](self, "valueForKey:", CFSTR("guests_"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (BOOL)synchronizeGuestsRelationWith:(id)a3
{
  return -[NSManagedObject mkf_synchronizeRelation:items:allowCreation:](self, "mkf_synchronizeRelation:items:allowCreation:", CFSTR("guests_"), a3, 0);
}

- (void)addGuestsObject:(id)a3
{
  -[NSManagedObject mkf_addToRelationship:object:](self, "mkf_addToRelationship:object:", CFSTR("guests_"), a3);
}

- (void)removeGuestsObject:(id)a3
{
  -[NSManagedObject mkf_removeFromRelationship:object:](self, "mkf_removeFromRelationship:object:", CFSTR("guests_"), a3);
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
  if (homeRelation__hmf_once_t0_67558 != -1)
    dispatch_once(&homeRelation__hmf_once_t0_67558, &__block_literal_global_67559);
  return (NSPredicate *)(id)homeRelation__hmf_once_v1_67560;
}

+ (Protocol)backingModelProtocol
{
  return (Protocol *)&unk_2557ECED0;
}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("MKFPresenceEvent"));
}

@end
