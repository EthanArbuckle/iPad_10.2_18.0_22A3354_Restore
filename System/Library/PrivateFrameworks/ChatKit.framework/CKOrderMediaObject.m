@implementation CKOrderMediaObject

- (id)_initWithOverrideFileURL:(id)a3
{
  id v4;
  CKOrderMediaObject *v5;
  CKOrderMediaObject *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CKOrderMediaObject;
  v5 = -[CKOrderMediaObject init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[CKOrderMediaObject setOverrideFileURL:](v5, "setOverrideFileURL:", v4);

  return v6;
}

- (BOOL)isSupported
{
  void *v2;
  char v3;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "supportsPassbookAttachments");

  return v3;
}

+ (id)UTITypes
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("com.apple.finance.order");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)metricsCollectorMediaType
{
  return (id)*MEMORY[0x1E0D386E0];
}

+ (id)fallbackFilenamePrefix
{
  return CFSTR("ORDER");
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
    v6 = CFSTR("SUMMARY_ORDER_TYPE");
  else
    v6 = CFSTR("SUMMARY_ORDER_TYPES");
  objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_1E276D870, CFSTR("ChatKit"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (int)mediaType
{
  return 9;
}

- (id)previewMetadata
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  objc_super v8;

  -[CKOrderMediaObject overrideMetadataProperties](self, "overrideMetadataProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)CKOrderMediaObject;
    -[CKMediaObject previewMetadata](&v8, sel_previewMetadata);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (id)previewForWidth:(double)a3 orientation:(char)a4
{
  uint64_t v4;
  void *v7;
  objc_super v9;

  v4 = a4;
  if (-[CKOrderMediaObject isSupported](self, "isSupported"))
  {
    v9.receiver = self;
    v9.super_class = (Class)CKOrderMediaObject;
    -[CKMediaObject previewForWidth:orientation:](&v9, sel_previewForWidth_orientation_, v4, a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)generateThumbnailForWidth:(double)a3 orientation:(char)a4
{
  uint64_t v4;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;

  v4 = a4;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "thumbnailFillSizeForWidth:imageSize:", a3, 4.0, 3.0);
  v9 = v8;
  v11 = v10;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "thumbnailContentAlignmentInsetsForOrientation:", v4);
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;

  return -[CKOrderMediaObject generateThumbnailFillToSize:contentAlignmentInsets:](self, "generateThumbnailFillToSize:contentAlignmentInsets:", v9, v11, v14, v16, v18, v20);
}

- (BOOL)shouldShowViewer
{
  void *v2;
  char v3;

  -[CKMediaObject transfer](self, "transfer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isFileDataReady");

  return v3;
}

- (BOOL)shouldBeQuickLooked
{
  return 0;
}

- (BOOL)shouldShowDisclosure
{
  return 0;
}

- (id)previewItemTitle
{
  void *v2;
  void *v3;

  CKFrameworkBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("SUMMARY_ORDER_TYPE"), &stru_1E276D870, CFSTR("ChatKit"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)generatePreviewOutOfProcess
{
  objc_super v4;

  if (-[CKMediaObject isFromMe](self, "isFromMe"))
    return 0;
  v4.receiver = self;
  v4.super_class = (Class)CKOrderMediaObject;
  return -[CKMediaObject generatePreviewOutOfProcess](&v4, sel_generatePreviewOutOfProcess);
}

+ (BOOL)isPreviewable
{
  return 1;
}

+ (BOOL)shouldUseTranscoderGeneratedPreviewSize
{
  return 0;
}

- (Class)balloonViewClassForWidth:(double)a3 orientation:(char)a4
{
  uint64_t v4;
  uint64_t v7;
  void *v8;
  BOOL v9;
  void *v10;
  objc_super v12;

  v4 = a4;
  if (-[CKOrderMediaObject isSupported](self, "isSupported")
    && (-[CKOrderMediaObject previewMetadata](self, "previewMetadata"), (v7 = objc_claimAutoreleasedReturnValue()) != 0)
    && (v8 = (void *)v7,
        v9 = -[CKMediaObject shouldSuppressPreview](self, "shouldSuppressPreview"),
        v8,
        !v9))
  {
    objc_opt_class();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)CKOrderMediaObject;
    -[CKMediaObject balloonViewClassForWidth:orientation:](&v12, sel_balloonViewClassForWidth_orientation_, v4, a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (Class)v10;
}

- (Class)previewBalloonViewClass
{
  if (-[CKOrderMediaObject isSupported](self, "isSupported"))
    objc_opt_class();
  else
    -[CKMediaObject placeholderBalloonViewClass](self, "placeholderBalloonViewClass");
  return (Class)(id)objc_claimAutoreleasedReturnValue();
}

- (id)generateThumbnailFillToSize:(CGSize)a3 contentAlignmentInsets:(UIEdgeInsets)a4
{
  double right;
  double bottom;
  double left;
  double top;
  double height;
  double width;
  _BOOL4 v11;
  int v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  LPWebLinkPresentationProperties *v16;
  LPWebLinkPresentationProperties *v17;
  uint8_t v19[16];
  uint8_t buf[16];

  right = a4.right;
  bottom = a4.bottom;
  left = a4.left;
  top = a4.top;
  height = a3.height;
  width = a3.width;
  v11 = -[CKMediaObject transcoderPreviewGenerationFailed](self, "transcoderPreviewGenerationFailed");
  v12 = IMOSLoggingEnabled();
  if (v11)
  {
    if (v12)
    {
      OSLogHandleForIMFoundationCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18DFCD000, v13, OS_LOG_TYPE_INFO, "CKOrderMediaObject: Attempting to generate preview in MobileSMS. transcoderPreviewGenerationFailed = YES", buf, 2u);
      }

    }
    v14 = 0;
  }
  else
  {
    if (v12)
    {
      OSLogHandleForIMFoundationCategory();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v19 = 0;
        _os_log_impl(&dword_18DFCD000, v15, OS_LOG_TYPE_INFO, "Generating thumbnail", v19, 2u);
      }

    }
    if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) != 0)
    {
      -[CKOrderMediaObject presentationPropertiesForWidth:](self, "presentationPropertiesForWidth:", width);
      v16 = (LPWebLinkPresentationProperties *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = self->_presentationProperties;
    }
    v17 = v16;
    +[CKWalletMediaObjectMetadataHandler generateThumbnailFillToSize:contentAlignmentInsets:presentationProperties:](CKWalletMediaObjectMetadataHandler, "generateThumbnailFillToSize:contentAlignmentInsets:presentationProperties:", v16, width, height, top, left, bottom, right);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v14;
}

- (BOOL)supportsPreviewMetadata
{
  return 1;
}

- (NSString)previewMetadataFilenameExtension
{
  return (NSString *)CFSTR("plist");
}

- (id)previewMetadataWithContentsOfURL:(id)a3 error:(id *)a4
{
  return +[CKWalletMediaObjectMetadataHandler previewMetadataWithContentsOfURL:error:](CKWalletMediaObjectMetadataHandler, "previewMetadataWithContentsOfURL:error:", a3, a4);
}

- (BOOL)writePreviewMetadata:(id)a3 toURL:(id)a4 error:(id *)a5
{
  return +[CKWalletMediaObjectMetadataHandler writePreviewMetadata:toURL:error:](CKWalletMediaObjectMetadataHandler, "writePreviewMetadata:toURL:error:", a3, a4, a5);
}

- (id)generatePreviewMetadata
{
  _BOOL4 v3;
  int v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  __CFDictionary *v8;
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
  uint64_t v19;
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
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  uint8_t v56[16];
  uint8_t buf[16];

  v3 = -[CKMediaObject transcoderPreviewGenerationFailed](self, "transcoderPreviewGenerationFailed");
  v4 = IMOSLoggingEnabled();
  if (v3)
  {
    if (v4)
    {
      OSLogHandleForIMFoundationCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "CKOrderMediaObject: Attempting to generate preview in MobileSMS. transcoderPreviewGenerationFailed = YES", buf, 2u);
      }

    }
    return 0;
  }
  if (v4)
  {
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v56 = 0;
      _os_log_impl(&dword_18DFCD000, v6, OS_LOG_TYPE_INFO, "Generating metadata", v56, 2u);
    }

  }
  -[CKOrderMediaObject metadata](self, "metadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    return 0;
  v8 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[CKOrderMediaObject metadata](self, "metadata");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "headerImage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[CKOrderMediaObject metadata](self, "metadata");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "headerImage");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "data");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
      CFDictionarySetValue(v8, (const void *)*MEMORY[0x1E0D395D8], v13);

    v14 = (void *)MEMORY[0x1E0CB37E8];
    -[CKOrderMediaObject metadata](self, "metadata");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "headerImage");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "numberWithInt:", objc_msgSend(v16, "kind"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
      CFDictionarySetValue(v8, (const void *)*MEMORY[0x1E0D395E0], v17);

  }
  -[CKOrderMediaObject metadata](self, "metadata");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "backgroundColor");

  if (v19)
  {
    v20 = (void *)MEMORY[0x1E0CEA478];
    -[CKOrderMediaObject metadata](self, "metadata");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "colorWithCGColor:", objc_msgSend(v21, "backgroundColor"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKWalletMediaObjectMetadataHandler colorDictionaryFromColor:](CKWalletMediaObjectMetadataHandler, "colorDictionaryFromColor:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
      CFDictionarySetValue(v8, (const void *)*MEMORY[0x1E0D395A0], v23);

  }
  -[CKOrderMediaObject metadata](self, "metadata");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "primaryText");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    -[CKOrderMediaObject metadata](self, "metadata");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "primaryText");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "text");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (void *)MEMORY[0x1E0CEA478];
    -[CKOrderMediaObject metadata](self, "metadata");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "primaryText");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "colorWithCGColor:", objc_msgSend(v31, "overrideColor"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKWalletMediaObjectMetadataHandler dictionaryRepresentationForText:optionalColor:](CKWalletMediaObjectMetadataHandler, "dictionaryRepresentationForText:optionalColor:", v28, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (v33)
    {
      CFDictionarySetValue(v8, (const void *)*MEMORY[0x1E0D395E8], v33);
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      -[CKOrderMediaObject generatePreviewMetadata].cold.3();
    }

  }
  -[CKOrderMediaObject metadata](self, "metadata");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "secondaryText");
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  if (v35)
  {
    -[CKOrderMediaObject metadata](self, "metadata");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "secondaryText");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "text");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = (void *)MEMORY[0x1E0CEA478];
    -[CKOrderMediaObject metadata](self, "metadata");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "secondaryText");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "colorWithCGColor:", objc_msgSend(v41, "overrideColor"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKWalletMediaObjectMetadataHandler dictionaryRepresentationForText:optionalColor:](CKWalletMediaObjectMetadataHandler, "dictionaryRepresentationForText:optionalColor:", v38, v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    if (v43)
    {
      CFDictionarySetValue(v8, (const void *)*MEMORY[0x1E0D395F0], v43);
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      -[CKOrderMediaObject generatePreviewMetadata].cold.2();
    }

  }
  -[CKOrderMediaObject metadata](self, "metadata");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "tertiaryText");
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  if (v45)
  {
    -[CKOrderMediaObject metadata](self, "metadata");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "tertiaryText");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "text");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = (void *)MEMORY[0x1E0CEA478];
    -[CKOrderMediaObject metadata](self, "metadata");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "tertiaryText");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "colorWithCGColor:", objc_msgSend(v51, "overrideColor"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKWalletMediaObjectMetadataHandler dictionaryRepresentationForText:optionalColor:](CKWalletMediaObjectMetadataHandler, "dictionaryRepresentationForText:optionalColor:", v48, v52);
    v53 = (void *)objc_claimAutoreleasedReturnValue();

    if (v53)
    {
      CFDictionarySetValue(v8, (const void *)*MEMORY[0x1E0D395F8], v53);
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      -[CKOrderMediaObject generatePreviewMetadata].cold.1();
    }

  }
  v54 = (void *)-[__CFDictionary copy](v8, "copy");

  return v54;
}

