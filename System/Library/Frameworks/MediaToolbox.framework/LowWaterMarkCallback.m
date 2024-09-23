@implementation LowWaterMarkCallback

void __dqr_LowWaterMarkCallback_block_invoke(uint64_t a1)
{
  const void *v2;

  (*(void (**)(_QWORD))(a1 + 32))(*(_QWORD *)(a1 + 40));
  v2 = *(const void **)(a1 + 40);
  if (v2)
    CFRelease(v2);
}

@end
