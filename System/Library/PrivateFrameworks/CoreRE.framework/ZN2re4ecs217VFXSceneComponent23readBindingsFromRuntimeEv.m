@implementation ZN2re4ecs217VFXSceneComponent23readBindingsFromRuntimeEv

void *___ZN2re4ecs217VFXSceneComponent23readBindingsFromRuntimeEv_block_invoke_2(uint64_t a1, const void *a2, unint64_t a3)
{
  re::DynamicArray<BOOL>::resize(*(_QWORD *)(a1 + 32), a3);
  return memcpy(*(void **)(*(_QWORD *)(a1 + 32) + 32), a2, a3);
}

@end
