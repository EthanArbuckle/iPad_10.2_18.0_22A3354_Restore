@implementation ACHFormatEnergyWithUserUnit

void __ACHFormatEnergyWithUserUnit_block_invoke()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_alloc_init(MEMORY[0x24BDD1538]);
  v1 = (void *)ACHFormatEnergyWithUserUnit__formatter;
  ACHFormatEnergyWithUserUnit__formatter = (uint64_t)v0;

  objc_msgSend((id)ACHFormatEnergyWithUserUnit__formatter, "numberFormatter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setFormattingContext:", 1);

}

@end
