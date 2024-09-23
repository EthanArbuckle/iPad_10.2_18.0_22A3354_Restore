@implementation ICIndexHandwritingOperation

+ (NSOperationQueue)sharedOperationQueue
{
  if (sharedOperationQueue_onceToken != -1)
    dispatch_once(&sharedOperationQueue_onceToken, &__block_literal_global_25);
  return (NSOperationQueue *)(id)sharedOperationQueue_queue;
}

uint64_t __51__ICIndexHandwritingOperation_sharedOperationQueue__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3828]);
  v1 = (void *)sharedOperationQueue_queue;
  sharedOperationQueue_queue = (uint64_t)v0;

  objc_msgSend((id)sharedOperationQueue_queue, "setName:", CFSTR("com.apple.notes.index-handwriting-queue"));
  return objc_msgSend((id)sharedOperationQueue_queue, "setMaxConcurrentOperationCount:", 1);
}

- (ICIndexHandwritingOperation)initWithAttachmentObjectID:(id)a3 context:(id)a4
{
  id v7;
  id v8;
  ICIndexHandwritingOperation *v9;
  ICIndexHandwritingOperation *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ICIndexHandwritingOperation;
  v9 = -[ICIndexHandwritingOperation init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_attachmentObjectID, a3);
    objc_storeStrong((id *)&v10->_context, a4);
  }

  return v10;
}

- (void)main
{
  void *v3;
  uint64_t v4;
  ICInlineDrawingChangeCoalescer *v5;
  ICInlineDrawingChangeCoalescer *v6;
  NSObject *v7;
  _QWORD v8[5];
  NSObject *v9;
  uint64_t *v10;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__21;
  v16 = __Block_byref_object_dispose__21;
  v17 = 0;
  -[ICIndexHandwritingOperation context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __35__ICIndexHandwritingOperation_main__block_invoke;
  v11[3] = &unk_1E5C1D9D0;
  v11[4] = self;
  v11[5] = &v12;
  objc_msgSend(v3, "performBlockAndWait:", v11);

  v5 = [ICInlineDrawingChangeCoalescer alloc];
  v6 = -[ICInlineDrawingChangeCoalescer initWithAttachment:](v5, "initWithAttachment:", v13[5]);
  v8[0] = v4;
  v8[1] = 3221225472;
  v8[2] = __35__ICIndexHandwritingOperation_main__block_invoke_2;
  v8[3] = &unk_1E5C1E760;
  v8[4] = self;
  v10 = &v12;
  v7 = dispatch_semaphore_create(0);
  v9 = v7;
  -[ICInlineDrawingChangeCoalescer processIndexableContentWithCompletion:](v6, "processIndexableContentWithCompletion:", v8);
  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);

  _Block_object_dispose(&v12, 8);
}

void __35__ICIndexHandwritingOperation_main__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v2 = (void *)MEMORY[0x1E0D639F0];
  objc_msgSend(*(id *)(a1 + 32), "attachmentObjectID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ic_existingObjectWithID:context:", v3, v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "inlineDrawingModel");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setHandwritingRecognitionEnabled:", 1);

}

intptr_t __35__ICIndexHandwritingOperation_main__block_invoke_2(uint64_t a1)
{
  void *v2;
  _QWORD v4[5];

  objc_msgSend(*(id *)(a1 + 32), "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __35__ICIndexHandwritingOperation_main__block_invoke_3;
  v4[3] = &unk_1E5C1DE18;
  v4[4] = *(_QWORD *)(a1 + 48);
  objc_msgSend(v2, "performBlockAndWait:", v4);

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __35__ICIndexHandwritingOperation_main__block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "note");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v4, "isHandwritingRecognitionEnabled");
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "inlineDrawingModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHandwritingRecognitionEnabled:", v2);

}

- (NSManagedObjectID)attachmentObjectID
{
  return self->_attachmentObjectID;
}

- (void)setAttachmentObjectID:(id)a3
{
  objc_storeStrong((id *)&self->_attachmentObjectID, a3);
}

- (NSManagedObjectContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_attachmentObjectID, 0);
}

@end
