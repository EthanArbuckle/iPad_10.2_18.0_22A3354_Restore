@implementation FCTestBlockForClass

uint64_t __FCTestBlockForClass_block_invoke()
{
  return objc_opt_isKindOfClass() & 1;
}

@end
