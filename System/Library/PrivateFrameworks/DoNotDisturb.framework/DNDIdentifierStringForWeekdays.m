@implementation DNDIdentifierStringForWeekdays

uint64_t __DNDIdentifierStringForWeekdays_block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  void *v3;
  const __CFString *v4;

  if ((unint64_t)(a2 + 2) > 9)
    v2 = 0;
  else
    v2 = qword_19AC329C0[a2 + 2];
  if ((v2 & *(_QWORD *)(result + 40)) != 0)
  {
    v3 = *(void **)(result + 32);
    if ((unint64_t)(a2 + 2) > 9)
      v4 = CFSTR("M");
    else
      v4 = off_1E39B59E8[a2 + 2];
    return objc_msgSend(v3, "appendString:", v4);
  }
  return result;
}

@end
