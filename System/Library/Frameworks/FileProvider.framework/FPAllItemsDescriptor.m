@implementation FPAllItemsDescriptor

- (id)name
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "ALL.");
}

- (id)queryStringForMountPoint:(id)a3
{
  return CFSTR("(true)");
}

@end
