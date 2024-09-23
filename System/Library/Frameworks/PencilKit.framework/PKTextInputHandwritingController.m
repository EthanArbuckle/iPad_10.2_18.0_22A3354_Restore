@implementation PKTextInputHandwritingController

- (PKTextInputHandwritingController)initWithCanvasController:(id)a3 elementsController:(id)a4 feedbackController:(id)a5 reserveSpaceController:(id)a6 debugLogController:(id)a7 cursorController:(id)a8
{
  id v15;
  id v16;
  id v17;
  PKTextInputHandwritingController *v18;
  PKTextInputHandwritingController *v19;
  PKTextInputTargetState *v20;
  PKTextInputTargetState *activeInputTargetState;
  uint64_t v22;
  NSMutableArray *resultCommandsQueue;
  id v25;
  id v26;
  id v27;
  objc_super v28;

  v27 = a3;
  v26 = a4;
  v15 = a5;
  v25 = a6;
  v16 = a7;
  v17 = a8;
  v28.receiver = self;
  v28.super_class = (Class)PKTextInputHandwritingController;
  v18 = -[PKTextInputHandwritingController init](&v28, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_canvasController, a3);
    objc_storeStrong((id *)&v19->_elementsController, a4);
    objc_storeStrong((id *)&v19->_reserveSpaceController, a6);
    objc_storeStrong((id *)&v19->_debugLogController, a7);
    objc_storeStrong((id *)&v19->_cursorController, a8);
    objc_storeStrong((id *)&v19->_feedbackController, a5);
    objc_msgSend(v15, "setReferenceElementContent:referenceRange:feedbackType:", 0, 0x7FFFFFFFFFFFFFFFLL, 0, 0);
    v20 = objc_alloc_init(PKTextInputTargetState);
    activeInputTargetState = v19->__activeInputTargetState;
    v19->__activeInputTargetState = v20;

    v19->_strokeAlphaOverride = 1.0;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v22 = objc_claimAutoreleasedReturnValue();
    resultCommandsQueue = v19->__resultCommandsQueue;
    v19->__resultCommandsQueue = (NSMutableArray *)v22;

  }
  return v19;
}

- (void)_setWritingSession:(id)a3
{
  PKTextInputWritingSession *v5;
  int64_t v6;
  NSObject *v7;
  const __CFString *v8;
  __CFString *v9;
  __CFString *v10;
  int64_t v11;
  __CFString *v12;
  __CFString *v13;
  void *v14;
  int v15;
  __CFString *v16;
  __int16 v17;
  __CFString *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = (PKTextInputWritingSession *)a3;
  if (self->__writingSession != v5)
  {
    v6 = -[PKTextInputHandwritingController writingState](self, "writingState");
    objc_storeStrong((id *)&self->__writingSession, a3);
    v7 = os_log_create("com.apple.pencilkit", "PencilTextInput");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      if (v6 == 1)
        v8 = CFSTR("Active");
      else
        v8 = 0;
      if (v6)
        v9 = (__CFString *)v8;
      else
        v9 = CFSTR("Idle");
      v10 = v9;
      v11 = -[PKTextInputHandwritingController writingState](self, "writingState");
      if (v11 == 1)
        v12 = CFSTR("Active");
      else
        v12 = 0;
      if (!v11)
        v12 = CFSTR("Idle");
      v15 = 138412546;
      v16 = v9;
      v17 = 2112;
      v18 = v12;
      v13 = v12;
      _os_log_impl(&dword_1BE213000, v7, OS_LOG_TYPE_DEFAULT, "HWController writing session state changed %@ -> %@", (uint8_t *)&v15, 0x16u);

    }
    -[PKTextInputHandwritingController delegate](self, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handwritingControllerWritingStateDidChange:", self);

    +[PKTextInputDebugStateIntrospector debugStateDidChange](PKTextInputDebugStateIntrospector, "debugStateDidChange");
  }

}

- (int64_t)writingState
{
  void *v2;
  int64_t v3;

  -[PKTextInputHandwritingController _writingSession](self, "_writingSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)_notifyDelegateOfResultCommandState
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  if (!-[PKTextInputHandwritingController writingState](self, "writingState"))
  {
    -[PKTextInputHandwritingController _activeResultCommand](self, "_activeResultCommand");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      -[PKTextInputHandwritingController _resultCommandsQueue](self, "_resultCommandsQueue");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "count");

      if (v5)
        return;
      -[PKTextInputHandwritingController delegate](self, "delegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handwritingControllerDidFinishActiveCommands:", self);
      v3 = v6;
    }

  }
}

- (void)_setActiveHandwritingShot:(id)a3
{
  PKTextInputHandwritingShot *v5;
  id *v6;
  id *v7;
  PKTextInputHandwritingShot *v8;

  v5 = (PKTextInputHandwritingShot *)a3;
  if (self->__activeHandwritingShot != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)&self->__activeHandwritingShot, a3);
    -[PKTextInputHandwritingController _writingSession](self, "_writingSession");
    v6 = (id *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
      -[PKTextInputWritingSession _evaluatePendingWritingEndedElements](v6);

    -[PKTextInputHandwritingController _updateWritingSession](self, "_updateWritingSession");
    +[PKTextInputDebugStateIntrospector debugStateDidChange](PKTextInputDebugStateIntrospector, "debugStateDidChange");
    v5 = v8;
  }

}

- (void)_setPossibleHandwritingShot:(id)a3
{
  PKTextInputHandwritingShot *v5;
  id *v6;
  id *v7;
  PKTextInputHandwritingShot *v8;

  v5 = (PKTextInputHandwritingShot *)a3;
  if (self->__possibleHandwritingShot != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)&self->__possibleHandwritingShot, a3);
    -[PKTextInputHandwritingController _writingSession](self, "_writingSession");
    v6 = (id *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
      -[PKTextInputWritingSession _evaluatePendingWritingEndedElements](v6);

    -[PKTextInputHandwritingController _updateWritingSession](self, "_updateWritingSession");
    +[PKTextInputDebugStateIntrospector debugStateDidChange](PKTextInputDebugStateIntrospector, "debugStateDidChange");
    v5 = v8;
  }

}

- (void)_setActiveResultCommand:(id)a3
{
  PKTextInputResultCommand *v5;
  id *v6;
  id *v7;
  PKTextInputResultCommand *v8;

  v5 = (PKTextInputResultCommand *)a3;
  if (self->__activeResultCommand != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)&self->__activeResultCommand, a3);
    -[PKTextInputHandwritingController _writingSession](self, "_writingSession");
    v6 = (id *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
      -[PKTextInputWritingSession _evaluatePendingWritingEndedElements](v6);

    -[PKTextInputHandwritingController _updateWritingSession](self, "_updateWritingSession");
    -[PKTextInputHandwritingController _notifyDelegateOfResultCommandState](self, "_notifyDelegateOfResultCommandState");
    +[PKTextInputDebugStateIntrospector debugStateDidChange](PKTextInputDebugStateIntrospector, "debugStateDidChange");
    v5 = v8;
  }

}

- (void)_setLastKnownDrawing:(id)a3
{
  PKDrawing *v4;
  PKDrawing *lastKnownDrawing;

  if (self->__lastKnownDrawing != a3)
  {
    v4 = (PKDrawing *)objc_msgSend(a3, "copy");
    lastKnownDrawing = self->__lastKnownDrawing;
    self->__lastKnownDrawing = v4;

    +[PKTextInputDebugStateIntrospector debugStateDidChange](PKTextInputDebugStateIntrospector, "debugStateDidChange");
    -[PKTextInputHandwritingController _updateFloatingBackground](self, "_updateFloatingBackground");
  }
}

- (void)_setActiveInputTargetState:(id)a3
{
  PKTextInputTargetState *v5;
  PKTextInputTargetState *v6;

  v5 = (PKTextInputTargetState *)a3;
  if (self->__activeInputTargetState != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->__activeInputTargetState, a3);
    -[PKTextInputHandwritingController _updateWritingSession](self, "_updateWritingSession");
    -[PKTextInputHandwritingController _updateFloatingBackground](self, "_updateFloatingBackground");
    -[PKTextInputHandwritingController _updateStrokeAlphaOverride](self, "_updateStrokeAlphaOverride");
    v5 = v6;
  }

}

- (void)_updateWritingSession
{
  uint64_t v3;
  void *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  PKTextInputWritingSession *v15;
  PKTextInputWritingSession *v16;
  char v17;
  void *v18;
  uint64_t v19;
  void *v20;
  PKTextInputWritingSession *v21;

  -[PKTextInputHandwritingController canvasController](self, "canvasController");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3 && (objc_msgSend(*(id *)(v3 + 96), "isDrawing") & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    -[PKTextInputHandwritingController _activeHandwritingShot](self, "_activeHandwritingShot");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v5 = 1;
    }
    else
    {
      -[PKTextInputHandwritingController _possibleHandwritingShot](self, "_possibleHandwritingShot");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        v5 = 1;
      }
      else
      {
        -[PKTextInputHandwritingController _activeResultCommand](self, "_activeResultCommand");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
        {
          v5 = 1;
        }
        else
        {
          -[PKTextInputHandwritingController reserveSpaceController](self, "reserveSpaceController");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v9, "isReserveSpaceActive") & 1) != 0)
          {
            v5 = 1;
          }
          else
          {
            -[PKTextInputHandwritingController _activeInputTargetState](self, "_activeInputTargetState");
            v10 = objc_claimAutoreleasedReturnValue();
            v11 = (void *)v10;
            if (v10)
              v12 = *(void **)(v10 + 48);
            else
              v12 = 0;
            v13 = v12;
            v5 = v13 != 0;

          }
        }

      }
    }

  }
  -[PKTextInputHandwritingController _writingSession](self, "_writingSession");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5 || v14)
  {
    if (v14)
      v17 = v5;
    else
      v17 = 1;
    if ((v17 & 1) == 0)
    {
      -[PKTextInputHandwritingController _writingSession](self, "_writingSession");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKTextInputWritingSession invalidate]((uint64_t)v18);

      -[PKTextInputHandwritingController _writingSession](self, "_writingSession");
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = (void *)v19;
      if (v19)
        objc_storeWeak((id *)(v19 + 48), 0);

      -[PKTextInputHandwritingController _setWritingSession:](self, "_setWritingSession:", 0);
    }
  }
  else
  {
    v15 = objc_alloc_init(PKTextInputWritingSession);
    v16 = v15;
    v21 = v15;
    if (v15)
    {
      objc_storeWeak((id *)&v15->_delegate, self);
      v16 = v21;
    }
    -[PKTextInputHandwritingController _setWritingSession:](self, "_setWritingSession:", v16);

  }
}

