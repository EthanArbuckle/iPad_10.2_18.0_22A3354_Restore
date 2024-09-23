@implementation NTKCKaleidoscopeFacesGalleryCollection

- (id)title
{
  return NTKClockFaceLocalizedString(CFSTR("FACE_STYLE_23_IN_TITLE_CASE"), CFSTR("Kaleidoscope"));
}

- (id)facesForDevice:(id)a3
{
  id v3;
  void *v4;
  int v5;
  uint64_t v6;
  void *v7;
  int v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("4CC676F2-E761-4AA8-AE40-1A40F3868BDE"));
  v5 = objc_msgSend(v3, "supportsCapability:", v4);

  if (v5)
  {
    objc_msgSend((id)objc_opt_class(), "_spring2023DefaultFacesForDevice:", v3);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("A19F7B33-B4B5-4859-8FDD-DEDA6FD71895"));
    v8 = objc_msgSend(v3, "supportsCapability:", v7);

    if (v8)
    {
      objc_msgSend((id)objc_opt_class(), "_fall2021DefaultFacesForDevice:", v3);
      v6 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("2CE80E5D-FA17-4BD4-A48C-DFC3A79FB8ED"));
      v10 = objc_msgSend(v3, "supportsCapability:", v9);

      v11 = (void *)objc_opt_class();
      if (v10)
        objc_msgSend(v11, "_spring2020DefaultFacesForDevice:", v3);
      else
        objc_msgSend(v11, "_legacyDefaultFacesForDevice:", v3);
      v6 = objc_claimAutoreleasedReturnValue();
    }
  }
  v12 = (void *)v6;

  return v12;
}

+ (id)defaultFaceForDevice:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a3;
  if (NTKShowBlueRidgeUI(v3))
    v4 = 223;
  else
    v4 = 23;
  +[NTKFace defaultFaceOfStyle:forDevice:](NTKFace, "defaultFaceOfStyle:forDevice:", v4, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)_spring2023DefaultFacesForDevice:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  if (objc_msgSend(&unk_1E6CAA5D0, "count"))
  {
    v6 = 0;
    do
    {
      objc_msgSend(a1, "defaultFaceForDevice:", v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(&unk_1E6CAA5D0, "objectAtIndex:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "unsignedIntegerValue");

      +[NTKKaleidoscopeAssetOption optionWithAsset:forDevice:](NTKKaleidoscopeAssetOption, "optionWithAsset:forDevice:", v9, v4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "selectOption:forCustomEditMode:slot:", v10, 12, 0);

      if (objc_msgSend(v4, "deviceCategory") == 1)
      {
        +[NTKKaleidoscopeStyleOption optionWithStyle:forDevice:](NTKKaleidoscopeStyleOption, "optionWithStyle:forDevice:", 0, v4);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "selectOption:forCustomEditMode:slot:", v11, 15, 0);
        +[NTKCKaleidoscopeFacesGalleryCollection spring2020ComplicationTypesBySlot](NTKCKaleidoscopeFacesGalleryCollection, "spring2020ComplicationTypesBySlot");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "_setFaceGalleryComplicationTypesForSlots:", v12);

      }
      else
      {
        +[NTKKaleidoscopeStyleOption optionWithStyle:forDevice:](NTKKaleidoscopeStyleOption, "optionWithStyle:forDevice:", 3, v4);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "selectOption:forCustomEditMode:slot:", v11, 15, 0);
      }

      objc_msgSend(v5, "addObject:", v7);
      ++v6;
    }
    while (v6 < objc_msgSend(&unk_1E6CAA5D0, "count"));
  }

  return v5;
}

+ (id)_fall2021DefaultFacesForDevice:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  if (objc_msgSend(&unk_1E6CAA5E8, "count"))
  {
    v6 = 0;
    do
    {
      objc_msgSend(a1, "defaultFaceForDevice:", v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(&unk_1E6CAA5E8, "objectAtIndex:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "unsignedIntegerValue");

      +[NTKKaleidoscopeAssetOption optionWithAsset:forDevice:](NTKKaleidoscopeAssetOption, "optionWithAsset:forDevice:", v9, v4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "selectOption:forCustomEditMode:slot:", v10, 12, 0);

      if (objc_msgSend(v4, "deviceCategory") == 1)
      {
        +[NTKKaleidoscopeStyleOption optionWithStyle:forDevice:](NTKKaleidoscopeStyleOption, "optionWithStyle:forDevice:", 0, v4);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "selectOption:forCustomEditMode:slot:", v11, 15, 0);
        +[NTKCKaleidoscopeFacesGalleryCollection spring2020ComplicationTypesBySlot](NTKCKaleidoscopeFacesGalleryCollection, "spring2020ComplicationTypesBySlot");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "_setFaceGalleryComplicationTypesForSlots:", v12);

      }
      else
      {
        +[NTKKaleidoscopeStyleOption optionWithStyle:forDevice:](NTKKaleidoscopeStyleOption, "optionWithStyle:forDevice:", 3, v4);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "selectOption:forCustomEditMode:slot:", v11, 15, 0);
      }

      objc_msgSend(v5, "addObject:", v7);
      ++v6;
    }
    while (v6 < objc_msgSend(&unk_1E6CAA5E8, "count"));
  }

  return v5;
}

