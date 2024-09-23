@implementation MKFLocalBulletinRegistration

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("LocalBulletinRegistration"));
}

@end
