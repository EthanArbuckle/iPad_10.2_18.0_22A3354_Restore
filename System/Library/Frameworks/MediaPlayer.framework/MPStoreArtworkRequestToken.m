@implementation MPStoreArtworkRequestToken

- (id)stringRepresentation
{
  int64_t artworkInfoType;
  uint64_t v3;
  void *v4;
  __CFString *v5;

  artworkInfoType = self->_artworkInfoType;
  if (artworkInfoType)
  {
    if (artworkInfoType != 1)
    {
      v5 = &stru_1E3163D10;
      return v5;
    }
    v3 = 24;
  }
  else
  {
    v3 = 16;
  }
  objc_msgSend(*(id *)((char *)&self->super.isa + v3), "stringRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (__CFString *)objc_msgSend(v4, "copy");

  return v5;
}

- (int64_t)artworkInfoType
{
  return self->_artworkInfoType;
}

- (ICStoreArtworkInfo)imageArtworkInfo
{
  return self->_imageArtworkInfo;
}

- (NSString)format
{
  return self->_format;
}

- (NSString)cropStyle
{
  return self->_cropStyle;
}

- (ICStoreVideoArtworkInfo)videoArtworkInfo
{
  return self->_videoArtworkInfo;
}

- (void)setCropStyle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

+ (MPStoreArtworkRequestToken)tokenWithImageArtworkInfo:(id)a3
{
  id v3;
  MPStoreArtworkRequestToken *v4;

  if (a3)
  {
    v3 = a3;
    v4 = objc_alloc_init(MPStoreArtworkRequestToken);
    -[MPStoreArtworkRequestToken setImageArtworkInfo:](v4, "setImageArtworkInfo:", v3);

    -[MPStoreArtworkRequestToken setArtworkInfoType:](v4, "setArtworkInfoType:", 0);
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void)setImageArtworkInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setArtworkInfoType:(int64_t)a3
{
  self->_artworkInfoType = a3;
}

- (MPStoreArtworkRequestToken)init
{
  MPStoreArtworkRequestToken *v2;
  MPStoreArtworkRequestToken *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MPStoreArtworkRequestToken;
  v2 = -[MPStoreArtworkRequestToken init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_cropStyle, (id)*MEMORY[0x1E0DDBDA8]);
    objc_storeStrong((id *)&v3->_format, (id)*MEMORY[0x1E0DDBDC8]);
  }
  return v3;
}

- (void)setSourceEditorialArtworkKind:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void)setVideoArtworkInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artworkURL, 0);
  objc_storeStrong((id *)&self->_sourceEditorialArtworkKind, 0);
  objc_storeStrong((id *)&self->_format, 0);
  objc_storeStrong((id *)&self->_cropStyle, 0);
  objc_storeStrong((id *)&self->_videoArtworkInfo, 0);
  objc_storeStrong((id *)&self->_imageArtworkInfo, 0);
}

