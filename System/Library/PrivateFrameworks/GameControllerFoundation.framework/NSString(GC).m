@implementation NSString(GC)

- (uint64_t)gc_countOfOccurrencesOfString:()GC options:
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v6 = a3;
  v7 = objc_msgSend(a1, "length");
  v8 = 0;
  v9 = -1;
  while (v6)
  {
    v10 = objc_msgSend(a1, "rangeOfString:options:range:", v6, a4, v8, v7 - v8);
    v8 = v10 + v11;
    ++v9;
    if (v10 == 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_6;
  }
  v9 = 0;
LABEL_6:

  return v9;
}

@end
