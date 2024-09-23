@implementation IOPMSetUserActivityIdleTimeout

uint64_t __IOPMSetUserActivityIdleTimeout_block_invoke(uint64_t a1)
{
  uint64_t result;
  int v3;

  result = *(_QWORD *)(a1 + 40);
  if (result && *(_QWORD *)(result + 48))
  {
    *(_DWORD *)(result + 56) = *(_DWORD *)(a1 + 48);
    result = sendUserActivityMsg(result, "userActivityTimeout");
    if (!(_DWORD)result)
      return result;
    v3 = 0;
  }
  else
  {
    v3 = -536870206;
  }
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v3;
  return result;
}

@end
