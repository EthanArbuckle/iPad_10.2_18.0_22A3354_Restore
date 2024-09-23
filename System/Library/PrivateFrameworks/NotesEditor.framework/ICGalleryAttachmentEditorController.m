@implementation ICGalleryAttachmentEditorController

- (ICGalleryAttachmentEditorController)initWithGalleryAttachment:(id)a3 browserMode:(BOOL)a4 delegate:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  ICGalleryAttachmentEditorController *v10;
  ICGalleryAttachmentEditorController *v11;
  ICDocCamScannedDocumentEditor *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  ICGalleryAttachmentEditorController *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v27[4];
  ICGalleryAttachmentEditorController *v28;
  objc_super v29;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  v29.receiver = self;
  v29.super_class = (Class)ICGalleryAttachmentEditorController;
  v10 = -[ICGalleryAttachmentEditorController init](&v29, sel_init);
  v11 = v10;
  if (v10)
  {
    -[ICGalleryAttachmentEditorController setDelegate:](v10, "setDelegate:", v9);
    -[ICGalleryAttachmentEditorController setGalleryAttachment:](v11, "setGalleryAttachment:", v8);
    v12 = -[ICDocCamScannedDocumentEditor initWithGalleryAttachment:]([ICDocCamScannedDocumentEditor alloc], "initWithGalleryAttachment:", v8);
    -[ICGalleryAttachmentEditorController setEditor:](v11, "setEditor:", v12);

    -[ICGalleryAttachmentEditorController setBrowserMode:](v11, "setBrowserMode:", v6);
    objc_opt_class();
    objc_msgSend(v8, "attachmentModel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    ICCheckedDynamicCast();
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v8, "isPasswordProtected"))
    {
      v15 = objc_alloc(MEMORY[0x1E0D63AC0]);
      objc_msgSend(v8, "identifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)objc_msgSend(v15, "initWithObjectIdentifier:", v16);

    }
    else
    {
      v17 = 0;
    }
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1D810]), "initWithDataCryptorDelegate:", v17);
    -[ICGalleryAttachmentEditorController setImageCache:](v11, "setImageCache:", v18);

    v19 = objc_alloc_init(MEMORY[0x1E0D63A38]);
    -[ICGalleryAttachmentEditorController setThumbnailCache:](v11, "setThumbnailCache:", v19);

    v20 = objc_alloc_init(MEMORY[0x1E0D1D7F8]);
    -[ICGalleryAttachmentEditorController setDocumentInfoCollection:](v11, "setDocumentInfoCollection:", v20);

    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __86__ICGalleryAttachmentEditorController_initWithGalleryAttachment_browserMode_delegate___block_invoke;
    v27[3] = &unk_1EA7E0340;
    v21 = v11;
    v28 = v21;
    objc_msgSend(v14, "enumerateSubAttachmentsWithBlock:", v27);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addObserver:selector:name:object:", v21, sel_applicationWillTerminate_, *MEMORY[0x1E0DC4870], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addObserver:selector:name:object:", v21, sel_previewImageDidUpdate_, *MEMORY[0x1E0D63660], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addObserver:selector:name:object:", v21, sel_attachmentDidLoad_, *MEMORY[0x1E0D63608], 0);

    -[ICGalleryAttachmentEditorController galleryAttachment](v21, "galleryAttachment");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "ic_addObserver:forKeyPath:context:", v21, CFSTR("mergeableData"), &compoundliteral_4);

  }
  return v11;
}

void __86__ICGalleryAttachmentEditorController_initWithGalleryAttachment_browserMode_delegate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a2;
  v5 = a3;
  v6 = (void *)MEMORY[0x1DF0DF21C]();
  objc_msgSend(v14, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1D7F0]), "initWithDelegate:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v8, "setCurrentFilter:", objc_msgSend(v14, "imageFilterType"));
    objc_msgSend(v14, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setScanDataDelegateIdentifier:", v9);

    objc_msgSend(v8, "setCurrentOrientation:", (int)objc_msgSend(v14, "orientation"));
    objc_msgSend(v14, "croppingQuad");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setImageQuad:", v10);

    objc_msgSend(*(id *)(a1 + 32), "documentInfoCollection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "docInfos");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v8);

  }
  objc_autoreleasePoolPop(v6);
  objc_msgSend(MEMORY[0x1E0D64B00], "sharedGenerator");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "postProcessIfNeededForAttachment:", v14);

}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[ICAttachment ic_removeObserver:forKeyPath:context:](self->_galleryAttachment, "ic_removeObserver:forKeyPath:context:", self, CFSTR("mergeableData"), &compoundliteral_4);
  -[ICDocCamExtractedDocumentViewController presentingViewController](self->_extractedDocumentController, "presentingViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  -[ICDocCamImageCache deleteAllImages](self->_imageCache, "deleteAllImages");
  v5.receiver = self;
  v5.super_class = (Class)ICGalleryAttachmentEditorController;
  -[ICGalleryAttachmentEditorController dealloc](&v5, sel_dealloc);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  char v13;
  void *v14;
  int v15;
  objc_super v16;

  v10 = a3;
  v11 = a5;
  v12 = a4;
  if ((-[ICGalleryAttachmentEditorController ic_didAddObserverForContext:inScope:](self, "ic_didAddObserverForContext:inScope:", a6, "/Library/Caches/com.apple.xbs/Sources/MobileNotes/Ironcade/Common/TextAttachmentUI/iOS/ICGalleryAttachmentEditorController.m") & 1) != 0)
  {
    v13 = -[ICGalleryAttachmentEditorController ic_shouldIgnoreObserveValue:ofObject:forKeyPath:](self, "ic_shouldIgnoreObserveValue:ofObject:forKeyPath:", v11, v12, v10);

    if (a6 == &compoundliteral_4 && (v13 & 1) == 0)
    {
      -[ICGalleryAttachmentEditorController galleryAttachment](self, "galleryAttachment");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v14, "faultingState"))
      {

      }
      else
      {
        v15 = objc_msgSend(v10, "isEqualToString:", CFSTR("mergeableData"));

        if (v15)
          -[ICGalleryAttachmentEditorController updateDocumentViewControllerFromModel](self, "updateDocumentViewControllerFromModel");
      }
    }
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)ICGalleryAttachmentEditorController;
    -[ICGalleryAttachmentEditorController observeValueForKeyPath:ofObject:change:context:](&v16, sel_observeValueForKeyPath_ofObject_change_context_, v10, v12, v11, a6);

  }
}

- (void)applicationWillTerminate:(id)a3
{
  id v3;

  -[ICGalleryAttachmentEditorController imageCache](self, "imageCache", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deleteAllImages");

}

- (void)previewImageDidUpdate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  objc_opt_class();
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  ICCheckedDynamicCast();
  v12 = (id)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0D639F0];
  -[ICGalleryAttachmentEditorController galleryAttachment](self, "galleryAttachment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "managedObjectContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ic_existingObjectWithID:context:", v12, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "parentAttachment");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICGalleryAttachmentEditorController galleryAttachment](self, "galleryAttachment");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10 == v11)
    -[ICGalleryAttachmentEditorController updateDocInfoForAttachment:](self, "updateDocInfoForAttachment:", v9);

}

- (void)attachmentDidLoad:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  objc_opt_class();
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  ICCheckedDynamicCast();
  v12 = (id)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0D639F0];
  -[ICGalleryAttachmentEditorController galleryAttachment](self, "galleryAttachment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "managedObjectContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ic_existingObjectWithID:context:", v12, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "parentAttachment");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICGalleryAttachmentEditorController galleryAttachment](self, "galleryAttachment");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10 == v11)
    -[ICGalleryAttachmentEditorController updateDocInfoForAttachment:](self, "updateDocInfoForAttachment:", v9);

}

- (void)updateDocInfoForAttachment:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  char v14;
  id v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && (objc_msgSend(v4, "markedForDeletion") & 1) == 0)
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    -[ICGalleryAttachmentEditorController documentInfoCollection](self, "documentInfoCollection", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "docInfos");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v19;
LABEL_5:
      v11 = 0;
      while (1)
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v11);
        objc_msgSend(v12, "scanDataDelegateIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isEqualToString:", v5);

        if ((v14 & 1) != 0)
          break;
        if (v9 == ++v11)
        {
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
          if (v9)
            goto LABEL_5;
          goto LABEL_11;
        }
      }
      v15 = v12;

      if (!v15)
        goto LABEL_14;
      objc_msgSend(v15, "setCroppedAndFilteredImageUUID:", 0);
      objc_msgSend(v15, "setCurrentFilter:", objc_msgSend(v4, "imageFilterType"));
      objc_msgSend(v15, "setCurrentOrientation:", (int)objc_msgSend(v4, "orientation"));
      objc_msgSend(v4, "croppingQuad");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setImageQuad:", v16);

      -[ICGalleryAttachmentEditorController extractedDocumentController](self, "extractedDocumentController");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "didUpdateDocumentImage:", v15);

    }
    else
    {
LABEL_11:

LABEL_14:
      -[ICGalleryAttachmentEditorController updateDocumentViewControllerFromModel](self, "updateDocumentViewControllerFromModel");
    }
  }

}

- (void)movePageFromIndex:(unint64_t)a3 toIndex:(unint64_t)a4
{
  id v6;

  -[ICGalleryAttachmentEditorController editor](self, "editor");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "movePageFromIndex:toIndex:", a3, a4);

}

