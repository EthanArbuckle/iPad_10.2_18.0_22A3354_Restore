@implementation PKTextInputCursorController

- (PKTextInputCursorController)init
{
  return -[PKTextInputCursorController initWithSettings:](self, "initWithSettings:", 0);
}

- (PKTextInputCursorController)initWithSettings:(id)a3
{
  id v5;
  PKTextInputCursorController *v6;
  PKTextInputCursorController *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v19;

  v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PKTextInputCursorController;
  v6 = -[PKTextInputCursorController init](&v19, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_settings, a3);
    v7->_cursorStyle = 0;
    v7->_mode = 0;
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "timeIntervalSinceReferenceDate");
    v7->__lastSwitchToIdleWritingStateTime = v9;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:selector:name:object:", v7, sel_firstResponderDidChange_, *MEMORY[0x1E0DC5AF8], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:selector:name:object:", v7, sel_keyWindowDidChange_, *MEMORY[0x1E0DC5608], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:selector:name:object:", v7, sel_textInputSourceDidChange_, *MEMORY[0x1E0DC5580], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObserver:selector:name:object:", v7, sel_scrollViewWillBeginDragging_, *MEMORY[0x1E0DC59C0], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObserver:selector:name:object:", v7, sel_keyboardWillShow_, *MEMORY[0x1E0DC4FE8], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObserver:selector:name:object:", v7, sel_keyboardWillChangeFrame_, *MEMORY[0x1E0DC4FD8], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObserver:selector:name:object:", v7, sel__handleUndoRedo_, *MEMORY[0x1E0CB33B8], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObserver:selector:name:object:", v7, sel__handleUndoRedo_, *MEMORY[0x1E0CB33B0], 0);

  }
  return v7;
}

