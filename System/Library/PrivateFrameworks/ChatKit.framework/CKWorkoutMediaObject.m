@implementation CKWorkoutMediaObject

- (id)metricsCollectorMediaType
{
  return (id)*MEMORY[0x1E0D386F0];
}

+ (BOOL)isPreviewable
{
  return 1;
}

- (id)attachmentSummary:(unint64_t)a3
{
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;

  CKFrameworkBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a3 == 1)
    v6 = CFSTR("SUMMARY_WORKOUT_TYPE");
  else
    v6 = CFSTR("SUMMARY_WORKOUT_TYPES");
  objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_1E276D870, CFSTR("ChatKit"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (int)mediaType
{
  return 10;
}

+ (BOOL)shouldUseTranscoderGeneratedPreviewSize
{
  return 0;
}

+ (BOOL)canGeneratePreviewInMVSHostProcess
{
  return 1;
}

- (Class)balloonViewClass
{
  return (Class)objc_opt_class();
}

- (Class)previewBalloonViewClass
{
  return (Class)objc_opt_class();
}

- (Class)placeholderBalloonViewClass
{
  return (Class)objc_opt_class();
}

- (BOOL)generatePreviewOutOfProcess
{
  return 1;
}

- (BOOL)_isCachedFileLocationValid
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[LPLinkMetadata originalURL](self->_linkMetadata, "originalURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKMediaObject fileURL](self, "fileURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  if ((v5 & 1) != 0)
  {
    v6 = (void *)MEMORY[0x1E0CB3940];
    -[LPLinkMetadata originalURL](self->_linkMetadata, "originalURL");
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v6, "stringWithUTF8String:", objc_msgSend(v7, "fileSystemRepresentation"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "fileExistsAtPath:", v8);

    if ((v10 & 1) == 0 && IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v16 = 138412290;
        v17 = v8;
        _os_log_impl(&dword_18DFCD000, v11, OS_LOG_TYPE_INFO, "Cached link metadata fileURL does not exist.  File path: %@", (uint8_t *)&v16, 0xCu);
      }

    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        -[LPLinkMetadata originalURL](self->_linkMetadata, "originalURL");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[CKMediaObject fileURL](self, "fileURL");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 138412546;
        v17 = v13;
        v18 = 2112;
        v19 = v14;
        _os_log_impl(&dword_18DFCD000, v12, OS_LOG_TYPE_INFO, "Cached link metadata fileURL does not match current media object fileURL.  Cached: %@  Current: %@", (uint8_t *)&v16, 0x16u);

      }
    }
    return 0;
  }
  return v10;
}

- (id)linkMetadataForWidth:(double)a3 orientation:(char)a4
{
  uint64_t v4;
  LPLinkMetadata **p_linkMetadata;
  NSObject *v8;
  void *v9;
  LPLinkMetadata *v10;
  NSObject *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;
  NSObject *v18;
  NSObject *v19;
  int v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  int v28;
  void *v29;
  uint64_t v30;

  v4 = a4;
  v30 = *MEMORY[0x1E0C80C00];
  p_linkMetadata = &self->_linkMetadata;
  if (self->_linkMetadata
    && vabdd_f64(a3, self->_cachedWidth) <= 1.0
    && self->_cachedOrientation == a4
    && -[CKWorkoutMediaObject _isCachedFileLocationValid](self, "_isCachedFileLocationValid"))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        -[CKMediaObject fileURL](self, "fileURL");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = 138412290;
        v29 = v9;
        _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_INFO, "Using cached link metadata for fileURL: %@", (uint8_t *)&v28, 0xCu);

      }
    }
    v10 = *p_linkMetadata;
    return v10;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      -[CKMediaObject fileURL](self, "fileURL");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 138412290;
      v29 = v12;
      _os_log_impl(&dword_18DFCD000, v11, OS_LOG_TYPE_INFO, "Generating link metadata for fileURL: %@", (uint8_t *)&v28, 0xCu);

    }
  }
  v13 = objc_alloc_init(MEMORY[0x1E0CC1160]);
  CKFrameworkBundle();
  v14 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v14, "localizedStringForKey:value:table:", CFSTR("ADD_WORKOUT"), &stru_1E276D870, CFSTR("ChatKit"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setName:", v15);

  objc_msgSend(v13, "setType:", CFSTR("com.apple.workout"));
  -[CKMediaObject fileURL](self, "fileURL");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v14) = v16 == 0;

  v17 = IMOSLoggingEnabled();
  if ((v14 & 1) == 0)
  {
    if (v17)
    {
      OSLogHandleForIMFoundationCategory();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        LOWORD(v28) = 0;
        _os_log_impl(&dword_18DFCD000, v18, OS_LOG_TYPE_INFO, "Getting Greenfield preview for width and orientation", (uint8_t *)&v28, 2u);
      }

    }
    -[CKMediaObject previewForWidth:orientation:](self, "previewForWidth:orientation:", v4, a3);
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = IMOSLoggingEnabled();
    if (v19)
    {
      if (v20)
      {
        OSLogHandleForIMFoundationCategory();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          LOWORD(v28) = 0;
          _os_log_impl(&dword_18DFCD000, v21, OS_LOG_TYPE_INFO, "Got preview image", (uint8_t *)&v28, 2u);
        }

      }
      v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC1178]), "initWithPlatformImage:", v19);
      objc_msgSend(v13, "setThumbnail:", v22);

    }
    else if (v20)
    {
      OSLogHandleForIMFoundationCategory();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        LOWORD(v28) = 0;
        _os_log_impl(&dword_18DFCD000, v23, OS_LOG_TYPE_INFO, "Warning: unable to obtain preview image at this time", (uint8_t *)&v28, 2u);
      }

    }
LABEL_33:

    goto LABEL_34;
  }
  if (v17)
  {
    OSLogHandleForIMFoundationCategory();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      LOWORD(v28) = 0;
      _os_log_impl(&dword_18DFCD000, v19, OS_LOG_TYPE_INFO, "Cannot generate preview: file URL is missing", (uint8_t *)&v28, 2u);
    }
    goto LABEL_33;
  }
LABEL_34:
  v10 = (LPLinkMetadata *)objc_alloc_init(MEMORY[0x1E0CC11A8]);
  -[LPLinkMetadata setSpecialization:](v10, "setSpecialization:", v13);
  -[CKMediaObject fileURL](self, "fileURL");
  v24 = objc_claimAutoreleasedReturnValue();
  -[LPLinkMetadata setOriginalURL:](v10, "setOriginalURL:", v24);

  objc_msgSend(v13, "thumbnail");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v24) = v25 == 0;

  if ((v24 & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        LOWORD(v28) = 0;
        _os_log_impl(&dword_18DFCD000, v26, OS_LOG_TYPE_INFO, "Caching link presentation metadata with thumbnail", (uint8_t *)&v28, 2u);
      }

    }
    objc_storeStrong((id *)p_linkMetadata, v10);
    self->_cachedWidth = a3;
    self->_cachedOrientation = v4;
  }

  return v10;
}

- (LPLinkMetadata)linkMetadata
{
  return self->_linkMetadata;
}

- (void)setLinkMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_linkMetadata, a3);
}

- (double)cachedWidth
{
  return self->_cachedWidth;
}

- (void)setCachedWidth:(double)a3
{
  self->_cachedWidth = a3;
}

- (char)cachedOrientation
{
  return self->_cachedOrientation;
}

- (void)setCachedOrientation:(char)a3
{
  self->_cachedOrientation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkMetadata, 0);
}

@end
