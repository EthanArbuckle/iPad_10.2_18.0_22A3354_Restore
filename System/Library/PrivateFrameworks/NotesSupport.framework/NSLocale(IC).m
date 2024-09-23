@implementation NSLocale(IC)

- (uint64_t)localeIsArabic
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "localeIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "hasPrefix:", CFSTR("ar"));

  return v2;
}

@end