- (PKTextInputSettings)_textInputSettings
{
  PKTextInputSettings *settings;

  settings = self->_settings;
  if (settings)
    return settings;
  +[PKTextInputSettings sharedSettings](PKTextInputSettings, "sharedSettings");
  return (PKTextInputSettings *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)_setMode:(int64_t)a3
{
  if (self->_mode != a3)
  {
    self->_mode = a3;
    +[PKTextInputDebugStateIntrospector debugStateDidChange](PKTextInputDebugStateIntrospector, "debugStateDidChange");
    -[PKTextInputCursorController _updateCursorStyle](self, "_updateCursorStyle");
  }
}

- (BOOL)isCursorWeak
{
  return !-[PKTextInputCursorController forceStrong](self, "forceStrong")
      && -[PKTextInputCursorController mode](self, "mode") == 2;
}

- (BOOL)canMakeCursorWeakForResponder:(id)a3
{
  id v4;
  void *v5;
  int v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;

  v4 = a3;
  -[PKTextInputCursorController _textInputSettings](self, "_textInputSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "enableWeakCursor");

  if (v6
    && (objc_opt_respondsToSelector() & 1) != 0
    && objc_msgSend(v4, "_textInputSource") == 3
    && +[PKTextInputElementsFinder isResponderEditableTextInput:]((uint64_t)PKTextInputElementsFinder, v4)&& (objc_opt_respondsToSelector() & 1) != 0)
  {
    v7 = objc_opt_class();
    objc_msgSend(v4, "selectedTextRange");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PKDynamicCast(v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
      v10 = objc_msgSend(v9, "isEmpty");
    else
      v10 = 1;

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)_setCursorStyle:(int64_t)a3
{
  NSObject *v5;
  int64_t v6;
  UITextCursorAssertion *v7;
  UITextCursorAssertion *ghostAssertion;
  dispatch_time_t v9;
  UITextCursorAssertion *v10;
  unint64_t cursorStyle;
  __CFString *v12;
  __CFString *v13;
  unint64_t v14;
  __CFString *v15;
  _QWORD block[4];
  UITextCursorAssertion *v17;
  uint8_t buf[4];
  __CFString *v19;
  __int16 v20;
  __CFString *v21;
  __int16 v22;
  __CFString *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (self->_cursorStyle != a3)
  {
    v5 = os_log_create("com.apple.pencilkit", "PencilTextInput");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      cursorStyle = self->_cursorStyle;
      if (cursorStyle > 3)
        v12 = 0;
      else
        v12 = off_1E777A748[cursorStyle];
      if ((unint64_t)a3 > 3)
        v13 = 0;
      else
        v13 = off_1E777A748[a3];
      v14 = -[PKTextInputCursorController mode](self, "mode");
      if (v14 > 2)
        v15 = 0;
      else
        v15 = off_1E777A768[v14];
      *(_DWORD *)buf = 138412802;
      v19 = v12;
      v20 = 2112;
      v21 = v13;
      v22 = 2112;
      v23 = v15;
      _os_log_debug_impl(&dword_1BE213000, v5, OS_LOG_TYPE_DEBUG, "Setting cursor style: %@ -> %@, mode: %@", buf, 0x20u);
    }

    v6 = self->_cursorStyle;
    self->_cursorStyle = a3;
    +[PKTextInputDebugStateIntrospector debugStateDidChange](PKTextInputDebugStateIntrospector, "debugStateDidChange");
    if (v6 == 1 && self->_cursorStyle == 3)
    {
      v7 = self->_ghostAssertion;
      ghostAssertion = self->_ghostAssertion;
      self->_ghostAssertion = 0;

      -[PKTextInputCursorController _updateAssertionsForCurrentState](self, "_updateAssertionsForCurrentState");
      if (v7)
      {
        v9 = dispatch_time(0, 100000000);
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __47__PKTextInputCursorController__setCursorStyle___block_invoke;
        block[3] = &unk_1E7778020;
        v17 = v7;
        v10 = v7;
        dispatch_after(v9, MEMORY[0x1E0C80D38], block);

      }
    }
    else
    {
      -[PKTextInputCursorController _updateAssertionsForCurrentState](self, "_updateAssertionsForCurrentState");
    }
  }
}

uint64_t __47__PKTextInputCursorController__setCursorStyle___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

- (void)_updateAssertionsForCurrentState
{
  void *v3;
  const __CFString *v4;
  UITextCursorAssertion *v5;
  UITextCursorAssertion *nonBlinkingAssertion;
  int64_t cursorStyle;
  UITextCursorAssertion *v8;
  UITextCursorAssertion *v9;
  id v10;

  -[PKTextInputCursorController removeAllAssertions](self, "removeAllAssertions");
  if (self->_cursorShouldFlash)
  {
    -[PKTextInputCursorController _currentAssertionController](self, "_currentAssertionController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = CFSTR("Non blinking for Scribble flash cursor");
LABEL_3:
    v10 = v3;
    objc_msgSend(v3, "nonBlinkingAssertionWithReason:", v4);
    v5 = (UITextCursorAssertion *)objc_claimAutoreleasedReturnValue();
    nonBlinkingAssertion = self->_nonBlinkingAssertion;
    self->_nonBlinkingAssertion = v5;
LABEL_4:

    return;
  }
  cursorStyle = self->_cursorStyle;
  switch(cursorStyle)
  {
    case 3:
      -[PKTextInputCursorController _currentAssertionController](self, "_currentAssertionController");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "nonVisibleAssertionWithReason:", CFSTR("Hidden for Scribble"));
      v9 = (UITextCursorAssertion *)objc_claimAutoreleasedReturnValue();
      nonBlinkingAssertion = self->_nonVisibleAssertion;
      self->_nonVisibleAssertion = v9;
      goto LABEL_4;
    case 2:
      -[PKTextInputCursorController _currentAssertionController](self, "_currentAssertionController");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = CFSTR("Non blinking for Scribble");
      goto LABEL_3;
    case 1:
      -[PKTextInputCursorController _currentAssertionController](self, "_currentAssertionController");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "nonBlinkingGhostAssertionWithReason:", CFSTR("Ghosted for Scribble"));
      v8 = (UITextCursorAssertion *)objc_claimAutoreleasedReturnValue();
      nonBlinkingAssertion = self->_ghostAssertion;
      self->_ghostAssertion = v8;
      goto LABEL_4;
  }
}

- (void)_updateCursorStyle
{
  void *v3;
  void *v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  _BOOL4 v14;
  int v15;
  _BOOL4 v16;
  void *v17;
  int v18;
  int v19;
  int v20;
  char v21;
  int v22;
  unsigned __int8 v23;
  _BOOL4 v24;
  uint64_t v25;

  if (!-[PKTextInputCursorController scribbleEnabled](self, "scribbleEnabled"))
  {
    -[PKTextInputCursorController resetState](self, "resetState");
    return;
  }
  -[PKTextInputCursorController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[PKTextInputCursorController delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "cursorControllerWritingState:", self);

  }
  else
  {
    v5 = 0;
  }

  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v7 = v6;
  -[PKTextInputCursorController _lastSwitchToIdleWritingStateTime](self, "_lastSwitchToIdleWritingStateTime");
  v9 = v7 - v8;
  -[PKTextInputCursorController _textInputSettings](self, "_textInputSettings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "weakCursorVisibilityTimeout");
  v12 = v11 - v9;

  -[PKTextInputCursorController _lastKnownTextInputResponder](self, "_lastKnownTextInputResponder");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = -[PKTextInputCursorController lastKnownTextInputResponderWindowIsKey](self, "lastKnownTextInputResponderWindowIsKey");
  if (v5 == 1)
  {
    v16 = 0;
    v15 = 1;
  }
  else
  {
    v15 = 0;
    if (v5)
      v16 = 0;
    else
      v16 = v12 > 0.0;
  }
  -[PKTextInputCursorController delegate](self, "delegate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "cursorControllerCustomHighlightFeedbackIsVisible:", self);

  if (v13)
    v19 = v14;
  else
    v19 = 1;
  v20 = 1;
  v21 = 1;
  if (!v18
    && v19
    && (-[PKTextInputCursorController mode](self, "mode") != 2
     || !v13
     || -[PKTextInputCursorController forceStrong](self, "forceStrong")
     || (v15 | -[PKTextInputCursorController forceVisible](self, "forceVisible")) == 1))
  {
    v20 = 0;
    if (v13)
      v21 = (v15 | v16) ^ 1;
    else
      v21 = 1;
  }
  if (-[PKTextInputCursorController forceVisible](self, "forceVisible"))
  {
    v22 = 0;
    v23 = 0;
    if (!v16)
      goto LABEL_28;
    goto LABEL_27;
  }
  v24 = -[PKTextInputCursorController forceHidden](self, "forceHidden");
  v22 = v20 | v24;
  v23 = v24 | v21;
  if (v16)
  {
LABEL_27:
    objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__writingStateEvaluationTimerExpired, 0);
    -[PKTextInputCursorController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__writingStateEvaluationTimerExpired, 0, v12);
  }
LABEL_28:
  if (v22)
    v25 = 3;
  else
    v25 = 0;
  if (((v22 | v23) & 1) == 0)
  {
    if (-[PKTextInputCursorController mode](self, "mode", v25))
      v25 = 1;
    else
      v25 = 2;
  }
  -[PKTextInputCursorController _setCursorStyle:](self, "_setCursorStyle:", v25);
}

- (void)makeCursorStrong
{
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__delayedRevokeTemporaryStrongMode, 0);
  -[PKTextInputCursorController _setMode:](self, "_setMode:", 0);
}

- (void)flashCursor
{
  id restoreAfterFlashCursorBlock;
  dispatch_block_t v4;
  id v5;
  dispatch_time_t v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  id v11;
  id location;

  if (-[PKTextInputCursorController isCursorWeak](self, "isCursorWeak"))
  {
    restoreAfterFlashCursorBlock = self->_restoreAfterFlashCursorBlock;
    if (restoreAfterFlashCursorBlock)
      dispatch_block_cancel(restoreAfterFlashCursorBlock);
    objc_initWeak(&location, self);
    v7 = MEMORY[0x1E0C809B0];
    v8 = 3221225472;
    v9 = __42__PKTextInputCursorController_flashCursor__block_invoke;
    v10 = &unk_1E7777588;
    objc_copyWeak(&v11, &location);
    v4 = dispatch_block_create((dispatch_block_flags_t)0, &v7);
    v5 = self->_restoreAfterFlashCursorBlock;
    self->_restoreAfterFlashCursorBlock = v4;

    v6 = dispatch_time(0, 1000000000);
    dispatch_after(v6, MEMORY[0x1E0C80D38], self->_restoreAfterFlashCursorBlock);
    if (!self->_cursorShouldFlash)
    {
      self->_cursorShouldFlash = 1;
      -[PKTextInputCursorController _updateAssertionsForCurrentState](self, "_updateAssertionsForCurrentState", v7, v8, v9, v10);
    }
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

void __42__PKTextInputCursorController_flashCursor__block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v2;
  _BYTE *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (void *)WeakRetained[5];
    WeakRetained[5] = 0;
    v3 = WeakRetained;

    v3[32] = 0;
    objc_msgSend(v3, "_updateAssertionsForCurrentState");
    WeakRetained = v3;
  }

}

- (void)setForceStrong:(BOOL)a3
{
  if (self->_forceStrong != a3)
  {
    self->_forceStrong = a3;
    -[PKTextInputCursorController _updateCursorStyle](self, "_updateCursorStyle");
  }
}

- (void)setForceVisible:(BOOL)a3
{
  if (self->_forceVisible != a3)
  {
    self->_forceVisible = a3;
    if (a3)
      self->_forceHidden = 0;
    -[PKTextInputCursorController _updateCursorStyle](self, "_updateCursorStyle");
  }
}

- (void)setForceHidden:(BOOL)a3
{
  if (self->_forceHidden != a3)
  {
    self->_forceHidden = a3;
    if (a3)
      self->_forceVisible = 0;
    -[PKTextInputCursorController _updateCursorStyle](self, "_updateCursorStyle");
  }
}

- (void)makeCursorWeak
{
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__delayedRevokeTemporaryStrongMode, 0);
  -[PKTextInputCursorController _setMode:](self, "_setMode:", 2);
}

- (void)makeCursorTemporarilyStrongWhileWriting
{
  if (-[PKTextInputCursorController mode](self, "mode") == 2)
  {
    objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__delayedRevokeTemporaryStrongMode, 0);
    -[PKTextInputCursorController _setMode:](self, "_setMode:", 1);
  }
}