- (void)_updateRecognitionManager
{
  void *v3;
  PKTextInputRecognitionManager *v4;
  void *v5;
  void *v6;
  int v7;
  id v8;

  -[PKTextInputHandwritingController _recognitionManager](self, "_recognitionManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = objc_alloc_init(PKTextInputRecognitionManager);
    -[PKTextInputHandwritingController set_recognitionManager:](self, "set_recognitionManager:", v4);

  }
  +[PKTextInputLanguageSelectionController sharedInstance](PKTextInputLanguageSelectionController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ensureKeyboardLanguageConsistencyIfNeeded");

  +[PKTextInputSettings sharedSettings](PKTextInputSettings, "sharedSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "outOfProcessRecognition");

  -[PKTextInputHandwritingController _recognitionManager](self, "_recognitionManager");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PKTextInputRecognitionManager setPreferOutOfProcessRecognition:]((uint64_t)v8, v7);

}

- (void)reserveSpaceControllerWillFocusElement:(id)a3
{
  id v4;
  id *v5;

  v4 = a3;
  -[PKTextInputHandwritingController _writingSession](self, "_writingSession");
  v5 = (id *)objc_claimAutoreleasedReturnValue();
  -[PKTextInputWritingSession setCurrentTargetElement:](v5, v4);

}

- (void)_evaluateAndProcessResultCommandsQueue
{
  -[PKTextInputHandwritingController _evaluateAndProcessResultCommandsQueueImmediateCommit:](self, "_evaluateAndProcessResultCommandsQueueImmediateCommit:", 0);
}

- (BOOL)_evaluateAndProcessResultCommandsQueueImmediateCommit:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD *v10;
  void *v11;
  uint64_t v12;
  _BOOL4 v13;
  void *v15;
  char *v16;
  id *v17;
  id *v18;

  v3 = a3;
  -[PKTextInputHandwritingController _resultCommandsQueue](self, "_resultCommandsQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (_QWORD *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v10 = 0;
    LOBYTE(v3) = 0;
    goto LABEL_28;
  }
  v7 = v6[3];
  if (v7 == 7)
  {
    while (1)
    {
      -[PKTextInputHandwritingController _resultCommandsQueue](self, "_resultCommandsQueue");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "removeObjectAtIndex:", 0);

      -[PKTextInputHandwritingController _resultCommandsQueue](self, "_resultCommandsQueue");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "firstObject");
      v10 = (_QWORD *)objc_claimAutoreleasedReturnValue();

      if (!v10)
        break;
      v6 = v10;
      if (v10[3] != 7)
        goto LABEL_8;
    }
    LOBYTE(v3) = 0;
    goto LABEL_25;
  }
  v10 = v6;
LABEL_8:
  -[PKTextInputHandwritingController _activeResultCommand](self, "_activeResultCommand");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {

    goto LABEL_20;
  }
  v12 = v10[3];
  v13 = v12 == 1 && v3;
  if (v12 != 2 && !v13)
  {
LABEL_20:
    LOBYTE(v3) = 0;
    if (v7 != 7)
      goto LABEL_28;
    goto LABEL_25;
  }
  -[PKTextInputHandwritingController _setActiveResultCommand:](self, "_setActiveResultCommand:", v10);
  -[PKTextInputHandwritingController _resultCommandsQueue](self, "_resultCommandsQueue");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "removeObjectAtIndex:", 0);

  if (v3)
  {
    if (v10[3] == 1)
    {
      -[PKTextInputResultCommand _setCommandState:]((uint64_t)v10, 2);
      LOBYTE(v3) = 1;
    }
    else
    {
      LOBYTE(v3) = 0;
    }
  }
  -[PKTextInputHandwritingController _activeInputTargetState](self, "_activeInputTargetState");
  v16 = (char *)objc_claimAutoreleasedReturnValue();
  -[PKTextInputResultCommand beginApplyingResultCommandWithInputTargetState:]((uint64_t)v10, v16);

LABEL_25:
  -[PKTextInputHandwritingController _writingSession](self, "_writingSession");
  v17 = (id *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17)
    -[PKTextInputWritingSession _evaluatePendingWritingEndedElements](v17);

  +[PKTextInputDebugStateIntrospector debugStateDidChange](PKTextInputDebugStateIntrospector, "debugStateDidChange");
LABEL_28:

  return v3;
}

- (void)_handleResultCommandFinished:(id)a3
{
  id *v4;
  id *v5;
  id v6;
  void *v7;
  id *v8;

  v8 = (id *)a3;
  -[PKTextInputHandwritingController _activeResultCommand](self, "_activeResultCommand");
  v4 = (id *)objc_claimAutoreleasedReturnValue();

  v5 = v8;
  if (v8 && (char *)v8[3] - 5 <= (char *)1)
  {
    v6 = v8[9];
    -[PKTextInputHandwritingController _setActiveInputTargetState:](self, "_setActiveInputTargetState:", v6);
    if (*((_BYTE *)v8 + 8))
    {
      -[PKTextInputHandwritingController debugLogController](self, "debugLogController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKTextInputDebugLogController logEntryForAppliedResult:]((uint64_t)v7, v8);

    }
    -[PKTextInputHandwritingController _scheduleCommitForResultCommandIfNeeded:](self, "_scheduleCommitForResultCommandIfNeeded:", v8);

    v5 = v8;
  }
  if (v4 == v5)
  {
    -[PKTextInputHandwritingController _setActiveResultCommand:](self, "_setActiveResultCommand:", 0);
    v5 = v8;
  }
  if (v5)
    objc_storeWeak(v8 + 2, 0);
  -[PKTextInputHandwritingController _evaluateAndProcessResultCommandsQueue](self, "_evaluateAndProcessResultCommandsQueue");
  -[PKTextInputHandwritingController _processPossibleShotIfReady](self, "_processPossibleShotIfReady");
  +[PKTextInputDebugStateIntrospector debugStateDidChange](PKTextInputDebugStateIntrospector, "debugStateDidChange");

}

- (void)_scheduleCommitForResultCommandIfNeeded:(id)a3
{
  id *v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  char v10;
  _QWORD *v11;
  _QWORD *v12;
  void *v13;
  id v14;
  id v15;
  char v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  double v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  double v27;
  PKTextInputResultCommand *v28;
  id v29;
  uint64_t v30;
  void *v31;
  id v32;
  void *v33;
  id *v34;
  id *v35;
  id *v36;

  v4 = (id *)a3;
  v36 = v4;
  if (v4)
    v5 = v4[5];
  else
    v5 = 0;
  v6 = v5;
  objc_msgSend(v6, "inputInProgressStroke");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKTextInputHandwritingController canvasController](self, "canvasController");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
    v10 = objc_msgSend(*(id *)(v8 + 96), "isDrawing");
  else
    v10 = 0;

  if (!v36)
  {
    v14 = 0;
    v12 = 0;
    v15 = 0;
    goto LABEL_33;
  }
  v11 = v36[9];
  v12 = v11;
  if (v11)
    v13 = (void *)v11[6];
  else
    v13 = 0;
  v14 = v13;
  v15 = v36[10];
  if (*((_BYTE *)v36 + 9))
  {
    v16 = objc_msgSend(v15, "length") ? 1 : v10;
    if ((v16 & 1) == 0 && !v7)
    {
      -[PKTextInputHandwritingController _possibleHandwritingShot](self, "_possibleHandwritingShot");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v17)
      {
        v18 = v36[4];
        objc_msgSend(v18, "correctionResult");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "languageSpec");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = -[PKTextInputLanguageSpec standardCommitDelay]((uint64_t)v20);

        if (!objc_msgSend(v19, "isCharacterLevel"))
        {
          v22 = objc_msgSend(v14, "length");
          v23 = objc_msgSend(v14, "length");
          if (v22 == 1)
          {
            v24 = objc_msgSend(v14, "characterAtIndex:", v23 - 1);
            objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(v24) = objc_msgSend(v25, "characterIsMember:", v24);

            if (!(_DWORD)v24)
              goto LABEL_23;
          }
          else if (v23 || v36[15] != (id)1)
          {
            objc_msgSend(v6, "recognitionDuration");
            v21 = fmax(v21 - v27, 0.0);
            goto LABEL_23;
          }
        }
        objc_msgSend(v6, "languageSpec");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = -[PKTextInputLanguageSpec singleCharacterCommitDelay]((uint64_t)v26);

LABEL_23:
        v28 = [PKTextInputResultCommand alloc];
        v29 = v36[4];
        v30 = -[PKTextInputResultCommand initWithQueryItem:handwritingShot:immediateCommitType:applyAfterDelay:]((uint64_t)v28, v29, v6, 1, v21);

        if (v30)
          objc_storeWeak((id *)(v30 + 16), self);
        if (v12)
          v31 = (void *)v12[7];
        else
          v31 = 0;
        v32 = v31;

        if (v30 && v32)
        {
          *(_QWORD *)(v30 + 112) = v36[14];
          *(_QWORD *)(v30 + 120) = 0;
        }
        -[PKTextInputHandwritingController _resultCommandsQueue](self, "_resultCommandsQueue");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "addObject:", v30);

        -[PKTextInputHandwritingController _writingSession](self, "_writingSession");
        v34 = (id *)objc_claimAutoreleasedReturnValue();
        v35 = v34;
        if (v34)
          -[PKTextInputWritingSession _evaluatePendingWritingEndedElements](v34);

        +[PKTextInputDebugStateIntrospector debugStateDidChange](PKTextInputDebugStateIntrospector, "debugStateDidChange");
      }
    }
  }
