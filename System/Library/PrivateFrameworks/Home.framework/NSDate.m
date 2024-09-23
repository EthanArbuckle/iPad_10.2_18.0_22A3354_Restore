@implementation NSDate

void __38__NSDate_Additions__hf_sharedCalendar__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99D48], "autoupdatingCurrentCalendar");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED379590;
  qword_1ED379590 = v0;

}

void __38__NSDate_Additions__hf_sharedTimeZone__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E80], "localTimeZone");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED3795A0;
  qword_1ED3795A0 = v0;

}

@end
