@implementation GregorianCalendar

void ___GregorianCalendar_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_GregorianCalendar___gregorianCalendar;
  _GregorianCalendar___gregorianCalendar = v0;

}

@end
