@implementation ICAttachmentInlineDrawingModel(TextFinding)

- (void)textFindingResultsMatchingString:()TextFinding textView:ignoreCase:wholeWords:startsWith:usePattern:completion:
{
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  dispatch_semaphore_t v25;
  NSObject *v26;
  NSObject *v27;
  id v28;
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  dispatch_semaphore_t v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  char v38;
  char v39;
  uint8_t buf[4];
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a9;
  v14 = os_log_create("com.apple.notes", "PencilKit");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    -[ICAttachmentInlineDrawingModel(TextFinding) textFindingResultsMatchingString:textView:ignoreCase:wholeWords:startsWith:usePattern:completion:].cold.1(a1, v14);

  objc_msgSend(a1, "handwritingRecognitionDrawing");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
    goto LABEL_7;
  v16 = os_log_create("com.apple.notes", "PencilKit");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(a1, "attachment");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "shortLoggingDescription");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v41 = v18;
    _os_log_impl(&dword_1DD7B0000, v16, OS_LOG_TYPE_DEFAULT, "No handwriting recognition drawing for %@", buf, 0xCu);

  }
  v15 = (void *)objc_msgSend(a1, "newDrawingFromMergeableData");
  if (v15)
  {
LABEL_7:
    if ((objc_msgSend(v15, "recognitionEnabled") & 1) == 0)
      objc_msgSend(v15, "setRecognitionEnabled:", 1);
    objc_msgSend(v15, "_canvasBounds");
    v20 = v19;
    v22 = v21;
    objc_msgSend(a1, "attachment");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "shortLoggingDescription");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = dispatch_semaphore_create(0);
    objc_msgSend((id)objc_opt_class(), "inlineDrawingTextFindingQueue");
    v26 = objc_claimAutoreleasedReturnValue();
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __144__ICAttachmentInlineDrawingModel_TextFinding__textFindingResultsMatchingString_textView_ignoreCase_wholeWords_startsWith_usePattern_completion___block_invoke;
    v30[3] = &unk_1EA7DF5C8;
    v31 = v15;
    v38 = a6;
    v39 = a5;
    v32 = v12;
    v33 = v24;
    v36 = v20;
    v37 = v22;
    v34 = v25;
    v35 = v13;
    v27 = v25;
    v28 = v24;
    v29 = v15;
    dispatch_async(v26, v30);

  }
  else if (v13)
  {
    (*((void (**)(id, _QWORD))v13 + 2))(v13, 0);
  }

}

+ (id)inlineDrawingTextFindingQueue
{
  if (inlineDrawingTextFindingQueue_onceToken != -1)
    dispatch_once(&inlineDrawingTextFindingQueue_onceToken, &__block_literal_global_12);
  return (id)inlineDrawingTextFindingQueue_sDrawingFindingQueue;
}

- (void)textFindingResultsMatchingString:()TextFinding textView:ignoreCase:wholeWords:startsWith:usePattern:completion:.cold.1(void *a1, NSObject *a2)
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "attachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "shortLoggingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v4;
  _os_log_debug_impl(&dword_1DD7B0000, a2, OS_LOG_TYPE_DEBUG, "Finding search query results in inline drawing: %@", (uint8_t *)&v5, 0xCu);

}

@end
