@implementation ICPreviewDeviceInfo

- (ICPreviewDeviceInfo)initWithImageSize:(double)a3 scale:(double)a4
{
  ICPreviewDeviceInfo *v6;
  ICPreviewDeviceInfo *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ICPreviewDeviceInfo;
  v6 = -[ICPreviewDeviceInfo init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    -[ICPreviewDeviceInfo setImageSize:](v6, "setImageSize:", a3);
    -[ICPreviewDeviceInfo setScale:](v7, "setScale:", a4);
  }
  return v7;
}

- (void)setScale:(double)a3
{
  self->_scale = a3;
}

- (void)setImageSize:(double)a3
{
  self->_imageSize = a3;
}

- (ICPreviewDeviceInfo)init
{
  -[ICPreviewDeviceInfo doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (ICPreviewDeviceInfo)initWithImageSize:(double)a3 scale:(double)a4 appearanceInfo:(id)a5
{
  id v8;
  ICPreviewDeviceInfo *v9;
  ICPreviewDeviceInfo *v10;

  v8 = a5;
  v9 = -[ICPreviewDeviceInfo initWithImageSize:scale:](self, "initWithImageSize:scale:", a3, a4);
  v10 = v9;
  if (v9)
    -[ICPreviewDeviceInfo setAppearanceInfo:](v9, "setAppearanceInfo:", v8);

  return v10;
}

- (id)deviceInfoFromAddingAppearanceInfo:(id)a3
{
  id v4;
  ICPreviewDeviceInfo *v5;
  double v6;
  double v7;
  double v8;
  ICPreviewDeviceInfo *v9;

  v4 = a3;
  v5 = [ICPreviewDeviceInfo alloc];
  -[ICPreviewDeviceInfo imageSize](self, "imageSize");
  v7 = v6;
  -[ICPreviewDeviceInfo scale](self, "scale");
  v9 = -[ICPreviewDeviceInfo initWithImageSize:scale:appearanceInfo:](v5, "initWithImageSize:scale:appearanceInfo:", v4, v7, v8);

  return v9;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[ICPreviewDeviceInfo imageSize](self, "imageSize");
  v5 = v4;
  -[ICPreviewDeviceInfo scale](self, "scale");
  v7 = v6;
  -[ICPreviewDeviceInfo appearanceInfo](self, "appearanceInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("size %f scale %f appearanceType %d"), v5, v7, objc_msgSend(v8, "type"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)previewDeviceInfoForPreviewImage:(id)a3
{
  id v3;
  ICPreviewDeviceInfo *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  int v9;
  void *v10;
  ICPreviewDeviceInfo *v11;

  if (a3)
  {
    v3 = a3;
    v4 = [ICPreviewDeviceInfo alloc];
    objc_msgSend(v3, "size");
    v6 = v5;
    objc_msgSend(v3, "scale");
    v8 = v7;
    v9 = objc_msgSend(v3, "appearanceType");

    +[ICAppearanceInfo appearanceInfoWithType:](ICAppearanceInfo, "appearanceInfoWithType:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[ICPreviewDeviceInfo initWithImageSize:scale:appearanceInfo:](v4, "initWithImageSize:scale:appearanceInfo:", v10, v6, v8);

  }
  else
  {
    v11 = 0;
  }
  return v11;
}

- (unint64_t)hash
{
  unint64_t result;
  double v4;
  uint64_t v5;
  double v6;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  result = self->_hash;
  if (!result)
  {
    -[ICPreviewDeviceInfo scale](self, "scale");
    v5 = (unint64_t)v4;
    -[ICPreviewDeviceInfo imageSize](self, "imageSize");
    v7 = (unint64_t)v6;
    -[ICPreviewDeviceInfo appearanceInfo](self, "appearanceInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "hash");
    self->_hash = ICHashWithHashKeys(v5, v9, v10, v11, v12, v13, v14, v15, v7);

    return self->_hash;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  char v14;

  v4 = a3;
  objc_opt_class();
  ICDynamicCast();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5
    && ((-[ICPreviewDeviceInfo imageSize](self, "imageSize"), v7 = v6, objc_msgSend(v5, "imageSize"), v7 == v8)
     || vabdd_f64(v7, v8) < fabs(v8 * 0.000000999999997))
    && (-[ICPreviewDeviceInfo scale](self, "scale"), v10 = v9, objc_msgSend(v5, "scale"), v10 == v11))
  {
    -[ICPreviewDeviceInfo appearanceInfo](self, "appearanceInfo");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appearanceInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "isEqual:", v13);

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (double)imageSize
{
  return self->_imageSize;
}

- (double)scale
{
  return self->_scale;
}

- (ICAppearanceInfo)appearanceInfo
{
  return self->_appearanceInfo;
}

- (void)setAppearanceInfo:(id)a3
{
  objc_storeStrong((id *)&self->_appearanceInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appearanceInfo, 0);
}

@end
