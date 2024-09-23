@implementation ICAttachmentImageModel

- (id)previewImageTypeUTI
{
  void *v3;
  int v4;
  void *v5;
  objc_super v7;

  -[ICAttachmentModel attachment](self, "attachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isChildOfDocumentGallery");

  if (v4)
  {
    objc_msgSend((id)*MEMORY[0x1E0CEC530], "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)ICAttachmentImageModel;
    -[ICAttachmentModel previewImageTypeUTI](&v7, sel_previewImageTypeUTI);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (BOOL)hasThumbnailImage
{
  void *v3;
  double v4;
  BOOL v5;
  void *v6;
  double v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ICAttachmentImageModel;
  if (!-[ICAttachmentModel hasThumbnailImage](&v9, sel_hasThumbnailImage))
    return 0;
  -[ICAttachmentModel attachment](self, "attachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sizeWidth");
  if (v4 >= 50.0)
  {
    -[ICAttachmentModel attachment](self, "attachment");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sizeHeight");
    v5 = v7 >= 50.0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)hasPreviews
{
  return 1;
}

- (int64_t)previewImageOrientation
{
  void *v2;
  int64_t v3;

  -[ICAttachmentModel attachment](self, "attachment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (int)objc_msgSend(v2, "orientation");

  return v3;
}

- (BOOL)needsFullSizePreview
{
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;
  void *v7;

  -[ICAttachmentModel attachment](self, "attachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "imageFilterType"))
  {
    v4 = 1;
  }
  else
  {
    -[ICAttachmentModel attachment](self, "attachment");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "markupModelData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "length"))
    {
      v4 = 1;
    }
    else
    {
      -[ICAttachmentModel attachment](self, "attachment");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "orientation"))
        v4 = 1;
      else
        v4 = -[ICAttachmentImageModel shouldCropImage](self, "shouldCropImage");

    }
  }

  return v4;
}

- (BOOL)shouldCropImage
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  BOOL v11;

  -[ICAttachmentModel attachment](self, "attachment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "croppingQuadBottomLeftX");
  if (fabs(v3) >= 0.00999999978
    || (objc_msgSend(v2, "croppingQuadBottomLeftY"), fabs(v4) >= 0.00999999978)
    || (objc_msgSend(v2, "croppingQuadBottomRightX"), fabs(v5 + -1.0) >= 0.00999999978)
    || (objc_msgSend(v2, "croppingQuadBottomRightY"), fabs(v6) >= 0.00999999978)
    || (objc_msgSend(v2, "croppingQuadTopLeftX"), fabs(v7) >= 0.00999999978)
    || (objc_msgSend(v2, "croppingQuadTopLeftY"), fabs(v8 + -1.0) >= 0.00999999978)
    || (objc_msgSend(v2, "croppingQuadTopRightX"), fabs(v9 + -1.0) >= 0.00999999978))
  {
    v11 = 1;
  }
  else
  {
    objc_msgSend(v2, "croppingQuadTopRightY");
    v11 = fabs(v10 + -1.0) >= 0.00999999978;
  }

  return v11;
}

- (id)placeholderImageSystemName
{
  return CFSTR("photo");
}

+ (id)contentInfoTextWithAttachmentCount:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("NOTE_LIST_PHOTOS_%lu"), CFSTR("NOTE_LIST_PHOTOS_%lu"), 0, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringWithFormat:", v5, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)previewItemTitle
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  objc_super v12;

  -[ICAttachmentModel attachment](self, "attachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isChildOfDocumentGallery");

  if (!v4)
  {
    v12.receiver = self;
    v12.super_class = (Class)ICAttachmentImageModel;
    -[ICAttachmentModel previewItemTitle](&v12, sel_previewItemTitle);
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  -[ICAttachmentModel attachment](self, "attachment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "parentAttachment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "attachmentModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAttachmentModel attachment](self, "attachment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "titleForSubAttachment:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Scan"), CFSTR("Scan"), 0, 1);
    v10 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v9 = (void *)v10;
  }
  return v9;
}

- (BOOL)canMarkup
{
  return 1;
}

- (id)saveURL
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__52;
  v12 = __Block_byref_object_dispose__52;
  v13 = 0;
  -[ICAttachmentModel attachment](self, "attachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __33__ICAttachmentImageModel_saveURL__block_invoke;
  v7[3] = &unk_1E76C76B0;
  v7[4] = self;
  v7[5] = &v8;
  objc_msgSend(v4, "performBlockAndWait:", v7);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __33__ICAttachmentImageModel_saveURL__block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  objc_super v18;

  objc_msgSend(*(id *)(a1 + 32), "attachment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isChildOfDocumentGallery");

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "attachment");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sizeWidth");
    v6 = v5;
    objc_msgSend(*(id *)(a1 + 32), "attachment");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sizeHeight");
    v9 = v8;

    objc_msgSend(*(id *)(a1 + 32), "attachment");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "attachmentPreviewImageWithMinSize:scale:", v6, v9, 1.0);
    v17 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "orientedPreviewImageURL");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;

  }
  else
  {
    v18.receiver = *(id *)(a1 + 32);
    v18.super_class = (Class)ICAttachmentImageModel;
    objc_msgSendSuper2(&v18, sel_saveURL);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v16 = *(void **)(v15 + 40);
    *(_QWORD *)(v15 + 40) = v14;

  }
}