- (BOOL)updateDocumentViewControllerFromModel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  char v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void (*v45)(uint64_t, void *, void *);
  void *v46;
  id v47;
  ICGalleryAttachmentEditorController *v48;
  id v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  -[ICGalleryAttachmentEditorController galleryAttachment](self, "galleryAttachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attachmentModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  ICCheckedDynamicCast();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0C99E08];
  -[ICGalleryAttachmentEditorController documentInfoCollection](self, "documentInfoCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "docInfos");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryWithCapacity:", objc_msgSend(v8, "count"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  -[ICGalleryAttachmentEditorController documentInfoCollection](self, "documentInfoCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "docInfos");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v50, v54, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v51;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v51 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
        objc_msgSend(v16, "scanDataDelegateIdentifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (v17)
        {
          objc_msgSend(v16, "scanDataDelegateIdentifier");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setObject:forKeyedSubscript:", v16, v18);

        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v50, v54, 16);
    }
    while (v13);
  }

  -[ICGalleryAttachmentEditorController extractedDocumentController](self, "extractedDocumentController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "currentDocument");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = objc_alloc_init(MEMORY[0x1E0D1D7F8]);
  v43 = MEMORY[0x1E0C809B0];
  v44 = 3221225472;
  v45 = __76__ICGalleryAttachmentEditorController_updateDocumentViewControllerFromModel__block_invoke;
  v46 = &unk_1EA7E0368;
  v47 = v9;
  v48 = self;
  v22 = v21;
  v49 = v22;
  v23 = v9;
  objc_msgSend(v5, "enumerateSubAttachmentsWithBlock:", &v43);
  objc_msgSend(v22, "docInfos");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "count");

  if (v25)
  {
    objc_msgSend(v22, "docInfos");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICGalleryAttachmentEditorController documentInfoCollection](self, "documentInfoCollection");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "docInfos");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v26, "isEqualToArray:", v28);

    if ((v29 & 1) == 0)
    {
      -[ICGalleryAttachmentEditorController documentInfoCollection](self, "documentInfoCollection");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "docInfos");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "removeAllObjects");

      -[ICGalleryAttachmentEditorController documentInfoCollection](self, "documentInfoCollection");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "docInfos");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "docInfos");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "addObjectsFromArray:", v34);

      if (v20)
      {
        -[ICGalleryAttachmentEditorController documentInfoCollection](self, "documentInfoCollection");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "docInfos");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v36, "count"))
        {
LABEL_16:

          goto LABEL_17;
        }
        -[ICGalleryAttachmentEditorController documentInfoCollection](self, "documentInfoCollection");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "docInfos");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = objc_msgSend(v38, "indexOfObject:", v20);

        if (v42 == 0x7FFFFFFFFFFFFFFFLL)
        {
          -[ICGalleryAttachmentEditorController documentInfoCollection](self, "documentInfoCollection");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "docInfos");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "firstObject");
          v39 = objc_claimAutoreleasedReturnValue();

          v20 = (void *)v39;
          goto LABEL_16;
        }
      }
LABEL_17:
      -[ICGalleryAttachmentEditorController extractedDocumentController](self, "extractedDocumentController", v42, v43, v44, v45, v46, v47, v48, v49);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "didUpdateDocumentInfoArrayNewCurrentDocument:", v20);

    }
  }

  return v25 != 0;
}

void __76__ICGalleryAttachmentEditorController_updateDocumentViewControllerFromModel__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7
      || (v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1D7F0]), "initWithDelegate:", *(_QWORD *)(a1 + 40)),
          objc_msgSend(v7, "setScanDataDelegateIdentifier:", v6),
          v7))
    {
      if (v5)
      {
        objc_msgSend(v7, "setCurrentFilter:", objc_msgSend(v5, "imageFilterType"));
        objc_msgSend(v7, "setCurrentOrientation:", (int)objc_msgSend(v5, "orientation"));
        objc_msgSend(v5, "croppingQuad");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setImageQuad:", v8);

      }
      objc_msgSend(*(id *)(a1 + 48), "docInfos");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObject:", v7);

    }
  }
  else
  {
    v10 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __76__ICGalleryAttachmentEditorController_updateDocumentViewControllerFromModel__block_invoke_cold_1(v10);

  }
}

- (BOOL)shouldAllowEditing
{
  int v3;
  void *v4;

  if (-[ICGalleryAttachmentEditorController browserMode](self, "browserMode"))
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    -[ICGalleryAttachmentEditorController galleryAttachment](self, "galleryAttachment");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v4, "isReadOnly") ^ 1;

  }
  return v3;
}

- (BOOL)openEditorOnViewController:(id)a3 pageIndex:(unint64_t)a4 sourceView:(id)a5
{
  id v8;
  id v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  BOOL v22;
  uint64_t v23;
  void *v24;
  id v25;
  id v26;
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
  NSObject *v37;

  v8 = a3;
  v9 = a5;
  -[ICGalleryAttachmentEditorController delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_opt_respondsToSelector();

  if ((v11 & 1) != 0)
  {
    -[ICGalleryAttachmentEditorController delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "galleryAttachmentEditorControllerWillShow");

  }
  -[ICGalleryAttachmentEditorController documentInfoCollection](self, "documentInfoCollection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "docInfos");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "count");

  if (v15 <= a4)
  {
    v18 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      -[ICGalleryAttachmentEditorController openEditorOnViewController:pageIndex:sourceView:].cold.2(v18);
    v22 = 0;
  }
  else
  {
    -[ICGalleryAttachmentEditorController documentInfoCollection](self, "documentInfoCollection");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "docInfos");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectAtIndexedSubscript:", a4);
    v18 = objc_claimAutoreleasedReturnValue();

    -[ICGalleryAttachmentEditorController editor](self, "editor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject scanDataDelegateIdentifier](v18, "scanDataDelegateIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "subAttachmentWithIdentifier:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = v21 != 0;
    if (v21)
    {
      objc_msgSend(MEMORY[0x1E0D1D848], "setCachedItem:", 0);
      if (-[ICGalleryAttachmentEditorController shouldAllowEditing](self, "shouldAllowEditing"))
        v23 = 1;
      else
        v23 = 2;
      v24 = v8;
      v25 = v9;
      v26 = objc_alloc(MEMORY[0x1E0D1D800]);
      -[ICGalleryAttachmentEditorController documentInfoCollection](self, "documentInfoCollection");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICGalleryAttachmentEditorController imageCache](self, "imageCache");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v26;
      v9 = v25;
      v8 = v24;
      v30 = (void *)objc_msgSend(v29, "initWithDelegate:documentInfoCollection:imageCache:currentIndex:mode:", self, v27, v28, a4, v23);

      objc_msgSend(v30, "setDelegate:", self);
      objc_msgSend(v30, "setTransitioningDelegate:", self);
      objc_msgSend(v30, "setModalPresentationStyle:", 4);
      -[ICGalleryAttachmentEditorController setSourceViewForZoomTransition:](self, "setSourceViewForZoomTransition:", v9);
      objc_opt_class();
      objc_msgSend(v30, "topViewController");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      ICCheckedDynamicCast();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICGalleryAttachmentEditorController setExtractedDocumentController:](self, "setExtractedDocumentController:", v32);

      -[ICGalleryAttachmentEditorController extractedDocumentController](self, "extractedDocumentController");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setTransitioningDelegate:", self);

      -[ICGalleryAttachmentEditorController extractedDocumentController](self, "extractedDocumentController");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setModalPresentationStyle:", 4);

      objc_msgSend(v24, "presentedViewController");
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      if (v35)
      {
        objc_msgSend(v24, "presentedViewController");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "presentViewController:animated:completion:", v30, 1, 0);

      }
      else
      {
        objc_msgSend(v24, "presentViewController:animated:completion:", v30, 1, 0);
      }

      v22 = 1;
    }
    else
    {
      v37 = os_log_create("com.apple.notes", "UI");
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
        -[ICGalleryAttachmentEditorController openEditorOnViewController:pageIndex:sourceView:].cold.1(v18, v37);

    }
  }

  return v22;
}

