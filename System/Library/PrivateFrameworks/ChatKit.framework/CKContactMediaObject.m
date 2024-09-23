@implementation CKContactMediaObject

+ (BOOL)isPreviewable
{
  return 1;
}

+ (id)UTITypes
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = *MEMORY[0x1E0CA5CB0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)metricsCollectorMediaType
{
  return (id)*MEMORY[0x1E0D386B0];
}

+ (id)fallbackFilenamePrefix
{
  return CFSTR("CARD");
}

+ (BOOL)shouldUseTranscoderGeneratedPreviewSize
{
  return 0;
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
    v6 = CFSTR("SUMMARY_ADDRESS_TYPE");
  else
    v6 = CFSTR("SUMMARY_ADDRESS_TYPES");
  objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_1E276D870, CFSTR("ChatKit"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)generatePreviewOutOfProcess
{
  _BOOL4 v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKContactMediaObject;
  v3 = -[CKMediaObject generatePreviewOutOfProcess](&v5, sel_generatePreviewOutOfProcess);
  if (v3)
    LOBYTE(v3) = -[CKContactMediaObject supportsBlastDoor](self, "supportsBlastDoor");
  return v3;
}

- (int)mediaType
{
  return 4;
}

- (Class)balloonViewClass
{
  void *v2;
  void *v3;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contactBalloonViewClass");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v3;
}

- (Class)previewBalloonViewClass
{
  void *v2;
  void *v3;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contactBalloonViewClass");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v3;
}

- (Class)placeholderBalloonViewClass
{
  void *v2;
  void *v3;

  if (-[CKMediaObject isFromMe](self, "isFromMe"))
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "contactBalloonViewClass");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_opt_class();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (Class)v3;
}

- (BOOL)supportsBlastDoor
{
  NSObject *v2;
  uint8_t v4[16];

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_18DFCD000, v2, OS_LOG_TYPE_INFO, "Blastdoor is support for vcards", v4, 2u);
    }

  }
  return 1;
}

- (id)title
{
  void *v3;
  void *v4;
  int v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  objc_super v17;

  if (-[CKContactMediaObject generatePreviewOutOfProcess](self, "generatePreviewOutOfProcess"))
  {
    -[CKContactMediaObject contactMediaInfo](self, "contactMediaInfo");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "useSingleLineForContactVCardNames");

      if (v5)
        v6 = CFSTR("contactFormatterTitle");
      else
        v6 = CFSTR("contactNameTitle");
      objc_msgSend(v3, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("organizationNameTitle"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v8)
        goto LABEL_20;
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("organizationNameTitle"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_19;
    }
LABEL_12:
    v7 = 0;
    goto LABEL_20;
  }
  -[CKContactMediaObject vCardSummary](self, "vCardSummary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v10;
  if (!v10 || !objc_msgSend(v10, "contactCount"))
    goto LABEL_12;
  objc_msgSend(v3, "avatarContacts");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "useSingleLineForContactVCardNames");

  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0C97218], "stringFromContact:style:", v7, 0);
    v14 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (objc_msgSend(MEMORY[0x1E0C97218], "nameOrderForContact:", v7) == 1)
      objc_msgSend(v7, "givenName");
    else
      objc_msgSend(v7, "familyName");
    v14 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v14;
  if (objc_msgSend(v7, "contactType") == 1)
  {
    objc_msgSend(v7, "organizationName");
    v15 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v15;
  }
LABEL_19:

  v7 = v9;
