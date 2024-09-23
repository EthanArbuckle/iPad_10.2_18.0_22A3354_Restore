@implementation ZN14IPCAURegistrar43ApplicationStateChangedNotificationCallbackEP22

const __CFNumber *___ZN14IPCAURegistrar43ApplicationStateChangedNotificationCallbackEP22__CFNotificationCenterPvPK10__CFStringPKvPK14__CFDictionary_block_invoke(uint64_t a1)
{
  uint64_t v1;
  const __CFDictionary *v2;
  const __CFNumber *result;
  uint64_t i;
  __CFString *v5;
  unsigned int v6[2];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(const __CFDictionary **)(a1 + 40);
  *(_QWORD *)v6 = 0;
  result = GetNumber(v2, (const __CFString *)*MEMORY[0x1E0DAB0B8], &v6[1]);
  if (v6[1] == 8)
  {
    result = GetNumber(v2, (const __CFString *)*MEMORY[0x1E0DAB0E0], v6);
    if (v6[0])
    {
      for (i = *(_QWORD *)(v1 + 232); i != *(_QWORD *)(v1 + 240); i += 8)
      {
        if (*(_DWORD *)(*(_QWORD *)i + 12) == v6[0])
        {
          v5 = 0;
          result = (const __CFNumber *)GetString(v2, (const __CFString *)*MEMORY[0x1E0DAB0D0], (const __CFString **)&v5);
          if (v5)
            return (const __CFNumber *)IPCAURegistrar::RecordApplicationActiveTime((CFMutableDictionaryRef *)v1, v5);
          return result;
        }
      }
    }
  }
  return result;
}

@end
