@implementation APBrowserRapportManagerSetEventHandler

uint64_t __APBrowserRapportManagerSetEventHandler_block_invoke(uint64_t result)
{
  uint64_t v1;
  int v2;
  uint64_t v3;

  v1 = result;
  v2 = -72284;
  v3 = *(_QWORD *)(result + 40);
  if (!*(_BYTE *)(v3 + 51))
  {
    if (*(_WORD *)(v3 + 48))
    {
      result = APSLogErrorAt();
      v2 = -72283;
    }
    else
    {
      v2 = 0;
      *(_OWORD *)(v3 + 56) = *(_OWORD *)(result + 48);
    }
  }
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(v1 + 32) + 8) + 24) = v2;
  return result;
}

@end
