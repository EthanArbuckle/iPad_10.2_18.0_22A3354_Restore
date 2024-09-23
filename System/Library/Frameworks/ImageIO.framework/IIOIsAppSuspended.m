@implementation IIOIsAppSuspended

Class __IIOIsAppSuspended_block_invoke()
{
  Class result;

  result = NSClassFromString(CFSTR("UIApplication"));
  if (result)
  {
    result = (Class)-[objc_class sharedApplication](result, sel_sharedApplication);
    gSharedApp = (uint64_t)result;
  }
  return result;
}

@end
