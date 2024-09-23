@implementation CKAttachmentItem

+ (id)previewCache
{
  return +[CKPreviewDispatchCache detailsPreviewCache](CKPreviewDispatchCache, "detailsPreviewCache");
}

+ (id)previewSizingQueue
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)sPreviewSizingQueue;
  if (!sPreviewSizingQueue)
  {
    objc_msgSend(MEMORY[0x1E0D370E0], "serialQueueWithDispatchPriority:", -2);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)sPreviewSizingQueue;
    sPreviewSizingQueue = v3;

    v2 = (void *)sPreviewSizingQueue;
  }
  return v2;
}

+ (CGSize)defaultSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = *MEMORY[0x1E0C9D820];
  v3 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  result.height = v3;
  result.width = v2;
  return result;
}

+ (id)UTITypes
{
  return 0;
}

- (CKAttachmentItem)initWithFileURL:(id)a3 size:(CGSize)a4 transferGUID:(id)a5 guid:(id)a6 createdDate:(id)a7 shareURL:(id)a8
{
  id v12;
  id v13;
  id v14;
  id v15;
  CKAttachmentItem *v16;
  CKAttachmentItem *v17;
  void *v18;
  NSURL *appendedBundleURL;
  objc_super v21;

  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v21.receiver = self;
  v21.super_class = (Class)CKAttachmentItem;
  v16 = -[CKAttachmentItem init](&v21, sel_init);
  v17 = v16;
  if (v16)
  {
    -[CKAttachmentItem setFileURL:](v16, "setFileURL:", v12);
    -[CKAttachmentItem setGuid:](v17, "setGuid:", v14);
    -[CKAttachmentItem setCreatedDate:](v17, "setCreatedDate:", v15);
    objc_msgSend(v13, "im_lastPathComponent");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKAttachmentItem setTransferGUID:](v17, "setTransferGUID:", v18);

    appendedBundleURL = v17->_appendedBundleURL;
    v17->_appendedBundleURL = 0;

    -[CKAttachmentItem setShowDocumentIcon:](v17, "setShowDocumentIcon:", 1);
  }

  return v17;
}

- (id)imageData
{
  return 0;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v9.receiver = self;
  v9.super_class = (Class)CKAttachmentItem;
  -[CKAttachmentItem description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKAttachmentItem UTIType](self, "UTIType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKAttachmentItem fileURL](self, "fileURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@(%@) %@"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  char v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    -[CKAttachmentItem guid](self, "guid");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "guid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "isEqualToString:", v8);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)fileIcon
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;

  -[CKAttachmentItem UTIType](self, "UTIType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    +[CKMediaObject iconCache](CKMediaObject, "iconCache");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      -[CKAttachmentItem fileURL](self, "fileURL");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x1E0CA58C8];
      objc_msgSend(v6, "lastPathComponent");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "documentProxyForName:type:MIMEType:", v8, v3, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (-[CKAttachmentItem showDocumentIcon](self, "showDocumentIcon"))
      {
        objc_msgSend(MEMORY[0x1E0CEA638], "_iconForResourceProxy:format:options:", v9, 3, -[CKAttachmentItem showDocumentIcon](self, "showDocumentIcon") ^ 1);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        if (v5)
          goto LABEL_10;
        +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "genericDocumentIcon");
        v11 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CEA638], "_iconForResourceProxy:format:options:", v9, 12, 1);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        if (v5)
          goto LABEL_10;
        objc_msgSend(MEMORY[0x1E0CA58C8], "documentProxyForName:type:MIMEType:", 0, *MEMORY[0x1E0CA5BA0], 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CEA638], "_iconForResourceProxy:format:options:", v10, 12, 1);
        v11 = objc_claimAutoreleasedReturnValue();
      }
      v5 = (void *)v11;

      if (!v5)
      {
LABEL_11:

        goto LABEL_12;
      }
LABEL_10:
      +[CKMediaObject iconCache](CKMediaObject, "iconCache");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKey:", v5, v3);

      goto LABEL_11;
    }
  }
  else
  {
    v5 = 0;
  }
LABEL_12:

  return v5;
}

