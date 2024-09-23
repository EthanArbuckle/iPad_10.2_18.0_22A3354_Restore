@implementation ICAttachmentGalleryModel

- (void)attachmentWillTurnIntoFault
{
  ICTTOrderedSetVersionedDocument *attachmentIdentifiersOrderedSetDocument;

  if (!-[ICAttachmentModel isMergeableDataDirty](self, "isMergeableDataDirty"))
  {
    attachmentIdentifiersOrderedSetDocument = self->_attachmentIdentifiersOrderedSetDocument;
    self->_attachmentIdentifiersOrderedSetDocument = 0;

  }
}

- (void)attachmentWillRefresh:(BOOL)a3
{
  ICTTOrderedSetVersionedDocument *attachmentIdentifiersOrderedSetDocument;

  if (!-[ICAttachmentModel isMergeableDataDirty](self, "isMergeableDataDirty", a3))
  {
    attachmentIdentifiersOrderedSetDocument = self->_attachmentIdentifiersOrderedSetDocument;
    self->_attachmentIdentifiersOrderedSetDocument = 0;

  }
}

- (void)attachmentDidRefresh:(BOOL)a3
{
  NSObject *v4;

  if (self->_attachmentIdentifiersOrderedSetDocument
    && -[ICAttachmentModel isMergeableDataDirty](self, "isMergeableDataDirty", a3))
  {
    v4 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      -[ICAttachmentGalleryModel attachmentDidRefresh:].cold.1(self);

  }
}

- (BOOL)hasPreviews
{
  return 1;
}

- (BOOL)canSaveURL
{
  return 1;
}

- (BOOL)canSaveURLWithOtherAttachments
{
  return 0;
}

- (id)previewImageTypeUTI
{
  return (id)objc_msgSend((id)*MEMORY[0x1E0CEC530], "identifier");
}

- (BOOL)hasThumbnailImage
{
  void *v3;
  void *v4;
  BOOL v5;
  void *v6;
  void *v7;

  -[ICAttachmentGalleryModel firstSubAttachment](self, "firstSubAttachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAttachmentModel attachment](self, "attachment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "markedForDeletion") & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(v3, "media");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "mediaURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v7 != 0;

  }
  return v5;
}

- (id)firstSubAttachment
{
  void *v3;

  v3 = -[ICAttachmentGalleryModel subAttachmentCount](self, "subAttachmentCount");
  if (v3)
  {
    -[ICAttachmentGalleryModel singleSubAttachmentAtIndex:](self, "singleSubAttachmentAtIndex:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (BOOL)attachmentHasMergeableData
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
  v6[2] = __54__ICAttachmentGalleryModel_attachmentHasMergeableData__block_invoke;
  v6[3] = &unk_1E76C7730;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v4, "performBlockAndWait:", v6);

  LOBYTE(v3) = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return (char)v3;
}

void __54__ICAttachmentGalleryModel_attachmentHasMergeableData__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "attachment");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mergeableData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v2 != 0;

}

- (id)titleForSubAttachment:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = a3;
  objc_msgSend(v4, "parentAttachment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAttachmentModel attachment](self, "attachment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 == v6
    && (-[ICAttachmentGalleryModel attachmentIdentifiersOrderedSet](self, "attachmentIdentifiersOrderedSet"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "identifier"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v7, "indexOfObject:", v8),
        v8,
        v7,
        v9 != 0x7FFFFFFFFFFFFFFFLL))
  {
    objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("%@ %ld"), CFSTR("%@ %ld"), 0, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x1E0CB3940];
    -[ICAttachmentModel attachment](self, "attachment");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "title");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringWithFormat:", v11, v14, v9 + 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)shouldGeneratePreviewAfterChangeInSubAttachmentWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__3;
  v15 = __Block_byref_object_dispose__3;
  v16 = 0;
  -[ICAttachmentModel attachment](self, "attachment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "managedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __90__ICAttachmentGalleryModel_shouldGeneratePreviewAfterChangeInSubAttachmentWithIdentifier___block_invoke;
  v10[3] = &unk_1E76C76B0;
  v10[4] = self;
  v10[5] = &v11;
  objc_msgSend(v6, "performBlockAndWait:", v10);

  v7 = (void *)v12[5];
  if (v7)
    v8 = objc_msgSend(v7, "isEqualToString:", v4);
  else
    v8 = 0;
  _Block_object_dispose(&v11, 8);

  return v8;
}

