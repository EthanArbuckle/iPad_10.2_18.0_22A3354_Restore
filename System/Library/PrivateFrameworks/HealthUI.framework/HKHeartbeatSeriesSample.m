@implementation HKHeartbeatSeriesSample

uint64_t __76__HKHeartbeatSeriesSample_HKDataMetadataSampleExtensions__sequenceChartData__block_invoke(uint64_t a1, char a2, double a3)
{
  HKHeartbeatSequencePoint *v5;

  if ((a2 & 1) != 0)
  {
    if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  }
  else if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    v5 = -[HKHeartbeatSequencePoint initWithTimeInterval:beatsPerMinute:]([HKHeartbeatSequencePoint alloc], "initWithTimeInterval:beatsPerMinute:", a3, 1.0 / ((a3 - *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24)) / 60.0));
    objc_msgSend(*(id *)(a1 + 32), "addSequencePoint:section:", v5, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24));

  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a3;
  return 1;
}

@end
