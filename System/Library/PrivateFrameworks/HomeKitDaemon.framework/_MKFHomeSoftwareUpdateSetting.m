@implementation _MKFHomeSoftwareUpdateSetting

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("MKFHomeSoftwareUpdateSetting"));
}

+ (Class)cd_modelClass
{
  return (Class)objc_opt_class();
}

+ (id)modelIDForParentRelationshipTo:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDD1880], "UUID", a3);
}

+ (Protocol)backingModelProtocol
{
  return (Protocol *)&unk_2558B6EC0;
}

- (MKFHomeSoftwareUpdateSettingDatabaseID)databaseID
{
  return -[MKFObjectDatabaseID initWithMKFObject:]([MKFHomeSoftwareUpdateSettingDatabaseID alloc], "initWithMKFObject:", self);
}

@end