void __90__ICAttachmentGalleryModel_shouldGeneratePreviewAfterChangeInSubAttachmentWithIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "attachment");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "markedForDeletion") & 1) == 0)
  {
    v2 = objc_msgSend(*(id *)(a1 + 32), "subAttachmentCount");

    if (!v2)
      return;
    objc_msgSend(*(id *)(a1 + 32), "firstSubAttachment");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

  }
}

- (void)addSubAttachment:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;

  v6 = a3;
  -[ICAttachmentGalleryModel attachmentIdentifiersOrderedSet](self, "attachmentIdentifiersOrderedSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  -[ICAttachmentGalleryModel insertSubAttachment:atIndex:](self, "insertSubAttachment:atIndex:", v6, v5);
}

- (void)insertSubAttachment:(id)a3 atIndex:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  -[ICAttachmentModel attachment](self, "attachment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSubAttachmentsObject:", v6);

  -[ICAttachmentModel attachment](self, "attachment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setParentAttachment:", v8);

  objc_msgSend(v6, "updateChangeCountWithReason:", CFSTR("Inserted subattachment"));
  -[ICAttachmentGalleryModel attachmentIdentifiersOrderedSet](self, "attachmentIdentifiersOrderedSet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "insertObject:atIndex:", v10, a4);
  -[ICAttachmentModel setMergeableDataDirty:](self, "setMergeableDataDirty:", 1);
}

- (void)removeSubAttachment:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[ICAttachmentModel attachment](self, "attachment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeSubAttachmentsObject:", v4);

  -[ICAttachmentGalleryModel attachmentIdentifiersOrderedSet](self, "attachmentIdentifiersOrderedSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "removeObject:", v7);
  -[ICAttachmentModel setMergeableDataDirty:](self, "setMergeableDataDirty:", 1);
}

- (void)enumerateSubAttachmentsWithBlock:(id)a3
{
  void (**v4)(id, void *, void *, unint64_t, _BYTE *);
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  __int128 v19;
  unint64_t v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  int v27;
  void *v28;
  void *v29;
  __int128 v30;
  unsigned __int8 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t v36[4];
  uint64_t v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  void *v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *, void *, unint64_t, _BYTE *))a3;
  -[ICAttachmentModel attachment](self, "attachment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "subAttachments");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_alloc(MEMORY[0x1E0CB3748]);
  -[ICAttachmentModel attachment](self, "attachment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "subAttachments");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v7, "initWithKeyOptions:valueOptions:capacity:", 0x10000, 5, objc_msgSend(v9, "count"));

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v11 = v6;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v32, v42, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v33 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        objc_msgSend(v16, "identifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setObject:forKey:", v16, v17);

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v32, v42, 16);
    }
    while (v13);
  }

  -[ICAttachmentGalleryModel subAttachmentIdentifiers](self, "subAttachmentIdentifiers");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0;
  if (objc_msgSend(v18, "count"))
  {
    v20 = 0;
    *(_QWORD *)&v19 = 138412546;
    v30 = v19;
    do
    {
      objc_msgSend(v18, "objectAtIndex:", v20, v30);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v21)
        goto LABEL_21;
      objc_msgSend(v10, "objectForKey:", v21);
      v22 = objc_claimAutoreleasedReturnValue();
      if (v22)
      {
        v23 = v22;
        -[NSObject parentAttachment](v22, "parentAttachment");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICAttachmentModel attachment](self, "attachment");
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        if (v24 == v25)
          goto LABEL_20;
        v26 = os_log_create("com.apple.notes", "CoreData");
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
          -[ICAttachmentGalleryModel enumerateSubAttachmentsWithBlock:].cold.1(v36, v23, &v37, v26);

      }
      else
      {
        v26 = os_log_create("com.apple.notes", "CoreData");
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          -[ICAttachmentModel attachment](self, "attachment");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "identifier");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v30;
          v39 = v21;
          v40 = 2112;
          v41 = v29;
          _os_log_error_impl(&dword_1BD918000, v26, OS_LOG_TYPE_ERROR, "Attachment not found: %@, when enumerating: %@", buf, 0x16u);

        }
        v23 = v26;
      }

      v23 = 0;
LABEL_20:
      v4[2](v4, v23, v21, v20, &v31);
      v27 = v31;

      if (v27)
      {

        break;
      }
LABEL_21:

      ++v20;
    }
    while (v20 < objc_msgSend(v18, "count"));
  }

}

