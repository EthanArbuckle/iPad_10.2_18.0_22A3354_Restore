@implementation NSDateFormatter

uint64_t __58__NSDateFormatter_MessageUIAdditions__ef_isoDateFormatter__block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;

  v0 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
  v1 = (void *)ef_isoDateFormatter_dateFormatter;
  ef_isoDateFormatter_dateFormatter = (uint64_t)v0;

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeZone");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)ef_isoDateFormatter_dateFormatter, "setTimeZone:", v3);

  return objc_msgSend((id)ef_isoDateFormatter_dateFormatter, "setFormatOptions:", 3955);
}

@end
