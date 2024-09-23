@implementation PKTiledTextView

void __38__PKTiledTextView_updateEndAttachment__block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  void *v4;
  char v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  id v21;

  v2 = objc_msgSend(*(id *)(a1 + 32), "hasEndAttachment");
  objc_msgSend(*(id *)(a1 + 32), "standInEndAttachmentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v3;
  if (v2)
  {
    objc_msgSend(v3, "setHidden:", 1);
LABEL_3:

    return;
  }
  objc_msgSend(v3, "setHidden:", 0);

  objc_msgSend(*(id *)(a1 + 32), "canvasView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isDrawing");

  if ((v5 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "frameOfEndAttachment");
    if (v9 > 0.0)
    {
      v10 = v6;
      v11 = v7;
      v12 = v8;
      v13 = v9;
      objc_msgSend(*(id *)(a1 + 32), "standInEndAttachmentView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "frame");
      if (vabdd_f64(v18, v10) >= 0.01 || vabdd_f64(v15, v11) >= 0.01)
      {

      }
      else
      {
        v19 = v17;
        v20 = vabdd_f64(v16, v12);

        if (v20 < 0.01 && vabdd_f64(v19, v13) < 0.01)
          return;
      }
      objc_msgSend(*(id *)(a1 + 32), "standInEndAttachmentView");
      v21 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setFrame:", v10, v11, v12, v13);
      goto LABEL_3;
    }
  }
}

uint64_t __33__PKTiledTextView_textDidChange___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "updateTilesForVisibleRect");
  return objc_msgSend(*(id *)(a1 + 32), "updateEndAttachment");
}

- (void)updateEndAttachment
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __38__PKTiledTextView_updateEndAttachment__block_invoke;
  v2[3] = &unk_1E7778020;
  v2[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v2);
}

- (void)textDidChange:(id)a3
{
  dispatch_time_t v4;
  _QWORD block[5];

  v4 = dispatch_time(0, 0);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__PKTiledTextView_textDidChange___block_invoke;
  block[3] = &unk_1E7778020;
  block[4] = self;
  dispatch_after(v4, MEMORY[0x1E0C80D38], block);
}

- (UIButton)tapToRadarButton
{
  return self->_tapToRadarButton;
}

- (PKTextAttachmentDrawingViewProviderView)standInEndAttachmentView
{
  return self->_standInEndAttachmentView;
}

- (BOOL)rulerHostWantsSharedRuler
{
  return 1;
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGFloat v9;
  void *v10;
  objc_super v11;
  CGRect v12;

  v11.receiver = self;
  v11.super_class = (Class)PKTiledTextView;
  -[PKTiledView layoutSubviews](&v11, sel_layoutSubviews);
  -[PKTiledTextView tapToRadarButton](self, "tapToRadarButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PKTiledTextView tapToRadarButton](self, "tapToRadarButton");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
    v6 = v5;
    v8 = v7;

    -[PKTiledTextView bounds](self, "bounds");
    v9 = CGRectGetWidth(v12) - v6 + -30.0;
    -[PKTiledTextView tapToRadarButton](self, "tapToRadarButton");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setFrame:", v9, 70.0, v6, v8);

  }
}

- (id)initInScrollView:(id)a3 sixChannelBlending:(BOOL)a4 defaultDrawingClass:(Class)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  objc_super v34;
  _BYTE v35[128];
  uint64_t v36;

  v6 = a4;
  v36 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v34.receiver = self;
  v34.super_class = (Class)PKTiledTextView;
  v9 = -[PKTiledView initInScrollView:sixChannelBlending:defaultDrawingClass:](&v34, sel_initInScrollView_sixChannelBlending_defaultDrawingClass_, v8, v6, a5);
  if (v9)
  {
    v10 = objc_opt_class();
    PKCheckedDynamicCast(v10, v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setInsertSpaceEnabled:", 1);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *MEMORY[0x1E0DC1230];
    objc_msgSend(v11, "textStorage");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:selector:name:object:", v9, sel_textDidChange_, v13, v14);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObserver:selector:name:object:", v9, sel_textDidChange_, *MEMORY[0x1E0DC55A0], v11);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObserver:selector:name:object:", v9, sel_textDidBeginEditing_, *MEMORY[0x1E0DC5598], v11);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObserver:selector:name:object:", v9, sel_textDidEndEditing_, *MEMORY[0x1E0DC55A8], v11);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObserver:selector:name:object:", v9, sel_handwritingFeedback_, CFSTR("PKPaletteTapToRadarCommandTriggeredNotification"), 0);

    NSClassFromString(CFSTR("_UITextContainerView"));
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    objc_msgSend(v8, "subviews", 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v31;
      while (2)
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v31 != v22)
            objc_enumerationMutation(v19);
          v24 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i);
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v9, "setAttachmentContainerView:", v24);
            goto LABEL_12;
          }
        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
        if (v21)
          continue;
        break;
      }
    }