- (unint64_t)indexOfSubAttachmentWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;

  v4 = a3;
  -[ICAttachmentGalleryModel subAttachmentIdentifiers](self, "subAttachmentIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexOfObject:", v4);

  return v6;
}

- (unint64_t)subAttachmentCount
{
  void *v3;
  unint64_t v4;

  if (!-[ICAttachmentGalleryModel attachmentHasMergeableData](self, "attachmentHasMergeableData"))
    return 0;
  -[ICAttachmentGalleryModel attachmentIdentifiersOrderedSet](self, "attachmentIdentifiersOrderedSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (NSArray)subAttachmentIdentifiers
{
  void *v3;
  void *v4;

  if (-[ICAttachmentGalleryModel attachmentHasMergeableData](self, "attachmentHasMergeableData"))
  {
    -[ICAttachmentGalleryModel attachmentIdentifiersOrderedSet](self, "attachmentIdentifiersOrderedSet");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "allObjects");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = (void *)MEMORY[0x1E0C9AA60];
  }
  return (NSArray *)v4;
}

- (id)subAttachmentIdentifierAtIndex:(unint64_t)a3
{
  void *v4;
  void *v5;

  -[ICAttachmentGalleryModel attachmentIdentifiersOrderedSet](self, "attachmentIdentifiersOrderedSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndex:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)singleSubAttachmentAtIndex:(unint64_t)a3
{
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
  NSObject *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  unint64_t v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  -[ICAttachmentGalleryModel subAttachmentIdentifierAtIndex:](self, "subAttachmentIdentifierAtIndex:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v19 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[ICAttachmentGalleryModel singleSubAttachmentAtIndex:].cold.1(self, a3, v19);
LABEL_21:

    v15 = 0;
    goto LABEL_22;
  }
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[ICAttachmentModel attachment](self, "attachment", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "subAttachments");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v33, 16);
  if (!v8)
  {
LABEL_10:
    v15 = v7;
LABEL_16:

LABEL_17:
    v19 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      -[ICAttachmentModel attachment](self, "attachment");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "identifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v28 = v5;
      v29 = 2112;
      v30 = v21;
      v31 = 2048;
      v32 = a3;
      _os_log_debug_impl(&dword_1BD918000, v19, OS_LOG_TYPE_DEBUG, "Sub attachment %@ not found in %@ at index %ld", buf, 0x20u);

    }
    goto LABEL_21;
  }
  v9 = v8;
  v10 = *(_QWORD *)v24;
LABEL_4:
  v11 = 0;
  while (1)
  {
    if (*(_QWORD *)v24 != v10)
      objc_enumerationMutation(v7);
    v12 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v11);
    objc_msgSend(v12, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isEqualToString:", v5);

    if ((v14 & 1) != 0)
      break;
    if (v9 == ++v11)
    {
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v33, 16);
      if (v9)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  v15 = v12;

  if (!v15)
    goto LABEL_17;
  objc_msgSend(v15, "parentAttachment");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAttachmentModel attachment](self, "attachment");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16 != v17)
  {
    v18 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      -[ICAttachmentGalleryModel singleSubAttachmentAtIndex:].cold.2(v15);

    goto LABEL_16;
  }
LABEL_22:

  return v15;
}

+ (id)contentInfoTextWithAttachmentCount:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("NOTE_LIST_SCANNED_DOCUMENTS_%lu"), CFSTR("NOTE_LIST_SCANNED_DOCUMENTS_%lu"), 0, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringWithFormat:", v5, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (ICTTOrderedSetVersionedDocument)attachmentIdentifiersOrderedSetDocument
{
  ICTTOrderedSetVersionedDocument *attachmentIdentifiersOrderedSetDocument;
  void *v4;
  void *v5;
  ICTTOrderedSetVersionedDocument *v6;
  ICTTOrderedSetVersionedDocument *v7;
  ICTTOrderedSetVersionedDocument *v8;
  _QWORD v10[7];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  attachmentIdentifiersOrderedSetDocument = self->_attachmentIdentifiersOrderedSetDocument;
  if (!attachmentIdentifiersOrderedSetDocument)
  {
    v17 = 0;
    v18 = &v17;
    v19 = 0x3032000000;
    v20 = __Block_byref_object_copy__3;
    v21 = __Block_byref_object_dispose__3;
    v22 = 0;
    v11 = 0;
    v12 = &v11;
    v13 = 0x3032000000;
    v14 = __Block_byref_object_copy__3;
    v15 = __Block_byref_object_dispose__3;
    v16 = 0;
    -[ICAttachmentModel attachment](self, "attachment");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "managedObjectContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __67__ICAttachmentGalleryModel_attachmentIdentifiersOrderedSetDocument__block_invoke;
    v10[3] = &unk_1E76C7A60;
    v10[4] = self;
    v10[5] = &v17;
    v10[6] = &v11;
    objc_msgSend(v5, "performBlockAndWait:", v10);

    v6 = [ICTTOrderedSetVersionedDocument alloc];
    v7 = -[ICTTVersionedDocument initWithData:replicaID:](v6, "initWithData:replicaID:", v18[5], v12[5]);
    v8 = self->_attachmentIdentifiersOrderedSetDocument;
    self->_attachmentIdentifiersOrderedSetDocument = v7;

    _Block_object_dispose(&v11, 8);
    _Block_object_dispose(&v17, 8);

    attachmentIdentifiersOrderedSetDocument = self->_attachmentIdentifiersOrderedSetDocument;
  }
  return attachmentIdentifiersOrderedSetDocument;
}

