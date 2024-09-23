@implementation DDDetectionController

uint64_t __74__DDDetectionController__startCoalescedURLification_clearPreviousResults___block_invoke_2(uint64_t a1, int a2)
{
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    __74__DDDetectionController__startCoalescedURLification_clearPreviousResults___block_invoke_2_cold_1(a1, a2);
    if (!a2)
      return objc_msgSend(*(id *)(a1 + 32), "cleanup");
  }
  else if (!a2)
  {
    return objc_msgSend(*(id *)(a1 + 32), "cleanup");
  }
  if ((objc_msgSend(*(id *)(a1 + 32), "isDiscarded") & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 32), "cleanup");
  return objc_msgSend(*(id *)(a1 + 40), "_enqueueOperation:", *(_QWORD *)(a1 + 32));
}

void __74__DDDetectionController__startCoalescedURLification_clearPreviousResults___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;

  v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __74__DDDetectionController__startCoalescedURLification_clearPreviousResults___block_invoke_2;
  v5[3] = &unk_1E42583C0;
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 40);
  v6 = v3;
  v7 = v4;
  objc_msgSend(v3, "dispatchScanQueryCreationWithCompletionBlock:", v5);

}

uint64_t __57__DDDetectionController__resetStoredResultsForContainer___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
}

void __56__DDDetectionController_cancelURLificationForContainer___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 32), "objectForKey:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __51__DDDetectionController__newOperationForContainer___block_invoke_2(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "objectForKey:", *(_QWORD *)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setContext:", v2);

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "setObject:forKey:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
}

id __51__DDDetectionController__newOperationForContainer___block_invoke(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKey:", *(_QWORD *)(a1 + 40));
}

void __43__DDDetectionController__enqueueOperation___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    __43__DDDetectionController__enqueueOperation___block_invoke_cold_1(v2);
  v4 = objc_loadWeakRetained(v2);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __43__DDDetectionController__enqueueOperation___block_invoke_26;
  v6[3] = &unk_1E4258140;
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = WeakRetained;
  v5 = WeakRetained;
  objc_msgSend(v4, "dispatchContainerModificationBlock:", v6);

}

void __41__DDDetectionController__doURLification___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 32), "objectForKey:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __41__DDDetectionController_sharedController__block_invoke()
{
  DDDetectionController *v0;
  void *v1;

  v0 = objc_alloc_init(DDDetectionController);
  v1 = (void *)sharedController__sSharedController;
  sharedController__sSharedController = (uint64_t)v0;

}

- (BOOL)shouldUseLightStyleAtIndex:(unint64_t)a3 ofStorage:(id)a4 moreHighlight:(BOOL *)a5
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  int v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  id v19;

  v8 = a4;
  v19 = 0;
  -[DDDetectionController _resultForLinkAtIndex:inTextStorage:subResult:url:effectiveRange:](self, "_resultForLinkAtIndex:inTextStorage:subResult:url:effectiveRange:", a3, v8, &v19, 0, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v19;
  v11 = v10;
  if (v9)
  {
    if (v10)
    {
      v12 = v10;

      v9 = v12;
    }
    objc_msgSend(v9, "coreResult");
    v13 = DDShouldUseLightLinksForResult();
    v14 = v13;
    if (a5 && v13)
    {
      objc_msgSend(v9, "coreResult");
      *a5 = DDShouldUseDebugHighlightForResult();
      v14 = 1;
    }
  }
  else
  {
    objc_msgSend(v8, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0CEA0C0], a3, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    dd_ensureUrlIsUrl(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "scheme");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v17, "isEqualToString:", CFSTR("x-apple-data-detectors-clientdefined"));

    v9 = 0;
  }

  return v14;
}

- (id)preferredTextAttributesForLinkAtCharacterIndex:(unint64_t)a3 ofStorage:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  char v15;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v15 = 0;
  if (-[DDDetectionController shouldUseLightStyleAtIndex:ofStorage:moreHighlight:](self, "shouldUseLightStyleAtIndex:ofStorage:moreHighlight:", a3, v6, &v15))
  {
    if (v15)
    {
      objc_msgSend(MEMORY[0x1E0CEA478], "systemOrangeColor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v6, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0CEA0A0], a3, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v9)
      {
        v11 = v9;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
        v11 = (id)objc_claimAutoreleasedReturnValue();
      }
      v12 = v11;

      objc_msgSend((id)objc_opt_class(), "lightUnderlineColorFromTextColor:", v12);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v13 = *MEMORY[0x1E0CEA178];
    v16[0] = *MEMORY[0x1E0CEA180];
    v16[1] = v13;
    v17[0] = &unk_1E4269D90;
    v17[1] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_resultForLinkAtIndex:(unint64_t)a3 inTextStorage:(id)a4 subResult:(id *)a5 url:(id *)a6 effectiveRange:(_NSRange *)a7
{
  id v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;

  v12 = a4;
  objc_msgSend(v12, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0D1CC00], a3, a7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    objc_msgSend(v13, "type");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isEqualToString:", *MEMORY[0x1E0D1CB58]);

    if (a5)
    {
      if (v16)
      {
        -[DDDetectionController _subResultAtIndex:ofResult:](self, "_subResultAtIndex:ofResult:", a3, v14);
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
  }
  if (a6)
  {
    objc_msgSend(v12, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0CEA0C0], a3, a7);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[DDDetectionController _URLForLinkAttributeValue:](self, "_URLForLinkAttributeValue:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "scheme");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "lowercaseString");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "hasPrefix:", CFSTR("x-apple-data-detectors"));

    if ((v21 & 1) == 0)
      *a6 = objc_retainAutorelease(v18);

  }
  return v14;
}

- (void)startURLificationForContainer:(id)a3 detectedTypes:(unint64_t)a4 options:(int)a5
{
  char v5;
  id v8;
  id v9;

  v5 = a5;
  v8 = a3;
  if (v8 && a4)
  {
    if (a4 - 0x80000000 <= 0xFFFFFFFF7FFFFFFELL)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[DDDetectionController startURLificationForContainer:detectedTypes:options:].cold.2();
      goto LABEL_14;
    }
    -[DDDetectionController cancelURLificationForContainer:](self, "cancelURLificationForContainer:", v8);
    v9 = -[DDDetectionController _newOperationForContainer:](self, "_newOperationForContainer:", v8);
    objc_msgSend(v9, "setDetectionTypes:", a4);
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      -[DDDetectionController startURLificationForContainer:detectedTypes:options:].cold.3((uint64_t)v8, (uint64_t)v9, a4);
      if ((v5 & 2) == 0)
        goto LABEL_10;
    }
    else if ((v5 & 2) == 0)
    {
LABEL_10:
      -[DDDetectionController _startCoalescedURLification:](self, "_startCoalescedURLification:", v9);
LABEL_13:

      goto LABEL_14;
    }
    -[DDDetectionController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__startCoalescedURLification_, v9, 2.0);
    goto LABEL_13;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[DDDetectionController startURLificationForContainer:detectedTypes:options:].cold.1();
LABEL_14:

}

- (void)startURLificationForContainer:(id)a3 detectedTypes:(unint64_t)a4
{
  if (a4 == 127)
    a4 = 511;
  -[DDDetectionController startURLificationForContainer:detectedTypes:options:](self, "startURLificationForContainer:detectedTypes:options:", a3, a4, 0);
}

- (DDDetectionController)init
{
  DDDetectionController *v2;
  uint64_t v3;
  NSMapTable *containerToContextsTable;
  uint64_t v5;
  NSMapTable *containerToResultsTable;
  uint64_t v7;
  NSMapTable *containerToOperationsTable;
  dispatch_queue_t v9;
  OS_dispatch_queue *protectQueue;
  NSOperationQueue *fullScannerQueue;
  NSOperationQueue *urlScannerQueue;
  DDActionController *v13;
  DDActionController *actionController;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)DDDetectionController;
  v2 = -[DDDetectionController init](&v16, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 5, 0, 4);
    containerToContextsTable = v2->_containerToContextsTable;
    v2->_containerToContextsTable = (NSMapTable *)v3;

    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 5, 0, 4);
    containerToResultsTable = v2->_containerToResultsTable;
    v2->_containerToResultsTable = (NSMapTable *)v5;

    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 5, 0, 4);
    containerToOperationsTable = v2->_containerToOperationsTable;
    v2->_containerToOperationsTable = (NSMapTable *)v7;

    v9 = dispatch_queue_create("com.apple.DataDetectorsUI", 0);
    protectQueue = v2->_protectQueue;
    v2->_protectQueue = (OS_dispatch_queue *)v9;

    fullScannerQueue = v2->_fullScannerQueue;
    v2->_fullScannerQueue = 0;

    urlScannerQueue = v2->_urlScannerQueue;
    v2->_urlScannerQueue = 0;

    v13 = objc_alloc_init(DDActionController);
    actionController = v2->_actionController;
    v2->_actionController = v13;

  }
  return v2;
}

- (void)cancelURLificationForContainer:(id)a3
{
  id v4;
  NSObject *protectQueue;
  uint64_t v6;
  id v7;
  NSObject *v8;
  _QWORD v9[5];
  id v10;
  _QWORD block[5];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy_;
  v18 = __Block_byref_object_dispose_;
  v19 = 0;
  protectQueue = self->_protectQueue;
  v6 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__DDDetectionController_cancelURLificationForContainer___block_invoke;
  block[3] = &unk_1E4258398;
  v13 = &v14;
  block[4] = self;
  v7 = v4;
  v12 = v7;
  dispatch_sync(protectQueue, block);
  if (v15[5])
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      -[DDDetectionController cancelURLificationForContainer:].cold.1();
    objc_msgSend((id)v15[5], "cancel");
    v8 = self->_protectQueue;
    v9[0] = v6;
    v9[1] = 3221225472;
    v9[2] = __56__DDDetectionController_cancelURLificationForContainer___block_invoke_28;
    v9[3] = &unk_1E4258140;
    v9[4] = self;
    v10 = v7;
    dispatch_sync(v8, v9);

  }
  _Block_object_dispose(&v14, 8);

}

