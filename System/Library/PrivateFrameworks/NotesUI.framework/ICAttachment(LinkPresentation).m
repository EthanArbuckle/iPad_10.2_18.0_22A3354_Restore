@implementation ICAttachment(LinkPresentation)

- (id)retrieveLinkMetadata
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  char isKindOfClass;
  void *v11;
  id v13;
  _QWORD v14[7];
  id v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  id location;

  objc_initWeak(&location, val);
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__51;
  v26 = __Block_byref_object_dispose__51;
  v27 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__51;
  v20 = __Block_byref_object_dispose__51;
  v21 = 0;
  objc_msgSend(val, "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __54__ICAttachment_LinkPresentation__retrieveLinkMetadata__block_invoke;
  v14[3] = &unk_1E5C22928;
  objc_copyWeak(&v15, &location);
  v14[4] = val;
  v14[5] = &v22;
  v14[6] = &v16;
  objc_msgSend(v2, "performBlockAndWait:", v14);

  if (v23[5])
  {
    v3 = (void *)MEMORY[0x1E0CB3710];
    getLPLinkMetadataClass();
    v4 = objc_opt_class();
    v5 = v23[5];
    v13 = 0;
    objc_msgSend(v3, "unarchivedObjectOfClass:fromData:error:", v4, v5, &v13);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v13;
    if (v7)
    {
      v8 = os_log_create("com.apple.notes", "UI");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[ICAttachment(LinkPresentation) retrieveLinkMetadata].cold.1((uint64_t)v7, v8);

    }
    objc_msgSend(v6, "specialization");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    getLPFileMetadataClass();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v6, "specialization");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setName:", v17[5]);

    }
  }
  else
  {
    v6 = 0;
  }
  objc_destroyWeak(&v15);
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
  objc_destroyWeak(&location);
  return v6;
}

- (void)persistLinkMetadata:()LinkPresentation
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v5[5];
  id v6;

  objc_msgSend(a1, "archiveLinkmetadata:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __54__ICAttachment_LinkPresentation__persistLinkMetadata___block_invoke;
  v5[3] = &unk_1E5C1D9A8;
  v5[4] = a1;
  v6 = v2;
  v4 = v2;
  objc_msgSend(v3, "performBlockAndWait:", v5);

}

- (uint64_t)metadataExists
{
  void *v2;
  uint64_t v3;
  _QWORD v5[5];
  id v6;
  id location;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  objc_initWeak(&location, val);
  objc_msgSend(val, "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __48__ICAttachment_LinkPresentation__metadataExists__block_invoke;
  v5[3] = &unk_1E5C1F7C0;
  objc_copyWeak(&v6, &location);
  v5[4] = &v8;
  objc_msgSend(v2, "performBlockAndWait:", v5);

  v3 = *((unsigned __int8 *)v9 + 24);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v8, 8);
  return v3;
}

- (BOOL)usesLinkPresentation
{
  unsigned int v2;
  _BOOL8 result;
  int v4;

  v2 = objc_msgSend(a1, "attachmentType");
  result = 1;
  if (v2 <= 0xF)
  {
    if (((1 << v2) & 0x362B) != 0)
    {
      return 0;
    }
    else
    {
      v4 = 1 << v2;
      if ((v4 & 0x840) != 0)
        return objc_msgSend(a1, "preferredViewSize") == 1;
      else
        return (v4 & 0xC000) == 0;
    }
  }
  return result;
}

- (BOOL)alwaysUsesSmallSize
{
  return objc_msgSend(a1, "attachmentType") == 2 || objc_msgSend(a1, "attachmentType") == 4;
}

- (void)addPreviewImageToMetadata:()LinkPresentation
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;

  v4 = a3;
  if (v4)
  {
    objc_msgSend(a1, "attachmentPreviewImageWithMinSize:scale:", 192.0, 192.0, 1.0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(a1, "lpImageFromPreviewImage:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setImage:", v6);

    }
  }
  else
  {
    v7 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[ICAttachment(LinkPresentation) addPreviewImageToMetadata:].cold.1(v7);

  }
}

