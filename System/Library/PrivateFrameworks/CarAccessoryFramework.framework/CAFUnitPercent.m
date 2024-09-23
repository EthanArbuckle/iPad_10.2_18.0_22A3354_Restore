@implementation CAFUnitPercent

+ (id)baseUnit
{
  return +[CAFUnitPercent percent](CAFUnitPercent, "percent");
}

+ (CAFUnitPercent)percent
{
  if (percent_onceToken_116 != -1)
    dispatch_once(&percent_onceToken_116, &__block_literal_global_117);
  return (CAFUnitPercent *)(id)percent__percent;
}

void __25__CAFUnitPercent_percent__block_invoke()
{
  CAFUnitPercent *v0;
  void *v1;
  id v2;

  v2 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD18C8]), "initWithCoefficient:", 1.0);
  v0 = -[NSDimension initWithSymbol:converter:]([CAFUnitPercent alloc], "initWithSymbol:converter:", CFSTR("%"), v2);
  v1 = (void *)percent__percent;
  percent__percent = (uint64_t)v0;

}

@end
