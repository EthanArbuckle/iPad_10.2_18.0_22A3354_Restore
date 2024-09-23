@implementation ICAttachmentSystemPaperModel(TextFinding)

- (void)textFindingResultsMatchingString:()TextFinding textView:ignoreCase:wholeWords:startsWith:usePattern:completion:
{
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  ICSystemPaperIndexableTextContentHelper *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  id v30;
  uint64_t *v31;
  char v32;
  char v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  ICSystemPaperIndexableTextContentHelper *v39;

  v13 = a3;
  v14 = a4;
  v15 = a9;
  objc_msgSend(a1, "attachment");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "shortLoggingDescription");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__20;
  v38 = __Block_byref_object_dispose__20;
  v18 = [ICSystemPaperIndexableTextContentHelper alloc];
  objc_msgSend(a1, "attachment");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = -[ICSystemPaperIndexableTextContentHelper initWithPaperAttachment:](v18, "initWithPaperAttachment:", v19);

  objc_msgSend((id)v35[5], "drawing");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setRecognitionEnabled:", 1);
  objc_msgSend((id)objc_opt_class(), "systemPaperTextFindingQueue");
  v21 = objc_claimAutoreleasedReturnValue();
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __142__ICAttachmentSystemPaperModel_TextFinding__textFindingResultsMatchingString_textView_ignoreCase_wholeWords_startsWith_usePattern_completion___block_invoke;
  v26[3] = &unk_1EA7E0BE8;
  v27 = v20;
  v28 = v13;
  v32 = a6;
  v33 = a5;
  v30 = v15;
  v31 = &v34;
  v29 = v17;
  v22 = v15;
  v23 = v17;
  v24 = v13;
  v25 = v20;
  dispatch_async(v21, v26);

  _Block_object_dispose(&v34, 8);
}

+ (id)systemPaperTextFindingQueue
{
  if (systemPaperTextFindingQueue_onceToken != -1)
    dispatch_once(&systemPaperTextFindingQueue_onceToken, &__block_literal_global_21);
  return (id)systemPaperTextFindingQueue_sSystemPaperFindingQueue;
}

@end
