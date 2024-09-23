@implementation NTKBlackcombFace

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
  void *v11;
  void *v13;
  _QWORD v14[4];
  _QWORD v15[5];

  v15[4] = *MEMORY[0x1E0C80C00];
  NTKAllSignatureCircularTypes();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NTKAllExtendedSignatureCircularTypes();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  NTKComplicationTypeRankedListWithDefaultTypes(&unk_1E6CA8B00);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NTKComplicationTypeRankedListWithDefaultTypes(&unk_1E6CA8B18);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NTKComplicationTypeRankedListWithDefaultTypes(&unk_1E6CA8B30);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NTKComplicationTypeRankedListWithDefaultTypes(&unk_1E6CA8B48);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = CFSTR("subdial-top");
  NTKComplicationSlotDescriptor(10, v13, v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v7;
  v14[1] = CFSTR("subdial-left");
  NTKComplicationSlotDescriptor(10, v2, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v8;
  v14[2] = CFSTR("subdial-right");
  NTKComplicationSlotDescriptor(10, v2, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v9;
  v14[3] = CFSTR("subdial-bottom");
  NTKComplicationSlotDescriptor(10, v2, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[3] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)_defaultSelectedComplicationSlotForDevice:(id)a3
{
  return CFSTR("subdial-top");
}

+ (id)_orderedComplicationSlots
{
  _QWORD v3[5];

  v3[4] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("subdial-top");
  v3[1] = CFSTR("subdial-left");
  v3[2] = CFSTR("subdial-right");
  v3[3] = CFSTR("subdial-bottom");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_customEditModes
{
  return &unk_1E6CA8B60;
}

- (id)_defaultOptionForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v6 = a4;
  if (a3 == 10)
  {
    -[NTKFace device](self, "device");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = NTKDefaultFaceColorForDeviceCollection(v9, 200);

    -[NTKFace device](self, "device");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[NTKFaceColorEditOption optionWithFaceColor:forDevice:](NTKFaceColorMonochromeEditOption, "optionWithFaceColor:forDevice:", v10, v7);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a3 != 15)
    {
      v11 = 0;
      goto LABEL_7;
    }
    -[NTKFace device](self, "device");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[NTKBlackcombDialColorEditOption optionWithBlackcombDialColor:forDevice:](NTKBlackcombDialColorEditOption, "optionWithBlackcombDialColor:forDevice:", 0, v7);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v11 = (void *)v8;

LABEL_7:
  return v11;
}

- (unint64_t)_numberOfOptionsForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  objc_class *v5;
  void *v6;
  unint64_t v7;

  v5 = -[NTKBlackcombFace _optionClassForCustomEditMode:](self, "_optionClassForCustomEditMode:", a3, a4);
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

  v7 = -[NTKBlackcombFace _optionClassForCustomEditMode:](self, "_optionClassForCustomEditMode:", a4);
  -[NTKFace device](self, "device");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[objc_class optionAtIndex:forDevice:](v7, "optionAtIndex:forDevice:", a3, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (unint64_t)_indexOfOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v7;
  objc_class *v8;
  void *v9;
  unint64_t v10;

  v7 = a3;
  v8 = -[NTKBlackcombFace _optionClassForCustomEditMode:](self, "_optionClassForCustomEditMode:", a4);
  -[NTKFace device](self, "device");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[objc_class indexOfOption:forDevice:](v8, "indexOfOption:forDevice:", v7, v9);

  return v10;
}

- (Class)_optionClassForCustomEditMode:(int64_t)a3
{
  if (a3 != 15 && a3 != 10)
    return (Class)0;
  objc_opt_class();
  return (Class)(id)objc_claimAutoreleasedReturnValue();
}

+ (id)_localizedNameOverrideForCustomEditMode:(int64_t)a3 forDevice:(id)a4
{
  void *v4;
  void *v5;
  objc_super v7;

  if (a3 == 15)
  {
    objc_msgSend(CFSTR("EDIT_MODE_BLACKCOMB_LABEL_STYLE"), "stringByAppendingString:", CFSTR("_COMPANION"), a4);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    NTKCompanionClockFaceLocalizedString(v4, CFSTR("edit mode"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    return v5;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___NTKBlackcombFace;
    objc_msgSendSuper2(&v7, sel__localizedNameOverrideForCustomEditMode_forDevice_, a3, a4);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

+ (id)_richComplicationSlotsForDevice:(id)a3
{
  _QWORD v4[5];

  v4[4] = *MEMORY[0x1E0C80C00];
  v4[0] = CFSTR("subdial-top");
  v4[1] = CFSTR("subdial-left");
  v4[2] = CFSTR("subdial-right");
  v4[3] = CFSTR("subdial-bottom");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)allowedComplicationsForSlot:(id)a3 includingComplication:(id)a4
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  char v17;
  id v18;
  void *v19;
  void *v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  objc_super v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v27.receiver = self;
  v27.super_class = (Class)NTKBlackcombFace;
  -[NTKFace allowedComplicationsForSlot:includingComplication:](&v27, sel_allowedComplicationsForSlot_includingComplication_, v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("subdial-top")) & 1) == 0)
  {
    v18 = v7;
    goto LABEL_19;
  }
  v21 = v7;
  v22 = v6;
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (!v9)
  {
LABEL_13:

LABEL_17:
    v18 = v8;
    goto LABEL_18;
  }
  v10 = v9;
  v11 = *(_QWORD *)v24;
LABEL_4:
  v12 = 0;
  while (1)
  {
    if (*(_QWORD *)v24 != v11)
      objc_enumerationMutation(v8);
    v13 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v12);
    if (objc_msgSend(v13, "complicationType", v21, v22, (_QWORD)v23) != 48)
      goto LABEL_11;
    v14 = v13;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v14, "complication");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "bundleIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("com.apple.NanoTimeKit.DigitalTime"));

      if ((v17 & 1) != 0)
        break;
    }

LABEL_11:
    if (v10 == ++v12)
    {
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      if (v10)
        goto LABEL_4;
      goto LABEL_13;
    }
  }

  if (!v14)
    goto LABEL_17;
  v19 = (void *)objc_msgSend(v8, "mutableCopy");
  objc_msgSend(v19, "removeObject:", v14);
  v18 = (id)objc_msgSend(v19, "copy");

LABEL_18:
  v7 = v21;
  v6 = v22;
LABEL_19:

  return v18;
}

- (BOOL)requiresPigmentEditOption
{
  return 0;
}

+ (id)pigmentFaceDomain
{
  return CFSTR("meridian");
}

@end