- (void)attachmentTitleDidChange
{
  void *v3;
  void *v4;
  id v5;

  -[ICGalleryAttachmentEditorController extractedDocumentController](self, "extractedDocumentController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[ICGalleryAttachmentEditorController galleryAttachment](self, "galleryAttachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didUpdateDocumentTitle:", v4);

}

- (id)documentCameraControllerCreateDataCryptorIfNecessary
{
  void *v3;
  int v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  -[ICGalleryAttachmentEditorController galleryAttachment](self, "galleryAttachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isPasswordProtected");

  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x1E0D63AC0]);
    -[ICGalleryAttachmentEditorController galleryAttachment](self, "galleryAttachment");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v5, "initWithObjectIdentifier:", v7);

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (void)extractedDocumentController:(id)a3 didTapRecrop:(id)a4 index:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  id v17;
  uint64_t v18;
  id v19;
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
  int64_t v36;
  id v37;
  void *v38;
  id v39;
  _QWORD v40[4];
  id v41;
  ICGalleryAttachmentEditorController *v42;
  id v43;
  id v44;
  int64_t v45;

  v8 = a3;
  v9 = a4;
  -[ICGalleryAttachmentEditorController editor](self, "editor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "scanDataDelegateIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "subAttachmentWithIdentifier:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v12, "unprocessedDocumentImage");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "croppingQuad");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (int)objc_msgSend(v12, "orientation");
    v16 = objc_alloc(MEMORY[0x1E0D1D828]);
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __86__ICGalleryAttachmentEditorController_extractedDocumentController_didTapRecrop_index___block_invoke;
    v40[3] = &unk_1EA7E0390;
    v37 = v9;
    v17 = v9;
    v41 = v17;
    v42 = self;
    v43 = v12;
    v44 = v8;
    v45 = a5;
    v36 = a5;
    v38 = (void *)v14;
    v18 = v14;
    v19 = v44;
    v20 = (void *)objc_msgSend(v16, "initWithImage:quad:scanDataDelegate:orientation:completionHandler:", v13, v18, v43, v15, v40);
    objc_msgSend(v20, "setShowImageAsAspectFit:", 1);
    -[ICGalleryAttachmentEditorController setUseCustomRecropTransition:](self, "setUseCustomRecropTransition:", 1);
    objc_msgSend(v19, "navigationController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setDelegate:", self);

    objc_msgSend(v20, "navigationController");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setDelegate:", self);

    objc_msgSend(v17, "croppedAndFilteredImageUUID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      -[ICGalleryAttachmentEditorController imageCache](self, "imageCache");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "croppedAndFilteredImageUUID");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "getImage:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      -[ICGalleryAttachmentEditorController extractedDocumentControllerImageForDocument:](self, "extractedDocumentControllerImageForDocument:", v17);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v39 = v8;
    objc_msgSend(v17, "croppedButNotFilteredImageUUID");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      -[ICGalleryAttachmentEditorController imageCache](self, "imageCache");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "croppedButNotFilteredImageUUID");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "getImage:", v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v19, "croppedButNotFilteredImageForDocInfo:", v17);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v36, 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICGalleryAttachmentEditorController setIndexPathForRecrop:](self, "setIndexPathForRecrop:", v33);

    -[ICGalleryAttachmentEditorController setFilteredImageForRecrop:](self, "setFilteredImageForRecrop:", v26);
    v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3870]), "initWithCGImage:scale:orientation:", objc_msgSend(v32, "ic_CGImage"), objc_msgSend(v17, "currentOrientation"), 1.0);
    -[ICGalleryAttachmentEditorController setUnfilteredImageForRecrop:](self, "setUnfilteredImageForRecrop:", v34);

    -[ICGalleryAttachmentEditorController setOrientationForRecrop:](self, "setOrientationForRecrop:", objc_msgSend(v17, "currentOrientation"));
    objc_msgSend(v19, "navigationController");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "pushViewController:animated:", v20, 1);

    v8 = v39;
    v9 = v37;
  }
  else
  {
    v27 = (void *)MEMORY[0x1E0D641A0];
    objc_msgSend(v9, "scanDataDelegateIdentifier");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICGalleryAttachmentEditorController extractedDocumentController:didTapRecrop:index:]", 1, 0, CFSTR("Trying to recrop attachment with identifier, but identifier is not sub-attachment of gallery: %@"), v28);

  }
}

void __86__ICGalleryAttachmentEditorController_extractedDocumentController_didTapRecrop_index___block_invoke(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7;
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
  id v21;
  id v22;

  v22 = a3;
  v7 = a4;
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "setImageQuad:", v7);
    objc_msgSend(*(id *)(a1 + 40), "editor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setQuad:forAttachment:", v7, *(_QWORD *)(a1 + 48));

    objc_msgSend(*(id *)(a1 + 56), "didUpdateDocumentImage:", *(_QWORD *)(a1 + 32));
  }
  objc_msgSend(*(id *)(a1 + 32), "croppedAndFilteredImageUUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = *(void **)(a1 + 40);
  if (v9)
  {
    objc_msgSend(v10, "imageCache");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "croppedAndFilteredImageUUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "getImage:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v10, "extractedDocumentControllerImageForDocument:", *(_QWORD *)(a1 + 32));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(*(id *)(a1 + 32), "croppedButNotFilteredImageUUID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(*(id *)(a1 + 40), "imageCache");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "croppedButNotFilteredImageUUID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "getImage:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 56), "croppedButNotFilteredImageForDocInfo:", *(_QWORD *)(a1 + 32));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", *(_QWORD *)(a1 + 64), 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setIndexPathForRecrop:", v18);

  objc_msgSend(*(id *)(a1 + 40), "setFilteredImageForRecrop:", v13);
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3870]), "initWithCGImage:scale:orientation:", objc_msgSend(v17, "ic_CGImage"), objc_msgSend(*(id *)(a1 + 32), "currentOrientation"), 1.0);
  objc_msgSend(*(id *)(a1 + 40), "setUnfilteredImageForRecrop:", v19);

  objc_msgSend(*(id *)(a1 + 40), "setOrientationForRecrop:", objc_msgSend(*(id *)(a1 + 32), "currentOrientation"));
  objc_msgSend(*(id *)(a1 + 56), "navigationController");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (id)objc_msgSend(v20, "popViewControllerAnimated:", 1);

}

- (void)extractedDocumentControllerDidTapAddImage
{
  id v3;
  void *v4;
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
  id v19;

  if (-[ICGalleryAttachmentEditorController documentCameraController:canAddImages:](self, "documentCameraController:canAddImages:", 0, 1))
  {
    v3 = objc_alloc(MEMORY[0x1E0D1D830]);
    -[ICGalleryAttachmentEditorController imageCache](self, "imageCache");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (id)objc_msgSend(v3, "initWithImageCache:docCamDelegate:remoteDocCamDelegate:", v4, self, self);

    objc_msgSend(v19, "setModalTransitionStyle:", 2);
    -[ICGalleryAttachmentEditorController extractedDocumentController](self, "extractedDocumentController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "navigationController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "presentViewController:animated:completion:", v19, 1, 0);

    -[ICGalleryAttachmentEditorController eventReporter](self, "eventReporter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICGalleryAttachmentEditorController galleryAttachment](self, "galleryAttachment");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "galleryModel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pushStartDocScanPageCountData:", objc_msgSend(v9, "subAttachmentCount"));

    -[ICGalleryAttachmentEditorController eventReporter](self, "eventReporter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICGalleryAttachmentEditorController galleryAttachment](self, "galleryAttachment");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "pushDocScanDataWithID:actionType:stage:", v12, 3, 1);

    -[ICGalleryAttachmentEditorController eventReporter](self, "eventReporter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICGalleryAttachmentEditorController galleryAttachment](self, "galleryAttachment");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "note");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICGalleryAttachmentEditorController galleryAttachment](self, "galleryAttachment");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "galleryModel");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "submitDocScanEventForNote:pageCount:", v15, objc_msgSend(v17, "subAttachmentCount"));

  }
  else
  {
    v18 = (void *)MEMORY[0x1E0D1D858];
    -[ICGalleryAttachmentEditorController extractedDocumentController](self, "extractedDocumentController");
    v19 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "warnAboutMaxScansReachedForViewController:completionHandler:");
  }

}

- (void)extractedDocumentControllerDidTapDone:(unint64_t)a3 scanDataDelegate:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];

  v6 = a4;
  -[ICGalleryAttachmentEditorController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "ic_viewControllerManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  ICDynamicCast();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  -[ICGalleryAttachmentEditorController sourceViewForZoomTransition](self, "sourceViewForZoomTransition");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", a3, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "currentAttachmentPresenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "scrollCollectionViewToIndexPath:", v12);
    objc_msgSend(v13, "transitionViewForAttachment:atIndexPath:", v9, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICGalleryAttachmentEditorController setSourceViewForZoomTransition:](self, "setSourceViewForZoomTransition:", v14);

  }
  -[ICGalleryAttachmentEditorController extractedDocumentController](self, "extractedDocumentController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __94__ICGalleryAttachmentEditorController_extractedDocumentControllerDidTapDone_scanDataDelegate___block_invoke;
  v16[3] = &unk_1EA7DD2D8;
  v16[4] = self;
  objc_msgSend(v15, "dismissViewControllerAnimated:completion:", 1, v16);

}

uint64_t __94__ICGalleryAttachmentEditorController_extractedDocumentControllerDidTapDone_scanDataDelegate___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "setExtractedDocumentController:", 0);
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "galleryAttachmentEditorControllerDidDismiss");

  return objc_msgSend(*(id *)(a1 + 32), "setSourceViewForZoomTransition:", 0);
}

- (void)extractedDocumentControllerDidTapDone:(unint64_t)a3
{
  objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICGalleryAttachmentEditorController extractedDocumentControllerDidTapDone:]", 1, 0, CFSTR("[ICGalleryAttachmentEditorController extractedDocumentControllerDidTapDone:] should never be called."));
}

- (void)extractedDocumentControllerDidRotateDocument:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;

  v7 = a3;
  -[ICGalleryAttachmentEditorController editor](self, "editor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "scanDataDelegateIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "indexForAttachmentWithIdentifier:", v5);

  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v4, "setOrientation:forAttachmentAtIndex:", objc_msgSend(v7, "currentOrientation"), v6);

}

- (void)extractedDocumentControllerDidApplyFilter:(signed __int16)a3 forDocument:(id)a4
{
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  v8 = a4;
  -[ICGalleryAttachmentEditorController editor](self, "editor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "scanDataDelegateIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "indexForAttachmentWithIdentifier:", v6);

  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v5, "applyFilter:forAttachmentAtIndex:", objc_msgSend(v8, "currentFilter"), v7);

}

