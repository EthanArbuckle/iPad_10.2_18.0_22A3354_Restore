@implementation SCNetworkCategoryManagerDeliverNotification

void __SCNetworkCategoryManagerDeliverNotification_block_invoke(uint64_t a1)
{
  const void *v1;

  v1 = *(const void **)(a1 + 40);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if (v1)
    CFRelease(v1);
}

@end
