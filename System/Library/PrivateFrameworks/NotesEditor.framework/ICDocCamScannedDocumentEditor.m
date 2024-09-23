@implementation ICDocCamScannedDocumentEditor

- (ICDocCamScannedDocumentEditor)initWithGalleryAttachment:(id)a3
{
  id v4;
  ICDocCamScannedDocumentEditor *v5;
  ICDocCamScannedDocumentEditor *v6;
  id v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICDocCamScannedDocumentEditor;
  v5 = -[ICDocCamScannedDocumentEditor init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    -[ICDocCamScannedDocumentEditor setGalleryAttachment:](v5, "setGalleryAttachment:", v4);
    v7 = objc_alloc_init(MEMORY[0x1E0CB3A48]);
    -[ICDocCamScannedDocumentEditor setUndoManager:](v6, "setUndoManager:", v7);

  }
  return v6;
}

- (ICAttachmentGalleryModel)galleryModel
{
  void *v3;
  void *v4;
  void *v5;

  objc_opt_class();
  -[ICDocCamScannedDocumentEditor galleryAttachment](self, "galleryAttachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attachmentModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  ICCheckedDynamicCast();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (ICAttachmentGalleryModel *)v5;
}

- (void)undeleteSubAttachment:(id)a3
{
  id v3;

  v3 = a3;
  if (objc_msgSend(v3, "markedForDeletion"))
  {
    objc_msgSend(MEMORY[0x1E0D639F0], "undeleteAttachment:", v3);
    objc_msgSend(v3, "ic_postNotificationOnMainThreadWithName:", *MEMORY[0x1E0D63660]);
  }

}

- (void)saveAndUpdatePreview:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = a3;
  -[ICDocCamScannedDocumentEditor galleryAttachment](self, "galleryAttachment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v5;
  if (v3)
  {
    objc_msgSend(v5, "setPreviewUpdateDate:", 0);

    -[ICDocCamScannedDocumentEditor galleryAttachment](self, "galleryAttachment");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setCachedImage:", 0);

    -[ICDocCamScannedDocumentEditor galleryAttachment](self, "galleryAttachment");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "invalidateAttachmentPreviewImages");

    -[ICDocCamScannedDocumentEditor galleryAttachment](self, "galleryAttachment");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "managedObjectContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "ic_save");

    objc_msgSend(MEMORY[0x1E0D64B00], "sharedGenerator");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    -[ICDocCamScannedDocumentEditor galleryAttachment](self, "galleryAttachment");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "generatePreviewIfNeededForAttachment:", v10);
  }
  else
  {
    objc_msgSend(v5, "managedObjectContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "ic_save");
  }

}

- (void)updateDocumentTitle:(id)a3 isUserDefined:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  id v8;

  v4 = a4;
  v6 = a3;
  -[ICDocCamScannedDocumentEditor galleryAttachment](self, "galleryAttachment");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamScannedDocumentEditor undoablyUpdateTitle:forAttachmentWithIdentifier:isUserDefined:](self, "undoablyUpdateTitle:forAttachmentWithIdentifier:isUserDefined:", v6, v7, v4);

}

- (BOOL)updateTitle:(id)a3 forSubAttachment:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unint64_t v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[ICDocCamScannedDocumentEditor indexForAttachmentWithIdentifier:](self, "indexForAttachmentWithIdentifier:", v8);

  if (v9 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v7, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamScannedDocumentEditor undoablyUpdateTitle:forAttachmentWithIdentifier:isUserDefined:](self, "undoablyUpdateTitle:forAttachmentWithIdentifier:isUserDefined:", v6, v10, 0);

  }
  return v9 != 0x7FFFFFFFFFFFFFFFLL;
}

