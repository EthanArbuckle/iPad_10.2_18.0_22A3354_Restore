@implementation NTKUserPhotoFace

- (id)_customEditModes
{
  return &unk_1E6CA8AE8;
}

- (int64_t)editModeForCustomEditViewController
{
  return 12;
}

- (id)_defaultOptionForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v6 = a4;
  if (a3 == 14)
  {
    -[NTKFace device](self, "device");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[NTKDateAlignmentEditOption optionWithAlignment:forDevice:](NTKDateAlignmentEditOption, "optionWithAlignment:forDevice:", 0, v7);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a3 != 12)
    {
      v9 = 0;
      goto LABEL_7;
    }
    -[NTKFace device](self, "device");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[NTKUserPhotoEditOption optionUsingDefaultPhoto:forDevice:](NTKUserPhotoEditOption, "optionUsingDefaultPhoto:forDevice:", 1, v7);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v8;

LABEL_7:
  return v9;
}

+ (id)_localizedNameOverrideForCustomEditMode:(int64_t)a3 forDevice:(id)a4
{
  void *v4;
  void *v5;
  objc_super v7;

  if (a3 == 12)
  {
    objc_msgSend(CFSTR("EDIT_MODE_LABEL_PHOTO_CONTENT"), "stringByAppendingString:", CFSTR("_COMPANION"), a4);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    NTKCompanionClockFaceLocalizedString(v4, CFSTR("Photo"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    return v5;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___NTKUserPhotoFace;
    objc_msgSendSuper2(&v7, sel__localizedNameOverrideForCustomEditMode_forDevice_, a3, a4);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (BOOL)_hasOptionsForCustomEditMode:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  objc_super v6;
  uint64_t v7;
  uint64_t v8;

  if (a3 == 12)
    return 0;
  v7 = v3;
  v8 = v4;
  v6.receiver = self;
  v6.super_class = (Class)NTKUserPhotoFace;
  return -[NTKFace _hasOptionsForCustomEditMode:](&v6, sel__hasOptionsForCustomEditMode_);
}

- (unint64_t)_numberOfOptionsForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  void *v4;
  unint64_t v5;

  if (a3 != 14)
    return 0;
  -[NTKFace device](self, "device", 14, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = +[NTKEnumeratedEditOption numberOfOptionsForDevice:](NTKDateAlignmentEditOption, "numberOfOptionsForDevice:", v4);

  return v5;
}

- (id)_optionAtIndex:(unint64_t)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v8;
  void *v9;
  void *v10;

  v8 = a5;
  if (a4 == 14)
  {
    -[NTKFace device](self, "device");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[NTKEnumeratedEditOption optionAtIndex:forDevice:](NTKDateAlignmentEditOption, "optionAtIndex:forDevice:", a3, v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else if (a4 == 12 && !a3)
  {
    -[NTKFace selectedOptionForCustomEditMode:slot:](self, "selectedOptionForCustomEditMode:slot:", 12, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)_indexOfOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v8;
  id v9;
  id v10;
  unint64_t v11;

  v8 = a3;
  v9 = a5;
  if (a4 == 14)
  {
    -[NTKFace device](self, "device");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v11 = +[NTKEnumeratedEditOption indexOfOption:forDevice:](NTKDateAlignmentEditOption, "indexOfOption:forDevice:", v8, v10);
  }
  else
  {
    if (a4 != 12)
    {
      v11 = 0x7FFFFFFFFFFFFFFFLL;
      goto LABEL_9;
    }
    -[NTKFace selectedOptionForCustomEditMode:slot:](self, "selectedOptionForCustomEditMode:slot:", 12, v9);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (v10 == v8)
      v11 = 0;
    else
      v11 = 0x7FFFFFFFFFFFFFFFLL;
  }

LABEL_9:
  return v11;
}

- (BOOL)_option:(id)a3 migratesToValidOption:(id *)a4 forCustomEditMode:(int64_t)a5
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  BOOL v14;

  v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
    if ((objc_msgSend(v8, "isDefaultPhoto") & 1) == 0)
    {
      objc_msgSend(v8, "path");
      v9 = objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        v10 = (void *)v9;
        -[NTKFace setResourceDirectoryByTransferringOwnership:](self, "setResourceDirectoryByTransferringOwnership:", v9);
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "removeItemAtPath:error:", v10, 0);

      }
    }
    v12 = objc_msgSend(v8, "isDefaultPhoto");
    -[NTKFace device](self, "device");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[NTKUserPhotoEditOption optionUsingDefaultPhoto:forDevice:](NTKUserPhotoEditOption, "optionUsingDefaultPhoto:forDevice:", v12, v13);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    v14 = *a4 != 0;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (Class)_optionClassForCustomEditMode:(int64_t)a3
{
  if (a3 != 12 && a3 != 14)
    return (Class)0;
  objc_opt_class();
  return (Class)(id)objc_claimAutoreleasedReturnValue();
}

@end
