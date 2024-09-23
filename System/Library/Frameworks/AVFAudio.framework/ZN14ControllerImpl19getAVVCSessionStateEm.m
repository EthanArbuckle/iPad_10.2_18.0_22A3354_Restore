@implementation ZN14ControllerImpl19getAVVCSessionStateEm

NSObject *___ZN14ControllerImpl19getAVVCSessionStateEm_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *result;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;
  result = *(NSObject **)(a1 + 32);
  if (result)
    return dispatch_semaphore_signal(result);
  return result;
}

@end
