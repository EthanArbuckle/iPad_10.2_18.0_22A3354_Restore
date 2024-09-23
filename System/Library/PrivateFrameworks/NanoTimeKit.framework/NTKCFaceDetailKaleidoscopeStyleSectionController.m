@implementation NTKCFaceDetailKaleidoscopeStyleSectionController

+ (BOOL)hasSectionForFace:(id)a3 forEditMode:(int64_t)a4
{
  id v5;
  BOOL v6;
  BOOL v7;

  v5 = a3;
  v6 = objc_msgSend(v5, "faceStyle") == 23 || objc_msgSend(v5, "faceStyle") == 223;
  v7 = a4 == 15 && v6;

  return v7;
}

- (void)faceDidChangeResourceDirectory
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NTKCFaceDetailKaleidoscopeStyleSectionController;
  -[NTKCFaceDetailSectionController faceDidChangeResourceDirectory](&v6, sel_faceDidChangeResourceDirectory);
  -[NTKCFaceDetailEditOptionSectionController selectedOptions](self, "selectedOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", &unk_1E6C9EEA8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "asset") == 1000)
  {
    -[NTKCFaceDetailSectionController cell](self, "cell");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "reloadVisibleCells");

  }
}

@end
