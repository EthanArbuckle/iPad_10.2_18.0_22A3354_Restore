@implementation AXSetProcessWantsMLElementForBundle

void __AXSetProcessWantsMLElementForBundle_block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)MLElementRequests;
  MLElementRequests = v0;

}

@end
