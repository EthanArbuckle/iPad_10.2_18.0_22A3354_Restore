@implementation HKElectrocardiogram

uint64_t __58__HKElectrocardiogram_WDExtensions__wd_commaSeparatedData__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringFromNumber:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendString:", v5);

  return objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("\n"));
}

@end