void __67__ICAttachmentGalleryModel_attachmentIdentifiersOrderedSetDocument__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(*(id *)(a1 + 32), "attachment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mergeableData");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  objc_msgSend(*(id *)(a1 + 32), "currentReplicaID");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

- (ICCROrderedSet)attachmentIdentifiersOrderedSet
{
  void *v3;
  void *v4;
  void *v5;

  objc_opt_class();
  -[ICAttachmentGalleryModel attachmentIdentifiersOrderedSetDocument](self, "attachmentIdentifiersOrderedSetDocument");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "orderedSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  ICCheckedDynamicCast();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (ICCROrderedSet *)v5;
}

- (BOOL)mergeWithMergeableData:(id)a3 mergeableFieldState:(id)a4
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  ICTTOrderedSetVersionedDocument *v14;
  void *v15;
  ICTTOrderedSetVersionedDocument *v16;
  void *v17;
  uint64_t v18;
  BOOL v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  if (!a3)
    return 0;
  v5 = a3;
  v6 = os_log_create("com.apple.notes", "Topotext");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[ICAttachmentGalleryModel mergeWithMergeableData:mergeableFieldState:].cold.2(v6, v7, v8, v9, v10, v11, v12, v13);

  v14 = [ICTTOrderedSetVersionedDocument alloc];
  -[ICAttachmentModel currentReplicaID](self, "currentReplicaID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[ICTTVersionedDocument initWithData:replicaID:](v14, "initWithData:replicaID:", v5, v15);

  -[ICAttachmentGalleryModel attachmentIdentifiersOrderedSetDocument](self, "attachmentIdentifiersOrderedSetDocument");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "mergeWithOrderedSetVersionedDocument:", v16);

  v19 = v18 == 2;
  if (v18 == 2)
  {
    -[ICAttachmentModel attachment](self, "attachment");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "previewUpdateDate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAttachmentModel attachment](self, "attachment");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "modificationDate");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v21, "compare:", v23);

    if (v24 != -1)
    {
      -[ICAttachmentModel attachment](self, "attachment");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setPreviewUpdateDate:", 0);

    }
    v26 = os_log_create("com.apple.notes", "Topotext");
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      -[ICAttachmentGalleryModel mergeWithMergeableData:mergeableFieldState:].cold.1(v26, v27, v28, v29, v30, v31, v32, v33);

    -[ICAttachmentModel setMergeableDataDirty:](self, "setMergeableDataDirty:", 1);
  }

  return v19;
}

- (void)writeMergeableData
{
  void *v3;
  void *v4;
  id v5;

  if (-[ICAttachmentModel isMergeableDataDirty](self, "isMergeableDataDirty"))
    -[ICAttachmentModel setMergeableDataDirty:](self, "setMergeableDataDirty:", 0);
  -[ICAttachmentGalleryModel attachmentIdentifiersOrderedSetDocument](self, "attachmentIdentifiersOrderedSetDocument");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "serialize");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAttachmentModel attachment](self, "attachment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMergeableData:", v3);

}

- (signed)sectionForSubAttachments
{
  return 7;
}

