@implementation NTKAlbumPhotoFace

- (id)_customEditModes
{
  return &unk_1E6CA8AA0;
}

- (id)_defaultOptionForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  void *v4;
  void *v5;

  -[NTKFace device](self, "device", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[NTKDateAlignmentEditOption optionWithAlignment:forDevice:](NTKDateAlignmentEditOption, "optionWithAlignment:forDevice:", 1, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (unint64_t)_numberOfOptionsForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  objc_class *v5;
  void *v6;
  unint64_t v7;

  v5 = -[NTKAlbumPhotoFace _optionClassForCustomEditMode:](self, "_optionClassForCustomEditMode:", a3, a4);
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

  v7 = -[NTKAlbumPhotoFace _optionClassForCustomEditMode:](self, "_optionClassForCustomEditMode:", a4);
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
  v8 = -[NTKAlbumPhotoFace _optionClassForCustomEditMode:](self, "_optionClassForCustomEditMode:", a4);
  -[NTKFace device](self, "device");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[objc_class indexOfOption:forDevice:](v8, "indexOfOption:forDevice:", v7, v9);

  return v10;
}

- (Class)_optionClassForCustomEditMode:(int64_t)a3
{
  if (a3 != 14)
    return (Class)0;
  objc_opt_class();
  return (Class)(id)objc_claimAutoreleasedReturnValue();
}

@end