- (void)makeCursorTemporarilyStrongWithTimeout:(double)a3
{
  if (-[PKTextInputCursorController mode](self, "mode") == 2)
  {
    objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__delayedRevokeTemporaryStrongMode, 0);
    -[PKTextInputCursorController _setMode:](self, "_setMode:", 1);
    if (a3 > 0.0)
      -[PKTextInputCursorController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__delayedRevokeTemporaryStrongMode, 0, a3);
  }
}

- (void)writingStateDidChange
{
  void *v3;
  uint64_t v4;
  void *v5;
  double v6;
  double v7;

  -[PKTextInputCursorController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "cursorControllerWritingState:", self);

  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    -[PKTextInputCursorController set_lastSwitchToIdleWritingStateTime:](self, "set_lastSwitchToIdleWritingStateTime:");
    if (-[PKTextInputCursorController mode](self, "mode") == 1)
    {
      -[PKTextInputCursorController _textInputSettings](self, "_textInputSettings");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "weakCursorVisibilityTimeout");
      v7 = v6;

      objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__delayedRevokeTemporaryStrongMode, 0);
      -[PKTextInputCursorController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__delayedRevokeTemporaryStrongMode, 0, v7);
    }
  }
  -[PKTextInputCursorController _updateCursorStyle](self, "_updateCursorStyle");
}