- (BOOL)canSaveURL
{
  void *v3;
  void *v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[ICAttachmentModel attachment](self, "attachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __36__ICAttachmentImageModel_canSaveURL__block_invoke;
  v6[3] = &unk_1E76C76B0;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v4, "performBlockAndWait:", v6);

  LOBYTE(v3) = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return (char)v3;
}

void __36__ICAttachmentImageModel_canSaveURL__block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  objc_super v4;

  objc_msgSend(*(id *)(a1 + 32), "attachment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isChildOfDocumentGallery");

  if (v3)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
  else
  {
    v4.receiver = *(id *)(a1 + 32);
    v4.super_class = (Class)ICAttachmentImageModel;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSendSuper2(&v4, sel_canSaveURL);
  }
}

- (id)generateHardLinkURLIfNecessaryForURL:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  objc_super v10;
  objc_super v11;

  v4 = a3;
  -[ICAttachmentModel attachment](self, "attachment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isChildOfDocumentGallery");

  if ((v6 & 1) != 0)
  {
    -[ICAttachmentImageModel previewItemTitle](self, "previewItemTitle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v10.receiver = self;
      v10.super_class = (Class)ICAttachmentImageModel;
      -[ICAttachmentModel generateHardLinkURLIfNecessaryForURL:withFileName:](&v10, sel_generateHardLinkURLIfNecessaryForURL_withFileName_, v4, v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)ICAttachmentImageModel;
    -[ICAttachmentModel generateHardLinkURLIfNecessaryForURL:](&v11, sel_generateHardLinkURLIfNecessaryForURL_, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (BOOL)supportsOCR
{
  void *v2;
  char v3;

  -[ICAttachmentModel attachment](self, "attachment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isPasswordProtected") ^ 1;

  return v3;
}

- (BOOL)supportsImageClassification
{
  void *v3;
  BOOL v4;
  void *v5;

  -[ICAttachmentModel attachment](self, "attachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isPasswordProtected") & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    -[ICAttachmentModel attachment](self, "attachment");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "attachmentType") == 3;

  }
  return v4;
}

- (void)updateFileBasedAttributes
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ICAttachmentImageModel;
  -[ICAttachmentModel updateFileBasedAttributes](&v3, sel_updateFileBasedAttributes);
  -[ICAttachmentImageModel updateAttachmentSize](self, "updateAttachmentSize");
}

- (void)addLocation
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  const __CFURL *v8;
  CGImageSource *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  id v22;
  CFDictionaryRef v23;

  -[ICAttachmentModel attachment](self, "attachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "media");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isValid");

  if (v5)
  {
    -[ICAttachmentModel attachment](self, "attachment");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "media");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "mediaURL");
    v8 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
    v9 = CGImageSourceCreateWithURL(v8, 0);

    if (v9)
    {
      v23 = CGImageSourceCopyPropertiesAtIndex(v9, 0, 0);
      -[__CFDictionary objectForKey:](v23, "objectForKey:", *MEMORY[0x1E0CBCD68]);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v10)
      {
        objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCD90]);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCDA0]);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCD98]);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCDA8]);
        v15 = objc_claimAutoreleasedReturnValue();
        v16 = (void *)v15;
        if (v12 && v13 && v14 && v15)
        {
          objc_msgSend(v12, "doubleValue");
          v18 = v17;
          objc_msgSend(v13, "doubleValue");
          v20 = v19;
          if (!objc_msgSend(v14, "compare:options:range:", CFSTR("S"), 1, 0, 1))
            v18 = -v18;
          if (!objc_msgSend(v16, "compare:options:range:", CFSTR("W"), 1, 0, 1))
            v20 = -v20;
          -[ICAttachmentModel attachment](self, "attachment");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = (id)objc_msgSend(v21, "addLocationWithLatitude:longitude:", v18, v20);

        }
      }
      CFRelease(v9);

    }
  }
}

