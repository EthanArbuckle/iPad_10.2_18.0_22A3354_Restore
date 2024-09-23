@implementation MSSticker

+ (MSSticker)stickerWithContentsOfURL:(id)a3 localizedDescription:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  MSSticker *v9;

  v7 = a4;
  v8 = a3;
  v9 = -[MSSticker initWithContentsOfFileURL:localizedDescription:error:]([MSSticker alloc], "initWithContentsOfFileURL:localizedDescription:error:", v8, v7, a5);

  return v9;
}

- (MSSticker)initWithContentsOfFileURL:(NSURL *)fileURL localizedDescription:(NSString *)localizedDescription error:(NSError *)error
{
  NSURL *v7;
  NSString *v8;
  MSSticker *v9;
  uint64_t v10;
  NSURL *imageFileURL;
  NSUUID *stickerIdentifier;
  NSArray *representations;
  uint64_t v14;
  NSString *externalURI;
  NSData *metadata;
  NSDictionary *attributionInfo;
  objc_super v19;

  v7 = fileURL;
  v8 = localizedDescription;
  v19.receiver = self;
  v19.super_class = (Class)MSSticker;
  v9 = -[MSSticker init](&v19, sel_init);
  if (v9)
  {
    v10 = -[NSURL copy](v7, "copy");
    imageFileURL = v9->_imageFileURL;
    v9->_imageFileURL = (NSURL *)v10;

    objc_storeStrong((id *)&v9->_localizedDescription, localizedDescription);
    stickerIdentifier = v9->_stickerIdentifier;
    v9->_stickerIdentifier = 0;

    representations = v9->_representations;
    v9->_representations = 0;

    -[NSURL absoluteString](v7, "absoluteString");
    v14 = objc_claimAutoreleasedReturnValue();
    externalURI = v9->_externalURI;
    v9->_externalURI = (NSString *)v14;

    v9->_stickerEffectType = -1;
    metadata = v9->_metadata;
    v9->_metadata = 0;

    attributionInfo = v9->_attributionInfo;
    v9->_attributionInfo = 0;

  }
  return v9;
}

- (MSSticker)initWithFileURL:(NSURL *)url identifier:(NSUUID *)identifier localizedDescription:(NSString *)localizedDescription
{
  NSURL *v8;
  NSUUID *v9;
  NSString *v10;
  MSSticker *v11;
  uint64_t v12;
  NSURL *imageFileURL;
  NSUUID *stickerIdentifier;
  NSArray *representations;
  uint64_t v16;
  NSString *externalURI;
  NSData *metadata;
  NSDictionary *attributionInfo;
  objc_super v21;

  v8 = url;
  v9 = identifier;
  v10 = localizedDescription;
  v21.receiver = self;
  v21.super_class = (Class)MSSticker;
  v11 = -[MSSticker init](&v21, sel_init);
  if (v11)
  {
    v12 = -[NSURL copy](v8, "copy");
    imageFileURL = v11->_imageFileURL;
    v11->_imageFileURL = (NSURL *)v12;

    objc_storeStrong((id *)&v11->_localizedDescription, localizedDescription);
    stickerIdentifier = v11->_stickerIdentifier;
    v11->_stickerIdentifier = 0;

    representations = v11->_representations;
    v11->_representations = 0;

    -[NSURL absoluteString](v8, "absoluteString");
    v16 = objc_claimAutoreleasedReturnValue();
    externalURI = v11->_externalURI;
    v11->_externalURI = (NSString *)v16;

    v11->_stickerEffectType = -1;
    metadata = v11->_metadata;
    v11->_metadata = 0;

    attributionInfo = v11->_attributionInfo;
    v11->_attributionInfo = 0;

    objc_storeStrong((id *)&v11->_stickerIdentifier, identifier);
  }

  return v11;
}

- (MSSticker)initWithContentsOfURL:(id)a3 data:(id)a4 localizedDescription:(id)a5 error:(id *)a6
{
  return -[MSSticker initWithContentsOfURL:data:externalURI:localizedDescription:error:](self, "initWithContentsOfURL:data:externalURI:localizedDescription:error:", a3, a4, 0, a5, a6);
}

