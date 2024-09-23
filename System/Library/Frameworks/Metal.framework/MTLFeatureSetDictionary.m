@implementation MTLFeatureSetDictionary

uint64_t ___MTLFeatureSetDictionary_block_invoke()
{
  uint64_t result;
  _QWORD v1[19];
  _QWORD v2[20];

  v2[19] = *MEMORY[0x1E0C80C00];
  v1[0] = CFSTR("MTLFeatureSet_iOS_GPUFamily1_v1");
  v1[1] = CFSTR("MTLFeatureSet_iOS_GPUFamily2_v1");
  v2[0] = &unk_1E103B240;
  v2[1] = &unk_1E103B258;
  v1[2] = CFSTR("MTLFeatureSet_iOS_GPUFamily1_v2");
  v1[3] = CFSTR("MTLFeatureSet_iOS_GPUFamily2_v2");
  v2[2] = &unk_1E103B270;
  v2[3] = &unk_1E103B288;
  v1[4] = CFSTR("MTLFeatureSet_iOS_GPUFamily3_v1");
  v1[5] = CFSTR("MTLFeatureSet_iOS_GPUFamily1_v3");
  v2[4] = &unk_1E103B2A0;
  v2[5] = &unk_1E103B2B8;
  v1[6] = CFSTR("MTLFeatureSet_iOS_GPUFamily2_v3");
  v1[7] = CFSTR("MTLFeatureSet_iOS_GPUFamily3_v2");
  v2[6] = &unk_1E103B2D0;
  v2[7] = &unk_1E103B2E8;
  v1[8] = CFSTR("MTLFeatureSet_iOS_GPUFamily1_v4");
  v1[9] = CFSTR("MTLFeatureSet_iOS_GPUFamily2_v4");
  v2[8] = &unk_1E103B300;
  v2[9] = &unk_1E103B318;
  v1[10] = CFSTR("MTLFeatureSet_iOS_GPUFamily3_v3");
  v1[11] = CFSTR("MTLFeatureSet_iOS_GPUFamily4_v1");
  v2[10] = &unk_1E103B330;
  v2[11] = &unk_1E103B348;
  v1[12] = CFSTR("MTLFeatureSet_iOS_GPUFamily1_v5");
  v1[13] = CFSTR("MTLFeatureSet_iOS_GPUFamily2_v5");
  v2[12] = &unk_1E103B360;
  v2[13] = &unk_1E103B378;
  v1[14] = CFSTR("MTLFeatureSet_iOS_GPUFamily3_v4");
  v1[15] = CFSTR("MTLFeatureSet_iOS_GPUFamily4_v2");
  v2[14] = &unk_1E103B390;
  v2[15] = &unk_1E103B3A8;
  v1[16] = CFSTR("MTLFeatureSet_iOS_GPUFamily5_v1");
  v1[17] = CFSTR("MTLFeatureSet_iOS_GPUFamily6_v1");
  v2[16] = &unk_1E103B3C0;
  v2[17] = &unk_1E103B3D8;
  v1[18] = CFSTR("MTLFeatureSet_iOS_GPUFamily7_v1");
  v2[18] = &unk_1E103B3F0;
  result = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v2, v1, 19);
  _MTLFeatureSetDictionary::featureSetDictionary = result;
  return result;
}

@end
