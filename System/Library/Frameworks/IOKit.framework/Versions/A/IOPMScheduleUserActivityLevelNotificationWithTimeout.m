@implementation IOPMScheduleUserActivityLevelNotificationWithTimeout

void __IOPMScheduleUserActivityLevelNotificationWithTimeout_block_invoke(uint64_t a1, void *a2)
{
  processUserActivityMsg(*(_QWORD *)(a1 + 32), a2);
}

BOOL __IOPMScheduleUserActivityLevelNotificationWithTimeout_block_invoke_2(uint64_t a1)
{
  __CFDictionary *UserActiveValidDict;
  CFNumberRef v3;
  _BOOL8 result;

  UserActiveValidDict = (__CFDictionary *)getUserActiveValidDict();
  v3 = CFNumberCreate(0, kCFNumberSInt64Type, *(const void **)(a1 + 40));
  CFDictionarySetValue(UserActiveValidDict, v3, (const void *)*MEMORY[0x1E0C9AE50]);
  if (v3)
    CFRelease(v3);
  result = sendUserActivityMsg(*(_QWORD *)(a1 + 40), "userActivityRegister");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end
