@implementation IORegistryIterator

- (BOOL)enterEntry
{
  return MEMORY[0x2199DC8CC](-[IOKObject object](self, "object")) == 0;
}

- (BOOL)exitEntry
{
  return MEMORY[0x2199DC8D8](-[IOKObject object](self, "object")) == 0;
}

@end
