@implementation NTKUserPhotoEditOption

+ (id)optionUsingDefaultPhoto:(BOOL)a3 forDevice:(id)a4
{
  id v6;
  _BYTE *v7;

  v6 = a4;
  v7 = (_BYTE *)objc_msgSend(objc_alloc((Class)a1), "initWithDevice:", v6);

  v7[16] = a3;
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int usesDefaultPhoto;
  BOOL v6;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    usesDefaultPhoto = self->_usesDefaultPhoto;
    v6 = usesDefaultPhoto == objc_msgSend(v4, "usesDefaultPhoto");
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return self->_usesDefaultPhoto;
}

+ (BOOL)supportsSecureCoding
{
  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NTKUserPhotoEditOption;
  v4 = a3;
  -[NTKEditOption encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeBool:forKey:", self->_usesDefaultPhoto, CFSTR("UsesDefault"), v5.receiver, v5.super_class);

}

- (NTKUserPhotoEditOption)initWithCoder:(id)a3
{
  id v4;
  NTKUserPhotoEditOption *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)NTKUserPhotoEditOption;
  v5 = -[NTKEditOption initWithCoder:](&v7, sel_initWithCoder_, v4);
  if (v5)
    v5->_usesDefaultPhoto = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("UsesDefault"));

  return v5;
}

- (id)dailySnapshotKey
{
  if (self->_usesDefaultPhoto)
    return CFSTR("defaultPhoto");
  else
    return CFSTR("selectedPhoto");
}

- (id)JSONObjectRepresentation
{
  __CFString **v2;

  if (self->_usesDefaultPhoto)
    v2 = NTKFaceBundlePhotoContentDefault;
  else
    v2 = NTKFaceBundlePhotoContentCustom;
  return *v2;
}

- (NTKUserPhotoEditOption)initWithJSONObjectRepresentation:(id)a3 forDevice:(id)a4
{
  id v6;
  NTKUserPhotoEditOption *v7;

  v6 = a3;
  v7 = -[NTKEditOption initWithDevice:](self, "initWithDevice:", a4);
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("object must be a string - invalid value: %@"), v6);
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("custom")))
    {
      v7->_usesDefaultPhoto = 0;
    }
    else if (objc_msgSend(v6, "isEqualToString:", CFSTR("default")))
    {
      v7->_usesDefaultPhoto = 1;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("NTKFaceBundleException"), CFSTR("invalid value: %@"), v6);
    }
  }

  return v7;
}

- (BOOL)isValidOption
{
  return 1;
}

- (BOOL)usesDefaultPhoto
{
  return self->_usesDefaultPhoto;
}

- (void)setUsesDefaultPhoto:(BOOL)a3
{
  self->_usesDefaultPhoto = a3;
}

@end
