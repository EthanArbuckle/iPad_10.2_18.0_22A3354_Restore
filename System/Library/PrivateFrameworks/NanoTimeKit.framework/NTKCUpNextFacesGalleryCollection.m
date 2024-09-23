@implementation NTKCUpNextFacesGalleryCollection

- (id)title
{
  return NTKClockFaceLocalizedString(CFSTR("FACE_STYLE_21_IN_TITLE_CASE"), CFSTR("Siri"));
}

- (id)descriptionText
{
  uint64_t v2;

  return NTKCCustomizationLocalizedString(CFSTR("GALLERY_UPNEXT_DESCRIPTION"), (uint64_t)CFSTR("description"), v2);
}

- (id)facesForDevice:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (NTKShowBlueRidgeUI(v3))
    v4 = 221;
  else
    v4 = 21;
  +[NTKFace defaultFaceOfStyle:forDevice:](NTKFace, "defaultFaceOfStyle:forDevice:", v4, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[NTKCUpNextFacesGalleryCollection complicationTypesBySlot](NTKCUpNextFacesGalleryCollection, "complicationTypesBySlot");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_setFaceGalleryComplicationTypesForSlots:", v6);

  v9[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)complicationTypesBySlot
{
  _QWORD v3[2];
  _QWORD v4[3];

  v4[2] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("top-left");
  v3[1] = CFSTR("top-right");
  v4[0] = &unk_1E6CA9BF8;
  v4[1] = &unk_1E6CA9C10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
