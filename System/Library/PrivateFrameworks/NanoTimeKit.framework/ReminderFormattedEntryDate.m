@implementation ReminderFormattedEntryDate

uint64_t __ReminderFormattedEntryDate_block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)ReminderFormattedEntryDate___formatter;
  ReminderFormattedEntryDate___formatter = (uint64_t)v0;

  return objc_msgSend((id)ReminderFormattedEntryDate___formatter, "setDateFormat:", CFSTR("MM-dd-yy hh:mm:ss a"));
}

@end
