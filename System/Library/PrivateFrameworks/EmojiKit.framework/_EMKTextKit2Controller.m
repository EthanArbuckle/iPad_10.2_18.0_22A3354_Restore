@implementation _EMKTextKit2Controller

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastTouchInfo, 0);
  objc_storeStrong((id *)&self->_textEnumerator, 0);
  objc_storeStrong((id *)&self->_rippler, 0);
  objc_storeStrong((id *)&self->_rippleTimer, 0);
  objc_storeStrong((id *)&self->_overlayView, 0);
  objc_storeStrong((id *)&self->_emojiPreferences, 0);
  objc_storeStrong((id *)&self->_containerOverlayView, 0);
  objc_destroyWeak((id *)&self->_textView);
  objc_storeStrong((id *)&self->_emojiConversionLanguages, 0);
  objc_storeStrong((id *)&self->_textContainerOverlayView, 0);
}

- (void)setEmojiConversionLanguages:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setEmojiConversionActive:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  id WeakRetained;
  void *v7;
  void *v8;
  _DWORD v9[2];
  uint64_t v10;

  v3 = a3;
  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109120;
    v9[1] = v3;
    _os_log_impl(&dword_1DB196000, v5, OS_LOG_TYPE_DEFAULT, "setEmojiConversionActive: %{BOOL}d", (uint8_t *)v9, 8u);
  }

  if (self->_emojiConversionActive != v3)
  {
    self->_emojiConversionActive = v3;
    if (v3)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_textView);
      objc_msgSend(WeakRetained, "textStorage");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[_EMKTextKit2Controller _updateEmojiAttributesOfText:](self, "_updateEmojiAttributesOfText:", v7);

    }
    -[_EMKTextKit2Controller _layoutManager](self, "_layoutManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      -[_EMKTextKit2Controller _startOrStopAnimation](self, "_startOrStopAnimation");

  }
}

- (void)setDarkModeEnabled:(BOOL)a3
{
  self->_darkModeEnabled = a3;
}

+ (OS_os_log)log
{
  if (log_onceToken != -1)
    dispatch_once(&log_onceToken, &__block_literal_global_0);
  return (OS_os_log *)(id)log_logger;
}

- (_EMKTextKit2Controller)initWithTextView:(id)a3 emojiPreferences:(id)a4
{
  id v6;
  id v7;
  _EMKTextKit2Controller *v8;
  EMKGlyphRippler *v9;
  EMKGlyphRippler *rippler;
  EMKTextEnumerator *v11;
  EMKTextEnumerator *textEnumerator;
  NSArray *emojiConversionLanguages;
  _EMKTouchInfo *lastTouchInfo;
  EMKOverlayView *overlayView;
  _EMKTextContainerOverlayView *containerOverlayView;
  void *v17;
  void *v18;
  objc_super v20;

  v6 = a3;
  v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)_EMKTextKit2Controller;
  v8 = -[_EMKTextKit2Controller init](&v20, sel_init);
  if (v8)
  {
    v9 = objc_alloc_init(EMKGlyphRippler);
    rippler = v8->_rippler;
    v8->_rippler = v9;

    objc_storeWeak((id *)&v8->_textView, v6);
    objc_storeStrong((id *)&v8->_emojiPreferences, a4);
    v11 = -[EMKTextEnumerator initWithEmojiPreferences:]([EMKTextEnumerator alloc], "initWithEmojiPreferences:", v7);
    textEnumerator = v8->_textEnumerator;
    v8->_textEnumerator = v11;

    emojiConversionLanguages = v8->_emojiConversionLanguages;
    v8->_emojiConversionLanguages = (NSArray *)&unk_1EA25B958;

    *(_DWORD *)&v8->_darkModeEnabled = 256;
    lastTouchInfo = v8->_lastTouchInfo;
    v8->_lastTouchInfo = 0;

    overlayView = v8->_overlayView;
    v8->_overlayView = 0;

    containerOverlayView = v8->_containerOverlayView;
    v8->_containerOverlayView = 0;

    objc_msgSend(v6, "textLayoutManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "textContentManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setDelegate:", v8);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v17, "setRequiresCTLineRef:", 1);

  }
  return v8;
}