- (void)_delayedRevokeTemporaryStrongMode
{
  if (-[PKTextInputCursorController mode](self, "mode") == 1)
    -[PKTextInputCursorController makeCursorWeak](self, "makeCursorWeak");
}

- (id)_currentAssertionController
{
  void *v3;
  void *v4;
  void *v5;

  -[PKTextInputCursorController _lastKnownTextInputResponder](self, "_lastKnownTextInputResponder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_textInteraction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    objc_msgSend(v4, "_assertionController");
  else
    -[PKTextInputCursorController _implicitAssertionControllerIfPossible](self, "_implicitAssertionControllerIfPossible");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_implicitAssertionControllerIfPossible
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;

  -[PKTextInputCursorController _lastKnownTextInputResponder](self, "_lastKnownTextInputResponder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0
    && objc_msgSend(v3, "conformsToProtocol:", &unk_1EF5F3E00))
  {
    -[PKTextInputCursorController implicitAssertionController](self, "implicitAssertionController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0DC3DA0]);
      -[PKTextInputCursorController setImplicitAssertionController:](self, "setImplicitAssertionController:", v5);

    }
    -[PKTextInputCursorController implicitAssertionController](self, "implicitAssertionController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSubject:", v3);

    -[PKTextInputCursorController implicitAssertionController](self, "implicitAssertionController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)removeAllAssertions
{
  -[PKTextInputCursorController invalidateGhostAssertion](self, "invalidateGhostAssertion");
  -[PKTextInputCursorController invalidateNonVisibleAssertion](self, "invalidateNonVisibleAssertion");
  -[PKTextInputCursorController invalidateNonBlinkingAssertion](self, "invalidateNonBlinkingAssertion");
}

- (void)resetState
{
  void *v3;
  double v4;

  self->_cursorShouldFlash = 0;
  self->_cursorStyle = 0;
  self->_mode = 0;
  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceReferenceDate");
  self->__lastSwitchToIdleWritingStateTime = v4;

  objc_storeWeak((id *)&self->__lastKnownTextInputResponder, 0);
  -[PKTextInputCursorController removeAllAssertions](self, "removeAllAssertions");
}

- (void)invalidateNonBlinkingAssertion
{
  UITextCursorAssertion *nonBlinkingAssertion;

  -[UITextCursorAssertion invalidate](self->_nonBlinkingAssertion, "invalidate");
  nonBlinkingAssertion = self->_nonBlinkingAssertion;
  self->_nonBlinkingAssertion = 0;

}

- (void)invalidateNonVisibleAssertion
{
  UITextCursorAssertion *nonVisibleAssertion;

  -[UITextCursorAssertion invalidate](self->_nonVisibleAssertion, "invalidate");
  nonVisibleAssertion = self->_nonVisibleAssertion;
  self->_nonVisibleAssertion = 0;

}

- (void)invalidateGhostAssertion
{
  UITextCursorAssertion *ghostAssertion;

  -[UITextCursorAssertion invalidate](self->_ghostAssertion, "invalidate");
  ghostAssertion = self->_ghostAssertion;
  self->_ghostAssertion = 0;

}

- (BOOL)scribbleEnabled
{
  void *v2;
  char v3;

  -[PKTextInputCursorController _textInputSettings](self, "_textInputSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isScribbleActive");

  return v3;
}

- (void)firstResponderDidChange:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  if (-[PKTextInputCursorController scribbleEnabled](self, "scribbleEnabled"))
  {
    objc_msgSend(v11, "object");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstResponder");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (+[PKTextInputUtilities isResponderSupportedTextInput:](PKTextInputUtilities, "isResponderSupportedTextInput:", v5))
    {
      v6 = v5;
    }
    else
    {
      v6 = 0;
    }
    -[PKTextInputCursorController delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "windowSceneForController:", self);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[PKTextInputCursorController _windowForResponder:](self, "_windowForResponder:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "windowScene");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8 == v10)
      -[PKTextInputCursorController _setLastKnownTextInputResponder:](self, "_setLastKnownTextInputResponder:", v6);

  }
  else
  {
    -[PKTextInputCursorController resetState](self, "resetState");
  }

}

- (void)keyWindowDidChange:(id)a3
{
  void *v4;

  if (-[PKTextInputCursorController scribbleEnabled](self, "scribbleEnabled", a3))
  {
    -[PKTextInputCursorController _lastKnownTextInputResponder](self, "_lastKnownTextInputResponder");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
      -[PKTextInputCursorController _setTrackedLastKnownTextInputResponderWindowIsKey:](self, "_setTrackedLastKnownTextInputResponderWindowIsKey:", -[PKTextInputCursorController lastKnownTextInputResponderWindowIsKey](self, "lastKnownTextInputResponderWindowIsKey"));
    -[PKTextInputCursorController _updateCursorStyle](self, "_updateCursorStyle");
  }
  else
  {
    -[PKTextInputCursorController resetState](self, "resetState");
  }
}

- (void)textInputSourceDidChange:(id)a3
{
  id v4;
  _QWORD v5[5];
  id v6;

  v4 = a3;
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    -[PKTextInputCursorController _textInputSourceDidChange:](self, "_textInputSourceDidChange:", v4);
  }
  else
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __56__PKTextInputCursorController_textInputSourceDidChange___block_invoke;
    v5[3] = &unk_1E7777C20;
    v5[4] = self;
    v6 = v4;
    dispatch_async(MEMORY[0x1E0C80D38], v5);

  }
}

uint64_t __56__PKTextInputCursorController_textInputSourceDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_textInputSourceDidChange:", *(_QWORD *)(a1 + 40));
}

- (void)_textInputSourceDidChange:(id)a3
{
  void *v4;
  BOOL v5;

  if (-[PKTextInputCursorController scribbleEnabled](self, "scribbleEnabled", a3))
  {
    if (-[PKTextInputCursorController mode](self, "mode"))
    {
      -[PKTextInputCursorController _lastKnownTextInputResponder](self, "_lastKnownTextInputResponder");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = -[PKTextInputCursorController canMakeCursorWeakForResponder:](self, "canMakeCursorWeakForResponder:", v4);

      if (!v5)
        -[PKTextInputCursorController makeCursorStrong](self, "makeCursorStrong");
    }
  }
  else
  {
    -[PKTextInputCursorController resetState](self, "resetState");
  }
}

- (void)_setTrackedLastKnownTextInputResponderWindowIsKey:(BOOL)a3
{
  if (self->__trackedLastKnownTextInputResponderWindowIsKey != a3)
  {
    self->__trackedLastKnownTextInputResponderWindowIsKey = a3;
    -[PKTextInputCursorController _updateCursorStyle](self, "_updateCursorStyle");
  }
}

- (void)_setLastKnownTextInputResponder:(id)a3
{
  id v4;
  id WeakRetained;
  _BOOL4 v6;
  NSObject *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  uint8_t v13[16];

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->__lastKnownTextInputResponder);

  if (WeakRetained == v4)
  {
    v6 = -[PKTextInputCursorController _trackedLastKnownTextInputResponderWindowIsKey](self, "_trackedLastKnownTextInputResponderWindowIsKey");
    if (v6 == -[PKTextInputCursorController lastKnownTextInputResponderWindowIsKey](self, "lastKnownTextInputResponderWindowIsKey"))goto LABEL_13;
    v7 = os_log_create("com.apple.pencilkit", "PencilTextInput");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_1BE213000, v7, OS_LOG_TYPE_INFO, "Last knows text input responder key window tracking out of sync", v13, 2u);
    }

  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObserver:name:object:", self, CFSTR("PKPaletteKeyboardUtilitiesDidPerformReturnNotification"), 0);

  -[PKTextInputCursorController _setCursorStyle:](self, "_setCursorStyle:", 0);
  objc_storeWeak((id *)&self->__lastKnownTextInputResponder, v4);
  self->__trackedLastKnownTextInputResponderWindowIsKey = -[PKTextInputCursorController lastKnownTextInputResponderWindowIsKey](self, "lastKnownTextInputResponderWindowIsKey");
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", self, sel__handleDidPerformReturn_, CFSTR("PKPaletteKeyboardUtilitiesDidPerformReturnNotification"), v4);

  }
  if (-[PKTextInputCursorController canMakeCursorWeakForResponder:](self, "canMakeCursorWeakForResponder:", v4)
    && (objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate"),
        v11 = v10,
        -[PKTextInputCursorController lastElementTapToFocusTimestamp](self, "lastElementTapToFocusTimestamp"),
        v11 - v12 > 0.5))
  {
    -[PKTextInputCursorController makeCursorWeak](self, "makeCursorWeak");
  }
  else
  {
    -[PKTextInputCursorController makeCursorStrong](self, "makeCursorStrong");
  }
  -[PKTextInputCursorController _updateCursorStyle](self, "_updateCursorStyle");
