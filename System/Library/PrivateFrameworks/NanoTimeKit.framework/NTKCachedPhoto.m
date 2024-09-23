@implementation NTKCachedPhoto

- (NTKCachedPhoto)initWithPhoto:(id)a3
{
  return -[NTKCachedPhoto initWithPhoto:index:](self, "initWithPhoto:index:", a3, 0x7FFFFFFFFFFFFFFFLL);
}

- (NTKCachedPhoto)initWithPhoto:(id)a3 index:(int64_t)a4
{
  id v7;
  NTKCachedPhoto *v8;
  NTKCachedPhoto *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NTKCachedPhoto;
  v8 = -[NTKCachedPhoto init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_photo, a3);
    v9->_index = a4;
  }

  return v9;
}

- (BOOL)load
{
  UIImage *v3;
  UIImage *image;
  int64_t index;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  NTKPhoto *photo;
  id v10;
  void *v11;
  void *v12;
  UIImage *v13;
  const char *v14;
  NSObject *v15;
  uint32_t v16;
  void *v17;
  NTKPhoto *v18;
  int64_t v19;
  UIImage *v20;
  int v22;
  void *v23;
  __int16 v24;
  _BYTE v25[24];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  NTKPhotosImageForPhoto(self->_photo);
  v3 = (UIImage *)objc_claimAutoreleasedReturnValue();
  image = self->_image;
  self->_image = v3;

  index = self->_index;
  _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (index == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v7)
    {
      v8 = (void *)objc_opt_class();
      photo = self->_photo;
      v10 = v8;
      -[NTKPhoto imageURL](photo, "imageURL");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "path");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = self->_image;
      v22 = 138412802;
      v23 = v8;
      v24 = 2112;
      *(_QWORD *)v25 = v12;
      *(_WORD *)&v25[8] = 2112;
      *(_QWORD *)&v25[10] = v13;
      v14 = "%@: loading image %@ ==> %@";
      v15 = v6;
      v16 = 32;
LABEL_6:
      _os_log_impl(&dword_1B72A3000, v15, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v22, v16);

    }
  }
  else if (v7)
  {
    v17 = (void *)objc_opt_class();
    v18 = self->_photo;
    v19 = self->_index;
    v10 = v17;
    -[NTKPhoto imageURL](v18, "imageURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "path");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = self->_image;
    v22 = 138413058;
    v23 = v17;
    v24 = 1024;
    *(_DWORD *)v25 = v19;
    *(_WORD *)&v25[4] = 2112;
    *(_QWORD *)&v25[6] = v12;
    *(_WORD *)&v25[14] = 2112;
    *(_QWORD *)&v25[16] = v20;
    v14 = "%@: loading index %d image %@ ==> %@";
    v15 = v6;
    v16 = 38;
    goto LABEL_6;
  }

  return self->_image != 0;
}

- (UIImage)image
{
  return self->_image;
}

- (NTKPhoto)photo
{
  return self->_photo;
}

- (int64_t)index
{
  return self->_index;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photo, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end
