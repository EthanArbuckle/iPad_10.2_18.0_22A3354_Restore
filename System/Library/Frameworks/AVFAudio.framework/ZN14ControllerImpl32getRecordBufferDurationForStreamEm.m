@implementation ZN14ControllerImpl32getRecordBufferDurationForStreamEm

NSObject *___ZN14ControllerImpl32getRecordBufferDurationForStreamEm_block_invoke_2(uint64_t a1, double a2)
{
  NSObject *result;

  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  result = *(NSObject **)(a1 + 32);
  if (result)
    return dispatch_semaphore_signal(result);
  return result;
}

@end
