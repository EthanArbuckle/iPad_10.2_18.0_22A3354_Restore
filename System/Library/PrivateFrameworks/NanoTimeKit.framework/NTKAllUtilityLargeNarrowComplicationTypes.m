@implementation NTKAllUtilityLargeNarrowComplicationTypes

void __NTKAllUtilityLargeNarrowComplicationTypes_block_invoke()
{
  uint64_t v0;
  void *v1;
  _OWORD v2[14];
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2[10] = xmmword_1B7560448;
  v2[11] = unk_1B7560458;
  v2[12] = xmmword_1B7560468;
  v2[13] = unk_1B7560478;
  v2[6] = xmmword_1B7560408;
  v2[7] = unk_1B7560418;
  v2[8] = xmmword_1B7560428;
  v2[9] = unk_1B7560438;
  v2[2] = xmmword_1B75603C8;
  v2[3] = unk_1B75603D8;
  v2[4] = xmmword_1B75603E8;
  v2[5] = unk_1B75603F8;
  v2[0] = xmmword_1B75603A8;
  v2[1] = unk_1B75603B8;
  v3 = 56;
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexes:count:", v2, 29);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)NTKAllUtilityLargeNarrowComplicationTypes_utilityLargeNarrow;
  NTKAllUtilityLargeNarrowComplicationTypes_utilityLargeNarrow = v0;

}

@end
