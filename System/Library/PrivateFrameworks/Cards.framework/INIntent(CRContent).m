@implementation INIntent(CRContent)

- (id)underlyingInteraction
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD9DF0]), "initWithIntent:response:", a1, 0);
}

@end