LABEL_33:

}

- (id)_pendingResultCommand
{
  void *v2;
  _QWORD *v3;
  uint64_t v4;
  void *i;
  _QWORD *v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[PKTextInputHandwritingController _resultCommandsQueue](self, "_resultCommandsQueue", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (_QWORD *)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v2);
        v6 = *(_QWORD **)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)i);
        if (v6 && v6[3] == 1)
        {
          v3 = v6;
          goto LABEL_12;
        }
      }
      v3 = (_QWORD *)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_12:

  return v3;
}

- (void)_cancelPendingResultCommand
{
  void *v2;
  id v3;

  -[PKTextInputHandwritingController _pendingResultCommand](self, "_pendingResultCommand");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    -[PKTextInputResultCommand cancelDelayedCommand]((uint64_t)v2);
    +[PKTextInputDebugStateIntrospector debugStateDidChange](PKTextInputDebugStateIntrospector, "debugStateDidChange");
    v2 = v3;
  }

}

- (void)resultCommandStateDidChange:(id)a3
{
  id *v4;
  char v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id *v10;
  id *v11;

  v4 = (id *)a3;
  v11 = v4;
  if (v4)
  {
    switch((unint64_t)v4[3])
    {
      case 2uLL:
        -[PKTextInputHandwritingController _evaluateAndProcessResultCommandsQueue](self, "_evaluateAndProcessResultCommandsQueue");
        v4 = v11;
        goto LABEL_6;
      case 3uLL:
      case 4uLL:
LABEL_6:
        v5 = 0;
        goto LABEL_7;
      case 5uLL:
      case 6uLL:
      case 7uLL:
        -[PKTextInputHandwritingController _handleResultCommandFinished:](self, "_handleResultCommandFinished:", v4);
        v4 = v11;
        goto LABEL_4;
      default:
LABEL_4:
        v5 = 1;
LABEL_7:
        v6 = v4[6];
        v7 = v6;
        if (v6)
          v8 = (void *)*((_QWORD *)v6 + 1);
        else
          v8 = 0;
        break;
    }
  }
  else
  {
    v7 = 0;
    v8 = 0;
    v5 = 1;
  }
  v9 = v8;

  if ((v5 & 1) == 0 && v9)
  {
    -[PKTextInputHandwritingController _writingSession](self, "_writingSession");
    v10 = (id *)objc_claimAutoreleasedReturnValue();
    -[PKTextInputWritingSession setCurrentTargetElement:](v10, v9);

  }
}

- (id)resultCommandSupportedElementDelegate:(id)a3
{
  void *v4;
  void *v5;

  -[PKTextInputHandwritingController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "supportedElementDelegateForHandwritingController:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_createPossibleHandwritingShotIfNeeded
{
  PKTextInputHandwritingShot *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _QWORD *v14;
  PKTextInputHandwritingShot *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  PKTextInputHandwritingShot *v30;
  __int16 v31;
  void *v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  -[PKTextInputHandwritingController _possibleHandwritingShot](self, "_possibleHandwritingShot");
  v4 = (PKTextInputHandwritingShot *)objc_claimAutoreleasedReturnValue();
  +[PKTextInputSettings sharedSettings](PKTextInputSettings, "sharedSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "recognitionLocaleIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    if (objc_msgSend(v6, "count"))
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 0u;
      v24 = 0u;
      v25 = 0u;
      v26 = 0u;
      v8 = v6;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v33, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v24;
        do
        {
          v12 = 0;
          do
          {
            if (*(_QWORD *)v24 != v11)
              objc_enumerationMutation(v8);
            objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v12), (_QWORD)v23);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "addObject:", v13);

            ++v12;
          }
          while (v10 != v12);
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v33, 16);
        }
        while (v10);
      }

      v14 = -[PKTextInputLanguageSpec initWithLocales:]([PKTextInputLanguageSpec alloc], v7);
      v15 = [PKTextInputHandwritingShot alloc];
      -[PKTextInputHandwritingController canvasController](self, "canvasController");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKTextInputHandwritingController elementsController](self, "elementsController");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = -[PKTextInputHandwritingShot initWithCanvasController:elementsController:languageSpec:](v15, "initWithCanvasController:elementsController:languageSpec:", v16, v17, v14);

      -[PKTextInputHandwritingShot setDelegate:](v4, "setDelegate:", self);
      -[PKTextInputHandwritingShot setWritingIsActiveAtStart:](v4, "setWritingIsActiveAtStart:", -[PKTextInputHandwritingController writingState](self, "writingState") == 1);
      -[PKTextInputHandwritingController cursorController](self, "cursorController");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKTextInputHandwritingShot setCursorIsWeakAtStart:](v4, "setCursorIsWeakAtStart:", objc_msgSend(v18, "isCursorWeak"));

      -[PKTextInputHandwritingController cursorController](self, "cursorController");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKTextInputHandwritingShot setCursorIsForcedStrongAtStart:](v4, "setCursorIsForcedStrongAtStart:", objc_msgSend(v19, "forceStrong"));

      v20 = os_log_create("com.apple.pencilkit", "PencilTextInput");
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(a2);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKTextInputHandwritingController _activeHandwritingShot](self, "_activeHandwritingShot");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v28 = v21;
        v29 = 2112;
        v30 = v4;
        v31 = 2112;
        v32 = v22;
        _os_log_debug_impl(&dword_1BE213000, v20, OS_LOG_TYPE_DEBUG, "HWController %@: created possible shot: %@, active shot: %@", buf, 0x20u);

      }
      -[PKTextInputHandwritingController _setPossibleHandwritingShot:](self, "_setPossibleHandwritingShot:", v4);

    }
    else
    {
      v4 = 0;
    }
  }

}

- (void)_processPossibleShotIfReady
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  -[PKTextInputHandwritingController _possibleHandwritingShot](self, "_possibleHandwritingShot");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4
    && objc_msgSend(v4, "shotState") == 2
    && (-[PKTextInputHandwritingController _activeHandwritingShot](self, "_activeHandwritingShot"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        !v6)
    && (-[PKTextInputHandwritingController _activeResultCommand](self, "_activeResultCommand"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        !v7))
  {
    -[PKTextInputHandwritingController _resultCommandsQueue](self, "_resultCommandsQueue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");

    -[PKTextInputHandwritingController _pendingResultCommand](self, "_pendingResultCommand");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10 == (v8 != 0))
    {
      v11 = os_log_create("com.apple.pencilkit", "PencilTextInput");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        NSStringFromSelector(a2);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKTextInputHandwritingController _activeHandwritingShot](self, "_activeHandwritingShot");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 138412802;
        v20 = v17;
        v21 = 2112;
        v22 = v5;
        v23 = 2112;
        v24 = v18;
        _os_log_debug_impl(&dword_1BE213000, v11, OS_LOG_TYPE_DEBUG, "HWController %@: promoting possibleShot to active: %@, old activeShot: %@", (uint8_t *)&v19, 0x20u);

      }
      -[PKTextInputHandwritingController _setActiveHandwritingShot:](self, "_setActiveHandwritingShot:", v5);
      -[PKTextInputHandwritingController _setPossibleHandwritingShot:](self, "_setPossibleHandwritingShot:", 0);
      -[PKTextInputHandwritingController _updateRecognitionManager](self, "_updateRecognitionManager");
      -[PKTextInputHandwritingController _recognitionManager](self, "_recognitionManager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKTextInputHandwritingController _writingSession](self, "_writingSession");
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = (void *)v13;
      if (v13)
        v15 = *(void **)(v13 + 32);
      else
        v15 = 0;
      v16 = v15;
      objc_msgSend(v5, "setWritingSessionIdentifier:", v16);

      objc_msgSend(v5, "beginRecognitionWithRecognitionManager:", v12);
      if (v8)
        -[PKTextInputHandwritingController _cancelPendingResultCommand](self, "_cancelPendingResultCommand");
    }
  }
  else
  {
    v8 = 0;
  }

}

- (void)_handleActiveHandwritingShotRecognitionFinished
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id *v15;
  id *v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t v24[128];
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = os_log_create("com.apple.pencilkit", "PencilTextInput");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKTextInputHandwritingController _activeHandwritingShot](self, "_activeHandwritingShot");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKTextInputHandwritingController _possibleHandwritingShot](self, "_possibleHandwritingShot");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v26 = v17;
    v27 = 2112;
    v28 = v18;
    v29 = 2112;
    v30 = v19;
    _os_log_debug_impl(&dword_1BE213000, v4, OS_LOG_TYPE_DEBUG, "HWController %@: will process active shot: %@, possibleShot: %@", buf, 0x20u);

  }
  -[PKTextInputHandwritingController _activeHandwritingShot](self, "_activeHandwritingShot");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if ((objc_msgSend(v5, "isCancelled") & 1) != 0)
    {
      v7 = 0;
    }
    else
    {
      objc_msgSend(v6, "resultQueryItems");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v8 = v7;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v21;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v21 != v11)
            objc_enumerationMutation(v8);
          -[PKTextInputHandwritingController _resultCommandToProcessQueryItem:handwritingShot:](self, "_resultCommandToProcessQueryItem:handwritingShot:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v12), v6, (_QWORD)v20);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13)
          {
            -[PKTextInputHandwritingController _resultCommandsQueue](self, "_resultCommandsQueue");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "addObject:", v13);

            -[PKTextInputHandwritingController _writingSession](self, "_writingSession");
            v15 = (id *)objc_claimAutoreleasedReturnValue();
            v16 = v15;
            if (v15)
              -[PKTextInputWritingSession _evaluatePendingWritingEndedElements](v15);

          }
          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v10);
    }

    +[PKTextInputDebugStateIntrospector debugStateDidChange](PKTextInputDebugStateIntrospector, "debugStateDidChange");
    -[PKTextInputHandwritingController _evaluateAndProcessResultCommandsQueue](self, "_evaluateAndProcessResultCommandsQueue");

  }
}

