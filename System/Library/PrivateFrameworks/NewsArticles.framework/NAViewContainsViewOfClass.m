@implementation NAViewContainsViewOfClass

uint64_t __NAViewContainsViewOfClass_block_invoke()
{
  return objc_opt_isKindOfClass() & 1;
}

@end
