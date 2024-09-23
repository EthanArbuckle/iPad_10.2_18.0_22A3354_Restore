@implementation OSLogIndexEnumerator

uint64_t __81___OSLogIndexEnumerator_enumerateTracepointsInRange_timesync_options_usingBlock___block_invoke(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t result;

  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = *(_QWORD *)(a2 + 8);
  v3 = *(_QWORD *)(a1[6] + 8);
  if (!*(_BYTE *)(v3 + 24))
  {
    if (*(_DWORD *)a2 == 1)
    {
      if (*(_QWORD *)(a2 + 1080))
        return 1;
    }
    else if ((*(_DWORD *)a2 - 1) >= 2)
    {
      *(_BYTE *)(v3 + 24) = 1;
    }
  }
  if (((*(uint64_t (**)(void))(a1[4] + 16))() & 1) == 0)
  {
    result = 0;
    *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = 0;
    return result;
  }
  return 1;
}

@end
