@implementation CFNGetCFNetworkBundle

CFTypeRef ____CFNGetCFNetworkBundle_block_invoke()
{
  CFBundleRef BundleWithIdentifier;

  BundleWithIdentifier = CFBundleGetBundleWithIdentifier(CFSTR("com.apple.CFNetwork"));
  if (!BundleWithIdentifier)
    BundleWithIdentifier = CFBundleGetMainBundle();
  __CFNGetCFNetworkBundle::bundle = (uint64_t)BundleWithIdentifier;
  return CFRetain(BundleWithIdentifier);
}

@end
