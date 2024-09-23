@implementation NTKNewToHunterEOlympusColors

void ___NTKNewToHunterEOlympusColors_block_invoke()
{
  uint64_t v0;
  void *v1;
  _OWORD v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[2] = xmmword_1B755F800;
  v2[3] = unk_1B755F810;
  v2[4] = xmmword_1B755F820;
  v2[5] = unk_1B755F830;
  v2[0] = xmmword_1B755F7E0;
  v2[1] = unk_1B755F7F0;
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexes:count:", v2, 12);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_NTKNewToHunterEOlympusColors_hunterEColors;
  _NTKNewToHunterEOlympusColors_hunterEColors = v0;

}

@end
