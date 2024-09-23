@implementation DisplayGetPowerAccumulatorDCP

uint64_t ____DisplayGetPowerAccumulatorDCP_block_invoke(uint64_t a1)
{
  void *ChannelName;

  ChannelName = (void *)IOReportChannelGetChannelName();
  if ((objc_msgSend(ChannelName, "isEqualToString:", CFSTR("power")) & 1) != 0)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = IOReportSimpleGetIntegerValue();
  }
  else if ((objc_msgSend(ChannelName, "isEqualToString:", CFSTR("instant_energy")) & 1) != 0)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = IOReportSimpleGetIntegerValue();
  }
  return 0;
}

@end
