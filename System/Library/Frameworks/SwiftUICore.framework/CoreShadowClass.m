@implementation CoreShadowClass

Class __CoreShadowClass_block_invoke()
{
  Class result;

  result = NSClassFromString(CFSTR("NSShadow"));
  CoreShadowClass_shadowClass = (uint64_t)result;
  CoreShadowClass_isValid = result != 0;
  return result;
}

@end
