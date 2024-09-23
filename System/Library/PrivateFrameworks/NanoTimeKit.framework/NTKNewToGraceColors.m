@implementation NTKNewToGraceColors

void __NTKNewToGraceColors_block_invoke()
{
  uint64_t v0;
  void *v1;
  _OWORD v2[3];
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2[0] = xmmword_1B755F580;
  v2[1] = unk_1B755F590;
  v2[2] = xmmword_1B755F5A0;
  v3 = 60;
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexes:count:", v2, 7);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)NTKNewToGraceColors_graceColors;
  NTKNewToGraceColors_graceColors = v0;

}

@end
