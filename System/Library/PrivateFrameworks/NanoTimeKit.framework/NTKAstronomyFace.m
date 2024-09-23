@implementation NTKAstronomyFace

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
  v10[0] = CFSTR("top-right");
  NTKComplicationTypeRankedListWithDefaultTypes(&unk_1E6CAA048);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NTKComplicationSlotDescriptor(6, v2, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  v10[1] = CFSTR("bottom");
  NTKComplicationTypeRankedListWithDefaultTypes(&unk_1E6CAA060);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NTKComplicationSlotDescriptor(104, v3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_complicationSlotDescriptors
{
  void *v3;
  unsigned int v4;
  objc_super v6;

  -[NTKFace device](self, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "nrDeviceVersion");

  if (v4 < 0x50000)
    return MEMORY[0x1E0C9AA70];
  v6.receiver = self;
  v6.super_class = (Class)NTKAstronomyFace;
  -[NTKFace _complicationSlotDescriptors](&v6, sel__complicationSlotDescriptors);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_defaultSelectedComplicationSlotForDevice:(id)a3
{
  if (objc_msgSend(a3, "nrDeviceVersion") >= 0x50000)
    return CFSTR("top-right");
  else
    return 0;
}

+ (id)_orderedComplicationSlots
{
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("top-right");
  v3[1] = CFSTR("bottom");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_orderedComplicationSlots
{
  void *v3;
  unsigned int v4;
  objc_super v6;

  -[NTKFace device](self, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "nrDeviceVersion");

  if (v4 < 0x50000)
    return 0;
  v6.receiver = self;
  v6.super_class = (Class)NTKAstronomyFace;
  -[NTKFace _orderedComplicationSlots](&v6, sel__orderedComplicationSlots);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_localizedNameForComplicationSlot:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  __CFString *v7;
  const __CFString *v8;
  int v9;
  void *v10;

  v4 = a3;
  -[NTKFace device](self, "device");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "nrDeviceVersion");

  if (v6 >= 0x50000)
  {
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("top-right")) & 1) != 0)
    {
      v8 = CFSTR("TOP");
    }
    else
    {
      v9 = objc_msgSend(v4, "isEqualToString:", CFSTR("bottom"));
      v8 = CFSTR("BOTTOM");
      if (!v9)
        v8 = 0;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SLOT_LABEL_%@"), v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    NTKClockFaceLocalizedString(v10, CFSTR("slot name"));
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = &stru_1E6BDC918;
  }

  return v7;
}

- (id)_customEditModes
{
  void *v2;
  unsigned int v3;

  -[NTKFace device](self, "device");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "nrDeviceVersion");

  if (v3 >= 0x50000)
    return &unk_1E6CAA078;
  else
    return (id)MEMORY[0x1E0C9AA60];
}

- (id)_defaultOptionForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;

  -[NTKFace device](self, "device", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "nrDeviceVersion");

  if (v6 >= 0x50000)
  {
    -[NTKFace device](self, "device");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[NTKAstronomyVistaEditOption optionWithAstronomyVista:forDevice:](NTKAstronomyVistaEditOption, "optionWithAstronomyVista:forDevice:", 0, v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

+ (id)_localizedNameOverrideForCustomEditMode:(int64_t)a3 forDevice:(id)a4
{
  __CFString *v4;
  void *v5;

  if (a3 == 12)
  {
    if (objc_msgSend(a4, "nrDeviceVersion") >= 0x50000)
    {
      objc_msgSend(CFSTR("EDIT_MODE_LABEL_ASTRONOMY_CONTENT"), "stringByAppendingString:", CFSTR("_COMPANION"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      NTKCompanionClockFaceLocalizedString(v5, CFSTR("Vista"));
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v4 = &stru_1E6BDC918;
    }
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (unint64_t)_numberOfOptionsForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  void *v4;
  unint64_t v5;

  -[NTKFace device](self, "device", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = +[NTKEnumeratedEditOption numberOfOptionsForDevice:](NTKAstronomyVistaEditOption, "numberOfOptionsForDevice:", v4);

  return v5;
}

- (id)_optionAtIndex:(unint64_t)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  void *v6;
  void *v7;

  -[NTKFace device](self, "device", a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[NTKEnumeratedEditOption optionAtIndex:forDevice:](NTKAstronomyVistaEditOption, "optionAtIndex:forDevice:", a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (unint64_t)_indexOfOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v6;
  void *v7;
  unint64_t v8;

  v6 = a3;
  -[NTKFace device](self, "device");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = +[NTKEnumeratedEditOption indexOfOption:forDevice:](NTKAstronomyVistaEditOption, "indexOfOption:forDevice:", v6, v7);

  return v8;
}

- (BOOL)_snapshotContext:(id)a3 isStaleRelativeToContext:(id)a4
{
  id v6;
  id v7;
  double v8;
  BOOL v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)NTKAstronomyFace;
  if (!-[NTKFace _snapshotContext:isStaleRelativeToContext:](&v11, sel__snapshotContext_isStaleRelativeToContext_, v6, v7)&& objc_msgSend(v6, "calendarDateMatchesContext:", v7)&& objc_msgSend(v6, "localeMatchesContext:", v7))
  {
    objc_msgSend(v6, "distanceInKilometersFromContext:", v7);
    v9 = v8 > 500.0;
  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (Class)_optionClassForCustomEditMode:(int64_t)a3
{
  if (a3 != 12)
    return (Class)0;
  objc_opt_class();
  return (Class)(id)objc_claimAutoreleasedReturnValue();
}

- (id)_faceDescriptionForLibrary
{
  void *v3;
  unsigned int v4;
  void *v5;
  objc_super v7;

  -[NTKFace device](self, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "nrDeviceVersion");

  if (HIWORD(v4) > 4u)
  {
    v5 = 0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)NTKAstronomyFace;
    -[NTKFace _faceDescriptionForLibrary](&v7, sel__faceDescriptionForLibrary);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)_migratedFaceBundleIdentifier
{
  return CFSTR("com.apple.NTKAegirFaceBundle");
}

@end
