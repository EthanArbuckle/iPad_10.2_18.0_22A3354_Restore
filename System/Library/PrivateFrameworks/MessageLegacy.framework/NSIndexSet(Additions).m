@implementation NSIndexSet(Additions)

- (const)mf_commaSeparatedString
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t i;

  if (!objc_msgSend(a1, "count"))
    return &stru_1E81CBE50;
  v2 = objc_msgSend(a1, "firstIndex");
  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("%lu"), v2);
  v4 = objc_msgSend(a1, "indexGreaterThanIndex:", v2);
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    for (i = v4; i != 0x7FFFFFFFFFFFFFFFLL; i = objc_msgSend(a1, "indexGreaterThanIndex:", i))
      objc_msgSend(v3, "appendFormat:", CFSTR(",%lu"), i);
  }
  return (const __CFString *)v3;
}

@end
