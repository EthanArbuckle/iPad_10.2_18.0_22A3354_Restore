@implementation ICInlineDrawingChangeCoalescer

- (ICInlineDrawingChangeCoalescer)initWithAttachment:(id)a3
{
  id v5;
  ICInlineDrawingChangeCoalescer *v6;
  ICInlineDrawingChangeCoalescer *v7;
  void *v8;
  uint64_t v9;
  NSManagedObjectContext *workerContext;
  void *v11;
  uint64_t v12;
  NSManagedObjectContext *mainContext;
  void *v14;
  uint64_t v15;
  NSManagedObjectContext *handwritingRecognitionContext;
  objc_super v18;

  v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)ICInlineDrawingChangeCoalescer;
  v6 = -[ICInlineDrawingChangeCoalescer init](&v18, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_attachment, a3);
    objc_msgSend(MEMORY[0x1E0D63BC8], "sharedContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "workerManagedObjectContext");
    v9 = objc_claimAutoreleasedReturnValue();
    workerContext = v7->_workerContext;
    v7->_workerContext = (NSManagedObjectContext *)v9;

    objc_msgSend(MEMORY[0x1E0D63BC8], "sharedContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "managedObjectContext");
    v12 = objc_claimAutoreleasedReturnValue();
    mainContext = v7->_mainContext;
    v7->_mainContext = (NSManagedObjectContext *)v12;

    objc_msgSend(MEMORY[0x1E0D63BC8], "sharedContext");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "workerManagedObjectContext");
    v15 = objc_claimAutoreleasedReturnValue();
    handwritingRecognitionContext = v7->_handwritingRecognitionContext;
    v7->_handwritingRecognitionContext = (NSManagedObjectContext *)v15;

  }
  return v7;
}

- (void)dealloc
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1AC7A1000, log, OS_LOG_TYPE_ERROR, "Had an updated drawing when deallocing ICDrawingChangeCoalescer", v1, 2u);
}

- (BOOL)hasChanges
{
  return -[ICInlineDrawingChangeCoalescer numberOfChanges](self, "numberOfChanges") != 0;
}

- (ICSelectorDelayer)processChangesSelectorDelayer
{
  ICSelectorDelayer *processChangesSelectorDelayer;
  ICSelectorDelayer *v4;
  ICSelectorDelayer *v5;

  processChangesSelectorDelayer = self->_processChangesSelectorDelayer;
  if (!processChangesSelectorDelayer)
  {
    v4 = (ICSelectorDelayer *)objc_msgSend(objc_alloc(MEMORY[0x1E0D64268]), "initWithTarget:selector:delay:waitToFireUntilRequestsStop:callOnMainThread:", self, sel_mergeDrawingChanges, 1, 1, 2.0);
    v5 = self->_processChangesSelectorDelayer;
    self->_processChangesSelectorDelayer = v4;

    processChangesSelectorDelayer = self->_processChangesSelectorDelayer;
  }
  return processChangesSelectorDelayer;
}

- (void)drawingDataDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD *v16;
  _QWORD v17[6];
  _QWORD v18[5];
  id v19;

  v4 = a3;
  v5 = (void *)objc_msgSend(v4, "copy");
  -[ICInlineDrawingChangeCoalescer setLatestDrawing:](self, "setLatestDrawing:", v5);
  -[ICInlineDrawingChangeCoalescer setNumberOfChanges:](self, "setNumberOfChanges:", -[ICInlineDrawingChangeCoalescer numberOfChanges](self, "numberOfChanges") + 1);
  -[ICInlineDrawingChangeCoalescer processChangesSelectorDelayer](self, "processChangesSelectorDelayer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "requestFire");

  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3032000000;
  v18[3] = __Block_byref_object_copy__76;
  v18[4] = __Block_byref_object_dispose__76;
  v19 = 0;
  -[ICInlineDrawingChangeCoalescer attachment](self, "attachment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "managedObjectContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __55__ICInlineDrawingChangeCoalescer_drawingDataDidChange___block_invoke;
  v17[3] = &unk_1E5C1D9D0;
  v17[4] = self;
  v17[5] = v18;
  objc_msgSend(v8, "performBlockAndWait:", v17);

  -[ICInlineDrawingChangeCoalescer attachment](self, "attachment");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "inlineDrawingModel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "handwritingRecognitionDrawingQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  v14[0] = v9;
  v14[1] = 3221225472;
  v14[2] = __55__ICInlineDrawingChangeCoalescer_drawingDataDidChange___block_invoke_21;
  v14[3] = &unk_1E5C1D9D0;
  v15 = v5;
  v16 = v18;
  v13 = v5;
  dispatch_async(v12, v14);

  _Block_object_dispose(v18, 8);
}

void __55__ICInlineDrawingChangeCoalescer_drawingDataDidChange___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;

  v1 = a1 + 32;
  objc_msgSend(*(id *)(a1 + 32), "attachment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "inlineDrawingModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "handwritingRecognitionDrawing");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(v1 + 8) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  v7 = os_log_create("com.apple.notes", "PencilKit");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __55__ICInlineDrawingChangeCoalescer_drawingDataDidChange___block_invoke_cold_1((id *)v1);

}

