@implementation WFPredicateForEnablingPerson

uint64_t __WFPredicateForEnablingPerson_block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K.@count > 0"), a2);
}

@end
