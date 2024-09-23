@implementation FPConfigurationSetAggregationInterval

void ___FPConfigurationSetAggregationInterval_block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = (unint64_t)(*(double *)(a1 + 40) * 1000000000.0);
  gFPAggregationIntervalNs = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  _aggregationTimerSource();
  v3 = objc_claimAutoreleasedReturnValue();
  v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  dispatch_source_set_timer(v3, 0, v2, v2);

}

@end
