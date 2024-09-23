@implementation NTKNewToGloryVictoryColors

void ___NTKNewToGloryVictoryColors_block_invoke()
{
  uint64_t v0;
  void *v1;
  _OWORD v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[2] = xmmword_1B755F6F8;
  v2[3] = unk_1B755F708;
  v2[4] = xmmword_1B755F718;
  v2[5] = unk_1B755F728;
  v2[0] = xmmword_1B755F6D8;
  v2[1] = unk_1B755F6E8;
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexes:count:", v2, 12);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_NTKNewToGloryVictoryColors_victoryGloryColors;
  _NTKNewToGloryVictoryColors_victoryGloryColors = v0;

}

@end
