@implementation CKRemoteItemForSending

+ (id)previewQueue
{
  if (previewQueue_onceToken != -1)
    dispatch_once(&previewQueue_onceToken, &__block_literal_global_32);
  return (id)previewQueue__previewQueue;
}

void __38__CKRemoteItemForSending_previewQueue__block_invoke()
{
  id v0;
  void *v1;
  uint64_t v2;
  id v3;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3828]);
  v1 = (void *)previewQueue__previewQueue;
  previewQueue__previewQueue = (uint64_t)v0;

  objc_msgSend((id)previewQueue__previewQueue, "setQualityOfService:", 33);
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v3, "processorCount");
  objc_msgSend((id)previewQueue__previewQueue, "setMaxConcurrentOperationCount:", 2 * v2);

}

+ (BOOL)hasAppendedVideo:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "pathExtension");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D75A78]);

  return v4;
}

- (BOOL)isAttachmentTooLarge:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  unint64_t v16;
  char v17;
  char IsSupportedForTranscodeOnSend;
  char v19;
  void *v20;
  void *v21;

  v3 = a3;
  if (CKIsRunningInMacCatalyst())
  {
    objc_msgSend(v3, "lastPathComponent");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    IMUTITypeForFilename();
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = *MEMORY[0x1E0C99998];
    v7 = *MEMORY[0x1E0C99CF0];
    v8 = *MEMORY[0x1E0C99BB8];
    v9 = *MEMORY[0x1E0C99A48];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", *MEMORY[0x1E0C99998], *MEMORY[0x1E0C99CF0], *MEMORY[0x1E0C99BB8], *MEMORY[0x1E0C99A48], 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "resourceValuesForKeys:error:", v10, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "objectForKey:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v10) = objc_msgSend(v12, "BOOLValue");

    if ((_DWORD)v10)
    {
      objc_msgSend(v11, "objectForKey:", v7);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKey:", v8);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v13, "unsignedIntegerValue");
      v16 = v15 - objc_msgSend(v14, "unsignedIntegerValue");

    }
    else
    {
      objc_msgSend(v11, "objectForKey:", v6);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v13, "unsignedIntegerValue");
    }

    IsSupportedForTranscodeOnSend = IMUTITypeIsSupportedForTranscodeOnSend();
    if (v16 < 0x6400001)
      v19 = 1;
    else
      v19 = IsSupportedForTranscodeOnSend;
    if ((v19 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", v3, CFSTR("kCKTransferFileTooLargeAttachmentURLKey"), 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "postNotificationName:object:userInfo:", CFSTR("CKTransferFileTooLargeNotification"), 0, v20);

    }
    v17 = v19 ^ 1;

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (CKRemoteItemForSending)initWithAttachmentURL:(id)a3 description:(id)a4 previewImage:(id)a5 blockOnPreviewCreation:(BOOL)a6
{
  _BOOL4 v6;
  id v11;
  id v12;
  id v13;
  CKRemoteItemForSending *v14;
  dispatch_semaphore_t v15;
  OS_dispatch_semaphore *previewCreationSemaphore;
  NSObject *v17;
  _BOOL4 v18;
  const __CFString *v19;
  NSURL *v20;
  NSURL *appendedVideoURL;
  void *v22;
  void *v23;
  _BOOL4 v24;
  void *v25;
  void *v26;
  uint64_t v27;
  NSURL *attachmentURL;
  void *v29;
  void *v30;
  uint64_t v31;
  NSURL *v32;
  NSObject *v33;
  NSURL *v34;
  NSURL *v35;
  NSURL *appendedBundleURL;
  NSObject *v37;
  NSURL *v38;
  void *v39;
  CKRemoteItemForSending *v40;
  objc_super v42;
  uint8_t buf[4];
  const __CFString *v44;
  __int16 v45;
  NSURL *v46;
  __int16 v47;
  void *v48;
  uint64_t v49;

  v6 = a6;
  v49 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v42.receiver = self;
  v42.super_class = (Class)CKRemoteItemForSending;
  v14 = -[CKRemoteItemForSending init](&v42, sel_init);
  if (!v14)
    goto LABEL_29;
  if (v6)
  {
    v15 = dispatch_semaphore_create(0);
    previewCreationSemaphore = v14->_previewCreationSemaphore;
    v14->_previewCreationSemaphore = (OS_dispatch_semaphore *)v15;

  }
  if (!-[CKRemoteItemForSending isAttachmentTooLarge:](v14, "isAttachmentTooLarge:", v11))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        v18 = +[CKRemoteItemForSending hasAppendedVideo:](CKRemoteItemForSending, "hasAppendedVideo:", v11);
        v19 = CFSTR("NO");
        if (v18)
          v19 = CFSTR("YES");
        *(_DWORD *)buf = 138412290;
        v44 = v19;
        _os_log_impl(&dword_18DFCD000, v17, OS_LOG_TYPE_INFO, "has appended video %@", buf, 0xCu);
      }

    }
    if (!+[CKRemoteItemForSending hasAppendedVideo:](CKRemoteItemForSending, "hasAppendedVideo:", v11))
    {
      objc_storeStrong((id *)&v14->_attachmentURL, a3);
      appendedBundleURL = v14->_appendedBundleURL;
      v14->_appendedBundleURL = 0;

      appendedVideoURL = v14->_appendedVideoURL;
      v14->_appendedVideoURL = 0;
LABEL_20:

      objc_storeStrong((id *)&v14->_attachmentDescription, a4);
      if (v13)
        -[CKRemoteItemForSending _setPreviewUIImage:](v14, "_setPreviewUIImage:", v13);
      else
        -[CKRemoteItemForSending beginPreviewCreation](v14, "beginPreviewCreation");
LABEL_29:
      v40 = v14;
      goto LABEL_30;
    }
    v20 = (NSURL *)objc_msgSend(objc_alloc(MEMORY[0x1E0D75318]), "initWithBundleAtURL:", v11);
    appendedVideoURL = v20;
    if (v20)
    {
      -[NSURL imagePath](v20, "imagePath");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (v22)
      {
        -[NSURL videoPath](appendedVideoURL, "videoPath");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v23 == 0;

        if (!v24)
        {
          v25 = (void *)MEMORY[0x1E0C99E98];
          -[NSURL imagePath](appendedVideoURL, "imagePath");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "fileURLWithPath:", v26);
          v27 = objc_claimAutoreleasedReturnValue();
          attachmentURL = v14->_attachmentURL;
          v14->_attachmentURL = (NSURL *)v27;

          v29 = (void *)MEMORY[0x1E0C99E98];
          -[NSURL videoPath](appendedVideoURL, "videoPath");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "fileURLWithPath:", v30);
          v31 = objc_claimAutoreleasedReturnValue();
          v32 = v14->_appendedVideoURL;
          v14->_appendedVideoURL = (NSURL *)v31;

          objc_storeStrong((id *)&v14->_appendedBundleURL, a3);
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v33 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
            {
              v34 = v14->_appendedVideoURL;
              v35 = v14->_appendedBundleURL;
              *(_DWORD *)buf = 138412546;
              v44 = (const __CFString *)v34;
              v45 = 2112;
              v46 = v35;
              _os_log_impl(&dword_18DFCD000, v33, OS_LOG_TYPE_INFO, "appended video URL %@, bundle URL %@", buf, 0x16u);
            }

          }
          goto LABEL_20;
        }
      }
    }
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
      {
        -[NSURL imagePath](appendedVideoURL, "imagePath");
        v38 = (NSURL *)(id)objc_claimAutoreleasedReturnValue();
        -[NSURL videoPath](appendedVideoURL, "videoPath");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v44 = (const __CFString *)appendedVideoURL;
        v45 = 2112;
        v46 = v38;
        v47 = 2112;
        v48 = v39;
        _os_log_impl(&dword_18DFCD000, v37, OS_LOG_TYPE_INFO, "CKRemoteItemForSending. Returning nil videoComplement %@, [videoComplement imagePath] %@, [videoComplement videoPath] %@", buf, 0x20u);

      }
    }

  }
  v40 = 0;
