@implementation SendDataForDeviceID

uint64_t __routingContext_SendDataForDeviceID_block_invoke(uint64_t a1)
{
  uint64_t result;

  result = MXSystemRemotePool_SendData(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(void (**)(CFTypeRef, uint64_t, uint64_t, uint64_t))(a1 + 64), *(_QWORD *)(a1 + 72));
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end
