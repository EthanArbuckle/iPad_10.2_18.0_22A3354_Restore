@implementation CLKRemovesPunctuationFromWeekdayDay

void __CLKRemovesPunctuationFromWeekdayDay_block_invoke()
{
  id v0;

  CLKLocalizedString(CFSTR("DATE_WEEKDAY_DAY_REMOVE_PUNCTUATION"));
  v0 = (id)objc_claimAutoreleasedReturnValue();
  CLKRemovesPunctuationFromWeekdayDay_removesPunctuation = objc_msgSend(v0, "BOOLValue");

}

@end