- (void)extractedDocumentControllerDidDeleteDocument:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
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
  void *v24;
  void *v25;
  _QWORD v26[5];

  v4 = a3;
  -[ICGalleryAttachmentEditorController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[ICGalleryAttachmentEditorController galleryAttachment](self, "galleryAttachment");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "galleryModel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "subAttachmentCount");

    -[ICGalleryAttachmentEditorController editor](self, "editor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "scanDataDelegateIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "indexForAttachmentWithIdentifier:", v11);

    if (v12 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_opt_class();
      -[ICGalleryAttachmentEditorController galleryAttachment](self, "galleryAttachment");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "attachmentModel");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      ICCheckedDynamicCast();
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12 || objc_msgSend(v15, "subAttachmentCount") != 1)
      {
        objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", v12);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "deletePagesAtIndexes:", v16);
      }
      else
      {
        -[ICGalleryAttachmentEditorController extractedDocumentController](self, "extractedDocumentController");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v26[0] = MEMORY[0x1E0C809B0];
        v26[1] = 3221225472;
        v26[2] = __84__ICGalleryAttachmentEditorController_extractedDocumentControllerDidDeleteDocument___block_invoke;
        v26[3] = &unk_1EA7DD2D8;
        v26[4] = self;
        objc_msgSend(v16, "dismissViewControllerAnimated:completion:", 1, v26);
      }

    }
    -[ICGalleryAttachmentEditorController eventReporter](self, "eventReporter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "pushStartDocScanPageCountData:", v9);

    -[ICGalleryAttachmentEditorController eventReporter](self, "eventReporter");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICGalleryAttachmentEditorController galleryAttachment](self, "galleryAttachment");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "identifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "pushDocScanDataWithID:actionType:stage:", v20, 4, 2);

    -[ICGalleryAttachmentEditorController eventReporter](self, "eventReporter");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICGalleryAttachmentEditorController galleryAttachment](self, "galleryAttachment");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "note");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICGalleryAttachmentEditorController galleryAttachment](self, "galleryAttachment");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "galleryModel");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "submitDocScanEventForNote:pageCount:", v23, objc_msgSend(v25, "subAttachmentCount"));

  }
}

void __84__ICGalleryAttachmentEditorController_extractedDocumentControllerDidDeleteDocument___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "galleryAttachmentEditorControllerDeleteAttachment");

}

- (void)extractedDocumentControllerDidMovePageFromIndex:(unint64_t)a3 toIndex:(unint64_t)a4 forDocument:(id)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  id v11;

  v8 = a5;
  -[ICGalleryAttachmentEditorController editor](self, "editor");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "scanDataDelegateIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v11, "indexForAttachmentWithIdentifier:", v9);
  if (v10 != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v11, "movePageFromIndex:toIndex:", a3, a4);

}

- (id)extractedDocumentControllerTitle
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  -[ICGalleryAttachmentEditorController galleryAttachment](self, "galleryAttachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");
  -[ICGalleryAttachmentEditorController galleryAttachment](self, "galleryAttachment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
    objc_msgSend(v6, "title");
  else
    objc_msgSend(v6, "defaultTitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)extractedDocumentControllerDidChangeTitle:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ICGalleryAttachmentEditorController editor](self, "editor");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateDocumentTitle:isUserDefined:", v4, 1);

}

- (void)extractedDocumentController:(id)a3 shareDocument:(id)a4 sender:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  ICMarkupActivity *v27;
  id v28;
  void *v29;
  ICMarkupActivityItem *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  ICAttachmentActivityViewController *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  _QWORD v54[4];
  id v55;
  ICGalleryAttachmentEditorController *v56;
  id v57;
  _QWORD v58[6];
  _QWORD v59[3];
  void *v60;
  _QWORD v61[3];

  v61[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[ICGalleryAttachmentEditorController editor](self, "editor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "scanDataDelegateIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "indexForAttachmentWithIdentifier:", v12);

  if (v13 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_opt_class();
    objc_msgSend(v9, "scanDataDelegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    ICDynamicCast();
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
    {
LABEL_22:

      goto LABEL_23;
    }
    v53 = v15;
    objc_msgSend(v8, "scanCollectionDataDelegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "activityItems");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "croppedAndFilteredImageUUID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      -[ICGalleryAttachmentEditorController imageCache](self, "imageCache");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "croppedAndFilteredImageUUID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "getImage:", v20);
      v21 = objc_claimAutoreleasedReturnValue();

      v22 = (void *)v21;
      if (!v21)
        goto LABEL_21;
    }
    else
    {
      -[ICGalleryAttachmentEditorController extractedDocumentControllerImageForDocument:](self, "extractedDocumentControllerImageForDocument:", v9);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v22)
      {
LABEL_21:

        v15 = v53;
        goto LABEL_22;
      }
    }
    v52 = v16;
    v49 = v22;
    if (-[ICGalleryAttachmentEditorController shouldAllowEditing](self, "shouldAllowEditing"))
    {
      objc_msgSend(v8, "currentImageView");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "size");
      v24 = v23;
      v26 = v25;
      v27 = [ICMarkupActivity alloc];
      v58[0] = MEMORY[0x1E0C809B0];
      v58[1] = 3221225472;
      v58[2] = __88__ICGalleryAttachmentEditorController_extractedDocumentController_shareDocument_sender___block_invoke;
      v58[3] = &__block_descriptor_48_e47__CGRect__CGPoint_dd__CGSize_dd__16__0__UIView_8l;
      v58[4] = v24;
      v58[5] = v26;
      v54[0] = MEMORY[0x1E0C809B0];
      v54[1] = 3221225472;
      v54[2] = __88__ICGalleryAttachmentEditorController_extractedDocumentController_shareDocument_sender___block_invoke_2;
      v54[3] = &unk_1EA7E03D8;
      v55 = v9;
      v56 = self;
      v57 = v8;
      v28 = -[ICMarkupActivity initFromView:presentingViewController:frameBlock:completionBlock:](v27, "initFromView:presentingViewController:frameBlock:completionBlock:", v50, v57, v58, v54);
      objc_msgSend(v28, "setInkStyle:", 1);
      v61[0] = v28;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v61, 1);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = -[ICMarkupActivityItem initWithAttachment:]([ICMarkupActivityItem alloc], "initWithAttachment:", v53);
      objc_msgSend(v17, "arrayByAddingObject:", v30);
      v31 = objc_claimAutoreleasedReturnValue();

      v17 = (void *)v31;
    }
    else
    {
      v29 = 0;
    }
    if (+[ICDocCamArchiveExporter archiveExportingEnabled](ICDocCamArchiveExporter, "archiveExportingEnabled"))
    {
      -[ICGalleryAttachmentEditorController extractedDocumentController](self, "extractedDocumentController");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICGalleryAttachmentEditorController galleryAttachment](self, "galleryAttachment");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      +[ICDocCamArchiveExporter exportAsArchiveActivityWithBarButtonItem:presentingVC:fromGalleryAttachment:](ICDocCamArchiveExporter, "exportAsArchiveActivityWithBarButtonItem:presentingVC:fromGalleryAttachment:", v10, v32, v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v29, "ic_arrayByAddingNonNilObject:", v34);
      v35 = objc_claimAutoreleasedReturnValue();

      v29 = (void *)v35;
    }
    v36 = -[ICAttachmentActivityViewController initWithActivityItems:applicationActivities:]([ICAttachmentActivityViewController alloc], "initWithActivityItems:applicationActivities:", v17, v29);
    -[ICGalleryAttachmentEditorController galleryAttachment](self, "galleryAttachment");
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v37)
      objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((self.galleryAttachment) != nil)", "-[ICGalleryAttachmentEditorController extractedDocumentController:shareDocument:sender:]", 1, 0, CFSTR("Expected non-nil value for '%s'"), "self.galleryAttachment");
    v51 = v17;
    -[ICGalleryAttachmentEditorController galleryAttachment](self, "galleryAttachment");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if (v38)
    {
      -[ICGalleryAttachmentEditorController galleryAttachment](self, "galleryAttachment");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = v39;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v60, 1);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICAttachmentActivityViewController setAttachments:](v36, "setAttachments:", v40);

    }
    else
    {
      -[ICAttachmentActivityViewController setAttachments:](v36, "setAttachments:", MEMORY[0x1E0C9AA60]);
    }

    -[ICGalleryAttachmentEditorController galleryAttachment](self, "galleryAttachment");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "note");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "account");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAttachmentActivityViewController setIsContentManaged:](v36, "setIsContentManaged:", objc_msgSend(v43, "isManaged"));

    v44 = *MEMORY[0x1E0D96DB8];
    v59[0] = *MEMORY[0x1E0D63EF0];
    v59[1] = v44;
    v59[2] = *MEMORY[0x1E0D96E28];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v59, 3);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAttachmentActivityViewController setExcludedActivityTypes:](v36, "setExcludedActivityTypes:", v45);

    objc_msgSend((id)objc_opt_class(), "activityTypeOrder");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAttachmentActivityViewController setActivityTypeOrder:](v36, "setActivityTypeOrder:", v46);

    if (objc_msgSend(MEMORY[0x1E0DC3708], "ic_isVision"))
      v47 = -2;
    else
      v47 = 7;
    -[ICAttachmentActivityViewController setModalPresentationStyle:](v36, "setModalPresentationStyle:", v47);
    objc_msgSend(v8, "presentViewController:animated:completion:", v36, 1, 0);
    -[ICAttachmentActivityViewController popoverPresentationController](v36, "popoverPresentationController");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setBarButtonItem:", v10);
    objc_msgSend(v48, "setPermittedArrowDirections:", 3);

    v17 = v51;
    v16 = v52;
    v22 = v49;
    goto LABEL_21;
  }
LABEL_23:

}

uint64_t __88__ICGalleryAttachmentEditorController_extractedDocumentController_shareDocument_sender___block_invoke(uint64_t a1, void *a2)
{
  void *v2;

  v2 = (void *)MEMORY[0x1E0DC3870];
  objc_msgSend(a2, "bounds");
  return objc_msgSend(v2, "ic_aspectFitImageFrameForViewWithFrame:imageSize:");
}

void __88__ICGalleryAttachmentEditorController_extractedDocumentController_shareDocument_sender___block_invoke_2(id *a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  if (a2)
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "imageWithData:", a2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v8 = v3;
      objc_msgSend(a1[4], "croppedAndFilteredImageUUID");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(a1[5], "imageCache");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[4], "metaData");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v4)
      {
        objc_msgSend(a1[4], "croppedAndFilteredImageUUID");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "replaceImage:metaData:uuid:", v8, v6, v7);
      }
      else
      {
        objc_msgSend(v5, "setImage:metaData:", v8, v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[4], "setCroppedAndFilteredImageUUID:", v7);
      }

      objc_msgSend(a1[6], "didUpdateDocumentImage:", a1[4]);
      v3 = v8;
    }

  }
}

