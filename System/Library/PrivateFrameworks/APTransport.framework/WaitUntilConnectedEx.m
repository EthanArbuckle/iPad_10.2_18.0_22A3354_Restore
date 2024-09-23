@implementation WaitUntilConnectedEx

uint64_t __stream_WaitUntilConnectedEx_block_invoke(uint64_t result)
{
  uint64_t v1;
  int v2;

  v1 = *(_QWORD *)(result + 40);
  if (*(_BYTE *)(v1 + 24))
    v2 = -16617;
  else
    v2 = *(_DWORD *)(v1 + 48);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = v2;
  return result;
}

@end
