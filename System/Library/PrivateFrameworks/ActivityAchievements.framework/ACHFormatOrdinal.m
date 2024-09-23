@implementation ACHFormatOrdinal

uint64_t __ACHFormatOrdinal_block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDD16F0]);
  v1 = (void *)ACHFormatOrdinal__formatter;
  ACHFormatOrdinal__formatter = (uint64_t)v0;

  return objc_msgSend((id)ACHFormatOrdinal__formatter, "setNumberStyle:", 6);
}

@end