+ (id)activityTypeOrder
{
  uint64_t v2;
  uint64_t v3;
  _QWORD v5[5];

  v5[4] = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D96DB8];
  v5[0] = CFSTR("com.apple.mobilenotes.markup");
  v5[1] = v2;
  v3 = *MEMORY[0x1E0D96DA0];
  v5[2] = *MEMORY[0x1E0D96E00];
  v5[3] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)extractedDocumentControllerDidSelectShareFromMenuForDocument:(id)a3 sourceRect:(CGRect)a4 sourceView:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  id v12;
  void *v13;
  void *v14;
  ICAttachmentActivityViewController *v15;
  void *v16;
  ICAttachmentActivityViewController *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  _QWORD v25[2];

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v25[1] = *MEMORY[0x1E0C80C00];
  v11 = a5;
  v12 = a3;
  objc_opt_class();
  objc_msgSend(v12, "scanDataDelegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  ICDynamicCast();
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = [ICAttachmentActivityViewController alloc];
  objc_msgSend(v14, "activityItems");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[ICAttachmentActivityViewController initWithActivityItems:applicationActivities:](v15, "initWithActivityItems:applicationActivities:", v16, 0);

  if (v14)
  {
    v18 = v14;
LABEL_4:
    v25[0] = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAttachmentActivityViewController setAttachments:](v17, "setAttachments:", v19);

    goto LABEL_5;
  }
  -[ICGalleryAttachmentEditorController galleryAttachment](self, "galleryAttachment");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  if (v18)
    goto LABEL_4;
  objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((attachment) != nil)", "-[ICGalleryAttachmentEditorController extractedDocumentControllerDidSelectShareFromMenuForDocument:sourceRect:sourceView:]", 1, 0, CFSTR("Expected non-nil value for '%s'"), "attachment");
  -[ICAttachmentActivityViewController setAttachments:](v17, "setAttachments:", MEMORY[0x1E0C9AA60]);
LABEL_5:
  objc_msgSend(v18, "note");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "account");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAttachmentActivityViewController setIsContentManaged:](v17, "setIsContentManaged:", objc_msgSend(v21, "isManaged"));

  if (objc_msgSend(MEMORY[0x1E0DC3708], "ic_isVision"))
    v22 = -2;
  else
    v22 = 7;
  -[ICAttachmentActivityViewController setModalPresentationStyle:](v17, "setModalPresentationStyle:", v22);
  -[ICGalleryAttachmentEditorController extractedDocumentController](self, "extractedDocumentController");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "presentViewController:animated:completion:", v17, 1, 0);

  -[ICAttachmentActivityViewController popoverPresentationController](v17, "popoverPresentationController");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setSourceRect:", x, y, width, height);
  objc_msgSend(v24, "setSourceView:", v11);

  objc_msgSend(v24, "setPermittedArrowDirections:", 3);
}

- (void)extractedDocumentControllerDidSelectCopyFromMenuForDocument:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(a3, "scanDataDelegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3AC0], "generalPasteboard");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setImage:", v3);

}

- (CGSize)extractedDocumentControllerImageSizeForDocument:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGSize result;

  v4 = a3;
  -[ICGalleryAttachmentEditorController galleryAttachment](self, "galleryAttachment");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_4;
  v6 = (void *)v5;
  v7 = (void *)MEMORY[0x1E0D639F0];
  objc_msgSend(v4, "scanDataDelegateIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICGalleryAttachmentEditorController galleryAttachment](self, "galleryAttachment");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "managedObjectContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "attachmentWithIdentifier:context:", v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v11, "sizeWidth");
    v13 = v12;
    objc_msgSend(v11, "sizeHeight");
    v15 = v14;

  }
  else
  {
LABEL_4:
    v13 = *MEMORY[0x1E0C9D820];
    v15 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }

  v16 = v13;
  v17 = v15;
  result.height = v17;
  result.width = v16;
  return result;
}

- (id)extractedDocumentControllerImageForDocument:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  -[ICGalleryAttachmentEditorController galleryAttachment](self, "galleryAttachment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0D639F0];
    objc_msgSend(v4, "scanDataDelegateIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICGalleryAttachmentEditorController galleryAttachment](self, "galleryAttachment");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "managedObjectContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "attachmentWithIdentifier:context:", v7, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(MEMORY[0x1E0D64BF0], "imageForSubAttachment:", v10);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

- (id)extractedDocumentControllerUncroppedImageForDocument:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;

  v4 = a3;
  -[ICGalleryAttachmentEditorController galleryAttachment](self, "galleryAttachment");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    v7 = (void *)MEMORY[0x1E0D639F0];
    objc_msgSend(v4, "scanDataDelegateIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICGalleryAttachmentEditorController galleryAttachment](self, "galleryAttachment");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "managedObjectContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "attachmentWithIdentifier:context:", v8, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v11, "media");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isPasswordProtected");

      objc_msgSend(v11, "media");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (v13)
      {
        objc_msgSend(v14, "decryptedData");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          objc_msgSend(MEMORY[0x1E0DC3870], "imageWithData:", v16);
          v17 = objc_claimAutoreleasedReturnValue();
LABEL_10:
          v18 = (void *)v17;
LABEL_12:

          goto LABEL_13;
        }
      }
      else
      {
        objc_msgSend(v14, "mediaURL");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          objc_msgSend(MEMORY[0x1E0DC3870], "ic_imageWithContentsOfURL:", v16);
          v17 = objc_claimAutoreleasedReturnValue();
          goto LABEL_10;
        }
      }
      v18 = 0;
      goto LABEL_12;
    }
  }
  else
  {
    v11 = 0;
  }
  v18 = 0;
LABEL_13:

  return v18;
}

- (void)extractedDocumentControllerLoadThumbnailForDocument:(id)a3 size:(CGSize)a4 completionBlock:(id)a5
{
  double height;
  double width;
  id v9;
  id v10;
  uint64_t v11;
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
  void *v24;
  _QWORD v25[4];
  id v26;

  height = a4.height;
  width = a4.width;
  v9 = a3;
  v10 = a5;
  -[ICGalleryAttachmentEditorController galleryAttachment](self, "galleryAttachment");
  v11 = objc_claimAutoreleasedReturnValue();
  if (!v11)
    goto LABEL_4;
  v12 = (void *)v11;
  v13 = (void *)MEMORY[0x1E0D639F0];
  objc_msgSend(v9, "scanDataDelegateIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICGalleryAttachmentEditorController galleryAttachment](self, "galleryAttachment");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "managedObjectContext");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "attachmentWithIdentifier:context:", v14, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    -[ICGalleryAttachmentEditorController extractedDocumentController](self, "extractedDocumentController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "view");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "ic_appearanceInfo");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICGalleryAttachmentEditorController thumbnailCache](self, "thumbnailCache");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "URIRepresentation");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "absoluteString");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __112__ICGalleryAttachmentEditorController_extractedDocumentControllerLoadThumbnailForDocument_size_completionBlock___block_invoke;
    v25[3] = &unk_1EA7E0400;
    v26 = v10;
    objc_msgSend(v17, "fetchThumbnailImageWithMinSize:scale:appearanceInfo:cache:cacheKey:processingBlock:completionBlock:fallbackBlock:aboutToLoadHandler:", v20, v21, v24, 0, v25, 0, width, height, 1.0, 0);

  }
  else
  {
LABEL_4:
    (*((void (**)(id, _QWORD))v10 + 2))(v10, 0);
  }

}

uint64_t __112__ICGalleryAttachmentEditorController_extractedDocumentControllerLoadThumbnailForDocument_size_completionBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)extractedDocumentControllerMarkupModelDataForDocument:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = (void *)MEMORY[0x1E0D639F0];
  objc_msgSend(a3, "scanDataDelegateIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICGalleryAttachmentEditorController galleryAttachment](self, "galleryAttachment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "managedObjectContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "attachmentWithIdentifier:context:", v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "markupModelData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)extractedDocumentController:(id)a3 startMarkupOnDocument:(id)a4 inkStyle:(unint64_t)a5 startPresentBlock:(id)a6 dismissCompletionBlock:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
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
  uint64_t v27;
  unint64_t v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  _QWORD v33[4];
  id v34;
  id location;

  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  v16 = (void *)MEMORY[0x1E0D639F0];
  objc_msgSend(v13, "scanDataDelegateIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICGalleryAttachmentEditorController galleryAttachment](self, "galleryAttachment");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "managedObjectContext");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "attachmentWithIdentifier:context:", v17, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    v28 = a5;
    objc_msgSend(v12, "currentImageView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "croppedAndFilteredImageUUID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      -[ICGalleryAttachmentEditorController imageCache](self, "imageCache");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "croppedAndFilteredImageUUID");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "getImage:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      -[ICGalleryAttachmentEditorController extractedDocumentControllerImageForDocument:](self, "extractedDocumentControllerImageForDocument:", v13);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[ICGalleryAttachmentEditorController imageCache](self, "imageCache");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, v26);

    if (v25)
    {
      v27 = MEMORY[0x1E0C809B0];
      v33[0] = MEMORY[0x1E0C809B0];
      v33[1] = 3221225472;
      v33[2] = __139__ICGalleryAttachmentEditorController_extractedDocumentController_startMarkupOnDocument_inkStyle_startPresentBlock_dismissCompletionBlock___block_invoke;
      v33[3] = &unk_1EA7E0428;
      v34 = v25;
      v29[0] = v27;
      v29[1] = 3221225472;
      v29[2] = __139__ICGalleryAttachmentEditorController_extractedDocumentController_startMarkupOnDocument_inkStyle_startPresentBlock_dismissCompletionBlock___block_invoke_2;
      v29[3] = &unk_1EA7E0450;
      objc_copyWeak(&v32, &location);
      v30 = v13;
      v31 = v12;
      +[ICMarkupPresenter markupAttachment:fromView:presentingViewController:inkStyle:frameBlock:startPresentBlock:completionBlock:dismissCompletionBlock:](ICMarkupPresenter, "markupAttachment:fromView:presentingViewController:inkStyle:frameBlock:startPresentBlock:completionBlock:dismissCompletionBlock:", v20, v21, v31, v28, v33, v14, v29, v15);

      objc_destroyWeak(&v32);
    }
    objc_destroyWeak(&location);

  }
}