LABEL_20:

  if (!v7)
  {
    v17.receiver = self;
    v17.super_class = (Class)CKContactMediaObject;
    -[CKMediaObject title](&v17, sel_title);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

- (id)icon
{
  void *v3;
  void *v4;
  objc_super v6;

  if (-[CKMediaObject shouldSuppressPreview](self, "shouldSuppressPreview")
    || (+[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v3, "contactImageSize"),
        -[CKContactMediaObject vCardImageOfSize:](self, "vCardImageOfSize:"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v3,
        !v4))
  {
    v6.receiver = self;
    v6.super_class = (Class)CKContactMediaObject;
    -[CKMediaObject icon](&v6, sel_icon);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (id)subtitle
{
  void *v3;
  void *v4;
  int v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  void *v14;
  int v15;

  if (-[CKContactMediaObject generatePreviewOutOfProcess](self, "generatePreviewOutOfProcess"))
  {
    -[CKContactMediaObject contactMediaInfo](self, "contactMediaInfo");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "useSingleLineForContactVCardNames");

      if (v5)
        v6 = CFSTR("organizationNameSubtitle");
      else
        v6 = CFSTR("contactNameSubtitle");
      objc_msgSend(v3, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    }
    goto LABEL_11;
  }
  -[CKContactMediaObject vCardSummary](self, "vCardSummary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v8;
  if (!v8 || !objc_msgSend(v8, "contactCount"))
  {
LABEL_11:
    v7 = 0;
    goto LABEL_17;
  }
  objc_msgSend(v3, "avatarContacts");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "useSingleLineForContactVCardNames");

  if (v12)
  {
    objc_msgSend(v10, "organizationName");
    v13 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (objc_msgSend(MEMORY[0x1E0C97218], "nameOrderForContact:", v10) == 1)
      objc_msgSend(v10, "familyName");
    else
      objc_msgSend(v10, "givenName");
    v13 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v13;

LABEL_17:
  if (v7)
  {
    -[CKContactMediaObject title](self, "title");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isEqualToString:", v7);

    if (v15)
    {

      v7 = 0;
    }
  }
  return v7;
}

- (CGSize)bbSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contactImageSize");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (id)generateThumbnailForWidth:(double)a3 orientation:(char)a4
{
  uint64_t v4;
  void *v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  objc_super v13;

  v4 = a4;
  if (-[CKContactMediaObject mediaType](self, "mediaType") == 4)
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "contactImageSize");
    v9 = v8;

    v10 = fmin(v9, a3);
    -[CKContactMediaObject vCardImageOfSize:](self, "vCardImageOfSize:", v10, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)CKContactMediaObject;
    -[CKMediaObject generateThumbnailForWidth:orientation:](&v13, sel_generateThumbnailForWidth_orientation_, v4, a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v11;
}

- (id)previewItemURL
{
  void *v3;

  if (CKIsRunningInMacCatalyst())
  {
    -[CKMediaObject fileURL](self, "fileURL");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)previewItemTitle
{
  void *v2;
  void *v3;

  CKFrameworkBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("SUMMARY_ADDRESS_TYPE"), &stru_1E276D870, CFSTR("ChatKit"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)contactCardPayloadFileURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  -[CKMediaObject fileURL](self, "fileURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  IMPreviewCachesDirectoryWithAttachmentURL();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKMediaObject fileURL](self, "fileURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lastPathComponent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "URLByAppendingPathComponent:isDirectory:", v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "URLByAppendingPathExtension:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)previewDispatchCache
{
  return +[CKPreviewDispatchCache transcriptPreviewCache](CKPreviewDispatchCache, "transcriptPreviewCache");
}

- (id)_transcodeControllerSharedInstance
{
  return (id)objc_msgSend(MEMORY[0x1E0D39CC0], "sharedInstance");
}

- (unint64_t)oopPreviewRequestBudget
{
  return 2;
}

- (void)generateOOPPreview
{
  void *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  _QWORD v15[5];
  _QWORD v16[5];
  id v17;
  id v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;
  uint8_t v22[4];
  const char *v23;
  __int16 v24;
  void *v25;
  __int128 buf;
  __int128 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  -[CKContactMediaObject previewCacheKey](self, "previewCacheKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v3;
      _os_log_impl(&dword_18DFCD000, v4, OS_LOG_TYPE_INFO, "Request to generate OOP preview with key %@", (uint8_t *)&buf, 0xCu);
    }

  }
  -[CKContactMediaObject previewDispatchCache](self, "previewDispatchCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isGeneratingPreviewForKey:", v3) & 1) != 0)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v3;
        _os_log_impl(&dword_18DFCD000, v6, OS_LOG_TYPE_INFO, "Already generating OOP preview for key %@", (uint8_t *)&buf, 0xCu);
      }

    }
    goto LABEL_19;
  }
  v7 = objc_alloc_init(MEMORY[0x1E0D36AE8]);
  objc_msgSend(v7, "startTimingForKey:", CFSTR("OOPPreviewGeneration"));
  v28 = 0;
  buf = 0u;
  v27 = 0u;
  IMClientPreviewConstraints();
  -[CKMediaObject fileURL](self, "fileURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKMediaObject previewFilenameExtension](self, "previewFilenameExtension");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  IMAttachmentPreviewFileURL();
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
LABEL_13:

    goto LABEL_19;
  }
  -[CKContactMediaObject setOopPreviewRequestCount:](self, "setOopPreviewRequestCount:", -[CKContactMediaObject oopPreviewRequestCount](self, "oopPreviewRequestCount") + 1);
  v11 = -[CKContactMediaObject oopPreviewRequestCount](self, "oopPreviewRequestCount");
  if (v11 < -[CKContactMediaObject oopPreviewRequestBudget](self, "oopPreviewRequestBudget"))
  {
    v12 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __42__CKContactMediaObject_generateOOPPreview__block_invoke;
    v16[3] = &unk_1E274F960;
    v16[4] = self;
    v17 = v10;
    v19 = buf;
    v20 = v27;
    v21 = v28;
    v18 = v7;
    v15[0] = v12;
    v15[1] = 3221225472;
    v15[2] = __42__CKContactMediaObject_generateOOPPreview__block_invoke_88;
    v15[3] = &unk_1E274A208;
    v15[4] = self;
    objc_msgSend(v5, "enqueueGenerationBlock:completion:withPriority:forKey:", v16, v15, 0, v3);

    goto LABEL_13;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      -[CKMediaObject transferGUID](self, "transferGUID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v22 = 136315394;
      v23 = "-[CKContactMediaObject generateOOPPreview]";
      v24 = 2112;
      v25 = v14;
      _os_log_impl(&dword_18DFCD000, v13, OS_LOG_TYPE_INFO, "%s request budget exhausted for %@", v22, 0x16u);

    }
  }

LABEL_19:
}

uint64_t __42__CKContactMediaObject_generateOOPPreview__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  __int128 v8;
  NSObject *v9;
  uint64_t v10;
  _OWORD v12[2];
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "senderContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_transcodeControllerSharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "fileURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 40);
  v8 = *(_OWORD *)(a1 + 72);
  v12[0] = *(_OWORD *)(a1 + 56);
  v12[1] = v8;
  v13 = *(_QWORD *)(a1 + 88);
  objc_msgSend(v5, "generatePreview:previewURL:senderContext:constraints:completionBlock:blockUntilReply:", v6, v7, v4, v12, &__block_literal_global_67, 1);

  objc_msgSend(*(id *)(a1 + 48), "stopTimingForKey:", CFSTR("OOPPreviewGeneration"));
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = *(_QWORD *)(a1 + 48);
      LODWORD(v12[0]) = 138412290;
      *(_QWORD *)((char *)v12 + 4) = v10;
      _os_log_impl(&dword_18DFCD000, v9, OS_LOG_TYPE_INFO, "Preview generation timing %@", (uint8_t *)v12, 0xCu);
    }

  }
  return 0;
}

