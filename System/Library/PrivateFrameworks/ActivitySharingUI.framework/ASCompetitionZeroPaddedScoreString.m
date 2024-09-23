@implementation ASCompetitionZeroPaddedScoreString

uint64_t __ASCompetitionZeroPaddedScoreString_block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDD16F0]);
  v1 = (void *)ASCompetitionZeroPaddedScoreString_formatter;
  ASCompetitionZeroPaddedScoreString_formatter = (uint64_t)v0;

  objc_msgSend((id)ASCompetitionZeroPaddedScoreString_formatter, "setMinimumIntegerDigits:", 2);
  objc_msgSend((id)ASCompetitionZeroPaddedScoreString_formatter, "setMaximumFractionDigits:", 0);
  return objc_msgSend((id)ASCompetitionZeroPaddedScoreString_formatter, "setNumberStyle:", 1);
}

@end