- (id)_savedPreviewFromURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  if (v3)
  {
    if (+[CKImageData supportsASTC](CKImageData, "supportsASTC"))
    {
      v4 = (void *)MEMORY[0x1E0CEA638];
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v3, 1, 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "imageWithData:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      CKJPEGUIImageFromURL((uint64_t)v3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)generatePreviewWithCompletion:(id)a3
{
  if (a3)
    (*((void (**)(id, _QWORD))a3 + 2))(a3, 0);
}

- (BOOL)canShareItem
{
  return !-[CKAttachmentItem isSticker](self, "isSticker");
}

- (void)_savePreview:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[4];
  CKAttachmentItem *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "previewCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v10 = self;
        _os_log_impl(&dword_18DFCD000, v6, OS_LOG_TYPE_INFO, "Queue save: %@", buf, 0xCu);
      }

    }
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __33__CKAttachmentItem__savePreview___block_invoke;
    v7[3] = &unk_1E274A108;
    v7[4] = self;
    v8 = v4;
    objc_msgSend(v5, "enqueueSaveBlock:withPriority:", v7, 0);

  }
}

void __33__CKAttachmentItem__savePreview___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  id v8;
  id v9;
  uint8_t buf[4];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      v3 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v11 = v3;
      _os_log_impl(&dword_18DFCD000, v2, OS_LOG_TYPE_INFO, "Perform save: %@", buf, 0xCu);
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "previewURL:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "path");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "fileExistsAtPath:", v6);

    if ((v7 & 1) == 0)
    {
      v8 = *(id *)(a1 + 40);
      v9 = v4;
      im_perform_with_task_assertion();

    }
  }

}

void __33__CKAttachmentItem__savePreview___block_invoke_35(uint64_t a1)
{
  void *v2;
  id v3;

  if (+[CKImageData supportsASTC](CKImageData, "supportsASTC"))
  {
    objc_msgSend(*(id *)(a1 + 32), "__ck_ASTCRepresentation");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v2)
      goto LABEL_6;
    goto LABEL_5;
  }
  CKUIImageJPEGRepresentationWithHardwareAcceleration();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
LABEL_5:
    v3 = v2;
    CKFreeSpaceWriteDataToURL(v2, *(void **)(a1 + 40), 1);
    v2 = v3;
  }
LABEL_6:

}

- (id)previewURL:(BOOL)a3
{
  NSURL *previewURL;
  void *v5;
  NSURL *v6;
  NSURL *v7;

  previewURL = self->_previewURL;
  if (!previewURL)
  {
    -[CKAttachmentItem fileURL](self, "fileURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKImageData supportsASTC](CKImageData, "supportsASTC");
    IMAttachmentPreviewFileURL();
    v6 = (NSURL *)objc_claimAutoreleasedReturnValue();
    v7 = self->_previewURL;
    self->_previewURL = v6;

    previewURL = self->_previewURL;
  }
  return previewURL;
}

- (id)uncachedPreviewURL
{
  void *v2;
  void *v3;

  -[CKAttachmentItem fileURL](self, "fileURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKImageData supportsASTC](CKImageData, "supportsASTC");
  IMAttachmentPreviewFileURL();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)cachedPreview
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v11;
  void *v12;

  objc_msgSend((id)objc_opt_class(), "previewCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKAttachmentItem guid](self, "guid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cachedPreviewForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = v5;
LABEL_5:
    v9 = v6;
    goto LABEL_6;
  }
  +[CKPreviewDispatchCache transcriptPreviewCache](CKPreviewDispatchCache, "transcriptPreviewCache");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cachedPreviewForKey:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v3, "setCachedPreview:key:", v8, v4);
    v6 = v8;
    goto LABEL_5;
  }
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) != 0)
    -[CKAttachmentItem previewURL:](self, "previewURL:", 0);
  else
    -[CKAttachmentItem uncachedPreviewURL](self, "uncachedPreviewURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKAttachmentItem _savedPreviewFromURL:](self, "_savedPreviewFromURL:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    objc_msgSend(v3, "setCachedPreview:key:", v12, v4);
  v9 = v12;

LABEL_6:
  return v9;
}

