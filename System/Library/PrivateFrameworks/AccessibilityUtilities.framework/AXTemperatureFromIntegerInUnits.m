@implementation AXTemperatureFromIntegerInUnits

uint64_t __AXTemperatureFromIntegerInUnits_block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
  v1 = (void *)AXTemperatureFromIntegerInUnits_formatter;
  AXTemperatureFromIntegerInUnits_formatter = (uint64_t)v0;

  return objc_msgSend((id)AXTemperatureFromIntegerInUnits_formatter, "setNumberStyle:", 1);
}

@end