LABEL_13:

}

- (BOOL)lastKnownTextInputResponderWindowIsKey
{
  void *v3;
  void *v4;
  char v5;

  -[PKTextInputCursorController _lastKnownTextInputResponder](self, "_lastKnownTextInputResponder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTextInputCursorController _windowForResponder:](self, "_windowForResponder:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isKeyWindow");

  return v5;
}

- (id)_windowForResponder:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "_responderWindow");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = objc_opt_class();
    PKDynamicCast(v5, v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "window");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v4;
  id v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  NSObject *v9;
  uint8_t v10[16];

  v4 = a3;
  if (!-[PKTextInputCursorController scribbleEnabled](self, "scribbleEnabled"))
  {
    -[PKTextInputCursorController resetState](self, "resetState");
    goto LABEL_13;
  }
  if (!-[PKTextInputCursorController mode](self, "mode"))
  {
    -[PKTextInputCursorController _lastKnownTextInputResponder](self, "_lastKnownTextInputResponder");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (-[PKTextInputCursorController canMakeCursorWeakForResponder:](self, "canMakeCursorWeakForResponder:", v5))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v4, "object");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0)
        {
          v5 = v5;
          objc_msgSend(v4, "object");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v5, "isDescendantOfView:", v8))
          {
            v9 = os_log_create("com.apple.pencilkit", "PencilTextInput");
            if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)v10 = 0;
              _os_log_debug_impl(&dword_1BE213000, v9, OS_LOG_TYPE_DEBUG, "Making cursor weak after scrollWillBeginDragging", v10, 2u);
            }

            -[PKTextInputCursorController makeCursorWeak](self, "makeCursorWeak");
            goto LABEL_13;
          }

        }
      }
    }

  }
