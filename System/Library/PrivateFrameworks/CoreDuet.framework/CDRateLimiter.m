@implementation CDRateLimiter

uint64_t __25___CDRateLimiter_debited__block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;

  result = objc_msgSend(*(id *)(a1 + 32), "recordTimeAndRefillIfNeeded");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(v3 + 16);
  *(_QWORD *)(v3 + 16) = v4 + 1;
  v5 = *(_QWORD *)(a1 + 32);
  if (v4 >= *(_QWORD *)(v5 + 40))
  {
    v6 = 0;
    --*(_QWORD *)(v5 + 16);
  }
  else
  {
    v6 = 1;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v6;
  return result;
}

void __35___CDRateLimiter_sharedRateLimiter__block_invoke()
{
  _CDRateLimiter *v0;
  void *v1;

  v0 = -[_CDRateLimiter initWithCount:perPeriod:]([_CDRateLimiter alloc], "initWithCount:perPeriod:", 300, 60.0);
  v1 = (void *)sharedRateLimiter__sharedRateLimiter;
  sharedRateLimiter__sharedRateLimiter = (uint64_t)v0;

}

uint64_t __24___CDRateLimiter_credit__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "recordTimeAndRefillIfNeeded");
  --*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
  return result;
}

@end
