@implementation ICAttachmentModel

- (NSString)previewImageTypeUTI
{
  return (NSString *)objc_msgSend((id)*MEMORY[0x1E0CEC580], "identifier");
}

void __41__ICAttachmentModel_intrinsicContentSize__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "attachment");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sizeWidth");
  v3 = v2;
  objc_msgSend(*(id *)(a1 + 32), "attachment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sizeHeight");
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  *(_QWORD *)(v5 + 32) = v3;
  *(_QWORD *)(v5 + 40) = v6;

}

- (ICAttachment)attachment
{
  return (ICAttachment *)objc_loadWeakRetained((id *)&self->_attachment);
}

- (BOOL)hasThumbnailImage
{
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;
  void *v7;

  -[ICAttachmentModel attachment](self, "attachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "markedForDeletion") & 1) != 0)
  {
    v4 = 0;
  }
  else if (-[ICAttachmentModel hasPreviews](self, "hasPreviews"))
  {
    v4 = 1;
  }
  else
  {
    -[ICAttachmentModel attachment](self, "attachment");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "media");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "mediaURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v7 != 0;

  }
  return v4;
}

- (ICAttachmentModel)initWithAttachment:(id)a3
{
  id v4;
  ICAttachmentModel *v5;
  ICAttachmentModel *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ICAttachmentModel;
  v5 = -[ICAttachmentModel init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_attachment, v4);

  return v6;
}

+ (Class)modelClassForAttachmentType:(signed __int16)a3
{
  objc_opt_class();
  return (Class)(id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)shouldShowInContentInfoText
{
  return 1;
}

- (BOOL)isIncludedInGenericAttachmentCount
{
  return 1;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_attachment);
}

- (void)dealloc
{
  objc_super v3;

  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[ICAttachmentModel attachmentModelDealloc](self, "attachmentModelDealloc");
  v3.receiver = self;
  v3.super_class = (Class)ICAttachmentModel;
  -[ICAttachmentModel dealloc](&v3, sel_dealloc);
}

- (int64_t)previewImageOrientation
{
  return 0;
}

- (CGSize)intrinsicContentSize
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  _QWORD v9[6];
  uint64_t v10;
  double *v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  CGSize result;

  v10 = 0;
  v11 = (double *)&v10;
  v12 = 0x3010000000;
  v13 = &unk_1BDC8BD37;
  v14 = *MEMORY[0x1E0C9D820];
  -[ICAttachmentModel attachment](self, "attachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __41__ICAttachmentModel_intrinsicContentSize__block_invoke;
  v9[3] = &unk_1E76C7730;
  v9[4] = self;
  v9[5] = &v10;
  objc_msgSend(v4, "performBlockAndWait:", v9);

  v5 = v11[4];
  v6 = v11[5];
  _Block_object_dispose(&v10, 8);
  v7 = v5;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)updateAttachmentMarkedForDeletionStateAttachmentIsInUse:(BOOL)a3
{
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[ICAttachmentModel attachment](self, "attachment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (a3)
  {
    if (objc_msgSend(v5, "needsInitialRelationshipSetup"))
    {
      v7 = os_log_create("com.apple.notes", "CoreData");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v6, "identifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v20 = v8;
        _os_log_impl(&dword_1BD918000, v7, OS_LOG_TYPE_INFO, "Setting needsInitialRelationshipSetup=NO on %@", buf, 0xCu);

      }
      objc_msgSend(v6, "setNeedsInitialRelationshipSetup:", 0);
    }
  }
  else if ((objc_msgSend(v5, "needsInitialFetchFromCloud") & 1) == 0
         && (objc_msgSend(v6, "isBeingEditedLocallyOnDevice") & 1) == 0)
  {
    v9 = objc_msgSend(v6, "needsInitialRelationshipSetup") ^ 1;
    goto LABEL_9;
  }
  v9 = 0;
LABEL_9:
  if (!objc_msgSend(v6, "markedForDeletion") || (v9 & 1) != 0)
  {
    if ((objc_msgSend(v6, "markedForDeletion") & 1) == 0 && ((v9 ^ 1) & 1) == 0)
    {
      v12 = os_log_create("com.apple.notes", "CoreData");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v6, "shortLoggingDescription");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v20 = v13;
        _os_log_impl(&dword_1BD918000, v12, OS_LOG_TYPE_INFO, "Marking attachment for deletion because it is not in use: %@", buf, 0xCu);

      }
      +[ICAttachment deleteAttachment:](ICAttachment, "deleteAttachment:", v6);
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICAttachmentModel attachment](self, "attachment", CFSTR("ICAttachmentDeletedNotificationAttachmentKey"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v15;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "postNotificationName:object:userInfo:", CFSTR("ICAttachmentDeletedNotification"), 0, v16);

    }
  }
  else
  {
    v10 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v6, "shortLoggingDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v20 = v11;
      _os_log_impl(&dword_1BD918000, v10, OS_LOG_TYPE_INFO, "Unmarking attachment for deletion because it is in use: %@", buf, 0xCu);

    }
    +[ICAttachment undeleteAttachment:](ICAttachment, "undeleteAttachment:", v6);
  }

}

