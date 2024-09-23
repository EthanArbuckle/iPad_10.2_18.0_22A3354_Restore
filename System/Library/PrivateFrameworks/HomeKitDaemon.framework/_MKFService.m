@implementation _MKFService

+ (id)modelIDForKeyAttribute:(id)a3 parent:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  objc_msgSend(a4, "modelID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDService generateUUIDWithAccessoryUUID:serviceID:](HMDService, "generateUUIDWithAccessoryUUID:serviceID:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (NSPredicate)homeRelation
{
  if (homeRelation__hmf_once_t0_78326 != -1)
    dispatch_once(&homeRelation__hmf_once_t0_78326, &__block_literal_global_78327);
  return (NSPredicate *)(id)homeRelation__hmf_once_v1_78328;
}

+ (Protocol)backingModelProtocol
{
  return (Protocol *)&unk_2557FDAC8;
}

- (id)pr_findCharacteristicWithInstanceID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__78372;
  v16 = __Block_byref_object_dispose__78373;
  v17 = 0;
  -[_MKFService characteristics](self, "characteristics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __51___MKFService_pr_findCharacteristicWithInstanceID___block_invoke;
  v9[3] = &unk_24E780950;
  v6 = v4;
  v10 = v6;
  v11 = &v12;
  objc_msgSend(v5, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v9);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (MKFServiceDatabaseID)databaseID
{
  return -[MKFObjectDatabaseID initWithMKFObject:]([MKFServiceDatabaseID alloc], "initWithMKFObject:", self);
}

- (MKFHome)home
{
  void *v2;
  void *v3;

  -[_MKFService accessory](self, "accessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MKFHome *)v3;
}

- (NSArray)actionCharacteristicWrites
{
  void *v2;
  void *v3;

  -[_MKFService valueForKey:](self, "valueForKey:", CFSTR("actionCharacteristicWrites_"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (id)materializeOrCreateApplicationDataRelation:(BOOL *)a3
{
  return -[NSManagedObject mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:](self, "mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:", CFSTR("applicationData"), CFSTR("MKFApplicationData"), 0, a3);
}

- (NSArray)characteristics
{
  void *v2;
  void *v3;

  -[_MKFService valueForKey:](self, "valueForKey:", CFSTR("characteristics_"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)setCharacteristics:(id)a3
{
  id v4;

  if (a3)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[_MKFService setValue:forKey:](self, "setValue:forKey:", v4, CFSTR("characteristics_"));

  }
  else
  {
    -[_MKFService setValue:forKey:](self, "setValue:forKey:", 0, CFSTR("characteristics_"));
  }
}

- (id)materializeOrCreateCharacteristicsRelationOfType:(id)a3 instanceID:(id)a4 createdNew:(BOOL *)a5
{
  id v8;
  void *v9;
  void *v10;

  v8 = a4;
  NSStringFromProtocol((Protocol *)a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSManagedObject mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:](self, "mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:", CFSTR("characteristics_"), v9, v8, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)createCharacteristicsRelationOfType:(id)a3 instanceID:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  NSStringFromProtocol((Protocol *)a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSManagedObject mkf_createRelationOnProperty:modelProtocol:keyValue:](self, "mkf_createRelationOnProperty:modelProtocol:keyValue:", CFSTR("characteristics_"), v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)materializeOrCreateCharacteristicsRelationOfTypeCharacteristicWithInstanceID:(id)a3 createdNew:(BOOL *)a4
{
  return -[NSManagedObject mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:](self, "mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:", CFSTR("characteristics_"), CFSTR("MKFCharacteristic"), a3, a4);
}

- (id)createCharacteristicsRelationOfTypeCharacteristicWithInstanceID:(id)a3
{
  return -[NSManagedObject mkf_createRelationOnProperty:modelProtocol:keyValue:](self, "mkf_createRelationOnProperty:modelProtocol:keyValue:", CFSTR("characteristics_"), CFSTR("MKFCharacteristic"), a3);
}

- (id)findCharacteristicsRelationOfTypeCharacteristicWithInstanceID:(id)a3
{
  return -[NSManagedObject mkf_findRelationOnProperty:modelProtocol:keyValue:](self, "mkf_findRelationOnProperty:modelProtocol:keyValue:", CFSTR("characteristics_"), CFSTR("MKFCharacteristic"), a3);
}

- (id)materializeOrCreateCharacteristicsRelationOfTypeFloatCharacteristicWithInstanceID:(id)a3 createdNew:(BOOL *)a4
{
  return -[NSManagedObject mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:](self, "mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:", CFSTR("characteristics_"), CFSTR("MKFFloatCharacteristic"), a3, a4);
}

- (id)createCharacteristicsRelationOfTypeFloatCharacteristicWithInstanceID:(id)a3
{
  return -[NSManagedObject mkf_createRelationOnProperty:modelProtocol:keyValue:](self, "mkf_createRelationOnProperty:modelProtocol:keyValue:", CFSTR("characteristics_"), CFSTR("MKFFloatCharacteristic"), a3);
}

- (id)findCharacteristicsRelationOfTypeFloatCharacteristicWithInstanceID:(id)a3
{
  return -[NSManagedObject mkf_findRelationOnProperty:modelProtocol:keyValue:](self, "mkf_findRelationOnProperty:modelProtocol:keyValue:", CFSTR("characteristics_"), CFSTR("MKFFloatCharacteristic"), a3);
}

- (id)materializeOrCreateCharacteristicsRelationOfTypeIntegerCharacteristicWithInstanceID:(id)a3 createdNew:(BOOL *)a4
{
  return -[NSManagedObject mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:](self, "mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:", CFSTR("characteristics_"), CFSTR("MKFIntegerCharacteristic"), a3, a4);
}

- (id)createCharacteristicsRelationOfTypeIntegerCharacteristicWithInstanceID:(id)a3
{
  return -[NSManagedObject mkf_createRelationOnProperty:modelProtocol:keyValue:](self, "mkf_createRelationOnProperty:modelProtocol:keyValue:", CFSTR("characteristics_"), CFSTR("MKFIntegerCharacteristic"), a3);
}

- (id)findCharacteristicsRelationOfTypeIntegerCharacteristicWithInstanceID:(id)a3
{
  return -[NSManagedObject mkf_findRelationOnProperty:modelProtocol:keyValue:](self, "mkf_findRelationOnProperty:modelProtocol:keyValue:", CFSTR("characteristics_"), CFSTR("MKFIntegerCharacteristic"), a3);
}

- (id)materializeOrCreateCharacteristicsRelationOfTypeStringCharacteristicWithInstanceID:(id)a3 createdNew:(BOOL *)a4
{
  return -[NSManagedObject mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:](self, "mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:", CFSTR("characteristics_"), CFSTR("MKFStringCharacteristic"), a3, a4);
}

- (id)createCharacteristicsRelationOfTypeStringCharacteristicWithInstanceID:(id)a3
{
  return -[NSManagedObject mkf_createRelationOnProperty:modelProtocol:keyValue:](self, "mkf_createRelationOnProperty:modelProtocol:keyValue:", CFSTR("characteristics_"), CFSTR("MKFStringCharacteristic"), a3);
}

- (id)findCharacteristicsRelationOfTypeStringCharacteristicWithInstanceID:(id)a3
{
  return -[NSManagedObject mkf_findRelationOnProperty:modelProtocol:keyValue:](self, "mkf_findRelationOnProperty:modelProtocol:keyValue:", CFSTR("characteristics_"), CFSTR("MKFStringCharacteristic"), a3);
}

- (void)synchronizeCharacteristicsRelationWith:(id)a3
{
  -[NSManagedObject mkf_synchronizeRelation:items:allowCreation:](self, "mkf_synchronizeRelation:items:allowCreation:", CFSTR("characteristics_"), a3, 1);
}

- (NSArray)eventCharacteristics
{
  void *v2;
  void *v3;

  -[_MKFService valueForKey:](self, "valueForKey:", CFSTR("eventCharacteristics_"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSArray)serviceGroups
{
  void *v2;
  void *v3;

  -[_MKFService valueForKey:](self, "valueForKey:", CFSTR("serviceGroups_"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (BOOL)shouldIncludeForRestrictedGuestWithContext:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[4];

  v11[3] = *MEMORY[0x24BDAC8D0];
  v4 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend(MEMORY[0x24BDD7940], "secureClassServices", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithSet:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = *MEMORY[0x24BDD6B50];
  v11[1] = CFSTR("00000260-0000-1000-8000-0026BB765291");
  v11[2] = CFSTR("00000266-0000-1000-8000-0026BB765291");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObjectsFromArray:", v7);

  -[_MKFService serviceType](self, "serviceType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v6, "containsObject:", v9);

  return (char)self;
}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("MKFService"));
}

+ (Class)cd_modelClass
{
  return (Class)objc_opt_class();
}

@end
