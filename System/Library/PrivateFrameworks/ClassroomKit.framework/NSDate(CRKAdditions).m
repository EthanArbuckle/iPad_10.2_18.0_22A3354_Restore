@implementation NSDate(CRKAdditions)

- (BOOL)crk_isInPast
{
  void *v2;
  void *v3;
  _BOOL8 v4;

  v2 = (void *)objc_opt_new();
  objc_msgSend(a1, "earlierDate:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == a1;

  return v4;
}

- (id)crk_JSONStringValue
{
  void *v2;
  void *v3;

  objc_msgSend((id)objc_opt_class(), "crk_sharedDateFormatter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringFromDate:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)crk_sharedDateFormatter
{
  if (crk_sharedDateFormatter_onceToken != -1)
    dispatch_once(&crk_sharedDateFormatter_onceToken, &__block_literal_global_65);
  return (id)crk_sharedDateFormatter_formatter;
}

@end
