@implementation ICAttachment(UI)

- (id)loadImage:()UI aboutToLoadHandler:forceFullSizeImage:
{
  void (**v7)(id, _QWORD, uint64_t);
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  char v20;
  id v21;
  ICAttachmentImageLoadingOperation *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  id v26;
  void *v27;
  void *v29;
  void (**v31)(void);
  _QWORD aBlock[4];
  id v33;
  id v34;
  id location;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _QWORD v40[9];
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  char v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  __int16 v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t (*v52)(uint64_t, uint64_t);
  void (*v53)(uint64_t);
  id v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t (*v58)(uint64_t, uint64_t);
  void (*v59)(uint64_t);
  id v60;
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v31 = a4;
  v55 = 0;
  v56 = &v55;
  v57 = 0x3032000000;
  v58 = __Block_byref_object_copy__53;
  v59 = __Block_byref_object_dispose__53;
  v60 = 0;
  v49 = 0;
  v50 = &v49;
  v51 = 0x3032000000;
  v52 = __Block_byref_object_copy__53;
  v53 = __Block_byref_object_dispose__53;
  v54 = 0;
  v45 = 0;
  v46 = &v45;
  v47 = 0x2020000000;
  v48 = 0;
  v41 = 0;
  v42 = &v41;
  v43 = 0x2020000000;
  v44 = 0;
  objc_msgSend(a1, "managedObjectContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = MEMORY[0x1E0C809B0];
  v40[1] = 3221225472;
  v40[2] = __68__ICAttachment_UI__loadImage_aboutToLoadHandler_forceFullSizeImage___block_invoke;
  v40[3] = &unk_1E5C22A78;
  v40[4] = a1;
  v40[5] = &v55;
  v40[6] = &v49;
  v40[7] = &v45;
  v40[8] = &v41;
  objc_msgSend(v8, "performBlockAndWait:", v40);

  objc_msgSend((id)objc_opt_class(), "imageCache");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", v50[5]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10 || !*((_WORD *)v46 + 12))
  {
    v11 = 1;
    v12 = v10;
LABEL_3:
    ((void (**)(id, void *, uint64_t))v7)[2](v7, v12, v11);
    v13 = 0;
    goto LABEL_24;
  }
  if (!v56[5] && !*((_BYTE *)v42 + 24))
  {
    v12 = 0;
    v11 = 0;
    goto LABEL_3;
  }
  if (v31)
    v31[2]();
  objc_msgSend((id)objc_opt_class(), "imageLoadingOperationQueue");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setSuspended:", 1);
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  objc_msgSend(v29, "operations");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v36, v61, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v37;
LABEL_11:
    v17 = 0;
    while (1)
    {
      if (*(_QWORD *)v37 != v16)
        objc_enumerationMutation(v14);
      v18 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v17);
      objc_msgSend(v18, "cacheKey");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "isEqual:", v50[5]);

      if ((v20 & 1) != 0)
        break;
      if (v15 == ++v17)
      {
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v36, v61, 16);
        if (v15)
          goto LABEL_11;
        goto LABEL_17;
      }
    }
    v21 = v18;

    if (v21
      && (objc_msgSend(v21, "isFinished") & 1) == 0
      && (objc_msgSend(v21, "isExecuting") & 1) == 0
      && !objc_msgSend(v21, "isCancelled"))
    {
      goto LABEL_23;
    }
  }
  else
  {
LABEL_17:

    v21 = 0;
  }
  v22 = [ICAttachmentImageLoadingOperation alloc];
  objc_msgSend((id)objc_opt_class(), "imageCache");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = -[ICAttachmentImageLoadingOperation initWithCache:attachment:attachmentType:forceFullSizeImage:completionHandler:](v22, "initWithCache:attachment:attachmentType:forceFullSizeImage:completionHandler:", v23, a1, *((__int16 *)v46 + 12), a5, 0);

  objc_msgSend(v29, "addOperation:", v24);
  v21 = (id)v24;