- (id)_resultCommandToProcessQueryItem:(id)a3 handwritingShot:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  id v29;
  void *v30;
  uint64_t v31;
  void *v33;
  id v34;
  PKTextInputHandwritingController *v35;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint64_t v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "strokeIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "strokeProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "resultQueryItems");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v11 = v8;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
  if (v12)
  {
    v13 = v12;
    v35 = self;
    v36 = *(_QWORD *)v42;
    v33 = v10;
    v34 = v6;
    while (2)
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v42 != v36)
          objc_enumerationMutation(v11);
        v46 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v46, 1, v33, v34);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "strokesForSliceIdentifiers:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "anyObject");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v17)
          goto LABEL_24;
        objc_msgSend(v7, "inputInProgressStroke");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "isEqual:", v17);

        if ((v19 & 1) == 0)
        {
          v20 = v7;
          v21 = v9;
          v22 = v11;
          v39 = 0u;
          v40 = 0u;
          v37 = 0u;
          v38 = 0u;
          -[PKTextInputHandwritingController _lastKnownDrawing](v35, "_lastKnownDrawing");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "strokes");
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
          if (v25)
          {
            v26 = v25;
            v27 = *(_QWORD *)v38;
            while (2)
            {
              for (j = 0; j != v26; ++j)
              {
                if (*(_QWORD *)v38 != v27)
                  objc_enumerationMutation(v24);
                if ((objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * j), "isEqual:", v17) & 1) != 0)
                {

                  v11 = v22;
                  v9 = v21;
                  v7 = v20;
                  goto LABEL_18;
                }
              }
              v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
              if (v26)
                continue;
              break;
            }
          }

          v11 = v22;
          v9 = v21;
          v7 = v20;
LABEL_24:

          v30 = 0;
          v10 = v33;
          v6 = v34;
          goto LABEL_27;
        }
LABEL_18:

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
      v10 = v33;
      v6 = v34;
      self = v35;
      if (v13)
        continue;
      break;
    }
  }

  if ((unint64_t)objc_msgSend(v10, "count") < 2
    || (objc_msgSend(v10, "firstObject"), v29 = (id)objc_claimAutoreleasedReturnValue(), v29, v29 == v6))
  {
    v31 = -[PKTextInputResultCommand initWithQueryItem:handwritingShot:immediateCommitType:applyAfterDelay:]((uint64_t)[PKTextInputResultCommand alloc], v6, v7, -[PKTextInputHandwritingController _immediateCommitTypeForQueryItem:handwritingShot:](self, "_immediateCommitTypeForQueryItem:handwritingShot:", v6, v7), 0.0);
    v30 = (void *)v31;
    if (v31)
      objc_storeWeak((id *)(v31 + 16), self);
  }
  else
  {
    v30 = 0;
  }
LABEL_27:

  return v30;
}

- (int64_t)_immediateCommitTypeForQueryItem:(id)a3 handwritingShot:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int64_t v11;
  _QWORD *v12;
  void *v13;
  void *v14;
  void *v15;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "resultQueryItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "correctionResult");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "inputTarget");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "inputTargetIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v7, "count") <= 1)
  {
    if (v10)
    {
      objc_msgSend(v6, "textInputElementForRecognitionIdentifier:", v10);
      v12 = (_QWORD *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "inputInProgressStroke");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = 0;
      if (v12 && !v13)
      {
        v14 = (void *)objc_opt_class();
        objc_msgSend(v5, "correctionResult");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v14) = objc_msgSend(v14, "_isCorrectionResultGesture:", v15);

        if ((_DWORD)v14 && -[PKTextInputElement shouldPostponeFocusing](v12))
        {
          if (-[PKTextInputElement isFocused]((uint64_t)v12))
            v11 = 0;
          else
            v11 = 3;
        }
        else
        {
          v11 = 0;
        }
      }

    }
    else
    {
      v11 = 0;
    }
  }
  else
  {
    v11 = 2;
  }

  return v11;
}

- (double)_continuousRecognitionInterval
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  double *v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  BOOL v18;
  double v19;
  uint64_t v20;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  unint64_t v26;

  -[PKTextInputHandwritingController _activeInputTargetState](self, "_activeInputTargetState");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
    v5 = *(void **)(v3 + 24);
  else
    v5 = 0;
  v6 = v5;
  objc_msgSend(v6, "correctionResult");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v9 = v8;
  -[PKTextInputHandwritingController _activeInputTargetState](self, "_activeInputTargetState");
  v10 = (double *)objc_claimAutoreleasedReturnValue();
  if (v10)
    v11 = v10[12];
  else
    v11 = 0.0;

  +[PKTextInputSettings sharedSettings](PKTextInputSettings, "sharedSettings");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "continuousRecognitionWritingInterval");
  v14 = v13;

  if (v7)
  {
    v15 = 0.3;
    if (v14 >= 0.3)
      v16 = v14;
    else
      v16 = 0.3;
    v17 = v16 + 0.5;
    v18 = v16 < 0.1;
    v19 = 0.6;
    if (!v18)
      v19 = v17;
    if (v9 - v11 < v19)
    {
      v20 = objc_msgSend(v7, "resultType");
      if ((unint64_t)(v20 - 2) >= 7 && v20)
      {
        if (v20 == 1)
        {
          -[PKTextInputHandwritingController _activeInputTargetState](self, "_activeInputTargetState");
          v22 = objc_claimAutoreleasedReturnValue();
          v23 = (void *)v22;
          if (v22)
            v24 = *(void **)(v22 + 48);
          else
            v24 = 0;
          v25 = v24;
          v26 = objc_msgSend(v25, "length");

          if (v26 <= 2)
            v15 = 0.3;
          else
            v15 = v14;
        }
      }
      else
      {
        v15 = 0.1;
      }
    }
  }
  else
  {
    v15 = 0.3;
  }

  return v15;
}

- (void)handwritingShotDidChangeState:(id)a3
{
  uint64_t v4;
  id v5;
  id v6;
  id v7;

  v7 = a3;
  v4 = objc_msgSend(v7, "shotState");
  if (v4 == 4)
  {
    -[PKTextInputHandwritingController _activeHandwritingShot](self, "_activeHandwritingShot");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    if (v6 == v7)
    {
      -[PKTextInputHandwritingController _handleActiveHandwritingShotRecognitionFinished](self, "_handleActiveHandwritingShotRecognitionFinished");
      -[PKTextInputHandwritingController _setActiveHandwritingShot:](self, "_setActiveHandwritingShot:", 0);
LABEL_7:
      -[PKTextInputHandwritingController _processPossibleShotIfReady](self, "_processPossibleShotIfReady");
    }
  }
  else if (v4 == 2)
  {
    -[PKTextInputHandwritingController _possibleHandwritingShot](self, "_possibleHandwritingShot");
    v5 = (id)objc_claimAutoreleasedReturnValue();

    if (v5 == v7)
      goto LABEL_7;
  }

}

- (void)handwritingShotDidOverrideStrongCursor:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[PKTextInputHandwritingController cursorController](self, "cursorController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "forceStrong");

  if ((v5 & 1) == 0)
  {
    -[PKTextInputHandwritingController cursorController](self, "cursorController");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "makeCursorWeak");

  }
}

- (id)handwritingShot:(id)a3 preferredTargetElementForQueryItemStableIdentifier:(id)a4 simultaneousItemStableIdentifiers:(id)a5 proposedTargetElement:(id)a6
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;

  v9 = a3;
  v10 = a4;
  v11 = a6;
  -[PKTextInputHandwritingController _activeInputTargetState](self, "_activeInputTargetState");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
    v14 = *(void **)(v12 + 16);
  else
    v14 = 0;
  v15 = v14;
  v16 = v15;
  v17 = v11;
  if (v13)
  {
    v17 = v11;
    if (v15)
    {
      v18 = *(id *)(v13 + 24);
      objc_msgSend(v18, "itemStableIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v17 = v11;
      if (v19)
      {
        v17 = v11;
        if (objc_msgSend(v10, "isEqualToNumber:", v19))
        {
          v20 = *(id *)(v13 + 48);
          objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "stringByTrimmingCharactersInSet:", v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v22, "length");

          v17 = v11;
          if (*(_QWORD *)(v13 + 64) + v23 >= 2)
          {
            objc_msgSend(v9, "textInputElementForRecognitionIdentifier:", v16);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = v24;
            v17 = v11;
            if (v24)
            {
              v17 = v24;

            }
          }
        }
      }

    }
  }

  return v17;
}

