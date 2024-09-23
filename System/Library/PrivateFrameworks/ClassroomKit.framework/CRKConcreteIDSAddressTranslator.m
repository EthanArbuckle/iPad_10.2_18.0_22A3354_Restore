@implementation CRKConcreteIDSAddressTranslator

- (id)destinationAddressForAppleID:(id)a3
{
  return (id)MEMORY[0x219A21F80](a3, a2);
}

@end