LABEL_12:

    objc_msgSend(v9, "setSupportsCopyAsText:", 1);
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "BOOLForKey:", CFSTR("PKTapToRadarButtonEnabled"));

    if (v26)
      objc_msgSend(v9, "_setupTapToRadarButton");
    objc_msgSend(v8, "addObserver:forKeyPath:options:context:", v9, CFSTR("backgroundColor"), 0, kScrollViewBackgroundColorObserverContext);
    objc_msgSend(v9, "_textView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "_updateDrawingBackgroundColor");

    v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3B18]), "initWithDelegate:", v9);
    objc_msgSend(v9, "addInteraction:", v28);

  }
  return v9;
}

- (BOOL)hasEndAttachment
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[PKTiledView attachmentViews](self, "attachmentViews", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "isAtEndOfDocument") & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (CGRect)frameOfEndAttachment
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  void *v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGRect result;

  -[PKTiledTextView _textView](self, "_textView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "textContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textContainerOrigin");
  v5 = v4;

  objc_msgSend(v2, "textStorage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  if (v7)
  {
    objc_msgSend(v2, "_frameOfTrailingWhitespace");
    v9 = v8;
    v11 = v10;
    objc_msgSend(v2, "frame");
    v13 = v12;
    if (v11 <= 0.0)
      v14 = 0.0;
    else
      v14 = 200.0;
  }
  else
  {
    objc_msgSend(v2, "contentOffset");
    v16 = v5 + v15;
    objc_msgSend(v2, "adjustedContentInset");
    v9 = v16 + v17;
    objc_msgSend(v2, "frame");
    v13 = v18;
    v14 = 200.0;
  }

  v19 = 0.0;
  v20 = v9;
  v21 = v13;
  v22 = v14;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (id)_textView
{
  uint64_t v3;
  void *v4;
  void *v5;

  v3 = objc_opt_class();
  -[PKTiledView scrollView](self, "scrollView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  PKDynamicCast(v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_scrollViewDidScroll
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PKTiledTextView;
  -[PKTiledView _scrollViewDidScroll](&v2, sel__scrollViewDidScroll);
}

- (void)_layoutSubviews
{
  void *v3;
  char v4;
  objc_super v5;

  -[PKTiledTextView _textView](self, "_textView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_freezeTextContainerSize");

  if ((v4 & 1) == 0)
  {
    v5.receiver = self;
    v5.super_class = (Class)PKTiledTextView;
    -[PKTiledView _layoutSubviews](&v5, sel__layoutSubviews);
    -[PKTiledTextView updateEndAttachment](self, "updateEndAttachment");
  }
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[PKTextAttachmentDrawingViewProviderView removeFromSuperview](self->_standInEndAttachmentView, "removeFromSuperview");
  -[PKTiledView scrollView](self, "scrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:forKeyPath:context:", self, CFSTR("backgroundColor"), kScrollViewBackgroundColorObserverContext);

  v4.receiver = self;
  v4.super_class = (Class)PKTiledTextView;
  -[PKTiledView dealloc](&v4, sel_dealloc);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v6;
  objc_super v7;

  if ((void *)kScrollViewBackgroundColorObserverContext == a6)
  {
    -[PKTiledTextView _textView](self, "_textView", a3, a4, a5);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_updateDrawingBackgroundColor");

  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)PKTiledTextView;
    -[PKTiledView observeValueForKeyPath:ofObject:change:context:](&v7, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (void)setDefaultDrawingClass:(Class)a3
{
  objc_super v5;

  if (-[PKTiledView defaultDrawingClass](self, "defaultDrawingClass") != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)PKTiledTextView;
    -[PKTiledView setDefaultDrawingClass:](&v5, sel_setDefaultDrawingClass_, a3);
    -[PKTextAttachmentDrawingViewProviderView removeFromSuperview](self->_standInEndAttachmentView, "removeFromSuperview");
  }
}

- (BOOL)_shouldExpandBottomAttachmentForDragAndDrop
{
  void *v2;
  char v3;

  -[PKTiledTextView _textView](self, "_textView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isPaperEnabled");

  return v3;
}

- (void)textDidBeginEditing:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __39__PKTiledTextView_textDidBeginEditing___block_invoke;
  v3[3] = &unk_1E7778020;
  v3[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v3, 0.25);
}

void __39__PKTiledTextView_textDidBeginEditing___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "standInEndAttachmentView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 0.0);

}

- (void)textDidEndEditing:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __37__PKTiledTextView_textDidEndEditing___block_invoke;
  v3[3] = &unk_1E7778020;
  v3[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v3, 0.25);
}

void __37__PKTiledTextView_textDidEndEditing___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "standInEndAttachmentView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 1.0);

}

