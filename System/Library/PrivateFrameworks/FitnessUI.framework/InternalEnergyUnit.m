@implementation InternalEnergyUnit

void ___InternalEnergyUnit_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD4048], "kilocalorieUnit");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_InternalEnergyUnit___unit;
  _InternalEnergyUnit___unit = v0;

}

@end
