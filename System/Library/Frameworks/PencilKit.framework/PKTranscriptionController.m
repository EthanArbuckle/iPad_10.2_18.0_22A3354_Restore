@implementation PKTranscriptionController

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)PKTranscriptionController;
  -[PKTranscriptionController dealloc](&v4, sel_dealloc);
}

- (PKTranscriptionController)initWithRecognitionManager:(id)a3 strokeSelection:(id)a4 attachment:(id)a5
{
  id v8;
  id v9;
  id v10;
  PKTranscriptionController *v11;
  PKTranscriptionController *v12;
  void *v13;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PKTranscriptionController;
  v11 = -[PKTranscriptionController init](&v15, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_recognitionManager, v8);
    objc_storeStrong((id *)&v12->_strokeSelection, a4);
    objc_storeWeak((id *)&v12->_attachment, v10);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObserver:selector:name:object:", v12, sel_textInputDidChange_, CFSTR("TIPreferencesControllerChangedNotification"), 0);

  }
  return v12;
}

- (void)findTranscriptionForType:(int)a3 withCompletion:(id)a4
{
  void (**v6)(id, void *);
  void *v7;
  PKTranscriptionResult *v8;
  void *v9;
  PKTranscriptionResult *v10;
  uint64_t v11;
  void *v12;
  dispatch_time_t v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[5];
  void (**v17)(id, void *);

  v6 = (void (**)(id, void *))a4;
  self->_didShowHUD = 0;
  self->_transcriptionType = a3;
  -[PKTranscriptionController textTranscription](self, "textTranscription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    if (v6)
    {
      v8 = [PKTranscriptionResult alloc];
      -[PKTranscriptionController textTranscription](self, "textTranscription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[PKTranscriptionResult initWithTranscription:didShowHUD:](v8, "initWithTranscription:didShowHUD:", v9, self->_didShowHUD);

      v6[2](v6, v10);
    }
  }
  else
  {
    v11 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __69__PKTranscriptionController_findTranscriptionForType_withCompletion___block_invoke;
    v16[3] = &unk_1E777AE18;
    v16[4] = self;
    v17 = v6;
    -[PKTranscriptionController _fetchTranscriptionWithCompletion:](self, "_fetchTranscriptionWithCompletion:", v16);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (a3 != 2)
    {
      v13 = dispatch_time(0, 2000000000);
      v14[0] = v11;
      v14[1] = 3221225472;
      v14[2] = __69__PKTranscriptionController_findTranscriptionForType_withCompletion___block_invoke_2;
      v14[3] = &unk_1E7777C20;
      v14[4] = self;
      v15 = v12;
      dispatch_after(v13, MEMORY[0x1E0C80D38], v14);

    }
  }

}

void __69__PKTranscriptionController_findTranscriptionForType_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  PKTranscriptionResult *v3;
  id v4;

  v4 = a2;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 9) = 1;
  objc_msgSend(*(id *)(a1 + 32), "_hideHUD");
  if (*(_QWORD *)(a1 + 40))
  {
    v3 = -[PKTranscriptionResult initWithTranscription:didShowHUD:]([PKTranscriptionResult alloc], "initWithTranscription:didShowHUD:", v4, *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 10));
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
}

uint64_t __69__PKTranscriptionController_findTranscriptionForType_withCompletion___block_invoke_2(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(result + 32);
  if (!*(_BYTE *)(v1 + 9))
  {
    *(_BYTE *)(v1 + 10) = 1;
    return objc_msgSend(*(id *)(result + 32), "_showHUDWithProgress:", *(_QWORD *)(result + 40));
  }
  return result;
}

- (void)cancelAndTeardown
{
  self->_shouldCancel = 1;
  -[PKTranscriptionController _hideHUD](self, "_hideHUD");
}

