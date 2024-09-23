@implementation CNContactImage

- (id)resizedContactImageForMeCardSharing
{
  return -[CNContactImage resizedContactImageToMaxEdgeWidth:](self, "resizedContactImageToMaxEdgeWidth:", 500);
}

- (id)resizedContactImageToMaxEdgeWidth:(unint64_t)a3
{
  void *v5;
  uint64_t v6;
  CNContactImage *v7;
  double v8;
  double v9;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  const __CFData *v15;
  const __CFData *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _BOOL4 v25;
  void *v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  CNContactImage *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v44;
  unint64_t v45;
  unint64_t v46;

  -[CNContactImage imageData](self, "imageData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0D13818];
  if (!(*(unsigned int (**)(_QWORD, void *))(*MEMORY[0x1E0D13818] + 16))(*MEMORY[0x1E0D13818], v5))
  {
    -[CNContactImage cropRect](self, "cropRect");
    if (v9 == *MEMORY[0x1E0C9D820] && v8 == *(double *)(MEMORY[0x1E0C9D820] + 8))
    {
      v15 = v5;
    }
    else
    {
      -[CNContactImage cropRect](self, "cropRect");
      CNImageUtilsCroppedImageDataFromFullSizeImageData(v5, 0, v11, v12, v13, v14);
      v15 = (const __CFData *)objc_claimAutoreleasedReturnValue();
    }
    v16 = v15;
    if ((*(unsigned int (**)(uint64_t, const __CFData *))(v6 + 16))(v6, v15))
    {
      meCardSharingLogger();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        -[CNContactImage(MeCardSharing) resizedContactImageToMaxEdgeWidth:].cold.1(v17, v18, v19, v20, v21, v22, v23, v24);
    }
    else
    {
      v45 = 0;
      v46 = 0;
      if (CNImageUtilsCopyImageSourceAndGetSizeFromData(v16, 0, &v46, &v45))
      {
        if (v46 > a3 || v45 > a3)
        {
          v44 = 0x3FF0000000000000;
          v25 = -[CNContactImage source](self, "source") != 2;
          CNImageUtilsImageDataByScalingImageData(v16, v25, a3, (double *)&v44, (double)(uint64_t)v46, (double)(uint64_t)v45, 1.0);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          if ((*(unsigned int (**)(uint64_t, void *))(v6 + 16))(v6, v26))
          {
            meCardSharingLogger();
            v27 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
              -[CNContactImage(MeCardSharing) resizedContactImageToMaxEdgeWidth:].cold.2(v27, v28, v29, v30, v31, v32, v33, v34);

            v35 = self;
          }
          else
          {
            v35 = -[CNContactImage copyWithNewImageData:cropRect:](self, "copyWithNewImageData:cropRect:", v26, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
          }
          v7 = v35;

          goto LABEL_23;
        }
LABEL_22:
        v7 = self;
LABEL_23:

        goto LABEL_24;
      }
      meCardSharingLogger();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        -[CNContactImage(MeCardSharing) resizedContactImageToMaxEdgeWidth:].cold.3(v17, v36, v37, v38, v39, v40, v41, v42);
    }

    goto LABEL_22;
  }
  v7 = self;
LABEL_24:

  return v7;
}

- (CNContactImage)initWithImageData:(id)a3 cropRect:(CGRect)a4 lastUsedDate:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  CNContactImage *v16;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v11 = (void *)MEMORY[0x1E0CB3A28];
  v12 = a5;
  v13 = a3;
  objc_msgSend(v11, "UUID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "UUIDString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = -[CNContactImage initWithIdentifier:imageData:cropRect:lastUsedDate:](self, "initWithIdentifier:imageData:cropRect:lastUsedDate:", v15, v13, v12, x, y, width, height);
  return v16;
}

- (CNContactImage)initWithImageData:(id)a3 cropRect:(CGRect)a4 lastUsedDate:(id)a5 source:(int64_t)a6
{
  double height;
  double width;
  double y;
  double x;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  CNContactImage *v18;
  uint64_t v20;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v13 = (void *)MEMORY[0x1E0CB3A28];
  v14 = a5;
  v15 = a3;
  objc_msgSend(v13, "UUID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "UUIDString");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v20) = 0;
  v18 = -[CNContactImage initWithIdentifier:imageData:lastUsedDate:cropRect:source:sourceIdentifier:variant:poseConfigurationData:displayString:ignoredForRevert:](self, "initWithIdentifier:imageData:lastUsedDate:cropRect:source:sourceIdentifier:variant:poseConfigurationData:displayString:ignoredForRevert:", v17, v15, v14, a6, 0, 0, x, y, width, height, 0, 0, v20);

  return v18;
}

- (CNContactImage)initWithIdentifier:(id)a3 imageData:(id)a4 cropRect:(CGRect)a5 lastUsedDate:(id)a6
{
  uint64_t v7;

  LOBYTE(v7) = 0;
  return -[CNContactImage initWithIdentifier:imageData:lastUsedDate:cropRect:source:sourceIdentifier:variant:poseConfigurationData:displayString:ignoredForRevert:](self, "initWithIdentifier:imageData:lastUsedDate:cropRect:source:sourceIdentifier:variant:poseConfigurationData:displayString:ignoredForRevert:", a3, a4, a6, 0, 0, 0, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height, 0, 0, v7);
}

- (CNContactImage)initWithIdentifier:(id)a3 imageData:(id)a4 lastUsedDate:(id)a5 cropRect:(CGRect)a6 source:(int64_t)a7 sourceIdentifier:(id)a8 variant:(id)a9 poseConfigurationData:(id)a10 displayString:(id)a11 ignoredForRevert:(BOOL)a12
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v21;
  id v22;
  CNContactImage *v23;
  NSString *v24;
  void *identifier;
  uint64_t v26;
  NSString *v27;
  CNContactImage *v28;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  objc_super v36;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v21 = a3;
  v35 = a4;
  v34 = a5;
  v33 = a8;
  v32 = a9;
  v31 = a10;
  v22 = a11;
  v36.receiver = self;
  v36.super_class = (Class)CNContactImage;
  v23 = -[CNContactImage init](&v36, sel_init);
  if (v23)
  {
    if (objc_msgSend(v21, "length"))
    {
      v24 = (NSString *)v21;
      identifier = v23->_identifier;
      v23->_identifier = v24;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      identifier = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(identifier, "UUIDString");
      v26 = objc_claimAutoreleasedReturnValue();
      v27 = v23->_identifier;
      v23->_identifier = (NSString *)v26;

    }
    objc_storeStrong((id *)&v23->_imageData, a4);
    objc_storeStrong((id *)&v23->_lastUsedDate, a5);
    v23->_cropRect.origin.x = x;
    v23->_cropRect.origin.y = y;
    v23->_cropRect.size.width = width;
    v23->_cropRect.size.height = height;
    v23->_source = a7;
    objc_storeStrong((id *)&v23->_sourceIdentifier, a8);
    objc_storeStrong((id *)&v23->_variant, a9);
    objc_storeStrong((id *)&v23->_poseConfigurationData, a10);
    objc_storeStrong((id *)&v23->_displayString, a11);
    v23->_ignoredForRevert = a12;
    v28 = v23;
  }

  return v23;
}

- (id)copyWithNewImageData:(id)a3
{
  id v4;
  CNContactImage *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  CNContactImage *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v4 = a3;
  v5 = [CNContactImage alloc];
  -[CNContactImage cropRect](self, "cropRect");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  -[CNContactImage lastUsedDate](self, "lastUsedDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[CNContactImage initWithImageData:cropRect:lastUsedDate:](v5, "initWithImageData:cropRect:lastUsedDate:", v4, v14, v7, v9, v11, v13);

  -[CNContactImage setSource:](v15, "setSource:", -[CNContactImage source](self, "source"));
  -[CNContactImage sourceIdentifier](self, "sourceIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactImage setSourceIdentifier:](v15, "setSourceIdentifier:", v16);

  -[CNContactImage variant](self, "variant");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactImage setVariant:](v15, "setVariant:", v17);

  -[CNContactImage displayString](self, "displayString");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactImage setDisplayString:](v15, "setDisplayString:", v18);

  -[CNContactImage poseConfigurationData](self, "poseConfigurationData");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactImage setPoseConfigurationData:](v15, "setPoseConfigurationData:", v19);

  -[CNContactImage setIgnoredForRevert:](v15, "setIgnoredForRevert:", -[CNContactImage ignoredForRevert](self, "ignoredForRevert"));
  -[CNContactImage pairedPoster](self, "pairedPoster");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactImage setPairedPoster:](v15, "setPairedPoster:", v20);

  -[CNContactImage setVisualFingerprint:](v15, "setVisualFingerprint:", 0);
  return v15;
}