- (void)undoablyUpdateTitle:(id)a3 forAttachmentWithIdentifier:(id)a4 isUserDefined:(BOOL)a5
{
  _BOOL8 v5;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;

  v5 = a5;
  v32 = a3;
  v8 = (void *)MEMORY[0x1E0D639F0];
  v9 = a4;
  -[ICDocCamScannedDocumentEditor galleryAttachment](self, "galleryAttachment");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "managedObjectContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "attachmentWithIdentifier:includeDeleted:context:", v9, 0, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamScannedDocumentEditor galleryAttachment](self, "galleryAttachment");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "identifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v13, "isEqualToString:", v15);

  objc_msgSend(v12, "title");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTitle:", v32);
  if (v5)
    objc_msgSend(v12, "setUserTitle:", v32);
  objc_msgSend(v12, "note");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "regenerateTitle:snippet:", 1, 0);

  if (v19)
  {
    objc_msgSend(v12, "note");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "markShareDirtyIfNeededWithReason:", CFSTR("Updated doc scan user title"));

    objc_msgSend(v12, "note");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "updateChangeCountWithReason:", CFSTR("Updated doc scan user title"));

  }
  objc_msgSend(v12, "updateChangeCountWithReason:", CFSTR("Updated doc scan user title"));
  objc_msgSend(v12, "attachmentDidChange");
  if ((v16 & 1) != 0)
  {
    v22 = CFSTR("Change Document Name");
  }
  else
  {
    -[ICDocCamScannedDocumentEditor galleryAttachment](self, "galleryAttachment");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "updateChangeCountWithReason:", CFSTR("Updated doc scan user title"));

    -[ICDocCamScannedDocumentEditor galleryAttachment](self, "galleryAttachment");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "attachmentDidChange");

    v22 = CFSTR("Change Image Name");
  }
  objc_msgSend(v12, "managedObjectContext");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "ic_save");

  -[ICDocCamScannedDocumentEditor undoManager](self, "undoManager");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "prepareWithInvocationTarget:", self);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "identifier");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "undoablyUpdateTitle:forAttachmentWithIdentifier:isUserDefined:", v17, v28, v5);

  -[ICDocCamScannedDocumentEditor undoManager](self, "undoManager");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "localizedStringForKey:value:table:", v22, &stru_1EA7E9860, 0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setActionName:", v31);

}

- (BOOL)moveObjectWithIdentifier:(id)a3 toIndex:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v6 = a3;
  -[ICDocCamScannedDocumentEditor galleryModel](self, "galleryModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "attachmentIdentifiersOrderedSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "indexOfObject:", v6);

  if (v9 != 0x7FFFFFFFFFFFFFFFLL)
    -[ICDocCamScannedDocumentEditor movePageFromIndex:toIndex:](self, "movePageFromIndex:toIndex:", v9, a4);
  return v9 != 0x7FFFFFFFFFFFFFFFLL;
}

- (void)movePageFromIndex:(unint64_t)a3 toIndex:(unint64_t)a4
{
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[ICDocCamScannedDocumentEditor galleryModel](self, "galleryModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "attachmentIdentifiersOrderedSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndex:", a3);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  -[ICDocCamScannedDocumentEditor undoablyMoveAttachmentWithIdentifier:toIndex:](self, "undoablyMoveAttachmentWithIdentifier:toIndex:", v10, a4);
  -[ICDocCamScannedDocumentEditor galleryAttachment](self, "galleryAttachment");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "regenerateTitle");

}

