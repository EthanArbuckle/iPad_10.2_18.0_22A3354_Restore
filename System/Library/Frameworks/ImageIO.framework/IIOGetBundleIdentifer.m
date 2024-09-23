@implementation IIOGetBundleIdentifer

__CFBundle *__IIOGetBundleIdentifer_block_invoke()
{
  __CFBundle *result;

  result = CFBundleGetMainBundle();
  IIOGetBundleIdentifer::gMainBundle = (uint64_t)result;
  if (result)
  {
    result = (__CFBundle *)CFBundleGetIdentifier(result);
    IIOGetBundleIdentifer::gBundleIdentifer = (uint64_t)result;
  }
  return result;
}

@end
