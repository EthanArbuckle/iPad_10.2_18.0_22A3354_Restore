@implementation QLTThumbnailRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (QLTThumbnailRequest)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  double v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  double v17;
  uint64_t v18;
  QLTThumbnailRequest *v19;
  void *v20;
  uint64_t v21;
  double v23;
  double v24;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("si"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0.0;
  v24 = 0.0;
  objc_msgSend(v8, "getValue:size:", &v23, 16);
  v9 = objc_alloc((Class)objc_opt_class());
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("fi"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeDoubleForKey:", CFSTR("sc"));
  v12 = v11;
  v13 = objc_msgSend(v5, "decodeBoolForKey:", CFSTR("i"));
  v14 = objc_msgSend(v5, "decodeIntForKey:", CFSTR("flavor"));
  v15 = objc_msgSend(v5, "decodeBoolForKey:", CFSTR("baseline"));
  objc_msgSend(v5, "decodeDoubleForKey:", CFSTR("ms"));
  v17 = v16;
  v18 = objc_msgSend(v5, "decodeIntegerForKey:", CFSTR("rt"));
  v19 = (QLTThumbnailRequest *)objc_msgSend(v9, "initWithVersionedFileIdentifier:size:scale:iconMode:flavor:wantsBaseline:minimumDimension:requestedTypes:", v10, v13, v14, v15, v18, v23, v24, v12, v17);

  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uuid"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[QLTThumbnailRequest setUuid:](v19, "setUuid:", v20);

  -[QLTThumbnailRequest setBadgeType:](v19, "setBadgeType:", objc_msgSend(v5, "decodeIntegerForKey:", CFSTR("bt")));
  v21 = objc_msgSend(v5, "decodeIntegerForKey:", CFSTR("generationBehavior"));

  -[QLTThumbnailRequest setGenerationBehavior:](v19, "setGenerationBehavior:", v21);
  return v19;
}

- (void)encodeWithCoder:(id)a3
{
  QLCacheVersionedFileIdentifier *fileIdentifier;
  void *v5;
  id v6;

  fileIdentifier = self->_fileIdentifier;
  v6 = a3;
  objc_msgSend(v6, "encodeObject:forKey:", fileIdentifier, CFSTR("fi"));
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &self->_size, "{CGSize=dd}");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("si"));

  objc_msgSend(v6, "encodeDouble:forKey:", CFSTR("sc"), self->_scale);
  objc_msgSend(v6, "encodeBool:forKey:", self->_iconMode, CFSTR("i"));
  objc_msgSend(v6, "encodeInteger:forKey:", self->_badgeType, CFSTR("bt"));
  objc_msgSend(v6, "encodeDouble:forKey:", CFSTR("ms"), self->_minimumDimension);
  objc_msgSend(v6, "encodeInteger:forKey:", self->_requestedTypes, CFSTR("rt"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_uuid, CFSTR("uuid"));
  objc_msgSend(v6, "encodeInteger:forKey:", self->_flavor, CFSTR("flavor"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_wantsBaseline, CFSTR("baseline"));
  objc_msgSend(v6, "encodeInteger:forKey:", self->_generationBehavior, CFSTR("generationBehavior"));

}

- (int64_t)compare:(id)a3
{
  id v4;
  _BOOL4 v5;
  int v6;
  int64_t v7;
  unint64_t v8;
  uint64_t v9;
  float v11;
  float v12;
  float v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  float v20;
  float v21;
  float v22;

  v4 = a3;
  v5 = -[QLTThumbnailRequest iconMode](self, "iconMode");
  v6 = objc_msgSend(v4, "iconMode");
  if (!v5 && (v6 & 1) != 0)
    goto LABEL_3;
  if ((!v5 | v6) != 1)
  {
LABEL_9:
    v7 = 1;
    goto LABEL_10;
  }
  v8 = -[QLTThumbnailRequest badgeType](self, "badgeType");
  v9 = objc_msgSend(v4, "badgeType");
  if (v8 || !v9)
  {
    if (!v8 || v9)
    {
      -[QLTThumbnailRequest maximumPixelSize](self, "maximumPixelSize");
      v12 = v11;
      objc_msgSend(v4, "maximumPixelSize");
      if (v12 >= v13)
      {
        -[QLTThumbnailRequest maximumPixelSize](self, "maximumPixelSize");
        v21 = v20;
        objc_msgSend(v4, "maximumPixelSize");
        v7 = v21 > v22;
        goto LABEL_10;
      }
      -[QLTThumbnailRequest minimumDimension](self, "minimumDimension");
      v15 = v14;
      objc_msgSend(v4, "minimumDimension");
      if (v15 <= v16)
        goto LABEL_3;
      -[QLTThumbnailRequest minimumDimension](self, "minimumDimension");
      v18 = v17;
      objc_msgSend(v4, "minimumDimension");
      if (v18 <= v19)
      {
        v7 = 0;
        goto LABEL_10;
      }
    }
    goto LABEL_9;
  }
LABEL_3:
  v7 = -1;
LABEL_10:

  return v7;
}

- (QLTThumbnailRequest)initWithVersionedFileIdentifier:(id)a3 size:(CGSize)a4 scale:(double)a5 iconMode:(BOOL)a6 flavor:(int)a7 wantsBaseline:(BOOL)a8 minimumDimension:(double)a9 requestedTypes:(unint64_t)a10
{
  CGFloat height;
  CGFloat width;
  id v20;
  QLTThumbnailRequest *v21;
  QLTThumbnailRequest *v22;
  uint64_t v23;
  NSUUID *uuid;
  objc_super v26;

  height = a4.height;
  width = a4.width;
  v20 = a3;
  v26.receiver = self;
  v26.super_class = (Class)QLTThumbnailRequest;
  v21 = -[QLTThumbnailRequest init](&v26, sel_init);
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_fileIdentifier, a3);
    v22->_size.width = width;
    v22->_size.height = height;
    v22->_scale = a5;
    v22->_iconMode = a6;
    v22->_minimumDimension = a9;
    v22->_requestedTypes = a10;
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v23 = objc_claimAutoreleasedReturnValue();
    uuid = v22->_uuid;
    v22->_uuid = (NSUUID *)v23;

    v22->_flavor = a7;
    v22->_wantsBaseline = a8;
    v22->_badgeType = 1;
    v22->_generationBehavior = 2;
  }

  return v22;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithVersionedFileIdentifier:size:scale:iconMode:flavor:wantsBaseline:minimumDimension:requestedTypes:", self->_fileIdentifier, self->_iconMode, self->_flavor, self->_wantsBaseline, self->_requestedTypes, self->_size.width, self->_size.height, self->_scale, self->_minimumDimension);
  v5 = (void *)-[NSUUID copy](self->_uuid, "copy");
  objc_msgSend(v4, "setUuid:", v5);

  objc_msgSend(v4, "setBadgeType:", self->_badgeType);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  QLTThumbnailRequest *v4;
  QLTThumbnailRequest *v5;
  NSUUID *uuid;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  BOOL v11;
  double v12;
  double scale;
  double v14;
  _BOOL4 iconMode;
  unint64_t badgeType;
  double minimumDimension;
  double v18;
  unint64_t requestedTypes;
  int flavor;
  _BOOL4 wantsBaseline;

  v4 = (QLTThumbnailRequest *)a3;
  if (v4 == self)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      uuid = self->_uuid;
      -[QLTThumbnailRequest uuid](v5, "uuid");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (!-[NSUUID isEqual:](uuid, "isEqual:", v7))
      {
        v11 = 0;
LABEL_19:

        goto LABEL_20;
      }
      -[QLTThumbnailRequest fileIdentifier](self, "fileIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[QLTThumbnailRequest fileIdentifier](v5, "fileIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v8, "isEqual:", v9))
        goto LABEL_17;
      -[QLTThumbnailRequest size](v5, "size");
      v11 = 0;
      if (self->_size.width != v12 || self->_size.height != v10)
        goto LABEL_18;
      scale = self->_scale;
      -[QLTThumbnailRequest scale](v5, "scale");
      if (scale != v14)
        goto LABEL_17;
      iconMode = self->_iconMode;
      if (iconMode == -[QLTThumbnailRequest iconMode](v5, "iconMode")
        && (badgeType = self->_badgeType, badgeType == -[QLTThumbnailRequest badgeType](v5, "badgeType"))
        && (minimumDimension = self->_minimumDimension,
            -[QLTThumbnailRequest minimumDimension](v5, "minimumDimension"),
            minimumDimension == v18)
        && (requestedTypes = self->_requestedTypes,
            requestedTypes == -[QLTThumbnailRequest requestedTypes](v5, "requestedTypes"))
        && (flavor = self->_flavor, flavor == -[QLTThumbnailRequest flavor](v5, "flavor")))
      {
        wantsBaseline = self->_wantsBaseline;
        v11 = wantsBaseline == -[QLTThumbnailRequest wantsBaseline](v5, "wantsBaseline");
      }
      else
      {
LABEL_17:
        v11 = 0;
      }