- (NSTextLayoutManager)_layoutManager
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_textView);
  objc_msgSend(WeakRetained, "textLayoutManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSTextLayoutManager *)v3;
}

- (void)_startRippleAnimation
{
  NSTimer *rippleTimer;
  NSTimer *v4;
  NSTimer *v5;
  id v6;

  rippleTimer = self->_rippleTimer;
  if (rippleTimer)
  {
    -[NSTimer invalidate](rippleTimer, "invalidate");
    -[_EMKTextKit2Controller setRippleTimer:](self, "setRippleTimer:", 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel_updateEmojiDisplay_, 0, 1, 0.0166666667);
    v4 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    v5 = self->_rippleTimer;
    self->_rippleTimer = v4;

    objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addTimer:forMode:", self->_rippleTimer, *MEMORY[0x1E0CEBDA0]);

  }
}

- (void)updateEmojiDisplay:(id)a3
{
  char v4;

  v4 = 0;
  -[_EMKTextContainerOverlayView updateAnimationAndGetFinished:](self->_containerOverlayView, "updateAnimationAndGetFinished:", &v4);
  if (v4)
  {
    -[_EMKTextKit2Controller setEmojiAnimationActive:](self, "setEmojiAnimationActive:", 0);
    -[_EMKTextKit2Controller __stopAnimation](self, "__stopAnimation");
  }
}

- (void)_updateEmojiAttributesOfText:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  EMKTextEnumerator *textEnumerator;
  void *v11;
  uint64_t v12;
  NSArray *obj;
  _QWORD v14[4];
  id v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = self->_emojiConversionLanguages;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v18;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v8);
        textEnumerator = self->_textEnumerator;
        objc_msgSend(v4, "string");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v4, "length");
        v14[0] = MEMORY[0x1E0C809B0];
        v14[1] = 3221225472;
        v14[2] = __55___EMKTextKit2Controller__updateEmojiAttributesOfText___block_invoke;
        v14[3] = &unk_1EA258B30;
        v15 = v4;
        v16 = v9;
        -[EMKTextEnumerator enumerateEmojiSignifiersInString:touchingRange:language:usingBlock:](textEnumerator, "enumerateEmojiSignifiersInString:touchingRange:language:usingBlock:", v11, 0, v12, v9, v14);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v6);
  }

}

- (void)_startOrStopAnimation
{
  id v3;

  if (self->_emojiAnimationActive)
  {
    if (!self->_emojiConversionActive)
      -[_EMKTextKit2Controller __stopAnimation](self, "__stopAnimation");
  }
  else if (self->_emojiConversionActive)
  {
    -[_EMKTextKit2Controller __startAnimation](self, "__startAnimation");
  }
  else
  {
    -[_EMKTextKit2Controller textView](self, "textView");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_setTokenListsHighlighted_emk:rippler:", 0, self->_rippler);

  }
}

