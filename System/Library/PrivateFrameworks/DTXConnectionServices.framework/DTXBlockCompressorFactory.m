@implementation DTXBlockCompressorFactory

+ (id)createBlockCompressor
{
  return (id)objc_opt_new();
}

@end