LABEL_13:

}

- (void)keyboardWillShow:(id)a3
{
  uint64_t v4;
  void *v5;
  int64_t v6;
  void *v7;
  NSObject *v8;
  uint8_t v9[16];

  if (-[PKTextInputCursorController scribbleEnabled](self, "scribbleEnabled", a3))
  {
    -[PKTextInputCursorController _lastKnownTextInputResponder](self, "_lastKnownTextInputResponder");
    v4 = objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = (void *)v4;
      v6 = -[PKTextInputCursorController mode](self, "mode");

      if (v6)
      {
        objc_msgSend(MEMORY[0x1E0DC3958], "activeInstance");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v7, "isMinimized") & 1) == 0 && (objc_msgSend(v7, "_suppressSoftwareKeyboard") & 1) == 0)
        {
          v8 = os_log_create("com.apple.pencilkit", "PencilTextInput");
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)v9 = 0;
            _os_log_debug_impl(&dword_1BE213000, v8, OS_LOG_TYPE_DEBUG, "Making cursor strong after keyboardWillShow", v9, 2u);
          }

          -[PKTextInputCursorController makeCursorStrong](self, "makeCursorStrong");
        }

      }
    }
  }
  else
  {
    -[PKTextInputCursorController resetState](self, "resetState");
  }
}

