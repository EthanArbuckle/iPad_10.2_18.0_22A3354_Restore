@implementation AXPositionalStyleDurationStringForDuration

uint64_t __AXPositionalStyleDurationStringForDuration_block_invoke()
{
  id v0;
  void *v1;
  id v2;
  void *v3;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3570]);
  v1 = (void *)AXPositionalStyleDurationStringForDuration_minuteSecondFormatter;
  AXPositionalStyleDurationStringForDuration_minuteSecondFormatter = (uint64_t)v0;

  objc_msgSend((id)AXPositionalStyleDurationStringForDuration_minuteSecondFormatter, "setAllowedUnits:", 192);
  objc_msgSend((id)AXPositionalStyleDurationStringForDuration_minuteSecondFormatter, "setUnitsStyle:", 0);
  objc_msgSend((id)AXPositionalStyleDurationStringForDuration_minuteSecondFormatter, "setZeroFormattingBehavior:", 1);
  v2 = objc_alloc_init(MEMORY[0x1E0CB3570]);
  v3 = (void *)AXPositionalStyleDurationStringForDuration_hourMinuteSecondFormatter;
  AXPositionalStyleDurationStringForDuration_hourMinuteSecondFormatter = (uint64_t)v2;

  objc_msgSend((id)AXPositionalStyleDurationStringForDuration_hourMinuteSecondFormatter, "setAllowedUnits:", 224);
  objc_msgSend((id)AXPositionalStyleDurationStringForDuration_hourMinuteSecondFormatter, "setUnitsStyle:", 0);
  return objc_msgSend((id)AXPositionalStyleDurationStringForDuration_hourMinuteSecondFormatter, "setZeroFormattingBehavior:", 1);
}

@end
