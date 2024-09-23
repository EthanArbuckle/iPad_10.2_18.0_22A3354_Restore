@implementation ICAttachmentInlineDrawingModel(UI)

- (void)attachmentModelDealloc
{
  id v1;

  objc_msgSend(a1, "titleQuery");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setDelegate:", 0);
  objc_msgSend(v1, "pause");

}

- (id)titleQuery
{
  return objc_getAssociatedObject(a1, (const void *)ICTitleQueryKey);
}

- (uint64_t)mergeWithMergeableData:()UI mergeableFieldState:
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  BOOL v8;
  uint64_t v9;
  id v10;
  NSObject *v11;
  id v14;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    v14 = 0;
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD1158]), "initWithData:error:", v4, &v14);
    v6 = v14;
    v7 = v6;
    if (v5)
      v8 = v6 == 0;
    else
      v8 = 0;
    v9 = v8;
    if (v8)
    {
      if (!objc_msgSend(a1, "actuallyMergeWithDrawing:", v5))
      {
        v9 = 0;
        goto LABEL_17;
      }
      objc_msgSend(a1, "attachment");
      v11 = objc_claimAutoreleasedReturnValue();
      v10 = (id)-[NSObject ic_postNotificationOnMainThreadAfterSaveWithName:](v11, "ic_postNotificationOnMainThreadAfterSaveWithName:", CFSTR("ICAttachmentInlineDrawingModelMergeableDataDidChangeNotification"));
    }
    else
    {
      v11 = os_log_create("com.apple.notes", "UI");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[ICAttachmentInlineDrawingModel(UI) mergeWithMergeableData:mergeableFieldState:].cold.1();
    }

LABEL_17:
    goto LABEL_18;
  }
  v9 = 0;
LABEL_18:

  return v9;
}

- (uint64_t)actuallyMergeWithDrawing:()UI
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  id v16;
  id v17;
  uint64_t v18;
  _QWORD v20[5];
  _QWORD v21[5];
  _QWORD v22[5];
  id v23;
  _QWORD block[5];
  id v25;
  id v26;
  _QWORD v27[5];
  id v28;
  uint64_t *v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;

  v4 = a3;
  objc_msgSend(a1, "attachment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "managedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v35 = 0;
  v36 = &v35;
  v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__0;
  v39 = __Block_byref_object_dispose__0;
  v40 = 0;
  v31 = 0;
  v32 = &v31;
  v33 = 0x2020000000;
  v34 = 1;
  v7 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __63__ICAttachmentInlineDrawingModel_UI__actuallyMergeWithDrawing___block_invoke;
  v27[3] = &unk_1E5C1D980;
  v29 = &v35;
  v27[4] = a1;
  v8 = v4;
  v28 = v8;
  v30 = &v31;
  objc_msgSend(v6, "performBlockAndWait:", v27);
  if (objc_msgSend((id)v36[5], "length"))
  {
    v9 = objc_alloc(MEMORY[0x1E0CD1158]);
    v10 = v36[5];
    v26 = 0;
    v11 = (id)objc_msgSend(v9, "initWithData:error:", v10, &v26);
    v12 = v26;
    if (v12)
    {
      v13 = os_log_create("com.apple.notes", "UI");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[ICAttachmentInlineDrawingModel(UI) actuallyMergeWithDrawing:].cold.1();

    }
    v14 = objc_msgSend(v11, "mergeWithDrawing:", v8);

  }
  else
  {
    v11 = v8;
    v14 = 2;
  }
  objc_msgSend(a1, "handwritingRecognitionDrawingQueue");
  v15 = objc_claimAutoreleasedReturnValue();
  block[0] = v7;
  block[1] = 3221225472;
  block[2] = __63__ICAttachmentInlineDrawingModel_UI__actuallyMergeWithDrawing___block_invoke_11;
  block[3] = &unk_1E5C1D9A8;
  block[4] = a1;
  v16 = v8;
  v25 = v16;
  dispatch_async(v15, block);

  if (!v14)
  {
    v21[0] = v7;
    v21[1] = 3221225472;
    v21[2] = __63__ICAttachmentInlineDrawingModel_UI__actuallyMergeWithDrawing___block_invoke_12;
    v21[3] = &unk_1E5C1D540;
    v21[4] = a1;
    objc_msgSend(v6, "performBlockAndWait:", v21);
    goto LABEL_14;
  }
  if (v14 == 1)
  {
    v20[0] = v7;
    v20[1] = 3221225472;
    v20[2] = __63__ICAttachmentInlineDrawingModel_UI__actuallyMergeWithDrawing___block_invoke_13;
    v20[3] = &unk_1E5C1D540;
    v20[4] = a1;
    objc_msgSend(v6, "performBlockAndWait:", v20);
    goto LABEL_14;
  }
  if (v14 != 2)
  {
LABEL_14:
    v18 = 0;
    goto LABEL_15;
  }
  objc_msgSend(v11, "serializeWithVersion:", v32[3]);
  v22[0] = v7;
  v22[1] = 3221225472;
  v22[2] = __63__ICAttachmentInlineDrawingModel_UI__actuallyMergeWithDrawing___block_invoke_2;
  v22[3] = &unk_1E5C1D9A8;
  v22[4] = a1;
  v17 = (id)objc_claimAutoreleasedReturnValue();
  v23 = v17;
  objc_msgSend(v6, "performBlockAndWait:", v22);

  v18 = 1;
LABEL_15:

  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v35, 8);

  return v18;
}