+ (MPStoreArtworkRequestToken)tokenWithVideoArtworkInfo:(id)a3
{
  id v3;
  MPStoreArtworkRequestToken *v4;

  if (a3)
  {
    v3 = a3;
    v4 = objc_alloc_init(MPStoreArtworkRequestToken);
    -[MPStoreArtworkRequestToken setVideoArtworkInfo:](v4, "setVideoArtworkInfo:", v3);

    -[MPStoreArtworkRequestToken setArtworkInfoType:](v4, "setArtworkInfoType:", 1);
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  MPStoreArtworkRequestToken *v4;
  MPStoreArtworkRequestToken *v5;
  MPStoreArtworkRequestToken *v6;
  ICStoreArtworkInfo *imageArtworkInfo;
  ICStoreArtworkInfo *v8;
  ICStoreArtworkInfo *v9;
  ICStoreArtworkInfo *v10;
  int v11;
  char v12;
  ICStoreVideoArtworkInfo *videoArtworkInfo;
  ICStoreVideoArtworkInfo *v14;
  ICStoreVideoArtworkInfo *v15;
  ICStoreVideoArtworkInfo *v16;
  int v17;
  NSString *cropStyle;
  NSString *v19;
  NSString *v20;
  NSString *v21;
  int v22;
  NSString *format;
  NSString *v24;
  NSString *v25;
  NSString *v26;
  int v27;
  NSString *sourceEditorialArtworkKind;
  NSString *v30;
  NSString *v31;
  NSString *v32;

  v4 = (MPStoreArtworkRequestToken *)a3;
  if (self == v4)
  {
    v12 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = v5;
      if (self->_artworkInfoType == v5->_artworkInfoType)
      {
        imageArtworkInfo = self->_imageArtworkInfo;
        v8 = v5->_imageArtworkInfo;
        if (imageArtworkInfo == v8)
        {

        }
        else
        {
          v9 = v8;
          v10 = imageArtworkInfo;
          v11 = -[ICStoreArtworkInfo isEqual:](v10, "isEqual:", v9);

          if (!v11)
            goto LABEL_20;
        }
        videoArtworkInfo = self->_videoArtworkInfo;
        v14 = v6->_videoArtworkInfo;
        if (videoArtworkInfo == v14)
        {

        }
        else
        {
          v15 = v14;
          v16 = videoArtworkInfo;
          v17 = -[ICStoreVideoArtworkInfo isEqual:](v16, "isEqual:", v15);

          if (!v17)
            goto LABEL_20;
        }
        cropStyle = self->_cropStyle;
        v19 = v6->_cropStyle;
        if (cropStyle == v19)
        {

        }
        else
        {
          v20 = v19;
          v21 = cropStyle;
          v22 = -[NSString isEqual:](v21, "isEqual:", v20);

          if (!v22)
            goto LABEL_20;
        }
        format = self->_format;
        v24 = v6->_format;
        if (format == v24)
        {

        }
        else
        {
          v25 = v24;
          v26 = format;
          v27 = -[NSString isEqual:](v26, "isEqual:", v25);

          if (!v27)
            goto LABEL_20;
        }
        sourceEditorialArtworkKind = self->_sourceEditorialArtworkKind;
        v30 = v6->_sourceEditorialArtworkKind;
        v31 = sourceEditorialArtworkKind;
        v32 = v31;
        if (v31 == v30)
          v12 = 1;
        else
          v12 = -[NSString isEqual:](v31, "isEqual:", v30);

        goto LABEL_21;
      }
LABEL_20:
      v12 = 0;
LABEL_21:

      goto LABEL_22;
    }
    v12 = 0;
  }
LABEL_22:

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t artworkInfoType;
  id v5;

  artworkInfoType = self->_artworkInfoType;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", artworkInfoType, CFSTR("artworkInfoType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_cropStyle, CFSTR("cropStyle"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_format, CFSTR("format"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sourceEditorialArtworkKind, CFSTR("sourceEditorialArtworkKind"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_artworkURL, CFSTR("artworkURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_videoArtworkInfo, CFSTR("videoArtwork"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_imageArtworkInfo, CFSTR("imageArtwork"));

}

- (MPStoreArtworkRequestToken)initWithCoder:(id)a3
{
  id v4;
  MPStoreArtworkRequestToken *v5;
  uint64_t v6;
  NSString *cropStyle;
  uint64_t v8;
  NSString *format;
  uint64_t v10;
  NSString *sourceEditorialArtworkKind;
  uint64_t v12;
  NSURL *artworkURL;
  uint64_t v14;
  ICStoreVideoArtworkInfo *videoArtworkInfo;
  uint64_t v16;
  ICStoreArtworkInfo *imageArtworkInfo;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)MPStoreArtworkRequestToken;
  v5 = -[MPStoreArtworkRequestToken init](&v19, sel_init);
  if (v5)
  {
    v5->_artworkInfoType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("artworkInfoType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cropStyle"));
    v6 = objc_claimAutoreleasedReturnValue();
    cropStyle = v5->_cropStyle;
    v5->_cropStyle = (NSString *)v6;

    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("format")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("format"));
      v8 = objc_claimAutoreleasedReturnValue();
      format = v5->_format;
      v5->_format = (NSString *)v8;

    }
    if (!v5->_format)
      objc_storeStrong((id *)&v5->_format, (id)*MEMORY[0x1E0DDBDC8]);
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sourceEditorialArtworkKind"));
    v10 = objc_claimAutoreleasedReturnValue();
    sourceEditorialArtworkKind = v5->_sourceEditorialArtworkKind;
    v5->_sourceEditorialArtworkKind = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("artworkURL"));
    v12 = objc_claimAutoreleasedReturnValue();
    artworkURL = v5->_artworkURL;
    v5->_artworkURL = (NSURL *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("videoArtwork"));
    v14 = objc_claimAutoreleasedReturnValue();
    videoArtworkInfo = v5->_videoArtworkInfo;
    v5->_videoArtworkInfo = (ICStoreVideoArtworkInfo *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("imageArtwork"));
    v16 = objc_claimAutoreleasedReturnValue();
    imageArtworkInfo = v5->_imageArtworkInfo;
    v5->_imageArtworkInfo = (ICStoreArtworkInfo *)v16;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  id *v5;

  v4 = (id *)objc_alloc_init((Class)objc_opt_class());
  v5 = v4;
  if (v4)
  {
    v4[1] = (id)self->_artworkInfoType;
    objc_storeStrong(v4 + 4, self->_cropStyle);
    objc_storeStrong(v5 + 5, self->_format);
    objc_storeStrong(v5 + 6, self->_sourceEditorialArtworkKind);
    objc_storeStrong(v5 + 7, self->_artworkURL);
    objc_storeStrong(v5 + 2, self->_imageArtworkInfo);
    objc_storeStrong(v5 + 3, self->_videoArtworkInfo);
  }
  return v5;
}

- (void)setFormat:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)sourceEditorialArtworkKind
{
  return self->_sourceEditorialArtworkKind;
}

- (NSURL)artworkURL
{
  return self->_artworkURL;
}

- (void)setArtworkURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