void __42__CKContactMediaObject_generateOOPPreview__block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v4;
  NSObject *v5;
  const __CFString *v6;
  int v7;
  const __CFString *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = CFSTR("NO");
      if (a2)
        v6 = CFSTR("YES");
      v7 = 138412546;
      v8 = v6;
      v9 = 2112;
      v10 = v4;
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "IMTranscoderAgent preview generation completed with success %@ and error %@", (uint8_t *)&v7, 0x16u);
    }

  }
}

void __42__CKContactMediaObject_generateOOPPreview__block_invoke_88(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__CKContactMediaObject_generateOOPPreview__block_invoke_2_89;
  block[3] = &unk_1E274A208;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __42__CKContactMediaObject_generateOOPPreview__block_invoke_2_89(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_18DFCD000, v2, OS_LOG_TYPE_INFO, "Posting preview change notif for OOP generation completion", v4, 2u);
    }

  }
  return objc_msgSend(*(id *)(a1 + 32), "postPreviewDidChangeNotifications");
}

- (NSDictionary)contactMediaInfo
{
  NSDictionary *contactMediaInfo;
  void *v4;
  NSDictionary *v5;
  id v6;
  NSDictionary *v7;
  NSDictionary *v8;
  BOOL v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  id v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  contactMediaInfo = self->_contactMediaInfo;
  if (!contactMediaInfo)
  {
    -[CKContactMediaObject contactCardPayloadFileURL:](self, "contactCardPayloadFileURL:", CFSTR("plist"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfURL:error:", v4, &v15);
    v5 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    v6 = v15;
    v7 = self->_contactMediaInfo;
    self->_contactMediaInfo = v5;

    v8 = self->_contactMediaInfo;
    if (v8)
      v9 = v6 == 0;
    else
      v9 = 0;
    if (v9)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v4, "path");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v17 = v13;
          _os_log_impl(&dword_18DFCD000, v12, OS_LOG_TYPE_INFO, "Successfully loaded contactMediaInfo at: %@", buf, 0xCu);

        }
      }
    }
    else
    {
      self->_contactMediaInfo = 0;

      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v4, "path");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v17 = v11;
          _os_log_impl(&dword_18DFCD000, v10, OS_LOG_TYPE_INFO, "Failed to load contactMediaInfo at: %@", buf, 0xCu);

        }
      }
      -[CKContactMediaObject generateOOPPreview](self, "generateOOPPreview");
    }

    contactMediaInfo = self->_contactMediaInfo;
  }
  return contactMediaInfo;
}

