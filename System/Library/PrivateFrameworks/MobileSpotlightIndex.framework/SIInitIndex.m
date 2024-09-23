@implementation SIInitIndex

uint64_t __SIInitIndex_block_invoke_2(uint64_t a1, uint64_t a2)
{
  int v2;
  uint64_t v3;
  int v4;

  v2 = *(_DWORD *)(a2 + 48);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if ((v2 + 1) > *(_DWORD *)(v3 + 24))
    v4 = v2 + 1;
  else
    v4 = *(_DWORD *)(v3 + 24);
  *(_DWORD *)(v3 + 24) = v4;
  return 1;
}

uint64_t __SIInitIndex_block_invoke_860(uint64_t a1)
{
  uint64_t result;
  Boolean keyExistsAndHasValidFormat;

  SIInitIndex_override = 0;
  SIInitIndex_lowLatency = (*(_DWORD *)(*(_QWORD *)(a1 + 32) + 6584) & 0x40000) != 0;
  keyExistsAndHasValidFormat = 0;
  result = CFPreferencesGetAppBooleanValue(CFSTR("LOW_LATENCY"), CFSTR("com.apple.SpotlightServer"), &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
  {
    SIInitIndex_lowLatency = (_DWORD)result != 0;
    SIInitIndex_override = 1;
  }
  return result;
}

void __SIInitIndex_block_invoke_866(uint64_t a1, int a2)
{
  if (!a2)
  {
    db_set_ignore_vectors(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 1184), 0);
    _si_set_version_property(*(_QWORD *)(a1 + 32), CFSTR("VEC_EXT_CLEARED_JOURNALS"), 1);
  }
}

void __SIInitIndex_block_invoke_2_868(uint64_t a1)
{
  CFNumberRef v2;
  int valuePtr;

  valuePtr = 2;
  v2 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberIntType, &valuePtr);
  SISetProperty(*(_QWORD *)(a1 + 32), CFSTR("YukonRecomputedSizes"), v2);
  CFRelease(v2);
}

@end
