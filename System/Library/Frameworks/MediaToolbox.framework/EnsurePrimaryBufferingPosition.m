@implementation EnsurePrimaryBufferingPosition

uint64_t __fpic_EnsurePrimaryBufferingPosition_block_invoke(uint64_t result)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unsigned int SnapOptions;

  if (!*(_BYTE *)(*(_QWORD *)(result + 40) + 979))
  {
    v1 = (_QWORD *)result;
    result = (uint64_t)fpic_GetCurrentlyPlayingEvent();
    if (result)
    {
      v2 = result;
      result = (*(uint64_t (**)(_QWORD, _QWORD, uint64_t, double))(v1[5] + 128))(v1[6], v1[7], 1, NAN);
      v3 = v1[5];
      *(_BYTE *)(v3 + 979) = result;
      if ((_DWORD)result)
      {
        if ((*(_BYTE *)(v3 + 884) & 1) == 0)
        {
          v4 = (*(uint64_t (**)(_QWORD, _QWORD, uint64_t))(v3 + 80))(v1[6], v1[7], v2);
          SnapOptions = FigPlayerInterstitialEventGetSnapOptions(v4);
          result = fpic_ApplyResumptionOffset(v1[6], 1, (SnapOptions >> 1) & 1, v1[7], 0);
          *(_DWORD *)(*(_QWORD *)(v1[4] + 8) + 24) = result;
        }
      }
    }
  }
  return result;
}

@end