uint64_t __55__ICInlineDrawingChangeCoalescer_drawingDataDidChange___block_invoke_21(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "mergeWithDrawing:", *(_QWORD *)(a1 + 32));
}

- (void)updateNowIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[ICInlineDrawingChangeCoalescer processChangesSelectorDelayer](self, "processChangesSelectorDelayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelPreviousFireRequests");

  -[ICInlineDrawingChangeCoalescer retrieveAndClearLatestDrawingToMerge](self, "retrieveAndClearLatestDrawingToMerge");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[ICInlineDrawingChangeCoalescer attachment](self, "attachment");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "managedObjectContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "ic_save");

    -[ICInlineDrawingChangeCoalescer mergeDrawingWithDrawing:](self, "mergeDrawingWithDrawing:", v6);
  }

}

- (void)mergeDrawingChanges
{
  void *v3;
  NSObject *v4;
  _QWORD v5[5];
  id v6;

  -[ICInlineDrawingChangeCoalescer retrieveAndClearLatestDrawingToMerge](self, "retrieveAndClearLatestDrawingToMerge");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    dispatch_get_global_queue(0, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __53__ICInlineDrawingChangeCoalescer_mergeDrawingChanges__block_invoke;
    v5[3] = &unk_1E5C1D9A8;
    v5[4] = self;
    v6 = v3;
    dispatch_async(v4, v5);

  }
}

uint64_t __53__ICInlineDrawingChangeCoalescer_mergeDrawingChanges__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "mergeDrawingWithDrawing:", *(_QWORD *)(a1 + 40));
}

- (id)retrieveAndClearLatestDrawingToMerge
{
  void *v3;
  NSObject *v4;

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "[NSThread isMainThread]", "-[ICInlineDrawingChangeCoalescer retrieveAndClearLatestDrawingToMerge]", 1, 0, CFSTR("Unexpected call from background thread"));
  -[ICInlineDrawingChangeCoalescer latestDrawing](self, "latestDrawing");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = os_log_create("com.apple.notes", "PencilKit");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      -[ICInlineDrawingChangeCoalescer retrieveAndClearLatestDrawingToMerge].cold.1(self);

    -[ICInlineDrawingChangeCoalescer setNumberOfChanges:](self, "setNumberOfChanges:", 0);
    -[ICInlineDrawingChangeCoalescer setLatestDrawing:](self, "setLatestDrawing:", 0);
  }
  return v3;
}

- (void)mergeDrawingWithDrawing:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  id v18;
  ICInlineDrawingChangeCoalescer *v19;
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;
  _QWORD v26[4];
  id v27;
  id v28;

  v4 = a3;
  -[ICInlineDrawingChangeCoalescer attachment](self, "attachment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICInlineDrawingChangeCoalescer mainContext](self, "mainContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __58__ICInlineDrawingChangeCoalescer_mergeDrawingWithDrawing___block_invoke;
  v26[3] = &unk_1E5C1D9A8;
  v9 = v7;
  v27 = v9;
  v10 = v6;
  v28 = v10;
  objc_msgSend(v9, "performBlockAndWait:", v26);
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  -[ICInlineDrawingChangeCoalescer workerContext](self, "workerContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v8;
  v15 = 3221225472;
  v16 = __58__ICInlineDrawingChangeCoalescer_mergeDrawingWithDrawing___block_invoke_2;
  v17 = &unk_1E5C228F0;
  v12 = v10;
  v18 = v12;
  v19 = self;
  v21 = &v22;
  v13 = v4;
  v20 = v13;
  objc_msgSend(v11, "performBlockAndWait:", &v14);

  if (*((_BYTE *)v23 + 24))
    -[ICInlineDrawingChangeCoalescer processIndexableContentWithCompletion:](self, "processIndexableContentWithCompletion:", 0, v14, v15, v16, v17, v18, v19);

  _Block_object_dispose(&v22, 8);
}

void __58__ICInlineDrawingChangeCoalescer_mergeDrawingWithDrawing___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "ic_existingObjectWithID:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isPasswordProtected") && objc_msgSend(v2, "hasChanges"))
    objc_msgSend(*(id *)(a1 + 32), "ic_save");

}

