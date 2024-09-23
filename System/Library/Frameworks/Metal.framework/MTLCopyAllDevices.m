@implementation MTLCopyAllDevices

uint64_t __MTLCopyAllDevices_block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend((id)_deviceArray, "copy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = result;
  return result;
}

@end
