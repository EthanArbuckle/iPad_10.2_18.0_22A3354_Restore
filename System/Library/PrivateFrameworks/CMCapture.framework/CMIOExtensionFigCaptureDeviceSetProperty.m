@implementation CMIOExtensionFigCaptureDeviceSetProperty

intptr_t __CMIOExtensionFigCaptureDeviceSetProperty_block_invoke(uint64_t a1, void *a2)
{
  intptr_t result;
  unsigned __int8 v4;

  result = objc_msgSend(a2, "code");
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  v4 = atomic_load((unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
  if ((v4 & 1) != 0)
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  return result;
}

intptr_t __CMIOExtensionFigCaptureDeviceSetProperty_block_invoke_2(uint64_t a1, void *a2)
{
  intptr_t result;
  unsigned __int8 v4;

  result = objc_msgSend(a2, "code");
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  v4 = atomic_load((unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
  if ((v4 & 1) != 0)
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  return result;
}

@end
