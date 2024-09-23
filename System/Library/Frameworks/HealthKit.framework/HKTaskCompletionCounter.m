@implementation HKTaskCompletionCounter

_QWORD *__44___HKTaskCompletionCounter_decrementCounter__block_invoke(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  --*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
  result = *(_QWORD **)(a1 + 32);
  if (!result[3])
  {
    v3 = result[1];
    if (v3)
    {
      (*(void (**)(_QWORD))(v3 + 16))(result[1]);
      result = *(_QWORD **)(a1 + 32);
    }
    return (_QWORD *)objc_msgSend(result, "_invalidate");
  }
  return result;
}

uint64_t __44___HKTaskCompletionCounter_incrementCounter__block_invoke(uint64_t result)
{
  ++*(_QWORD *)(*(_QWORD *)(result + 32) + 24);
  return result;
}

_QWORD *__44___HKTaskCompletionCounter_allTasksEnqueued__block_invoke(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = *(_QWORD **)(a1 + 32);
  if (!result[3])
  {
    v3 = result[1];
    if (v3)
    {
      (*(void (**)(_QWORD))(v3 + 16))(result[1]);
      result = *(_QWORD **)(a1 + 32);
    }
    return (_QWORD *)objc_msgSend(result, "_invalidate");
  }
  return result;
}

@end