- (void)_startCoalescedURLification:(id)a3 clearPreviousResults:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD activity_block[4];
  id v11;
  DDDetectionController *v12;

  v4 = a4;
  v6 = a3;
  v7 = v6;
  if (v4)
  {
    objc_msgSend(v6, "container");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[DDDetectionController _resetStoredResultsForContainer:](self, "_resetStoredResultsForContainer:", v8);

  }
  activity_block[0] = MEMORY[0x1E0C809B0];
  activity_block[1] = 3221225472;
  activity_block[2] = __74__DDDetectionController__startCoalescedURLification_clearPreviousResults___block_invoke;
  activity_block[3] = &unk_1E4258140;
  v11 = v7;
  v12 = self;
  v9 = v7;
  _os_activity_initiate(&dword_19EFBB000, "Data Detectors URLification", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

- (void)_startCoalescedURLification:(id)a3
{
  -[DDDetectionController _startCoalescedURLification:clearPreviousResults:](self, "_startCoalescedURLification:clearPreviousResults:", a3, 1);
}

- (void)_resetStoredResultsForContainer:(id)a3
{
  id v4;
  NSObject *protectQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  protectQueue = self->_protectQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__DDDetectionController__resetStoredResultsForContainer___block_invoke;
  block[3] = &unk_1E4258140;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(protectQueue, block);

}

- (id)_newOperationForContainer:(id)a3
{
  id v5;
  uint64_t v6;
  NSObject *protectQueue;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v17;
  _QWORD v18[4];
  id v19;
  DDDetectionController *v20;
  id v21;
  _QWORD block[5];
  id v23;

  v5 = a3;
  v6 = MEMORY[0x1E0C809B0];
  protectQueue = self->_protectQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__DDDetectionController__newOperationForContainer___block_invoke;
  block[3] = &unk_1E4258140;
  block[4] = self;
  v8 = v5;
  v23 = v8;
  dispatch_sync(protectQueue, block);
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DDDetectionController.m"), 188, CFSTR("Unknown container type"));

  }
  v10 = (void *)objc_msgSend(v8, "dd_newOperation");
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DDDetectionController.m"), 193, CFSTR("DDOperation creation failed"));

  }
  v11 = self->_protectQueue;
  v18[0] = v6;
  v18[1] = 3221225472;
  v18[2] = __51__DDDetectionController__newOperationForContainer___block_invoke_2;
  v18[3] = &unk_1E4258370;
  v12 = v10;
  v19 = v12;
  v20 = self;
  v21 = v8;
  v13 = v8;
  dispatch_sync(v11, v18);
  v14 = v21;
  v15 = v12;

  return v15;
}

- (void)_enqueueOperation:(id)a3
{
  id v4;
  id v5;
  id *p_fullScannerQueue;
  NSOperationQueue *fullScannerQueue;
  NSOperationQueue *urlScannerQueue;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id location;

  v4 = a3;
  objc_initWeak(&location, v4);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __43__DDDetectionController__enqueueOperation___block_invoke;
  v11[3] = &unk_1E42583E8;
  objc_copyWeak(&v12, &location);
  v11[4] = self;
  objc_msgSend(v4, "setCompletionBlock:", v11);
  if (objc_msgSend(v4, "needsFullScanner"))
  {
    fullScannerQueue = self->_fullScannerQueue;
    p_fullScannerQueue = (id *)&self->_fullScannerQueue;
    v5 = fullScannerQueue;
    if (!fullScannerQueue)
      goto LABEL_5;
  }
  else
  {
    urlScannerQueue = self->_urlScannerQueue;
    p_fullScannerQueue = (id *)&self->_urlScannerQueue;
    v5 = urlScannerQueue;
    if (!urlScannerQueue)
    {
LABEL_5:
      v9 = objc_alloc_init(MEMORY[0x1E0CB3828]);
      v10 = *p_fullScannerQueue;
      *p_fullScannerQueue = v9;

      objc_msgSend(*p_fullScannerQueue, "setMaxConcurrentOperationCount:", 1);
      v5 = *p_fullScannerQueue;
    }
  }
  objc_msgSend(v5, "addOperation:", v4);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

- (void)_doURLification:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  NSObject *protectQueue;
  uint64_t v10;
  id v11;
  int v12;
  int v13;
  NSObject *v14;
  id v15;
  NSObject *v16;
  id v17;
  int v18;
  NSObject *v19;
  id WeakRetained;
  id v21;
  char v22;
  void *v23;
  CFTypeRef v24;
  uint64_t v25;
  NSObject *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  id v32;
  void *v33;
  NSObject *v34;
  NSObject *v35;
  id v36;
  void *v37;
  id v38;
  id v39;
  unsigned int v40;
  _QWORD v41[5];
  id v42;
  id v43;
  _QWORD v44[5];
  id v45;
  _QWORD v46[5];
  id v47;
  _QWORD v48[4];
  id v49;
  DDDetectionController *v50;
  id v51;
  id v52;
  CFTypeRef v53;
  _QWORD v54[5];
  id v55;
  id v56;
  _QWORD block[5];
  id v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  uint64_t (*v63)(uint64_t, uint64_t);
  void (*v64)(uint64_t);
  id v65;
  const __CFString *v66;
  void *v67;
  _BYTE v68[32];
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    -[DDDetectionController _doURLification:].cold.7();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DDDetectionController.m"), 378, CFSTR("Operation should not be nil"));

  }
  objc_msgSend(v5, "container");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "results");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "tryCount");
  v60 = 0;
  v61 = &v60;
  v62 = 0x3032000000;
  v63 = __Block_byref_object_copy_;
  v64 = __Block_byref_object_dispose_;
  v65 = 0;
  protectQueue = self->_protectQueue;
  v10 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__DDDetectionController__doURLification___block_invoke;
  block[3] = &unk_1E4258398;
  v59 = &v60;
  block[4] = self;
  v11 = v6;
  v58 = v11;
  dispatch_sync(protectQueue, block);
  if ((id)v61[5] == v5 && (objc_msgSend(v5, "containerIsReady") & 1) != 0)
  {
    v12 = objc_msgSend(v5, "isDiscarded");
    if (v7)
      v13 = v12;
    else
      v13 = 1;
    if (v13 == 1)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
        -[DDDetectionController _doURLification:].cold.3();
    }
    else
    {
      if (v8 != -1 && objc_msgSend(v5, "needsToStartOver"))
      {
        v16 = MEMORY[0x1E0C81028];
        v17 = MEMORY[0x1E0C81028];
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          -[DDDetectionController _doURLification:].cold.5((uint64_t)v5, (uint64_t)v68, objc_msgSend(v7, "count"));

        v18 = 1;
        goto LABEL_33;
      }
      if (objc_msgSend(v7, "count"))
      {
        v19 = self->_protectQueue;
        v54[0] = v10;
        v54[1] = 3221225472;
        v54[2] = __41__DDDetectionController__doURLification___block_invoke_31;
        v54[3] = &unk_1E4258370;
        v54[4] = self;
        v39 = v11;
        v55 = v39;
        v38 = v7;
        v56 = v38;
        dispatch_sync(v19, v54);
        v40 = objc_msgSend(v5, "doURLificationOnDocument");
        WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        if (WeakRetained)
        {
          v21 = objc_loadWeakRetained((id *)&self->_delegate);
          v22 = objc_opt_respondsToSelector();

          if ((v22 & 1) != 0)
          {
            objc_msgSend(v5, "context");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v5, "needContinuation") & 1) != 0)
              v24 = 0;
            else
              v24 = CFRetain((CFTypeRef)objc_msgSend(v5, "scanQuery"));
            dispatch_get_global_queue(-2, 0);
            v26 = objc_claimAutoreleasedReturnValue();
            v48[0] = v10;
            v48[1] = 3221225472;
            v48[2] = __41__DDDetectionController__doURLification___block_invoke_2;
            v48[3] = &unk_1E4258410;
            v49 = v38;
            v50 = self;
            v51 = v23;
            v53 = v24;
            v52 = v39;
            v27 = v23;
            dispatch_async(v26, v48);

          }
        }

        v25 = v40;
      }
      else
      {
        v25 = 0;
      }
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = CFSTR("kDataDetectorsUIURLificationHadDOMModification");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v25);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = v29;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v67, &v66, 1);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "postNotificationName:object:userInfo:", CFSTR("DataDetectorsUIDidFinishURLificationNotification"), v11, v30);

    }
    v18 = 0;
LABEL_33:
    v31 = self->_protectQueue;
    v46[0] = v10;
    v46[1] = 3221225472;
    v46[2] = __41__DDDetectionController__doURLification___block_invoke_43;
    v46[3] = &unk_1E4258140;
    v46[4] = self;
    v32 = v11;
    v47 = v32;
    dispatch_sync(v31, v46);
    if (v18 && v8 >= 2)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[DDDetectionController _doURLification:].cold.1();
    }
    else if ((v18 | objc_msgSend(v5, "needContinuation")) == 1)
    {
      if (v18)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
          -[DDDetectionController _doURLification:].cold.2();
        v33 = (void *)objc_msgSend(v5, "newOperationForStartingOver");
        v34 = self->_protectQueue;
        v44[0] = v10;
        v44[1] = 3221225472;
        v44[2] = __41__DDDetectionController__doURLification___block_invoke_44;
        v44[3] = &unk_1E4258140;
        v44[4] = self;
        v45 = v32;
        dispatch_sync(v34, v44);

      }
      else
      {
        v33 = (void *)objc_msgSend(v5, "newOperationForContinuation");
      }
      v35 = self->_protectQueue;
      v41[0] = v10;
      v41[1] = 3221225472;
      v41[2] = __41__DDDetectionController__doURLification___block_invoke_2_45;
      v41[3] = &unk_1E4258370;
      v41[4] = self;
      v36 = v33;
      v42 = v36;
      v43 = v32;
      dispatch_sync(v35, v41);
      -[DDDetectionController _startCoalescedURLification:clearPreviousResults:](self, "_startCoalescedURLification:clearPreviousResults:", v36, 0);

    }
    objc_msgSend(v5, "cleanup");

    goto LABEL_16;
  }
  v14 = MEMORY[0x1E0C81028];
  v15 = MEMORY[0x1E0C81028];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    -[DDDetectionController _doURLification:].cold.6((uint64_t)v5, v61[5], (uint64_t)v68, objc_msgSend(v7, "count"));

  objc_msgSend(v5, "cleanup");
LABEL_16:

  _Block_object_dispose(&v60, 8);
}

+ (id)sharedController
{
  if (sharedController_once != -1)
    dispatch_once(&sharedController_once, &__block_literal_global_1);
  return (id)sharedController__sSharedController;
}

+ (id)tapAndHoldSchemes
{
  void *v2;
  void *v3;

  DDURLTapAndHoldSchemes();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayByAddingObject:", CFSTR("x-apple-data-detectors-clientdefined"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (void)setMessagesActionHandler:(id)a3
{
  uint64_t v3;
  void *v4;

  if ((id)_messagesActionHandler != a3)
  {
    v3 = MEMORY[0x1A1AF3244](a3, a2);
    v4 = (void *)_messagesActionHandler;
    _messagesActionHandler = v3;

  }
}

+ (id)messagesActionHandler
{
  return (id)MEMORY[0x1A1AF3244](_messagesActionHandler, a2);
}

- (void)dealloc
{
  objc_super v3;

  -[NSOperationQueue cancelAllOperations](self->_fullScannerQueue, "cancelAllOperations");
  -[NSOperationQueue cancelAllOperations](self->_urlScannerQueue, "cancelAllOperations");
  v3.receiver = self;
  v3.super_class = (Class)DDDetectionController;
  -[DDDetectionController dealloc](&v3, sel_dealloc);
}

- (void)setResults:(__CFArray *)a3 forContainer:(id)a4
{
  id v6;
  NSObject *protectQueue;
  id v8;
  _QWORD block[5];
  id v10;
  __CFArray *v11;

  v6 = a4;
  protectQueue = self->_protectQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__DDDetectionController_setResults_forContainer___block_invoke;
  block[3] = &unk_1E4258348;
  v10 = v6;
  v11 = a3;
  block[4] = self;
  v8 = v6;
  dispatch_sync(protectQueue, block);

}

uint64_t __49__DDDetectionController_setResults_forContainer___block_invoke(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;

  v2 = a1[5];
  v1 = a1[6];
  v3 = *(void **)(a1[4] + 40);
  if (v1)
    return objc_msgSend(v3, "setObject:forKey:", v1, v2);
  else
    return objc_msgSend(v3, "removeObjectForKey:", v2);
}

- (void)setContext:(id)a3 forContainer:(id)a4
{
  id v6;
  id v7;
  NSObject *protectQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  DDDetectionController *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  protectQueue = self->_protectQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__DDDetectionController_setContext_forContainer___block_invoke;
  block[3] = &unk_1E4258370;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_sync(protectQueue, block);

}

uint64_t __49__DDDetectionController_setContext_forContainer___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;

  v2 = a1[4];
  v3 = *(void **)(a1[5] + 48);
  if (v2)
    return objc_msgSend(v3, "setObject:forKey:", v2, a1[6]);
  else
    return objc_msgSend(v3, "removeObjectForKey:", a1[6]);
}

