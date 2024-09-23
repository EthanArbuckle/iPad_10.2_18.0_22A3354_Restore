@implementation NTKNewToElectricVictoryColors

void ___NTKNewToElectricVictoryColors_block_invoke()
{
  uint64_t v0;
  void *v1;
  _OWORD v2[3];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = xmmword_1B755F920;
  v2[1] = xmmword_1B755F930;
  v2[2] = xmmword_1B755F940;
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexes:count:", v2, 6);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_NTKNewToElectricVictoryColors_victoryElectricColors;
  _NTKNewToElectricVictoryColors_victoryElectricColors = v0;

}

@end
