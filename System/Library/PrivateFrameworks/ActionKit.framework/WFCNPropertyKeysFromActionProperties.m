@implementation WFCNPropertyKeysFromActionProperties

uint64_t __WFCNPropertyKeysFromActionProperties_block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "intValue");
  return CNContactPropertyKeyFromWFContactPropertyID();
}

@end
