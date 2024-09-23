@implementation ZN2re4ecs217VFXSceneComponent22writeBindingsToRuntimeEv

_QWORD *___ZN2re4ecs217VFXSceneComponent22writeBindingsToRuntimeEv_block_invoke_2(_QWORD *result, void *__dst, size_t a3)
{
  uint64_t v3;

  v3 = result[4];
  if (*(_QWORD *)(v3 + 16) == a3)
    return memcpy(__dst, *(const void **)(v3 + 32), a3);
  return result;
}

@end
