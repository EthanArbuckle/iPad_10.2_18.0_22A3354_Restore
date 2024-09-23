@implementation NSNumber

uint64_t __45__NSNumber_CATCasting__cat_numberWithObject___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDD16F0]);
  v1 = (void *)cat_numberWithObject__formatter;
  cat_numberWithObject__formatter = (uint64_t)v0;

  return objc_msgSend((id)cat_numberWithObject__formatter, "setNumberStyle:", 1);
}

@end
