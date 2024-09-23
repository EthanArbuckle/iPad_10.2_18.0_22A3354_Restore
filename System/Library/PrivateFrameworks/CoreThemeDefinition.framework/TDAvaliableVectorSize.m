@implementation TDAvaliableVectorSize

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("AvaliableVectorSize"));
}

@end
