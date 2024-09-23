@implementation NTKUpNextRichFace

+ (id)_leftSlotDescriptorTypes
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_opt_new();
  NTKAllSignatureCircularTypes();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addIndexes:", v3);

  objc_msgSend(v2, "addIndex:", 29);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36B8]), "initWithIndexSet:", v2);

  return v4;
}

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
  void *v11;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "_leftSlotDescriptorTypes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NTKAllUtilitySmallFlatComplicationTypes();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = &unk_1E6C9E1A0;
  v12[0] = CFSTR("top-left");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v11, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NTKComplicationTypeRankedListWithDefaultTypes(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NTKMultiFamilyComplicationSlotDescriptor((uint64_t)&unk_1E6CA96B8, (uint64_t)v2, (uint64_t)v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v6;
  v12[1] = CFSTR("top-right");
  NTKComplicationTypeRankedListWithDefaultTypes(&unk_1E6CA96D0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NTKComplicationSlotDescriptor(6, v3, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)_richComplicationSlotsForDevice:(id)a3
{
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v4[0] = CFSTR("top-left");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