- (void)handwritingShot:(id)a3 willFocusAndLoadDataForTargetElement:(id)a4
{
  void *v5;
  _QWORD *v6;
  id WeakRetained;
  id *v8;
  id *v9;
  id *v10;

  v10 = (id *)a4;
  +[PKEmojiAlternativesGenerator sharedInstance]();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKEmojiAlternativesGenerator cancelScheduledTasks]((uint64_t)v5);

  +[PKEmojiAlternativesGenerator sharedInstance]();
  v6 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    -[PKEmojiAlternativesGenerator clearExistingAlternativesForTextInput:](v6, 0);

    -[PKTextInputHandwritingController _writingSession](self, "_writingSession");
    v9 = (id *)objc_claimAutoreleasedReturnValue();
    -[PKTextInputWritingSession setCurrentTargetElement:](v9, 0);
    goto LABEL_4;
  }
  WeakRetained = objc_loadWeakRetained(v10 + 13);
  -[PKEmojiAlternativesGenerator clearExistingAlternativesForTextInput:](v6, (uint64_t)WeakRetained);

  -[PKTextInputHandwritingController _writingSession](self, "_writingSession");
  v8 = (id *)objc_claimAutoreleasedReturnValue();
  -[PKTextInputWritingSession setCurrentTargetElement:](v8, v10);

  if ((-[PKTextInputElement isFocused]((uint64_t)v10) & 1) == 0)
  {
    -[PKTextInputHandwritingController cursorController](self, "cursorController");
    v9 = (id *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "makeCursorWeak");
LABEL_4:

  }
}

- (_NSRange)handwritingShot:(id)a3 activePreviewRangeForElementRecognitionIdentifier:(id)a4 queryItemStableIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  _QWORD *v12;
  void *v13;
  id v14;
  int v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  uint64_t v25;
  NSUInteger v26;
  NSUInteger v27;
  NSUInteger v28;
  NSUInteger v29;
  _NSRange result;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[PKTextInputHandwritingController _activeInputTargetState](self, "_activeInputTargetState");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (_QWORD *)v11;
  if (v11)
    v13 = *(void **)(v11 + 16);
  else
    v13 = 0;
  v14 = v13;
  v15 = objc_msgSend(v14, "isEqualToNumber:", v9);

  if (!v15)
    goto LABEL_13;
  if (!v10)
    goto LABEL_11;
  v16 = v12 ? (void *)v12[3] : 0;
  v17 = v16;
  objc_msgSend(v17, "itemStableIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
    goto LABEL_11;
  v19 = v12 ? (void *)v12[3] : 0;
  v20 = v19;
  objc_msgSend(v20, "itemStableIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v10, "isEqualToNumber:", v21);

  if (!v22)
  {
LABEL_13:
    v27 = 0;
    v25 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
LABEL_11:
    objc_msgSend(v8, "textInputElementForRecognitionIdentifier:", v9);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (v23)
    {
      v25 = objc_msgSend(v23, "activePreviewRange");
      v27 = v26;
    }
    else
    {
      v27 = 0;
      v25 = 0x7FFFFFFFFFFFFFFFLL;
    }

  }
  v28 = v25;
  v29 = v27;
  result.length = v29;
  result.location = v28;
  return result;
}

- (BOOL)handwritingShot:(id)a3 hasCommittedResultsInSessionToElementRecognitionIdentifier:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  _QWORD *v9;
  void *v10;
  id v11;
  char v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  int v18;
  BOOL v19;

  v6 = a3;
  v7 = a4;
  -[PKTextInputHandwritingController _activeInputTargetState](self, "_activeInputTargetState");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (_QWORD *)v8;
  if (v8)
    v10 = *(void **)(v8 + 16);
  else
    v10 = 0;
  v11 = v10;
  v12 = objc_msgSend(v11, "isEqualToNumber:", v7);

  if ((v12 & 1) != 0
    && (objc_msgSend(v6, "writingSessionIdentifier"), (v13 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v14 = (void *)v13;
    if (v9)
      v15 = (void *)v9[5];
    else
      v15 = 0;
    v16 = v15;
    objc_msgSend(v6, "writingSessionIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v16, "isEqualToNumber:", v17);

    v19 = 0;
    if (v9 && v18)
      v19 = v9[8] > 0;
  }
  else
  {

    v19 = 0;
  }

  return v19;
}

- (int64_t)handwritingShot:(id)a3 lastCharacterLevelPositionForElementRecognitionIdentifier:(id)a4
{
  id v5;
  uint64_t v6;
  _QWORD *v7;
  void *v8;
  id v9;
  int v10;
  int64_t v11;

  v5 = a4;
  -[PKTextInputHandwritingController _activeInputTargetState](self, "_activeInputTargetState");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (_QWORD *)v6;
  if (v6)
    v8 = *(void **)(v6 + 16);
  else
    v8 = 0;
  v9 = v8;
  v10 = objc_msgSend(v9, "isEqualToNumber:", v5);

  if (v10)
    v11 = 0;
  else
    v11 = 0x7FFFFFFFFFFFFFFFLL;
  if (v7 && v10)
    v11 = v7[9];

  return v11;
}

- (_NSRange)handwritingShot:(id)a3 inProgressGestureInitialSelectedRangeForElementRecognitionIdentifier:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  _QWORD *v9;
  void *v10;
  id v11;
  int v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  int v18;
  uint64_t v19;
  NSUInteger v20;
  NSUInteger v21;
  _NSRange result;

  v6 = a3;
  v7 = a4;
  -[PKTextInputHandwritingController _activeInputTargetState](self, "_activeInputTargetState");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (_QWORD *)v8;
  if (v8)
    v10 = *(void **)(v8 + 16);
  else
    v10 = 0;
  v11 = v10;
  v12 = objc_msgSend(v11, "isEqualToNumber:", v7);

  if (v12)
  {
    objc_msgSend(v6, "strokeProvider");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
      v14 = (void *)v9[10];
    else
      v14 = 0;
    v15 = v14;

    if (v15)
    {
      if (v9)
        v16 = (void *)v9[10];
      else
        v16 = 0;
      v17 = v16;
      v18 = objc_msgSend(v13, "containsStrokeWithUUID:", v17);

      v15 = 0;
      if (v18)
        v19 = 0;
      else
        v19 = 0x7FFFFFFFFFFFFFFFLL;
      if (v9 && v18)
      {
        v19 = v9[13];
        v15 = (id)v9[14];
      }
    }
    else
    {
      v19 = 0x7FFFFFFFFFFFFFFFLL;
    }

  }
  else
  {
    v15 = 0;
    v19 = 0x7FFFFFFFFFFFFFFFLL;
  }

  v20 = v19;
  v21 = (NSUInteger)v15;
  result.length = v21;
  result.location = v20;
  return result;
}

- (id)handwritingShotStrokeIdentifiersToExcludeFromRecognition:(id)a3
{
  uint64_t v3;
  void *v4;
  void *v5;

  -[PKTextInputHandwritingController canvasController](self, "canvasController", a3);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
    v5 = (void *)objc_msgSend(*(id *)(v3 + 8), "copy");
  else
    v5 = 0;

  return v5;
}

- (BOOL)handwritingShot:(id)a3 shouldSuppressGesturesForStrokesBounds:(CGRect)a4 coordinateSpace:(id)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v10;
  unsigned __int8 *v11;
  int v12;
  BOOL v13;
  void *v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  _BYTE *v23;
  CGRect v25;
  CGRect v26;
  CGRect v27;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v10 = a5;
  -[PKTextInputHandwritingController _writingSession](self, "_writingSession");
  v11 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
  if (!v11 || (v12 = v11[24], v11, !v12))
  {
    -[PKTextInputHandwritingController reserveSpaceController](self, "reserveSpaceController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "placeholderFrameInCoordinateSpace:", v10);
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v22 = v21;

    v25.origin.x = v16;
    v25.origin.y = v18;
    v25.size.width = v20;
    v25.size.height = v22;
    if (CGRectIsNull(v25))
      goto LABEL_9;
    v26.origin.x = v16;
    v26.origin.y = v18;
    v26.size.width = v20;
    v26.size.height = v22;
    v27.origin.x = x;
    v27.origin.y = y;
    v27.size.width = width;
    v27.size.height = height;
    if (!CGRectIntersectsRect(v26, v27))
    {
LABEL_9:
      v13 = 0;
      goto LABEL_10;
    }
    -[PKTextInputHandwritingController _writingSession](self, "_writingSession");
    v23 = (_BYTE *)objc_claimAutoreleasedReturnValue();
    if (v23)
      v23[24] = 1;

  }
  v13 = 1;
LABEL_10:

  return v13;
}

- (BOOL)writingSession:(id)a3 elementHasPendingOperations:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  char v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id *v14;
  unsigned __int8 v15;
  uint64_t v16;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  void *v23;
  void *v24;
  id *v25;
  unsigned __int8 v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  -[PKTextInputHandwritingController _possibleHandwritingShot](self, "_possibleHandwritingShot");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    goto LABEL_7;
  -[PKTextInputHandwritingController _activeHandwritingShot](self, "_activeHandwritingShot");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isPotentiallyTargetingElement:", v5);

  if ((v8 & 1) != 0)
    goto LABEL_7;
  -[PKTextInputHandwritingController _activeResultCommand](self, "_activeResultCommand");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v9)
  {
    v11 = *(id *)(v9 + 48);
    v12 = v11;
    if (v11)
    {
      v13 = (void *)*((_QWORD *)v11 + 1);
      goto LABEL_6;
    }
  }
  else
  {
    v12 = 0;
  }
  v13 = 0;
LABEL_6:
  v14 = v13;
  v15 = -[PKTextInputElement isEquivalentToElement:](v14, v5);

  if ((v15 & 1) == 0)
  {
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    -[PKTextInputHandwritingController _resultCommandsQueue](self, "_resultCommandsQueue", 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (!v16)
      goto LABEL_26;
    v19 = *(_QWORD *)v29;
    while (1)
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v29 != v19)
          objc_enumerationMutation(v18);
        v21 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v20);
        if (v21)
        {
          if (*(_QWORD *)(v21 + 24) == 7)
            goto LABEL_19;
          v22 = *(id *)(v21 + 48);
          v23 = v22;
          if (v22)
          {
            v24 = (void *)*((_QWORD *)v22 + 1);
            goto LABEL_18;
          }
        }
        else
        {
          v23 = 0;
        }
        v24 = 0;
LABEL_18:
        v25 = v24;
        v26 = -[PKTextInputElement isEquivalentToElement:](v25, v5);

        if ((v26 & 1) != 0)
        {
          LOBYTE(v16) = 1;
          goto LABEL_26;
        }
LABEL_19:
        ++v20;
      }
      while (v16 != v20);
      v27 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      v16 = v27;
      if (!v27)
      {
LABEL_26:

        goto LABEL_8;
      }
    }
  }
