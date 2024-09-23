@implementation VCTransportStreamVTPRegisterPacketCallback

uint64_t ___VCTransportStreamVTPRegisterPacketCallback_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _VCTransportStreamVTPHandlePacketReceived(*(_QWORD *)(a1 + 32), a4);
}

@end
