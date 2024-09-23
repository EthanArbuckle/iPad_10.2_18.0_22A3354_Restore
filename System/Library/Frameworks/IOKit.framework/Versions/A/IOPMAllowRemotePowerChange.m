@implementation IOPMAllowRemotePowerChange

uint64_t __IOPMAllowRemotePowerChange_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t input;

  v2 = *(_QWORD *)(a1 + 40);
  input = *(_QWORD *)(v2 + 48);
  if (*(_DWORD *)(a1 + 48) == *(_DWORD *)(v2 + 40))
    result = IOConnectCallScalarMethod(*(_DWORD *)(v2 + 24), 3u, &input, 1u, 0, 0);
  else
    result = 3758097090;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end
