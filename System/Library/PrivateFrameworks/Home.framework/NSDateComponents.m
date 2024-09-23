@implementation NSDateComponents

void __64__NSDateComponents_Additions__hf_dailyWeekdayIntervalComponents__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "hf_dailyWeekdayIntervalComponentsWithCalendar:", v4);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_MergedGlobals_230;
  _MergedGlobals_230 = v2;

}

id __77__NSDateComponents_Additions__hf_dailyWeekdayIntervalComponentsWithCalendar___block_invoke(uint64_t a1)
{
  id v2;

  v2 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  objc_msgSend(v2, "setWeekday:", (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))++);
  return v2;
}

uint64_t __57__NSDateComponents_Additions__hf_dailyIntervalComponents__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  v1 = (void *)qword_1ED378E48;
  qword_1ED378E48 = (uint64_t)v0;

  return objc_msgSend((id)qword_1ED378E48, "setDay:", 1);
}

uint64_t __58__NSDateComponents_Additions__hf_weeklyIntervalComponents__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  v1 = (void *)qword_1ED378E58;
  qword_1ED378E58 = (uint64_t)v0;

  return objc_msgSend((id)qword_1ED378E58, "setWeekOfYear:", 1);
}

uint64_t __60__NSDateComponents_Additions__hf_biweeklyIntervalComponents__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  v1 = (void *)qword_1ED378E68;
  qword_1ED378E68 = (uint64_t)v0;

  return objc_msgSend((id)qword_1ED378E68, "setWeekOfYear:", 2);
}

uint64_t __59__NSDateComponents_Additions__hf_monthlyIntervalComponents__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  v1 = (void *)qword_1ED378E78;
  qword_1ED378E78 = (uint64_t)v0;

  return objc_msgSend((id)qword_1ED378E78, "setMonth:", 1);
}

uint64_t __58__NSDateComponents_Additions__hf_yearlyIntervalComponents__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  v1 = (void *)qword_1ED378E88;
  qword_1ED378E88 = (uint64_t)v0;

  return objc_msgSend((id)qword_1ED378E88, "setYear:", 1);
}

uint64_t __47__NSDateComponents_Additions__hf_absoluteValue__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *(void **)(a1 + 32);
  v4 = objc_msgSend(*(id *)(a1 + 40), "valueForComponent:", a2);
  if (v4 >= 0)
    v5 = v4;
  else
    v5 = -v4;
  return objc_msgSend(v3, "setValue:forComponent:", v5, a2);
}

uint64_t __47__NSDateComponents_Additions__hf_negativeValue__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setValue:forComponent:", -objc_msgSend(*(id *)(a1 + 40), "valueForComponent:", a2), a2);
}

id __71__NSDateComponents_Additions__hf_compareNextMatchingDate_withCalendar___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;

  v3 = a2;
  if (objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32)))
  {
    v4 = *(id *)(a1 + 40);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "nextDateAfterDate:matchingComponents:options:", *(_QWORD *)(a1 + 40), v3, 1024);
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

uint64_t __76__NSDateComponents_Additions__hf_zeroDateComponentsWithComponents_calendar___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setValue:forComponent:", objc_msgSend(*(id *)(a1 + 40), "minimumRangeOfUnit:", a2), a2);
}

uint64_t __49__NSDateComponents_Additions__hf_validComponents__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "valueForComponent:", a2);
  if (result != 0x7FFFFFFFFFFFFFFFLL)
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) |= a2;
  return result;
}

@end
