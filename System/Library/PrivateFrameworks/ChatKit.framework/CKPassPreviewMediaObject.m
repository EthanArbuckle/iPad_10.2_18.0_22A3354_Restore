@implementation CKPassPreviewMediaObject

+ (BOOL)isSupported
{
  return 1;
}

- (LPWebLinkPresentationProperties)presentationProperties
{
  LPWebLinkPresentationProperties *presentationProperties;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v15;
  id v16;
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
  LPWebLinkPresentationProperties *v29;
  void *v30;
  void *v31;
  void *v32;
  uint8_t buf[4];
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  presentationProperties = self->_presentationProperties;
  if (presentationProperties)
    return presentationProperties;
  -[CKPassPreviewMediaObject previewMetadata](self, "previewMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0CC1238]);
    objc_msgSend(v5, "setStyle:", 44);
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D395D8]);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CEA638], "ckImageWithData:", v32);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      +[CKWalletMediaObjectMetadataHandler paddedImage:horizontalPadding:verticalPadding:](CKWalletMediaObjectMetadataHandler, "paddedImage:horizontalPadding:verticalPadding:", v6, 20.0, 20.0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC1178]), "initWithPlatformImage:", v7);
      objc_msgSend(v5, "setImage:", v8);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D395A0]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKWalletMediaObjectMetadataHandler colorFromDictionaryRepresentation:](CKWalletMediaObjectMetadataHandler, "colorFromDictionaryRepresentation:", v9);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "setBackgroundColor:", v31);
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D395A8]);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CEA638], "ckImageWithData:", v30);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC1178]), "initWithPlatformImage:", v10);
      objc_msgSend(v5, "setBackgroundImage:", v11);

      objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 0.0, 0.05);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "_darkenColor:", v31);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v15 = objc_alloc_init(MEMORY[0x1E0CC1188]);
    objc_msgSend(v15, "setBackgroundColor:", v12);
    objc_msgSend(v5, "setImageProperties:", v15);
    v16 = objc_alloc_init(MEMORY[0x1E0CC1150]);
    objc_msgSend(v5, "setCaptionBar:", v16);

    v17 = (void *)objc_opt_class();
    objc_msgSend(v5, "captionBar");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "top");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D395E8]);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "_updatePresentationPropertiesForRow:representation:", v19, v20);

    v21 = (void *)objc_opt_class();
    objc_msgSend(v5, "captionBar");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "bottom");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D395F0]);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "_updatePresentationPropertiesForRow:representation:", v23, v24);

    v25 = (void *)objc_opt_class();
    objc_msgSend(v5, "captionBar");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "belowBottom");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D395F8]);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "_updatePresentationPropertiesForRow:representation:", v27, v28);

    v29 = self->_presentationProperties;
    self->_presentationProperties = (LPWebLinkPresentationProperties *)v5;

    presentationProperties = self->_presentationProperties;
    return presentationProperties;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v34 = v4;
      _os_log_impl(&dword_18DFCD000, v13, OS_LOG_TYPE_INFO, "CKPassPreviewMediaObject: Invalid metadata file %@", buf, 0xCu);
    }

  }
  return (LPWebLinkPresentationProperties *)0;
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
  NSObject *v21;
  int v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  -[CKPassPreviewMediaObject previewMetadata](self, "previewMetadata");
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

    objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0D395D0]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CEA638], "imageWithData:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC1178]), "initWithPlatformImage:", v18);
        objc_msgSend(v3, "captionBar");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setLeadingIcon:", v19);

      }
    }

  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        v23 = 138412290;
        v24 = v2;
        _os_log_impl(&dword_18DFCD000, v21, OS_LOG_TYPE_INFO, "CKPassPreviewMediaObject: Invalid metadata file %@", (uint8_t *)&v23, 0xCu);
      }

    }
    v3 = 0;
  }

  return v3;
}

