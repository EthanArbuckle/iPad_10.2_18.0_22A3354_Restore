@implementation ICAttachmentDrawingModel

- (ICAttachmentDrawingModel)initWithAttachment:(id)a3
{
  ICAttachmentDrawingModel *v3;
  ICAttachmentDrawingModel *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ICAttachmentDrawingModel;
  v3 = -[ICAttachmentModel initWithAttachment:](&v6, sel_initWithAttachment_, a3);
  v4 = v3;
  if (v3)
    -[ICAttachmentDrawingModel startObservingAttachment](v3, "startObservingAttachment");
  return v4;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[ICAttachmentModel attachment](self, "attachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[ICAttachmentModel attachment](self, "attachment");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAttachmentDrawingModel stopObservingAttachment:](self, "stopObservingAttachment:", v4);

  }
  v5.receiver = self;
  v5.super_class = (Class)ICAttachmentDrawingModel;
  -[ICAttachmentModel dealloc](&v5, sel_dealloc);
}

- (void)startObservingAttachment
{
  void *v3;

  if (!-[ICAttachmentDrawingModel observingAttachment](self, "observingAttachment"))
  {
    -[ICAttachmentModel attachment](self, "attachment");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "ic_addObserver:forKeyPath:context:", self, CFSTR("mergeableData"), &compoundliteral_0);

    -[ICAttachmentDrawingModel setObservingAttachment:](self, "setObservingAttachment:", 1);
  }
}

- (void)stopObservingAttachment:(id)a3
{
  uint64_t v4;
  void *v5;
  id v6;
  id v7;

  v7 = a3;
  if (-[ICAttachmentDrawingModel observingAttachment](self, "observingAttachment"))
  {
    -[ICAttachmentModel attachment](self, "attachment");
    v4 = objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = (void *)v4;
      -[ICAttachmentModel attachment](self, "attachment");
      v6 = (id)objc_claimAutoreleasedReturnValue();

      if (v6 != v7)
        objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "!self.attachment || self.attachment == attachment", "-[ICAttachmentDrawingModel stopObservingAttachment:]", 1, 0, CFSTR("unexpected attachment %@ in stopObservingAttachment for %@"), v7, self);
    }
    objc_msgSend(v7, "ic_removeObserver:forKeyPath:context:", self, CFSTR("mergeableData"), &compoundliteral_0);
    -[ICAttachmentDrawingModel setObservingAttachment:](self, "setObservingAttachment:", 0);
  }

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  char v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  id v18;
  objc_super v19;

  v10 = a5;
  v11 = a4;
  v12 = a3;
  if ((-[ICAttachmentDrawingModel ic_didAddObserverForContext:inScope:](self, "ic_didAddObserverForContext:inScope:", a6, "/Library/Caches/com.apple.xbs/Sources/MobileNotesSupport/Ironcade/Shared/CoreData/AttachmentModel/ICAttachmentDrawingModel.m") & 1) != 0)
  {
    v13 = -[ICAttachmentDrawingModel ic_shouldIgnoreObserveValue:ofObject:forKeyPath:](self, "ic_shouldIgnoreObserveValue:ofObject:forKeyPath:", v10, v11, v12);

    if (a6 == &compoundliteral_0 && (v13 & 1) == 0 && self->_drawingDocument)
    {
      -[ICAttachmentModel attachment](self, "attachment");
      v18 = (id)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v18, "faultingState"))
      {
        -[ICAttachmentModel attachment](self, "attachment");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "isSettingMergeableData");

        if ((v15 & 1) != 0)
          return;
        -[ICAttachmentModel attachment](self, "attachment");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "mergeableData");
        v18 = (id)objc_claimAutoreleasedReturnValue();

        -[ICAttachmentModel mergeWithMergeableData:](self, "mergeWithMergeableData:", v18);
        -[ICAttachmentModel attachment](self, "attachment");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "saveMergeableDataIfNeeded");

      }
    }
  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)ICAttachmentDrawingModel;
    -[ICAttachmentDrawingModel observeValueForKeyPath:ofObject:change:context:](&v19, sel_observeValueForKeyPath_ofObject_change_context_, v12, v11, v10, a6);

  }
}

+ (id)contentInfoTextWithAttachmentCount:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("NOTE_LIST_SKETCHES_%lu"), CFSTR("NOTE_LIST_SKETCHES_%lu"), 0, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringWithFormat:", v5, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (ICDrawing)drawing
{
  void *v2;
  void *v3;

  -[ICAttachmentDrawingModel drawingDocument](self, "drawingDocument");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "drawing");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (ICDrawing *)v3;
}

- (id)drawingDocument
{
  ICDrawingVersionedDocument *drawingDocument;
  ICDrawingVersionedDocument *v4;
  void *v5;
  void *v6;
  void *v7;
  ICDrawingVersionedDocument *v8;
  ICDrawingVersionedDocument *v9;

  drawingDocument = self->_drawingDocument;
  if (!drawingDocument)
  {
    v4 = [ICDrawingVersionedDocument alloc];
    -[ICAttachmentModel attachment](self, "attachment");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "mergeableData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAttachmentModel currentReplicaID](self, "currentReplicaID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[ICTTVersionedDocument initWithData:replicaID:](v4, "initWithData:replicaID:", v6, v7);
    v9 = self->_drawingDocument;
    self->_drawingDocument = v8;

    drawingDocument = self->_drawingDocument;
  }
  return drawingDocument;
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
  ICDrawingVersionedDocument *v14;
  void *v15;
  ICDrawingVersionedDocument *v16;
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
  v6 = os_log_create("com.apple.notes", "PencilKit");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[ICAttachmentDrawingModel mergeWithMergeableData:mergeableFieldState:].cold.2(v6, v7, v8, v9, v10, v11, v12, v13);

  v14 = [ICDrawingVersionedDocument alloc];
  -[ICAttachmentModel currentReplicaID](self, "currentReplicaID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[ICTTVersionedDocument initWithData:replicaID:](v14, "initWithData:replicaID:", v5, v15);

  -[ICAttachmentDrawingModel drawingDocument](self, "drawingDocument");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "mergeWithDrawingVersionedDocument:", v16);

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
    v26 = os_log_create("com.apple.notes", "PencilKit");
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      -[ICAttachmentDrawingModel mergeWithMergeableData:mergeableFieldState:].cold.1(v26, v27, v28, v29, v30, v31, v32, v33);

    -[ICAttachmentModel setMergeableDataDirty:](self, "setMergeableDataDirty:", 1);
  }

  return v19;
}

