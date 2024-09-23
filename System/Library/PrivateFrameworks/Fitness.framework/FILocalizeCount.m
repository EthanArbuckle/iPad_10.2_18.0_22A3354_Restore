@implementation FILocalizeCount

uint64_t __FILocalizeCount_block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDD16F0]);
  v1 = (void *)FILocalizeCount___formatter;
  FILocalizeCount___formatter = (uint64_t)v0;

  objc_msgSend((id)FILocalizeCount___formatter, "setRoundingMode:", 3);
  return objc_msgSend((id)FILocalizeCount___formatter, "setMaximumFractionDigits:", 0);
}

@end
