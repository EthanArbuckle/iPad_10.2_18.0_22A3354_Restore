@implementation CKMentionsAnimationController

- (CKMentionsAnimationController)initWithEntryTextView:(id)a3
{
  id v6;
  CKMentionsAnimationController *v7;
  uint64_t v8;
  NSMutableDictionary *animationsByIdentifier;
  CKMentionsTextContainerOverlayView *overlayView;
  void *v12;
  objc_super v13;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CKMentionsAnimationController.m"), 72, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("textView"));

  }
  v13.receiver = self;
  v13.super_class = (Class)CKMentionsAnimationController;
  v7 = -[CKMentionsAnimationController init](&v13, sel_init);
  if (v7)
  {
    v8 = objc_opt_new();
    animationsByIdentifier = v7->_animationsByIdentifier;
    v7->_animationsByIdentifier = (NSMutableDictionary *)v8;

    objc_storeStrong((id *)&v7->_textView, a3);
    overlayView = v7->_overlayView;
    v7->_overlayView = 0;

  }
  return v7;
}

- (void)updateMentionAttributes:(id)a3
{
  NSAttributedString *v4;
  NSAttributedString *mentionAttributes;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];

  v4 = (NSAttributedString *)a3;
  mentionAttributes = self->_mentionAttributes;
  if (mentionAttributes == v4
    || -[NSAttributedString isEqualToAttributedString:](mentionAttributes, "isEqualToAttributedString:", v4))
  {
    -[CKMentionsAnimationController didSetAttributedTextOfTextView](self, "didSetAttributedTextOfTextView");
  }
  else
  {
    -[CKMentionsAnimationController setMentionAttributes:](self, "setMentionAttributes:", v4);
    -[CKMentionsAnimationController textView](self, "textView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "textLayoutManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v7, "setRequiresCTLineRef:", 1);
    objc_msgSend(v7, "documentRange");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "ensureLayoutForRange:", v8);

    -[CKMentionsAnimationController mentionAttributes](self, "mentionAttributes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __57__CKMentionsAnimationController_updateMentionAttributes___block_invoke;
    v10[3] = &unk_1E274B3F0;
    v10[4] = self;
    objc_msgSend(v9, "ck_enumerateAllMentionAnimationIdentifiersUsingBlock:", v10);

    -[CKMentionsAnimationController didSetAttributedTextOfTextView](self, "didSetAttributedTextOfTextView");
  }

}

void __57__CKMentionsAnimationController_updateMentionAttributes___block_invoke(uint64_t a1, void *a2, NSUInteger a3, NSUInteger a4)
{
  id v7;
  void *v8;
  CKMentionRippler *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;
  NSRange v17;

  v16 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v9 = objc_alloc_init(CKMentionRippler);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setObject:forKeyedSubscript:", v9, v7);
    -[CKMentionRippler start](v9, "start");
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v17.location = a3;
        v17.length = a4;
        NSStringFromRange(v17);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 138412546;
        v13 = v11;
        v14 = 2112;
        v15 = v7;
        _os_log_impl(&dword_18DFCD000, v10, OS_LOG_TYPE_INFO, "Setting up animation for range: %@ - identifier: %@", (uint8_t *)&v12, 0x16u);

      }
    }
    objc_msgSend(*(id *)(a1 + 32), "_startAnimationIfNeeded");

  }
}

- (void)didSetAttributedTextOfTextView
{
  BOOL v3;
  int v4;
  NSObject *v5;
  NSObject *v6;
  uint8_t v7[16];
  uint8_t buf[16];

  v3 = -[CKMentionsAnimationController isAnyMentionAnimationActive](self, "isAnyMentionAnimationActive");
  v4 = IMOSLoggingEnabled();
  if (v3)
  {
    if (v4)
    {
      OSLogHandleForIMFoundationCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v7 = 0;
        _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "didSetAttributedTextOfTextView - at least 1 animation is active - hiding animating mentions…", v7, 2u);
      }

    }
    -[CKMentionsAnimationController textView](self, "textView");
    v6 = objc_claimAutoreleasedReturnValue();
    -[NSObject _setAnimatingMentionsHidden:](v6, "_setAnimatingMentionsHidden:", 1);
