@implementation DKWakeRequestMonitor

uint64_t __30___DKWakeRequestMonitor_start__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "obtainNextUserVisibleWakeRequest");
}

void __30___DKWakeRequestMonitor_start__block_invoke_2(uint64_t a1)
{
  NSObject *v1;
  dispatch_time_t v2;

  v1 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 168);
  v2 = dispatch_walltime(0, 2000000000);
  dispatch_source_set_timer(v1, v2, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
}

_QWORD *__57___DKWakeRequestMonitor_synchronouslyReflectCurrentValue__block_invoke(uint64_t a1)
{
  _QWORD *result;

  result = *(_QWORD **)(a1 + 32);
  if (!result[19])
    return (_QWORD *)objc_msgSend(result, "obtainNextUserVisibleWakeRequest");
  return result;
}

@end
