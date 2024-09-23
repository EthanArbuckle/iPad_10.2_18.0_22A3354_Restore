@implementation SecAbsoluteTimeGetGregorianDate

uint64_t __SecAbsoluteTimeGetGregorianDate_block_invoke(uint64_t a1, CFCalendarRef calendar)
{
  uint64_t result;

  result = CFCalendarDecomposeAbsoluteTime(calendar, *(CFAbsoluteTime *)(a1 + 40), "yMdHms", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = (_DWORD)result != 0;
  return result;
}

@end