- (void)undoablyMoveAttachmentWithIdentifier:(id)a3 toIndex:(unint64_t)a4
{
  void *v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
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
  unsigned int v22;
  unsigned int v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;

  v33 = a3;
  -[ICDocCamScannedDocumentEditor galleryModel](self, "galleryModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "subAttachmentCount") - 1;

  if (v7 >= a4)
    v8 = a4;
  else
    v8 = v7;
  -[ICDocCamScannedDocumentEditor galleryModel](self, "galleryModel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "attachmentIdentifiersOrderedSet");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "indexOfObject:", v33);

  if (v11 != 0x7FFFFFFFFFFFFFFFLL && v11 != v8)
  {
    -[ICDocCamScannedDocumentEditor galleryModel](self, "galleryModel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "attachmentIdentifiersOrderedSet");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "moveObject:toIndex:", v33, v8);

    -[ICDocCamScannedDocumentEditor galleryModel](self, "galleryModel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setMergeableDataDirty:", 1);

    -[ICDocCamScannedDocumentEditor galleryAttachment](self, "galleryAttachment");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "saveMergeableDataIfNeeded");

    -[ICDocCamScannedDocumentEditor galleryAttachment](self, "galleryAttachment");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "updateChangeCountWithReason:", CFSTR("Moved gallery page"));

    -[ICDocCamScannedDocumentEditor galleryAttachment](self, "galleryAttachment");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "attachmentDidChange");

    -[ICDocCamScannedDocumentEditor galleryAttachment](self, "galleryAttachment");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "managedObjectContext");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "ic_saveWithLogDescription:", CFSTR("Moved gallery page"));

    -[ICDocCamScannedDocumentEditor galleryAttachment](self, "galleryAttachment");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "attachmentModel");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "shouldGeneratePreviewAfterChangeInSubAttachmentWithIdentifier:", v33);
    if (v11)
      v23 = v22;
    else
      v23 = 1;
    if (v8)
      v24 = v23;
    else
      v24 = 1;

    -[ICDocCamScannedDocumentEditor saveAndUpdatePreview:](self, "saveAndUpdatePreview:", v24);
    -[ICDocCamScannedDocumentEditor undoManager](self, "undoManager");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "prepareWithInvocationTarget:", self);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "undoablyMoveAttachmentWithIdentifier:toIndex:", v33, v11);

    -[ICDocCamScannedDocumentEditor undoManager](self, "undoManager");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "localizedStringForKey:value:table:", CFSTR("Move Scan"), &stru_1EA7E9860, 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setActionName:", v29);

    -[ICDocCamScannedDocumentEditor galleryAttachment](self, "galleryAttachment");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "objectID");
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (v31)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "postNotificationName:object:", *MEMORY[0x1E0D63660], v31);

    }
  }

}

- (void)undoablyUndeleteSubAttachments:(id)a3 actionName:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unint64_t v20;
  void *v21;
  unint64_t v22;
  unint64_t v23;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  id obj;
  id v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _QWORD v43[4];
  id v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v35 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v43[0] = MEMORY[0x1E0C809B0];
  v43[1] = 3221225472;
  v43[2] = __75__ICDocCamScannedDocumentEditor_undoablyUndeleteSubAttachments_actionName___block_invoke;
  v43[3] = &unk_1EA7DD110;
  v37 = v6;
  v44 = v37;
  objc_msgSend(v7, "sortedArrayUsingComparator:", v43);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  obj = v8;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v40 != v12)
          objc_enumerationMutation(obj);
        v14 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * i);
        v15 = (void *)MEMORY[0x1E0D639F0];
        -[ICDocCamScannedDocumentEditor galleryAttachment](self, "galleryAttachment");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "managedObjectContext");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "attachmentWithIdentifier:includeDeleted:context:", v14, 1, v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18)
        {
          -[ICDocCamScannedDocumentEditor undeleteSubAttachment:](self, "undeleteSubAttachment:", v18);
          objc_msgSend(v37, "objectForKeyedSubscript:", v14);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "unsignedIntegerValue");

          -[ICDocCamScannedDocumentEditor galleryModel](self, "galleryModel");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "subAttachmentCount");

          if (v20 >= v22)
            v23 = v22;
          else
            v23 = v20;
          -[ICDocCamScannedDocumentEditor galleryModel](self, "galleryModel");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "insertSubAttachment:atIndex:", v18, v23);

          if ((v11 & 1) != 0)
          {
            v11 = 1;
          }
          else
          {
            -[ICDocCamScannedDocumentEditor galleryModel](self, "galleryModel");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = objc_msgSend(v25, "shouldGeneratePreviewAfterChangeInSubAttachmentWithIdentifier:", v14);
            if (v23)
              v11 = v26;
            else
              v11 = 1;

          }
          objc_msgSend(v38, "addObject:", v14);
        }

      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
    }
    while (v10);
  }
  else
  {
    v11 = 0;
  }

  -[ICDocCamScannedDocumentEditor galleryAttachment](self, "galleryAttachment");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "saveMergeableDataIfNeeded");

  -[ICDocCamScannedDocumentEditor galleryAttachment](self, "galleryAttachment");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "updateChangeCountWithReason:", CFSTR("Undeleted gallery page"));

  -[ICDocCamScannedDocumentEditor galleryAttachment](self, "galleryAttachment");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "managedObjectContext");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "ic_saveWithLogDescription:", CFSTR("Undeleted gallery page"));

  -[ICDocCamScannedDocumentEditor saveAndUpdatePreview:](self, "saveAndUpdatePreview:", v11 & 1);
  if (objc_msgSend(v38, "count"))
  {
    -[ICDocCamScannedDocumentEditor undoManager](self, "undoManager");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "prepareWithInvocationTarget:", self);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "undoablyDeleteSubAttachments:actionName:", v38, v35);

    if (v35)
    {
      -[ICDocCamScannedDocumentEditor undoManager](self, "undoManager");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setActionName:", v35);

    }
  }
  -[ICDocCamScannedDocumentEditor galleryAttachment](self, "galleryAttachment");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "regenerateTitle");

}

