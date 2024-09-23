@implementation NSString(CRXUExtensions)

- (id)crxu_stringByRemovingPattern:()CRXUExtensions
{
  uint64_t v2;
  uint64_t v3;
  id v4;

  v2 = objc_msgSend(a1, "locationOfPattern:");
  if (v2 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v4 = a1;
  }
  else
  {
    objc_msgSend(a1, "stringByReplacingCharactersInRange:withString:", v2, v3, &stru_250B05E18);
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (BOOL)crxu_matchesPattern:()CRXUExtensions
{
  uint64_t v2;

  return !objc_msgSend(a1, "locationOfPattern:") && v2 == objc_msgSend(a1, "length");
}

- (uint64_t)locationOfPattern:()CRXUExtensions
{
  void *v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", a3, 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "rangeOfFirstMatchInString:options:range:", a1, 0, 0, objc_msgSend(a1, "length"));

  return v5;
}

- (id)crxu_stringByTrimmingWhitespace
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "stringByTrimmingCharactersInSet:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
