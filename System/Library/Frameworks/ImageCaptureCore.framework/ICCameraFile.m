@implementation ICCameraFile

- (NSString)mediaItemType
{
  return (NSString *)CFSTR("file");
}

- (int64_t)compareUUID:(id)a3
{
  unint64_t v4;

  v4 = objc_msgSend(a3, "oUUID");
  if (v4 == -[ICCameraFile oUUID](self, "oUUID"))
    return 0;
  if (v4 > -[ICCameraFile oUUID](self, "oUUID"))
    return -1;
  return 1;
}

- (int64_t)compareDate:(id)a3
{
  unint64_t v4;

  v4 = objc_msgSend(a3, "uTime");
  if (v4 == -[ICCameraFile uTime](self, "uTime"))
    return 0;
  if (v4 > -[ICCameraFile uTime](self, "uTime"))
    return -1;
  return 1;
}

- (void)flushThumbnailCache
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__ICCameraFile_flushThumbnailCache__block_invoke;
  block[3] = &unk_1E70C7198;
  block[4] = self;
  ICPerformBlockOnMainThread(block);
}

uint64_t __35__ICCameraFile_flushThumbnailCache__block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "willChangeValueForKey:", CFSTR("thumbnail"));
  objc_msgSend(*(id *)(a1 + 32), "willChangeValueForKey:", CFSTR("thumbnailIfAvailable"));
  objc_msgSend(*(id *)(a1 + 32), "thumbnailData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
    objc_msgSend(*(id *)(a1 + 32), "setThumbnailData:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setThumbnailState:", 1);
  objc_msgSend(*(id *)(a1 + 32), "didChangeValueForKey:", CFSTR("thumbnailIfAvailable"));
  return objc_msgSend(*(id *)(a1 + 32), "didChangeValueForKey:", CFSTR("thumbnail"));
}

- (void)setOrientation:(ICEXIFOrientationType)orientation
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[ICCameraItem UTI](self, "UTI");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0CEC3F8];
    -[ICCameraItem UTI](self, "UTI");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "typeWithIdentifier:", v7);
    v8 = (id)objc_claimAutoreleasedReturnValue();

    if (-[ICCameraFile orientation](self, "orientation") != orientation)
    {
      if (objc_msgSend(v8, "conformsToType:", *MEMORY[0x1E0CEC520]))
      {
        -[ICCameraFile setOrientationOverridden:](self, "setOrientationOverridden:", 1);
        -[ICCameraFile setPrivOrientation:](self, "setPrivOrientation:", orientation);
      }
    }

  }
}

- (void)addSidecarFile:(id)a3
{
  id v4;

  if (a3)
  {
    v4 = a3;
    -[ICCameraFile willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("sidecarFiles"));
    -[NSMutableArray addObject:](self->_sidecarFiles, "addObject:", v4);
    objc_msgSend(v4, "setOwnerID:", -[ICCameraItem objectID](self, "objectID"));

    -[ICCameraFile didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("sidecarFiles"));
  }
}

- (NSArray)sidecarFiles
{
  return (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", self->_sidecarFiles);
}

- (id)debugBadge
{
  __CFString *v3;
  NSString *debugBadge;

  if (!self->_debugBadge)
  {
    self->_debugBadge = (NSString *)CFSTR("　 　");

    if (-[ICCameraItem isRaw](self, "isRaw"))
    {
      v3 = CFSTR("🅁");
LABEL_8:
      debugBadge = self->_debugBadge;
      self->_debugBadge = &v3->isa;

      return self->_debugBadge;
    }
    if (-[ICCameraFile isJPEG](self, "isJPEG"))
    {
      v3 = CFSTR("🄹");
      goto LABEL_8;
    }
    if (-[ICCameraFile isHEIC](self, "isHEIC"))
    {
      v3 = CFSTR("🄷");
      goto LABEL_8;
    }
  }
  return self->_debugBadge;
}

- (id)debugType
{
  __CFString *v3;
  NSString *debugType;

  if (!self->_debugType)
  {
    self->_debugType = (NSString *)CFSTR("　 　");

    if (-[ICCameraFile isOriginal](self, "isOriginal"))
    {
      v3 = CFSTR("🄾 　");
LABEL_10:
      debugType = self->_debugType;
      self->_debugType = &v3->isa;

      return self->_debugType;
    }
    if (-[ICCameraFile isEditedOriginal](self, "isEditedOriginal"))
    {
      v3 = CFSTR("🄾 🄔");
      goto LABEL_10;
    }
    if (-[ICCameraFile isConverted](self, "isConverted"))
    {
      v3 = CFSTR("🅒 　");
      goto LABEL_10;
    }
    if (-[ICCameraFile isEditedConverted](self, "isEditedConverted"))
    {
      v3 = CFSTR("🅒 🄔");
      goto LABEL_10;
    }
  }
  return self->_debugType;
}

- (id)debugIdentity
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCameraFile description](self, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[ICCameraFile sidecarFiles](self, "sidecarFiles", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "description");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v3;
}

- (id)description
{
  uint64_t v3;
  void *v4;
  void *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  __CFString *v12;
  void *v13;

  v3 = -[NSMutableArray count](self->_sidecarFiles, "count");
  if (-[ICCameraItem twinID](self, "twinID")
    && (-[ICCameraItem device](self, "device"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "cameraFileWithObjectID:", -[ICCameraItem twinID](self, "twinID")),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v4,
        v5))
  {
    objc_msgSend(v5, "name");
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = &stru_1E70C89C0;
  }
  v7 = (void *)MEMORY[0x1E0CB3940];
  -[ICCameraFile debugType](self, "debugType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCameraFile debugBadge](self, "debugBadge");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCameraItem name](self, "name");
  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v11 = objc_msgSend(v10, "UTF8String");
  v12 = objc_retainAutorelease(v6);
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@ %@ | %15s | %1lu | %15s"), v8, v9, v11, v3, -[__CFString UTF8String](v12, "UTF8String"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (NSString)mediaBase
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  int v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;

  if (self->_privMediaBase)
    return -[ICCameraFile privMediaBase](self, "privMediaBase");
  -[ICCameraItem name](self, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByDeletingPathExtension");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCameraFile setPrivMediaBase:](self, "setPrivMediaBase:", v4);

  -[ICCameraFile privMediaBase](self, "privMediaBase");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (v6 >= 9)
  {
    -[ICCameraFile privMediaBase](self, "privMediaBase");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "hasPrefix:", CFSTR("IMG_O"));

    -[ICCameraFile privMediaBase](self, "privMediaBase");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v8)
    {
      v11 = CFSTR("IMG_O");
    }
    else
    {
      v12 = objc_msgSend(v9, "hasPrefix:", CFSTR("IMG_A"));

      if (!v12)
        goto LABEL_8;
      -[ICCameraFile privMediaBase](self, "privMediaBase");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      v11 = CFSTR("IMG_A");
    }
    objc_msgSend(v9, "stringByReplacingOccurrencesOfString:withString:", v11, CFSTR("IMG_"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICCameraFile setPrivMediaBase:](self, "setPrivMediaBase:", v13);

  }
LABEL_8:
  -[ICCameraFile privMediaBase](self, "privMediaBase");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "length");

  if (v15 == 8)
  {
    -[ICCameraFile privMediaBase](self, "privMediaBase");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringByAppendingString:", CFSTR(" "));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICCameraFile setPrivMediaBase:](self, "setPrivMediaBase:", v17);

  }
  return -[ICCameraFile privMediaBase](self, "privMediaBase");
}

- (BOOL)isUntouched:(unint64_t)a3
{
  return (-[ICCameraFile mediaMetadata](self, "mediaMetadata") & (a3 | 8)) == a3;
}

- (BOOL)isOriginal
{
  return -[ICCameraFile isUntouched:](self, "isUntouched:", 2);
}

- (BOOL)isConverted
{
  return -[ICCameraFile isUntouched:](self, "isUntouched:", 4);
}

- (BOOL)isUniversal
{
  return -[ICCameraFile isUntouched:](self, "isUntouched:", 1);
}

- (BOOL)isEdited:(unint64_t)a3
{
  unint64_t v4;
  BOOL v5;

  v4 = a3 | 8;
  v5 = (-[ICCameraFile mediaMetadata](self, "mediaMetadata") & 0xE0) != 0;
  return (v4 & ~-[ICCameraFile mediaMetadata](self, "mediaMetadata")) == 0 && v5;
}

- (BOOL)isEditedOriginal
{
  return -[ICCameraFile isEdited:](self, "isEdited:", 2);
}

- (BOOL)isEditedConverted
{
  return -[ICCameraFile isEdited:](self, "isEdited:", 4);
}

- (BOOL)isEditedUniversal
{
  return -[ICCameraFile isEdited:](self, "isEdited:", 1);
}

- (BOOL)partOfFamily:(unint64_t)a3
{
  return (a3 & ~-[ICCameraFile mediaMetadata](self, "mediaMetadata")) == 0;
}

- (BOOL)convertedFamily
{
  return -[ICCameraFile partOfFamily:](self, "partOfFamily:", 4);
}

- (BOOL)originalFamily
{
  return -[ICCameraFile partOfFamily:](self, "partOfFamily:", 2);
}

- (BOOL)universalFamily
{
  return -[ICCameraFile partOfFamily:](self, "partOfFamily:", 1);
}

- (BOOL)isDataUniversal
{
  return (~-[ICCameraFile mediaMetadata](self, "mediaMetadata") & 0x11) == 0;
}

- (void)flagAsSidecar
{
  -[ICCameraFile setMediaMetadata:](self, "setMediaMetadata:", -[ICCameraFile mediaMetadata](self, "mediaMetadata") | 0x400);
}

- (BOOL)isSidecar
{
  return (-[ICCameraFile mediaMetadata](self, "mediaMetadata") >> 10) & 1;
}

- (BOOL)isLegacy
{
  return (-[ICCameraFile mediaMetadata](self, "mediaMetadata") >> 9) & 1;
}

- (id)base
{
  void *v2;
  void *v3;

  -[ICCameraItem name](self, "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByDeletingPathExtension");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isMovie
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;

  -[ICCameraItem UTI](self, "UTI");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)*MEMORY[0x1E0CEC568], "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", v4) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    -[ICCameraItem UTI](self, "UTI");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)*MEMORY[0x1E0CEC540], "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "isEqualToString:", v7);

  }
  return v5;
}

- (BOOL)isImage
{
  void *v2;
  void *v3;
  char v4;

  -[ICCameraItem UTI](self, "UTI");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)*MEMORY[0x1E0CEC520], "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqualToString:", v3);

  return v4;
}

- (BOOL)isNonRawImage
{
  void *v3;
  void *v4;
  _BOOL4 v5;

  -[ICCameraItem UTI](self, "UTI");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)*MEMORY[0x1E0CEC520], "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqualToString:", v4))
    v5 = !-[ICCameraItem isRaw](self, "isRaw");
  else
    LOBYTE(v5) = 0;

  return v5;
}

- (BOOL)isAudio
{
  void *v2;
  void *v3;
  char v4;

  -[ICCameraItem UTI](self, "UTI");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)*MEMORY[0x1E0CEC450], "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqualToString:", v3);

  return v4;
}

- (BOOL)isData
{
  void *v2;
  void *v3;
  char v4;

  -[ICCameraItem UTI](self, "UTI");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)*MEMORY[0x1E0CEC4A0], "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqualToString:", v3);

  return v4;
}

- (BOOL)isJPEG
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v7;
  _BOOL4 v8;
  _BOOL8 v9;
  int v10;
  NSNumber *v11;
  NSNumber *fileIsJPEG;

  if (!self->_fileIsJPEG)
  {
    v7 = (void *)MEMORY[0x1E0CB37E8];
    v8 = -[ICCameraFile isImage](self, "isImage");
    if (v8)
    {
      -[ICCameraItem name](self, "name");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "pathExtension");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v3, "caseInsensitiveCompare:", CFSTR("JPG")))
      {
        -[ICCameraItem name](self, "name");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "pathExtension");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v5, "caseInsensitiveCompare:", CFSTR("JPEG")) == 0;
        v10 = 1;
      }
      else
      {
        v10 = 0;
        v9 = 1;
      }
    }
    else
    {
      v10 = 0;
      v9 = 0;
    }
    objc_msgSend(v7, "numberWithInt:", v9);
    v11 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    fileIsJPEG = self->_fileIsJPEG;
    self->_fileIsJPEG = v11;

    if (v10)
    {

    }
    if (v8)
    {

    }
  }
  return -[NSNumber BOOLValue](self->_fileIsJPEG, "BOOLValue");
}

- (BOOL)isHEIC
{
  void *v2;
  void *v3;
  void *v5;
  _BOOL4 v6;
  _BOOL8 v7;
  NSNumber *v8;
  NSNumber *fileIsHEIC;

  if (!self->_fileIsHEIC)
  {
    v5 = (void *)MEMORY[0x1E0CB37E8];
    v6 = -[ICCameraFile isImage](self, "isImage");
    if (v6)
    {
      -[ICCameraItem name](self, "name");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "pathExtension");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v3, "caseInsensitiveCompare:", CFSTR("HEIC")) == 0;
    }
    else
    {
      v7 = 0;
    }
    objc_msgSend(v5, "numberWithInt:", v7);
    v8 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    fileIsHEIC = self->_fileIsHEIC;
    self->_fileIsHEIC = v8;

    if (v6)
    {

    }
  }
  return -[NSNumber BOOLValue](self->_fileIsHEIC, "BOOLValue");
}