- (id)scannedDocumentsMetadata
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v2 = objc_alloc_init((Class)getLPLinkMetadataClass());
  objc_msgSend(a1, "addPreviewImageToMetadata:", v2);
  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("%lu scans"), CFSTR("%lu scans"), 0, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  objc_msgSend(a1, "attachmentModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = objc_msgSend(v5, "subAttachmentCount");
  }
  else
  {
    objc_opt_class();
    objc_msgSend(a1, "attachmentModel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    ICDynamicCast();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v8, "paperPageCount");

  }
  objc_msgSend(a1, "title");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTitle:", v9);

  objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", v3, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSummary:", v10);

  return v2;
}

- (id)fileMetadata
{
  id v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  id v8;
  float v9;
  void *v10;
  void *v11;
  double v12;
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
  objc_class *v27;
  id v28;
  void *v29;
  objc_class *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  id v36;
  uint64_t v37;
  uint64_t v38;
  Class (*v39)(uint64_t);
  void *v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t v45;

  v2 = objc_alloc_init((Class)getLPLinkMetadataClass());
  v3 = objc_alloc_init((Class)getLPFileMetadataClass());
  if (objc_msgSend(a1, "hasFallbackPDF"))
  {
    objc_msgSend(a1, "lpImageFromFallbackPDF");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setThumbnail:", v4);
    objc_msgSend(MEMORY[0x1E0D639F0], "fallbackPDFUTI");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setType:", v5);

    objc_msgSend(a1, "fallbackPDFURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = 0;
    v7 = objc_msgSend(v6, "getResourceValue:forKey:error:", &v36, *MEMORY[0x1E0C99998], 0);
    v8 = v36;

    if (v7 && (objc_msgSend(v8, "floatValue"), v9 != 0.0))
    {
      v12 = v9;
    }
    else
    {
      v10 = (void *)MEMORY[0x1AF445E78]();
      objc_msgSend(a1, "fallbackPDFData");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (double)(unint64_t)objc_msgSend(v11, "length");

      objc_autoreleasePoolPop(v10);
    }
    objc_msgSend(v3, "setSize:", (unint64_t)v12);

  }
  else
  {
    objc_msgSend(a1, "previewImages");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(a1, "attachmentPreviewImageWithMinSize:scale:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8), 1.0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "lpImageFromPreviewImage:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setThumbnail:", v15);

    }
    objc_msgSend(a1, "typeUTI");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setType:", v16);

    objc_msgSend(v3, "setSize:", objc_msgSend(a1, "fileSize"));
  }
  objc_msgSend(a1, "title");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setName:", v17);

  objc_msgSend(a1, "creationDate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCreationDate:", v18);

  objc_msgSend(v2, "setSpecialization:", v3);
  if (objc_msgSend(a1, "attachmentType") == 4)
  {
    objc_msgSend(a1, "typeUTI");
    v19 = objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      v20 = (void *)v19;
      objc_msgSend(a1, "media");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "mediaURL");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22)
      {
        v23 = (void *)MEMORY[0x1E0D639F0];
        objc_msgSend(a1, "typeUTI");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "mimeTypeFromUTI:", v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        v42 = 0;
        v43 = &v42;
        v44 = 0x2050000000;
        v26 = (void *)getLPAudioPropertiesClass_softClass;
        v45 = getLPAudioPropertiesClass_softClass;
        if (!getLPAudioPropertiesClass_softClass)
        {
          v37 = MEMORY[0x1E0C809B0];
          v38 = 3221225472;
          v39 = __getLPAudioPropertiesClass_block_invoke;
          v40 = &unk_1E5C1DE18;
          v41 = &v42;
          __getLPAudioPropertiesClass_block_invoke((uint64_t)&v37);
          v26 = (void *)v43[3];
        }
        v27 = objc_retainAutorelease(v26);
        _Block_object_dispose(&v42, 8);
        v28 = objc_alloc_init(v27);
        v42 = 0;
        v43 = &v42;
        v44 = 0x2050000000;
        v29 = (void *)getLPAudioClass_softClass;
        v45 = getLPAudioClass_softClass;
        if (!getLPAudioClass_softClass)
        {
          v37 = MEMORY[0x1E0C809B0];
          v38 = 3221225472;
          v39 = __getLPAudioClass_block_invoke;
          v40 = &unk_1E5C1DE18;
          v41 = &v42;
          __getLPAudioClass_block_invoke((uint64_t)&v37);
          v29 = (void *)v43[3];
        }
        v30 = objc_retainAutorelease(v29);
        _Block_object_dispose(&v42, 8);
        v31 = [v30 alloc];
        objc_msgSend(a1, "media");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "mediaURL");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = (void *)objc_msgSend(v31, "initByReferencingFileURL:MIMEType:properties:", v33, v25, v28);

        objc_msgSend(v2, "setAudio:", v34);
      }
    }
  }

  return v2;
}

