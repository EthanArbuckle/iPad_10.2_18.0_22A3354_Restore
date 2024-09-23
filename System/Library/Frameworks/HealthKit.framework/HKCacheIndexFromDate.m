@implementation HKCacheIndexFromDate

uint64_t ___HKCacheIndexFromDate_block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "components:fromDate:", 30, *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setCalendar:", *(_QWORD *)(a1 + 32));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = _HKCacheIndexFromDateComponents(v2);

  return 1;
}

@end
