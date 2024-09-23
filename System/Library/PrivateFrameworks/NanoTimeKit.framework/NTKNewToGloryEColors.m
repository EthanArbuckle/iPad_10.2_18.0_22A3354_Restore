@implementation NTKNewToGloryEColors

void __NTKNewToGloryEColors_block_invoke()
{
  uint64_t v0;
  void *v1;
  _OWORD v2[3];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = xmmword_1B755F8F0;
  v2[1] = xmmword_1B755F900;
  v2[2] = xmmword_1B755F910;
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexes:count:", v2, 6);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)NTKNewToGloryEColors_gloryEColors;
  NTKNewToGloryEColors_gloryEColors = v0;

}

@end