void __58__ICInlineDrawingChangeCoalescer_mergeDrawingWithDrawing___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v2 = (void *)MEMORY[0x1E0D639F0];
  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "workerContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ic_existingObjectWithID:context:", v3, v4);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  objc_msgSend(v10, "attachmentModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  ICCheckedDynamicCast();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(v6, "mergeWithDrawing:", *(_QWORD *)(a1 + 48));
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    objc_msgSend(*(id *)(a1 + 40), "updateVersionIfNeededForAttachment:withDrawing:", v10, *(_QWORD *)(a1 + 48));
    objc_msgSend(v10, "updateChangeCountWithReason:", CFSTR("Merged drawing"));
    objc_msgSend(v10, "note");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "updateModificationDateAndChangeCount");

    objc_msgSend(v10, "note");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "managedObjectContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "ic_save");

  }
}

- (void)processIndexableContentWithCompletion:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  _QWORD block[5];
  id v12;
  void (**v13)(_QWORD);
  _QWORD v14[6];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v4 = (void (**)(_QWORD))a3;
  -[ICInlineDrawingChangeCoalescer attachment](self, "attachment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__76;
  v19 = __Block_byref_object_dispose__76;
  v20 = 0;
  -[ICInlineDrawingChangeCoalescer attachment](self, "attachment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "managedObjectContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __72__ICInlineDrawingChangeCoalescer_processIndexableContentWithCompletion___block_invoke;
  v14[3] = &unk_1E5C20078;
  v14[4] = self;
  v14[5] = &v15;
  objc_msgSend(v8, "performBlockAndWait:", v14);

  v10 = v16[5];
  if (v10)
  {
    block[0] = v9;
    block[1] = 3221225472;
    block[2] = __72__ICInlineDrawingChangeCoalescer_processIndexableContentWithCompletion___block_invoke_31;
    block[3] = &unk_1E5C20C00;
    block[4] = self;
    v12 = v6;
    v13 = v4;
    dispatch_async(v10, block);

  }
  else if (v4)
  {
    v4[2](v4);
  }
  _Block_object_dispose(&v15, 8);

}

void __72__ICInlineDrawingChangeCoalescer_processIndexableContentWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "attachment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "attachment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ic_refreshObject:mergeChanges:", v4, 1);

  objc_msgSend(*(id *)(a1 + 32), "attachment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "inlineDrawingModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handwritingRecognitionDrawingQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  objc_msgSend(*(id *)(a1 + 32), "attachment");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "inlineDrawingModel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v11, "isHandwritingRecognitionEnabled") & 1) == 0)
  {
    objc_msgSend(v11, "attachment");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "note");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "updatePKDrawingsWithHandwritingRecognitionEnabled:", objc_msgSend(v13, "isHandwritingRecognitionEnabled"));
  }
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    v14 = os_log_create("com.apple.notes", "PencilKit");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "attachment");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "shortLoggingDescription");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138412290;
      v18 = v16;
      _os_log_impl(&dword_1AC7A1000, v14, OS_LOG_TYPE_DEFAULT, "No queue to process drawing changes for %@", (uint8_t *)&v17, 0xCu);

    }
  }

}

