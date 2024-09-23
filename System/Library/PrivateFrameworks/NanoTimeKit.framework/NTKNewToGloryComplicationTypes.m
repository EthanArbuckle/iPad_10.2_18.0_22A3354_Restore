@implementation NTKNewToGloryComplicationTypes

void __NTKNewToGloryComplicationTypes_block_invoke()
{
  uint64_t v0;
  void *v1;
  _OWORD v2[5];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[2] = xmmword_1B75602E0;
  v2[3] = unk_1B75602F0;
  v2[4] = xmmword_1B7560300;
  v2[0] = xmmword_1B75602C0;
  v2[1] = unk_1B75602D0;
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexes:count:", v2, 10);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)NTKNewToGloryComplicationTypes_glory;
  NTKNewToGloryComplicationTypes_glory = v0;

}

@end