- (MSSticker)initWithContentsOfURL:(id)a3 data:(id)a4 externalURI:(id)a5 localizedDescription:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  MSSticker *v15;
  uint64_t v16;
  NSURL *imageFileURL;
  NSUUID *stickerIdentifier;
  NSArray *representations;
  NSData *metadata;
  NSDictionary *attributionInfo;
  objc_super v23;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v23.receiver = self;
  v23.super_class = (Class)MSSticker;
  v15 = -[MSSticker init](&v23, sel_init);
  if (v15)
  {
    v16 = objc_msgSend(v11, "copy");
    imageFileURL = v15->_imageFileURL;
    v15->_imageFileURL = (NSURL *)v16;

    objc_storeStrong((id *)&v15->_localizedDescription, a6);
    objc_storeStrong((id *)&v15->_data, a4);
    stickerIdentifier = v15->_stickerIdentifier;
    v15->_stickerIdentifier = 0;

    representations = v15->_representations;
    v15->_representations = 0;

    objc_storeStrong((id *)&v15->_externalURI, a5);
    v15->_stickerEffectType = -1;
    metadata = v15->_metadata;
    v15->_metadata = 0;

    attributionInfo = v15->_attributionInfo;
    v15->_attributionInfo = 0;

  }
  return v15;
}

- (MSSticker)initWithContentsOfURL:(id)a3 externalURI:(id)a4 localizedDescription:(id)a5 error:(id *)a6
{
  return -[MSSticker initWithContentsOfURL:data:externalURI:localizedDescription:error:](self, "initWithContentsOfURL:data:externalURI:localizedDescription:error:", a3, 0, a4, a5, a6);
}

- (MSSticker)initWithStickerIdentifier:(id)a3 representations:(id)a4 stickerName:(id)a5 externalURI:(id)a6 localizedDescription:(id)a7
{
  return -[MSSticker initWithStickerIdentifier:representations:stickerName:effectType:externalURI:localizedDescription:metadata:attributionInfo:](self, "initWithStickerIdentifier:representations:stickerName:effectType:externalURI:localizedDescription:metadata:attributionInfo:", a3, a4, a5, 0, a6, a7, 0, 0);
}

- (MSSticker)initWithStickerIdentifier:(id)a3 representations:(id)a4 stickerName:(id)a5 effectType:(int64_t)a6 externalURI:(id)a7 localizedDescription:(id)a8 metadata:(id)a9 attributionInfo:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  MSSticker *v23;
  uint64_t v24;
  NSUUID *stickerIdentifier;
  uint64_t v26;
  NSArray *representations;
  uint64_t v28;
  NSString *stickerName;
  uint64_t v30;
  NSString *externalURI;
  uint64_t v32;
  NSString *localizedDescription;
  NSURL *imageFileURL;
  NSData *data;
  uint64_t v36;
  NSData *metadata;
  uint64_t v38;
  NSDictionary *attributionInfo;
  objc_super v41;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  v22 = a10;
  v41.receiver = self;
  v41.super_class = (Class)MSSticker;
  v23 = -[MSSticker init](&v41, sel_init);
  if (v23)
  {
    v24 = objc_msgSend(v16, "copy");
    stickerIdentifier = v23->_stickerIdentifier;
    v23->_stickerIdentifier = (NSUUID *)v24;

    v26 = objc_msgSend(v17, "copy");
    representations = v23->_representations;
    v23->_representations = (NSArray *)v26;

    v28 = objc_msgSend(v18, "copy");
    stickerName = v23->_stickerName;
    v23->_stickerName = (NSString *)v28;

    v30 = objc_msgSend(v19, "copy");
    externalURI = v23->_externalURI;
    v23->_externalURI = (NSString *)v30;

    v32 = objc_msgSend(v20, "copy");
    localizedDescription = v23->_localizedDescription;
    v23->_localizedDescription = (NSString *)v32;

    imageFileURL = v23->_imageFileURL;
    v23->_imageFileURL = 0;

    data = v23->_data;
    v23->_data = 0;

    v36 = objc_msgSend(v21, "copy");
    metadata = v23->_metadata;
    v23->_metadata = (NSData *)v36;

    v38 = objc_msgSend(v22, "copy");
    attributionInfo = v23->_attributionInfo;
    v23->_attributionInfo = (NSDictionary *)v38;

    v23->_stickerEffectType = a6;
  }

  return v23;
}