LABEL_30:

  return v40;
}

- (CKRemoteItemForSending)initWithAttachmentURL:(id)a3 description:(id)a4 blockOnPreviewCreation:(BOOL)a5
{
  return -[CKRemoteItemForSending initWithAttachmentURL:description:previewImage:blockOnPreviewCreation:](self, "initWithAttachmentURL:description:previewImage:blockOnPreviewCreation:", a3, a4, 0, a5);
}

- (CKRemoteItemForSending)initWithRichLinkWithURL:(id)a3 data:(id)a4
{
  id v7;
  id v8;
  CKRemoteItemForSending *v9;
  uint64_t v10;
  NSData *appendedRichLinkData;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CKRemoteItemForSending;
  v9 = -[CKRemoteItemForSending init](&v13, sel_init);
  if (v9)
  {
    v10 = objc_msgSend(v8, "copy");
    appendedRichLinkData = v9->_appendedRichLinkData;
    v9->_appendedRichLinkData = (NSData *)v10;

    objc_storeStrong((id *)&v9->_appendedRichLinkURL, a3);
  }

  return v9;
}

- (CKRemoteItemForSending)initWithMSMessage:(id)a3
{
  id v5;
  CKRemoteItemForSending *v6;
  CKRemoteItemForSending *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CKRemoteItemForSending;
  v6 = -[CKRemoteItemForSending init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_appendedMessage, a3);

  return v7;
}

