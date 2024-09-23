@implementation TDModelProduction

+ (id)fetchRequest
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBB678]), "initWithEntityName:", CFSTR("ModelIOProduction"));
}

@end
