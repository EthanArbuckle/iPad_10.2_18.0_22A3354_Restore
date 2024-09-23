@implementation DMCDateFormatterFactory

+ (id)isoDateFormatter
{
  if (isoDateFormatter_onceToken != -1)
    dispatch_once(&isoDateFormatter_onceToken, &__block_literal_global_5);
  return (id)isoDateFormatter_dateFormatter;
}

void __43__DMCDateFormatterFactory_isoDateFormatter__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)isoDateFormatter_dateFormatter;
  isoDateFormatter_dateFormatter = v0;

}

+ (id)isoLocalTimeZoneDateFormatter
{
  if (isoLocalTimeZoneDateFormatter_onceToken != -1)
    dispatch_once(&isoLocalTimeZoneDateFormatter_onceToken, &__block_literal_global_1_1);
  return (id)isoLocalTimeZoneDateFormatter_dateFormatter;
}

uint64_t __56__DMCDateFormatterFactory_isoLocalTimeZoneDateFormatter__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;

  v0 = objc_opt_new();
  v1 = (void *)isoLocalTimeZoneDateFormatter_dateFormatter;
  isoLocalTimeZoneDateFormatter_dateFormatter = v0;

  objc_msgSend(MEMORY[0x1E0C99E80], "localTimeZone");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)isoLocalTimeZoneDateFormatter_dateFormatter, "setTimeZone:", v2);

  return objc_msgSend((id)isoLocalTimeZoneDateFormatter_dateFormatter, "setFormatOptions:", 1907);
}

@end
