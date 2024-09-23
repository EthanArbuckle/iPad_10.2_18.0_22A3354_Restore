@implementation CKWatchfaceMediaObject

+ (id)UTITypes
{
  return &unk_1E286FFA0;
}

- (id)metricsCollectorMediaType
{
  return (id)*MEMORY[0x1E0D386E8];
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
    v6 = CFSTR("SUMMARY_WATCHFACE_TYPE");
  else
    v6 = CFSTR("SUMMARY_WATCHFACE_TYPES");
  objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_1E276D870, CFSTR("ChatKit"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (int)mediaType
{
  return 8;
}

- (BOOL)hasOutOfProcessPreviewGenerator
{
  return 1;
}

+ (BOOL)shouldUseTranscoderGeneratedPreviewSize
{
  return 0;
}

+ (BOOL)canGeneratePreviewInMVSHostProcess
{
  return 0;
}

- (Class)previewBalloonViewClass
{
  return (Class)objc_opt_class();
}

- (Class)placeholderBalloonViewClass
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKWatchfaceMediaObject;
  -[CKMediaObject previewBalloonViewClass](&v3, sel_previewBalloonViewClass);
  return (Class)(id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)generatePreviewOutOfProcess
{
  _BOOL4 v3;
  objc_super v5;

  v3 = -[CKWatchfaceMediaObject hasOutOfProcessPreviewGenerator](self, "hasOutOfProcessPreviewGenerator");
  if (v3)
  {
    v5.receiver = self;
    v5.super_class = (Class)CKWatchfaceMediaObject;
    LOBYTE(v3) = -[CKMediaObject generatePreviewOutOfProcess](&v5, sel_generatePreviewOutOfProcess);
  }
  return v3;
}

- (id)generateThumbnailForWidth:(double)a3 orientation:(char)a4
{
  int v4;
  NSObject *v7;
  float v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  dispatch_time_t v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  uint8_t v17[16];
  _QWORD v18[4];
  NSObject *v19;
  _BYTE *v20;
  _BYTE buf[24];
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;

  v4 = a4;
  v25 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = a3;
      *(_DWORD *)buf = 134218240;
      *(double *)&buf[4] = v8;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v4;
      _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_INFO, "Generating Greenfield thumbnail in-process (width=%.3g, orientation=%d)", buf, 0x12u);
    }

  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v22 = __Block_byref_object_copy__78;
  v23 = __Block_byref_object_dispose__78;
  v24 = 0;
  v9 = dispatch_group_create();
  dispatch_group_enter(v9);
  -[CKMediaObject fileURL](self, "fileURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __64__CKWatchfaceMediaObject_generateThumbnailForWidth_orientation___block_invoke;
  v18[3] = &unk_1E275A3A0;
  v20 = buf;
  v11 = v9;
  v19 = v11;
  +[CKWatchfaceInProcessPreviewGenerator generateFacePreviewImageFromUrl:completionBlock:](CKWatchfaceInProcessPreviewGenerator, "generateFacePreviewImageFromUrl:completionBlock:", v10, v18);

  v12 = dispatch_time(0, 5000000000);
  if (dispatch_group_wait(v11, v12))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v17 = 0;
        _os_log_impl(&dword_18DFCD000, v13, OS_LOG_TYPE_INFO, "Timed out waiting for metadata.", v17, 2u);
      }

    }
    v14 = 0;
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v17 = 0;
        _os_log_impl(&dword_18DFCD000, v15, OS_LOG_TYPE_INFO, "Generated snapshot image", v17, 2u);
      }

    }
    v14 = *(id *)(*(_QWORD *)&buf[8] + 40);
  }

  _Block_object_dispose(buf, 8);
  return v14;
}

void __64__CKWatchfaceMediaObject_generateThumbnailForWidth_orientation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  if (v7)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v9 = 138412290;
        v10 = v7;
        _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_INFO, "Error generating preview image: %@.", (uint8_t *)&v9, 0xCu);
      }

    }
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