- (void)setTextContainerOverlayView:(id)a3
{
  UIView *v5;
  UIView *textContainerOverlayView;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  id WeakRetained;
  UIView *v18;

  v5 = (UIView *)a3;
  textContainerOverlayView = self->_textContainerOverlayView;
  if (textContainerOverlayView != v5)
  {
    v18 = v5;
    -[UIView removeFromSuperview](textContainerOverlayView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_textContainerOverlayView, a3);
    -[_EMKTextKit2Controller textView](self, "textView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_containerView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "frame");
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;

    -[UIView setFrame:](self->_textContainerOverlayView, "setFrame:", v10, v12, v14, v16);
    WeakRetained = objc_loadWeakRetained((id *)&self->_textView);
    objc_msgSend(WeakRetained, "addSubview:", self->_textContainerOverlayView);

    v5 = v18;
  }

}

- (UIView)textContainerOverlayView
{
  return self->_textContainerOverlayView;
}

- (void)__stopAnimation
{
  NSObject *v3;
  _EMKTextContainerOverlayView *containerOverlayView;
  id WeakRetained;
  id v6;
  uint8_t v7[16];

  objc_msgSend((id)objc_opt_class(), "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1DB196000, v3, OS_LOG_TYPE_DEFAULT, "Stopping animation", v7, 2u);
  }

  self->_emojiAnimationActive = 0;
  -[NSTimer invalidate](self->_rippleTimer, "invalidate");
  -[_EMKTextContainerOverlayView removeFromSuperview](self->_containerOverlayView, "removeFromSuperview");
  containerOverlayView = self->_containerOverlayView;
  self->_containerOverlayView = 0;

  -[_EMKTextKit2Controller setRippleTimer:](self, "setRippleTimer:", 0);
  WeakRetained = objc_loadWeakRetained((id *)&self->_textView);
  objc_msgSend(WeakRetained, "_setTokenListsHidden_emk:", 0);

  v6 = objc_loadWeakRetained((id *)&self->_textView);
  objc_msgSend(v6, "_setTokenListsHighlighted_emk:rippler:", self->_emojiConversionActive, self->_rippler);

}

- (void)__startAnimation
{
  NSObject *v3;
  _BOOL4 darkModeEnabled;
  _EMKTextContainerOverlayView *containerOverlayView;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  _EMKTextContainerOverlayView *v16;
  _EMKTextContainerOverlayView *v17;
  id WeakRetained;
  _EMKTextContainerOverlayView *v19;
  id v20;
  id v21;
  _QWORD block[5];
  uint8_t buf[4];
  _BOOL4 v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    darkModeEnabled = self->_darkModeEnabled;
    *(_DWORD *)buf = 67109120;
    v24 = darkModeEnabled;
    _os_log_impl(&dword_1DB196000, v3, OS_LOG_TYPE_DEFAULT, "Starting animation with dark mode: %{BOOL}d", buf, 8u);
  }

  self->_emojiAnimationActive = 1;
  -[EMKGlyphRippler startWithDarkMode:](self->_rippler, "startWithDarkMode:", self->_darkModeEnabled);
  containerOverlayView = self->_containerOverlayView;
  if (!containerOverlayView)
  {
    -[_EMKTextKit2Controller textView](self, "textView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_containerView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "frame");
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;

    v16 = -[_EMKTextContainerOverlayView initWithFrame:rippler:]([_EMKTextContainerOverlayView alloc], "initWithFrame:rippler:", self->_rippler, v9, v11, v13, v15);
    v17 = self->_containerOverlayView;
    self->_containerOverlayView = v16;

    WeakRetained = objc_loadWeakRetained((id *)&self->_textView);
    objc_msgSend(WeakRetained, "addSubview:", self->_containerOverlayView);

    v19 = self->_containerOverlayView;
    v20 = objc_loadWeakRetained((id *)&self->_textView);
    -[_EMKTextContainerOverlayView prepareWithTextView:](v19, "prepareWithTextView:", v20);

    containerOverlayView = self->_containerOverlayView;
  }
  -[_EMKTextContainerOverlayView startAnimation](containerOverlayView, "startAnimation");
  self->_emojiAnimationActive = 1;
  v21 = objc_loadWeakRetained((id *)&self->_textView);
  objc_msgSend(v21, "_setTokenListsHidden_emk:", 1);

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42___EMKTextKit2Controller___startAnimation__block_invoke;
  block[3] = &unk_1EA258B58;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

- (BOOL)touchHasEmojiSignificance:(id)a3
{
  id v4;
  id WeakRetained;
  double v6;
  double v7;
  double v8;
  double v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  _BOOL4 v20;
  __int128 v21;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  BOOL v28;
  _EMKTouchInfo *lastTouchInfo;
  void *v31;
  _QWORD v32[5];
  id v33;
  id v34;
  uint64_t *v35;
  uint64_t *v36;
  _BYTE *v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  char v41;
  _QWORD v42[4];
  id v43;
  _EMKTextKit2Controller *v44;
  uint64_t *v45;
  _BYTE *v46;
  double v47;
  double v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t (*v52)(uint64_t, uint64_t);
  void (*v53)(uint64_t);
  id v54;
  _BYTE buf[24];
  void *v56;
  __int128 v57;
  __int128 v58;
  uint64_t v59;
  CGPoint v60;

  v59 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[_EMKTextKit2Controller isEmojiConversionActive](self, "isEmojiConversionActive")
    && -[_EMKTextKit2Controller isEmojiConversionEnabled](self, "isEmojiConversionEnabled"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_textView);
    objc_msgSend(v4, "locationInView:", WeakRetained);
    v7 = v6;
    v9 = v8;

    objc_msgSend((id)objc_opt_class(), "log");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v60.x = v7;
      v60.y = v9;
      NSStringFromCGPoint(v60);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      *(_QWORD *)&buf[4] = v4;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v11;
      _os_log_impl(&dword_1DB196000, v10, OS_LOG_TYPE_DEFAULT, "touchHasEmojiSignificance: %p - location: %@", buf, 0x16u);

    }
    v12 = objc_loadWeakRetained((id *)&self->_textView);
    objc_msgSend(v12, "textLayoutManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "textContainer");
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = objc_loadWeakRetained((id *)&self->_textView);
    objc_msgSend(v14, "textLayoutManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "documentRange");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "ensureLayoutForRange:", v16);
    objc_msgSend(v16, "location");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "lineFragmentRangeForPoint:inContainerAtLocation:", v17, v7, v9);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)objc_opt_class(), "log");
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
    if (v18)
    {
      if (v20)
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v18;
        _os_log_impl(&dword_1DB196000, v19, OS_LOG_TYPE_DEFAULT, "touchHasEmojiSignificance: => Touched line range: %@", buf, 0xCu);
      }

      v49 = 0;
      v50 = &v49;
      v51 = 0x3032000000;
      v52 = __Block_byref_object_copy_;
      v53 = __Block_byref_object_dispose_;
      v54 = 0;
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x4010000000;
      v56 = &unk_1DB1A32D1;
      v21 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
      v57 = *MEMORY[0x1E0C9D648];
      v58 = v21;
      objc_msgSend(v18, "location");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = MEMORY[0x1E0C809B0];
      v42[0] = MEMORY[0x1E0C809B0];
      v42[1] = 3221225472;
      v42[2] = __52___EMKTextKit2Controller_touchHasEmojiSignificance___block_invoke;
      v42[3] = &unk_1EA258BA8;
      v24 = v15;
      v43 = v24;
      v44 = self;
      v47 = v7;
      v48 = v9;
      v45 = &v49;
      v46 = buf;
      objc_msgSend(v24, "enumerateSubstringsFromLocation:options:usingBlock:", v22, 3, v42);

      v25 = (void *)v50[5];
      if (v25)
      {
        v38 = 0;
        v39 = &v38;
        v40 = 0x2020000000;
        v41 = 0;
        objc_msgSend(v25, "location");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v32[0] = v23;
        v32[1] = 3221225472;
        v32[2] = __52___EMKTextKit2Controller_touchHasEmojiSignificance___block_invoke_49;
        v32[3] = &unk_1EA258BF8;
        v32[4] = self;
        v33 = v24;
        v34 = v16;
        v35 = &v49;
        v36 = &v38;
        v37 = buf;
        v27 = (id)objc_msgSend(v33, "enumerateTextLayoutFragmentsFromLocation:options:usingBlock:", v26, 0, v32);

        if (*((_BYTE *)v39 + 24))
        {
          v28 = 1;
        }
        else
        {
          lastTouchInfo = self->_lastTouchInfo;
          self->_lastTouchInfo = 0;

          v28 = *((_BYTE *)v39 + 24) != 0;
        }

        _Block_object_dispose(&v38, 8);
      }
      else
      {
        v28 = 0;
      }

      _Block_object_dispose(buf, 8);
      _Block_object_dispose(&v49, 8);

    }
    else
    {
      if (v20)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DB196000, v19, OS_LOG_TYPE_DEFAULT, "touchHasEmojiSignificance: => no line touched.", buf, 2u);
      }

      v28 = 0;
    }

  }
  else
  {
    v28 = 0;
  }

  return v28;
}