- (id)_initWithOverrideFileURL:(id)a3
{
  id v4;
  CKPassPreviewMediaObject *v5;
  CKPassPreviewMediaObject *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CKPassPreviewMediaObject;
  v5 = -[CKPassPreviewMediaObject init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[CKPassPreviewMediaObject setOverrideFileURL:](v5, "setOverrideFileURL:", v4);

  return v6;
}

- (BOOL)generatePreviewOutOfProcess
{
  objc_super v4;

  if (-[CKMediaObject isFromMe](self, "isFromMe"))
    return 0;
  v4.receiver = self;
  v4.super_class = (Class)CKPassPreviewMediaObject;
  return -[CKMediaObject generatePreviewOutOfProcess](&v4, sel_generatePreviewOutOfProcess);
}

- (id)fileURL
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  objc_super v8;

  -[CKPassPreviewMediaObject overrideFileURL](self, "overrideFileURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)CKPassPreviewMediaObject;
    -[CKMediaObject fileURL](&v8, sel_fileURL);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (id)previewMetadata
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  objc_super v8;

  -[CKPassPreviewMediaObject overrideMetadataProperties](self, "overrideMetadataProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)CKPassPreviewMediaObject;
    -[CKMediaObject previewMetadata](&v8, sel_previewMetadata);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
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
  if (-[CKPassbookMediaObject isSupported](self, "isSupported")
    && (-[CKPassPreviewMediaObject previewMetadata](self, "previewMetadata"),
        (v7 = objc_claimAutoreleasedReturnValue()) != 0)
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
    v12.super_class = (Class)CKPassPreviewMediaObject;
    -[CKMediaObject balloonViewClassForWidth:orientation:](&v12, sel_balloonViewClassForWidth_orientation_, v4, a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (Class)v10;
}

- (Class)previewBalloonViewClass
{
  if (-[CKPassbookMediaObject isSupported](self, "isSupported"))
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
  uint8_t v17[16];
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
        _os_log_impl(&dword_18DFCD000, v13, OS_LOG_TYPE_INFO, "CKPassPreviewMediaObject: Attempting to generate preview in MobileSMS. transcoderPreviewGenerationFailed = YES", buf, 2u);
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
        *(_WORD *)v17 = 0;
        _os_log_impl(&dword_18DFCD000, v15, OS_LOG_TYPE_INFO, "Generating thumbnail", v17, 2u);
      }

    }
    +[CKWalletMediaObjectMetadataHandler generateThumbnailFillToSize:contentAlignmentInsets:presentationProperties:](CKWalletMediaObjectMetadataHandler, "generateThumbnailFillToSize:contentAlignmentInsets:presentationProperties:", self->_presentationProperties, width, height, top, left, bottom, right);
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
  NSObject *v7;
  void *v8;
  __CFDictionary *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  uint8_t v45[16];
  uint8_t v46[16];
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
        _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "CKPassPreviewMediaObject: Attempting to generate preview in MobileSMS. transcoderPreviewGenerationFailed = YES", buf, 2u);
      }

    }
    return 0;
  }
  else
  {
    if (v4)
    {
      OSLogHandleForIMFoundationCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v46 = 0;
        _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_INFO, "Generating metadata", v46, 2u);
      }

    }
    -[CKPassPreviewMediaObject passPreview](self, "passPreview");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      v10 = (void *)objc_opt_class();
      objc_msgSend(v8, "backgroundColor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "_colorFromColorString:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[CKWalletMediaObjectMetadataHandler colorDictionaryFromColor:](CKWalletMediaObjectMetadataHandler, "colorDictionaryFromColor:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        CFDictionarySetValue(v9, (const void *)*MEMORY[0x1E0D395A0], v13);
      }
      else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        -[CKPassPreviewMediaObject generatePreviewMetadata].cold.4();
      }

      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(objc_retainAutorelease(v8), "backgroundImage");
        v16 = (id)IMCreatePNGImageDataFromCGImageRef();
        if (v16)
        {
          v17 = v16;
          CFDictionarySetValue(v9, (const void *)*MEMORY[0x1E0D395A8], v16);

        }
      }
      objc_msgSend(v8, "primaryText");
      v18 = objc_claimAutoreleasedReturnValue();
      if (v18)
      {
        v19 = (void *)v18;
        objc_msgSend(v8, "primaryColor");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (v20)
        {
          objc_msgSend(v8, "primaryText");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = (void *)objc_opt_class();
          objc_msgSend(v8, "primaryColor");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "_colorFromColorString:", v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          +[CKWalletMediaObjectMetadataHandler dictionaryRepresentationForText:color:](CKWalletMediaObjectMetadataHandler, "dictionaryRepresentationForText:color:", v21, v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          if (v25)
          {
            CFDictionarySetValue(v9, (const void *)*MEMORY[0x1E0D395E8], v25);
          }
          else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            -[CKPassPreviewMediaObject generatePreviewMetadata].cold.3();
          }

        }
      }
      objc_msgSend(v8, "secondaryText");
      v26 = objc_claimAutoreleasedReturnValue();
      if (v26)
      {
        v27 = (void *)v26;
        objc_msgSend(v8, "secondaryColor");
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        if (v28)
        {
          objc_msgSend(v8, "secondaryText");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = (void *)objc_opt_class();
          objc_msgSend(v8, "secondaryColor");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "_colorFromColorString:", v31);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          +[CKWalletMediaObjectMetadataHandler dictionaryRepresentationForText:color:](CKWalletMediaObjectMetadataHandler, "dictionaryRepresentationForText:color:", v29, v32);
          v33 = (void *)objc_claimAutoreleasedReturnValue();

          if (v33)
          {
            CFDictionarySetValue(v9, (const void *)*MEMORY[0x1E0D395F0], v33);
          }
          else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            -[CKPassPreviewMediaObject generatePreviewMetadata].cold.2();
          }

        }
      }
      objc_msgSend(v8, "tertiaryText");
      v34 = objc_claimAutoreleasedReturnValue();
      if (v34)
      {
        v35 = (void *)v34;
        objc_msgSend(v8, "tertiaryColor");
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        if (v36)
        {
          objc_msgSend(v8, "tertiaryText");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = (void *)objc_opt_class();
          objc_msgSend(v8, "tertiaryColor");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "_colorFromColorString:", v39);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          +[CKWalletMediaObjectMetadataHandler dictionaryRepresentationForText:color:](CKWalletMediaObjectMetadataHandler, "dictionaryRepresentationForText:color:", v37, v40);
          v41 = (void *)objc_claimAutoreleasedReturnValue();

          if (v41)
          {
            CFDictionarySetValue(v9, (const void *)*MEMORY[0x1E0D395F8], v41);
          }
          else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            -[CKPassPreviewMediaObject generatePreviewMetadata].cold.1();
          }

        }
      }
      v42 = objc_retainAutorelease(v8);
      objc_msgSend(v42, "image");
      v43 = (void *)IMCreatePNGImageDataFromCGImageRef();
      if (v43)
        CFDictionarySetValue(v9, (const void *)*MEMORY[0x1E0D395D8], v43);
      objc_msgSend(objc_retainAutorelease(v42), "icon");
      v44 = (void *)IMCreatePNGImageDataFromCGImageRef();
      if (v44)
        CFDictionarySetValue(v9, (const void *)*MEMORY[0x1E0D395D0], v44);

      v15 = (void *)-[__CFDictionary copy](v9, "copy");
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v45 = 0;
          _os_log_impl(&dword_18DFCD000, v14, OS_LOG_TYPE_INFO, "CKPassPreviewMediaObject: Unable to generate pass preview", v45, 2u);
        }

      }
      v15 = 0;
    }

    return v15;
  }
}

