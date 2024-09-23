@implementation ICGalleryAttachmentUtilities

+ (id)createSubAttachmentFromDocument:(id)a3 imageCache:(id)a4 galleryAttachment:(id)a5
{
  id v7;
  id v8;
  id v9;
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

  v7 = a3;
  v8 = a5;
  v9 = a4;
  objc_msgSend(v9, "dataCryptorDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fullImageUUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "getImageURL:async:", v11, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    v13 = 0;
    goto LABEL_16;
  }
  if (objc_msgSend(v8, "isPasswordProtected") && v10)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
      goto LABEL_10;
    objc_msgSend(v7, "fullImageUUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "decryptEncryptedData:identifier:", v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
    {
      v13 = 0;
      goto LABEL_16;
    }
    objc_msgSend(v8, "note");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)*MEMORY[0x1E0CEC520], "identifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "lastPathComponent");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addAttachmentWithUTI:data:filename:updateFileBasedAttributes:analytics:regulatoryLogging:", v17, v15, v18, 0, 0, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v8, "note");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addAttachmentWithFileURL:updateFileBasedAttributes:analytics:", v12, 0, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_10:
  if (v13)
  {
    objc_msgSend(v13, "setParentAttachment:", v8);
    objc_msgSend(v13, "setOrientation:", (__int16)objc_msgSend(v7, "currentOrientation"));
    if (objc_msgSend(v7, "hasFilter"))
      objc_msgSend(v13, "setImageFilterType:", objc_msgSend(v7, "currentFilter"));
    objc_msgSend(v7, "imageQuad");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      objc_msgSend(v7, "imageQuad");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setCroppingQuad:", v20);

    }
    objc_msgSend(v7, "markupModelData");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setMarkupModelData:", v21);

    objc_msgSend(v13, "attachmentModel");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "updateFileBasedAttributes");

    objc_msgSend(v13, "identifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setScanDataDelegateIdentifier:", v23);

  }
LABEL_16:

  return v13;
}

+ (id)createAndAddSubAttachmentsToGalleryAttachment:(id)a3 fromDocuments:(id)a4 imageCache:(id)a5 context:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  id v25;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t);
  void *v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0D63BC8], "sharedContext");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "snapshotManagedObjectContext");
    v13 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v10, "objectID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v11, "count"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = MEMORY[0x1E0C809B0];
  v28 = 3221225472;
  v29 = __111__ICGalleryAttachmentUtilities_createAndAddSubAttachmentsToGalleryAttachment_fromDocuments_imageCache_context___block_invoke;
  v30 = &unk_1E5C21140;
  v31 = v13;
  v32 = v15;
  v17 = v11;
  v36 = a1;
  v33 = v17;
  v34 = v12;
  v18 = v16;
  v35 = v18;
  v19 = v12;
  v20 = v15;
  v21 = v13;
  objc_msgSend(v21, "performBlockAndWait:", &v27);
  v22 = objc_msgSend(v18, "count", v27, v28, v29, v30);
  if (v22 != objc_msgSend(v17, "count"))
  {
    v23 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      +[ICGalleryAttachmentUtilities createAndAddSubAttachmentsToGalleryAttachment:fromDocuments:imageCache:context:].cold.1(v17, v18, v23);

  }
  v24 = v35;
  v25 = v18;

  return v25;
}

