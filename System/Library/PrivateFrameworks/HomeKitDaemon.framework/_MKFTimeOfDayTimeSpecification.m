@implementation _MKFTimeOfDayTimeSpecification

+ (Protocol)backingModelProtocol
{
  return (Protocol *)&unk_2557D1198;
}

- (MKFTimeOfDayTimeSpecificationDatabaseID)databaseID
{
  return -[MKFObjectDatabaseID initWithMKFObject:]([MKFTimeOfDayTimeSpecificationDatabaseID alloc], "initWithMKFObject:", self);
}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("MKFTimeOfDayTimeSpecification"));
}

@end
