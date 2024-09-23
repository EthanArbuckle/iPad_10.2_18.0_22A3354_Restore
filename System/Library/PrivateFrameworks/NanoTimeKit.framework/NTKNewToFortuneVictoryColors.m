@implementation NTKNewToFortuneVictoryColors

void ___NTKNewToFortuneVictoryColors_block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[2];

  v2[1] = *MEMORY[0x1E0C80C00];
  v2[0] = 9;
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexes:count:", v2, 1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_NTKNewToFortuneVictoryColors_victoryFortuneColors;
  _NTKNewToFortuneVictoryColors_victoryFortuneColors = v0;

}

@end
