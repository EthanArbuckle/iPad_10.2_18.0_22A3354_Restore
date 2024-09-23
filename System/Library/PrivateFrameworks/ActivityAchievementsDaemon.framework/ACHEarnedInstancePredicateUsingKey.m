@implementation ACHEarnedInstancePredicateUsingKey

uint64_t __ACHEarnedInstancePredicateUsingKey_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(a2, "key"));
}

@end