- (void)beginPreviewCreation
{
  CKDBFileTransfer *v3;
  void *v4;
  CKDBFileTransfer *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  CKRemoteItemForSending *v19;
  uint64_t v20;

  v3 = [CKDBFileTransfer alloc];
  -[CKRemoteItemForSending attachmentURL](self, "attachmentURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CKDBFileTransfer initWithFileURL:transcoderUserInfo:attributionInfo:hideAttachment:](v3, "initWithFileURL:transcoderUserInfo:attributionInfo:hideAttachment:", v4, 0, 0, 0);

  -[CKRemoteItemForSending attachmentDescription](self, "attachmentDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKDBFileTransfer setFilename:](v5, "setFilename:", v6);

  -[CKDBFileTransfer setTransferState:](v5, "setTransferState:", 5);
  +[CKMediaObjectManager sharedInstance](CKMediaObjectManager, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKDBFileTransfer filename](v5, "filename");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (objc_class *)objc_msgSend(v7, "classForFilename:", v8);

  +[CKMessageContext selfContext](CKMessageContext, "selfContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend([v9 alloc], "initWithTransfer:context:forceInlinePreview:", v5, v10, 1);
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "previewMaxWidth");
  v14 = v13;

  +[CKRemoteItemForSending previewQueue](CKRemoteItemForSending, "previewQueue");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __46__CKRemoteItemForSending_beginPreviewCreation__block_invoke;
  v17[3] = &unk_1E274A420;
  v20 = v14;
  v18 = v11;
  v19 = self;
  v16 = v11;
  objc_msgSend(v15, "addOperationWithBlock:", v17);

}

void __46__CKRemoteItemForSending_beginPreviewCreation__block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;
  NSObject *v4;
  id v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "previewForWidth:orientation:", 1, *(double *)(a1 + 48));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "image");
    v2 = objc_claimAutoreleasedReturnValue();

    v3 = (id)v2;
  }
  else
  {
    v3 = v5;
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 40) + 8) = 1;
  v6 = v3;
  objc_msgSend(*(id *)(a1 + 40), "_setPreviewUIImage:");
  v4 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 88);
  if (v4)
    dispatch_semaphore_signal(v4);

}

- (void)waitForPreviewGenerationIfNecessary
{
  NSObject *previewCreationSemaphore;
  dispatch_time_t v3;

  previewCreationSemaphore = self->_previewCreationSemaphore;
  if (previewCreationSemaphore)
  {
    v3 = dispatch_time(0, 3000000000);
    dispatch_semaphore_wait(previewCreationSemaphore, v3);
  }
}

- (void)dealloc
{
  __IOSurface *previewImage;
  objc_super v4;

  previewImage = self->_previewImage;
  if (previewImage)
    CFRelease(previewImage);
  if (self->_blockSet)
    CGImageBlockSetRelease();
  v4.receiver = self;
  v4.super_class = (Class)CKRemoteItemForSending;
  -[CKRemoteItemForSending dealloc](&v4, sel_dealloc);
}

- (void)setPreviewImage:(__IOSurface *)a3
{
  __IOSurface *previewImage;

  previewImage = self->_previewImage;
  if (previewImage != a3)
  {
    if (previewImage)
      CFRelease(previewImage);
    self->_previewImage = a3;
    CFRetain(a3);
  }
}