- (id)copyContextForContainer:(id)a3
{
  id v4;
  NSObject *protectQueue;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
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
  v17 = 0;
  protectQueue = self->_protectQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__DDDetectionController_copyContextForContainer___block_invoke;
  block[3] = &unk_1E4258398;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(protectQueue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __49__DDDetectionController_copyContextForContainer___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1[4] + 48), "objectForKey:", a1[5]);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v5, "copy");
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)_commonResetResultsForContainer:(id)a3
{
  id v4;

  v4 = a3;
  -[DDDetectionController cancelURLificationForContainer:](self, "cancelURLificationForContainer:", v4);
  -[DDDetectionController _resetStoredResultsForContainer:](self, "_resetStoredResultsForContainer:", v4);

}

- (void)resetResultsForContainer:(id)a3
{
  id v4;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[DDDetectionController resetResultsForFrame:](self, "resetResultsForFrame:", v4);
  else
    -[DDDetectionController resetResultsForTextView:](self, "resetResultsForTextView:", v4);

}

uint64_t __43__DDDetectionController__enqueueOperation___block_invoke_26(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_doURLification:", *(_QWORD *)(a1 + 40));
}

uint64_t __56__DDDetectionController_cancelURLificationForContainer___block_invoke_28(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
}

- (void)containerWillBeRemoved:(id)a3
{
  id v4;
  NSObject *protectQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[DDDetectionController cancelURLificationForContainer:](self, "cancelURLificationForContainer:", v4);
  protectQueue = self->_protectQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__DDDetectionController_containerWillBeRemoved___block_invoke;
  block[3] = &unk_1E4258140;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(protectQueue, block);

}

uint64_t __48__DDDetectionController_containerWillBeRemoved___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
}

+ (BOOL)_shouldConsiderResultForCoreRecents:(__DDResult *)a3
{
  const __CFString *Type;
  uint64_t SubresultWithType;
  uint64_t v5;
  uint64_t v6;
  const __CFArray *SubResults;
  const __CFArray *v8;
  CFIndex Count;
  CFIndex v10;
  CFIndex v11;
  uint64_t v12;
  const __CFString *v13;
  const __CFString *v14;
  uint64_t v15;

  Type = (const __CFString *)DDResultGetType();
  if (CFStringCompare(Type, (CFStringRef)*MEMORY[0x1E0D1CAC8], 0))
  {
    LOBYTE(SubresultWithType) = 0;
  }
  else
  {
    SubresultWithType = DDResultGetSubresultWithType();
    if (SubresultWithType)
    {
      DDResultGetRange();
      v6 = v5;
      if (v5 >= 1
        && (SubResults = (const __CFArray *)DDResultGetSubResults()) != 0
        && (v8 = SubResults, Count = CFArrayGetCount(SubResults), Count >= 1))
      {
        v10 = Count;
        v11 = 0;
        v12 = 0;
        v13 = (const __CFString *)*MEMORY[0x1E0D1CB30];
        do
        {
          CFArrayGetValueAtIndex(v8, v11);
          v14 = (const __CFString *)DDResultGetType();
          if (CFStringCompare(v14, v13, 0) == kCFCompareEqualTo)
          {
            DDResultGetRange();
            v12 += v15;
          }
          ++v11;
        }
        while (v10 != v11);
      }
      else
      {
        v12 = 0;
      }
      LOBYTE(SubresultWithType) = v6 > 0 && v12 + 5 < v6;
    }
  }
  return SubresultWithType;
}

void __41__DDDetectionController__doURLification___block_invoke_31(_QWORD *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1[4] + 40), "objectForKey:", a1[5]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1[4] + 40);
  v4 = a1[6];
  v6 = v2;
  if (v2)
  {
    objc_msgSend(v2, "arrayByAddingObjectsFromArray:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, a1[5]);

  }
  else
  {
    objc_msgSend(v3, "setObject:forKey:", v4, a1[5]);
  }

}

void __41__DDDetectionController__doURLification___block_invoke_2(uint64_t a1)
{
  unint64_t v2;
  const __CFString *v3;
  NSObject *v4;
  uint64_t SubresultWithType;
  const __CFString *Type;
  CFComparisonResult v7;
  uint64_t SubResults;
  void *v9;
  void *v10;
  id WeakRetained;
  void *v12;
  _BOOL4 v13;
  void *v14;
  const void *v15;
  uint8_t v16[4];
  uint64_t v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v2 = 0;
    v3 = (const __CFString *)*MEMORY[0x1E0D1CB58];
    v4 = MEMORY[0x1E0C81028];
    do
    {
      SubresultWithType = objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", v2);
      Type = (const __CFString *)DDResultGetType();
      v7 = CFStringCompare(Type, v3, 0);
      if (v7)
      {
        SubResults = 0;
        if (SubresultWithType)
          goto LABEL_7;
      }
      else
      {
        SubResults = DDResultGetSubResults();
        SubresultWithType = DDResultGetSubresultWithType();
        if (SubresultWithType)
        {
LABEL_7:
          if (objc_msgSend((id)objc_opt_class(), "_shouldConsiderResultForCoreRecents:", SubresultWithType))
          {
            if (!SubResults)
            {
              v9 = *(void **)(a1 + 32);
              objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", CFSTR("ReferenceDate"));
              v10 = (void *)objc_claimAutoreleasedReturnValue();
              SubResults = (uint64_t)findNearbyResultsInArray(v9, v2, 50, 200, v10);

            }
            WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 72));
            objc_msgSend(WeakRetained, "detectionController:coreRecentsWeightForResult:fromScanQuery:inContainer:partOfSignature:", *(_QWORD *)(a1 + 40), SubresultWithType, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 56), v7 == kCFCompareEqualTo);
            v12 = (void *)objc_claimAutoreleasedReturnValue();

            v13 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
            if (v12)
            {
              if (v13)
              {
                *(_DWORD *)buf = 138412546;
                v19 = SubresultWithType;
                v20 = 2112;
                v21 = v12;
                _os_log_debug_impl(&dword_19EFBB000, v4, OS_LOG_TYPE_DEBUG, "Magically adding result %@ to recents with score %@", buf, 0x16u);
              }
              objc_msgSend(MEMORY[0x1E0D1CE68], "resultFromCoreResult:", SubresultWithType);
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              +[DDCoreRecents addResultToRecents:associatedResults:weight:context:userInitiated:](DDCoreRecents, "addResultToRecents:associatedResults:weight:context:userInitiated:", v14, SubResults, v12, *(_QWORD *)(a1 + 48), 0);

            }
            else if (v13)
            {
              __41__DDDetectionController__doURLification___block_invoke_2_cold_1(v16, SubresultWithType, &v17);
            }

          }
        }
      }
      ++v2;
    }
    while (v2 < objc_msgSend(*(id *)(a1 + 32), "count"));
  }
  v15 = *(const void **)(a1 + 64);
  if (v15)
    CFRelease(v15);
}

uint64_t __41__DDDetectionController__doURLification___block_invoke_43(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
}

uint64_t __41__DDDetectionController__doURLification___block_invoke_44(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
}

uint64_t __41__DDDetectionController__doURLification___block_invoke_2_45(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 32), "setObject:forKey:", a1[5], a1[6]);
}

