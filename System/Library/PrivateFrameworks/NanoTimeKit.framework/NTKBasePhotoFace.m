@implementation NTKBasePhotoFace

+ (BOOL)_customEditModeIsRows:(int64_t)a3 forDevice:(id)a4
{
  return a3 == 14;
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
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  NTKAllUtilitySmallFlatComplicationTypes();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NTKAllUtilityLargeNarrowComplicationTypes();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = CFSTR("top");
  NTKComplicationTypeRankedListWithDefaultTypes(&unk_1E6CA8AB8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NTKComplicationSlotDescriptor(6, v2, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  v10[1] = CFSTR("bottom");
  NTKComplicationTypeRankedListWithDefaultTypes(&unk_1E6CA8AD0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NTKComplicationSlotDescriptor(104, v3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)_defaultSelectedComplicationSlotForDevice:(id)a3
{
  return CFSTR("top");
}

+ (id)_orderedComplicationSlots
{
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("top");
  v3[1] = CFSTR("bottom");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_localizedNameForComplicationSlot:(id)a3
{
  id v3;
  const __CFString *v4;
  int v5;
  void *v6;
  void *v7;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("top")) & 1) != 0)
  {
    v4 = CFSTR("ABOVE_TIME");
  }
  else
  {
    v5 = objc_msgSend(v3, "isEqualToString:", CFSTR("bottom"));
    v4 = CFSTR("BELOW_TIME");
    if (!v5)
      v4 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SLOT_LABEL_%@"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NTKClockFaceLocalizedString(v6, CFSTR("slot name"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)_allowsEditing
{
  void *v2;
  BOOL v3;

  -[NTKFace resourceDirectory](self, "resourceDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

+ (id)_localizedNameOverrideForCustomEditMode:(int64_t)a3 forDevice:(id)a4
{
  if (a3 != 14)
    return 0;
  NTKCompanionClockFaceLocalizedString(CFSTR("EDIT_MODE_LABEL_PHOTO_POSITION_COMPANION"), CFSTR("Time Position"));
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