- (BOOL)_shouldUpdateHeightOfAttachments
{
  return 1;
}

- (BOOL)_shouldPreventScrollViewPanGestureWhilePreviewing
{
  return 0;
}

- (id)standInAttachmentView
{
  PKTextAttachmentDrawingViewProviderView *standInEndAttachmentView;
  objc_class *v4;
  void *v5;
  objc_class *v6;
  id v7;
  void *v8;
  void *v9;
  PKTextAttachmentDrawingViewProviderView *v10;
  PKTextAttachmentDrawingViewProviderView *v11;
  void *v12;

  standInEndAttachmentView = self->_standInEndAttachmentView;
  if (!standInEndAttachmentView)
  {
    v4 = +[PKTextAttachmentDrawingViewProvider drawingViewClassForDrawingClass:](PKTextAttachmentDrawingViewProvider, "drawingViewClassForDrawingClass:", -[PKTiledView defaultDrawingClass](self, "defaultDrawingClass"));
    -[objc_class fileType](-[PKTiledView defaultDrawingClass](self, "defaultDrawingClass"), "fileType");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (objc_class *)objc_msgSend(MEMORY[0x1E0DC12B0], "textAttachmentClassForFileType:", v5);
    if (!v6)
      v6 = (objc_class *)objc_opt_class();
    v7 = [v6 alloc];
    objc_msgSend(MEMORY[0x1E0C99D50], "data");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithData:ofType:", v8, v5);

    v10 = (PKTextAttachmentDrawingViewProviderView *)objc_msgSend([v4 alloc], "initWithAttachment:drawingClass:inserted:", v9, -[PKTiledView defaultDrawingClass](self, "defaultDrawingClass"), 0);
    v11 = self->_standInEndAttachmentView;
    self->_standInEndAttachmentView = v10;

    -[PKTextAttachmentDrawingViewProviderView setFrame:](self->_standInEndAttachmentView, "setFrame:", 0.0, 0.0, 1000.0, 200.0);
    -[PKTextAttachmentDrawingViewProviderView setUserInteractionEnabled:](self->_standInEndAttachmentView, "setUserInteractionEnabled:", 0);
    -[PKTiledTextView _textView](self, "_textView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addSubview:", self->_standInEndAttachmentView);

    standInEndAttachmentView = self->_standInEndAttachmentView;
  }
  return (id)-[PKTextAttachmentDrawingViewProviderView topLevelAttachmentView](standInEndAttachmentView, "topLevelAttachmentView");
}

- (BOOL)canAddStroke
{
  void *v2;
  char v3;

  -[PKTiledTextView _textView](self, "_textView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_canAddStroke");

  return v3;
}

- (void)_canvasViewWillCreateSnapshot
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKTiledTextView;
  -[PKTiledView _canvasViewWillCreateSnapshot](&v4, sel__canvasViewWillCreateSnapshot);
  -[PKTiledTextView _textView](self, "_textView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_canvasViewWillCreateSnapshot");

}

- (void)canvasViewWillBeginNewStroke:(id)a3 withTouch:(id)a4 location:(CGPoint)a5
{
  double y;
  double x;
  id v9;
  void *v10;
  void *v11;
  objc_super v12;

  y = a5.y;
  x = a5.x;
  v9 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKTiledTextView;
  -[PKTiledView canvasViewWillBeginNewStroke:withTouch:location:](&v12, sel_canvasViewWillBeginNewStroke_withTouch_location_, a3, v9, x, y);
  -[PKTiledView drawingTouchThatHitNothing](self, "drawingTouchThatHitNothing");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 && !v10)
  {
    -[PKTiledTextView _textView](self, "_textView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_willBeginNewStrokeForTouch:", v9);

  }
}