- (id)thumbnailDataUsingOrientation:(id)a3 andSourceThumbnailData:(id)a4
{
  id v6;
  const __CFData *v7;
  const __CFData *v8;
  CGImageSource *v9;
  CGImageSource *v10;
  CGImage *ImageAtIndex;
  BOOL v12;
  uint64_t v13;
  __CFData *v14;
  __CFData *v15;
  CGImage *v16;
  __CFString *v17;
  CGImageDestination *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  __CFData *v23;

  v6 = a3;
  v7 = (const __CFData *)a4;
  v8 = v7;
  if (!v7
    || (v9 = CGImageSourceCreateWithData(v7, 0)) == 0
    || (v10 = v9, ImageAtIndex = CGImageSourceCreateImageAtIndex(v9, 0, 0), CFRelease(v10), !ImageAtIndex))
  {
    v15 = 0;
    goto LABEL_25;
  }
  v12 = -[ICCameraFile orientationOverridden](self, "orientationOverridden");
  if (v6)
  {
    if (!v12)
    {
      v13 = objc_msgSend(v6, "unsignedIntegerValue");
      if (v13 != -[ICCameraFile orientation](self, "orientation"))
      {
        -[ICCameraFile willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("orientation"));
        -[ICCameraFile setOrientation:](self, "setOrientation:", v13);
        -[ICCameraFile didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("orientation"));
      }
    }
  }
  if (objc_msgSend(v6, "unsignedIntegerValue") != 1)
  {
    v14 = (__CFData *)objc_alloc_init(MEMORY[0x1E0C99DF0]);
    v16 = ICCreateRotatedImageFromCGImage(objc_msgSend(v6, "unsignedIntegerValue"), ImageAtIndex);
    objc_msgSend((id)*MEMORY[0x1E0CEC530], "identifier");
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v18 = CGImageDestinationCreateWithData(v14, v17, 1uLL, 0);

    if (v18 && v16)
    {
      CGImageDestinationAddImage(v18, v16, 0);
      if (!CGImageDestinationFinalize(v18))
      {
        __ICOSLogCreate();
        v19 = (void *)MEMORY[0x1E0CB3940];
        -[ICCameraItem name](self, "name");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "stringWithFormat:", CFSTR("Thumb Rotate Failed: %@"), v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        v22 = _gICOSLog;
        if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR))
          +[ICPrefManager defaultAuthManager].cold.1((uint64_t)v21, v22);

      }
    }
    else if (!v16)
    {
      goto LABEL_19;
    }
    CFRelease(v16);
LABEL_19:
    if (v18)
      CFRelease(v18);
    goto LABEL_21;
  }
  v14 = 0;
LABEL_21:
  -[ICCameraFile setHasThumbnail:](self, "setHasThumbnail:", 1);
  -[ICCameraItem setThumbnailState:](self, "setThumbnailState:", 16);
  CFRelease(ImageAtIndex);
  if (v14)
    v23 = v14;
  else
    v23 = v8;
  v15 = v23;

LABEL_25:
  return v15;
}

- (CGImage)thumbnail
{
  void *ImageAtIndex;
  const __CFData *v4;
  CGImageSource *v5;

  -[ICCameraFile thumbnailData](self, "thumbnailData");
  ImageAtIndex = (void *)objc_claimAutoreleasedReturnValue();
  if (ImageAtIndex)
  {
    -[ICCameraFile thumbnailData](self, "thumbnailData");
    v4 = (const __CFData *)objc_claimAutoreleasedReturnValue();
    v5 = CGImageSourceCreateWithData(v4, 0);

    if (v5)
    {
      ImageAtIndex = CGImageSourceCreateImageAtIndex(v5, 0, 0);
      CFRelease(v5);
    }
    else
    {
      ImageAtIndex = 0;
    }
  }
  return (CGImage *)ImageAtIndex;
}

- (void)setKeywordPropertiesFromDict:(id)a3
{
  double v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;

  v38 = a3;
  -[ICCameraFile duration](self, "duration");
  if (v4 == 0.0)
  {
    objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("Duration"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("Duration"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "doubleValue");
      -[ICCameraFile setDuration:](self, "setDuration:");

    }
  }
  -[ICCameraFile burstUUID](self, "burstUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("BurstUUID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
      goto LABEL_8;
    objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("BurstUUID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICCameraFile setBurstUUID:](self, "setBurstUUID:", v7);
  }

LABEL_8:
  -[ICCameraFile originatingAssetID](self, "originatingAssetID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
LABEL_11:

    goto LABEL_12;
  }
  objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("OriginatingAssetID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("OriginatingAssetID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICCameraFile setOriginatingAssetID:](self, "setOriginatingAssetID:", v9);
    goto LABEL_11;
  }
LABEL_12:
  if (!-[ICCameraFile burstPicked](self, "burstPicked"))
  {
    objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("BurstPicked"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("BurstPicked"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICCameraFile setBurstPicked:](self, "setBurstPicked:", objc_msgSend(v12, "BOOLValue"));

    }
  }
  if (!-[ICCameraFile burstFavorite](self, "burstFavorite"))
  {
    objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("BurstFavorite"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("BurstFavorite"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICCameraFile setBurstFavorite:](self, "setBurstFavorite:", objc_msgSend(v14, "BOOLValue"));

    }
  }
  if (!-[ICCameraFile highFramerate](self, "highFramerate"))
  {
    objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("HighFramerate"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("HighFramerate"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICCameraFile setHighFramerate:](self, "setHighFramerate:", objc_msgSend(v16, "BOOLValue"));

    }
  }
  if (!-[ICCameraFile timeLapse](self, "timeLapse"))
  {
    objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("TimeLapse"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("TimeLapse"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICCameraFile setTimeLapse:](self, "setTimeLapse:", objc_msgSend(v18, "BOOLValue"));

    }
  }
  -[ICCameraFile originalFilename](self, "originalFilename");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v19)
  {
    objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("OriginalFilename"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v20)
      goto LABEL_28;
    objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("OriginalFilename"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICCameraFile setOriginalFilename:](self, "setOriginalFilename:", v19);
  }

LABEL_28:
  -[ICCameraFile createdFilename](self, "createdFilename");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
  {
LABEL_31:

    goto LABEL_32;
  }
  objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("CreatedFilename"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("CreatedFilename"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICCameraFile setCreatedFilename:](self, "setCreatedFilename:", v21);
    goto LABEL_31;
  }
LABEL_32:
  if (!-[ICCameraFile firstPicked](self, "firstPicked"))
  {
    objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("FirstPicked"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("FirstPicked"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICCameraFile setFirstPicked:](self, "setFirstPicked:", objc_msgSend(v24, "BOOLValue"));

    }
  }
  -[ICCameraFile groupUUID](self, "groupUUID");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v25)
  {
    objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("GroupUUID"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v26)
      goto LABEL_39;
    objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("GroupUUID"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICCameraFile setGroupUUID:](self, "setGroupUUID:", v25);
  }

LABEL_39:
  -[ICCameraFile relatedUUID](self, "relatedUUID");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v27)
  {
    objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("RelatedUUID"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v28)
      goto LABEL_43;
    objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("RelatedUUID"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICCameraFile setRelatedUUID:](self, "setRelatedUUID:", v27);
  }

LABEL_43:
  -[ICCameraFile spatialOverCaptureGroupID](self, "spatialOverCaptureGroupID");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v29)
  {
    objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("SpatialOverCaptureGroupID"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v30)
      goto LABEL_47;
    objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("SpatialOverCaptureGroupID"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICCameraFile setSpatialOverCaptureGroupID:](self, "setSpatialOverCaptureGroupID:", v29);
  }

LABEL_47:
  -[ICCameraFile gpsString](self, "gpsString");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v31)
  {
    objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("GPSString"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v32)
      goto LABEL_51;
    objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("GPSString"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICCameraFile setGpsString:](self, "setGpsString:", v31);
  }

LABEL_51:
  -[ICCameraFile groupUUID](self, "groupUUID");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (v33)
  {
LABEL_54:

    v36 = v38;
    goto LABEL_55;
  }
  objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("{MakerApple}"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("17"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  v36 = v38;
  if (v35)
  {
    objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("{MakerApple}"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("17"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICCameraFile setGroupUUID:](self, "setGroupUUID:", v37);

    goto LABEL_54;
  }
LABEL_55:

}

- (ICCameraFile)initWithName:(id)a3 parentFolder:(id)a4 device:(id)a5
{
  ICCameraFile *v5;
  ICCameraFile *v6;
  NSMutableArray *v7;
  NSMutableArray *sidecarFiles;
  NSMutableDictionary *v9;
  NSMutableDictionary *subImages;
  NSString *debugBadge;
  NSString *debugType;
  NSNumber *fileIsJPEG;
  NSNumber *fileIsHEIC;
  ICCameraFile *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)ICCameraFile;
  v5 = -[ICCameraItem initWithName:parentFolder:device:](&v17, sel_initWithName_parentFolder_device_, a3, a4, a5);
  v6 = v5;
  if (v5)
  {
    -[ICCameraFile setHasMetadata:](v5, "setHasMetadata:", 1);
    -[ICCameraItem setMetadataState:](v6, "setMetadataState:", 1);
    -[ICCameraItem setThumbnailState:](v6, "setThumbnailState:", 1);
    v6->_privOrientation = 1;
    -[ICCameraFile setOrientationOverridden:](v6, "setOrientationOverridden:", 0);
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    sidecarFiles = v6->_sidecarFiles;
    v6->_sidecarFiles = v7;

    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    subImages = v6->_subImages;
    v6->_subImages = v9;

    debugBadge = v6->_debugBadge;
    v6->_debugBadge = 0;

    debugType = v6->_debugType;
    v6->_debugType = 0;

    fileIsJPEG = v6->_fileIsJPEG;
    v6->_fileIsJPEG = 0;

    fileIsHEIC = v6->_fileIsHEIC;
    v6->_fileIsHEIC = 0;

    v15 = v6;
  }

  return v6;
}

- (void)flagMediaMetadata:(unint64_t)a3
{
  self->_mediaMetadata |= a3;
}

- (id)valueForUndefinedKey:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  if (objc_msgSend(v4, "isEqual:", CFSTR("children")))
  {
    -[ICCameraFile sidecarFiles](self, "sidecarFiles");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)ICCameraFile;
    -[ICCameraItem valueForUndefinedKey:](&v8, sel_valueForUndefinedKey_, v4);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;

  return v6;
}

- (BOOL)setMetadata:(id)a3
{
  id v4;
  void *v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *metadata;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  BOOL v14;

  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "count"))
  {
    -[ICCameraFile willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("metadata"));
    v6 = (NSMutableDictionary *)objc_msgSend(v5, "copy");
    metadata = self->_metadata;
    self->_metadata = v6;

    -[ICCameraFile setKeywordPropertiesFromDict:](self, "setKeywordPropertiesFromDict:", v5);
    -[ICCameraFile didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("metadata"));
    if (!-[ICCameraFile orientationOverridden](self, "orientationOverridden"))
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCFF0]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v8)
      {
        v10 = objc_msgSend(v8, "unsignedIntegerValue");
        if (v10 != -[ICCameraFile orientation](self, "orientation"))
        {
          -[ICCameraFile willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("orientation"));
          -[ICCameraFile setOrientation:](self, "setOrientation:", v10);
          -[ICCameraFile didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("orientation"));
        }
      }

    }
    -[ICCameraItem device](self, "device");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "transportType");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("ICTransportTypeMassStorage"));

    if (v13)
      -[ICCameraFile setKeywordPropertiesFromDict:](self, "setKeywordPropertiesFromDict:", v5);
  }
  v14 = -[ICCameraFile hasMetadata](self, "hasMetadata");

  return v14;
}

- (void)requestThumbnail
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  -[ICCameraItem device](self, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = CFSTR("kCGImageSourceShouldCache");
  v10[0] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __32__ICCameraFile_requestThumbnail__block_invoke;
  v7[3] = &unk_1E70C76B8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[ICCameraFile requestThumbnailDataWithOptions:completion:](self, "requestThumbnailDataWithOptions:completion:", v5, v7);

}

void __32__ICCameraFile_requestThumbnail__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  id v9;
  uint64_t v10;
  _QWORD block[4];
  id v12;
  uint64_t v13;
  id v14;

  v4 = a3;
  objc_msgSend(*(id *)(a1 + 32), "device");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    objc_msgSend(*(id *)(a1 + 32), "device");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "hasOpenSession") && *(_QWORD *)(a1 + 40))
    {
      v8 = objc_opt_respondsToSelector();

      if ((v8 & 1) != 0)
      {
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __32__ICCameraFile_requestThumbnail__block_invoke_2;
        block[3] = &unk_1E70C7630;
        v9 = *(id *)(a1 + 40);
        v10 = *(_QWORD *)(a1 + 32);
        v12 = v9;
        v13 = v10;
        v14 = v4;
        ICPerformBlockOnMainThread(block);

      }
    }
    else
    {

    }
  }

}

void __32__ICCameraFile_requestThumbnail__block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "device");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cameraDevice:didReceiveThumbnail:forItem:error:", v3, objc_msgSend(*(id *)(a1 + 40), "thumbnail"), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (BOOL)retrievedThumbnail
{
  return -[ICCameraItem thumbnailState](self, "thumbnailState") == 16;
}