- (void)textTapGestureRecognized:(id)a3
{
  id v4;
  int v5;
  NSObject *v6;
  _EMKTouchInfo *lastTouchInfo;
  id WeakRetained;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  EMKOverlayView *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  id v25;
  id v26;
  EMKOverlayView *v27;
  EMKOverlayView *overlayView;
  _QWORD v29[4];
  id v30;
  id v31;
  _EMKTextKit2Controller *v32;
  id v33[3];
  uint8_t buf[4];
  id v35;
  __int16 v36;
  int v37;
  __int16 v38;
  _EMKTouchInfo *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_emojiConversionEnabled && self->_emojiConversionActive)
    v5 = objc_msgSend(MEMORY[0x1E0CEA3C8], "sharedCalloutBarIsVisible") ^ 1;
  else
    v5 = 0;
  objc_msgSend((id)objc_opt_class(), "log");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    lastTouchInfo = self->_lastTouchInfo;
    *(_DWORD *)buf = 138412802;
    v35 = v4;
    v36 = 1024;
    v37 = v5;
    v38 = 2112;
    v39 = lastTouchInfo;
    _os_log_impl(&dword_1DB196000, v6, OS_LOG_TYPE_DEFAULT, "textTapGestureRecognized: %@ - shouldProcess: %{BOOL}d - lastTouchInfo: %@", buf, 0x1Cu);
  }

  if (v5)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_textView);
    objc_msgSend(WeakRetained, "text");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (void *)-[_EMKTouchInfo tokenListRange](self->_lastTouchInfo, "tokenListRange");
    v12 = v11;
    objc_msgSend(v9, "substringWithRange:", v10, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak((id *)buf, self);
    v14 = [EMKOverlayView alloc];
    -[_EMKTextKit2Controller textView](self, "textView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[_EMKTouchInfo frame](self->_lastTouchInfo, "frame");
    v17 = v16;
    v19 = v18;
    v21 = v20;
    v23 = v22;
    -[_EMKTouchInfo tokenList](self->_lastTouchInfo, "tokenList");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __51___EMKTextKit2Controller_textTapGestureRecognized___block_invoke;
    v29[3] = &unk_1EA258C20;
    objc_copyWeak(v33, (id *)buf);
    v33[1] = v10;
    v33[2] = v12;
    v25 = v9;
    v30 = v25;
    v26 = v13;
    v31 = v26;
    v32 = self;
    v27 = -[EMKOverlayView initWithView:anchorRect:emojiTokenList:selectionHandler:](v14, "initWithView:anchorRect:emojiTokenList:selectionHandler:", v15, v24, v29, v17, v19, v21, v23);
    overlayView = self->_overlayView;
    self->_overlayView = v27;

    objc_destroyWeak(v33);
    objc_destroyWeak((id *)buf);

  }
}

