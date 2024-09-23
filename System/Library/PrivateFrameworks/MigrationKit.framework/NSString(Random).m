@implementation NSString(Random)

+ (id)mk_randomAlphanumericStringWithLength:()Random
{
  uint64_t v3;
  void *i;

  v3 = a3;
  for (i = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithCapacity:", a3); v3; --v3)
    objc_msgSend(i, "appendFormat:", CFSTR("%c"), objc_msgSend(CFSTR("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"), "characterAtIndex:", arc4random_uniform(objc_msgSend(CFSTR("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"), "length"))));
  return i;
}

@end
