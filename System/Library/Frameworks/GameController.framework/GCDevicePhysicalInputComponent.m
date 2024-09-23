@implementation GCDevicePhysicalInputComponent

void __62___GCDevicePhysicalInputComponent_PubSub__handleGamepadEvent___block_invoke(uint64_t a1)
{
  -[_GCDevicePhysicalInputGroup handleGamepadEvent:](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(void **)(a1 + 40));
}

uint64_t __65___GCDevicePhysicalInputComponent_PubSub__setGamepadEventSource___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleGamepadEvent:", a2);
}

@end
