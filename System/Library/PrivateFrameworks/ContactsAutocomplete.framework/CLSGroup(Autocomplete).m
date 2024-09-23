@implementation CLSGroup(Autocomplete)

- (uint64_t)acceptVisitor:()Autocomplete
{
  return objc_msgSend(a3, "visitGroup:", a1);
}

@end