+ (id)contentInfoTextWithAttachmentCount:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("NOTE_LIST_ATTACHMENTS_%lu"), CFSTR("NOTE_LIST_ATTACHMENTS_%lu"), 0, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringWithFormat:", v5, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSUUID)currentReplicaID
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[ICAttachmentModel attachment](self, "attachment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentReplicaID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return (NSUUID *)v6;
}

- (BOOL)mergeWithMergeableData:(id)a3
{
  return -[ICAttachmentModel mergeWithMergeableData:mergeableFieldState:](self, "mergeWithMergeableData:mergeableFieldState:", a3, 0);
}

- (BOOL)mergeWithMergeableData:(id)a3 mergeableFieldState:(id)a4
{
  id v5;
  void *v6;

  v5 = a3;
  -[ICAttachmentModel attachment](self, "attachment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setMergeableData:", v5);

  return 0;
}

- (void)writeMergeableData
{
  -[ICAttachmentModel setMergeableDataDirty:](self, "setMergeableDataDirty:", 0);
}

- (void)addMergeableDataToCloudKitRecord:(id)a3 approach:(int64_t)a4 mergeableFieldState:(id)a5
{
  id v7;
  void *v8;
  int v9;
  void *v10;
  id v11;

  v7 = a3;
  -[ICAttachmentModel attachment](self, "attachment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isPasswordProtected");

  if (v9)
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "!self.attachment.isPasswordProtected", "-[ICAttachmentModel addMergeableDataToCloudKitRecord:approach:mergeableFieldState:]", 1, 0, CFSTR("Locked notes should use encrypted values JSON instead"));
  -[ICAttachmentModel attachment](self, "attachment");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "mergeableData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "ic_setEncryptedInlineableDataAsset:forKeyPrefix:approach:", v10, CFSTR("MergeableData"), a4);

}

- (void)mergeMergeableDataFromCloudKitRecord:(id)a3 approach:(int64_t)a4 mergeableFieldState:(id)a5
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  id v13;

  v13 = a5;
  objc_msgSend(a3, "ic_encryptedInlineableDataAssetForKeyPrefix:", CFSTR("MergeableData"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[ICAttachmentModel mergeWithMergeableData:mergeableFieldState:](self, "mergeWithMergeableData:mergeableFieldState:", v7, v13);
    if (-[ICAttachmentModel providesTextContentInNote](self, "providesTextContentInNote"))
    {
      -[ICAttachmentModel regenerateTextContentInNote](self, "regenerateTextContentInNote");
      -[ICAttachmentModel attachment](self, "attachment");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "note");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v9, "needsInitialFetchFromCloud") & 1) != 0)
      {
LABEL_6:

        goto LABEL_7;
      }
      -[ICAttachmentModel attachment](self, "attachment");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isInNoteTitleOrSnippet");

      if (v11)
      {
        -[ICAttachmentModel attachment](self, "attachment");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "note");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "regenerateTitle:snippet:", 1, 1);
        goto LABEL_6;
      }
    }
LABEL_7:
    -[ICAttachmentModel attachment](self, "attachment");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "saveMergeableDataIfNeeded");

  }
}

- (BOOL)hasPreviews
{
  return 0;
}

- (BOOL)previewsSupportMultipleAppearances
{
  return 0;
}

- (BOOL)preferLocalPreviewImages
{
  return 0;
}

- (BOOL)needsFullSizePreview
{
  return 0;
}

- (BOOL)requiresPostProcessing
{
  return -[ICAttachmentModel supportsOCR](self, "supportsOCR")
      || -[ICAttachmentModel supportsImageClassification](self, "supportsImageClassification");
}

