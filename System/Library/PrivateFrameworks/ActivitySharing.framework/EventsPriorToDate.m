@implementation EventsPriorToDate

BOOL ___EventsPriorToDate_block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  double v4;
  double v5;
  double v6;
  _BOOL8 v7;

  objc_msgSend(a2, "timestamp");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceReferenceDate");
  v5 = v4;
  objc_msgSend(*(id *)(a1 + 32), "timeIntervalSinceReferenceDate");
  v7 = v5 <= v6;

  return v7;
}

@end