uint64_t __75__ICDocCamScannedDocumentEditor_undoablyUndeleteSubAttachments_actionName___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v7, "compare:", v8);
  return v9;
}

- (void)undoablyDeleteSubAttachments:(id)a3 actionName:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t j;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  BOOL v30;
  void *v31;
  char v32;
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
  id v44;
  id v45;
  id obj;
  id v47;
  void *v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _QWORD v53[4];
  id v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v44 = a4;
  -[ICDocCamScannedDocumentEditor galleryModel](self, "galleryModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "attachmentIdentifiersOrderedSet");
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v6, "count"));
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  obj = v6;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v60, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v56;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v56 != v11)
          objc_enumerationMutation(obj);
        v13 = *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * i);
        v14 = objc_msgSend(v48, "indexOfObject:", v13);
        if (v14 != 0x7FFFFFFFFFFFFFFFLL)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v15, v13);

        }
      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v60, 16);
    }
    while (v10);
  }

  objc_msgSend(v8, "allKeys");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v53[0] = MEMORY[0x1E0C809B0];
  v53[1] = 3221225472;
  v53[2] = __73__ICDocCamScannedDocumentEditor_undoablyDeleteSubAttachments_actionName___block_invoke;
  v53[3] = &unk_1EA7DD110;
  v47 = v8;
  v54 = v47;
  objc_msgSend(v16, "sortedArrayUsingComparator:", v53);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v43 = v17;
  objc_msgSend(v17, "reverseObjectEnumerator");
  v45 = (id)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v49, v59, 16);
  if (v18)
  {
    v19 = v18;
    v20 = 0;
    v21 = *(_QWORD *)v50;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v50 != v21)
          objc_enumerationMutation(v45);
        v23 = *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * j);
        v24 = (void *)MEMORY[0x1E0D639F0];
        -[ICDocCamScannedDocumentEditor galleryAttachment](self, "galleryAttachment");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "managedObjectContext");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "attachmentWithIdentifier:context:", v23, v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v47, "objectForKeyedSubscript:", v23);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v28, "unsignedIntegerValue");

        if (v27)
          v30 = v29 == 0x7FFFFFFFFFFFFFFFLL;
        else
          v30 = 1;
        if (!v30)
        {
          if ((v20 & 1) != 0)
          {
            v20 = 1;
          }
          else
          {
            -[ICDocCamScannedDocumentEditor galleryModel](self, "galleryModel");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = objc_msgSend(v31, "shouldGeneratePreviewAfterChangeInSubAttachmentWithIdentifier:", v23);
            v20 = v29 ? v32 : 1;

          }
          -[ICDocCamScannedDocumentEditor galleryModel](self, "galleryModel");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "removeSubAttachment:", v27);

          if ((objc_msgSend(v27, "markedForDeletion") & 1) == 0)
            objc_msgSend(MEMORY[0x1E0D639F0], "deleteAttachment:", v27);
        }

      }
      v19 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v49, v59, 16);
    }
    while (v19);
  }
  else
  {
    v20 = 0;
  }

  -[ICDocCamScannedDocumentEditor galleryAttachment](self, "galleryAttachment");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "saveMergeableDataIfNeeded");

  -[ICDocCamScannedDocumentEditor galleryAttachment](self, "galleryAttachment");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "updateChangeCountWithReason:", CFSTR("Deleted gallery page"));

  -[ICDocCamScannedDocumentEditor galleryAttachment](self, "galleryAttachment");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "attachmentDidChange");

  -[ICDocCamScannedDocumentEditor galleryAttachment](self, "galleryAttachment");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "managedObjectContext");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "ic_saveWithLogDescription:", CFSTR("Deleted gallery page"));

  -[ICDocCamScannedDocumentEditor saveAndUpdatePreview:](self, "saveAndUpdatePreview:", v20 & 1);
  if (objc_msgSend(v47, "count"))
  {
    -[ICDocCamScannedDocumentEditor undoManager](self, "undoManager");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "prepareWithInvocationTarget:", self);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "undoablyUndeleteSubAttachments:actionName:", v47, v44);

    if (v44)
    {
      -[ICDocCamScannedDocumentEditor undoManager](self, "undoManager");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "setActionName:", v44);

    }
  }
  -[ICDocCamScannedDocumentEditor galleryAttachment](self, "galleryAttachment");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "regenerateTitle");

}