- (void)requestThumbnailDataWithOptions:(NSDictionary *)options completion:(void *)completion
{
  NSDictionary *v6;
  void (**v7)(void *, id, _QWORD);
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  uint64_t v17;
  void *v18;
  int v19;
  void *v20;
  _QWORD block[4];
  id v22;
  void (**v23)(void *, id, _QWORD);
  _QWORD v24[5];
  NSDictionary *v25;
  void (**v26)(void *, id, _QWORD);

  v6 = options;
  v7 = completion;
  -[ICCameraFile thumbnailData](self, "thumbnailData");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[NSDictionary objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", CFSTR("kCGImageSourceThumbnailMaxPixelSize"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "integerValue");

    if (v11 <= 160)
    {
      -[ICCameraFile thumbnailData](self, "thumbnailData");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      v7[2](v7, v12, 0);
LABEL_16:

      goto LABEL_17;
    }
  }
  if (!-[ICCameraFile hasThumbnail](self, "hasThumbnail")
    || -[ICCameraItem thumbnailState](self, "thumbnailState") == 4)
  {
    goto LABEL_10;
  }
  -[ICCameraItem device](self, "device");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v13, "hasOpenSession") & 1) == 0)
  {

    goto LABEL_10;
  }
  -[ICCameraItem device](self, "device");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "beingEjected");

  if ((v15 & 1) != 0)
  {
LABEL_10:
    if (-[ICCameraItem thumbnailState](self, "thumbnailState") == 4)
    {
      v17 = -20149;
    }
    else
    {
      -[ICCameraItem device](self, "device");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "hasOpenSession");

      if (v19)
      {
        -[ICCameraItem setThumbnailState:](self, "setThumbnailState:", 8);
        v17 = -21000;
      }
      else
      {
        v17 = -9958;
      }
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.ImageCaptureCore"), v17, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __59__ICCameraFile_requestThumbnailDataWithOptions_completion___block_invoke_121;
    block[3] = &unk_1E70C7708;
    v22 = v20;
    v23 = v7;
    v12 = v20;
    dispatch_async(MEMORY[0x1E0C80D38], block);

    goto LABEL_16;
  }
  -[ICCameraItem device](self, "device");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __59__ICCameraFile_requestThumbnailDataWithOptions_completion___block_invoke;
  v24[3] = &unk_1E70C7680;
  v24[4] = self;
  v25 = v6;
  v26 = v7;
  objc_msgSend(v16, "dispatchAsyncForOperationType:block:", 2, v24);

LABEL_17:
}

void __59__ICCameraFile_requestThumbnailDataWithOptions_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  dispatch_semaphore_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  id v21;
  uint64_t v22;
  dispatch_time_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  NSObject *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  id v37;
  NSObject *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void (*v42)(uint64_t, void *, void *);
  void *v43;
  NSObject *v44;
  id v45;
  uint64_t v46;
  id v47;
  uint8_t buf[4];
  uint64_t v49;
  __int16 v50;
  void *v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "device");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  __ICOSLogCreate();
  if (__ICLogTypeEnabled(4))
  {
    objc_msgSend(*(id *)(a1 + 32), "name");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v4, "length") >= 0x15)
    {
      objc_msgSend(v4, "substringWithRange:", 0, 18);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stringByAppendingString:", CFSTR(".."));
      v6 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v6;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("-> req thumb"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v9 = objc_retainAutorelease(v4);
      v10 = v8;
      *(_DWORD *)buf = 136446466;
      v49 = objc_msgSend(v9, "UTF8String");
      v50 = 2114;
      v51 = v7;
      _os_log_impl(&dword_1B98FC000, v10, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

    }
  }
  if (v3
    && (objc_opt_respondsToSelector() & 1) != 0
    && (objc_msgSend(*(id *)(a1 + 32), "device"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = objc_msgSend(v3, "cameraDevice:shouldGetThumbnailOfItem:", v11, *(_QWORD *)(a1 + 32)),
        v11,
        !v12))
  {
    objc_msgSend(*(id *)(a1 + 32), "setThumbnailState:", 1);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.ImageCaptureCore"), -20098, 0);
    v21 = (id)objc_claimAutoreleasedReturnValue();
    __ICOSLogCreate();
    if (__ICLogTypeEnabled(4))
    {
      objc_msgSend(*(id *)(a1 + 32), "name");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)objc_msgSend(v32, "length") >= 0x15)
      {
        objc_msgSend(v32, "substringWithRange:", 0, 18);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "stringByAppendingString:", CFSTR(".."));
        v34 = objc_claimAutoreleasedReturnValue();

        v32 = (void *)v34;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<- recv thumb: Client Canceled Request"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = (void *)_gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        v37 = objc_retainAutorelease(v32);
        v38 = v36;
        v39 = objc_msgSend(v37, "UTF8String");
        *(_DWORD *)buf = 136446466;
        v49 = v39;
        v50 = 2114;
        v51 = v35;
        _os_log_impl(&dword_1B98FC000, v38, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

      }
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (*(_QWORD *)(a1 + 40))
      objc_msgSend(v13, "addEntriesFromDictionary:");
    v15 = dispatch_semaphore_create(0);
    objc_msgSend(*(id *)(a1 + 32), "device");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "deviceManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = *(void **)(a1 + 32);
    objc_msgSend(v18, "device");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = MEMORY[0x1E0C809B0];
    v41 = 3221225472;
    v42 = __59__ICCameraFile_requestThumbnailDataWithOptions_completion___block_invoke_104;
    v43 = &unk_1E70C76E0;
    v20 = v15;
    v44 = v20;
    v21 = v14;
    v22 = *(_QWORD *)(a1 + 32);
    v45 = v21;
    v46 = v22;
    v47 = *(id *)(a1 + 48);
    objc_msgSend(v17, "getFileThumbnail:fromDevice:withOptions:completion:", v18, v19, v21, &v40);

    v23 = dispatch_time(0, 3000000000);
    if (dispatch_semaphore_wait(v20, v23))
    {
      __ICOSLogCreate();
      objc_msgSend(*(id *)(a1 + 32), "name", v40, v41, v42, v43, v44, v45, v46);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)objc_msgSend(v24, "length") >= 0x15)
      {
        objc_msgSend(v24, "substringWithRange:", 0, 18);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "stringByAppendingString:", CFSTR(".."));
        v26 = objc_claimAutoreleasedReturnValue();

        v24 = (void *)v26;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("-- recv thumb, queue pause timeout, will continue with next operation to unblock"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = (void *)_gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        v29 = objc_retainAutorelease(v24);
        v30 = v28;
        v31 = objc_msgSend(v29, "UTF8String");
        *(_DWORD *)buf = 136446466;
        v49 = v31;
        v50 = 2114;
        v51 = v27;
        _os_log_impl(&dword_1B98FC000, v30, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

      }
    }

  }
}

void __59__ICCameraFile_requestThumbnailDataWithOptions_completion___block_invoke_104(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  uint64_t v14;
  void *v15;
  int v16;
  __CFString *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  const __CFString *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  NSObject *v31;
  void *v32;
  uint64_t v33;
  uint8_t buf[4];
  uint64_t v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCFF0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("thumb"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ICThumbnailRotated"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = v8;
  if (!v9)
  {
    objc_msgSend(v5, "thumbnailDataUsingOrientation:andSourceThumbnailData:", v7, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("kCGImageSourceShouldCache"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
    v13 = v10 == 0;
  else
    v13 = 1;
  if (v13)
  {

  }
  else
  {
    v14 = objc_msgSend(v10, "length");

    if (v14)
      objc_msgSend(v5, "cacheThumbnailData:", v10);
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("errCode"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "intValue");

  if (v16)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.ImageCaptureCore"), -21000, 0);
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v18 = 8;
  }
  else
  {
    v17 = 0;
    v18 = 16;
  }
  objc_msgSend(*(id *)(a1 + 48), "setThumbnailState:", v18);
  if (v7)
    objc_msgSend(*(id *)(a1 + 48), "setOrientation:", (int)objc_msgSend(v7, "intValue"));
  __ICOSLogCreate();
  if (__ICLogTypeEnabled(4))
  {
    objc_msgSend(*(id *)(a1 + 48), "name");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v19, "length") >= 0x15)
    {
      objc_msgSend(v19, "substringWithRange:", 0, 18);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "stringByAppendingString:", CFSTR(".."));
      v21 = objc_claimAutoreleasedReturnValue();

      v19 = (void *)v21;
    }
    v22 = CFSTR("SUCCESS");
    if (v17)
      v22 = v17;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<- recv thumb: %@"), v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v33 = a1;
      v25 = v10;
      v26 = v6;
      v27 = v7;
      v28 = v8;
      v29 = v5;
      v30 = objc_retainAutorelease(v19);
      v31 = v24;
      v32 = v30;
      v5 = v29;
      v8 = v28;
      v7 = v27;
      v6 = v26;
      v10 = v25;
      a1 = v33;
      *(_DWORD *)buf = 136446466;
      v35 = objc_msgSend(v32, "UTF8String");
      v36 = 2114;
      v37 = v23;
      _os_log_impl(&dword_1B98FC000, v31, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

uint64_t __59__ICCameraFile_requestThumbnailDataWithOptions_completion___block_invoke_121(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

- (void)requestThumbnailWithOptions:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __55__ICCameraFile_requestThumbnailWithOptions_completion___block_invoke;
  v8[3] = &unk_1E70C7730;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  -[ICCameraFile requestThumbnailDataWithOptions:completion:](self, "requestThumbnailDataWithOptions:completion:", a3, v8);

}

uint64_t __55__ICCameraFile_requestThumbnailWithOptions_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (id)metadata
{
  return self->_metadata;
}

- (void)requestMetadata
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  -[ICCameraItem device](self, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __31__ICCameraFile_requestMetadata__block_invoke;
  v6[3] = &unk_1E70C7758;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[ICCameraFile requestMetadataDictionaryWithOptions:completion:](self, "requestMetadataDictionaryWithOptions:completion:", MEMORY[0x1E0C9AA70], v6);

}

void __31__ICCameraFile_requestMetadata__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  id v6;
  _QWORD block[5];
  id v8;
  id v9;

  v4 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__ICCameraFile_requestMetadata__block_invoke_2;
  block[3] = &unk_1E70C7630;
  v5 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v8 = v5;
  v9 = v4;
  v6 = v4;
  ICPerformBlockOnMainThread(block);

}

void __31__ICCameraFile_requestMetadata__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "device");
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v6 = (id)v2;
    objc_msgSend(*(id *)(a1 + 32), "device");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v3, "hasOpenSession"))
    {
LABEL_6:

      return;
    }
    v4 = *(_QWORD *)(a1 + 40);

    if (v4 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      v5 = *(void **)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "device");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "metadata");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "cameraDevice:didReceiveMetadata:forItem:error:", v6, v3, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
      goto LABEL_6;
    }
  }
}

- (void)requestMetadataDictionaryWithOptions:(NSDictionary *)options completion:(void *)completion
{
  NSDictionary *v6;
  void (**v7)(void *, id, _QWORD);
  void *v8;
  id v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  uint64_t v14;
  void *v15;
  int v16;
  void *v17;
  _QWORD block[4];
  id v19;
  void (**v20)(void *, id, _QWORD);
  _QWORD v21[5];
  NSDictionary *v22;
  void (**v23)(void *, id, _QWORD);

  v6 = options;
  v7 = completion;
  -[ICCameraFile metadata](self, "metadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[ICCameraFile metadata](self, "metadata");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v9, 0);
LABEL_15:

    goto LABEL_16;
  }
  if (!-[ICCameraFile hasMetadata](self, "hasMetadata") || -[ICCameraItem metadataState](self, "metadataState") == 4)
    goto LABEL_9;
  -[ICCameraItem device](self, "device");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "hasOpenSession") & 1) == 0)
  {

    goto LABEL_9;
  }
  -[ICCameraItem device](self, "device");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "beingEjected");

  if ((v12 & 1) != 0)
  {
LABEL_9:
    if (-[ICCameraItem metadataState](self, "metadataState") == 4)
    {
      v14 = -20149;
    }
    else
    {
      -[ICCameraItem device](self, "device");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "hasOpenSession");

      if (v16)
      {
        -[ICCameraItem setMetadataState:](self, "setMetadataState:", 8);
        v14 = -20150;
      }
      else
      {
        v14 = -9958;
      }
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.ImageCaptureCore"), v14, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __64__ICCameraFile_requestMetadataDictionaryWithOptions_completion___block_invoke_136;
    block[3] = &unk_1E70C7708;
    v19 = v17;
    v20 = v7;
    v9 = v17;
    dispatch_async(MEMORY[0x1E0C80D38], block);

    goto LABEL_15;
  }
  -[ICCameraItem setMetadataState:](self, "setMetadataState:", 4);
  -[ICCameraItem device](self, "device");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __64__ICCameraFile_requestMetadataDictionaryWithOptions_completion___block_invoke;
  v21[3] = &unk_1E70C7680;
  v21[4] = self;
  v22 = v6;
  v23 = v7;
  objc_msgSend(v13, "dispatchAsyncForOperationType:block:", 3, v21);

LABEL_16:
}

