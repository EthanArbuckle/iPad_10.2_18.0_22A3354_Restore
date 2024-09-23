@implementation CoreColorClass

Class __CoreColorClass_block_invoke(Class result)
{
  if (!*((_BYTE *)result + 32))
  {
    result = NSClassFromString(CFSTR("UIColor"));
    CoreColorClass_colorClass = (uint64_t)result;
    CoreColorClass_isValid = result != 0;
  }
  return result;
}

@end