- (id)_fetchTranscriptionWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  id WeakRetained;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v29[5];
  id v30;
  _QWORD aBlock[5];

  v4 = a3;
  -[PKTranscriptionController strokeSelection](self, "strokeSelection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "drawing");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 && (v7 = objc_loadWeakRetained((id *)&self->_recognitionManager), v7, v7))
  {
    v8 = MEMORY[0x1E0C809B0];
    self->_shouldCancel = 0;
    aBlock[0] = v8;
    aBlock[1] = 3221225472;
    aBlock[2] = __63__PKTranscriptionController__fetchTranscriptionWithCompletion___block_invoke;
    aBlock[3] = &unk_1E777AE40;
    aBlock[4] = self;
    v9 = _Block_copy(aBlock);
    WeakRetained = objc_loadWeakRetained((id *)&self->_recognitionManager);
    v11 = objc_msgSend(WeakRetained, "state");

    if (v11 != 3)
    {
      v12 = (void *)MEMORY[0x1E0C99E10];
      v13 = objc_loadWeakRetained((id *)&self->_attachment);
      objc_msgSend(v13, "strokeSpatialCache");
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = (void *)v14;
      if (v14)
        v16 = *(void **)(v14 + 24);
      else
        v16 = 0;
      v17 = v16;
      objc_msgSend(v12, "orderedSetWithArray:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      -[PKTranscriptionController strokeSelection](self, "strokeSelection");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "strokes");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "unionOrderedSet:", v20);

      v21 = objc_loadWeakRetained((id *)&self->_recognitionManager);
      objc_msgSend(v18, "array");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKRecognitionSessionManager setVisibleOnscreenStrokes:]((uint64_t)v21, v22);

    }
    v23 = objc_loadWeakRetained((id *)&self->_recognitionManager);
    -[PKTranscriptionController strokeSelection](self, "strokeSelection");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "strokes");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "array");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v8;
    v29[1] = 3221225472;
    v29[2] = __63__PKTranscriptionController__fetchTranscriptionWithCompletion___block_invoke_2;
    v29[3] = &unk_1E777AE18;
    v29[4] = self;
    v30 = v4;
    -[PKRecognitionSessionManager fetchTranscriptionForStrokes:cancelBlock:withCompletion:]((uint64_t)v23, v26, v9, v29);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v27 = 0;
  }

  return v27;
}

uint64_t __63__PKTranscriptionController__fetchTranscriptionWithCompletion___block_invoke(uint64_t a1)
{
  return *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 8);
}

void __63__PKTranscriptionController__fetchTranscriptionWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  uint64_t v4;
  void *v5;
  uint8_t v6[16];

  objc_msgSend(*(id *)(a1 + 32), "_receiveTranscription:", a2);
  v3 = os_log_create("com.apple.pencilkit", "Recognition");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1BE213000, v3, OS_LOG_TYPE_DEFAULT, "[On-demand Transcription] Successfully fetched transcription from CoreHandwriting", v6, 2u);
  }

  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "textTranscription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);

  }
}

- (void)findCompleteTranscriptionForNote:(id)a3
{
  id v4;
  id WeakRetained;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  _QWORD aBlock[5];

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_recognitionManager);

  if (WeakRetained)
  {
    v6 = MEMORY[0x1E0C809B0];
    self->_shouldCancel = 0;
    aBlock[0] = v6;
    aBlock[1] = 3221225472;
    aBlock[2] = __62__PKTranscriptionController_findCompleteTranscriptionForNote___block_invoke;
    aBlock[3] = &unk_1E777AE40;
    aBlock[4] = self;
    v7 = _Block_copy(aBlock);
    v8 = objc_loadWeakRetained((id *)&self->_recognitionManager);
    -[PKTranscriptionController attachment](self, "attachment");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "drawing");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "strokes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v6;
    v13[1] = 3221225472;
    v13[2] = __62__PKTranscriptionController_findCompleteTranscriptionForNote___block_invoke_2;
    v13[3] = &unk_1E777AE18;
    v13[4] = self;
    v14 = v4;
    -[PKRecognitionSessionManager fetchTranscriptionForStrokes:cancelBlock:withCompletion:]((uint64_t)v8, v11, v7, v13);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
}

uint64_t __62__PKTranscriptionController_findCompleteTranscriptionForNote___block_invoke(uint64_t a1)
{
  return *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 8);
}

