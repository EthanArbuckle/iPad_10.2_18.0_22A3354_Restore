@implementation FigTransportInitializeWithConnection

uint64_t __FigTransportInitializeWithConnection_block_invoke(uint64_t result)
{
  uint64_t v1;

  if (sTransport)
  {
    ++sTransportUsageCount;
  }
  else
  {
    v1 = result;
    sTransportUsageCount = 1;
    result = NeroTransportCreate(*MEMORY[0x1E0C9AE00], *(const void **)(result + 40), &sTransport);
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(v1 + 32) + 8) + 24) = result;
  }
  return result;
}

@end