- (id)fallbackRemoteAttachmentMetadata
{
  if (objc_msgSend(a1, "attachmentType") == 7)
    objc_msgSend(a1, "fallbackMapMetadata");
  else
    objc_msgSend(a1, "fallbackWebMetadata");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)plainURLMetadata
{
  id v2;
  void *v3;

  v2 = objc_alloc_init((Class)getLPLinkMetadataClass());
  objc_msgSend(a1, "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setURL:", v3);

  return v2;
}

- (void)requestRemoteMetadata
{
  NSObject *v2;
  _QWORD v3[4];
  id v4;
  id location;

  if (objc_msgSend(a1, "attachmentType") == 7)
    objc_msgSend(a1, "mapPreviewGenerationQueue");
  else
    objc_msgSend(a1, "webPreviewGenerationQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, a1);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __55__ICAttachment_LinkPresentation__requestRemoteMetadata__block_invoke;
  v3[3] = &unk_1E5C1F720;
  objc_copyWeak(&v4, &location);
  dispatch_async(v2, v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);

}

- (id)loadingAttachmentsMetadata
{
  id v0;
  void *v1;

  v0 = objc_alloc_init((Class)getLPLinkMetadataClass());
  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Loading…"), CFSTR("Loading…"), 0, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setTitle:", v1);

  return v0;
}

- (void)requestFileMetadataIfNecessary
{
  void *v2;
  NSObject *v3;
  _QWORD block[4];
  id v5;

  if (objc_msgSend(a1, "attachmentType") != 14
    && objc_msgSend(a1, "attachmentType") != 15
    && objc_msgSend(a1, "attachmentType") != 4)
  {
    objc_msgSend(a1, "attachmentModel");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v2, "needToGeneratePreviews"))
    {
      objc_msgSend(a1, "filePreviewGenerationQueue");
      v3 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __64__ICAttachment_LinkPresentation__requestFileMetadataIfNecessary__block_invoke;
      block[3] = &unk_1E5C1D540;
      v5 = v2;
      dispatch_async(v3, block);

    }
  }
}