LABEL_23:
  objc_msgSend(v21, "addCompletionHandler:", v7);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setSuspended:", 0);
  objc_initWeak(&location, v21);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __68__ICAttachment_UI__loadImage_aboutToLoadHandler_forceFullSizeImage___block_invoke_2;
  aBlock[3] = &unk_1E5C22AA0;
  objc_copyWeak(&v34, &location);
  v33 = v25;
  v26 = v25;
  v13 = _Block_copy(aBlock);

  objc_destroyWeak(&v34);
  objc_destroyWeak(&location);

LABEL_24:
  v27 = _Block_copy(v13);

  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(&v45, 8);
  _Block_object_dispose(&v49, 8);

  _Block_object_dispose(&v55, 8);
  return v27;
}

- (uint64_t)isUnsupportedOnCurrentPlatform
{
  if (objc_msgSend(a1, "attachmentType") == 13
    && !+[ICSystemPaperTextAttachment isEnabled](ICSystemPaperTextAttachment, "isEnabled"))
  {
    return 1;
  }
  else
  {
    return objc_msgSend(a1, "isUnsupported");
  }
}

- (ICDocumentMergeController)documentMergeController
{
  ICDocumentMergeController *v2;
  void *v3;
  void *v4;
  ICDocumentMergeController *v5;

  objc_getAssociatedObject(a1, &documentMergeController_documentMergeControllerHandle_0);
  v2 = (ICDocumentMergeController *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    v2 = objc_alloc_init(ICDocumentMergeController);
    objc_msgSend(a1, "note");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "documentMergeController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocumentMergeController setParentController:](v2, "setParentController:", v4);

    objc_setAssociatedObject(a1, &documentMergeController_documentMergeControllerHandle_0, v2, (void *)1);
  }
  v5 = v2;

  return v5;
}

- (id)croppingQuad
{
  void *v2;
  int v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;

  objc_msgSend(a1, "attachmentModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shouldCropImage");

  if (v3)
  {
    objc_msgSend(a1, "croppingQuadTopLeftX");
    v5 = v4;
    objc_msgSend(a1, "croppingQuadTopLeftY");
    v7 = v6;
    objc_msgSend(a1, "croppingQuadTopRightX");
    v9 = v8;
    objc_msgSend(a1, "croppingQuadTopRightY");
    v11 = v10;
    objc_msgSend(a1, "croppingQuadBottomLeftX");
    v13 = v12;
    objc_msgSend(a1, "croppingQuadBottomLeftY");
    v15 = v14;
    objc_msgSend(a1, "croppingQuadBottomRightX");
    v17 = v16;
    objc_msgSend(a1, "croppingQuadBottomRightY");
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEE5A8]), "initWithBottomLeft:bottomRight:topLeft:topRight:", v13, v15, v17, v18, v5, v7, v9, v11);
  }
  else
  {
    v19 = 0;
  }
  return v19;
}

+ (id)imageLoadingOperationQueue
{
  if (imageLoadingOperationQueue_onceToken != -1)
    dispatch_once(&imageLoadingOperationQueue_onceToken, &__block_literal_global_8_2);
  return (id)imageLoadingOperationQueue_imageLoadingOperationQueue;
}

+ (id)imageCache
{
  if (imageCache_onceToken_2[0] != -1)
    dispatch_once(imageCache_onceToken_2, &__block_literal_global_22);
  return (id)imageCache_imageCache_2;
}

+ (id)thumbnailOperationQueue
{
  if (thumbnailOperationQueue_onceToken != -1)
    dispatch_once(&thumbnailOperationQueue_onceToken, &__block_literal_global_65);
  return (id)thumbnailOperationQueue_thumbnailOperationQueue;
}

- (id)image
{
  dispatch_semaphore_t v2;
  NSObject *v3;
  id v4;
  id v5;
  _QWORD v7[4];
  NSObject *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__53;
  v14 = __Block_byref_object_dispose__53;
  v15 = 0;
  v2 = dispatch_semaphore_create(0);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __25__ICAttachment_UI__image__block_invoke;
  v7[3] = &unk_1E5C22A50;
  v9 = &v10;
  v3 = v2;
  v8 = v3;
  v4 = (id)objc_msgSend(a1, "loadImage:", v7);
  dispatch_semaphore_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
  v5 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  return v5;
}