- (void)reportDebugStateDescription:(id)a3
{
  unint64_t v4;
  __CFString *v5;
  unint64_t v6;
  __CFString *v7;
  void *v8;
  void *v9;
  __CFString *v10;
  void (**v11)(id, const __CFString *, __CFString *);

  v11 = (void (**)(id, const __CFString *, __CFString *))a3;
  v4 = -[PKTextInputCursorController cursorStyle](self, "cursorStyle");
  if (v4 > 3)
    v5 = 0;
  else
    v5 = off_1E777A748[v4];
  v11[2](v11, CFSTR("Cursor style"), v5);
  v6 = -[PKTextInputCursorController mode](self, "mode");
  if (v6 > 2)
    v7 = 0;
  else
    v7 = off_1E777A768[v6];
  v11[2](v11, CFSTR("Cursor mode"), v7);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (self->_nonVisibleAssertion)
    objc_msgSend(v8, "addObject:", CFSTR("hidden"));
  if (self->_nonBlinkingAssertion)
    objc_msgSend(v9, "addObject:", CFSTR("non-blinking"));
  if (self->_ghostAssertion)
    objc_msgSend(v9, "addObject:", CFSTR("ghosted"));
  if (objc_msgSend(v9, "count"))
  {
    objc_msgSend(v9, "componentsJoinedByString:", CFSTR(", "));
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = CFSTR("none");
  }
  v11[2](v11, CFSTR("Cursor assertions"), v10);

}