- (FKOrderMessagesPreviewMetadata)metadata
{
  FKOrderMessagesPreviewMetadata *metadata;
  NSObject *v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_class *v10;
  FKOrderMessagesPreviewMetadata *v11;
  id v12;
  FKOrderMessagesPreviewMetadata *v13;
  int v14;
  NSObject *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  __int128 buf;
  Class (*v23)(uint64_t);
  void *v24;
  uint64_t *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  metadata = self->_metadata;
  if (metadata)
    return metadata;
  if (!-[CKMediaObject transcoderPreviewGenerationFailed](self, "transcoderPreviewGenerationFailed"))
  {
    v6 = (void *)MEMORY[0x1E0C99D50];
    -[CKMediaObject fileURL](self, "fileURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dataWithContentsOfURL:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = 0;
    v19 = &v18;
    v20 = 0x2050000000;
    v9 = (void *)getFKOrderMessagesPreviewMetadataClass_softClass_0;
    v21 = getFKOrderMessagesPreviewMetadataClass_softClass_0;
    if (!getFKOrderMessagesPreviewMetadataClass_softClass_0)
    {
      *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
      *((_QWORD *)&buf + 1) = 3221225472;
      v23 = __getFKOrderMessagesPreviewMetadataClass_block_invoke_0;
      v24 = &unk_1E274A178;
      v25 = &v18;
      __getFKOrderMessagesPreviewMetadataClass_block_invoke_0((uint64_t)&buf);
      v9 = (void *)v19[3];
    }
    v10 = objc_retainAutorelease(v9);
    _Block_object_dispose(&v18, 8);
    v17 = 0;
    v11 = (FKOrderMessagesPreviewMetadata *)objc_msgSend([v10 alloc], "initWithOrderData:workingDirectory:error:", v8, 0, &v17);
    v12 = v17;
    v13 = self->_metadata;
    self->_metadata = v11;

    v14 = IMOSLoggingEnabled();
    if (v12)
    {
      if (v14)
      {
        OSLogHandleForIMFoundationCategory();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v12, "localizedDescription");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(buf) = 138412290;
          *(_QWORD *)((char *)&buf + 4) = v16;
          _os_log_impl(&dword_18DFCD000, v15, OS_LOG_TYPE_INFO, "CKOrderMediaObject: Failed to load preview metadata in-process: %@", (uint8_t *)&buf, 0xCu);

        }
LABEL_18:

      }
    }
    else if (v14)
    {
      OSLogHandleForIMFoundationCategory();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_18DFCD000, v15, OS_LOG_TYPE_INFO, "Unpacked order into metadata", (uint8_t *)&buf, 2u);
      }
      goto LABEL_18;
    }

    metadata = self->_metadata;
    return metadata;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_18DFCD000, v4, OS_LOG_TYPE_INFO, "CKOrderMediaObject: Attempting to load FKOrderMessagesPreviewMetadata. transcoderPreviewGenerationFailed = YES", (uint8_t *)&buf, 2u);
    }

  }
  return (FKOrderMessagesPreviewMetadata *)0;
}

