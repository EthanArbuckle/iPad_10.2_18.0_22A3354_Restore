@implementation SUUIPredicateViewElement

- (NSPredicate)entityValuePredicate
{
  return (NSPredicate *)objc_msgSend(MEMORY[0x24BDD1758], "predicateWithValue:", 1);
}

@end
