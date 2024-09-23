@implementation NSURL

BOOL __34__NSURL_AppleAccount__aa_endpoint__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:options:", CFSTR("endpoint"), 1) == 0;
}

@end
