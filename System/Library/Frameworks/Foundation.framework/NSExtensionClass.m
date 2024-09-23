@implementation NSExtensionClass

uint64_t ___NSExtensionClass_block_invoke()
{
  uint64_t result;

  if (softLinkEXGetExtensionClass)
    result = softLinkEXGetExtensionClass();
  else
    result = 0;
  _MergedGlobals_119 = result;
  return result;
}

@end