+ (id)_modifyColor:(id)a3 lighten:(BOOL)a4
{
  _QWORD v6[8];
  BOOL v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v10 = 0;
  v11 = 0;
  v8 = 0;
  v9 = 0;
  objc_msgSend(a3, "getHue:saturation:brightness:alpha:", &v11, &v10, &v9, &v8);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __43__CKOrderMediaObject__modifyColor_lighten___block_invoke;
  v6[3] = &__block_descriptor_65_e36___UIColor_16__0__UITraitCollection_8l;
  v7 = a4;
  v6[4] = v10;
  v6[5] = v9;
  v6[6] = v11;
  v6[7] = v8;
  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithDynamicProvider:", v6);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __43__CKOrderMediaObject__modifyColor_lighten___block_invoke(uint64_t a1, void *a2)
{
  double v3;
  uint64_t v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;

  v3 = *(double *)(a1 + 32);
  v4 = objc_msgSend(a2, "userInterfaceStyle");
  v5 = *(double *)(a1 + 40);
  if (v4 == 2)
  {
    v3 = *(double *)(a1 + 32);
    if (*(_BYTE *)(a1 + 64))
    {
      v6 = v5 + 0.13;
      v3 = v3 + 0.03;
      goto LABEL_9;
    }
    v7 = -0.07;
  }
  else if (*(_BYTE *)(a1 + 64))
  {
    v7 = 0.03;
  }
  else
  {
    v7 = -0.1;
  }
  v6 = v5 + v7;
LABEL_9:
  if (v6 < 0.0)
    v6 = 0.0;
  v8 = fmin(v6, 1.0);
  if (v3 >= 0.0)
    v9 = v3;
  else
    v9 = 0.0;
  return objc_msgSend(MEMORY[0x1E0CEA478], "colorWithHue:saturation:brightness:alpha:", *(double *)(a1 + 48), fmin(v9, 1.0), v8, *(double *)(a1 + 56));
}

- (id)presentationPropertiesForWidth:(double)a3
{
  LPWebLinkPresentationProperties *presentationProperties;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  NSObject *v11;
  LPWebLinkPresentationProperties *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  objc_class *v22;
  id v23;
  id v24;
  id v25;
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
  LPWebLinkPresentationProperties *v38;
  int v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  presentationProperties = self->_presentationProperties;
  if (presentationProperties)
  {
LABEL_18:
    v12 = presentationProperties;
    return v12;
  }
  -[CKOrderMediaObject previewMetadata](self, "previewMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0CC1238]);
    objc_msgSend(v7, "setStyle:", 53);
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D395D8]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D395E0]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = objc_msgSend(v9, "intValue");
    else
      v10 = 0;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CEA638], "ckImageWithData:", v8);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "_paddedImage:imageType:bubbleWidth:", v13, v10, a3);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC1178]), "initWithPlatformImage:", v14);
      objc_msgSend(v7, "setImage:", v15);

    }
    v16 = *MEMORY[0x1E0D395A0];
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D395A0]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      +[CKWalletMediaObjectMetadataHandler colorFromDictionaryRepresentation:](CKWalletMediaObjectMetadataHandler, "colorFromDictionaryRepresentation:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "setBackgroundColor:", v19);
      if (v10 == 1)
      {
        objc_msgSend(v19, "_luminance");
        objc_msgSend((id)objc_opt_class(), "_modifyColor:lighten:", v19, v20 > 0.5);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setBackgroundColor:", v21);

      }
      v22 = (objc_class *)MEMORY[0x1E0CC1188];
      v23 = v19;
      v24 = objc_alloc_init(v22);
      objc_msgSend(v24, "setBackgroundColor:", v23);

      objc_msgSend(v7, "setImageProperties:", v24);
    }
    v25 = objc_alloc_init(MEMORY[0x1E0CC1150]);
    objc_msgSend(v7, "setCaptionBar:", v25);

    v26 = (void *)objc_opt_class();
    objc_msgSend(v7, "captionBar");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "top");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D395E8]);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "_updatePresentationPropertiesForRow:representation:", v28, v29);

    v30 = (void *)objc_opt_class();
    objc_msgSend(v7, "captionBar");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "bottom");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D395F0]);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "_updatePresentationPropertiesForRow:representation:", v32, v33);

    v34 = (void *)objc_opt_class();
    objc_msgSend(v7, "captionBar");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "belowBottom");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D395F8]);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "_updatePresentationPropertiesForRow:representation:", v36, v37);

    v38 = self->_presentationProperties;
    self->_presentationProperties = (LPWebLinkPresentationProperties *)v7;

    presentationProperties = self->_presentationProperties;
    goto LABEL_18;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v40 = 138412290;
      v41 = v6;
      _os_log_impl(&dword_18DFCD000, v11, OS_LOG_TYPE_INFO, "CKOrderMediaObject: Invalid metadata file %@", (uint8_t *)&v40, 0xCu);
    }

  }
  v12 = 0;
  return v12;
}

