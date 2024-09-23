@implementation PKTextInputDebugLogEntryRerun

- (PKTextInputDebugLogEntryRerun)initWithLogEntry:(id)a3
{
  id v5;
  PKTextInputDebugLogEntryRerun *v6;
  PKTextInputDebugLogEntryRerun *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKTextInputDebugLogEntryRerun;
  v6 = -[PKTextInputDebugLogEntryRerun init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_logEntry, a3);

  return v7;
}

- (PKTextInputDebugLogEntryRerun)runWithCompletion:(id)a3
{
  void *v4;
  id completionBlock;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  PKTextInputStrokeProvider *v16;
  PKTextInputStrokeProvider *strokeProvider;
  PKTextInputLanguageSpec *v18;
  PKTextInputLanguageSpec *languageSpec;
  PKTextInputRecognitionManager *v20;
  PKTextInputRecognitionManager *recognitionManager;
  PKTextInputLanguageSpec *v22;
  __CFString *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  PKTextInputDebugLogEntryRerun *result;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint64_t v33;
  __CFString *v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = _Block_copy(a3);
  completionBlock = self->_completionBlock;
  self->_completionBlock = v4;

  -[PKTextInputDebugLogEntry recognitionLocaleIdentifiers](self->_logEntry, "recognitionLocaleIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v30;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v30 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v12));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
          objc_msgSend(v7, "addObject:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
    }
    while (v10);
  }

  if (!objc_msgSend(v7, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid locales for log entry: \"%@\"), v8);
    v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_17:
    v24 = (void *)MEMORY[0x1E0CB35C8];
    v25 = *MEMORY[0x1E0CB28A8];
    v33 = *MEMORY[0x1E0CB2D50];
    v34 = v23;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "errorWithDomain:code:userInfo:", v25, 1, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    -[PKTextInputDebugLogEntryRerun _finishRerunWithQueryItems:error:](self, "_finishRerunWithQueryItems:error:", 0, v27);
    goto LABEL_18;
  }
  -[PKTextInputDebugLogEntry inputDrawing](self->_logEntry, "inputDrawing");
  v14 = objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    v23 = CFSTR("Invalid input drawing.");
    goto LABEL_17;
  }
  v15 = (void *)v14;
  v16 = -[PKTextInputStrokeProvider initWithDrawing:]([PKTextInputStrokeProvider alloc], "initWithDrawing:", v14);
  strokeProvider = self->_strokeProvider;
  self->_strokeProvider = v16;

  v18 = (PKTextInputLanguageSpec *)-[PKTextInputLanguageSpec initWithLocales:]([PKTextInputLanguageSpec alloc], v7);
  languageSpec = self->_languageSpec;
  self->_languageSpec = v18;

  v20 = objc_alloc_init(PKTextInputRecognitionManager);
  recognitionManager = self->_recognitionManager;
  self->_recognitionManager = v20;

  v22 = self->_languageSpec;
  if (v22)
    -[PKTextInputRecognitionManager setRecognitionLocales:]((uint64_t)self->_recognitionManager, v22->__locales);
  -[PKTextInputRecognitionManager beginRecognitionRequestWithDataSource:](&self->_recognitionManager->super.isa, self);
LABEL_18:

  return result;
}

- (void)_finishRerunWithQueryItems:(id)a3 error:(id)a4
{
  id completionBlock;

  (*((void (**)(void))self->_completionBlock + 2))();
  completionBlock = self->_completionBlock;
  self->_completionBlock = 0;

}

- (id)recognitionManagerStrokeProvider:(id)a3
{
  return self->_strokeProvider;
}

- (id)recognitionManagerTextInputTargets:(id)a3
{
  return -[PKTextInputDebugLogEntry inputTargets](self->_logEntry, "inputTargets", a3);
}

- (id)recognitionManager:(id)a3 textInputTargetForItemStableIdentifier:(id)a4 strokeIdentifiers:(id)a5 simultaneousItemStableIdentifiers:(id)a6
{
  void *v6;
  void *v7;

  -[PKTextInputDebugLogEntry inputTargetContentInfo](self->_logEntry, "inputTargetContentInfo", a3, a4, a5, a6);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "textInputTarget");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)recognitionManager:(id)a3 fetchContentInfoForTextInputTarget:(id)a4 strokeIdentifiers:(id)a5 completion:(id)a6
{
  PKTextInputDebugArchivedLogEntry *logEntry;
  id v8;
  id v9;

  logEntry = self->_logEntry;
  v8 = a6;
  -[PKTextInputDebugLogEntry inputTargetContentInfo](logEntry, "inputTargetContentInfo");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a6 + 2))(v8, v9);

}

- (void)recognitionManager:(id)a3 recognitionDidFinishWithQueryItems:(id)a4 duration:(double)a5
{
  -[PKTextInputDebugLogEntryRerun _finishRerunWithQueryItems:error:](self, "_finishRerunWithQueryItems:error:", a4, 0, a5);
}

- (PKTextInputDebugArchivedLogEntry)logEntry
{
  return self->_logEntry;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logEntry, 0);
  objc_storeStrong((id *)&self->_strokeProvider, 0);
  objc_storeStrong((id *)&self->_languageSpec, 0);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_recognitionManager, 0);
}

@end
