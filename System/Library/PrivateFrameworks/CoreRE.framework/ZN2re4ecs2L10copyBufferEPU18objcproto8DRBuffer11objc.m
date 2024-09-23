@implementation ZN2re4ecs2L10copyBufferEPU18objcproto8DRBuffer11objc

void *___ZN2re4ecs2L10copyBufferEPU18objcproto8DRBuffer11objc_objectS2__block_invoke_2(uint64_t a1, const void *a2, size_t a3)
{
  void *v3;
  size_t v4;

  v4 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  if (v4 < a3)
    a3 = v4;
  return memcpy(v3, a2, a3);
}

@end