void __64__ICCameraFile_requestMetadataDictionaryWithOptions_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  int v12;
  dispatch_semaphore_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  dispatch_time_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  NSObject *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  id v36;
  NSObject *v37;
  uint64_t v38;
  uint64_t v39;
  _QWORD v40[4];
  NSObject *v41;
  uint64_t v42;
  id v43;
  uint8_t buf[4];
  uint64_t v45;
  __int16 v46;
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "device");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  __ICOSLogCreate();
  if (__ICLogTypeEnabled(4))
  {
    objc_msgSend(*(id *)(a1 + 32), "name");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v4, "length") >= 0x15)
    {
      objc_msgSend(v4, "substringWithRange:", 0, 18);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stringByAppendingString:", CFSTR(".."));
      v6 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v6;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("-> req meta"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v9 = objc_retainAutorelease(v4);
      v10 = v8;
      *(_DWORD *)buf = 136446466;
      v45 = objc_msgSend(v9, "UTF8String");
      v46 = 2114;
      v47 = v7;
      _os_log_impl(&dword_1B98FC000, v10, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

    }
  }
  if (v3
    && (objc_opt_respondsToSelector() & 1) != 0
    && (objc_msgSend(*(id *)(a1 + 32), "device"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = objc_msgSend(v3, "cameraDevice:shouldGetMetadataOfItem:", v11, *(_QWORD *)(a1 + 32)),
        v11,
        !v12))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.ImageCaptureCore"), -20148, 0);
    v19 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setMetadataState:", 1);
    __ICOSLogCreate();
    if (__ICLogTypeEnabled(4))
    {
      objc_msgSend(*(id *)(a1 + 32), "name");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)objc_msgSend(v31, "length") >= 0x15)
      {
        objc_msgSend(v31, "substringWithRange:", 0, 18);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "stringByAppendingString:", CFSTR(".."));
        v33 = objc_claimAutoreleasedReturnValue();

        v31 = (void *)v33;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<- recv meta: Client Canceled Request"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = (void *)_gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        v36 = objc_retainAutorelease(v31);
        v37 = v35;
        v38 = objc_msgSend(v36, "UTF8String");
        *(_DWORD *)buf = 136446466;
        v45 = v38;
        v46 = 2114;
        v47 = v34;
        _os_log_impl(&dword_1B98FC000, v37, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

      }
    }
    v39 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "metadata");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, NSObject *))(v39 + 16))(v39, v30, v19);
  }
  else
  {
    v13 = dispatch_semaphore_create(0);
    objc_msgSend(*(id *)(a1 + 32), "device");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "deviceManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = *(void **)(a1 + 32);
    objc_msgSend(v16, "device");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = *(_QWORD *)(a1 + 40);
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __64__ICCameraFile_requestMetadataDictionaryWithOptions_completion___block_invoke_129;
    v40[3] = &unk_1E70C7780;
    v19 = v13;
    v20 = *(_QWORD *)(a1 + 32);
    v41 = v19;
    v42 = v20;
    v43 = *(id *)(a1 + 48);
    objc_msgSend(v15, "getFileMetadata:fromDevice:withOptions:completion:", v16, v17, v18, v40);

    v21 = dispatch_time(0, 3000000000);
    if (dispatch_semaphore_wait(v19, v21))
    {
      __ICOSLogCreate();
      objc_msgSend(*(id *)(a1 + 32), "name");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)objc_msgSend(v22, "length") >= 0x15)
      {
        objc_msgSend(v22, "substringWithRange:", 0, 18);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "stringByAppendingString:", CFSTR(".."));
        v24 = objc_claimAutoreleasedReturnValue();

        v22 = (void *)v24;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("-- recv meta, queue pause timeout, will continue with next operation to unblock"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = (void *)_gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        v27 = objc_retainAutorelease(v22);
        v28 = v26;
        v29 = objc_msgSend(v27, "UTF8String");
        *(_DWORD *)buf = 136446466;
        v45 = v29;
        v46 = 2114;
        v47 = v25;
        _os_log_impl(&dword_1B98FC000, v28, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

      }
    }

    v30 = v41;
  }

}

void __64__ICCameraFile_requestMetadataDictionaryWithOptions_completion___block_invoke_129(uint64_t a1, uint64_t a2, void *a3)
{
  NSObject *v4;
  id v5;
  void *v6;
  void *v7;
  __CFString *v8;
  id *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = *(NSObject **)(a1 + 32);
  v5 = a3;
  dispatch_semaphore_signal(v4);
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("metadata"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("errCode"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v5) = objc_msgSend(v7, "intValue");
  if ((_DWORD)v5)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.ImageCaptureCore"), -20150, 0);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v9 = (id *)(a1 + 40);
  }
  else
  {
    v9 = (id *)(a1 + 40);
    if ((objc_msgSend(*(id *)(a1 + 40), "setMetadata:", v6) & 1) != 0)
    {
      v8 = 0;
      v10 = 16;
      goto LABEL_7;
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.ImageCaptureCore"), -20147, 0);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v10 = 8;
LABEL_7:
  objc_msgSend(*v9, "setMetadataState:", v10);
  __ICOSLogCreate();
  if (__ICLogTypeEnabled(4))
  {
    objc_msgSend(*(id *)(a1 + 40), "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v11, "length") >= 0x15)
    {
      objc_msgSend(v11, "substringWithRange:", 0, 18);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringByAppendingString:", CFSTR(".."));
      v13 = objc_claimAutoreleasedReturnValue();

      v11 = (void *)v13;
    }
    v14 = CFSTR("SUCCESS");
    if (v8)
      v14 = v8;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<- recv meta: %@"), v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v17 = objc_retainAutorelease(v11);
      v18 = v16;
      *(_DWORD *)buf = 136446466;
      v22 = objc_msgSend(v17, "UTF8String");
      v23 = 2114;
      v24 = v15;
      _os_log_impl(&dword_1B98FC000, v18, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

    }
  }
  v19 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "metadata");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, __CFString *))(v19 + 16))(v19, v20, v8);

}

uint64_t __64__ICCameraFile_requestMetadataDictionaryWithOptions_completion___block_invoke_136(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

- (void)requestMetadataWithOptions:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __54__ICCameraFile_requestMetadataWithOptions_completion___block_invoke;
  v8[3] = &unk_1E70C77A8;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  -[ICCameraFile requestMetadataDictionaryWithOptions:completion:](self, "requestMetadataDictionaryWithOptions:completion:", a3, v8);

}

uint64_t __54__ICCameraFile_requestMetadataWithOptions_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (NSProgress)requestDownloadWithOptions:(NSDictionary *)options completion:(void *)completion
{
  NSDictionary *v6;
  void (**v7)(void *, _QWORD, void *);
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v23;
  id v24;
  void *v25;
  _QWORD v26[5];
  id v27;
  id v28;
  NSDictionary *v29;
  void (**v30)(void *, _QWORD, void *);

  v6 = options;
  v7 = completion;
  -[NSDictionary objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", CFSTR("ICSidecarDownload"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCameraItem device](self, "device");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hasOpenSession");

  if ((v10 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.ImageCaptureCore"), -9958, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, v15);

LABEL_9:
    v21 = 0;
    goto LABEL_10;
  }
  -[ICCameraItem device](self, "device");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v11, "hasOpenSession") & 1) == 0)
  {

    goto LABEL_8;
  }
  -[ICCameraItem device](self, "device");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "beingEjected");

  if ((v13 & 1) != 0)
  {
LABEL_8:
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICCameraItem device](self, "device");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addTruth:code:", objc_msgSend(v18, "hasOpenSession") ^ 1, -9958);

    -[ICCameraItem device](self, "device");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addTruth:code:", objc_msgSend(v19, "beingEjected"), -21346);

    objc_msgSend(v16, "setObject:forKeyedSubscript:", v17, CFSTR("errors"));
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.ImageCaptureCore"), -30000, v16);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, v20);

    goto LABEL_9;
  }
  if (v8)
  {
    v14 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", -[ICCameraFile fileSize](self, "fileSize"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setCancellable:", 1);
    objc_msgSend(v14, "setPausable:", 0);
  }
  -[ICCameraItem device](self, "device");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __54__ICCameraFile_requestDownloadWithOptions_completion___block_invoke;
  v26[3] = &unk_1E70C7868;
  v26[4] = self;
  v27 = v8;
  v24 = v14;
  v28 = v24;
  v29 = v6;
  v30 = v7;
  objc_msgSend(v23, "dispatchAsyncForOperationType:block:", 4, v26);

  v25 = v30;
  v21 = v24;

LABEL_10:
  return (NSProgress *)v21;
}

void __54__ICCameraFile_requestDownloadWithOptions_completion___block_invoke(id *a1)
{
  dispatch_semaphore_t v2;
  id v3;
  dispatch_time_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  id v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  NSObject *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  NSObject *v42;
  uint64_t v43;
  dispatch_semaphore_t v44;
  uint64_t v45;
  id v46;
  id v47;
  NSObject *v48;
  void *v49;
  __CFString *v50;
  double v51;
  unint64_t v52;
  uint32_t numer;
  uint32_t denom;
  uint64_t v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  NSObject *v60;
  uint64_t v61;
  void *v62;
  NSObject *v63;
  id v64;
  id v65;
  void *v66;
  void *v67;
  __CFString *v68;
  NSObject *v69;
  uint64_t v70;
  void *v71;
  void *v72;
  void *v73;
  __CFString *v74;
  uint64_t v75;
  void *v76;
  id v77;
  BOOL v78;
  _BOOL4 v79;
  uint64_t v80;
  void *v81;
  void *v82;
  uint64_t v83;
  void *v84;
  void *v85;
  id v86;
  NSObject *v87;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  void *v91;
  __CFString *v92;
  NSObject *v93;
  uint64_t v94;
  void *v95;
  uint64_t v96;
  void *v97;
  id v98;
  dispatch_semaphore_t dsema;
  uint64_t v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  _QWORD block[4];
  id v106;
  id v107;
  id v108;
  id v109;
  id v110;
  id v111;
  id v112;
  id v113;
  uint64_t *v114;
  uint64_t v115;
  double v116;
  int v117;
  _QWORD v118[5];
  id v119;
  id v120;
  NSObject *v121;
  uint64_t *v122;
  uint64_t *v123;
  _QWORD *v124;
  _BYTE *v125;
  uint64_t *v126;
  uint64_t v127;
  int v128;
  mach_timebase_info info;
  uint64_t v130;
  uint64_t *v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t *v135;
  uint64_t v136;
  char v137;
  _QWORD v138[4];
  uint64_t v139;
  uint64_t *v140;
  uint64_t v141;
  uint64_t v142;
  _QWORD v143[4];
  dispatch_semaphore_t v144;
  _BYTE v145[12];
  __int16 v146;
  void *v147;
  _BYTE buf[24];
  uint64_t v149;
  uint64_t v150;

  v150 = *MEMORY[0x1E0C80C00];
  v2 = dispatch_semaphore_create(0);
  v3 = a1[4];
  v143[0] = MEMORY[0x1E0C809B0];
  v143[1] = 3221225472;
  v143[2] = __54__ICCameraFile_requestDownloadWithOptions_completion___block_invoke_2;
  v143[3] = &unk_1E70C7150;
  dsema = v2;
  v144 = dsema;
  objc_msgSend(v3, "requestRefreshObjectHandleInfo:", v143);
  v4 = dispatch_time(0, 3000000000);
  dispatch_semaphore_wait(dsema, v4);
  if (!a1[5])
  {
    v5 = a1[6];
    objc_msgSend(a1[4], "device");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setDownloadProgress:", v5);

    objc_msgSend(a1[4], "device");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "downloadProgress");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTotalUnitCount:", objc_msgSend(a1[4], "fileSize"));

  }
  objc_msgSend(a1[7], "objectForKeyedSubscript:", CFSTR("ICDownloadsDirectoryURL"));
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[7], "objectForKeyedSubscript:", CFSTR("ICSaveAsFilename"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v11 = v9;
  }
  else
  {
    objc_msgSend(a1[4], "name");
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12 = v11;

  objc_msgSend(a1[7], "objectForKeyedSubscript:", CFSTR("ICAppendedDuplicateNumber"));
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringByDeletingPathExtension");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "pathExtension");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  v98 = v12;
  v100 = objc_msgSend(a1[4], "fileSize");
  if (v104)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %d.%@"), v102, objc_msgSend(v104, "intValue"), v101);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    __ICOSLogCreate();
    objc_msgSend(a1[4], "name");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v14, "length") >= 0x15)
    {
      objc_msgSend(v14, "substringWithRange:", 0, 18);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "stringByAppendingString:", CFSTR(".."));
      v16 = objc_claimAutoreleasedReturnValue();

      v14 = (void *)v16;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Main asset filename is already on disk, appending %d"), objc_msgSend(v104, "intValue"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v19 = objc_retainAutorelease(v14);
      v20 = v18;
      v21 = objc_msgSend(v19, "UTF8String");
      *(_DWORD *)buf = 136446466;
      *(_QWORD *)&buf[4] = v21;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v17;
      _os_log_impl(&dword_1B98FC000, v20, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

    }
    goto LABEL_14;
  }
  if (a1[5])
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v102, v101);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v98;
LABEL_14:

    objc_msgSend(v103, "path");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "stringByAppendingPathComponent:", v13);
    v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v24 = open((const char *)objc_msgSend(v23, "UTF8String"), 2562, 33152);

    goto LABEL_15;
  }
  v104 = 0;
  v75 = 1;
  v13 = v98;
  while (1)
  {
    objc_msgSend(v103, "path");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "stringByAppendingPathComponent:", v13);
    v77 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v24 = open((const char *)objc_msgSend(v77, "UTF8String"), 2562, 33152);
    v78 = v24 != -1 || v75 >= 0x14;
    v79 = !v78;

    if (!v79)
      break;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %d.%@"), v102, v75, v101);
    v80 = objc_claimAutoreleasedReturnValue();

    __ICOSLogCreate();
    objc_msgSend(a1[4], "name");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v81, "length") >= 0x15)
    {
      objc_msgSend(v81, "substringWithRange:", 0, 18);
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "stringByAppendingString:", CFSTR(".."));
      v83 = objc_claimAutoreleasedReturnValue();

      v81 = (void *)v83;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Filename is already on disk, trying %@"), v80);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    v85 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v86 = objc_retainAutorelease(v81);
      v87 = v85;
      v88 = objc_msgSend(v86, "UTF8String");
      *(_DWORD *)buf = 136446466;
      *(_QWORD *)&buf[4] = v88;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v84;
      _os_log_impl(&dword_1B98FC000, v87, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v75);
    v89 = objc_claimAutoreleasedReturnValue();

    v75 = (v75 + 1);
    v13 = (void *)v80;
    v104 = (void *)v89;
  }