LABEL_18:

      goto LABEL_19;
    }
    v11 = 0;
  }
LABEL_20:

  return v11;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t width;

  v3 = -[QLCacheVersionedFileIdentifier hash](self->_fileIdentifier, "hash");
  width = (unint64_t)self->_size.width;
  return v3 ^ -[NSUUID hash](self->_uuid, "hash") ^ width;
}

- (float)maximumPixelSize
{
  double width;

  width = self->_size.width;
  if (width < self->_size.height)
    width = self->_size.height;
  return self->_scale * width;
}

- (NSString)contentType
{
  NSString *contentType;
  NSString *v4;
  NSString *v5;

  contentType = self->_contentType;
  if (!contentType)
  {
    -[QLTThumbnailRequest computeContentType](self, "computeContentType");
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    v5 = self->_contentType;
    self->_contentType = v4;

    contentType = self->_contentType;
  }
  return contentType;
}

- (id)computeContentType
{
  return 0;
}

- (BOOL)provideGenericIcon
{
  return self->_requestedTypes & 1;
}

- (BOOL)provideLowQualityThumbnail
{
  return (LOBYTE(self->_requestedTypes) >> 1) & 1;
}

- (BOOL)provideFullResolutionThumbnail
{
  return (LOBYTE(self->_requestedTypes) >> 2) & 1;
}

