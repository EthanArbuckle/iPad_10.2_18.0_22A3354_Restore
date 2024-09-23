@implementation WFActivityItemValuesFromContentItems

uint64_t __WFActivityItemValuesFromContentItems_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "activityViewController:itemForActivityType:", *(_QWORD *)(a1 + 32), 0);
}

@end