LABEL_15:
  objc_msgSend(v103, "path");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "stringByAppendingPathComponent:", v13);
  v97 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13 || !v100)
  {
    __ICOSLogCreate();
    if ((unint64_t)objc_msgSend(CFSTR("download fail"), "length") < 0x15)
    {
      v50 = CFSTR("download fail");
    }
    else
    {
      objc_msgSend(CFSTR("download fail"), "substringWithRange:", 0, 18);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "stringByAppendingString:", CFSTR(".."));
      v50 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("filename: %@, fileSize: %llu"), v13, v100);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v68 = objc_retainAutorelease(v50);
      v69 = v67;
      v70 = -[__CFString UTF8String](v68, "UTF8String");
      *(_DWORD *)buf = 136446466;
      *(_QWORD *)&buf[4] = v70;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v66;
      _os_log_impl(&dword_1B98FC000, v69, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.ImageCaptureCore"), -9934, 0);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(void))a1[8] + 2))();
    if (!a1[5])
    {
      objc_msgSend(a1[4], "device");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "setDownloadProgress:", 0);

    }
    goto LABEL_72;
  }
  v96 = objc_msgSend(objc_retainAutorelease(v97), "fileSystemRepresentation");
  __ICOSLogCreate();
  if (v24 == -1)
  {
    if ((unint64_t)objc_msgSend(CFSTR("download fail"), "length") < 0x15)
    {
      v74 = CFSTR("download fail");
    }
    else
    {
      objc_msgSend(CFSTR("download fail"), "substringWithRange:", 0, 18);
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "stringByAppendingString:", CFSTR(".."));
      v74 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("filename: %@, fileSize: %llu"), v13, v100);
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    v91 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v92 = objc_retainAutorelease(v74);
      v93 = v91;
      v94 = -[__CFString UTF8String](v92, "UTF8String");
      *(_DWORD *)buf = 136446466;
      *(_QWORD *)&buf[4] = v94;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v90;
      _os_log_impl(&dword_1B98FC000, v93, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.ImageCaptureCore"), -9934, 0);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(void))a1[8] + 2))();
    if (!a1[5])
    {
      objc_msgSend(a1[4], "device");
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v95, "setDownloadProgress:", 0);

    }
LABEL_72:

    goto LABEL_73;
  }
  objc_msgSend(a1[4], "name");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v26, "length") >= 0x15)
  {
    objc_msgSend(v26, "substringWithRange:", 0, 18);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "stringByAppendingString:", CFSTR(".."));
    v28 = objc_claimAutoreleasedReturnValue();

    v26 = (void *)v28;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Downloading to: %s"), v96);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v31 = objc_retainAutorelease(v26);
    v32 = v30;
    v33 = objc_msgSend(v31, "UTF8String");
    *(_DWORD *)buf = 136446466;
    *(_QWORD *)&buf[4] = v33;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v29;
    _os_log_impl(&dword_1B98FC000, v32, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v149 = v100;
  v139 = 0;
  v140 = &v139;
  v141 = 0x2020000000;
  v142 = 0;
  v138[0] = 0;
  v138[1] = v138;
  v138[2] = 0x2020000000;
  v138[3] = 0;
  objc_msgSend(a1[4], "device");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v34, "isAppleDevice"))
    v35 = 50331648;
  else
    v35 = 0x400000;

  v134 = 0;
  v135 = &v134;
  v136 = 0x2020000000;
  v137 = 0;
  v130 = 0;
  v131 = &v130;
  v132 = 0x2020000000;
  v133 = 0;
  objc_msgSend(a1[4], "requestOpenStreamData");
  info = 0;
  mach_timebase_info(&info);
  _gBenchmarkStartMachTime = 0;
  *(float *)&_gBenchmarkStartMachTime = (float)mach_absolute_time();
  while (*(uint64_t *)(*(_QWORD *)&buf[8] + 24) >= 1
       && !*((_BYTE *)v135 + 24)
       && (objc_msgSend(a1[6], "isCancelled") & 1) == 0)
  {
    v36 = (void *)MEMORY[0x1BCCC7334]();
    if (v35 >= *(_QWORD *)(*(_QWORD *)&buf[8] + 24))
      v37 = *(_QWORD *)(*(_QWORD *)&buf[8] + 24);
    else
      v37 = v35;
    __ICOSLogCreate();
    objc_msgSend(a1[4], "name");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v38, "length") >= 0x15)
    {
      objc_msgSend(v38, "substringWithRange:", 0, 18);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "stringByAppendingString:", CFSTR(".."));
      v40 = objc_claimAutoreleasedReturnValue();

      v38 = (void *)v40;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Requesting: %llu at offset: %llu"), v37, v140[3]);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = (id)_gICOSLog;
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      v43 = objc_msgSend(objc_retainAutorelease(v38), "UTF8String");
      *(_DWORD *)v145 = 136446466;
      *(_QWORD *)&v145[4] = v43;
      v146 = 2114;
      v147 = v41;
      _os_log_impl(&dword_1B98FC000, v42, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", v145, 0x16u);
    }

    v44 = dispatch_semaphore_create(0);
    *(_QWORD *)v145 = 0;
    mach_timebase_info((mach_timebase_info_t)v145);
    _gBenchmarkStartMachTime = 0;
    *(float *)&_gBenchmarkStartMachTime = (float)mach_absolute_time();
    v45 = v140[3];
    v118[0] = MEMORY[0x1E0C809B0];
    v118[1] = 3221225472;
    v118[2] = __54__ICCameraFile_requestDownloadWithOptions_completion___block_invoke_159;
    v118[3] = &unk_1E70C77F8;
    v47 = a1[4];
    v46 = a1[5];
    v122 = &v130;
    v118[4] = v47;
    v128 = v24;
    v123 = &v134;
    v124 = v138;
    v119 = v46;
    v120 = a1[6];
    v125 = buf;
    v126 = &v139;
    v127 = v100;
    v48 = v44;
    v121 = v48;
    objc_msgSend(v47, "requestStreamDataAtOffset:length:completion:", v45, v37, v118);
    dispatch_semaphore_wait(v48, 0xFFFFFFFFFFFFFFFFLL);

    objc_autoreleasePoolPop(v36);
  }
  v51 = 0.0;
  if (!a1[5])
  {
    v52 = v131[3];
    numer = info.numer;
    denom = info.denom;
    v55 = *(_QWORD *)(*(_QWORD *)&buf[8] + 24);
    __ICOSLogCreate();
    objc_msgSend(a1[4], "name");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v56, "length") >= 0x15)
    {
      objc_msgSend(v56, "substringWithRange:", 0, 18);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "stringByAppendingString:", CFSTR(".."));
      v58 = objc_claimAutoreleasedReturnValue();

      v56 = (void *)v58;
    }
    v51 = (float)-(float)((float)v55
                        - (float)((float)(1000.0
                                        / (float)((float)((float)((float)v52 * (float)numer) / (float)denom) / 1000000.0))
                                * (float)v100))
        * 0.000000953674316;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("icDatarate: %07.2f"), *(_QWORD *)&v51);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = (id)_gICOSLog;
    if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
    {
      v61 = objc_msgSend(objc_retainAutorelease(v56), "UTF8String");
      *(_DWORD *)v145 = 136446466;
      *(_QWORD *)&v145[4] = v61;
      v146 = 2114;
      v147 = v59;
      _os_log_impl(&dword_1B98FC000, v60, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", v145, 0x16u);
    }

  }
  objc_msgSend(a1[4], "requestCloseStreamData");
  objc_msgSend(a1[4], "device");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "deviceWriteQueue");
  v63 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__ICCameraFile_requestDownloadWithOptions_completion___block_invoke_182;
  block[3] = &unk_1E70C7840;
  v114 = &v134;
  v115 = v96;
  v106 = a1[6];
  v64 = a1[5];
  v65 = a1[4];
  v107 = v64;
  v108 = v65;
  v116 = v51;
  v109 = a1[7];
  v117 = v24;
  v110 = v104;
  v111 = v103;
  v113 = a1[8];
  v112 = v13;
  dispatch_async(v63, block);

  _Block_object_dispose(&v130, 8);
  _Block_object_dispose(&v134, 8);
  _Block_object_dispose(v138, 8);
  _Block_object_dispose(&v139, 8);
  _Block_object_dispose(buf, 8);
LABEL_73:

}

intptr_t __54__ICCameraFile_requestDownloadWithOptions_completion___block_invoke_2(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __54__ICCameraFile_requestDownloadWithOptions_completion___block_invoke_159(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t block;
  uint64_t v29;
  void (*v30)(uint64_t);
  void *v31;
  id v32;
  id v33;
  uint64_t v34;
  id v35;
  id v36;
  __int128 v37;
  int v38;
  uint8_t buf[4];
  uint64_t v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = (unint64_t)(float)((float)((float)mach_absolute_time()
                                                                                                - *(float *)&_gBenchmarkStartMachTime)
                                                                                        + (float)*(unint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24));
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("ICReadData"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4 && objc_msgSend(v4, "length"))
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("ICBytesRead"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "unsignedLongLongValue");

    __ICOSLogCreate();
    objc_msgSend(*(id *)(a1 + 32), "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v8, "length") >= 0x15)
    {
      objc_msgSend(v8, "substringWithRange:", 0, 18);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringByAppendingString:", CFSTR(".."));
      v10 = objc_claimAutoreleasedReturnValue();

      v8 = (void *)v10;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Received: %llu bytes"), v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v13 = objc_retainAutorelease(v8);
      v14 = v12;
      *(_DWORD *)buf = 136446466;
      v40 = objc_msgSend(v13, "UTF8String");
      v41 = 2114;
      v42 = v11;
      _os_log_impl(&dword_1B98FC000, v14, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 32), "device");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "deviceWriteQueue");
    v16 = objc_claimAutoreleasedReturnValue();
    block = MEMORY[0x1E0C809B0];
    v29 = 3221225472;
    v30 = __54__ICCameraFile_requestDownloadWithOptions_completion___block_invoke_166;
    v31 = &unk_1E70C77D0;
    v32 = v3;
    v38 = *(_DWORD *)(a1 + 112);
    v17 = v5;
    v18 = *(_QWORD *)(a1 + 32);
    v19 = *(void **)(a1 + 40);
    v33 = v17;
    v34 = v18;
    v37 = *(_OWORD *)(a1 + 72);
    v35 = v19;
    v36 = *(id *)(a1 + 48);
    dispatch_async(v16, &block);

    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) -= v7;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24) = *(_QWORD *)(a1 + 104)
                                                                - *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8)
                                                                            + 24);
    __ICOSLogCreate();
    if (__ICLogTypeEnabled(4))
    {
      objc_msgSend(*(id *)(a1 + 32), "name");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)objc_msgSend(v20, "length") >= 0x15)
      {
        objc_msgSend(v20, "substringWithRange:", 0, 18);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "stringByAppendingString:", CFSTR(".."));
        v22 = objc_claimAutoreleasedReturnValue();

        v20 = (void *)v22;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("+ Request @ Offset: %lld, Remaining: %lld"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24), block, v29, v30, v31, v32, v33, v34, v35);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (void *)_gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        v25 = objc_retainAutorelease(v20);
        v26 = v24;
        v27 = objc_msgSend(v25, "UTF8String");
        *(_DWORD *)buf = 136446466;
        v40 = v27;
        v41 = 2114;
        v42 = v23;
        _os_log_impl(&dword_1B98FC000, v26, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

      }
    }

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));

}