- (id)actionsForResult:(__DDResult *)a3 context:(id)a4
{
  if (!a3)
    return 0;
  -[DDActionController actionsForURL:result:context:](self->_actionController, "actionsForURL:result:context:", 0, a3, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)performAction:(id)a3 inView:(id)a4 interactionDelegate:(id)a5
{
  DDActionController *actionController;
  id v9;
  id v10;

  actionController = self->_actionController;
  v9 = a4;
  v10 = a3;
  -[DDActionController setInteractionDelegate:](actionController, "setInteractionDelegate:", a5);
  -[DDActionController setBaseView:](self->_actionController, "setBaseView:", v9);

  -[DDActionController performAction:](self->_actionController, "performAction:", v10);
}

- (void)performAction:(id)a3 fromAlertController:(id)a4 interactionDelegate:(id)a5
{
  DDActionController *actionController;
  id v9;
  id v10;

  actionController = self->_actionController;
  v9 = a4;
  v10 = a3;
  -[DDActionController setInteractionDelegate:](actionController, "setInteractionDelegate:", a5);
  -[DDActionController setAlertController:](self->_actionController, "setAlertController:", v9);

  -[DDActionController performAction:](self->_actionController, "performAction:", v10);
}

- (void)performAction:(id)a3 fromView:(id)a4 alertController:(id)a5 interactionDelegate:(id)a6
{
  DDActionController *actionController;
  id v11;
  id v12;
  id v13;

  actionController = self->_actionController;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  -[DDActionController setInteractionDelegate:](actionController, "setInteractionDelegate:", a6);
  -[DDActionController setBaseView:](self->_actionController, "setBaseView:", v12);

  -[DDActionController setAlertController:](self->_actionController, "setAlertController:", v11);
  -[DDActionController performAction:](self->_actionController, "performAction:", v13);

}

- (BOOL)isPerformingAction
{
  return -[DDActionController isPerformingAction](self->_actionController, "isPerformingAction");
}

- (BOOL)actionIsCancellable
{
  return -[DDActionController actionIsCancellable](self->_actionController, "actionIsCancellable");
}

- (void)cancelAction
{
  -[DDActionController cancelAction](self->_actionController, "cancelAction");
}

- (BOOL)tryDismissActionInView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  BOOL v8;

  v4 = a3;
  -[DDActionController baseView](self->_actionController, "baseView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_8;
  v6 = v5;
  if (v4)
  {
    -[DDActionController baseView](self->_actionController, "baseView");
    v7 = (id)objc_claimAutoreleasedReturnValue();

    if (v7 != v4)
      goto LABEL_8;
  }
  else
  {

  }
  if (!-[DDActionController actionIsCancellable](self->_actionController, "actionIsCancellable"))
  {
    v8 = 0;
    goto LABEL_10;
  }
  -[DDActionController cancelAction](self->_actionController, "cancelAction");
LABEL_8:
  v8 = 1;
LABEL_10:

  return v8;
}

- (BOOL)_shouldImmediatelyLaunchDefaultActionForURL:(id)a3 result:(__DDResult *)a4
{
  id v6;
  char v7;

  v6 = a3;
  if (+[DDDetectionController largeScreenIdiom](DDDetectionController, "largeScreenIdiom"))
  {
    v7 = 0;
  }
  else
  {
    if (a4)
    {
      -[DDDetectionController _interactionDidStartForResult:](self, "_interactionDidStartForResult:", a4);
    }
    else if (v6)
    {
      -[DDDetectionController _interactionDidStartForURL:](self, "_interactionDidStartForURL:", v6);
    }
    v7 = dd_callsRequireExternalPrompt();
  }

  return v7;
}

- (BOOL)shouldImmediatelyLaunchDefaultActionForURL:(id)a3
{
  return -[DDDetectionController _shouldImmediatelyLaunchDefaultActionForURL:result:](self, "_shouldImmediatelyLaunchDefaultActionForURL:result:", a3, 0);
}

- (BOOL)shouldImmediatelyLaunchDefaultActionForResult:(__DDResult *)a3
{
  return -[DDDetectionController _shouldImmediatelyLaunchDefaultActionForURL:result:](self, "_shouldImmediatelyLaunchDefaultActionForURL:result:", 0, a3);
}

- (BOOL)shouldIgnoreMessageActionForURL:(id)a3
{
  BOOL result;
  char v4;

  v4 = 0;
  if (!a3)
    return 1;
  result = -[DDDetectionController _checkIfBusinessWithURL:messageable:](self, "_checkIfBusinessWithURL:messageable:", a3, &v4);
  if (v4)
    return 0;
  return result;
}

+ (BOOL)largeScreenIdiom
{
  void *v2;
  uint64_t v3;

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  return v3 == 6 || (v3 & 0xFFFFFFFFFFFFFFFBLL) == 1;
}

- (__DDResult)_resultForIdentifier:(id)a3 forContainer:(id)a4 context:(id *)a5
{
  id v8;
  id v9;
  __CFRunLoop *Main;
  NSObject *protectQueue;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  __DDResult *v22;
  id v23;
  void *v24;
  id v25;
  id *v27;
  void *v28;
  void *v29;
  id *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _QWORD block[5];
  id v36;
  uint64_t *v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  id v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  Main = CFRunLoopGetMain();
  if (Main != CFRunLoopGetCurrent())
  {
    v27 = a5;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[DDDetectionController _resultForIdentifier:forContainer:context:]");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInFunction:file:lineNumber:description:", v29, CFSTR("DDDetectionController.m"), 647, CFSTR("Main thread violation"));

    a5 = v27;
  }
  v45 = 0;
  v46 = &v45;
  v47 = 0x3032000000;
  v48 = __Block_byref_object_copy_;
  v49 = __Block_byref_object_dispose_;
  v50 = 0;
  v39 = 0;
  v40 = &v39;
  v41 = 0x3032000000;
  v42 = __Block_byref_object_copy_;
  v43 = __Block_byref_object_dispose_;
  v44 = 0;
  protectQueue = self->_protectQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__DDDetectionController__resultForIdentifier_forContainer_context___block_invoke;
  block[3] = &unk_1E4258438;
  v37 = &v45;
  block[4] = self;
  v12 = v9;
  v36 = v12;
  v38 = &v39;
  dispatch_sync(protectQueue, block);
  v13 = (void *)v46[5];
  if (v13)
  {
    v30 = a5;
    v14 = v13;
    objc_msgSend(v8, "componentsSeparatedByString:", CFSTR("/"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "count"))
    {
      v33 = 0u;
      v34 = 0u;
      v31 = 0u;
      v32 = 0u;
      v16 = v15;
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v31, v51, 16);
      if (v17)
      {
        v18 = *(_QWORD *)v32;
        while (2)
        {
          v19 = 0;
          v20 = v14;
          do
          {
            if (*(_QWORD *)v32 != v18)
              objc_enumerationMutation(v16);
            v21 = objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * v19), "integerValue");
            if (v21 < 0 || v21 >= objc_msgSend(v20, "count"))
            {
              if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
                -[DDDetectionController _resultForIdentifier:forContainer:context:].cold.3();

              v22 = 0;
              goto LABEL_30;
            }
            v22 = (__DDResult *)objc_msgSend(v20, "objectAtIndex:", v21);
            DDResultGetSubResults();
            v14 = (id)objc_claimAutoreleasedReturnValue();

            ++v19;
            v20 = v14;
          }
          while (v17 != v19);
          v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v31, v51, 16);
          if (v17)
            continue;
          break;
        }
      }
      else
      {
        v22 = 0;
      }

      if (v30)
      {
        v23 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        v24 = v23;
        if (v40[5])
          objc_msgSend(v23, "addEntriesFromDictionary:");
        objc_msgSend(v24, "setObject:forKey:", v46[5], CFSTR("AllResults"));
        v25 = objc_retainAutorelease(v24);
        *v30 = v25;

      }
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[DDDetectionController _resultForIdentifier:forContainer:context:].cold.2();
      v22 = 0;
    }
    v20 = v14;
LABEL_30:

  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[DDDetectionController _resultForIdentifier:forContainer:context:].cold.1();
    v22 = 0;
  }

  _Block_object_dispose(&v39, 8);
  _Block_object_dispose(&v45, 8);

  return v22;
}

void __67__DDDetectionController__resultForIdentifier_forContainer_context___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(*(id *)(a1[4] + 40), "objectForKey:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  objc_msgSend(*(id *)(a1[4] + 48), "objectForKey:", a1[5]);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1[7] + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

- (__DDResult)_resultForURL:(id)a3 forContainer:(id)a4 context:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  char v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  __DDResult *v16;

  v8 = a3;
  v9 = a4;
  objc_msgSend(v8, "scheme");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0D1CE48]);

  if ((v11 & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[DDDetectionController _resultForURL:forContainer:context:].cold.2(v8);
    goto LABEL_8;
  }
  objc_msgSend(v8, "resourceSpecifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "hasPrefix:", CFSTR("//"));

  if ((v13 & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[DDDetectionController _resultForURL:forContainer:context:].cold.1(v8);
LABEL_8:
    v16 = 0;
    goto LABEL_9;
  }
  objc_msgSend(v8, "resourceSpecifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "substringFromIndex:", 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = -[DDDetectionController _resultForIdentifier:forContainer:context:](self, "_resultForIdentifier:forContainer:context:", v15, v9, a5);
LABEL_9:

  return v16;
}

- (BCSBusinessQueryService)_bizService
{
  double v2;
  BCSBusinessQueryService *bizService;
  uint64_t v5;
  BCSBusinessQueryService *v6;
  BCSBusinessQueryService *v7;

  bizService = self->_bizService;
  if (!bizService)
  {
    gotLoadHelper_x8__OBJC_CLASS___BCSBusinessQueryService(v2);
    v6 = (BCSBusinessQueryService *)objc_alloc_init(*(Class *)(v5 + 1784));
    v7 = self->_bizService;
    self->_bizService = v6;

    objc_msgSend((id)objc_opt_class(), "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_set_bizService_, 0);
    -[DDDetectionController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_set_bizService_, 0, 5.0);
    bizService = self->_bizService;
  }
  return bizService;
}

- (void)_interactionDidStartForURL:(id)a3
{
  id v4;
  void *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v8 = v4;
    v6 = _supportsBusinessService();
    v5 = v8;
    if (v6)
    {
      objc_msgSend(v8, "dd_phoneNumberFromTelScheme");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[DDDetectionController _cacheBusinessPhoneNumber:](self, "_cacheBusinessPhoneNumber:", v7);

      v5 = v8;
    }
  }

}

- (void)_interactionDidStartForResult:(__DDResult *)a3
{
  id v5;

  if (a3 && DDResultGetCategory() == 2 && _supportsBusinessService())
  {
    -[DDDetectionController _phoneNumberFromResult:](self, "_phoneNumberFromResult:", a3);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[DDDetectionController _cacheBusinessPhoneNumber:](self, "_cacheBusinessPhoneNumber:", v5);

  }
}

- (void)_cacheBusinessPhoneNumber:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4 && (objc_msgSend(v4, "containsString:", CFSTR("@")) & 1) == 0)
  {
    -[DDDetectionController _bizService](self, "_bizService");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v8[0] = v5;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "warmCacheIfNecessaryForPhoneNumbers:", v7);

    }
  }

}

- (BOOL)_shouldImmediatelyShowActionSheetForCoreResult:(__DDResult *)a3
{
  int Category;
  int v6;

  Category = DDResultGetCategory();
  v6 = DDShouldImmediatelyShowActionSheetForResult();
  if (Category == 2)
  {
    if (dd_phoneNumberResultCanBeRdarLink((_BOOL8)a3)
      || v6 && +[DDCallAction isAvailable](DDCallKitAction, "isAvailable"))
    {
      LOBYTE(v6) = 1;
    }
    else
    {
      return !-[DDDetectionController shouldImmediatelyLaunchDefaultActionForResult:](self, "shouldImmediatelyLaunchDefaultActionForResult:", a3);
    }
  }
  return v6;
}

- (id)_ensureURLIsURL:(id)a3
{
  id v3;
  id v4;
  void *v5;

  v3 = a3;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v5 = 0;
      goto LABEL_5;
    }
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v3);
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = v3;
  }
  v5 = v4;
LABEL_5:

  return v5;
}

- (BOOL)_shouldImmediatelyShowActionSheetForURL:(id)a3
{
  void *v3;
  char v4;

  dd_ensureUrlIsUrl(a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = DDShouldImmediatelyShowActionSheetForURL();

  return v4;
}

- (BOOL)_checkIfBusinessWithURL:(id)a3 messageable:(BOOL *)a4
{
  void *v6;
  void *v7;
  BOOL v8;

  dd_ensureUrlIsUrl(a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "dd_isAnySimpleTelephonyScheme"))
  {
    objc_msgSend(v6, "dd_phoneNumberFromTelScheme");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[DDDetectionController _phoneNumberIsABusinessNumber:messageable:](self, "_phoneNumberIsABusinessNumber:messageable:", v7, a4);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)_checkIfBusinessWithResult:(__DDResult *)a3 messageable:(BOOL *)a4
{
  int Category;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  BOOL v13;
  uint64_t v14;
  void *v15;

  if (!a3)
    return 0;
  Category = DDResultGetCategory();
  if (Category != 1)
  {
    if (Category == 2)
    {
      -[DDDetectionController _phoneNumberFromResult:](self, "_phoneNumberFromResult:", a3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "length"))
      {
        TUUnformattedPhoneNumber();
        v9 = objc_claimAutoreleasedReturnValue();
        v10 = (void *)v9;
        if (v9)
          v11 = (void *)v9;
        else
          v11 = v8;
        v12 = v11;

        v8 = v12;
      }
      v13 = -[DDDetectionController _phoneNumberIsABusinessNumber:messageable:](self, "_phoneNumberIsABusinessNumber:messageable:", v8, a4);
      goto LABEL_12;
    }
    return 0;
  }
  v14 = DDResultCopyExtractedURL();
  if (!v14)
    return 0;
  v8 = (void *)v14;
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[DDDetectionController _checkIfBusinessWithURL:messageable:](self, "_checkIfBusinessWithURL:messageable:", v15, a4);

LABEL_12:
  return v13;
}