- (void)updateAfterLoadWithSubAttachmentIdentifierMap:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  __int128 v18;
  id obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  void *v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[ICAttachmentGalleryModel attachmentIdentifiersOrderedSet](self, "attachmentIdentifiersOrderedSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICAttachmentGalleryModel attachmentIdentifiersOrderedSet](self, "attachmentIdentifiersOrderedSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeAllObjects");

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = v6;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v8)
  {
    v10 = v8;
    v11 = *(_QWORD *)v21;
    *(_QWORD *)&v9 = 138412290;
    v18 = v9;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(obj);
        v13 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v4, "objectForKeyedSubscript:", v13, v18);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = os_log_create("com.apple.notes", "CoreData");
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          v25 = v13;
          v26 = 2112;
          v27 = v14;
          _os_log_debug_impl(&dword_1BD918000, v15, OS_LOG_TYPE_DEBUG, "Update sub attachment after load: %@ => %@", buf, 0x16u);
        }

        if (v14)
        {
          -[ICAttachmentGalleryModel attachmentIdentifiersOrderedSet](self, "attachmentIdentifiersOrderedSet");
          v16 = objc_claimAutoreleasedReturnValue();
          -[NSObject addObject:](v16, "addObject:", v14);
        }
        else
        {
          v16 = os_log_create("com.apple.notes", "CoreData");
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v18;
            v25 = v13;
            _os_log_error_impl(&dword_1BD918000, v16, OS_LOG_TYPE_ERROR, "Unable to map from %@ to new identifier", buf, 0xCu);
          }
        }

      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    }
    while (v10);
  }

  if (objc_msgSend(obj, "count"))
  {
    -[ICAttachmentModel setMergeableDataDirty:](self, "setMergeableDataDirty:", 1);
    -[ICAttachmentModel attachment](self, "attachment");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "saveMergeableDataIfNeeded");

  }
}

- (void)updateAttachmentMarkedForDeletionStateAttachmentIsInUse:(BOOL)a3
{
  void *v4;
  void *v5;
  char v6;
  void *v7;
  char v8;
  void *v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  ICAttachmentGalleryModel *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  __int128 v28;
  ICAttachmentGalleryModel *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  objc_super v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  void *v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v34.receiver = self;
  v34.super_class = (Class)ICAttachmentGalleryModel;
  -[ICAttachmentModel updateAttachmentMarkedForDeletionStateAttachmentIsInUse:](&v34, sel_updateAttachmentMarkedForDeletionStateAttachmentIsInUse_, a3);
  -[ICAttachmentModel attachment](self, "attachment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "needsInitialFetchFromCloud") & 1) == 0)
  {
    -[ICAttachmentModel attachment](self, "attachment");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "hasChanges");

    if ((v6 & 1) != 0)
      return;
    -[ICAttachmentModel attachment](self, "attachment");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "markedForDeletion");

    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v29 = self;
    -[ICAttachmentModel attachment](self, "attachment");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "subAttachments");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
    if (v10)
    {
      v12 = v10;
      v13 = *(_QWORD *)v31;
      *(_QWORD *)&v11 = 138412546;
      v28 = v11;
      v14 = self;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v31 != v13)
            objc_enumerationMutation(v4);
          v16 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v15);
          if ((v8 & 1) != 0
            || (-[ICAttachmentGalleryModel attachmentIdentifiersOrderedSet](v14, "attachmentIdentifiersOrderedSet"),
                v17 = (void *)objc_claimAutoreleasedReturnValue(),
                objc_msgSend(v16, "identifier"),
                v18 = (void *)objc_claimAutoreleasedReturnValue(),
                v19 = objc_msgSend(v17, "containsObject:", v18),
                v18,
                v17,
                (v19 & 1) == 0))
          {
            if ((objc_msgSend(v16, "markedForDeletion", v28) & 1) == 0)
            {
              v21 = os_log_create("com.apple.notes", "CoreData");
              if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
              {
                objc_msgSend(v16, "identifier");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                -[ICAttachmentModel attachment](v14, "attachment");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v23, "identifier");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = v28;
                v36 = v22;
                v37 = 2112;
                v38 = v24;
                _os_log_debug_impl(&dword_1BD918000, v21, OS_LOG_TYPE_DEBUG, "Gallery model deleting subattachment %@ %@", buf, 0x16u);

                v14 = v29;
              }

              +[ICAttachment deleteAttachment:](ICAttachment, "deleteAttachment:", v16);
            }
          }
          else if (objc_msgSend(v16, "markedForDeletion"))
          {
            v20 = os_log_create("com.apple.notes", "CoreData");
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(v16, "identifier");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              -[ICAttachmentModel attachment](v29, "attachment");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "identifier");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v28;
              v36 = v25;
              v37 = 2112;
              v38 = v27;
              _os_log_debug_impl(&dword_1BD918000, v20, OS_LOG_TYPE_DEBUG, "Gallery model un-deleting subattachment %@ %@", buf, 0x16u);

              v14 = v29;
            }

            +[ICAttachment undeleteAttachment:](ICAttachment, "undeleteAttachment:", v16);
          }
          ++v15;
        }
        while (v12 != v15);
        v12 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
      }
      while (v12);
    }
  }

}

