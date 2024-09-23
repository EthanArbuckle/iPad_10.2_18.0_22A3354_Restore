@implementation _MKFSunriseSunsetTimeSpecification

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("MKFSunriseSunsetTimeSpecification"));
}

+ (Protocol)backingModelProtocol
{
  return (Protocol *)&unk_2558766F8;
}

- (MKFSunriseSunsetTimeSpecificationDatabaseID)databaseID
{
  return -[MKFObjectDatabaseID initWithMKFObject:]([MKFSunriseSunsetTimeSpecificationDatabaseID alloc], "initWithMKFObject:", self);
}

@end