- (BOOL)isIrisAsset
{
  void *v2;
  BOOL v3;

  -[CKAttachmentItem calculateIrisVideoPath](self, "calculateIrisVideoPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)UTIType
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  +[CKMediaObjectManager sharedInstance](CKMediaObjectManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKAttachmentItem fileURL](self, "fileURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastPathComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UTITypeForFilename:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)pasteboardItem
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  NSObject *v9;
  const __CFString *v10;
  void *v11;
  _BOOL4 v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[2];
  _QWORD v20[2];
  _QWORD v21[3];
  _QWORD v22[3];
  uint8_t buf[4];
  const __CFString *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  -[CKAttachmentItem fileURL](self, "fileURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastPathComponent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByDeletingPathExtension");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v3, 8, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  v7 = -[CKAttachmentItem isIrisAsset](self, "isIrisAsset");
  -[CKAttachmentItem calculateIrisVideoPath](self, "calculateIrisVideoPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = CFSTR("NO");
      if (v7)
        v10 = CFSTR("YES");
      *(_DWORD *)buf = 138412546;
      v24 = v10;
      v25 = 2112;
      v26 = v8;
      _os_log_impl(&dword_18DFCD000, v9, OS_LOG_TYPE_INFO, "pasteBoardItem hasAppendedVideo %@ appendedVideoPath %@", buf, 0x16u);
    }

  }
  v11 = 0;
  if (v5 && v6)
  {
    if (v8)
      v12 = v7;
    else
      v12 = 0;
    objc_msgSend((id)*MEMORY[0x1E0CEBA08], "objectAtIndex:", 0);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    if (v12)
    {
      v21[0] = v13;
      objc_msgSend(v5, "dataUsingEncoding:", 4);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = v15;
      -[CKAttachmentItem UTIType](self, "UTIType");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v21[1] = v16;
      v22[1] = v6;
      v21[2] = CFSTR("com.apple.MobileSMS.appendedURL");
      objc_msgSend(v8, "dataUsingEncoding:", 4);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v22[2] = v17;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 3);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v5, "dataUsingEncoding:", 4, v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = v15;
      -[CKAttachmentItem UTIType](self, "UTIType");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v19[1] = v16;
      v20[1] = v6;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  return v11;
}

- (id)dragItem
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, void *);
  void *v15;
  id v16;
  _QWORD v17[5];

  v3 = objc_alloc_init(MEMORY[0x1E0CB36C8]);
  -[CKAttachmentItem fileURL](self, "fileURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKAttachmentItem UTIType](self, "UTIType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __28__CKAttachmentItem_dragItem__block_invoke;
  v17[3] = &unk_1E2759BA0;
  v17[4] = self;
  objc_msgSend(v3, "registerFileRepresentationForTypeIdentifier:fileOptions:visibility:loadHandler:", v5, 1, 0, v17);

  objc_msgSend((id)*MEMORY[0x1E0CEBA08], "objectAtIndex:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v6;
  v13 = 3221225472;
  v14 = __28__CKAttachmentItem_dragItem__block_invoke_2;
  v15 = &unk_1E274B9C8;
  v16 = v4;
  v8 = v4;
  objc_msgSend(v3, "registerDataRepresentationForTypeIdentifier:visibility:loadHandler:", v7, 0, &v12);

  v9 = objc_alloc(MEMORY[0x1E0CEA558]);
  v10 = (void *)objc_msgSend(v9, "initWithItemProvider:", v3, v12, v13, v14, v15);

  return v10;
}

uint64_t __28__CKAttachmentItem_dragItem__block_invoke(uint64_t a1, void (**a2)(_QWORD, _QWORD, _QWORD, _QWORD))
{
  void *v3;
  void (**v4)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "fileURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *, _QWORD, _QWORD))a2)[2](v4, v5, 0, 0);

  return 0;
}

uint64_t __28__CKAttachmentItem_dragItem__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void (**v3)(id, void *, _QWORD);
  void *v4;
  void *v5;
  void *v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "lastPathComponent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByDeletingPathExtension");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "dataUsingEncoding:", 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v3[2](v3, v6, 0);

  return 0;
}

- (id)getIrisVideoPath
{
  return 0;
}

