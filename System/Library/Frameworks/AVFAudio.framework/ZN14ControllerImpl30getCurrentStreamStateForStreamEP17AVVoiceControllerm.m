@implementation ZN14ControllerImpl30getCurrentStreamStateForStreamEP17AVVoiceControllerm

NSObject *___ZN14ControllerImpl30getCurrentStreamStateForStreamEP17AVVoiceControllerm_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  NSObject *result;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a4;
  result = *(NSObject **)(a1 + 32);
  if (result)
    return dispatch_semaphore_signal(result);
  return result;
}

@end
