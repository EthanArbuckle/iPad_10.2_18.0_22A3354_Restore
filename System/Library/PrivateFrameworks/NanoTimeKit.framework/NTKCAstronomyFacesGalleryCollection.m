@implementation NTKCAstronomyFacesGalleryCollection

- (id)title
{
  return NTKClockFaceLocalizedString(CFSTR("FACE_STYLE_9_IN_TITLE_CASE"), CFSTR("Astronomy"));
}

- (id)descriptionText
{
  uint64_t v2;

  return NTKCCustomizationLocalizedString(CFSTR("GALLERY_ASTRONOMY_DESCRIPTION"), (uint64_t)CFSTR("description"), v2);
}

- (id)facesForDevice:(id)a3
{
  id v3;
  int v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = objc_msgSend(v3, "isRunningGloryGMOrLater");
  v5 = (void *)objc_opt_class();
  if (v4)
    objc_msgSend(v5, "_gloryDefaultFacesForDevice:", v3);
  else
    objc_msgSend(v5, "_legacyDefaultFacesForDevice:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)_legacyDefaultFacesForDevice:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  +[NTKFace defaultFaceOfStyle:forDevice:](NTKFace, "defaultFaceOfStyle:forDevice:", 9, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "addObject:", v5);
  return v4;
}

+ (id)_gloryDefaultFacesForDevice:(id)a3
{
  id v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  if (+[NTKEnumeratedEditOption numberOfOptionsForDevice:](NTKAstronomyVistaEditOption, "numberOfOptionsForDevice:", v3))
  {
    v5 = 0;
    do
    {
      +[NTKFace defaultFaceOfStyle:forDevice:](NTKFace, "defaultFaceOfStyle:forDevice:", 9, v3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      +[NTKAstronomyVistaEditOption optionWithAstronomyVista:forDevice:](NTKAstronomyVistaEditOption, "optionWithAstronomyVista:forDevice:", v5, v3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "selectOption:forCustomEditMode:slot:", v7, 12, 0);

      +[NTKCAstronomyFacesGalleryCollection complicationTypesBySlot](NTKCAstronomyFacesGalleryCollection, "complicationTypesBySlot");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "_setFaceGalleryComplicationTypesForSlots:", v8);

      objc_msgSend(v4, "addObject:", v6);
      ++v5;
    }
    while (+[NTKEnumeratedEditOption numberOfOptionsForDevice:](NTKAstronomyVistaEditOption, "numberOfOptionsForDevice:", v3) > v5);
  }

  return v4;
}

+ (id)complicationTypesBySlot
{
  _QWORD v3[2];
  _QWORD v4[3];

  v4[2] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("top-right");
  v3[1] = CFSTR("bottom");
  v4[0] = &unk_1E6CA9B20;
  v4[1] = &unk_1E6CA9B38;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