- (CNContactVCardSummary)vCardSummary
{
  CNContactVCardSummary **p_vCardSummary;
  CNContactVCardSummary *vCardSummary;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  dispatch_time_t v10;
  intptr_t v11;
  void *v12;
  _QWORD block[4];
  id v14;
  NSObject *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  p_vCardSummary = &self->_vCardSummary;
  vCardSummary = self->_vCardSummary;
  if (!vCardSummary)
  {
    if (self->_vCardParsingFailed)
      return (CNContactVCardSummary *)0;
    v17 = 0;
    v18 = &v17;
    v19 = 0x3032000000;
    v20 = __Block_byref_object_copy__26;
    v21 = __Block_byref_object_dispose__26;
    v22 = 0;
    -[CKMediaObject data](self, "data");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = dispatch_group_create();
      dispatch_group_enter(v7);
      +[CKPreviewDispatchCache mapThumbnailQueue](CKPreviewDispatchCache, "mapThumbnailQueue");
      v8 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __36__CKContactMediaObject_vCardSummary__block_invoke;
      block[3] = &unk_1E274A090;
      v16 = &v17;
      v14 = v6;
      v9 = v7;
      v15 = v9;
      dispatch_async(v8, block);

      v10 = dispatch_time(0, 2000000000);
      v11 = dispatch_group_wait(v9, v10);
      v12 = (void *)v18[5];
      if (!v11 || v12)
        objc_storeStrong((id *)p_vCardSummary, v12);
      else
        self->_vCardParsingFailed = 1;

    }
    _Block_object_dispose(&v17, 8);

    vCardSummary = *p_vCardSummary;
  }
  return vCardSummary;
}

