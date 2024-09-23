@implementation NTKCUpNextLegacyFacesGalleryCollection

- (id)title
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  if (!_os_feature_enabled_impl())
    return 0;
  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)NTKCUpNextLegacyFacesGalleryCollection;
  -[NTKCUpNextFacesGalleryCollection title](&v7, sel_title);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ (Legacy)"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)defaultFaceForDevice:(id)a3
{
  return +[NTKFace defaultFaceOfStyle:forDevice:](NTKFace, "defaultFaceOfStyle:forDevice:", 16, a3);
}

- (id)facesForDevice:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  +[NTKFace defaultFaceOfStyle:forDevice:](NTKFace, "defaultFaceOfStyle:forDevice:", 21, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[NTKCUpNextFacesGalleryCollection complicationTypesBySlot](NTKCUpNextFacesGalleryCollection, "complicationTypesBySlot");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_setFaceGalleryComplicationTypesForSlots:", v4);

  v7[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
