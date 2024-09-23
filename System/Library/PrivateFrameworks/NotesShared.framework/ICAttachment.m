@implementation ICAttachment

- (BOOL)hasFallbackImage
{
  void *v3;
  char v4;

  if ((-[ICAttachment isPasswordProtected](self, "isPasswordProtected") & 1) != 0)
    -[ICAttachment fallbackImageEncryptedURL](self, "fallbackImageEncryptedURL");
  else
    -[ICAttachment fallbackImageURL](self, "fallbackImageURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "ic_isReachable");

  return v4;
}

- (id)fallbackImageURL
{
  void *v3;
  void *v4;
  id v5;
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

  -[ICAttachment account](self, "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[ICAttachment note](self, "note");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "account");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v5 = v7;
    }
    else
    {
      -[ICAttachment note](self, "note");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "folder");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "account");
      v5 = (id)objc_claimAutoreleasedReturnValue();

    }
  }

  -[ICAttachment identifier](self, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = 0;
  if (v11 && v5)
  {
    -[ICAttachment(Management) fallbackImageGenerationManager](self, "fallbackImageGenerationManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "generationURL");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      -[ICAttachment(Management) fallbackImageGenerationManager](self, "fallbackImageGenerationManager");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "generationURL");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "URLByAppendingPathComponent:isDirectory:", CFSTR("FallbackImage"), 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend((id)objc_opt_class(), "fallbackImageUTI");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "pathExtension");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "URLByAppendingPathExtension:", v19);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v20 = (void *)objc_opt_class();
      -[ICAttachment identifier](self, "identifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "fallbackImageFallbackURLForIdentifier:account:", v17, v5);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  return v12;
}

+ (id)fallbackImageEncryptedFallbackURLForIdentifier:(id)a3 account:(id)a4
{
  void *v4;
  void *v5;

  objc_msgSend(a1, "fallbackImageFallbackURLForIdentifier:account:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLByAppendingPathExtension:", CFSTR("encrypted"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)fallbackImageContainerURLForIdentifier:(id)a3 account:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  objc_msgSend(a4, "fallbackImageDirectoryURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLByAppendingPathComponent:isDirectory:", v5, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)fallbackImageFallbackURLForIdentifier:(id)a3 account:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a3;
  objc_msgSend(a4, "fallbackImageDirectoryURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLByAppendingPathComponent:isDirectory:", v5, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "URLByAppendingPathExtension:", CFSTR("jpg"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void __60__ICAttachment_isTypeUTISupportedForPasswordProtectedNotes___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "ic_addNonNilObject:", *MEMORY[0x1E0CEC520]);
  objc_msgSend(v14, "ic_addNonNilObject:", *MEMORY[0x1E0CEC530]);
  objc_msgSend(v14, "ic_addNonNilObject:", *MEMORY[0x1E0CEC618]);
  +[ICUTType typeWithIdentifier:](ICUTType, "typeWithIdentifier:", CFSTR("com.apple.notes.sketch"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "ic_addNonNilObject:", v0);

  +[ICUTType typeWithIdentifier:](ICUTType, "typeWithIdentifier:", CFSTR("com.apple.notes.gallery"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "ic_addNonNilObject:", v1);

  +[ICUTType typeWithIdentifier:](ICUTType, "typeWithIdentifier:", CFSTR("com.apple.notes.table"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "ic_addNonNilObject:", v2);

  +[ICUTType typeWithIdentifier:](ICUTType, "typeWithIdentifier:", CFSTR("com.apple.drawing"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "ic_addNonNilObject:", v3);

  +[ICUTType typeWithIdentifier:](ICUTType, "typeWithIdentifier:", CFSTR("com.apple.drawing.2"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "ic_addNonNilObject:", v4);

  +[ICUTType typeWithIdentifier:](ICUTType, "typeWithIdentifier:", CFSTR("com.apple.paper"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "ic_addNonNilObject:", v5);

  +[ICUTType typeWithIdentifier:](ICUTType, "typeWithIdentifier:", CFSTR("com.apple.paper.doc.scan"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "ic_addNonNilObject:", v6);

  +[ICUTType typeWithIdentifier:](ICUTType, "typeWithIdentifier:", CFSTR("com.apple.notes.inlinetextattachment.link"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "ic_addNonNilObject:", v7);

  +[ICUTType typeWithIdentifier:](ICUTType, "typeWithIdentifier:", CFSTR("com.apple.notes.inlinetextattachment.calculateresult"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "ic_addNonNilObject:", v8);

  +[ICUTType typeWithIdentifier:](ICUTType, "typeWithIdentifier:", CFSTR("com.apple.notes.inlinetextattachment.calculategraphexpression"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "ic_addNonNilObject:", v9);

  v10 = objc_msgSend(v14, "copy");
  v11 = (void *)isTypeUTISupportedForPasswordProtectedNotes__supportedTypes;
  isTypeUTISupportedForPasswordProtectedNotes__supportedTypes = v10;

  objc_msgSend((id)isTypeUTISupportedForPasswordProtectedNotes__supportedTypes, "ic_compactMap:", &__block_literal_global_451);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)isTypeUTISupportedForPasswordProtectedNotes__supportedTypeStrings;
  isTypeUTISupportedForPasswordProtectedNotes__supportedTypeStrings = v12;

}

void __53__ICAttachment_Previews__checkPreviewImagesIntegrity__block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "previewImages", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * i);
        if ((objc_msgSend(v7, "imageIsWriting") & 1) == 0 && (objc_msgSend(v7, "imageIsValid") & 1) == 0)
        {
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
          goto LABEL_12;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_12:

}

- (BOOL)previewsSupportMultipleAppearances
{
  void *v2;
  char v3;

  -[ICAttachment attachmentModel](self, "attachmentModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "previewsSupportMultipleAppearances");

  return v3;
}

- (id)attachmentPreviewImageWithMinSize:(CGSize)a3 scale:(double)a4 appearanceType:(unint64_t)a5 requireAppearance:(BOOL)a6
{
  _BOOL8 v6;
  double height;
  double width;
  void *v12;

  v6 = a6;
  height = a3.height;
  width = a3.width;
  -[ICAttachment attachmentPreviewImageWithMinSize:scale:appearanceType:matchScale:matchAppearance:](self, "attachmentPreviewImageWithMinSize:scale:appearanceType:matchScale:matchAppearance:", a5, 1, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    -[ICAttachment attachmentPreviewImageWithMinSize:scale:appearanceType:matchScale:matchAppearance:](self, "attachmentPreviewImageWithMinSize:scale:appearanceType:matchScale:matchAppearance:", a5, 0, v6, width, height, a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v12;
}

- (id)attachmentPreviewImageWithMinSize:(CGSize)a3 scale:(double)a4 appearanceType:(unint64_t)a5 matchScale:(BOOL)a6 matchAppearance:(BOOL)a7
{
  _BOOL4 v7;
  double v9;
  double height;
  double width;
  int v13;
  double v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  id v32;
  double v33;
  double v34;
  _BOOL4 v35;
  int v36;
  _BOOL4 v37;
  int v38;
  int v39;
  int v41;
  int v42;
  int v43;
  char v44;
  double v45;
  id v46;
  double v47;
  char v48;
  uint64_t v49;
  void *v50;
  void *v51;
  id v52;
  double v54;
  ICAttachment *v55;
  _BOOL4 v56;
  void *v57;
  id obj;
  double v59;
  double v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _BYTE v65[128];
  uint64_t v66;

  v56 = a7;
  v7 = a6;
  v9 = a4;
  height = a3.height;
  width = a3.width;
  v66 = *MEMORY[0x1E0C80C00];
  if (a4 <= 0.0)
  {
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "scale > 0.", "-[ICAttachment(Previews) attachmentPreviewImageWithMinSize:scale:appearanceType:matchScale:matchAppearance:]", 1, 0, CFSTR("Passing invalid scale to attachmentPreviewImageWithMinSize"));
    v9 = 1.0;
  }
  v13 = -[ICAttachment attachmentType](self, "attachmentType");
  -[ICAttachment checkPreviewImagesIntegrity](self, "checkPreviewImagesIntegrity");
  if (v7)
    v14 = 1.0;
  else
    v14 = v9;
  -[ICAttachment previewImages](self, "previewImages");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "count");

  if (!v16)
  {
    v50 = 0;
    v19 = 0;
    goto LABEL_62;
  }
  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  -[ICAttachment previewImages](self, "previewImages");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v65, 16);
  if (!v17)
  {
    v57 = 0;
    v19 = 0;
    goto LABEL_61;
  }
  v18 = v17;
  v54 = v9;
  v55 = self;
  v57 = 0;
  v19 = 0;
  v20 = width * v14;
  v21 = height * v14;
  v23 = *MEMORY[0x1E0C9D820];
  v22 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  v24 = *(_QWORD *)v62;
  v59 = v22;
  v60 = *MEMORY[0x1E0C9D820];
  do
  {
    v25 = 0;
    do
    {
      if (*(_QWORD *)v62 != v24)
        objc_enumerationMutation(obj);
      v26 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * v25);
      objc_msgSend(v26, "width");
      v28 = v27;
      objc_msgSend(v26, "height");
      v30 = v29;
      if (v13 == 8 && (v28 > v60 || v29 > v59))
      {
        v32 = v26;

        v57 = v32;
        v59 = v30;
        v60 = v28;
      }
      if (!v7)
      {
        objc_msgSend(v26, "scale");
        v28 = v28 * v33;
        objc_msgSend(v26, "scale");
        v30 = v30 * v34;
      }
      v35 = v23 >= v28;
      if (v22 >= v30)
        v35 = 1;
      v36 = !v35;
      v37 = v28 >= v20;
      if (v30 < v21)
        v37 = 0;
      v38 = v37 && v35;
      if (v22 < v21)
        v38 = v36;
      if (v23 >= v20)
        v39 = v38;
      else
        v39 = v36;
      if (v28 < v20 * 0.95 || v30 < v21 * 0.95)
        v41 = objc_msgSend(v26, "scaleWhenDrawing") ^ 1;
      else
        LOBYTE(v41) = 0;
      if ((int)objc_msgSend(v26, "appearanceType") == a5)
      {
        if (v19)
          v42 = v39;
        else
          v42 = 1;
        if (v42 != 1)
          goto LABEL_50;
      }
      else
      {
        v43 = -[ICAttachment previewsSupportMultipleAppearances](v55, "previewsSupportMultipleAppearances") && v56;
        if (v19)
          v44 = v39;
        else
          v44 = 1;
        if (v43 == 1 || (v44 & 1) == 0)
          goto LABEL_50;
      }
      if (!v7 || (objc_msgSend(v26, "scale"), v45 == 0.0))
      {
        if ((v41 & 1) != 0)
          goto LABEL_50;
LABEL_49:
        v46 = v26;

        v23 = v28;
        v22 = v30;
        v19 = v46;
        goto LABEL_50;
      }
      objc_msgSend(v26, "scale");
      if (v47 == v54)
        v48 = v41;
      else
        v48 = 1;
      if ((v48 & 1) == 0)
        goto LABEL_49;
LABEL_50:
      ++v25;
    }
    while (v18 != v25);
    v49 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v65, 16);
    v18 = v49;
  }
  while (v49);
LABEL_61:

  v50 = v57;
LABEL_62:
  if (v13 == 8)
    v51 = v50;
  else
    v51 = v19;
  v52 = v51;

  return v52;
}

- (BOOL)checkPreviewImagesIntegrity
{
  id v3;
  uint64_t v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  BOOL v11;
  void *v13;
  void *v14;
  int v15;
  dispatch_time_t v16;
  _QWORD v17[5];
  _QWORD v18[5];
  _QWORD v19[6];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;

  if (checkPreviewImagesIntegrity_onceToken != -1)
    dispatch_once(&checkPreviewImagesIntegrity_onceToken, &__block_literal_global_921);
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 1;
  v3 = (id)checkPreviewImagesIntegrity_sCheckedAttachments;
  objc_sync_enter(v3);
  v4 = checkPreviewImagesIntegrity_sCheckedAttachments;
  -[ICAttachment objectID](self, "objectID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend((id)v4, "containsObject:", v5);

  if ((v4 & 1) != 0)
  {
    objc_sync_exit(v3);

  }
  else
  {
    v7 = (void *)checkPreviewImagesIntegrity_sCheckedAttachments;
    -[ICAttachment objectID](self, "objectID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v8);

    objc_sync_exit(v3);
    -[ICAttachment managedObjectContext](self, "managedObjectContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __53__ICAttachment_Previews__checkPreviewImagesIntegrity__block_invoke_2;
    v19[3] = &unk_1E76C76B0;
    v19[4] = self;
    v19[5] = &v20;
    objc_msgSend(v9, "performBlockAndWait:", v19);

    if (*((_BYTE *)v21 + 24))
    {
      v6 = 1;
      goto LABEL_8;
    }
    -[ICAttachment managedObjectContext](self, "managedObjectContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v10;
    v18[1] = 3221225472;
    v18[2] = __53__ICAttachment_Previews__checkPreviewImagesIntegrity__block_invoke_3;
    v18[3] = &unk_1E76C73F8;
    v18[4] = self;
    objc_msgSend(v13, "performBlockAndWait:", v18);

    +[ICNoteContext sharedContext](ICNoteContext, "sharedContext");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "hasContextOptions:", 32);

    if (v15)
    {
      v16 = dispatch_time(0, 1000000000);
      v17[0] = v10;
      v17[1] = 3221225472;
      v17[2] = __53__ICAttachment_Previews__checkPreviewImagesIntegrity__block_invoke_923;
      v17[3] = &unk_1E76C73F8;
      v17[4] = self;
      dispatch_after(v16, MEMORY[0x1E0C80D38], v17);
    }
  }
  v6 = *((unsigned __int8 *)v21 + 24);
LABEL_8:
  v11 = v6 != 0;
  _Block_object_dispose(&v20, 8);
  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_fallbackPDFGenerationManager, 0);
  objc_storeStrong((id *)&self->_fallbackImageGenerationManager, 0);
  objc_storeStrong((id *)&self->_remoteFileURL, 0);
  objc_storeStrong((id *)&self->_loadOperation, 0);
  objc_storeStrong((id *)&self->_attachmentModel, 0);
}

- (void)didTurnIntoFault
{
  NSURL *remoteFileURL;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ICAttachment;
  -[ICCloudSyncingObject didTurnIntoFault](&v4, sel_didTurnIntoFault);
  remoteFileURL = self->_remoteFileURL;
  self->_remoteFileURL = 0;

}

- (signed)preferredViewSize
{
  void *v3;
  uint64_t v4;
  ICTTMergeableWallClockValue *v5;
  void *v6;
  ICTTMergeableWallClockValue *v7;
  void *v8;
  void *v9;
  signed __int16 v10;
  signed __int16 v11;

  -[ICAttachment mergeablePreferredViewSize](self, "mergeablePreferredViewSize");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (v4)
  {
    v5 = [ICTTMergeableWallClockValue alloc];
    -[ICAttachment mergeablePreferredViewSize](self, "mergeablePreferredViewSize");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[ICTTMergeableWallClockValue initWithData:](v5, "initWithData:", v6);

  }
  else
  {
    v7 = 0;
  }
  -[ICTTMergeableWallClockValue value](v7, "value");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[ICTTMergeableWallClockValue value](v7, "value");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "shortValue");
  }
  else
  {
    -[ICAttachment note](self, "note");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "attachmentViewType");
  }
  v11 = v10;

  return v11;
}

uint64_t __60__ICAttachment_isTypeUTISupportedForPasswordProtectedNotes___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "conformsToType:", a2);
}

- (BOOL)isChildOfDocumentGallery
{
  ICAttachment *v2;
  void *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[ICAttachment managedObjectContext](self, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __40__ICAttachment_isChildOfDocumentGallery__block_invoke;
  v5[3] = &unk_1E76C7730;
  v5[4] = v2;
  v5[5] = &v6;
  objc_msgSend(v3, "performBlockAndWait:", v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (double)sizeHeight
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  int v7;
  void *v8;
  double v9;

  -[ICAttachment willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("sizeHeight"));
  -[ICAttachment primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("sizeHeight"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValue");
  v5 = v4;

  -[ICAttachment didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("sizeHeight"));
  if (v5 == 0.0)
  {
    -[ICAttachment attachmentModel](self, "attachmentModel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "shouldUsePlaceholderBoundsIfNecessary");

    if (v7)
    {
      -[ICAttachment attachmentModel](self, "attachmentModel");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "placeholderHeight");
      v5 = v9;

    }
  }
  return v5;
}

- (double)sizeWidth
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  int v7;
  void *v8;
  double v9;

  -[ICAttachment willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("sizeWidth"));
  -[ICAttachment primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("sizeWidth"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValue");
  v5 = v4;

  -[ICAttachment didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("sizeWidth"));
  if (v5 == 0.0)
  {
    -[ICAttachment attachmentModel](self, "attachmentModel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "shouldUsePlaceholderBoundsIfNecessary");

    if (v7)
    {
      -[ICAttachment attachmentModel](self, "attachmentModel");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "placeholderWidth");
      v5 = v9;

    }
  }
  return v5;
}

void __31__ICAttachment_attachmentModel__block_invoke(uint64_t a1)
{
  _QWORD *v1;
  id *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  NSObject *v6;

  v2 = (id *)(a1 + 32);
  v1 = *(_QWORD **)(a1 + 32);
  if (!v1[25])
  {
    v3 = objc_msgSend(objc_alloc(+[ICAttachmentModel modelClassForAttachmentType:](ICAttachmentModel, "modelClassForAttachmentType:", objc_msgSend(v1, "attachmentType"))), "initWithAttachment:", *v2);
    v4 = (void *)*((_QWORD *)*v2 + 25);
    *((_QWORD *)*v2 + 25) = v3;

    v1 = *v2;
  }
  if (objc_msgSend(v1, "isFault"))
  {
    if (objc_msgSend(*v2, "attachmentType") == 9)
    {
      objc_msgSend(*v2, "identifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5)
      {
        v6 = os_log_create("com.apple.notes", "CoreData");
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
          __31__ICAttachment_attachmentModel__block_invoke_cold_1(v2, v6);

      }
    }
  }
}

- (BOOL)shouldShowInContentInfoText
{
  char v3;
  void *v4;
  void *v5;

  if ((-[ICAttachment markedForDeletion](self, "markedForDeletion") & 1) != 0)
    return 0;
  -[ICAttachment parentAttachment](self, "parentAttachment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 || -[ICAttachment isBeingEditedLocallyOnDevice](self, "isBeingEditedLocallyOnDevice"))
  {
    v3 = 0;
  }
  else
  {
    -[ICAttachment attachmentModel](self, "attachmentModel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v5, "shouldShowInContentInfoText");

  }
  return v3;
}

- (id)attachmentModel
{
  void *v3;
  _QWORD v5[5];

  -[ICAttachment managedObjectContext](self, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __31__ICAttachment_attachmentModel__block_invoke;
  v5[3] = &unk_1E76C73F8;
  v5[4] = self;
  objc_msgSend(v3, "performBlockAndWait:", v5);

  return self->_attachmentModel;
}

- (BOOL)isBeingEditedLocallyOnDevice
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend((id)objc_opt_class(), "isBeingEditedLocallyOnDeviceSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAttachment identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3;
  objc_sync_enter(v5);
  LOBYTE(v3) = objc_msgSend(v5, "containsObject:", v4);
  objc_sync_exit(v5);

  return (char)v3;
}

+ (id)isBeingEditedLocallyOnDeviceSet
{
  if (isBeingEditedLocallyOnDeviceSet_onceToken != -1)
    dispatch_once(&isBeingEditedLocallyOnDeviceSet_onceToken, &__block_literal_global_285);
  return (id)isBeingEditedLocallyOnDeviceSet_sIsBeingEditedLocallyOnDeviceSet;
}

- (signed)attachmentType
{
  signed __int16 attachmentType;
  void *v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  _BOOL4 v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  _BOOL4 v17;
  void *v18;
  _BOOL4 v19;
  void *v20;
  int v21;
  void *v22;
  int v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  int v30;

  if (-[ICAttachment isUnsupported](self, "isUnsupported"))
  {
    attachmentType = 1;
  }
  else
  {
    attachmentType = self->_attachmentType;
    if (attachmentType)
      return attachmentType;
    -[ICAttachment typeUTI](self, "typeUTI");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
      return self->_attachmentType;
    -[ICAttachment typeUTI](self, "typeUTI");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = +[ICAttachment typeUTIIsImage:](ICAttachment, "typeUTIIsImage:", v6);

    if (v7)
    {
      attachmentType = 3;
    }
    else
    {
      -[ICAttachment typeUTI](self, "typeUTI");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = +[ICAttachment typeUTIIsPlayableAudio:](ICAttachment, "typeUTIIsPlayableAudio:", v8);

      if (v9)
      {
        attachmentType = 4;
      }
      else
      {
        -[ICAttachment typeUTI](self, "typeUTI");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = +[ICAttachment typeUTIIsPlayableMovie:](ICAttachment, "typeUTIIsPlayableMovie:", v10);

        if (v11)
        {
          attachmentType = 5;
        }
        else
        {
          v12 = (void *)MEMORY[0x1E0CEC3F8];
          -[ICAttachment typeUTI](self, "typeUTI");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "typeWithIdentifier:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "conformsToType:", *MEMORY[0x1E0CEC570]);

          if (v15)
          {
            attachmentType = 6;
          }
          else
          {
            -[ICAttachment typeUTI](self, "typeUTI");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = +[ICAttachment typeUTIIsInlineDrawing:](ICAttachment, "typeUTIIsInlineDrawing:", v16);

            if (v17)
            {
              attachmentType = 10;
            }
            else
            {
              -[ICAttachment typeUTI](self, "typeUTI");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v19 = +[ICAttachment typeUTIIsDrawing:](ICAttachment, "typeUTIIsDrawing:", v18);

              if (v19)
              {
                attachmentType = 9;
              }
              else
              {
                -[ICAttachment typeUTI](self, "typeUTI");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                v21 = objc_msgSend(v20, "isEqualToString:", CFSTR("com.apple.notes.gallery"));

                if (v21)
                {
                  attachmentType = 11;
                }
                else
                {
                  -[ICAttachment typeUTI](self, "typeUTI");
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  v23 = objc_msgSend(v22, "isEqualToString:", CFSTR("com.apple.notes.table"));

                  if (v23)
                  {
                    attachmentType = 12;
                  }
                  else
                  {
                    -[ICAttachment typeUTI](self, "typeUTI");
                    v24 = (void *)objc_claimAutoreleasedReturnValue();
                    v25 = objc_msgSend(v24, "isEqualToString:", CFSTR("com.apple.paper"));

                    if (v25)
                    {
                      attachmentType = 13;
                    }
                    else
                    {
                      -[ICAttachment typeUTI](self, "typeUTI");
                      v26 = (void *)objc_claimAutoreleasedReturnValue();
                      if (objc_msgSend(v26, "isEqualToString:", CFSTR("com.apple.paper.doc")))
                      {

                      }
                      else
                      {
                        -[ICAttachment typeUTI](self, "typeUTI");
                        v27 = (void *)objc_claimAutoreleasedReturnValue();
                        v28 = objc_msgSend(v27, "isEqualToString:", CFSTR("com.apple.paper.doc.pdf"));

                        if (!v28)
                        {
                          -[ICAttachment typeUTI](self, "typeUTI");
                          v29 = (void *)objc_claimAutoreleasedReturnValue();
                          v30 = objc_msgSend(v29, "isEqualToString:", CFSTR("com.apple.paper.doc.scan"));

                          if (v30)
                          {
                            attachmentType = 15;
                          }
                          else if (-[ICAttachment isURL](self, "isURL"))
                          {
                            if (-[ICAttachment isMap](self, "isMap"))
                              attachmentType = 7;
                            else
                              attachmentType = 8;
                          }
                          else
                          {
                            attachmentType = 2;
                          }
                          goto LABEL_3;
                        }
                      }
                      attachmentType = 14;
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
LABEL_3:
  self->_attachmentType = attachmentType;
  return attachmentType;
}

- (BOOL)isUnsupported
{
  unsigned __int8 v3;
  void *v4;
  void *v5;
  int v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ICAttachment;
  v3 = -[ICCloudSyncingObject isUnsupported](&v8, sel_isUnsupported);
  -[ICAttachment typeUTI](self, "typeUTI");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[ICAttachment typeUTI](self, "typeUTI");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = !+[ICAttachment isTypeUTISupportedForPasswordProtectedNotes:](ICAttachment, "isTypeUTISupportedForPasswordProtectedNotes:", v5);

  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v3 | -[ICAttachment isPasswordProtected](self, "isPasswordProtected") & v6;
}

+ (BOOL)isTypeUTISupportedForPasswordProtectedNotes:(id)a3
{
  id v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v3 = a3;
  if (isTypeUTISupportedForPasswordProtectedNotes__onceToken != -1)
    dispatch_once(&isTypeUTISupportedForPasswordProtectedNotes__onceToken, &__block_literal_global_449);
  if ((objc_msgSend((id)isTypeUTISupportedForPasswordProtectedNotes__supportedTypeStrings, "containsObject:", v3) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    +[ICUTType typeWithIdentifier:](ICUTType, "typeWithIdentifier:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      v7 = (void *)isTypeUTISupportedForPasswordProtectedNotes__supportedTypes;
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __60__ICAttachment_isTypeUTISupportedForPasswordProtectedNotes___block_invoke_3;
      v9[3] = &unk_1E76CF7B8;
      v10 = v5;
      v4 = objc_msgSend(v7, "ic_containsObjectPassingTest:", v9);

    }
    else
    {
      v4 = 0;
    }

  }
  return v4;
}

+ (BOOL)typeUTIIsImage:(id)a3
{
  id v3;
  void *v4;
  int v5;

  v3 = a3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "conformsToType:", *MEMORY[0x1E0CEC520])
      && (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.drawing.2")) & 1) == 0)
    {
      v5 = objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.drawing")) ^ 1;
    }
    else
    {
      LOBYTE(v5) = 0;
    }

  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

+ (BOOL)typeUTIIsPlayableMovie:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;

  v3 = a3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "conformsToType:", *MEMORY[0x1E0CEC568]))
    {
      objc_msgSend(MEMORY[0x1E0C8B3C0], "audiovisualTypes");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "containsObject:", v3))
        v6 = objc_msgSend(v3, "isEqualToString:", CFSTR("public.avi")) ^ 1;
      else
        LOBYTE(v6) = 0;

    }
    else
    {
      LOBYTE(v6) = 0;
    }

  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

+ (BOOL)typeUTIIsPlayableAudio:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;

  v3 = a3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "conformsToType:", *MEMORY[0x1E0CEC450]))
    {
      objc_msgSend(MEMORY[0x1E0C8B3C0], "audiovisualTypes");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "containsObject:", v3);

    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (BOOL)typeUTIIsInlineDrawing:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;

  v3 = a3;
  if (v3)
  {
    +[ICUTType typeWithIdentifier:](ICUTType, "typeWithIdentifier:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEC3F8], "exportedTypeWithIdentifier:", CFSTR("com.apple.drawing.2"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "conformsToType:", v5) & 1) != 0)
    {
      v6 = 1;
    }
    else
    {
      +[ICUTType typeWithIdentifier:](ICUTType, "typeWithIdentifier:", v3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CEC3F8], "exportedTypeWithIdentifier:", CFSTR("com.apple.drawing"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v7, "conformsToType:", v8);

    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)awakeFromFetch
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ICAttachment;
  -[ICCloudSyncingObject awakeFromFetch](&v3, sel_awakeFromFetch);
  -[ICAttachmentModel attachmentAwakeFromFetch](self->_attachmentModel, "attachmentAwakeFromFetch");
  -[ICAssetGenerationManager updateCurrentGeneration](self->_fallbackImageGenerationManager, "updateCurrentGeneration");
  -[ICAssetGenerationManager updateCurrentGeneration](self->_fallbackPDFGenerationManager, "updateCurrentGeneration");
}

- (id)childCloudObjects
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  -[ICAttachment media](self, "media");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return MEMORY[0x1E0C9AA60];
  -[ICAttachment media](self, "media");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __60__ICAttachment_isTypeUTISupportedForPasswordProtectedNotes___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

- (void)willTurnIntoFault
{
  objc_super v3;

  -[ICAttachmentModel attachmentWillTurnIntoFault](self->_attachmentModel, "attachmentWillTurnIntoFault");
  v3.receiver = self;
  v3.super_class = (Class)ICAttachment;
  -[ICAttachment willTurnIntoFault](&v3, sel_willTurnIntoFault);
}

- (void)dealloc
{
  ICAttachmentModel *attachmentModel;
  objc_super v4;

  attachmentModel = self->_attachmentModel;
  if (attachmentModel)
    -[ICAttachmentModel attachmentIsDeallocating:](attachmentModel, "attachmentIsDeallocating:", self);
  v4.receiver = self;
  v4.super_class = (Class)ICAttachment;
  -[ICAttachment dealloc](&v4, sel_dealloc);
}

+ (void)initialize
{
  char v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  void *v9;
  id v10;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCapacity:", 26);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v2 = 112;
  v3 = MEMORY[0x1E0C80978];
  v4 = 1u;
  do
  {
    LOWORD(v5) = v2;
    v6 = (unsigned __int16)v2;
    if (v2 < 0)
    {
      if (!__maskrune((unsigned __int16)v2, 0x100uLL))
        goto LABEL_9;
      if (__maskrune((unsigned __int16)v5, 0x8000uLL))
        goto LABEL_5;
    }
    else
    {
      v7 = *(_DWORD *)(v3 + 4 * (unsigned __int16)v2 + 60);
      if ((v7 & 0x100) == 0)
        goto LABEL_9;
      if ((v7 & 0x8000) != 0)
      {
LABEL_5:
        v5 = (v6 - 52) % 26 + 65;
        goto LABEL_9;
      }
    }
    v5 = (v6 - 84) % 26 + 97;
LABEL_9:
    objc_msgSend(v10, "appendFormat:", CFSTR("%C"), (unsigned __int16)v5);
    v2 = aPbzNccyrVebapn[v4++];
  }
  while (v4 != 27);
  v8 = objc_msgSend(v10, "copy");
  v9 = (void *)ICAttachmentUTTypeDrawingLegacy;
  ICAttachmentUTTypeDrawingLegacy = v8;

}

void __40__ICAttachment_isChildOfDocumentGallery__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "parentAttachment");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "attachmentType") == 11;

}

- (NSString)title
{
  return (NSString *)-[ICCloudSyncingObject valueForEncryptableKey:](self, "valueForEncryptableKey:", CFSTR("title"));
}

- (void)willRefresh:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[ICAttachmentModel attachmentWillRefresh:](self->_attachmentModel, "attachmentWillRefresh:");
  v5.receiver = self;
  v5.super_class = (Class)ICAttachment;
  -[ICAttachment willRefresh:](&v5, sel_willRefresh_, v3);
}

- (void)didRefresh:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)ICAttachment;
  -[ICAttachment didRefresh:](&v5, sel_didRefresh_);
  -[ICAttachmentModel attachmentDidRefresh:](self->_attachmentModel, "attachmentDidRefresh:", v3);
}

- (CGSize)intrinsicContentSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[ICAttachment attachmentModel](self, "attachmentModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "intrinsicContentSize");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (NSData)markupModelData
{
  return (NSData *)-[ICCloudSyncingObject valueForEncryptableKey:](self, "valueForEncryptableKey:", CFSTR("markupModelData"));
}

void __53__ICAttachment_Previews__checkPreviewImagesIntegrity__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v1 = (void *)checkPreviewImagesIntegrity_sCheckedAttachments;
  checkPreviewImagesIntegrity_sCheckedAttachments = (uint64_t)v0;

}

void __47__ICAttachment_isBeingEditedLocallyOnDeviceSet__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)isBeingEditedLocallyOnDeviceSet_sIsBeingEditedLocallyOnDeviceSet;
  isBeingEditedLocallyOnDeviceSet_sIsBeingEditedLocallyOnDeviceSet = v0;

}

- (void)updateMarkedForDeletionStateAttachmentIsInUse:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  -[ICAttachment typeUTI](self, "typeUTI");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[ICAttachment attachmentModel](self, "attachmentModel");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "updateAttachmentMarkedForDeletionStateAttachmentIsInUse:", v3);

  }
}

- (void)setTypeUTI:(id)a3 resetToIntrinsicNotesVersion:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  char v8;
  NSObject *v9;
  ICAttachmentModel *attachmentModel;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v4 = a4;
  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[ICAttachment typeUTI](self, "typeUTI");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", v6);

  if ((v8 & 1) == 0)
  {
    -[ICAttachment willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("typeUTI"));
    -[ICAttachment setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v6, CFSTR("typeUTI"));
    -[ICAttachment updateAttachmentSectionWithTypeUTI:](self, "updateAttachmentSectionWithTypeUTI:", v6);
    -[ICAttachment didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("typeUTI"));
    if (self->_attachmentModel)
    {
      v9 = os_log_create("com.apple.notes", "CoreData");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        -[ICAttachment setTypeUTI:resetToIntrinsicNotesVersion:].cold.1(self, v9);

      attachmentModel = self->_attachmentModel;
      self->_attachmentModel = 0;

    }
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    -[ICAttachment subAttachments](self, "subAttachments", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v19 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          objc_msgSend(v16, "typeUTI");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "updateAttachmentSectionWithTypeUTI:", v17);

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v13);
    }

    if (v4)
      -[ICCloudSyncingObject resetToIntrinsicNotesVersionAndPropagateToChildObjects](self, "resetToIntrinsicNotesVersionAndPropagateToChildObjects");
  }

}

- (void)setTypeUTI:(id)a3
{
  -[ICAttachment setTypeUTI:resetToIntrinsicNotesVersion:](self, "setTypeUTI:resetToIntrinsicNotesVersion:", a3, 1);
}

+ (BOOL)typeUTIIsSystemPaper:(id)a3
{
  return objc_msgSend(a3, "isEqualToString:", CFSTR("com.apple.paper"));
}

- (void)loadFromArchive:(const void *)a3 dataPersister:(id)a4 withIdentifierMap:(id)a5
{
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t *v18;
  uint64_t v19;
  int v20;
  id v21;
  uint64_t *v22;
  uint64_t v23;
  void *v24;
  id v25;
  uint64_t *v26;
  uint64_t v27;
  void *v28;
  id v29;
  uint64_t *v30;
  uint64_t v31;
  void *v32;
  unsigned int v33;
  id v34;
  uint64_t *v35;
  uint64_t v36;
  void *v37;
  id v38;
  uint64_t *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  uint64_t *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t v55;
  double v56;
  topotext::Attachment *v57;
  uint64_t v58;
  uint64_t v59;
  int v60;
  void *v61;
  _QWORD *v62;
  void *v63;
  uint64_t v64;
  uint64_t *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  void *v70;
  id v71;
  NSObject *v72;
  uint64_t v73;
  void *v74;
  void *v75;
  void *v76;
  uint64_t v77;
  _QWORD *v78;
  void *v79;
  uint64_t v80;
  uint64_t *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  _QWORD *v85;
  void *v86;
  uint64_t v87;
  uint64_t *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  topotext::Attachment *v92;
  topotext::Attachment *v93;
  uint64_t v94;
  topotext::Attachment *v95;
  _QWORD *v96;
  void *v97;
  uint64_t v98;
  uint64_t *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  void *v103;
  uint64_t v104;
  topotext::Attachment *v105;
  void *v106;
  uint64_t v107;
  void *v108;
  void *v109;
  _QWORD *v110;
  void *v111;
  uint64_t v112;
  uint64_t *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  NSObject *v117;
  os_log_t v118;
  Class isa;
  uint64_t v120;
  uint64_t v121;
  void *v122;
  int v123;
  id v124;
  uint64_t *v125;
  uint64_t v126;
  void *v127;
  id v128;
  uint64_t *v129;
  uint64_t v130;
  int v131;
  id v132;
  uint64_t *v133;
  uint64_t v134;
  void *v135;
  id v136;
  uint64_t *v137;
  uint64_t v138;
  void *v139;
  uint64_t v140;
  uint64_t i;
  void *v142;
  int v143;
  int j;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  int v153;
  int k;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  id v163;
  uint64_t *v164;
  uint64_t v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  int v174;
  id v175;
  uint64_t *v176;
  uint64_t v177;
  void *v178;
  id v179;
  uint64_t *v180;
  uint64_t v181;
  void *v182;
  void *v183;
  void *v184;
  uint64_t v185;
  void *v186;
  void *v187;
  __CFString *v188;
  _QWORD *v189;
  id v190;
  id v191;
  id v192;
  uint8_t buf[4];
  void *v194;
  __int16 v195;
  uint64_t v196;
  __int16 v197;
  void *v198;
  uint64_t v199;

  v199 = *MEMORY[0x1E0C80C00];
  v191 = a4;
  v189 = a3;
  v190 = a5;
  if ((*((_BYTE *)a3 + 32) & 1) != 0)
  {
    v8 = objc_alloc(MEMORY[0x1E0CB3940]);
    v9 = (uint64_t *)*((_QWORD *)a3 + 5);
    if (*((char *)v9 + 23) < 0)
    {
      v9 = (uint64_t *)*v9;
      v10 = *(_QWORD *)(*((_QWORD *)a3 + 5) + 8);
    }
    else
    {
      v10 = *((unsigned __int8 *)v9 + 23);
    }
    v11 = objc_msgSend(v8, "initWithBytes:length:encoding:", v9, v10, 4);
    if (v190)
    {
      -[ICAttachment identifier](self, "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v190, "setObject:forKeyedSubscript:", v12, v11);

    }
    v188 = (__CFString *)v11;
  }
  else
  {
    v188 = &stru_1E76DB108;
  }
  if ((*((_DWORD *)a3 + 8) & 0x1000000) != 0)
    v13 = *((_QWORD *)a3 + 29);
  else
    v13 = 0;
  v14 = -[ICCloudSyncingObject requireMinimumSupportedVersionAndPropagateToChildObjects:](self, "requireMinimumSupportedVersionAndPropagateToChildObjects:", v13);
  if ((*((_BYTE *)a3 + 32) & 2) != 0)
  {
    v17 = objc_alloc(MEMORY[0x1E0C99D50]);
    v18 = (uint64_t *)*((_QWORD *)a3 + 6);
    if (*((char *)v18 + 23) < 0)
    {
      v18 = (uint64_t *)*v18;
      v19 = *(_QWORD *)(*((_QWORD *)a3 + 6) + 8);
    }
    else
    {
      v19 = *((unsigned __int8 *)v18 + 23);
    }
    v15 = (void *)objc_msgSend(v17, "initWithBytes:length:", v18, v19);
    -[ICAttachment setMergeableData:](self, "setMergeableData:", v15);
  }
  else
  {
    if (!v191)
      goto LABEL_20;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%@"), v188, CFSTR("mergeableData"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v191, "loadDataForIdentifier:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAttachment setMergeableData:](self, "setMergeableData:", v16);

  }
LABEL_20:
  v20 = *((_DWORD *)a3 + 8);
  if ((v20 & 4) != 0)
  {
    v14 = -[ICAttachment setSizeHeight:](self, "setSizeHeight:", *((float *)a3 + 14));
    v20 = *((_DWORD *)a3 + 8);
  }
  if ((v20 & 8) != 0)
  {
    v14 = -[ICAttachment setSizeWidth:](self, "setSizeWidth:", *((float *)a3 + 15));
    v20 = *((_DWORD *)a3 + 8);
  }
  if ((v20 & 0x800) != 0)
  {
    v14 = -[ICAttachment setOriginX:](self, "setOriginX:", *((float *)a3 + 34));
    v20 = *((_DWORD *)a3 + 8);
  }
  if ((v20 & 0x1000) != 0)
  {
    v14 = -[ICAttachment setOriginY:](self, "setOriginY:", *((float *)a3 + 35));
    v20 = *((_DWORD *)a3 + 8);
  }
  if ((v20 & 0x2000) != 0)
  {
    v14 = -[ICAttachment setOrientation:](self, "setOrientation:", *((__int16 *)a3 + 80));
    v20 = *((_DWORD *)a3 + 8);
  }
  if ((v20 & 0x10) != 0)
  {
    v21 = objc_alloc(MEMORY[0x1E0CB3940]);
    v22 = (uint64_t *)*((_QWORD *)a3 + 8);
    if (*((char *)v22 + 23) < 0)
    {
      v22 = (uint64_t *)*v22;
      v23 = *(_QWORD *)(*((_QWORD *)a3 + 8) + 8);
    }
    else
    {
      v23 = *((unsigned __int8 *)v22 + 23);
    }
    v24 = (void *)objc_msgSend(v21, "initWithBytes:length:encoding:", v22, v23, 4);
    -[ICAttachment setSummary:](self, "setSummary:", v24);

    v20 = *((_DWORD *)a3 + 8);
  }
  if ((v20 & 0x20) != 0)
  {
    v25 = objc_alloc(MEMORY[0x1E0CB3940]);
    v26 = (uint64_t *)*((_QWORD *)a3 + 9);
    if (*((char *)v26 + 23) < 0)
    {
      v26 = (uint64_t *)*v26;
      v27 = *(_QWORD *)(*((_QWORD *)a3 + 9) + 8);
    }
    else
    {
      v27 = *((unsigned __int8 *)v26 + 23);
    }
    v28 = (void *)objc_msgSend(v25, "initWithBytes:length:encoding:", v26, v27, 4);
    -[ICAttachment setTitle:](self, "setTitle:", v28);

  }
  if ((*((_BYTE *)a3 + 36) & 4) != 0)
  {
    v29 = objc_alloc(MEMORY[0x1E0CB3940]);
    v30 = (uint64_t *)*((_QWORD *)a3 + 39);
    if (*((char *)v30 + 23) < 0)
    {
      v30 = (uint64_t *)*v30;
      v31 = *(_QWORD *)(*((_QWORD *)a3 + 39) + 8);
    }
    else
    {
      v31 = *((unsigned __int8 *)v30 + 23);
    }
    v32 = (void *)objc_msgSend(v29, "initWithBytes:length:encoding:", v30, v31, 4);
    -[ICAttachment setUserTitle:](self, "setUserTitle:", v32);

  }
  v33 = *((_DWORD *)a3 + 8);
  if ((v33 & 0x40) != 0)
  {
    v34 = objc_alloc(MEMORY[0x1E0CB3940]);
    v35 = (uint64_t *)*((_QWORD *)a3 + 10);
    if (*((char *)v35 + 23) < 0)
    {
      v35 = (uint64_t *)*v35;
      v36 = *(_QWORD *)(*((_QWORD *)a3 + 10) + 8);
    }
    else
    {
      v36 = *((unsigned __int8 *)v35 + 23);
    }
    v37 = (void *)objc_msgSend(v34, "initWithBytes:length:encoding:", v35, v36, 4);
    -[ICAttachment setTypeUTI:resetToIntrinsicNotesVersion:](self, "setTypeUTI:resetToIntrinsicNotesVersion:", v37, 0);

    v33 = *((_DWORD *)a3 + 8);
  }
  if ((v33 & 0x80) != 0)
  {
    v38 = objc_alloc(MEMORY[0x1E0CB3940]);
    v39 = (uint64_t *)*((_QWORD *)a3 + 11);
    if (*((char *)v39 + 23) < 0)
    {
      v39 = (uint64_t *)*v39;
      v40 = *(_QWORD *)(*((_QWORD *)a3 + 11) + 8);
    }
    else
    {
      v40 = *((unsigned __int8 *)v39 + 23);
    }
    v41 = (void *)objc_msgSend(v38, "initWithBytes:length:encoding:", v39, v40, 4);
    -[ICAttachment setUrlString:](self, "setUrlString:", v41);

    v33 = *((_DWORD *)a3 + 8);
  }
  if ((v33 & 0x4000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", *((double *)a3 + 18));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAttachment setPreviewUpdateDate:](self, "setPreviewUpdateDate:", v42);

    v33 = *((_DWORD *)a3 + 8);
  }
  if ((v33 & 0x8000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", *((double *)a3 + 19));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAttachment setCreationDate:](self, "setCreationDate:", v43);

    v33 = *((_DWORD *)a3 + 8);
  }
  if ((v33 & 0x10000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", *((double *)a3 + 21));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAttachment setModificationDate:](self, "setModificationDate:", v44);

    v33 = *((_DWORD *)a3 + 8);
  }
  if ((v33 & 0x20000) != 0)
  {
    v45 = objc_alloc(MEMORY[0x1E0CB3940]);
    v46 = (uint64_t *)*((_QWORD *)a3 + 22);
    if (*((char *)v46 + 23) < 0)
    {
      v46 = (uint64_t *)*v46;
      v47 = *(_QWORD *)(*((_QWORD *)a3 + 22) + 8);
    }
    else
    {
      v47 = *((unsigned __int8 *)v46 + 23);
    }
    v48 = (void *)objc_msgSend(v45, "initWithBytes:length:encoding:", v46, v47, 4);
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAttachment setRemoteFileURL:](self, "setRemoteFileURL:", v49);

    v33 = *((_DWORD *)a3 + 8);
  }
  if ((v33 & 0x40000) != 0)
  {
    v14 = -[ICAttachment setCheckedForLocation:](self, "setCheckedForLocation:", *((unsigned __int8 *)a3 + 164));
    v33 = *((_DWORD *)a3 + 8);
  }
  if ((v33 & 0x80000) != 0)
  {
    v14 = -[ICAttachment setFileSize:](self, "setFileSize:", *((_QWORD *)a3 + 23));
    v33 = *((_DWORD *)a3 + 8);
  }
  if ((v33 & 0x100000) != 0)
  {
    v14 = -[ICAttachment setDuration:](self, "setDuration:", *((double *)a3 + 24));
    v33 = *((_DWORD *)a3 + 8);
  }
  if ((v33 & 0x200000) != 0)
  {
    v14 = -[ICAttachment setImageFilterType:](self, "setImageFilterType:", *((__int16 *)a3 + 196));
    v33 = *((_DWORD *)a3 + 8);
  }
  if ((v33 & 0x400000) != 0)
  {
    v52 = objc_alloc(MEMORY[0x1E0C99D50]);
    v53 = (uint64_t *)*((_QWORD *)a3 + 25);
    if (*((char *)v53 + 23) < 0)
    {
      v53 = (uint64_t *)*v53;
      v54 = *(_QWORD *)(*((_QWORD *)a3 + 25) + 8);
    }
    else
    {
      v54 = *((unsigned __int8 *)v53 + 23);
    }
    v50 = (void *)objc_msgSend(v52, "initWithBytes:length:", v53, v54);
    -[ICAttachment setMarkupModelData:](self, "setMarkupModelData:", v50);
    goto LABEL_81;
  }
  if (v191)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%@"), v188, CFSTR("markupModelData"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v191, "loadDataForIdentifier:", v50);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAttachment setMarkupModelData:](self, "setMarkupModelData:", v51);

LABEL_81:
    v33 = *((_DWORD *)a3 + 8);
  }
  if (v33 >> 25 == 127 && (*((_BYTE *)a3 + 36) & 1) != 0)
  {
    -[ICAttachment setCroppingQuadBottomLeftX:](self, "setCroppingQuadBottomLeftX:", *((double *)a3 + 30));
    -[ICAttachment setCroppingQuadBottomLeftY:](self, "setCroppingQuadBottomLeftY:", *((double *)a3 + 31));
    -[ICAttachment setCroppingQuadBottomRightX:](self, "setCroppingQuadBottomRightX:", *((double *)a3 + 32));
    -[ICAttachment setCroppingQuadBottomRightY:](self, "setCroppingQuadBottomRightY:", *((double *)a3 + 33));
    -[ICAttachment setCroppingQuadTopLeftX:](self, "setCroppingQuadTopLeftX:", *((double *)a3 + 34));
    -[ICAttachment setCroppingQuadTopLeftY:](self, "setCroppingQuadTopLeftY:", *((double *)a3 + 35));
    -[ICAttachment setCroppingQuadTopRightX:](self, "setCroppingQuadTopRightX:", *((double *)a3 + 36));
    v14 = -[ICAttachment setCroppingQuadTopRightY:](self, "setCroppingQuadTopRightY:", *((double *)a3 + 37));
    v33 = *((_DWORD *)a3 + 8);
  }
  if ((v33 & 0x100) != 0)
  {
    v55 = *((_QWORD *)a3 + 12);
    if (v55)
    {
      v56 = *(double *)(v55 + 40);
    }
    else
    {
      v57 = (topotext::Attachment *)topotext::Attachment::default_instance((topotext::Attachment *)v14);
      v55 = *((_QWORD *)a3 + 12);
      v56 = *(double *)(*((_QWORD *)v57 + 12) + 40);
      if (!v55)
        v55 = *(_QWORD *)(topotext::Attachment::default_instance(v57) + 96);
    }
    v14 = (uint64_t)-[ICAttachment addLocationWithLatitude:longitude:](self, "addLocationWithLatitude:longitude:", v56, *(double *)(v55 + 48));
    v58 = *((_QWORD *)a3 + 12);
    v59 = v58;
    if (!v58)
    {
      v14 = topotext::Attachment::default_instance((topotext::Attachment *)v14);
      v59 = *(_QWORD *)(v14 + 96);
      v58 = *((_QWORD *)a3 + 12);
    }
    if ((*(_BYTE *)(v59 + 32) & 8) != 0)
    {
      if (!v58)
        v58 = *(_QWORD *)(topotext::Attachment::default_instance((topotext::Attachment *)v14) + 96);
      v60 = *(unsigned __int8 *)(v58 + 64);
      -[ICAttachment location](self, "location");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "setPlaceUpdated:", v60 != 0);

      v58 = v189[12];
    }
    if (!v58)
    {
      v14 = topotext::Attachment::default_instance((topotext::Attachment *)v14);
      v58 = *(_QWORD *)(v14 + 96);
    }
    if ((*(_BYTE *)(v58 + 32) & 4) != 0)
    {
      v62 = objc_alloc(MEMORY[0x1E0C99D50]);
      v63 = v62;
      v64 = v189[12];
      if (!v64)
      {
        v62 = (_QWORD *)topotext::Attachment::default_instance((topotext::Attachment *)v62);
        v64 = v62[12];
      }
      v65 = *(uint64_t **)(v64 + 56);
      if (*((char *)v65 + 23) < 0)
        v65 = (uint64_t *)*v65;
      v66 = v189[12];
      if (!v66)
        v66 = *(_QWORD *)(topotext::Attachment::default_instance((topotext::Attachment *)v62) + 96);
      v67 = *(_QWORD *)(v66 + 56);
      if (*(char *)(v67 + 23) < 0)
        v68 = *(_QWORD *)(v67 + 8);
      else
        v68 = *(unsigned __int8 *)(v67 + 23);
      v69 = (void *)objc_msgSend(v63, "initWithBytes:length:", v65, v68);
      v192 = 0;
      v70 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v69, &v192);
      v71 = v192;
      if (v71)
      {
        v72 = os_log_create("com.apple.notes", "Topotext");
        if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
          -[ICAttachment(ICAttachmentPersistenceAdditions) loadFromArchive:dataPersister:withIdentifierMap:].cold.1((uint64_t)v71, v72, v73);

      }
      objc_opt_class();
      objc_msgSend(v70, "decodeObjectOfClass:forKey:", objc_opt_class(), *MEMORY[0x1E0CB2CD0]);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      ICCheckedDynamicCast();
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICAttachment location](self, "location");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "setPlacemark:", v75);

    }
  }
  if ((*((_BYTE *)v189 + 33) & 2) != 0)
  {
    v77 = v189[13];
    if (!v77)
      v77 = *(_QWORD *)(topotext::Attachment::default_instance((topotext::Attachment *)v14) + 104);
    if ((*(_BYTE *)(v77 + 32) & 8) != 0)
    {
      v85 = objc_alloc(MEMORY[0x1E0CB3940]);
      v86 = v85;
      v87 = v189[13];
      if (!v87)
      {
        v85 = (_QWORD *)topotext::Attachment::default_instance((topotext::Attachment *)v85);
        v87 = v85[13];
      }
      v88 = *(uint64_t **)(v87 + 64);
      if (*((char *)v88 + 23) < 0)
        v88 = (uint64_t *)*v88;
      v89 = v189[13];
      if (!v89)
        v89 = *(_QWORD *)(topotext::Attachment::default_instance((topotext::Attachment *)v85) + 104);
      v90 = *(_QWORD *)(v89 + 64);
      if (*(char *)(v90 + 23) < 0)
        v91 = *(_QWORD *)(v90 + 8);
      else
        v91 = *(unsigned __int8 *)(v90 + 23);
      v95 = (topotext::Attachment *)objc_msgSend(v86, "initWithBytes:length:encoding:", v88, v91, 4);
    }
    else
    {
      v78 = objc_alloc(MEMORY[0x1E0CB3940]);
      v79 = v78;
      v80 = v189[13];
      if (!v80)
      {
        v78 = (_QWORD *)topotext::Attachment::default_instance((topotext::Attachment *)v78);
        v80 = v78[13];
      }
      v81 = *(uint64_t **)(v80 + 40);
      if (*((char *)v81 + 23) < 0)
        v81 = (uint64_t *)*v81;
      v82 = v189[13];
      if (!v82)
        v82 = *(_QWORD *)(topotext::Attachment::default_instance((topotext::Attachment *)v78) + 104);
      v83 = *(_QWORD *)(v82 + 40);
      if (*(char *)(v83 + 23) < 0)
        v84 = *(_QWORD *)(v83 + 8);
      else
        v84 = *(unsigned __int8 *)(v83 + 23);
      v92 = (topotext::Attachment *)objc_msgSend(v79, "initWithBytes:length:encoding:", v81, v84, 4);
      v93 = v92;
      v94 = v189[13];
      if (!v94)
        v94 = *(_QWORD *)(topotext::Attachment::default_instance(v92) + 104);
      if ((*(_BYTE *)(v94 + 32) & 2) != 0)
      {
        v96 = objc_alloc(MEMORY[0x1E0CB3940]);
        v97 = v96;
        v98 = v189[13];
        if (!v98)
        {
          v96 = (_QWORD *)topotext::Attachment::default_instance((topotext::Attachment *)v96);
          v98 = v96[13];
        }
        v99 = *(uint64_t **)(v98 + 48);
        if (*((char *)v99 + 23) < 0)
          v99 = (uint64_t *)*v99;
        v100 = v189[13];
        if (!v100)
          v100 = *(_QWORD *)(topotext::Attachment::default_instance((topotext::Attachment *)v96) + 104);
        v101 = *(_QWORD *)(v100 + 48);
        if (*(char *)(v101 + 23) < 0)
          v102 = *(_QWORD *)(v101 + 8);
        else
          v102 = *(unsigned __int8 *)(v101 + 23);
        v103 = (void *)objc_msgSend(v97, "initWithBytes:length:encoding:", v99, v102, 4);
        -[topotext::Attachment stringByAppendingPathExtension:](v93, "stringByAppendingPathExtension:", v103);
        v95 = (topotext::Attachment *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v95 = v93;
      }

    }
    -[topotext::Attachment ic_sanitizedFilenameString](v95, "ic_sanitizedFilenameString");
    v104 = objc_claimAutoreleasedReturnValue();

    v106 = (void *)v104;
    v107 = v189[13];
    if (!v107)
      v107 = *(_QWORD *)(topotext::Attachment::default_instance(v105) + 104);
    if ((*(_BYTE *)(v107 + 32) & 4) != 0)
    {
      v110 = objc_alloc(MEMORY[0x1E0C99D50]);
      v111 = v110;
      v112 = v189[13];
      if (!v112)
      {
        v110 = (_QWORD *)topotext::Attachment::default_instance((topotext::Attachment *)v110);
        v112 = v110[13];
      }
      v113 = *(uint64_t **)(v112 + 56);
      if (*((char *)v113 + 23) < 0)
        v113 = (uint64_t *)*v113;
      v114 = v189[13];
      if (!v114)
        v114 = *(_QWORD *)(topotext::Attachment::default_instance((topotext::Attachment *)v110) + 104);
      v115 = *(_QWORD *)(v114 + 56);
      if (*(char *)(v115 + 23) < 0)
        v116 = *(_QWORD *)(v115 + 8);
      else
        v116 = *(unsigned __int8 *)(v115 + 23);
      v109 = (void *)objc_msgSend(v111, "initWithBytes:length:", v113, v116);
      if (!v109)
        goto LABEL_173;
    }
    else
    {
      if (!v191)
      {
        v109 = 0;
        goto LABEL_173;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%@"), v188, CFSTR("media"));
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v191, "loadDataForIdentifier:", v108);
      v109 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v109)
        goto LABEL_173;
    }
    if (v106)
    {
      -[ICAttachment addMediaWithData:filename:updateFileBasedAttributes:](self, "addMediaWithData:filename:updateFileBasedAttributes:", v109, v106, 0);
      v117 = objc_claimAutoreleasedReturnValue();
      v118 = v117;
      isa = (Class)v189[13];
      if (!isa)
      {
        v117 = topotext::Attachment::default_instance((topotext::Attachment *)v117);
        isa = v117[13].isa;
      }
      if ((*((_BYTE *)isa + 32) & 0x10) != 0)
      {
        v121 = v189[13];
        if (!v121)
          v121 = *(_QWORD *)(topotext::Attachment::default_instance((topotext::Attachment *)v117) + 104);
        v120 = *(_QWORD *)(v121 + 72);
      }
      else
      {
        v120 = 0;
      }
      -[NSObject requireMinimumSupportedVersionAndPropagateToChildObjects:](v118, "requireMinimumSupportedVersionAndPropagateToChildObjects:", v120);
      goto LABEL_180;
    }
LABEL_173:
    v118 = os_log_create("com.apple.notes", "Archiving");
    if (os_log_type_enabled(v118, OS_LOG_TYPE_ERROR))
    {
      -[ICCloudSyncingObject ic_loggingIdentifier](self, "ic_loggingIdentifier");
      v184 = (void *)objc_claimAutoreleasedReturnValue();
      v185 = objc_msgSend(v109, "length");
      *(_DWORD *)buf = 138412802;
      v194 = v184;
      v195 = 2048;
      v196 = v185;
      v197 = 2112;
      v198 = v106;
      _os_log_error_impl(&dword_1BD918000, v118, OS_LOG_TYPE_ERROR, "Failed to unarchive media for attachment (%@) because either the data (%lu bytes) or filename (%@) were missing", buf, 0x20u);

    }
LABEL_180:

  }
  if (v191)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_fallbackImage"), v188);
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v191, "loadDataForIdentifier:", v122);
    v186 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v123 = *((_DWORD *)v189 + 9);
    if ((v123 & 8) == 0)
    {
      v186 = 0;
      if ((v123 & 0x100) == 0)
        goto LABEL_201;
      goto LABEL_195;
    }
    v124 = objc_alloc(MEMORY[0x1E0C99D50]);
    v125 = (uint64_t *)v189[40];
    if (*((char *)v125 + 23) < 0)
    {
      v125 = (uint64_t *)*v125;
      v126 = *(_QWORD *)(v189[40] + 8);
    }
    else
    {
      v126 = *((unsigned __int8 *)v125 + 23);
    }
    v14 = objc_msgSend(v124, "initWithBytes:length:", v125, v126);
    v186 = (void *)v14;
  }
  if (v186)
    v14 = -[ICAttachment writeFallbackImageData:](self, "writeFallbackImageData:", v186);
  if (v191)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_fallbackPDF"), v188);
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v191, "loadDataForIdentifier:", v127);
    v187 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_199;
  }
  if ((*((_DWORD *)v189 + 9) & 0x100) == 0)
    goto LABEL_201;
LABEL_195:
  v128 = objc_alloc(MEMORY[0x1E0C99D50]);
  v129 = (uint64_t *)v189[47];
  if (*((char *)v129 + 23) < 0)
  {
    v129 = (uint64_t *)*v129;
    v130 = *(_QWORD *)(v189[47] + 8);
  }
  else
  {
    v130 = *((unsigned __int8 *)v129 + 23);
  }
  v14 = objc_msgSend(v128, "initWithBytes:length:", v129, v130);
  v187 = (void *)v14;
LABEL_199:
  if (v187)
  {
    v14 = -[ICAttachment writeFallbackPDFData:](self, "writeFallbackPDFData:");
    goto LABEL_202;
  }
LABEL_201:
  v187 = 0;
LABEL_202:
  v131 = *((_DWORD *)v189 + 9);
  if ((v131 & 2) != 0)
  {
    v132 = objc_alloc(MEMORY[0x1E0C99D50]);
    v133 = (uint64_t *)v189[38];
    if (*((char *)v133 + 23) < 0)
    {
      v133 = (uint64_t *)*v133;
      v134 = *(_QWORD *)(v189[38] + 8);
    }
    else
    {
      v134 = *((unsigned __int8 *)v133 + 23);
    }
    v135 = (void *)objc_msgSend(v132, "initWithBytes:length:", v133, v134);
    -[ICAttachment setMetadataData:](self, "setMetadataData:", v135);

    v131 = *((_DWORD *)v189 + 9);
  }
  if ((v131 & 0x10) != 0)
  {
    v136 = objc_alloc(MEMORY[0x1E0C99D50]);
    v137 = (uint64_t *)v189[41];
    if (*((char *)v137 + 23) < 0)
    {
      v137 = (uint64_t *)*v137;
      v138 = *(_QWORD *)(v189[41] + 8);
    }
    else
    {
      v138 = *((unsigned __int8 *)v137 + 23);
    }
    v139 = (void *)objc_msgSend(v136, "initWithBytes:length:", v137, v138);
    -[ICAttachment setLinkPresentationArchivedMetadata:](self, "setLinkPresentationArchivedMetadata:", v139);

  }
  v140 = *((unsigned int *)v189 + 30);
  if ((_DWORD)v140)
  {
    for (i = 0; i != v140; ++i)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_previewImage_%lu"), v188, i);
      v142 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICAttachment loadPreviewArchive:previewDataIdentifier:dataPersister:](self, "loadPreviewArchive:previewDataIdentifier:dataPersister:", google::protobuf::internal::RepeatedPtrFieldBase::Get<google::protobuf::RepeatedPtrField<topotext::PreviewImage>::TypeHandler>((uint64_t)(v189 + 14), i), v142, v191);

    }
  }
  v143 = *((_DWORD *)v189 + 54);
  if (v143)
  {
    for (j = 0; j != v143; ++j)
    {
      v145 = (void *)MEMORY[0x1C3B7AC74](v14);
      -[ICAttachment note](self, "note");
      v146 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v147 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v147, "UUIDString");
      v148 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v146, "addAttachmentWithIdentifier:", v148);
      v149 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v149, "setParentAttachment:", self);
      -[ICAttachment addSubAttachmentsObject:](self, "addSubAttachmentsObject:", v149);
      objc_msgSend(v149, "loadFromArchive:dataPersister:withIdentifierMap:", google::protobuf::internal::RepeatedPtrFieldBase::Get<google::protobuf::RepeatedPtrField<topotext::Attachment>::TypeHandler>((uint64_t)(v189 + 26), j), v191, v190);
      objc_msgSend(v149, "updateChangeCountWithReason:", CFSTR("Loaded subattachment from archive"));
      objc_msgSend(v149, "media");
      v150 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v150, "updateChangeCountWithReason:", CFSTR("Loaded subattachment from archive"));

      objc_autoreleasePoolPop(v145);
    }
  }
  -[ICAttachment attachmentModel](self, "attachmentModel");
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v151, "updateAfterLoadWithSubAttachmentIdentifierMap:", v190);

  -[ICAttachment attachmentModel](self, "attachmentModel");
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v152, "updateFileBasedAttributes");

  v153 = *((_DWORD *)v189 + 86);
  if (v153)
  {
    for (k = 0; k != v153; ++k)
    {
      -[ICAttachment note](self, "note");
      v155 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v156 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v156, "UUIDString");
      v157 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v155, "addInlineAttachmentWithIdentifier:", v157);
      v158 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v158, "setParentAttachment:", self);
      -[ICAttachment addInlineAttachmentsObject:](self, "addInlineAttachmentsObject:", v158);
      objc_msgSend(v158, "loadFromArchive:dataPersister:withIdentifierMap:", google::protobuf::internal::RepeatedPtrFieldBase::Get<google::protobuf::RepeatedPtrField<topotext::Attachment>::TypeHandler>((uint64_t)(v189 + 42), k), v191, v190);
      objc_msgSend(v158, "updateChangeCountWithReason:", CFSTR("Loaded inline attachment from archive"));

    }
  }
  objc_opt_class();
  -[ICAttachment attachmentModel](self, "attachmentModel");
  v159 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v160 = (void *)objc_claimAutoreleasedReturnValue();

  if (v160)
  {
    if ((*((_BYTE *)v189 + 36) & 0x40) != 0)
    {
      v163 = objc_alloc(MEMORY[0x1E0C99D50]);
      v164 = (uint64_t *)v189[45];
      if (*((char *)v164 + 23) < 0)
      {
        v164 = (uint64_t *)*v164;
        v165 = *(_QWORD *)(v189[45] + 8);
      }
      else
      {
        v165 = *((unsigned __int8 *)v164 + 23);
      }
      v162 = (void *)objc_msgSend(v163, "initWithBytes:length:", v164, v165);
      if (!v162)
        goto LABEL_233;
    }
    else
    {
      if (!v191)
        goto LABEL_233;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%@"), v188, CFSTR("systemPaperBundle"));
      v161 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v191, "loadDataForIdentifier:", v161);
      v162 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v162)
        goto LABEL_233;
    }
    NSTemporaryDirectory();
    v166 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v167 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v167, "UUIDString");
    v168 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v166, "stringByAppendingPathComponent:", v168);
    v169 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v169);
    v170 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v170, "URLByAppendingPathExtension:", CFSTR("zip"));
    v171 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v171, "path");
    v172 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v168) = objc_msgSend(v162, "writeToFile:atomically:", v172, 1);

    if ((_DWORD)v168)
    {
      objc_msgSend(v160, "restorePaperBundleFromArchiveURL:error:", v171, 0);
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v173 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v173, "removeItemAtURL:error:", v171, 0);

    }
  }
LABEL_233:
  v174 = *((_DWORD *)v189 + 9);
  if ((v174 & 0x80) != 0)
  {
    v175 = objc_alloc(MEMORY[0x1E0C99D50]);
    v176 = (uint64_t *)v189[46];
    if (*((char *)v176 + 23) < 0)
    {
      v176 = (uint64_t *)*v176;
      v177 = *(_QWORD *)(v189[46] + 8);
    }
    else
    {
      v177 = *((unsigned __int8 *)v176 + 23);
    }
    v178 = (void *)objc_msgSend(v175, "initWithBytes:length:", v176, v177);
    -[ICAttachment setSynapseData:](self, "setSynapseData:", v178);

    v174 = *((_DWORD *)v189 + 9);
  }
  if ((v174 & 0x200) != 0)
  {
    v179 = objc_alloc(MEMORY[0x1E0C99D50]);
    v180 = (uint64_t *)v189[48];
    if (*((char *)v180 + 23) < 0)
    {
      v180 = (uint64_t *)*v180;
      v181 = *(_QWORD *)(v189[48] + 8);
    }
    else
    {
      v181 = *((unsigned __int8 *)v180 + 23);
    }
    v182 = (void *)objc_msgSend(v179, "initWithBytes:length:", v180, v181);
    -[ICAttachment setMergeablePreferredViewSize:](self, "setMergeablePreferredViewSize:", v182);

    -[ICCloudSyncingObject updateUserSpecificChangeCountWithReason:](self, "updateUserSpecificChangeCountWithReason:", CFSTR("Set preferred view size"));
  }
  -[ICAttachment attachmentModel](self, "attachmentModel");
  v183 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v183, "updateAfterLoadWithInlineAttachmentIdentifierMap:", v190);

}

- (void)loadPreviewArchive:(const void *)a3 previewDataIdentifier:(id)a4 dataPersister:(id)a5
{
  id v8;
  void *v9;
  int v10;
  double v11;
  uint64_t v13;
  int v14;
  double v15;
  double v16;
  const __CFData *v17;
  id v18;
  uint64_t *v19;
  uint64_t v20;
  const __CFData *v21;
  CGImageSource *v22;
  CGImageSource *v23;
  CFDictionaryRef v24;
  CFDictionaryRef v25;
  void *v26;
  ICAttachment *v27;
  double v28;
  void *v29;
  double v30;
  void *v31;
  id v32;
  uint64_t *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  int v37;
  void *v38;
  uint64_t v39;
  unsigned int v40;
  id v41;

  v41 = a4;
  v8 = a5;
  v9 = v8;
  v10 = *((_DWORD *)a3 + 8);
  if ((v10 & 1) != 0)
    v11 = *((float *)a3 + 12);
  else
    v11 = 1.0;
  v13 = (v10 & 2) == 0 || *((_BYTE *)a3 + 52) != 0;
  v14 = *((_DWORD *)a3 + 17);
  v15 = *MEMORY[0x1E0C9D820];
  v16 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  if ((v10 & 4) != 0)
  {
    v18 = objc_alloc(MEMORY[0x1E0C99D50]);
    v19 = (uint64_t *)*((_QWORD *)a3 + 5);
    if (*((char *)v19 + 23) < 0)
    {
      v19 = (uint64_t *)*v19;
      v20 = *(_QWORD *)(*((_QWORD *)a3 + 5) + 8);
    }
    else
    {
      v20 = *((unsigned __int8 *)v19 + 23);
    }
    v17 = (const __CFData *)objc_msgSend(v18, "initWithBytes:length:", v19, v20);
  }
  else
  {
    if (!v8)
    {
      v21 = 0;
LABEL_23:
      LOBYTE(v23) = 1;
      goto LABEL_24;
    }
    objc_msgSend(v8, "loadDataForIdentifier:", v41);
    v17 = (const __CFData *)objc_claimAutoreleasedReturnValue();
  }
  v21 = v17;
  if (!v17)
    goto LABEL_23;
  v22 = CGImageSourceCreateWithData(v17, 0);
  v23 = v22;
  if (v22)
  {
    v24 = CGImageSourceCopyPropertiesAtIndex(v22, 0, 0);
    v25 = v24;
    if (v24)
    {
      v40 = v13;
      -[__CFDictionary objectForKeyedSubscript:](v24, "objectForKeyedSubscript:", *MEMORY[0x1E0CBD048]);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = self;
      objc_msgSend(v26, "doubleValue");
      v15 = v28;
      -[__CFDictionary objectForKeyedSubscript:](v25, "objectForKeyedSubscript:", *MEMORY[0x1E0CBD040]);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "doubleValue");
      v16 = v30;

      self = v27;
      v13 = v40;
    }
    CFRelease(v23);

    LOBYTE(v23) = 0;
  }
LABEL_24:
  if ((*((_BYTE *)a3 + 32) & 8) != 0)
  {
    v32 = objc_alloc(MEMORY[0x1E0C99D50]);
    v33 = (uint64_t *)*((_QWORD *)a3 + 7);
    if (*((char *)v33 + 23) < 0)
    {
      v33 = (uint64_t *)*v33;
      v34 = *(_QWORD *)(*((_QWORD *)a3 + 7) + 8);
    }
    else
    {
      v34 = *((unsigned __int8 *)v33 + 23);
    }
    v31 = (void *)objc_msgSend(v32, "initWithBytes:length:", v33, v34);
    if ((v23 & 1) != 0)
      goto LABEL_37;
  }
  else
  {
    v31 = 0;
    if ((v23 & 1) != 0)
      goto LABEL_37;
  }
  -[ICAttachment updateAttachmentPreviewImageWithImageData:size:scale:appearanceType:scaleWhenDrawing:metadata:sendNotification:](self, "updateAttachmentPreviewImageWithImageData:size:scale:appearanceType:scaleWhenDrawing:metadata:sendNotification:", v21, v14 & ((char)v10 >> 7), v13, v31, 1, v15, v16, v11);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v35;
  if (!v35)
  {
LABEL_37:
    v38 = 0;
    goto LABEL_38;
  }
  v37 = *((_DWORD *)a3 + 8);
  if ((v37 & 0x10) != 0)
  {
    objc_msgSend(v35, "setVersion:", *((__int16 *)a3 + 32));
    v37 = *((_DWORD *)a3 + 8);
  }
  if ((v37 & 0x20) != 0 && *((_BYTE *)a3 + 53))
  {
    v38 = v36;
    objc_msgSend(v36, "setVersionOutOfDate:", 1);
  }
  else
  {
    v38 = v36;
  }
LABEL_38:
  if ((*((_DWORD *)a3 + 8) & 0x40) != 0)
    v39 = *((_QWORD *)a3 + 9);
  else
    v39 = 0;
  objc_msgSend(v38, "requireMinimumSupportedVersionAndPropagateToChildObjects:", v39);

}

- (BOOL)saveToArchive:(void *)a3 dataPersister:(id)a4 stripImageMarkupMetadata:(BOOL)a5 error:(id *)a6
{
  void *v8;
  id v9;
  _QWORD *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  _QWORD *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  int v25;
  void *v26;
  BOOL v27;
  id v28;
  _QWORD *v29;
  void *v30;
  BOOL v31;
  id v32;
  _QWORD *v33;
  void *v34;
  BOOL v35;
  id v36;
  _QWORD *v37;
  void *v38;
  BOOL v39;
  id v40;
  _QWORD *v41;
  void *v42;
  BOOL v43;
  id v44;
  _QWORD *v45;
  void *v46;
  BOOL v47;
  void *v48;
  uint64_t v49;
  void *v50;
  BOOL v51;
  void *v52;
  uint64_t v53;
  void *v54;
  BOOL v55;
  void *v56;
  uint64_t v57;
  void *v58;
  BOOL v59;
  void *v60;
  id v61;
  _QWORD *v62;
  char v63;
  uint64_t v64;
  double v65;
  uint64_t v66;
  int v67;
  void *v68;
  BOOL v69;
  void *v70;
  void *v71;
  void *v72;
  char v73;
  id v74;
  void *v75;
  _QWORD *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  BOOL v86;
  uint64_t v87;
  void *v88;
  uint64_t v89;
  void *v90;
  uint64_t v91;
  void *v92;
  char v93;
  void *v94;
  void *v95;
  BOOL v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  id v101;
  _QWORD *v102;
  void *v103;
  uint64_t v104;
  void *v105;
  id v106;
  _QWORD *v107;
  void *v108;
  uint64_t v109;
  void *v110;
  id v111;
  _QWORD *v112;
  void *v113;
  void *v114;
  void *v115;
  BOOL v116;
  uint64_t v117;
  void *v118;
  id v119;
  _QWORD *v120;
  void *v121;
  uint64_t v122;
  void *v123;
  void *v124;
  BOOL v125;
  void *v126;
  id v127;
  _QWORD *v128;
  void *v129;
  void *v130;
  void *v131;
  BOOL v132;
  void *v133;
  NSObject *v134;
  id v135;
  _QWORD *v136;
  void *v137;
  id v138;
  _QWORD *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  uint64_t v144;
  void *v145;
  id v146;
  _QWORD *v147;
  NSObject *v148;
  void *v149;
  void *v150;
  void *v151;
  BOOL v152;
  id v153;
  void *v154;
  _QWORD *v155;
  void *v156;
  BOOL v157;
  id v158;
  void *v159;
  _QWORD *v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t i;
  uint64_t v165;
  int v166;
  uint64_t v167;
  uint64_t v168;
  topotext::PreviewImage *v169;
  uint64_t v170;
  int32x2_t v171;
  void *v172;
  void *v173;
  void *v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t j;
  void *v178;
  void *v179;
  int v180;
  uint64_t v181;
  uint64_t v182;
  topotext::Attachment *v183;
  uint64_t v184;
  int32x2_t v185;
  char v186;
  id v187;
  id v188;
  void *v189;
  void *v190;
  void *v191;
  id v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t k;
  void *v196;
  uint64_t v197;
  int v198;
  uint64_t v199;
  topotext::Attachment *v200;
  uint64_t v201;
  int32x2_t v202;
  id v203;
  void *v204;
  void *v205;
  void *v206;
  void *v207;
  void *v208;
  void *v209;
  void *v210;
  void *v211;
  uint64_t v212;
  void *v213;
  id v214;
  _QWORD *v215;
  void *v216;
  NSObject *v217;
  void *v218;
  void *v219;
  void *v220;
  BOOL v221;
  id v222;
  void *v223;
  _QWORD *v224;
  void *v225;
  BOOL v226;
  id v227;
  void *v228;
  _QWORD *v229;
  void *v231;
  void *v232;
  uint64_t v233;
  id v234;
  id v235;
  _BOOL4 v236;
  char v237;
  id obj;
  ICAttachment *v239;
  id v241;
  id v242;
  __int128 v243;
  __int128 v244;
  __int128 v245;
  __int128 v246;
  id v247;
  __int128 v248;
  __int128 v249;
  __int128 v250;
  __int128 v251;
  __int128 v252;
  __int128 v253;
  __int128 v254;
  __int128 v255;
  id v256;
  _BYTE v257[128];
  _BYTE v258[128];
  _BYTE v259[128];
  _BYTE v260[16];
  uint8_t buf[4];
  void *v262;
  __int16 v263;
  uint64_t v264;
  _BYTE v265[24];
  uint64_t v266;

  v236 = a5;
  v266 = *MEMORY[0x1E0C80C00];
  v241 = a4;
  v239 = self;
  -[ICAttachment identifier](self, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[ICAttachment identifier](v239, "identifier");
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v9, "UTF8String");
    *((_DWORD *)a3 + 8) |= 1u;
    if (!google::protobuf::internal::empty_string_)
      __assert_rtn("GetEmptyStringAlreadyInited", "generated_message_util.h", 80, "empty_string_ != NULL");
    if (*((_QWORD *)a3 + 5) == google::protobuf::internal::empty_string_)
    {
      v10 = (_QWORD *)operator new();
      *v10 = 0;
      v10[1] = 0;
      v10[2] = 0;
      *((_QWORD *)a3 + 5) = v10;
    }
    MEMORY[0x1C3B7A7DC]();

  }
  v11 = -[ICAttachment intrinsicNotesVersionForScenario:](v239, "intrinsicNotesVersionForScenario:", 1);
  if (v11)
  {
    *((_DWORD *)a3 + 8) |= 0x1000000u;
    *((_QWORD *)a3 + 29) = v11;
  }
  -[ICAttachment attachmentModel](v239, "attachmentModel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v256 = 0;
  objc_msgSend(v12, "mergeableDataForCopying:", &v256);
  v235 = (id)objc_claimAutoreleasedReturnValue();
  v234 = v256;

  if (v235)
  {
    if (!v241
      || (-[ICAttachment identifier](v239, "identifier"),
          v13 = objc_claimAutoreleasedReturnValue(),
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%@"), v13, CFSTR("mergeableData")),
          v14 = (void *)objc_claimAutoreleasedReturnValue(),
          (id)v13,
          LOBYTE(v13) = objc_msgSend(v241, "saveData:identifier:", v235, v14),
          v14,
          (v13 & 1) == 0))
    {
      v15 = objc_retainAutorelease(v235);
      objc_msgSend(v15, "bytes");
      objc_msgSend(v15, "length");
      *((_DWORD *)a3 + 8) |= 2u;
      if (!google::protobuf::internal::empty_string_)
        __assert_rtn("GetEmptyStringAlreadyInited", "generated_message_util.h", 80, "empty_string_ != NULL");
      if (*((_QWORD *)a3 + 6) == google::protobuf::internal::empty_string_)
      {
        v16 = (_QWORD *)operator new();
        *v16 = 0;
        v16[1] = 0;
        v16[2] = 0;
        *((_QWORD *)a3 + 6) = v16;
      }
      MEMORY[0x1C3B7A7E8]();
    }
  }
  -[ICAttachment sizeHeight](v239, "sizeHeight");
  if (v17 != 0.0)
  {
    -[ICAttachment sizeHeight](v239, "sizeHeight");
    *(float *)&v18 = v18;
    *((_DWORD *)a3 + 8) |= 4u;
    *((_DWORD *)a3 + 14) = LODWORD(v18);
  }
  -[ICAttachment sizeWidth](v239, "sizeWidth");
  if (v19 != 0.0)
  {
    -[ICAttachment sizeWidth](v239, "sizeWidth");
    *(float *)&v20 = v20;
    *((_DWORD *)a3 + 8) |= 8u;
    *((_DWORD *)a3 + 15) = LODWORD(v20);
  }
  -[ICAttachment originX](v239, "originX");
  if (v21 != 0.0)
  {
    -[ICAttachment originX](v239, "originX");
    *(float *)&v22 = v22;
    *((_DWORD *)a3 + 8) |= 0x800u;
    *((_DWORD *)a3 + 34) = LODWORD(v22);
  }
  -[ICAttachment originY](v239, "originY");
  if (v23 != 0.0)
  {
    -[ICAttachment originY](v239, "originY");
    *(float *)&v24 = v24;
    *((_DWORD *)a3 + 8) |= 0x1000u;
    *((_DWORD *)a3 + 35) = LODWORD(v24);
  }
  if (-[ICAttachment orientation](v239, "orientation"))
  {
    v25 = -[ICAttachment orientation](v239, "orientation");
    *((_DWORD *)a3 + 8) |= 0x2000u;
    *((_DWORD *)a3 + 40) = v25;
  }
  -[ICAttachment summary](v239, "summary");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v26 == 0;

  if (!v27)
  {
    -[ICAttachment summary](v239, "summary");
    v28 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v28, "UTF8String");
    *((_DWORD *)a3 + 8) |= 0x10u;
    if (!google::protobuf::internal::empty_string_)
      __assert_rtn("GetEmptyStringAlreadyInited", "generated_message_util.h", 80, "empty_string_ != NULL");
    if (*((_QWORD *)a3 + 8) == google::protobuf::internal::empty_string_)
    {
      v29 = (_QWORD *)operator new();
      *v29 = 0;
      v29[1] = 0;
      v29[2] = 0;
      *((_QWORD *)a3 + 8) = v29;
    }
    MEMORY[0x1C3B7A7DC]();

  }
  -[ICAttachment title](v239, "title");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v30 == 0;

  if (!v31)
  {
    -[ICAttachment title](v239, "title");
    v32 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v32, "UTF8String");
    *((_DWORD *)a3 + 8) |= 0x20u;
    if (!google::protobuf::internal::empty_string_)
      __assert_rtn("GetEmptyStringAlreadyInited", "generated_message_util.h", 80, "empty_string_ != NULL");
    if (*((_QWORD *)a3 + 9) == google::protobuf::internal::empty_string_)
    {
      v33 = (_QWORD *)operator new();
      *v33 = 0;
      v33[1] = 0;
      v33[2] = 0;
      *((_QWORD *)a3 + 9) = v33;
    }
    MEMORY[0x1C3B7A7DC]();

  }
  -[ICAttachment userTitle](v239, "userTitle");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v34 == 0;

  if (!v35)
  {
    -[ICAttachment userTitle](v239, "userTitle");
    v36 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v36, "UTF8String");
    *((_DWORD *)a3 + 9) |= 4u;
    if (!google::protobuf::internal::empty_string_)
      __assert_rtn("GetEmptyStringAlreadyInited", "generated_message_util.h", 80, "empty_string_ != NULL");
    if (*((_QWORD *)a3 + 39) == google::protobuf::internal::empty_string_)
    {
      v37 = (_QWORD *)operator new();
      *v37 = 0;
      v37[1] = 0;
      v37[2] = 0;
      *((_QWORD *)a3 + 39) = v37;
    }
    MEMORY[0x1C3B7A7DC]();

  }
  -[ICAttachment typeUTI](v239, "typeUTI");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v38 == 0;

  if (!v39)
  {
    -[ICAttachment typeUTI](v239, "typeUTI");
    v40 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v40, "UTF8String");
    *((_DWORD *)a3 + 8) |= 0x40u;
    if (!google::protobuf::internal::empty_string_)
      __assert_rtn("GetEmptyStringAlreadyInited", "generated_message_util.h", 80, "empty_string_ != NULL");
    if (*((_QWORD *)a3 + 10) == google::protobuf::internal::empty_string_)
    {
      v41 = (_QWORD *)operator new();
      *v41 = 0;
      v41[1] = 0;
      v41[2] = 0;
      *((_QWORD *)a3 + 10) = v41;
    }
    MEMORY[0x1C3B7A7DC]();

  }
  -[ICAttachment urlString](v239, "urlString");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = v42 == 0;

  if (!v43)
  {
    -[ICAttachment urlString](v239, "urlString");
    v44 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v44, "UTF8String");
    *((_DWORD *)a3 + 8) |= 0x80u;
    if (!google::protobuf::internal::empty_string_)
      __assert_rtn("GetEmptyStringAlreadyInited", "generated_message_util.h", 80, "empty_string_ != NULL");
    if (*((_QWORD *)a3 + 11) == google::protobuf::internal::empty_string_)
    {
      v45 = (_QWORD *)operator new();
      *v45 = 0;
      v45[1] = 0;
      v45[2] = 0;
      *((_QWORD *)a3 + 11) = v45;
    }
    MEMORY[0x1C3B7A7DC]();

  }
  -[ICAttachment previewUpdateDate](v239, "previewUpdateDate");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = v46 == 0;

  if (!v47)
  {
    -[ICAttachment previewUpdateDate](v239, "previewUpdateDate");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "timeIntervalSinceReferenceDate");
    *((_DWORD *)a3 + 8) |= 0x4000u;
    *((_QWORD *)a3 + 18) = v49;

  }
  -[ICCloudSyncingObject creationDate](v239, "creationDate");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = v50 == 0;

  if (!v51)
  {
    -[ICCloudSyncingObject creationDate](v239, "creationDate");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "timeIntervalSinceReferenceDate");
    *((_DWORD *)a3 + 8) |= 0x8000u;
    *((_QWORD *)a3 + 19) = v53;

  }
  -[ICCloudSyncingObject modificationDate](v239, "modificationDate");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = v54 == 0;

  if (!v55)
  {
    -[ICCloudSyncingObject modificationDate](v239, "modificationDate");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "timeIntervalSinceReferenceDate");
    *((_DWORD *)a3 + 8) |= 0x10000u;
    *((_QWORD *)a3 + 21) = v57;

  }
  -[ICAttachment remoteFileURL](v239, "remoteFileURL");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = v58 == 0;

  if (!v59)
  {
    -[ICAttachment remoteFileURL](v239, "remoteFileURL");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "absoluteString");
    v61 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v61, "UTF8String");
    *((_DWORD *)a3 + 8) |= 0x20000u;
    if (!google::protobuf::internal::empty_string_)
      __assert_rtn("GetEmptyStringAlreadyInited", "generated_message_util.h", 80, "empty_string_ != NULL");
    if (*((_QWORD *)a3 + 22) == google::protobuf::internal::empty_string_)
    {
      v62 = (_QWORD *)operator new();
      *v62 = 0;
      v62[1] = 0;
      v62[2] = 0;
      *((_QWORD *)a3 + 22) = v62;
    }
    MEMORY[0x1C3B7A7DC]();

  }
  if (-[ICAttachment checkedForLocation](v239, "checkedForLocation"))
  {
    v63 = -[ICAttachment checkedForLocation](v239, "checkedForLocation");
    *((_DWORD *)a3 + 8) |= 0x40000u;
    *((_BYTE *)a3 + 164) = v63;
  }
  if (-[ICAttachment fileSize](v239, "fileSize"))
  {
    v64 = -[ICAttachment fileSize](v239, "fileSize");
    *((_DWORD *)a3 + 8) |= 0x80000u;
    *((_QWORD *)a3 + 23) = v64;
  }
  -[ICAttachment duration](v239, "duration");
  if (v65 != 0.0)
  {
    -[ICAttachment duration](v239, "duration");
    *((_DWORD *)a3 + 8) |= 0x100000u;
    *((_QWORD *)a3 + 24) = v66;
  }
  if (-[ICAttachment imageFilterType](v239, "imageFilterType"))
  {
    v67 = -[ICAttachment imageFilterType](v239, "imageFilterType");
    *((_DWORD *)a3 + 8) |= 0x200000u;
    *((_DWORD *)a3 + 98) = v67;
  }
  -[ICAttachment markupModelData](v239, "markupModelData");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = objc_msgSend(v68, "length") == 0;

  if (!v69)
  {
    if (!v241)
      goto LABEL_72;
    -[ICAttachment identifier](v239, "identifier");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%@"), v70, CFSTR("markupModelData"));
    v71 = (void *)objc_claimAutoreleasedReturnValue();

    -[ICAttachment markupModelData](v239, "markupModelData");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = objc_msgSend(v241, "saveData:identifier:", v72, v71);

    if ((v73 & 1) == 0)
    {
LABEL_72:
      -[ICAttachment markupModelData](v239, "markupModelData");
      v74 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v74, "bytes");
      -[ICAttachment markupModelData](v239, "markupModelData");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "length");
      *((_DWORD *)a3 + 8) |= 0x400000u;
      if (!google::protobuf::internal::empty_string_)
        __assert_rtn("GetEmptyStringAlreadyInited", "generated_message_util.h", 80, "empty_string_ != NULL");
      if (*((_QWORD *)a3 + 25) == google::protobuf::internal::empty_string_)
      {
        v76 = (_QWORD *)operator new();
        *v76 = 0;
        v76[1] = 0;
        v76[2] = 0;
        *((_QWORD *)a3 + 25) = v76;
      }
      MEMORY[0x1C3B7A7E8]();

    }
  }
  if (-[ICAttachment hasCroppingQuad](v239, "hasCroppingQuad"))
  {
    -[ICAttachment croppingQuadBottomLeftX](v239, "croppingQuadBottomLeftX");
    *((_DWORD *)a3 + 8) |= 0x2000000u;
    *((_QWORD *)a3 + 30) = v77;
    -[ICAttachment croppingQuadBottomLeftY](v239, "croppingQuadBottomLeftY");
    *((_DWORD *)a3 + 8) |= 0x4000000u;
    *((_QWORD *)a3 + 31) = v78;
    -[ICAttachment croppingQuadBottomRightX](v239, "croppingQuadBottomRightX");
    *((_DWORD *)a3 + 8) |= 0x8000000u;
    *((_QWORD *)a3 + 32) = v79;
    -[ICAttachment croppingQuadBottomRightY](v239, "croppingQuadBottomRightY");
    *((_DWORD *)a3 + 8) |= 0x10000000u;
    *((_QWORD *)a3 + 33) = v80;
    -[ICAttachment croppingQuadTopLeftX](v239, "croppingQuadTopLeftX");
    *((_DWORD *)a3 + 8) |= 0x20000000u;
    *((_QWORD *)a3 + 34) = v81;
    -[ICAttachment croppingQuadTopLeftY](v239, "croppingQuadTopLeftY");
    *((_DWORD *)a3 + 8) |= 0x40000000u;
    *((_QWORD *)a3 + 35) = v82;
    -[ICAttachment croppingQuadTopRightX](v239, "croppingQuadTopRightX");
    *((_DWORD *)a3 + 8) |= 0x80000000;
    *((_QWORD *)a3 + 36) = v83;
    -[ICAttachment croppingQuadTopRightY](v239, "croppingQuadTopRightY");
    *((_DWORD *)a3 + 9) |= 1u;
    *((_QWORD *)a3 + 37) = v84;
  }
  -[ICAttachment location](v239, "location");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v86 = v85 == 0;

  if (!v86)
  {
    *((_DWORD *)a3 + 8) |= 0x100u;
    v87 = *((_QWORD *)a3 + 12);
    if (!v87)
    {
      v87 = operator new();
      topotext::Location::Location((topotext::Location *)v87);
      *((_QWORD *)a3 + 12) = v87;
    }
    -[ICAttachment location](v239, "location");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "latitude");
    *(_DWORD *)(v87 + 32) |= 1u;
    *(_QWORD *)(v87 + 40) = v89;

    -[ICAttachment location](v239, "location");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "longitude");
    *(_DWORD *)(v87 + 32) |= 2u;
    *(_QWORD *)(v87 + 48) = v91;

    -[ICAttachment location](v239, "location");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    v93 = objc_msgSend(v92, "placeUpdated");
    *(_DWORD *)(v87 + 32) |= 8u;
    *(_BYTE *)(v87 + 64) = v93;

    -[ICAttachment location](v239, "location");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "placemark");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    v96 = v95 == 0;

    if (!v96)
    {
      v97 = (void *)MEMORY[0x1E0CB36F8];
      -[ICAttachment location](v239, "location");
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v98, "placemark");
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v97, "archivedDataWithRootObject:requiringSecureCoding:error:", v99, 1, 0);
      v100 = (void *)objc_claimAutoreleasedReturnValue();

      v101 = objc_retainAutorelease(v100);
      objc_msgSend(v101, "bytes");
      objc_msgSend(v101, "length");
      *(_DWORD *)(v87 + 32) |= 4u;
      if (!google::protobuf::internal::empty_string_)
        __assert_rtn("GetEmptyStringAlreadyInited", "generated_message_util.h", 80, "empty_string_ != NULL");
      if (*(_QWORD *)(v87 + 56) == google::protobuf::internal::empty_string_)
      {
        v102 = (_QWORD *)operator new();
        *v102 = 0;
        v102[1] = 0;
        v102[2] = 0;
        *(_QWORD *)(v87 + 56) = v102;
      }
      MEMORY[0x1C3B7A7E8]();

    }
  }
  if (-[ICAttachment hasFallbackImage](v239, "hasFallbackImage"))
  {
    -[ICAttachment fallbackImageData](v239, "fallbackImageData");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v241
      || (-[ICAttachment identifier](v239, "identifier"),
          v104 = objc_claimAutoreleasedReturnValue(),
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_fallbackImage"), v104),
          v105 = (void *)objc_claimAutoreleasedReturnValue(),
          (id)v104,
          LOBYTE(v104) = objc_msgSend(v241, "saveData:identifier:", v103, v105),
          v105,
          (v104 & 1) == 0))
    {
      v106 = objc_retainAutorelease(v103);
      objc_msgSend(v106, "bytes");
      objc_msgSend(v106, "length");
      *((_DWORD *)a3 + 9) |= 8u;
      if (!google::protobuf::internal::empty_string_)
        __assert_rtn("GetEmptyStringAlreadyInited", "generated_message_util.h", 80, "empty_string_ != NULL");
      if (*((_QWORD *)a3 + 40) == google::protobuf::internal::empty_string_)
      {
        v107 = (_QWORD *)operator new();
        *v107 = 0;
        v107[1] = 0;
        v107[2] = 0;
        *((_QWORD *)a3 + 40) = v107;
      }
      MEMORY[0x1C3B7A7E8]();
    }

  }
  if (-[ICAttachment hasFallbackPDF](v239, "hasFallbackPDF"))
  {
    -[ICAttachment fallbackPDFData](v239, "fallbackPDFData");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v241
      || (-[ICAttachment identifier](v239, "identifier"),
          v109 = objc_claimAutoreleasedReturnValue(),
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_fallbackPDF"), v109),
          v110 = (void *)objc_claimAutoreleasedReturnValue(),
          (id)v109,
          LOBYTE(v109) = objc_msgSend(v241, "saveData:identifier:", v108, v110),
          v110,
          (v109 & 1) == 0))
    {
      v111 = objc_retainAutorelease(v108);
      objc_msgSend(v111, "bytes");
      objc_msgSend(v111, "length");
      *((_DWORD *)a3 + 9) |= 0x100u;
      if (!google::protobuf::internal::empty_string_)
        __assert_rtn("GetEmptyStringAlreadyInited", "generated_message_util.h", 80, "empty_string_ != NULL");
      if (*((_QWORD *)a3 + 47) == google::protobuf::internal::empty_string_)
      {
        v112 = (_QWORD *)operator new();
        *v112 = 0;
        v112[1] = 0;
        v112[2] = 0;
        *((_QWORD *)a3 + 47) = v112;
      }
      MEMORY[0x1C3B7A7E8]();
    }

  }
  -[ICAttachment media](v239, "media");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v113)
    goto LABEL_120;
  -[ICAttachment media](v239, "media");
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v114, "identifier");
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  v116 = v115 == 0;

  if (v116)
  {
LABEL_120:
    v237 = 1;
    goto LABEL_143;
  }
  *((_DWORD *)a3 + 8) |= 0x200u;
  v117 = *((_QWORD *)a3 + 13);
  if (!v117)
  {
    v117 = operator new();
    topotext::Media::Media((topotext::Media *)v117);
    *((_QWORD *)a3 + 13) = v117;
  }
  -[ICAttachment media](v239, "media");
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v118, "identifier");
  v119 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v119, "UTF8String");
  *(_DWORD *)(v117 + 32) |= 1u;
  if (!google::protobuf::internal::empty_string_)
    __assert_rtn("GetEmptyStringAlreadyInited", "generated_message_util.h", 80, "empty_string_ != NULL");
  if (*(_QWORD *)(v117 + 40) == google::protobuf::internal::empty_string_)
  {
    v120 = (_QWORD *)operator new();
    *v120 = 0;
    v120[1] = 0;
    v120[2] = 0;
    *(_QWORD *)(v117 + 40) = v120;
  }
  MEMORY[0x1C3B7A7DC]();

  -[ICAttachment media](v239, "media");
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  v122 = objc_msgSend(v121, "intrinsicNotesVersionForScenario:", 1);

  if (v122)
  {
    *(_DWORD *)(v117 + 32) |= 0x10u;
    *(_QWORD *)(v117 + 72) = v122;
  }
  -[ICAttachment media](v239, "media");
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v123, "filename");
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  v125 = v124 == 0;

  if (v125)
  {
    -[ICAttachment media](v239, "media");
    v137 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v137, "identifier");
    v138 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v138, "UTF8String");
    *(_DWORD *)(v117 + 32) |= 8u;
    if (!google::protobuf::internal::empty_string_)
      __assert_rtn("GetEmptyStringAlreadyInited", "generated_message_util.h", 80, "empty_string_ != NULL");
    if (*(_QWORD *)(v117 + 64) == google::protobuf::internal::empty_string_)
    {
      v139 = (_QWORD *)operator new();
      *v139 = 0;
      v139[1] = 0;
      v139[2] = 0;
      *(_QWORD *)(v117 + 64) = v139;
    }
    MEMORY[0x1C3B7A7DC]();

    v134 = os_log_create("com.apple.notes", "Archiving");
    if (os_log_type_enabled(v134, OS_LOG_TYPE_ERROR))
    {
      -[ICAttachment media](v239, "media");
      v140 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v140, "ic_loggingIdentifier");
      v141 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICAttachment(ICAttachmentPersistenceAdditions) saveToArchive:dataPersister:stripImageMarkupMetadata:error:].cold.3(v141, (uint64_t)v265, v134, v140);
    }
    v133 = v134;
    goto LABEL_127;
  }
  -[ICAttachment media](v239, "media");
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v126, "filename");
  v127 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v127, "UTF8String");
  *(_DWORD *)(v117 + 32) |= 8u;
  if (!google::protobuf::internal::empty_string_)
    __assert_rtn("GetEmptyStringAlreadyInited", "generated_message_util.h", 80, "empty_string_ != NULL");
  if (*(_QWORD *)(v117 + 64) == google::protobuf::internal::empty_string_)
  {
    v128 = (_QWORD *)operator new();
    *v128 = 0;
    v128[1] = 0;
    v128[2] = 0;
    *(_QWORD *)(v117 + 64) = v128;
  }
  MEMORY[0x1C3B7A7DC]();

  -[ICAttachment media](v239, "media");
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v129, "filename");
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v130, "pathExtension");
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  v132 = v131 == 0;

  if (!v132)
  {
    -[ICAttachment media](v239, "media");
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v133, "filename");
    v134 = objc_claimAutoreleasedReturnValue();
    -[NSObject pathExtension](v134, "pathExtension");
    v135 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v135, "UTF8String");
    *(_DWORD *)(v117 + 32) |= 2u;
    if (!google::protobuf::internal::empty_string_)
      __assert_rtn("GetEmptyStringAlreadyInited", "generated_message_util.h", 80, "empty_string_ != NULL");
    if (*(_QWORD *)(v117 + 48) == google::protobuf::internal::empty_string_)
    {
      v136 = (_QWORD *)operator new();
      *v136 = 0;
      v136[1] = 0;
      v136[2] = 0;
      *(_QWORD *)(v117 + 48) = v136;
    }
    MEMORY[0x1C3B7A7DC]();

LABEL_127:
  }
  -[ICAttachment media](v239, "media");
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v142, "dataWithoutImageMarkupMetadata:", v236);
  v143 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v143)
  {
    v148 = os_log_create("com.apple.notes", "Archiving");
    if (os_log_type_enabled(v148, OS_LOG_TYPE_ERROR))
    {
      -[ICAttachment media](v239, "media");
      v149 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v149, "ic_loggingIdentifier");
      v150 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICAttachment(ICAttachmentPersistenceAdditions) saveToArchive:dataPersister:stripImageMarkupMetadata:error:].cold.2(v150, (uint64_t)v260, v148, v149);
    }
    goto LABEL_141;
  }
  if (!v241
    || (-[ICAttachment identifier](v239, "identifier"),
        v144 = objc_claimAutoreleasedReturnValue(),
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%@"), v144, CFSTR("media")),
        v145 = (void *)objc_claimAutoreleasedReturnValue(),
        (id)v144,
        LOBYTE(v144) = objc_msgSend(v241, "saveData:identifier:", v143, v145),
        v145,
        (v144 & 1) == 0))
  {
    if (!((unint64_t)objc_msgSend(v143, "length") >> 28))
    {
      v146 = objc_retainAutorelease(v143);
      objc_msgSend(v146, "bytes");
      objc_msgSend(v146, "length");
      *(_DWORD *)(v117 + 32) |= 4u;
      if (!google::protobuf::internal::empty_string_)
        __assert_rtn("GetEmptyStringAlreadyInited", "generated_message_util.h", 80, "empty_string_ != NULL");
      if (*(_QWORD *)(v117 + 56) == google::protobuf::internal::empty_string_)
      {
        v147 = (_QWORD *)operator new();
        *v147 = 0;
        v147[1] = 0;
        v147[2] = 0;
        *(_QWORD *)(v117 + 56) = v147;
      }
      MEMORY[0x1C3B7A7E8]();
      goto LABEL_136;
    }
    v148 = os_log_create("com.apple.notes", "Archiving");
    if (os_log_type_enabled(v148, OS_LOG_TYPE_ERROR))
    {
      -[ICAttachment media](v239, "media");
      v231 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v231, "ic_loggingIdentifier");
      v232 = (void *)objc_claimAutoreleasedReturnValue();
      v233 = objc_msgSend(v143, "length");
      *(_DWORD *)buf = 138412546;
      v262 = v232;
      v263 = 2048;
      v264 = v233;
      _os_log_error_impl(&dword_1BD918000, v148, OS_LOG_TYPE_ERROR, "Media (%@) is too large (%lu) to persist to protobuf", buf, 0x16u);

    }
LABEL_141:

    v237 = 0;
    goto LABEL_142;
  }
LABEL_136:
  v237 = 1;
LABEL_142:

LABEL_143:
  -[ICAttachment metadataData](v239, "metadataData");
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  v152 = v151 == 0;

  if (!v152)
  {
    -[ICAttachment metadataData](v239, "metadataData");
    v153 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v153, "bytes");
    -[ICAttachment metadataData](v239, "metadataData");
    v154 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v154, "length");
    *((_DWORD *)a3 + 9) |= 2u;
    if (!google::protobuf::internal::empty_string_)
      __assert_rtn("GetEmptyStringAlreadyInited", "generated_message_util.h", 80, "empty_string_ != NULL");
    if (*((_QWORD *)a3 + 38) == google::protobuf::internal::empty_string_)
    {
      v155 = (_QWORD *)operator new();
      *v155 = 0;
      v155[1] = 0;
      v155[2] = 0;
      *((_QWORD *)a3 + 38) = v155;
    }
    MEMORY[0x1C3B7A7E8]();

  }
  -[ICAttachment linkPresentationArchivedMetadata](v239, "linkPresentationArchivedMetadata");
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  v157 = v156 == 0;

  if (!v157)
  {
    -[ICAttachment linkPresentationArchivedMetadata](v239, "linkPresentationArchivedMetadata");
    v158 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v158, "bytes");
    -[ICAttachment linkPresentationArchivedMetadata](v239, "linkPresentationArchivedMetadata");
    v159 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v159, "length");
    *((_DWORD *)a3 + 9) |= 0x10u;
    if (!google::protobuf::internal::empty_string_)
      __assert_rtn("GetEmptyStringAlreadyInited", "generated_message_util.h", 80, "empty_string_ != NULL");
    if (*((_QWORD *)a3 + 41) == google::protobuf::internal::empty_string_)
    {
      v160 = (_QWORD *)operator new();
      *v160 = 0;
      v160[1] = 0;
      v160[2] = 0;
      *((_QWORD *)a3 + 41) = v160;
    }
    MEMORY[0x1C3B7A7E8]();

  }
  v254 = 0u;
  v255 = 0u;
  v252 = 0u;
  v253 = 0u;
  -[ICAttachment previewImages](v239, "previewImages");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v161 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v252, v259, 16);
  if (v161)
  {
    v162 = 0;
    v163 = *(_QWORD *)v253;
    do
    {
      for (i = 0; i != v161; ++i)
      {
        if (*(_QWORD *)v253 != v163)
          objc_enumerationMutation(obj);
        v165 = *(_QWORD *)(*((_QWORD *)&v252 + 1) + 8 * i);
        v166 = *((_DWORD *)a3 + 31);
        v167 = *((int *)a3 + 30);
        if ((int)v167 >= v166)
        {
          if (v166 == *((_DWORD *)a3 + 32))
            google::protobuf::internal::RepeatedPtrFieldBase::Reserve((int *)a3 + 28, v166 + 1);
          v169 = google::protobuf::internal::GenericTypeHandler<topotext::PreviewImage>::New();
          v170 = *((_QWORD *)a3 + 14);
          v171 = *(int32x2_t *)((char *)a3 + 120);
          *((int32x2_t *)a3 + 15) = vadd_s32(v171, (int32x2_t)0x100000001);
          *(_QWORD *)(v170 + 8 * v171.i32[0]) = v169;
        }
        else
        {
          v168 = *((_QWORD *)a3 + 14);
          *((_DWORD *)a3 + 30) = v167 + 1;
          v169 = *(topotext::PreviewImage **)(v168 + 8 * v167);
        }
        -[ICAttachment identifier](v239, "identifier");
        v172 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_previewImage_%lu"), v172, v162 + i);
        v173 = (void *)objc_claimAutoreleasedReturnValue();

        -[ICAttachment savePreview:toArchive:previewDataIdentifier:dataPersister:](v239, "savePreview:toArchive:previewDataIdentifier:dataPersister:", v165, v169, v173, v241);
      }
      v161 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v252, v259, 16);
      v162 += i;
    }
    while (v161);
  }

  v251 = 0u;
  v249 = 0u;
  v250 = 0u;
  v248 = 0u;
  -[ICAttachment subAttachments](v239, "subAttachments");
  v174 = (void *)objc_claimAutoreleasedReturnValue();
  v175 = objc_msgSend(v174, "countByEnumeratingWithState:objects:count:", &v248, v258, 16);
  if (v175)
  {
    v176 = *(_QWORD *)v249;
    do
    {
      for (j = 0; j != v175; ++j)
      {
        if (*(_QWORD *)v249 != v176)
          objc_enumerationMutation(v174);
        v178 = *(void **)(*((_QWORD *)&v248 + 1) + 8 * j);
        if ((objc_msgSend(v178, "markedForDeletion") & 1) == 0)
        {
          v179 = (void *)MEMORY[0x1C3B7AC74]();
          v180 = *((_DWORD *)a3 + 55);
          v181 = *((int *)a3 + 54);
          if ((int)v181 >= v180)
          {
            if (v180 == *((_DWORD *)a3 + 56))
              google::protobuf::internal::RepeatedPtrFieldBase::Reserve((int *)a3 + 52, v180 + 1);
            v183 = google::protobuf::internal::GenericTypeHandler<topotext::Attachment>::New();
            v184 = *((_QWORD *)a3 + 26);
            v185 = *(int32x2_t *)((char *)a3 + 216);
            *((int32x2_t *)a3 + 27) = vadd_s32(v185, (int32x2_t)0x100000001);
            *(_QWORD *)(v184 + 8 * v185.i32[0]) = v183;
          }
          else
          {
            v182 = *((_QWORD *)a3 + 26);
            *((_DWORD *)a3 + 54) = v181 + 1;
            v183 = *(topotext::Attachment **)(v182 + 8 * v181);
          }
          v247 = 0;
          v186 = objc_msgSend(v178, "saveToArchive:dataPersister:stripImageMarkupMetadata:error:", v183, v241, v236, &v247);
          v187 = v247;
          objc_autoreleasePoolPop(v179);
          v237 = v186;
          if (a6 && v187)
            *a6 = objc_retainAutorelease(v187);

        }
      }
      v175 = objc_msgSend(v174, "countByEnumeratingWithState:objects:count:", &v248, v258, 16);
    }
    while (v175);
  }

  v188 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  -[ICAttachment visibleInlineAttachments](v239, "visibleInlineAttachments");
  v189 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v189, "allObjects");
  v190 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v188, "ic_addObjectsFromNonNilArray:", v190);

  objc_msgSend(v234, "allObjects");
  v191 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v188, "ic_addObjectsFromNonNilArray:", v191);

  v245 = 0u;
  v246 = 0u;
  v243 = 0u;
  v244 = 0u;
  v192 = v188;
  v193 = objc_msgSend(v192, "countByEnumeratingWithState:objects:count:", &v243, v257, 16);
  if (v193)
  {
    v194 = *(_QWORD *)v244;
    do
    {
      for (k = 0; k != v193; ++k)
      {
        if (*(_QWORD *)v244 != v194)
          objc_enumerationMutation(v192);
        v196 = *(void **)(*((_QWORD *)&v243 + 1) + 8 * k);
        v197 = *((int *)a3 + 86);
        v198 = *((_DWORD *)a3 + 87);
        if ((int)v197 >= v198)
        {
          if (v198 == *((_DWORD *)a3 + 88))
            google::protobuf::internal::RepeatedPtrFieldBase::Reserve((int *)a3 + 84, v198 + 1);
          v200 = google::protobuf::internal::GenericTypeHandler<topotext::Attachment>::New();
          v201 = *((_QWORD *)a3 + 42);
          v202 = *(int32x2_t *)((char *)a3 + 344);
          *((int32x2_t *)a3 + 43) = vadd_s32(v202, (int32x2_t)0x100000001);
          *(_QWORD *)(v201 + 8 * v202.i32[0]) = v200;
        }
        else
        {
          v199 = *((_QWORD *)a3 + 42);
          *((_DWORD *)a3 + 86) = v197 + 1;
          v200 = *(topotext::Attachment **)(v199 + 8 * v197);
        }
        v242 = 0;
        objc_msgSend(v196, "saveToArchive:dataPersister:error:", v200, v241, &v242);
        v203 = v242;
        v204 = v203;
        if (a6 && v203)
          *a6 = objc_retainAutorelease(v203);

      }
      v193 = objc_msgSend(v192, "countByEnumeratingWithState:objects:count:", &v243, v257, 16);
    }
    while (v193);
  }

  objc_opt_class();
  -[ICAttachment attachmentModel](v239, "attachmentModel");
  v205 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v206 = (void *)objc_claimAutoreleasedReturnValue();

  if (v206)
  {
    objc_msgSend(v206, "archivePaperBundleToDiskWithError:", a6);
    v207 = (void *)objc_claimAutoreleasedReturnValue();
    v208 = v207;
    if (!v207)
      goto LABEL_207;
    v209 = (void *)MEMORY[0x1E0C99D50];
    objc_msgSend(v207, "path");
    v210 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v209, "dataWithContentsOfFile:", v210);
    v211 = (void *)objc_claimAutoreleasedReturnValue();

    if (v211)
    {
      if (!v241
        || (-[ICAttachment identifier](v239, "identifier"),
            v212 = objc_claimAutoreleasedReturnValue(),
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%@"), v212, CFSTR("systemPaperBundle")),
            v213 = (void *)objc_claimAutoreleasedReturnValue(),
            (id)v212,
            LOBYTE(v212) = objc_msgSend(v241, "saveData:identifier:", v211, v213),
            v213,
            (v212 & 1) == 0))
      {
        v214 = objc_retainAutorelease(v211);
        objc_msgSend(v214, "bytes");
        objc_msgSend(v214, "length");
        *((_DWORD *)a3 + 9) |= 0x40u;
        if (!google::protobuf::internal::empty_string_)
          __assert_rtn("GetEmptyStringAlreadyInited", "generated_message_util.h", 80, "empty_string_ != NULL");
        if (*((_QWORD *)a3 + 45) == google::protobuf::internal::empty_string_)
        {
          v215 = (_QWORD *)operator new();
          *v215 = 0;
          v215[1] = 0;
          v215[2] = 0;
          *((_QWORD *)a3 + 45) = v215;
        }
        MEMORY[0x1C3B7A7E8]();
      }
    }
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v216 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v216, "removeItemAtURL:error:", v208, 0);

    if (!v211)
    {
LABEL_207:
      v217 = os_log_create("com.apple.notes", "Archiving");
      if (os_log_type_enabled(v217, OS_LOG_TYPE_ERROR))
      {
        -[ICCloudSyncingObject ic_loggingIdentifier](v239, "ic_loggingIdentifier");
        v218 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v206, "paperBundleURL");
        v219 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICAttachment(ICAttachmentPersistenceAdditions) saveToArchive:dataPersister:stripImageMarkupMetadata:error:].cold.1(v218, v219, buf, v217);
      }

      objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICAttachment(ICAttachmentPersistenceAdditions) saveToArchive:dataPersister:stripImageMarkupMetadata:error:]", 1, 1, CFSTR("Failed to archive PaperKit bundle"));
      v237 = 0;
    }

  }
  -[ICAttachment synapseData](v239, "synapseData");
  v220 = (void *)objc_claimAutoreleasedReturnValue();
  v221 = v220 == 0;

  if (!v221)
  {
    -[ICAttachment synapseData](v239, "synapseData");
    v222 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v222, "bytes");
    -[ICAttachment synapseData](v239, "synapseData");
    v223 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v223, "length");
    *((_DWORD *)a3 + 9) |= 0x80u;
    if (!google::protobuf::internal::empty_string_)
      __assert_rtn("GetEmptyStringAlreadyInited", "generated_message_util.h", 80, "empty_string_ != NULL");
    if (*((_QWORD *)a3 + 46) == google::protobuf::internal::empty_string_)
    {
      v224 = (_QWORD *)operator new();
      *v224 = 0;
      v224[1] = 0;
      v224[2] = 0;
      *((_QWORD *)a3 + 46) = v224;
    }
    MEMORY[0x1C3B7A7E8]();

  }
  -[ICAttachment mergeablePreferredViewSize](v239, "mergeablePreferredViewSize");
  v225 = (void *)objc_claimAutoreleasedReturnValue();
  v226 = v225 == 0;

  if (!v226)
  {
    -[ICAttachment mergeablePreferredViewSize](v239, "mergeablePreferredViewSize");
    v227 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v227, "bytes");
    -[ICAttachment mergeablePreferredViewSize](v239, "mergeablePreferredViewSize");
    v228 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v228, "length");
    *((_DWORD *)a3 + 9) |= 0x200u;
    if (!google::protobuf::internal::empty_string_)
      __assert_rtn("GetEmptyStringAlreadyInited", "generated_message_util.h", 80, "empty_string_ != NULL");
    if (*((_QWORD *)a3 + 48) == google::protobuf::internal::empty_string_)
    {
      v229 = (_QWORD *)operator new();
      *v229 = 0;
      v229[1] = 0;
      v229[2] = 0;
      *((_QWORD *)a3 + 48) = v229;
    }
    MEMORY[0x1C3B7A7E8]();

  }
  return v237 & 1;
}

- (void)savePreview:(id)a3 toArchive:(void *)a4 previewDataIdentifier:(id)a5 dataPersister:(id)a6
{
  id v9;
  id v10;
  double v11;
  char v12;
  int v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  _QWORD *v19;
  void *v20;
  id v21;
  void *v22;
  _QWORD *v23;
  int v24;
  uint64_t v25;
  id v26;

  v26 = a3;
  v9 = a5;
  v10 = a6;
  objc_msgSend(v26, "scale");
  *(float *)&v11 = v11;
  *((_DWORD *)a4 + 8) |= 1u;
  *((_DWORD *)a4 + 12) = LODWORD(v11);
  v12 = objc_msgSend(v26, "scaleWhenDrawing");
  *((_DWORD *)a4 + 8) |= 2u;
  *((_BYTE *)a4 + 52) = v12;
  v13 = objc_msgSend(v26, "appearanceType");
  *((_DWORD *)a4 + 8) |= 0x80u;
  *((_DWORD *)a4 + 17) = v13;
  if (objc_msgSend(v26, "isPasswordProtected"))
  {
    if (!objc_msgSend(v26, "isAuthenticated"))
      goto LABEL_4;
    objc_msgSend(v26, "decryptedImageData");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14)
      goto LABEL_4;
  }
  else
  {
    v16 = (void *)MEMORY[0x1E0C99D50];
    objc_msgSend(v26, "previewImageURL");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "dataWithContentsOfURL:", v17);
    v18 = objc_claimAutoreleasedReturnValue();

    v14 = (void *)v18;
    if (!v18)
    {
LABEL_4:
      v15 = 0;
      goto LABEL_13;
    }
  }
  if (v10 && (objc_msgSend(v10, "saveData:identifier:", v14, v9) & 1) != 0)
  {
    v15 = v14;
  }
  else
  {
    v15 = objc_retainAutorelease(v14);
    objc_msgSend(v15, "bytes");
    objc_msgSend(v15, "length");
    *((_DWORD *)a4 + 8) |= 4u;
    if (!google::protobuf::internal::empty_string_)
      __assert_rtn("GetEmptyStringAlreadyInited", "generated_message_util.h", 80, "empty_string_ != NULL");
    if (*((_QWORD *)a4 + 5) == google::protobuf::internal::empty_string_)
    {
      v19 = (_QWORD *)operator new();
      *v19 = 0;
      v19[1] = 0;
      v19[2] = 0;
      *((_QWORD *)a4 + 5) = v19;
    }
    MEMORY[0x1C3B7A7E8]();
  }
LABEL_13:
  objc_msgSend(v26, "metadata");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    objc_msgSend(v26, "metadata");
    v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v21, "bytes");
    objc_msgSend(v26, "metadata");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "length");
    *((_DWORD *)a4 + 8) |= 8u;
    if (!google::protobuf::internal::empty_string_)
      __assert_rtn("GetEmptyStringAlreadyInited", "generated_message_util.h", 80, "empty_string_ != NULL");
    if (*((_QWORD *)a4 + 7) == google::protobuf::internal::empty_string_)
    {
      v23 = (_QWORD *)operator new();
      *v23 = 0;
      v23[1] = 0;
      v23[2] = 0;
      *((_QWORD *)a4 + 7) = v23;
    }
    MEMORY[0x1C3B7A7E8]();

  }
  if (objc_msgSend(v26, "version"))
  {
    v24 = objc_msgSend(v26, "version");
    *((_DWORD *)a4 + 8) |= 0x10u;
    *((_DWORD *)a4 + 16) = v24;
  }
  if (objc_msgSend(v26, "versionOutOfDate"))
  {
    *((_DWORD *)a4 + 8) |= 0x20u;
    *((_BYTE *)a4 + 53) = 1;
  }
  v25 = objc_msgSend(v26, "intrinsicNotesVersionForScenario:", 1);
  if (v25)
  {
    *((_DWORD *)a4 + 8) |= 0x40u;
    *((_QWORD *)a4 + 9) = v25;
  }

}

- (unint64_t)approximateArchiveSizeIncludingPreviews:(BOOL)a3
{
  _BOOL8 v3;
  char *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  ICAttachment *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  int v19;
  id v20;
  id v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  void *v29;
  double v31;
  double v32;
  double v33;
  id obj;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  id v40;
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v3 = a3;
  v48 = *MEMORY[0x1E0C80C00];
  -[ICAttachment mergeableData](self, "mergeableData");
  v4 = (char *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[ICAttachment mergeableData](self, "mergeableData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (char *)objc_msgSend(v5, "length");

  }
  -[ICAttachment media](self, "media");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6
    && (-[ICAttachment media](self, "media"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v7, "identifier"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v8,
        v7,
        v6,
        v8))
  {
    v9 = self;
    if (!-[ICAttachment fileSize](self, "fileSize"))
    {
      -[ICAttachment attachmentModel](self, "attachmentModel");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "updateFileBasedAttributes");

      v9 = self;
    }
    if (-[ICAttachment fileSize](v9, "fileSize"))
    {
      v4 += -[ICAttachment fileSize](v9, "fileSize");
    }
    else if (-[ICAttachment attachmentType](v9, "attachmentType") == 3)
    {
      -[ICAttachment sizeWidth](v9, "sizeWidth");
      v32 = v31;
      -[ICAttachment sizeHeight](v9, "sizeHeight");
      v4 = (char *)((double)(unint64_t)v4 + v32 * v33 * 4.0);
    }
  }
  else
  {
    v9 = self;
  }
  if (v3)
  {
    -[ICAttachment previewImages](v9, "previewImages");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "count");

    if (v12)
    {
      v44 = 0u;
      v45 = 0u;
      v42 = 0u;
      v43 = 0u;
      -[ICAttachment previewImages](self, "previewImages");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
      if (v13)
      {
        v14 = *(_QWORD *)v43;
        v15 = *MEMORY[0x1E0C99998];
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v43 != v14)
              objc_enumerationMutation(obj);
            v17 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
            if (objc_msgSend(v17, "isPasswordProtected"))
              objc_msgSend(v17, "encryptedPreviewImageURL");
            else
              objc_msgSend(v17, "previewImageURL");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v40 = 0;
            v41 = 0;
            v19 = objc_msgSend(v18, "getResourceValue:forKey:error:", &v41, v15, &v40);
            v20 = v41;
            v21 = v40;
            v22 = v21;
            if (v19)
              v4 += objc_msgSend(v20, "unsignedIntegerValue");
            else
              NSLog(CFSTR("Error reading attachment file size: %@"), v21);

          }
          v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
        }
        while (v13);
      }

      v9 = self;
    }
    else
    {
      v9 = self;
      if (-[ICAttachment attachmentType](self, "attachmentType") == 9)
      {
        +[ICDrawing defaultPixelSize](ICDrawing, "defaultPixelSize");
        v4 = (char *)((double)(unint64_t)v4 + v23 * v24);
      }
    }
  }
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  -[ICAttachment subAttachments](v9, "subAttachments");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v36, v46, 16);
  if (v26)
  {
    v27 = *(_QWORD *)v37;
    do
    {
      for (j = 0; j != v26; ++j)
      {
        if (*(_QWORD *)v37 != v27)
          objc_enumerationMutation(v25);
        v29 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * j);
        if (objc_msgSend(v29, "isVisible"))
          v4 += objc_msgSend(v29, "approximateArchiveSizeIncludingPreviews:", v3);
      }
      v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v36, v46, 16);
    }
    while (v26);
  }

  return (unint64_t)v4;
}

- (id)synapseBasedMetadata
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v11;
  objc_class *v12;
  id v13;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  -[ICAttachment synapseData](self, "synapseData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  v4 = objc_alloc(MEMORY[0x1E0DB0700]);
  -[ICAttachment synapseData](self, "synapseData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v6 = (void *)objc_msgSend(v4, "initWithData:error:", v5, &v13);
  v7 = v13;

  if (v7)
  {
    v8 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[ICAttachment(SearchLinkPresentation) synapseBasedMetadata].cold.1((uint64_t)v6, v8);

    v9 = 0;
  }
  else
  {
    v15 = 0;
    v16 = &v15;
    v17 = 0x2050000000;
    v11 = (void *)getLPLinkMetadataClass_softClass;
    v18 = getLPLinkMetadataClass_softClass;
    if (!getLPLinkMetadataClass_softClass)
    {
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __getLPLinkMetadataClass_block_invoke;
      v14[3] = &unk_1E76C77A8;
      v14[4] = &v15;
      __getLPLinkMetadataClass_block_invoke((uint64_t)v14);
      v11 = (void *)v16[3];
    }
    v12 = objc_retainAutorelease(v11);
    _Block_object_dispose(&v15, 8);
    v9 = (void *)objc_msgSend([v12 alloc], "_initWithSynapseContentItem:", v6);
  }

  return v9;
}

- (NSString)quotedText
{
  void *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__19;
  v11 = __Block_byref_object_dispose__19;
  v12 = 0;
  -[ICAttachment managedObjectContext](self, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __50__ICAttachment_SearchLinkPresentation__quotedText__block_invoke;
  v6[3] = &unk_1E76C7730;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v3, "performBlockAndWait:", v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSString *)v4;
}

void __50__ICAttachment_SearchLinkPresentation__quotedText__block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  id v4;

  v2 = objc_msgSend(*(id *)(a1 + 32), "hasSynapseLink");
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "synapseBasedMetadata");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "selectedText");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v3);
  if (v2)
  {

  }
}

- (NSString)recordType
{
  return (NSString *)CFSTR("Attachment");
}

- (id)recordZoneName
{
  return CFSTR("Notes");
}

- (BOOL)mergeCloudKitRecord:(id)a3 accountID:(id)a4 approach:(int64_t)a5 mergeableFieldState:(id)a6
{
  id v10;
  id v11;
  id v12;

  v10 = a6;
  v11 = a4;
  v12 = a3;
  LOBYTE(a5) = -[ICAttachment mergeCloudKitRecord:accountID:approach:mergeableFieldState:newAttachment:](self, "mergeCloudKitRecord:accountID:approach:mergeableFieldState:newAttachment:", v12, v11, a5, v10, -[ICAttachment needsInitialFetchFromCloud](self, "needsInitialFetchFromCloud"));

  return a5;
}

- (BOOL)mergeCloudKitRecord:(id)a3 accountID:(id)a4 approach:(int64_t)a5 mergeableFieldState:(id)a6 newAttachment:(BOOL)a7
{
  id v12;
  id v13;
  id v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
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
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  __int16 v55;
  uint64_t v56;
  void *v57;
  int v58;
  void *v59;
  uint64_t v60;
  void *v61;
  __int16 v62;
  uint64_t v63;
  void *v64;
  int v65;
  void *v66;
  uint64_t v67;
  void *v68;
  __int16 v69;
  uint64_t v70;
  void *v71;
  int v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  uint64_t v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  uint64_t v90;
  void *v91;
  void *v92;
  void *v93;
  int v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  uint64_t v113;
  void *v114;
  void *v115;
  id v116;
  void *v117;
  id v118;
  NSObject *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  double v124;
  double v125;
  void *v126;
  id v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  id v138;
  void *v139;
  void *v140;
  int v141;
  void *v142;
  int v143;
  uint64_t v144;
  void *v145;
  id v146;
  void *v148;
  void *v149;
  void *v150;
  id v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  BOOL v161;
  id v162;
  void *v163;
  void *v164;
  void *v165;
  int v166;
  void *v167;
  id v168;
  objc_super v169;

  v12 = a3;
  v13 = a4;
  v14 = a6;
  v169.receiver = self;
  v169.super_class = (Class)ICAttachment;
  v15 = -[ICCloudSyncingObject mergeCloudKitRecord:accountID:approach:mergeableFieldState:](&v169, sel_mergeCloudKitRecord_accountID_approach_mergeableFieldState_, v12, v13, a5, v14);
  if (v15)
  {
    -[ICAttachment managedObjectContext](self, "managedObjectContext");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "recordID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "recordName");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAttachment setIdentifier:](self, "setIdentifier:", v18);

    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("UTI"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
      goto LABEL_3;
    objc_msgSend(v12, "encryptedValues");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("UTIEncrypted"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v22)
      goto LABEL_9;
    objc_msgSend(v22, "ic_stringValue");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
LABEL_3:
      -[ICAttachment typeUTI](self, "typeUTI");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v19, "isEqual:", v20) & 1) != 0)
        v166 = 0;
      else
        v166 = objc_msgSend(v19, "isEqual:", CFSTR("com.apple.notes.gallery"));

      -[ICAttachment setTypeUTI:resetToIntrinsicNotesVersion:](self, "setTypeUTI:resetToIntrinsicNotesVersion:", v19, 0);
    }
    else
    {
LABEL_9:
      v166 = 0;
    }
    objc_msgSend((id)objc_opt_class(), "noteFromAttachmentRecord:accountID:context:", v12, v13, v16);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      -[ICAttachment setNote:](self, "setNote:", v23);
      -[ICAttachment note](self, "note");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "addAttachmentsObject:", self);

    }
    -[ICAttachment parentAttachmentFromRecord:accountID:context:](self, "parentAttachmentFromRecord:accountID:context:", v12, v13, v16);
    v25 = objc_claimAutoreleasedReturnValue();
    if (v25)
      -[ICAttachment setParentAttachment:](self, "setParentAttachment:", v25);
    v167 = (void *)v25;
    -[ICAttachment attachmentModel](self, "attachmentModel");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "mergeMergeableDataFromCloudKitRecord:approach:mergeableFieldState:", v12, a5, v14);

    if (a5)
      goto LABEL_111;
    if (a7 || -[ICAttachment attachmentType](self, "attachmentType") != 9)
    {
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("OriginX"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (v27)
      {
        objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("OriginX"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "doubleValue");
        -[ICAttachment setOriginX:](self, "setOriginX:");

      }
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("OriginY"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      if (v29)
      {
        objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("OriginY"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "doubleValue");
        -[ICAttachment setOriginY:](self, "setOriginY:");

      }
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("Width"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      if (v31)
      {
        objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("Width"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "doubleValue");
        -[ICAttachment setSizeWidth:](self, "setSizeWidth:");

      }
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("Height"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      if (v33)
      {
        objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("Height"));
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "doubleValue");
        -[ICAttachment setSizeHeight:](self, "setSizeHeight:");

      }
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("Orientation"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      if (v35)
      {
        objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("Orientation"));
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICAttachment setOrientation:](self, "setOrientation:", (__int16)objc_msgSend(v36, "integerValue"));

      }
    }
    objc_msgSend(v12, "encryptedValues");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("URLStringEncrypted"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    v158 = v38;
    v159 = v23;
    if (v38)
    {
      objc_msgSend(v38, "ic_stringValue");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "ic_substringToIndex:", 2047);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICAttachment setUrlString:](self, "setUrlString:", v40);
    }
    else
    {
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("URLString"));
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v41)
        goto LABEL_32;
      objc_opt_class();
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("URLString"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      ICDynamicCast();
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "ic_substringToIndex:", 2047);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICAttachment setUrlString:](self, "setUrlString:", v42);

    }
LABEL_32:
    objc_msgSend(v12, "encryptedValues");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("TitleEncrypted"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    if (v44)
    {
      objc_msgSend(v44, "ic_stringValue");
      v45 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("Title"));
      v46 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v46)
        goto LABEL_37;
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("Title"));
      v45 = objc_claimAutoreleasedReturnValue();
    }
    v47 = (void *)v45;
    -[ICAttachment setTitle:](self, "setTitle:", v45);

LABEL_37:
    v157 = v44;
    objc_msgSend(v12, "encryptedValues");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("UserTitle"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();

    v156 = v49;
    objc_msgSend(v49, "ic_stringValue");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAttachment setUserTitle:](self, "setUserTitle:", v50);

    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("ImageFilterType"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();

    if (v51)
    {
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("ImageFilterType"));
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICAttachment setImageFilterType:](self, "setImageFilterType:", (__int16)objc_msgSend(v52, "integerValue"));

    }
    objc_msgSend(v12, "ic_encryptedInlineableDataAssetForKeyPrefix:", CFSTR("HandwritingSummary"));
    v53 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("HandwritingSummaryVersion"));
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = objc_msgSend(v54, "intValue");

    v165 = (void *)v53;
    if (v53)
    {
      -[ICAttachment handwritingSummary](self, "handwritingSummary");
      v56 = objc_claimAutoreleasedReturnValue();
      if (!v56
        || (v57 = (void *)v56,
            v58 = -[ICAttachment handwritingSummaryVersion](self, "handwritingSummaryVersion"),
            v57,
            v58 <= v55))
      {
        objc_msgSend(v165, "ic_stringValue");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICAttachment setHandwritingSummary:](self, "setHandwritingSummary:", v59);

        -[ICAttachment setHandwritingSummaryVersion:](self, "setHandwritingSummaryVersion:", v55);
      }
    }
    objc_msgSend(v12, "ic_encryptedInlineableDataAssetForKeyPrefix:", CFSTR("ImageClassificationSummary"));
    v60 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("ImageClassificationSummaryVersion"));
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = objc_msgSend(v61, "intValue");

    v164 = (void *)v60;
    if (v60)
    {
      -[ICAttachment imageClassificationSummary](self, "imageClassificationSummary");
      v63 = objc_claimAutoreleasedReturnValue();
      if (!v63
        || (v64 = (void *)v63,
            v65 = -[ICAttachment imageClassificationSummaryVersion](self, "imageClassificationSummaryVersion"),
            v64,
            v65 <= v62))
      {
        objc_msgSend(v164, "ic_stringValue");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICAttachment setImageClassificationSummary:](self, "setImageClassificationSummary:", v66);

        -[ICAttachment setImageClassificationSummaryVersion:](self, "setImageClassificationSummaryVersion:", v62);
      }
    }
    objc_msgSend(v12, "ic_encryptedInlineableDataAssetForKeyPrefix:", CFSTR("OcrSummary"));
    v67 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("OcrSummaryVersion"));
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = objc_msgSend(v68, "intValue");

    v163 = (void *)v67;
    if (v67)
    {
      -[ICAttachment ocrSummary](self, "ocrSummary");
      v70 = objc_claimAutoreleasedReturnValue();
      if (!v70
        || (v71 = (void *)v70,
            v72 = -[ICAttachment ocrSummaryVersion](self, "ocrSummaryVersion"),
            v71,
            v72 <= v69))
      {
        objc_msgSend(v163, "ic_stringValue");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICAttachment setOcrSummary:](self, "setOcrSummary:", v73);

        objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("OcrSummaryVersion"));
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICAttachment setOcrSummaryVersion:](self, "setOcrSummaryVersion:", (__int16)objc_msgSend(v74, "intValue"));

      }
    }
    -[ICAttachment handwritingSummary](self, "handwritingSummary");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v75)
    {
      -[ICAttachment imageClassificationSummary](self, "imageClassificationSummary");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v75)
      {
        -[ICAttachment ocrSummary](self, "ocrSummary");
        v148 = (void *)objc_claimAutoreleasedReturnValue();

        if (v148)
        {
LABEL_54:
          objc_msgSend(v12, "encryptedValues");
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v76, "objectForKeyedSubscript:", CFSTR("MarkupModelData"));
          v77 = objc_claimAutoreleasedReturnValue();

          v155 = (void *)v77;
          -[ICAttachment setMarkupModelData:](self, "setMarkupModelData:", v77);
          objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("FileSize"));
          v78 = (void *)objc_claimAutoreleasedReturnValue();

          if (v78)
          {
            objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("FileSize"));
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            -[ICAttachment setFileSize:](self, "setFileSize:", objc_msgSend(v79, "integerValue"));

          }
          objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("HasMarkupData"));
          v80 = (void *)objc_claimAutoreleasedReturnValue();

          if (v80)
          {
            objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("HasMarkupData"));
            v81 = (void *)objc_claimAutoreleasedReturnValue();
            -[ICAttachment setHasMarkupData:](self, "setHasMarkupData:", objc_msgSend(v81, "BOOLValue"));

          }
          objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("Duration"));
          v82 = (void *)objc_claimAutoreleasedReturnValue();

          if (v82)
          {
            objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("Duration"));
            v83 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v83, "doubleValue");
            -[ICAttachment setDuration:](self, "setDuration:");

          }
          objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("CreationDate"));
          v84 = (void *)objc_claimAutoreleasedReturnValue();

          if (v84)
          {
            objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("CreationDate"));
            v85 = (void *)objc_claimAutoreleasedReturnValue();
            -[ICAttachment setCreationDate:](self, "setCreationDate:", v85);

          }
          objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("LastModificationDate"));
          v86 = (void *)objc_claimAutoreleasedReturnValue();

          v160 = v16;
          if (v86)
          {
            objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("LastModificationDate"));
            v87 = (void *)objc_claimAutoreleasedReturnValue();
            -[ICCloudSyncingObject modificationDate](self, "modificationDate");
            v88 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v87, "laterDate:", v88);
            v89 = (void *)objc_claimAutoreleasedReturnValue();
            -[ICAttachment setModificationDate:](self, "setModificationDate:", v89);

            -[ICCloudSyncingObject creationDate](self, "creationDate");
            v90 = objc_claimAutoreleasedReturnValue();
            if (!v90)
              goto LABEL_65;
            v91 = (void *)v90;
            -[ICCloudSyncingObject creationDate](self, "creationDate");
            v92 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
            v93 = (void *)objc_claimAutoreleasedReturnValue();
            v94 = objc_msgSend(v92, "isEqual:", v93);

            if (v94)
            {
LABEL_65:
              -[ICCloudSyncingObject modificationDate](self, "modificationDate");
              v95 = (void *)objc_claimAutoreleasedReturnValue();
              -[ICAttachment setCreationDate:](self, "setCreationDate:", v95);

            }
          }
          objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("CroppingQuadBottomLeftX"));
          v96 = (void *)objc_claimAutoreleasedReturnValue();

          if (v96)
          {
            objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("CroppingQuadBottomLeftX"));
            v97 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v97, "doubleValue");
            -[ICAttachment setCroppingQuadBottomLeftX:](self, "setCroppingQuadBottomLeftX:");

          }
          objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("CroppingQuadBottomLeftY"));
          v98 = (void *)objc_claimAutoreleasedReturnValue();

          if (v98)
          {
            objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("CroppingQuadBottomLeftY"));
            v99 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v99, "doubleValue");
            -[ICAttachment setCroppingQuadBottomLeftY:](self, "setCroppingQuadBottomLeftY:");

          }
          objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("CroppingQuadBottomRightX"));
          v100 = (void *)objc_claimAutoreleasedReturnValue();

          if (v100)
          {
            objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("CroppingQuadBottomRightX"));
            v101 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v101, "doubleValue");
            -[ICAttachment setCroppingQuadBottomRightX:](self, "setCroppingQuadBottomRightX:");

          }
          objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("CroppingQuadBottomRightY"));
          v102 = (void *)objc_claimAutoreleasedReturnValue();

          if (v102)
          {
            objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("CroppingQuadBottomRightY"));
            v103 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v103, "doubleValue");
            -[ICAttachment setCroppingQuadBottomRightY:](self, "setCroppingQuadBottomRightY:");

          }
          objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("CroppingQuadTopLeftX"));
          v104 = (void *)objc_claimAutoreleasedReturnValue();

          if (v104)
          {
            objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("CroppingQuadTopLeftX"));
            v105 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v105, "doubleValue");
            -[ICAttachment setCroppingQuadTopLeftX:](self, "setCroppingQuadTopLeftX:");

          }
          objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("CroppingQuadTopLeftY"));
          v106 = (void *)objc_claimAutoreleasedReturnValue();

          if (v106)
          {
            objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("CroppingQuadTopLeftY"));
            v107 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v107, "doubleValue");
            -[ICAttachment setCroppingQuadTopLeftY:](self, "setCroppingQuadTopLeftY:");

          }
          objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("CroppingQuadTopRightX"));
          v108 = (void *)objc_claimAutoreleasedReturnValue();

          if (v108)
          {
            objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("CroppingQuadTopRightX"));
            v109 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v109, "doubleValue");
            -[ICAttachment setCroppingQuadTopRightX:](self, "setCroppingQuadTopRightX:");

          }
          objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("CroppingQuadTopRightY"));
          v110 = (void *)objc_claimAutoreleasedReturnValue();

          if (v110)
          {
            objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("CroppingQuadTopRightY"));
            v111 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v111, "doubleValue");
            -[ICAttachment setCroppingQuadTopRightY:](self, "setCroppingQuadTopRightY:");

          }
          objc_msgSend(v12, "encryptedValues");
          v112 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v112, "objectForKeyedSubscript:", CFSTR("MetadataData"));
          v113 = objc_claimAutoreleasedReturnValue();

          if (v113)
            -[ICAttachment setMetadataData:](self, "setMetadataData:", v113);
          -[ICAttachment setHasPaperForm:](self, "setHasPaperForm:", 0);
          -[ICAttachment setDidRunPaperFormDetection:](self, "setDidRunPaperFormDetection:", 0);
          objc_msgSend(v12, "encryptedValues");
          v114 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v114, "objectForKeyedSubscript:", CFSTR("PlacemarkEncrypted"));
          v115 = (void *)objc_claimAutoreleasedReturnValue();

          v161 = v15;
          v153 = v115;
          v154 = (void *)v113;
          if (v115)
          {
            v116 = v115;
          }
          else
          {
            objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("Placemark"));
            v130 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v130
              || (objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("Placemark")),
                  (v116 = (id)objc_claimAutoreleasedReturnValue()) == 0))
            {
              v151 = 0;
LABEL_97:
              objc_msgSend(v12, "ic_encryptedInlineableDataAssetForKeyPrefix:", CFSTR("LinkPresentationMetadata"), v151);
              v131 = (void *)objc_claimAutoreleasedReturnValue();
              if (v131)
                -[ICAttachment setLinkPresentationArchivedMetadata:](self, "setLinkPresentationArchivedMetadata:", v131);
              v162 = v14;
              objc_msgSend(v12, "ic_encryptedInlineableDataAssetForKeyPrefix:", CFSTR("SynapseData"));
              v132 = (void *)objc_claimAutoreleasedReturnValue();
              if (v132)
                -[ICAttachment setSynapseData:](self, "setSynapseData:", v132);
              objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("Media"));
              v133 = (void *)objc_claimAutoreleasedReturnValue();
              v134 = v133;
              if (v133)
              {
                objc_msgSend(v133, "recordID");
                v135 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v135, "recordName");
                v136 = (void *)objc_claimAutoreleasedReturnValue();

                -[ICAttachment managedObjectContext](self, "managedObjectContext");
                v137 = (void *)objc_claimAutoreleasedReturnValue();
                +[ICMedia mediaWithIdentifier:context:](ICMedia, "mediaWithIdentifier:context:", v136, v137);
                v138 = (id)objc_claimAutoreleasedReturnValue();

                if (!v138)
                {
                  v138 = +[ICMedia newMediaWithAttachment:](ICMedia, "newMediaWithAttachment:", self);
                  objc_msgSend(v138, "setIdentifier:", v136);
                  objc_msgSend(v138, "setNeedsInitialFetchFromCloud:", 1);
                }
                -[ICAttachment setMedia:](self, "setMedia:", v138);

              }
              -[ICAttachment updatePreviewsFromRecord:](self, "updatePreviewsFromRecord:", v12);
              -[ICAttachment mergeFallbackImageAndPDFFromRecord:](self, "mergeFallbackImageAndPDFFromRecord:", v12);
              -[ICAttachment mergePaperBundleFromRecord:](self, "mergePaperBundleFromRecord:", v12);
              -[ICAttachment systemPaperModel](self, "systemPaperModel");
              v139 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v139, "fixupMetadataAndMinimumSupportedNotesVersion");

              if (v166 && (-[ICAttachment markedForDeletion](self, "markedForDeletion") & 1) == 0)
              {
                objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
                v140 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v140, "postNotificationName:object:", CFSTR("ICAttachmentDidCreateGalleryFromCloudNotification"), self);

              }
              -[ICAttachment fixMarkedForDeletionForScannedDocuments](self, "fixMarkedForDeletionForScannedDocuments");
              v141 = -[ICAttachment markedForDeletion](self, "markedForDeletion");
              -[ICAttachment media](self, "media");
              v142 = (void *)objc_claimAutoreleasedReturnValue();
              v143 = objc_msgSend(v142, "markedForDeletion");

              LOBYTE(v15) = v161;
              if (v141 != v143)
              {
                v144 = -[ICAttachment markedForDeletion](self, "markedForDeletion");
                -[ICAttachment media](self, "media");
                v145 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v145, "setMarkedForDeletion:", v144);

              }
              v14 = v162;
              v23 = v159;
              v16 = v160;
LABEL_111:
              v146 = (id)-[ICAttachment ic_postNotificationOnMainThreadAfterSaveWithName:](self, "ic_postNotificationOnMainThreadAfterSaveWithName:", CFSTR("ICAttachmentDidLoadNotification"));

              goto LABEL_112;
            }
          }
          v168 = 0;
          v151 = v116;
          v117 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v116, &v168);
          v118 = v168;
          if (v118)
          {
            v119 = os_log_create("com.apple.notes", "Cloud");
            if (os_log_type_enabled(v119, OS_LOG_TYPE_ERROR))
              -[ICAttachment(CloudKit) mergeCloudKitRecord:accountID:approach:mergeableFieldState:newAttachment:].cold.1();

          }
          objc_opt_class();
          objc_msgSend(v117, "decodeObjectOfClass:forKey:", objc_opt_class(), *MEMORY[0x1E0CB2CD0]);
          v120 = (void *)objc_claimAutoreleasedReturnValue();
          ICCheckedDynamicCast();
          v121 = (void *)objc_claimAutoreleasedReturnValue();

          -[ICAttachment location](self, "location");
          v122 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v122)
          {
            objc_msgSend(v121, "location");
            v123 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v123, "coordinate");
            v125 = v124;
            objc_msgSend(v121, "location");
            v126 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v126, "coordinate");
            v127 = -[ICAttachment addLocationWithLatitude:longitude:](self, "addLocationWithLatitude:longitude:", v125);

          }
          -[ICAttachment location](self, "location");
          v128 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v128, "setPlacemark:", v121);

          -[ICAttachment location](self, "location");
          v129 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v129, "setPlaceUpdated:", 1);

          goto LABEL_97;
        }
        objc_msgSend(v12, "encryptedValues");
        v149 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v149, "objectForKeyedSubscript:", CFSTR("SummaryEncrypted"));
        v75 = (void *)objc_claimAutoreleasedReturnValue();

        if (v75)
          objc_msgSend(v75, "ic_stringValue");
        else
          objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("Summary"));
        v150 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICAttachment setSummary:](self, "setSummary:", v150);

      }
    }

    goto LABEL_54;
  }
LABEL_112:

  return v15;
}

- (id)makeCloudKitRecordForApproach:(int64_t)a3 mergeableFieldState:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t *v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  void *v26;
  void *v27;
  double v28;
  void *v29;
  void *v30;
  double v31;
  void *v32;
  void *v33;
  double v34;
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
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  double v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  id v111;
  NSObject *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  int v121;
  id v122;
  void *v123;
  void *v124;
  uint64_t v125;
  void *v126;
  void *v127;
  id v128;
  void *v129;
  void *v130;
  void *v131;
  id v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  id v137;
  void *v138;
  void *v139;
  id v140;
  void *v141;
  void *v142;
  id v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  id v149;
  id v151;
  id v152;
  objc_super v153;
  uint8_t buf[4];
  void *v155;
  uint64_t v156;

  v156 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v153.receiver = self;
  v153.super_class = (Class)ICAttachment;
  -[ICCloudSyncingObject makeCloudKitRecordForApproach:mergeableFieldState:](&v153, sel_makeCloudKitRecordForApproach_mergeableFieldState_, a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((-[ICAttachment isPasswordProtected](self, "isPasswordProtected") & 1) == 0)
  {
    -[ICAttachment attachmentModel](self, "attachmentModel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addMergeableDataToCloudKitRecord:approach:mergeableFieldState:", v7, a3, v6);

  }
  -[ICAttachment typeUTI](self, "typeUTI");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[ICAttachment typeUTI](self, "typeUTI");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dataUsingEncoding:", 4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "encryptedValues");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, CFSTR("UTIEncrypted"));

    -[ICAttachment typeUTI](self, "typeUTI");
    v13 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v13, CFSTR("UTI"));
  }
  else
  {
    v13 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      -[ICCloudSyncingObject loggingDescription](self, "loggingDescription");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v155 = v14;
      _os_log_impl(&dword_1BD918000, v13, OS_LOG_TYPE_DEFAULT, "Trying to create a record for an attachment that is of an unknown type: %@", buf, 0xCu);

    }
  }

  -[ICAttachment note](self, "note");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "recordID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICAttachment parentAttachment](self, "parentAttachment");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "recordID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = (uint64_t *)MEMORY[0x1E0C94A40];
  if (v16)
  {
    v20 = objc_alloc(MEMORY[0x1E0C950C0]);
    if (v18)
      v21 = 0;
    else
      v21 = *v19;
    v22 = (void *)objc_msgSend(v20, "initWithRecordID:action:", v16, v21);
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v22, CFSTR("Note"));

  }
  if (v18)
  {
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C950C0]), "initWithRecordID:action:", v18, *v19);
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v23, CFSTR("ParentAttachment"));

  }
  if (!a3)
  {
    v151 = v6;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", -[ICAttachment imageFilterType](self, "imageFilterType"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v24, CFSTR("ImageFilterType"));

    -[ICAttachment originX](self, "originX");
    if (v25 != 0.0)
    {
      v26 = (void *)MEMORY[0x1E0CB37E8];
      -[ICAttachment originX](self, "originX");
      objc_msgSend(v26, "numberWithDouble:");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v27, CFSTR("OriginX"));

    }
    -[ICAttachment originY](self, "originY");
    if (v28 != 0.0)
    {
      v29 = (void *)MEMORY[0x1E0CB37E8];
      -[ICAttachment originY](self, "originY");
      objc_msgSend(v29, "numberWithDouble:");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v30, CFSTR("OriginY"));

    }
    -[ICAttachment sizeWidth](self, "sizeWidth");
    if (v31 != 0.0)
    {
      v32 = (void *)MEMORY[0x1E0CB37E8];
      -[ICAttachment sizeWidth](self, "sizeWidth");
      objc_msgSend(v32, "numberWithDouble:");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v33, CFSTR("Width"));

    }
    -[ICAttachment sizeHeight](self, "sizeHeight");
    if (v34 != 0.0)
    {
      v35 = (void *)MEMORY[0x1E0CB37E8];
      -[ICAttachment sizeHeight](self, "sizeHeight");
      objc_msgSend(v35, "numberWithDouble:");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v36, CFSTR("Height"));

    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", -[ICAttachment orientation](self, "orientation"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v37, CFSTR("Orientation"));

    if ((-[ICAttachment isPasswordProtected](self, "isPasswordProtected") & 1) == 0)
    {
      -[ICAttachment urlString](self, "urlString");
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      if (v38)
      {
        -[ICAttachment urlString](self, "urlString");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "ic_substringToIndex:", 2047);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "dataUsingEncoding:", 4);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "encryptedValues");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "setObject:forKeyedSubscript:", v41, CFSTR("URLStringEncrypted"));

      }
    }
    if ((-[ICAttachment isPasswordProtected](self, "isPasswordProtected") & 1) == 0)
    {
      -[ICAttachment title](self, "title");
      v43 = (void *)objc_claimAutoreleasedReturnValue();

      if (v43)
      {
        -[ICAttachment title](self, "title");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "dataUsingEncoding:", 4);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "encryptedValues");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "setObject:forKeyedSubscript:", v45, CFSTR("TitleEncrypted"));

      }
    }
    if ((-[ICAttachment isPasswordProtected](self, "isPasswordProtected") & 1) == 0)
    {
      -[ICAttachment handwritingSummary](self, "handwritingSummary");
      v47 = (void *)objc_claimAutoreleasedReturnValue();

      if (v47)
      {
        -[ICAttachment handwritingSummary](self, "handwritingSummary");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "dataUsingEncoding:", 4);
        v49 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v7, "ic_setEncryptedInlineableDataAsset:forKeyPrefix:approach:", v49, CFSTR("HandwritingSummary"), 0);
      }
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", -[ICAttachment handwritingSummaryVersion](self, "handwritingSummaryVersion"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v50, CFSTR("HandwritingSummaryVersion"));

    if ((-[ICAttachment isPasswordProtected](self, "isPasswordProtected") & 1) == 0)
    {
      -[ICAttachment imageClassificationSummary](self, "imageClassificationSummary");
      v51 = (void *)objc_claimAutoreleasedReturnValue();

      if (v51)
      {
        -[ICAttachment imageClassificationSummary](self, "imageClassificationSummary");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "dataUsingEncoding:", 4);
        v53 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v7, "ic_setEncryptedInlineableDataAsset:forKeyPrefix:approach:", v53, CFSTR("ImageClassificationSummary"), 0);
      }
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", -[ICAttachment imageClassificationSummaryVersion](self, "imageClassificationSummaryVersion"));
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v54, CFSTR("ImageClassificationSummaryVersion"));

    if ((-[ICAttachment isPasswordProtected](self, "isPasswordProtected") & 1) == 0)
    {
      -[ICAttachment ocrSummary](self, "ocrSummary");
      v55 = (void *)objc_claimAutoreleasedReturnValue();

      if (v55)
      {
        -[ICAttachment ocrSummary](self, "ocrSummary");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "dataUsingEncoding:", 4);
        v57 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v7, "ic_setEncryptedInlineableDataAsset:forKeyPrefix:approach:", v57, CFSTR("OcrSummary"), 0);
      }
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", -[ICAttachment ocrSummaryVersion](self, "ocrSummaryVersion"));
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v58, CFSTR("OcrSummaryVersion"));

    if ((-[ICAttachment isPasswordProtected](self, "isPasswordProtected") & 1) == 0)
    {
      -[ICAttachment summary](self, "summary");
      v59 = (void *)objc_claimAutoreleasedReturnValue();

      if (v59)
      {
        -[ICAttachment summary](self, "summary");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "ic_substringToIndex:", 999);
        v61 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v61, "dataUsingEncoding:", 4);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "encryptedValues");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "setObject:forKeyedSubscript:", v62, CFSTR("SummaryEncrypted"));

      }
    }
    if ((-[ICAttachment isPasswordProtected](self, "isPasswordProtected") & 1) == 0)
    {
      -[ICAttachment userTitle](self, "userTitle");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "dataUsingEncoding:", 4);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "encryptedValues");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "setObject:forKeyedSubscript:", v65, CFSTR("UserTitle"));

    }
    if ((-[ICAttachment isPasswordProtected](self, "isPasswordProtected") & 1) == 0)
    {
      -[ICAttachment markupModelData](self, "markupModelData");
      v67 = (void *)objc_claimAutoreleasedReturnValue();

      if (v67)
      {
        -[ICAttachment markupModelData](self, "markupModelData");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "encryptedValues");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "setObject:forKeyedSubscript:", v68, CFSTR("MarkupModelData"));

      }
      else
      {
        objc_msgSend(v7, "setObject:forKeyedSubscript:", 0, CFSTR("MarkupModelData"));
      }
    }
    if (-[ICAttachment hasMarkupData](self, "hasMarkupData"))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ICAttachment hasMarkupData](self, "hasMarkupData"));
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v70, CFSTR("HasMarkupData"));

    }
    if (-[ICAttachment fileSize](self, "fileSize"))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[ICAttachment fileSize](self, "fileSize"));
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v71, CFSTR("FileSize"));

    }
    -[ICAttachment duration](self, "duration");
    if (v72 != 0.0)
    {
      v73 = (void *)MEMORY[0x1E0CB37E8];
      -[ICAttachment duration](self, "duration");
      objc_msgSend(v73, "numberWithDouble:");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v74, CFSTR("Duration"));

    }
    -[ICAttachment attachmentModel](self, "attachmentModel");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "asset");
    v76 = (void *)objc_claimAutoreleasedReturnValue();

    if ((-[ICAttachment isPasswordProtected](self, "isPasswordProtected") & 1) == 0 && v76)
    {
      objc_msgSend((id)*MEMORY[0x1E0CEC530], "identifier");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "previewImageDataWithUTType:", v77);
      v78 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend((id)objc_opt_class(), "assetForData:", v78);
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v79, CFSTR("PreviewImage"));

    }
    -[ICAttachment previewUpdateDate](self, "previewUpdateDate");
    v80 = (void *)objc_claimAutoreleasedReturnValue();

    if (v80)
    {
      -[ICAttachment previewUpdateDate](self, "previewUpdateDate");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v81, CFSTR("PreviewUpdateDate"));

    }
    -[ICCloudSyncingObject creationDate](self, "creationDate");
    v82 = (void *)objc_claimAutoreleasedReturnValue();

    if (v82)
    {
      -[ICCloudSyncingObject creationDate](self, "creationDate");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v83, CFSTR("CreationDate"));

    }
    -[ICCloudSyncingObject modificationDate](self, "modificationDate");
    v84 = (void *)objc_claimAutoreleasedReturnValue();

    if (v84)
    {
      -[ICCloudSyncingObject modificationDate](self, "modificationDate");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v85, CFSTR("LastModificationDate"));

    }
    v86 = (void *)MEMORY[0x1E0CB37E8];
    -[ICAttachment croppingQuadBottomLeftX](self, "croppingQuadBottomLeftX");
    objc_msgSend(v86, "numberWithDouble:");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v87, CFSTR("CroppingQuadBottomLeftX"));

    v88 = (void *)MEMORY[0x1E0CB37E8];
    -[ICAttachment croppingQuadBottomLeftY](self, "croppingQuadBottomLeftY");
    objc_msgSend(v88, "numberWithDouble:");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v89, CFSTR("CroppingQuadBottomLeftY"));

    v90 = (void *)MEMORY[0x1E0CB37E8];
    -[ICAttachment croppingQuadBottomRightX](self, "croppingQuadBottomRightX");
    objc_msgSend(v90, "numberWithDouble:");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v91, CFSTR("CroppingQuadBottomRightX"));

    v92 = (void *)MEMORY[0x1E0CB37E8];
    -[ICAttachment croppingQuadBottomRightY](self, "croppingQuadBottomRightY");
    objc_msgSend(v92, "numberWithDouble:");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v93, CFSTR("CroppingQuadBottomRightY"));

    v94 = (void *)MEMORY[0x1E0CB37E8];
    -[ICAttachment croppingQuadTopLeftX](self, "croppingQuadTopLeftX");
    objc_msgSend(v94, "numberWithDouble:");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v95, CFSTR("CroppingQuadTopLeftX"));

    v96 = (void *)MEMORY[0x1E0CB37E8];
    -[ICAttachment croppingQuadTopLeftY](self, "croppingQuadTopLeftY");
    objc_msgSend(v96, "numberWithDouble:");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v97, CFSTR("CroppingQuadTopLeftY"));

    v98 = (void *)MEMORY[0x1E0CB37E8];
    -[ICAttachment croppingQuadTopRightX](self, "croppingQuadTopRightX");
    objc_msgSend(v98, "numberWithDouble:");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v99, CFSTR("CroppingQuadTopRightX"));

    v100 = (void *)MEMORY[0x1E0CB37E8];
    -[ICAttachment croppingQuadTopRightY](self, "croppingQuadTopRightY");
    objc_msgSend(v100, "numberWithDouble:");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v101, CFSTR("CroppingQuadTopRightY"));

    if ((-[ICAttachment isPasswordProtected](self, "isPasswordProtected") & 1) == 0)
    {
      -[ICAttachment metadataData](self, "metadataData");
      v102 = (void *)objc_claimAutoreleasedReturnValue();

      if (v102)
      {
        -[ICAttachment metadataData](self, "metadataData");
        v103 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "encryptedValues");
        v104 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v104, "setObject:forKeyedSubscript:", v103, CFSTR("MetadataData"));

      }
    }
    -[ICAttachment location](self, "location");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v105, "placemark");
    v106 = (void *)objc_claimAutoreleasedReturnValue();

    if (v106)
    {
      v107 = (void *)MEMORY[0x1E0CB36F8];
      -[ICAttachment location](self, "location");
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v108, "placemark");
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      v152 = 0;
      objc_msgSend(v107, "archivedDataWithRootObject:requiringSecureCoding:error:", v109, 1, &v152);
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      v111 = v152;

      if (v111)
      {
        v112 = os_log_create("com.apple.notes", "Cloud");
        if (os_log_type_enabled(v112, OS_LOG_TYPE_ERROR))
          -[ICAttachment(CloudKit) makeCloudKitRecordForApproach:mergeableFieldState:].cold.1(v111);

      }
      objc_msgSend(v7, "encryptedValues");
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v113, "setObject:forKeyedSubscript:", v110, CFSTR("PlacemarkEncrypted"));

      -[ICAttachment location](self, "location");
      v114 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v114, "formattedAddressWithoutAttachmentTitle");
      v115 = (void *)objc_claimAutoreleasedReturnValue();

      if (v115)
      {
        objc_msgSend(v115, "dataUsingEncoding:", 4);
        v116 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "encryptedValues");
        v117 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v117, "setObject:forKeyedSubscript:", v116, CFSTR("SummaryEncrypted"));

      }
    }
    -[ICAttachment media](self, "media");
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v118, "recordID");
    v119 = (void *)objc_claimAutoreleasedReturnValue();

    if (v119)
    {
      -[ICAttachment media](self, "media");
      v120 = (void *)objc_claimAutoreleasedReturnValue();
      v121 = objc_msgSend(v120, "hasFile");

      if (v121)
      {
        v122 = objc_alloc(MEMORY[0x1E0C950C0]);
        v123 = (void *)objc_msgSend(v122, "initWithRecordID:action:", v119, *MEMORY[0x1E0C94A40]);
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v123, CFSTR("Media"));

      }
    }
    -[ICAttachment previewImages](self, "previewImages");
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    v125 = objc_msgSend(v124, "count");

    v6 = v151;
    if (v125)
    {
      v126 = (void *)objc_opt_class();
      -[ICAttachment previewImages](self, "previewImages");
      v127 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v126, "addPreviewImages:toRecord:", v127, v7);

    }
    if (-[ICAttachment hasFallbackImage](self, "hasFallbackImage"))
    {
      if ((-[ICAttachment isPasswordProtected](self, "isPasswordProtected") & 1) != 0)
        -[ICAttachment fallbackImageEncryptedURL](self, "fallbackImageEncryptedURL");
      else
        -[ICAttachment fallbackImageURL](self, "fallbackImageURL");
      v128 = (id)objc_claimAutoreleasedReturnValue();

      if (v128)
      {
        +[ICCloudSyncingObject assetForURL:](ICCloudSyncingObject, "assetForURL:", v128);
        v129 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v129, CFSTR("FallbackImage"));
        -[ICAttachment fallbackImageCryptoTag](self, "fallbackImageCryptoTag");
        v130 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v130, CFSTR("FallbackImageCryptoTag"));

        -[ICAttachment fallbackImageCryptoInitializationVector](self, "fallbackImageCryptoInitializationVector");
        v131 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v131, CFSTR("FallbackImageCryptoInitializationVector"));

      }
    }
    if (-[ICAttachment hasFallbackPDF](self, "hasFallbackPDF"))
    {
      if ((-[ICAttachment isPasswordProtected](self, "isPasswordProtected") & 1) != 0)
        -[ICAttachment fallbackPDFEncryptedURL](self, "fallbackPDFEncryptedURL");
      else
        -[ICAttachment fallbackPDFURL](self, "fallbackPDFURL");
      v132 = (id)objc_claimAutoreleasedReturnValue();

      if (v132)
      {
        +[ICCloudSyncingObject assetForURL:](ICCloudSyncingObject, "assetForURL:", v132);
        v133 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v133, CFSTR("FallbackPDF"));
        -[ICAttachment fallbackPDFCryptoTag](self, "fallbackPDFCryptoTag");
        v134 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v134, CFSTR("FallbackPDFCryptoTag"));

        -[ICAttachment fallbackPDFCryptoInitializationVector](self, "fallbackPDFCryptoInitializationVector");
        v135 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v135, CFSTR("FallbackPDFCryptoInitializationVector"));

      }
    }
    -[ICAttachment fallbackTitle](self, "fallbackTitle");
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    if (v136)
    {
      v137 = v136;

    }
    else
    {
      -[ICAttachment attachmentModel](self, "attachmentModel");
      v138 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v138, "localizedFallbackTitle");
      v137 = (id)objc_claimAutoreleasedReturnValue();

      if (!v137)
        goto LABEL_97;
    }
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v137, CFSTR("FallbackTitle"));

LABEL_97:
    -[ICAttachment fallbackSubtitleIOS](self, "fallbackSubtitleIOS");
    v139 = (void *)objc_claimAutoreleasedReturnValue();
    if (v139)
    {
      v140 = v139;

    }
    else
    {
      -[ICAttachment attachmentModel](self, "attachmentModel");
      v141 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v141, "localizedFallbackSubtitleIOS");
      v140 = (id)objc_claimAutoreleasedReturnValue();

      if (!v140)
        goto LABEL_101;
    }
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v140, CFSTR("FallbackSubtitleIOS"));

LABEL_101:
    -[ICAttachment fallbackSubtitleMac](self, "fallbackSubtitleMac");
    v142 = (void *)objc_claimAutoreleasedReturnValue();
    if (v142)
    {
      v143 = v142;

    }
    else
    {
      -[ICAttachment attachmentModel](self, "attachmentModel");
      v144 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v144, "localizedFallbackSubtitleMac");
      v143 = (id)objc_claimAutoreleasedReturnValue();

      if (!v143)
        goto LABEL_105;
    }
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v143, CFSTR("FallbackSubtitleMac"));

LABEL_105:
    if ((-[ICAttachment isPasswordProtected](self, "isPasswordProtected") & 1) == 0)
    {
      -[ICAttachment linkPresentationArchivedMetadata](self, "linkPresentationArchivedMetadata");
      v145 = (void *)objc_claimAutoreleasedReturnValue();

      if (v145)
      {
        -[ICAttachment linkPresentationArchivedMetadata](self, "linkPresentationArchivedMetadata");
        v146 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "ic_setEncryptedInlineableDataAsset:forKeyPrefix:approach:", v146, CFSTR("LinkPresentationMetadata"), 0);

      }
    }
    if ((-[ICAttachment isPasswordProtected](self, "isPasswordProtected") & 1) == 0)
    {
      -[ICAttachment synapseData](self, "synapseData");
      v147 = (void *)objc_claimAutoreleasedReturnValue();

      if (v147)
      {
        -[ICAttachment synapseData](self, "synapseData");
        v148 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "ic_setEncryptedInlineableDataAsset:forKeyPrefix:approach:", v148, CFSTR("SynapseData"), 0);

      }
    }
    -[ICAttachment addPaperBundleToRecordIfAppropriate:](self, "addPaperBundleToRecordIfAppropriate:", v7);

  }
  v149 = v7;

  return v149;
}

+ (id)existingCloudObjectForRecordID:(id)a3 accountID:(id)a4 context:(id)a5
{
  id v6;
  void *v7;
  void *v8;

  v6 = a5;
  objc_msgSend(a3, "recordName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICBaseAttachment attachmentWithIdentifier:context:](ICAttachment, "attachmentWithIdentifier:context:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)parentAttachmentFromRecord:(id)a3 accountID:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("ParentAttachment"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "recordID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[ICAttachment existingCloudObjectForRecordID:accountID:context:](ICAttachment, "existingCloudObjectForRecordID:accountID:context:", v13, v9, v10);
    v14 = (id)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
      v15 = os_log_create("com.apple.notes", "Cloud");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        -[ICAttachment className](self, "className");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "recordID");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "recordName");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "recordID");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "recordName");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v26 = v20;
        v27 = 2112;
        v28 = v21;
        v29 = 2112;
        v30 = v22;
        _os_log_debug_impl(&dword_1BD918000, v15, OS_LOG_TYPE_DEBUG, "Found an %@ (%@) from the cloud for a parent attachment (%@) that we don't know about yet", buf, 0x20u);

      }
      objc_msgSend(v12, "recordID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "recordName");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICAttachment note](self, "note");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = +[ICBaseAttachment newAttachmentWithIdentifier:note:](ICAttachment, "newAttachmentWithIdentifier:note:", v17, v18);

      objc_msgSend(v14, "setNeedsInitialFetchFromCloud:", 1);
    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (id)noteFromAttachmentUserSpecificRecord:(id)a3 accountID:(id)a4 context:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("NoteUUID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "length"))
  {
    +[ICNote noteWithIdentifier:context:](ICNote, "noteWithIdentifier:context:", v10, v9);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      v12 = os_log_create("com.apple.notes", "Cloud");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v7, "recordID");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "recordName");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 138412802;
        v19 = v17;
        v20 = 2112;
        v21 = v10;
        v22 = 2112;
        v23 = v8;
        _os_log_debug_impl(&dword_1BD918000, v12, OS_LOG_TYPE_DEBUG, "Found a user-specific attachment record (%@) for a note (%@) in account (%@) that we haven't seen yet", (uint8_t *)&v18, 0x20u);

      }
      +[ICAccount cloudKitAccountWithIdentifier:context:](ICAccount, "cloudKitAccountWithIdentifier:context:", v8, v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = +[ICNote newNoteWithoutIdentifierInAccount:](ICNote, "newNoteWithoutIdentifierInAccount:", v13);
      objc_msgSend(v11, "setIdentifier:", v10);
      objc_msgSend(v11, "setNeedsInitialFetchFromCloud:", 1);

    }
  }
  else
  {
    v14 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      +[ICAttachment(CloudKit) noteFromAttachmentUserSpecificRecord:accountID:context:].cold.1();

    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "+[ICAttachment(CloudKit) noteFromAttachmentUserSpecificRecord:accountID:context:]", 1, 1, CFSTR("Missing note reference in attachment user-specific record"));
    v11 = 0;
  }

  return v11;
}

+ (id)noteFromAttachmentRecord:(id)a3 accountID:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  id v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("Note"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!v11)
  {
    v16 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(a1, "className");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "recordID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "recordName");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v29 = v19;
      v30 = 2112;
      v31 = v21;
      v32 = 2112;
      v33 = v9;
      _os_log_impl(&dword_1BD918000, v16, OS_LOG_TYPE_DEFAULT, "Found an %@ (%@) in the cloud with no note in account ID %@", buf, 0x20u);

    }
    v14 = 0;
    goto LABEL_9;
  }
  objc_msgSend(v11, "recordID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICNote existingCloudObjectForRecordID:accountID:context:](ICNote, "existingCloudObjectForRecordID:accountID:context:", v13, v9, v10);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    v15 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(a1, "className");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "recordID");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "recordName");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "recordID");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "recordName");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v29 = v23;
      v30 = 2112;
      v31 = v24;
      v32 = 2112;
      v33 = v26;
      v34 = 2112;
      v35 = v9;
      _os_log_debug_impl(&dword_1BD918000, v15, OS_LOG_TYPE_DEBUG, "Found an %@ (%@) from the cloud for a note (%@) that we don't know about yet in account ID %@", buf, 0x2Au);

    }
    +[ICAccount cloudKitAccountWithIdentifier:context:](ICAccount, "cloudKitAccountWithIdentifier:context:", v9, v10);
    v16 = objc_claimAutoreleasedReturnValue();
    v14 = +[ICNote newNoteWithoutIdentifierInAccount:](ICNote, "newNoteWithoutIdentifierInAccount:", v16);
    objc_msgSend(v12, "recordID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "recordName");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setIdentifier:", v18);

    objc_msgSend(v14, "setNeedsInitialFetchFromCloud:", 1);
LABEL_9:

  }
  return v14;
}

+ (id)newCloudObjectForRecord:(id)a3 accountID:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v8 = a4;
  v9 = a3;
  objc_msgSend(a1, "noteFromAttachmentRecord:accountID:context:", v9, v8, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "recordID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "recordName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addAttachmentWithIdentifier:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setModificationDate:", v14);

  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setCreationDate:", v15);

  objc_msgSend(v13, "mergeCloudKitRecord:accountID:approach:mergeableFieldState:newAttachment:", v9, v8, 0, 0, 1);
  objc_msgSend(v13, "setServerRecord:", v9);

  objc_msgSend(v13, "setInCloud:", 1);
  objc_msgSend(v13, "clearChangeCountWithReason:", CFSTR("Created attachment"));
  objc_msgSend(v13, "updateParentReferenceIfNecessary");
  v16 = (id)objc_msgSend(v13, "ic_postNotificationOnMainThreadAfterSaveWithName:", CFSTR("ICAttachmentDidLoadNotification"));

  return v13;
}

+ (BOOL)supportsUserSpecificRecords
{
  return 1;
}

- (BOOL)wantsUserSpecificRecord
{
  void *v2;
  BOOL v3;

  -[ICAttachment mergeablePreferredViewSize](self, "mergeablePreferredViewSize");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)makeUserSpecificCloudKitRecordForApproach:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)ICAttachment;
  -[ICCloudSyncingObject makeUserSpecificCloudKitRecordForApproach:](&v13, sel_makeUserSpecificCloudKitRecordForApproach_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAttachment note](self, "note");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "recordID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[ICAttachment note](self, "note");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "recordID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "recordName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, CFSTR("NoteUUID"));

  }
  -[ICAttachment mergeablePreferredViewSize](self, "mergeablePreferredViewSize");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(v4, "encryptedValues");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, CFSTR("MergeablePreferredViewSizeEncrypted"));

  }
  return v4;
}

- (BOOL)mergeDataFromUserSpecificRecord:(id)a3 accountID:(id)a4
{
  id v6;
  id v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  ICTTMergeableWallClockValue *v13;
  ICTTMergeableWallClockValue *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  objc_super v23;

  v6 = a3;
  v7 = a4;
  v23.receiver = self;
  v23.super_class = (Class)ICAttachment;
  v8 = -[ICCloudSyncingObject mergeDataFromUserSpecificRecord:accountID:](&v23, sel_mergeDataFromUserSpecificRecord_accountID_, v6, v7);
  if (v8)
  {
    -[ICAttachment note](self, "note");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {

    }
    else
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("NoteUUID"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        v17 = (void *)objc_opt_class();
        -[ICAttachment managedObjectContext](self, "managedObjectContext");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "noteFromAttachmentUserSpecificRecord:accountID:context:", v6, v7, v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICAttachment setNote:](self, "setNote:", v19);

        -[ICAttachment note](self, "note");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v20)
          objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "self.note", "-[ICAttachment(CloudKit) mergeDataFromUserSpecificRecord:accountID:]", 1, 0, CFSTR("Expected a note (existing or placeholder) to be created from user-specific record"));
      }
    }
    objc_msgSend(v6, "encryptedValues");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("MergeablePreferredViewSizeEncrypted"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[ICAttachment mergeablePreferredViewSize](self, "mergeablePreferredViewSize");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        v13 = -[ICTTMergeableWallClockValue initWithData:]([ICTTMergeableWallClockValue alloc], "initWithData:", v11);
        v14 = -[ICTTMergeableWallClockValue initWithData:]([ICTTMergeableWallClockValue alloc], "initWithData:", v12);
        if (-[ICTTMergeableWallClockValue merge:](v14, "merge:", v13) == 2)
        {
          -[ICTTMergeableWallClockValue serialize](v14, "serialize");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[ICAttachment setMergeablePreferredViewSize:](self, "setMergeablePreferredViewSize:", v15);

        }
      }
      else
      {
        -[ICAttachment setMergeablePreferredViewSize:](self, "setMergeablePreferredViewSize:", v11);
      }

    }
    v21 = (id)-[ICAttachment ic_postNotificationOnMainThreadAfterSaveWithName:](self, "ic_postNotificationOnMainThreadAfterSaveWithName:", CFSTR("ICAttachmentDidLoadNotification"));

  }
  return v8;
}

- (BOOL)isInICloudAccount
{
  ICAttachment *v2;
  void *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[ICAttachment managedObjectContext](self, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __43__ICAttachment_CloudKit__isInICloudAccount__block_invoke;
  v5[3] = &unk_1E76C76B0;
  v5[4] = v2;
  v5[5] = &v6;
  objc_msgSend(v3, "performBlockAndWait:", v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

void __43__ICAttachment_CloudKit__isInICloudAccount__block_invoke(uint64_t a1)
{
  id v2;

  if (objc_msgSend(*(id *)(a1 + 32), "isInCloud"))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "note");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "isInICloudAccount");

  }
}

- (void)fixMarkedForDeletionForScannedDocuments
{
  uint64_t v3;
  void *v4;
  void *v5;
  char v6;
  id v7;

  if (-[ICAttachment markedForDeletion](self, "markedForDeletion"))
  {
    -[ICAttachment parentAttachment](self, "parentAttachment");
    v3 = objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v7 = (id)v3;
      -[ICAttachment parentAttachment](self, "parentAttachment");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v4, "needsInitialFetchFromCloud"))
      {

LABEL_8:
        return;
      }
      -[ICAttachment parentAttachment](self, "parentAttachment");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "markedForDeletion");

      if ((v6 & 1) == 0)
      {
        -[ICAttachment parentAttachment](self, "parentAttachment");
        v7 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "updateMarkedForDeletionStateAttachmentIsInUse:", 1);
        goto LABEL_8;
      }
    }
  }
}

- (void)fixBrokenReferences
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  char v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  char v38;
  NSObject *v39;
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
  uint64_t v50;
  NSObject *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  char v57;
  NSObject *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  int v64;
  void *v65;
  __int16 v66;
  void *v67;
  __int16 v68;
  void *v69;
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v3 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[ICCloudSyncingObject loggingDescription](self, "loggingDescription");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAttachment media](self, "media");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "loggingDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAttachment note](self, "note");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "loggingDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = 138412802;
    v65 = v4;
    v66 = 2112;
    v67 = v6;
    v68 = 2112;
    v69 = v8;
    _os_log_impl(&dword_1BD918000, v3, OS_LOG_TYPE_DEFAULT, "Fixing broken references for attachment: %@\n\tMedia=%@\n\tNote=%@", (uint8_t *)&v64, 0x20u);

  }
  -[ICAttachment note](self, "note");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "needsInitialFetchFromCloud");

  if (v10)
  {
    v11 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      -[ICAttachment identifier](self, "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICAttachment note](self, "note");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "identifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = 138412546;
      v65 = v12;
      v66 = 2112;
      v67 = v14;
      _os_log_impl(&dword_1BD918000, v11, OS_LOG_TYPE_DEFAULT, "Tried to push an attachment (%@) for a note (%@) that we don't know about. Manually fetching note.", (uint8_t *)&v64, 0x16u);

    }
    -[ICAttachment note](self, "note");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setNeedsToBeFetchedFromCloud:", 1);

  }
  else
  {
    -[ICAttachment note](self, "note");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "noteData");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "data");
    v18 = objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      v19 = (void *)v18;
      -[ICAttachment note](self, "note");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "creationDate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v21)
        goto LABEL_14;
    }
    else
    {

    }
    v22 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      -[ICAttachment identifier](self, "identifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICAttachment note](self, "note");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "identifier");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = 138412546;
      v65 = v23;
      v66 = 2112;
      v67 = v25;
      _os_log_impl(&dword_1BD918000, v22, OS_LOG_TYPE_DEFAULT, "Tried to push an attachment (%@) for a note (%@) that no longer exists. Deleting attachment.", (uint8_t *)&v64, 0x16u);

    }
    -[ICAttachment deleteFromLocalDatabase](self, "deleteFromLocalDatabase");
  }
LABEL_14:
  -[ICAttachment note](self, "note");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "markedForDeletion");

  if (v27)
  {
    v28 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      -[ICCloudSyncingObject shortLoggingDescription](self, "shortLoggingDescription");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = 138412290;
      v65 = v29;
      _os_log_impl(&dword_1BD918000, v28, OS_LOG_TYPE_DEFAULT, "Marking %@ for deletion because its note is deleted too", (uint8_t *)&v64, 0xCu);

    }
    -[ICAttachment markForDeletion](self, "markForDeletion");
    -[ICAttachment media](self, "media");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "markForDeletion");

  }
  if (-[ICCloudSyncingObject isInCloud](self, "isInCloud"))
  {
    -[ICAttachment note](self, "note");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "isInCloud");

    if ((v32 & 1) == 0)
    {
      v33 = os_log_create("com.apple.notes", "Cloud");
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        -[ICCloudSyncingObject shortLoggingDescription](self, "shortLoggingDescription");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICAttachment note](self, "note");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "shortLoggingDescription");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v64 = 138412546;
        v65 = v34;
        v66 = 2112;
        v67 = v36;
        _os_log_impl(&dword_1BD918000, v33, OS_LOG_TYPE_DEFAULT, "We think %@ is in the cloud, but its parent %@ isn't. That's not possible, so let's try to fetch it.", (uint8_t *)&v64, 0x16u);

      }
      -[ICCloudSyncingObject setNeedsToBeFetchedFromCloud:](self, "setNeedsToBeFetchedFromCloud:", 1);
    }
  }
  -[ICAttachment note](self, "note");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v37, "isInCloud");

  if ((v38 & 1) == 0)
  {
    v39 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      -[ICAttachment note](self, "note");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "identifier");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = 138412290;
      v65 = v41;
      _os_log_impl(&dword_1BD918000, v39, OS_LOG_TYPE_DEFAULT, "Tried to push an attachment for note: (%@) which isn't yet in iCloud", (uint8_t *)&v64, 0xCu);

    }
  }
  -[ICAttachment note](self, "note");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "updateChangeCountWithReason:", CFSTR("Fixed broken reference"));

  -[ICAttachment media](self, "media");
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  if (v43)
  {
    -[ICAttachment media](self, "media");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v44, "needsInitialFetchFromCloud") & 1) != 0)
    {
LABEL_31:

      goto LABEL_32;
    }
    -[ICAttachment media](self, "media");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v45, "needsToBeFetchedFromCloud"))
    {

      goto LABEL_31;
    }
    -[ICAttachment media](self, "media");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = objc_msgSend(v56, "hasFile");

    if ((v57 & 1) != 0)
    {
LABEL_32:
      -[ICAttachment media](self, "media");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "filename");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v47, "length"))
      {
        -[ICAttachment media](self, "media");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "identifier");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = objc_msgSend(v49, "length");

        if (!v50)
        {
LABEL_38:
          -[ICAttachment media](self, "media");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "updateChangeCountWithReason:", CFSTR("Fixed broken reference"));

          return;
        }
        v51 = os_log_create("com.apple.notes", "Cloud");
        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
        {
          -[ICAttachment media](self, "media");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "identifier");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          v64 = 138412290;
          v65 = v53;
          _os_log_impl(&dword_1BD918000, v51, OS_LOG_TYPE_DEFAULT, "Empty filename for media, falling back on identifier (%@)", (uint8_t *)&v64, 0xCu);

        }
        -[ICAttachment media](self, "media");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "identifier");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICAttachment media](self, "media");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "setFilename:", v47);

      }
      goto LABEL_38;
    }
    v58 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
    {
      -[ICAttachment media](self, "media");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "identifier");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICAttachment note](self, "note");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "identifier");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = 138412546;
      v65 = v60;
      v66 = 2112;
      v67 = v62;
      _os_log_impl(&dword_1BD918000, v58, OS_LOG_TYPE_DEFAULT, "Invalid media (%@) for a note (%@). Deleting media.", (uint8_t *)&v64, 0x16u);

    }
    -[ICAttachment media](self, "media");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "markForDeletion");

    -[ICAttachment setMedia:](self, "setMedia:", 0);
  }
}

- (BOOL)hasAllMandatoryFields
{
  unsigned int v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)ICAttachment;
  v3 = -[ICCloudSyncingObject hasAllMandatoryFields](&v10, sel_hasAllMandatoryFields);
  -[ICAttachment typeUTI](self, "typeUTI");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "length"))
    v3 = 0;

  -[ICAttachment note](self, "note");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v3 & objc_msgSend(v5, "hasAllMandatoryFields");

  -[ICAttachment media](self, "media");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[ICAttachment media](self, "media");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 &= objc_msgSend(v8, "hasAllMandatoryFields");

  }
  return v6;
}

- (BOOL)needsToBePushedToCloud
{
  unsigned int v3;
  ICAttachment *v4;
  ICAttachment *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ICAttachment;
  v3 = -[ICCloudSyncingObject needsToBePushedToCloud](&v7, sel_needsToBePushedToCloud);
  v4 = self;
  if (v4 && v3)
  {
    do
    {
      v5 = v4;
      v3 = -[ICAttachment isBeingEditedLocallyOnDevice](v4, "isBeingEditedLocallyOnDevice");
      -[ICAttachment parentAttachment](v4, "parentAttachment");
      v4 = (ICAttachment *)objc_claimAutoreleasedReturnValue();

    }
    while (v4 && !v3);
    LOBYTE(v3) = v3 ^ 1;
  }

  return v3;
}

- (void)deleteFromLocalDatabase
{
  +[ICAttachment purgeAttachment:](ICAttachment, "purgeAttachment:", self);
}

- (id)objectsToBeDeletedBeforeThisObject
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ICAttachment;
  -[ICCloudSyncingObject objectsToBeDeletedBeforeThisObject](&v9, sel_objectsToBeDeletedBeforeThisObject);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[ICAttachment subAttachments](self, "subAttachments");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v6);

  v7 = (void *)objc_msgSend(v4, "copy");
  return v7;
}

- (BOOL)supportsDeletionByTTL
{
  return 1;
}

- (void)updateParentReferenceIfNecessary
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ICAttachment;
  -[ICCloudSyncingObject updateParentReferenceIfNecessary](&v4, sel_updateParentReferenceIfNecessary);
  -[ICAttachment media](self, "media");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateParentReferenceIfNecessary");

}

- (void)objectWasFetchedFromCloudWithRecord:(id)a3 accountID:(id)a4 force:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  id v10;
  objc_super v11;

  v5 = a5;
  v11.receiver = self;
  v11.super_class = (Class)ICAttachment;
  v8 = a3;
  -[ICCloudSyncingObject objectWasFetchedFromCloudWithRecord:accountID:force:](&v11, sel_objectWasFetchedFromCloudWithRecord_accountID_force_, v8, a4, v5);
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("PreviewImages"), v11.receiver, v11.super_class);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 && objc_msgSend(v9, "count"))
    v10 = (id)-[ICAttachment ic_postNotificationOnMainThreadAfterSaveWithName:](self, "ic_postNotificationOnMainThreadAfterSaveWithName:", CFSTR("ICAttachmentPreviewImagesDidUpdateNotification"));

}

+ (void)addPreviewImages:(id)a3 toRecord:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  int v15;
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
  NSObject *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id obj;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint8_t buf[4];
  void *v50;
  __int16 v51;
  void *v52;
  uint8_t v53[4];
  uint64_t v54;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v35 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  obj = v5;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v55, 16);
  if (!v7)
  {
    v42 = 0;
    v9 = 0;
    goto LABEL_44;
  }
  v8 = v7;
  v42 = 0;
  v9 = 0;
  v10 = *(_QWORD *)v46;
  v36 = v6;
  do
  {
    v11 = 0;
    do
    {
      if (*(_QWORD *)v46 != v10)
        objc_enumerationMutation(obj);
      v12 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * v11);
      if ((objc_msgSend(v12, "isPasswordProtected") & 1) != 0)
      {
        objc_msgSend(v12, "encryptedPreviewImageURL");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v9)
        {
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v14 = objc_claimAutoreleasedReturnValue();

          v42 = (void *)v14;
        }
      }
      else
      {
        objc_msgSend(v12, "previewImageURL");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
      }
      if (objc_msgSend(v12, "shouldSyncToCloud"))
      {
        v44 = 0;
        v15 = objc_msgSend(v13, "checkResourceIsReachableAndReturnError:", &v44);
        v16 = v44;
        v17 = v16;
        if (v15)
        {
          +[ICCloudSyncingObject assetForURL:](ICCloudSyncingObject, "assetForURL:", v13);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (v18)
          {
            objc_msgSend(v6, "addObject:", v18);
            v19 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(v12, "width");
            objc_msgSend(v19, "numberWithDouble:");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "addObject:", v20);

            v21 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(v12, "height");
            objc_msgSend(v21, "numberWithDouble:");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "addObject:", v22);

            v23 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(v12, "scale");
            objc_msgSend(v23, "numberWithDouble:");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "addObject:", v24);

            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v12, "scaleWhenDrawing"));
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "addObject:", v25);

            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", objc_msgSend(v12, "appearanceType"));
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "addObject:", v26);

            if (objc_msgSend(v12, "isPasswordProtected"))
            {
              objc_msgSend(v12, "cryptoTag");
              v27 = (void *)objc_claimAutoreleasedReturnValue();

              if (v27)
              {
                objc_msgSend(v12, "cryptoTag");
                v28 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(v9, "addObject:", v28);
              }
              else
              {
                v28 = os_log_create("com.apple.notes", "Cloud");
                if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
                {
                  objc_msgSend(v12, "identifier");
                  v31 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412290;
                  v50 = v31;
                  _os_log_impl(&dword_1BD918000, v28, OS_LOG_TYPE_DEFAULT, "No cryptoTag for preview image %@", buf, 0xCu);

                }
              }

              objc_msgSend(v12, "cryptoInitializationVector");
              v32 = (void *)objc_claimAutoreleasedReturnValue();

              if (v32)
              {
                objc_msgSend(v12, "cryptoInitializationVector");
                v29 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(v42, "addObject:", v29);
              }
              else
              {
                v29 = os_log_create("com.apple.notes", "Cloud");
                if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
                {
                  objc_msgSend(v12, "identifier");
                  v33 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412290;
                  v50 = v33;
                  _os_log_impl(&dword_1BD918000, v29, OS_LOG_TYPE_DEFAULT, "No cryptoInitializationVector for preview image %@", buf, 0xCu);

                }
              }
              v6 = v36;
              goto LABEL_35;
            }
            v6 = v36;
          }
          else
          {
            v29 = os_log_create("com.apple.notes", "Cloud");
            if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
              +[ICAttachment(CloudKit) addPreviewImages:toRecord:].cold.1(v53, v12, &v54, v29);

LABEL_35:
          }

          goto LABEL_37;
        }
        if (v16 && objc_msgSend(v16, "code") != 260)
        {
          v29 = os_log_create("com.apple.notes", "Cloud");
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v12, "identifier");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v50 = v30;
            v51 = 2112;
            v52 = v17;
            _os_log_error_impl(&dword_1BD918000, v29, OS_LOG_TYPE_ERROR, "Error checking if preview image (%@) exists: %@", buf, 0x16u);
LABEL_40:

          }
        }
        else
        {
          v29 = os_log_create("com.apple.notes", "Cloud");
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v12, "identifier");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v50 = v30;
            v51 = 2112;
            v52 = v13;
            _os_log_debug_impl(&dword_1BD918000, v29, OS_LOG_TYPE_DEBUG, "Pushing an attachment with a preview image (%@) but nothing at the URL: %@", buf, 0x16u);
            goto LABEL_40;
          }
        }
        v18 = v29;
        goto LABEL_35;
      }
LABEL_37:

      ++v11;
    }
    while (v8 != v11);
    v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v55, 16);
    v8 = v34;
  }
  while (v34);
LABEL_44:

  objc_msgSend(v35, "setObject:forKeyedSubscript:", v6, CFSTR("PreviewImages"));
  objc_msgSend(v35, "setObject:forKeyedSubscript:", v41, CFSTR("PreviewWidths"));
  objc_msgSend(v35, "setObject:forKeyedSubscript:", v40, CFSTR("PreviewHeights"));
  objc_msgSend(v35, "setObject:forKeyedSubscript:", v39, CFSTR("PreviewScales"));
  objc_msgSend(v35, "setObject:forKeyedSubscript:", v38, CFSTR("PreviewScaleWhenDrawings"));
  objc_msgSend(v35, "setObject:forKeyedSubscript:", v37, CFSTR("PreviewAppearances"));
  if (v9)
    objc_msgSend(v35, "setObject:forKeyedSubscript:", v9, CFSTR("PreviewCryptoTags"));
  if (v42)
    objc_msgSend(v35, "setObject:forKeyedSubscript:", v42, CFSTR("PreviewCryptoInitializationVectors"));

}

- (void)updatePreviewsFromRecord:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  unint64_t v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  char v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  char v44;
  id v45;
  NSObject *v46;
  NSObject *v47;
  char v48;
  id v49;
  id v50;
  uint64_t v51;
  void *v52;
  void *v53;
  char v54;
  id v55;
  void *v56;
  void *v57;
  char v58;
  id v59;
  NSObject *v60;
  void *v61;
  void *v62;
  char v63;
  NSObject *v64;
  uint64_t v65;
  id v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t i;
  uint64_t v71;
  void *v72;
  id v73;
  id v74;
  __int128 v75;
  id v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  id v93;
  id v94;
  id v95;
  id v96;
  id v97;
  uint8_t v98[128];
  uint8_t buf[4];
  id v100;
  uint64_t v101;

  v101 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[ICAttachment previewImages](self, "previewImages");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  if (!-[ICAttachment preferLocalPreviewImages](self, "preferLocalPreviewImages") || !objc_msgSend(v6, "count"))
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PreviewUpdateDate"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PreviewUpdateDate"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICAttachment previewUpdateDate](self, "previewUpdateDate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "laterDate:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICAttachment setPreviewUpdateDate:](self, "setPreviewUpdateDate:", v10);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PreviewImages"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PreviewWidths"));
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PreviewHeights"));
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PreviewScales"));
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PreviewScaleWhenDrawings"));
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PreviewCryptoTags"));
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PreviewCryptoInitializationVectors"));
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    v76 = v4;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PreviewAppearances"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v83 = v11;
    v84 = v12;
    if (objc_msgSend(v11, "count"))
    {
      v14 = 0;
      *(_QWORD *)&v13 = 138412290;
      v75 = v13;
      v77 = v6;
      do
      {
        v15 = (void *)MEMORY[0x1C3B7AC74]();
        objc_msgSend(v88, "objectAtIndexedSubscript:", v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "doubleValue");
        v18 = v17;

        objc_msgSend(v87, "objectAtIndexedSubscript:", v14);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "doubleValue");
        v21 = v20;

        objc_msgSend(v86, "objectAtIndexedSubscript:", v14);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "doubleValue");
        v24 = v23;

        objc_msgSend(v85, "objectAtIndexedSubscript:", v14);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "BOOLValue");

        if (v12 && objc_msgSend(v12, "count") > v14)
        {
          objc_msgSend(v12, "objectAtIndexedSubscript:", v14);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = objc_msgSend(v27, "unsignedIntValue");

        }
        else
        {
          v28 = 0;
        }
        objc_msgSend(v11, "objectAtIndexedSubscript:", v14, v75);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "fileURL");
        v30 = objc_claimAutoreleasedReturnValue();
        if (!v30
          || (v31 = (void *)v30,
              objc_msgSend(v29, "fileURL"),
              v32 = (void *)objc_claimAutoreleasedReturnValue(),
              v33 = objc_msgSend(v32, "checkResourceIsReachableAndReturnError:", 0),
              v32,
              v11 = v83,
              v31,
              (v33 & 1) == 0))
        {
          -[ICAttachment identifier](self, "identifier");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          +[ICAttachmentPreviewImage identifierForContentIdentifier:scale:width:height:appearanceType:](ICAttachmentPreviewImage, "identifierForContentIdentifier:scale:width:height:appearanceType:", v42, v28, v24, v18, v21);
          v34 = (void *)objc_claimAutoreleasedReturnValue();

          -[ICAttachment managedObjectContext](self, "managedObjectContext");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          +[ICAttachmentPreviewImage attachmentPreviewImageWithIdentifier:inContext:](ICAttachmentPreviewImage, "attachmentPreviewImageWithIdentifier:inContext:", v34, v43);
          v41 = (void *)objc_claimAutoreleasedReturnValue();

          if (v41)
            objc_msgSend(v6, "removeObject:", v41);
          goto LABEL_24;
        }
        -[ICAttachment attachmentPreviewImageCreatingIfNecessaryWithWidth:height:scale:appearanceType:scaleWhenDrawing:metadata:](self, "attachmentPreviewImageCreatingIfNecessaryWithWidth:height:scale:appearanceType:scaleWhenDrawing:metadata:", v28, v26, 0, v18, v21, v24);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        if (v34)
          objc_msgSend(v6, "removeObject:", v34);
        if ((-[ICAttachment isPasswordProtected](self, "isPasswordProtected") & 1) != 0)
        {
          objc_msgSend(v34, "encryptedPreviewImageURL");
          v35 = objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v81, "count") > v14)
          {
            objc_msgSend(v81, "objectAtIndexedSubscript:", v14);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "setCryptoTag:", v36);

          }
          if (objc_msgSend(v80, "count") > v14)
          {
            objc_msgSend(v80, "objectAtIndexedSubscript:", v14);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "setCryptoInitializationVector:", v37);

          }
          objc_msgSend(v34, "setCryptoIterationCount:", -[ICAttachment cryptoIterationCount](self, "cryptoIterationCount"));
          -[ICAttachment cryptoSalt](self, "cryptoSalt");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "setCryptoSalt:", v38);

          -[ICAttachment cryptoWrappedKey](self, "cryptoWrappedKey");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "setCryptoWrappedKey:", v39);

          -[ICCloudSyncingObject passwordHint](self, "passwordHint");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "setPasswordHint:", v40);

          v41 = (void *)v35;
          if (!v34)
            goto LABEL_24;
        }
        else
        {
          objc_msgSend(v34, "previewImageURL");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v34)
            goto LABEL_24;
        }
        if (v41)
        {
          v82 = v41;
          v79 = v15;
          v97 = 0;
          v44 = objc_msgSend(v34, "makeSurePreviewImageDirectoryExists:", &v97);
          v45 = v97;
          if ((v44 & 1) == 0)
          {
            v46 = os_log_create("com.apple.notes", "Cloud");
            if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v75;
              v100 = v45;
              _os_log_error_impl(&dword_1BD918000, v46, OS_LOG_TYPE_ERROR, "Error creating preview image directory: %@", buf, 0xCu);
            }

          }
          objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
          v47 = objc_claimAutoreleasedReturnValue();
          v96 = 0;
          v48 = -[NSObject removeItemAtURL:error:](v47, "removeItemAtURL:error:", v82, &v96);
          v49 = v96;
          v50 = v49;
          if ((v48 & 1) != 0)
          {
LABEL_36:

          }
          else
          {
            v51 = objc_msgSend(v49, "code");

            if (v51 != 4)
            {
              v47 = os_log_create("com.apple.notes", "Cloud");
              if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = v75;
                v100 = v50;
                _os_log_error_impl(&dword_1BD918000, v47, OS_LOG_TYPE_ERROR, "Error removing old preview image URL: %@", buf, 0xCu);
              }
              goto LABEL_36;
            }
          }
          v78 = v50;
          objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "fileURL");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          v95 = 0;
          v54 = objc_msgSend(v52, "moveItemAtURL:toURL:error:", v53, v82, &v95);
          v55 = v95;

          if ((v54 & 1) != 0)
          {
            v6 = v77;
            v41 = v82;
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "fileURL");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            v94 = v55;
            v58 = objc_msgSend(v56, "linkItemAtURL:toURL:error:", v57, v82, &v94);
            v59 = v94;

            if ((v58 & 1) != 0)
            {
              v55 = v59;
              v6 = v77;
              v15 = v79;
            }
            else
            {
              v60 = os_log_create("com.apple.notes", "Cloud");
              if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = v75;
                v100 = v59;
                _os_log_impl(&dword_1BD918000, v60, OS_LOG_TYPE_DEFAULT, "Failed to move or link an attachment preview asset. Falling back to copy: %@", buf, 0xCu);
              }

              objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
              v61 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "fileURL");
              v62 = (void *)objc_claimAutoreleasedReturnValue();
              v93 = v59;
              v63 = objc_msgSend(v61, "copyItemAtURL:toURL:error:", v62, v82, &v93);
              v55 = v93;

              v15 = v79;
              if ((v63 & 1) == 0)
              {
                v64 = os_log_create("com.apple.notes", "Cloud");
                if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = v75;
                  v100 = v55;
                  _os_log_error_impl(&dword_1BD918000, v64, OS_LOG_TYPE_ERROR, "Error writing preview image from asset: %@", buf, 0xCu);
                }

              }
              v6 = v77;
            }
            v41 = v82;
          }
          objc_msgSend(v34, "invalidateCache");

          v11 = v83;
        }
LABEL_24:

        objc_autoreleasePoolPop(v15);
        ++v14;
        v12 = v84;
      }
      while (v14 < objc_msgSend(v11, "count"));
    }
    v65 = objc_msgSend(v6, "count");
    if (v65)
    {
      -[ICAttachment removePreviewImages:](self, "removePreviewImages:", v6);
      v91 = 0u;
      v92 = 0u;
      v89 = 0u;
      v90 = 0u;
      v66 = v6;
      v67 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v89, v98, 16);
      if (v67)
      {
        v68 = v67;
        v69 = *(_QWORD *)v90;
        do
        {
          for (i = 0; i != v68; ++i)
          {
            if (*(_QWORD *)v90 != v69)
              objc_enumerationMutation(v66);
            v71 = *(_QWORD *)(*((_QWORD *)&v89 + 1) + 8 * i);
            -[ICAttachment managedObjectContext](self, "managedObjectContext");
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v72, "deleteObject:", v71);

          }
          v68 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v89, v98, 16);
        }
        while (v68);
      }

      v11 = v83;
      v12 = v84;
      if (-[ICAttachment ic_obtainPermanentObjectIDIfNecessary](self, "ic_obtainPermanentObjectIDIfNecessary"))v73 = (id)-[ICAttachment ic_postNotificationOnMainThreadAfterSaveWithName:](self, "ic_postNotificationOnMainThreadAfterSaveWithName:", CFSTR("ICAttachmentNeedsPreviewGenerationNotification"));
    }
    if (objc_msgSend(v11, "count") | v65)
      v74 = (id)-[ICAttachment ic_postNotificationOnMainThreadAfterSaveWithName:](self, "ic_postNotificationOnMainThreadAfterSaveWithName:", CFSTR("ICAttachmentPreviewImagesDidUpdateNotification"));

    v4 = v76;
  }

}

- (BOOL)processFallbackAsset:(id)a3 fallbackAssetType:(int64_t)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  char v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  char v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  os_log_t v22;
  NSObject *v23;
  void *v24;
  void *v25;
  char v26;
  NSObject *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  char v31;
  NSObject *v32;
  NSObject *v34;
  NSObject *v35;
  os_log_t v36;
  id v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  const char *v43;
  __int16 v44;
  int v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    -[ICCloudSyncingObject shortLoggingDescription](self, "shortLoggingDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromFallbackAssetType(a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v39 = v8;
    v40 = 2112;
    v42 = 2080;
    v41 = v9;
    v43 = "-[ICAttachment(CloudKit) processFallbackAsset:fallbackAssetType:]";
    v44 = 1024;
    v45 = 1167;
    _os_log_impl(&dword_1BD918000, v7, OS_LOG_TYPE_DEFAULT, "Processing fallback asset… {attachment: %@, type: %@}%s:%d", buf, 0x26u);

  }
  objc_msgSend(v6, "fileURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "ic_isReachable");

  if ((v11 & 1) != 0)
  {
    if (a4 == 1)
    {
      -[ICAttachment(Management) fallbackPDFGenerationManager](self, "fallbackPDFGenerationManager");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v18, "beginGeneration");

      -[ICAttachment(Management) fallbackPDFGenerationManager](self, "fallbackPDFGenerationManager");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if ((-[ICAttachment isPasswordProtected](self, "isPasswordProtected") & 1) != 0)
        -[ICAttachment fallbackPDFEncryptedURL](self, "fallbackPDFEncryptedURL");
      else
        -[ICAttachment fallbackPDFURL](self, "fallbackPDFURL");
    }
    else
    {
      if (a4)
      {
        v14 = 0;
        v16 = 0;
        goto LABEL_23;
      }
      -[ICAttachment(Management) fallbackImageGenerationManager](self, "fallbackImageGenerationManager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "beginGeneration");

      -[ICAttachment(Management) fallbackImageGenerationManager](self, "fallbackImageGenerationManager");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[ICAttachment isPasswordProtected](self, "isPasswordProtected"))
        -[ICAttachment fallbackImageEncryptedURL](self, "fallbackImageEncryptedURL");
      else
        -[ICAttachment fallbackImageURL](self, "fallbackImageURL");
    }
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if ((v13 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "fileURL");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = 0;
      v21 = objc_msgSend(v19, "moveItemAtURL:toURL:error:", v20, v16, &v37);
      v22 = (os_log_t)v37;

      if ((v21 & 1) != 0)
      {
LABEL_30:
        v32 = os_log_create("com.apple.notes", "Cloud");
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
          -[ICAttachment(CloudKit) processFallbackAsset:fallbackAssetType:].cold.2(self, v32);

        v17 = objc_msgSend(v14, "commitGeneration");
        goto LABEL_33;
      }
      v23 = os_log_create("com.apple.notes", "Cloud");
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        -[ICAttachment(CloudKit) processFallbackAsset:fallbackAssetType:].cold.5();

      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "fileURL");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = v22;
      v26 = objc_msgSend(v24, "linkItemAtURL:toURL:error:", v25, v16, &v36);
      v27 = v36;

      if ((v26 & 1) != 0)
      {
        v22 = v27;
        goto LABEL_30;
      }
      v28 = os_log_create("com.apple.notes", "Cloud");
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        -[ICAttachment(CloudKit) processFallbackAsset:fallbackAssetType:].cold.4();

      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "fileURL");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = v27;
      v31 = objc_msgSend(v29, "copyItemAtURL:toURL:error:", v30, v16, &v35);
      v22 = v35;

      if ((v31 & 1) != 0)
        goto LABEL_30;
      v34 = os_log_create("com.apple.notes", "Cloud");
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        -[ICAttachment(CloudKit) processFallbackAsset:fallbackAssetType:].cold.3();

      objc_msgSend(v14, "rollbackGeneration");
LABEL_26:
      v17 = 0;
LABEL_33:

      goto LABEL_34;
    }
LABEL_23:
    v22 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      -[ICAttachment(CloudKit) processFallbackAsset:fallbackAssetType:].cold.1(self);

    goto LABEL_26;
  }
  v16 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    -[ICAttachment(CloudKit) processFallbackAsset:fallbackAssetType:].cold.6(self);
  v17 = 0;
  v14 = v16;
LABEL_34:

  return v17;
}

- (void)mergeFallbackImageAndPDFFromRecord:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("FallbackImage"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    -[ICAttachment processFallbackAsset:fallbackAssetType:](self, "processFallbackAsset:fallbackAssetType:", v4, 0);
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("FallbackPDF"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    -[ICAttachment processFallbackAsset:fallbackAssetType:](self, "processFallbackAsset:fallbackAssetType:", v5, 1);
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("FallbackImageCryptoTag"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAttachment setFallbackImageCryptoTag:](self, "setFallbackImageCryptoTag:", v6);

  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("FallbackImageCryptoInitializationVector"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAttachment setFallbackImageCryptoInitializationVector:](self, "setFallbackImageCryptoInitializationVector:", v7);

  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("FallbackPDFCryptoTag"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAttachment setFallbackPDFCryptoTag:](self, "setFallbackPDFCryptoTag:", v8);

  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("FallbackPDFCryptoInitializationVector"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAttachment setFallbackPDFCryptoInitializationVector:](self, "setFallbackPDFCryptoInitializationVector:", v9);

  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("FallbackTitle"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    -[ICAttachment setFallbackTitle:](self, "setFallbackTitle:", v10);
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("FallbackSubtitleIOS"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    -[ICAttachment setFallbackSubtitleIOS:](self, "setFallbackSubtitleIOS:", v11);
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("FallbackSubtitleMac"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    -[ICAttachment setFallbackSubtitleMac:](self, "setFallbackSubtitleMac:", v12);

}

- (void)addPaperBundleToRecordIfAppropriate:(id)a3
{
  void *v4;
  void *v5;
  _TtC11NotesShared21ICSystemPaperDocument *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  objc_opt_class();
  -[ICAttachment attachmentModel](self, "attachmentModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = -[ICSystemPaperDocument initWithPaperAttachment:]([_TtC11NotesShared21ICSystemPaperDocument alloc], "initWithPaperAttachment:", self);
    -[ICSystemPaperDocument archiveBundleForSyncAndReturnError:](v6, "archiveBundleForSyncAndReturnError:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "databaseArchive");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[ICCloudSyncingObject assetForTemporaryURL:](ICCloudSyncingObject, "assetForTemporaryURL:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v9, CFSTR("PaperDatabase"));
    objc_msgSend(v7, "assetArchives");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "ic_compactMap:", &__block_literal_global_58);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, CFSTR("PaperAssets"));

  }
}

id __62__ICAttachment_CloudKit__addPaperBundleToRecordIfAppropriate___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[ICCloudSyncingObject assetForTemporaryURL:](ICCloudSyncingObject, "assetForTemporaryURL:", a2);
}

- (void)mergePaperBundleFromRecord:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _TtC11NotesShared21ICSystemPaperDocument *v11;
  void *v12;
  void *v13;
  int v14;
  ICSystemPaperSyncArchive *v15;
  _BOOL4 v16;
  id v17;
  os_log_t v18;
  id v19;

  v4 = a3;
  objc_opt_class();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PaperDatabase"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fileURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PaperAssets"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  ICDynamicCast();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "ic_compactMap:", &__block_literal_global_195);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[ICSystemPaperDocument initWithPaperAttachment:]([_TtC11NotesShared21ICSystemPaperDocument alloc], "initWithPaperAttachment:", self);
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "path");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "fileExistsAtPath:", v13);

    if (v14)
    {
      v15 = -[ICSystemPaperSyncArchive initWithDatabaseArchive:assetArchives:]([ICSystemPaperSyncArchive alloc], "initWithDatabaseArchive:assetArchives:", v7, v10);
      v19 = 0;
      v16 = -[ICSystemPaperDocument writeNewVersionFromSyncArchive:error:](v11, "writeNewVersionFromSyncArchive:error:", v15, &v19);
      v17 = v19;
      if (v16)
      {
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v18 = (os_log_t)objc_claimAutoreleasedReturnValue();
        -[NSObject postNotificationName:object:](v18, "postNotificationName:object:", CFSTR("ICAttachmentDidMergePaperKitBundleNotification"), self);
      }
      else
      {
        v18 = os_log_create("com.apple.notes", "SystemPaper");
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          -[ICAttachment(CloudKit) mergePaperBundleFromRecord:].cold.1();

      }
    }
  }

}

id __53__ICAttachment_CloudKit__mergePaperBundleFromRecord___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;

  v2 = a2;
  objc_opt_class();
  ICDynamicCast();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "fileURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (int64_t)visibilityTestingType
{
  return 1;
}

- (unint64_t)searchResultsSection
{
  return 2;
}

- (unint64_t)searchResultType
{
  return 1;
}

- (NSArray)authorsExcludingCurrentUser
{
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (BOOL)searchResultCanBeDeletedFromNoteContext
{
  return 0;
}

- (BOOL)isHiddenFromIndexing
{
  BOOL v3;
  void *v4;
  void *v6;
  void *v7;

  if ((-[ICAttachment isDeleted](self, "isDeleted") & 1) != 0)
    return 1;
  -[ICAttachment note](self, "note");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4
    || (-[ICAttachment markedForDeletion](self, "markedForDeletion") & 1) != 0
    || (-[ICAttachment needsInitialFetchFromCloud](self, "needsInitialFetchFromCloud") & 1) != 0)
  {
    v3 = 1;
  }
  else
  {
    -[ICAttachment note](self, "note");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "isHiddenFromSearch") & 1) != 0
      || (-[ICAttachment isPasswordProtected](self, "isPasswordProtected") & 1) != 0
      || -[ICAttachment isChildOfDocumentGallery](self, "isChildOfDocumentGallery")
      || -[ICAttachment attachmentType](self, "attachmentType") == 9
      || -[ICAttachment attachmentType](self, "attachmentType") == 10
      || -[ICAttachment attachmentType](self, "attachmentType") == 13)
    {
      v3 = 1;
    }
    else if (-[ICAttachment attachmentType](self, "attachmentType") == 4)
    {
      -[ICAttachment parentAttachment](self, "parentAttachment");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
        v3 = 1;
      else
        v3 = -[ICAttachment isUnsupported](self, "isUnsupported");

    }
    else
    {
      v3 = -[ICAttachment isUnsupported](self, "isUnsupported");
    }

  }
  return v3;
}

- (BOOL)isHiddenFromSearch
{
  return -[ICAttachment isHiddenFromIndexing](self, "isHiddenFromIndexing") || -[ICAttachment isTable](self, "isTable");
}

- (BOOL)isVisibleTable
{
  _BOOL4 v3;
  void *v4;
  void *v6;

  if ((-[ICAttachment isDeleted](self, "isDeleted") & 1) != 0)
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    -[ICAttachment note](self, "note");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4
      || (-[ICAttachment markedForDeletion](self, "markedForDeletion") & 1) != 0
      || (-[ICAttachment needsInitialFetchFromCloud](self, "needsInitialFetchFromCloud") & 1) != 0)
    {
      LOBYTE(v3) = 0;
    }
    else
    {
      -[ICAttachment note](self, "note");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v6, "isHiddenFromSearch") & 1) != 0 || !-[ICAttachment isTable](self, "isTable"))
        LOBYTE(v3) = 0;
      else
        v3 = !-[ICAttachment isUnsupported](self, "isUnsupported");

    }
  }
  return v3;
}

- (BOOL)isMovable
{
  return 0;
}

- (NSString)dataSourceIdentifier
{
  return (NSString *)CFSTR("Modern");
}

- (NSString)searchIndexingIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  -[ICAttachment objectID](self, "objectID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URIRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "absoluteString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (NSString)searchDomainIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  -[ICAttachment note](self, "note");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (CSSearchableItemAttributeSet)userActivityContentAttributeSet
{
  void *v3;
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[ICAttachment typeUTI](self, "typeUTI");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (__CFString *)objc_msgSend(v3, "copy");

  if (!v4 || !-[__CFString length](v4, "length"))
  {

    v4 = CFSTR("com.apple.notes.spotlightrecord");
  }
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6B50]), "initWithItemContentType:", v4);
  -[ICCloudSyncingObject modificationDate](self, "modificationDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setContentModificationDate:", v6);

  -[ICCloudSyncingObject creationDate](self, "creationDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setContentCreationDate:", v7);

  -[ICCloudSyncingObject creationDate](self, "creationDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAddedDate:", v8);

  return (CSSearchableItemAttributeSet *)v5;
}

- (CSSearchableItemAttributeSet)searchableItemAttributeSet
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
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
  uint64_t v24;
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
  _QWORD v37[2];

  v37[1] = *MEMORY[0x1E0C80C00];
  -[ICAttachment userActivityContentAttributeSet](self, "userActivityContentAttributeSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAttachment title](self, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "length"))
  {
    -[ICAttachment media](self, "media");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "filename");
    v6 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v6;
  }
  objc_msgSend(v3, "setDisplayName:", v4);
  -[ICAttachment summary](self, "summary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");

  if (v8)
  {
    -[ICAttachment summary](self, "summary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setContentDescription:", v9);

  }
  -[ICAttachment searchableTextContentWithoutTitle](self, "searchableTextContentWithoutTitle");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v4)
  {
    objc_msgSend(v4, "stringByAppendingFormat:", CFSTR(" %@"), v10);
    v12 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)v12;
  }
  objc_msgSend(v3, "setTextContent:", v11);
  objc_msgSend(v3, "setIc_searchResultType:", 1);
  -[ICAttachment typeUTI](self, "typeUTI");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14 = (void *)MEMORY[0x1E0CEC3F8];
    -[ICAttachment typeUTI](self, "typeUTI");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "typeWithIdentifier:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "supertypes");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "ic_map:", &__block_literal_global_61);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    -[ICAttachment typeUTI](self, "typeUTI");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = v19;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "allObjects");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "arrayByAddingObjectsFromArray:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[ICAttachment attachmentType](self, "attachmentType") == 14)
    {
      objc_msgSend((id)*MEMORY[0x1E0CEC570], "identifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "arrayByAddingObject:", v23);
      v24 = objc_claimAutoreleasedReturnValue();

      v22 = (void *)v24;
    }
    objc_msgSend(v3, "setAttachmentTypes:", v22);

  }
  objc_msgSend(v3, "ic_populateValuesForSpecializedFields");
  -[ICAttachment attachmentModel](self, "attachmentModel");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "providerFileTypes");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setProviderFileTypes:", v26);

  -[ICAttachment attachmentModel](self, "attachmentModel");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "providerDataTypes");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setProviderDataTypes:", v28);

  objc_msgSend(v3, "setDataOwnerType:", &unk_1E771A708);
  if (-[ICCloudSyncingObject isSharedViaICloud](self, "isSharedViaICloud")
    && (-[ICAttachment attachmentType](self, "attachmentType") == 7
     || -[ICAttachment attachmentType](self, "attachmentType") == 8))
  {
    -[ICCloudSyncingObject addEmailAddressesAndPhoneNumbersToAttributeSet:](self, "addEmailAddressesAndPhoneNumbersToAttributeSet:", v3);
  }
  -[ICAttachment note](self, "note");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "objectID");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "URIRepresentation");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "absoluteString");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIc_relatedModernNoteUniqueIdentifier:", v32);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ICAttachment supportsPhotosProcessing](self, "supportsPhotosProcessing"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEligibleForPhotosProcessing:", v33);

  -[ICAttachment urlString](self, "urlString");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (v34)
  {
    -[ICAttachment urlString](self, "urlString");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "ic_setURLString:", v35);

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[ICAttachment associateAppEntityWithSearchableItemAttributeSet:](self, "associateAppEntityWithSearchableItemAttributeSet:", v3);

  return (CSSearchableItemAttributeSet *)v3;
}

uint64_t __59__ICAttachment_SearchIndexable__searchableItemAttributeSet__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

- (id)searchableTextContent
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAttachment title](self, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v3, "addObject:", v4);
  -[ICAttachment searchableTextContentWithoutTitle](self, "searchableTextContentWithoutTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v5);

  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(" "));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)searchableTextContentWithoutTitle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAttachment urlString](self, "urlString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && !-[ICAttachment isMap](self, "isMap"))
    objc_msgSend(v3, "addObject:", v4);
  -[ICAttachment summary](self, "summary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v3, "addObject:", v5);
  -[ICAttachment attachmentModel](self, "attachmentModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "searchableTextContent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "length"))
    objc_msgSend(v3, "addObject:", v7);
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(" "));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)supportsPhotosProcessing
{
  return -[ICAttachment attachmentType](self, "attachmentType") == 3
      || -[ICAttachment attachmentType](self, "attachmentType") == 5;
}

- (id)dataForTypeIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  _QWORD v16[5];
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v4 = a3;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__50;
  v23 = __Block_byref_object_dispose__50;
  v24 = 0;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.notes.noteitemprovider")))
  {
    v5 = os_log_create("com.apple.notes", "SearchIndexer");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[ICAttachment(SearchIndexable) dataForTypeIdentifier:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);

  }
  else
  {
    -[ICAttachment managedObjectContext](self, "managedObjectContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __55__ICAttachment_SearchIndexable__dataForTypeIdentifier___block_invoke;
    v16[3] = &unk_1E76C8358;
    v18 = &v19;
    v16[4] = self;
    v17 = v4;
    objc_msgSend(v13, "performBlockAndWait:", v16);

  }
  v14 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v14;
}

void __55__ICAttachment_SearchIndexable__dataForTypeIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "attachmentModel");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dataForTypeIdentifier:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)fileURLForTypeIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  _QWORD v16[5];
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v4 = a3;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__50;
  v23 = __Block_byref_object_dispose__50;
  v24 = 0;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.notes.noteitemprovider")))
  {
    v5 = os_log_create("com.apple.notes", "SearchIndexer");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[ICAttachment(SearchIndexable) dataForTypeIdentifier:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);

  }
  else
  {
    -[ICAttachment managedObjectContext](self, "managedObjectContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __58__ICAttachment_SearchIndexable__fileURLForTypeIdentifier___block_invoke;
    v16[3] = &unk_1E76C8358;
    v18 = &v19;
    v16[4] = self;
    v17 = v4;
    objc_msgSend(v13, "performBlockAndWait:", v16);

  }
  v14 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v14;
}

void __58__ICAttachment_SearchIndexable__fileURLForTypeIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "attachmentModel");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fileURLForTypeIdentifier:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

+ (id)attachmentSectionSortOrder
{
  if (attachmentSectionSortOrder_onceToken != -1)
    dispatch_once(&attachmentSectionSortOrder_onceToken, &__block_literal_global_125);
  return (id)attachmentSectionSortOrder_sSortOrderSet;
}

uint64_t __42__ICAttachment_attachmentSectionSortOrder__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E10]);
  v1 = (void *)attachmentSectionSortOrder_sSortOrderSet;
  attachmentSectionSortOrder_sSortOrderSet = (uint64_t)v0;

  objc_msgSend((id)attachmentSectionSortOrder_sSortOrderSet, "addObject:", &unk_1E771A720);
  objc_msgSend((id)attachmentSectionSortOrder_sSortOrderSet, "addObject:", &unk_1E771A738);
  objc_msgSend((id)attachmentSectionSortOrder_sSortOrderSet, "addObject:", &unk_1E771A750);
  objc_msgSend((id)attachmentSectionSortOrder_sSortOrderSet, "addObject:", &unk_1E771A768);
  objc_msgSend((id)attachmentSectionSortOrder_sSortOrderSet, "addObject:", &unk_1E771A780);
  objc_msgSend((id)attachmentSectionSortOrder_sSortOrderSet, "addObject:", &unk_1E771A798);
  return objc_msgSend((id)attachmentSectionSortOrder_sSortOrderSet, "addObject:", &unk_1E771A7B0);
}

- (void)suppressFileDeletion
{
  -[ICAttachment setSuppressesFileDeletion:](self, "setSuppressesFileDeletion:", 1);
}

- (void)prepareForDeletion
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  BOOL v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)ICAttachment;
  -[ICAttachment prepareForDeletion](&v11, sel_prepareForDeletion);
  -[ICAttachment identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[ICAttachment note](self, "note");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "account");
    v5 = objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
LABEL_5:

      goto LABEL_6;
    }
    v6 = (void *)v5;
    v7 = -[ICAttachment suppressesFileDeletion](self, "suppressesFileDeletion");

    if (!v7)
    {
      v8 = (void *)objc_opt_class();
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICAttachment note](self, "note");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "account");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "purgeAttachmentFilesForIdentifiers:account:", v4, v10);

      goto LABEL_5;
    }
  }
LABEL_6:

}

- (int64_t)intrinsicNotesVersionForScenario:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  int64_t v10;
  int64_t result;
  void *v12;
  int v13;
  void *v14;
  char v15;
  void *v16;
  int v17;
  void *v18;
  char v19;
  void *v20;
  char v21;
  uint64_t v22;
  void *v23;
  void *v24;
  BOOL v25;
  void *v26;
  char v27;
  void *v28;
  char v29;
  void *v30;
  char v31;
  void *v32;
  char v33;
  void *v34;
  char v35;
  void *v36;
  char v37;
  void *v38;
  int v39;
  void *v40;
  int v41;
  objc_super v42;

  if (-[ICAttachment isUnsupported](self, "isUnsupported"))
    return -[ICAttachment minimumSupportedNotesVersion](self, "minimumSupportedNotesVersion");
  if (-[ICCloudSyncingObject needsInitialFetchFromCloudCheckingParent](self, "needsInitialFetchFromCloudCheckingParent"))
  {
    return -[ICAttachment minimumSupportedNotesVersion](self, "minimumSupportedNotesVersion");
  }
  -[ICAttachment typeUTI](self, "typeUTI");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    return -[ICAttachment minimumSupportedNotesVersion](self, "minimumSupportedNotesVersion");
  -[ICAttachment typeUTI](self, "typeUTI");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.paper.doc")) & 1) != 0)
    goto LABEL_7;
  -[ICAttachment typeUTI](self, "typeUTI");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.paper.doc.pdf")))
  {

LABEL_7:
    goto LABEL_8;
  }
  -[ICAttachment typeUTI](self, "typeUTI");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("com.apple.paper.doc.scan"));

  if ((v15 & 1) == 0)
  {
    -[ICAttachment typeUTI](self, "typeUTI");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("com.apple.paper"));

    if (v17)
    {
      -[ICAttachment paperBundleModel](self, "paperBundleModel");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "paperHasMath");

      if ((v19 & 1) == 0)
      {
        -[ICAttachment systemPaperModel](self, "systemPaperModel");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "paperHasNewInksSpring2024");

        if ((v21 & 1) != 0)
        {
          v10 = 14;
        }
        else
        {
          -[ICAttachment systemPaperModel](self, "systemPaperModel");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = objc_msgSend(v28, "paperHasNewInks2023");

          if ((v29 & 1) != 0)
          {
            v10 = 13;
          }
          else
          {
            -[ICAttachment account](self, "account");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = objc_msgSend(v32, "isDataSeparated");

            if ((v33 & 1) != 0
              || (-[ICAttachment systemPaperModel](self, "systemPaperModel"),
                  v34 = (void *)objc_claimAutoreleasedReturnValue(),
                  v35 = objc_msgSend(v34, "paperHasNewInks2022"),
                  v34,
                  (v35 & 1) != 0))
            {
              v10 = 10;
            }
            else
            {
              -[ICAttachment systemPaperModel](self, "systemPaperModel");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              v41 = objc_msgSend(v40, "paperHasEnhancedCanvas");

              if (v41)
                v10 = 9;
              else
                v10 = 7;
            }
          }
        }
        goto LABEL_14;
      }
    }
    else
    {
      -[ICAttachment parentAttachment](self, "parentAttachment");
      v22 = objc_claimAutoreleasedReturnValue();
      if (!v22
        || (v23 = (void *)v22,
            -[ICAttachment typeUTI](self, "typeUTI"),
            v24 = (void *)objc_claimAutoreleasedReturnValue(),
            v25 = +[ICAttachment typeUTIIsPlayableAudio:](ICAttachment, "typeUTIIsPlayableAudio:", v24),
            v24,
            v23,
            !v25))
      {
        if (-[ICAttachment hasVisibleInlineAttachments](self, "hasVisibleInlineAttachments"))
        {
          v10 = 6;
        }
        else
        {
          -[ICAttachment typeUTI](self, "typeUTI");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(v26, "isEqualToString:", CFSTR("com.apple.drawing.2"));

          if ((v27 & 1) != 0)
          {
            v10 = 4;
          }
          else
          {
            -[ICAttachment typeUTI](self, "typeUTI");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = objc_msgSend(v30, "isEqualToString:", CFSTR("com.apple.drawing"));

            if ((v31 & 1) != 0)
            {
              v10 = 3;
            }
            else
            {
              -[ICAttachment typeUTI](self, "typeUTI");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              v37 = objc_msgSend(v36, "isEqualToString:", CFSTR("com.apple.notes.table"));

              if ((v37 & 1) != 0)
              {
                v10 = 2;
              }
              else
              {
                -[ICAttachment typeUTI](self, "typeUTI");
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                v39 = objc_msgSend(v38, "isEqualToString:", CFSTR("com.apple.notes.gallery"));

                if (v39)
                  v10 = 2;
                else
                  v10 = 0;
              }
            }
          }
        }
        goto LABEL_14;
      }
    }
    goto LABEL_9;
  }
LABEL_8:
  -[ICAttachment paperBundleModel](self, "paperBundleModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "paperHasMath");

  if ((v9 & 1) == 0)
  {
    -[ICAttachment paperBundleModel](self, "paperBundleModel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "paperHasNewInksSpring2024");

    if (v13)
      v10 = 14;
    else
      v10 = 13;
    goto LABEL_14;
  }
LABEL_9:
  v10 = 15;
LABEL_14:
  v42.receiver = self;
  v42.super_class = (Class)ICAttachment;
  result = -[ICCloudSyncingObject intrinsicNotesVersionForScenario:](&v42, sel_intrinsicNotesVersionForScenario_, a3);
  if (v10 > result)
    return v10;
  return result;
}

- (BOOL)shouldSyncMinimumSupportedNotesVersion
{
  return 1;
}

+ (BOOL)supportsNotesVersionTracking
{
  return 1;
}

- (void)willUpdateDeviceReplicaIDsToNotesVersion:(int64_t)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (a3 == 6)
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    -[ICCloudSyncingObject deviceReplicaIDs](self, "deviceReplicaIDs", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v10;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v10 != v7)
            objc_enumerationMutation(v4);
          -[ICAttachmentModel removeTimestampsForReplicaID:](self->_attachmentModel, "removeTimestampsForReplicaID:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v6);
    }

  }
}

+ (id)attachmentIdentifiersForAccount:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v13;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v4 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", CFSTR("ICAttachment"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("note.account == %@"), v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPredicate:", v7);

  objc_msgSend(v6, "setResultType:", 2);
  objc_msgSend(v6, "setPropertiesToFetch:", &unk_1E771AC38);
  v13 = 0;
  objc_msgSend(v5, "executeFetchRequest:error:", v6, &v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v13;
  if (v9)
  {
    v10 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      +[ICAttachment attachmentIdentifiersForAccount:].cold.1();
    v11 = v10;
    goto LABEL_7;
  }
  objc_msgSend(v8, "valueForKey:", CFSTR("identifier"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v11);
    v10 = v4;
    v4 = objc_claimAutoreleasedReturnValue();
LABEL_7:

  }
  return v4;
}

+ (void)purgeAttachmentFilesForIdentifiers:(id)a3 account:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  void *v27;
  NSObject *v28;
  id obj;
  id v30;
  uint64_t v31;
  id v32;
  uint64_t v34;
  void *v35;
  void *context;
  uint64_t v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t v47[128];
  uint8_t buf[4];
  void *v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v30 = objc_alloc_init(MEMORY[0x1E0CB3600]);
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  obj = v5;
  v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v50, 16);
  if (v34)
  {
    v31 = *(_QWORD *)v44;
    v32 = v6;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v44 != v31)
          objc_enumerationMutation(obj);
        v37 = v8;
        v9 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * v8);
        context = (void *)MEMORY[0x1C3B7AC74]();
        +[ICAttachmentPaperBundleModel paperBundleURLForAttachmentIdentifier:inAccount:](ICAttachmentPaperBundleModel, "paperBundleURLForAttachmentIdentifier:inAccount:", v9, v6);
        v10 = objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          +[ICFileUtilities coordinateDeleteItemAt:coordinator:](ICFileUtilities, "coordinateDeleteItemAt:coordinator:", v10, v30);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11)
          {
            v12 = os_log_create("com.apple.notes", "CoreData");
            if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v49 = v11;
              _os_log_error_impl(&dword_1BD918000, v12, OS_LOG_TYPE_ERROR, "Error removing paper bundle file: %@", buf, 0xCu);
            }

          }
        }
        v35 = (void *)v10;
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "fallbackImageFallbackURLForIdentifier:account:", v9, v6);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "ic_addNonNilObject:", v14);

        objc_msgSend(a1, "fallbackImageEncryptedFallbackURLForIdentifier:account:", v9, v6);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "ic_addNonNilObject:", v15);

        objc_msgSend(a1, "fallbackImageContainerURLForIdentifier:account:", v9, v6);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "ic_addNonNilObject:", v16);

        objc_msgSend(a1, "fallbackPDFFallbackURLForIdentifier:account:", v9, v6);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "ic_addNonNilObject:", v17);

        objc_msgSend(a1, "fallbackPDFEncryptedFallbackURLForIdentifier:account:", v9, v6);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "ic_addNonNilObject:", v18);

        objc_msgSend(a1, "fallbackPDFContainerURLForIdentifier:account:", v9, v6);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "ic_addNonNilObject:", v19);

        v41 = 0u;
        v42 = 0u;
        v39 = 0u;
        v40 = 0u;
        v20 = (void *)objc_msgSend(v13, "copy");
        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
        if (v21)
        {
          v22 = v21;
          v23 = *(_QWORD *)v40;
          do
          {
            v24 = 0;
            do
            {
              if (*(_QWORD *)v40 != v23)
                objc_enumerationMutation(v20);
              v25 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * v24);
              v38 = 0;
              objc_msgSend(v7, "removeItemAtURL:error:", v25, &v38);
              v26 = v38;
              v27 = v26;
              if (v26 && objc_msgSend(v26, "code") != 4)
              {
                v28 = os_log_create("com.apple.notes", "CoreData");
                if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  v49 = v27;
                  _os_log_error_impl(&dword_1BD918000, v28, OS_LOG_TYPE_ERROR, "Error removing attachment file: %@", buf, 0xCu);
                }

              }
              ++v24;
            }
            while (v22 != v24);
            v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
          }
          while (v22);
        }

        objc_autoreleasePoolPop(context);
        v8 = v37 + 1;
        v6 = v32;
      }
      while (v37 + 1 != v34);
      v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v50, 16);
    }
    while (v34);
  }

}

- (NSURL)URL
{
  NSURL *URL;
  NSURL *v3;
  uint64_t v5;
  void *v6;

  URL = self->_URL;
  if (!URL)
  {
    -[ICAttachment urlString](self, "urlString");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v5);
      v3 = (NSURL *)objc_claimAutoreleasedReturnValue();

      return v3;
    }
    URL = self->_URL;
  }
  v3 = URL;
  return v3;
}

- (BOOL)hasDeepLink
{
  void *v3;
  char v4;
  void *v5;

  -[ICAttachment synapseData](self, "synapseData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = 1;
  }
  else
  {
    -[ICAttachment attachmentModel](self, "attachmentModel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "hasDeepLink");

  }
  return v4;
}

- (BOOL)isReadOnly
{
  void *v3;
  BOOL v4;

  -[ICAttachment note](self, "note");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_msgSend(v3, "isSharedReadOnly") & 1) != 0
    || -[ICCloudSyncingObject isSharedReadOnly](self, "isSharedReadOnly");

  return v4;
}

- (BOOL)isAudio
{
  return -[ICAttachment attachmentType](self, "attachmentType") == 4;
}

- (BOOL)isFolder
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  -[ICAttachment typeUTI](self, "typeUTI");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CEC3F8];
    -[ICAttachment typeUTI](self, "typeUTI");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "typeWithIdentifier:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "conformsToType:", *MEMORY[0x1E0CEC4F0]);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)isURL
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  -[ICAttachment typeUTI](self, "typeUTI");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CEC3F8];
    -[ICAttachment typeUTI](self, "typeUTI");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "typeWithIdentifier:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "conformsToType:", *MEMORY[0x1E0CEC618]);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)isMap
{
  _BOOL4 v3;
  void *v4;
  char v5;

  v3 = -[ICAttachment isURL](self, "isURL");
  if (v3)
  {
    -[ICAttachment URL](self, "URL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "ic_isMapURL");

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (BOOL)isiTunes
{
  _BOOL4 v3;
  void *v4;
  char v5;

  v3 = -[ICAttachment isURL](self, "isURL");
  if (v3)
  {
    -[ICAttachment URL](self, "URL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "ic_isiTunesURL");

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (BOOL)isAppStore
{
  _BOOL4 v3;
  void *v4;
  char v5;

  v3 = -[ICAttachment isURL](self, "isURL");
  if (v3)
  {
    -[ICAttachment URL](self, "URL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "ic_isAppStoreURL");

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (BOOL)isPodcasts
{
  _BOOL4 v3;
  void *v4;
  char v5;

  v3 = -[ICAttachment isURL](self, "isURL");
  if (v3)
  {
    -[ICAttachment URL](self, "URL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "ic_isPodcastsURL");

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (BOOL)isDrawing
{
  unsigned int v2;

  v2 = -[ICAttachment attachmentType](self, "attachmentType");
  return (v2 < 0xE) & (0x2600u >> v2);
}

- (BOOL)isPencilKitDrawing
{
  return -[ICAttachment attachmentType](self, "attachmentType") - 9 < 2;
}

- (BOOL)isNews
{
  _BOOL4 v3;
  void *v4;
  char v5;

  v3 = -[ICAttachment isURL](self, "isURL");
  if (v3)
  {
    -[ICAttachment URL](self, "URL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "ic_isNewsURL");

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (BOOL)isTable
{
  return -[ICAttachment attachmentType](self, "attachmentType") == 12;
}

- (BOOL)isScannedDocument
{
  return -[ICAttachment attachmentType](self, "attachmentType") == 11;
}

- (BOOL)isImage
{
  return -[ICAttachment attachmentType](self, "attachmentType") == 3;
}

- (BOOL)supportsRenaming
{
  BOOL result;
  unsigned int v4;

  if (-[ICAttachment isReadOnly](self, "isReadOnly"))
    return 0;
  v4 = -[ICAttachment attachmentType](self, "attachmentType");
  result = 0;
  if (v4 <= 0xF)
  {
    if (((1 << v4) & 0xCA74) != 0)
    {
      return 1;
    }
    else if (v4 == 3)
    {
      return !-[ICAttachment isChildOfDocumentGallery](self, "isChildOfDocumentGallery");
    }
  }
  return result;
}

- (BOOL)preferLocalPreviewImages
{
  void *v2;
  char v3;

  -[ICAttachment attachmentModel](self, "attachmentModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "preferLocalPreviewImages");

  return v3;
}

- (id)defaultTitle
{
  return (id)objc_msgSend((id)objc_opt_class(), "defaultTitleForAttachmentType:", -[ICAttachment attachmentType](self, "attachmentType"));
}

- (void)setNote:(id)a3
{
  id v4;
  void *v5;
  char v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;

  v4 = a3;
  -[ICAttachment note](self, "note");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqual:", v4);

  if ((v6 & 1) == 0)
  {
    -[ICAttachment note](self, "note");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = (void *)v7;
      -[ICAttachment note](self, "note");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "account");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "account");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10 != v11)
      {
        objc_msgSend(v4, "account");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICAttachment accountWillChangeToAccount:](self, "accountWillChangeToAccount:", v12);

      }
    }
    -[ICAttachment willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("note"));
    -[ICAttachment willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("parentCloudObject"));
    -[ICAttachment setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v4, CFSTR("note"));
    -[ICAttachment didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("note"));
    -[ICAttachment didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("parentCloudObject"));
    v13 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      -[ICAttachment setNote:].cold.1();

    -[ICCloudSyncingObject resetToIntrinsicNotesVersionAndPropagateToChildObjects](self, "resetToIntrinsicNotesVersionAndPropagateToChildObjects");
  }

}

- (BOOL)hasImageFilterType
{
  void *v3;
  void *v4;

  NSStringFromSelector(sel_imageFilterType);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAttachment willAccessValueForKey:](self, "willAccessValueForKey:", v3);
  -[ICAttachment primitiveValueForKey:](self, "primitiveValueForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAttachment didAccessValueForKey:](self, "didAccessValueForKey:", v3);

  return v4 != 0;
}

- (void)setImageFilterType:(signed __int16)a3
{
  uint64_t v3;
  void *v5;

  v3 = a3;
  if (-[ICAttachment imageFilterType](self, "imageFilterType") != a3)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[ICAttachment setCachedImage:](self, "setCachedImage:", 0);
    -[ICAttachment invalidateAttachmentPreviewImages](self, "invalidateAttachmentPreviewImages");
    -[ICAttachment willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("imageFilterType"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAttachment setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v5, CFSTR("imageFilterType"));

    -[ICAttachment didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("imageFilterType"));
  }
}

- (BOOL)hasOrientation
{
  void *v3;
  void *v4;

  NSStringFromSelector(sel_orientation);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAttachment willAccessValueForKey:](self, "willAccessValueForKey:", v3);
  -[ICAttachment primitiveValueForKey:](self, "primitiveValueForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAttachment didAccessValueForKey:](self, "didAccessValueForKey:", v3);

  return v4 != 0;
}

- (void)setOrientation:(signed __int16)a3
{
  uint64_t v3;
  void *v5;

  v3 = a3;
  if (-[ICAttachment orientation](self, "orientation") != a3)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[ICAttachment setCachedImage:](self, "setCachedImage:", 0);
    -[ICAttachment invalidateAttachmentPreviewImages](self, "invalidateAttachmentPreviewImages");
    -[ICAttachment willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("orientation"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAttachment setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v5, CFSTR("orientation"));

    -[ICAttachment didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("orientation"));
  }
}

- (CGRect)bounds
{
  double v3;
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
  CGRect result;

  -[ICAttachment originX](self, "originX");
  v4 = v3;
  -[ICAttachment originY](self, "originY");
  v6 = v5;
  -[ICAttachment sizeWidth](self, "sizeWidth");
  v8 = v7;
  -[ICAttachment sizeHeight](self, "sizeHeight");
  v10 = v9;
  v11 = v4;
  v12 = v6;
  v13 = v8;
  result.size.height = v10;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  -[ICAttachment setOriginX:](self, "setOriginX:", a3.origin.x);
  -[ICAttachment setOriginY:](self, "setOriginY:", y);
  -[ICAttachment setSizeWidth:](self, "setSizeWidth:", width);
  -[ICAttachment setSizeHeight:](self, "setSizeHeight:", height);
}

- (id)fileSizeString
{
  void *v3;
  void *v4;
  void *v5;

  -[ICAttachment media](self, "media");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mediaURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB34E8], "stringFromByteCount:countStyle:", -[ICAttachment fileSize](self, "fileSize"), 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)setParentAttachment:(id)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ICAttachment;
  -[ICBaseAttachment setParentAttachment:](&v6, sel_setParentAttachment_, a3);
  -[ICAttachment typeUTI](self, "typeUTI");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[ICAttachment typeUTI](self, "typeUTI");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAttachment updateAttachmentSectionWithTypeUTI:](self, "updateAttachmentSectionWithTypeUTI:", v5);

  }
}

- (void)updateAttachmentSectionWithTypeUTI:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  -[ICAttachment parentAttachment](self, "parentAttachment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "typeUTI");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5
    || (objc_msgSend(v4, "attachmentModel"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "sectionForSubAttachments"),
        v6,
        !(_DWORD)v7))
  {
    objc_msgSend(v4, "attachmentModel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "hidesSubAttachmentsInAttachmentBrowser");

    if ((v9 & 1) != 0)
    {
      v7 = 0;
    }
    else
    {
      v10 = (void *)objc_opt_class();
      -[ICAttachment URL](self, "URL");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v10, "sectionFromTypeUTI:url:", v12, v11);

    }
  }
  if (-[ICAttachment section](self, "section") != (_DWORD)v7)
    -[ICAttachment setSection:](self, "setSection:", v7);

}

+ (signed)sectionFromTypeUTI:(id)a3 url:(id)a4
{
  id v5;
  id v6;
  signed __int16 v7;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  int v13;

  v5 = a3;
  v6 = a4;
  if (v5)
  {
    if (+[ICAttachment typeUTIIsImage:](ICAttachment, "typeUTIIsImage:", v5)
      || +[ICAttachment typeUTIIsPlayableMovie:](ICAttachment, "typeUTIIsPlayableMovie:", v5))
    {
      v7 = 1;
    }
    else if (+[ICAttachment typeUTIIsPlayableAudio:](ICAttachment, "typeUTIIsPlayableAudio:", v5))
    {
      v7 = 5;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "conformsToType:", *MEMORY[0x1E0CEC618]);

      if (v10)
      {
        if (objc_msgSend(v6, "ic_isMapURL"))
          v7 = 3;
        else
          v7 = 4;
      }
      else if (+[ICAttachment typeUTIIsDrawing:](ICAttachment, "typeUTIIsDrawing:", v5)
             || +[ICAttachment typeUTIIsInlineDrawing:](ICAttachment, "typeUTIIsInlineDrawing:", v5)
             || +[ICAttachment typeUTIIsSystemPaper:](ICAttachment, "typeUTIIsSystemPaper:", v5))
      {
        v7 = 2;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", v5);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CEC3F8], "exportedTypeWithIdentifier:", CFSTR("com.apple.paper.doc.scan"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "conformsToType:", v12);

        if (v13)
          v7 = 7;
        else
          v7 = 6;
      }
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)setUrlString:(id)a3
{
  id v4;
  NSURL *URL;
  uint64_t v6;

  v4 = a3;
  -[ICAttachment willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("urlString"));
  -[ICAttachment willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("URL"));
  URL = self->_URL;
  self->_URL = 0;

  -[ICCloudSyncingObject setPrimitiveValue:forEncryptableKey:](self, "setPrimitiveValue:forEncryptableKey:", v4, CFSTR("urlString"));
  if (-[ICAttachment isURL](self, "isURL"))
  {
    if (-[ICAttachment isMap](self, "isMap"))
      v6 = 3;
    else
      v6 = 4;
    -[ICAttachment setSection:](self, "setSection:", v6);
  }
  -[ICAttachment didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("URL"));
  -[ICAttachment didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("urlString"));
}

- (void)saveMergeableDataIfNeeded
{
  if (-[ICAttachmentModel isMergeableDataDirty](self->_attachmentModel, "isMergeableDataDirty"))
    -[ICAttachmentModel writeMergeableData](self->_attachmentModel, "writeMergeableData");
}

- (NSData)mergeableData
{
  -[ICAttachment saveMergeableDataIfNeeded](self, "saveMergeableDataIfNeeded");
  return (NSData *)-[ICCloudSyncingObject primitiveValueForEncryptableKey:](self, "primitiveValueForEncryptableKey:", CFSTR("mergeableData"));
}

- (BOOL)needsToBeRequested
{
  void *v3;
  void *v4;
  void *v5;
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
  char v20;

  LOBYTE(v3) = 1;
  switch(-[ICAttachment attachmentType](self, "attachmentType"))
  {
    case 0:
      return (char)v3;
    case 3:
    case 4:
    case 5:
    case 6:
      -[ICAttachment media](self, "media");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (v4)
        goto LABEL_3;
      goto LABEL_4;
    case 7:
    case 8:
      if (-[ICAttachment hasSynapseLink](self, "hasSynapseLink"))
        goto LABEL_8;
      -[ICAttachment urlString](self, "urlString");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v3) = v16 == 0;

      return (char)v3;
    case 9:
    case 0xB:
    case 0xD:
      return -[ICAttachment needsInitialFetchFromCloud](self, "needsInitialFetchFromCloud");
    default:
      -[ICAttachment typeUTI](self, "typeUTI");
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v3)
        return (char)v3;
      v7 = (void *)MEMORY[0x1E0CEC3F8];
      -[ICAttachment typeUTI](self, "typeUTI");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "typeWithIdentifier:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v9, "conformsToType:", *MEMORY[0x1E0CEC4A0]) & 1) != 0)
        goto LABEL_15;
      v10 = (void *)MEMORY[0x1E0CEC3F8];
      -[ICAttachment typeUTI](self, "typeUTI");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "typeWithIdentifier:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v12, "conformsToType:", *MEMORY[0x1E0CEC498]) & 1) != 0)
        goto LABEL_14;
      v13 = (void *)MEMORY[0x1E0CEC3F8];
      -[ICAttachment typeUTI](self, "typeUTI");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "typeWithIdentifier:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v15, "conformsToType:", *MEMORY[0x1E0CEC4D8]) & 1) != 0)
      {

LABEL_14:
LABEL_15:

      }
      else
      {
        v17 = (void *)MEMORY[0x1E0CEC3F8];
        -[ICAttachment typeUTI](self, "typeUTI");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "typeWithIdentifier:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "conformsToType:", *MEMORY[0x1E0CEC4B8]);

        if ((v20 & 1) == 0)
        {
LABEL_8:
          LOBYTE(v3) = 0;
          return (char)v3;
        }
      }
      -[ICAttachment media](self, "media");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (v4)
      {
LABEL_3:
        -[ICAttachment media](self, "media");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v3) = objc_msgSend(v5, "isValid") ^ 1;

      }
      else
      {
        LOBYTE(v3) = 1;
      }
LABEL_4:

      return (char)v3;
  }
}

- (BOOL)isInNoteTitleOrSnippet
{
  void *v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  BOOL v10;
  NSUInteger v11;
  NSRange v13;
  NSRange v14;
  NSRange v15;
  NSRange v16;

  -[ICAttachment note](self, "note");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = -[ICBaseAttachment rangeInNote](self, "rangeInNote");
    v6 = v5;
    v7 = objc_msgSend(v3, "rangeForTitle:", 0);
    v9 = v8;
    v13.location = v4;
    v13.length = v6;
    v15.location = v7;
    v15.length = v9;
    if (NSIntersectionRange(v13, v15).length)
    {
      v10 = 1;
    }
    else
    {
      v16.location = objc_msgSend(v3, "rangeForSnippetWithTitleRange:", v7, v9);
      v16.length = v11;
      v14.location = v4;
      v14.length = v6;
      v10 = NSIntersectionRange(v14, v16).length != 0;
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)supportsSavingAttachmentToExternalFile
{
  return !-[ICAttachment isUnsupported](self, "isUnsupported")
      && -[ICAttachment section](self, "section") != 3
      && -[ICAttachment section](self, "section") != 4;
}

- (void)willSave
{
  objc_super v3;

  -[ICAttachment saveMergeableDataIfNeeded](self, "saveMergeableDataIfNeeded");
  v3.receiver = self;
  v3.super_class = (Class)ICAttachment;
  -[ICCloudSyncingObject willSave](&v3, sel_willSave);
}

- (void)accountWillChangeToAccount:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void (**v10)(void *, _QWORD);
  _QWORD v11[5];
  id v12;
  id v13;
  _QWORD *v14;
  _QWORD v15[5];
  id v16;

  v4 = a3;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x3032000000;
  v15[3] = __Block_byref_object_copy__54;
  v15[4] = __Block_byref_object_dispose__54;
  v16 = 0;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAttachment media](self, "media");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accountWillChangeToAccount:", v4);

  -[ICAttachment previewImages](self, "previewImages");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v8, "makeObjectsPerformSelector:withObject:", sel_accountWillChangeToAccount_, v4);

  -[ICAttachment identifier](self, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 && v9)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __43__ICAttachment_accountWillChangeToAccount___block_invoke;
    v11[3] = &unk_1E76CF668;
    v11[4] = self;
    v12 = v4;
    v13 = v5;
    v14 = v15;
    v10 = (void (**)(void *, _QWORD))_Block_copy(v11);
    v10[2](v10, 0);
    v10[2](v10, 1);

  }
  _Block_object_dispose(v15, 8);

}

void __43__ICAttachment_accountWillChangeToAccount___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  void *v19;
  id *v20;
  NSObject *v21;
  id v22;
  id obj;

  NSStringFromFallbackAssetType(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2 == 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "fallbackPDFURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_opt_class();
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "fallbackPDFFallbackURLForIdentifier:account:", v7, *(_QWORD *)(a1 + 40));
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a2)
    {
      v5 = 0;
      v10 = 0;
      goto LABEL_18;
    }
    objc_msgSend(*(id *)(a1 + 32), "fallbackImageURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_opt_class();
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fallbackImageFallbackURLForIdentifier:account:", v7, *(_QWORD *)(a1 + 40));
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v8;

  if (v5)
  {
    if (v10)
    {
      if ((objc_msgSend(v5, "isEqual:", v10) & 1) == 0)
      {
        v11 = *(void **)(a1 + 48);
        objc_msgSend(v5, "path");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v11) = objc_msgSend(v11, "fileExistsAtPath:", v12);

        if ((_DWORD)v11)
        {
          v13 = *(void **)(a1 + 48);
          objc_msgSend(v10, "URLByDeletingLastPathComponent");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
          obj = *(id *)(v15 + 40);
          objc_msgSend(v13, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v14, 1, 0, &obj);
          objc_storeStrong((id *)(v15 + 40), obj);

          v16 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
          v17 = *(void **)(v16 + 40);
          if (v17)
          {
            v18 = os_log_create("com.apple.notes", "CoreData");
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
              __43__ICAttachment_accountWillChangeToAccount___block_invoke_cold_2();

            v16 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
            v17 = *(void **)(v16 + 40);
          }
          v19 = *(void **)(a1 + 48);
          v20 = (id *)(v16 + 40);
          v22 = v17;
          objc_msgSend(v19, "moveItemAtURL:toURL:error:", v5, v10, &v22);
          objc_storeStrong(v20, v22);
          if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
          {
            v21 = os_log_create("com.apple.notes", "CoreData");
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
              __43__ICAttachment_accountWillChangeToAccount___block_invoke_cold_1();

          }
        }
      }
    }
  }
LABEL_18:

}

+ (id)filenameExtensionForUTI:(id)a3
{
  void *v3;
  void *v4;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "preferredFilenameExtension");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (id)filenameFromUTI:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v15;
  int v16;
  void *v17;

  v4 = a3;
  if (+[ICAttachment typeUTIIsImage:](ICAttachment, "typeUTIIsImage:", v4))
  {
    v5 = a1;
    v6 = 3;
LABEL_14:
    objc_msgSend(v5, "defaultTitleForAttachmentType:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  if (+[ICAttachment typeUTIIsPlayableAudio:](ICAttachment, "typeUTIIsPlayableAudio:", v4))
  {
    v5 = a1;
    v6 = 4;
    goto LABEL_14;
  }
  if (+[ICAttachment typeUTIIsPlayableMovie:](ICAttachment, "typeUTIIsPlayableMovie:", v4))
  {
    v5 = a1;
    v6 = 5;
    goto LABEL_14;
  }
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "conformsToType:", *MEMORY[0x1E0CEC570]);

    if (v8)
    {
      v5 = a1;
      v6 = 6;
      goto LABEL_14;
    }
    if (+[ICAttachment typeUTIIsDrawing:](ICAttachment, "typeUTIIsDrawing:", v4))
    {
LABEL_13:
      v5 = a1;
      v6 = 9;
      goto LABEL_14;
    }
    objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", v4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "conformsToType:", *MEMORY[0x1E0CEC618]);

    if (v16)
    {
      v5 = a1;
      v6 = 8;
      goto LABEL_14;
    }
    objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", v4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "localizedDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
    if (+[ICAttachment typeUTIIsDrawing:](ICAttachment, "typeUTIIsDrawing:", 0))
      goto LABEL_13;
  }
LABEL_15:
  if (!objc_msgSend(v9, "length"))
  {
    objc_msgSend(a1, "defaultTitleForAttachmentType:", 2);
    v10 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v10;
  }
  objc_msgSend(a1, "filenameExtensionForUTI:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(v9, "stringByAppendingPathExtension:", v11);
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = v9;
  }
  v13 = v12;

  return v13;
}

+ (id)mimeTypeFromUTI:(id)a3
{
  id v3;
  __CFString *v4;
  void *v5;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.coreaudio-format")) & 1) != 0)
  {
    v4 = CFSTR("audio/x-caf");
  }
  else if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "preferredMIMEType");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (BOOL)typeUTIIsDrawing:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;

  v3 = a3;
  if (v3)
  {
    +[ICUTType typeWithIdentifier:](ICUTType, "typeWithIdentifier:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEC3F8], "exportedTypeWithIdentifier:", CFSTR("com.apple.notes.sketch"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "conformsToType:", v5) & 1) != 0)
      v6 = 1;
    else
      v6 = objc_msgSend(v3, "isEqualToString:", ICAttachmentUTTypeDrawingLegacy);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)defaultTitleForAttachmentType:(signed __int16)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  __CFString *v7;

  switch(a3)
  {
    case 0:
    case 1:
    case 2:
      v5 = (void *)MEMORY[0x1E0D64218];
      v6 = CFSTR("Attachment");
      goto LABEL_14;
    case 3:
      v5 = (void *)MEMORY[0x1E0D64218];
      v6 = CFSTR("Image");
      goto LABEL_14;
    case 4:
      v5 = (void *)MEMORY[0x1E0D64218];
      v6 = CFSTR("Audio");
      goto LABEL_14;
    case 5:
      v5 = (void *)MEMORY[0x1E0D64218];
      v6 = CFSTR("Movie");
      goto LABEL_14;
    case 6:
    case 14:
      v5 = (void *)MEMORY[0x1E0D64218];
      v6 = CFSTR("PDF");
      goto LABEL_14;
    case 7:
      v5 = (void *)MEMORY[0x1E0D64218];
      v6 = CFSTR("Map");
      goto LABEL_14;
    case 8:
      v5 = (void *)MEMORY[0x1E0D64218];
      v6 = CFSTR("URL");
      goto LABEL_14;
    case 9:
    case 10:
    case 13:
      v5 = (void *)MEMORY[0x1E0D64218];
      v6 = CFSTR("Sketch");
      goto LABEL_14;
    case 11:
    case 15:
      v5 = (void *)MEMORY[0x1E0D64218];
      v6 = CFSTR("Scanned Documents");
      goto LABEL_14;
    case 12:
      v5 = (void *)MEMORY[0x1E0D64218];
      v6 = CFSTR("Table");
LABEL_14:
      objc_msgSend(v5, "localizedFrameworkStringForKey:value:table:allowSiri:", v6, v6, 0, 1, v3, v4);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v7 = &stru_1E76DB108;
      break;
  }
  return v7;
}

+ (id)mentionNotificationSnippetForAttachmentType:(signed __int16)a3
{
  int v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  uint64_t v7;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Mentioned you in an attachment"), CFSTR("Mentioned you in an attachment"), 0, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v3 - 9) < 2 || v3 == 13)
  {
    v5 = (void *)MEMORY[0x1E0D64218];
    v6 = CFSTR("Mentioned you in a drawing");
    goto LABEL_6;
  }
  if (v3 == 12)
  {
    v5 = (void *)MEMORY[0x1E0D64218];
    v6 = CFSTR("Mentioned you in a table");
LABEL_6:
    objc_msgSend(v5, "localizedFrameworkStringForKey:value:table:allowSiri:", v6, v6, 0, 1);
    v7 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v7;
  }
  return v4;
}

- (BOOL)isLoadingFromCloud
{
  char v3;
  void *v4;
  void *v5;

  if ((-[ICAttachment needsInitialFetchFromCloud](self, "needsInitialFetchFromCloud") & 1) != 0)
    return 1;
  -[ICAttachment media](self, "media");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[ICAttachment media](self, "media");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v5, "needsInitialFetchFromCloud");

  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (BOOL)hasVisibleInlineAttachments
{
  void *v2;
  void *v3;
  char v4;

  -[ICAttachment inlineAttachments](self, "inlineAttachments");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICBaseAttachment predicateForVisibleObjects](ICInlineAttachment, "predicateForVisibleObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "ic_containsObjectMatchingPredicate:", v3);

  return v4;
}

- (NSSet)visibleInlineAttachments
{
  void *v2;
  void *v3;
  void *v4;

  -[ICAttachment inlineAttachments](self, "inlineAttachments");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICBaseAttachment predicateForVisibleObjects](ICInlineAttachment, "predicateForVisibleObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "filteredSetUsingPredicate:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

- (BOOL)supportsEncryptedValuesDictionary
{
  return 1;
}

- (NSString)urlString
{
  return (NSString *)-[ICCloudSyncingObject valueForEncryptableKey:](self, "valueForEncryptableKey:", CFSTR("urlString"));
}

- (void)setTitle:(id)a3
{
  -[ICCloudSyncingObject setValue:forEncryptableKey:](self, "setValue:forEncryptableKey:", a3, CFSTR("title"));
}

- (NSString)userTitle
{
  return (NSString *)-[ICCloudSyncingObject valueForEncryptableKey:](self, "valueForEncryptableKey:", CFSTR("userTitle"));
}

- (void)setUserTitle:(id)a3
{
  -[ICCloudSyncingObject setValue:forEncryptableKey:](self, "setValue:forEncryptableKey:", a3, CFSTR("userTitle"));
}

- (NSString)fallbackTitle
{
  return (NSString *)-[ICCloudSyncingObject valueForEncryptableKey:](self, "valueForEncryptableKey:", CFSTR("fallbackTitle"));
}

- (void)setFallbackTitle:(id)a3
{
  -[ICCloudSyncingObject setValue:forEncryptableKey:](self, "setValue:forEncryptableKey:", a3, CFSTR("fallbackTitle"));
}

- (NSString)fallbackSubtitleIOS
{
  return (NSString *)-[ICCloudSyncingObject valueForEncryptableKey:](self, "valueForEncryptableKey:", CFSTR("fallbackSubtitleIOS"));
}

- (void)setFallbackSubtitleIOS:(id)a3
{
  -[ICCloudSyncingObject setValue:forEncryptableKey:](self, "setValue:forEncryptableKey:", a3, CFSTR("fallbackSubtitleIOS"));
}

- (NSString)fallbackSubtitleMac
{
  return (NSString *)-[ICCloudSyncingObject valueForEncryptableKey:](self, "valueForEncryptableKey:", CFSTR("fallbackSubtitleMac"));
}

- (void)setFallbackSubtitleMac:(id)a3
{
  -[ICCloudSyncingObject setValue:forEncryptableKey:](self, "setValue:forEncryptableKey:", a3, CFSTR("fallbackSubtitleMac"));
}

- (BOOL)showsLoadingPlaceholder
{
  return 0;
}

- (id)unsupportedAttachmentTitle
{
  void *v3;
  const __CFString *v4;

  -[ICAttachment fallbackTitle](self, "fallbackTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    if (-[ICAttachment showsLoadingPlaceholder](self, "showsLoadingPlaceholder"))
      v4 = CFSTR("Loading Attachment…");
    else
      v4 = CFSTR("Unsupported Attachment");
    objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", v4, v4, 0, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)unsupportedAttachmentSubtitle
{
  __CFString *v3;
  void *v4;
  const __CFString *v5;

  -[ICAttachment fallbackSubtitleIOS](self, "fallbackSubtitleIOS");
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    if (-[ICAttachment showsLoadingPlaceholder](self, "showsLoadingPlaceholder"))
    {
      if (!-[ICAttachment hasFallbackPDF](self, "hasFallbackPDF"))
      {
        v3 = &stru_1E76DB108;
        return v3;
      }
      v4 = (void *)MEMORY[0x1E0D64218];
      v5 = CFSTR("PDF Document");
    }
    else
    {
      v4 = (void *)MEMORY[0x1E0D64218];
      v5 = CFSTR("Upgrade iOS to view this attachment.");
    }
    objc_msgSend(v4, "localizedFrameworkStringForKey:value:table:allowSiri:", v5, v5, 0, 1);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (NSURL)fileURL
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;

  -[ICAttachment media](self, "media");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isPasswordProtected");
  -[ICAttachment media](self, "media");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if ((v4 & 1) != 0)
    objc_msgSend(v5, "encryptedMediaURL");
  else
    objc_msgSend(v5, "mediaURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v7;
}

- (BOOL)isDeletedOrInTrash
{
  void *v4;
  char v5;

  if ((-[ICAttachment isDeleted](self, "isDeleted") & 1) != 0)
    return 1;
  -[ICAttachment note](self, "note");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isDeletedOrInTrash");

  return v5;
}

- (void)setRemoteFileURL:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if ((-[NSURL isEqual:](self->_remoteFileURL, "isEqual:") & 1) == 0)
  {
    if (-[ICAttachment isPasswordProtected](self, "isPasswordProtected"))
    {
      objc_msgSend(v5, "absoluteString");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICCloudSyncingObject setValue:forEncryptableKey:](self, "setValue:forEncryptableKey:", v4, CFSTR("remoteFileURL"));
    }
    else
    {
      if (!v5)
      {
        -[ICAttachment setRemoteFileURLString:](self, "setRemoteFileURLString:", 0);
        goto LABEL_8;
      }
      objc_msgSend(v5, "absoluteString");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICAttachment setRemoteFileURLString:](self, "setRemoteFileURLString:", v4);
    }

  }
LABEL_8:

}

- (NSURL)remoteFileURL
{
  void *v3;
  NSURL *v4;
  NSURL *remoteFileURL;

  if (!self->_remoteFileURL)
  {
    if (-[ICAttachment isPasswordProtected](self, "isPasswordProtected"))
    {
      -[ICCloudSyncingObject valueForEncryptableKey:](self, "valueForEncryptableKey:", CFSTR("remoteFileURL"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[ICAttachment remoteFileURLString](self, "remoteFileURLString");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v3)
      {
LABEL_6:

        return self->_remoteFileURL;
      }
    }
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v3);
    v4 = (NSURL *)objc_claimAutoreleasedReturnValue();
    remoteFileURL = self->_remoteFileURL;
    self->_remoteFileURL = v4;

    goto LABEL_6;
  }
  return self->_remoteFileURL;
}

- (NSDictionary)metadata
{
  void *v3;
  void *v4;
  void *v5;
  NSDictionary *metadata;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  NSDictionary *v13;
  NSObject *v14;
  id v15;

  if (-[ICAttachment isPasswordProtected](self, "isPasswordProtected"))
  {
    objc_opt_class();
    NSStringFromSelector(sel_metadata);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICCloudSyncingObject valueForEncryptableKey:](self, "valueForEncryptableKey:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    ICCheckedDynamicCast();
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    return (NSDictionary *)v5;
  }
  else
  {
    metadata = self->_metadata;
    if (metadata)
    {
      return metadata;
    }
    else
    {
      NSStringFromSelector(sel_metadataData);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICAttachment primitiveValueForKey:](self, "primitiveValueForKey:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        objc_opt_class();
        v15 = 0;
        objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v9, 0, &v15);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v15;
        ICCheckedDynamicCast();
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v12 || v11)
        {
          v14 = os_log_create("com.apple.notes", "CoreData");
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            -[ICAttachment metadata].cold.1();

          v13 = 0;
        }
        else
        {
          objc_storeStrong((id *)&self->_metadata, v12);
          v13 = self->_metadata;
        }

      }
      else
      {
        v13 = 0;
      }

      return v13;
    }
  }
}

- (void)setMetadata:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  unint64_t v10;
  void *v11;
  BOOL v12;
  void *v13;
  char v14;
  void *v15;
  id v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  id v21;

  v4 = a3;
  -[ICAttachment metadata](self, "metadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)*MEMORY[0x1E0C9B0D0];
  if ((id)*MEMORY[0x1E0C9B0D0] == v4)
    v7 = 0;
  else
    v7 = v4;
  v8 = v7;
  if (v6 == v5)
    v9 = 0;
  else
    v9 = v5;
  v10 = v9;
  if (v8 | v10)
  {
    v11 = (void *)v10;
    if (v8)
      v12 = v10 == 0;
    else
      v12 = 1;
    if (v12)
    {

      goto LABEL_17;
    }
    v14 = objc_msgSend((id)v8, "isEqual:", v10);

    if ((v14 & 1) == 0)
    {
LABEL_17:
      objc_opt_class();
      ICCheckedDynamicCast();
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (-[ICAttachment isPasswordProtected](self, "isPasswordProtected"))
      {
        NSStringFromSelector(sel_metadata);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICCloudSyncingObject setValue:forEncryptableKey:](self, "setValue:forEncryptableKey:", v13, v15);
LABEL_28:

        goto LABEL_29;
      }
      if (v13)
      {
        v21 = 0;
        objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v13, 0, &v21);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v21;
        v17 = v16;
        if (!v15 || v16)
        {
          v18 = os_log_create("com.apple.notes", "CoreData");
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            -[ICAttachment setMetadata:].cold.1();

          goto LABEL_27;
        }
      }
      else
      {
        v15 = 0;
      }
      objc_storeStrong((id *)&self->_metadata, v13);
      NSStringFromSelector(sel_metadataData);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICAttachment willChangeValueForKey:](self, "willChangeValueForKey:", v19);

      NSStringFromSelector(sel_metadataData);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICAttachment setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v15, v20);

      NSStringFromSelector(sel_metadataData);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICAttachment didChangeValueForKey:](self, "didChangeValueForKey:", v17);
LABEL_27:

      goto LABEL_28;
    }
  }
  else
  {

  }
  v13 = v4;
LABEL_29:

}

- (void)updateAttachmentMetadataWithBlock:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[ICAttachment managedObjectContext](self, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__ICAttachment_updateAttachmentMetadataWithBlock___block_invoke;
  v7[3] = &unk_1E76C8430;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performBlockAndWait:", v7);

}

void __50__ICAttachment_updateAttachmentMetadataWithBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "metadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v5;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v6 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(*(id *)(a1 + 32), "setMetadata:", v6);

}

- (NSData)metadataData
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  BOOL v9;
  NSObject *v10;
  id v11;
  id v13;

  if (-[ICAttachment isPasswordProtected](self, "isPasswordProtected"))
  {
    objc_opt_class();
    NSStringFromSelector(sel_metadata);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICCloudSyncingObject valueForEncryptableKey:](self, "valueForEncryptableKey:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    ICCheckedDynamicCast();
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v13 = 0;
      objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v5, 0, &v13);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v13;
      v8 = v7;
      if (v6)
        v9 = v7 == 0;
      else
        v9 = 0;
      if (v9)
      {
        v11 = v6;
      }
      else
      {
        v10 = os_log_create("com.apple.notes", "CoreData");
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          -[ICAttachment metadataData].cold.1();

        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }
  }
  else
  {
    NSStringFromSelector(sel_metadataData);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAttachment primitiveValueForKey:](self, "primitiveValueForKey:", v5);
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }

  return (NSData *)v11;
}

- (void)setMetadataData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  unint64_t v10;
  void *v11;
  BOOL v12;
  char v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  id v19;

  v4 = a3;
  -[ICAttachment metadataData](self, "metadataData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)*MEMORY[0x1E0C9B0D0];
  if ((id)*MEMORY[0x1E0C9B0D0] == v4)
    v7 = 0;
  else
    v7 = v4;
  v8 = v7;
  if (v6 == v5)
    v9 = 0;
  else
    v9 = v5;
  v10 = v9;
  if (!(v8 | v10))
    goto LABEL_26;
  v11 = (void *)v10;
  if (v8)
    v12 = v10 == 0;
  else
    v12 = 1;
  if (v12)
  {

    goto LABEL_15;
  }
  v13 = objc_msgSend((id)v8, "isEqual:", v10);

  if ((v13 & 1) == 0)
  {
LABEL_15:
    if (v4)
    {
      objc_opt_class();
      v19 = 0;
      objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v4, 0, &v19);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v19;
      ICCheckedDynamicCast();
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v5 || v15)
      {
        v16 = os_log_create("com.apple.notes", "CoreData");
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          -[ICAttachment metadata].cold.1();

        goto LABEL_25;
      }
    }
    else
    {
      v5 = 0;
    }
    if (-[ICAttachment isPasswordProtected](self, "isPasswordProtected"))
    {
      NSStringFromSelector(sel_metadata);
      v15 = (id)objc_claimAutoreleasedReturnValue();
      -[ICCloudSyncingObject setValue:forEncryptableKey:](self, "setValue:forEncryptableKey:", v5, v15);
    }
    else
    {
      objc_storeStrong((id *)&self->_metadata, v5);
      NSStringFromSelector(sel_metadataData);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICAttachment willChangeValueForKey:](self, "willChangeValueForKey:", v17);

      NSStringFromSelector(sel_metadataData);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICAttachment setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v4, v18);

      NSStringFromSelector(sel_metadataData);
      v15 = (id)objc_claimAutoreleasedReturnValue();
      -[ICAttachment didChangeValueForKey:](self, "didChangeValueForKey:", v15);
    }
LABEL_25:

LABEL_26:
  }

}

- (BOOL)hasMetadata
{
  int v3;
  char **v4;
  void *v5;
  void *v6;

  v3 = -[ICAttachment isPasswordProtected](self, "isPasswordProtected");
  v4 = &selRef_metadata;
  if (!v3)
    v4 = &selRef_metadataData;
  NSStringFromSelector(*v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCloudSyncingObject valueForEncryptableKey:](self, "valueForEncryptableKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6 != 0;
}

- (NSString)summary
{
  return (NSString *)-[ICCloudSyncingObject valueForEncryptableKey:](self, "valueForEncryptableKey:", CFSTR("summary"));
}

- (void)setSummary:(id)a3
{
  -[ICCloudSyncingObject setValue:forEncryptableKey:](self, "setValue:forEncryptableKey:", a3, CFSTR("summary"));
}

- (void)updateCombinedSummary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[ICAttachment handwritingSummary](self, "handwritingSummary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3
    || (-[ICAttachment imageClassificationSummary](self, "imageClassificationSummary"),
        (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {

LABEL_4:
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    -[ICAttachment handwritingSummary](self, "handwritingSummary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "ic_addNonNilObject:", v4);

    -[ICAttachment imageClassificationSummary](self, "imageClassificationSummary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "ic_addNonNilObject:", v5);

    -[ICAttachment ocrSummary](self, "ocrSummary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "ic_addNonNilObject:", v6);

    objc_msgSend(v9, "componentsJoinedByString:", CFSTR(" "));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAttachment setSummary:](self, "setSummary:", v7);

    return;
  }
  -[ICAttachment ocrSummary](self, "ocrSummary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    goto LABEL_4;
  -[ICAttachment setSummary:](self, "setSummary:", 0);
}

- (NSString)handwritingSummary
{
  return (NSString *)-[ICCloudSyncingObject valueForEncryptableKey:](self, "valueForEncryptableKey:", CFSTR("handwritingSummary"));
}

- (void)setHandwritingSummary:(id)a3
{
  _BOOL4 v4;

  v4 = a3 != 0;
  -[ICCloudSyncingObject setValue:forEncryptableKey:](self, "setValue:forEncryptableKey:");
  -[ICAttachment updateCombinedSummary](self, "updateCombinedSummary");
  -[ICAttachment setHandwritingSummaryVersion:](self, "setHandwritingSummaryVersion:", (8 * v4));
}

+ (void)purgeHandwritingSummariesInContext:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  _QWORD v15[4];

  v15[3] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)MEMORY[0x1E0CB3528];
  +[ICBaseAttachment predicateForVisibleObjects](ICAttachment, "predicateForVisibleObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v5;
  +[ICAttachment predicateForPasswordProtected:](ICAttachment, "predicateForPasswordProtected:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v6;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("handwritingSummary != nil"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "andPredicateWithSubpredicates:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __51__ICAttachment_purgeHandwritingSummariesInContext___block_invoke;
  v12[3] = &unk_1E76C73B0;
  v13 = v9;
  v14 = v3;
  v10 = v3;
  v11 = v9;
  objc_msgSend(v10, "performBlockAndWait:", v12);

}

uint64_t __51__ICAttachment_purgeHandwritingSummariesInContext___block_invoke(uint64_t a1)
{
  return +[ICAttachment ic_enumerateObjectsMatchingPredicate:sortDescriptors:relationshipKeyPathsForPrefetching:context:batchSize:saveAfterBatch:usingBlock:](ICAttachment, "ic_enumerateObjectsMatchingPredicate:sortDescriptors:relationshipKeyPathsForPrefetching:context:batchSize:saveAfterBatch:usingBlock:", *(_QWORD *)(a1 + 32), 0, 0, *(_QWORD *)(a1 + 40), 25, 0, &__block_literal_global_275);
}

void __51__ICAttachment_purgeHandwritingSummariesInContext___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = os_log_create("com.apple.notes", "SystemPaper");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v2, "ic_loggingIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v4;
    _os_log_impl(&dword_1BD918000, v3, OS_LOG_TYPE_INFO, "Purging handwriting summary {attachment: %@}", (uint8_t *)&v5, 0xCu);

  }
  objc_msgSend(v2, "setHandwritingSummary:", 0);
  objc_msgSend(v2, "updateChangeCountWithReason:", CFSTR("Purged handwriting summary"));

}

- (NSString)imageClassificationSummary
{
  return (NSString *)-[ICCloudSyncingObject valueForEncryptableKey:](self, "valueForEncryptableKey:", CFSTR("imageClassificationSummary"));
}

- (void)setImageClassificationSummary:(id)a3
{
  _BOOL4 v4;

  v4 = a3 != 0;
  -[ICCloudSyncingObject setValue:forEncryptableKey:](self, "setValue:forEncryptableKey:");
  -[ICAttachment updateCombinedSummary](self, "updateCombinedSummary");
  -[ICAttachment setImageClassificationSummaryVersion:](self, "setImageClassificationSummaryVersion:", (4 * v4));
}

- (NSString)ocrSummary
{
  return (NSString *)-[ICCloudSyncingObject valueForEncryptableKey:](self, "valueForEncryptableKey:", CFSTR("ocrSummary"));
}

- (void)setOcrSummary:(id)a3
{
  -[ICCloudSyncingObject setValue:forEncryptableKey:](self, "setValue:forEncryptableKey:", a3, CFSTR("ocrSummary"));
  -[ICAttachment updateCombinedSummary](self, "updateCombinedSummary");
  -[ICAttachment setOcrSummaryVersion:](self, "setOcrSummaryVersion:", a3 != 0);
}

- (NSString)additionalIndexableText
{
  return (NSString *)-[ICCloudSyncingObject valueForEncryptableKey:](self, "valueForEncryptableKey:", CFSTR("additionalIndexableText"));
}

- (void)setAdditionalIndexableText:(id)a3
{
  -[ICCloudSyncingObject setValue:forEncryptableKey:](self, "setValue:forEncryptableKey:", a3, CFSTR("additionalIndexableText"));
}

- (void)setIsBeingEditedLocallyOnDevice:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  id obj;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "isBeingEditedLocallyOnDeviceSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAttachment identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  obj = v5;
  objc_sync_enter(obj);
  if (v3)
    objc_msgSend(obj, "ic_addNonNilObject:", v6);
  else
    objc_msgSend(obj, "ic_removeNonNilObject:", v6);
  objc_sync_exit(obj);

}

- (void)setMarkupModelData:(id)a3
{
  id v4;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[ICAttachment setCachedImage:](self, "setCachedImage:", 0);
  -[ICAttachment invalidateAttachmentPreviewImages](self, "invalidateAttachmentPreviewImages");
  -[ICCloudSyncingObject setValue:forEncryptableKey:](self, "setValue:forEncryptableKey:", v4, CFSTR("markupModelData"));

}

- (BOOL)shouldEmbedMarkupDataInMedia
{
  void *v2;
  void *v3;
  BOOL v4;

  -[ICAttachment parentAttachment](self, "parentAttachment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "attachmentType") != 11;
  else
    v4 = 1;

  return v4;
}

- (void)setMergeableData:(id)a3
{
  id v4;

  v4 = a3;
  -[ICAttachment setSettingMergeableData:](self, "setSettingMergeableData:", 1);
  -[ICCloudSyncingObject setValue:forEncryptableKey:](self, "setValue:forEncryptableKey:", v4, CFSTR("mergeableData"));

  -[ICAttachment setSettingMergeableData:](self, "setSettingMergeableData:", 0);
}

- (NSData)linkPresentationArchivedMetadata
{
  return (NSData *)-[ICCloudSyncingObject valueForEncryptableKey:](self, "valueForEncryptableKey:", CFSTR("linkPresentationArchivedMetadata"));
}

- (void)setLinkPresentationArchivedMetadata:(id)a3
{
  -[ICCloudSyncingObject setValue:forEncryptableKey:](self, "setValue:forEncryptableKey:", a3, CFSTR("linkPresentationArchivedMetadata"));
}

- (NSData)synapseData
{
  return (NSData *)-[ICCloudSyncingObject valueForEncryptableKey:](self, "valueForEncryptableKey:", CFSTR("synapseData"));
}

- (void)setSynapseData:(id)a3
{
  -[ICCloudSyncingObject setValue:forEncryptableKey:](self, "setValue:forEncryptableKey:", a3, CFSTR("synapseData"));
}

- (BOOL)hasSynapseLink
{
  void *v2;
  BOOL v3;

  -[ICAttachment synapseData](self, "synapseData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)setMergeablePreferredViewSize:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;
  id v8;

  v8 = a3;
  -[ICAttachment mergeablePreferredViewSize](self, "mergeablePreferredViewSize");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToData:", v8);

  if ((v5 & 1) == 0)
  {
    performBlockOnMainThread();
    NSStringFromSelector(sel_mergeablePreferredViewSize);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAttachment willChangeValueForKey:](self, "willChangeValueForKey:", v6);
    -[ICAttachment setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v8, v6);
    -[ICAttachment didChangeValueForKey:](self, "didChangeValueForKey:", v6);
    v7 = (id)-[ICAttachment ic_postNotificationOnMainThreadAfterSaveWithName:](self, "ic_postNotificationOnMainThreadAfterSaveWithName:", CFSTR("ICAttachmentDidChangePreferredSizeNotification"));

  }
}

void __46__ICAttachment_setMergeablePreferredViewSize___block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "postNotificationName:object:", CFSTR("ICAttachmentWillChangePreferredSizeNotification"), 0);

}

+ (id)mergeableWallClockValueKeyPaths
{
  void *v3;
  void *v4;
  objc_super v6;

  if (mergeableWallClockValueKeyPaths_onceToken != -1)
    dispatch_once(&mergeableWallClockValueKeyPaths_onceToken, &__block_literal_global_297);
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___ICAttachment;
  objc_msgSendSuper2(&v6, sel_mergeableWallClockValueKeyPaths);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setByAddingObjectsFromSet:", mergeableWallClockValueKeyPaths_ourSet);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void __47__ICAttachment_mergeableWallClockValueKeyPaths__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = (void *)MEMORY[0x1E0C99E60];
  NSStringFromSelector(sel_mergeablePreferredViewSize);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithObject:", v3);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)mergeableWallClockValueKeyPaths_ourSet;
  mergeableWallClockValueKeyPaths_ourSet = v1;

}

- (void)inlineFormFillingBannerWasDismissedByUser
{
  void *v3;
  id v4;

  -[ICCloudSyncingObject currentReplicaID](self, "currentReplicaID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  -[ICAttachment inlineFormFillingBannerWasDismissedByDeviceIdentifier:](self, "inlineFormFillingBannerWasDismissedByDeviceIdentifier:", v4);
}

- (void)inlineFormFillingBannerWasDismissedByDeviceIdentifier:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __70__ICAttachment_inlineFormFillingBannerWasDismissedByDeviceIdentifier___block_invoke;
  v6[3] = &unk_1E76CF730;
  v7 = v4;
  v5 = v4;
  -[ICAttachment updateAttachmentMetadataWithBlock:](self, "updateAttachmentMetadataWithBlock:", v6);

}

void __70__ICAttachment_inlineFormFillingBannerWasDismissedByDeviceIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  v3 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("inline_form_dismissal_count_by_device"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v4, "mutableCopy");

  v5 = v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v11 = v5;
  objc_msgSend(v5, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
    v7 = (void *)v6;
  else
    v7 = &unk_1E771A7C8;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v7, "unsignedIntValue") + 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v8, *(_QWORD *)(a1 + 32));
  v9 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("inline_form_dismissal_count_by_device"));

}

- (BOOL)shouldShowInlineFormFillingBanner
{
  return -[ICAttachment inlineFormFillingBannerDismissalCountForDevice](self, "inlineFormFillingBannerDismissalCountForDevice") < 3;
}

- (unint64_t)inlineFormFillingBannerDismissalCountForDevice
{
  void *v3;
  void *v4;
  unint64_t v5;

  -[ICCloudSyncingObject currentReplicaID](self, "currentReplicaID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[ICAttachment inlineFormFillingBannerDismissalCountForDeviceIdentifier:](self, "inlineFormFillingBannerDismissalCountForDeviceIdentifier:", v4);
  return v5;
}

- (unint64_t)inlineFormFillingBannerDismissalCountForDeviceIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;

  v4 = a3;
  -[ICAttachment inlineFormFillingDismissalCountForAllDevices](self, "inlineFormFillingDismissalCountForAllDevices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
      v9 = objc_msgSend(v7, "unsignedIntValue");
    else
      v9 = 0;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)inlineFormFillingDismissalCountForAllDevices
{
  void *v3;
  void *v4;
  void *v5;

  objc_opt_class();
  -[ICAttachment metadata](self, "metadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("inline_form_dismissal_count_by_device"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)cryptoStrategyProtocol
{
  return &unk_1EF524350;
}

- (id)parentEncryptableObject
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[ICAttachment note](self, "note");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[ICAttachment account](self, "account");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (BOOL)isEncryptableKeyBinaryData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  char v13;
  objc_super v15;
  _QWORD v16[5];

  v16[4] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!isEncryptableKeyBinaryData__keys)
  {
    v5 = (void *)MEMORY[0x1E0C99E60];
    NSStringFromSelector(sel_mergeableData);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v6;
    NSStringFromSelector(sel_markupModelData);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v16[1] = v7;
    NSStringFromSelector(sel_linkPresentationArchivedMetadata);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v16[2] = v8;
    NSStringFromSelector(sel_synapseData);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v16[3] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setWithArray:", v10);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)isEncryptableKeyBinaryData__keys;
    isEncryptableKeyBinaryData__keys = v11;

  }
  v15.receiver = self;
  v15.super_class = (Class)ICAttachment;
  if (-[ICCloudSyncingObject isEncryptableKeyBinaryData:](&v15, sel_isEncryptableKeyBinaryData_, v4))
    v13 = 1;
  else
    v13 = objc_msgSend((id)isEncryptableKeyBinaryData__keys, "containsObject:", v4);

  return v13;
}

- (void)deserializeAndMergeValues:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  char v7;
  id v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ICAttachment;
  -[ICCloudSyncingObject deserializeAndMergeValues:](&v9, sel_deserializeAndMergeValues_, a3);
  -[ICAttachment typeUTI](self, "typeUTI");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.notes.gallery")))
  {

  }
  else
  {
    -[ICAttachment parentAttachment](self, "parentAttachment");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "typeUTI");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.notes.gallery"));

    if ((v7 & 1) == 0)
      v8 = (id)-[ICAttachment ic_postNotificationOnMainThreadAfterSaveWithName:](self, "ic_postNotificationOnMainThreadAfterSaveWithName:", CFSTR("ICAttachmentDidLoadNotification"));
  }
}

- (id)mergeDecryptedValue:(id)a3 withOldValue:(id)a4 forKey:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  id v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (-[ICCloudSyncingObject needsToLoadDecryptedValues](self, "needsToLoadDecryptedValues")
    || (NSStringFromSelector(sel_mergeableData),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = objc_msgSend(v10, "isEqualToString:", v11),
        v11,
        !v12))
  {
    v21.receiver = self;
    v21.super_class = (Class)ICAttachment;
    -[ICCloudSyncingObject mergeDecryptedValue:withOldValue:forKey:](&v21, sel_mergeDecryptedValue_withOldValue_forKey_, v8, v9, v10);
    v15 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = v8;
      -[ICAttachment attachmentModel](self, "attachmentModel");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "mergeWithMergeableData:", v13);

    }
    else
    {
      v16 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        -[ICAttachment className](self, "className");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICAttachment identifier](self, "identifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v23 = v10;
        v24 = 2112;
        v25 = v17;
        v26 = 2112;
        v27 = v18;
        _os_log_impl(&dword_1BD918000, v16, OS_LOG_TYPE_INFO, "Trying to merge %@ for %@ (%@), but the data isn't NSData", buf, 0x20u);

      }
    }
    -[ICAttachment mergeableData](self, "mergeableData");
    v15 = objc_claimAutoreleasedReturnValue();
  }
  v19 = (void *)v15;

  return v19;
}

- (void)persistPendingChanges
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  objc_super v10;

  -[ICAttachment note](self, "note");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "modificationDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICAttachment attachmentModel](self, "attachmentModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "persistPendingChanges");

  -[ICAttachment saveMergeableDataIfNeeded](self, "saveMergeableDataIfNeeded");
  if (v4)
  {
    -[ICAttachment note](self, "note");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "modificationDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqual:", v4);

    if ((v8 & 1) == 0)
    {
      -[ICAttachment note](self, "note");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setModificationDate:", v4);

    }
  }
  v10.receiver = self;
  v10.super_class = (Class)ICAttachment;
  -[ICCloudSyncingObject persistPendingChanges](&v10, sel_persistPendingChanges);

}

- (void)clearDecryptedData
{
  objc_super v3;

  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[ICAttachment setCachedImage:](self, "setCachedImage:", 0);
  v3.receiver = self;
  v3.super_class = (Class)ICAttachment;
  -[ICCloudSyncingObject clearDecryptedData](&v3, sel_clearDecryptedData);
}

+ (BOOL)isTypeUTISupportedInExtensions:(id)a3
{
  return 1;
}

+ (BOOL)isPathExtensionSupportedForPasswordProtectedNotes:(id)a3
{
  void *v4;
  void *v5;

  if (!a3)
    return 0;
  objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithFilenameExtension:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(a1) = objc_msgSend(a1, "isTypeUTISupportedForPasswordProtectedNotes:", v5);
  return (char)a1;
}

- (BOOL)hasCroppingQuad
{
  void *v2;
  char v3;

  -[ICAttachment attachmentModel](self, "attachmentModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shouldCropImage");

  return v3;
}

- (void)setPreferredViewSize:(signed __int16)a3
{
  uint64_t v3;
  ICTTMergeableWallClockValue *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  ICTTMergeableWallClockValue *v10;

  v3 = a3;
  v5 = [ICTTMergeableWallClockValue alloc];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[ICTTMergeableWallClockValue initWithValue:timestamp:](v5, "initWithValue:timestamp:", v6, 0);

  NSStringFromSelector(sel_preferredViewSize);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAttachment willChangeValueForKey:](self, "willChangeValueForKey:", v7);

  -[ICTTMergeableWallClockValue serialize](v10, "serialize");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAttachment setMergeablePreferredViewSize:](self, "setMergeablePreferredViewSize:", v8);

  NSStringFromSelector(sel_preferredViewSize);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAttachment didChangeValueForKey:](self, "didChangeValueForKey:", v9);

  -[ICCloudSyncingObject updateUserSpecificChangeCountWithReason:](self, "updateUserSpecificChangeCountWithReason:", CFSTR("set a new preferred view size"));
}

- (void)resetPreferredViewSizeIfNecessary
{
  void *v3;
  uint64_t v4;
  ICTTMergeableWallClockValue *v5;
  void *v6;
  ICTTMergeableWallClockValue *v7;
  void *v8;
  ICTTMergeableWallClockValue *v9;
  void *v10;
  void *v11;
  void *v12;
  ICTTMergeableWallClockValue *v13;
  ICTTMergeableWallClockValue *v14;
  ICTTMergeableWallClockValue *v15;

  -[ICAttachment mergeablePreferredViewSize](self, "mergeablePreferredViewSize");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (v4)
  {
    v5 = [ICTTMergeableWallClockValue alloc];
    -[ICAttachment mergeablePreferredViewSize](self, "mergeablePreferredViewSize");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[ICTTMergeableWallClockValue initWithData:](v5, "initWithData:", v6);

    v7 = v14;
  }
  else
  {
    v7 = 0;
  }
  v15 = v7;
  -[ICTTMergeableWallClockValue value](v7, "value");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = -[ICTTMergeableWallClockValue initWithValue:timestamp:]([ICTTMergeableWallClockValue alloc], "initWithValue:timestamp:", 0, 0);

    NSStringFromSelector(sel_preferredViewSize);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAttachment willChangeValueForKey:](self, "willChangeValueForKey:", v10);

    -[ICTTMergeableWallClockValue serialize](v9, "serialize");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAttachment setMergeablePreferredViewSize:](self, "setMergeablePreferredViewSize:", v11);

    -[ICCloudSyncingObject updateUserSpecificChangeCountWithReason:](self, "updateUserSpecificChangeCountWithReason:", CFSTR("User reset preferredViewSize"));
    NSStringFromSelector(sel_preferredViewSize);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAttachment didChangeValueForKey:](self, "didChangeValueForKey:", v12);

    v13 = v9;
  }
  else
  {
    v13 = v15;
  }

}

+ (id)keyPathsForValuesAffectingParentCloudObject
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("parentAttachment.note"), 0);
}

+ (id)keyPathsForValuesAffectingIsSharedViaICloud
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___ICAttachment;
  objc_msgSendSuper2(&v5, sel_keyPathsForValuesAffectingIsSharedViaICloud);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  objc_msgSend(v3, "addObject:", CFSTR("self.parentAttachment.note"));
  objc_msgSend(v3, "addObject:", CFSTR("self.parentAttachment.note.isSharedViaICloud"));
  objc_msgSend(v3, "addObject:", CFSTR("self.note"));
  objc_msgSend(v3, "addObject:", CFSTR("self.note.isSharedViaICloud"));
  return v3;
}

- (id)childCloudObjectsForMinimumSupportedVersionPropagation
{
  id v3;
  uint64_t v4;
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

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[ICAttachment subAttachments](self, "subAttachments");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    -[ICAttachment media](self, "media");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[ICAttachment subAttachments](self, "subAttachments");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "allObjects");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObjectsFromArray:", v8);

LABEL_7:
      -[ICAttachment media](self, "media");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v10);
      goto LABEL_8;
    }
  }
  -[ICAttachment subAttachments](self, "subAttachments");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    -[ICAttachment media](self, "media");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
      goto LABEL_9;
    goto LABEL_7;
  }
  -[ICAttachment subAttachments](self, "subAttachments");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "allObjects");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v11);

LABEL_8:
LABEL_9:
  -[ICAttachment inlineAttachments](self, "inlineAttachments");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[ICAttachment inlineAttachments](self, "inlineAttachments");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "allObjects");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v15);

  }
  if (objc_msgSend(v3, "count"))
    v16 = (void *)objc_msgSend(v3, "copy");
  else
    v16 = 0;

  return v16;
}

- (void)setMarkedForDeletion:(BOOL)a3
{
  _BOOL8 v3;
  int v5;
  void *v6;
  objc_super v7;

  v3 = a3;
  v5 = -[ICAttachment markedForDeletion](self, "markedForDeletion");
  v7.receiver = self;
  v7.super_class = (Class)ICAttachment;
  -[ICCloudSyncingObject setMarkedForDeletion:](&v7, sel_setMarkedForDeletion_, v3);
  if (!v5 && v3)
  {
    -[ICAttachment paperBundleModel](self, "paperBundleModel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeStrokesFromStyleInventory");

  }
}

- (void)markForDeletion
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  if ((-[ICAttachment markedForDeletion](self, "markedForDeletion") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "postNotificationName:object:", CFSTR("ICAttachmentWillBeDeletedNotification"), self);

    v7.receiver = self;
    v7.super_class = (Class)ICAttachment;
    -[ICCloudSyncingObject markForDeletion](&v7, sel_markForDeletion);
    -[ICAttachment media](self, "media");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "markForDeletion");

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "postNotificationName:object:", CFSTR("ICAttachmentWasDeletedNotification"), self);

    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[ICAttachment notifyDocCamFrameworkAttachmentWasDeleted](self, "notifyDocCamFrameworkAttachmentWasDeleted");
    -[ICAttachment setHandwritingSummary:](self, "setHandwritingSummary:", 0);
    -[ICAttachment setAdditionalIndexableText:](self, "setAdditionalIndexableText:", 0);
    -[ICCloudSyncingObject modificationDate](self, "modificationDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAttachment setModificationDate:](self, "setModificationDate:", v6);

  }
}

- (void)unmarkForDeletion
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  if (-[ICAttachment markedForDeletion](self, "markedForDeletion"))
  {
    v6.receiver = self;
    v6.super_class = (Class)ICAttachment;
    -[ICCloudSyncingObject unmarkForDeletion](&v6, sel_unmarkForDeletion);
    -[ICAttachment media](self, "media");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "unmarkForDeletion");

    -[ICCloudSyncingObject modificationDate](self, "modificationDate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAttachment setModificationDate:](self, "setModificationDate:", v4);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "postNotificationName:object:", CFSTR("ICAttachmentWasUndeletedNotification"), self);

  }
}

- (id)previewItemURL
{
  void *v2;
  void *v3;

  -[ICAttachment attachmentModel](self, "attachmentModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "previewItemURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)previewItemTitle
{
  void *v2;
  void *v3;

  -[ICAttachment attachmentModel](self, "attachmentModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "previewItemTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)supportsQuickLook
{
  void *v2;
  char v3;

  -[ICAttachment attachmentModel](self, "attachmentModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "supportsQuickLook");

  return v3;
}

- (void)attachmentDidChange
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6(&dword_1BD918000, v0, v1, "No note set for attachment %@", v2);
  OUTLINED_FUNCTION_1_0();
}

- (BOOL)locationNeedsUpdate
{
  int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  if ((-[ICAttachment markedForDeletion](self, "markedForDeletion") & 1) != 0)
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    -[ICAttachment location](self, "location");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4 || -[ICAttachment checkedForLocation](self, "checkedForLocation"))
    {
      -[ICAttachment location](self, "location");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
      {
        -[ICAttachment location](self, "location");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v6, "placeUpdated") & 1) != 0)
        {
          LOBYTE(v3) = 0;
        }
        else
        {
          -[ICAttachment location](self, "location");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v3 = objc_msgSend(v7, "updatingPlace") ^ 1;

        }
      }
      else
      {
        LOBYTE(v3) = 0;
      }

    }
    else
    {
      LOBYTE(v3) = 1;
    }

  }
  return v3;
}

- (id)ic_loggingValues
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v10[5];
  id v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)ICAttachment;
  -[ICCloudSyncingObject ic_loggingValues](&v12, sel_ic_loggingValues);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[ICAttachment managedObjectContext](self, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __32__ICAttachment_ic_loggingValues__block_invoke;
  v10[3] = &unk_1E76C73B0;
  v10[4] = self;
  v6 = v4;
  v11 = v6;
  objc_msgSend(v5, "performBlockAndWait:", v10);

  v7 = v11;
  v8 = v6;

  return v8;
}

void __32__ICAttachment_ic_loggingValues__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  uint64_t v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;

  objc_msgSend(*(id *)(a1 + 32), "media");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "media");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v5, CFSTR("media"));

  }
  objc_msgSend(*(id *)(a1 + 32), "typeUTI");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
    v8 = (const __CFString *)v6;
  else
    v8 = CFSTR("nil");
  objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v8, CFSTR("type"));

  objc_msgSend(*(id *)(a1 + 32), "note");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "identifier");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v10)
    v12 = (const __CFString *)v10;
  else
    v12 = CFSTR("nil");
  objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v12, CFSTR("note"));

  objc_msgSend(*(id *)(a1 + 32), "creationDate");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  if (v13)
    v15 = (const __CFString *)v13;
  else
    v15 = CFSTR("nil");
  objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v15, CFSTR("creationDate"));

  objc_msgSend(*(id *)(a1 + 32), "modificationDate");
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v16;
  if (v16)
    v18 = (const __CFString *)v16;
  else
    v18 = CFSTR("nil");
  objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v18, CFSTR("modificationDate"));

  objc_msgSend(*(id *)(a1 + 32), "subAttachments");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "count");

  if (v20)
  {
    objc_msgSend(*(id *)(a1 + 32), "subAttachments");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "allObjects");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "valueForKey:", CFSTR("recordName"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v23, CFSTR("subAttachments"));

  }
  objc_msgSend(*(id *)(a1 + 32), "inlineAttachments");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "count");

  if (v25)
  {
    objc_msgSend(*(id *)(a1 + 32), "inlineAttachments");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "allObjects");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "valueForKey:", CFSTR("recordName"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v28, CFSTR("attachments"));

  }
  objc_msgSend(*(id *)(a1 + 32), "noteUsingTitleForNoteTitle");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    objc_msgSend(*(id *)(a1 + 32), "noteUsingTitleForNoteTitle");
    v31 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "identifier");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v30, CFSTR("noteUsingTitleForNoteTitle"));

  }
}

- (BOOL)isSettingMergeableData
{
  return self->settingMergeableData;
}

- (void)setSettingMergeableData:(BOOL)a3
{
  self->settingMergeableData = a3;
}

- (ICAssetGenerationManager)fallbackImageGenerationManager
{
  return self->_fallbackImageGenerationManager;
}

- (ICAssetGenerationManager)fallbackPDFGenerationManager
{
  return self->_fallbackPDFGenerationManager;
}

- (BOOL)suppressesFileDeletion
{
  return self->suppressesFileDeletion;
}

- (void)setSuppressesFileDeletion:(BOOL)a3
{
  self->suppressesFileDeletion = a3;
}

- (void)setURL:(id)a3
{
  objc_storeStrong((id *)&self->_URL, a3);
}

+ (void)deleteAttachment:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v4 = a3;
  objc_opt_class();
  ICCheckedDynamicCast();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "attachmentModel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "willMarkAttachmentForDeletion");

    objc_msgSend(v6, "attachmentModel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "deleteChildAttachments");

    objc_msgSend(v6, "media");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[ICMedia deleteMedia:](ICMedia, "deleteMedia:", v9);

    objc_msgSend(v6, "deleteAttachmentPreviewImages");
  }
  v10.receiver = a1;
  v10.super_class = (Class)&OBJC_METACLASS___ICAttachment;
  objc_msgSendSuper2(&v10, sel_deleteAttachment_, v4);

}

+ (void)undeleteAttachment:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___ICAttachment;
  v3 = a3;
  objc_msgSendSuper2(&v7, sel_undeleteAttachment_, v3);
  objc_opt_class();
  ICCheckedDynamicCast();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v4, "media", v7.receiver, v7.super_class);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[ICMedia undeleteMedia:](ICMedia, "undeleteMedia:", v5);

    objc_msgSend(v4, "undeleteAttachmentPreviewImages");
    objc_msgSend(v4, "attachmentModel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "undeleteChildAttachments");

  }
}

+ (void)purgeAttachment:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = a3;
  objc_opt_class();
  ICCheckedDynamicCast();
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "postNotificationName:object:", CFSTR("ICAttachmentWillBeDeletedNotification"), v7);

    objc_msgSend(v7, "managedObjectContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "deleteObject:", v7);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "postNotificationName:object:", CFSTR("ICAttachmentWasDeletedNotification"), v7);

    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v7, "notifyDocCamFrameworkAttachmentWasDeleted");
  }

}

+ (id)allAttachmentsInContext:(id)a3
{
  return (id)objc_msgSend(a1, "attachmentsMatchingPredicate:context:", 0, a3);
}

+ (void)enumerateAttachmentsInContext:(id)a3 batchSize:(unint64_t)a4 visibleOnly:(BOOL)a5 saveAfterBatch:(BOOL)a6 usingBlock:(id)a7
{
  _BOOL8 v8;
  _BOOL4 v9;
  id v12;
  void *v13;
  id v14;

  v8 = a6;
  v9 = a5;
  v14 = a3;
  v12 = a7;
  if (v9)
  {
    objc_msgSend(a1, "predicateForVisibleAttachmentsInContext:", v14);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }
  objc_msgSend(a1, "ic_enumerateObjectsMatchingPredicate:sortDescriptors:relationshipKeyPathsForPrefetching:context:batchSize:saveAfterBatch:usingBlock:", v13, 0, 0, v14, a4, v8, v12);

}

+ (id)attachmentTypeUTIsToHideFromAttachmentBrowser
{
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("com.apple.notes.sketch");
  v3[1] = CFSTR("com.apple.notes.table");
  v3[2] = CFSTR("com.apple.drawing");
  v3[3] = CFSTR("com.apple.drawing.2");
  v3[4] = CFSTR("com.apple.paper");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 5);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)predicateForAttachmentBrowserWithContext:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  id v11;

  v4 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __69__ICAttachment_Management__predicateForAttachmentBrowserWithContext___block_invoke;
  v9[3] = &unk_1E76CAB58;
  v10 = v4;
  v11 = a1;
  v5 = predicateForAttachmentBrowserWithContext__onceToken;
  v6 = v4;
  if (v5 != -1)
    dispatch_once(&predicateForAttachmentBrowserWithContext__onceToken, v9);
  v7 = (id)predicateForAttachmentBrowserWithContext__predicate;

  return v7;
}

void __69__ICAttachment_Management__predicateForAttachmentBrowserWithContext___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[4];

  v10[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 40), "predicateForPasswordProtected:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v2;
  v3 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(*(id *)(a1 + 40), "attachmentTypeUTIsToHideFromAttachmentBrowser");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "predicateWithFormat:", CFSTR("NOT (typeUTI in %@)"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v5;
  objc_msgSend(*(id *)(a1 + 40), "predicateForVisibleAttachmentsInContext:", *(_QWORD *)(a1 + 32));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v7);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)predicateForAttachmentBrowserWithContext__predicate;
  predicateForAttachmentBrowserWithContext__predicate = v8;

}

+ (id)predicateForUnsupportedAttachmentsInContext:(id)a3
{
  return +[ICUnsupportedObjectPredicateHelper predicateForSupportedAttachmentsInContext:](ICUnsupportedObjectPredicateHelper, "predicateForSupportedAttachmentsInContext:", a3);
}

+ (id)predicateForSearchableAttachmentsInContext:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  id v15;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __71__ICAttachment_Management__predicateForSearchableAttachmentsInContext___block_invoke;
  v14 = &__block_descriptor_40_e5_v8__0l;
  v15 = a1;
  v4 = predicateForSearchableAttachmentsInContext__onceToken;
  v5 = a3;
  if (v4 != -1)
    dispatch_once(&predicateForSearchableAttachmentsInContext__onceToken, &v11);
  v6 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(a1, "predicateForUnsupportedAttachmentsInContext:", v5, v11, v12, v13, v14, v15, predicateForSearchableAttachmentsInContext__predicate);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v16[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "andPredicateWithSubpredicates:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

void __71__ICAttachment_Management__predicateForSearchableAttachmentsInContext___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "predicateForVisibleObjects");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v2;
  objc_msgSend(*(id *)(a1 + 32), "predicateForPasswordProtected:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)predicateForSearchableAttachmentsInContext__predicate;
  predicateForSearchableAttachmentsInContext__predicate = v5;

}

+ (id)predicateForVisibleAttachmentsWithTypeUTI:(id)a3 inContext:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v6 = (void *)MEMORY[0x1E0CB3880];
  v7 = a4;
  objc_msgSend(v6, "predicateWithFormat:", CFSTR("typeUTI == %@"), a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "predicateForVisibleAttachmentsInContext:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0CB3528];
  v14[0] = v8;
  v14[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "andPredicateWithSubpredicates:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)predicateForPasswordProtected:(BOOL)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "predicateWithFormat:", CFSTR("isPasswordProtected == %@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)predicateForInlineDrawing
{
  if (predicateForInlineDrawing_onceToken != -1)
    dispatch_once(&predicateForInlineDrawing_onceToken, &__block_literal_global_813);
  return (id)predicateForInlineDrawing_predicate;
}

void __53__ICAttachment_Management__predicateForInlineDrawing__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("typeUTI == %@ || typeUTI == %@"), CFSTR("com.apple.drawing.2"), CFSTR("com.apple.drawing"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)predicateForInlineDrawing_predicate;
  predicateForInlineDrawing_predicate = v0;

}

+ (NSPredicate)predicateForOutdatedOrMissingHandwritingSummary
{
  if (predicateForOutdatedOrMissingHandwritingSummary_onceToken != -1)
    dispatch_once(&predicateForOutdatedOrMissingHandwritingSummary_onceToken, &__block_literal_global_816);
  return (NSPredicate *)(id)predicateForOutdatedOrMissingHandwritingSummary_predicate;
}

void __75__ICAttachment_Management__predicateForOutdatedOrMissingHandwritingSummary__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("handwritingSummary == nil"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("handwritingSummaryVersion < %d"), 8, v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "orPredicateWithSubpredicates:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)predicateForOutdatedOrMissingHandwritingSummary_predicate;
  predicateForOutdatedOrMissingHandwritingSummary_predicate = v4;

}

+ (NSPredicate)predicateForAllPaperKitBackedAttachments
{
  if (predicateForAllPaperKitBackedAttachments_onceToken != -1)
    dispatch_once(&predicateForAllPaperKitBackedAttachments_onceToken, &__block_literal_global_821);
  return (NSPredicate *)(id)predicateForAllPaperKitBackedAttachments_predicate;
}

void __68__ICAttachment_Management__predicateForAllPaperKitBackedAttachments__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = (void *)MEMORY[0x1E0CB3880];
  ICPaperKitBackedAttachmentUTTypes();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "predicateWithFormat:", CFSTR("typeUTI IN %@"), v3);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)predicateForAllPaperKitBackedAttachments_predicate;
  predicateForAllPaperKitBackedAttachments_predicate = v1;

}

+ (id)newFetchRequestForAttachments
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", CFSTR("ICAttachment"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("modificationDate"), 0);
  v6[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSortDescriptors:", v4);

  return v2;
}

+ (unint64_t)countOfAttachmentsMatchingPredicate:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unint64_t v9;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(a1, "newFetchRequestForAttachments");
  objc_msgSend(v8, "setPredicate:", v7);

  v9 = objc_msgSend(v6, "countForFetchRequest:error:", v8, 0);
  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
    v9 = 0;

  return v9;
}

- (void)recursivelyAddSubAttachments:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[ICAttachment subAttachments](self, "subAttachments", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v4, "addObject:", v11);
        objc_msgSend(v11, "recursivelyAddSubAttachments:", v4);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

}

+ (id)fallbackImageUTI
{
  return (id)objc_msgSend((id)*MEMORY[0x1E0CEC580], "identifier");
}

- (id)fallbackImageEncryptedURL
{
  void *v2;
  void *v3;

  -[ICAttachment fallbackImageURL](self, "fallbackImageURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathExtension:", CFSTR("encrypted"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)fallbackImageData
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;

  if (-[ICAttachment isPasswordProtected](self, "isPasswordProtected"))
  {
    -[ICCloudSyncingObject cryptoStrategy](self, "cryptoStrategy");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "decryptedFallbackImageData");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[ICAttachment fallbackImageURL](self, "fallbackImageURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v6 = (void *)MEMORY[0x1E0C99D50];
      -[ICAttachment fallbackImageURL](self, "fallbackImageURL");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "dataWithContentsOfURL:", v7);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v8 = os_log_create("com.apple.notes", "CoreData");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[ICAttachment(Management) fallbackImageData].cold.1(self);

      v4 = 0;
    }
  }
  return v4;
}

- (BOOL)writeFallbackImageData:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  char v12;
  os_log_t v13;
  char v14;
  void *v16;
  void *v17;
  int v18;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = os_log_create("com.apple.notes", "CoreData");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[ICCloudSyncingObject shortLoggingDescription](self, "shortLoggingDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ic_sha256");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138413058;
    v20 = v6;
    v21 = 2112;
    v23 = 2080;
    v22 = v7;
    v24 = "-[ICAttachment(Management) writeFallbackImageData:]";
    v25 = 1024;
    v26 = 2652;
    _os_log_impl(&dword_1BD918000, v5, OS_LOG_TYPE_DEFAULT, "Writing fallback image data… {attachment: %@, data.sha256: %@}%s:%d", (uint8_t *)&v19, 0x26u);

  }
  -[ICAttachment(Management) fallbackImageGenerationManager](self, "fallbackImageGenerationManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[ICAttachment(Management) fallbackImageGenerationManager](self, "fallbackImageGenerationManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "beginGeneration");

    if ((v10 & 1) != 0)
    {
      if (-[ICAttachment isPasswordProtected](self, "isPasswordProtected"))
      {
        -[ICCloudSyncingObject cryptoStrategy](self, "cryptoStrategy");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "writeEncryptedFallbackImageData:", v4);

        if ((v12 & 1) == 0)
        {
LABEL_18:
          -[ICAttachment(Management) fallbackImageGenerationManager](self, "fallbackImageGenerationManager");
          v13 = (os_log_t)objc_claimAutoreleasedReturnValue();
          -[NSObject rollbackGeneration](v13, "rollbackGeneration");
          goto LABEL_13;
        }
      }
      else
      {
        -[ICAttachment fallbackImageURL](self, "fallbackImageURL");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          -[ICAttachment fallbackImageURL](self, "fallbackImageURL");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v4, "writeToURL:atomically:", v17, 1);

          if (!v18)
            goto LABEL_18;
        }
      }
      -[ICAttachment(Management) fallbackImageGenerationManager](self, "fallbackImageGenerationManager");
      v13 = (os_log_t)objc_claimAutoreleasedReturnValue();
      v14 = -[NSObject commitGeneration](v13, "commitGeneration");
      goto LABEL_14;
    }
    v13 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[ICAttachment(Management) writeFallbackImageData:].cold.2(self);
  }
  else
  {
    v13 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[ICAttachment(Management) writeFallbackImageData:].cold.1(self);
  }

LABEL_13:
  v14 = 0;
LABEL_14:

  return v14;
}

+ (id)fallbackPDFUTI
{
  return (id)objc_msgSend((id)*MEMORY[0x1E0CEC570], "identifier");
}

+ (id)fallbackPDFContainerURLForIdentifier:(id)a3 account:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  objc_msgSend(a4, "fallbackPDFDirectoryURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLByAppendingPathComponent:isDirectory:", v5, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)fallbackPDFFallbackURLForIdentifier:(id)a3 account:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  objc_msgSend(a4, "fallbackPDFDirectoryURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URLByAppendingPathComponent:isDirectory:", v6, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "fallbackPDFUTI");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "pathExtension");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "URLByAppendingPathExtension:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)fallbackPDFEncryptedFallbackURLForIdentifier:(id)a3 account:(id)a4
{
  void *v4;
  void *v5;

  objc_msgSend(a1, "fallbackPDFFallbackURLForIdentifier:account:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLByAppendingPathExtension:", CFSTR("encrypted"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)fallbackPDFURL
{
  void *v3;
  void *v4;
  id v5;
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

  -[ICAttachment account](self, "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[ICAttachment note](self, "note");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "account");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v5 = v7;
    }
    else
    {
      -[ICAttachment note](self, "note");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "folder");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "account");
      v5 = (id)objc_claimAutoreleasedReturnValue();

    }
  }

  -[ICAttachment identifier](self, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = 0;
  if (v11 && v5)
  {
    -[ICAttachment(Management) fallbackPDFGenerationManager](self, "fallbackPDFGenerationManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "generationURL");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      -[ICAttachment(Management) fallbackPDFGenerationManager](self, "fallbackPDFGenerationManager");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "generationURL");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "URLByAppendingPathComponent:isDirectory:", CFSTR("FallbackPDF"), 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend((id)objc_opt_class(), "fallbackPDFUTI");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "pathExtension");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "URLByAppendingPathExtension:", v19);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v20 = (void *)objc_opt_class();
      -[ICAttachment identifier](self, "identifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "fallbackPDFFallbackURLForIdentifier:account:", v17, v5);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  return v12;
}

- (id)fallbackPDFEncryptedURL
{
  void *v2;
  void *v3;

  -[ICAttachment fallbackPDFURL](self, "fallbackPDFURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathExtension:", CFSTR("encrypted"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)hasFallbackPDF
{
  void *v3;
  char v4;

  if ((-[ICAttachment isPasswordProtected](self, "isPasswordProtected") & 1) != 0)
    -[ICAttachment fallbackPDFEncryptedURL](self, "fallbackPDFEncryptedURL");
  else
    -[ICAttachment fallbackPDFURL](self, "fallbackPDFURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "ic_isReachable");

  return v4;
}

- (id)fallbackPDFData
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;

  if (-[ICAttachment isPasswordProtected](self, "isPasswordProtected"))
  {
    -[ICCloudSyncingObject cryptoStrategy](self, "cryptoStrategy");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "decryptedFallbackPDFData");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[ICAttachment fallbackPDFURL](self, "fallbackPDFURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v6 = (void *)MEMORY[0x1E0C99D50];
      -[ICAttachment fallbackPDFURL](self, "fallbackPDFURL");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "dataWithContentsOfURL:", v7);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v8 = os_log_create("com.apple.notes", "CoreData");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[ICAttachment(Management) fallbackPDFData].cold.1(self);

      v4 = 0;
    }
  }
  return v4;
}

- (BOOL)writeFallbackPDFData:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  char v12;
  os_log_t v13;
  char v14;
  void *v16;
  void *v17;
  int v18;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = os_log_create("com.apple.notes", "CoreData");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[ICCloudSyncingObject shortLoggingDescription](self, "shortLoggingDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ic_sha256");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138413058;
    v20 = v6;
    v21 = 2112;
    v23 = 2080;
    v22 = v7;
    v24 = "-[ICAttachment(Management) writeFallbackPDFData:]";
    v25 = 1024;
    v26 = 2760;
    _os_log_impl(&dword_1BD918000, v5, OS_LOG_TYPE_DEFAULT, "Writing fallback PDF data… {attachment: %@, data.sha256: %@}%s:%d", (uint8_t *)&v19, 0x26u);

  }
  -[ICAttachment(Management) fallbackPDFGenerationManager](self, "fallbackPDFGenerationManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[ICAttachment(Management) fallbackPDFGenerationManager](self, "fallbackPDFGenerationManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "beginGeneration");

    if ((v10 & 1) != 0)
    {
      if (-[ICAttachment isPasswordProtected](self, "isPasswordProtected"))
      {
        -[ICCloudSyncingObject cryptoStrategy](self, "cryptoStrategy");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "writeEncryptedFallbackPDFData:", v4);

        if ((v12 & 1) == 0)
        {
LABEL_18:
          -[ICAttachment(Management) fallbackPDFGenerationManager](self, "fallbackPDFGenerationManager");
          v13 = (os_log_t)objc_claimAutoreleasedReturnValue();
          -[NSObject rollbackGeneration](v13, "rollbackGeneration");
          goto LABEL_13;
        }
      }
      else
      {
        -[ICAttachment fallbackPDFURL](self, "fallbackPDFURL");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          -[ICAttachment fallbackPDFURL](self, "fallbackPDFURL");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v4, "writeToURL:atomically:", v17, 1);

          if (!v18)
            goto LABEL_18;
        }
      }
      -[ICAttachment(Management) fallbackPDFGenerationManager](self, "fallbackPDFGenerationManager");
      v13 = (os_log_t)objc_claimAutoreleasedReturnValue();
      v14 = -[NSObject commitGeneration](v13, "commitGeneration");
      goto LABEL_14;
    }
    v13 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[ICAttachment(Management) writeFallbackPDFData:].cold.2(self);
  }
  else
  {
    v13 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[ICAttachment(Management) writeFallbackPDFData:].cold.1(self);
  }

LABEL_13:
  v14 = 0;
LABEL_14:

  return v14;
}

- (id)paperBundleURL
{
  void *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__54;
  v11 = __Block_byref_object_dispose__54;
  v12 = 0;
  -[ICAttachment managedObjectContext](self, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __42__ICAttachment_Management__paperBundleURL__block_invoke;
  v6[3] = &unk_1E76C7730;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v3, "performBlockAndWait:", v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __42__ICAttachment_Management__paperBundleURL__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "note");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "account");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "note");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "folder");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "account");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  +[ICAttachmentPaperBundleModel paperBundleURLForAttachmentIdentifier:inAccount:](ICAttachmentPaperBundleModel, "paperBundleURLForAttachmentIdentifier:inAccount:", v10, v6);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  if (!v5)
  {

  }
}

- (id)paperBundleDatabaseSubdirectoryURL
{
  void *v2;
  void *v3;

  -[ICAttachment paperBundleURL](self, "paperBundleURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICSystemPaperDocument databaseDirectoryAt:](_TtC11NotesShared21ICSystemPaperDocument, "databaseDirectoryAt:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)paperBundleAssetsSubdirectoryURL
{
  void *v2;
  void *v3;

  -[ICAttachment paperBundleURL](self, "paperBundleURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICSystemPaperDocument assetsDirectoryAt:](_TtC11NotesShared21ICSystemPaperDocument, "assetsDirectoryAt:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)temporaryPaperBundleURLForIdentifier:(id)a3 account:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;

  v5 = a3;
  v6 = a4;
  if (v6)
  {
    if (v5)
    {
LABEL_3:
      objc_msgSend(v6, "systemPaperTemporaryDirectoryURL");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "URLByAppendingPathComponent:isDirectory:", v5, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "URLByAppendingPathExtension:", CFSTR("bundle"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_8;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((account) != nil)", "+[ICAttachment(Management) temporaryPaperBundleURLForIdentifier:account:]", 1, 0, CFSTR("Expected non-nil value for '%s'"), "account");
    if (v5)
      goto LABEL_3;
  }
  v10 = os_log_create("com.apple.notes", "CoreData");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    +[ICAttachment(Management) temporaryPaperBundleURLForIdentifier:account:].cold.1(v10);

  v9 = 0;
LABEL_8:

  return v9;
}

- (id)paperCoherenceContextURL
{
  void *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__54;
  v11 = __Block_byref_object_dispose__54;
  v12 = 0;
  -[ICAttachment managedObjectContext](self, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __52__ICAttachment_Management__paperCoherenceContextURL__block_invoke;
  v6[3] = &unk_1E76C7730;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v3, "performBlockAndWait:", v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __52__ICAttachment_Management__paperCoherenceContextURL__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;

  objc_msgSend(*(id *)(a1 + 32), "note");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "paperCoherenceContextURL");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  if (objc_msgSend(*(id *)(a1 + 32), "isPasswordProtected"))
  {
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "length");

    if (v7)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "URLByDeletingLastPathComponent");
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v10 = *(void **)(v9 + 40);
      *(_QWORD *)(v9 + 40) = v8;

      v11 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      objc_msgSend(*(id *)(a1 + 32), "identifier");
      v15 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "URLByAppendingPathComponent:isDirectory:", v15, 1);
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v14 = *(void **)(v13 + 40);
      *(_QWORD *)(v13 + 40) = v12;

    }
  }
}

- (id)temporaryPaperBundleURL
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;

  if (-[ICAttachment attachmentType](self, "attachmentType") != 6
    && -[ICAttachment attachmentType](self, "attachmentType") != 11)
  {
    v10 = 0;
    return v10;
  }
  -[ICAttachment identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAttachment note](self, "note");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "account");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    -[ICAttachment note](self, "note");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "folder");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "account");
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (objc_msgSend(v3, "length"))
  {
    if (v7)
      goto LABEL_8;
LABEL_11:
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "account", "-[ICAttachment(Management) temporaryPaperBundleURL]", 1, 1, CFSTR("account is nil"));
    goto LABEL_12;
  }
  objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "identifier.length", "-[ICAttachment(Management) temporaryPaperBundleURL]", 1, 1, CFSTR("identifier is empty"));
  if (!v7)
    goto LABEL_11;
LABEL_8:
  if (!v3)
  {
LABEL_12:
    v11 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[ICAttachment(Management) temporaryPaperBundleURL].cold.1();

    v10 = 0;
    goto LABEL_15;
  }
  objc_msgSend((id)objc_opt_class(), "temporaryPaperBundleURLForIdentifier:account:", v3, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_15:

  return v10;
}

- (void)removeTemporaryPaperBundle
{
  void *v3;
  id v4;
  id *v5;
  NSObject *v6;
  void *v7;
  _QWORD v8[6];
  id obj;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  _QWORD v15[4];
  id v16;
  _BYTE v17[24];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[ICAttachment temporaryPaperBundleURL](self, "temporaryPaperBundleURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v14 = 0;
    v15[0] = &v14;
    v15[1] = 0x3032000000;
    v15[2] = __Block_byref_object_copy__54;
    v15[3] = __Block_byref_object_dispose__54;
    v16 = 0;
    v10 = 0;
    v11 = &v10;
    v12 = 0x2020000000;
    v13 = 0;
    v4 = objc_alloc_init(MEMORY[0x1E0CB3600]);
    v5 = (id *)(v15[0] + 40);
    obj = *(id *)(v15[0] + 40);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __54__ICAttachment_Management__removeTemporaryPaperBundle__block_invoke;
    v8[3] = &unk_1E76C84E0;
    v8[4] = &v10;
    v8[5] = &v14;
    objc_msgSend(v4, "coordinateWritingItemAtURL:options:error:byAccessor:", v3, 1, &obj, v8);
    objc_storeStrong(v5, obj);
    if (!*((_BYTE *)v11 + 24))
    {
      v6 = os_log_create("com.apple.notes", "CoreData");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        -[ICCloudSyncingObject shortLoggingDescription](self, "shortLoggingDescription");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICAttachment(Management) removeTemporaryPaperBundle].cold.1(v7, (uint64_t)v15, (uint64_t)v17, v6);
      }

    }
    _Block_object_dispose(&v10, 8);
    _Block_object_dispose(&v14, 8);

  }
}

void __54__ICAttachment_Management__removeTemporaryPaperBundle__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  char v7;
  id obj;

  v3 = (void *)MEMORY[0x1E0CB3620];
  v4 = a2;
  objc_msgSend(v3, "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  obj = *(id *)(v6 + 40);
  v7 = objc_msgSend(v5, "removeItemAtURL:error:", v4, &obj);

  objc_storeStrong((id *)(v6 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v7;

}

- (void)addLocationIfNeeded
{
  void *v3;
  id v4;

  -[ICAttachment location](self, "location");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    if ((-[ICAttachment checkedForLocation](self, "checkedForLocation") & 1) != 0)
      return;
    -[ICAttachment setCheckedForLocation:](self, "setCheckedForLocation:", 1);
    -[ICAttachment attachmentModel](self, "attachmentModel");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addLocation");
    v3 = v4;
  }

}

- (id)addLocationWithLatitude:(double)a3 longitude:(double)a4
{
  id v7;
  void *v8;
  void *v9;

  v7 = +[ICAttachmentLocation newAttachmentLocationForAttachment:](ICAttachmentLocation, "newAttachmentLocationForAttachment:", self);
  -[ICAttachment setLocation:](self, "setLocation:", v7);

  -[ICAttachment location](self, "location");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setLatitude:", a3);

  -[ICAttachment location](self, "location");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setLongitude:", a4);

  return (id)-[ICAttachment location](self, "location");
}

- (void)regenerateTitle
{
  -[ICAttachment regenerateTitleWithInferredTitle:](self, "regenerateTitleWithInferredTitle:", 0);
}

- (void)regenerateTitleWithInferredTitle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v4 = a3;
  -[ICAttachment userTitle](self, "userTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v18 = 0;
    v19 = &v18;
    v20 = 0x3032000000;
    v21 = __Block_byref_object_copy__54;
    v22 = __Block_byref_object_dispose__54;
    v23 = v4;
    if (!v19[5] && -[ICAttachment attachmentType](self, "attachmentType") == 11)
    {
      objc_opt_class();
      -[ICAttachment attachmentModel](self, "attachmentModel");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      ICDynamicCast();
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __61__ICAttachment_Management__regenerateTitleWithInferredTitle___block_invoke;
      v17[3] = &unk_1E76CF840;
      v17[4] = &v18;
      objc_msgSend(v7, "enumerateSubAttachmentsWithBlock:", v17);

    }
    if (v19[5]
      || (+[ICAttachment defaultTitleForAttachmentType:](ICAttachment, "defaultTitleForAttachmentType:", -[ICAttachment attachmentType](self, "attachmentType")), v8 = objc_claimAutoreleasedReturnValue(), v9 = (void *)v19[5], v19[5] = v8, v9, v19[5]))
    {
      -[ICAttachment title](self, "title");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isEqualToString:", v19[5]);

      if ((v11 & 1) == 0)
      {
        -[ICAttachment setTitle:](self, "setTitle:", v19[5]);
        -[ICCloudSyncingObject updateChangeCountWithReason:](self, "updateChangeCountWithReason:", CFSTR("Regenerated attachment title"));
        -[ICAttachment note](self, "note");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "regenerateTitle:snippet:", 1, 1);

        if (v13)
        {
          -[ICAttachment note](self, "note");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "markShareDirtyIfNeededWithReason:", CFSTR("Regenerated attachment title"));

          -[ICAttachment note](self, "note");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "updateChangeCountWithReason:", CFSTR("Regenerated attachment title"));

        }
        -[ICAttachment managedObjectContext](self, "managedObjectContext");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "ic_save");

      }
    }
    _Block_object_dispose(&v18, 8);

  }
}

void __61__ICAttachment_Management__regenerateTitleWithInferredTitle___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  void *v7;
  void *v8;
  uint64_t v9;
  id obj;

  objc_msgSend(a2, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    obj = v7;
    v9 = objc_msgSend(v7, "length");
    v8 = obj;
    if (v9)
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), obj);
      v8 = obj;
      *a5 = 1;
    }
  }

}

- (void)updatePlaceInLocationIfNeededHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  ICAttachment *v17;
  id v18;

  v4 = a3;
  -[ICAttachment addLocationIfNeeded](self, "addLocationIfNeeded");
  -[ICAttachment location](self, "location");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5 || (objc_msgSend(v5, "placeUpdated") & 1) != 0 || (objc_msgSend(v6, "updatingPlace") & 1) != 0)
  {
    if (v4)
      (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, 0, 0);
  }
  else
  {
    -[ICAttachment managedObjectContext](self, "managedObjectContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setUpdatingPlace:", 1);
    +[ICLocationContext sharedContext](ICLocationContext, "sharedContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "latitude");
    v10 = v9;
    objc_msgSend(v6, "longitude");
    v12 = v11;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __65__ICAttachment_Management__updatePlaceInLocationIfNeededHandler___block_invoke;
    v14[3] = &unk_1E76CF868;
    v15 = v7;
    v16 = v6;
    v17 = self;
    v18 = v4;
    v13 = v7;
    objc_msgSend(v8, "lookupPlaceAtLatitude:longitude:handler:", v14, v10, v12);

  }
}

void __65__ICAttachment_Management__updatePlaceInLocationIfNeededHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  id v16;

  v5 = a2;
  v6 = a3;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __65__ICAttachment_Management__updatePlaceInLocationIfNeededHandler___block_invoke_2;
  v11[3] = &unk_1E76CDD08;
  v12 = v6;
  v7 = *(void **)(a1 + 32);
  v13 = *(id *)(a1 + 40);
  v14 = v5;
  v8 = *(void **)(a1 + 56);
  v15 = *(_QWORD *)(a1 + 48);
  v16 = v8;
  v9 = v5;
  v10 = v6;
  objc_msgSend(v7, "performBlock:", v11);

}

uint64_t __65__ICAttachment_Management__updatePlaceInLocationIfNeededHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  if (!*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 40), "setPlacemark:", *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 40), "setPlaceUpdated:", 1);
    objc_msgSend(*(id *)(a1 + 56), "updateChangeCountWithReason:", CFSTR("Updated placemark"));
  }
  objc_msgSend(*(id *)(a1 + 40), "setUpdatingPlace:", 0);
  result = *(_QWORD *)(a1 + 64);
  if (result)
    return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, *(_QWORD *)(a1 + 32) == 0);
  return result;
}

- (void)noteWillMoveToRecentlyDeletedFolder
{
  id v2;

  -[ICAttachment paperBundleModel](self, "paperBundleModel");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeStrokesFromStyleInventory");

}

- (id)addInlineAttachmentWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;

  v4 = a3;
  -[ICAttachment note](self, "note");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = +[ICBaseAttachment newAttachmentWithIdentifier:note:](ICInlineAttachment, "newAttachmentWithIdentifier:note:", v4, v5);

  -[ICAttachment addInlineAttachmentsObject:](self, "addInlineAttachmentsObject:", v6);
  -[ICAttachment note](self, "note");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addInlineAttachmentsObject:", v6);

  return v6;
}

- (void)updateAfterMediaChange
{
  id v2;

  -[ICAttachment attachmentModel](self, "attachmentModel");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateFileBasedAttributes");

}

- (id)addMediaWithData:(id)a3 filename:(id)a4
{
  return -[ICAttachment addMediaWithData:filename:updateFileBasedAttributes:](self, "addMediaWithData:filename:updateFileBasedAttributes:", a3, a4, 1);
}

- (id)addMediaWithData:(id)a3 filename:(id)a4 updateFileBasedAttributes:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  BOOL v8;
  uint64_t v10;

  v5 = a5;
  v10 = 0;
  v7 = +[ICMedia newMediaWithAttachment:forData:filename:error:](ICMedia, "newMediaWithAttachment:forData:filename:error:", self, a3, a4, &v10);
  if (v10)
    v8 = 1;
  else
    v8 = !v5;
  if (!v8)
    -[ICAttachment updateAfterMediaChange](self, "updateAfterMediaChange");
  -[ICAttachment setMedia:](self, "setMedia:", v7);
  objc_msgSend(v7, "setAttachment:", self);
  return v7;
}

- (id)addMediaWithFileWrapper:(id)a3
{
  id v4;
  uint64_t v6;

  v6 = 0;
  v4 = +[ICMedia newMediaWithAttachment:forFileWrapper:error:](ICMedia, "newMediaWithAttachment:forFileWrapper:error:", self, a3, &v6);
  if (!v6)
    -[ICAttachment updateAfterMediaChange](self, "updateAfterMediaChange");
  -[ICAttachment setMedia:](self, "setMedia:", v4);
  objc_msgSend(v4, "setAttachment:", self);
  return v4;
}

- (id)addMediaWithURL:(id)a3
{
  return -[ICAttachment addMediaWithURL:updateFileBasedAttributes:](self, "addMediaWithURL:updateFileBasedAttributes:", a3, 1);
}

- (id)addMediaWithURL:(id)a3 updateFileBasedAttributes:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  BOOL v7;
  uint64_t v9;

  v4 = a4;
  v9 = 0;
  v6 = +[ICMedia newMediaWithAttachment:forURL:error:](ICMedia, "newMediaWithAttachment:forURL:error:", self, a3, &v9);
  if (v9)
    v7 = 1;
  else
    v7 = !v4;
  if (!v7)
    -[ICAttachment updateAfterMediaChange](self, "updateAfterMediaChange");
  -[ICAttachment setMedia:](self, "setMedia:", v6);
  objc_msgSend(v6, "setAttachment:", self);
  return v6;
}

- (BOOL)hasAnyPNGPreviewImageFiles
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[ICAttachment previewImages](self, "previewImages", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v3);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * i), "hasAnyPNGPreviewImageFiles") & 1) != 0)
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return v4;
}

- (void)deleteAttachmentPreviewImages
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[ICAttachment previewImages](self, "previewImages", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8++), "markForDeletion");
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  v9 = (id)-[ICAttachment ic_postNotificationOnMainThreadAfterSaveWithName:](self, "ic_postNotificationOnMainThreadAfterSaveWithName:", CFSTR("ICAttachmentPreviewImagesDidUpdateNotification"));
}

- (void)undeleteAttachmentPreviewImages
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[ICAttachment previewImages](self, "previewImages", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "unmarkForDeletion");
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)purgeAttachmentPreviewImages
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[ICAttachment previewImages](self, "previewImages", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
        -[ICAttachment removePreviewImagesObject:](self, "removePreviewImagesObject:", v9);
        -[ICAttachment managedObjectContext](self, "managedObjectContext");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "deleteObject:", v9);

        -[ICAttachment attachmentModel](self, "attachmentModel");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v10) = objc_msgSend(v11, "requiresPostProcessing");

        if ((_DWORD)v10)
        {
          -[ICAttachment setOcrSummary:](self, "setOcrSummary:", 0);
          -[ICAttachment setImageClassificationSummary:](self, "setImageClassificationSummary:", 0);
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

}

- (void)invalidateAttachmentPreviewImages
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[ICAttachment previewImages](self, "previewImages", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "invalidateImage");
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

void __53__ICAttachment_Previews__checkPreviewImagesIntegrity__block_invoke_3(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  id v5;
  NSObject *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "purgeAttachmentPreviewImages");
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasChanges");

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 0;
    objc_msgSend(v4, "save:", &v7);
    v5 = v7;

    if (v5)
    {
      v6 = os_log_create("com.apple.notes", "CoreData");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        __53__ICAttachment_Previews__checkPreviewImagesIntegrity__block_invoke_3_cold_1();

    }
  }
}

void __53__ICAttachment_Previews__checkPreviewImagesIntegrity__block_invoke_923(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("ICAttachmentNeedsPreviewGenerationNotification"), v2);

}

- (void)loadLinkPreviewForSynapseItem:(id)a3
{
  id v4;
  ICSynapseLinkPreviewLoadingOperation *v5;
  ICSynapseLinkPreviewLoadingOperation *loadOperation;
  void *v7;
  ICSynapseLinkPreviewLoadingOperation *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  ICAttachment *v14;

  v4 = a3;
  v5 = -[ICSynapseLinkPreviewLoadingOperation initWithSynapseItem:]([ICSynapseLinkPreviewLoadingOperation alloc], "initWithSynapseItem:", v4);
  loadOperation = self->_loadOperation;
  self->_loadOperation = v5;

  -[ICAttachment ic_permanentObjectID](self, "ic_permanentObjectID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = self->_loadOperation;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __56__ICAttachment_Previews__loadLinkPreviewForSynapseItem___block_invoke;
  v11[3] = &unk_1E76C7708;
  v12 = v4;
  v13 = v7;
  v14 = self;
  v9 = v7;
  v10 = v4;
  -[ICSynapseLinkPreviewLoadingOperation loadPreviewWithCompletionBlock:](v8, "loadPreviewWithCompletionBlock:", v11);

}

void __56__ICAttachment_Previews__loadLinkPreviewForSynapseItem___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint64_t v11;
  id v12;

  v2 = *(void **)(a1 + 32);
  v12 = 0;
  objc_msgSend(v2, "dataRepresentationWithError:", &v12);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v12;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICAttachment(Previews) loadLinkPreviewForSynapseItem:]_block_invoke", 1, 0, CFSTR("Couldn't serialize SYContentItem to NSData. Error: %@"), v4);
  }
  else
  {
    +[ICNoteContext sharedContext](ICNoteContext, "sharedContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __56__ICAttachment_Previews__loadLinkPreviewForSynapseItem___block_invoke_2;
    v8[3] = &unk_1E76CF8B0;
    v9 = *(id *)(a1 + 40);
    v6 = v3;
    v7 = *(_QWORD *)(a1 + 48);
    v10 = v6;
    v11 = v7;
    objc_msgSend(v5, "performBackgroundTask:", v8);

  }
}

void __56__ICAttachment_Previews__loadLinkPreviewForSynapseItem___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  id v5;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  +[ICAttachment ic_existingObjectWithID:context:](ICAttachment, "ic_existingObjectWithID:context:", v3, v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSynapseData:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v4, "ic_save");

  objc_msgSend(*(id *)(a1 + 48), "ic_postNotificationOnMainThreadWithName:", CFSTR("ICAttachmentDidLoadNotification"));
}

- (id)updateAttachmentPreviewImageWithImageData:(id)a3 size:(CGSize)a4 scale:(double)a5 appearanceType:(unint64_t)a6 scaleWhenDrawing:(BOOL)a7 metadata:(id)a8 sendNotification:(BOOL)a9
{
  _BOOL4 v9;
  _BOOL8 v11;
  double height;
  double width;
  id v17;
  void *v18;
  void *v19;
  int v20;
  id v21;
  NSObject *v22;
  void *v23;

  v9 = a9;
  v11 = a7;
  height = a4.height;
  width = a4.width;
  v17 = a3;
  -[ICAttachment attachmentPreviewImageCreatingIfNecessaryWithWidth:height:scale:appearanceType:scaleWhenDrawing:metadata:](self, "attachmentPreviewImageCreatingIfNecessaryWithWidth:height:scale:appearanceType:scaleWhenDrawing:metadata:", a6, v11, a8, width, height, a5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v18)
  {
    objc_msgSend(v18, "setScaleWhenDrawing:", v11);
    v20 = objc_msgSend(v19, "setImageData:withSize:scale:appearanceType:", v17, a6, width, height, a5);
    if (v20 && v9)
    {
      v21 = (id)-[ICAttachment ic_postNotificationOnMainThreadAfterSaveWithName:](self, "ic_postNotificationOnMainThreadAfterSaveWithName:", CFSTR("ICAttachmentPreviewImagesDidUpdateNotification"));
    }
    else if ((v20 & 1) == 0)
    {
      v22 = os_log_create("com.apple.notes", "PreviewGeneration");
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        -[ICAttachment(Previews) updateAttachmentPreviewImageWithImageData:size:scale:appearanceType:scaleWhenDrawing:metadata:sendNotification:].cold.1(v19);

      -[ICAttachment removePreviewImagesObject:](self, "removePreviewImagesObject:", v19);
      objc_msgSend(v19, "managedObjectContext");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "deleteObject:", v19);

      v19 = 0;
    }
  }

  return v19;
}

- (id)updateAttachmentPreviewImageWithImageSrc:(CGImageSource *)a3 maxDimension:(double)a4 scale:(double)a5 appearanceType:(unint64_t)a6 scaleWhenDrawing:(BOOL)a7 metadata:(id)a8 sendNotification:(BOOL)a9
{
  _BOOL4 v9;
  _BOOL8 v10;
  id v16;
  CFDictionaryRef v17;
  CFDictionaryRef v18;
  void *v19;
  uint64_t v20;
  void *v21;
  BOOL v22;
  void *v23;
  float v24;
  float v25;
  double v26;
  float v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  char v32;
  id v33;
  _BOOL4 v35;

  v9 = a9;
  v10 = a7;
  v16 = a8;
  v17 = CGImageSourceCopyPropertiesAtIndex(a3, 0, 0);
  v18 = v17;
  if (v17)
  {
    -[__CFDictionary objectForKeyedSubscript:](v17, "objectForKeyedSubscript:", *MEMORY[0x1E0CBD048]);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFDictionary objectForKeyedSubscript:](v18, "objectForKeyedSubscript:", *MEMORY[0x1E0CBD040]);
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = (void *)v20;
    if (v19)
      v22 = v20 == 0;
    else
      v22 = 1;
    if (v22)
    {
      v23 = 0;
    }
    else
    {
      v35 = v9;
      objc_msgSend(v19, "floatValue");
      v25 = v24;
      v26 = v24;
      objc_msgSend(v21, "floatValue");
      v28 = v27;
      if (v25 >= v27)
        v29 = v26;
      else
        v29 = v27;
      -[ICAttachment attachmentPreviewImageCreatingIfNecessaryWithWidth:height:scale:appearanceType:scaleWhenDrawing:metadata:](self, "attachmentPreviewImageCreatingIfNecessaryWithWidth:height:scale:appearanceType:scaleWhenDrawing:metadata:", a6, v10, v16, round(a4 / v29 * v26), round(a4 / v29 * v28), a5);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      CFRetain(a3);
      -[ICAttachment attachmentModel](self, "attachmentModel");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "previewImageTypeUTI");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v23, "setScaledImageFromImageSrc:typeUTI:", a3, v31);

      CFRelease(a3);
      if ((v32 & 1) != 0)
      {
        if (v35)
          v33 = (id)-[ICAttachment ic_postNotificationOnMainThreadAfterSaveWithName:](self, "ic_postNotificationOnMainThreadAfterSaveWithName:", CFSTR("ICAttachmentPreviewImagesDidUpdateNotification"));
      }
      else
      {
        -[ICAttachment removePreviewImagesObject:](self, "removePreviewImagesObject:", v23);
      }
    }

  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (id)attachmentPreviewImageCreatingIfNecessaryWithWidth:(double)a3 height:(double)a4 scale:(double)a5 appearanceType:(unint64_t)a6 scaleWhenDrawing:(BOOL)a7 metadata:(id)a8
{
  id v14;
  void *v15;
  id v16;
  NSObject *v17;
  id v18;
  _QWORD v20[5];
  id v21;
  uint64_t *v22;
  double v23;
  double v24;
  double v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint8_t buf[4];
  double v35;
  __int16 v36;
  double v37;
  __int16 v38;
  ICAttachment *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v14 = a8;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__54;
  v32 = __Block_byref_object_dispose__54;
  v33 = 0;
  -[ICAttachment checkPreviewImagesIntegrity](self, "checkPreviewImagesIntegrity");
  -[ICAttachment managedObjectContext](self, "managedObjectContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __131__ICAttachment_Previews__attachmentPreviewImageCreatingIfNecessaryWithWidth_height_scale_appearanceType_scaleWhenDrawing_metadata___block_invoke;
  v20[3] = &unk_1E76CF8D8;
  v23 = a5;
  v24 = a3;
  v25 = a4;
  v26 = a6;
  v20[4] = self;
  v22 = &v28;
  v27 = a7;
  v16 = v14;
  v21 = v16;
  objc_msgSend(v15, "performBlockAndWait:", v20);

  v17 = os_log_create("com.apple.notes", "PreviewGeneration");
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218496;
    v35 = a3;
    v36 = 2048;
    v37 = a4;
    v38 = 2048;
    v39 = self;
    _os_log_debug_impl(&dword_1BD918000, v17, OS_LOG_TYPE_DEBUG, "Update preview image %.0fx%.0f 0x%p", buf, 0x20u);
  }

  v18 = (id)v29[5];
  _Block_object_dispose(&v28, 8);

  return v18;
}

void __131__ICAttachment_Previews__attachmentPreviewImageCreatingIfNecessaryWithWidth_height_scale_appearanceType_scaleWhenDrawing_metadata___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  BOOL v21;
  void *v22;
  void *v23;
  _BOOL4 v24;
  void *v25;
  id v26;
  uint64_t v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v2);
  objc_msgSend(*(id *)(a1 + 32), "previewImages");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "previewImages", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v30 != v6)
            objc_enumerationMutation(v4);
          v8 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
          objc_msgSend(v8, "scale");
          if (v9 == *(double *)(a1 + 56))
          {
            objc_msgSend(v8, "width");
            if (v10 == *(double *)(a1 + 64))
            {
              objc_msgSend(v8, "height");
              if (v11 == *(double *)(a1 + 72) && *(_QWORD *)(a1 + 80) == (int)objc_msgSend(v8, "appearanceType"))
                objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v8);
            }
          }
        }
        v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      }
      while (v5);
    }

  }
  v12 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  if (!v12)
  {
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[ICAttachmentPreviewImage identifierForContentIdentifier:scale:width:height:appearanceType:](ICAttachmentPreviewImage, "identifierForContentIdentifier:scale:width:height:appearanceType:", v13, *(_QWORD *)(a1 + 80), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[ICAttachmentPreviewImage attachmentPreviewImageWithIdentifier:inContext:](ICAttachmentPreviewImage, "attachmentPreviewImageWithIdentifier:inContext:", v14, v15);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v18 = *(void **)(v17 + 40);
    *(_QWORD *)(v17 + 40) = v16;

    v19 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    if (v19)
    {
      objc_msgSend(v19, "attachment");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v20 == *(void **)(a1 + 32);

      if (v21)
      {
LABEL_23:

        v12 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
        goto LABEL_24;
      }
      v22 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      if (v22)
      {
        objc_msgSend(v22, "attachment");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v23 == 0;

        if (v24)
        {
          objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "deleteObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));

        }
      }
    }
    v26 = +[ICAttachmentPreviewImage newAttachmentPreviewImageWithIdentifier:attachment:](ICAttachmentPreviewImage, "newAttachmentPreviewImageWithIdentifier:attachment:", v14, *(_QWORD *)(a1 + 32));
    v27 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v28 = *(void **)(v27 + 40);
    *(_QWORD *)(v27 + 40) = v26;

    objc_msgSend(*(id *)(a1 + 32), "addPreviewImagesObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setWidth:", *(double *)(a1 + 64));
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setHeight:", *(double *)(a1 + 72));
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setScale:", *(double *)(a1 + 56));
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setScaleWhenDrawing:", *(unsigned __int8 *)(a1 + 88));
    if (objc_msgSend(*(id *)(a1 + 32), "isPasswordProtected"))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setIsPasswordProtected:", 1);
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "initializeCryptoProperties");
    }
    goto LABEL_23;
  }
LABEL_24:
  objc_msgSend(v12, "setMetadata:", *(_QWORD *)(a1 + 40));
  objc_sync_exit(v2);

}

- (id)attachmentPreviewImageWithMinSize:(CGSize)a3 scale:(double)a4
{
  return -[ICAttachment attachmentPreviewImageWithMinSize:scale:appearanceType:](self, "attachmentPreviewImageWithMinSize:scale:appearanceType:", 0, a3.width, a3.height, a4);
}

- (id)attachmentPreviewImageWithMinSize:(CGSize)a3 scale:(double)a4 appearanceType:(unint64_t)a5
{
  return -[ICAttachment attachmentPreviewImageWithMinSize:scale:appearanceType:requireAppearance:](self, "attachmentPreviewImageWithMinSize:scale:appearanceType:requireAppearance:", a5, 0, a3.width, a3.height, a4);
}

- (id)drawingModel
{
  void *v3;
  void *v4;

  objc_opt_class();
  -[ICAttachment attachmentModel](self, "attachmentModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)paperBundleModel
{
  void *v3;
  void *v4;

  objc_opt_class();
  -[ICAttachment attachmentModel](self, "attachmentModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)systemPaperModel
{
  void *v3;
  void *v4;

  objc_opt_class();
  -[ICAttachment attachmentModel](self, "attachmentModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)galleryModel
{
  void *v3;
  void *v4;

  objc_opt_class();
  -[ICAttachment attachmentModel](self, "attachmentModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)inlineDrawingModel
{
  void *v3;
  void *v4;

  objc_opt_class();
  -[ICAttachment attachmentModel](self, "attachmentModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)tableModel
{
  void *v3;
  void *v4;

  objc_opt_class();
  -[ICAttachment attachmentModel](self, "attachmentModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)audioModel
{
  void *v3;
  void *v4;

  objc_opt_class();
  -[ICAttachment attachmentModel](self, "attachmentModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSString)description
{
  void *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__54;
  v11 = __Block_byref_object_dispose__54;
  v12 = 0;
  -[ICAttachment managedObjectContext](self, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __37__ICAttachment_Previews__description__block_invoke;
  v6[3] = &unk_1E76C7730;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v3, "performBlockAndWait:", v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSString *)v4;
}

void __37__ICAttachment_Previews__description__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  objc_super v5;

  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)ICAttachment;
  objc_msgSendSuper2(&v5, sel_description);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)associateAppEntityWithSearchableItemAttributeSet:(id)a3
{
  id v4;
  ICAttachment *v5;

  v4 = a3;
  v5 = self;
  ICAttachment.associateAppEntity(with:)((CSSearchableItemAttributeSet)v4);

}

+ (void)attachmentIdentifiersForAccount:.cold.1()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_17();
  objc_msgSend(v0, "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_1(&dword_1BD918000, v2, v3, "Error fetching attachment identifiers for %@: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

- (void)setNote:.cold.1()
{
  NSObject *v0;
  void *v1;
  id v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  OUTLINED_FUNCTION_17();
  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412546;
  v6 = v3;
  v7 = 2112;
  v8 = v4;
  _os_log_debug_impl(&dword_1BD918000, v0, OS_LOG_TYPE_DEBUG, "Setting note (%@) on attachment (%@)", (uint8_t *)&v5, 0x16u);

  OUTLINED_FUNCTION_2();
}

- (void)setTypeUTI:(void *)a1 resetToIntrinsicNotesVersion:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "shortLoggingDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_2(&dword_1BD918000, a2, v4, "attachmentModel was already created when typeUTI was set for: %@", v5);

  OUTLINED_FUNCTION_4_0();
}

void __31__ICAttachment_attachmentModel__block_invoke_cold_1(id *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*a1, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_2(&dword_1BD918000, a2, v4, "Faulted drawing attachment with existing attachment model: %@", v5);

  OUTLINED_FUNCTION_4_0();
}

void __43__ICAttachment_accountWillChangeToAccount___block_invoke_cold_1()
{
  NSObject *v0;
  uint8_t v1[24];

  OUTLINED_FUNCTION_1_4(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_10(&dword_1BD918000, v0, (uint64_t)v0, "Error moving fallback %@ %@", v1);
  OUTLINED_FUNCTION_1_0();
}

void __43__ICAttachment_accountWillChangeToAccount___block_invoke_cold_2()
{
  NSObject *v0;
  uint8_t v1[24];

  OUTLINED_FUNCTION_1_4(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_10(&dword_1BD918000, v0, (uint64_t)v0, "Error creating fallback %@ directory %@", v1);
  OUTLINED_FUNCTION_1_0();
}

- (void)metadata
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_17();
  objc_msgSend(v0, "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_1(&dword_1BD918000, v2, v3, "Error decoding attachment metadata {attachment: %@, error: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

- (void)setMetadata:.cold.1()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_17();
  objc_msgSend(v0, "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_1(&dword_1BD918000, v2, v3, "Error decoding attachment metadata — not setting {attachment: %@, error: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

- (void)metadataData
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_17();
  objc_msgSend(v0, "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_1(&dword_1BD918000, v2, v3, "Error encoding attachment metadata {attachment: %@, error: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

void __53__ICAttachment_Previews__checkPreviewImagesIntegrity__block_invoke_3_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6(&dword_1BD918000, v0, v1, "Error saving attachment after purging preview images %@", v2);
  OUTLINED_FUNCTION_1_0();
}

@end
