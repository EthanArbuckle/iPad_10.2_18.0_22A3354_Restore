@implementation CGPerspectiveCacheFinalize

void __CGPerspectiveCacheFinalize_block_invoke(uint64_t a1)
{
  const void *v1;

  v1 = *(const void **)(a1 + 32);
  CGImageNotificationCenter();
  CGNotificationCenterRemoveCallback();
  CFRelease(v1);
}

void __CGPerspectiveCacheFinalize_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  const void *v3;

  if (*(_QWORD *)(a3 + 40))
  {
    v3 = *(const void **)(a1 + 32);
    CGImageNotificationCenter();
    CGNotificationCenterRemoveCallback();
    CFRelease(v3);
  }
}

@end
