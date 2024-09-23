@implementation CLSPerson(Autocomplete)

- (uint64_t)acceptVisitor:()Autocomplete
{
  return objc_msgSend(a3, "visitPerson:", a1);
}

@end
