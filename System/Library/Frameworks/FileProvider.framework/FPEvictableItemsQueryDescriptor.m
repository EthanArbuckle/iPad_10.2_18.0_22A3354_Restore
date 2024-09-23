@implementation FPEvictableItemsQueryDescriptor

- (id)name
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "EVCT");
}

- (id)queryStringForMountPoint:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(FPEvictable == \"1\")"));
}

@end
