@implementation NUViewContainsViewOfClass

uint64_t __NUViewContainsViewOfClass_block_invoke()
{
  return objc_opt_isKindOfClass() & 1;
}

@end