- (void)_handleUndoRedo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (-[PKTextInputCursorController scribbleEnabled](self, "scribbleEnabled"))
  {
    if (-[PKTextInputCursorController isCursorWeak](self, "isCursorWeak"))
    {
      objc_msgSend(v7, "object");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKTextInputCursorController _lastKnownTextInputResponder](self, "_lastKnownTextInputResponder");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "undoManager");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v4 == v6)
        -[PKTextInputCursorController flashCursor](self, "flashCursor");
    }
  }
  else
  {
    -[PKTextInputCursorController resetState](self, "resetState");
  }

}

- (void)_handleDidPerformReturn:(id)a3
{
  if (-[PKTextInputCursorController scribbleEnabled](self, "scribbleEnabled", a3))
  {
    if (-[PKTextInputCursorController isCursorWeak](self, "isCursorWeak"))
      -[PKTextInputCursorController flashCursor](self, "flashCursor");
  }
  else
  {
    -[PKTextInputCursorController resetState](self, "resetState");
  }
}

- (void)simulateFirstResponderChangeForTesting:(id)a3
{
  id v4;

  v4 = a3;
  -[PKTextInputCursorController _setLastKnownTextInputResponder:](self, "_setLastKnownTextInputResponder:", 0);
  -[PKTextInputCursorController _setLastKnownTextInputResponder:](self, "_setLastKnownTextInputResponder:", v4);

}

- (void)simulateResetCursorTimeout
{
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__delayedRevokeTemporaryStrongMode, 0);
  -[PKTextInputCursorController _delayedRevokeTemporaryStrongMode](self, "_delayedRevokeTemporaryStrongMode");
}

- (PKTextInputCursorControllerDelegate)delegate
{
  return (PKTextInputCursorControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isCursorTemporarilyStrong
{
  return self->_isCursorTemporarilyStrong;
}

- (BOOL)forceStrong
{
  return self->_forceStrong;
}

- (BOOL)forceVisible
{
  return self->_forceVisible;
}

- (BOOL)forceHidden
{
  return self->_forceHidden;
}

- (double)lastElementTapToFocusTimestamp
{
  return self->_lastElementTapToFocusTimestamp;
}

- (void)setLastElementTapToFocusTimestamp:(double)a3
{
  self->_lastElementTapToFocusTimestamp = a3;
}

- (int64_t)cursorStyle
{
  return self->_cursorStyle;
}

- (int64_t)mode
{
  return self->_mode;
}

- (UITextInput)_lastKnownTextInputResponder
{
  return (UITextInput *)objc_loadWeakRetained((id *)&self->__lastKnownTextInputResponder);
}

- (BOOL)_trackedLastKnownTextInputResponderWindowIsKey
{
  return self->__trackedLastKnownTextInputResponderWindowIsKey;
}

- (UITextCursorAssertionController)implicitAssertionController
{
  return self->_implicitAssertionController;
}

- (void)setImplicitAssertionController:(id)a3
{
  objc_storeStrong((id *)&self->_implicitAssertionController, a3);
}

- (double)_lastSwitchToIdleWritingStateTime
{
  return self->__lastSwitchToIdleWritingStateTime;
}

- (void)set_lastSwitchToIdleWritingStateTime:(double)a3
{
  self->__lastSwitchToIdleWritingStateTime = a3;
}

- (void)set_textInputSettings:(id)a3
{
  objc_storeStrong((id *)&self->__textInputSettings, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__textInputSettings, 0);
  objc_storeStrong((id *)&self->_implicitAssertionController, 0);
  objc_destroyWeak((id *)&self->__lastKnownTextInputResponder);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong(&self->_restoreAfterFlashCursorBlock, 0);
  objc_storeStrong((id *)&self->_ghostAssertion, 0);
  objc_storeStrong((id *)&self->_nonVisibleAssertion, 0);
  objc_storeStrong((id *)&self->_nonBlinkingAssertion, 0);
}

@end