- (id)imageForActivityItem
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
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
  v11 = __Block_byref_object_copy__0;
  v12 = __Block_byref_object_dispose__0;
  v13 = 0;
  objc_msgSend(a1, "attachment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__ICAttachmentInlineDrawingModel_UI__imageForActivityItem__block_invoke;
  v7[3] = &unk_1E5C1D9D0;
  v7[4] = a1;
  v7[5] = &v8;
  objc_msgSend(v3, "performBlockAndWait:", v7);

  if (v9[5])
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "ic_imageWithData:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[ICAttachmentPreviewImageLoader orientedImage:withBackground:](ICAttachmentPreviewImageLoader, "orientedImage:withBackground:", v4, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (ICAttachmentInlineDrawingActivityItemSource)activityItem
{
  ICAttachmentInlineDrawingActivityItemSource *v2;
  void *v3;
  ICAttachmentInlineDrawingActivityItemSource *v4;

  v2 = [ICAttachmentInlineDrawingActivityItemSource alloc];
  objc_msgSend(a1, "attachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[ICAttachmentActivityItemSource initWithAttachment:](v2, "initWithAttachment:", v3);

  return v4;
}

- (id)activityItems
{
  uint64_t v2;
  void *v3;
  void *v4;
  ICAttachmentActivityItemSource *v5;
  void *v6;
  ICAttachmentActivityItemSource *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "activityItem");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v2)
  {
    v10[0] = v2;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = (void *)MEMORY[0x1E0C9AA60];
  }
  v5 = [ICAttachmentActivityItemSource alloc];
  objc_msgSend(a1, "attachment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[ICAttachmentActivityItemSource initWithAttachment:](v5, "initWithAttachment:", v6);
  objc_msgSend(v4, "arrayByAddingObject:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)mergeableDataForCopying:()UI
{
  void *v1;
  void *v2;

  v1 = (void *)objc_msgSend(a1, "newDrawingFromMergeableData");
  objc_msgSend(v1, "serializeTransiently");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)updateAfterLoadWithSubAttachmentIdentifierMap:()UI
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v2 = (void *)objc_msgSend(a1, "newDrawingFromMergeableData");
  if (v2)
  {
    v9 = v2;
    objc_msgSend(v2, "uuid");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
      objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((drawing.uuid) != nil)", "-[ICAttachmentInlineDrawingModel(UI) updateAfterLoadWithSubAttachmentIdentifierMap:]", 1, 0, CFSTR("Expected non-nil value for '%s'"), "drawing.uuid");
    objc_msgSend(a1, "attachment");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "typeUTI");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D63680]))
      v6 = 2;
    else
      v6 = 1;

    objc_msgSend(v9, "serializeWithVersion:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "attachment");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setMergeableData:", v7);

    v2 = v9;
  }

}

- (void)setHandwritingRecognitionEnabled:()UI
{
  void *v5;
  id v6;
  id v7;
  id v8;

  objc_msgSend(a1, "handwritingRecognitionDrawing");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3)
  {
    if (!v5)
    {
      v6 = (id)objc_msgSend(a1, "newDrawingFromMergeableData");
      objc_msgSend(a1, "setHandwritingRecognitionDrawing:", v6);
      v5 = v6;
    }
    v7 = v5;
    objc_msgSend(v5, "setRecognitionEnabled:", 1);

  }
  else if (v5)
  {
    v8 = v5;
    objc_msgSend(v5, "cancelOngoingRecognitionRequests");
    objc_msgSend(v8, "setRecognitionEnabled:", 0);
    objc_msgSend(a1, "setHandwritingRecognitionDrawing:", 0);

  }
}

- (uint64_t)isHandwritingRecognitionEnabled
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "handwritingRecognitionDrawing");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "recognitionEnabled");

  return v2;
}

- (id)handwritingRecognitionDrawingQueue
{
  void *v2;
  NSObject *v3;

  objc_getAssociatedObject(a1, (const void *)ICHandwritingRecognitionDrawingQueueKey);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v2 = dispatch_queue_create("com.apple.notes.handwritingrecognition", v3);

    objc_msgSend(a1, "setHandwritingRecognitionDrawingQueue:", v2);
  }
  return v2;
}

- (void)setHandwritingRecognitionDrawingQueue:()UI
{
  objc_setAssociatedObject(a1, (const void *)ICHandwritingRecognitionDrawingQueueKey, a3, (void *)1);
}

