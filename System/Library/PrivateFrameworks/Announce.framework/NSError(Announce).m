@implementation NSError(Announce)

+ (uint64_t)an_errorWithCode:()Announce
{
  return objc_msgSend(MEMORY[0x24BDD1540], "an_errorWithCode:component:", a3, 0);
}

@end