- (BOOL)supportsOCR
{
  return 0;
}

- (BOOL)supportsImageClassification
{
  return 0;
}

- (NSString)hardLinkVersion
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  void *v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__22;
  v14 = __Block_byref_object_dispose__22;
  v15 = 0;
  -[ICAttachmentModel attachment](self, "attachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __36__ICAttachmentModel_hardLinkVersion__block_invoke;
  v9[3] = &unk_1E76C7730;
  v9[4] = self;
  v9[5] = &v10;
  objc_msgSend(v4, "performBlockAndWait:", v9);

  v5 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)v11[5], "timeIntervalSince1970");
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%ld"), (uint64_t)v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(&v10, 8);

  return (NSString *)v7;
}

void __36__ICAttachmentModel_hardLinkVersion__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "attachment");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "modificationDate");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (BOOL)showThumbnailInNoteList
{
  return 0;
}

- (BOOL)canMarkup
{
  return 0;
}

- (NSURL)saveURL
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
  v11 = __Block_byref_object_copy__22;
  v12 = __Block_byref_object_dispose__22;
  v13 = 0;
  -[ICAttachmentModel attachment](self, "attachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __28__ICAttachmentModel_saveURL__block_invoke;
  v7[3] = &unk_1E76C7730;
  v7[4] = self;
  v7[5] = &v8;
  objc_msgSend(v4, "performBlockAndWait:", v7);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (NSURL *)v5;
}

void __28__ICAttachmentModel_saveURL__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "attachment");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "media");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mediaURL");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (BOOL)canSaveURL
{
  void *v2;
  BOOL v3;

  -[ICAttachmentModel saveURL](self, "saveURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)canSaveURLWithOtherAttachments
{
  return 1;
}

- (id)searchableTextContent
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAttachmentModel searchableTextContentForLocation](self, "searchableTextContentForLocation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v3, "appendString:", v4);

  return v3;
}

- (id)searchableTextContentForLocation
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[ICAttachmentModel attachment](self, "attachment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "location");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 && objc_msgSend(v3, "placeUpdated"))
  {
    objc_msgSend(v3, "placemark");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend(v3, "searchStrings");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "componentsJoinedByString:", CFSTR(" "));
      v4 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)searchableTextContentInNote
{
  return 0;
}

- (BOOL)providesTextContentInNote
{
  return 0;
}

- (id)textContentInNote
{
  return 0;
}

- (BOOL)providesStandaloneTitleForNote
{
  return 0;
}

- (id)standaloneTitleForNote
{
  return 0;
}

- (id)additionalIndexableTextContentInNote
{
  return 0;
}

- (signed)sectionForSubAttachments
{
  return 0;
}

- (BOOL)hidesSubAttachmentsInAttachmentBrowser
{
  return 0;
}

- (BOOL)shouldSyncPreviewImageToCloud:(id)a3
{
  return 1;
}

- (BOOL)shouldGeneratePreviewAfterChangeInSubAttachmentWithIdentifier:(id)a3
{
  return 0;
}

- (BOOL)shouldCropImage
{
  return 0;
}

- (BOOL)hasDeepLink
{
  return 0;
}

- (BOOL)shouldUsePlaceholderBoundsIfNecessary
{
  return 0;
}

- (NSString)placeholderImageSystemName
{
  return 0;
}

- (double)placeholderWidth
{
  return 0.0;
}

- (double)placeholderHeight
{
  return 0.0;
}

- (void)deleteChildAttachments
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[ICAttachmentModel attachment](self, "attachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "subAttachments");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v20;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v20 != v7)
          objc_enumerationMutation(v4);
        +[ICAttachment deleteAttachment:](ICAttachment, "deleteAttachment:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v6);
  }

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[ICAttachmentModel attachment](self, "attachment", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "inlineAttachments");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        +[ICBaseAttachment deleteAttachment:](ICInlineAttachment, "deleteAttachment:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v14++));
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v12);
  }

}

- (void)undeleteChildAttachments
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[ICAttachmentModel attachment](self, "attachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "subAttachments");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v20;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v20 != v7)
          objc_enumerationMutation(v4);
        +[ICAttachment undeleteAttachment:](ICAttachment, "undeleteAttachment:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v6);
  }

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[ICAttachmentModel attachment](self, "attachment", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "inlineAttachments");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        +[ICBaseAttachment undeleteAttachment:](ICInlineAttachment, "undeleteAttachment:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v14++));
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v12);
  }

}