- (void)writeMergeableData
{
  void *v3;
  void *v4;
  id v5;

  -[ICAttachmentModel setMergeableDataDirty:](self, "setMergeableDataDirty:", 0);
  -[ICAttachmentDrawingModel drawingDocument](self, "drawingDocument");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "serialize");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAttachmentModel attachment](self, "attachment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMergeableData:", v3);

}

- (BOOL)hasPreviews
{
  return 1;
}

- (BOOL)previewsSupportMultipleAppearances
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
  v11 = __Block_byref_object_copy__28;
  v12 = __Block_byref_object_dispose__28;
  v13 = 0;
  -[ICAttachmentModel attachment](self, "attachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __35__ICAttachmentDrawingModel_saveURL__block_invoke;
  v7[3] = &unk_1E76C76B0;
  v7[4] = self;
  v7[5] = &v8;
  objc_msgSend(v4, "performBlockAndWait:", v7);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __35__ICAttachmentDrawingModel_saveURL__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "attachment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICDrawing defaultPixelSize](ICDrawing, "defaultPixelSize");
  objc_msgSend(v2, "attachmentPreviewImageWithMinSize:scale:");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "orientedPreviewImageURL");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (BOOL)canSaveURL
{
  return 1;
}

- (BOOL)supportsQuickLook
{
  return 0;
}

- (BOOL)preferLocalPreviewImages
{
  return 1;
}

- (void)drawingPreviewIsUpToDate
{
  OUTLINED_FUNCTION_2_1(&dword_1BD918000, a1, a3, "Drawing set image up-to-date", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_0();
}

- (CGAffineTransform)previewImageOrientationTransform
{
  void *v3;
  uint64_t v4;

  -[ICAttachmentModel attachment](self, "attachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (int)objc_msgSend(v3, "orientation");

  +[ICDrawing defaultSize](ICDrawing, "defaultSize");
  +[ICDrawing fullSize:forOrientation:](ICDrawing, "fullSize:forOrientation:", v4);
  return +[ICDrawing orientationTransform:size:](ICDrawing, "orientationTransform:size:", v4);
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

- (BOOL)shouldSyncPreviewImageToCloud:(id)a3
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  int v9;

  v3 = a3;
  objc_msgSend(v3, "width");
  v5 = v4;
  objc_msgSend(v3, "height");
  if (v5 < v6)
    v5 = v6;
  objc_msgSend(v3, "scale");
  v8 = v7 * v5;
  v9 = objc_msgSend(v3, "appearanceType");

  return v8 <= 640.0 && v9 == 0;
}

- (id)previewImageURL
{
  void *v2;
  void *v3;
  void *v4;

  -[ICAttachmentModel attachment](self, "attachment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICDrawing defaultPixelSize](ICDrawing, "defaultPixelSize");
  objc_msgSend(v2, "attachmentPreviewImageWithMinSize:scale:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "orientedPreviewImageURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)previewItemTitle
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ICAttachmentDrawingModel;
  -[ICAttachmentModel previewItemTitle](&v9, sel_previewItemTitle);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[ICAttachmentModel attachment](self, "attachment");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "note");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "title");
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v5;
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
  v11 = __Block_byref_object_copy__28;
  v12 = __Block_byref_object_dispose__28;
  v13 = 0;
  -[ICAttachmentModel attachment](self, "attachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __42__ICAttachmentDrawingModel_previewItemURL__block_invoke;
  v7[3] = &unk_1E76C7730;
  v7[4] = self;
  v7[5] = &v8;
  objc_msgSend(v4, "performBlockAndWait:", v7);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __42__ICAttachmentDrawingModel_previewItemURL__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  objc_super v7;

  objc_msgSend(*(id *)(a1 + 32), "previewImageURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
  {
    v7.receiver = *(id *)(a1 + 32);
    v7.super_class = (Class)ICAttachmentDrawingModel;
    objc_msgSendSuper2(&v7, sel_previewItemURL);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v3);
  if (!v2)

  objc_msgSend(*(id *)(a1 + 32), "generateHardLinkURLIfNecessaryForURL:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (BOOL)observingAttachment
{
  return self->_observingAttachment;
}

- (void)setObservingAttachment:(BOOL)a3
{
  self->_observingAttachment = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_drawingDocument, 0);
}

- (void)mergeWithMergeableData:(uint64_t)a3 mergeableFieldState:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_1(&dword_1BD918000, a1, a3, "Drawing updated", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_0();
}

- (void)mergeWithMergeableData:(uint64_t)a3 mergeableFieldState:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_1(&dword_1BD918000, a1, a3, "Drawing mergeWithMergeableData", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_0();
}

@end