- (id)unprocessedDocumentImage
{
  void *v2;
  int v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  objc_msgSend(a1, "parentAttachment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "attachmentType");

  if (v3 == 11)
  {
    objc_msgSend(a1, "media");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isPasswordProtected");

    objc_msgSend(a1, "media");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v5)
    {
      objc_msgSend(v6, "decryptedData");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        objc_msgSend(MEMORY[0x1E0DC3870], "ic_imageWithData:", v8);
        v9 = objc_claimAutoreleasedReturnValue();
LABEL_8:
        v10 = (void *)v9;
LABEL_10:

        return v10;
      }
    }
    else
    {
      objc_msgSend(v6, "mediaURL");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        objc_msgSend(MEMORY[0x1E0DC3870], "ic_imageWithContentsOfURL:", v8);
        v9 = objc_claimAutoreleasedReturnValue();
        goto LABEL_8;
      }
    }
    v10 = 0;
    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "parentIsGallery", "-[ICAttachment(UI) unprocessedDocumentImage]", 1, 0, CFSTR("Trying to get un-processed image from type that is not a gallery sub attachment"));
  v10 = 0;
  return v10;
}

- (uint64_t)setCroppingQuad:()UI
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;

  v4 = a3;
  objc_msgSend(a1, "setCachedImage:", 0);
  objc_msgSend(a1, "invalidateAttachmentPreviewImages");
  objc_msgSend(v4, "topLeft");
  objc_msgSend(a1, "setCroppingQuadTopLeftX:");
  objc_msgSend(v4, "topLeft");
  objc_msgSend(a1, "setCroppingQuadTopLeftY:", v5);
  objc_msgSend(v4, "topRight");
  objc_msgSend(a1, "setCroppingQuadTopRightX:");
  objc_msgSend(v4, "topRight");
  objc_msgSend(a1, "setCroppingQuadTopRightY:", v6);
  objc_msgSend(v4, "bottomLeft");
  objc_msgSend(a1, "setCroppingQuadBottomLeftX:");
  objc_msgSend(v4, "bottomLeft");
  objc_msgSend(a1, "setCroppingQuadBottomLeftY:", v7);
  objc_msgSend(v4, "bottomRight");
  objc_msgSend(a1, "setCroppingQuadBottomRightX:");
  objc_msgSend(v4, "bottomRight");
  v9 = v8;

  return objc_msgSend(a1, "setCroppingQuadBottomRightY:", v9);
}

- (uint64_t)loadImage:()UI
{
  return objc_msgSend(a1, "loadImage:aboutToLoadHandler:forceFullSizeImage:", a3, 0, 0);
}

- (id)imageCacheKey
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;

  objc_msgSend(a1, "media");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(a1, "identifier");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (id)cachedImage
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v1 = a1;
  objc_sync_enter(v1);
  objc_msgSend(v1, "imageCacheKey");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend((id)objc_opt_class(), "imageCache");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "imageCacheKey");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  objc_sync_exit(v1);
  return v5;
}

- (void)setCachedImage:()UI
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v4 = a1;
  objc_sync_enter(v4);
  objc_msgSend(v4, "imageCacheKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend((id)objc_opt_class(), "imageCache");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "imageCacheKey");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      objc_msgSend(v6, "setObject:forKey:", v8, v7);
    else
      objc_msgSend(v6, "removeObjectForKey:", v7);

  }
  objc_sync_exit(v4);

}

