@implementation RegisterStream

uint64_t __audioEngineCarPlay_RegisterStream_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  int v5;

  v2 = *(_QWORD *)(a1 + 40);
  if (*(_QWORD *)(v2 + 96))
  {
LABEL_7:
    result = APSLogErrorAt();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v5 = -72071;
    goto LABEL_8;
  }
  if (!*(_BYTE *)(v2 + 120))
  {
    APAudioFormatToASBD();
    if (*(_DWORD *)(*(_QWORD *)(a1 + 40) + 32) != 1819304813)
    {
      result = (uint64_t)CFRetain(*(CFTypeRef *)(a1 + 56));
      *(_QWORD *)(*(_QWORD *)(a1 + 40) + 96) = result;
      *(_QWORD *)(*(_QWORD *)(a1 + 40) + 104) = **(_QWORD **)(a1 + 64);
      *(_QWORD *)(*(_QWORD *)(a1 + 40) + 112) = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 24);
      return result;
    }
    goto LABEL_7;
  }
  result = APSLogErrorAt();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = -72077;
LABEL_8:
  *(_DWORD *)(v4 + 24) = v5;
  return result;
}

@end