- (void)updateAttachmentSize
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  const __CFData *v11;
  CGImageSource *v12;
  void *v13;
  void *v14;
  const __CFURL *v15;
  CFDictionaryRef v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  uint64_t v35;
  double v36;
  void *v37;
  unsigned int v38;
  double v39;
  void *v40;
  double v41;
  double v42;
  void *v43;
  void *v44;
  double v45;
  double v46;
  void *v47;
  void *v48;
  CFDictionaryRef v49;

  -[ICAttachmentModel attachment](self, "attachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isPasswordProtected");

  -[ICAttachmentModel attachment](self, "attachment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "media");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v4)
  {
    v8 = objc_msgSend(v6, "isAuthenticated");

    if (!v8)
      return;
    -[ICAttachmentModel attachment](self, "attachment");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "media");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "decryptedData");
    v11 = (const __CFData *)objc_claimAutoreleasedReturnValue();

    if (v11)
      v12 = CGImageSourceCreateWithData(v11, 0);
    else
      v12 = 0;
  }
  else
  {
    objc_msgSend(v6, "mediaURL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
      return;
    -[ICAttachmentModel attachment](self, "attachment");
    v11 = (const __CFData *)objc_claimAutoreleasedReturnValue();
    -[__CFData media](v11, "media");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "mediaURL");
    v15 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
    v12 = CGImageSourceCreateWithURL(v15, 0);

  }
  if (v12)
  {
    v16 = CGImageSourceCopyPropertiesAtIndex(v12, 0, 0);
    v49 = v16;
    if (!v16)
    {
LABEL_41:
      CFRelease(v12);

      return;
    }
    -[__CFDictionary objectForKeyedSubscript:](v16, "objectForKeyedSubscript:", *MEMORY[0x1E0CBD048]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFDictionary objectForKeyedSubscript:](v49, "objectForKeyedSubscript:", *MEMORY[0x1E0CBD040]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFDictionary objectForKeyedSubscript:](v49, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCA00]);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFDictionary objectForKeyedSubscript:](v49, "objectForKeyedSubscript:", *MEMORY[0x1E0CBC9F8]);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v17 || !v18)
    {
LABEL_40:

      goto LABEL_41;
    }
    objc_msgSend(v17, "doubleValue");
    v22 = v21;
    objc_msgSend(v18, "doubleValue");
    v24 = v23;
    if (v19)
    {
      objc_msgSend(v19, "doubleValue");
      if (v25 > 72.0)
      {
        objc_msgSend(v19, "doubleValue");
        if (v26 < 300.0)
        {
          objc_msgSend(v19, "doubleValue");
          v22 = round(v22 * 72.0 / v27);
        }
      }
    }
    if (v20)
    {
      objc_msgSend(v20, "doubleValue");
      if (v28 > 72.0)
      {
        objc_msgSend(v20, "doubleValue");
        if (v29 < 300.0)
        {
          objc_msgSend(v20, "doubleValue");
          v24 = round(v24 * 72.0 / v30);
        }
      }
    }
    if (-[ICAttachmentImageModel shouldCropImage](self, "shouldCropImage"))
    {
      -[ICAttachmentImageModel sizeByCroppingSize:](self, "sizeByCroppingSize:", v22, v24);
      v22 = v31;
      v24 = v32;
    }
    -[__CFDictionary objectForKeyedSubscript:](v49, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCFF0]);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v33;
    if (v33)
    {
      v35 = objc_msgSend(v33, "integerValue");
      if (v35 <= 4)
        v36 = v24;
      else
        v36 = v22;
      if (v35 > 4)
        v22 = v24;
      v24 = v36;
    }
    -[ICAttachmentModel attachment](self, "attachment");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v37, "orientation");

    if (v38 <= 7 && ((1 << v38) & 0xCC) != 0)
    {
      v39 = v22;
    }
    else
    {
      v39 = v24;
      v24 = v22;
    }
    -[ICAttachmentModel attachment](self, "attachment");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "sizeWidth");
    v42 = v41;

    if (v42 != v24)
    {
      -[ICAttachmentModel attachment](self, "attachment");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "setSizeWidth:", v24);

    }
    -[ICAttachmentModel attachment](self, "attachment");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "sizeHeight");
    v46 = v45;

    if (v46 == v39)
    {
      if (v42 == v24)
      {
LABEL_39:

        goto LABEL_40;
      }
    }
    else
    {
      -[ICAttachmentModel attachment](self, "attachment");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "setSizeHeight:", v39);

    }
    -[ICAttachmentModel attachment](self, "attachment");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "updateChangeCountWithReason:", CFSTR("Updated attachment size"));

    goto LABEL_39;
  }
}

