@implementation ASCompetitionCalculateTotalScore

uint64_t __ASCompetitionCalculateTotalScore_block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;

  v4 = (void *)MEMORY[0x24BDD16E0];
  v5 = a3;
  v6 = objc_msgSend(a2, "integerValue");
  v7 = objc_msgSend(v5, "integerValue");

  return objc_msgSend(v4, "numberWithInteger:", v7 + v6);
}

@end
