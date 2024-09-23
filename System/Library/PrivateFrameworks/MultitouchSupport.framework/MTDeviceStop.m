@implementation MTDeviceStop

void __MTDeviceStop_block_invoke(uint64_t a1)
{
  CFRunLoopStop(*(CFRunLoopRef *)(*(_QWORD *)(a1 + 40) + 2048));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
}

@end
