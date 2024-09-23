@implementation MAUtilitiesCustomizedFontLanguages

CFArrayRef __MAUtilitiesCustomizedFontLanguages_block_invoke()
{
  CFArrayRef result;
  const void *v1[2];

  v1[1] = *(const void **)MEMORY[0x1E0C80C00];
  v1[0] = CFSTR("ja");
  result = CFArrayCreate(0, v1, 1, MEMORY[0x1E0C9B378]);
  MAUtilitiesCustomizedFontLanguages_customizedLanguages = (uint64_t)result;
  return result;
}

@end
