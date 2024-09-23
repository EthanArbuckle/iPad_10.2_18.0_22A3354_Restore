@implementation NTKUpNextFace

- (int64_t)timeStyle
{
  return 1;
}

+ (id)_complicationSlotDescriptors
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v16;
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  NTKAllUtilitySmallFlatComplicationTypes();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NTKAllSmallComplicationTypes();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "addIndex:", 29);
  objc_msgSend(MEMORY[0x1E0C944B0], "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isRunningGraceOrLater");
  v7 = &unk_1E6C9E1B8;
  if (v6)
    v7 = &unk_1E6C9E1A0;
  v8 = v7;

  v16 = v8;
  v17[0] = CFSTR("top-left");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v16, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  NTKComplicationTypeRankedListWithDefaultTypes(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  NTKComplicationSlotDescriptor(0, v4, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v11;
  v17[1] = CFSTR("top-right");
  NTKComplicationTypeRankedListWithDefaultTypes(&unk_1E6CA9670);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  NTKComplicationSlotDescriptor(6, v2, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)_orderedComplicationSlots
{
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("top-left");
  v3[1] = CFSTR("top-right");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_customEditModes
{
  void *v2;
  unsigned int v3;

  -[NTKFace device](self, "device");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "nrDeviceVersion");

  if (v3 >= 0x50000)
    return &unk_1E6CA96A0;
  else
    return &unk_1E6CA9688;
}

- (int64_t)_customEditModeForUniqueConfiguration
{
  void *v2;
  unsigned int v3;

  -[NTKFace device](self, "device");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "nrDeviceVersion");

  if (v3 >= 0x50000)
    return 10;
  else
    return 0;
}

- (id)_defaultOptionForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  void *v4;
  void *v5;

  if (a3 == 10)
  {
    -[NTKFace device](self, "device", 10, a4);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[NTKFaceColorEditOption optionWithFaceColor:forDevice:](NTKFaceColorUpNextEditOption, "optionWithFaceColor:forDevice:", 201, v4);
  }
  else
  {
    -[NTKFace device](self, "device", a3, a4);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[NTKUpNextDisabledDataSourcesEditOption optionWithDisabledDataSourceIdentifiers:forDevice:](NTKUpNextDisabledDataSourcesEditOption, "optionWithDisabledDataSourceIdentifiers:forDevice:", 0, v4);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)_hasOptionsForCustomEditMode:(int64_t)a3
{
  void *v3;
  BOOL v4;

  if (a3 == 16)
    return 1;
  if (a3 != 10)
    return 0;
  -[NTKFace device](self, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "nrDeviceVersion") >> 16 > 4;

  return v4;
}

- (unint64_t)_numberOfOptionsForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  void *v4;
  unint64_t v5;

  if (a3 != 10)
    return 0;
  -[NTKFace device](self, "device", 10, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = +[NTKEnumeratedEditOption numberOfOptionsForDevice:](NTKFaceColorUpNextEditOption, "numberOfOptionsForDevice:", v4);

  return v5;
}

- (id)_optionAtIndex:(unint64_t)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  void *v6;
  void *v7;

  if (a4 == 10)
  {
    -[NTKFace device](self, "device", a3, 10, a5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[NTKEnumeratedEditOption optionAtIndex:forDevice:](NTKFaceColorUpNextEditOption, "optionAtIndex:forDevice:", a3, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (unint64_t)_indexOfOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v6;
  void *v7;
  unint64_t v8;

  if (a4 != 10)
    return 0x7FFFFFFFFFFFFFFFLL;
  v6 = a3;
  -[NTKFace device](self, "device");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = +[NTKEnumeratedEditOption indexOfOption:forDevice:](NTKFaceColorUpNextEditOption, "indexOfOption:forDevice:", v6, v7);

  return v8;
}

- (Class)_optionClassForCustomEditMode:(int64_t)a3
{
  if (a3 != 16 && a3 != 10)
    return (Class)0;
  objc_opt_class();
  return (Class)(id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)requiresPigmentEditOption
{
  return 0;
}

+ (id)pigmentFaceDomain
{
  return CFSTR("siri");
}

+ (Class)_faceClassOfFaceWithRichComplicationSlotsForDevice:(id)a3
{
  return (Class)objc_opt_class();
}

@end
