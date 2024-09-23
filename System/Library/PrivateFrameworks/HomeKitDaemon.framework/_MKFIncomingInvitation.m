@implementation _MKFIncomingInvitation

+ (Protocol)backingModelProtocol
{
  return (Protocol *)&unk_2557D0E98;
}

- (MKFIncomingInvitationDatabaseID)databaseID
{
  return -[MKFObjectDatabaseID initWithMKFObject:]([MKFIncomingInvitationDatabaseID alloc], "initWithMKFObject:", self);
}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("MKFIncomingInvitation"));
}

@end