+ (id)_colorFromColorString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  if (_colorFromColorString__onceToken != -1)
    dispatch_once(&_colorFromColorString__onceToken, &__block_literal_global_205);
  objc_msgSend((id)_colorFromColorString__sPKPassClass, "colorFromString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithCGColor:", objc_msgSend(objc_retainAutorelease(v4), "CGColor"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

uint64_t __50__CKPassPreviewMediaObject__colorFromColorString___block_invoke()
{
  uint64_t result;

  result = MEMORY[0x193FF3C18](CFSTR("PKColor"), CFSTR("PassKitCore"));
  _colorFromColorString__sPKPassClass = result;
  return result;
}

+ (void)_updatePresentationPropertiesForRow:(id)a3 representation:(id)a4
{
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  if (a4)
  {
    v6 = *MEMORY[0x1E0D39600];
    v7 = a4;
    v8 = a3;
    objc_msgSend(v7, "objectForKeyedSubscript:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKWalletMediaObjectMetadataHandler colorFromDictionaryRepresentation:](CKWalletMediaObjectMetadataHandler, "colorFromDictionaryRepresentation:", v9);
    v11 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D39608]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "_updatePresentationPropertiesForRow:text:color:", v8, v10, v11);
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

+ (void)_updatePresentationPropertiesForRow:(id)a3 text:(id)a4 color:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  objc_msgSend(v9, "leading");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setText:", v8);

  objc_msgSend(v9, "leading");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setColor:", v7);
}

+ (id)_darkenColor:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;

  v7 = 0.0;
  v5 = 0.0;
  v6 = 0.0;
  v4 = 0.0;
  objc_msgSend(a3, "getRed:green:blue:alpha:", &v7, &v6, &v5, &v4);
  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", v7 * 0.8, v6 * 0.8, v5 * 0.8, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (PKPassSecurePreviewContext)passPreview
{
  NSObject *v3;
  PKPassSecurePreviewContext *passPreview;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSURL *v9;
  void *v10;
  id v11;
  NSURL *v12;
  uint64_t MessagesPreview;
  PKPassSecurePreviewContext **p_passPreview;
  PKPassSecurePreviewContext *v15;
  NSObject *v17;
  id v18;
  uint8_t buf[4];
  id v20;
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  if (!-[CKMediaObject transcoderPreviewGenerationFailed](self, "transcoderPreviewGenerationFailed"))
  {
    passPreview = self->_passPreview;
    if (!passPreview)
    {
      v5 = (void *)MEMORY[0x1E0C99E98];
      IMSafeTemporaryDirectory();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "path");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = v7;
      v21[1] = CFSTR("PassPreview");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
      v8 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "fileURLWithPathComponents:", v8);
      v9 = (NSURL *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 0;
      LOBYTE(v8) = objc_msgSend(v10, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v9, 1, 0, &v18);
      v11 = v18;

      if ((v8 & 1) == 0)
      {
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v20 = v11;
            _os_log_impl(&dword_18DFCD000, v17, OS_LOG_TYPE_INFO, "CKPassPreviewMediaObject: Failed to create temp directory: %@", buf, 0xCu);
          }

        }
        return (PKPassSecurePreviewContext *)0;
      }
      -[CKPassPreviewMediaObject fileURL](self, "fileURL");
      v12 = (NSURL *)objc_claimAutoreleasedReturnValue();
      MessagesPreview = PKPassSecurePreviewContextCreateMessagesPreview(v12, v9);
      p_passPreview = &self->_passPreview;
      v15 = *p_passPreview;
      *p_passPreview = (PKPassSecurePreviewContext *)MessagesPreview;

      passPreview = *p_passPreview;
    }
    return passPreview;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18DFCD000, v3, OS_LOG_TYPE_INFO, "CKPassPreviewMediaObject: Attempting to load PKPassSecurePreviewContext. transcoderPreviewGenerationFailed = YES", buf, 2u);
    }

  }
  return (PKPassSecurePreviewContext *)0;
}

- (void)setPresentationProperties:(id)a3
{
  objc_storeStrong((id *)&self->_presentationProperties, a3);
}

- (void)setPassPreview:(id)a3
{
  objc_storeStrong((id *)&self->_passPreview, a3);
}

- (NSURL)overrideFileURL
{
  return self->_overrideFileURL;
}

- (void)setOverrideFileURL:(id)a3
{
  objc_storeStrong((id *)&self->_overrideFileURL, a3);
}

- (NSURL)overrideMetadataProperties
{
  return self->_overrideMetadataProperties;
}

- (void)setOverrideMetadataProperties:(id)a3
{
  objc_storeStrong((id *)&self->_overrideMetadataProperties, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideMetadataProperties, 0);
  objc_storeStrong((id *)&self->_overrideFileURL, 0);
  objc_storeStrong((id *)&self->_passPreview, 0);
  objc_storeStrong((id *)&self->_presentationProperties, 0);
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