LABEL_7:

    return;
  }
  if (v4)
  {
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18DFCD000, v6, OS_LOG_TYPE_INFO, "didSetAttributedTextOfTextView - returning early because no animation is active", buf, 2u);
    }
    goto LABEL_7;
  }
}

- (void)_startAnimationIfNeeded
{
  CKMentionsTextContainerOverlayView *overlayView;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  char v9;
  CKMentionsTextContainerOverlayView *v10;
  void *v11;
  CKMentionsTextContainerOverlayView *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint8_t v19[16];
  uint8_t buf[16];

  overlayView = self->_overlayView;
  if (self->_mentionTimer)
  {
    if (overlayView)
      goto LABEL_3;
  }
  else if (!overlayView)
  {
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CKMentionsAnimationController.m"), 142, CFSTR("Invalid state"));

  if (self->_mentionTimer)
  {
LABEL_3:
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "_startAnimationIfNeeded – return early because animation already running.", buf, 2u);
      }

    }
    return;
  }
LABEL_9:
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_INFO, "_startAnimationIfNeeded – animation needed!", v19, 2u);
    }

  }
  -[CKMentionsAnimationController textView](self, "textView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    v10 = [CKMentionsTextContainerOverlayView alloc];
    -[CKMentionsAnimationController textView](self, "textView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[CKMentionsTextContainerOverlayView initWithFrame:textView:](v10, "initWithFrame:textView:", v11, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[CKMentionsAnimationController setOverlayView:](self, "setOverlayView:", v12);

    -[CKMentionsAnimationController overlayView](self, "overlayView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMentionsAnimationController textView](self, "textView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setTextContainerOverlayView:", v13);

    objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel_updateMentionDisplay, 0, 1, 0.0166666667);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMentionsAnimationController setMentionTimer:](self, "setMentionTimer:", v15);

    objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMentionsAnimationController mentionTimer](self, "mentionTimer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addTimer:forMode:", v17, *MEMORY[0x1E0CEBDA0]);

    -[CKMentionsAnimationController textView](self, "textView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setNeedsDisplayCurrentRenderAttributes");

    -[CKMentionsAnimationController updateMentionDisplay](self, "updateMentionDisplay");
  }
}

- (void)stopTimerRemovingAttribute:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  _DWORD v10[2];
  uint64_t v11;

  v3 = a3;
  v11 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v10[0] = 67109120;
      v10[1] = v3;
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "stopTimerRemovingAttribute: %{BOOL}d", (uint8_t *)v10, 8u);
    }

  }
  -[CKMentionsAnimationController updateDisplayForMentionGlyphRangeRemovingAttribute:](self, "updateDisplayForMentionGlyphRangeRemovingAttribute:", v3);
  -[CKMentionsAnimationController mentionTimer](self, "mentionTimer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "invalidate");

  -[CKMentionsAnimationController setMentionTimer:](self, "setMentionTimer:", 0);
  -[CKMentionsAnimationController textView](self, "textView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[CKMentionsAnimationController textView](self, "textView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTextContainerOverlayView:", 0);

  }
  -[CKMentionsAnimationController setOverlayView:](self, "setOverlayView:", 0);
}

