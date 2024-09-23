@implementation NTKKaleidoscopeRichFace

+ (id)_complicationSlotDescriptors
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[3];
  _QWORD v13[4];

  v13[3] = *MEMORY[0x1E0C80C00];
  NTKAllSignatureCornerTypes();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = CFSTR("top-left");
  NTKComplicationTypeRankedListWithDefaultTypes(&unk_1E6CAA540);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NTKMultiFamilyComplicationSlotDescriptor((uint64_t)&unk_1E6CAA528, (uint64_t)v2, (uint64_t)v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v4;
  v12[1] = CFSTR("top-right");
  NTKComplicationTypeRankedListWithDefaultTypes(&unk_1E6CAA558);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NTKMultiFamilyComplicationSlotDescriptor((uint64_t)&unk_1E6CAA528, (uint64_t)v2, (uint64_t)v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v6;
  v12[2] = CFSTR("bottom-center");
  NTKAllUtilityLargeComplicationTypes();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NTKComplicationTypeRankedListWithDefaultTypes(&unk_1E6CAA570);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  NTKComplicationSlotDescriptor(3, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)_richComplicationSlotsForDevice:(id)a3
{
  _QWORD v4[3];

  v4[2] = *MEMORY[0x1E0C80C00];
  v4[0] = CFSTR("top-left");
  v4[1] = CFSTR("top-right");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)sortableFaceWithAssets:(id)a3 forDevice:(id)a4
{
  return (id)objc_msgSend(a1, "_sortableFaceOfStyle:withAssets:", 223, a3);
}

@end