- (void)_setPreviewUIImage:(id)a3
{
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;

  v4 = _setPreviewUIImage___pred_SBFCreateIOSurfaceForImageSpringBoardFoundation;
  v5 = a3;
  if (v4 != -1)
    dispatch_once(&_setPreviewUIImage___pred_SBFCreateIOSurfaceForImageSpringBoardFoundation, &__block_literal_global_46);
  v7 = 0;
  v6 = _setPreviewUIImage___SBFCreateIOSurfaceForImage(v5, &v7, 1);

  -[CKRemoteItemForSending setPreviewImage:](self, "setPreviewImage:", v6);
  -[CKRemoteItemForSending setBlockSet:](self, "setBlockSet:", v7);
}

void *__45__CKRemoteItemForSending__setPreviewUIImage___block_invoke()
{
  void *result;

  result = (void *)MEMORY[0x193FF3C24]("SBFCreateIOSurfaceForImage", CFSTR("SpringBoardFoundation"));
  _setPreviewUIImage___SBFCreateIOSurfaceForImage = result;
  return result;
}

- (id)description
{
  const __CFString *v2;

  v2 = CFSTR("fully realized preview");
  if (!self->_previewIsFullyRealizedByChatKit)
    v2 = CFSTR("raw preview");
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CKRemoteItemForSending <%@,%@,%@,%@,%@,%@>"), self->_previewImage, self->_attachmentURL, self->_attachmentDescription, v2, self->_appendedVideoURL, self->_appendedBundleURL);
}

+ (id)_sharedIOSurfaceCIContext
{
  if (_sharedIOSurfaceCIContext_onceToken != -1)
    dispatch_once(&_sharedIOSurfaceCIContext_onceToken, &__block_literal_global_57_0);
  return (id)_sharedIOSurfaceCIContext_sharedIOSurfaceCIContext;
}

void __51__CKRemoteItemForSending__sharedIOSurfaceCIContext__block_invoke()
{
  id v0;
  uint64_t v1;
  CGColorSpaceRef DeviceRGB;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[3];
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  v0 = objc_alloc(MEMORY[0x1E0C9DD90]);
  v1 = *MEMORY[0x1E0C9DFB8];
  v6[0] = *MEMORY[0x1E0C9DF88];
  v6[1] = v1;
  v7[0] = CFSTR("com.apple.chatkit.IOSurfaceCIContext");
  v7[1] = MEMORY[0x1E0C9AAB0];
  v6[2] = *MEMORY[0x1E0C9DF90];
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v7[2] = DeviceRGB;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v0, "initWithOptions:", v3);
  v5 = (void *)_sharedIOSurfaceCIContext_sharedIOSurfaceCIContext;
  _sharedIOSurfaceCIContext_sharedIOSurfaceCIContext = v4;

}

- (id)previewUIImage
{
  void *v2;
  void *v3;
  uint64_t v4;
  CGImage *v5;
  void *v6;
  NSObject *v7;

  if (self->_previewImage)
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9DDC8]), "initWithIOSurface:", self->_previewImage);
    objc_msgSend((id)objc_opt_class(), "_sharedIOSurfaceCIContext");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "extent");
    v4 = objc_msgSend(v3, "createCGImage:fromRect:", v2);
    if (v4)
    {
      v5 = (CGImage *)v4;
      objc_msgSend(MEMORY[0x1E0CEA638], "imageWithCGImage:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      CGImageRelease(v5);
    }
    else
    {
      IMLogHandleForCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        -[CKRemoteItemForSending previewUIImage].cold.1(v2, v7);

      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  __IOSurface *previewImage;
  void *XPCObject;
  void *v7;
  uint64_t v8;
  void *v9;
  objc_class *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  -[CKRemoteItemForSending waitForPreviewGenerationIfNecessary](self, "waitForPreviewGenerationIfNecessary");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v7 = (void *)MEMORY[0x1E0C99DA0];
    v8 = *MEMORY[0x1E0C99778];
    v9 = (void *)MEMORY[0x1E0CB3940];
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    XPCObject = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("An %@ can only be encoded with an instance of NSXPCCoder; attempting to encode with a %@"),
      XPCObject,
      v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "exceptionWithName:reason:userInfo:", v8, v13, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    IMLogSimulateCrashForException();

    goto LABEL_5;
  }
  objc_msgSend(v15, "encodeObject:forKey:", self->_attachmentURL, CFSTR("CKRemoteItemForSendingAttachmentURLKey"));
  objc_msgSend(v15, "encodeObject:forKey:", self->_attachmentDescription, CFSTR("CKRemoteItemForSendingAttachmentDescriptionKey"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_previewIsFullyRealizedByChatKit);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "encodeObject:forKey:", v4, CFSTR("CKRemoteItemForSendingPreviewIsFullyRealizedByChatKitKey"));

  objc_msgSend(v15, "encodeObject:forKey:", self->_appendedVideoURL, CFSTR("CKRemoteItemForSendingAppendedAttachmentURLKey"));
  objc_msgSend(v15, "encodeObject:forKey:", self->_appendedBundleURL, CFSTR("CKRemoteItemForSendingAppendedBundleURLKey"));
  objc_msgSend(v15, "encodeObject:forKey:", self->_appendedRichLinkURL, CFSTR("CKRemoteItemForSendingAppendedRichLinkURLKey"));
  objc_msgSend(v15, "encodeObject:forKey:", self->_appendedRichLinkData, CFSTR("CKRemoteItemForSendingAppendedRichLinkDataKey"));
  objc_msgSend(v15, "encodeObject:forKey:", self->_appendedMessage, CFSTR("CKRemoteItemForSendingAppendedMessageKey"));
  previewImage = self->_previewImage;
  if (previewImage)
  {
    XPCObject = IOSurfaceCreateXPCObject(previewImage);
    objc_msgSend(v15, "encodeXPCObject:forKey:", XPCObject, CFSTR("CKRemoteItemForSendingPreviewImageKey"));
LABEL_5:

  }
}