- (void)setTitleQueryEnabled:()UI
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  _QWORD block[7];
  _QWORD v15[5];
  id v16;
  _QWORD v17[6];
  uint64_t v18;
  _QWORD v19[4];
  id v20;

  objc_msgSend(a1, "titleQuery");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  v19[0] = &v18;
  v19[1] = 0x3032000000;
  v19[2] = __Block_byref_object_copy__0;
  v19[3] = __Block_byref_object_dispose__0;
  v20 = 0;
  objc_msgSend(a1, "attachment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "managedObjectContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __59__ICAttachmentInlineDrawingModel_UI__setTitleQueryEnabled___block_invoke;
  v17[3] = &unk_1E5C1D9D0;
  v17[4] = a1;
  v17[5] = &v18;
  objc_msgSend(v7, "performBlockAndWait:", v17);

  if (a3)
  {
    if (!v5)
    {
      v9 = os_log_create("com.apple.notes", "PencilKit");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        -[ICAttachmentInlineDrawingModel(UI) setTitleQueryEnabled:].cold.1((uint64_t)v19, v9, v10);

      v15[0] = 0;
      v15[1] = v15;
      v15[2] = 0x3032000000;
      v15[3] = __Block_byref_object_copy__0;
      v15[4] = __Block_byref_object_dispose__0;
      v16 = 0;
      objc_msgSend(a1, "handwritingRecognitionDrawingQueue");
      v11 = objc_claimAutoreleasedReturnValue();
      block[0] = v8;
      block[1] = 3221225472;
      block[2] = __59__ICAttachmentInlineDrawingModel_UI__setTitleQueryEnabled___block_invoke_25;
      block[3] = &unk_1E5C1DA20;
      block[4] = a1;
      block[5] = v15;
      block[6] = &v18;
      dispatch_async(v11, block);

      _Block_object_dispose(v15, 8);
    }
  }
  else if (v5)
  {
    v12 = os_log_create("com.apple.notes", "PencilKit");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      -[ICAttachmentInlineDrawingModel(UI) setTitleQueryEnabled:].cold.2((uint64_t)v19, v12, v13);

    objc_msgSend(v5, "pause");
    objc_msgSend(a1, "setTitleQuery:", 0);
  }
  _Block_object_dispose(&v18, 8);

}

- (BOOL)isTitleQueryEnabled
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "titleQuery");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1 != 0;

  return v2;
}

- (void)setTitleQuery:()UI
{
  objc_setAssociatedObject(a1, (const void *)ICTitleQueryKey, a3, (void *)1);
}

- (void)titleQuery:()UI didUpdateWithItem:
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  objc_msgSend(a4, "transcribedTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "attachment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D63BC8], "sharedContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __67__ICAttachmentInlineDrawingModel_UI__titleQuery_didUpdateWithItem___block_invoke;
  v11[3] = &unk_1E5C1DA48;
  v12 = v7;
  v13 = v5;
  v9 = v5;
  v10 = v7;
  objc_msgSend(v8, "performBackgroundTask:", v11);

}

- (void)drawPreviewInRect:()UI
{
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
  _QWORD v21[6];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  objc_msgSend(MEMORY[0x1E0D639E8], "currentInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__0;
  v26 = __Block_byref_object_dispose__0;
  v27 = 0;
  objc_msgSend(a1, "attachment");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "managedObjectContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __56__ICAttachmentInlineDrawingModel_UI__drawPreviewInRect___block_invoke;
  v21[3] = &unk_1E5C1D9D0;
  v21[4] = a1;
  v21[5] = &v22;
  objc_msgSend(v12, "performBlockAndWait:", v21);

  v13 = (void *)MEMORY[0x1E0D63A10];
  objc_msgSend(a1, "attachment");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "generateImageForAttachment:fromDrawing:fullResolution:appearanceInfo:", v14, v23[5], 0, v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    objc_msgSend(a1, "attachment");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "fallbackImageData");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v19)
    {
      v15 = 0;
      goto LABEL_3;
    }
    objc_msgSend(MEMORY[0x1E0DC3870], "ic_imageWithData:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[ICAttachmentPreviewImageLoader orientedImage:withBackground:](ICAttachmentPreviewImageLoader, "orientedImage:withBackground:", v20, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
      goto LABEL_3;
  }
  objc_msgSend(a1, "attachment");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "note");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICPaperStyle drawPaperStyleType:inRect:](ICPaperStyle, "drawPaperStyleType:inRect:", (int)objc_msgSend(v17, "paperStyleType"), a2, a3, a4, a5);

  objc_msgSend(v15, "drawInRect:", a2, a3, a4, a5);
LABEL_3:

  _Block_object_dispose(&v22, 8);
}

- (void)mergeWithMergeableData:()UI mergeableFieldState:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1AC7A1000, v0, v1, "Error creating PKDrawing from data in mergeWithMergeableData: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)actuallyMergeWithDrawing:()UI .cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1AC7A1000, v0, v1, "actuallyMergeWithDrawing error creating currentDrawing %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)setTitleQueryEnabled:()UI .cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(*(_QWORD *)a1 + 40);
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_0_2(&dword_1AC7A1000, a2, a3, "Enabling title query for %@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_2();
}

- (void)setTitleQueryEnabled:()UI .cold.2(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(*(_QWORD *)a1 + 40);
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_0_2(&dword_1AC7A1000, a2, a3, "Disabling title query for %@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_2();
}

@end