- (MSSticker)initWithStickerIdentifier:(id)a3 representations:(id)a4 externalURI:(id)a5 localizedDescription:(id)a6
{
  return -[MSSticker initWithStickerIdentifier:representations:stickerName:externalURI:localizedDescription:](self, "initWithStickerIdentifier:representations:stickerName:externalURI:localizedDescription:", a3, a4, 0, a5, a6);
}

- (NSString)description
{
  NSArray *representations;
  void *v4;
  objc_class *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  const __CFString *v9;
  void *v10;

  representations = self->_representations;
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  v8 = 8;
  if (representations)
  {
    v9 = CFSTR("<%@-<%p> imageFileURL %@ localizedDescription %@>");
  }
  else
  {
    v8 = 56;
    v9 = CFSTR("<%@-<%p> representations %@ localizedDescription %@>");
  }
  objc_msgSend(v4, "stringWithFormat:", v9, v6, self, *(Class *)((char *)&self->super.isa + v8), self->_localizedDescription);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

- (void)setStickerEffectType:(unint64_t)a3
{
  if (self->_stickerEffectType != a3)
    self->_stickerEffectType = a3;
}

- (void)_convertImageFileURLIfNeeded
{
  NSArray *v3;
  NSArray *representations;
  NSString *v5;
  NSString *externalURI;

  if (self->_imageFileURL && !self->_representations)
  {
    objc_msgSend((id)objc_opt_class(), "_stickerRepresentationsForImageFileURL:", self->_imageFileURL);
    v3 = (NSArray *)objc_claimAutoreleasedReturnValue();
    representations = self->_representations;
    self->_representations = v3;

    if (!self->_externalURI)
    {
      -[NSURL absoluteString](self->_imageFileURL, "absoluteString");
      v5 = (NSString *)objc_claimAutoreleasedReturnValue();
      externalURI = self->_externalURI;
      self->_externalURI = v5;

    }
  }
}

+ (BOOL)_isImageSourceAdaptiveImageGlyph:(CGImageSource *)a3
{
  BOOL v4;
  CFDictionaryRef v5;
  void *v6;
  void *v7;

  if (CGImageSourceGetCount(a3) == 1)
    return 0;
  v5 = CGImageSourceCopyPropertiesAtIndex(a3, 0, 0);
  -[__CFDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CBD090]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0CBD098]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v4 = (objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v7, "length") != 0;

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (CGSize)_frameSizeFromFrameProperties:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;
  double v9;
  double v10;
  CGSize result;

  v3 = *MEMORY[0x1E0CBD048];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedIntegerValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CBD040]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "unsignedIntegerValue");
  v9 = (double)v6;
  v10 = (double)v8;
  result.height = v10;
  result.width = v9;
  return result;
}

+ (id)_stickerRepresentationRoleForAdaptiveImageGlyphFrameWithProperties:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v7;
  id *v9;
  id v10;
  NSObject *v12;

  objc_msgSend(a1, "_frameSizeFromFrameProperties:", a3);
  v5 = v3;
  if (v3 == 40.0 && v4 == 40.0)
  {
    v9 = (id *)MEMORY[0x1E0CEC258];
    goto LABEL_20;
  }
  v7 = v4;
  if (v3 == 64.0 && v4 == 64.0)
  {
    v9 = (id *)MEMORY[0x1E0CEC260];
    goto LABEL_20;
  }
  if (v3 == 96.0 && v4 == 96.0)
  {
    v9 = (id *)MEMORY[0x1E0CEC268];
LABEL_20:
    v10 = *v9;
    return v10;
  }
  if (v3 == 160.0 && v4 == 160.0)
  {
    v9 = (id *)MEMORY[0x1E0CEC248];
    goto LABEL_20;
  }
  if (v3 == 320.0 && v4 == 320.0)
  {
    v9 = (id *)MEMORY[0x1E0CEC250];
    goto LABEL_20;
  }
  ms_defaultLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    +[MSSticker _stickerRepresentationRoleForAdaptiveImageGlyphFrameWithProperties:].cold.1(v12, v5, v7);

  v10 = 0;
  return v10;
}

