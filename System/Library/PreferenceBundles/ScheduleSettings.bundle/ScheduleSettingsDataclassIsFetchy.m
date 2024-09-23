@implementation ScheduleSettingsDataclassIsFetchy

uint64_t __ScheduleSettingsDataclassIsFetchy_block_invoke()
{
  id v0;
  uint64_t result;

  v0 = objc_alloc(MEMORY[0x24BDBCF20]);
  result = objc_msgSend(v0, "initWithObjects:", *MEMORY[0x24BDB45E0], *MEMORY[0x24BDB4598], *MEMORY[0x24BDB4580], *MEMORY[0x24BDB4620], *MEMORY[0x24BDB4560], *MEMORY[0x24BDB4608], 0);
  ScheduleSettingsDataclassIsFetchy_fetchyDataclassSet = result;
  return result;
}

@end