- (BOOL)provideCachedResultsOnly
{
  return -[QLTThumbnailRequest generationBehavior](self, "generationBehavior") == 0;
}

- (BOOL)forceGeneration
{
  return -[QLTThumbnailRequest generationBehavior](self, "generationBehavior") == 1;
}

- (int64_t)requestedMostRepresentativeType
{
  if (self->_requestedTypes)
    return flsl(self->_requestedTypes & 7) - 1;
  else
    return 0;
}

+ (id)thumbnailRequestForFileAtURL:(id)a3 size:(CGSize)a4 scale:(double)a5 iconMode:(BOOL)a6
{
  _BOOL8 v6;
  double height;
  double width;
  id v10;
  QLTFileThumbnailRequest *v11;

  v6 = a6;
  height = a4.height;
  width = a4.width;
  v10 = a3;
  v11 = -[QLTFileThumbnailRequest initWithFileAtURL:size:minimumDimension:scale:iconMode:error:]([QLTFileThumbnailRequest alloc], "initWithFileAtURL:size:minimumDimension:scale:iconMode:error:", v10, v6, 0, width, height, 0.0, a5);

  return v11;
}

+ (id)thumbnailRequestForFileAtURL:(id)a3 size:(CGSize)a4 scale:(double)a5 iconMode:(BOOL)a6 error:(id *)a7
{
  _BOOL8 v8;
  double height;
  double width;
  id v12;
  QLTFileThumbnailRequest *v13;

  v8 = a6;
  height = a4.height;
  width = a4.width;
  v12 = a3;
  v13 = -[QLTFileThumbnailRequest initWithFileAtURL:size:minimumDimension:scale:iconMode:error:]([QLTFileThumbnailRequest alloc], "initWithFileAtURL:size:minimumDimension:scale:iconMode:error:", v12, v8, a7, width, height, 0.0, a5);

  return v13;
}