void __72__ICInlineDrawingChangeCoalescer_processIndexableContentWithCompletion___block_invoke_31(uint64_t a1)
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
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t *v24;
  _QWORD v25[6];
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__76;
  v30 = __Block_byref_object_dispose__76;
  v31 = 0;
  objc_msgSend(*(id *)(a1 + 32), "attachment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __72__ICInlineDrawingChangeCoalescer_processIndexableContentWithCompletion___block_invoke_2;
  v25[3] = &unk_1E5C20078;
  v25[4] = *(_QWORD *)(a1 + 32);
  v25[5] = &v26;
  objc_msgSend(v3, "performBlockAndWait:", v25);

  v8 = (void *)v27[5];
  if (v8)
  {
    objc_msgSend(v8, "indexableContent");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "indexableTextRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "presentableTextRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "handwritingRecognitionContext");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v4;
    v18[1] = 3221225472;
    v18[2] = __72__ICInlineDrawingChangeCoalescer_processIndexableContentWithCompletion___block_invoke_32;
    v18[3] = &unk_1E5C241E8;
    v19 = *(id *)(a1 + 40);
    v13 = v12;
    v20 = v13;
    v14 = v11;
    v21 = v14;
    v15 = v10;
    v24 = &v26;
    v16 = *(_QWORD *)(a1 + 32);
    v22 = v15;
    v23 = v16;
    objc_msgSend(v13, "performBlockAndWait:", v18);

  }
  v17 = *(_QWORD *)(a1 + 48);
  if (v17)
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v17 + 16))(v17, v5, v6, v7);
  _Block_object_dispose(&v26, 8);

}

void __72__ICInlineDrawingChangeCoalescer_processIndexableContentWithCompletion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;

  v2 = os_log_create("com.apple.notes", "PencilKit");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __72__ICInlineDrawingChangeCoalescer_processIndexableContentWithCompletion___block_invoke_2_cold_1(a1, v2);

  objc_msgSend(*(id *)(a1 + 32), "attachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "inlineDrawingModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handwritingRecognitionDrawing");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "attachment");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "inlineDrawingModel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isHandwritingRecognitionEnabled");

    if (v10)
    {
      objc_msgSend(*(id *)(a1 + 32), "attachment");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "inlineDrawingModel");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "newDrawingFromMergeableData");
      v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v15 = *(void **)(v14 + 40);
      *(_QWORD *)(v14 + 40) = v13;

      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setRecognitionEnabled:", 1);
    }
  }
}

void __72__ICInlineDrawingChangeCoalescer_processIndexableContentWithCompletion___block_invoke_32(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint8_t buf[4];
  uint64_t v23;
  _QWORD v24[3];
  _QWORD v25[4];

  v25[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D639F0], "ic_existingObjectWithID:context:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
  {
    v11 = os_log_create("com.apple.notes", "PencilKit");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v21 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v23 = v21;
      _os_log_impl(&dword_1AC7A1000, v11, OS_LOG_TYPE_DEFAULT, "Cannot regenerate text content for non-existent attachment: %@", buf, 0xCu);
    }
    goto LABEL_16;
  }
  objc_msgSend(v2, "identifier");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4
    && (v5 = (void *)v4,
        objc_msgSend(v3, "note"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        v5,
        v6))
  {
    v7 = os_log_create("com.apple.notes", "PencilKit");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      __72__ICInlineDrawingChangeCoalescer_processIndexableContentWithCompletion___block_invoke_32_cold_1(v3, a1, v7);

    objc_msgSend(v3, "setHandwritingSummary:", *(_QWORD *)(a1 + 48));
    objc_msgSend(v3, "setAdditionalIndexableText:", *(_QWORD *)(a1 + 56));
    objc_msgSend(*(id *)(a1 + 40), "ic_save");
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40))
    {
      objc_msgSend(v3, "identifier");
      v8 = objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        v9 = (void *)v8;
        objc_msgSend(v3, "note");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
          v11 = objc_claimAutoreleasedReturnValue();
          v12 = *(_QWORD *)(a1 + 64);
          v25[0] = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
          v24[0] = CFSTR("Drawing");
          v24[1] = CFSTR("DrawingID");
          objc_msgSend(v3, "identifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v25[1] = v13;
          v24[2] = CFSTR("Note");
          objc_msgSend(v3, "note");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v25[2] = v14;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 3);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject postNotificationName:object:userInfo:](v11, "postNotificationName:object:userInfo:", CFSTR("ICNAInlineDrawingRecognitionReportNotification"), v12, v15);

LABEL_16:
        }
      }
    }
  }
  else
  {
    objc_msgSend(v3, "identifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v16)
    {
      v17 = (void *)MEMORY[0x1E0D641A0];
      objc_msgSend(v3, "shortLoggingDescription");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "attachment.identifier", "-[ICInlineDrawingChangeCoalescer processIndexableContentWithCompletion:]_block_invoke", 1, 1, CFSTR("Expected non-nil value for attachment.identifier: %@"), v18);

    }
    objc_msgSend(v3, "note");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v19)
    {
      v20 = (void *)MEMORY[0x1E0D641A0];
      objc_msgSend(v3, "shortLoggingDescription");
      v11 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "attachment.note", "-[ICInlineDrawingChangeCoalescer processIndexableContentWithCompletion:]_block_invoke", 1, 1, CFSTR("Expected non-nil value for attachment.note: %@"), v11);
      goto LABEL_16;
    }
  }

}