+ (id)_stickerRepresentationsForImageFileURL:(id)a3
{
  const __CFURL *v4;
  const __CFURL *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *Type;
  __CFString *v10;
  _QWORD *v11;
  CFComparisonResult v12;
  _BOOL4 v13;
  void *v14;
  int v15;
  BOOL v16;
  int v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  void *v22;
  _QWORD *v23;
  size_t Count;
  size_t v25;
  size_t v26;
  double v27;
  double v28;
  CGImageSource *v29;
  void *v30;
  CFDictionaryRef v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  CGImageRef ImageAtIndex;
  CGImageRef v38;
  NSObject *v39;
  void *v40;
  NSObject *v41;
  id v42;
  NSObject *v43;
  const char *v44;
  id v45;
  id v46;
  void *v47;
  uint64_t v48;
  void *v49;
  id v50;
  void *v51;
  id v52;
  void *v53;
  _BOOL4 v55;
  char v56;
  void *v57;
  const __CFURL *v58;
  __CFString *v59;
  void *v60;
  void *v61;
  int v62;
  CGImageSource *isrc;
  int v64;
  id v65;
  uint64_t v66;
  uint64_t v67;
  uint8_t buf[4];
  size_t v69;
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v4 = (const __CFURL *)a3;
  v5 = v4;
  if (!v4)
  {
    v18 = 0;
    goto LABEL_58;
  }
  v6 = (void *)MEMORY[0x1E0CEA638];
  -[__CFURL path](v4, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "imageWithContentsOfFile:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v18 = 0;
    goto LABEL_57;
  }
  isrc = CGImageSourceCreateWithURL(v5, 0);
  Type = CGImageSourceGetType(isrc);
  v10 = (__CFString *)Type;
  v11 = (_QWORD *)MEMORY[0x1E0CA5C10];
  v65 = a1;
  if (!Type)
  {
    v13 = 0;
    v17 = 0;
    v64 = 0;
    v16 = 0;
    v62 = 0;
    goto LABEL_14;
  }
  v12 = CFStringCompare(Type, (CFStringRef)*MEMORY[0x1E0CA5C10], 0);
  v13 = v12 == kCFCompareEqualTo;
  if (v12 == kCFCompareEqualTo)
    goto LABEL_7;
  if (CFStringCompare(v10, (CFStringRef)*MEMORY[0x1E0D39C50], 0) == kCFCompareEqualTo)
  {
    v64 = objc_msgSend(a1, "_isImageSourceAdaptiveImageGlyph:", isrc);
    v13 = 0;
    v16 = 0;
    v62 = 0;
    v17 = 1;
    goto LABEL_14;
  }
  IMSupportedAnimatedImageUTTypesSortedByPreference();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "containsObject:", v10);

  if (!v15)
  {
    v13 = 0;
    v17 = 0;
    v64 = 0;
    v16 = 0;
    v62 = 0;
  }
  else
  {
LABEL_7:
    v16 = v12 != kCFCompareEqualTo;
    v62 = IMFileURLIsActuallyAnimated();
    v17 = 0;
    v64 = 0;
  }
  a1 = v65;
LABEL_14:
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = v10;
  if (v16)
  {
LABEL_15:
    v19 = objc_alloc_init(MEMORY[0x1E0CEAEF8]);
    v67 = 0;
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v5, 1, &v67);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v67;
    objc_msgSend(v19, "setData:", v20);

    if (!v21)
    {
      v22 = (void *)-[__CFString copy](v10, "copy");
      objc_msgSend(v19, "setType:", v22);

      objc_msgSend(v8, "size");
      objc_msgSend(v19, "setSize:");
      v23 = (_QWORD *)MEMORY[0x1E0CEC230];
      if (!v62)
        v23 = (_QWORD *)MEMORY[0x1E0CEC240];
      objc_msgSend(v19, "setRole:", *v23);
      objc_msgSend(v18, "addObject:", v19);
    }

    a1 = v65;
    goto LABEL_20;
  }
  if (v17)
  {
    if (((v13 | objc_msgSend(a1, "_isHEICSupported") & (v64 ^ 1)) & 1) != 0)
      goto LABEL_15;
    v13 = 0;
  }
  else if (v13)
  {
    goto LABEL_15;
  }