uint64_t __73__ICDocCamScannedDocumentEditor_undoablyDeleteSubAttachments_actionName___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v7, "compare:", v8);
  return v9;
}

- (void)deletePagesAtIndexes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  v5 = (void *)MEMORY[0x1E0C99DE8];
  -[ICDocCamScannedDocumentEditor galleryModel](self, "galleryModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "arrayWithCapacity:", objc_msgSend(v6, "subAttachmentCount"));
  v17 = (id)objc_claimAutoreleasedReturnValue();

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __54__ICDocCamScannedDocumentEditor_deletePagesAtIndexes___block_invoke;
  v11[3] = &unk_1EA7DD138;
  v11[4] = self;
  v11[5] = &v12;
  objc_msgSend(v4, "enumerateIndexesUsingBlock:", v11);
  if (objc_msgSend((id)v13[5], "count"))
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("DELETE_%lu_SCANNED_IMAGES"), &stru_1EA7E9860, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringWithFormat:", v9, objc_msgSend((id)v13[5], "count"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[ICDocCamScannedDocumentEditor undoablyDeleteSubAttachments:actionName:](self, "undoablyDeleteSubAttachments:actionName:", v13[5], v10);
  }
  _Block_object_dispose(&v12, 8);

}

void __54__ICDocCamScannedDocumentEditor_deletePagesAtIndexes___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "galleryModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subAttachmentIdentifierAtIndex:", a2);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v6;
  if (v6)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v6);
    v5 = v6;
  }

}

