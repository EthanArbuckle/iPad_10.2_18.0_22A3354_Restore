@implementation IsAppVisibleInCurrentMode

uint64_t __IsAppVisibleInCurrentMode_block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t result;

  result = objc_msgSend(a2, "isEqual:", *(_QWORD *)(a1 + 32));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    *a3 = 1;
  return result;
}

@end
