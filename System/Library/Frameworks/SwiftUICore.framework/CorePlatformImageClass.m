@implementation CorePlatformImageClass

Class __CorePlatformImageClass_block_invoke()
{
  Class result;

  result = NSClassFromString(CFSTR("UIImage"));
  CorePlatformImageClass_imageClass = (uint64_t)result;
  CorePlatformImageClass_isValid = result != 0;
  return result;
}

@end
