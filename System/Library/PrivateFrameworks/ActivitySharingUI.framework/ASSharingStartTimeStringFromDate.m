@implementation ASSharingStartTimeStringFromDate

uint64_t __ASSharingStartTimeStringFromDate_block_invoke()
{
  id v0;
  void *v1;
  id v2;
  void *v3;

  v0 = objc_alloc_init(MEMORY[0x24BDD1500]);
  v1 = (void *)ASSharingStartTimeStringFromDate___todayFormatter;
  ASSharingStartTimeStringFromDate___todayFormatter = (uint64_t)v0;

  objc_msgSend((id)ASSharingStartTimeStringFromDate___todayFormatter, "setDateStyle:", 0);
  objc_msgSend((id)ASSharingStartTimeStringFromDate___todayFormatter, "setTimeStyle:", 1);
  v2 = objc_alloc_init(MEMORY[0x24BDD1500]);
  v3 = (void *)ASSharingStartTimeStringFromDate___notTodayFormatter;
  ASSharingStartTimeStringFromDate___notTodayFormatter = (uint64_t)v2;

  objc_msgSend((id)ASSharingStartTimeStringFromDate___notTodayFormatter, "setDateStyle:", 4);
  objc_msgSend((id)ASSharingStartTimeStringFromDate___notTodayFormatter, "setTimeStyle:", 0);
  return objc_msgSend((id)ASSharingStartTimeStringFromDate___notTodayFormatter, "setFormattingContext:", 5);
}

@end
