@implementation CopyHIDInputMode

uint64_t __carEndpoint_CopyHIDInputMode_block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 272);
  if (result)
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = APHIDClientCopyInputModeForUUID(result, *(_QWORD *)(a1 + 48), *(CFTypeRef **)(a1 + 56));
    result = *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
    if ((_DWORD)result)
      return APSLogErrorAt();
  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = -16726;
  }
  return result;
}

@end
