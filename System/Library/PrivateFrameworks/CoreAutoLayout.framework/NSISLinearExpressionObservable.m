@implementation NSISLinearExpressionObservable

uint64_t __66___NSISLinearExpressionObservable__lazilyObserveVariablesIfNeeded__block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 40);
  if (v1)
  {
    *(_BYTE *)(v1 + 80) = 1;
    result = _NSConstraintBasedLayoutVariableChangeTransactions();
    if ((result & 1) == 0)
      return -[_NSISLinearExpressionObservable emitValueIfNeeded](v1);
  }
  return result;
}

uint64_t __66___NSISLinearExpressionObservable__lazilyObserveVariablesIfNeeded__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "BOOLValue");
  if ((_DWORD)result)
    return -[_NSISLinearExpressionObservable emitValueIfNeeded](*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                          + 40));
  return result;
}

@end
