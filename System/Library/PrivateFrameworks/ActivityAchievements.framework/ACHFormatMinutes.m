@implementation ACHFormatMinutes

uint64_t __ACHFormatMinutes_block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDD14F8]);
  v1 = (void *)ACHFormatMinutes__formatter;
  ACHFormatMinutes__formatter = (uint64_t)v0;

  objc_msgSend((id)ACHFormatMinutes__formatter, "setUnitsStyle:", 3);
  return objc_msgSend((id)ACHFormatMinutes__formatter, "setAllowedUnits:", 64);
}

@end
