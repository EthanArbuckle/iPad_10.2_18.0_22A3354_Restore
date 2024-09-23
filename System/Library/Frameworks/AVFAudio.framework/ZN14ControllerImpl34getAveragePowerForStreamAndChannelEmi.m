@implementation ZN14ControllerImpl34getAveragePowerForStreamAndChannelEmi

NSObject *___ZN14ControllerImpl34getAveragePowerForStreamAndChannelEmi_block_invoke_2(uint64_t a1, float a2)
{
  NSObject *result;

  *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  result = *(NSObject **)(a1 + 32);
  if (result)
    return dispatch_semaphore_signal(result);
  return result;
}

@end
