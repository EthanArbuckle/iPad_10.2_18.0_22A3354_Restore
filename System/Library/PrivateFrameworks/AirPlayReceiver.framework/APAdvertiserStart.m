@implementation APAdvertiserStart

uint64_t __APAdvertiserStart_block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  int v3;

  v1 = result;
  v2 = *(_QWORD *)(result + 40);
  if (*(_BYTE *)(v2 + 32))
  {
    v3 = 0;
    goto LABEL_7;
  }
  if (*(int *)(v2 + 24) <= 0 || !*(_QWORD *)(v2 + 72))
  {
    APSLogErrorAt();
    v3 = -6745;
LABEL_11:
    result = _APAdvertiserStop(v2);
    goto LABEL_7;
  }
  *(_BYTE *)(v2 + 32) = 1;
  if (*(_QWORD *)(v2 + 40))
  {
    _APAdvertiserStartListeningForNetwork(v2, 1, *(unsigned __int8 *)(v2 + 48));
    _APAdvertiserStartListeningForNetwork(v2, 7, *(unsigned __int8 *)(v2 + 49));
  }
  result = _APAdvertiserUpdate(v2);
  v3 = result;
  if ((_DWORD)result)
  {
    APSLogErrorAt();
    goto LABEL_11;
  }
LABEL_7:
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(v1 + 32) + 8) + 24) = v3;
  return result;
}

@end
