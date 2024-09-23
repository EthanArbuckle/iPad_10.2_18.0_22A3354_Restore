@implementation UIFont(EKDayOccurrenceView)

+ (id)ek_defaultOccurrenceSecondaryTextFont
{
  if ((dyld_program_sdk_at_least() & 1) != 0)
    return 0;
  objc_msgSend(MEMORY[0x1E0D0CD98], "defaultOccurrenceSecondaryTextFont");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)ek_defaultOccurrencePrimaryTextFontForSizeClass:()EKDayOccurrenceView
{
  void *v4;

  if ((dyld_program_sdk_at_least() & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D0CD98], "defaultOccurrencePrimaryTextFontForSizeClass:", a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

+ (id)ek_defaultOccurrenceSmallPrimaryTextFontForSizeClass:()EKDayOccurrenceView
{
  void *v4;

  if ((dyld_program_sdk_at_least() & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D0CD98], "defaultOccurrenceSmallPrimaryTextFontForSizeClass:", a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

@end
