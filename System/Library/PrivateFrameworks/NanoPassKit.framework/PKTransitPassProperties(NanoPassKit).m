@implementation PKTransitPassProperties(NanoPassKit)

- (uint64_t)npkHasTransitBalance
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a1, "balanceAmount");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "amount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD1518], "zero");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v2, "isEqualToNumber:", v3) ^ 1;

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end