void __111__ICGalleryAttachmentUtilities_createAndAddSubAttachmentsToGalleryAttachment_fromDocuments_imageCache_context___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "existingObjectWithID:error:", *(_QWORD *)(a1 + 40), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_opt_class();
    objc_msgSend(v2, "attachmentModel");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    ICCheckedDynamicCast();
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v4 = *(id *)(a1 + 48);
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v32;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v32 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v8);
          v10 = (void *)MEMORY[0x1AF445E78]();
          objc_msgSend(*(id *)(a1 + 72), "createSubAttachmentFromDocument:imageCache:galleryAttachment:", v9, *(_QWORD *)(a1 + 56), v2);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = v11;
          if (v11)
          {
            objc_msgSend(v11, "identifier");
            v13 = v2;
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "setScanDataDelegateIdentifier:", v14);

            objc_msgSend(v25, "addObject:", v12);
            v15 = *(void **)(a1 + 64);
            objc_msgSend(v12, "identifier");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "addObject:", v16);

            v2 = v13;
            objc_msgSend(v26, "addSubAttachment:", v12);
          }

          objc_autoreleasePoolPop(v10);
          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      }
      while (v6);
    }

    objc_msgSend(v2, "saveMergeableDataIfNeeded");
    objc_msgSend(v2, "updateChangeCountWithReason:", CFSTR("Add gallery page"));
    objc_msgSend(v2, "attachmentDidChange");
    v17 = (id)objc_msgSend(v2, "ic_postNotificationOnMainThreadAfterSaveWithName:", *MEMORY[0x1E0D63608]);
    objc_msgSend(*(id *)(a1 + 32), "ic_saveWithLogDescription:", CFSTR("Add gallery page"));
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v18 = v25;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v28;
      do
      {
        v22 = 0;
        do
        {
          if (*(_QWORD *)v28 != v21)
            objc_enumerationMutation(v18);
          v23 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v22);
          +[ICAttachmentPreviewGenerator sharedGenerator](ICAttachmentPreviewGenerator, "sharedGenerator", v25);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "generatePreviewIfNeededForAttachment:", v23);

          ++v22;
        }
        while (v20 != v22);
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
      }
      while (v20);
    }

  }
}

+ (id)imageForSubAttachment:(id)a3
{
  return (id)objc_msgSend(a1, "imageForSubAttachment:allowCached:", a3, 1);
}

+ (id)imageForSubAttachment:(id)a3 allowCached:(BOOL)a4
{
  return (id)objc_msgSend(a1, "imageForSubAttachment:rotateForMacImageGallery:allowCached:", a3, 0, a4);
}

+ (id)imageForSubAttachment:(id)a3 rotateForMacImageGallery:(BOOL)a4 allowCached:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  NSObject *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  int v38;

  v5 = a5;
  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "sizeWidth");
  v9 = v8;
  objc_msgSend(v7, "sizeHeight");
  if (v9 <= 0.0 || (v11 = v10, v10 <= 0.0))
  {
    v19 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      +[ICGalleryAttachmentUtilities imageForSubAttachment:rotateForMacImageGallery:allowCached:].cold.1(v7, v19);

    v18 = 0;
  }
  else
  {
    objc_msgSend(v7, "attachmentPreviewImageWithMinSize:scale:", v9, v10, 1.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (!v5)
      goto LABEL_14;
    objc_msgSend(v12, "width");
    v15 = v14;
    objc_msgSend(v13, "height");
    if (v15 >= v16)
      v16 = v15;
    v17 = v9 >= v11 ? v9 : v11;
    if (vabdd_f64(v16, v17) < 0.00999999978)
    {
      objc_msgSend(v13, "orientedImage");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
LABEL_14:
      objc_msgSend(v7, "media");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v7, "imageFilterType");
      v21 = objc_msgSend(v7, "orientation");
      objc_msgSend(v7, "markupModelData");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "croppingQuad");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "isPasswordProtected"))
      {
        objc_msgSend(v20, "decryptedData");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3870]), "initWithData:", v24);
      }
      else
      {
        v26 = (void *)MEMORY[0x1E0DC3870];
        objc_msgSend(v20, "mediaURL");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "ic_imageWithContentsOfURL:", v24);
        v25 = objc_claimAutoreleasedReturnValue();
      }
      v18 = (void *)v25;

      if (v18 && v23)
      {
        objc_msgSend(MEMORY[0x1E0CEE5A0], "perspectiveCorrectedImageFromImage:normalizedImageQuad:", v18, v23);
        v27 = objc_claimAutoreleasedReturnValue();

        v18 = (void *)v27;
      }
      v28 = v22;
      if (v18)
      {
        if (!(v21 | v38))
          goto LABEL_37;
        v29 = 2;
        v30 = 3;
        if (v21 != 2)
          v30 = v21;
        if (v21 != 3)
          v29 = v30;
        v31 = v6 ? v29 : v21;
        objc_msgSend(MEMORY[0x1E0CEE5A0], "filteredImage:orientation:imageFilterType:", v18, v31);
        v32 = objc_claimAutoreleasedReturnValue();

        v18 = (void *)v32;
        if (v32)
        {
LABEL_37:
          if (objc_msgSend(v22, "length"))
          {
            objc_msgSend(MEMORY[0x1E0CEE5A0], "imageWithRGBColorspaceFromImage:", v18);
            v33 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v33, "ic_JPEGData");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = (void *)MEMORY[0x1E0DC3870];
            objc_msgSend(MEMORY[0x1E0D63BA0], "imageDataWithMarkupModelData:sourceImageData:", v28, v34);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "ic_imageWithData:", v36);
            v18 = (void *)objc_claimAutoreleasedReturnValue();

          }
        }
      }

    }
  }

  return v18;
}

