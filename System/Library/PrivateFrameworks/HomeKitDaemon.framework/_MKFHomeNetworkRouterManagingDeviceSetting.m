@implementation _MKFHomeNetworkRouterManagingDeviceSetting

+ (id)modelIDForParentRelationshipTo:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDD1880], "UUID", a3);
}

+ (Protocol)backingModelProtocol
{
  return (Protocol *)&unk_2557E87F8;
}

- (MKFHomeNetworkRouterManagingDeviceSettingDatabaseID)databaseID
{
  return -[MKFObjectDatabaseID initWithMKFObject:]([MKFHomeNetworkRouterManagingDeviceSettingDatabaseID alloc], "initWithMKFObject:", self);
}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("MKFHomeNetworkRouterManagingDeviceSetting"));
}

+ (Class)cd_modelClass
{
  return (Class)objc_opt_class();
}

@end