- (void)canvasViewDidEndDrawing:(id)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKTiledTextView;
  -[PKTiledView canvasViewDidEndDrawing:](&v5, sel_canvasViewDidEndDrawing_, a3);
  -[PKTiledTextView _textView](self, "_textView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_didEndStroke");

}

- (void)setLinedPaper:(id)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKTiledTextView;
  -[PKTiledView setLinedPaper:](&v5, sel_setLinedPaper_, a3);
  -[PKTiledTextView standInEndAttachmentView](self, "standInEndAttachmentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNeedsLayout");

}

- (id)viewToMakeFirstResponderWhenHoveringOverAttachment:(id)a3
{
  id v4;
  id v5;
  void *v6;

  v4 = a3;
  -[PKTiledTextView standInAttachmentView](self, "standInAttachmentView");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
    goto LABEL_4;
  objc_msgSend(v4, "attachmentContainerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isFirstResponder"))
  {

LABEL_4:
    v6 = 0;
  }

  return v6;
}

- (BOOL)insertAttachmentIfInBlankSpace:(CGPoint)a3
{
  double y;
  double x;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;

  y = a3.y;
  x = a3.x;
  -[PKTiledTextView _textView](self, "_textView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7 = 0;
  if (v5 && y > 0.0)
  {
    objc_msgSend(v5, "textStorage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v6, "closestPositionToPoint:", x, y);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "endOfDocument");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v8, "isEqual:", v9))
      {
        objc_msgSend(v6, "drawingDelegate");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v6, "drawingDelegate");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "textView:isEndOfDocument:", v6, v8);

          if (v22)
            goto LABEL_6;
        }
        else
        {

        }
        objc_msgSend(v6, "beginningOfDocument");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v6, "offsetFromPosition:toPosition:", v23, v8);

        objc_msgSend(v6, "textStorage");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "length") - 1;

        if (v24 == v26)
        {
          objc_msgSend(v6, "textStorage");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0DC10F8], v24, 0);
          v7 = (void *)objc_claimAutoreleasedReturnValue();

          if ((PKIsInlineDrawingOrPaperAttachment(v7) & 1) != 0)
            goto LABEL_20;

        }
        v7 = 0;
        goto LABEL_20;
      }

    }
LABEL_6:
    objc_msgSend(v6, "textStorage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "length");

    if (v11)
    {
      objc_msgSend(v6, "textStorage");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "string");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "invertedSet");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v13, "rangeOfCharacterFromSet:options:", v15, 4);

      if (v16 != 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend(v6, "textStorage");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0DC10F8], v16, 0);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        if (v7)
        {
          if ((PKIsInlineDrawingOrPaperAttachment(v7) & 1) != 0)
          {
LABEL_20:

            goto LABEL_21;
          }

        }
      }
    }
    objc_msgSend(v6, "textStorage");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "length");

    objc_msgSend(v6, "_insertEmptyDrawingAttachmentAtLocation:", v19);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_20;
  }
LABEL_21:

  return v7 != 0;
}

- (id)viewForAttachmentAtBlankSpace
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  -[PKTiledTextView _textView](self, "_textView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "textStorage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invertedSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "rangeOfCharacterFromSet:options:", v6, 4);

  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(v2, "textStorage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0DC10F8], v7, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10 && PKIsInlineDrawingOrPaperAttachment(v10))
    {
      objc_msgSend(v2, "_pk_viewProviderForAttachment:atCharacterIndex:createIfNeeded:", v10, v7, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "view");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v12, "topLevelAttachmentView");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v8 = 0;
      }

    }
    else
    {
      v8 = 0;
    }

  }
  return v8;
}

- (BOOL)_didHitNestedTiledView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  BOOL v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
    return 0;
  v5 = v4;
  do
  {
    -[PKTiledView scrollView](self, "scrollView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5 == v6)
      break;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = 0u;
      v18 = 0u;
      v16 = 0u;
      objc_msgSend(v5, "subviews", 0, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v16;
        while (2)
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v16 != v10)
              objc_enumerationMutation(v7);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {

              v13 = 1;
              goto LABEL_17;
            }
          }
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
          if (v9)
            continue;
          break;
        }
      }

    }
    objc_msgSend(v5, "superview");
    v12 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v12;
  }
  while (v12);
  v13 = 0;