- (BOOL)setOrientation:(int64_t)a3 forAttachment:(id)a4
{
  void *v6;
  unint64_t v7;

  objc_msgSend(a4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[ICDocCamScannedDocumentEditor indexForAttachmentWithIdentifier:](self, "indexForAttachmentWithIdentifier:", v6);

  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
    -[ICDocCamScannedDocumentEditor setOrientation:forAttachmentAtIndex:](self, "setOrientation:forAttachmentAtIndex:", a3, v7);
  return v7 != 0x7FFFFFFFFFFFFFFFLL;
}

- (void)setOrientation:(int64_t)a3 forAttachmentAtIndex:(unint64_t)a4
{
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[ICDocCamScannedDocumentEditor galleryModel](self, "galleryModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "singleSubAttachmentAtIndex:", a4);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  v8 = v10;
  if (v10)
  {
    objc_msgSend(v10, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamScannedDocumentEditor undoablySetOrientation:forAttachmentIdentifier:](self, "undoablySetOrientation:forAttachmentIdentifier:", a3, v9);

    v8 = v10;
  }

}

- (void)undoablySetOrientation:(int64_t)a3 forAttachmentIdentifier:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  BOOL v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
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
  id v33;

  v33 = a4;
  v6 = (void *)MEMORY[0x1E0D639F0];
  -[ICDocCamScannedDocumentEditor galleryAttachment](self, "galleryAttachment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "managedObjectContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "attachmentWithIdentifier:context:", v33, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "orientation");
  v11 = v10;
  if (v9)
    v12 = v10 == a3;
  else
    v12 = 1;
  if (!v12)
  {
    objc_msgSend(v9, "setOrientation:", (__int16)a3);
    objc_msgSend(v9, "attachmentModel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "updateAttachmentSize");

    objc_msgSend(v9, "setOcrSummary:", 0);
    objc_msgSend(v9, "updateChangeCountWithReason:", CFSTR("Changed doc scan page orientation"));
    objc_msgSend(v9, "setPreviewUpdateDate:", 0);
    -[ICDocCamScannedDocumentEditor galleryAttachment](self, "galleryAttachment");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "attachmentModel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "shouldGeneratePreviewAfterChangeInSubAttachmentWithIdentifier:", v33);

    if (v16)
    {
      -[ICDocCamScannedDocumentEditor galleryAttachment](self, "galleryAttachment");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setPreviewUpdateDate:", 0);

      -[ICDocCamScannedDocumentEditor galleryAttachment](self, "galleryAttachment");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setCachedImage:", 0);

      -[ICDocCamScannedDocumentEditor galleryAttachment](self, "galleryAttachment");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "invalidateAttachmentPreviewImages");

    }
    -[ICDocCamScannedDocumentEditor galleryAttachment](self, "galleryAttachment");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "attachmentDidChange");

    objc_msgSend(v9, "managedObjectContext");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "ic_save");

    objc_msgSend(MEMORY[0x1E0D64B00], "sharedGenerator");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "postProcessIfNeededForAttachment:", v9);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = *MEMORY[0x1E0D63660];
    objc_msgSend(v9, "objectID");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "postNotificationName:object:", v24, v25);

    if (v16)
    {
      objc_msgSend(MEMORY[0x1E0D64B00], "sharedGenerator");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICDocCamScannedDocumentEditor galleryAttachment](self, "galleryAttachment");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "generatePreviewIfNeededForAttachment:", v27);

    }
    -[ICDocCamScannedDocumentEditor undoManager](self, "undoManager");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "prepareWithInvocationTarget:", self);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "undoablySetOrientation:forAttachmentIdentifier:", v11, v33);

    -[ICDocCamScannedDocumentEditor undoManager](self, "undoManager");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "localizedStringForKey:value:table:", CFSTR("Rotate Scan"), &stru_1EA7E9860, 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setActionName:", v32);

  }
}

- (void)applyFilter:(signed __int16)a3 forAttachmentWithIdentifier:(id)a4
{
  uint64_t v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
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
  id v29;

  v4 = a3;
  v29 = a4;
  v6 = (void *)MEMORY[0x1E0D639F0];
  -[ICDocCamScannedDocumentEditor galleryAttachment](self, "galleryAttachment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "managedObjectContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "attachmentWithIdentifier:context:", v29, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "imageFilterType");
  if (v9)
    v11 = (_DWORD)v10 == (_DWORD)v4;
  else
    v11 = 1;
  if (!v11)
  {
    v12 = v10;
    objc_msgSend(MEMORY[0x1E0D64B00], "sharedGenerator");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "cancelIfNeededForAttachment:", v9);

    objc_msgSend(v9, "setImageFilterType:", v4);
    objc_msgSend(v9, "setOcrSummary:", 0);
    objc_msgSend(v9, "updateChangeCountWithReason:", CFSTR("Applied doc scan page filter"));
    objc_msgSend(v9, "setPreviewUpdateDate:", 0);
    -[ICDocCamScannedDocumentEditor galleryAttachment](self, "galleryAttachment");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "attachmentModel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "shouldGeneratePreviewAfterChangeInSubAttachmentWithIdentifier:", v29);

    if (v16)
    {
      -[ICDocCamScannedDocumentEditor galleryAttachment](self, "galleryAttachment");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setPreviewUpdateDate:", 0);

      -[ICDocCamScannedDocumentEditor galleryAttachment](self, "galleryAttachment");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setCachedImage:", 0);

      -[ICDocCamScannedDocumentEditor galleryAttachment](self, "galleryAttachment");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "invalidateAttachmentPreviewImages");

    }
    -[ICDocCamScannedDocumentEditor galleryAttachment](self, "galleryAttachment");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "attachmentDidChange");

    objc_msgSend(v9, "managedObjectContext");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "ic_save");

    objc_msgSend(MEMORY[0x1E0D64B00], "sharedGenerator");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "generatePreviewIfNeededForAttachment:", v9);

    objc_msgSend(MEMORY[0x1E0D64B00], "sharedGenerator");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "postProcessIfNeededForAttachment:", v9);

    -[ICDocCamScannedDocumentEditor undoManager](self, "undoManager");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "prepareWithInvocationTarget:", self);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "applyFilter:forAttachmentWithIdentifier:", v12, v29);

    -[ICDocCamScannedDocumentEditor undoManager](self, "undoManager");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("Set Scan Filter"), &stru_1EA7E9860, 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setActionName:", v28);

  }
}

