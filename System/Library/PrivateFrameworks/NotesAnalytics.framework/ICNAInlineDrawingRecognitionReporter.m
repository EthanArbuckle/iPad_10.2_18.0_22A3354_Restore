@implementation ICNAInlineDrawingRecognitionReporter

+ (id)sharedReporter
{
  if (s_onceToken_0 != -1)
    dispatch_once(&s_onceToken_0, &__block_literal_global_3);
  return (id)sharedReporter_s_instance_0;
}

void __54__ICNAInlineDrawingRecognitionReporter_sharedReporter__block_invoke()
{
  ICNAInlineDrawingRecognitionReporter *v0;
  void *v1;

  v0 = objc_alloc_init(ICNAInlineDrawingRecognitionReporter);
  v1 = (void *)sharedReporter_s_instance_0;
  sharedReporter_s_instance_0 = (uint64_t)v0;

}

- (ICNAInlineDrawingRecognitionReporter)init
{
  ICNAInlineDrawingRecognitionReporter *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *stagedReports;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ICNAInlineDrawingRecognitionReporter;
  v2 = -[ICNAInlineDrawingRecognitionReporter init](&v8, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    stagedReports = v2->_stagedReports;
    v2->_stagedReports = v3;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v2, sel_reportNotification_, *MEMORY[0x1E0D649A0], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", v2, sel_analyticsSessionWillEnd_, CFSTR("ICNASessionWillEndNotification"), 0);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)ICNAInlineDrawingRecognitionReporter;
  -[ICNAInlineDrawingRecognitionReporter dealloc](&v4, sel_dealloc);
}

- (void)reportNotification:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  id v12;

  objc_msgSend(a3, "userInfo");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0D649A8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0D649B0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0D649B8]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v10 = v7 == 0;
  else
    v10 = 1;
  if (!v10 && v9 != 0)
    -[ICNAInlineDrawingRecognitionReporter createReportForDrawing:drawingID:insideNote:](self, "createReportForDrawing:drawingID:insideNote:", v5, v7, v9);

}

- (void)createReportForDrawing:(id)a3 drawingID:(id)a4 insideNote:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  __CFString *v23;
  uint64_t v24;
  uint64_t v25;
  __CFString *v26;
  ICASDrawingRecognitionData *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  ICASDrawingRecognitionData *v32;
  void *v33;
  void *v34;
  id v35;
  ICNAInlineDrawingRecognitionReport *v36;
  CFRange v37;

  v8 = a5;
  v35 = a4;
  v9 = a3;
  v36 = objc_alloc_init(ICNAInlineDrawingRecognitionReport);
  -[ICNAObject eventReporter](self, "eventReporter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "noteDataForModernNote:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNAInlineDrawingRecognitionReport setNoteData:](v36, "setNoteData:", v11);

  -[ICNAObject eventReporter](self, "eventReporter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "noteAccessDataForModernNote:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNAInlineDrawingRecognitionReport setNoteAccessData:](v36, "setNoteAccessData:", v13);

  -[ICNAObject eventReporter](self, "eventReporter");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "account");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "accountDataForModernAccount:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNAInlineDrawingRecognitionReport setAccountData:](v36, "setAccountData:", v16);

  +[ICNAIdentityManager sharedManager](ICNAIdentityManager, "sharedManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "saltedID:forClass:", v35, objc_opt_class());
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICNAObject eventReporter](self, "eventReporter");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "pencilStrokeCountForDrawing:", v9);

  objc_msgSend(v9, "strokes");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "count") - v19;

  objc_msgSend(v9, "indexableContent");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v22, "presentableTextRepresentation");
  v23 = (__CFString *)objc_claimAutoreleasedReturnValue();

  v24 = -[__CFString length](v23, "length");
  v25 = -[__CFString ic_numberOfLines](v23, "ic_numberOfLines");
  v37.length = -[__CFString length](v23, "length");
  v37.location = 0;
  v26 = (__CFString *)CFStringTokenizerCopyBestStringLanguage(v23, v37);
  v27 = [ICASDrawingRecognitionData alloc];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(v19));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(v21));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(v24));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(v25));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = -[ICASDrawingRecognitionData initWithCountOfPencilStrokes:countOfFingerStrokes:countOfRecognizedHandwrittenCharacters:countOfRecognizedLines:handwritingLanguage:drawingID:](v27, "initWithCountOfPencilStrokes:countOfFingerStrokes:countOfRecognizedHandwrittenCharacters:countOfRecognizedLines:handwritingLanguage:drawingID:", v28, v29, v30, v31, v26, v34);
  -[ICNAInlineDrawingRecognitionReport setDrawingRecognitionData:](v36, "setDrawingRecognitionData:", v32);

  -[ICNAInlineDrawingRecognitionReporter stagedReports](self, "stagedReports");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setObject:forKeyedSubscript:", v36, v35);

}

- (void)analyticsSessionWillEnd:(id)a3
{
  id v4;
  void *v5;
  ICNAEventReporter *v6;
  objc_class *v7;
  void *v8;
  ICNAEventReporter *v9;
  id v10;

  v4 = a3;
  objc_opt_class();
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  ICDynamicCast();
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v6 = [ICNAEventReporter alloc];
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[ICNAEventReporter initWithSubTrackerName:windowScene:](v6, "initWithSubTrackerName:windowScene:", v8, v10);

    -[ICNAInlineDrawingRecognitionReporter submitReportsWithEventReporter:](self, "submitReportsWithEventReporter:", v9);
  }

}

- (void)submitReportsWithEventReporter:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id obj;
  id v20;
  uint64_t v21;
  id v22;
  ICNAInlineDrawingRecognitionReporter *v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _QWORD v29[4];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v22 = a3;
  v23 = self;
  -[ICNAInlineDrawingRecognitionReporter stagedReports](self, "stagedReports");
  obj = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(obj);
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  -[ICNAInlineDrawingRecognitionReporter stagedReports](self, "stagedReports");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v5)
  {
    v20 = v4;
    v21 = *(_QWORD *)v26;
    do
    {
      v24 = v5;
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v26 != v21)
          objc_enumerationMutation(v20);
        v7 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
        -[ICNAInlineDrawingRecognitionReporter stagedReports](v23, "stagedReports", obj);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKeyedSubscript:", v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        +[ICNAController sharedController](ICNAController, "sharedController");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_opt_class();
        objc_msgSend(v9, "noteData");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v29[0] = v12;
        objc_msgSend(v9, "noteAccessData");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v29[1] = v13;
        objc_msgSend(v9, "accountData");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v29[2] = v14;
        objc_msgSend(v9, "drawingRecognitionData");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v29[3] = v15;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 4);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "subTracker");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "submitEventOfType:pushThenPopDataObjects:subTracker:", v11, v16, v17);

      }
      v4 = v20;
      v5 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v5);
  }

  -[ICNAInlineDrawingRecognitionReporter stagedReports](v23, "stagedReports");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "removeAllObjects");

  objc_sync_exit(obj);
}

- (NSMutableDictionary)stagedReports
{
  return self->_stagedReports;
}

- (void)setStagedReports:(id)a3
{
  objc_storeStrong((id *)&self->_stagedReports, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stagedReports, 0);
}

@end
