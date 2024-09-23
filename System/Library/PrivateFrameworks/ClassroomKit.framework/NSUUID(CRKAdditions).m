@implementation NSUUID(CRKAdditions)

+ (id)crk_zerosUUID
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", CFSTR("00000000-0000-0000-0000-000000000000"));
}

@end
