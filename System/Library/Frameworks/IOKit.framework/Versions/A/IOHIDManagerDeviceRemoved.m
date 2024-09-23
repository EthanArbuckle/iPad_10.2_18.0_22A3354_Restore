@implementation IOHIDManagerDeviceRemoved

uint64_t ____IOHIDManagerDeviceRemoved_block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v3;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24))
  {
    v3 = result;
    result = IOHIDDeviceGetRegistryEntryID(a2);
    if (*(_QWORD *)(v3 + 40) == result)
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v3 + 32) + 8) + 24) = a2;
  }
  return result;
}

@end
