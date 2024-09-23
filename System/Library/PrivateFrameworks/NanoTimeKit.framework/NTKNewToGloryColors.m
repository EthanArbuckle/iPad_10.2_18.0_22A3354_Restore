@implementation NTKNewToGloryColors

void __NTKNewToGloryColors_block_invoke()
{
  uint64_t v0;
  void *v1;
  _OWORD v2[4];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = xmmword_1B755F540;
  v2[1] = unk_1B755F550;
  v2[2] = xmmword_1B755F560;
  v2[3] = unk_1B755F570;
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexes:count:", v2, 8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)NTKNewToGloryColors_gloryColors;
  NTKNewToGloryColors_gloryColors = v0;

}

@end
