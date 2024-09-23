@implementation LSBundleDisplayNameContextGetIndex

uint64_t ___LSBundleDisplayNameContextGetIndex_block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, _BYTE *a5)
{
  uint64_t result;

  result = objc_msgSend(a3, "isEqual:", *(_QWORD *)(a1 + 32));
  if ((_DWORD)result)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
    *a5 = 1;
  }
  return result;
}

@end
