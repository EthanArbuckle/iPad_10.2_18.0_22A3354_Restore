@implementation MOLogLoadPreferences

BOOL ___MOLogLoadPreferences_block_invoke(uint64_t a1)
{
  _BOOL8 result;
  uint64_t v3;
  unsigned int v4;
  int v5;

  CFPreferencesSynchronize((CFStringRef)*MEMORY[0x1E0C9B228], CFSTR("mobile"), (CFStringRef)*MEMORY[0x1E0C9B250]);
  result = _MOLogGetPreferenceIntValue(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), (SInt32 *)(*(_QWORD *)(a1 + 32) + 44));
  v3 = *(_QWORD *)(a1 + 32);
  if (!result)
  {
    v5 = *(_DWORD *)(v3 + 48);
LABEL_6:
    *(_DWORD *)(v3 + 44) = v5;
    return result;
  }
  v4 = *(_DWORD *)(v3 + 44);
  if ((v4 & 0x80000000) == 0)
  {
    if (v4 < 8)
      return result;
    v5 = 7;
    goto LABEL_6;
  }
  *(_DWORD *)(v3 + 44) = 0;
  return result;
}

@end
