@implementation ACHFormatPercent

uint64_t __ACHFormatPercent_block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDD16F0]);
  v1 = (void *)ACHFormatPercent__formatter;
  ACHFormatPercent__formatter = (uint64_t)v0;

  return objc_msgSend((id)ACHFormatPercent__formatter, "setNumberStyle:", 3);
}

@end