- (CGSize)sizeByCroppingSize:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  float v34;
  float v35;
  float v36;
  double v37;
  double v38;
  double v39;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[ICAttachmentModel attachment](self, "attachment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "croppingQuadBottomLeftX");
  v8 = width * v7;

  -[ICAttachmentModel attachment](self, "attachment");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "croppingQuadBottomLeftY");
  v11 = height * v10;

  -[ICAttachmentModel attachment](self, "attachment");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "croppingQuadBottomRightX");
  v14 = width * v13;

  -[ICAttachmentModel attachment](self, "attachment");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "croppingQuadBottomRightY");
  v17 = height * v16;

  -[ICAttachmentModel attachment](self, "attachment");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "croppingQuadTopLeftX");
  v20 = width * v19;

  -[ICAttachmentModel attachment](self, "attachment");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "croppingQuadTopLeftY");
  v23 = height * v22;

  -[ICAttachmentModel attachment](self, "attachment");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "croppingQuadTopRightX");
  v26 = width * v25;

  -[ICAttachmentModel attachment](self, "attachment");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "croppingQuadTopRightY");
  v29 = height * v28;

  v30 = sqrt((v23 - v29) * (v23 - v29) + (v20 - v26) * (v20 - v26));
  v31 = sqrt((v17 - v11) * (v17 - v11) + (v14 - v8) * (v14 - v8));
  v32 = sqrt((v23 - v11) * (v23 - v11) + (v20 - v8) * (v20 - v8));
  v33 = sqrt((v17 - v29) * (v17 - v29) + (v14 - v26) * (v14 - v26));
  v34 = v30 / v31;
  v35 = v32 / v33;
  if (v34 <= 1.0)
    v34 = 1.0 / v34;
  if (v35 <= 1.0)
    v35 = 1.0 / v35;
  if (v35 >= v34)
    v36 = v35;
  else
    v36 = v34;
  if (v36 > 2.0)
  {
    v37 = 2.0 / v36;
    v35 = v37 * v35;
    v34 = v37 * v34;
  }
  if (v32 < v33)
    v32 = v33;
  if (v30 < v31)
    v30 = v31;
  v38 = ceil(v30 * v35) + -2.0;
  v39 = ceil(v32 * v34) + -2.0;
  result.height = v39;
  result.width = v38;
  return result;
}

- (BOOL)supportsQuickLook
{
  return 1;
}

- (CGAffineTransform)previewImageOrientationTransform
{
  void *v5;
  uint64_t v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  CGAffineTransform v13;
  CGAffineTransform v14;

  memset(&v14, 0, sizeof(v14));
  -[ICAttachmentModel attachment](self, "attachment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (int)objc_msgSend(v5, "orientation");
  -[ICAttachmentModel attachment](self, "attachment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sizeWidth");
  v9 = v8;
  -[ICAttachmentModel attachment](self, "attachment");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sizeHeight");
  ICTransformFromImageOrientation(v6, (uint64_t)&v14, v9, v11);

  v13 = v14;
  return CGAffineTransformInvert(retstr, &v13);
}

- (BOOL)shouldUsePlaceholderBoundsIfNecessary
{
  void *v3;
  int v4;
  void *v5;
  void *v6;

  -[ICAttachmentModel attachment](self, "attachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "fileSize"))
  {
    LOBYTE(v4) = 1;
  }
  else
  {
    -[ICAttachmentModel attachment](self, "attachment");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "typeUTI");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v6, "isEqual:", CFSTR("public.image")) ^ 1;

  }
  return v4;
}

- (double)placeholderWidth
{
  return 540.0;
}

- (double)placeholderHeight
{
  return 460.0;
}

- (id)attributesForSharingHTMLWithTagName:(id *)a3 textContent:(id *)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  *a3 = CFSTR("img");
  -[ICAttachmentModel attachment](self, "attachment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "media");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "base64EncodedStringWithOptions:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAttachmentModel attachment](self, "attachment");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "typeUTI");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICAttachment mimeTypeFromUTI:](ICAttachment, "mimeTypeFromUTI:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("style=\"max-width: 100%%; max-height: 100%%;\" src=\"data:%@;base64,%@\"),
    v11,
    v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (BOOL)canConvertToHTMLForSharing
{
  return 1;
}

@end
