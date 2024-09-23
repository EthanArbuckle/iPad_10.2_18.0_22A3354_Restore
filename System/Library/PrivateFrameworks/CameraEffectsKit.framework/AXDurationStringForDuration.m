@implementation AXDurationStringForDuration

uint64_t __AXDurationStringForDuration_block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)AXDurationStringForDuration_formatter;
  AXDurationStringForDuration_formatter = v0;

  objc_msgSend((id)AXDurationStringForDuration_formatter, "setZeroFormattingBehavior:", 1);
  objc_msgSend((id)AXDurationStringForDuration_formatter, "setUnitsStyle:", 4);
  return objc_msgSend((id)AXDurationStringForDuration_formatter, "setAllowedUnits:", 224);
}

@end