LABEL_20:
  if (!v64)
    goto LABEL_47;
  if (!objc_msgSend(a1, "_isHEICSupported"))
    goto LABEL_47;
  Count = CGImageSourceGetCount(isrc);
  if (!Count)
    goto LABEL_47;
  v25 = Count;
  v55 = v13;
  v56 = v17;
  v60 = 0;
  v61 = v18;
  v57 = v8;
  v58 = v5;
  v26 = 0;
  v27 = *MEMORY[0x1E0C9D820];
  v28 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  v29 = isrc;
  do
  {
    v30 = (void *)MEMORY[0x1DF0AA074]();
    v31 = CGImageSourceCopyPropertiesAtIndex(v29, v26, 0);
    objc_msgSend(a1, "_stickerRepresentationRoleForAdaptiveImageGlyphFrameWithProperties:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v32, "length"))
    {
      ms_defaultLog();
      v39 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        goto LABEL_38;
      *(_DWORD *)buf = 134217984;
      v69 = v26;
      v43 = v39;
      v44 = "Skipping frame %ld with no role";
LABEL_33:
      _os_log_error_impl(&dword_1DB1A9000, v43, OS_LOG_TYPE_ERROR, v44, buf, 0xCu);
      goto LABEL_38;
    }
    objc_msgSend(a1, "_frameSizeFromFrameProperties:", v31);
    v34 = v33;
    v36 = v35;
    ImageAtIndex = CGImageSourceCreateImageAtIndex(v29, v26, 0);
    if (!ImageAtIndex)
    {
      ms_defaultLog();
      v39 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        goto LABEL_38;
      *(_DWORD *)buf = 134217984;
      v69 = v26;
      v43 = v39;
      v44 = "Skipping frame %ld due to failure to make CGImage";
      goto LABEL_33;
    }
    v38 = ImageAtIndex;
    objc_msgSend(MEMORY[0x1E0CEA638], "imageWithCGImage:", ImageAtIndex);
    v39 = objc_claimAutoreleasedReturnValue();
    -[NSObject __ms_HEICData](v39, "__ms_HEICData");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v40, "length"))
    {
      ms_defaultLog();
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        v69 = v26;
        _os_log_error_impl(&dword_1DB1A9000, v41, OS_LOG_TYPE_ERROR, "Skipping frame %ld due to failure to convert to HEIC data", buf, 0xCu);
      }
LABEL_36:
      v36 = v28;
      v34 = v27;
      goto LABEL_37;
    }
    v41 = objc_alloc_init(MEMORY[0x1E0CEAEF8]);
    -[NSObject setData:](v41, "setData:", v40);
    -[NSObject setType:](v41, "setType:", CFSTR("public.heic"));
    -[NSObject setSize:](v41, "setSize:", v34, v36);
    -[NSObject setRole:](v41, "setRole:", v32);
    objc_msgSend(v61, "addObject:", v41);
    if (v34 <= v27)
      goto LABEL_36;
    v42 = v40;

    v60 = v42;
    v29 = isrc;
LABEL_37:

    CFRelease(v38);
    v28 = v36;
    v27 = v34;
    a1 = v65;
LABEL_38:

    objc_autoreleasePoolPop(v30);
    ++v26;
  }
  while (v25 != v26);
  v8 = v57;
  v5 = v58;
  v18 = v61;
  v11 = (_QWORD *)MEMORY[0x1E0CA5C10];
  v13 = v55;
  LOBYTE(v17) = v56;
  if (v60)
  {
    v45 = objc_alloc_init(MEMORY[0x1E0CEAEF8]);
    objc_msgSend(v45, "setData:", v60);
    objc_msgSend(v45, "setType:", CFSTR("public.heic"));
    objc_msgSend(v45, "setSize:", v27, v28);
    objc_msgSend(v45, "setRole:", *MEMORY[0x1E0CEC240]);
    objc_msgSend(v61, "insertObject:atIndex:", v45, 0);

  }