LABEL_7:
  LOBYTE(v16) = 1;
LABEL_8:

  return v16;
}

- (void)writingSession:(id)a3 didInsertTextInElement:(id)a4
{
  id *v4;
  void *v5;
  void *v6;
  id WeakRetained;
  id v8;

  v4 = (id *)a4;
  +[PKTextInputLanguageSelectionController sharedInstance](PKTextInputLanguageSelectionController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentLanguageIdentifiersForEmojiAlternatives");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  +[PKEmojiAlternativesGenerator sharedInstance]();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    WeakRetained = objc_loadWeakRetained(v4 + 13);
  else
    WeakRetained = 0;

  -[PKEmojiAlternativesGenerator scheduleGenerateAlternativesForTextInput:localeIdentifiers:]((uint64_t)v6, WeakRetained, v8);
}

- (BOOL)_wantsFloatingBackground
{
  uint64_t v3;
  _QWORD *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  id *v35;
  void *v36;
  double v37;
  double v38;
  CGFloat v39;
  double v40;
  CGFloat v41;
  double v42;
  CGFloat v43;
  void *v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;

  -[PKTextInputHandwritingController _activeInputTargetState](self, "_activeInputTargetState");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (_QWORD *)v3;
  if (v3)
    v5 = *(void **)(v3 + 24);
  else
    v5 = 0;
  v6 = v5;
  objc_msgSend(v6, "correctionResult");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    v8 = (void *)v4[4];
  else
    v8 = 0;
  v9 = v8;
  objc_msgSend(v9, "strokeProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v11 = (void *)v4[3];
  else
    v11 = 0;
  v12 = v11;
  objc_msgSend(v7, "inputTarget");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "inputTargetIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  +[PKTextInputSettings sharedSettings](PKTextInputSettings, "sharedSettings");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "floatingBackgroundEnabled");

  LOBYTE(v17) = 0;
  if (v9 && v16 && v7 && v10 && v12 && v14)
  {
    if (objc_msgSend(v7, "resultType") == 1)
    {
      objc_msgSend(v12, "strokeIdentifiers");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "boundsForSliceIdentifiers:", v18);
      v20 = v19;
      v22 = v21;
      v24 = v23;
      v26 = v25;
      objc_msgSend(v9, "textInputElementForRecognitionIdentifier:", v14);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKTextInputElement coordinateSpace]((uint64_t)v27);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        v28 = -[PKTextInputElement frame]((uint64_t)v27);
        v30 = v29;
        v32 = v31;
        v34 = v33;
        -[PKTextInputElement coordinateSpace]((uint64_t)v27);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKTextInputHandwritingController canvasController](self, "canvasController");
        v35 = (id *)objc_claimAutoreleasedReturnValue();
        -[PKTextInputCanvasController canvasCoordinateSpace](v35);
        v45 = v18;
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = PK_convertRectFromCoordinateSpaceToCoordinateSpace(v17, v36, v28, v30, v32, v34);
        v39 = v38;
        v41 = v40;
        v43 = v42;

        v18 = v45;
        v46.origin.x = v37;
        v46.origin.y = v39;
        v46.size.width = v41;
        v46.size.height = v43;
        v48.origin.x = v20;
        v48.origin.y = v22;
        v48.size.width = v24;
        v48.size.height = v26;
        v47 = CGRectIntersection(v46, v48);
        LOBYTE(v17) = v24 * v26 - v47.size.width * v47.size.height >= v24 * v26 * 0.8;
      }

    }
    else
    {
      LOBYTE(v17) = 0;
    }
  }

  return (char)v17;
}

- (void)_updateFloatingBackground
{
  _BOOL4 v3;
  double x;
  double y;
  double width;
  double height;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  void *v12;
  void *v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  void *v18;
  void *v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  double v24;
  double v25;
  _BOOL4 v26;
  _BOOL4 v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double MaxX;
  double v43;
  double MaxY;
  double v45;
  double v46;
  double MinX;
  double v48;
  double v49;
  double MinY;
  double v51;
  double v52;
  double *v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;
  CGRect v78;
  CGRect v79;
  CGRect v80;
  CGRect v81;

  -[PKTextInputHandwritingController canvasController](self, "canvasController");
  v53 = (double *)objc_claimAutoreleasedReturnValue();
  v3 = -[PKTextInputHandwritingController _wantsFloatingBackground](self, "_wantsFloatingBackground");
  x = *MEMORY[0x1E0C9D628];
  y = *(double *)(MEMORY[0x1E0C9D628] + 8);
  width = *(double *)(MEMORY[0x1E0C9D628] + 16);
  height = *(double *)(MEMORY[0x1E0C9D628] + 24);
  if (v3)
  {
    if (v53)
    {
      v9 = v53[14];
      v8 = v53[15];
      v10 = v53[16];
      v11 = v53[17];
    }
    else
    {
      v8 = 0.0;
      v10 = 0.0;
      v11 = 0.0;
      v9 = 0.0;
    }
    -[PKTextInputCanvasController inProgressStroke]((uint64_t)v53);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12 && objc_msgSend(v12, "_pointsCount"))
    {
      objc_msgSend(v13, "_bounds");
      v80.origin.x = v14;
      v80.origin.y = v15;
      v80.size.width = v16;
      v80.size.height = v17;
      v54.origin.x = x;
      v54.origin.y = y;
      v54.size.width = width;
      v54.size.height = height;
      v55 = CGRectUnion(v54, v80);
      x = v55.origin.x;
      y = v55.origin.y;
      width = v55.size.width;
      height = v55.size.height;
    }
    -[PKTextInputHandwritingController _lastKnownDrawing](self, "_lastKnownDrawing");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      -[PKTextInputHandwritingController _lastKnownDrawing](self, "_lastKnownDrawing");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "bounds");
      v81.origin.x = v20;
      v81.origin.y = v21;
      v81.size.width = v22;
      v81.size.height = v23;
      v56.origin.x = x;
      v56.origin.y = y;
      v56.size.width = width;
      v56.size.height = height;
      v57 = CGRectUnion(v56, v81);
      x = v57.origin.x;
      y = v57.origin.y;
      width = v57.size.width;
      height = v57.size.height;

    }
    v58.origin.x = x;
    v58.origin.y = y;
    v58.size.width = width;
    v58.size.height = height;
    if (!CGRectIsNull(v58))
    {
      y = y + -15.0;
      x = x + -20.0;
      height = height + 35.0;
      width = width + 170.0;
    }
    v59.origin.x = x;
    v59.origin.y = y;
    v59.size.width = width;
    v59.size.height = height;
    if (!CGRectIsNull(v59))
    {
      v60.origin.x = v9;
      v60.origin.y = v8;
      v60.size.width = v10;
      v60.size.height = v11;
      if (!CGRectIsNull(v60))
      {
        v61.origin.x = v9;
        v61.origin.y = v8;
        v61.size.width = v10;
        v61.size.height = v11;
        if (!CGRectIsEmpty(v61))
        {
          v62.origin.x = v9;
          v62.origin.y = v8;
          v62.size.width = v10;
          v62.size.height = v11;
          MinY = CGRectGetMinY(v62);
          v63.origin.x = x;
          v63.origin.y = y;
          v63.size.width = width;
          v63.size.height = height;
          v51 = MinY - CGRectGetMinY(v63);
          v64.origin.x = v9;
          v64.origin.y = v8;
          v64.size.width = v10;
          v64.size.height = v11;
          MinX = CGRectGetMinX(v64);
          v65.origin.x = x;
          v65.origin.y = y;
          v65.size.width = width;
          v65.size.height = height;
          v48 = MinX - CGRectGetMinX(v65);
          v66.origin.x = x;
          v66.origin.y = y;
          v66.size.width = width;
          v66.size.height = height;
          MaxY = CGRectGetMaxY(v66);
          v67.origin.x = v9;
          v67.origin.y = v8;
          v67.size.width = v10;
          v67.size.height = v11;
          v45 = MaxY - CGRectGetMaxY(v67);
          v68.origin.x = x;
          v68.origin.y = y;
          v68.size.width = width;
          v68.size.height = height;
          MaxX = CGRectGetMaxX(v68);
          v69.origin.x = v9;
          v69.origin.y = v8;
          v69.size.width = v10;
          v69.size.height = v11;
          v24 = MaxX - CGRectGetMaxX(v69);
          v25 = v51;
          v26 = v51 < 0.0;
          v27 = v51 > -40.0;
          v28 = -0.0;
          if (v26 && v27)
            v29 = v51;
          else
            v29 = -0.0;
          y = y + v29;
          if (!v26 || !v27)
            v25 = 0.0;
          v30 = height - v25;
          if (v48 < 0.0)
            v28 = v48;
          x = x + v28;
          v31 = width - fmin(v48, 0.0);
          if (v45 > -40.0 && v45 < 0.0)
            v33 = v45;
          else
            v33 = 0.0;
          height = v30 - v33;
          width = v31 - fmin(v24, 0.0);
        }
      }
    }
    v70.origin.x = v9;
    v70.origin.y = v8;
    v70.size.width = v10;
    v70.size.height = v11;
    if (CGRectIsNull(v70))
      goto LABEL_42;
    v71.origin.x = v9;
    v71.origin.y = v8;
    v71.size.width = v10;
    v71.size.height = v11;
    if (CGRectIsEmpty(v71))
      goto LABEL_42;
    v72.origin.x = v9;
    v72.origin.y = v8;
    v72.size.width = v10;
    v72.size.height = v11;
    v52 = CGRectGetMinY(v72);
    v73.origin.x = x;
    v73.origin.y = y;
    v73.size.width = width;
    v73.size.height = height;
    v49 = CGRectGetMinY(v73);
    v74.origin.x = v9;
    v74.origin.y = v8;
    v74.size.width = v10;
    v74.size.height = v11;
    v46 = CGRectGetMinX(v74);
    v75.origin.x = x;
    v75.origin.y = y;
    v75.size.width = width;
    v75.size.height = height;
    v43 = CGRectGetMinX(v75);
    v76.origin.x = x;
    v76.origin.y = y;
    v76.size.width = width;
    v76.size.height = height;
    v41 = CGRectGetMaxY(v76);
    v77.origin.x = v9;
    v77.origin.y = v8;
    v77.size.width = v10;
    v77.size.height = v11;
    v40 = CGRectGetMaxY(v77);
    v78.origin.x = x;
    v78.origin.y = y;
    v78.size.width = width;
    v78.size.height = height;
    v39 = CGRectGetMaxX(v78);
    v79.origin.x = v9;
    v79.origin.y = v8;
    v79.size.width = v10;
    v79.size.height = v11;
    v34 = CGRectGetMaxX(v79);
    v35 = v52 - v49;
    if (v52 - v49 < 0.0)
      v35 = -(v52 - v49);
    if (v35 > 12.0)
      goto LABEL_42;
    v36 = -(v46 - v43);
    if (v46 - v43 >= 0.0)
      v36 = v46 - v43;
    if (v36 > 16.0)
      goto LABEL_42;
    v37 = v41 - v40;
    if (v41 - v40 < 0.0)
      v37 = -(v41 - v40);
    if (v37 > 16.0)
      goto LABEL_42;
    v38 = v39 - v34;
    if (v38 < 0.0)
      v38 = -v38;
    if (v38 > 120.0)
    {
LABEL_42:
      v8 = y;
      v11 = height;
      v10 = width;
      v9 = x;
    }

    height = v11;
    width = v10;
    y = v8;
    x = v9;
  }
  -[PKTextInputCanvasController setFloatingBackgroundRect:]((uint64_t)v53, x, y, width, height);

}