void __36__CKContactMediaObject_vCardSummary__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v2 = *(_QWORD *)(a1 + 32);
  v9 = 0;
  objc_msgSend(MEMORY[0x1E0C972A8], "summaryOfVCard:error:", v2, &v9);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v9;
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

  if (v4)
  {
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = 0;

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

- (id)vCardImageOfSize:(CGSize)a3
{
  double width;
  _BOOL4 v5;
  UIImage *vCardImage;
  void *v7;
  void *v8;
  void *v9;
  UIImage *v10;
  UIImage *v11;
  UIImage *v12;
  int v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  UIImage *v24;
  UIImage *v25;
  NSObject *v26;
  int v28;
  void *v29;
  uint64_t v30;

  width = a3.width;
  v30 = *MEMORY[0x1E0C80C00];
  v5 = -[CKContactMediaObject generatePreviewOutOfProcess](self, "generatePreviewOutOfProcess", a3.width, a3.height);
  vCardImage = self->_vCardImage;
  if (!v5)
  {
    if (!vCardImage)
    {
      -[CKContactMediaObject vCardSummary](self, "vCardSummary");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        -[CKContactMediaObject vCardSummary](self, "vCardSummary");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "contactCount");

        if (v17)
        {
          -[CKContactMediaObject vCardSummary](self, "vCardSummary");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "avatarContacts");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "firstObject");
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          +[CKAddressBook monogrammerWithDiameter:style:useAppTintColor:customFont:](CKAddressBook, "monogrammerWithDiameter:style:useAppTintColor:customFont:", 1, 0, 0, width);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "givenName");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "familyName");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "monogramForPersonWithFirstName:lastName:", v22, v23);
          v24 = (UIImage *)objc_claimAutoreleasedReturnValue();
          v25 = self->_vCardImage;
          self->_vCardImage = v24;

        }
      }
    }
    goto LABEL_18;
  }
  if (!vCardImage)
  {
    -[CKContactMediaObject contactCardPayloadFileURL:](self, "contactCardPayloadFileURL:", CFSTR("ktx"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "path");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA638], "imageWithData:scale:", v9, width / 10.0);
    v10 = (UIImage *)objc_claimAutoreleasedReturnValue();
    v11 = self->_vCardImage;
    self->_vCardImage = v10;

    v12 = self->_vCardImage;
    v13 = IMOSLoggingEnabled();
    if (v12)
    {
      if (v13)
      {
        OSLogHandleForIMFoundationCategory();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          v28 = 138412290;
          v29 = v8;
          _os_log_impl(&dword_18DFCD000, v14, OS_LOG_TYPE_INFO, "Successfully loaded avatar image at: %@", (uint8_t *)&v28, 0xCu);
        }

      }
    }
    else
    {
      if (v13)
      {
        OSLogHandleForIMFoundationCategory();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          v28 = 138412290;
          v29 = v8;
          _os_log_impl(&dword_18DFCD000, v26, OS_LOG_TYPE_INFO, "Failed to load preview avatar image at: %@", (uint8_t *)&v28, 0xCu);
        }

      }
      -[CKContactMediaObject generateOOPPreview](self, "generateOOPPreview");
    }

LABEL_18:
    vCardImage = self->_vCardImage;
  }
  return vCardImage;
}

- (void)setContactMediaInfo:(id)a3
{
  objc_storeStrong((id *)&self->_contactMediaInfo, a3);
}

- (void)setVCardSummary:(id)a3
{
  objc_storeStrong((id *)&self->_vCardSummary, a3);
}

- (unint64_t)oopPreviewRequestCount
{
  return self->_oopPreviewRequestCount;
}

- (void)setOopPreviewRequestCount:(unint64_t)a3
{
  self->_oopPreviewRequestCount = a3;
}

- (BOOL)vCardParsingFailed
{
  return self->_vCardParsingFailed;
}

- (void)setVCardParsingFailed:(BOOL)a3
{
  self->_vCardParsingFailed = a3;
}

- (UIImage)vCardImage
{
  return self->_vCardImage;
}

- (void)setVCardImage:(id)a3
{
  objc_storeStrong((id *)&self->_vCardImage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vCardImage, 0);
  objc_storeStrong((id *)&self->_vCardSummary, 0);
  objc_storeStrong((id *)&self->_contactMediaInfo, 0);
}

@end
