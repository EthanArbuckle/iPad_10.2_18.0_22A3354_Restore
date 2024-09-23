@implementation NSString(CKAdditions)

- (uint64_t)compareToVersion:()CKAdditions
{
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __CFString *v11;
  uint64_t v12;
  const __CFString *v13;
  uint64_t result;

  v4 = (void *)objc_msgSend(a1, "componentsSeparatedByString:", CFSTR("."));
  v5 = (void *)objc_msgSend(a3, "componentsSeparatedByString:", CFSTR("."));
  v6 = objc_msgSend(v4, "count");
  if (v6 <= objc_msgSend(v5, "count"))
    v7 = v5;
  else
    v7 = v4;
  v8 = objc_msgSend(v7, "count");
  if (v8 < 1)
    return 0;
  v9 = v8;
  v10 = 0;
  while (1)
  {
    v11 = CFSTR("0");
    if (v10 < objc_msgSend(v4, "count"))
      v11 = (__CFString *)objc_msgSend(v4, "objectAtIndexedSubscript:", v10);
    v12 = objc_msgSend(v5, "count");
    v13 = CFSTR("0");
    if (v10 < v12)
      v13 = (const __CFString *)objc_msgSend(v5, "objectAtIndexedSubscript:", v10);
    result = -[__CFString compare:options:](v11, "compare:options:", v13, 64);
    if (result)
      break;
    if (v9 == ++v10)
      return 0;
  }
  return result;
}

@end