- (void)applyFilter:(signed __int16)a3 forAttachmentAtIndex:(unint64_t)a4
{
  uint64_t v5;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v5 = a3;
  -[ICDocCamScannedDocumentEditor galleryModel](self, "galleryModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "singleSubAttachmentAtIndex:", a4);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v10, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamScannedDocumentEditor applyFilter:forAttachmentWithIdentifier:](self, "applyFilter:forAttachmentWithIdentifier:", v5, v9);

  }
}

- (void)setQuad:(id)a3 forAttachmentWithIdentifier:(id)a4
{
  id v6;
  id v7;

  v6 = a3;
  -[ICDocCamScannedDocumentEditor subAttachmentWithIdentifier:](self, "subAttachmentWithIdentifier:", a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[ICDocCamScannedDocumentEditor setQuad:forAttachment:](self, "setQuad:forAttachment:", v6, v7);

}

- (void)setQuad:(id)a3 forAttachment:(id)a4
{
  id v6;
  void *v7;
  char v8;
  id v9;

  v9 = a3;
  v6 = a4;
  objc_msgSend(v6, "croppingQuad");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v9, "isEqual:", v7);

  if ((v8 & 1) == 0)
    -[ICDocCamScannedDocumentEditor undoablySetQuad:forAttachment:](self, "undoablySetQuad:forAttachment:", v9, v6);

}

- (void)undoablySetQuad:(id)a3 forAttachment:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
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
  id v25;

  v25 = a4;
  v6 = a3;
  objc_msgSend(v25, "croppingQuad");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setCroppingQuad:", v6);

  objc_msgSend(v25, "setOcrSummary:", 0);
  objc_msgSend(v25, "attachmentModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "updateAttachmentSize");

  objc_msgSend(v25, "updateChangeCountWithReason:", CFSTR("Set doc scan page cropping"));
  objc_msgSend(v25, "setPreviewUpdateDate:", 0);
  -[ICDocCamScannedDocumentEditor galleryAttachment](self, "galleryAttachment");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "attachmentModel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "shouldGeneratePreviewAfterChangeInSubAttachmentWithIdentifier:", v11);

  if (v12)
  {
    -[ICDocCamScannedDocumentEditor galleryAttachment](self, "galleryAttachment");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setPreviewUpdateDate:", 0);

    -[ICDocCamScannedDocumentEditor galleryAttachment](self, "galleryAttachment");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setCachedImage:", 0);

    -[ICDocCamScannedDocumentEditor galleryAttachment](self, "galleryAttachment");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "invalidateAttachmentPreviewImages");

  }
  -[ICDocCamScannedDocumentEditor galleryAttachment](self, "galleryAttachment");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "attachmentDidChange");

  objc_msgSend(v25, "managedObjectContext");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "ic_save");

  objc_msgSend(MEMORY[0x1E0D64B00], "sharedGenerator");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "generatePreviewIfNeededForAttachment:", v25);

  objc_msgSend(MEMORY[0x1E0D64B00], "sharedGenerator");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "postProcessIfNeededForAttachment:", v25);

  -[ICDocCamScannedDocumentEditor undoManager](self, "undoManager");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "prepareWithInvocationTarget:", self);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "undoablySetQuad:forAttachment:", v7, v25);

  -[ICDocCamScannedDocumentEditor undoManager](self, "undoManager");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("Set Crop"), &stru_1EA7E9860, 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setActionName:", v24);

}