- (id)calculateIrisVideoPath
{
  NSString *irisVideoPath;
  void *v4;
  NSString *v5;
  NSString *v6;

  irisVideoPath = self->_irisVideoPath;
  if (!irisVideoPath)
  {
    -[CKAttachmentItem fileURL](self, "fileURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKLivePhotoBundleUtilities calculateLivePhotoVideoPath:](CKLivePhotoBundleUtilities, "calculateLivePhotoVideoPath:", v4);
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    v6 = self->_irisVideoPath;
    self->_irisVideoPath = v5;

    irisVideoPath = self->_irisVideoPath;
  }
  return irisVideoPath;
}

- (id)_getIrisBundleLocation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[CKAttachmentItem fileURL](self, "fileURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByDeletingLastPathComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "length"))
  {
    -[CKAttachmentItem transferGUID](self, "transferGUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringByAppendingPathComponent:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "stringByAppendingPathExtension:", *MEMORY[0x1E0D75A78]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_getIrisBundleURL
{
  NSURL *v3;
  NSURL *appendedBundleURL;
  id *p_appendedBundleURL;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  id v10;
  NSURL **v11;
  NSURL *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  id v17;
  id v18;
  uint64_t v19;
  __int128 v20;
  void *v21;
  void *v22;
  int v23;
  id v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  id v28;
  void *v29;
  id v30;
  uint64_t v31;
  NSObject *v32;
  NSObject *v33;
  id v34;
  id v36;
  __int128 v37;
  uint64_t v38;
  uint8_t buf[4];
  id v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  id v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  if (-[CKAttachmentItem isIrisAsset](self, "isIrisAsset"))
  {
    -[CKAttachmentItem _getIrisBundleLocation](self, "_getIrisBundleLocation");
    v3 = (NSURL *)objc_claimAutoreleasedReturnValue();
    p_appendedBundleURL = (id *)&self->_appendedBundleURL;
    appendedBundleURL = self->_appendedBundleURL;
    self->_appendedBundleURL = v3;

    if (self->_appendedBundleURL
      && (objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(*p_appendedBundleURL, "path"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          v8 = objc_msgSend(v6, "fileExistsAtPath:", v7),
          v7,
          v6,
          v8))
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          v10 = *p_appendedBundleURL;
          *(_DWORD *)buf = 138412290;
          v40 = v10;
          _os_log_impl(&dword_18DFCD000, v9, OS_LOG_TYPE_INFO, "using pre existing bundle %@", buf, 0xCu);
        }

      }
    }
    else
    {
      -[CKAttachmentItem fileURL](self, "fileURL");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "path");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      -[CKAttachmentItem calculateIrisVideoPath](self, "calculateIrisVideoPath");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          v17 = *p_appendedBundleURL;
          *(_DWORD *)buf = 138412290;
          v40 = v17;
          _os_log_impl(&dword_18DFCD000, v16, OS_LOG_TYPE_INFO, "_getIrisBundleURL Creating Iris bundle %@", buf, 0xCu);
        }

      }
      if (v14 && v15)
      {
        v18 = objc_alloc(MEMORY[0x1E0D75318]);
        v19 = MEMORY[0x193FF3C24]("kCMTimeInvalid", CFSTR("CoreMedia"));
        v20 = *(_OWORD *)v19;
        v38 = *(_QWORD *)(v19 + 16);
        v37 = v20;
        v21 = (void *)objc_msgSend(v18, "initWithPathToVideo:pathToImage:imageDisplayTime:pairingIdentifier:", v15, v14, &v37, 0);
        -[CKAttachmentItem _getIrisBundleLocation](self, "_getIrisBundleLocation");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v21)
          goto LABEL_28;
        v36 = 0;
        v23 = objc_msgSend(v21, "writeToBundleAtURL:error:", v22, &v36);
        v24 = v36;
        if (v23)
        {
          objc_msgSend(v22, "absoluteString");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "im_markFileAsPurgeable:", 1);

        }
        if (v24)
        {
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v26 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138413314;
              v40 = v14;
              v41 = 2112;
              v42 = v15;
              v43 = 2112;
              v44 = v22;
              v45 = 2112;
              v46 = v21;
              v47 = 2112;
              v48 = v24;
              _os_log_impl(&dword_18DFCD000, v26, OS_LOG_TYPE_INFO, "Could not create iris bundle from image path %@ video path %@ URL %@ using videoComplement %@, error %@", buf, 0x34u);
            }

          }
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v27 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
            {
              objc_msgSend(v21, "imagePath");
              v28 = (id)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "videoPath");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v40 = v28;
              v41 = 2112;
              v42 = v29;
              _os_log_impl(&dword_18DFCD000, v27, OS_LOG_TYPE_INFO, "image path  %@, video path %@", buf, 0x16u);

            }
          }
          v30 = *p_appendedBundleURL;
          *p_appendedBundleURL = 0;

        }
        else
        {
LABEL_28:
          v31 = objc_msgSend(v22, "copy");
          v24 = *p_appendedBundleURL;
          *p_appendedBundleURL = (id)v31;
        }

      }
      else if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          v40 = v14;
          v41 = 2112;
          v42 = v15;
          _os_log_impl(&dword_18DFCD000, v32, OS_LOG_TYPE_INFO, "Iris. This is unexpected. imageFilePath %@ videoFilePath %@", buf, 0x16u);
        }

      }
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
        {
          v34 = *p_appendedBundleURL;
          *(_DWORD *)buf = 138412290;
          v40 = v34;
          _os_log_impl(&dword_18DFCD000, v33, OS_LOG_TYPE_INFO, "_getIrisBundleURL %@", buf, 0xCu);
        }

      }
    }
  }
  else
  {
    v12 = self->_appendedBundleURL;
    v11 = &self->_appendedBundleURL;
    *v11 = 0;

    p_appendedBundleURL = (id *)v11;
  }
  return *p_appendedBundleURL;
}