uint64_t __139__ICGalleryAttachmentEditorController_extractedDocumentController_startMarkupOnDocument_inkStyle_startPresentBlock_dismissCompletionBlock___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
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

  v3 = (void *)MEMORY[0x1E0DC3870];
  objc_msgSend(a2, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  objc_msgSend(*(id *)(a1 + 32), "size");
  return objc_msgSend(v3, "ic_aspectFitImageFrameForViewWithFrame:imageSize:", v5, v7, v9, v11, v12, v13);
}

void __139__ICGalleryAttachmentEditorController_extractedDocumentController_startMarkupOnDocument_inkStyle_startPresentBlock_dismissCompletionBlock___block_invoke_2(id *a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "imageWithData:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_msgSend(a1[4], "croppedAndFilteredImageUUID");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(a1[4], "metaData");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
      {
        objc_msgSend(a1[4], "croppedAndFilteredImageUUID");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "replaceImage:metaData:uuid:", v4, v6, v7);
      }
      else
      {
        objc_msgSend(WeakRetained, "setImage:metaData:", v4, v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[4], "setCroppedAndFilteredImageUUID:", v7);
      }

      objc_msgSend(a1[5], "didUpdateDocumentImage:", a1[4]);
    }

  }
}

- (void)extractedDocumentControllerDiscardMarkupModelDataForDocument:(id)a3
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
  void *v13;
  id v14;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D639F0];
  v14 = v4;
  objc_msgSend(v4, "scanDataDelegateIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICGalleryAttachmentEditorController galleryAttachment](self, "galleryAttachment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "managedObjectContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "attachmentWithIdentifier:context:", v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "markupModelData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "length");

  if (v11)
  {
    -[ICGalleryAttachmentEditorController editor](self, "editor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "scanDataDelegateIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setMarkupData:forAttachmentWithIdentifier:", 0, v13);

  }
}

- (id)extractedDocumentControllerUndoManager
{
  void *v2;
  void *v3;

  -[ICGalleryAttachmentEditorController editor](self, "editor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "undoManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)documentCameraPresentingViewController:(id)a3 didFinishWithInfoCollection:(id)a4 imageCache:(id)a5 warnUser:(BOOL)a6 closeViewController:(BOOL)a7
{
  _BOOL4 v8;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
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
  NSObject *v27;
  id v28;
  id v29;
  BOOL v30;
  id v31;
  _QWORD block[5];
  id v33;
  id v34;
  _QWORD *v35;
  BOOL v36;
  _QWORD v37[5];
  id v38;

  v8 = a6;
  v31 = a3;
  v12 = a4;
  v13 = a5;
  if (v8 && !a7)
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "!(warnUser && !closeViewController)", "-[ICGalleryAttachmentEditorController documentCameraPresentingViewController:didFinishWithInfoCollection:imageCache:warnUser:closeViewController:]", 1, 0, CFSTR("Cannot warn user if not closing the view controller"));
  v30 = a7;
  objc_msgSend(v12, "docInfos");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "count");

  if (!v15)
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "docInfoCollection.docInfos.count > 0", "-[ICGalleryAttachmentEditorController documentCameraPresentingViewController:didFinishWithInfoCollection:imageCache:warnUser:closeViewController:]", 1, 0, CFSTR("This should never be called with a count of 0."));
  -[ICGalleryAttachmentEditorController eventReporter](self, "eventReporter");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICGalleryAttachmentEditorController galleryAttachment](self, "galleryAttachment");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "identifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "pushDocScanDataWithID:actionType:stage:", v18, 3, 2);

  -[ICGalleryAttachmentEditorController eventReporter](self, "eventReporter");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICGalleryAttachmentEditorController galleryAttachment](self, "galleryAttachment");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "note");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICGalleryAttachmentEditorController galleryAttachment](self, "galleryAttachment");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "galleryModel");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "subAttachmentCount");
  objc_msgSend(v12, "docInfos");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "submitDocScanEventForNote:pageCount:", v21, objc_msgSend(v25, "count") + v24);

  v37[0] = 0;
  v37[1] = v37;
  v37[2] = 0x3032000000;
  v37[3] = __Block_byref_object_copy__14;
  v37[4] = __Block_byref_object_dispose__14;
  -[ICGalleryAttachmentEditorController extractedDocumentController](self, "extractedDocumentController");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "currentDocument");
  v38 = (id)objc_claimAutoreleasedReturnValue();

  dispatch_get_global_queue(0, 0);
  v27 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __146__ICGalleryAttachmentEditorController_documentCameraPresentingViewController_didFinishWithInfoCollection_imageCache_warnUser_closeViewController___block_invoke;
  block[3] = &unk_1EA7E04A0;
  block[4] = self;
  v33 = v12;
  v34 = v13;
  v35 = v37;
  v36 = v30;
  v28 = v13;
  v29 = v12;
  dispatch_async(v27, block);

  _Block_object_dispose(v37, 8);
}

void __146__ICGalleryAttachmentEditorController_documentCameraPresentingViewController_didFinishWithInfoCollection_imageCache_warnUser_closeViewController___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[5];
  _QWORD v14[4];
  id v15;
  uint64_t v16;
  id v17;
  id v18;
  uint64_t v19;

  v2 = (void *)MEMORY[0x1E0D64BF0];
  objc_msgSend(*(id *)(a1 + 32), "galleryAttachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "docInfos");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "createAndAddSubAttachmentsToGalleryAttachment:fromDocuments:imageCache:context:", v3, v4, *(_QWORD *)(a1 + 48), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "count");
  v7 = MEMORY[0x1E0C809B0];
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "galleryAttachment");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "managedObjectContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v7;
    v14[1] = 3221225472;
    v14[2] = __146__ICGalleryAttachmentEditorController_documentCameraPresentingViewController_didFinishWithInfoCollection_imageCache_warnUser_closeViewController___block_invoke_2;
    v14[3] = &unk_1EA7E0478;
    v10 = *(id *)(a1 + 40);
    v11 = *(_QWORD *)(a1 + 32);
    v15 = v10;
    v16 = v11;
    v12 = *(void **)(a1 + 48);
    v19 = *(_QWORD *)(a1 + 56);
    v17 = v12;
    v18 = v5;
    objc_msgSend(v9, "performBlockAndWait:", v14);

  }
  if (*(_BYTE *)(a1 + 64))
  {
    v13[0] = v7;
    v13[1] = 3221225472;
    v13[2] = __146__ICGalleryAttachmentEditorController_documentCameraPresentingViewController_didFinishWithInfoCollection_imageCache_warnUser_closeViewController___block_invoke_94;
    v13[3] = &unk_1EA7DD2D8;
    v13[4] = *(_QWORD *)(a1 + 32);
    dispatch_async(MEMORY[0x1E0C80D38], v13);
  }

}

