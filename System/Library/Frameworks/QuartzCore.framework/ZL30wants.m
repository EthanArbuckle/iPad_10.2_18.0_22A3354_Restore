@implementation ZL30wants

__CFBundle *___ZL30wants_compositing_dependenciesv_block_invoke()
{
  __CFBundle *result;

  result = CFBundleGetMainBundle();
  if (result)
  {
    result = CFBundleGetInfoDictionary(result);
    if (result)
    {
      result = (__CFBundle *)CFDictionaryGetValue(result, CFSTR("CAMetalLayerWantsCompositingDependencies"));
      if (result)
      {
        result = (__CFBundle *)CA_CFBoolValue(result);
        wants_compositing_dependencies(void)::wants_compositing_dependencies = (char)result;
      }
    }
  }
  return result;
}

@end