LABEL_17:

  return v13;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  objc_super v25;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v8 = v7;
  if (v7 && objc_msgSend(v7, "_hidEvent"))
  {
    -[PKTiledTextView _textView](self, "_textView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "convertPoint:fromView:", self, x, y);
    v11 = v10;
    v13 = v12;

    -[PKTiledTextView _textView](self, "_textView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "hitTest:withEvent:", 0, v11, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15 && -[PKTiledTextView _didHitNestedTiledView:](self, "_didHitNestedTiledView:", v15))
    {
      v16 = 0;
    }
    else
    {
      -[PKTiledView scrollView](self, "scrollView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "_textInteraction");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setDelegate:", self);

      -[PKTiledTextView tapToRadarButton](self, "tapToRadarButton");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v19)
        goto LABEL_10;
      -[PKTiledTextView tapToRadarButton](self, "tapToRadarButton");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKTiledTextView tapToRadarButton](self, "tapToRadarButton");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "convertPoint:fromView:", self, x, y);
      objc_msgSend(v20, "hitTest:withEvent:", v8);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22)
      {
        -[PKTiledTextView tapToRadarButton](self, "tapToRadarButton");
        v23 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
LABEL_10:
        v25.receiver = self;
        v25.super_class = (Class)PKTiledTextView;
        -[PKTiledView hitTest:withEvent:](&v25, sel_hitTest_withEvent_, v8, x, y);
        v23 = objc_claimAutoreleasedReturnValue();
      }
      v16 = (void *)v23;
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (BOOL)interactionShouldBegin:(id)a3 atPoint:(CGPoint)a4
{
  double y;
  double x;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  BOOL v17;
  void *v18;
  void *v19;

  y = a4.y;
  x = a4.x;
  -[PKTiledTextView window](self, "window", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKToolPicker activeToolPickerForWindow:](PKToolPicker, "activeToolPickerForWindow:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKTiledTextView _textView](self, "_textView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "ink");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "_isHandwritingInk");

  -[PKTiledView scrollView](self, "scrollView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTiledTextView convertPoint:fromView:](self, "convertPoint:fromView:", v12, x, y);
  v14 = v13;
  v16 = v15;

  if (!objc_msgSend(v8, "isVisible") || v11)
  {
    -[PKTiledTextView _textView](self, "_textView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v18, "isEditing") & 1) != 0)
    {
      v17 = 1;
    }
    else
    {
      -[PKTiledView hitAttachment:](self, "hitAttachment:", v14, v16);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v19 == 0;

    }
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (void)_setupTapToRadarButton
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTiledTextView setTapToRadarButton:](self, "setTapToRadarButton:", v3);

  v4 = objc_alloc(MEMORY[0x1E0CB3498]);
  v11 = *MEMORY[0x1E0DC1138];
  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithName:size:", CFSTR("Apple Color Emoji"), 30.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithString:attributes:", CFSTR("🐜"), v6);

  -[PKTiledTextView tapToRadarButton](self, "tapToRadarButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAttributedTitle:forState:", v7, 0);

  -[PKTiledTextView tapToRadarButton](self, "tapToRadarButton");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addTarget:action:forControlEvents:", self, sel__tapToRadarButtonTapped_, 64);

  -[PKTiledTextView tapToRadarButton](self, "tapToRadarButton");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTiledTextView addSubview:](self, "addSubview:", v10);

}