- (id)_phoneNumberFromResult:(__DDResult *)a3
{
  DDResultCopyPhoneValue();
  return 0;
}

- (BOOL)_phoneNumberIsABusinessNumber:(id)a3 messageable:(BOOL *)a4
{
  void *v4;
  BOOL v5;

  -[DDDetectionController _businessItemForNumber:messageable:](self, "_businessItemForNumber:messageable:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  return v5;
}

- (id)_businessItemForNumber:(id)a3 messageable:(BOOL *)a4
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  dispatch_time_t v11;
  id v12;
  NSObject *v14;
  id v15;
  uint64_t v16;
  int v17;
  double v18;
  _QWORD v19[4];
  NSObject *v20;
  id v21;
  id v22;
  uint64_t *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint8_t buf[4];
  _BOOL4 v36;
  __int16 v37;
  int v38;
  __int16 v39;
  double v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (objc_msgSend(v6, "length") && (dd_handleIsChatBot(v6) & 1) == 0 && _supportsBusinessService())
  {
    -[DDDetectionController _bizService](self, "_bizService");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = dispatch_group_create();
      v29 = 0;
      v30 = &v29;
      v31 = 0x3032000000;
      v32 = __Block_byref_object_copy_;
      v33 = __Block_byref_object_dispose_;
      v34 = 0;
      v25 = 0;
      v26 = &v25;
      v27 = 0x2020000000;
      v28 = 0;
      dispatch_group_enter(v9);
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __60__DDDetectionController__businessItemForNumber_messageable___block_invoke;
      v19[3] = &unk_1E4258488;
      v10 = v9;
      v20 = v10;
      v21 = v7;
      v22 = v6;
      v23 = &v29;
      v24 = &v25;
      objc_msgSend(v21, "isBusinessRegisteredForPhoneNumber:completion:", v22, v19);
      v11 = dispatch_time(0, 1000000000);
      if (dispatch_group_wait(v10, v11))
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19EFBB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "BCS query timed out", buf, 2u);
        }
        v12 = 0;
      }
      else
      {
        v14 = MEMORY[0x1E0C81028];
        v15 = MEMORY[0x1E0C81028];
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          v16 = v30[5];
          v17 = *((unsigned __int8 *)v26 + 24);
          objc_msgSend(v8, "timeIntervalSinceNow");
          *(_DWORD *)buf = 67109632;
          v36 = v16 != 0;
          v37 = 1024;
          v38 = v17;
          v39 = 2048;
          v40 = -v18;
          _os_log_impl(&dword_19EFBB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Phone number properties business:%d messageable:%d duration:%f (BCS)", buf, 0x18u);
        }

        if (a4)
          *a4 = *((_BYTE *)v26 + 24);
        v12 = (id)v30[5];
      }

      _Block_object_dispose(&v25, 8);
      _Block_object_dispose(&v29, 8);

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

void __60__DDDetectionController__businessItemForNumber_messageable___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  __int128 v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (v5 || !a2)
  {
    if (v5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v6;
      _os_log_impl(&dword_19EFBB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Unable determine phone business status BCS: %@", buf, 0xCu);
    }
  }
  else
  {
    dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
    v8 = *(void **)(a1 + 40);
    v7 = *(_QWORD *)(a1 + 48);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __60__DDDetectionController__businessItemForNumber_messageable___block_invoke_2;
    v9[3] = &unk_1E4258460;
    v11 = *(_OWORD *)(a1 + 56);
    v10 = *(id *)(a1 + 32);
    objc_msgSend(v8, "fetchBusinessItemForPhoneNumber:completion:", v7, v9);

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __60__DDDetectionController__businessItemForNumber_messageable___block_invoke_2(uint64_t a1, void *a2, char a3, void *a4)
{
  id v8;
  id v9;
  char v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = a2;
  v9 = a4;
  if (v9)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138412290;
      v12 = v9;
      _os_log_impl(&dword_19EFBB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Unable to fetch business details BCS: %@", (uint8_t *)&v11, 0xCu);
    }
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    if (v8)
      v10 = a3;
    else
      v10 = 0;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v10;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

+ (id)barcodeContext:(id)a3 preview:(BOOL)a4 contact:(id)a5 ics:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v9 = a3;
  v10 = a5;
  v11 = a6;
  if (a4
    || (objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v12, "bundleIdentifier"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("com.apple.BarcodeSupport.BarcodeNotificationService")),
        v13,
        v12,
        v14))
  {
    +[DDAction contextByAddingValue:toKey:inContext:](DDAction, "contextByAddingValue:toKey:inContext:", MEMORY[0x1E0C9AAB0], CFSTR("NotificationStyle"), v9);
    v15 = objc_claimAutoreleasedReturnValue();

    v9 = (id)v15;
  }
  if (v10)
  {
    +[DDAction contextByAddingValue:toKey:inContext:](DDAction, "contextByAddingValue:toKey:inContext:", v10, CFSTR("Contact"), v9);
    v16 = objc_claimAutoreleasedReturnValue();

    v9 = (id)v16;
  }
  if (v11)
  {
    +[DDAction contextByAddingValue:toKey:inContext:](DDAction, "contextByAddingValue:toKey:inContext:", v11, CFSTR("ICS"), v9);
    v17 = objc_claimAutoreleasedReturnValue();

    v9 = (id)v17;
  }

  return v9;
}

- (id)barcodeActionsForContext:(id)a3 URL:(id)a4 result:(__DDResult *)a5 contact:(id)a6 ics:(id)a7
{
  id v12;
  void *v13;
  void *v14;

  v12 = a4;
  +[DDDetectionController barcodeContext:preview:contact:ics:](DDDetectionController, "barcodeContext:preview:contact:ics:", a3, 0, a6, a7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[DDActionController actionsForURL:result:context:](self->_actionController, "actionsForURL:result:context:", v12, a5, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)barcodePreviewActionForContext:(id)a3 URL:(id)a4 result:(__DDResult *)a5 contact:(id)a6 ics:(id)a7
{
  id v11;
  void *v12;
  void *v13;

  v11 = a4;
  +[DDDetectionController barcodeContext:preview:contact:ics:](DDDetectionController, "barcodeContext:preview:contact:ics:", a3, 1, a6, a7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[DDPreviewAction previewActionForURL:result:context:](DDPreviewAction, "previewActionForURL:result:context:", v11, a5, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (unint64_t)allPublicTypes
{
  return 511;
}

+ (id)filterResults:(id)a3 forTypes:(unint64_t)a4 referenceDate:(id)a5 referenceTimeZone:(id)a6
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  unsigned int (**v14)(_QWORD, _QWORD, _QWORD, _QWORD);
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  v11 = a6;
  v12 = objc_msgSend(v9, "count");
  if (v12)
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v12);
    +[DDOperation shouldUrlifyBlockForTypes:](DDOperation, "shouldUrlifyBlockForTypes:", a4);
    v14 = (unsigned int (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v15 = v9;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v23 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          if (((unsigned int (**)(_QWORD, uint64_t, id, id))v14)[2](v14, objc_msgSend(v20, "coreResult", (_QWORD)v22), v10, v11))
          {
            objc_msgSend(v13, "addObject:", v20);
          }
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v17);
    }

  }
  else
  {
    v13 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v13;
}

+ (id)lightUnderlineColorFromTextColor:(id)a3
{
  id v3;
  BOOL v4;
  double v5;
  void *v6;
  double v8;
  double v9;
  uint64_t v10;

  v9 = 0.0;
  v10 = 0;
  v8 = 0.0;
  v3 = a3;
  objc_msgSend(v3, "getHue:saturation:brightness:alpha:", &v10, &v9, &v8, 0);
  v4 = v8 > 0.98 && v9 < 0.02;
  v5 = 0.26;
  if (v4)
    v5 = 0.46;
  objc_msgSend(v3, "colorWithAlphaComponent:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)set_bizService:(id)a3
{
  objc_storeStrong((id *)&self->_bizService, a3);
}

- (DDDetectionControllerDelegate)delegate
{
  return (DDDetectionControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_bizService, 0);
  objc_storeStrong((id *)&self->_actionController, 0);
  objc_storeStrong((id *)&self->_containerToContextsTable, 0);
  objc_storeStrong((id *)&self->_containerToResultsTable, 0);
  objc_storeStrong((id *)&self->_containerToOperationsTable, 0);
  objc_storeStrong((id *)&self->_protectQueue, 0);
  objc_storeStrong((id *)&self->_urlScannerQueue, 0);
  objc_storeStrong((id *)&self->_fullScannerQueue, 0);
}

- (void)resetResultsForFrame:(id)a3
{
  id v4;
  __CFRunLoop *Main;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[DDDetectionController _commonResetResultsForContainer:](self, "_commonResetResultsForContainer:", v4);
  if (WebThreadIsEnabled())
  {
    v9 = v4;
    WebThreadRun();

  }
  else
  {
    Main = CFRunLoopGetMain();
    if (Main != CFRunLoopGetCurrent())
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[DDDetectionController(WebKitBackEnd) resetResultsForFrame:]");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("DDDetectionController+WebKit.m"), 77, CFSTR("Main thread violation"));

    }
    objc_msgSend(v4, "DOMDocument");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dd_resetResults");

  }
}

void __61__DDDetectionController_WebKitBackEnd__resetResultsForFrame___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "DOMDocument");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "dd_resetResults");

}

- (BOOL)shouldImmediatelyShowActionSheetForURL:(id)a3 forFrame:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  __DDResult *v10;
  BOOL v11;
  BOOL v12;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "scheme");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0D1CE48]);

  if (v9
    && (v10 = -[DDDetectionController _resultForURL:forContainer:context:](self, "_resultForURL:forContainer:context:", v6, v7, 0)) != 0)
  {
    v11 = -[DDDetectionController _shouldImmediatelyShowActionSheetForCoreResult:](self, "_shouldImmediatelyShowActionSheetForCoreResult:", v10);
  }
  else
  {
    v11 = -[DDDetectionController _shouldImmediatelyShowActionSheetForURL:](self, "_shouldImmediatelyShowActionSheetForURL:", v6);
  }
  v12 = v11;

  return v12;
}

