@implementation NSDateFormatter(FamilyCircle)

+ (id)aaf_standardFormatter
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setLocale:", v1);

  objc_msgSend(v0, "setTimeStyle:", 0);
  objc_msgSend(v0, "setDateStyle:", 1);
  objc_msgSend(v0, "setDoesRelativeDateFormatting:", 1);
  return v0;
}

@end