- (void)undeleteSubAttachments
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[ICAttachmentModel attachment](self, "attachment", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "subAttachments");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v8);
        -[ICAttachmentGalleryModel attachmentIdentifiersOrderedSet](self, "attachmentIdentifiersOrderedSet");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v10, "containsObject:", v11);

        if (v12)
          +[ICAttachment undeleteAttachment:](ICAttachment, "undeleteAttachment:", v9);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

}

- (BOOL)providesStandaloneTitleForNote
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;

  -[ICAttachmentModel attachment](self, "attachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[ICAttachmentModel attachment](self, "attachment");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "defaultTitle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v4, "isEqualToString:", v6) ^ 1;

  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (id)standaloneTitleForNote
{
  void *v2;
  void *v3;

  -[ICAttachmentModel attachment](self, "attachment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)searchableTextContent
{
  void *v2;
  void *v3;

  -[ICAttachmentGalleryModel searchableStringArray](self, "searchableStringArray");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "componentsJoinedByString:", CFSTR(" "));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)searchableStringArray
{
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __49__ICAttachmentGalleryModel_searchableStringArray__block_invoke;
  v6[3] = &unk_1E76C7A88;
  v4 = v3;
  v7 = v4;
  -[ICAttachmentGalleryModel enumerateSubAttachmentsWithBlock:](self, "enumerateSubAttachmentsWithBlock:", v6);

  return v4;
}

void __49__ICAttachmentGalleryModel_searchableStringArray__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "summary");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ic_addNonNilObject:", v3);

}

- (int64_t)previewImageOrientation
{
  id v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ICAttachmentGalleryModel;
  v3 = -[ICAttachmentModel previewImageOrientation](&v7, sel_previewImageOrientation);
  if (-[ICAttachmentGalleryModel subAttachmentCount](self, "subAttachmentCount"))
  {
    -[ICAttachmentGalleryModel firstSubAttachment](self, "firstSubAttachment");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "attachmentModel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (id)objc_msgSend(v5, "previewImageOrientation");

  }
  return (int64_t)v3;
}

- (void)setAttachmentIdentifiersOrderedSetDocument:(id)a3
{
  objc_storeStrong((id *)&self->_attachmentIdentifiersOrderedSetDocument, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attachmentIdentifiersOrderedSetDocument, 0);
}

- (void)attachmentDidRefresh:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  objc_msgSend(a1, "attachment");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4(&dword_1BD918000, v3, v4, "Had a dirty attachment gallery document after refresh: %@", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)enumerateSubAttachmentsWithBlock:(_QWORD *)a3 .cold.1(uint8_t *a1, void *a2, _QWORD *a3, NSObject *a4)
{
  void *v7;

  objc_msgSend(a2, "shortLoggingDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_debug_impl(&dword_1BD918000, a4, OS_LOG_TYPE_DEBUG, "Parent attachment not synced yet for: %@", a1, 0xCu);

}

- (void)singleSubAttachmentAtIndex:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "attachment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 134218242;
  v8 = a2;
  v9 = 2112;
  v10 = v6;
  _os_log_error_impl(&dword_1BD918000, a3, OS_LOG_TYPE_ERROR, "Unable to find identifier at index: %ld, for attachment: %@", (uint8_t *)&v7, 0x16u);

  OUTLINED_FUNCTION_2();
}

- (void)singleSubAttachmentAtIndex:(void *)a1 .cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4(&dword_1BD918000, v2, v3, "Parent attachment not synced yet for: %@", v4, v5, v6, v7, 2u);

}

- (void)mergeWithMergeableData:(uint64_t)a3 mergeableFieldState:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_1(&dword_1BD918000, a1, a3, "Gallery updated", a5, a6, a7, a8, 0);
}

- (void)mergeWithMergeableData:(uint64_t)a3 mergeableFieldState:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_1(&dword_1BD918000, a1, a3, "Gallery mergeWithMergeableData", a5, a6, a7, a8, 0);
}

@end