void __54__ICCameraFile_requestDownloadWithOptions_completion___block_invoke_166(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  size_t v5;
  ssize_t v6;
  ssize_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  id v24;
  _QWORD block[4];
  id v26;
  id v27;
  uint64_t v28;
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("ICBufferOffset"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedLongLongValue");

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("ICBytesRead"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "unsignedLongLongValue");

  v6 = write(*(_DWORD *)(a1 + 88), (const void *)(objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "bytes") + v3), v5);
  if (v6 != -1 && v6 == v5)
  {
    __ICOSLogCreate();
    if (__ICLogTypeEnabled(4))
    {
      objc_msgSend(*(id *)(a1 + 48), "name");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)objc_msgSend(v16, "length") >= 0x15)
      {
        objc_msgSend(v16, "substringWithRange:", 0, 18);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "stringByAppendingString:", CFSTR(".."));
        v18 = objc_claimAutoreleasedReturnValue();

        v16 = (void *)v18;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("+ Wrote: %lld @ Offset: %lld"), v5, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)_gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        v21 = objc_retainAutorelease(v16);
        v22 = v20;
        *(_DWORD *)buf = 136446466;
        v30 = objc_msgSend(v21, "UTF8String");
        v31 = 2114;
        v32 = v19;
        _os_log_impl(&dword_1B98FC000, v22, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

      }
    }
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) += v5;
  }
  else
  {
    v8 = v6;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1;
    __ICOSLogCreate();
    objc_msgSend(*(id *)(a1 + 48), "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v9, "length") >= 0x15)
    {
      objc_msgSend(v9, "substringWithRange:", 0, 18);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringByAppendingString:", CFSTR(".."));
      v11 = objc_claimAutoreleasedReturnValue();

      v9 = (void *)v11;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Downloading Failed - Appended: %llu BufferLength: %llu"), v8, v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v14 = objc_retainAutorelease(v9);
      v15 = v13;
      *(_DWORD *)buf = 136446466;
      v30 = objc_msgSend(v14, "UTF8String");
      v31 = 2114;
      v32 = v12;
      _os_log_impl(&dword_1B98FC000, v15, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

    }
  }
  if (!*(_QWORD *)(a1 + 56))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __54__ICCameraFile_requestDownloadWithOptions_completion___block_invoke_173;
    block[3] = &unk_1E70C7630;
    v26 = *(id *)(a1 + 64);
    v27 = v23;
    v28 = *(_QWORD *)(a1 + 48);
    v24 = v23;
    ICPerformBlockOnMainThread(block);

  }
}

void __54__ICCameraFile_requestDownloadWithOptions_completion___block_invoke_173(id *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1[4], "setCompletedUnitCount:", objc_msgSend(a1[5], "unsignedLongLongValue"));
  __ICOSLogCreate();
  objc_msgSend(a1[6], "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v2, "length") >= 0x15)
  {
    objc_msgSend(v2, "substringWithRange:", 0, 18);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringByAppendingString:", CFSTR(".."));
    v4 = objc_claimAutoreleasedReturnValue();

    v2 = (void *)v4;
  }
  v5 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a1[4], "fractionCompleted");
  objc_msgSend(v5, "stringWithFormat:", CFSTR("Progress: %f"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v9 = objc_retainAutorelease(v2);
    v10 = v8;
    *(_DWORD *)buf = 136446466;
    v14 = objc_msgSend(v9, "UTF8String");
    v15 = 2114;
    v16 = v7;
    _os_log_impl(&dword_1B98FC000, v10, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

  }
  objc_msgSend(a1[6], "device");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v12, sel_didReceiveDownloadProgressForFile_downloadedBytes_maxBytes_, a1[6], objc_msgSend(a1[5], "unsignedLongLongValue"), objc_msgSend(a1[6], "fileSize"));

}

void __54__ICCameraFile_requestDownloadWithOptions_completion___block_invoke_182(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  int v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  NSObject *v12;
  uint64_t v13;
  off_t st_size;
  unint64_t v16;
  off_t v17;
  void *v18;
  __CFString *v19;
  void *v20;
  __CFString *v21;
  void *v22;
  void *v23;
  __CFString *v24;
  NSObject *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  __CFString *v29;
  NSObject *v30;
  uint64_t v31;
  void *v32;
  double v33;
  uint64_t v34;
  void *v35;
  double v36;
  uint64_t v37;
  void *v38;
  int v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  _QWORD block[5];
  id v46;
  id v47;
  uint64_t v48;
  int __buf;
  uint64_t v50;
  __int16 v51;
  void *v52;
  stat buf;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24))
  {
    unlink(*(const char **)(a1 + 104));
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.ImageCaptureCore"), -9934, 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "isCancelled"))
  {
    unlink(*(const char **)(a1 + 104));
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.ImageCaptureCore"), -9937, 0);
    v3 = objc_claimAutoreleasedReturnValue();

    v2 = (void *)v3;
  }
  else
  {
    if (!*(_QWORD *)(a1 + 40))
      objc_msgSend(*(id *)(a1 + 48), "setLastImportSpeed:", *(double *)(a1 + 112));
    objc_msgSend(*(id *)(a1 + 56), "objectForKeyedSubscript:", CFSTR("ICTruncateAfterSuccessfulDownload"));
    v4 = objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = (void *)v4;
      v6 = objc_msgSend(*(id *)(a1 + 48), "isConverted");

      if (v6)
      {
        __ICOSLogCreate();
        v7 = CFSTR("truncating...");
        if ((unint64_t)objc_msgSend(CFSTR("truncating..."), "length") >= 0x15)
        {
          objc_msgSend(CFSTR("truncating..."), "substringWithRange:", 0, 18);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "stringByAppendingString:", CFSTR(".."));
          v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

        }
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Reported File Size: %lld"), objc_msgSend(*(id *)(a1 + 48), "fileSize"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = (void *)_gICOSLog;
        if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
        {
          v11 = objc_retainAutorelease(v7);
          v12 = v10;
          buf.st_dev = 136446466;
          *(_QWORD *)&buf.st_mode = -[__CFString UTF8String](v11, "UTF8String");
          WORD2(buf.st_ino) = 2114;
          *(__darwin_ino64_t *)((char *)&buf.st_ino + 6) = (__darwin_ino64_t)v9;
          _os_log_impl(&dword_1B98FC000, v12, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&buf, 0x16u);

        }
        memset(&buf, 0, sizeof(buf));
        if (!lstat(*(const char **)(a1 + 104), &buf))
        {
          v13 = 0;
          st_size = buf.st_size;
          do
            LOBYTE(__buf) = 0;
          while (pread(*(_DWORD *)(a1 + 120), &__buf, 1uLL, --v13 + st_size) == 1 && __buf == 0);
          __ICOSLogCreate();
          v16 = objc_msgSend(CFSTR("truncating..."), "length");
          if (v13 == -1)
          {
            if (v16 < 0x15)
            {
              v21 = CFSTR("truncating...");
            }
            else
            {
              objc_msgSend(CFSTR("truncating..."), "substringWithRange:", 0, 18);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "stringByAppendingString:", CFSTR(".."));
              v21 = (__CFString *)objc_claimAutoreleasedReturnValue();

            }
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("File did not have padding."));
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = (void *)_gICOSLog;
            if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
            {
              v29 = objc_retainAutorelease(v21);
              v30 = v28;
              v31 = -[__CFString UTF8String](v29, "UTF8String");
              __buf = 136446466;
              v50 = v31;
              v51 = 2114;
              v52 = v27;
              _os_log_impl(&dword_1B98FC000, v30, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&__buf, 0x16u);

            }
          }
          else
          {
            v17 = st_size + v13 + 1;
            if (v16 < 0x15)
            {
              v19 = CFSTR("truncating...");
            }
            else
            {
              objc_msgSend(CFSTR("truncating..."), "substringWithRange:", 0, 18);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "stringByAppendingString:", CFSTR(".."));
              v19 = (__CFString *)objc_claimAutoreleasedReturnValue();

            }
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Truncated File Size: %zu"), v17);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = (void *)_gICOSLog;
            if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
            {
              v24 = objc_retainAutorelease(v19);
              v25 = v23;
              v26 = -[__CFString UTF8String](v24, "UTF8String");
              __buf = 136446466;
              v50 = v26;
              v51 = 2114;
              v52 = v22;
              _os_log_impl(&dword_1B98FC000, v25, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&__buf, 0x16u);

            }
            ftruncate(*(_DWORD *)(a1 + 120), v17);
          }
        }
      }
    }
    objc_msgSend(*(id *)(a1 + 48), "creationDate");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "timeIntervalSince1970");
    v34 = (uint64_t)v33;

    objc_msgSend(*(id *)(a1 + 48), "modificationDate");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "timeIntervalSince1970");
    v37 = (uint64_t)v36;

    *(_QWORD *)&buf.st_uid = v34;
    *(_QWORD *)&buf.st_rdev = 0;
    *(_QWORD *)&buf.st_dev = v37;
    buf.st_ino = 0;
    futimes(*(_DWORD *)(a1 + 120), (const timeval *)&buf);
  }
  close(*(_DWORD *)(a1 + 120));
  if (!v2)
  {
    objc_msgSend(*(id *)(a1 + 56), "objectForKeyedSubscript:", CFSTR("ICDownloadSidecarFiles"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v38, "BOOLValue");

    if (v39)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __54__ICCameraFile_requestDownloadWithOptions_completion___block_invoke_193;
      block[3] = &unk_1E70C7630;
      block[4] = *(_QWORD *)(a1 + 48);
      v46 = *(id *)(a1 + 64);
      v47 = *(id *)(a1 + 72);
      ICPerformBlockOnMainThread(block);

    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 88) + 16))();
  if (*(_QWORD *)(a1 + 40))
  {
    if (v2)
      goto LABEL_45;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "device");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setDownloadProgress:", 0);

    if (v2)
      goto LABEL_45;
  }
  objc_msgSend(*(id *)(a1 + 56), "objectForKeyedSubscript:", CFSTR("ICDeleteAfterSuccessfulDownload"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = v41;
  if (v41 && objc_msgSend(v41, "BOOLValue"))
  {
    objc_msgSend(*(id *)(a1 + 48), "device");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v48, 1);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "requestDeleteFiles:", v44);

  }
LABEL_45:

}

void __54__ICCameraFile_requestDownloadWithOptions_completion___block_invoke_193(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id obj;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "sidecarFiles");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v2)
  {
    v3 = v2;
    v4 = MEMORY[0x1E0C9AAB0];
    v5 = *(_QWORD *)v14;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v14 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v6);
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v8;
        v10 = *(_QWORD *)(a1 + 40);
        if (v10)
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, CFSTR("ICAppendedDuplicateNumber"));
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v4, CFSTR("ICSidecarDownload"));
        objc_msgSend(v9, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 48), CFSTR("ICDownloadsDirectoryURL"));
        v11 = (id)objc_msgSend(v7, "requestDownloadWithOptions:completion:", v9, &__block_literal_global_4);

        ++v6;
      }
      while (v3 != v6);
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v3);
  }

}

void __54__ICCameraFile_requestDownloadWithOptions_completion___block_invoke_2_194(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  __ICOSLogCreate();
  if (__ICLogTypeEnabled(4))
  {
    v3 = v2;
    if ((unint64_t)objc_msgSend(v3, "length") >= 0x15)
    {
      objc_msgSend(v3, "substringWithRange:", 0, 18);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "stringByAppendingString:", CFSTR(".."));
      v5 = objc_claimAutoreleasedReturnValue();

      v3 = (id)v5;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("++ (sidecar)"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v8 = objc_retainAutorelease(v3);
      v9 = v7;
      v10 = 136446466;
      v11 = objc_msgSend(v8, "UTF8String");
      v12 = 2114;
      v13 = v6;
      _os_log_impl(&dword_1B98FC000, v9, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&v10, 0x16u);

    }
  }

}

- (void)requestReadDataAtOffset:(off_t)offset length:(off_t)length completion:(void *)completion
{
  void (**v8)(void *, _QWORD, id);
  void *v9;
  char v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[5];
  id v23;
  void (**v24)(void *, _QWORD, id);
  off_t v25;
  off_t v26;

  v8 = completion;
  -[ICCameraItem device](self, "device");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hasOpenSession");

  if ((v10 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.ImageCaptureCore"), -9958, 0);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    v8[2](v8, 0, v16);
    goto LABEL_6;
  }
  -[ICCameraItem device](self, "device");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v11, "hasOpenSession") & 1) == 0)
  {

    goto LABEL_8;
  }
  -[ICCameraItem device](self, "device");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "beingEjected");

  if ((v13 & 1) != 0)
  {
LABEL_8:
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICCameraItem device](self, "device");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addTruth:code:", objc_msgSend(v19, "hasOpenSession") ^ 1, -9958);

    -[ICCameraItem device](self, "device");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addTruth:code:", objc_msgSend(v20, "beingEjected"), -21346);

    objc_msgSend(v17, "setObject:forKeyedSubscript:", v18, CFSTR("errors"));
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.ImageCaptureCore"), -30000, v17);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v8[2](v8, 0, v21);

    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", length);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setCancellable:", 1);
  objc_msgSend(v14, "setPausable:", 0);
  -[ICCameraItem device](self, "device");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __58__ICCameraFile_requestReadDataAtOffset_length_completion___block_invoke;
  v22[3] = &unk_1E70C78B8;
  v25 = offset;
  v26 = length;
  v22[4] = self;
  v23 = v14;
  v24 = v8;
  v16 = v14;
  objc_msgSend(v15, "dispatchAsyncForOperationType:block:", 4, v22);

LABEL_6:
LABEL_9:

}