void __62__PKTranscriptionController_findCompleteTranscriptionForNote___block_invoke_2(uint64_t a1, uint64_t a2)
{
  PKTranscriptionResult *v3;
  void *v4;
  PKTranscriptionResult *v5;

  objc_msgSend(*(id *)(a1 + 32), "_receiveTranscription:", a2);
  if (*(_QWORD *)(a1 + 40))
  {
    v3 = [PKTranscriptionResult alloc];
    objc_msgSend(*(id *)(a1 + 32), "textTranscription");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[PKTranscriptionResult initWithTranscription:didShowHUD:](v3, "initWithTranscription:didShowHUD:", v4, *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 10));

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

- (void)_receiveTranscription:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint8_t v9[16];
  uint8_t buf[16];

  v4 = a3;
  if (!v4)
  {
    v5 = os_log_create("com.apple.pencilkit", "Recognition");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1BE213000, v5, OS_LOG_TYPE_ERROR, "[On-demand Transcription] Unable to fetch transcription from CoreHandwriting, falling back on creating a new session with just the selected strokes", buf, 2u);
    }

  }
  if (objc_msgSend(v4, "length") || self->_transcriptionType == 2)
  {
    -[PKTranscriptionController setTextTranscription:](self, "setTextTranscription:", v4);
  }
  else
  {
    _PencilKitBundle();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Handwritten Note"), CFSTR("Handwritten Note"), CFSTR("Localizable"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKTranscriptionController setTextTranscription:](self, "setTextTranscription:", v8);

  }
  v6 = os_log_create("com.apple.pencilkit", "Recognition");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_1BE213000, v6, OS_LOG_TYPE_DEFAULT, "[On-demand Transcription] Successfully fetched transcription from CoreHandwriting", v9, 2u);
  }

}

- (void)_showHUDWithProgress:(id)a3
{
  NSProgress *v4;
  int transcriptionType;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  PKProgressAlertController *v13;
  PKProgressAlertController *progressAlertController;
  PKProgressAlertController *v15;
  NSProgress *currentProgress;
  NSProgress *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v4 = (NSProgress *)a3;
  transcriptionType = self->_transcriptionType;
  if (transcriptionType == 1)
  {
    _PencilKitBundle();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("Translating Text…"), CFSTR("Translating Text…"), CFSTR("Localizable"));
    v22 = (id)objc_claimAutoreleasedReturnValue();

    _PencilKitBundle();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v9 = CFSTR("Cancel translating");
  }
  else if (transcriptionType)
  {
    _PencilKitBundle();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("Transcribing Text…"), CFSTR("Transcribing Text…"), CFSTR("Localizable"));
    v22 = (id)objc_claimAutoreleasedReturnValue();

    _PencilKitBundle();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v9 = CFSTR("Cancel transcription");
  }
  else
  {
    _PencilKitBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Copying as Text…"), CFSTR("Copying as Text…"), CFSTR("Localizable"));
    v22 = (id)objc_claimAutoreleasedReturnValue();

    _PencilKitBundle();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v9 = CFSTR("Cancel copy as text");
  }
  objc_msgSend(v7, "localizedStringForKey:value:table:", v9, CFSTR("Cancel"), CFSTR("Localizable"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = +[PKProgressAlertController newProgressAlertControllerWithTitle:cancel:](PKProgressAlertController, "newProgressAlertControllerWithTitle:cancel:", v22, v12);
  progressAlertController = self->_progressAlertController;
  self->_progressAlertController = v13;

  -[PKProgressAlertController setDelegate:](self->_progressAlertController, "setDelegate:", self);
  v15 = self->_progressAlertController;
  -[NSProgress fractionCompleted](v4, "fractionCompleted");
  -[PKProgressAlertController setProgress:](v15, "setProgress:");
  currentProgress = self->_currentProgress;
  self->_currentProgress = v4;
  v17 = v4;

  -[NSProgress addObserver:forKeyPath:options:context:](self->_currentProgress, "addObserver:forKeyPath:options:context:", self, CFSTR("fractionCompleted"), 3, PKCopyAsTextContext);
  -[PKTranscriptionController attachment](self, "attachment");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "viewRep");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "window");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "rootViewController");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "presentViewController:animated:completion:", self->_progressAlertController, 1, &__block_literal_global_49);

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  _QWORD block[5];

  if ((void *)PKCopyAsTextContext == a6)
  {
    if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread", a3, a4, a5))
    {
      -[PKTranscriptionController _progressChanged](self, "_progressChanged");
    }
    else
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __76__PKTranscriptionController_observeValueForKeyPath_ofObject_change_context___block_invoke;
      block[3] = &unk_1E7778020;
      block[4] = self;
      dispatch_async(MEMORY[0x1E0C80D38], block);
    }
  }
}

