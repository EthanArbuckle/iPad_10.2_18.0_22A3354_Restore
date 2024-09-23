@implementation CMIOExtensionFigCaptureStreamEnqueueReactionEffect

uint64_t __CMIOExtensionFigCaptureStreamEnqueueReactionEffect_block_invoke(uint64_t result, void *a2)
{
  uint64_t v2;

  if (a2)
  {
    v2 = result;
    result = objc_msgSend(a2, "code");
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(v2 + 32) + 8) + 24) = result;
  }
  return result;
}

@end