void __58__ICCameraFile_requestReadDataAtOffset_length_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint32_t denom;
  uint32_t numer;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  NSObject *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  char v35;
  uint64_t v36;
  dispatch_semaphore_t v37;
  void *v38;
  uint64_t v39;
  id v40;
  uint64_t v41;
  NSObject *v42;
  _QWORD v43[5];
  id v44;
  id v45;
  NSObject *v46;
  uint64_t *v47;
  _BYTE *v48;
  uint64_t *v49;
  uint64_t *v50;
  uint64_t v51;
  mach_timebase_info info;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  char v60;
  uint64_t v61;
  uint64_t *v62;
  uint64_t v63;
  uint64_t v64;
  _BYTE v65[12];
  __int16 v66;
  void *v67;
  _BYTE buf[24];
  uint64_t v69;
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "fileSize");
  v3 = *(_QWORD *)(a1 + 56);
  if (v3 < 0 || (v4 = v2, v3 >= v2) || *(_QWORD *)(a1 + 64) + v3 > v2)
  {
    __ICOSLogCreate();
    v5 = CFSTR("read fail");
    if ((unint64_t)objc_msgSend(CFSTR("read fail"), "length") >= 0x15)
    {
      objc_msgSend(CFSTR("read fail"), "substringWithRange:", 0, 18);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringByAppendingString:", CFSTR(".."));
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    v7 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(*(id *)(a1 + 32), "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("filename: %@, readOffset: %llu, readLength: %llu"), v8, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v11 = objc_retainAutorelease(v5);
      v12 = v10;
      *(_DWORD *)buf = 136446466;
      *(_QWORD *)&buf[4] = -[__CFString UTF8String](v11, "UTF8String");
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v9;
      _os_log_impl(&dword_1B98FC000, v12, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.ImageCaptureCore"), -21448, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
LABEL_9:

    return;
  }
  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithCapacity:");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    __ICOSLogCreate();
    objc_msgSend(*(id *)(a1 + 32), "name");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v14, "length") >= 0x15)
    {
      objc_msgSend(v14, "substringWithRange:", 0, 18);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "stringByAppendingString:", CFSTR(".."));
      v16 = objc_claimAutoreleasedReturnValue();

      v14 = (void *)v16;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Downloading to data buffer: %llu"), *(_QWORD *)(a1 + 64));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v19 = objc_retainAutorelease(v14);
      v20 = v18;
      *(_DWORD *)buf = 136446466;
      *(_QWORD *)&buf[4] = objc_msgSend(v19, "UTF8String");
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v17;
      _os_log_impl(&dword_1B98FC000, v20, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

    }
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    v21 = *(_QWORD *)(a1 + 56);
    v69 = *(_QWORD *)(a1 + 64);
    v61 = 0;
    v62 = &v61;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v63 = 0x2020000000;
    v64 = v21;
    v57 = 0;
    v58 = &v57;
    v59 = 0x2020000000;
    v60 = 0;
    v53 = 0;
    v54 = &v53;
    v55 = 0x2020000000;
    v56 = 0;
    objc_msgSend(*(id *)(a1 + 32), "requestOpenStreamData");
    info = 0;
    mach_timebase_info(&info);
    _gBenchmarkStartMachTime = 0;
    *(float *)&_gBenchmarkStartMachTime = (float)mach_absolute_time();
    v22 = *(_QWORD *)&buf[8];
    v23 = *(_QWORD *)(*(_QWORD *)&buf[8] + 24);
    if (v23 >= 1)
    {
      while (!*((_BYTE *)v58 + 24))
      {
        v35 = objc_msgSend(*(id *)(a1 + 40), "isCancelled");
        v22 = *(_QWORD *)&buf[8];
        if ((v35 & 1) != 0)
          break;
        v36 = *(uint64_t *)(*(_QWORD *)&buf[8] + 24) >= 0x200000 ? 0x200000 : *(_QWORD *)(*(_QWORD *)&buf[8] + 24);
        v37 = dispatch_semaphore_create(0);
        *(_QWORD *)v65 = 0;
        mach_timebase_info((mach_timebase_info_t)v65);
        _gBenchmarkStartMachTime = 0;
        *(float *)&_gBenchmarkStartMachTime = (float)mach_absolute_time();
        v38 = *(void **)(a1 + 32);
        v39 = v62[3];
        v43[0] = MEMORY[0x1E0C809B0];
        v43[1] = 3221225472;
        v43[2] = __58__ICCameraFile_requestReadDataAtOffset_length_completion___block_invoke_208;
        v43[3] = &unk_1E70C7890;
        v47 = &v53;
        v43[4] = v38;
        v44 = v13;
        v48 = buf;
        v49 = &v61;
        v40 = *(id *)(a1 + 40);
        v41 = *(_QWORD *)(a1 + 56);
        v45 = v40;
        v50 = &v57;
        v51 = v41;
        v42 = v37;
        v46 = v42;
        objc_msgSend(v38, "requestStreamDataAtOffset:length:completion:", v39, v36, v43);
        dispatch_semaphore_wait(v42, 0xFFFFFFFFFFFFFFFFLL);

        v22 = *(_QWORD *)&buf[8];
        if (*(uint64_t *)(*(_QWORD *)&buf[8] + 24) <= 0)
          break;
      }
      v23 = *(_QWORD *)(v22 + 24);
    }
    v24 = v54[3];
    numer = info.numer;
    denom = info.denom;
    __ICOSLogCreate();
    objc_msgSend(*(id *)(a1 + 32), "name");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v27, "length") >= 0x15)
    {
      objc_msgSend(v27, "substringWithRange:", 0, 18);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "stringByAppendingString:", CFSTR(".."));
      v29 = objc_claimAutoreleasedReturnValue();

      v27 = (void *)v29;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("icDatarate: %07.2f"), (float)-(float)((float)v23- (float)((float)(1000.0/ (float)((float)((float)((float)v24 * (float)numer) / (float)denom) / 1000000.0))* (float)v4))* 0.000000953674316);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (id)_gICOSLog;
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      v32 = objc_msgSend(objc_retainAutorelease(v27), "UTF8String");
      *(_DWORD *)v65 = 136446466;
      *(_QWORD *)&v65[4] = v32;
      v66 = 2114;
      v67 = v30;
      _os_log_impl(&dword_1B98FC000, v31, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", v65, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 32), "requestCloseStreamData");
    if (*((_BYTE *)v58 + 24))
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.ImageCaptureCore"), -21448, 0);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v33 = 0;
    }
    if (objc_msgSend(*(id *)(a1 + 40), "isCancelled"))
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.ImageCaptureCore"), -9937, 0);
      v34 = objc_claimAutoreleasedReturnValue();

      v33 = (void *)v34;
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

    _Block_object_dispose(&v53, 8);
    _Block_object_dispose(&v57, 8);
    _Block_object_dispose(&v61, 8);
    _Block_object_dispose(buf, 8);
    goto LABEL_9;
  }
}

void __58__ICCameraFile_requestReadDataAtOffset_length_completion___block_invoke_208(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  NSObject *v30;
  uint64_t v31;
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = (unint64_t)(float)((float)((float)mach_absolute_time()
                                                                                                - *(float *)&_gBenchmarkStartMachTime)
                                                                                        + (float)*(unint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24));
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("ICReadData"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4 && objc_msgSend(v4, "length"))
  {
    v6 = objc_msgSend(v5, "length");
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("ICBytesRead"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("ICBytesRead"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v8, "unsignedLongLongValue");

    }
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("ICBufferOffset"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("ICBufferOffset"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(v10, "unsignedLongLongValue");

    }
    __ICOSLogCreate();
    objc_msgSend(*(id *)(a1 + 32), "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v11, "length") >= 0x15)
    {
      objc_msgSend(v11, "substringWithRange:", 0, 18);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringByAppendingString:", CFSTR(".."));
      v13 = objc_claimAutoreleasedReturnValue();

      v11 = (void *)v13;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Received: %llu bytes"), v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v16 = objc_retainAutorelease(v11);
      v17 = v15;
      *(_DWORD *)buf = 136446466;
      v33 = objc_msgSend(v16, "UTF8String");
      v34 = 2114;
      v35 = v14;
      _os_log_impl(&dword_1B98FC000, v17, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

    }
    v18 = *(void **)(a1 + 40);
    objc_msgSend(v5, "subdataWithRange:", v9, v6);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "appendData:", v19);

    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) -= v6;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) += v6;
    objc_msgSend(*(id *)(a1 + 48), "setCompletedUnitCount:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) - *(_QWORD *)(a1 + 96));
    __ICOSLogCreate();
    objc_msgSend(*(id *)(a1 + 32), "name");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v20, "length") >= 0x15)
    {
      objc_msgSend(v20, "substringWithRange:", 0, 18);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "stringByAppendingString:", CFSTR(".."));
      v22 = objc_claimAutoreleasedReturnValue();

      v20 = (void *)v22;
    }
    v23 = (void *)MEMORY[0x1E0CB3940];
    v24 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
    v25 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
    objc_msgSend(*(id *)(a1 + 48), "fractionCompleted");
    objc_msgSend(v23, "stringWithFormat:", CFSTR("Offset: %lld, Remaining: %lld, Progress: %f"), v24, v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v29 = objc_retainAutorelease(v20);
      v30 = v28;
      v31 = objc_msgSend(v29, "UTF8String");
      *(_DWORD *)buf = 136446466;
      v33 = v31;
      v34 = 2114;
      v35 = v27;
      _os_log_impl(&dword_1B98FC000, v30, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

    }
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = 1;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));

}

- (void)requestCloseStreamData
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", &unk_1E70DC650, CFSTR("ICReadOffset"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", &unk_1E70DC650, CFSTR("ICReadLength"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("ICReadBufferStreamClose"));
  -[ICCameraItem device](self, "device");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deviceManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCameraItem device](self, "device");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __38__ICCameraFile_requestCloseStreamData__block_invoke;
  v7[3] = &unk_1E70C78E0;
  v7[4] = self;
  objc_msgSend(v5, "getFileData:fromDevice:withOptions:completion:", self, v6, v3, v7);

}

void __38__ICCameraFile_requestCloseStreamData__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("errCode"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "intValue");

  if (!v5)
  {
    __ICOSLogCreate();
    objc_msgSend(*(id *)(a1 + 32), "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v6, "length") >= 0x15)
    {
      objc_msgSend(v6, "substringWithRange:", 0, 18);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringByAppendingString:", CFSTR(".."));
      v8 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v8;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ICReadBufferStreamClose"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v11 = objc_retainAutorelease(v6);
      v12 = v10;
      v13 = 136446466;
      v14 = objc_msgSend(v11, "UTF8String");
      v15 = 2114;
      v16 = v9;
      _os_log_impl(&dword_1B98FC000, v12, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&v13, 0x16u);

    }
  }
}

- (void)requestOpenStreamData
{
  void *v3;
  dispatch_semaphore_t v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[5];
  dispatch_semaphore_t v10;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", &unk_1E70DC650, CFSTR("ICReadOffset"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", &unk_1E70DC650, CFSTR("ICReadLength"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("ICReadBufferStreamOpen"));
  v4 = dispatch_semaphore_create(0);
  -[ICCameraItem device](self, "device");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deviceManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCameraItem device](self, "device");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __37__ICCameraFile_requestOpenStreamData__block_invoke;
  v9[3] = &unk_1E70C7908;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  objc_msgSend(v6, "getFileData:fromDevice:withOptions:completion:", self, v7, v3, v9);

  dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
}

intptr_t __37__ICCameraFile_requestOpenStreamData__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  int v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("errCode"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "intValue");

  if (!v5)
  {
    __ICOSLogCreate();
    objc_msgSend(*(id *)(a1 + 32), "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v6, "length") >= 0x15)
    {
      objc_msgSend(v6, "substringWithRange:", 0, 18);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringByAppendingString:", CFSTR(".."));
      v8 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v8;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ICReadBufferStreamOpen"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v11 = objc_retainAutorelease(v6);
      v12 = v10;
      v14 = 136446466;
      v15 = objc_msgSend(v11, "UTF8String");
      v16 = 2114;
      v17 = v9;
      _os_log_impl(&dword_1B98FC000, v12, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&v14, 0x16u);

    }
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (void)requestStreamDataAtOffset:(int64_t)a3 length:(int64_t)a4 completion:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;

  v8 = a5;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, CFSTR("ICReadOffset"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v11, CFSTR("ICReadLength"));

  -[ICCameraItem device](self, "device");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "deviceManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCameraItem device](self, "device");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __60__ICCameraFile_requestStreamDataAtOffset_length_completion___block_invoke;
  v16[3] = &unk_1E70C7930;
  v17 = v8;
  v15 = v8;
  objc_msgSend(v13, "getFileData:fromDevice:withOptions:completion:", self, v14, v9, v16);

}

void __60__ICCameraFile_requestStreamDataAtOffset_length_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  int v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("errCode"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "intValue");

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.ImageCaptureCore"), v5, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)setUTI:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  unint64_t v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  int v13;
  unint64_t mediaMetadata;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)ICCameraFile;
  -[ICCameraItem setUTI:](&v15, sel_setUTI_, a3);
  -[ICCameraItem UTI](self, "UTI");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)*MEMORY[0x1E0CEC520], "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  if (v6)
  {
    v7 = self->_mediaMetadata | 0x20;
  }
  else
  {
    -[ICCameraItem UTI](self, "UTI");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)*MEMORY[0x1E0CEC568], "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "isEqualToString:", v9);

    if (v10)
    {
      v7 = self->_mediaMetadata | 0x40;
    }
    else
    {
      -[ICCameraItem UTI](self, "UTI");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)*MEMORY[0x1E0CEC450], "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v11, "isEqualToString:", v12);

      mediaMetadata = self->_mediaMetadata;
      if (v13)
        v7 = mediaMetadata | 0x100;
      else
        v7 = mediaMetadata | 0x10;
    }
  }
  self->_mediaMetadata = v7;
}