- (CKRemoteItemForSending)initWithCoder:(id)a3
{
  id v4;
  CKRemoteItemForSending *v5;
  uint64_t v6;
  NSURL *attachmentURL;
  uint64_t v8;
  NSString *attachmentDescription;
  void *v10;
  uint64_t v11;
  NSURL *appendedVideoURL;
  uint64_t v13;
  NSURL *appendedBundleURL;
  uint64_t v15;
  NSURL *appendedRichLinkURL;
  uint64_t v17;
  NSData *appendedRichLinkData;
  uint64_t v19;
  MSMessage *appendedMessage;
  void *v21;
  void *v22;
  IOSurfaceRef v23;
  void *v24;
  uint64_t v25;
  void *v26;
  objc_class *v27;
  objc_class *v28;
  void *v29;
  void *v30;
  void *v31;
  CKRemoteItemForSending *v32;
  objc_super v34;

  v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)CKRemoteItemForSending;
  v5 = -[CKRemoteItemForSending init](&v34, sel_init);
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CKRemoteItemForSendingAttachmentURLKey"));
      v6 = objc_claimAutoreleasedReturnValue();
      attachmentURL = v5->_attachmentURL;
      v5->_attachmentURL = (NSURL *)v6;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CKRemoteItemForSendingAttachmentDescriptionKey"));
      v8 = objc_claimAutoreleasedReturnValue();
      attachmentDescription = v5->_attachmentDescription;
      v5->_attachmentDescription = (NSString *)v8;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CKRemoteItemForSendingPreviewIsFullyRealizedByChatKitKey"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_previewIsFullyRealizedByChatKit = objc_msgSend(v10, "BOOLValue");

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CKRemoteItemForSendingAppendedAttachmentURLKey"));
      v11 = objc_claimAutoreleasedReturnValue();
      appendedVideoURL = v5->_appendedVideoURL;
      v5->_appendedVideoURL = (NSURL *)v11;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CKRemoteItemForSendingAppendedBundleURLKey"));
      v13 = objc_claimAutoreleasedReturnValue();
      appendedBundleURL = v5->_appendedBundleURL;
      v5->_appendedBundleURL = (NSURL *)v13;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CKRemoteItemForSendingAppendedRichLinkURLKey"));
      v15 = objc_claimAutoreleasedReturnValue();
      appendedRichLinkURL = v5->_appendedRichLinkURL;
      v5->_appendedRichLinkURL = (NSURL *)v15;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CKRemoteItemForSendingAppendedRichLinkDataKey"));
      v17 = objc_claimAutoreleasedReturnValue();
      appendedRichLinkData = v5->_appendedRichLinkData;
      v5->_appendedRichLinkData = (NSData *)v17;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", NSClassFromString(CFSTR("MSMessage")), CFSTR("CKRemoteItemForSendingAppendedMessageKey"));
      v19 = objc_claimAutoreleasedReturnValue();
      appendedMessage = v5->_appendedMessage;
      v5->_appendedMessage = (MSMessage *)v19;

      objc_msgSend(v4, "decodeXPCObjectForKey:", CFSTR("CKRemoteItemForSendingPreviewImageKey"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v21;
      if (v21)
      {
        v23 = IOSurfaceLookupFromXPCObject(v21);
        -[CKRemoteItemForSending setPreviewImage:](v5, "setPreviewImage:", v23);
        if (v23)
          CFRelease(v23);
      }
    }
    else
    {
      v24 = (void *)MEMORY[0x1E0C99DA0];
      v25 = *MEMORY[0x1E0C99778];
      v26 = (void *)MEMORY[0x1E0CB3940];
      v27 = (objc_class *)objc_opt_class();
      NSStringFromClass(v27);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = (objc_class *)objc_opt_class();
      NSStringFromClass(v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "stringWithFormat:", CFSTR("An %@ can only be decoded with an instance of NSXPCCoder; attempting to encode with a %@"),
        v22,
        v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "exceptionWithName:reason:userInfo:", v25, v30, 0);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      IMLogSimulateCrashForException();

    }
    v32 = v5;
  }

  return v5;
}