- (void)_updateStrokeAlphaOverride
{
  _QWORD *v3;
  uint64_t v4;
  double v5;
  double v6;
  double *v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  _QWORD *v16;
  uint64_t v17;
  id v18;

  -[PKTextInputHandwritingController _activeInputTargetState](self, "_activeInputTargetState");
  v3 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  if (v3 && (v4 = v3[16], v3, v4))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    v6 = v5;
    -[PKTextInputHandwritingController _activeInputTargetState](self, "_activeInputTargetState");
    v7 = (double *)objc_claimAutoreleasedReturnValue();
    if (v7)
      v8 = v7[11];
    else
      v8 = 0.0;
    v9 = v6 - v8;

    if (v9 >= 0.5)
    {
      -[PKTextInputHandwritingController _activeInputTargetState](self, "_activeInputTargetState");
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = (void *)v11;
      if (v11)
        v13 = *(void **)(v11 + 24);
      else
        v13 = 0;
      v14 = v13;
      objc_msgSend(v14, "correctionResult");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        if (objc_msgSend(v15, "resultType") == 3)
          v10 = 0.0;
        else
          v10 = 0.65;
      }
      else
      {
        v10 = 0.65;
      }

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__updateStrokeAlphaOverride, 0);
      -[PKTextInputHandwritingController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__updateStrokeAlphaOverride, 0, 0.5 - v9);
      v10 = 0.75;
    }
  }
  else
  {
    -[PKTextInputHandwritingController _activeInputTargetState](self, "_activeInputTargetState");
    v16 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    if (!v16 || (v17 = v16[18], v16, v10 = 0.75, !v17))
      v10 = 1.0;
  }
  if (v10 != self->_strokeAlphaOverride)
  {
    self->_strokeAlphaOverride = v10;
    -[PKTextInputHandwritingController delegate](self, "delegate");
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handwritingControllerStrokeAlphaOverrideDidChange:", self);

  }
}

+ (BOOL)_isCorrectionResultGesture:(id)a3
{
  return (unint64_t)(objc_msgSend(a3, "resultType") - 2) < 7;
}

- (void)_cancelInProgressStrokeFromHandwritingShots
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = os_log_create("com.apple.pencilkit", "PencilTextInput");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKTextInputHandwritingController _possibleHandwritingShot](self, "_possibleHandwritingShot");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138412546;
    v17 = v5;
    v18 = 2112;
    v19 = v6;
    _os_log_impl(&dword_1BE213000, v4, OS_LOG_TYPE_DEFAULT, "HWController %@: in progress stroke cancelled. Removing in progress stroke from possible shot %@", (uint8_t *)&v16, 0x16u);

  }
  -[PKTextInputHandwritingController _possibleHandwritingShot](self, "_possibleHandwritingShot");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "inputDrawing");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "strokes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v10)
  {
    -[PKTextInputHandwritingController _possibleHandwritingShot](self, "_possibleHandwritingShot");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setInputDrawing:inputInProgressStroke:", v8, 0);
  }
  else
  {
    -[PKTextInputHandwritingController _setPossibleHandwritingShot:](self, "_setPossibleHandwritingShot:", 0);
    -[PKTextInputHandwritingController _setActiveInputTargetState:](self, "_setActiveInputTargetState:", 0);
    -[PKTextInputHandwritingController _activeHandwritingShot](self, "_activeHandwritingShot");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "inputDrawing");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "strokes");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "count");

    if (!v14)
    {
      -[PKTextInputHandwritingController _activeHandwritingShot](self, "_activeHandwritingShot");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setCancelled:", 1);

    }
  }

}

- (void)canvasControllerDidBeginDrawing:(id)a3
{
  -[PKTextInputHandwritingController _cancelPendingResultCommand](self, "_cancelPendingResultCommand", a3);
  -[PKTextInputHandwritingController _createPossibleHandwritingShotIfNeeded](self, "_createPossibleHandwritingShotIfNeeded");
  -[PKTextInputHandwritingController _updateWritingSession](self, "_updateWritingSession");
}

- (void)canvasControllerInProgressStrokeDidChange:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  double v24;
  id v25;
  CGRect v26;
  CGRect v27;

  v25 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v5 = v4;
  -[PKTextInputHandwritingController _lastInProgressStrokeUpdateTime](self, "_lastInProgressStrokeUpdateTime");
  v7 = v5 - v6;
  -[PKTextInputHandwritingController _continuousRecognitionInterval](self, "_continuousRecognitionInterval");
  if (v7 >= v8)
  {
    +[PKTextInputSettings sharedSettings](PKTextInputSettings, "sharedSettings");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "continuousRecognition");

    if (v10)
    {
      -[PKTextInputCanvasController inProgressStroke]((uint64_t)v25);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKTextInputHandwritingController _lastInProgressStrokeUUID](self, "_lastInProgressStrokeUUID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "_strokeUUID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v12, "isEqual:", v13);

      if ((v14 & 1) != 0)
        goto LABEL_6;
      objc_msgSend(v11, "_bounds");
      x = v26.origin.x;
      y = v26.origin.y;
      width = v26.size.width;
      height = v26.size.height;
      if (CGRectGetWidth(v26) >= 10.0
        || (v27.origin.x = x,
            v27.origin.y = y,
            v27.size.width = width,
            v27.size.height = height,
            CGRectGetHeight(v27) >= 10.0))
      {
LABEL_6:
        -[PKTextInputHandwritingController _createPossibleHandwritingShotIfNeeded](self, "_createPossibleHandwritingShotIfNeeded");
        -[PKTextInputHandwritingController _possibleHandwritingShot](self, "_possibleHandwritingShot");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKTextInputHandwritingController _lastKnownDrawing](self, "_lastKnownDrawing");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setInputDrawing:inputInProgressStroke:", v20, v11);

        -[PKTextInputHandwritingController set_lastInProgressStrokeUpdateTime:](self, "set_lastInProgressStrokeUpdateTime:", v5);
        objc_msgSend(v11, "_strokeUUID");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKTextInputHandwritingController set_lastInProgressStrokeUUID:](self, "set_lastInProgressStrokeUUID:", v21);

      }
    }
  }
  +[PKTextInputSettings sharedSettings](PKTextInputSettings, "sharedSettings");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "floatingBackgroundEnabled");

  if (v23)
  {
    -[PKTextInputHandwritingController _floatingBackgroundLastUpdateTime](self, "_floatingBackgroundLastUpdateTime");
    if (v5 - v24 >= 0.1)
      -[PKTextInputHandwritingController _updateFloatingBackground](self, "_updateFloatingBackground");
  }

}