- (id)attributedString
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3010000000;
  v13 = 0;
  v14 = 0;
  v12 = "";
  objc_msgSend(a1, "note");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "textStorage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "length");
  v5 = *MEMORY[0x1E0DC10F8];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __36__ICAttachment_UI__attributedString__block_invoke;
  v8[3] = &unk_1E5C22AE8;
  v8[4] = a1;
  v8[5] = &v9;
  objc_msgSend(v3, "enumerateAttribute:inRange:options:usingBlock:", v5, 0, v4, 0, v8);
  if (v10[5])
  {
    objc_msgSend(v3, "ic_attributedSubstringFromRange:", v10[4]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  _Block_object_dispose(&v9, 8);
  return v6;
}

- (id)pasteboardData
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend(a1, "note");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "textStorage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "note");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "filterAttachmentsInTextStorage:range:", v3, 0, objc_msgSend(v3, "length"));

  v5 = objc_alloc(MEMORY[0x1E0D63AC8]);
  objc_msgSend(a1, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithObjectIdentifier:forPasteboard:", v6, 1);

  objc_msgSend(a1, "attributedString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "managedObjectContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ic_serializeWithFlags:dataPersister:managedObjectContext:error:", 1, v7, v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D63BD8]), "initWithAttributedStringData:dataPersister:", v10, v7);
  return v11;
}

- (id)activityItems
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "attachmentModel");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "activityItems");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)modificationDateForSpeaking
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setLocale:", v3);

  objc_msgSend(v2, "setDateStyle:", 3);
  objc_msgSend(v2, "setTimeStyle:", 0);
  objc_msgSend(a1, "modificationDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringFromDate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)movieDurationForSpeaking
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  objc_msgSend(a1, "duration");
  v8 = (int)(v7 / 3600.0);
  v9 = (int)v7 % 3600;
  v10 = ((int)v7 % 60);
  if ((_DWORD)v8)
  {
    v11 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("%d hours"), CFSTR("%d hours"), 0, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringWithFormat:", v12, v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
  }
  if ((v9 - 60) > 0xFFFFFF88)
  {
    v17 = 0;
    if ((_DWORD)v10)
      goto LABEL_6;
LABEL_8:
    v20 = 0;
    goto LABEL_9;
  }
  v14 = ((__int16)((34953 * (__int16)v9) >> 16) >> 5)
      + (((v9 + ((-30583 * (__int16)v9) >> 16)) & 0x8000) >> 15);
  v15 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("%d minutes"), CFSTR("%d minutes"), 0, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedStringWithFormat:", v16, v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!(_DWORD)v10)
    goto LABEL_8;
LABEL_6:
  v18 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("%d seconds"), CFSTR("%d seconds"), 0, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "localizedStringWithFormat:", v19, v10);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
  __ICAccessibilityStringForVariables(0, v13, v1, v2, v3, v4, v5, v6, (uint64_t)v17);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (id)deviceInfosWithoutPreviewImagesFromDeviceInfos:()UI
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  objc_msgSend(a1, "previewImages");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  v7 = v4;
  if (v6)
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithArray:", v4);
    objc_msgSend(a1, "previewImages");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __67__ICAttachment_UI__deviceInfosWithoutPreviewImagesFromDeviceInfos___block_invoke;
    v12[3] = &unk_1E5C22B10;
    v13 = v8;
    v10 = v8;
    objc_msgSend(v9, "enumerateObjectsUsingBlock:", v12);

    objc_msgSend(v10, "allObjects");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (uint64_t)updateAttachmentPreviewImageWithImage:()UI scale:scaleWhenDrawing:metadata:sendNotification:
{
  return objc_msgSend(a1, "updateAttachmentPreviewImageWithImage:scale:appearanceType:scaleWhenDrawing:metadata:sendNotification:", a3, 0, a4, a5, a6);
}

- (id)updateAttachmentPreviewImageWithImage:()UI scale:appearanceType:scaleWhenDrawing:metadata:sendNotification:
{
  id v14;
  id v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;

  v14 = a7;
  v15 = a4;
  objc_msgSend(v15, "size");
  v17 = v16;
  v19 = v18;
  objc_msgSend(v15, "ic_PNGData");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "updateAttachmentPreviewImageWithImageData:size:scale:appearanceType:scaleWhenDrawing:metadata:sendNotification:", v20, a5, a6, v14, a8, v17, v19, a2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "managedObjectContext");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "ic_saveWithLogDescription:", CFSTR("Saving preview image"));

  return v21;
}

- (uint64_t)thumbnailImage:()UI minSize:scale:imageScaling:showAsFileIcon:isMovie:movieDuration:
{
  return objc_msgSend(a1, "thumbnailImage:minSize:scale:appearanceType:requireAppearance:imageScaling:showAsFileIcon:isMovie:movieDuration:", a3, 0, 0, a4, a5, a6, a7);
}

