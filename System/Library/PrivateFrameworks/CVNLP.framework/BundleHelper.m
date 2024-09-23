@implementation BundleHelper

- (id)createBundle
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = MEMORY[0x1E0CB34D0];
  v3 = objc_opt_class();
  return (id)MEMORY[0x1E0DE7D20](v2, sel_bundleForClass_, v3, v4);
}

@end