LABEL_47:
  if (v62)
  {
    v46 = objc_alloc_init(MEMORY[0x1E0CEAEF8]);
    v66 = 0;
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v5, 1, &v66);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = v66;
    objc_msgSend(v46, "setData:", v47);

    if (!v48)
    {
      v49 = (void *)-[__CFString copy](v59, "copy");
      objc_msgSend(v46, "setType:", v49);

      objc_msgSend(v8, "size");
      objc_msgSend(v46, "setSize:");
      objc_msgSend(v46, "setRole:", *MEMORY[0x1E0CEC240]);
      objc_msgSend(v18, "addObject:", v46);
    }

    a1 = v65;
  }
  if (((v13 | v64) & 1) == 0)
  {
    v50 = objc_alloc_init(MEMORY[0x1E0CEAEF8]);
    objc_msgSend(v8, "__ms_PNGData");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "setData:", v51);

    objc_msgSend(v50, "setType:", *v11);
    objc_msgSend(v8, "size");
    objc_msgSend(v50, "setSize:");
    objc_msgSend(v50, "setRole:", *MEMORY[0x1E0CEC238]);
    objc_msgSend(v18, "addObject:", v50);

  }
  if ((v17 & 1) == 0 && objc_msgSend(a1, "_isHEICSupported"))
  {
    v52 = objc_alloc_init(MEMORY[0x1E0CEAEF8]);
    objc_msgSend(v8, "__ms_HEICData");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "setData:", v53);

    objc_msgSend(v52, "setType:", CFSTR("public.heic"));
    objc_msgSend(v8, "size");
    objc_msgSend(v52, "setSize:");
    objc_msgSend(v52, "setRole:", *MEMORY[0x1E0CEC240]);
    objc_msgSend(v18, "addObject:", v52);

  }
  CFRelease(isrc);
LABEL_57:

LABEL_58:
  return v18;
}

+ (BOOL)_isHEICSupported
{
  if (_isHEICSupported_onceToken != -1)
    dispatch_once(&_isHEICSupported_onceToken, &__block_literal_global_4);
  return _isHEICSupported_isSupported;
}

void __29__MSSticker__isHEICSupported__block_invoke()
{
  CFArrayRef v0;

  v0 = CGImageDestinationCopyTypeIdentifiers();
  _isHEICSupported_isSupported = -[__CFArray containsObject:](v0, "containsObject:", CFSTR("public.heic"));

}

- (void)_generateImageData
{
  void *v3;
  void *v4;
  NSArray *representations;
  void *v6;
  void *v7;

  -[MSSticker _imageData](self, "_imageData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[MSSticker imageFileURL](self, "imageFileURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v7 = v4;
      -[MSSticker _generateImageDataFromURL:](self, "_generateImageDataFromURL:", v4);
    }
    else
    {
      representations = self->_representations;
      if (!representations)
      {
LABEL_7:

        return;
      }
      v7 = 0;
      -[NSArray firstObject](representations, "firstObject");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[MSSticker _generateImageDataFromRepresentation:](self, "_generateImageDataFromRepresentation:", v6);

    }
    v4 = v7;
    goto LABEL_7;
  }
}