uint64_t __76__PKTranscriptionController_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_progressChanged");
}

- (void)_progressChanged
{
  void *v3;
  PKProgressAlertController *progressAlertController;

  -[PKProgressAlertController presentingViewController](self->_progressAlertController, "presentingViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    progressAlertController = self->_progressAlertController;
    -[NSProgress fractionCompleted](self->_currentProgress, "fractionCompleted");
    -[PKProgressAlertController setProgress:](progressAlertController, "setProgress:");
  }
}

- (void)_unregisterProgressObserver
{
  NSProgress *currentProgress;

  -[NSProgress removeObserver:forKeyPath:context:](self->_currentProgress, "removeObserver:forKeyPath:context:", self, CFSTR("fractionCompleted"), PKCopyAsTextContext);
  currentProgress = self->_currentProgress;
  self->_currentProgress = 0;

}

- (void)_hideHUD
{
  PKProgressAlertController *progressAlertController;
  _QWORD v4[5];

  -[PKTranscriptionController _unregisterProgressObserver](self, "_unregisterProgressObserver");
  progressAlertController = self->_progressAlertController;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __37__PKTranscriptionController__hideHUD__block_invoke;
  v4[3] = &unk_1E7778020;
  v4[4] = self;
  -[PKProgressAlertController dismissViewControllerAnimated:completion:](progressAlertController, "dismissViewControllerAnimated:completion:", 1, v4);
}

void __37__PKTranscriptionController__hideHUD__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 40);
  *(_QWORD *)(v1 + 40) = 0;

}

- (void)textInputDidChange:(id)a3
{
  -[PKTranscriptionController setTextTranscription:](self, "setTextTranscription:", 0);
}

- (PKAttachment)attachment
{
  return (PKAttachment *)objc_loadWeakRetained((id *)&self->_attachment);
}

- (void)setAttachment:(id)a3
{
  objc_storeWeak((id *)&self->_attachment, a3);
}

- (PKStrokeSelection)strokeSelection
{
  return self->_strokeSelection;
}

- (void)setStrokeSelection:(id)a3
{
  objc_storeStrong((id *)&self->_strokeSelection, a3);
}

- (PKRecognitionSessionManager)recognitionManager
{
  return (PKRecognitionSessionManager *)objc_loadWeakRetained((id *)&self->_recognitionManager);
}

- (void)setRecognitionManager:(id)a3
{
  objc_storeWeak((id *)&self->_recognitionManager, a3);
}

- (PKProgressAlertController)progressAlertController
{
  return self->_progressAlertController;
}

- (void)setProgressAlertController:(id)a3
{
  objc_storeStrong((id *)&self->_progressAlertController, a3);
}

- (NSProgress)currentProgress
{
  return self->_currentProgress;
}

- (void)setCurrentProgress:(id)a3
{
  objc_storeStrong((id *)&self->_currentProgress, a3);
}

- (BOOL)shouldCancel
{
  return self->_shouldCancel;
}

- (void)setShouldCancel:(BOOL)a3
{
  self->_shouldCancel = a3;
}

- (BOOL)didReceiveTranscription
{
  return self->_didReceiveTranscription;
}

- (void)setDidReceiveTranscription:(BOOL)a3
{
  self->_didReceiveTranscription = a3;
}

- (BOOL)didShowHUD
{
  return self->_didShowHUD;
}

- (void)setDidShowHUD:(BOOL)a3
{
  self->_didShowHUD = a3;
}

- (NSString)textTranscription
{
  return self->_textTranscription;
}

- (void)setTextTranscription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (int)transcriptionType
{
  return self->_transcriptionType;
}

- (void)setTranscriptionType:(int)a3
{
  self->_transcriptionType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textTranscription, 0);
  objc_storeStrong((id *)&self->_currentProgress, 0);
  objc_storeStrong((id *)&self->_progressAlertController, 0);
  objc_destroyWeak((id *)&self->_recognitionManager);
  objc_storeStrong((id *)&self->_strokeSelection, 0);
  objc_destroyWeak((id *)&self->_attachment);
}

@end
