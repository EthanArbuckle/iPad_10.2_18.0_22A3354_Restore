@implementation HMProxify

uint64_t __HMProxify_block_invoke()
{
  uint64_t result;

  HMProxify_proxyClassIVar = objc_opt_class();
  HMProxify_proxyClassIVarSize = class_getInstanceSize((Class)HMProxify_proxyClassIVar);
  HMProxify_proxyClassAssoc = objc_opt_class();
  HMProxify_proxyClassAssocSize = class_getInstanceSize((Class)HMProxify_proxyClassAssoc);
  result = objc_msgSend(MEMORY[0x1E0DE7910], "instanceMethodForSelector:", sel_dealloc);
  HMProxify_defaultDealloc = result;
  return result;
}

@end