+ (CGSize)sizeOfViewForAttachment:(id)a3 textViewContentWidth:(double)a4
{
  double v5;
  double v6;
  CGSize result;

  objc_msgSend(a1, "requiredWidthForAttachment:viewHeight:maxWidth:", a3, 372.0, a4);
  if (v5 > a4)
    v5 = a4;
  v6 = 372.0;
  result.height = v6;
  result.width = v5;
  return result;
}

+ (double)requiredWidthForAttachment:(id)a3 viewHeight:(double)a4 maxWidth:(double)a5
{
  id v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  _QWORD v14[8];
  uint64_t v15;
  double *v16;
  uint64_t v17;
  uint64_t v18;

  v8 = a3;
  v15 = 0;
  v16 = (double *)&v15;
  v17 = 0x2020000000;
  v18 = 0x4028000000000000;
  objc_opt_class();
  objc_msgSend(v8, "attachmentModel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = a4 + -28.0 + -24.0;

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __79__ICGalleryAttachmentUtilities_requiredWidthForAttachment_viewHeight_maxWidth___block_invoke;
  v14[3] = &unk_1E5C21168;
  v14[4] = &v15;
  v14[5] = a1;
  *(double *)&v14[6] = v11;
  *(double *)&v14[7] = a5;
  objc_msgSend(v10, "enumerateSubAttachmentsWithBlock:", v14);
  v12 = v16[3];
  if (v12 < 50.0)
  {
    v16[3] = v11;
    v12 = v11;
  }

  _Block_object_dispose(&v15, 8);
  return v12;
}

uint64_t __79__ICGalleryAttachmentUtilities_requiredWidthForAttachment_viewHeight_maxWidth___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  uint64_t result;
  double v8;
  uint64_t v9;
  double v10;

  result = objc_msgSend(*(id *)(a1 + 40), "sizeOfSubAttachment:forHeight:", a2, *(double *)(a1 + 48));
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = ceil(v8)
                                                              + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                          + 24);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                          + 24)
                                                              + 12.0;
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v10 = *(double *)(a1 + 56);
  if (*(double *)(v9 + 24) > v10)
  {
    *(double *)(v9 + 24) = v10;
    *a5 = 1;
  }
  return result;
}

+ (CGSize)sizeOfSubAttachment:(id)a3 forHeight:(double)a4
{
  id v5;
  double v6;
  double v7;
  CGSize result;

  v5 = a3;
  objc_msgSend(v5, "sizeWidth");
  objc_msgSend(v5, "sizeHeight");

  TSDMultiplySizeScalar();
  if (v6 >= a4 * 1.8)
    v6 = a4 * 1.8;
  if (v6 < a4 * 0.5)
    v6 = a4 * 0.5;
  v7 = a4;
  result.height = v7;
  result.width = v6;
  return result;
}

+ (void)createAndAddSubAttachmentsToGalleryAttachment:(NSObject *)a3 fromDocuments:imageCache:context:.cold.1(void *a1, void *a2, NSObject *a3)
{
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = 134218240;
  v6 = objc_msgSend(a1, "count");
  v7 = 2048;
  v8 = objc_msgSend(a2, "count");
  _os_log_error_impl(&dword_1AC7A1000, a3, OS_LOG_TYPE_ERROR, "Needed to create %lu sub attachments but only created %lu.", (uint8_t *)&v5, 0x16u);
}

+ (void)imageForSubAttachment:(void *)a1 rotateForMacImageGallery:(NSObject *)a2 allowCached:.cold.1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "shortLoggingDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_debug_impl(&dword_1AC7A1000, a2, OS_LOG_TYPE_DEBUG, "Unable to find a size for attachment: %@", (uint8_t *)&v4, 0xCu);

}

@end