- (void)_tapToRadarButtonTapped:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  UIImage *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  unint64_t v20;
  unint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  unint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t i;
  id v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t j;
  id v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t k;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  id v75;
  UIImage *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  id v97;
  _QWORD v98[5];
  _BYTE v99[128];
  _BYTE v100[128];
  _BYTE v101[128];
  uint64_t v102;

  v102 = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc(MEMORY[0x1E0DC3828]);
  -[PKTiledTextView window](self, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v7 = v6;
  v9 = v8;
  objc_msgSend(MEMORY[0x1E0DC3830], "defaultFormat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v4, "initWithSize:format:", v10, v7, v9);

  v98[0] = MEMORY[0x1E0C809B0];
  v98[1] = 3221225472;
  v98[2] = __43__PKTiledTextView__tapToRadarButtonTapped___block_invoke;
  v98[3] = &unk_1E777B290;
  v98[4] = self;
  v77 = v11;
  objc_msgSend(v11, "imageWithActions:", v98);
  v12 = (UIImage *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x1E0C99E98];
  NSTemporaryDirectory();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringByAppendingPathComponent:", CFSTR("screenshot.png"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "fileURLWithPath:", v15);
  v16 = objc_claimAutoreleasedReturnValue();

  v76 = v12;
  UIImagePNGRepresentation(v12);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v97 = 0;
  v78 = (void *)v16;
  objc_msgSend(v17, "writeToURL:options:error:", v16, 1, &v97);
  v75 = v97;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTiledView attachmentViews](self, "attachmentViews");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v82 = v19;
  if (objc_msgSend(v19, "count"))
  {
    v20 = 0;
    v21 = 0x1E0CB3000uLL;
    v79 = v18;
    do
    {
      objc_msgSend(v19, "objectAtIndexedSubscript:", v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "drawing");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (void *)objc_msgSend(v23, "copy");

      objc_msgSend(v24, "serialize");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(v21 + 2368), "stringWithFormat:", CFSTR("%d_drawing.drawing"), v20);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKTiledTextView saveTempData:name:](self, "saveTempData:name:", v25, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v27, "path");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "addObject:", v28);

      if (objc_msgSend(v24, "recognitionEnabled"))
      {
        objc_msgSend(v24, "recognitionSession");
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        if (v29)
        {
          v30 = objc_alloc(MEMORY[0x1E0D16810]);
          objc_msgSend(v24, "recognitionSession");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = (void *)objc_msgSend(v30, "initWithRecognitionSession:", v31);

          objc_msgSend(v32, "start");
          objc_msgSend(v32, "waitForPendingUpdates");
          objc_msgSend(v32, "indexableContent");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "indexableTextRepresentation");
          v34 = v21;
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "dataUsingEncoding:", 4);
          v83 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(*(id *)(v34 + 2368), "stringWithFormat:", CFSTR("%d_indexableText.txt"), v20);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKTiledTextView saveTempData:name:](self, "saveTempData:name:", v83, v36);
          v37 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v37, "path");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v80, "addObject:", v38);

          objc_msgSend(v32, "indexableContent");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "presentableTextRepresentation");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "dataUsingEncoding:", 4);
          v41 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(*(id *)(v34 + 2368), "stringWithFormat:", CFSTR("%d_presentableText.txt"), v20);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKTiledTextView saveTempData:name:](self, "saveTempData:name:", v41, v42);
          v43 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v43, "path");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v81, "addObject:", v44);

          v19 = v82;
          v21 = v34;

          v18 = v79;
        }
      }

      ++v20;
    }
    while (v20 < objc_msgSend(v19, "count"));
  }
  v45 = objc_alloc_init(MEMORY[0x1E0CB3998]);
  objc_msgSend(v45, "setScheme:", CFSTR("tap-to-radar"));
  v84 = v45;
  objc_msgSend(v45, "setHost:", CFSTR("new"));
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("ComponentName"), CFSTR("Handwriting"));
  objc_msgSend(v46, "addObject:", v47);

  v48 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("ComponentVersion"), CFSTR("iOS"));
  objc_msgSend(v46, "addObject:", v48);

  v49 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("ComponentID"), CFSTR("391023"));
  objc_msgSend(v46, "addObject:", v49);

  v50 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("Keywords"), CFSTR("834455"));
  objc_msgSend(v46, "addObject:", v50);

  v51 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("Classification"), CFSTR("Other Bug"));
  objc_msgSend(v46, "addObject:", v51);

  v52 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("Reproducibility"), CFSTR("Not Applicable"));
  objc_msgSend(v46, "addObject:", v52);

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v93 = 0u;
  v94 = 0u;
  v95 = 0u;
  v96 = 0u;
  v54 = v18;
  v55 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v93, v101, 16);
  if (v55)
  {
    v56 = v55;
    v57 = *(_QWORD *)v94;
    do
    {
      for (i = 0; i != v56; ++i)
      {
        if (*(_QWORD *)v94 != v57)
          objc_enumerationMutation(v54);
        -[PKTiledTextView appendPath:attachmentString:](self, "appendPath:attachmentString:", *(_QWORD *)(*((_QWORD *)&v93 + 1) + 8 * i), v53);
      }
      v56 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v93, v101, 16);
    }
    while (v56);
  }

  v91 = 0u;
  v92 = 0u;
  v89 = 0u;
  v90 = 0u;
  v59 = v80;
  v60 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v89, v100, 16);
  if (v60)
  {
    v61 = v60;
    v62 = *(_QWORD *)v90;
    do
    {
      for (j = 0; j != v61; ++j)
      {
        if (*(_QWORD *)v90 != v62)
          objc_enumerationMutation(v59);
        -[PKTiledTextView appendPath:attachmentString:](self, "appendPath:attachmentString:", *(_QWORD *)(*((_QWORD *)&v89 + 1) + 8 * j), v53);
      }
      v61 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v89, v100, 16);
    }
    while (v61);
  }

  v87 = 0u;
  v88 = 0u;
  v85 = 0u;
  v86 = 0u;
  v64 = v81;
  v65 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v85, v99, 16);
  if (v65)
  {
    v66 = v65;
    v67 = *(_QWORD *)v86;
    do
    {
      for (k = 0; k != v66; ++k)
      {
        if (*(_QWORD *)v86 != v67)
          objc_enumerationMutation(v64);
        -[PKTiledTextView appendPath:attachmentString:](self, "appendPath:attachmentString:", *(_QWORD *)(*((_QWORD *)&v85 + 1) + 8 * k), v53);
      }
      v66 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v85, v99, 16);
    }
    while (v66);
  }

  v69 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("Attachments"), v53);
  objc_msgSend(v46, "addObject:", v69);

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v75)
  {
    objc_msgSend(v78, "path");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKTiledTextView appendPath:attachmentString:](self, "appendPath:attachmentString:", v71, v70);

  }
  v72 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("Screenshot"), v70);
  objc_msgSend(v46, "addObject:", v72);

  objc_msgSend(v84, "setQueryItems:", v46);
  objc_msgSend(v84, "URL");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "openURL:withOptions:", v73, 0);

}