- (id)generatePreviewFromThumbnail:(id)a3 width:(double)a4 orientation:(char)a5
{
  return a3;
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
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  int v19;
  NSObject *v20;
  NSObject *v21;
  int v22;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  void *v27;
  NSObject *v28;
  int v30;
  void *v31;
  uint64_t v32;

  v4 = a4;
  v32 = *MEMORY[0x1E0C80C00];
  p_linkMetadata = &self->_linkMetadata;
  if (self->_linkMetadata
    && vabdd_f64(a3, self->_cachedWidth) <= 1.0
    && self->_cachedOrientation == a4
    && -[CKWatchfaceMediaObject _isCachedFileLocationValid](self, "_isCachedFileLocationValid"))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        -[CKMediaObject fileURL](self, "fileURL");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = 138412290;
        v31 = v9;
        _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_INFO, "Using cached link metadata for fileURL: %@", (uint8_t *)&v30, 0xCu);

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
      v30 = 138412290;
      v31 = v12;
      _os_log_impl(&dword_18DFCD000, v11, OS_LOG_TYPE_INFO, "Generating link metadata for fileURL: %@", (uint8_t *)&v30, 0xCu);

    }
  }
  v13 = objc_alloc_init(MEMORY[0x1E0CC1160]);
  CKFrameworkBundle();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("ADD_WATCHFACE"), &stru_1E276D870, CFSTR("ChatKit"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setName:", v15);

  -[CKMediaObject filename](self, "filename");
  v16 = objc_claimAutoreleasedReturnValue();
  IMUTITypeForFilename();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setType:", v17);

  -[CKMediaObject fileURL](self, "fileURL");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v16) = v18 == 0;

  v19 = IMOSLoggingEnabled();
  if ((v16 & 1) == 0)
  {
    if (v19)
    {
      OSLogHandleForIMFoundationCategory();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        LOWORD(v30) = 0;
        _os_log_impl(&dword_18DFCD000, v20, OS_LOG_TYPE_INFO, "Getting Greenfield preview for width and orientation", (uint8_t *)&v30, 2u);
      }

    }
    -[CKMediaObject previewForWidth:orientation:](self, "previewForWidth:orientation:", v4, a3);
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = IMOSLoggingEnabled();
    if (v21)
    {
      if (v22)
      {
        OSLogHandleForIMFoundationCategory();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          LOWORD(v30) = 0;
          _os_log_impl(&dword_18DFCD000, v23, OS_LOG_TYPE_INFO, "Got preview image", (uint8_t *)&v30, 2u);
        }

      }
      v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC1178]), "initWithPlatformImage:", v21);
      objc_msgSend(v13, "setThumbnail:", v24);

    }
    else if (v22)
    {
      OSLogHandleForIMFoundationCategory();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        LOWORD(v30) = 0;
        _os_log_impl(&dword_18DFCD000, v25, OS_LOG_TYPE_INFO, "Warning: unable to obtain preview image at this time", (uint8_t *)&v30, 2u);
      }

    }
LABEL_33:

    goto LABEL_34;
  }
  if (v19)
  {
    OSLogHandleForIMFoundationCategory();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      LOWORD(v30) = 0;
      _os_log_impl(&dword_18DFCD000, v21, OS_LOG_TYPE_INFO, "Cannot generate preview: file URL is missing", (uint8_t *)&v30, 2u);
    }
    goto LABEL_33;
  }
LABEL_34:
  v10 = (LPLinkMetadata *)objc_alloc_init(MEMORY[0x1E0CC11A8]);
  -[LPLinkMetadata setSpecialization:](v10, "setSpecialization:", v13);
  -[CKMediaObject fileURL](self, "fileURL");
  v26 = objc_claimAutoreleasedReturnValue();
  -[LPLinkMetadata setOriginalURL:](v10, "setOriginalURL:", v26);

  objc_msgSend(v13, "thumbnail");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v26) = v27 == 0;

  if ((v26 & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        LOWORD(v30) = 0;
        _os_log_impl(&dword_18DFCD000, v28, OS_LOG_TYPE_INFO, "Caching link presentation metadata with thumbnail", (uint8_t *)&v30, 2u);
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
