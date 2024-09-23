@implementation CLSClass(Autocomplete)

- (uint64_t)acceptVisitor:()Autocomplete
{
  return objc_msgSend(a3, "visitClass:", a1);
}

@end