- (BOOL)isReadyToPresent
{
  void *v3;
  int v4;
  void *v5;

  -[ICAttachmentModel attachment](self, "attachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "needsToBeRequested") & 1) != 0)
  {
    LOBYTE(v4) = 0;
  }
  else
  {
    -[ICAttachmentModel attachment](self, "attachment");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "isUnsupported") ^ 1;

  }
  return v4;
}

- (void)updateFileBasedAttributes
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  id v37;
  id v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
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
    v8 = objc_msgSend(v7, "isPasswordProtected");

    -[ICAttachmentModel attachment](self, "attachment");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "media");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v8)
      objc_msgSend(v10, "encryptedMediaURL");
    else
      objc_msgSend(v10, "mediaURL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v38 = 0;
    v13 = *MEMORY[0x1E0C99998];
    objc_msgSend(v12, "getResourceValue:forKey:error:", &v38, *MEMORY[0x1E0C99998], 0);
    v14 = v38;
    if (v14)
    {
      v15 = v14;
      v16 = objc_msgSend(v14, "integerValue");
    }
    else
    {
      v37 = 0;
      objc_msgSend(v12, "getResourceValue:forKey:error:", &v37, *MEMORY[0x1E0C999D0], 0);
      v15 = v37;
      if (objc_msgSend(v15, "BOOLValue"))
      {
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v13);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = v17;
        v31 = v12;
        objc_msgSend(v17, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v12, v18, 0, 0);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        v35 = 0u;
        v36 = 0u;
        v33 = 0u;
        v34 = 0u;
        v20 = v19;
        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
        if (v21)
        {
          v22 = v21;
          v16 = 0;
          v23 = *(_QWORD *)v34;
          do
          {
            v24 = 0;
            v25 = v15;
            do
            {
              if (*(_QWORD *)v34 != v23)
                objc_enumerationMutation(v20);
              v26 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v24);
              v32 = 0;
              v27 = objc_msgSend(v26, "getResourceValue:forKey:error:", &v32, v13, 0);
              v15 = v32;

              if (v27)
                v16 += objc_msgSend(v15, "integerValue");
              ++v24;
              v25 = v15;
            }
            while (v22 != v24);
            v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
          }
          while (v22);
        }
        else
        {
          v16 = 0;
        }

        v12 = v31;
      }
      else
      {
        v16 = 0;
      }
    }
    -[ICAttachmentModel attachment](self, "attachment");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setFileSize:", v16);

    -[ICAttachmentModel attachment](self, "attachment");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "updateChangeCountWithReason:", CFSTR("Updated file-based attributes"));

  }
}

- (CGAffineTransform)previewImageOrientationTransform
{
  uint64_t v3;
  __int128 v4;

  v3 = MEMORY[0x1E0C9BAA8];
  v4 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&retstr->c = v4;
  *(_OWORD *)&retstr->tx = *(_OWORD *)(v3 + 32);
  return self;
}

- (id)localizedFallbackTitle
{
  return 0;
}

- (id)localizedFallbackSubtitleIOS
{
  return 0;
}

- (id)localizedFallbackSubtitleMac
{
  return 0;
}

- (BOOL)usesChildAttachment:(id)a3
{
  return 1;
}

- (AVAsset)asset
{
  return 0;
}

- (void)assetWithCompletion:(id)a3
{
  id v5;
  id v6;

  if (a3)
  {
    v5 = a3;
    -[ICAttachmentModel asset](self, "asset");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, id))a3 + 2))(v5, v6);

  }
}

- (id)attributesForSharingHTMLWithTagName:(id *)a3 textContent:(id *)a4
{
  return 0;
}

- (BOOL)canConvertToHTMLForSharing
{
  return 0;
}

