@implementation CFOperatingSystemVersionGetCurrent

void ___CFOperatingSystemVersionGetCurrent_block_invoke()
{
  const __CFString *v0;
  const __CFString *v1;
  const __CFArray *ArrayBySeparatingStrings;
  const __CFArray *v3;
  CFIndex Count;
  unint64_t v5;
  const __CFString *ValueAtIndex;
  uint64_t IntValue;
  uint64_t v8;
  uint64_t v9;
  const __CFString *v10;
  const __CFString *v11;

  v0 = (const __CFString *)_CFCopySystemVersionDictionaryValue(CFSTR("ProductVersion"));
  if (v0)
  {
    v1 = v0;
    ArrayBySeparatingStrings = CFStringCreateArrayBySeparatingStrings(0, v0, CFSTR("."));
    if (ArrayBySeparatingStrings)
    {
      v3 = ArrayBySeparatingStrings;
      Count = CFArrayGetCount(ArrayBySeparatingStrings);
      if (Count < 1)
      {
        v8 = 0;
        v9 = 0;
        IntValue = -1;
      }
      else
      {
        v5 = Count;
        ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v3, 0);
        IntValue = CFStringGetIntValue(ValueAtIndex);
        if (v5 == 1)
        {
          v8 = 0;
          v9 = 0;
        }
        else
        {
          v10 = (const __CFString *)CFArrayGetValueAtIndex(v3, 1);
          v9 = CFStringGetIntValue(v10);
          if (v5 < 3)
          {
            v8 = 0;
          }
          else
          {
            v11 = (const __CFString *)CFArrayGetValueAtIndex(v3, 2);
            v8 = CFStringGetIntValue(v11);
          }
        }
      }
      CFRelease(v3);
    }
    else
    {
      v8 = 0;
      v9 = 0;
      IntValue = -1;
    }
    CFRelease(v1);
  }
  else
  {
    v8 = 0;
    v9 = 0;
    IntValue = -1;
  }
  *(_QWORD *)&_CFOperatingSystemVersionGetCurrent_version = IntValue;
  *((_QWORD *)&_CFOperatingSystemVersionGetCurrent_version + 1) = v9;
  qword_1ECCFA450 = v8;
}

@end