- (id)lpImageFromPreviewImage:()LinkPresentation
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  if (objc_msgSend(a1, "isPasswordProtected"))
  {
    if (!objc_msgSend(a1, "isAuthenticated"))
    {
      v11 = 0;
      goto LABEL_12;
    }
    objc_msgSend(v4, "decryptedImageData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
      objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((decryptedImageData) != nil)", "-[ICAttachment(LinkPresentation) lpImageFromPreviewImage:]", 1, 0, CFSTR("Expected non-nil value for '%s'"), "decryptedImageData");
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3870]), "initWithData:", v5);
    v7 = objc_msgSend(objc_alloc((Class)getLPImageClass_0()), "initWithPlatformImage:", v6);
  }
  else
  {
    objc_msgSend(v4, "previewImageURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1E0D639F0];
    objc_msgSend(a1, "attachmentModel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "previewImageTypeUTI");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "mimeTypeFromUTI:", v10);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = 0;
    if (!v5 || !v6)
      goto LABEL_10;
    v7 = objc_msgSend(objc_alloc((Class)getLPImageClass_0()), "initByReferencingFileURL:MIMEType:", v5, v6);
  }
  v11 = (void *)v7;
LABEL_10:

LABEL_12:
  return v11;
}

- (id)lpImageFromFallbackPDF
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;

  v2 = objc_alloc(MEMORY[0x1E0CD0DB8]);
  objc_msgSend(a1, "fallbackPDFData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithData:", v3);

  objc_msgSend(v4, "pageAtIndex:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "boundsForBox:", 0);
  TSDScaleSizeWithinSize();
  objc_msgSend(MEMORY[0x1E0D63BF8], "renderedImageForPage:scale:size:colorSpace:", objc_msgSend(v5, "pageRef"), TSUDeviceRGBColorSpace(), 1.0, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(objc_alloc((Class)getLPImageClass_0()), "initWithPlatformImage:", v8);

  return v9;
}

- (id)archiveLinkmetadata:()LinkPresentation
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v10;
  id v11;
  uint8_t buf[4];
  id v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v4, 1, &v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v11;
  if (v6)
  {
    v7 = v6;
    v8 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(a1, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v13 = v4;
      v14 = 2112;
      v15 = v10;
      v16 = 2112;
      v17 = v7;
      _os_log_error_impl(&dword_1AC7A1000, v8, OS_LOG_TYPE_ERROR, "Converting metadata %@ for attachment with identifier: %@ failed with error: %@", buf, 0x20u);

    }
    v5 = 0;
  }
  else if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((archivedData) != nil)", "-[ICAttachment(LinkPresentation) archiveLinkmetadata:]", 1, 0, CFSTR("Expected non-nil value for '%s'"), "archivedData");
  }

  return v5;
}

- (id)filePreviewGenerationQueue
{
  if (filePreviewGenerationQueue_onceToken != -1)
    dispatch_once(&filePreviewGenerationQueue_onceToken, &__block_literal_global_63);
  return (id)filePreviewGenerationQueue_queue;
}

- (id)webPreviewGenerationQueue
{
  if (webPreviewGenerationQueue_onceToken != -1)
    dispatch_once(&webPreviewGenerationQueue_onceToken, &__block_literal_global_33_1);
  return (id)webPreviewGenerationQueue_queue;
}

- (id)mapPreviewGenerationQueue
{
  if (mapPreviewGenerationQueue_onceToken != -1)
    dispatch_once(&mapPreviewGenerationQueue_onceToken, &__block_literal_global_35_0);
  return (id)mapPreviewGenerationQueue_queue;
}

- (id)fallbackWebMetadata
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_alloc_init((Class)getLPLinkMetadataClass());
  objc_msgSend(a1, "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setURL:", v3);

  objc_msgSend(a1, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTitle:", v4);

  objc_msgSend(a1, "summary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSummary:", v5);

  return v2;
}

- (id)fallbackMapMetadata
{
  void *v2;
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v11 = 0;
  v12 = &v11;
  v13 = 0x2050000000;
  v2 = (void *)getLPMapMetadataClass_softClass_0;
  v14 = getLPMapMetadataClass_softClass_0;
  if (!getLPMapMetadataClass_softClass_0)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __getLPMapMetadataClass_block_invoke_0;
    v10[3] = &unk_1E5C1DE18;
    v10[4] = &v11;
    __getLPMapMetadataClass_block_invoke_0((uint64_t)v10);
    v2 = (void *)v12[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v11, 8);
  v4 = objc_alloc_init(v3);
  objc_msgSend(a1, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setName:", v5);

  objc_msgSend(a1, "summary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAddress:", v6);

  v7 = objc_alloc_init((Class)getLPLinkMetadataClass());
  objc_msgSend(v7, "setSpecialization:", v4);
  objc_msgSend(a1, "URL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setURL:", v8);

  objc_msgSend(v7, "URL");
  return v7;
}

- (void)retrieveLinkMetadata
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1AC7A1000, a2, OS_LOG_TYPE_ERROR, "LPLinkMetadata unarchiving error: %@", (uint8_t *)&v2, 0xCu);
}

- (void)addPreviewImageToMetadata:()LinkPresentation .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1AC7A1000, log, OS_LOG_TYPE_ERROR, "Trying to add preview images to a nil instance of LPLinkMetadata", v1, 2u);
}

@end
