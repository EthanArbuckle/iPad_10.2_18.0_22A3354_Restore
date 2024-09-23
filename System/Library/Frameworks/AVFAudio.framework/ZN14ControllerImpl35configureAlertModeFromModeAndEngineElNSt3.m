@implementation ZN14ControllerImpl35configureAlertModeFromModeAndEngineElNSt3

NSObject *___ZN14ControllerImpl35configureAlertModeFromModeAndEngineElNSt3__110shared_ptrI19AVVCRecordingEngineEE_block_invoke_2(uint64_t a1, int a2)
{
  NSObject *result;

  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  result = *(NSObject **)(a1 + 32);
  if (result)
    return dispatch_semaphore_signal(result);
  return result;
}

@end
