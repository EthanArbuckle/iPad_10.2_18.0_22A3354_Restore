@implementation ZN14ControllerImpl11setAlertURLEP17AVVoiceController16AVVoiceAlertTypeP5NSURL

NSObject *___ZN14ControllerImpl11setAlertURLEP17AVVoiceController16AVVoiceAlertTypeP5NSURL_block_invoke_2(uint64_t a1, int a2)
{
  NSObject *result;

  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  result = *(NSObject **)(a1 + 32);
  if (result)
    return dispatch_semaphore_signal(result);
  return result;
}

@end
