@implementation RWIProtocolNetworkResourceTiming

double __103__RWIProtocolNetworkResourceTiming_IKJSInspector__ik_networkResourceTimingFromData_referenceStartDate___block_invoke(uint64_t a1, double a2)
{
  double v2;
  void *v4;
  double v5;
  double v6;
  double v7;

  v2 = 0.0;
  if (a2 > 0.0)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timeIntervalSince1970");
    v6 = v5;
    objc_msgSend(*(id *)(a1 + 32), "timeIntervalSince1970");
    v2 = v6 - v7;

  }
  return v2;
}

double __103__RWIProtocolNetworkResourceTiming_IKJSInspector__ik_networkResourceTimingFromData_referenceStartDate___block_invoke_2(uint64_t a1, double a2)
{
  double v2;

  v2 = 0.0;
  if (a2 > 0.0)
    return (a2 - *(double *)(a1 + 32)) * 1000.0;
  return v2;
}

@end
