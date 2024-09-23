@implementation NTKAnalogVideoFace

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
  NTKAllUtilitySmallComplicationTypes(a1, a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NTKAllUtilityLargeComplicationTypes();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = CFSTR("top-left");
  NTKComplicationTypeRankedListWithDefaultTypes(&unk_1E6CA9F40);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NTKComplicationSlotDescriptor(4, v2, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v5;
  v12[1] = CFSTR("top-right");
  NTKComplicationTypeRankedListWithDefaultTypes(&unk_1E6CA9F58);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NTKComplicationSlotDescriptor(4, v2, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v7;
  v12[2] = CFSTR("bottom-center");
  NTKComplicationTypeRankedListWithDefaultTypes(&unk_1E6CA9F70);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  NTKComplicationSlotDescriptor(3, v3, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)_orderedComplicationSlots
{
  _QWORD v3[4];

  v3[3] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("top-left");
  v3[1] = CFSTR("top-right");
  v3[2] = CFSTR("bottom-center");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_customEditModes
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)_defaultOptionForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  return 0;
}

- (unint64_t)_indexOfOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v7;
  objc_class *v8;
  void *v9;
  unint64_t v10;

  v7 = a3;
  v8 = -[NTKAnalogVideoFace _optionClassForCustomEditMode:](self, "_optionClassForCustomEditMode:", a4);
  -[NTKFace device](self, "device");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[objc_class indexOfOption:forDevice:](v8, "indexOfOption:forDevice:", v7, v9);

  return v10;
}

- (unint64_t)_numberOfOptionsForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  objc_class *v5;
  void *v6;
  unint64_t v7;

  v5 = -[NTKAnalogVideoFace _optionClassForCustomEditMode:](self, "_optionClassForCustomEditMode:", a3, a4);
  -[NTKFace device](self, "device");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[objc_class numberOfOptionsForDevice:](v5, "numberOfOptionsForDevice:", v6);

  return v7;
}

- (id)_optionAtIndex:(unint64_t)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  objc_class *v7;
  void *v8;
  void *v9;

  v7 = -[NTKAnalogVideoFace _optionClassForCustomEditMode:](self, "_optionClassForCustomEditMode:", a4);
  -[NTKFace device](self, "device");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[objc_class optionAtIndex:forDevice:](v7, "optionAtIndex:forDevice:", a3, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (Class)_optionClassForCustomEditMode:(int64_t)a3
{
  return 0;
}

@end