void __43__PKTiledTextView__tapToRadarButtonTapped___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "window");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "window");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  objc_msgSend(v3, "drawViewHierarchyInRect:");

}

- (void)appendPath:(id)a3 attachmentString:(id)a4
{
  id v5;
  uint64_t v6;
  id v7;

  v7 = a4;
  v5 = a3;
  if (objc_msgSend(v7, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(",%@"), v5);
    v6 = objc_claimAutoreleasedReturnValue();

    v5 = (id)v6;
  }
  objc_msgSend(v7, "appendString:", v5);

}

- (id)saveTempData:(id)a3 name:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v13;

  v5 = (void *)MEMORY[0x1E0C99E98];
  v6 = a4;
  v7 = a3;
  NSTemporaryDirectory();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByAppendingPathComponent:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "fileURLWithPath:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = 0;
  objc_msgSend(v7, "writeToURL:options:error:", v10, 1, &v13);

  v11 = 0;
  if (!v13)
    v11 = v10;

  return v11;
}

- (void)handwritingFeedback:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  unint64_t i;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  id v14;

  -[PKTiledView attachmentViews](self, "attachmentViews", a3);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_opt_new();
  v5 = objc_msgSend(v14, "count");
  v6 = v14;
  if (v5)
  {
    for (i = 0; i < v11; ++i)
    {
      objc_msgSend(v6, "objectAtIndexedSubscript:", i);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "drawing");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(v9, "copy");

      if (v10)
        objc_msgSend(v4, "addObject:", v10);

      v11 = objc_msgSend(v14, "count");
      v6 = v14;
    }
  }
  if (objc_msgSend(v4, "count"))
  {
    -[PKTiledTextView window](self, "window");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "rootViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKHandwritingDebugUtility presentHandwritingDebugViewFromViewController:allDrawings:tiledView:](PKHandwritingDebugUtility, "presentHandwritingDebugViewFromViewController:allDrawings:tiledView:", v13, v4, self);

  }
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v7;
  void *v8;
  id v9;

  v7 = a5;
  objc_msgSend(a4, "location");
  -[PKTiledView hitAttachment:](self, "hitAttachment:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    v9 = 0;
  else
    v9 = v7;

  return v9;
}

- (void)setStandInEndAttachmentView:(id)a3
{
  objc_storeStrong((id *)&self->_standInEndAttachmentView, a3);
}

- (void)setTapToRadarButton:(id)a3
{
  objc_storeStrong((id *)&self->_tapToRadarButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tapToRadarButton, 0);
  objc_storeStrong((id *)&self->_standInEndAttachmentView, 0);
}

@end