- (NSURL)attachmentURL
{
  return self->_attachmentURL;
}

- (void)setAttachmentURL:(id)a3
{
  objc_storeStrong((id *)&self->_attachmentURL, a3);
}

- (NSString)attachmentDescription
{
  return self->_attachmentDescription;
}

- (void)setAttachmentDescription:(id)a3
{
  objc_storeStrong((id *)&self->_attachmentDescription, a3);
}

- (__IOSurface)previewImage
{
  return self->_previewImage;
}

- (BOOL)previewIsFullyRealizedByChatKit
{
  return self->_previewIsFullyRealizedByChatKit;
}

- (void)setPreviewIsFullyRealizedByChatKit:(BOOL)a3
{
  self->_previewIsFullyRealizedByChatKit = a3;
}

- (NSURL)appendedVideoURL
{
  return self->_appendedVideoURL;
}

- (void)setAppendedVideoURL:(id)a3
{
  objc_storeStrong((id *)&self->_appendedVideoURL, a3);
}

- (NSURL)appendedBundleURL
{
  return self->_appendedBundleURL;
}

- (void)setAppendedBundleURL:(id)a3
{
  objc_storeStrong((id *)&self->_appendedBundleURL, a3);
}

- (NSURL)appendedRichLinkURL
{
  return self->_appendedRichLinkURL;
}

- (void)setAppendedRichLinkURL:(id)a3
{
  objc_storeStrong((id *)&self->_appendedRichLinkURL, a3);
}

- (NSData)appendedRichLinkData
{
  return self->_appendedRichLinkData;
}

- (void)setAppendedRichLinkData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (MSMessage)appendedMessage
{
  return self->_appendedMessage;
}

- (void)setAppendedMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (CGImageBlockSet)blockSet
{
  return self->_blockSet;
}

- (void)setBlockSet:(CGImageBlockSet *)a3
{
  self->_blockSet = a3;
}

- (OS_dispatch_semaphore)previewCreationSemaphore
{
  return self->_previewCreationSemaphore;
}

- (void)setPreviewCreationSemaphore:(id)a3
{
  objc_storeStrong((id *)&self->_previewCreationSemaphore, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previewCreationSemaphore, 0);
  objc_storeStrong((id *)&self->_appendedMessage, 0);
  objc_storeStrong((id *)&self->_appendedRichLinkData, 0);
  objc_storeStrong((id *)&self->_appendedRichLinkURL, 0);
  objc_storeStrong((id *)&self->_appendedBundleURL, 0);
  objc_storeStrong((id *)&self->_appendedVideoURL, 0);
  objc_storeStrong((id *)&self->_attachmentDescription, 0);
  objc_storeStrong((id *)&self->_attachmentURL, 0);
}

- (void)previewUIImage
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;
  CGRect v7;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "extent");
  NSStringFromCGRect(v7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_18DFCD000, a2, OS_LOG_TYPE_ERROR, "-createCGImage:fromRect: returned nil. Requested rect: %@ – will not return a valid preview UIImage.", (uint8_t *)&v4, 0xCu);

}

@end