+ (id)_spring2020DefaultFacesForDevice:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  v5 = +[NTKEnumeratedEditOption numberOfOptionsForDevice:](NTKKaleidoscopeStyleOption, "numberOfOptionsForDevice:", v4);
  v6 = (void *)objc_opt_new();
  if (objc_msgSend(&unk_1E6CAA600, "count"))
  {
    v7 = 0;
    do
    {
      objc_msgSend(a1, "defaultFaceForDevice:", v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(&unk_1E6CAA600, "objectAtIndex:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "unsignedIntegerValue");

      +[NTKKaleidoscopeAssetOption optionWithAsset:forDevice:](NTKKaleidoscopeAssetOption, "optionWithAsset:forDevice:", v10, v4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "selectOption:forCustomEditMode:slot:", v11, 12, 0);

      +[NTKEnumeratedEditOption optionAtIndex:forDevice:](NTKKaleidoscopeStyleOption, "optionAtIndex:forDevice:", v7 % v5, v4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "selectOption:forCustomEditMode:slot:", v12, 15, 0);
      +[NTKCKaleidoscopeFacesGalleryCollection spring2020ComplicationTypesBySlot](NTKCKaleidoscopeFacesGalleryCollection, "spring2020ComplicationTypesBySlot");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_setFaceGalleryComplicationTypesForSlots:", v13);

      objc_msgSend(v6, "addObject:", v8);
      ++v7;
    }
    while (v7 < objc_msgSend(&unk_1E6CAA600, "count"));
  }

  return v6;
}

+ (id)_legacyDefaultFacesForDevice:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  if (+[NTKEnumeratedEditOption numberOfOptionsForDevice:](NTKKaleidoscopeStyleOption, "numberOfOptionsForDevice:", v4))
  {
    v6 = 0;
    do
    {
      objc_msgSend(a1, "defaultFaceForDevice:", v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      +[NTKKaleidoscopeAssetOption optionWithAsset:forDevice:](NTKKaleidoscopeAssetOption, "optionWithAsset:forDevice:", 0, v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "selectOption:forCustomEditMode:slot:", v8, 12, 0);

      +[NTKEnumeratedEditOption optionAtIndex:forDevice:](NTKKaleidoscopeStyleOption, "optionAtIndex:forDevice:", v6, v4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "selectOption:forCustomEditMode:slot:", v9, 15, 0);
      +[NTKCKaleidoscopeFacesGalleryCollection complicationTypesBySlot](NTKCKaleidoscopeFacesGalleryCollection, "complicationTypesBySlot");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "_setFaceGalleryComplicationTypesForSlots:", v10);

      objc_msgSend(v5, "addObject:", v7);
      ++v6;
    }
    while (+[NTKEnumeratedEditOption numberOfOptionsForDevice:](NTKKaleidoscopeStyleOption, "numberOfOptionsForDevice:", v4) > v6);
  }

  return v5;
}

+ (id)complicationTypesBySlot
{
  _QWORD v3[3];
  _QWORD v4[4];

  v4[3] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("top-left");
  v3[1] = CFSTR("top-right");
  v4[0] = &unk_1E6CAA618;
  v4[1] = &unk_1E6CAA630;
  v3[2] = CFSTR("bottom-center");
  v4[2] = &unk_1E6CAA648;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)spring2020ComplicationTypesBySlot
{
  _QWORD v3[3];
  _QWORD v4[4];

  v4[3] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("top-left");
  v3[1] = CFSTR("top-right");
  v4[0] = &unk_1E6CAA660;
  v4[1] = &unk_1E6CAA678;
  v3[2] = CFSTR("bottom-center");
  v4[2] = &unk_1E6CAA690;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
