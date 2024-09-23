@implementation ACHFormatCount

uint64_t __ACHFormatCount_block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDD16F0]);
  v1 = (void *)ACHFormatCount__formatter;
  ACHFormatCount__formatter = (uint64_t)v0;

  objc_msgSend((id)ACHFormatCount__formatter, "setNumberStyle:", 1);
  objc_msgSend((id)ACHFormatCount__formatter, "setRoundingMode:", 3);
  return objc_msgSend((id)ACHFormatCount__formatter, "setMaximumFractionDigits:", 0);
}

@end
