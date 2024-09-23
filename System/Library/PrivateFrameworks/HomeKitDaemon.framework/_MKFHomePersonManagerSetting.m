@implementation _MKFHomePersonManagerSetting

+ (id)modelIDForParentRelationshipTo:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDD1880], "UUID", a3);
}

+ (Protocol)backingModelProtocol
{
  return (Protocol *)&unk_2557848E0;
}

- (MKFHomePersonManagerSettingDatabaseID)databaseID
{
  return -[MKFObjectDatabaseID initWithMKFObject:]([MKFHomePersonManagerSettingDatabaseID alloc], "initWithMKFObject:", self);
}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("MKFHomePersonManagerSetting"));
}

+ (Class)cd_modelClass
{
  return (Class)objc_opt_class();
}

@end