- (void)updateDisplayForMentionGlyphRangeRemovingAttribute:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v3 = a3;
  v19 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      LODWORD(v17) = 67109120;
      HIDWORD(v17) = v3;
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "updateDisplayForMentionGlyphRangeRemovingAttribute: %{BOOL}d", (uint8_t *)&v17, 8u);
    }

  }
  -[CKMentionsAnimationController mentionAttributes](self, "mentionAttributes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  v17 = 0;
  v18 = 0;
  -[CKMentionsAnimationController textView](self, "textView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "textStorage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "length");

  v11 = objc_msgSend(v7, "length");
  if (v11)
  {
    v12 = 0;
    v13 = *MEMORY[0x1E0D381C8];
    do
    {
      objc_msgSend(v7, "attribute:atIndex:longestEffectiveRange:inRange:", v13, v12, &v17, v12, v11 - v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (v14 && objc_msgSend(v14, "length") && v18 + v17 <= v10 && v3)
        -[CKMentionsAnimationController _delegateDidFinishMentionAnimationWithIdentifier:](self, "_delegateDidFinishMentionAnimationWithIdentifier:", v15);

      v12 = v18 + v17;
    }
    while (v18 + v17 < v11);
  }

}

- (BOOL)isAnyMentionAnimationActive
{
  NSAttributedString *mentionAttributes;
  void *v4;
  NSObject *v5;
  int v6;
  char v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;
  uint8_t buf[4];
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  mentionAttributes = self->_mentionAttributes;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __60__CKMentionsAnimationController_isAnyMentionAnimationActive__block_invoke;
  v9[3] = &unk_1E274B418;
  v9[4] = self;
  v9[5] = &v10;
  -[NSAttributedString ck_enumerateAllMentionAnimationIdentifiersUsingBlock:](mentionAttributes, "ck_enumerateAllMentionAnimationIdentifiersUsingBlock:", v9);
  if (!*((_BYTE *)v11 + 24))
  {
    -[CKMentionsAnimationController animationsByIdentifier](self, "animationsByIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeAllObjects");

  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = *((unsigned __int8 *)v11 + 24);
      *(_DWORD *)buf = 67109120;
      v15 = v6;
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "isAnyMentionAnimationActive: %{BOOL}d", buf, 8u);
    }

  }
  v7 = *((_BYTE *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  return v7;
}

void __60__CKMentionsAnimationController_isAnyMentionAnimationActive__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v6;
  void *v7;
  BOOL v8;
  void *v9;
  id v10;

  v10 = a2;
  objc_msgSend(*(id *)(a1 + 32), "animationsByIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    v8 = a4 == 0;
  else
    v8 = 1;
  if (!v8)
  {
    if (objc_msgSend(v7, "finishedForGlyphIndex:numberOfGlyphs:timeIndex:", a4 - 1, a4, objc_msgSend(v7, "currentTimeIndex")))
    {
      objc_msgSend(*(id *)(a1 + 32), "animationsByIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "removeObjectForKey:", v10);

    }
    else
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    }
  }

}

- (void)updateMentionDisplay
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  uint8_t v7[16];

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_18DFCD000, v3, OS_LOG_TYPE_INFO, "updateMentionDisplay", v7, 2u);
    }

  }
  -[CKMentionsAnimationController updateDisplayForMentionGlyphRangeRemovingAttribute:](self, "updateDisplayForMentionGlyphRangeRemovingAttribute:", 0);
  if (!-[CKMentionsAnimationController isAnyMentionAnimationActive](self, "isAnyMentionAnimationActive"))
    -[CKMentionsAnimationController stopTimerRemovingAttribute:](self, "stopTimerRemovingAttribute:", 1);
  -[CKMentionsAnimationController overlayView](self, "overlayView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKMentionsAnimationController animationsByIdentifier](self, "animationsByIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "updateUsingAnimations:", v6);

}

- (void)_delegateDidFinishMentionAnimationWithIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  id WeakRetained;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v7 = 138412290;
      v8 = v4;
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "_delegateDidFinishMentionAnimationWithIdentifier: %@", (uint8_t *)&v7, 0xCu);
    }

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "mentionsAnimationController:didFinishMentionAnimationWithIdentifier:", self, v4);

}

- (CKMentionsAnimationControllerDelegate)delegate
{
  return (CKMentionsAnimationControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSAttributedString)mentionAttributes
{
  return self->_mentionAttributes;
}

- (void)setMentionAttributes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (CKMessageEntryTextView)textView
{
  return self->_textView;
}

- (void)setTextView:(id)a3
{
  objc_storeStrong((id *)&self->_textView, a3);
}

- (NSMutableDictionary)animationsByIdentifier
{
  return self->_animationsByIdentifier;
}

- (void)setAnimationsByIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_animationsByIdentifier, a3);
}

- (NSTimer)mentionTimer
{
  return self->_mentionTimer;
}

- (void)setMentionTimer:(id)a3
{
  objc_storeStrong((id *)&self->_mentionTimer, a3);
}

- (CKMentionsTextContainerOverlayView)overlayView
{
  return self->_overlayView;
}

- (void)setOverlayView:(id)a3
{
  objc_storeStrong((id *)&self->_overlayView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overlayView, 0);
  objc_storeStrong((id *)&self->_mentionTimer, 0);
  objc_storeStrong((id *)&self->_animationsByIdentifier, 0);
  objc_storeStrong((id *)&self->_textView, 0);
  objc_storeStrong((id *)&self->_mentionAttributes, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