- (id)copyWithNewImageData:(id)a3 cropRect:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  CNContactImage *v10;
  void *v11;
  CNContactImage *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = a3;
  v10 = [CNContactImage alloc];
  -[CNContactImage lastUsedDate](self, "lastUsedDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[CNContactImage initWithImageData:cropRect:lastUsedDate:](v10, "initWithImageData:cropRect:lastUsedDate:", v9, v11, x, y, width, height);

  -[CNContactImage setSource:](v12, "setSource:", -[CNContactImage source](self, "source"));
  -[CNContactImage sourceIdentifier](self, "sourceIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactImage setSourceIdentifier:](v12, "setSourceIdentifier:", v13);

  -[CNContactImage variant](self, "variant");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactImage setVariant:](v12, "setVariant:", v14);

  -[CNContactImage displayString](self, "displayString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactImage setDisplayString:](v12, "setDisplayString:", v15);

  -[CNContactImage poseConfigurationData](self, "poseConfigurationData");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactImage setPoseConfigurationData:](v12, "setPoseConfigurationData:", v16);

  -[CNContactImage setIgnoredForRevert:](v12, "setIgnoredForRevert:", -[CNContactImage ignoredForRevert](self, "ignoredForRevert"));
  -[CNContactImage pairedPoster](self, "pairedPoster");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactImage setPairedPoster:](v12, "setPairedPoster:", v17);

  -[CNContactImage setVisualFingerprint:](v12, "setVisualFingerprint:", 0);
  return v12;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSData)imageData
{
  return self->_imageData;
}

