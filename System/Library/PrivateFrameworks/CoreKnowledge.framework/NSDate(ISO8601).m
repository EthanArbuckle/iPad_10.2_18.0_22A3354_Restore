@implementation NSDate(ISO8601)

- (id)ISO8601String
{
  id v2;
  void *v3;

  v2 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
  objc_msgSend(v2, "setFormatOptions:", objc_msgSend(v2, "formatOptions") | 0x800);
  objc_msgSend(v2, "stringFromDate:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
