@implementation ICDrawingConversionOperation

- (ICDrawingConversionOperation)initWithAttachment:(id)a3 textAttachment:(id)a4 automatic:(BOOL)a5
{
  id v9;
  id v10;
  ICDrawingConversionOperation *v11;
  ICDrawingConversionOperation *v12;
  uint64_t v13;
  NSManagedObjectID *attachmentID;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)ICDrawingConversionOperation;
  v11 = -[ICDrawingConversionOperation init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_isAutomatic = a5;
    objc_storeStrong((id *)&v11->_attachment, a3);
    objc_msgSend(v9, "objectID");
    v13 = objc_claimAutoreleasedReturnValue();
    attachmentID = v12->_attachmentID;
    v12->_attachmentID = (NSManagedObjectID *)v13;

    objc_storeStrong((id *)&v12->_textAttachment, a4);
  }

  return v12;
}

- (void)main
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  ICDrawingConversionOperation *v10;
  id v11;

  +[ICDrawingPencilKitConverter sharedConverter](ICDrawingPencilKitConverter, "sharedConverter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D63BC8], "sharedContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "workerManagedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __36__ICDrawingConversionOperation_main__block_invoke;
  v8[3] = &unk_1E5C1D7C0;
  v9 = v5;
  v10 = self;
  v11 = v3;
  v6 = v3;
  v7 = v5;
  objc_msgSend(v7, "performBlockAndWait:", v8);
  objc_msgSend(v6, "operationComplete:", self);

}

void __36__ICDrawingConversionOperation_main__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  objc_msgSend(*(id *)(a1 + 32), "existingObjectWithID:error:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 256), 0);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  if (+[ICDrawingPencilKitConverter canUpdateFullscreenSketchAttachment:](ICDrawingPencilKitConverter, "canUpdateFullscreenSketchAttachment:"))
  {
    v2 = objc_msgSend(v12, "rangeInNote");
    v4 = v3;
    objc_msgSend(v12, "note");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "convertSketchAttachment:toInlineDrawingAtRange:inNote:", v12, v2, v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "ic_saveWithLogDescription:", CFSTR("saving context after updating fullscreen sketch in operation"));
    objc_msgSend(v6, "objectID");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 40);
    v9 = *(void **)(v8 + 264);
    *(_QWORD *)(v8 + 264) = v7;

LABEL_5:
    goto LABEL_6;
  }
  if (+[ICDrawingPencilKitConverter canUpdateInlineDrawingAttachment:](ICDrawingPencilKitConverter, "canUpdateInlineDrawingAttachment:", v12))
  {
    objc_msgSend(*(id *)(a1 + 48), "updateInlineDrawingAttachment:", v12);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "ic_saveWithLogDescription:", CFSTR("saving context after updating inline drawing in operation"));
    objc_msgSend(v5, "objectID");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 40);
    v6 = *(void **)(v11 + 264);
    *(_QWORD *)(v11 + 264) = v10;
    goto LABEL_5;
  }
LABEL_6:

}

- (BOOL)isAutomatic
{
  return self->_isAutomatic;
}

- (NSManagedObjectID)attachmentID
{
  return self->_attachmentID;
}

- (NSManagedObjectID)finalAttachmentID
{
  return self->_finalAttachmentID;
}

- (ICBaseTextAttachment)textAttachment
{
  return self->_textAttachment;
}

- (void)setTextAttachment:(id)a3
{
  objc_storeStrong((id *)&self->_textAttachment, a3);
}

- (ICAttachment)attachment
{
  return self->_attachment;
}

- (void)setAttachment:(id)a3
{
  objc_storeStrong((id *)&self->_attachment, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attachment, 0);
  objc_storeStrong((id *)&self->_textAttachment, 0);
  objc_storeStrong((id *)&self->_finalAttachmentID, 0);
  objc_storeStrong((id *)&self->_attachmentID, 0);
}

@end
