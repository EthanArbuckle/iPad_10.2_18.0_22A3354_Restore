@implementation _MKFAccount

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
  return (Protocol *)&unk_255778C70;
}

- (MKFAccountDatabaseID)databaseID
{
  return -[MKFObjectDatabaseID initWithMKFObject:]([MKFAccountDatabaseID alloc], "initWithMKFObject:", self);
}

- (NSArray)devices
{
  void *v2;
  void *v3;

  -[_MKFAccount valueForKey:](self, "valueForKey:", CFSTR("devices_"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (id)materializeOrCreateDevicesRelationWithModelID:(id)a3 createdNew:(BOOL *)a4
{
  return -[NSManagedObject mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:](self, "mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:", CFSTR("devices_"), CFSTR("MKFDevice"), a3, a4);
}

- (id)findDevicesRelationWithModelID:(id)a3
{
  return -[NSManagedObject mkf_findRelationOnProperty:modelProtocol:keyValue:](self, "mkf_findRelationOnProperty:modelProtocol:keyValue:", CFSTR("devices_"), CFSTR("MKFDevice"), a3);
}

- (void)synchronizeDevicesRelationWith:(id)a3
{
  -[NSManagedObject mkf_synchronizeRelation:items:allowCreation:](self, "mkf_synchronizeRelation:items:allowCreation:", CFSTR("devices_"), a3, 1);
}

- (NSArray)handles
{
  void *v2;
  void *v3;

  -[_MKFAccount valueForKey:](self, "valueForKey:", CFSTR("handles_"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (id)materializeOrCreateHandlesRelationWithModelID:(id)a3 createdNew:(BOOL *)a4
{
  return -[NSManagedObject mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:](self, "mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:", CFSTR("handles_"), CFSTR("MKFAccountHandle"), a3, a4);
}

- (id)findHandlesRelationWithModelID:(id)a3
{
  return -[NSManagedObject mkf_findRelationOnProperty:modelProtocol:keyValue:](self, "mkf_findRelationOnProperty:modelProtocol:keyValue:", CFSTR("handles_"), CFSTR("MKFAccountHandle"), a3);
}

- (void)synchronizeHandlesRelationWith:(id)a3
{
  -[NSManagedObject mkf_synchronizeRelation:items:allowCreation:](self, "mkf_synchronizeRelation:items:allowCreation:", CFSTR("handles_"), a3, 1);
}

+ (Class)cd_modelClass
{
  return (Class)objc_opt_class();
}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("MKFAccount"));
}

@end