- (id)_plainTextAugmentedContext:(id)a3 withFrame:(id)a4
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v4 = (void *)objc_msgSend(a3, "mutableCopy");
  v5 = v4;
  if (v4)
    v6 = v4;
  else
    v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v7 = v6;

  objc_msgSend(v7, "setObject:forKey:", &stru_1E4259460, CFSTR("LeadingText"));
  objc_msgSend(v7, "setObject:forKey:", &stru_1E4259460, CFSTR("TrailingText"));
  v8 = (void *)objc_msgSend(v7, "copy");

  return v8;
}

- (__DDResult)_resultForAnchor:(id)a3 forFrame:(id)a4 context:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  __DDResult *v12;
  void *v13;
  uint64_t v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  id v25;

  v8 = a4;
  v9 = a3;
  objc_msgSend(v9, "absoluteLinkURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "getAttribute:", CFSTR("x-apple-data-detectors-result"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11
    || !objc_msgSend(v11, "length")
    || (v12 = -[DDDetectionController _resultForIdentifier:forContainer:context:](self, "_resultForIdentifier:forContainer:context:", v11, v8, a5)) == 0)
  {
    objc_msgSend(v10, "scheme");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *MEMORY[0x1E0D1CE48];
    v15 = objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0D1CE48]);

    if (!v15
      || (v12 = -[DDDetectionController _resultForURL:forContainer:context:](self, "_resultForURL:forContainer:context:", v10, v8, a5)) == 0)
    {
      objc_msgSend((id)objc_opt_class(), "tapAndHoldSchemes");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "scheme");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "lowercaseString");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v19, "containsObject:", v21) & 1) != 0)
      {
        objc_msgSend(v10, "scheme");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "isEqualToString:", v14);

        if (!v23)
        {
LABEL_16:
          v12 = 0;
          goto LABEL_19;
        }
      }
      else
      {

      }
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[DDDetectionController(WebKitBackEnd) _resultForAnchor:forFrame:context:].cold.1(v10, (uint64_t)v8);
      goto LABEL_16;
    }
  }
  if (v8 && a5)
  {
    objc_msgSend(v8, "frameView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "documentView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "selectedString");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(*a5, "setObject:forKey:", v18, CFSTR("SelectedText"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", *a5);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setObject:forKey:", v18, CFSTR("SelectedText"));
      v25 = objc_retainAutorelease(v24);
      *a5 = v25;

    }
  }
LABEL_19:

  return v12;
}

- (__DDResult)resultForDOMNode:(id)a3 forFrame:(id)a4
{
  id v6;
  id v7;
  __DDResult *v8;

  v6 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = -[DDDetectionController _resultForAnchor:forFrame:context:](self, "_resultForAnchor:forFrame:context:", v6, v7, 0);
  else
    v8 = 0;

  return v8;
}

- (id)actionsForURL:(id)a3
{
  return -[DDActionController actionsForURL:result:context:](self->_actionController, "actionsForURL:result:context:", a3, 0, 0);
}

- (id)actionsForAnchor:(id)a3 url:(id)a4 forFrame:(id)a5
{
  id v8;
  id v9;
  __DDResult *v10;
  id v11;
  void *v12;
  void *v13;
  id v15;

  v15 = 0;
  v8 = a5;
  v9 = a4;
  v10 = -[DDDetectionController resultForNode:url:frame:contextRef:](self, "resultForNode:url:frame:contextRef:", a3, v9, v8, &v15);
  v11 = v15;
  -[DDDetectionController _plainTextAugmentedContext:withFrame:](self, "_plainTextAugmentedContext:withFrame:", v11, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[DDActionController actionsForURL:result:context:](self->_actionController, "actionsForURL:result:context:", v9, v10, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (__DDResult)_resultForIdentifier:(id)a3 withResults:(id)a4 context:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __DDResult *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  id v42;
  id v44;
  id *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v8)
  {
    v10 = v8;
    objc_msgSend(v7, "componentsSeparatedByString:", CFSTR("/"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "count"))
    {
      v48 = 0u;
      v49 = 0u;
      v46 = 0u;
      v47 = 0u;
      v12 = v11;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
      if (v13)
      {
        v14 = v13;
        v44 = v10;
        v45 = a5;
        v15 = *(_QWORD *)v47;
        v16 = (uint64_t)v10;
        while (2)
        {
          v17 = 0;
          v10 = (id)v16;
          do
          {
            if (*(_QWORD *)v47 != v15)
              objc_enumerationMutation(v12);
            v18 = objc_msgSend(*(id *)(*((_QWORD *)&v46 + 1) + 8 * v17), "integerValue", v44, v45, (_QWORD)v46);
            if (v18 < 0 || v18 >= objc_msgSend(v10, "count"))
            {
              if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
                -[DDDetectionController(WebKitBackEnd) _resultForIdentifier:withResults:context:].cold.3(v18, v27, v28, v29, v30, v31, v32, v33);

              goto LABEL_21;
            }
            v19 = (__DDResult *)objc_msgSend(v10, "objectAtIndex:", v18);
            DDResultGetSubResults();
            v16 = objc_claimAutoreleasedReturnValue();

            ++v17;
            v10 = (id)v16;
          }
          while (v14 != v17);
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
          if (v14)
            continue;
          break;
        }
        v10 = v44;
        a5 = v45;
      }
      else
      {
        v19 = 0;
        v16 = (uint64_t)v10;
      }

      if (a5)
      {
        v41 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        objc_msgSend(v41, "setObject:forKey:", v10, CFSTR("AllResults"));
        v42 = objc_retainAutorelease(v41);
        *a5 = v42;

      }
      v10 = (id)v16;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[DDDetectionController(WebKitBackEnd) _resultForIdentifier:withResults:context:].cold.2((uint64_t)v7, v34, v35, v36, v37, v38, v39, v40);
LABEL_21:
      v19 = 0;
    }

  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[DDDetectionController(WebKitBackEnd) _resultForIdentifier:withResults:context:].cold.1((uint64_t)v7, v20, v21, v22, v23, v24, v25, v26);
    v19 = 0;
  }

  return v19;
}

- (__DDResult)_resultForURL:(id)a3 withResults:(id)a4 context:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  char v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  __DDResult *v16;

  v8 = a3;
  v9 = a4;
  objc_msgSend(v8, "scheme");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0D1CE48]);

  if ((v11 & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[DDDetectionController(WebKitBackEnd) _resultForURL:withResults:context:].cold.2(v8);
    goto LABEL_8;
  }
  objc_msgSend(v8, "resourceSpecifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "hasPrefix:", CFSTR("//"));

  if ((v13 & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[DDDetectionController(WebKitBackEnd) _resultForURL:withResults:context:].cold.1(v8);
LABEL_8:
    v16 = 0;
    goto LABEL_9;
  }
  objc_msgSend(v8, "resourceSpecifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "substringFromIndex:", 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[DDDetectionController _resultForIdentifier:withResults:context:](self, "_resultForIdentifier:withResults:context:", v15, v9, a5);

LABEL_9:
  return v16;
}

- (__DDResult)resultForURL:(id)a3 identifier:(id)a4 selectedText:(id)a5 results:(id)a6 context:(id)a7 extendedContext:(id *)a8
{
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __DDResult *v23;
  id v24;
  void *v25;
  void *v26;
  int v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v36;
  id v37;
  id v38;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v36 = a5;
  v16 = a6;
  v37 = a7;
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v16, "count"));
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v18 = v16;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v41;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v41 != v21)
          objc_enumerationMutation(v18);
        objc_msgSend(v17, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * v22++), "coreResult", v36));
      }
      while (v20 != v22);
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
    }
    while (v20);
  }

  if (v15 && objc_msgSend(v15, "length"))
  {
    v39 = 0;
    v23 = -[DDDetectionController _resultForIdentifier:withResults:context:](self, "_resultForIdentifier:withResults:context:", v15, v17, &v39);
    v24 = v39;
    v25 = v37;
    if (v23)
      goto LABEL_15;
  }
  else
  {
    v24 = 0;
    v25 = v37;
  }
  objc_msgSend(v14, "scheme", v36);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "isEqualToString:", *MEMORY[0x1E0D1CE48]);

  if (!v27)
  {
    v23 = 0;
    if (!a8)
      goto LABEL_20;
    goto LABEL_16;
  }
  v38 = v24;
  v23 = -[DDDetectionController _resultForURL:withResults:context:](self, "_resultForURL:withResults:context:", v14, v17, &v38);
  v28 = v38;

  v24 = v28;
LABEL_15:
  if (!a8)
    goto LABEL_20;
LABEL_16:
  if (v24)
    v29 = v24;
  else
    v29 = v25;
  *a8 = objc_retainAutorelease(v29);
LABEL_20:
  if (v23)
  {
    v30 = v36;
    if (v24)
    {
      objc_msgSend(v24, "setObject:forKey:", v36, CFSTR("SelectedText"));
      if (v25)
        objc_msgSend(v24, "addEntriesFromDictionary:", v25);
    }
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "tapAndHoldSchemes");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "scheme");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "lowercaseString");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v31, "containsObject:", v33) & 1) != 0)
    {
      objc_msgSend(v14, "scheme");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "isEqualToString:", *MEMORY[0x1E0D1CE48]);

      v25 = v37;
    }

    v30 = v36;
  }

  return v23;
}

