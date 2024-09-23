@implementation RWIProtocolCSSSourceRange

uint64_t __72__RWIProtocolCSSSourceRange_IKJSInspector__ik_rangeWithNewLineIndexSet___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t result;

  v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  if (v6 == (int)objc_msgSend(*(id *)(a1 + 32), "startLine"))
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a2 + 1;
  v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  result = objc_msgSend(*(id *)(a1 + 32), "endLine");
  if (v7 == (int)result)
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = a2 + 1;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) == -100
    || *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) == -100)
  {
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  }
  else
  {
    *a3 = 1;
  }
  return result;
}

@end
