@implementation NTKColorMonogramComplicationFontForCharacterCount

void __NTKColorMonogramComplicationFontForCharacterCount_block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C944C0], "metricsWithDevice:identitySizeClass:", a2, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverride:forSizeClass:", 3, 16.0, 17.0);
  NTKColorMonogramComplicationFontForCharacterCount__large = v3;
  objc_msgSend(v2, "scaledValue:withOverride:forSizeClass:", 3, 15.0, 16.0);
  NTKColorMonogramComplicationFontForCharacterCount__medium = v4;
  v7[0] = &unk_1E6CA12C0;
  v7[1] = &unk_1E6CA12D8;
  v8[0] = &unk_1E6CA5338;
  v8[1] = &unk_1E6CA5348;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scaledValue:withOverrides:", v5, 13.5);
  NTKColorMonogramComplicationFontForCharacterCount__small = v6;

}

@end