- (void)updateVersionIfNeededForAttachment:(id)a3 withDrawing:(id)a4
{
  void *v5;
  id v6;
  id v7;

  v7 = a3;
  if (objc_msgSend(a4, "_minimumSerializationVersion") >= 2)
  {
    +[ICDrawingPencilKitConverter sharedConverter](ICDrawingPencilKitConverter, "sharedConverter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v5, "updateInlineDrawingAttachment:", v7);

  }
}

- (ICAttachment)attachment
{
  return self->_attachment;
}

- (void)setAttachment:(id)a3
{
  objc_storeStrong((id *)&self->_attachment, a3);
}

- (void)setProcessChangesSelectorDelayer:(id)a3
{
  objc_storeStrong((id *)&self->_processChangesSelectorDelayer, a3);
}

- (PKDrawing)latestDrawing
{
  return self->_latestDrawing;
}

- (void)setLatestDrawing:(id)a3
{
  objc_storeStrong((id *)&self->_latestDrawing, a3);
}

- (unint64_t)numberOfChanges
{
  return self->_numberOfChanges;
}

- (void)setNumberOfChanges:(unint64_t)a3
{
  self->_numberOfChanges = a3;
}

- (NSManagedObjectContext)workerContext
{
  return self->_workerContext;
}

- (void)setWorkerContext:(id)a3
{
  objc_storeStrong((id *)&self->_workerContext, a3);
}

- (NSManagedObjectContext)mainContext
{
  return self->_mainContext;
}

- (void)setMainContext:(id)a3
{
  objc_storeStrong((id *)&self->_mainContext, a3);
}

- (NSManagedObjectContext)handwritingRecognitionContext
{
  return self->_handwritingRecognitionContext;
}

- (void)setHandwritingRecognitionContext:(id)a3
{
  objc_storeStrong((id *)&self->_handwritingRecognitionContext, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handwritingRecognitionContext, 0);
  objc_storeStrong((id *)&self->_mainContext, 0);
  objc_storeStrong((id *)&self->_workerContext, 0);
  objc_storeStrong((id *)&self->_latestDrawing, 0);
  objc_storeStrong((id *)&self->_processChangesSelectorDelayer, 0);
  objc_storeStrong((id *)&self->_attachment, 0);
}

void __55__ICInlineDrawingChangeCoalescer_drawingDataDidChange___block_invoke_cold_1(id *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  objc_msgSend(*a1, "numberOfChanges");
  objc_msgSend(*a1, "attachment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "shortLoggingDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_1AC7A1000, v4, v5, "Drawing data did change: %lu, attachment: %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_4();
}

- (void)retrieveAndClearLatestDrawingToMerge
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  objc_msgSend(a1, "numberOfChanges");
  objc_msgSend(a1, "attachment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "shortLoggingDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_1AC7A1000, v4, v5, "Retrieving drawing with number of changes: %lu, attachment: %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_4();
}

void __72__ICInlineDrawingChangeCoalescer_processIndexableContentWithCompletion___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "attachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "shortLoggingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v4;
  _os_log_debug_impl(&dword_1AC7A1000, a2, OS_LOG_TYPE_DEBUG, "Regenerating indexable text for %@", (uint8_t *)&v5, 0xCu);

  OUTLINED_FUNCTION_4();
}

void __72__ICInlineDrawingChangeCoalescer_processIndexableContentWithCompletion___block_invoke_32_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "shortLoggingDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(*(id *)(a2 + 48), "length");
  v7 = objc_msgSend(*(id *)(a2 + 56), "length");
  v8 = 138412802;
  v9 = v5;
  v10 = 2048;
  v11 = v6;
  v12 = 2048;
  v13 = v7;
  _os_log_debug_impl(&dword_1AC7A1000, a3, OS_LOG_TYPE_DEBUG, "Indexable text for %@ presentableText=%ld indexableText.length=%ld", (uint8_t *)&v8, 0x20u);

}

@end
