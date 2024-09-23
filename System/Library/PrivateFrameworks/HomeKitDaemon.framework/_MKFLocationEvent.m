@implementation _MKFLocationEvent

+ (Class)cd_modelClass
{
  return (Class)objc_opt_class();
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

+ (Protocol)backingModelProtocol
{
  return (Protocol *)&unk_2557D6A70;
}

- (MKFLocationEventDatabaseID)databaseID
{
  return -[MKFObjectDatabaseID initWithMKFObject:]([MKFLocationEventDatabaseID alloc], "initWithMKFObject:", self);
}

- (MKFHome)home
{
  void *v2;
  void *v3;

  -[_MKFLocationEvent trigger](self, "trigger");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MKFHome *)v3;
}

- (BOOL)synchronizeUserRelationWith:(id)a3
{
  return -[NSManagedObject mkf_synchronizeRelation:items:allowCreation:](self, "mkf_synchronizeRelation:items:allowCreation:", CFSTR("user"), a3, 0);
}

- (void)addUserObject:(id)a3
{
  -[NSManagedObject mkf_addToRelationship:object:](self, "mkf_addToRelationship:object:", CFSTR("user"), a3);
}

- (void)removeUserObject:(id)a3
{
  -[NSManagedObject mkf_removeFromRelationship:object:](self, "mkf_removeFromRelationship:object:", CFSTR("user"), a3);
}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("MKFLocationEvent"));
}

@end
