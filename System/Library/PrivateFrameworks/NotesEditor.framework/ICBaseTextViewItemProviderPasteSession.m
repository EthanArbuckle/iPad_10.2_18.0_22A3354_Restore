@implementation ICBaseTextViewItemProviderPasteSession

- (ICBaseTextViewItemProviderPasteSession)initWithNoteObjectID:(id)a3
{
  id v5;
  ICBaseTextViewItemProviderPasteSession *v6;
  ICBaseTextViewItemProviderPasteSession *v7;
  uint64_t v8;
  NSMutableSet *mutableErrorCodes;
  void *v10;
  uint64_t v11;
  NSManagedObjectContext *workerContext;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ICBaseTextViewItemProviderPasteSession;
  v6 = -[ICBaseTextViewItemProviderPasteSession init](&v14, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_noteObjectID, a3);
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v8 = objc_claimAutoreleasedReturnValue();
    mutableErrorCodes = v7->_mutableErrorCodes;
    v7->_mutableErrorCodes = (NSMutableSet *)v8;

    objc_msgSend(MEMORY[0x1E0D63BC8], "sharedContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "snapshotManagedObjectContext");
    v11 = objc_claimAutoreleasedReturnValue();
    workerContext = v7->_workerContext;
    v7->_workerContext = (NSManagedObjectContext *)v11;

  }
  return v7;
}

- (ICNote)workerNote
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0D63BB8];
  -[ICBaseTextViewItemProviderPasteSession noteObjectID](self, "noteObjectID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICBaseTextViewItemProviderPasteSession workerContext](self, "workerContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ic_existingObjectWithID:context:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (ICNote *)v6;
}

- (void)addErrorWithCode:(int64_t)a3
{
  void *v4;
  void *v5;
  ICBaseTextViewItemProviderPasteSession *obj;

  obj = self;
  objc_sync_enter(obj);
  -[ICBaseTextViewItemProviderPasteSession mutableErrorCodes](obj, "mutableErrorCodes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v5);

  objc_sync_exit(obj);
}

- (void)incrementNumberOfAttachmentsAttemptedAdded
{
  ICBaseTextViewItemProviderPasteSession *obj;

  obj = self;
  objc_sync_enter(obj);
  -[ICBaseTextViewItemProviderPasteSession setNumberOfAttachmentsAttemptedAdded:](obj, "setNumberOfAttachmentsAttemptedAdded:", -[ICBaseTextViewItemProviderPasteSession numberOfAttachmentsAttemptedAdded](obj, "numberOfAttachmentsAttemptedAdded")+ 1);
  objc_sync_exit(obj);

}

- (unint64_t)numberOfAttachmentsAttemptedAdded
{
  ICBaseTextViewItemProviderPasteSession *v2;
  unint64_t numberOfAttachmentsAttemptedAdded;

  v2 = self;
  objc_sync_enter(v2);
  numberOfAttachmentsAttemptedAdded = v2->_numberOfAttachmentsAttemptedAdded;
  objc_sync_exit(v2);

  return numberOfAttachmentsAttemptedAdded;
}

- (NSSet)errorCodes
{
  ICBaseTextViewItemProviderPasteSession *v2;
  void *v3;
  void *v4;

  v2 = self;
  objc_sync_enter(v2);
  -[ICBaseTextViewItemProviderPasteSession mutableErrorCodes](v2, "mutableErrorCodes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  objc_sync_exit(v2);
  return (NSSet *)v4;
}

- (void)performBlockAndWait:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[ICBaseTextViewItemProviderPasteSession workerContext](self, "workerContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __62__ICBaseTextViewItemProviderPasteSession_performBlockAndWait___block_invoke;
  v7[3] = &unk_1EA7E07E8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performBlockAndWait:", v7);

}

void __62__ICBaseTextViewItemProviderPasteSession_performBlockAndWait___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "workerNote");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)saveWorkerContext
{
  void *v3;
  _QWORD v4[5];

  -[ICBaseTextViewItemProviderPasteSession workerContext](self, "workerContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __59__ICBaseTextViewItemProviderPasteSession_saveWorkerContext__block_invoke;
  v4[3] = &unk_1EA7DD2D8;
  v4[4] = self;
  objc_msgSend(v3, "performBlockAndWait:", v4);

}

void __59__ICBaseTextViewItemProviderPasteSession_saveWorkerContext__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x1E0D637A0];
  objc_msgSend(*(id *)(a1 + 32), "noteObjectID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", v3, v4);

  objc_msgSend(*(id *)(a1 + 32), "workerContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ic_save");

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0D63798];
  objc_msgSend(*(id *)(a1 + 32), "noteObjectID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "postNotificationName:object:", v6, v7);

}

- (NSManagedObjectContext)workerContext
{
  return self->_workerContext;
}

- (void)setWorkerContext:(id)a3
{
  objc_storeStrong((id *)&self->_workerContext, a3);
}

- (BOOL)isForDragAndDrop
{
  return self->_isForDragAndDrop;
}

- (void)setIsForDragAndDrop:(BOOL)a3
{
  self->_isForDragAndDrop = a3;
}

- (BOOL)shouldFilterAttributedString
{
  return self->_shouldFilterAttributedString;
}

- (void)setShouldFilterAttributedString:(BOOL)a3
{
  self->_shouldFilterAttributedString = a3;
}

- (BOOL)supportsAttachments
{
  return self->_supportsAttachments;
}

- (void)setSupportsAttachments:(BOOL)a3
{
  self->_supportsAttachments = a3;
}

- (void)setNumberOfAttachmentsAttemptedAdded:(unint64_t)a3
{
  self->_numberOfAttachmentsAttemptedAdded = a3;
}

- (unint64_t)numberOfAttachmentImagesPreloaded
{
  return self->_numberOfAttachmentImagesPreloaded;
}

- (void)setNumberOfAttachmentImagesPreloaded:(unint64_t)a3
{
  self->_numberOfAttachmentImagesPreloaded = a3;
}

- (unint64_t)numberOfTrailingNewlinesStripped
{
  return self->_numberOfTrailingNewlinesStripped;
}

- (void)setNumberOfTrailingNewlinesStripped:(unint64_t)a3
{
  self->_numberOfTrailingNewlinesStripped = a3;
}

- (BOOL)isTypeURL
{
  return self->_isTypeURL;
}

- (void)setIsTypeURL:(BOOL)a3
{
  self->_isTypeURL = a3;
}

- (NSManagedObjectID)noteObjectID
{
  return self->_noteObjectID;
}

- (void)setNoteObjectID:(id)a3
{
  objc_storeStrong((id *)&self->_noteObjectID, a3);
}

- (NSMutableSet)mutableErrorCodes
{
  return self->_mutableErrorCodes;
}

- (void)setMutableErrorCodes:(id)a3
{
  objc_storeStrong((id *)&self->_mutableErrorCodes, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableErrorCodes, 0);
  objc_storeStrong((id *)&self->_noteObjectID, 0);
  objc_storeStrong((id *)&self->_workerContext, 0);
}

@end
