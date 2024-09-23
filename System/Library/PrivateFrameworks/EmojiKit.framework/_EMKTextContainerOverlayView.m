@implementation _EMKTextContainerOverlayView

- (_EMKTextContainerOverlayView)initWithFrame:(CGRect)a3 rippler:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v10;
  _EMKTextContainerOverlayView *v11;
  uint64_t v12;
  EMKTextEnumerator *textEnumerator;
  UITextView *textView;
  uint64_t v15;
  NSMutableArray *fragmentViews;
  void *v17;
  objc_super v19;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = a4;
  v19.receiver = self;
  v19.super_class = (Class)_EMKTextContainerOverlayView;
  v11 = -[_EMKTextContainerOverlayView initWithFrame:](&v19, sel_initWithFrame_, x, y, width, height);
  if (v11)
  {
    v12 = objc_opt_new();
    textEnumerator = v11->_textEnumerator;
    v11->_textEnumerator = (EMKTextEnumerator *)v12;

    textView = v11->_textView;
    v11->_textView = 0;

    objc_storeStrong((id *)&v11->_rippler, a4);
    v11->_timeIndex = 0;
    v15 = objc_opt_new();
    fragmentViews = v11->_fragmentViews;
    v11->_fragmentViews = (NSMutableArray *)v15;

    -[_EMKTextContainerOverlayView setUserInteractionEnabled:](v11, "setUserInteractionEnabled:", 1);
    -[_EMKTextContainerOverlayView layer](v11, "layer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setMasksToBounds:", 1);

    -[_EMKTextContainerOverlayView setClipsToBounds:](v11, "setClipsToBounds:", 1);
  }

  return v11;
}

- (void)layoutSubviews
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  objc_super v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v12.receiver = self;
  v12.super_class = (Class)_EMKTextContainerOverlayView;
  -[_EMKTextContainerOverlayView layoutSubviews](&v12, sel_layoutSubviews);
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v3 = self->_fragmentViews;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        -[_EMKTextContainerOverlayView _layoutFragmentView:](self, "_layoutFragmentView:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++), (_QWORD)v8);
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v13, 16);
    }
    while (v5);
  }

}

- (BOOL)isOpaque
{
  return 0;
}

- (void)prepareWithTextView:(id)a3
{
  NSMutableArray *fragmentViews;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[5];

  fragmentViews = self->_fragmentViews;
  v5 = a3;
  -[NSMutableArray makeObjectsPerformSelector:](fragmentViews, "makeObjectsPerformSelector:", sel_removeFromSuperview);
  -[_EMKTextContainerOverlayView fragmentViews](self, "fragmentViews");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeAllObjects");

  -[_EMKTextContainerOverlayView setTextView:](self, "setTextView:", v5);
  -[_EMKTextContainerOverlayView textView](self, "textView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textLayoutManager");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "documentRange");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "location");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __52___EMKTextContainerOverlayView_prepareWithTextView___block_invoke;
  v12[3] = &unk_1EA2589A0;
  v12[4] = self;
  v10 = (id)objc_msgSend(v11, "enumerateTextLayoutFragmentsFromLocation:options:usingBlock:", v9, 4, v12);

  -[_EMKTextContainerOverlayView setNeedsLayout](self, "setNeedsLayout");
}

- (void)startAnimation
{
  void *v3;
  uint64_t v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[UITextView textLayoutManager](self->_textView, "textLayoutManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "animatingGlyphCount_emk");

  if (v4)
  {
    self->_timeIndex = 0;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v5 = self->_fragmentViews;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = v6;
      v8 = 0;
      v9 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v5);
          v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
          objc_msgSend(v11, "startAnimationWithRippler:animatingGlyphCount:animatingGlyphCountBefore:", self->_rippler, v4, v8, (_QWORD)v13);
          objc_msgSend(v11, "layoutFragment");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v8 += objc_msgSend(v12, "animatingGlyphCount_emk");

        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v7);
    }

  }
}

- (void)updateAnimationAndGetFinished:(BOOL *)a3
{
  void *v5;
  uint64_t v6;
  unint64_t v7;
  BOOL v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[UITextView textLayoutManager](self->_textView, "textLayoutManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "animatingGlyphCount_emk");

  v7 = -[EMKGlyphRippler currentTimeIndex](self->_rippler, "currentTimeIndex");
  self->_timeIndex = v7;
  v8 = -[EMKGlyphRippler finishedForGlyphIndex:numberOfGlyphs:timeIndex:](self->_rippler, "finishedForGlyphIndex:numberOfGlyphs:timeIndex:", v6 - 1, v6, v7);
  if (!v8)
    -[_EMKTextContainerOverlayView setNeedsDisplay](self, "setNeedsDisplay");
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[NSMutableArray objectEnumerator](self->_fragmentViews, "objectEnumerator", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v15;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v13++), "updateWithTimeIndex:", self->_timeIndex);
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v11);
  }

  *a3 = v8;
}

- (void)_layoutFragmentView:(id)a3
{
  __int128 v4;
  id v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;

  v4 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
  v9 = *MEMORY[0x1E0C9D648];
  v10 = v4;
  v7 = v9;
  v8 = v4;
  v5 = a3;
  objc_msgSend(v5, "layoutFragment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextView textContainerInset](self->_textView, "textContainerInset");
  objc_msgSend(v6, "_emk_getFragmentViewFrame:getBounds:textContainerInset:", &v9, &v7);

  objc_msgSend(v5, "setFrame:", v9, v10);
  objc_msgSend(v5, "setBounds:", v7, v8);

}

- (id)_newFragmentViewForFragment:(id)a3
{
  __int128 v3;
  UITextView *textView;
  id v5;
  _EMKTextLayoutFragmentView *v6;
  _EMKTextLayoutFragmentView *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;

  v3 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
  v11 = *MEMORY[0x1E0C9D648];
  v12 = v3;
  v9 = v11;
  v10 = v3;
  textView = self->_textView;
  v5 = a3;
  -[UITextView textContainerInset](textView, "textContainerInset");
  objc_msgSend(v5, "_emk_getFragmentViewFrame:getBounds:textContainerInset:", &v11, &v9);
  v6 = [_EMKTextLayoutFragmentView alloc];
  v7 = -[_EMKTextLayoutFragmentView initWithFrame:layoutFragment:](v6, "initWithFrame:layoutFragment:", v5, v11, v12);

  -[_EMKTextLayoutFragmentView setBounds:](v7, "setBounds:", v9, v10);
  return v7;
}

- (EMKTextEnumerator)textEnumerator
{
  return self->_textEnumerator;
}

- (void)setTextEnumerator:(id)a3
{
  objc_storeStrong((id *)&self->_textEnumerator, a3);
}

- (UITextView)textView
{
  return self->_textView;
}

- (void)setTextView:(id)a3
{
  objc_storeStrong((id *)&self->_textView, a3);
}

- (NSMutableArray)fragmentViews
{
  return self->_fragmentViews;
}

- (void)setFragmentViews:(id)a3
{
  objc_storeStrong((id *)&self->_fragmentViews, a3);
}

- (EMKGlyphRippler)rippler
{
  return self->_rippler;
}

- (void)setRippler:(id)a3
{
  objc_storeStrong((id *)&self->_rippler, a3);
}

- (unint64_t)timeIndex
{
  return self->_timeIndex;
}

- (void)setTimeIndex:(unint64_t)a3
{
  self->_timeIndex = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rippler, 0);
  objc_storeStrong((id *)&self->_fragmentViews, 0);
  objc_storeStrong((id *)&self->_textView, 0);
  objc_storeStrong((id *)&self->_textEnumerator, 0);
}

@end
