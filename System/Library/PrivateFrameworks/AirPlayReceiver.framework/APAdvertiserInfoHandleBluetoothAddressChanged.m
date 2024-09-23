@implementation APAdvertiserInfoHandleBluetoothAddressChanged

void ___APAdvertiserInfoHandleBluetoothAddressChanged_block_invoke(uint64_t a1, uint64_t a2)
{
  _APAdvertiserUpdateNIRangingSession(*(_QWORD *)(a1 + 32), a2);
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

@end