+ (void)deletePreviewItemHardLinkURLs
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id obj;
  _QWORD v20[6];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _QWORD v31[4];
  id v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  NSTemporaryDirectory();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("HardLinkURLTemp"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeItemAtPath:error:", v3, 0);

  +[ICNoteContext sharedContext](ICNoteContext, "sharedContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "workerManagedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__22;
  v38 = __Block_byref_object_dispose__22;
  v39 = 0;
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __50__ICAttachmentModel_deletePreviewItemHardLinkURLs__block_invoke;
  v31[3] = &unk_1E76C7730;
  v33 = &v34;
  v32 = v6;
  v18 = v32;
  objc_msgSend(v32, "performBlockAndWait:", v31);
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = (id)v35[5];
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v40, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v28;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v28 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v9);
        v21 = 0;
        v22 = &v21;
        v23 = 0x3032000000;
        v24 = __Block_byref_object_copy__22;
        v25 = __Block_byref_object_dispose__22;
        v26 = 0;
        objc_msgSend(v10, "managedObjectContext");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v20[0] = MEMORY[0x1E0C809B0];
        v20[1] = 3221225472;
        v20[2] = __50__ICAttachmentModel_deletePreviewItemHardLinkURLs__block_invoke_2;
        v20[3] = &unk_1E76C7730;
        v20[4] = v10;
        v20[5] = &v21;
        objc_msgSend(v11, "performBlockAndWait:", v20);

        +[ICAccount accountUtilities](ICAccount, "accountUtilities");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "temporaryDirectoryURLForAccountIdentifier:", v22[5]);
        v13 = objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v13, "URLByAppendingPathComponent:isDirectory:", CFSTR("HardLinkURLTemp"), 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v14, "path");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v13) = objc_msgSend(v15, "isEqualToString:", v3);

        if ((v13 & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "removeItemAtURL:error:", v14, 0);

        }
        _Block_object_dispose(&v21, 8);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v40, 16);
    }
    while (v7);
  }

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "postNotificationName:object:", CFSTR("ICAttachmentModelDidDeleteHardLinksNotification"), 0);

  _Block_object_dispose(&v34, 8);
}

void __50__ICAttachmentModel_deletePreviewItemHardLinkURLs__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  +[ICAccount allAccountsInContext:](ICAccount, "allAccountsInContext:", *(_QWORD *)(a1 + 32));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __50__ICAttachmentModel_deletePreviewItemHardLinkURLs__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)hardLinkFolderURL
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[6];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  _QWORD v22[6];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__22;
  v27 = __Block_byref_object_dispose__22;
  v28 = 0;
  -[ICAttachmentModel attachment](self, "attachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __38__ICAttachmentModel_hardLinkFolderURL__block_invoke;
  v22[3] = &unk_1E76C7730;
  v22[4] = self;
  v22[5] = &v23;
  objc_msgSend(v4, "performBlockAndWait:", v22);

  +[ICAccount accountUtilities](ICAccount, "accountUtilities");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "temporaryDirectoryURLForAccountIdentifier:", v24[5]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "URLByAppendingPathComponent:isDirectory:", CFSTR("HardLinkURLTemp"), 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__22;
  v20 = __Block_byref_object_dispose__22;
  v21 = 0;
  -[ICAttachmentModel attachment](self, "attachment");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "managedObjectContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v5;
  v15[1] = 3221225472;
  v15[2] = __38__ICAttachmentModel_hardLinkFolderURL__block_invoke_2;
  v15[3] = &unk_1E76C7730;
  v15[4] = self;
  v15[5] = &v16;
  objc_msgSend(v10, "performBlockAndWait:", v15);

  objc_msgSend(v8, "URLByAppendingPathComponent:isDirectory:", v17[5], 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICAttachmentModel hardLinkVersion](self, "hardLinkVersion");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "URLByAppendingPathComponent:isDirectory:", v12, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v23, 8);

  return v13;
}

void __38__ICAttachmentModel_hardLinkFolderURL__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "attachment");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "note");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

void __38__ICAttachmentModel_hardLinkFolderURL__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "attachment");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)titleForSubAttachment:(id)a3
{
  return 0;
}

- (id)previewItemURL
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
  v11 = __Block_byref_object_copy__22;
  v12 = __Block_byref_object_dispose__22;
  v13 = 0;
  -[ICAttachmentModel attachment](self, "attachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __35__ICAttachmentModel_previewItemURL__block_invoke;
  v7[3] = &unk_1E76C76B0;
  v7[4] = self;
  v7[5] = &v8;
  objc_msgSend(v4, "performBlockAndWait:", v7);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __35__ICAttachmentModel_previewItemURL__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  char v33;

  if (objc_msgSend(*(id *)(a1 + 32), "needsFullSizePreview"))
  {
    objc_msgSend(*(id *)(a1 + 32), "attachment");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "media");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isPasswordProtected");

    if ((v4 & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "attachment");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "sizeWidth");
      v23 = v22;
      objc_msgSend(*(id *)(a1 + 32), "attachment");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "sizeHeight");
      v26 = v25;

      objc_msgSend(*(id *)(a1 + 32), "attachment");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "attachmentPreviewImageWithMinSize:scale:", v23, v26, 1.0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "orientedPreviewImageURL");
      v20 = objc_claimAutoreleasedReturnValue();
