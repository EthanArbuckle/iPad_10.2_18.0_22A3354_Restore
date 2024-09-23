@implementation CFLookupCFNetworkFunction

void *____CFLookupCFNetworkFunction_block_invoke()
{
  char *v0;
  void *result;

  if (__CFProcessIsRestricted())
    v0 = 0;
  else
    v0 = getenv("CFNETWORK_LIBRARY_PATH");
  if (!v0)
    v0 = "/System/Library/Frameworks/CFNetwork.framework/CFNetwork";
  result = dlopen(v0, 5);
  __CFLookupCFNetworkFunction_image = (uint64_t)result;
  return result;
}

@end
