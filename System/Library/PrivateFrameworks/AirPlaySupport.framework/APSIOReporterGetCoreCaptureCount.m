@implementation APSIOReporterGetCoreCaptureCount

uint64_t __APSIOReporterGetCoreCaptureCount_block_invoke(uint64_t a1)
{
  uint64_t IntegerValue;
  const __CFString *SubGroup;
  uint64_t ChannelName;
  const __CFString *v5;

  IntegerValue = IOReportSimpleGetIntegerValue();
  SubGroup = (const __CFString *)IOReportChannelGetSubGroup();
  ChannelName = IOReportChannelGetChannelName();
  if (SubGroup)
  {
    v5 = (const __CFString *)ChannelName;
    if (CFStringCompare(SubGroup, CFSTR("Pipe DriverLogs"), 0) == kCFCompareEqualTo
      && v5
      && CFStringHasSuffix(v5, CFSTR("Capture Requests")))
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = IntegerValue;
    }
  }
  return 0;
}

@end
