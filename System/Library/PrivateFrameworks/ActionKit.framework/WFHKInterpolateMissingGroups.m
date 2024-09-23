@implementation WFHKInterpolateMissingGroups

void __WFHKInterpolateMissingGroups_block_invoke(uint64_t a1, uint64_t a2, const char *a3)
{
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  objc_msgSend(*(id *)(a1 + 32), "conversionCalendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "components:fromDate:toDate:options:", a2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0);
  v19 = (id)objc_claimAutoreleasedReturnValue();

  NSStringFromSelector(a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "valueForKeyPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "integerValue");

  if (v9 >= 2)
  {
    for (i = 1; i != v9; ++i)
    {
      v11 = (void *)MEMORY[0x22E315218]();
      v12 = objc_alloc_init(MEMORY[0x24BDBCE68]);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", i);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a3);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setValue:forKeyPath:", v13, v14);

      objc_msgSend(*(id *)(a1 + 32), "conversionCalendar");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "dateByAddingComponents:toDate:options:", v12, *(_QWORD *)(a1 + 40), 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v17 = *(void **)(a1 + 56);
      objc_msgSend(*(id *)(a1 + 32), "transformedValue:", v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addObject:", v18);

      objc_autoreleasePoolPop(v11);
    }
  }

}

@end