- (uint64_t)thumbnailImage:()UI minSize:scale:appearanceType:requireAppearance:imageScaling:showAsFileIcon:isMovie:movieDuration:
{
  uint64_t v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  Float64 v31;
  CMTime v33;

  *a6 = 0;
  *a9 = 0;
  *a10 = 0;
  *a11 = 0;
  v22 = 0;
  if ((objc_msgSend(a1, "markedForDeletion") & 1) == 0)
  {
    objc_msgSend(a1, "attachmentModel");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "hasPreviews");

    if (v24)
    {
      objc_msgSend(a1, "attachmentPreviewImageWithMinSize:scale:appearanceType:requireAppearance:", a7, a8, a2, a3, a4);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "orientedImage");
      *a6 = (id)objc_claimAutoreleasedReturnValue();
      *a9 = objc_msgSend(v25, "scaleWhenDrawing");

      v22 = 1;
    }
    else
    {
      objc_msgSend(a1, "media");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "mediaURL");
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (v27)
      {
        objc_msgSend(a1, "attachmentModel");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "fileIconWithPreferredSize:", a2, a3);
        *a6 = (id)objc_claimAutoreleasedReturnValue();

        *a9 = 2;
        v22 = 1;
        *a10 = 1;
      }
      else
      {
        v22 = 0;
      }
    }
    v29 = (void *)MEMORY[0x1E0D639F0];
    objc_msgSend(a1, "typeUTI");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v29) = objc_msgSend(v29, "typeUTIIsPlayableMovie:", v30);

    if ((_DWORD)v29)
    {
      *a11 = 1;
      objc_msgSend(a1, "duration");
      CMTimeMakeWithSeconds(&v33, v31, 1000000000);
      *a12 = v33;
    }
    else
    {
      *a11 = 0;
    }
  }
  return v22;
}

- (uint64_t)fetchThumbnailImageWithMinSize:()UI scale:appearanceInfo:cache:cacheKey:processingBlock:completionBlock:fallbackBlock:aboutToLoadHandler:
{
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  void (**v27)(_QWORD);
  int v28;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  id v34;
  id v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;

  v21 = a6;
  v22 = a7;
  v23 = a8;
  v24 = a9;
  v25 = a10;
  v26 = a11;
  v27 = a12;
  v28 = objc_msgSend(a1, "markedForDeletion");
  if ((v28 & 1) == 0)
  {
    v34 = v21;
    objc_msgSend(a1, "attachmentModel");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "needToGeneratePreviews");

    if (v30)
    {
      +[ICAttachmentPreviewGenerator sharedGenerator](ICAttachmentPreviewGenerator, "sharedGenerator");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "generatePreviewIfNeededForAttachment:", a1);

    }
    v36 = 0;
    v37 = &v36;
    v38 = 0x3032000000;
    v39 = __Block_byref_object_copy__53;
    v40 = __Block_byref_object_dispose__53;
    objc_msgSend(v22, "thumbnailDataForKey:", v23);
    v41 = (id)objc_claimAutoreleasedReturnValue();
    if (v37[5])
    {
      v35 = v25;
      performBlockOnMainThreadAndWait();
      v32 = v35;
    }
    else
    {
      if (v27)
        v27[2](v27);
      objc_msgSend((id)objc_opt_class(), "thumbnailOperationQueue");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "addOperationWithAttachment:size:scale:appearanceInfo:cache:cacheKey:processingBlock:completionBlock:fallbackBlock:", a1, v34, v22, v23, v24, v25, a2, a3, a4, v26);
    }

    _Block_object_dispose(&v36, 8);
    v21 = v34;
  }

  return v28 ^ 1u;
}

- (uint64_t)notifyDocCamFrameworkAttachmentWasDeleted
{
  return objc_msgSend(MEMORY[0x1E0CEE598], "scanWasDeleted:", a1);
}

- (void)redactAuthorAttributionsToCurrentUser
{
  void *v2;
  objc_super v3;

  v3.receiver = a1;
  v3.super_class = (Class)&off_1EED369A8;
  objc_msgSendSuper2(&v3, sel_redactAuthorAttributionsToCurrentUser);
  objc_msgSend(a1, "attachmentModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "redactAuthorAttributionsToCurrentUser");

}

@end