- (void)replaceRange:(_NSRange)a3 withEmojiToken:(id)a4 language:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id WeakRetained;
  void *v18;
  id v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  id v31;
  id v32;
  void *v33;
  id v34;
  EMKEmojiSignifier *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  void *v42;
  id v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  uint8_t buf[4];
  void *v51;
  uint64_t v52;
  NSRange v53;

  length = a3.length;
  location = a3.location;
  v52 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v49 = a5;
  objc_msgSend((id)objc_opt_class(), "log");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v53.location = location;
    v53.length = length;
    NSStringFromRange(v53);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v51 = v11;
    _os_log_impl(&dword_1DB196000, v10, OS_LOG_TYPE_DEFAULT, "replaceRange:withEmojiToken:language: - range: %@", buf, 0xCu);

  }
  v48 = v9;
  objc_msgSend(v9, "string");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = objc_msgSend(v12, "length");
  -[_EMKTextKit2Controller textView](self, "textView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "attributedText");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "attributedSubstringFromRange:", location, length);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "string");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  WeakRetained = objc_loadWeakRetained((id *)&self->_textView);
  objc_msgSend(WeakRetained, "beginningOfDocument");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = objc_loadWeakRetained((id *)&self->_textView);
  objc_msgSend(v19, "positionFromPosition:offset:", v18, location);
  v20 = objc_claimAutoreleasedReturnValue();

  v21 = objc_loadWeakRetained((id *)&self->_textView);
  objc_msgSend(v21, "positionFromPosition:offset:", v18, location + length);
  v22 = objc_claimAutoreleasedReturnValue();

  v23 = objc_loadWeakRetained((id *)&self->_textView);
  v46 = (void *)v22;
  v47 = (void *)v20;
  objc_msgSend(v23, "textRangeFromPosition:toPosition:", v20, v22);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = objc_loadWeakRetained((id *)&self->_textView);
  objc_msgSend(v25, "inputDelegate");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_loadWeakRetained((id *)&self->_textView);
  objc_msgSend(v26, "textWillChange:", v27);

  v28 = objc_loadWeakRetained((id *)&self->_textView);
  objc_msgSend(v28, "replaceRange:withText:", v24, v12);

  v29 = objc_loadWeakRetained((id *)&self->_textView);
  objc_msgSend(v29, "inputDelegate");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_loadWeakRetained((id *)&self->_textView);
  objc_msgSend(v30, "textDidChange:", v31);

  if (objc_msgSend(v16, "isEqualToString:", v12))
  {
    v44 = v24;
    v32 = objc_loadWeakRetained((id *)&self->_textView);
    objc_msgSend(v32, "inputDelegate");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_loadWeakRetained((id *)&self->_textView);
    objc_msgSend(v33, "textWillChange:", v34);

    v35 = -[EMKEmojiSignifier initWithString:]([EMKEmojiSignifier alloc], "initWithString:", v16);
    objc_msgSend((id)objc_opt_class(), "log");
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DB196000, v36, OS_LOG_TYPE_DEFAULT, "Adding attributes…", buf, 2u);
    }

    -[_EMKTextKit2Controller textView](self, "textView");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "attributedText");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = (void *)objc_msgSend(v38, "mutableCopy");

    objc_msgSend(v39, "addAttribute:value:range:", CFSTR("EMKEmojiSignifier"), v35, location, v45);
    if (v49)
      objc_msgSend(v39, "addAttribute:value:range:", CFSTR("EMKEmojiConversionLanguage"), v49, location, v45);
    v40 = objc_loadWeakRetained((id *)&self->_textView);
    objc_msgSend(v40, "setAttributedText:", v39);

    v41 = objc_loadWeakRetained((id *)&self->_textView);
    objc_msgSend(v41, "inputDelegate");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_loadWeakRetained((id *)&self->_textView);
    objc_msgSend(v42, "textDidChange:", v43);

    v24 = v44;
  }
  -[EMFEmojiPreferences didUseEmoji:usageMode:typingName:replacementContext:](self->_emojiPreferences, "didUseEmoji:usageMode:typingName:replacementContext:", v48, *MEMORY[0x1E0D1F220], 0, v16, v44);

}

