@implementation ACHFormatEnergyUnit

void __ACHFormatEnergyUnit_block_invoke()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_alloc_init(MEMORY[0x24BDD1538]);
  v1 = (void *)ACHFormatEnergyUnit__formatter;
  ACHFormatEnergyUnit__formatter = (uint64_t)v0;

  objc_msgSend((id)ACHFormatEnergyUnit__formatter, "setUnitStyle:", 3);
  objc_msgSend((id)ACHFormatEnergyUnit__formatter, "numberFormatter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setFormattingContext:", 1);

}

@end
