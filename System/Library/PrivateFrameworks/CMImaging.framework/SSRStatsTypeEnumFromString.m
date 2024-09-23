@implementation SSRStatsTypeEnumFromString

void __SSRStatsTypeEnumFromString_block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[10];
  _QWORD v3[11];

  v3[10] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("ToneMappedImage");
  v2[1] = CFSTR("ToneMappedImagePersonSegmentBased");
  v3[0] = &unk_1E9513D38;
  v3[1] = &unk_1E9513BD0;
  v2[2] = CFSTR("ToneMappedImageRedChannelSkinBased");
  v2[3] = CFSTR("ToneMappedImageGreenChannelSkinBased");
  v3[2] = &unk_1E9513BE8;
  v3[3] = &unk_1E9513C00;
  v2[4] = CFSTR("ToneMappedImageBlueChannelSkinBased");
  v2[5] = CFSTR("LinearImage");
  v3[4] = &unk_1E9513C18;
  v3[5] = &unk_1E9513C30;
  v2[6] = CFSTR("LinearImagePersonSegmentBased");
  v2[7] = CFSTR("LinearGTCImage");
  v3[6] = &unk_1E9513C48;
  v3[7] = &unk_1E9513C60;
  v2[8] = CFSTR("ToneMappedImageSkinBased");
  v2[9] = CFSTR("LinearImageSkinBased");
  v3[8] = &unk_1E9513C78;
  v3[9] = &unk_1E9513C90;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 10);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)SSRStatsTypeEnumFromString_map;
  SSRStatsTypeEnumFromString_map = v0;

}

@end