- (void)textViewDidLayoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  dispatch_time_t v15;
  _QWORD block[5];

  -[_EMKTextKit2Controller textView](self, "textView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[_EMKTextKit2Controller textView](self, "textView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_containerView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bounds");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    -[_EMKTextKit2Controller textContainerOverlayView](self, "textContainerOverlayView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setFrame:", v7, v9, v11, v13);

  }
  if (self->_overlayView)
  {
    v15 = dispatch_time(0, 10000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __51___EMKTextKit2Controller_textViewDidLayoutSubviews__block_invoke;
    block[3] = &unk_1EA258B58;
    block[4] = self;
    dispatch_after(v15, MEMORY[0x1E0C80D38], block);
  }

}

- (void)_updateOverlayView
{
  EMKOverlayView *overlayView;
  id v4;

  overlayView = self->_overlayView;
  if (overlayView)
  {
    -[_EMKTextKit2Controller textView](self, "textView");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[_EMKTouchInfo frame](self->_lastTouchInfo, "frame");
    -[EMKOverlayView setView:anchorRect:](overlayView, "setView:anchorRect:", v4);

  }
}

- (void)dismissOverlayView
{
  NSObject *v3;
  EMKOverlayView *overlayView;
  int v5;
  _EMKTextKit2Controller *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (self->_overlayView)
  {
    objc_msgSend((id)objc_opt_class(), "log");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 134217984;
      v6 = self;
      _os_log_impl(&dword_1DB196000, v3, OS_LOG_TYPE_DEFAULT, "Dismissing overlay view: %p", (uint8_t *)&v5, 0xCu);
    }

    -[EMKOverlayView dismiss](self->_overlayView, "dismiss");
    overlayView = self->_overlayView;
    self->_overlayView = 0;

  }
}

