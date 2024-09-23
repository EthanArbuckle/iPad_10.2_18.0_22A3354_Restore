@implementation ASKBuildTypeGetCurrent

void __ASKBuildTypeGetCurrent_block_invoke()
{
  int has_internal_content;
  const __CFString *v1;
  void *v2;

  has_internal_content = os_variant_has_internal_content();
  v1 = CFSTR("production");
  v2 = (void *)ASKBuildTypeGetCurrent_buildType;
  if (has_internal_content)
    v1 = CFSTR("internal");
  ASKBuildTypeGetCurrent_buildType = (uint64_t)v1;

}

@end
