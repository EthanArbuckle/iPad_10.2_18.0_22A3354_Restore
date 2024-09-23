@implementation CARequiresColorMatching

uint64_t __CARequiresColorMatching_block_invoke()
{
  uint64_t result;

  result = dyld_program_sdk_at_least();
  CARequiresColorMatching::compat_mode = result ^ 1;
  return result;
}

@end