LABEL_10:
      v28 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v13 = *(void **)(v28 + 40);
      *(_QWORD *)(v28 + 40) = v20;
      goto LABEL_11;
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "attachment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "media");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mediaURL");
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v7)
  {

LABEL_7:
    objc_msgSend(*(id *)(a1 + 32), "attachment");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "URL");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "attachment");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v19;
    if (v18)
    {
      objc_msgSend(v19, "URL");
      v20 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!objc_msgSend(v19, "hasFallbackPDF"))
        goto LABEL_12;
      objc_msgSend(*(id *)(a1 + 32), "attachment");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v32, "isPasswordProtected");

      if ((v33 & 1) != 0)
        goto LABEL_13;
      objc_msgSend(*(id *)(a1 + 32), "attachment");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "fallbackPDFURL");
      v20 = objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_10;
  }
  v8 = (void *)v7;
  objc_msgSend(*(id *)(a1 + 32), "attachment");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "media");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isPasswordProtected");

  if ((v11 & 1) != 0)
    goto LABEL_7;
  objc_msgSend(*(id *)(a1 + 32), "attachment");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "media");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "prepareExportableMediaURL");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v14;

LABEL_11:
LABEL_12:

LABEL_13:
  objc_msgSend(*(id *)(a1 + 32), "generateHardLinkURLIfNecessaryForURL:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  v29 = objc_claimAutoreleasedReturnValue();
  v30 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v31 = *(void **)(v30 + 40);
  *(_QWORD *)(v30 + 40) = v29;

}

- (id)generateTemporaryURLWithExtension:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;

  v4 = a3;
  -[ICAttachmentModel hardLinkFolderURL](self, "hardLinkFolderURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLByAppendingPathComponent:isDirectory:", v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "URLByAppendingPathExtension:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "pathExtension");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v7) = objc_msgSend(v10, "isEqualToString:", v4);

  if ((v7 & 1) == 0)
  {
    objc_msgSend(v9, "URLByDeletingPathExtension");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "URLByAppendingPathExtension:", v4);
    v12 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v12;
  }

  return v9;
}

- (id)generateHardLinkURLIfNecessaryForURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[ICAttachmentModel attachment](self, "attachment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAttachmentModel generateHardLinkURLIfNecessaryForURL:withFileName:](self, "generateHardLinkURLIfNecessaryForURL:withFileName:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)generateHardLinkURLIfNecessaryForURL:(id)a3 withFileName:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  void *v26;
  id v27;
  NSObject *v28;
  id v30;
  uint8_t buf[4];
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "isFileURL") && objc_msgSend(v7, "length"))
  {
    objc_msgSend(v7, "ic_sanitizedFilenameString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v8, "length"))
      goto LABEL_5;
    objc_msgSend(v6, "lastPathComponent");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAttachmentModel attachment](self, "attachment");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "title");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v9, "isEqualToString:", v11);

    if ((v12 & 1) == 0)
    {
      -[ICAttachmentModel hardLinkFolderURL](self, "hardLinkFolderURL");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "URLByAppendingPathComponent:isDirectory:", v8, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "pathExtension");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICAttachmentModel correctedHardlinkURLFileExtensionForExtension:](self, "correctedHardlinkURLFileExtensionForExtension:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v13, "pathExtension");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "isEqualToString:", v16);

      if ((v18 & 1) == 0)
      {
        objc_msgSend(v13, "URLByAppendingPathExtension:", v16);
        v19 = objc_claimAutoreleasedReturnValue();

        v13 = (void *)v19;
      }
      if ((objc_msgSend(v13, "checkResourceIsReachableAndReturnError:", 0) & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "URLByDeletingLastPathComponent");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "removeItemAtURL:error:", v21, 0);

        objc_msgSend(v13, "URLByDeletingLastPathComponent");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "path");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v20, "fileExistsAtPath:", v23);

        if ((v24 & 1) == 0)
        {
          objc_msgSend(v13, "URLByDeletingLastPathComponent");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v25, 1, 0, 0);

        }
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = 0;
        objc_msgSend(v26, "linkItemAtURL:toURL:error:", v6, v13, &v30);
        v27 = v30;

        if (v27)
        {
          v28 = os_log_create("com.apple.notes", "Media");
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v32 = v27;
            _os_log_impl(&dword_1BD918000, v28, OS_LOG_TYPE_DEFAULT, "Error creating hard link for previewItemURL: %@", buf, 0xCu);
          }

        }
      }

    }
    else
    {
LABEL_5:
      v13 = v6;
    }

    v6 = v13;
  }

  return v6;
}

