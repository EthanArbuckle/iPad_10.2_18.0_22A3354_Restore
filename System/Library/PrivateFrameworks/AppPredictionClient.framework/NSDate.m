@implementation NSDate

void __66__NSDate_TimeManipulationForTesting__test_beginManipulationOfTime__block_invoke(uint64_t a1)
{
  void *v2;

  if (timeManipulationIsAllowed == 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), CFSTR("NSDate+TimeManipulationForTesting.m"), 45, CFSTR("Time manipulation is allowed already"));

  }
  swapMethodImplementations();
  timeManipulationIsAllowed = 1;
}

void __64__NSDate_TimeManipulationForTesting__test_endManipulationOfTime__block_invoke(uint64_t a1)
{
  void *v2;

  if ((timeManipulationIsAllowed & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), CFSTR("NSDate+TimeManipulationForTesting.m"), 56, CFSTR("Time manipulation is not allowed"));

  }
  swapMethodImplementations();
  timeManipulationIsAllowed = 0;
}

void __58__NSDate_TimeManipulationForTesting__test_setCurrentDate___block_invoke(uint64_t a1)
{
  void *v2;

  if ((timeManipulationIsAllowed & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), CFSTR("NSDate+TimeManipulationForTesting.m"), 65, CFSTR("Time manipulation is not allowed"));

  }
  objc_storeStrong((id *)&currentDate, *(id *)(a1 + 32));
}

void __77__NSDate_TimeManipulationForTesting__test_adjustCurrentDateWithTimeInterval___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;

  if ((timeManipulationIsAllowed & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), CFSTR("NSDate+TimeManipulationForTesting.m"), 73, CFSTR("Time manipulation is not allowed"));

  }
  objc_msgSend((id)currentDate, "dateByAddingTimeInterval:", *(double *)(a1 + 48));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)currentDate;
  currentDate = v2;

}

void __46__NSDate_TimeManipulationForTesting___atx_now__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), (id)currentDate);
}

void __47__NSDate_TimeManipulationForTesting___atx_date__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), (id)currentDate);
}

void __72__NSDate_TimeManipulationForTesting___atx_dateWithTimeIntervalSinceNow___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend((id)currentDate, "dateByAddingTimeInterval:", *(double *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __73__NSDate_TimeManipulationForTesting___atx_timeIntervalSinceReferenceDate__block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = objc_msgSend((id)currentDate, "timeIntervalSinceReferenceDate");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v3;
  return result;
}

uint64_t __63__NSDate_TimeManipulationForTesting___atx_timeIntervalSinceNow__block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = objc_msgSend(*(id *)(a1 + 32), "timeIntervalSinceDate:", currentDate);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

@end
