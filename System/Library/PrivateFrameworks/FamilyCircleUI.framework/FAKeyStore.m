@implementation FAKeyStore

+ (id)keyStoreForChecklist
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1888]), "initWithStoreIdentifier:type:", CFSTR("com.apple.familycircle.checklist"), 2);
}

@end
