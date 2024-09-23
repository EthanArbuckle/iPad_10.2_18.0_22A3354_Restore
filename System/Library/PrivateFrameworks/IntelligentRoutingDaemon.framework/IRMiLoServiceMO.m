@implementation IRMiLoServiceMO

+ (void)setPropertiesOfMiLoServiceMO:(id)a3 withMiLoServiceUuidString:(id)a4
{
  objc_msgSend(a3, "setServiceUuidString:", a4);
}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("IRMiLoServiceMO"));
}

@end
