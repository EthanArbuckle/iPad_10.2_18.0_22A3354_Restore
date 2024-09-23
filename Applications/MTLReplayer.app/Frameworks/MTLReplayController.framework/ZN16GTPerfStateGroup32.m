@implementation ZN16GTPerfStateGroup32

int ___ZN16GTPerfStateGroup32_GatherSampleDataPeriodicSamplesERK18mach_timebase_info_block_invoke_2(id a1, __CFDictionary *a2)
{
  int Format;
  uint64_t ChannelName;
  void *v5;
  uint64_t UnitLabel;
  void *v7;
  uint64_t v8;
  uint64_t Unit;

  Format = IOReportChannelGetFormat(a2);
  if (Format)
  {
    if (Format == 1)
    {
      ChannelName = IOReportChannelGetChannelName(a2);
      v5 = (void *)objc_claimAutoreleasedReturnValue(ChannelName);
      IOReportChannelGetChannelID(a2);
      Unit = IOReportChannelGetUnit(a2);
      UnitLabel = IOReportChannelGetUnitLabel(a2);
      v7 = (void *)objc_claimAutoreleasedReturnValue(UnitLabel);
      IOReportSimpleGetIntegerValue(a2, &Unit);

    }
    else
    {
      IOReportChannelGetUnit(a2);
      v8 = IOReportChannelGetUnitLabel(a2);

    }
  }
  return 16;
}

@end
