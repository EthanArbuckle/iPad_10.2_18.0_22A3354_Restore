@implementation _MKFMediaAccessory

+ (id)modelIDForParentRelationshipTo:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDD1880], "UUID", a3);
}

+ (Protocol)backingModelProtocol
{
  return (Protocol *)&unk_2557EAAE0;
}

- (MKFMediaAccessoryDatabaseID)databaseID
{
  return -[MKFObjectDatabaseID initWithMKFObject:]([MKFMediaAccessoryDatabaseID alloc], "initWithMKFObject:", self);
}

+ (Class)cd_modelClass
{
  return (Class)objc_opt_class();
}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("MKFMediaAccessory"));
}

@end
