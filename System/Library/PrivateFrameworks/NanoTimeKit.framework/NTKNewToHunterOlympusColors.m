@implementation NTKNewToHunterOlympusColors

void ___NTKNewToHunterOlympusColors_block_invoke()
{
  uint64_t v0;
  void *v1;
  _OWORD v2[4];
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2[0] = xmmword_1B755F798;
  v2[1] = unk_1B755F7A8;
  v2[2] = xmmword_1B755F7B8;
  v2[3] = unk_1B755F7C8;
  v3 = 39;
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexes:count:", v2, 9);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_NTKNewToHunterOlympusColors_hunterColors;
  _NTKNewToHunterOlympusColors_hunterColors = v0;

}

@end
