@implementation AMFIShouldShowDeveloperModeSettings

uint64_t __AMFIShouldShowDeveloperModeSettings_block_invoke(uint64_t a1, _BYTE *a2)
{
  uint64_t result;

  if (a2[16] || a2[17])
    return 1;
  result = 1;
  if (!a2[20])
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    return 0;
  }
  return result;
}

@end
