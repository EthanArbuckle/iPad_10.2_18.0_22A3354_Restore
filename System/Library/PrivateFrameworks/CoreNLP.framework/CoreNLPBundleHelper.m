@implementation CoreNLPBundleHelper

- (id)createBundle
{
  return (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
}

@end
