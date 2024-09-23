@implementation ICLogDateString

void ____ICLogDateString_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)__ICLogDateString_currentCalendar;
  __ICLogDateString_currentCalendar = v0;

  __ICLogDateString_unitFlags = 1;
}

@end