- (void)requestSecurityScopedURLWithCompletion:(void *)completion
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v4 = completion;
  -[ICCameraItem device](self, "device");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deviceManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCameraItem device](self, "device");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __55__ICCameraFile_requestSecurityScopedURLWithCompletion___block_invoke;
  v9[3] = &unk_1E70C7930;
  v10 = v4;
  v8 = v4;
  objc_msgSend(v6, "getSecurityScopedURL:fromDevice:completion:", self, v7, v9);

}

void __55__ICCameraFile_requestSecurityScopedURLWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  id v9;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("errCode"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "intValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ICSecurityScopedURL"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.ImageCaptureCore"), v6, 0);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  v9 = (id)v8;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)requestRefreshObjectHandleInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[ICCameraItem device](self, "device");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deviceManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCameraItem device](self, "device");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __47__ICCameraFile_requestRefreshObjectHandleInfo___block_invoke;
  v9[3] = &unk_1E70C7930;
  v10 = v4;
  v8 = v4;
  objc_msgSend(v6, "refreshObjectHandleInfo:fromDevice:completion:", self, v7, v9);

}

void __47__ICCameraFile_requestRefreshObjectHandleInfo___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  int v5;
  uint64_t v6;
  id v7;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("errCode"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "intValue");

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.ImageCaptureCore"), v5, 0);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  v7 = (id)v6;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)handleObjectInfoUpdate:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  _QWORD v19[5];
  _QWORD v20[5];
  _QWORD block[5];

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ICFileSize"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = MEMORY[0x1E0C809B0];
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ICFileSize"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICCameraFile setFileSize:](self, "setFileSize:", objc_msgSend(v7, "unsignedLongLongValue"));

    block[0] = v6;
    block[1] = 3221225472;
    block[2] = __39__ICCameraFile_handleObjectInfoUpdate___block_invoke;
    block[3] = &unk_1E70C7198;
    block[4] = self;
    ICPerformBlockOnMainThread(block);
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ICMediaDuration"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ICMediaDuration"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "doubleValue");
    -[ICCameraFile setDuration:](self, "setDuration:");

    v20[0] = v6;
    v20[1] = 3221225472;
    v20[2] = __39__ICCameraFile_handleObjectInfoUpdate___block_invoke_2;
    v20[3] = &unk_1E70C7198;
    v20[4] = self;
    ICPerformBlockOnMainThread(v20);
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ICModificationDate"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ICModificationDate"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dateWithTimeIntervalSince1970:", (double)(unint64_t)objc_msgSend(v12, "unsignedLongLongValue"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      -[ICCameraItem setModificationDate:](self, "setModificationDate:", v13);
      v19[0] = v6;
      v19[1] = 3221225472;
      v19[2] = __39__ICCameraFile_handleObjectInfoUpdate___block_invoke_3;
      v19[3] = &unk_1E70C7198;
      v19[4] = self;
      ICPerformBlockOnMainThread(v19);
    }

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ICCreationDate"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v15 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ICCreationDate"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "dateWithTimeIntervalSince1970:", (double)(unint64_t)objc_msgSend(v16, "unsignedLongLongValue"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      -[ICCameraItem setCreationDate:](self, "setCreationDate:", v17);
      v18[0] = v6;
      v18[1] = 3221225472;
      v18[2] = __39__ICCameraFile_handleObjectInfoUpdate___block_invoke_4;
      v18[3] = &unk_1E70C7198;
      v18[4] = self;
      ICPerformBlockOnMainThread(v18);
    }

  }
}

uint64_t __39__ICCameraFile_handleObjectInfoUpdate___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "willChangeValueForKey:", CFSTR("fileSize"));
  return objc_msgSend(*(id *)(a1 + 32), "didChangeValueForKey:", CFSTR("fileSize"));
}

uint64_t __39__ICCameraFile_handleObjectInfoUpdate___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "willChangeValueForKey:", CFSTR("duration"));
  return objc_msgSend(*(id *)(a1 + 32), "didChangeValueForKey:", CFSTR("duration"));
}

uint64_t __39__ICCameraFile_handleObjectInfoUpdate___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "willChangeValueForKey:", CFSTR("modificationDate"));
  return objc_msgSend(*(id *)(a1 + 32), "didChangeValueForKey:", CFSTR("modificationDate"));
}

uint64_t __39__ICCameraFile_handleObjectInfoUpdate___block_invoke_4(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "willChangeValueForKey:", CFSTR("creationDate"));
  return objc_msgSend(*(id *)(a1 + 32), "didChangeValueForKey:", CFSTR("creationDate"));
}

+ (id)fingerprintForFileAtURL:(id)a3
{
  id v3;
  ICCameraFileFingerprint *v4;
  void *v5;
  uint64_t v7;

  v3 = a3;
  v4 = objc_alloc_init(ICCameraFileFingerprint);
  v7 = 0;
  -[ICCameraFileFingerprint fingerprintForFileAtURL:error:](v4, "fingerprintForFileAtURL:error:", v3, &v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)requestFingerprintWithCompletion:(id)a3
{
  void (**v4)(id, void *, _QWORD);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  void (**v11)(id, void *, _QWORD);

  v4 = (void (**)(id, void *, _QWORD))a3;
  -[ICCameraFile fingerprint](self, "fingerprint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[ICCameraFile fingerprint](self, "fingerprint");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v6, 0);

  }
  else
  {
    -[ICCameraItem device](self, "device");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "deviceManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICCameraItem device](self, "device");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __49__ICCameraFile_requestFingerprintWithCompletion___block_invoke;
    v10[3] = &unk_1E70C7958;
    v10[4] = self;
    v11 = v4;
    objc_msgSend(v8, "getFingerprint:fromDevice:completion:", self, v9, v10);

  }
}

void __49__ICCameraFile_requestFingerprintWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  id v8;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("errCode"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "intValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ICCameraFileFingerprint"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v8 = 0;
    if (!v7)
      goto LABEL_4;
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.ImageCaptureCore"), v6, 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v7)
LABEL_3:
    objc_msgSend(*(id *)(a1 + 32), "setFingerprint:", v7);
LABEL_4:
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (NSInteger)width
{
  return self->_width;
}

- (void)setWidth:(int64_t)a3
{
  self->_width = a3;
}

- (NSInteger)height
{
  return self->_height;
}

- (void)setHeight:(int64_t)a3
{
  self->_height = a3;
}

- (NSString)originalFilename
{
  return self->_originalFilename;
}

- (void)setOriginalFilename:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (NSString)createdFilename
{
  return self->_createdFilename;
}

- (void)setCreatedFilename:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (off_t)fileSize
{
  return self->_fileSize;
}

- (void)setFileSize:(int64_t)a3
{
  self->_fileSize = a3;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (BOOL)highFramerate
{
  return self->_highFramerate;
}

- (void)setHighFramerate:(BOOL)a3
{
  self->_highFramerate = a3;
}

- (BOOL)timeLapse
{
  return self->_timeLapse;
}

- (void)setTimeLapse:(BOOL)a3
{
  self->_timeLapse = a3;
}

- (BOOL)firstPicked
{
  return self->_firstPicked;
}

- (void)setFirstPicked:(BOOL)a3
{
  self->_firstPicked = a3;
}

- (NSString)originatingAssetID
{
  return self->_originatingAssetID;
}

- (void)setOriginatingAssetID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 248);
}

- (NSString)groupUUID
{
  return self->_groupUUID;
}

- (void)setGroupUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 256);
}

- (NSString)gpsString
{
  return self->_gpsString;
}

- (void)setGpsString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 264);
}

- (NSString)relatedUUID
{
  return self->_relatedUUID;
}

- (void)setRelatedUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 272);
}

- (NSString)burstUUID
{
  return self->_burstUUID;
}

- (void)setBurstUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 280);
}

- (BOOL)burstFavorite
{
  return self->_burstFavorite;
}

- (void)setBurstFavorite:(BOOL)a3
{
  self->_burstFavorite = a3;
}

- (BOOL)burstPicked
{
  return self->_burstPicked;
}

- (void)setBurstPicked:(BOOL)a3
{
  self->_burstPicked = a3;
}

- (void)setSidecarFiles:(id)a3
{
  objc_storeStrong((id *)&self->_sidecarFiles, a3);
}

- (ICCameraFile)pairedRawImage
{
  return self->_pairedRawImage;
}

- (void)setPairedRawImage:(id)a3
{
  objc_storeStrong((id *)&self->_pairedRawImage, a3);
}

- (NSDate)fileCreationDate
{
  return self->_fileCreationDate;
}

- (void)setFileCreationDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 304);
}

- (NSDate)fileModificationDate
{
  return self->_fileModificationDate;
}

- (void)setFileModificationDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 312);
}

- (NSDate)exifCreationDate
{
  return self->_exifCreationDate;
}

- (void)setExifCreationDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 320);
}

- (NSDate)exifModificationDate
{
  return self->_exifModificationDate;
}

- (void)setExifModificationDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 328);
}

- (BOOL)privHasThumbnail
{
  return self->_privHasThumbnail;
}

- (void)setPrivHasThumbnail:(BOOL)a3
{
  self->_privHasThumbnail = a3;
}

- (BOOL)privHasMetadata
{
  return self->_privHasMetadata;
}

- (void)setPrivHasMetadata:(BOOL)a3
{
  self->_privHasMetadata = a3;
}

- (unint64_t)privOrientation
{
  return self->_privOrientation;
}

- (void)setPrivOrientation:(unint64_t)a3
{
  self->_privOrientation = a3;
}

- (NSString)privSpatialOverCaptureGroupID
{
  return self->_privSpatialOverCaptureGroupID;
}

- (void)setPrivSpatialOverCaptureGroupID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 344);
}

- (NSString)privFingerprint
{
  return self->_privFingerprint;
}

- (void)setPrivFingerprint:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 352);
}

- (NSString)privMediaBase
{
  return self->_privMediaBase;
}

- (void)setPrivMediaBase:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 360);
}

- (unint64_t)mediaMetadata
{
  return self->_mediaMetadata;
}

- (void)setMediaMetadata:(unint64_t)a3
{
  self->_mediaMetadata = a3;
}

- (NSDictionary)mediaData
{
  return self->_mediaData;
}

- (void)setMediaData:(id)a3
{
  objc_storeStrong((id *)&self->_mediaData, a3);
}

- (NSMutableDictionary)subImages
{
  return self->_subImages;
}

- (void)setSubImages:(id)a3
{
  objc_storeStrong((id *)&self->_subImages, a3);
}

- (BOOL)useExtensionIcon
{
  return self->_useExtensionIcon;
}

- (void)setUseExtensionIcon:(BOOL)a3
{
  self->_useExtensionIcon = a3;
}

- (BOOL)retrievedMetadata
{
  return self->_retrievedMetadata;
}

- (unsigned)objectHandle
{
  return self->_objectHandle;
}

- (NSData)thumbnailData
{
  return self->_thumbnailData;
}

- (void)setThumbnailData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 392);
}

- (NSProgress)progress
{
  return self->_progress;
}

- (void)setProgress:(id)a3
{
  objc_storeStrong((id *)&self->_progress, a3);
}

- (double)lastImportSpeed
{
  return self->_lastImportSpeed;
}

- (void)setLastImportSpeed:(double)a3
{
  self->_lastImportSpeed = a3;
}

- (BOOL)orientationOverridden
{
  return self->_orientationOverridden;
}

- (void)setOrientationOverridden:(BOOL)a3
{
  self->_orientationOverridden = a3;
}

- (unint64_t)oUUID
{
  return self->_oUUID;
}

- (void)setOUUID:(unint64_t)a3
{
  self->_oUUID = a3;
}

- (unint64_t)uTime
{
  return self->_uTime;
}

- (void)setUTime:(unint64_t)a3
{
  self->_uTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_thumbnailData, 0);
  objc_storeStrong((id *)&self->_subImages, 0);
  objc_storeStrong((id *)&self->_mediaData, 0);
  objc_storeStrong((id *)&self->_privMediaBase, 0);
  objc_storeStrong((id *)&self->_privFingerprint, 0);
  objc_storeStrong((id *)&self->_privSpatialOverCaptureGroupID, 0);
  objc_storeStrong((id *)&self->_exifModificationDate, 0);
  objc_storeStrong((id *)&self->_exifCreationDate, 0);
  objc_storeStrong((id *)&self->_fileModificationDate, 0);
  objc_storeStrong((id *)&self->_fileCreationDate, 0);
  objc_storeStrong((id *)&self->_pairedRawImage, 0);
  objc_storeStrong((id *)&self->_sidecarFiles, 0);
  objc_storeStrong((id *)&self->_burstUUID, 0);
  objc_storeStrong((id *)&self->_relatedUUID, 0);
  objc_storeStrong((id *)&self->_gpsString, 0);
  objc_storeStrong((id *)&self->_groupUUID, 0);
  objc_storeStrong((id *)&self->_originatingAssetID, 0);
  objc_storeStrong((id *)&self->_createdFilename, 0);
  objc_storeStrong((id *)&self->_originalFilename, 0);
  objc_storeStrong((id *)&self->_fileIsHEIC, 0);
  objc_storeStrong((id *)&self->_fileIsJPEG, 0);
  objc_storeStrong((id *)&self->_debugBadge, 0);
  objc_storeStrong((id *)&self->_debugType, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
}

@end