void __146__ICGalleryAttachmentEditorController_documentCameraPresentingViewController_didFinishWithInfoCollection_imageCache_warnUser_closeViewController___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  unint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  void *v26;
  unint64_t v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t i;
  void *v43;
  unint64_t v44;
  void *v45;
  void *v46;
  int v47;
  int v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t j;
  uint64_t v54;
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
  uint64_t v66;
  void *v67;
  uint64_t v68;
  id obj;
  void *v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  id v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  _BYTE v84[128];
  _BYTE v85[128];
  uint8_t v86[4];
  uint64_t v87;
  _BYTE v88[128];
  uint64_t v89;

  v89 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend(*(id *)(a1 + 32), "docInfos");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v67 = (void *)objc_claimAutoreleasedReturnValue();

  v82 = 0u;
  v83 = 0u;
  v80 = 0u;
  v81 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "docInfos");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v80, v88, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v81;
    v66 = *(_QWORD *)v81;
    do
    {
      v7 = 0;
      v68 = v5;
      do
      {
        if (*(_QWORD *)v81 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * v7);
        objc_msgSend(v8, "scanDataDelegateIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9)
        {
          v10 = (void *)MEMORY[0x1E0D639F0];
          objc_msgSend(v8, "scanDataDelegateIdentifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 40), "galleryAttachment");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "managedObjectContext");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "attachmentWithIdentifier:context:", v11, v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (v14)
          {
            v70 = v14;
            objc_msgSend(*(id *)(a1 + 40), "documentInfoCollection");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "docInfos");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_msgSend(v16, "count");

            if (v17)
            {
              v18 = 0;
              while (1)
              {
                objc_msgSend(v8, "scanDataDelegateIdentifier");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(*(id *)(a1 + 40), "documentInfoCollection");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v20, "docInfos");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v21, "objectAtIndexedSubscript:", v18);
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v22, "scanDataDelegateIdentifier");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                v24 = objc_msgSend(v19, "isEqualToString:", v23);

                if ((v24 & 1) != 0)
                  break;
                ++v18;
                objc_msgSend(*(id *)(a1 + 40), "documentInfoCollection");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v25, "docInfos");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                v27 = objc_msgSend(v26, "count");

                if (v27 <= v18)
                  goto LABEL_12;
              }
              objc_msgSend(*(id *)(a1 + 40), "documentInfoCollection");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "docInfos");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "replaceObjectAtIndex:withObject:", v18, v8);
            }
            else
            {
LABEL_12:
              objc_msgSend(*(id *)(a1 + 40), "documentInfoCollection");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "docInfos");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "addObject:", v8);
            }

            objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), v8);
            v32 = *(void **)(a1 + 48);
            objc_msgSend(v8, "croppedAndFilteredImageUUID");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "getImageURL:async:", v31, 0);
            v30 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v67, "ic_addNonNilObject:", v30);
            v6 = v66;
            v5 = v68;
            v14 = v70;
          }
          else
          {
            v30 = os_log_create("com.apple.notes", "UI");
            if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
              __146__ICGalleryAttachmentEditorController_documentCameraPresentingViewController_didFinishWithInfoCollection_imageCache_warnUser_closeViewController___block_invoke_2_cold_1(v86, v8, &v87, v30);
            v31 = v30;
          }

        }
        ++v7;
      }
      while (v7 != v5);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v80, v88, 16);
    }
    while (v5);
  }

  objc_opt_class();
  objc_msgSend(MEMORY[0x1E0D64270], "objectForKey:", CFSTR("ICShouldSavePhotosAndVideosToCameraRollKey"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "BOOLValue");

  v78 = 0u;
  v79 = 0u;
  v76 = 0u;
  v77 = 0u;
  v36 = v67;
  v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v76, v85, 16);
  if (v37)
  {
    v38 = v37;
    v39 = 0;
    v40 = *(_QWORD *)v77;
    v41 = *MEMORY[0x1E0C99998];
    do
    {
      for (i = 0; i != v38; ++i)
      {
        if (*(_QWORD *)v77 != v40)
          objc_enumerationMutation(v36);
        v43 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * i);
        v75 = 0;
        objc_msgSend(v43, "getResourceValue:forKey:error:", &v75, v41, 0);
        if (v75)
        {
          v44 = objc_msgSend(v75, "unsignedIntegerValue");
          if (v39 <= v44)
            v39 = v44;
        }
      }
      v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v76, v85, 16);
    }
    while (v38);
  }
  else
  {
    v39 = 0;
  }

  objc_msgSend(*(id *)(a1 + 40), "galleryAttachment");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "note");
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  v47 = objc_msgSend(v46, "canAddAttachment");
  v48 = objc_msgSend(v46, "attachmentExceedsMaxSizeAllowed:", v39);
  if (!objc_msgSend(v46, "isPasswordProtected") && v35 | v48 | v47 ^ 1)
  {
    v73 = 0u;
    v74 = 0u;
    v71 = 0u;
    v72 = 0u;
    v49 = v36;
    v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v71, v84, 16);
    if (v50)
    {
      v51 = v50;
      v52 = *(_QWORD *)v72;
      do
      {
        for (j = 0; j != v51; ++j)
        {
          if (*(_QWORD *)v72 != v52)
            objc_enumerationMutation(v49);
          v54 = *(_QWORD *)(*((_QWORD *)&v71 + 1) + 8 * j);
          v55 = (void *)MEMORY[0x1DF0DF21C]();
          objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", v54);
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          UIImageDataWriteToSavedPhotosAlbum();

          objc_autoreleasePoolPop(v55);
        }
        v51 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v71, v84, 16);
      }
      while (v51);
    }

  }
  objc_msgSend(*(id *)(a1 + 40), "extractedDocumentController");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "didUpdateDocumentInfoArrayNewCurrentDocument:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));

  v58 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "localizedStringForKey:value:table:", CFSTR("ADD_%lu_SCANNED_IMAGES"), &stru_1EA7E9860, 0);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "localizedStringWithFormat:", v60, objc_msgSend(*(id *)(a1 + 56), "count"));
  v61 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "editor");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "undoManager");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "prepareWithInvocationTarget:", v62);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "undoablyDeleteSubAttachments:actionName:", *(_QWORD *)(a1 + 56), v61);

  objc_msgSend(v62, "undoManager");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "setActionName:", v61);

}

void __146__ICGalleryAttachmentEditorController_documentCameraPresentingViewController_didFinishWithInfoCollection_imageCache_warnUser_closeViewController___block_invoke_94(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];

  objc_msgSend(*(id *)(a1 + 32), "extractedDocumentController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __146__ICGalleryAttachmentEditorController_documentCameraPresentingViewController_didFinishWithInfoCollection_imageCache_warnUser_closeViewController___block_invoke_2_95;
  v4[3] = &unk_1EA7DD2D8;
  v4[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, v4);

}

void __146__ICGalleryAttachmentEditorController_documentCameraPresentingViewController_didFinishWithInfoCollection_imageCache_warnUser_closeViewController___block_invoke_2_95(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "extractedDocumentController");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "becomeFirstResponder");

}

- (void)documentCameraControllerDidCancelWithPresentingViewController:(id)a3
{
  void *v4;
  void *v5;
  _QWORD v6[5];

  -[ICGalleryAttachmentEditorController extractedDocumentController](self, "extractedDocumentController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __101__ICGalleryAttachmentEditorController_documentCameraControllerDidCancelWithPresentingViewController___block_invoke;
  v6[3] = &unk_1EA7DD2D8;
  v6[4] = self;
  objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 1, v6);

}

void __101__ICGalleryAttachmentEditorController_documentCameraControllerDidCancelWithPresentingViewController___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "extractedDocumentController");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "becomeFirstResponder");

}

- (void)documentCameraController:(id)a3 didFinishWithDocInfoCollection:(id)a4 imageCache:(id)a5 warnUser:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;

  v6 = a6;
  v10 = a5;
  v11 = a4;
  objc_msgSend(a3, "presentingViewController");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  -[ICGalleryAttachmentEditorController documentCameraPresentingViewController:didFinishWithInfoCollection:imageCache:warnUser:closeViewController:](self, "documentCameraPresentingViewController:didFinishWithInfoCollection:imageCache:warnUser:closeViewController:", v12, v11, v10, v6, 1);

}

- (void)documentCameraController:(id)a3 didFinishWithDocInfoCollection:(id)a4 imageCache:(id)a5 warnUser:(BOOL)a6 closeViewController:(BOOL)a7
{
  _BOOL8 v7;
  id v11;
  id v12;
  id v13;

  v7 = a6;
  v11 = a5;
  v12 = a4;
  objc_msgSend(a3, "presentingViewController");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[ICGalleryAttachmentEditorController documentCameraPresentingViewController:didFinishWithInfoCollection:imageCache:warnUser:closeViewController:](self, "documentCameraPresentingViewController:didFinishWithInfoCollection:imageCache:warnUser:closeViewController:", v13, v12, v11, v7, 1);

}

- (void)documentCameraControllerDidCancel:(id)a3
{
  id v4;

  objc_msgSend(a3, "presentingViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[ICGalleryAttachmentEditorController documentCameraControllerDidCancelWithPresentingViewController:](self, "documentCameraControllerDidCancelWithPresentingViewController:", v4);

}

- (void)documentCameraControllerDidRetake:(id)a3 pageCount:(unint64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  -[ICGalleryAttachmentEditorController eventReporter](self, "eventReporter", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICGalleryAttachmentEditorController galleryAttachment](self, "galleryAttachment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pushDocScanDataWithID:actionType:stage:", v8, 2, 1);

  -[ICGalleryAttachmentEditorController eventReporter](self, "eventReporter");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[ICGalleryAttachmentEditorController galleryAttachment](self, "galleryAttachment");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "note");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICGalleryAttachmentEditorController galleryAttachment](self, "galleryAttachment");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "galleryModel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "submitDocScanEventForNote:pageCount:", v10, objc_msgSend(v12, "subAttachmentCount") + a4);

}

- (BOOL)documentCameraController:(id)a3 canAddImages:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  _QWORD v10[7];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v6 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  -[ICGalleryAttachmentEditorController galleryAttachment](self, "galleryAttachment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "managedObjectContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __77__ICGalleryAttachmentEditorController_documentCameraController_canAddImages___block_invoke;
  v10[3] = &unk_1EA7E04C8;
  v10[4] = self;
  v10[5] = &v11;
  v10[6] = a4;
  objc_msgSend(v8, "performBlockAndWait:", v10);

  LOBYTE(a4) = *((_BYTE *)v12 + 24);
  _Block_object_dispose(&v11, 8);

  return a4;
}

void __77__ICGalleryAttachmentEditorController_documentCameraController_canAddImages___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  unint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "galleryAttachment");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  objc_msgSend(v6, "attachmentModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  ICCheckedDynamicCast();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = *(_QWORD *)(a1 + 48) + objc_msgSend(v3, "subAttachmentCount");
  objc_msgSend(MEMORY[0x1E0D63A78], "sharedConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v4 <= objc_msgSend(v5, "maxSubAttachmentsPerAttachment");

}

- (void)remoteDocumentCameraController:(id)a3 didFinishWithInfoCollection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "presentingViewController");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "imageCache");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICGalleryAttachmentEditorController documentCameraPresentingViewController:didFinishWithInfoCollection:imageCache:warnUser:closeViewController:](self, "documentCameraPresentingViewController:didFinishWithInfoCollection:imageCache:warnUser:closeViewController:", v9, v6, v8, 1, 1);
}