- (id)presentationPropertiesForReplyPreview
{
  void *v2;
  id v3;
  id v4;
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
  NSObject *v22;
  int v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  -[CKOrderMediaObject previewMetadata](self, "previewMetadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0CC1238]);
    v4 = objc_alloc_init(MEMORY[0x1E0CC1150]);
    objc_msgSend(v3, "setCaptionBar:", v4);

    v5 = (void *)objc_opt_class();
    objc_msgSend(v3, "captionBar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "top");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0D395E8]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_setTextForPresentationRow:representation:", v7, v8);

    v9 = (void *)objc_opt_class();
    objc_msgSend(v3, "captionBar");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bottom");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0D395F0]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_setTextForPresentationRow:representation:", v11, v12);

    v13 = (void *)objc_opt_class();
    objc_msgSend(v3, "captionBar");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "belowBottom");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0D395F8]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_setTextForPresentationRow:representation:", v15, v16);

    objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0D395D8]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CEA638], "imageWithData:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        +[CKWalletMediaObjectMetadataHandler replyPreviewIconFromFullImage:](CKWalletMediaObjectMetadataHandler, "replyPreviewIconFromFullImage:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC1178]), "initWithPlatformImage:", v19);
        objc_msgSend(v3, "captionBar");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setLeadingIcon:", v20);

      }
    }

  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        v24 = 138412290;
        v25 = v2;
        _os_log_impl(&dword_18DFCD000, v22, OS_LOG_TYPE_INFO, "CKOrderMediaObject: Invalid metadata file %@", (uint8_t *)&v24, 0xCu);
      }

    }
    v3 = 0;
  }

  return v3;
}

