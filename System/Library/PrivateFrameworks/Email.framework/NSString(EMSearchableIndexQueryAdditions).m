@implementation NSString(EMSearchableIndexQueryAdditions)

- (id)em_stringForQuotingWithCharacter:()EMSearchableIndexQueryAdditions
{
  void *v4;
  uint64_t v5;
  char i;
  char v7;

  v4 = (void *)objc_msgSend(a1, "mutableCopy");
  objc_msgSend(v4, "replaceOccurrencesOfString:withString:options:range:", CFSTR("\\"), CFSTR("\\\\"), 0, 0, objc_msgSend(v4, "length"));
  objc_msgSend(v4, "replaceOccurrencesOfString:withString:options:range:", CFSTR("*"), CFSTR("\\*"), 0, 0, objc_msgSend(v4, "length"));
  v5 = 0;
  for (i = 1; ; i = 0)
  {
    v7 = i;
    if (*((unsigned __int8 *)&em_stringForQuotingWithCharacter__map + 24 * v5) == a3)
      break;
    v5 = 1;
    if ((v7 & 1) == 0)
      return v4;
  }
  objc_msgSend(v4, "replaceOccurrencesOfString:withString:options:range:", *((_QWORD *)&em_stringForQuotingWithCharacter__map + 3 * v5 + 1), *((_QWORD *)&em_stringForQuotingWithCharacter__map + 3 * v5 + 2), 0, 0, objc_msgSend(v4, "length"));
  return v4;
}

@end
