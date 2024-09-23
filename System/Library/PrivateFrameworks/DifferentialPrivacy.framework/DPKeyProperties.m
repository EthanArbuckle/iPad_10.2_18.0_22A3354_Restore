@implementation DPKeyProperties

void __30___DPKeyProperties_initialize__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[16];
  _QWORD v6[17];

  v6[16] = *MEMORY[0x1E0C80C00];
  v5[0] = &unk_1E96FB0B8;
  v5[1] = &unk_1E96FB0D0;
  v6[0] = CFSTR("OneBitHistogram");
  v6[1] = CFSTR("MultiBitHistogram");
  v5[2] = &unk_1E96FB0E8;
  v5[3] = &unk_1E96FB100;
  v6[2] = CFSTR("CompressedMultiBitHistogram");
  v6[3] = CFSTR("CountMedianSketch");
  v5[4] = &unk_1E96FB118;
  v5[5] = &unk_1E96FB130;
  v6[4] = CFSTR("HadamardCountMedianSketch");
  v6[5] = CFSTR("StatisticsMean");
  v5[6] = &unk_1E96FB148;
  v5[7] = &unk_1E96FB160;
  v6[6] = CFSTR("PrefixTrie");
  v6[7] = CFSTR("Prio");
  v5[8] = &unk_1E96FB178;
  v5[9] = &unk_1E96FB190;
  v6[8] = CFSTR("PrioCountMinSketch");
  v6[9] = CFSTR("OneHotEncoding");
  v5[10] = &unk_1E96FB1A8;
  v5[11] = &unk_1E96FB1C0;
  v6[10] = CFSTR("PrioPlusPlus");
  v6[11] = CFSTR("PrioPlusPlusMetrics");
  v5[12] = &unk_1E96FB1D8;
  v5[13] = &unk_1E96FB1F0;
  v6[12] = CFSTR("PrioPlusPlusMetadata");
  v6[13] = CFSTR("PrioPiRappor");
  v5[14] = &unk_1E96FB208;
  v5[15] = &unk_1E96FB220;
  v6[14] = CFSTR("Prio3SumVectorField64MultiproofHmacSha256Aes128");
  v6[15] = CFSTR("PINEHmacSha256Aes128");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 16);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)kAlgorithmStringsMap;
  kAlgorithmStringsMap = v0;

  v2 = (void *)kDataAlgorithmsMap;
  kDataAlgorithmsMap = (uint64_t)&unk_1E9748CC8;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E9748D20);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)kAlgorithmsWithEpsilon;
  kAlgorithmsWithEpsilon = v3;

}

void __39___DPKeyProperties_propertiesFromFile___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pathForResource:ofType:", CFSTR("override.keyproperties"), CFSTR("plist"));
  v5 = (id)objc_claimAutoreleasedReturnValue();

  +[_DPPListHelper loadPropertyListFromPath:overridePath:usingBlock:](_DPPListHelper, "loadPropertyListFromPath:overridePath:usingBlock:", *(_QWORD *)(a1 + 32), v5, &__block_literal_global_139);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)allKeyProperties;
  allKeyProperties = v3;

}

_DPKeyProperties *__39___DPKeyProperties_propertiesFromFile___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[_DPKeyProperties keyPropertiesWithName:fromDictionary:](_DPKeyProperties, "keyPropertiesWithName:fromDictionary:", a2, a3);
}

@end
