@implementation ZN14ControllerImpl26isMeteringEnabledForStreamEm

NSObject *___ZN14ControllerImpl26isMeteringEnabledForStreamEm_block_invoke_2(uint64_t a1, uint64_t a2, char a3)
{
  NSObject *result;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;
  result = *(NSObject **)(a1 + 32);
  if (result)
    return dispatch_semaphore_signal(result);
  return result;
}

@end
