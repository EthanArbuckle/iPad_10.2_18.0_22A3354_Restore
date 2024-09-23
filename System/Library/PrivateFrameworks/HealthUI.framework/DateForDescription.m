@implementation DateForDescription

void ___DateForDescription_block_invoke()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)_DateForDescription_dateFormatter;
  _DateForDescription_dateFormatter = (uint64_t)v0;

  objc_msgSend((id)_DateForDescription_dateFormatter, "setDateFormat:", CFSTR("yyyy-MMM-dd@HH:mm:ss zzz"));
  objc_msgSend(MEMORY[0x1E0C99E80], "systemTimeZone");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_DateForDescription_dateFormatter, "setTimeZone:", v2);

}

@end