+ (id)thumbnailRequestForFileAtURL:(id)a3 size:(CGSize)a4 minimumSize:(double)a5 scale:(double)a6 iconMode:(BOOL)a7
{
  _BOOL8 v7;
  double height;
  double width;
  id v11;
  QLTFileThumbnailRequest *v12;

  v7 = a7;
  height = a4.height;
  width = a4.width;
  v11 = a3;
  v12 = -[QLTFileThumbnailRequest initWithFileAtURL:size:minimumDimension:scale:iconMode:error:]([QLTFileThumbnailRequest alloc], "initWithFileAtURL:size:minimumDimension:scale:iconMode:error:", v11, v7, 0, width, height, 0.0, a6);

  return v12;
}

+ (id)thumbnailRequestForFileAtURL:(id)a3 size:(CGSize)a4 minimumSize:(double)a5 scale:(double)a6 iconMode:(BOOL)a7 error:(id *)a8
{
  _BOOL8 v9;
  double height;
  double width;
  id v13;
  QLTFileThumbnailRequest *v14;

  v9 = a7;
  height = a4.height;
  width = a4.width;
  v13 = a3;
  v14 = -[QLTFileThumbnailRequest initWithFileAtURL:size:minimumDimension:scale:iconMode:error:]([QLTFileThumbnailRequest alloc], "initWithFileAtURL:size:minimumDimension:scale:iconMode:error:", v13, v9, a8, width, height, 0.0, a6);

  return v14;
}

- (QLCacheVersionedFileIdentifier)fileIdentifier
{
  return (QLCacheVersionedFileIdentifier *)objc_getProperty(self, a2, 16, 1);
}

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 24, 1);
}

- (void)setUuid:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (double)scale
{
  return self->_scale;
}

- (void)setScale:(double)a3
{
  self->_scale = a3;
}

- (void)setContentType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)shouldProvideFoldedGenericIcon
{
  return self->_shouldProvideFoldedGenericIcon;
}

- (void)setShouldProvideFoldedGenericIcon:(BOOL)a3
{
  self->_shouldProvideFoldedGenericIcon = a3;
}

- (unint64_t)badgeType
{
  return self->_badgeType;
}

- (void)setBadgeType:(unint64_t)a3
{
  self->_badgeType = a3;
}

- (BOOL)iconMode
{
  return self->_iconMode;
}

- (int)flavor
{
  return self->_flavor;
}

- (void)setFlavor:(int)a3
{
  self->_flavor = a3;
}

- (double)minimumDimension
{
  return self->_minimumDimension;
}

- (void)setMinimumDimension:(double)a3
{
  self->_minimumDimension = a3;
}

- (BOOL)wantsBaseline
{
  return self->_wantsBaseline;
}

- (void)setWantsBaseline:(BOOL)a3
{
  self->_wantsBaseline = a3;
}

- (int64_t)generationBehavior
{
  return self->_generationBehavior;
}

- (void)setGenerationBehavior:(int64_t)a3
{
  self->_generationBehavior = a3;
}

- (unint64_t)requestedTypes
{
  return self->_requestedTypes;
}

- (void)setRequestedTypes:(unint64_t)a3
{
  self->_requestedTypes = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentType, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_fileIdentifier, 0);
}

@end
