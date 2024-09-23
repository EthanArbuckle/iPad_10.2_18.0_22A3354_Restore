@implementation NTKCKaleidoscopeLegacyFacesGalleryCollection

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
  v7.super_class = (Class)NTKCKaleidoscopeLegacyFacesGalleryCollection;
  -[NTKCKaleidoscopeFacesGalleryCollection title](&v7, sel_title);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ (Legacy)"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)defaultFaceForDevice:(id)a3
{
  return +[NTKFace defaultFaceOfStyle:forDevice:](NTKFace, "defaultFaceOfStyle:forDevice:", 23, a3);
}

@end
