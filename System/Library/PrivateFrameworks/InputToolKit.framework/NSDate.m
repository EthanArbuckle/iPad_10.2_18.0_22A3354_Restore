@implementation NSDate

uint64_t __39__NSDate_ITK__itk_localDateWithSeconds__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDD1500]);
  v1 = (void *)itk_localDateWithSeconds_localFormatter;
  itk_localDateWithSeconds_localFormatter = (uint64_t)v0;

  objc_msgSend((id)itk_localDateWithSeconds_localFormatter, "setTimeStyle:", 3);
  return objc_msgSend((id)itk_localDateWithSeconds_localFormatter, "setDateStyle:", 1);
}

uint64_t __37__NSDate_ITK__itk_shortFormattedDate__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDD1500]);
  v1 = (void *)itk_shortFormattedDate_shortRelativeformatter;
  itk_shortFormattedDate_shortRelativeformatter = (uint64_t)v0;

  objc_msgSend((id)itk_shortFormattedDate_shortRelativeformatter, "setTimeStyle:", 1);
  objc_msgSend((id)itk_shortFormattedDate_shortRelativeformatter, "setDateStyle:", 1);
  return objc_msgSend((id)itk_shortFormattedDate_shortRelativeformatter, "setDoesRelativeDateFormatting:", 1);
}

uint64_t __37__NSDate_ITK__itk_shortFormattedDate__block_invoke_2()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDD1500]);
  v1 = (void *)itk_shortFormattedDate_shortStandardformatter;
  itk_shortFormattedDate_shortStandardformatter = (uint64_t)v0;

  objc_msgSend((id)itk_shortFormattedDate_shortStandardformatter, "setTimeStyle:", 1);
  return objc_msgSend((id)itk_shortFormattedDate_shortStandardformatter, "setDateStyle:", 1);
}

uint64_t __38__NSDate_ITK__itk_briefFormattedDate___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDD1500]);
  v1 = (void *)itk_briefFormattedDate__briefTodayFormatter;
  itk_briefFormattedDate__briefTodayFormatter = (uint64_t)v0;

  objc_msgSend((id)itk_briefFormattedDate__briefTodayFormatter, "setTimeStyle:", 1);
  return objc_msgSend((id)itk_briefFormattedDate__briefTodayFormatter, "setDateStyle:", 0);
}

void __38__NSDate_ITK__itk_briefFormattedDate___block_invoke_2()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v0 = objc_alloc_init(MEMORY[0x24BDD1500]);
  v1 = (void *)itk_briefFormattedDate__templateFormatter;
  itk_briefFormattedDate__templateFormatter = (uint64_t)v0;

  v2 = (void *)itk_briefFormattedDate__templateFormatter;
  v3 = (void *)MEMORY[0x24BDD1500];
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dateFormatFromTemplate:options:locale:", CFSTR("cccc"), 0, v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setDateFormat:", v4);

}

uint64_t __38__NSDate_ITK__itk_briefFormattedDate___block_invoke_3()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDD1500]);
  v1 = (void *)itk_briefFormattedDate__accessibilityDateFormatter;
  itk_briefFormattedDate__accessibilityDateFormatter = (uint64_t)v0;

  objc_msgSend((id)itk_briefFormattedDate__accessibilityDateFormatter, "setDateStyle:", 3);
  objc_msgSend((id)itk_briefFormattedDate__accessibilityDateFormatter, "setTimeStyle:", 0);
  return objc_msgSend((id)itk_briefFormattedDate__accessibilityDateFormatter, "setDoesRelativeDateFormatting:", 1);
}

uint64_t __38__NSDate_ITK__itk_briefFormattedDate___block_invoke_4()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDD1500]);
  v1 = (void *)itk_briefFormattedDate__briefRelativeFormatter;
  itk_briefFormattedDate__briefRelativeFormatter = (uint64_t)v0;

  objc_msgSend((id)itk_briefFormattedDate__briefRelativeFormatter, "setTimeStyle:", 0);
  objc_msgSend((id)itk_briefFormattedDate__briefRelativeFormatter, "setDateStyle:", 1);
  return objc_msgSend((id)itk_briefFormattedDate__briefRelativeFormatter, "setDoesRelativeDateFormatting:", 1);
}

@end