- (id)navigationController:(id)a3 animationControllerForOperation:(int64_t)a4 fromViewController:(id)a5 toViewController:(id)a6
{
  id v8;
  void *v9;
  void *v10;
  int64_t v11;
  void *v12;
  void *v13;

  if (-[ICGalleryAttachmentEditorController useCustomRecropTransition](self, "useCustomRecropTransition", a3, a4, a5, a6))
  {
    v8 = objc_alloc(MEMORY[0x1E0D1D838]);
    -[ICGalleryAttachmentEditorController filteredImageForRecrop](self, "filteredImageForRecrop");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICGalleryAttachmentEditorController unfilteredImageForRecrop](self, "unfilteredImageForRecrop");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[ICGalleryAttachmentEditorController orientationForRecrop](self, "orientationForRecrop");
    -[ICGalleryAttachmentEditorController indexPathForRecrop](self, "indexPathForRecrop");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v8, "initWithImage:unfilteredImage:orientation:indexPath:duration:completion:", v9, v10, v11, v12, 0, 0.65);

    -[ICGalleryAttachmentEditorController setFilteredImageForRecrop:](self, "setFilteredImageForRecrop:", 0);
    -[ICGalleryAttachmentEditorController setUnfilteredImageForRecrop:](self, "setUnfilteredImageForRecrop:", 0);
    objc_msgSend(v13, "setPresenting:", a4 == 1);
    if ((objc_msgSend(v13, "presenting") & 1) == 0)
      -[ICGalleryAttachmentEditorController setUseCustomRecropTransition:](self, "setUseCustomRecropTransition:", 0);
  }
  else
  {
    v13 = 0;
  }
  return v13;
}

- (id)scanDataDelegateWithIdentifier:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0D639F0];
  v4 = (void *)MEMORY[0x1E0D63BC8];
  v5 = a3;
  objc_msgSend(v4, "sharedContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "managedObjectContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attachmentWithIdentifier:context:", v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5
{
  id v6;
  id v7;
  objc_class *v8;

  v6 = a3;
  v7 = a4;
  v8 = NSClassFromString(CFSTR("ICDocCamExtractedDocumentPresentationController"));
  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = (objc_class *)objc_msgSend([v8 alloc], "initWithPresentedViewController:presentingViewController:", v6, v7);
    else
      v8 = 0;
  }

  return v8;
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  id v7;
  id v8;
  Class v9;
  objc_class *v10;
  id v11;
  void *v12;
  void *v13;

  v7 = a3;
  v8 = a4;
  v9 = NSClassFromString(CFSTR("ICDocCamExtractedDocumentAnimationController"));
  if (v9 && (v10 = v9, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v11 = [v10 alloc];
    -[ICGalleryAttachmentEditorController sourceViewForZoomTransition](self, "sourceViewForZoomTransition");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v11, "initWithPresentedController:presentingController:thumbnailView:duration:isPresenting:", v7, v8, v12, 1, 0.25);

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)animationControllerForDismissedController:(id)a3
{
  id v4;
  Class v5;
  objc_class *v6;
  id v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = NSClassFromString(CFSTR("ICDocCamExtractedDocumentAnimationController"));
  if (v5 && (v6 = v5, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v7 = [v6 alloc];
    -[ICGalleryAttachmentEditorController sourceViewForZoomTransition](self, "sourceViewForZoomTransition");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithPresentedController:presentingController:thumbnailView:duration:isPresenting:", v4, 0, v8, 0, 0.25);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)attachmentUIState
{
  return 0;
}

- (ICNAEventReporter)eventReporter
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  ICNAEventReporter *v9;
  ICNAEventReporter *eventReporter;
  void *v11;

  if (!self->_eventReporter)
  {
    if (objc_msgSend(MEMORY[0x1E0D62A30], "isOptedInForAnalytics"))
    {
      -[ICGalleryAttachmentEditorController extractedDocumentController](self, "extractedDocumentController");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "viewIfLoaded");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      if (v4)
      {
        v5 = objc_alloc(MEMORY[0x1E0D62A30]);
        v6 = *MEMORY[0x1E0D62A40];
        -[ICGalleryAttachmentEditorController extractedDocumentController](self, "extractedDocumentController");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "view");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = (ICNAEventReporter *)objc_msgSend(v5, "initWithSubTrackerName:view:", v6, v8);
        eventReporter = self->_eventReporter;
        self->_eventReporter = v9;

        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addObserver:selector:name:object:", self, sel_eventReporterLostSession_, *MEMORY[0x1E0D62A18], self->_eventReporter);

      }
    }
  }
  return self->_eventReporter;
}

- (void)eventReporterLostSession:(id)a3
{
  ICNAEventReporter *eventReporter;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  eventReporter = self->_eventReporter;
  self->_eventReporter = 0;
  v5 = a3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0D62A18];
  objc_msgSend(v5, "object");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "removeObserver:name:object:", self, v6, v7);
}

- (ICAttachment)galleryAttachment
{
  return self->_galleryAttachment;
}

- (void)setGalleryAttachment:(id)a3
{
  objc_storeStrong((id *)&self->_galleryAttachment, a3);
}

- (ICDocCamExtractedDocumentViewController)extractedDocumentController
{
  return self->_extractedDocumentController;
}

- (void)setExtractedDocumentController:(id)a3
{
  objc_storeStrong((id *)&self->_extractedDocumentController, a3);
}

- (ICDocCamDocumentInfoCollection)documentInfoCollection
{
  return self->_documentInfoCollection;
}

- (void)setDocumentInfoCollection:(id)a3
{
  objc_storeStrong((id *)&self->_documentInfoCollection, a3);
}

- (ICDocCamImageCache)imageCache
{
  return self->_imageCache;
}

- (void)setImageCache:(id)a3
{
  objc_storeStrong((id *)&self->_imageCache, a3);
}

- (ICAttachmentPreviewImageCache)thumbnailCache
{
  return self->_thumbnailCache;
}

- (void)setThumbnailCache:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnailCache, a3);
}

- (ICDocCamScannedDocumentEditor)editor
{
  return self->_editor;
}

- (void)setEditor:(id)a3
{
  objc_storeStrong((id *)&self->_editor, a3);
}

- (ICGalleryAttachmentEditorControllerDelegate)delegate
{
  return (ICGalleryAttachmentEditorControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)browserMode
{
  return self->_browserMode;
}

- (void)setBrowserMode:(BOOL)a3
{
  self->_browserMode = a3;
}

- (BOOL)useCustomRecropTransition
{
  return self->_useCustomRecropTransition;
}

- (void)setUseCustomRecropTransition:(BOOL)a3
{
  self->_useCustomRecropTransition = a3;
}

- (int64_t)orientationForRecrop
{
  return self->_orientationForRecrop;
}

- (void)setOrientationForRecrop:(int64_t)a3
{
  self->_orientationForRecrop = a3;
}

- (NSIndexPath)indexPathForRecrop
{
  return self->_indexPathForRecrop;
}

- (void)setIndexPathForRecrop:(id)a3
{
  objc_storeStrong((id *)&self->_indexPathForRecrop, a3);
}

- (UIImage)filteredImageForRecrop
{
  return self->_filteredImageForRecrop;
}

- (void)setFilteredImageForRecrop:(id)a3
{
  objc_storeStrong((id *)&self->_filteredImageForRecrop, a3);
}

- (UIImage)unfilteredImageForRecrop
{
  return self->_unfilteredImageForRecrop;
}

- (void)setUnfilteredImageForRecrop:(id)a3
{
  objc_storeStrong((id *)&self->_unfilteredImageForRecrop, a3);
}

- (UIView)sourceViewForZoomTransition
{
  return self->_sourceViewForZoomTransition;
}

- (void)setSourceViewForZoomTransition:(id)a3
{
  objc_storeStrong((id *)&self->_sourceViewForZoomTransition, a3);
}

- (void)setEventReporter:(id)a3
{
  objc_storeStrong((id *)&self->_eventReporter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventReporter, 0);
  objc_storeStrong((id *)&self->_sourceViewForZoomTransition, 0);
  objc_storeStrong((id *)&self->_unfilteredImageForRecrop, 0);
  objc_storeStrong((id *)&self->_filteredImageForRecrop, 0);
  objc_storeStrong((id *)&self->_indexPathForRecrop, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_editor, 0);
  objc_storeStrong((id *)&self->_thumbnailCache, 0);
  objc_storeStrong((id *)&self->_imageCache, 0);
  objc_storeStrong((id *)&self->_documentInfoCollection, 0);
  objc_storeStrong((id *)&self->_extractedDocumentController, 0);
  objc_storeStrong((id *)&self->_galleryAttachment, 0);
}

void __76__ICGalleryAttachmentEditorController_updateDocumentViewControllerFromModel__block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DD7B0000, log, OS_LOG_TYPE_ERROR, "Did not get an attachment identifier when enumerating sub attachments.", v1, 2u);
}

- (void)openEditorOnViewController:(void *)a1 pageIndex:(NSObject *)a2 sourceView:.cold.1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "scanDataDelegateIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_debug_impl(&dword_1DD7B0000, a2, OS_LOG_TYPE_DEBUG, "Unable to open gallery attachment editor since attachment was missing: %@", (uint8_t *)&v4, 0xCu);

}

- (void)openEditorOnViewController:(os_log_t)log pageIndex:sourceView:.cold.2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1DD7B0000, log, OS_LOG_TYPE_DEBUG, "Unable to open gallery attachment editor since index was out of bounds", v1, 2u);
}

void __146__ICGalleryAttachmentEditorController_documentCameraPresentingViewController_didFinishWithInfoCollection_imageCache_warnUser_closeViewController___block_invoke_2_cold_1(uint8_t *a1, void *a2, _QWORD *a3, NSObject *a4)
{
  void *v7;

  objc_msgSend(a2, "scanDataDelegateIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_error_impl(&dword_1DD7B0000, a4, OS_LOG_TYPE_ERROR, "Unable to find attachment for retrieving image url: %@", a1, 0xCu);

}

@end
