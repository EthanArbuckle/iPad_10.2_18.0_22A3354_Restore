@implementation NSBundleLoadCode

uint64_t ___NSBundleLoadCode_block_invoke()
{
  return _dyld_register_for_bulk_image_loads();
}

@end
