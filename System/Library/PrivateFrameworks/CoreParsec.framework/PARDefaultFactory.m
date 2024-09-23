@implementation PARDefaultFactory

- (id)createResultObject
{
  return objc_alloc_init(MEMORY[0x1E0D8C6A8]);
}

@end
