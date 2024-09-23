@implementation DDResultExtractDayMonthYear

void __DDResultExtractDayMonthYear_block_invoke_2(uint64_t a1)
{
  __CFCalendar *v2;
  const __CFLocale *v3;
  __CFCalendar *v4;
  const __CFString *v5;
  int v6;
  CFTypeRef Value;
  const void *v8;

  if (DDResultExtractDayMonthYear_firstWeekDayLocale != *(_QWORD *)(a1 + 40))
  {
    DDResultExtractDayMonthYear_firstWeekDayLocale = *(_QWORD *)(a1 + 40);
    v2 = CFCalendarCopyCurrent();
    v3 = *(const __CFLocale **)(a1 + 40);
    if (v2)
    {
      v4 = v2;
      CFCalendarSetLocale(v2, v3);
      DDResultExtractDayMonthYear_actualFirstWeekDay = MEMORY[0x1A1ACA274](v4);
      CFRelease(v4);
    }
    else
    {
      if (v3
        && (v5 = (const __CFString *)MEMORY[0x1A1ACA418](*(_QWORD *)(a1 + 40)), CFStringHasSuffix(v5, CFSTR("US"))))
      {
        v6 = 1;
      }
      else
      {
        v6 = 2;
      }
      DDResultExtractDayMonthYear_actualFirstWeekDay = v6;
    }
  }
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = DDResultExtractDayMonthYear_actualFirstWeekDay;
  if (*(_DWORD *)(a1 + 48))
  {
    Value = CFLocaleGetValue(*(CFLocaleRef *)(a1 + 40), (CFLocaleKey)*MEMORY[0x1E0C9B060]);
    if (Value)
    {
      v8 = Value;
      if (CFEqual(Value, CFSTR("JP"))
        || CFEqual(v8, CFSTR("CN"))
        || CFEqual(v8, CFSTR("TW"))
        || CFEqual(v8, CFSTR("HK"))
        || CFEqual(v8, CFSTR("MO")))
      {
        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 2;
      }
    }
  }
}

dispatch_queue_t __DDResultExtractDayMonthYear_block_invoke()
{
  dispatch_queue_t result;

  result = dispatch_queue_create("com.apple.datadetectors.extraction.locale", 0);
  DDResultExtractDayMonthYear_sQueue = (uint64_t)result;
  return result;
}

@end
