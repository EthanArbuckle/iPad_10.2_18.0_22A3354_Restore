@implementation _MKFTimePeriodBulletinCondition

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
  return (Protocol *)&unk_2557CD560;
}

- (MKFTimePeriodBulletinConditionDatabaseID)databaseID
{
  return -[MKFObjectDatabaseID initWithMKFObject:]([MKFTimePeriodBulletinConditionDatabaseID alloc], "initWithMKFObject:", self);
}

- (MKFHome)home
{
  void *v2;
  void *v3;

  -[_MKFTimePeriodBulletinCondition bulletinRegistration](self, "bulletinRegistration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MKFHome *)v3;
}

- (id)materializeOrCreateEndElementRelationOfType:(id)a3 modelID:(id)a4 createdNew:(BOOL *)a5
{
  id v8;
  void *v9;
  void *v10;

  v8 = a4;
  NSStringFromProtocol((Protocol *)a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSManagedObject mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:](self, "mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:", CFSTR("endElement"), v9, v8, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)createEndElementRelationOfType:(id)a3 modelID:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  NSStringFromProtocol((Protocol *)a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSManagedObject mkf_createRelationOnProperty:modelProtocol:keyValue:](self, "mkf_createRelationOnProperty:modelProtocol:keyValue:", CFSTR("endElement"), v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)materializeOrCreateEndElementRelationOfTypeSunriseSunsetTimeSpecificationWithModelID:(id)a3 createdNew:(BOOL *)a4
{
  return -[NSManagedObject mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:](self, "mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:", CFSTR("endElement"), CFSTR("MKFSunriseSunsetTimeSpecification"), a3, a4);
}

- (id)createEndElementRelationOfTypeSunriseSunsetTimeSpecificationWithModelID:(id)a3
{
  return -[NSManagedObject mkf_createRelationOnProperty:modelProtocol:keyValue:](self, "mkf_createRelationOnProperty:modelProtocol:keyValue:", CFSTR("endElement"), CFSTR("MKFSunriseSunsetTimeSpecification"), a3);
}

- (id)findEndElementRelationOfTypeSunriseSunsetTimeSpecificationWithModelID:(id)a3
{
  return -[NSManagedObject mkf_findRelationOnProperty:modelProtocol:keyValue:](self, "mkf_findRelationOnProperty:modelProtocol:keyValue:", CFSTR("endElement"), CFSTR("MKFSunriseSunsetTimeSpecification"), a3);
}

- (id)materializeOrCreateEndElementRelationOfTypeTimeOfDayTimeSpecificationWithModelID:(id)a3 createdNew:(BOOL *)a4
{
  return -[NSManagedObject mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:](self, "mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:", CFSTR("endElement"), CFSTR("MKFTimeOfDayTimeSpecification"), a3, a4);
}

- (id)createEndElementRelationOfTypeTimeOfDayTimeSpecificationWithModelID:(id)a3
{
  return -[NSManagedObject mkf_createRelationOnProperty:modelProtocol:keyValue:](self, "mkf_createRelationOnProperty:modelProtocol:keyValue:", CFSTR("endElement"), CFSTR("MKFTimeOfDayTimeSpecification"), a3);
}

- (id)findEndElementRelationOfTypeTimeOfDayTimeSpecificationWithModelID:(id)a3
{
  return -[NSManagedObject mkf_findRelationOnProperty:modelProtocol:keyValue:](self, "mkf_findRelationOnProperty:modelProtocol:keyValue:", CFSTR("endElement"), CFSTR("MKFTimeOfDayTimeSpecification"), a3);
}

- (void)addEndElementObject:(id)a3
{
  -[NSManagedObject mkf_addToRelationship:object:](self, "mkf_addToRelationship:object:", CFSTR("endElement"), a3);
}

- (void)removeEndElementObject:(id)a3
{
  -[NSManagedObject mkf_removeFromRelationship:object:](self, "mkf_removeFromRelationship:object:", CFSTR("endElement"), a3);
}

- (id)materializeOrCreateStartElementRelationOfType:(id)a3 modelID:(id)a4 createdNew:(BOOL *)a5
{
  id v8;
  void *v9;
  void *v10;

  v8 = a4;
  NSStringFromProtocol((Protocol *)a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSManagedObject mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:](self, "mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:", CFSTR("startElement"), v9, v8, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)createStartElementRelationOfType:(id)a3 modelID:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  NSStringFromProtocol((Protocol *)a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSManagedObject mkf_createRelationOnProperty:modelProtocol:keyValue:](self, "mkf_createRelationOnProperty:modelProtocol:keyValue:", CFSTR("startElement"), v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)materializeOrCreateStartElementRelationOfTypeSunriseSunsetTimeSpecificationWithModelID:(id)a3 createdNew:(BOOL *)a4
{
  return -[NSManagedObject mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:](self, "mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:", CFSTR("startElement"), CFSTR("MKFSunriseSunsetTimeSpecification"), a3, a4);
}

- (id)createStartElementRelationOfTypeSunriseSunsetTimeSpecificationWithModelID:(id)a3
{
  return -[NSManagedObject mkf_createRelationOnProperty:modelProtocol:keyValue:](self, "mkf_createRelationOnProperty:modelProtocol:keyValue:", CFSTR("startElement"), CFSTR("MKFSunriseSunsetTimeSpecification"), a3);
}

- (id)findStartElementRelationOfTypeSunriseSunsetTimeSpecificationWithModelID:(id)a3
{
  return -[NSManagedObject mkf_findRelationOnProperty:modelProtocol:keyValue:](self, "mkf_findRelationOnProperty:modelProtocol:keyValue:", CFSTR("startElement"), CFSTR("MKFSunriseSunsetTimeSpecification"), a3);
}

- (id)materializeOrCreateStartElementRelationOfTypeTimeOfDayTimeSpecificationWithModelID:(id)a3 createdNew:(BOOL *)a4
{
  return -[NSManagedObject mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:](self, "mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:", CFSTR("startElement"), CFSTR("MKFTimeOfDayTimeSpecification"), a3, a4);
}

- (id)createStartElementRelationOfTypeTimeOfDayTimeSpecificationWithModelID:(id)a3
{
  return -[NSManagedObject mkf_createRelationOnProperty:modelProtocol:keyValue:](self, "mkf_createRelationOnProperty:modelProtocol:keyValue:", CFSTR("startElement"), CFSTR("MKFTimeOfDayTimeSpecification"), a3);
}

- (id)findStartElementRelationOfTypeTimeOfDayTimeSpecificationWithModelID:(id)a3
{
  return -[NSManagedObject mkf_findRelationOnProperty:modelProtocol:keyValue:](self, "mkf_findRelationOnProperty:modelProtocol:keyValue:", CFSTR("startElement"), CFSTR("MKFTimeOfDayTimeSpecification"), a3);
}

- (void)addStartElementObject:(id)a3
{
  -[NSManagedObject mkf_addToRelationship:object:](self, "mkf_addToRelationship:object:", CFSTR("startElement"), a3);
}

- (void)removeStartElementObject:(id)a3
{
  -[NSManagedObject mkf_removeFromRelationship:object:](self, "mkf_removeFromRelationship:object:", CFSTR("startElement"), a3);
}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("MKFTimePeriodBulletinCondition"));
}

@end
