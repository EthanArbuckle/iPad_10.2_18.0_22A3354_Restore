@implementation APSEnsureCanInitiatePlayback

__CFBundle *__APSEnsureCanInitiatePlayback_block_invoke()
{
  __CFBundle *result;

  result = CFBundleGetMainBundle();
  if (result)
  {
    result = (__CFBundle *)CFBundleGetIdentifier(result);
    APSEnsureCanInitiatePlayback_bundleID = (uint64_t)result;
    if (result)
      return (__CFBundle *)CFRetain(result);
  }
  return result;
}

@end