- (id)actionsForURL:(id)a3 identifier:(id)a4 selectedText:(id)a5 results:(id)a6 context:(id)a7
{
  id v12;
  __DDResult *v13;
  id v14;
  void *v15;
  id v17;

  v17 = 0;
  v12 = a3;
  v13 = -[DDDetectionController resultForURL:identifier:selectedText:results:context:extendedContext:](self, "resultForURL:identifier:selectedText:results:context:extendedContext:", v12, a4, a5, a6, a7, &v17);
  v14 = v17;
  -[DDActionController actionsForURL:result:context:](self->_actionController, "actionsForURL:result:context:", v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)defaultActionForURL:(id)a3 results:(id)a4 context:(id)a5
{
  id v8;
  __DDResult *v9;
  id v10;
  void *v11;
  id v13;

  v13 = 0;
  v8 = a3;
  v9 = -[DDDetectionController resultForURL:identifier:selectedText:results:context:extendedContext:](self, "resultForURL:identifier:selectedText:results:context:extendedContext:", v8, 0, &stru_1E4259460, a4, a5, &v13);
  v10 = v13;
  -[DDActionController defaultActionForURL:result:context:](self->_actionController, "defaultActionForURL:result:context:", v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)titleForURL:(id)a3 results:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  __DDResult *v11;
  void *v12;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8)
  {
    v11 = -[DDDetectionController resultForURL:identifier:selectedText:results:context:extendedContext:](self, "resultForURL:identifier:selectedText:results:context:extendedContext:", v8, 0, &stru_1E4259460, v9, v10, 0);
    if (v11)
      actionSheetTitleForResult((uint64_t)v11);
    else
      actionSheetTitleForURL(v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)attributedTitleForURL:(id)a3 updaterBlock:(id)a4
{
  void *v4;
  void *v5;

  if (a3)
  {
    -[DDDetectionController titleForURL:results:context:](self, "titleForURL:results:context:", a3, 0, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v4);
    else
      v5 = 0;

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)attributedTitleForResult:(__DDResult *)a3 updaterBlock:(id)a4
{
  void *v4;
  void *v5;

  if (a3)
  {
    -[DDDetectionController titleForResult:subResult:withURL:context:](self, "titleForResult:subResult:withURL:context:", a3, 0, 0, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v4);
    else
      v5 = 0;

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)actionsForDOMNode:(id)a3 forFrame:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  linkAncestorOfNode(a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "absoluteLinkURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[DDDetectionController actionsForAnchor:url:forFrame:](self, "actionsForAnchor:url:forFrame:", v8, v9, v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (__DDResult)resultForNode:(id)a3 url:(id)a4 frame:(id)a5 contextRef:(id *)a6
{
  id v10;
  id v11;
  id v12;
  __DDResult *v13;
  void *v14;
  int v15;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (!v10
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    || (v13 = -[DDDetectionController _resultForAnchor:forFrame:context:](self, "_resultForAnchor:forFrame:context:", v10, v12, a6)) == 0)
  {
    objc_msgSend(v11, "scheme");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isEqualToString:", *MEMORY[0x1E0D1CE48]);

    if (v15)
      v13 = -[DDDetectionController _resultForURL:forContainer:context:](self, "_resultForURL:forContainer:context:", v11, v12, a6);
    else
      v13 = 0;
  }

  return v13;
}

- (id)defaultActionForAnchor:(id)a3 url:(id)a4 forFrame:(id)a5
{
  id v8;
  id v9;
  __DDResult *v10;
  id v11;
  void *v12;
  void *v13;
  id v15;

  v15 = 0;
  v8 = a5;
  v9 = a4;
  v10 = -[DDDetectionController resultForNode:url:frame:contextRef:](self, "resultForNode:url:frame:contextRef:", a3, v9, v8, &v15);
  v11 = v15;
  -[DDDetectionController _plainTextAugmentedContext:withFrame:](self, "_plainTextAugmentedContext:withFrame:", v11, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[DDActionController defaultActionForURL:result:context:](self->_actionController, "defaultActionForURL:result:context:", v9, v10, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)defaultActionForDOMNode:(id)a3 forFrame:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v15;
  void *v16;
  void *v17;

  v6 = a3;
  v7 = a4;
  linkAncestorOfNode(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "absoluteLinkURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[DDDetectionController defaultActionForAnchor:url:forFrame:](self, "defaultActionForAnchor:url:forFrame:", v9, v10, v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = v6;
    if (!v12)
    {
LABEL_8:
      v11 = 0;
      goto LABEL_9;
    }
    v10 = v12;
    while (1)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      objc_msgSend(v10, "parentNode");
      v13 = objc_claimAutoreleasedReturnValue();

      v10 = (void *)v13;
      if (!v13)
        goto LABEL_8;
    }
    v15 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(v10, "action");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "URLWithString:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    -[DDDetectionController defaultActionForAnchor:url:forFrame:](self, "defaultActionForAnchor:url:forFrame:", 0, v17, v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_9:

  return v11;
}

+ (id)updateContext:(id)a3 forResult:(__DDResult *)a4 atIndex:(unint64_t)a5 ofStorage:(id)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t Range;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v21;

  v9 = a6;
  v10 = a3;
  objc_msgSend(v9, "attribute:atIndex:effectiveRange:", CFSTR("DDContext"), a5, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[DDAction contextByAddingValue:toKey:inContext:](DDAction, "contextByAddingValue:toKey:inContext:", v9, CFSTR("TextStorage"), v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    objc_msgSend(v12, "addEntriesFromDictionary:", v11);
  v21 = xmmword_19F006900;
  if (a4)
  {
    Range = DDResultGetRange();
    *(_QWORD *)&v21 = Range;
    *((_QWORD *)&v21 + 1) = v14;
  }
  else
  {
    v15 = (id)objc_msgSend(v9, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0CEA0C0], a5, &v21);
    Range = v21;
  }
  if (Range != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v9, "string");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "dd_leadingTextWithNumberOfCharacters:beforeRange:", 350, v21);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "dd_trailingTextWithNumberOfCharacters:afterRange:", 350, v21);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (*((_QWORD *)&v21 + 1))
    {
      objc_msgSend(v16, "dd_trailingTextWithNumberOfCharacters:afterRange:", *((_QWORD *)&v21 + 1), (_QWORD)v21, 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKey:", v19, CFSTR("MiddleText"));

    }
    objc_msgSend(v12, "setObject:forKey:", v17, CFSTR("LeadingText"), (_QWORD)v21);
    objc_msgSend(v12, "setObject:forKey:", v18, CFSTR("TrailingText"));

  }
  return v12;
}

- (void)resetResultsForTextView:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[DDDetectionController _commonResetResultsForContainer:](self, "_commonResetResultsForContainer:", v4);
  objc_msgSend(v4, "textStorage");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "dd_resetResults");
}

- (id)_subResultAtIndex:(unint64_t)a3 ofResult:(id)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(a4, "subResults", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        v11 = objc_msgSend(v10, "range");
        if (a3 >= v11 && a3 - v11 < v12)
        {
          v14 = v10;
          goto LABEL_14;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }
  v14 = 0;
LABEL_14:

  return v14;
}

- (__DDResult)resultForLinkAtIndex:(unint64_t)a3 inTextStorage:(id)a4
{
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __DDResult *v10;

  objc_msgSend(a4, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0D1CC00], a3, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "type");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D1CB58]);

  if (v8)
  {
    -[DDDetectionController _subResultAtIndex:ofResult:](self, "_subResultAtIndex:ofResult:", a3, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (__DDResult *)objc_msgSend(v9, "coreResult");

  }
  else
  {
    v10 = (__DDResult *)objc_msgSend(v6, "coreResult");
  }

  return v10;
}

- (id)linkAtIndex:(unint64_t)a3 inTextStorage:(id)a4
{
  id v4;
  id v6;

  v6 = 0;
  v4 = -[DDDetectionController _resultForLinkAtIndex:inTextStorage:subResult:url:effectiveRange:](self, "_resultForLinkAtIndex:inTextStorage:subResult:url:effectiveRange:", a3, a4, 0, &v6, 0);
  return v6;
}