- (void)canvasController:(id)a3 drawingDidChange:(id)a4
{
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a4;
  objc_msgSend(v8, "strokes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
    -[PKTextInputHandwritingController _createPossibleHandwritingShotIfNeeded](self, "_createPossibleHandwritingShotIfNeeded");
  -[PKTextInputHandwritingController set_lastInProgressStrokeUUID:](self, "set_lastInProgressStrokeUUID:", 0);
  -[PKTextInputHandwritingController _possibleHandwritingShot](self, "_possibleHandwritingShot");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setInputDrawing:inputInProgressStroke:", v8, 0);

  -[PKTextInputHandwritingController _setLastKnownDrawing:](self, "_setLastKnownDrawing:", v8);
}

- (void)reportDebugStateDescription:(id)a3
{
  int64_t v4;
  const __CFString *v5;
  const __CFString *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __CFString *v20;
  void *v21;
  void *v22;
  __CFString *v23;
  void *v24;
  void *v25;
  __CFString *v26;
  void *v27;
  unint64_t v28;
  void *v29;
  __CFString *v30;
  void *v31;
  unint64_t v32;
  void *v33;
  __CFString *v34;
  void *v35;
  void *v36;
  void *v37;
  __CFString *v38;
  uint64_t v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  id v49;
  __CFString *v50;
  void (**v51)(id, const __CFString *, const __CFString *);

  v51 = (void (**)(id, const __CFString *, const __CFString *))a3;
  v4 = -[PKTextInputHandwritingController writingState](self, "writingState");
  v5 = CFSTR("Active");
  if (v4 != 1)
    v5 = 0;
  if (v4)
    v6 = v5;
  else
    v6 = CFSTR("Idle");
  v51[2](v51, CFSTR("Writing state"), v6);
  -[PKTextInputHandwritingController _writingSession](self, "_writingSession");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7 && (v9 = *(id *)(v7 + 32)) != 0)
  {
    v10 = v9;
    -[PKTextInputHandwritingController _writingSession](self, "_writingSession");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    if (v11)
      v13 = *(void **)(v11 + 32);
    else
      v13 = 0;
    v14 = v13;
    objc_msgSend(v14, "description");
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v51[2](v51, CFSTR("Writing session ID"), v15);

  }
  else
  {
    v51[2](v51, CFSTR("Writing session ID"), &stru_1E777DEE8);
    v10 = 0;
  }

  -[PKTextInputHandwritingController _lastKnownDrawing](self, "_lastKnownDrawing");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v17 = (void *)MEMORY[0x1E0CB3940];
    -[PKTextInputHandwritingController _lastKnownDrawing](self, "_lastKnownDrawing");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "strokes");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringWithFormat:", CFSTR("%ld visible strokes"), objc_msgSend(v19, "count"));
    v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v51[2](v51, CFSTR("Last known drawing"), v20);

  }
  else
  {
    v51[2](v51, CFSTR("Last known drawing"), CFSTR("None"));
  }

  -[PKTextInputHandwritingController _activeHandwritingShot](self, "_activeHandwritingShot");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    -[PKTextInputHandwritingController _activeHandwritingShot](self, "_activeHandwritingShot");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    PKTextInputDescriptionForHandwritingShotState(objc_msgSend(v22, "shotState"));
    v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v51[2](v51, CFSTR("Active shot"), v23);

  }
  else
  {
    v51[2](v51, CFSTR("Active shot"), CFSTR("None"));
  }

  -[PKTextInputHandwritingController _possibleHandwritingShot](self, "_possibleHandwritingShot");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    -[PKTextInputHandwritingController _possibleHandwritingShot](self, "_possibleHandwritingShot");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    PKTextInputDescriptionForHandwritingShotState(objc_msgSend(v25, "shotState"));
    v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v51[2](v51, CFSTR("Possible shot"), v26);

  }
  else
  {
    v51[2](v51, CFSTR("Possible shot"), CFSTR("None"));
  }

  -[PKTextInputHandwritingController _activeResultCommand](self, "_activeResultCommand");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    -[PKTextInputHandwritingController _activeResultCommand](self, "_activeResultCommand");
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = (void *)v28;
    if (v28)
      v28 = *(_QWORD *)(v28 + 24);
    PKTextInputDescriptionForResultCommandState(v28);
    v30 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v51[2](v51, CFSTR("Active result command"), v30);

  }
  else
  {
    v51[2](v51, CFSTR("Active result command"), CFSTR("None"));
  }

  -[PKTextInputHandwritingController _pendingResultCommand](self, "_pendingResultCommand");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (v31)
  {
    -[PKTextInputHandwritingController _pendingResultCommand](self, "_pendingResultCommand");
    v32 = objc_claimAutoreleasedReturnValue();
    v33 = (void *)v32;
    if (v32)
      v32 = *(_QWORD *)(v32 + 24);
    PKTextInputDescriptionForResultCommandState(v32);
    v34 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v51[2](v51, CFSTR("Pending result command"), v34);

  }
  else
  {
    v51[2](v51, CFSTR("Pending result command"), CFSTR("None"));
  }

  v35 = (void *)MEMORY[0x1E0CB37E8];
  -[PKTextInputHandwritingController _resultCommandsQueue](self, "_resultCommandsQueue");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "numberWithUnsignedInteger:", objc_msgSend(v36, "count"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "description");
  v38 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v51[2](v51, CFSTR("Commands in queue"), v38);

  -[PKTextInputHandwritingController _writingSession](self, "_writingSession");
  v39 = objc_claimAutoreleasedReturnValue();
  v40 = (void *)v39;
  if (!v39 || (v41 = *(id *)(v39 + 40)) == 0)
  {
    v51[2](v51, CFSTR("Current target element"), CFSTR("None"));
    v42 = 0;
    goto LABEL_38;
  }
  v42 = v41;
  v43 = (void *)MEMORY[0x1E0CB3940];
  -[PKTextInputHandwritingController _writingSession](self, "_writingSession");
  v44 = objc_claimAutoreleasedReturnValue();
  v45 = (void *)v44;
  if (!v44)
  {
    v47 = 0;
    goto LABEL_41;
  }
  v46 = *(id *)(v44 + 40);
  v47 = v46;
  if (!v46)
  {
LABEL_41:
    v48 = 0;
    goto LABEL_36;
  }
  v48 = (void *)*((_QWORD *)v46 + 14);
LABEL_36:
  v49 = v48;
  objc_msgSend(v43, "stringWithFormat:", CFSTR("%@"), v49);
  v50 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v51[2](v51, CFSTR("Current target element"), v50);

LABEL_38:
}

- (PKTextInputHandwritingControllerDelegate)delegate
{
  return (PKTextInputHandwritingControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PKTextInputCanvasController)canvasController
{
  return self->_canvasController;
}

- (PKTextInputElementsController)elementsController
{
  return self->_elementsController;
}

- (PKTextInputFeedbackController)feedbackController
{
  return self->_feedbackController;
}

- (PKTextInputReserveSpaceController)reserveSpaceController
{
  return self->_reserveSpaceController;
}

- (PKTextInputDebugLogController)debugLogController
{
  return self->_debugLogController;
}

- (PKTextInputCursorController)cursorController
{
  return self->_cursorController;
}

- (double)strokeAlphaOverride
{
  return self->_strokeAlphaOverride;
}

- (PKTextInputRecognitionManager)_recognitionManager
{
  return self->__recognitionManager;
}

- (void)set_recognitionManager:(id)a3
{
  objc_storeStrong((id *)&self->__recognitionManager, a3);
}

- (PKTextInputWritingSession)_writingSession
{
  return self->__writingSession;
}

- (PKTextInputHandwritingShot)_activeHandwritingShot
{
  return self->__activeHandwritingShot;
}

- (PKTextInputHandwritingShot)_possibleHandwritingShot
{
  return self->__possibleHandwritingShot;
}

- (PKTextInputResultCommand)_activeResultCommand
{
  return self->__activeResultCommand;
}

- (NSMutableArray)_resultCommandsQueue
{
  return self->__resultCommandsQueue;
}

- (double)_lastInProgressStrokeUpdateTime
{
  return self->__lastInProgressStrokeUpdateTime;
}

- (void)set_lastInProgressStrokeUpdateTime:(double)a3
{
  self->__lastInProgressStrokeUpdateTime = a3;
}

- (NSUUID)_lastInProgressStrokeUUID
{
  return self->__lastInProgressStrokeUUID;
}

- (void)set_lastInProgressStrokeUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (PKDrawing)_lastKnownDrawing
{
  return self->__lastKnownDrawing;
}

- (PKTextInputTargetState)_activeInputTargetState
{
  return self->__activeInputTargetState;
}

- (double)_floatingBackgroundLastUpdateTime
{
  return self->__floatingBackgroundLastUpdateTime;
}

- (void)set_floatingBackgroundLastUpdateTime:(double)a3
{
  self->__floatingBackgroundLastUpdateTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__activeInputTargetState, 0);
  objc_storeStrong((id *)&self->__lastKnownDrawing, 0);
  objc_storeStrong((id *)&self->__lastInProgressStrokeUUID, 0);
  objc_storeStrong((id *)&self->__resultCommandsQueue, 0);
  objc_storeStrong((id *)&self->__activeResultCommand, 0);
  objc_storeStrong((id *)&self->__possibleHandwritingShot, 0);
  objc_storeStrong((id *)&self->__activeHandwritingShot, 0);
  objc_storeStrong((id *)&self->__writingSession, 0);
  objc_storeStrong((id *)&self->__recognitionManager, 0);
  objc_storeStrong((id *)&self->_cursorController, 0);
  objc_storeStrong((id *)&self->_debugLogController, 0);
  objc_storeStrong((id *)&self->_reserveSpaceController, 0);
  objc_storeStrong((id *)&self->_feedbackController, 0);
  objc_storeStrong((id *)&self->_elementsController, 0);
  objc_storeStrong((id *)&self->_canvasController, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)quickCommitIfPossible
{
  void *v3;
  uint64_t v4;
  void *v5;

  -[PKTextInputHandwritingController _activeResultCommand](self, "_activeResultCommand");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PKTextInputHandwritingController _activeResultCommand](self, "_activeResultCommand");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)v4;
    if (v4 && *(_QWORD *)(v4 + 24) == 1)
      -[PKTextInputResultCommand _setCommandState:](v4, 2);

  }
  -[PKTextInputHandwritingController _evaluateAndProcessResultCommandsQueueImmediateCommit:](self, "_evaluateAndProcessResultCommandsQueueImmediateCommit:", 1);
}

- (void)cleanUpFromCancelledReplay
{
  id *v3;

  -[PKTextInputHandwritingController _writingSession](self, "_writingSession");
  v3 = (id *)objc_claimAutoreleasedReturnValue();
  -[PKTextInputWritingSession setCurrentTargetElement:](v3, 0);

  -[PKTextInputHandwritingController _setActiveInputTargetState:](self, "_setActiveInputTargetState:", 0);
}

@end