- (BOOL)textContentManager:(id)a3 shouldEnumerateTextElement:(id)a4 options:(unint64_t)a5
{
  return 1;
}

- (id)textContentStorage:(id)a3 textParagraphWithRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  length = a4.length;
  location = a4.location;
  v7 = a3;
  v8 = v7;
  if (self->_emojiConversionEnabled && self->_emojiConversionActive)
  {
    objc_msgSend(v7, "textStorage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "attributedSubstringFromRange:", location, length);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (void *)objc_msgSend(v10, "mutableCopy");
    -[_EMKTextKit2Controller _updateEmojiAttributesOfText:](self, "_updateEmojiAttributesOfText:", v11);
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC1310]), "initWithAttributedString:", v11);

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)isDarkModeEnabled
{
  return self->_darkModeEnabled;
}

- (BOOL)isEmojiConversionEnabled
{
  return self->_emojiConversionEnabled;
}

- (void)setEmojiConversionEnabled:(BOOL)a3
{
  self->_emojiConversionEnabled = a3;
}

- (BOOL)isEmojiConversionActive
{
  return self->_emojiConversionActive;
}

- (NSArray)emojiConversionLanguages
{
  return self->_emojiConversionLanguages;
}

- (EMKTextView)textView
{
  return (EMKTextView *)objc_loadWeakRetained((id *)&self->_textView);
}

- (void)setTextView:(id)a3
{
  objc_storeWeak((id *)&self->_textView, a3);
}

- (_EMKTextContainerOverlayView)containerOverlayView
{
  return self->_containerOverlayView;
}

- (void)setContainerOverlayView:(id)a3
{
  objc_storeStrong((id *)&self->_containerOverlayView, a3);
}

- (EMFEmojiPreferences)emojiPreferences
{
  return (EMFEmojiPreferences *)objc_getProperty(self, a2, 48, 1);
}

- (void)setEmojiPreferences:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (EMKOverlayView)overlayView
{
  return (EMKOverlayView *)objc_getProperty(self, a2, 56, 1);
}

- (void)setOverlayView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSTimer)rippleTimer
{
  return (NSTimer *)objc_getProperty(self, a2, 64, 1);
}

- (void)setRippleTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (EMKGlyphRippler)rippler
{
  return self->_rippler;
}

- (void)setRippler:(id)a3
{
  objc_storeStrong((id *)&self->_rippler, a3);
}

- (EMKTextEnumerator)textEnumerator
{
  return self->_textEnumerator;
}

- (void)setTextEnumerator:(id)a3
{
  objc_storeStrong((id *)&self->_textEnumerator, a3);
}

- (_EMKTouchInfo)lastTouchInfo
{
  return self->_lastTouchInfo;
}

- (void)setLastTouchInfo:(id)a3
{
  objc_storeStrong((id *)&self->_lastTouchInfo, a3);
}

- (BOOL)isEmojiAnimationActive
{
  return self->_emojiAnimationActive;
}

- (void)setEmojiAnimationActive:(BOOL)a3
{
  self->_emojiAnimationActive = a3;
}

@end