- (BOOL)shouldImmediatelyShowActionSheetForTapAtIndex:(unint64_t)a3 ofStorage:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  BOOL v10;
  void *v11;
  void *v12;
  id v14;

  v6 = a4;
  v14 = 0;
  -[DDDetectionController _resultForLinkAtIndex:inTextStorage:subResult:url:effectiveRange:](self, "_resultForLinkAtIndex:inTextStorage:subResult:url:effectiveRange:", a3, v6, &v14, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v14;
  v9 = v8;
  if (v7)
  {
    if (!v8)
      v8 = v7;
    v10 = -[DDDetectionController _shouldImmediatelyShowActionSheetForCoreResult:](self, "_shouldImmediatelyShowActionSheetForCoreResult:", objc_msgSend(v8, "coreResult"));
  }
  else
  {
    objc_msgSend(v6, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0CEA0C0], a3, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[DDDetectionController _URLForLinkAttributeValue:](self, "_URLForLinkAttributeValue:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
      v10 = -[DDDetectionController _shouldImmediatelyShowActionSheetForURL:](self, "_shouldImmediatelyShowActionSheetForURL:", v12);
    else
      v10 = 0;

  }
  return v10;
}

- (BOOL)shouldImmediatelyLaunchDefaultActionForTapAndHoldAtIndex:(unint64_t)a3 ofStorage:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  BOOL v9;
  void *v10;
  void *v11;
  uint64_t v12;

  v6 = a4;
  objc_msgSend(v6, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0CEA0C0], a3, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[DDDetectionController _URLForLinkAttributeValue:](self, "_URLForLinkAttributeValue:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = -[DDDetectionController shouldImmediatelyLaunchDefaultActionForURL:](self, "shouldImmediatelyLaunchDefaultActionForURL:", v8);
  }
  else
  {
    -[DDDetectionController _resultForLinkAtIndex:inTextStorage:subResult:url:effectiveRange:](self, "_resultForLinkAtIndex:inTextStorage:subResult:url:effectiveRange:", a3, v6, 0, 0, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    v9 = v10
      && (v12 = objc_msgSend(v10, "coreResult")) != 0
      && -[DDDetectionController shouldImmediatelyLaunchDefaultActionForResult:](self, "shouldImmediatelyLaunchDefaultActionForResult:", v12);

  }
  return v9;
}

- (id)_applyBlock:(id)a3 withResultsAtIndex:(unint64_t)a4 ofStorage:(id)a5 context:(id)a6
{
  void (**v10)(id, id, void *, id, void *);
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v21;
  id v22;

  v10 = (void (**)(id, id, void *, id, void *))a3;
  v11 = a5;
  v12 = a6;
  v21 = 0;
  v22 = 0;
  -[DDDetectionController _resultForLinkAtIndex:inTextStorage:subResult:url:effectiveRange:](self, "_resultForLinkAtIndex:inTextStorage:subResult:url:effectiveRange:", a4, v11, &v22, &v21, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v22;
  v15 = v21;
  if (v13
    || (objc_msgSend(v11, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0CEA0C0], a4, 0),
        v16 = (void *)objc_claimAutoreleasedReturnValue(),
        -[DDDetectionController _URLForLinkAttributeValue:](self, "_URLForLinkAttributeValue:", v16),
        v17 = objc_claimAutoreleasedReturnValue(),
        v15,
        v16,
        (v15 = (id)v17) != 0))
  {
    +[DDDetectionController updateContext:forResult:atIndex:ofStorage:](DDDetectionController, "updateContext:forResult:atIndex:ofStorage:", v12, objc_msgSend(v13, "coreResult"), a4, v11);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, v14, v13, v15, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (id)actionsAtIndex:(unint64_t)a3 ofStorage:(id)a4 context:(id)a5
{
  _QWORD v6[5];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __74__DDDetectionController_TextKitBackEnd__actionsAtIndex_ofStorage_context___block_invoke;
  v6[3] = &unk_1E4258E18;
  v6[4] = self;
  -[DDDetectionController _applyBlock:withResultsAtIndex:ofStorage:context:](self, "_applyBlock:withResultsAtIndex:ofStorage:context:", v6, a3, a4, a5);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __74__DDDetectionController_TextKitBackEnd__actionsAtIndex_ofStorage_context___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;

  v8 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
  v9 = a5;
  v10 = a4;
  v11 = a3;
  if (a2)
    v12 = a2;
  else
    v12 = a3;
  if (a2)
    v13 = v11;
  else
    v13 = 0;
  v14 = objc_msgSend(v12, "coreResult");
  v15 = objc_msgSend(v13, "coreResult");

  objc_msgSend(v8, "actionsForURL:result:enclosingResult:context:", v10, v14, v15, v9);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)titleForResultAtIndex:(unint64_t)a3 ofStorage:(id)a4 context:(id)a5
{
  _QWORD v6[5];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __81__DDDetectionController_TextKitBackEnd__titleForResultAtIndex_ofStorage_context___block_invoke;
  v6[3] = &unk_1E4258E18;
  v6[4] = self;
  -[DDDetectionController _applyBlock:withResultsAtIndex:ofStorage:context:](self, "_applyBlock:withResultsAtIndex:ofStorage:context:", v6, a3, a4, a5);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __81__DDDetectionController_TextKitBackEnd__titleForResultAtIndex_ofStorage_context___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  v8 = *(void **)(a1 + 32);
  v9 = a5;
  v10 = a4;
  v11 = a2;
  v12 = objc_msgSend(a3, "coreResult");
  v13 = objc_msgSend(v11, "coreResult");

  objc_msgSend(v8, "titleForResult:subResult:withURL:context:", v12, v13, v10, v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)defaultActionAtIndex:(unint64_t)a3 ofStorage:(id)a4 context:(id)a5
{
  _QWORD v6[5];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __80__DDDetectionController_TextKitBackEnd__defaultActionAtIndex_ofStorage_context___block_invoke;
  v6[3] = &unk_1E4258E18;
  v6[4] = self;
  -[DDDetectionController _applyBlock:withResultsAtIndex:ofStorage:context:](self, "_applyBlock:withResultsAtIndex:ofStorage:context:", v6, a3, a4, a5);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __80__DDDetectionController_TextKitBackEnd__defaultActionAtIndex_ofStorage_context___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  void *v6;
  id v8;
  id v9;
  void *v10;

  v6 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
  if (a2)
    a3 = a2;
  v8 = a5;
  v9 = a4;
  objc_msgSend(v6, "defaultActionForURL:result:context:", v9, objc_msgSend(a3, "coreResult"), v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)titleForResult:(__DDResult *)a3 subResult:(__DDResult *)a4 withURL:(id)a5 context:(id)a6
{
  id v9;
  id v10;
  __DDResult *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  uint64_t v17;

  v9 = a5;
  v10 = a6;
  if (a4)
    v11 = a4;
  else
    v11 = a3;
  if (v11)
  {
    actionSheetTitleForResult((uint64_t)v11);
    v12 = objc_claimAutoreleasedReturnValue();
LABEL_6:
    v13 = (void *)v12;
    goto LABEL_10;
  }
  if (v9)
  {
    objc_msgSend(v9, "scheme");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("x-apple-data-detectors-clientdefined"));

    if ((v15 & 1) == 0)
    {
      dd_urlUserVisibleString(v9);
      v12 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
  }
  v13 = 0;
LABEL_10:
  if ((unint64_t)objc_msgSend(v13, "length") >= 0xC9)
  {
    objc_msgSend(v13, "substringToIndex:", 200);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringByAppendingString:", CFSTR("…"));
    v17 = objc_claimAutoreleasedReturnValue();

    v13 = (void *)v17;
  }

  return v13;
}

- (id)attributedTitleForResultAtIndex:(unint64_t)a3 ofStorage:(id)a4 updaterBlock:(id)a5
{
  void *v5;
  void *v6;

  -[DDDetectionController titleForResultAtIndex:ofStorage:context:](self, "titleForResultAtIndex:ofStorage:context:", a3, a4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v5);
  else
    v6 = 0;

  return v6;
}

- (id)_URLForLinkAttributeValue:(id)a3
{
  id v3;
  id v4;
  void *v5;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v5 = 0;
      goto LABEL_7;
    }
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v3);
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;
LABEL_7:

  return v5;
}

- (void)interactionDidStartAtIndex:(unint64_t)a3 ofStorage:(id)a4
{
  id v4;
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __78__DDDetectionController_TextKitBackEnd__interactionDidStartAtIndex_ofStorage___block_invoke;
  v5[3] = &unk_1E4258E18;
  v5[4] = self;
  v4 = -[DDDetectionController _applyBlock:withResultsAtIndex:ofStorage:context:](self, "_applyBlock:withResultsAtIndex:ofStorage:context:", v5, a3, a4, 0);
}

uint64_t __78__DDDetectionController_TextKitBackEnd__interactionDidStartAtIndex_ofStorage___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  if (a4)
    objc_msgSend(*(id *)(a1 + 32), "_interactionDidStartForURL:", a4);
  else
    objc_msgSend(*(id *)(a1 + 32), "_interactionDidStartForResult:", objc_msgSend(a3, "coreResult"));
  return 0;
}

- (void)urlifyTextView:(id)a3 withExternalResults:(id)a4 context:(id)a5
{
  id v9;
  void *v10;
  id v11;
  id v12;
  DDTextKitOperation *v13;
  void *v14;
  id v15;

  v15 = a3;
  v9 = a4;
  v10 = (void *)MEMORY[0x1E0CB3978];
  v11 = a5;
  if ((objc_msgSend(v10, "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DDDetectionController+TextKit.m"), 343, CFSTR("-[DDDetectionController urlifyTextView:withExternalResults:context:] Should be called from the main thread"));

  }
  objc_msgSend(v9, "valueForKey:", CFSTR("coreResult"));
  v12 = (id)objc_claimAutoreleasedReturnValue();

  -[DDDetectionController setResults:forContainer:](self, "setResults:forContainer:", v12, v15);
  if (v12)
    CFRelease(v12);
  -[DDDetectionController setContext:forContainer:](self, "setContext:forContainer:", v11, v15);
  v13 = -[DDTextKitOperation initWithContainer:]([DDTextKitOperation alloc], "initWithContainer:", v15);
  -[DDOperation setDetectionTypes:](v13, "setDetectionTypes:", 0x7FFFFFFFLL);
  -[DDOperation setContext:](v13, "setContext:", v11);

  -[DDOperation setScannerResults:](v13, "setScannerResults:", v9);
  -[DDTextKitOperation doURLificationOnDocument](v13, "doURLificationOnDocument");
  -[DDTextKitOperation cleanup](v13, "cleanup");

}

void __74__DDDetectionController__startCoalescedURLification_clearPreviousResults___block_invoke_2_cold_1(uint64_t a1, char a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = 138412546;
  v4 = v2;
  v5 = 1024;
  v6 = a2 & 1;
  _os_log_debug_impl(&dword_19EFBB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "dispatchScanQueryCreationWithCompletionBlock of operation %@ completion block: success: %d", (uint8_t *)&v3, 0x12u);
  OUTLINED_FUNCTION_1();
}

- (void)startURLificationForContainer:detectedTypes:options:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_19EFBB000, MEMORY[0x1E0C81028], v0, "called -startURLificationForContainer:%p detectedTypes:%lx, should probably not happen", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1();
}

- (void)startURLificationForContainer:detectedTypes:options:.cold.2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_19EFBB000, MEMORY[0x1E0C81028], v0, "UIDataDetectorTypeLegacyPhoneNumber is incompatible with other types (%lx)", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1();
}

- (void)startURLificationForContainer:(uint64_t)a1 detectedTypes:(uint64_t)a2 options:(uint64_t)a3 .cold.3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = 138412802;
  v4 = a1;
  v5 = 2048;
  v6 = a3;
  v7 = 2112;
  v8 = a2;
  OUTLINED_FUNCTION_10(&dword_19EFBB000, MEMORY[0x1E0C81028], a3, "startURLificationForContainer %@ (types %lx) created operation %@", (uint8_t *)&v3);
}

void __43__DDDetectionController__enqueueOperation___block_invoke_cold_1(id *a1)
{
  id WeakRetained;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  WeakRetained = objc_loadWeakRetained(a1);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_19EFBB000, MEMORY[0x1E0C81028], v2, "Firing completion block for %@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_6();
}

- (void)cancelURLificationForContainer:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_19EFBB000, MEMORY[0x1E0C81028], v0, "Cancelling operation for container %@.", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1();
}

- (void)_doURLification:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_19EFBB000, MEMORY[0x1E0C81028], v0, "Operation %@: container %p has been modified too many times, aborting", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1();
}

- (void)_doURLification:.cold.2()
{
  uint64_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_7(&dword_19EFBB000, MEMORY[0x1E0C81028], v0, "Operation %@: container %@ was modified after the call to -startURLificationForFrame:.", v1);
  OUTLINED_FUNCTION_1();
}

- (void)_doURLification:.cold.3()
{
  uint64_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_7(&dword_19EFBB000, MEMORY[0x1E0C81028], v0, "scan for operation %@ cancelled or results nil (%@)", v1);
  OUTLINED_FUNCTION_1();
}

- (void)_doURLification:.cold.4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_19EFBB000, MEMORY[0x1E0C81028], v0, "%@ got an exception in doURLificationOnDocument: %@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1();
}

- (void)_doURLification:(uint64_t)a3 .cold.5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_DWORD *)a2 = 138412546;
  *(_QWORD *)(a2 + 4) = a1;
  *(_WORD *)(a2 + 12) = 2048;
  *(_QWORD *)(a2 + 14) = a3;
  OUTLINED_FUNCTION_7(&dword_19EFBB000, MEMORY[0x1E0C81028], a3, "scan for operation %@ need to start over (%ld results)", (uint8_t *)a2);
}

- (void)_doURLification:(uint64_t)a3 .cold.6(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(_DWORD *)a3 = 138412802;
  *(_QWORD *)(a3 + 4) = a2;
  *(_WORD *)(a3 + 12) = 2112;
  *(_QWORD *)(a3 + 14) = a1;
  *(_WORD *)(a3 + 22) = 2048;
  *(_QWORD *)(a3 + 24) = a4;
  OUTLINED_FUNCTION_10(&dword_19EFBB000, MEMORY[0x1E0C81028], a3, "scan for operation %@ replaced by another operation %@ (%ld results)", (uint8_t *)a3);
}

- (void)_doURLification:.cold.7()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_19EFBB000, MEMORY[0x1E0C81028], v0, "%@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1();
}

void __41__DDDetectionController__doURLification___block_invoke_2_cold_1(uint8_t *buf, uint64_t a2, _QWORD *a3)
{
  *(_DWORD *)buf = 138412290;
  *a3 = a2;
  _os_log_debug_impl(&dword_19EFBB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Not adding result %@ to the recents because we got back a null weight", buf, 0xCu);
}

- (void)_resultForIdentifier:forContainer:context:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_19EFBB000, MEMORY[0x1E0C81028], v0, "No known results for this container: %p", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1();
}

- (void)_resultForIdentifier:forContainer:context:.cold.2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_19EFBB000, MEMORY[0x1E0C81028], v0, "Unparseable result identifier %@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1();
}

- (void)_resultForIdentifier:forContainer:context:.cold.3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_19EFBB000, MEMORY[0x1E0C81028], v0, "result number out of bounds %li", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1();
}

- (void)_resultForURL:(void *)a1 forContainer:context:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "scheme");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0(&dword_19EFBB000, MEMORY[0x1E0C81028], v2, "Wrong URL %p (%@), missing //", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_6();
}

- (void)_resultForURL:(void *)a1 forContainer:context:.cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "scheme");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0(&dword_19EFBB000, MEMORY[0x1E0C81028], v2, "Wrong scheme for URL %p (%@)", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_6();
}

@end
