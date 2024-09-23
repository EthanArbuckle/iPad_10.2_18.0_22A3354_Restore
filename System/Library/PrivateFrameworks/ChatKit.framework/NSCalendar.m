@implementation NSCalendar

void __47__NSCalendar_CKUtilities____ck_currentCalendar__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99D48], "autoupdatingCurrentCalendar");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)__ck_currentCalendar_sCalendar;
  __ck_currentCalendar_sCalendar = v0;

}

@end
