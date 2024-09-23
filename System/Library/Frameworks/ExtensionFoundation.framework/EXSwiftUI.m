@implementation EXSwiftUI

void __37__EXSwiftUI_Subsystem_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  void *v4;

  v1 = objc_alloc(*(Class *)(a1 + 32));
  v2 = (void *)__instance;
  __instance = (uint64_t)v1;

  v3 = objc_msgSend((id)__instance, "init");
  v4 = (void *)__instance;
  __instance = v3;

}

@end
