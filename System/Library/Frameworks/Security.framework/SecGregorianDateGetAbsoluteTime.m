@implementation SecGregorianDateGetAbsoluteTime

uint64_t __SecGregorianDateGetAbsoluteTime_block_invoke(uint64_t a1, CFCalendarRef calendar)
{
  uint64_t result;

  result = CFCalendarComposeAbsoluteTime(calendar, (CFAbsoluteTime *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24), "yMdHms", *(unsigned int *)(a1 + 48), *(unsigned int *)(a1 + 52), *(unsigned int *)(a1 + 56), *(unsigned int *)(a1 + 60), *(unsigned int *)(a1 + 64), *(unsigned int *)(a1 + 68));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = (_DWORD)result != 0;
  return result;
}

@end