- (void)setMarkupData:(id)a3 forAttachmentWithIdentifier:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
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
  const __CFString *v26;
  void *v27;
  id v28;

  v28 = a4;
  v6 = (void *)MEMORY[0x1E0D639F0];
  v7 = a3;
  -[ICDocCamScannedDocumentEditor galleryAttachment](self, "galleryAttachment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "managedObjectContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "attachmentWithIdentifier:context:", v28, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "markupModelData");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setMarkupModelData:", v7);

  objc_msgSend(v10, "updateChangeCountWithReason:", CFSTR("Applied doc scan page mark-up"));
  objc_msgSend(v10, "setPreviewUpdateDate:", 0);
  -[ICDocCamScannedDocumentEditor galleryAttachment](self, "galleryAttachment");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "attachmentModel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "shouldGeneratePreviewAfterChangeInSubAttachmentWithIdentifier:", v28);

  if (v14)
  {
    -[ICDocCamScannedDocumentEditor galleryAttachment](self, "galleryAttachment");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setPreviewUpdateDate:", 0);

    -[ICDocCamScannedDocumentEditor galleryAttachment](self, "galleryAttachment");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setCachedImage:", 0);

    -[ICDocCamScannedDocumentEditor galleryAttachment](self, "galleryAttachment");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "invalidateAttachmentPreviewImages");

  }
  -[ICDocCamScannedDocumentEditor galleryAttachment](self, "galleryAttachment");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "attachmentDidChange");

  objc_msgSend(v10, "managedObjectContext");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "ic_save");

  objc_msgSend(MEMORY[0x1E0D64B00], "sharedGenerator");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "generatePreviewIfNeededForAttachment:", v10);

  -[ICDocCamScannedDocumentEditor undoManager](self, "undoManager");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "prepareWithInvocationTarget:", self);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setMarkupData:forAttachmentWithIdentifier:", v11, v28);

  -[ICDocCamScannedDocumentEditor undoManager](self, "undoManager");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v24;
  if (v7)
    v26 = CFSTR("Apply Markup");
  else
    v26 = CFSTR("Discard Markup");
  objc_msgSend(v24, "localizedStringForKey:value:table:", v26, &stru_1EA7E9860, 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setActionName:", v27);

}

- (id)subAttachmentWithIdentifier:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v4 = (void *)MEMORY[0x1E0D639F0];
  v5 = a3;
  -[ICDocCamScannedDocumentEditor galleryAttachment](self, "galleryAttachment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "managedObjectContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "attachmentWithIdentifier:context:", v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "parentAttachment");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamScannedDocumentEditor galleryAttachment](self, "galleryAttachment");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 == v10)
  {
    v13 = v8;
  }
  else
  {
    v11 = (void *)MEMORY[0x1E0D641A0];
    objc_msgSend(v8, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICDocCamScannedDocumentEditor subAttachmentWithIdentifier:]", 1, 0, CFSTR("Trying to get sub attachment with identifier, but the parent is not the gallery attachment. %@"), v12);

    v13 = 0;
  }

  return v13;
}

- (unint64_t)indexForAttachmentWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  unint64_t v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0x7FFFFFFFFFFFFFFFLL;
  -[ICDocCamScannedDocumentEditor galleryModel](self, "galleryModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __66__ICDocCamScannedDocumentEditor_indexForAttachmentWithIdentifier___block_invoke;
  v9[3] = &unk_1EA7DD160;
  v6 = v4;
  v10 = v6;
  v11 = &v12;
  objc_msgSend(v5, "enumerateSubAttachmentsWithBlock:", v9);

  v7 = v13[3];
  _Block_object_dispose(&v12, 8);

  return v7;
}

uint64_t __66__ICDocCamScannedDocumentEditor_indexForAttachmentWithIdentifier___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, _BYTE *a5)
{
  uint64_t result;

  result = objc_msgSend(a3, "isEqualToString:", *(_QWORD *)(a1 + 32));
  if ((_DWORD)result)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a4;
    *a5 = 1;
  }
  return result;
}

- (NSUndoManager)undoManager
{
  return self->_undoManager;
}

- (void)setUndoManager:(id)a3
{
  objc_storeStrong((id *)&self->_undoManager, a3);
}

- (ICAttachment)galleryAttachment
{
  return self->_galleryAttachment;
}

- (void)setGalleryAttachment:(id)a3
{
  objc_storeStrong((id *)&self->_galleryAttachment, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_galleryAttachment, 0);
  objc_storeStrong((id *)&self->_undoManager, 0);
}

@end