- (NSDate)lastUsedDate
{
  return self->_lastUsedDate;
}

- (CGRect)cropRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_cropRect.origin.x;
  y = self->_cropRect.origin.y;
  width = self->_cropRect.size.width;
  height = self->_cropRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (int64_t)source
{
  return self->_source;
}

- (void)setSource:(int64_t)a3
{
  self->_source = a3;
}

- (NSString)sourceIdentifier
{
  return self->_sourceIdentifier;
}

- (void)setSourceIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_sourceIdentifier, a3);
}

- (NSString)variant
{
  return self->_variant;
}

- (void)setVariant:(id)a3
{
  objc_storeStrong((id *)&self->_variant, a3);
}

- (NSData)poseConfigurationData
{
  return self->_poseConfigurationData;
}

- (void)setPoseConfigurationData:(id)a3
{
  objc_storeStrong((id *)&self->_poseConfigurationData, a3);
}

- (NSString)displayString
{
  return self->_displayString;
}

- (void)setDisplayString:(id)a3
{
  objc_storeStrong((id *)&self->_displayString, a3);
}

- (BOOL)ignoredForRevert
{
  return self->_ignoredForRevert;
}

- (void)setIgnoredForRevert:(BOOL)a3
{
  self->_ignoredForRevert = a3;
}

- (CNVisualFingerprint)visualFingerprint
{
  return self->_visualFingerprint;
}

- (void)setVisualFingerprint:(id)a3
{
  objc_storeStrong((id *)&self->_visualFingerprint, a3);
}

- (CNContactPoster)pairedPoster
{
  return self->_pairedPoster;
}

- (void)setPairedPoster:(id)a3
{
  objc_storeStrong((id *)&self->_pairedPoster, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pairedPoster, 0);
  objc_storeStrong((id *)&self->_visualFingerprint, 0);
  objc_storeStrong((id *)&self->_displayString, 0);
  objc_storeStrong((id *)&self->_poseConfigurationData, 0);
  objc_storeStrong((id *)&self->_variant, 0);
  objc_storeStrong((id *)&self->_sourceIdentifier, 0);
  objc_storeStrong((id *)&self->_lastUsedDate, 0);
  objc_storeStrong((id *)&self->_imageData, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
