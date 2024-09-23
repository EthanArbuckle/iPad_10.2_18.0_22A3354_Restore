@implementation CAMTimerDurationFormatter

uint64_t __CAMTimerDurationFormatter_block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
  v1 = (void *)CAMTimerDurationFormatter_sharedCountFormatter;
  CAMTimerDurationFormatter_sharedCountFormatter = (uint64_t)v0;

  objc_msgSend((id)CAMTimerDurationFormatter_sharedCountFormatter, "setGeneratesDecimalNumbers:", 1);
  objc_msgSend((id)CAMTimerDurationFormatter_sharedCountFormatter, "setNumberStyle:", 1);
  return objc_msgSend((id)CAMTimerDurationFormatter_sharedCountFormatter, "setMinimumFractionDigits:", 0);
}

@end