- (void)_generateImageDataFromURL:(id)a3
{
  id v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  objc_class *CKImageDataClass;
  NSObject *v10;
  NSObject *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  const __CFString *v21;
  id v22;
  const __CFString *v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "__ms_conformsToUTI:", *MEMORY[0x1E0CA5B90]);
  if ((v5 & 1) == 0)
  {
    v6 = (void *)MEMORY[0x1E0CB35C8];
    if (v4)
    {
      v23 = CFSTR("MSStickersErrorStickerInfoKey");
      v24[0] = v4;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }
    objc_msgSend(v6, "errorWithDomain:code:userInfo:", CFSTR("com.apple.messages.stickers-error"), 3, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSSticker set_stickerError:](self, "set_stickerError:", v8);

    if (v4)
  }
  CKImageDataClass = (objc_class *)getCKImageDataClass();
  IMLogHandleForCategory();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (CKImageDataClass)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[MSSticker _generateImageDataFromURL:].cold.2(CKImageDataClass);
  }
  else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    -[MSSticker _generateImageDataFromURL:].cold.1();
  }

  v12 = objc_alloc(objc_retainAutorelease(CKImageDataClass));
  -[MSSticker imageFileURL](self, "imageFileURL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithURL:", v13);

  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "path");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "fileExistsAtPath:", v17))
      v18 = 2;
    else
      v18 = 1;

    v19 = (void *)MEMORY[0x1E0CB35C8];
    v21 = CFSTR("MSStickersErrorStickerInfoKey");
    v22 = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "errorWithDomain:code:userInfo:", CFSTR("com.apple.messages.stickers-error"), v18, v15);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSSticker set_stickerError:](self, "set_stickerError:", v20);

    goto LABEL_19;
  }
  if (v5)
  {
    -[MSSticker set_imageData:](self, "set_imageData:", v14);
    -[MSSticker _imageData](self, "_imageData");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "count");
LABEL_19:

  }
}

- (void)_generateImageDataFromRepresentation:(id)a3
{
  void *v3;
  id v5;
  const __CFString *v6;
  objc_class *CKImageDataClass;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (const __CFString *)objc_msgSend(v5, "type");
  if (UTTypeConformsTo(v6, (CFStringRef)*MEMORY[0x1E0CA5B90]))
  {
    CKImageDataClass = (objc_class *)getCKImageDataClass();
    IMLogHandleForCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (CKImageDataClass)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        -[MSSticker _generateImageDataFromRepresentation:].cold.2(CKImageDataClass);
    }
    else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      -[MSSticker _generateImageDataFromRepresentation:].cold.1();
    }

    v13 = objc_alloc(objc_retainAutorelease(CKImageDataClass));
    objc_msgSend(v5, "data");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v13, "initWithData:", v14);

    -[MSSticker set_imageData:](self, "set_imageData:", v11);
  }
  else
  {
    v10 = (void *)MEMORY[0x1E0CB35C8];
    -[MSSticker stickerIdentifier](self, "stickerIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v16 = CFSTR("MSStickersErrorStickerInfoKey");
      -[MSSticker stickerIdentifier](self, "stickerIdentifier");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = v3;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = 0;
    }
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("com.apple.messages.stickers-error"), 3, v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSSticker set_stickerError:](self, "set_stickerError:", v15);

    if (v11)
    {

    }
  }

}

- (void)_generateThumbnail
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromClass(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_3(&dword_1DB1A9000, v2, v3, "Loaded weak linked class: '%@': %s:%i (%s)", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3_0();
}

+ (id)MSStickerPreviewCacheKeyForSticker:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  objc_msgSend(v3, "stickerIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v3, "stickerIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "UUIDString");
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v3, "imageFileURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "stringWithFormat:", CFSTR("%lu"), objc_msgSend(v5, "hash"));
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSURL)animatedImageCacheURL
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  objc_class *CKImageDataClass;
  NSObject *v9;
  NSObject *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[4];

  v19[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E98], "__ms_cachesDirectory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSUUID UUIDString](self->_stickerIdentifier, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length"))
  {
    v6 = v5;
  }
  else
  {
    -[NSURL lastPathComponent](self->_imageFileURL, "lastPathComponent");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;
  CKImageDataClass = (objc_class *)getCKImageDataClass();
  IMLogHandleForCategory();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (CKImageDataClass)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[MSSticker animatedImageCacheURL].cold.2(CKImageDataClass);
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    -[MSSticker animatedImageCacheURL].cold.1();
  }

  if (-[objc_class supportsASTC](objc_retainAutorelease(CKImageDataClass), "supportsASTC"))
    v11 = CFSTR("ckanimatedimage");
  else
    v11 = CFSTR("cpbitmap");
  objc_msgSend(v7, "stringByAppendingPathExtension:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length") && objc_msgSend(v12, "length"))
  {
    v19[0] = v4;
    v19[1] = CFSTR("BrowserData");
    v19[2] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "pathWithComponents:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringByDeletingLastPathComponent");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v16, 1, 0, 0);

    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v17 = 0;
  }

  return (NSURL *)v17;
}

