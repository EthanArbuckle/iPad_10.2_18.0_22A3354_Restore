@implementation CalAnalyticsSendEventLazy

id __CalAnalyticsSendEventLazy_block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  v2 = (void *)objc_opt_new();
  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
    (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v2);
  return v2;
}

@end