+ (void)_updatePresentationPropertiesForRow:(id)a3 representation:(id)a4
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v5 = a3;
  if (a4)
  {
    v6 = *MEMORY[0x1E0D39608];
    v13 = v5;
    v7 = a4;
    objc_msgSend(v7, "objectForKeyedSubscript:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "leading");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setText:", v8);

    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D39600]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      +[CKWalletMediaObjectMetadataHandler colorFromDictionaryRepresentation:](CKWalletMediaObjectMetadataHandler, "colorFromDictionaryRepresentation:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "leading");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setColor:", v11);

    }
    v5 = v13;
  }

}

+ (void)_setTextForPresentationRow:(id)a3 representation:(id)a4
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;

  if (a4)
  {
    v5 = *MEMORY[0x1E0D39608];
    v6 = a3;
    objc_msgSend(a4, "objectForKeyedSubscript:", v5);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "leading");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "setText:", v8);
  }
}

+ (id)_paddedImage:(id)a3 imageType:(unsigned __int8)a4 bubbleWidth:(double)a5
{
  int v6;
  id v7;
  NSObject *v8;
  id v9;
  double v10;
  void *v11;
  _DWORD v13[2];
  uint64_t v14;

  v6 = a4;
  v14 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (v6 == 1)
  {
    v10 = (a5 + -100.0) * 0.5;
    if (v10 < 20.0)
      v10 = 20.0;
    +[CKWalletMediaObjectMetadataHandler paddedImage:horizontalPadding:verticalPadding:](CKWalletMediaObjectMetadataHandler, "paddedImage:horizontalPadding:verticalPadding:", v7, v10);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v6 && IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v13[0] = 67109120;
        v13[1] = v6;
        _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_INFO, "CKOrderMediaObject: Invalid image type %d. Not applying padding.", (uint8_t *)v13, 8u);
      }

    }
    v9 = v7;
  }
  v11 = v9;

  return v11;
}

- (void)setMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_metadata, a3);
}

- (NSURL)overrideMetadataProperties
{
  return self->_overrideMetadataProperties;
}

- (void)setOverrideMetadataProperties:(id)a3
{
  objc_storeStrong((id *)&self->_overrideMetadataProperties, a3);
}

- (LPWebLinkPresentationProperties)presentationProperties
{
  return self->_presentationProperties;
}

- (void)setPresentationProperties:(id)a3
{
  objc_storeStrong((id *)&self->_presentationProperties, a3);
}

- (NSURL)overrideFileURL
{
  return self->_overrideFileURL;
}

- (void)setOverrideFileURL:(id)a3
{
  objc_storeStrong((id *)&self->_overrideFileURL, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideFileURL, 0);
  objc_storeStrong((id *)&self->_presentationProperties, 0);
  objc_storeStrong((id *)&self->_overrideMetadataProperties, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
}

- (void)generatePreviewMetadata
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_6(&dword_18DFCD000, MEMORY[0x1E0C81028], v0, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

@end