- (NSURL)previewItemURL
{
  void *v3;
  NSObject *v4;
  void *v5;
  id v6;
  void *v7;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[CKAttachmentItem _getIrisBundleURL](self, "_getIrisBundleURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        -[CKAttachmentItem fileURL](self, "fileURL");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = 138412546;
        v10 = v3;
        v11 = 2112;
        v12 = v5;
        _os_log_impl(&dword_18DFCD000, v4, OS_LOG_TYPE_INFO, "Passing back iris url %@ to QL for fileURL  %@", (uint8_t *)&v9, 0x16u);

      }
    }
    v6 = v3;
  }
  else
  {
    -[CKAttachmentItem fileURL](self, "fileURL");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return (NSURL *)v7;
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  if (width == *MEMORY[0x1E0C9D820] && height == *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    width = 100.0;
    height = 100.0;
  }
  result.height = height;
  result.width = width;
  return result;
}

+ (unint64_t)pxWidth
{
  void *v2;
  double v3;
  double v4;
  void *v5;
  double v6;
  unint64_t v7;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "previewMaxWidth");
  v4 = v3;
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scale");
  v7 = (unint64_t)(v4 * v6);

  return v7;
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (void)setFileURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSURL)appendedBundleURL
{
  return self->_appendedBundleURL;
}

- (NSString)transferGUID
{
  return self->_transferGUID;
}

- (void)setTransferGUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)guid
{
  return self->_guid;
}

- (void)setGuid:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSDate)createdDate
{
  return self->_createdDate;
}

- (void)setCreatedDate:(id)a3
{
  objc_storeStrong((id *)&self->_createdDate, a3);
}

- (void)setIsIrisAsset:(BOOL)a3
{
  self->_isIrisAsset = a3;
}

- (BOOL)isSticker
{
  return self->_isSticker;
}

- (void)setIsSticker:(BOOL)a3
{
  self->_isSticker = a3;
}

- (BOOL)showDocumentIcon
{
  return self->_showDocumentIcon;
}

- (void)setShowDocumentIcon:(BOOL)a3
{
  self->_showDocumentIcon = a3;
}

- (NSString)irisVideoPath
{
  return self->_irisVideoPath;
}

- (void)setIrisVideoPath:(id)a3
{
  objc_storeStrong((id *)&self->_irisVideoPath, a3);
}

- (NSURL)alternateShareURL
{
  return self->_alternateShareURL;
}

- (void)setAlternateShareURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSURL)previewURL
{
  return self->_previewURL;
}

- (void)setPreviewURL:(id)a3
{
  objc_storeStrong((id *)&self->_previewURL, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previewURL, 0);
  objc_storeStrong((id *)&self->_alternateShareURL, 0);
  objc_storeStrong((id *)&self->_irisVideoPath, 0);
  objc_storeStrong((id *)&self->_createdDate, 0);
  objc_storeStrong((id *)&self->_guid, 0);
  objc_storeStrong((id *)&self->_transferGUID, 0);
  objc_storeStrong((id *)&self->_appendedBundleURL, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
}

@end
