@implementation NTKAllUtilitySmallFlatComplicationTypes

void __NTKAllUtilitySmallFlatComplicationTypes_block_invoke()
{
  uint64_t v0;
  void *v1;
  _OWORD v2[9];
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2[6] = xmmword_1B7560370;
  v2[7] = unk_1B7560380;
  v2[8] = xmmword_1B7560390;
  v2[2] = xmmword_1B7560330;
  v2[3] = unk_1B7560340;
  v2[4] = xmmword_1B7560350;
  v2[5] = unk_1B7560360;
  v2[0] = xmmword_1B7560310;
  v2[1] = unk_1B7560320;
  v3 = 56;
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexes:count:", v2, 19);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)NTKAllUtilitySmallFlatComplicationTypes_utilitySmallFlat;
  NTKAllUtilitySmallFlatComplicationTypes_utilitySmallFlat = v0;

}

@end
