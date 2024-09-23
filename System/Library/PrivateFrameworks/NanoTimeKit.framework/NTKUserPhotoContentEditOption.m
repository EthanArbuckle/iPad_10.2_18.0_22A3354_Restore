@implementation NTKUserPhotoContentEditOption

+ (BOOL)supportsSecureCoding
{
  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSString *path;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)NTKUserPhotoContentEditOption;
  -[NTKEditOption encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  path = self->_path;
  if (path)
    objc_msgSend(v4, "encodeObject:forKey:", path, CFSTR("Path"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_isDefaultPhoto, CFSTR("IsDefault"));

}

- (NTKUserPhotoContentEditOption)initWithCoder:(id)a3
{
  id v4;
  NTKUserPhotoContentEditOption *v5;
  uint64_t v6;
  NSString *path;
  char v8;
  char v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NTKUserPhotoContentEditOption;
  v5 = -[NTKEditOption initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Path"));
    v6 = objc_claimAutoreleasedReturnValue();
    path = v5->_path;
    v5->_path = (NSString *)v6;

    v8 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("IsDefault"));
    v5->_isDefaultPhoto = v8;
    if (v5->_path)
      v9 = v8;
    else
      v9 = 1;
    v5->_isDefaultPhoto = v9;
  }

  return v5;
}

- (NSString)path
{
  return self->_path;
}

- (BOOL)isDefaultPhoto
{
  return self->_isDefaultPhoto;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
}

@end
