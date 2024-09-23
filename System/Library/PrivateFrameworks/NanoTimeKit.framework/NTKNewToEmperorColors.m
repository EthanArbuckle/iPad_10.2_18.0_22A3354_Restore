@implementation NTKNewToEmperorColors

void __NTKNewToEmperorColors_block_invoke()
{
  uint64_t v0;
  void *v1;
  __int128 v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = xmmword_1B755F6C0;
  v3 = 44;
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexes:count:", &v2, 3);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)NTKNewToEmperorColors_emperorColors;
  NTKNewToEmperorColors_emperorColors = v0;

}

@end