- (id)correctedHardlinkURLFileExtensionForExtension:(id)a3
{
  return a3;
}

- (id)previewItemTitle
{
  void *v2;
  void *v3;

  -[ICAttachmentModel attachment](self, "attachment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)supportsQuickLook
{
  void *v3;
  void *v4;
  void *v6;
  char v7;

  -[ICAttachmentModel attachment](self, "attachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "media");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    return 1;
  -[ICAttachmentModel attachment](self, "attachment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hasFallbackPDF");

  return v7;
}

- (id)dataForQuickLook
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;

  -[ICAttachmentModel attachment](self, "attachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "media");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICAttachmentModel attachment](self, "attachment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    objc_msgSend(v5, "media");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decryptedData");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = objc_msgSend(v5, "hasFallbackPDF");

    if (!v9)
    {
      v8 = 0;
      return v8;
    }
    -[ICAttachmentModel attachment](self, "attachment");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fallbackPDFData");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (id)providerFileTypes
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  -[ICAttachmentModel attachment](self, "attachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isPasswordProtected") & 1) != 0)
    goto LABEL_6;
  -[ICAttachmentModel attachment](self, "attachment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "media");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "hasFile") & 1) == 0)
  {

LABEL_6:
    return MEMORY[0x1E0C9AA60];
  }
  -[ICAttachmentModel attachment](self, "attachment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "typeUTI");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[ICAttachmentModel attachment](self, "attachment");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "typeUTI");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    return v10;
  }
  return MEMORY[0x1E0C9AA60];
}

- (id)fileURLForTypeIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v4 = a3;
  -[ICAttachmentModel attachment](self, "attachment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isPasswordProtected") & 1) != 0)
  {
    v6 = 0;
LABEL_12:

    goto LABEL_13;
  }
  -[ICAttachmentModel attachment](self, "attachment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "media");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isValid");

  if (v9)
  {
    -[ICAttachmentModel attachment](self, "attachment");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "typeUTI");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "isEqualToString:", v10) & 1) != 0)
    {

      goto LABEL_6;
    }
    if (!v4)
    {
      v6 = 0;
      goto LABEL_11;
    }
    v11 = objc_msgSend(v4, "length");

    if (!v11)
    {
LABEL_6:
      -[ICAttachmentModel attachment](self, "attachment");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "media");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "mediaURL");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:

      goto LABEL_12;
    }
  }
  v6 = 0;
LABEL_13:

  return v6;
}

- (id)dataForTypeIdentifier:(id)a3
{
  void *v3;
  void *v4;

  -[ICAttachmentModel fileURLForTypeIdentifier:](self, "fileURLForTypeIdentifier:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)mergeableDataForCopying:(id *)a3
{
  void *v4;
  void *v5;

  -[ICAttachmentModel persistPendingChanges](self, "persistPendingChanges", a3);
  -[ICAttachmentModel attachment](self, "attachment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mergeableData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)mergeableDataForCopying
{
  return -[ICAttachmentModel mergeableDataForCopying:](self, "mergeableDataForCopying:", 0);
}

- (BOOL)previewGenerationOperationCancelled
{
  return self->_previewGenerationOperationCancelled;
}

- (void)setPreviewGenerationOperationCancelled:(BOOL)a3
{
  self->_previewGenerationOperationCancelled = a3;
}

- (BOOL)isMergeableDataDirty
{
  return self->_mergeableDataDirty;
}

- (void)setMergeableDataDirty:(BOOL)a3
{
  self->_mergeableDataDirty = a3;
}

- (BOOL)isGeneratingPreviews
{
  return self->_generatingPreviews;
}

- (void)setGeneratingPreviews:(BOOL)a3
{
  self->_generatingPreviews = a3;
}

- (void)setHasDeepLink:(BOOL)a3
{
  self->_hasDeepLink = a3;
}

@end
