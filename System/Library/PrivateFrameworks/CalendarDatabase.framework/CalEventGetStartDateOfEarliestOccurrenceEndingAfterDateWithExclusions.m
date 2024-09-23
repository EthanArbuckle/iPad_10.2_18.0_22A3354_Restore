@implementation CalEventGetStartDateOfEarliestOccurrenceEndingAfterDateWithExclusions

uint64_t __CalEventGetStartDateOfEarliestOccurrenceEndingAfterDateWithExclusions_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  CalEventGetStartDateInTimeZone(a2, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  CalEventGetStartDateInTimeZone((uint64_t)v6, *(void **)(a1 + 32));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v7, "compare:", v8);
  return v9;
}

@end
