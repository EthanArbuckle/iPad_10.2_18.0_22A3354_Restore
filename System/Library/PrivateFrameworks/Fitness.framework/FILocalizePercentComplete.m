@implementation FILocalizePercentComplete

uint64_t __FILocalizePercentComplete_block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDD16F0]);
  v1 = (void *)FILocalizePercentComplete___formatter;
  FILocalizePercentComplete___formatter = (uint64_t)v0;

  objc_msgSend((id)FILocalizePercentComplete___formatter, "setNumberStyle:", 3);
  objc_msgSend((id)FILocalizePercentComplete___formatter, "setMaximumFractionDigits:", 0);
  return objc_msgSend((id)FILocalizePercentComplete___formatter, "setRoundingMode:", 2);
}

@end