- (NSURL)imageFileURL
{
  return self->_imageFileURL;
}

- (NSString)localizedDescription
{
  return self->_localizedDescription;
}

- (NSData)data
{
  return self->_data;
}

- (unint64_t)stickerEffectType
{
  return self->_stickerEffectType;
}

- (NSUUID)stickerIdentifier
{
  return self->_stickerIdentifier;
}

- (NSString)stickerName
{
  return self->_stickerName;
}

- (NSArray)representations
{
  return self->_representations;
}

- (NSString)externalURI
{
  return self->_externalURI;
}

- (NSDictionary)attributionInfo
{
  return self->_attributionInfo;
}

- (NSData)metadata
{
  return self->_metadata;
}

- (NSString)stickerPackGUID
{
  return self->_stickerPackGUID;
}

- (void)setStickerPackGUID:(id)a3
{
  objc_storeStrong((id *)&self->_stickerPackGUID, a3);
}

- (IMImageDataProtocol)_imageData
{
  return self->__imageData;
}

- (void)set_imageData:(id)a3
{
  objc_storeStrong((id *)&self->__imageData, a3);
}

- (NSError)_stickerError
{
  return self->__stickerError;
}

- (void)set_stickerError:(id)a3
{
  objc_storeStrong((id *)&self->__stickerError, a3);
}

- (UIImage)_thumbnail
{
  return self->__thumbnail;
}

- (void)set_thumbnail:(id)a3
{
  objc_storeStrong((id *)&self->__thumbnail, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__thumbnail, 0);
  objc_storeStrong((id *)&self->__stickerError, 0);
  objc_storeStrong((id *)&self->__imageData, 0);
  objc_storeStrong((id *)&self->_stickerPackGUID, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_attributionInfo, 0);
  objc_storeStrong((id *)&self->_externalURI, 0);
  objc_storeStrong((id *)&self->_representations, 0);
  objc_storeStrong((id *)&self->_stickerName, 0);
  objc_storeStrong((id *)&self->_stickerIdentifier, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_localizedDescription, 0);
  objc_storeStrong((id *)&self->_imageFileURL, 0);
}

+ (void)_stickerRepresentationRoleForAdaptiveImageGlyphFrameWithProperties:(double)a3 .cold.1(os_log_t log, double a2, double a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 134218240;
  v4 = (uint64_t)a2;
  v5 = 2048;
  v6 = (uint64_t)a3;
  _os_log_error_impl(&dword_1DB1A9000, log, OS_LOG_TYPE_ERROR, "Unable to determine role for frame of size %ldx%ld", (uint8_t *)&v3, 0x16u);
}

- (void)_generateImageDataFromURL:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_0(&dword_1DB1A9000, v0, v1, "Failed to load weak link class: '%@': %s:%i (%s)", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_6();
}

- (void)_generateImageDataFromURL:(objc_class *)a1 .cold.2(objc_class *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromClass(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_3(&dword_1DB1A9000, v2, v3, "Loaded weak linked class: '%@': %s:%i (%s)", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3_0();
}

- (void)_generateImageDataFromRepresentation:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_0(&dword_1DB1A9000, v0, v1, "Failed to load weak link class: '%@': %s:%i (%s)", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_6();
}

- (void)_generateImageDataFromRepresentation:(objc_class *)a1 .cold.2(objc_class *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromClass(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_3(&dword_1DB1A9000, v2, v3, "Loaded weak linked class: '%@': %s:%i (%s)", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3_0();
}

- (void)animatedImageCacheURL
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromClass(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_3(&dword_1DB1A9000, v2, v3, "Loaded weak linked class: '%@': %s:%i (%s)", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3_0();
}

@end
