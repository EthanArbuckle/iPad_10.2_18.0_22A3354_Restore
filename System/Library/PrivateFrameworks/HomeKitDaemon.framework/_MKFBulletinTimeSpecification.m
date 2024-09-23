@implementation _MKFBulletinTimeSpecification

+ (Protocol)backingModelProtocol
{
  return (Protocol *)&unk_2557D1048;
}

- (MKFBulletinTimeSpecificationDatabaseID)databaseID
{
  return -[MKFObjectDatabaseID initWithMKFObject:]([MKFBulletinTimeSpecificationDatabaseID alloc], "initWithMKFObject:", self);
}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("MKFBulletinTimeSpecification"));
}

@end
