@implementation CFAbsoluteTimeForGregorianZuluDay

CFAbsoluteTime __CFAbsoluteTimeForGregorianZuluDay_block_invoke(uint64_t a1, CFCalendarRef calendar)
{
  uint64_t v3;
  uint64_t v4;
  CFAbsoluteTime result;
  uint64_t v6;
  CFAbsoluteTime at;

  v3 = *(unsigned int *)(a1 + 40);
  v4 = *(unsigned int *)(a1 + 44);
  v6 = *(unsigned int *)(a1 + 48);
  at = NAN;
  CFCalendarComposeAbsoluteTime(calendar, &at, "yMd", v3, v4, v6);
  result = at;
  *(CFAbsoluteTime *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = at;
  return result;
}

@end
