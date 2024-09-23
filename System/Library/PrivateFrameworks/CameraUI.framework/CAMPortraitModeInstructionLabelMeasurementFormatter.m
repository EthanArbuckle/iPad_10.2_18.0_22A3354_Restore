@implementation CAMPortraitModeInstructionLabelMeasurementFormatter

void __CAMPortraitModeInstructionLabelMeasurementFormatter_block_invoke()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3760]);
  v1 = (void *)CAMPortraitModeInstructionLabelMeasurementFormatter_sharedFormatter;
  CAMPortraitModeInstructionLabelMeasurementFormatter_sharedFormatter = (uint64_t)v0;

  objc_msgSend((id)CAMPortraitModeInstructionLabelMeasurementFormatter_sharedFormatter, "setUnitOptions:", 1);
  objc_msgSend((id)CAMPortraitModeInstructionLabelMeasurementFormatter_sharedFormatter, "setUnitStyle:", 3);
  objc_msgSend((id)CAMPortraitModeInstructionLabelMeasurementFormatter_sharedFormatter, "numberFormatter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setMinimumFractionDigits:", 0);
  objc_msgSend(v2, "setMaximumFractionDigits:", 1);
  objc_msgSend(v2, "setRoundingMode:", 2);
  objc_msgSend(v2, "setRoundingIncrement:", &unk_1EA3B1800);

}

@end
