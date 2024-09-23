@implementation MFAtomTextView

+ (Class)_fieldEditorClass
{
  return (Class)objc_opt_class();
}

+ (Class)_backgroundViewClass
{
  return (Class)objc_opt_class();
}

+ (id)defaultFont
{
  return (id)objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 18.0);
}

+ (id)defaultTextColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
}

+ (id)defaultPlaceholderColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "_systemMidGrayTintColor");
}

- (MFAtomTextView)initWithFrame:(CGRect)a3
{
  MFAtomTextView *v3;
  MFAtomTextView *v4;
  uint64_t v5;
  UIFont *font;
  uint64_t v7;
  UIColor *textColor;
  uint64_t v9;
  UIColor *placeholderColor;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  _UITextFieldRoundedRectBackgroundViewNeue *background;
  uint64_t v18;
  UIScrollView *scrollView;
  uint64_t v20;
  _MFAtomFieldEditor *textView;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSMutableArray *v29;
  NSMutableArray *atomViews;
  objc_super v32;

  v32.receiver = self;
  v32.super_class = (Class)MFAtomTextView;
  v3 = -[MFAtomTextView initWithFrame:](&v32, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[MFAtomTextView _setHostsLayoutEngine:](v3, "_setHostsLayoutEngine:", 1);
    objc_msgSend((id)objc_opt_class(), "defaultFont");
    v5 = objc_claimAutoreleasedReturnValue();
    font = v4->_font;
    v4->_font = (UIFont *)v5;

    objc_msgSend((id)objc_opt_class(), "defaultTextColor");
    v7 = objc_claimAutoreleasedReturnValue();
    textColor = v4->_textColor;
    v4->_textColor = (UIColor *)v7;

    objc_msgSend((id)objc_opt_class(), "defaultPlaceholderColor");
    v9 = objc_claimAutoreleasedReturnValue();
    placeholderColor = v4->_placeholderColor;
    v4->_placeholderColor = (UIColor *)v9;

    v11 = objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "_backgroundViewClass"));
    v12 = *MEMORY[0x1E0C9D648];
    v13 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v14 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v15 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v16 = objc_msgSend(v11, "initWithFrame:active:", 1, *MEMORY[0x1E0C9D648], v13, v14, v15);
    background = v4->_background;
    v4->_background = (_UITextFieldRoundedRectBackgroundViewNeue *)v16;

    -[_UITextFieldRoundedRectBackgroundViewNeue setAutoresizingMask:](v4->_background, "setAutoresizingMask:", 0);
    v18 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3C28]), "initWithFrame:", v12, v13, v14, v15);
    scrollView = v4->_scrollView;
    v4->_scrollView = (UIScrollView *)v18;

    -[UIScrollView setDelegate:](v4->_scrollView, "setDelegate:", v4);
    -[UIScrollView setScrollsToTop:](v4->_scrollView, "setScrollsToTop:", 0);
    -[UIScrollView setShowsHorizontalScrollIndicator:](v4->_scrollView, "setShowsHorizontalScrollIndicator:", 0);
    -[UIScrollView setShowsVerticalScrollIndicator:](v4->_scrollView, "setShowsVerticalScrollIndicator:", 0);
    v20 = objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "_fieldEditorClass")), "initWithFrame:textContainer:", 0, v12, v13, v14, v15);
    textView = v4->_textView;
    v4->_textView = (_MFAtomFieldEditor *)v20;

    -[_MFAtomFieldEditor setAutoresizingMask:](v4->_textView, "setAutoresizingMask:", 0);
    -[_MFAtomFieldEditor setBackgroundColor:](v4->_textView, "setBackgroundColor:", 0);
    -[MFAtomTextView font](v4, "font");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MFAtomFieldEditor setFont:](v4->_textView, "setFont:", v22);

    -[_MFAtomFieldEditor setScrollEnabled:](v4->_textView, "setScrollEnabled:", 0);
    -[_MFAtomFieldEditor setScrollsToTop:](v4->_textView, "setScrollsToTop:", 0);
    -[_MFAtomFieldEditor setTextAlignment:](v4->_textView, "setTextAlignment:", 4);
    -[MFAtomTextView baseAttributes](v4, "baseAttributes");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MFAtomFieldEditor setTypingAttributes:](v4->_textView, "setTypingAttributes:", v23);

    -[_MFAtomFieldEditor layoutManager](v4->_textView, "layoutManager");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setAllowsNonContiguousLayout:", 1);

    -[_MFAtomFieldEditor setDelegate:](v4->_textView, "setDelegate:", v4);
    -[_MFAtomFieldEditor layoutManager](v4->_textView, "layoutManager");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setDelegate:", v4);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MFAtomFieldEditor textStorage](v4->_textView, "textStorage");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addObserver:selector:name:object:", v4, sel__textStorageDidProcessEditing_, *MEMORY[0x1E0DC1230], v27);

    if (v4->_background)
      -[MFAtomTextView addSubview:](v4, "addSubview:");
    -[MFAtomTextView addSubview:](v4, "addSubview:", v4->_scrollView);
    -[UIScrollView addSubview:](v4->_scrollView, "addSubview:", v4->_textView);
    v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", v4, sel__tapRecognized_);
    objc_msgSend(v28, "setCancelsTouchesInView:", 0);
    -[MFAtomTextView addGestureRecognizer:](v4, "addGestureRecognizer:", v28);
    v29 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    atomViews = v4->_atomViews;
    v4->_atomViews = v29;

  }
  return v4;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_storeWeak((id *)&self->_delegate, 0);
  -[UIScrollView setDelegate:](self->_scrollView, "setDelegate:", 0);
  -[_MFAtomFieldEditor setDelegate:](self->_textView, "setDelegate:", 0);
  -[_MFAtomFieldEditor layoutManager](self->_textView, "layoutManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDelegate:", 0);

  v4.receiver = self;
  v4.super_class = (Class)MFAtomTextView;
  -[MFAtomTextView dealloc](&v4, sel_dealloc);
}

- (_MFAtomFieldEditor)_fieldEditor
{
  return self->_textView;
}

- (UIView)_systemBackgroundView
{
  return (UIView *)self->_background;
}

- (void)_setDrawsDebugBaselines:(BOOL)a3
{
  _BOOL8 v3;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (self->_drawsDebugBaselines != a3)
  {
    v3 = a3;
    self->_drawsDebugBaselines = a3;
    -[_MFAtomFieldEditor _setDrawsDebugBaselines:](self->_textView, "_setDrawsDebugBaselines:");
    -[UILabel _setDrawsDebugBaselines:](self->_placeholderLabel, "_setDrawsDebugBaselines:", v3);
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v5 = self->_atomViews;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v11;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8), "viewForLastBaselineLayout", (_QWORD)v10);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(v9, "_setDrawsDebugBaselines:", v3);

          ++v8;
        }
        while (v6 != v8);
        v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v6);
    }

    -[MFAtomTextView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  void *v5;
  char v6;
  char v7;
  char v8;
  char v9;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | objc_opt_respondsToSelector() & 1;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v6 = 2;
    else
      v6 = 0;
    *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v6;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v7 = 4;
    else
      v7 = 0;
    *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFB | v7;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v8 = 8;
    else
      v8 = 0;
    *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xF7 | v8;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v9 = 16;
    else
      v9 = 0;
    *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xEF | v9;
    v5 = obj;
  }

}

- (void)setFont:(id)a3
{
  UIFont *v4;
  UIFont *obj;

  v4 = (UIFont *)a3;
  if (!v4)
  {
    objc_msgSend((id)objc_opt_class(), "defaultFont");
    v4 = (UIFont *)objc_claimAutoreleasedReturnValue();
  }
  obj = v4;
  if (self->_font != v4)
  {
    objc_storeStrong((id *)&self->_font, v4);
    -[_MFAtomFieldEditor setFont:](self->_textView, "setFont:", obj);
    -[UILabel setFont:](self->_placeholderLabel, "setFont:", obj);
    -[_MFAtomTextViewBaselineLayoutStrut setFont:](self->_baselineLayoutLabel, "setFont:", obj);
    -[MFAtomTextView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setTextColor:(id)a3
{
  UIColor *v4;
  void (**v5)(_QWORD);
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t);
  void *v9;
  MFAtomTextView *v10;
  UIColor *v11;

  v4 = (UIColor *)a3;
  if (!v4)
  {
    objc_msgSend((id)objc_opt_class(), "defaultTextColor");
    v4 = (UIColor *)objc_claimAutoreleasedReturnValue();
  }
  if (self->_textColor != v4)
  {
    objc_storeStrong((id *)&self->_textColor, v4);
    v6 = MEMORY[0x1E0C809B0];
    v7 = 3221225472;
    v8 = __31__MFAtomTextView_setTextColor___block_invoke;
    v9 = &unk_1E5A65430;
    v10 = self;
    v11 = v4;
    v5 = (void (**)(_QWORD))_Block_copy(&v6);
    if (objc_msgSend(MEMORY[0x1E0DC3F10], "areAnimationsEnabled", v6, v7, v8, v9, v10))
      objc_msgSend(MEMORY[0x1E0DC3F10], "transitionWithView:duration:options:animations:completion:", self->_textView, 5242880, v5, 0, 0.35);
    else
      v5[2](v5);

  }
}

void __31__MFAtomTextView_setTextColor___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 496), "setTextColor:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "baseAttributes");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 496), "setTypingAttributes:");

}

- (void)_setEnabled:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  void *v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  objc_super v16;
  _BYTE v17[128];
  uint64_t v18;

  v4 = a4;
  v5 = a3;
  v18 = *MEMORY[0x1E0C80C00];
  v16.receiver = self;
  v16.super_class = (Class)MFAtomTextView;
  -[MFAtomTextView setEnabled:](&v16, sel_setEnabled_);
  -[_UITextFieldRoundedRectBackgroundViewNeue setEnabled:animated:](self->_background, "setEnabled:animated:", v5, v4);
  -[MFAtomTextView clearButton](self, "clearButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setEnabled:", v5);

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v8 = self->_atomViews;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "setEnabled:animated:", v5, v4, (_QWORD)v12);
      }
      while (v9 != v11);
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
    }
    while (v9);
  }

}

- (void)setEnabled:(BOOL)a3
{
  -[MFAtomTextView _setEnabled:animated:](self, "_setEnabled:animated:", a3, 0);
}

- (id)paragraphStyle
{
  if (paragraphStyle_onceToken != -1)
    dispatch_once(&paragraphStyle_onceToken, &__block_literal_global_2);
  return (id)paragraphStyle_sParagraphStyle;
}

void __32__MFAtomTextView_paragraphStyle__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  v2 = objc_alloc_init(MEMORY[0x1E0DC1288]);
  objc_msgSend(v2, "setLineBreakMode:", 2);
  v0 = objc_msgSend(v2, "copy");
  v1 = (void *)paragraphStyle_sParagraphStyle;
  paragraphStyle_sParagraphStyle = v0;

}

- (id)baseAttributesWithRepresentedObject:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[3];
  _QWORD v17[4];

  v17[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v16[0] = *MEMORY[0x1E0DC1138];
  -[MFAtomTextView font](self, "font");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v5;
  v16[1] = *MEMORY[0x1E0DC1140];
  -[MFAtomTextView textColor](self, "textColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v6;
  v7 = *MEMORY[0x1E0DC1178];
  v16[2] = *MEMORY[0x1E0DC1178];
  -[MFAtomTextView paragraphStyle](self, "paragraphStyle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    -[MFAtomTextView _atomLayoutViewForRepresentedObject:](self, "_atomLayoutViewForRepresentedObject:", v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[_MFAtomAttachment attachmentWithAtomLayoutView:representedObject:](_MFAtomAttachment, "attachmentWithAtomLayoutView:representedObject:", v11, v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "mutableCopy");
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v12, *MEMORY[0x1E0DC10F8]);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v9, "objectForKeyedSubscript:", v7);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(v13, "mutableCopy");

      objc_msgSend(v14, "setBaseWritingDirection:", objc_msgSend(v11, "baseWritingDirection"));
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v14, v7);

    }
  }
  else
  {
    v10 = v9;
  }

  return v10;
}

- (id)baseAttributes
{
  return -[MFAtomTextView baseAttributesWithRepresentedObject:](self, "baseAttributesWithRepresentedObject:", 0);
}

- (id)_baseAttributedStringWithRepresentedObject:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  __int16 v10;

  v4 = a3;
  -[MFAtomTextView baseAttributesWithRepresentedObject:](self, "baseAttributesWithRepresentedObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v4, v5);
  }
  else
  {
    v7 = objc_alloc(MEMORY[0x1E0CB3498]);
    v10 = -4;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCharacters:length:", &v10, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v7, "initWithString:attributes:", v8, v5);

  }
  return v6;
}

- (BOOL)_hasContent
{
  void *v2;
  BOOL v3;

  -[_MFAtomFieldEditor textStorage](self->_textView, "textStorage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length") != 0;

  return v3;
}

- (id)_representedObjectsInRange:(_NSRange)a3 ranges:(id *)a4
{
  NSUInteger length;
  NSUInteger location;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  void (**v15)(_QWORD);
  id v16;
  id v17;
  void *v18;
  id v19;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  _QWORD *v25;
  _QWORD aBlock[4];
  id v27;
  id v28;
  id v29;
  _QWORD *v30;
  _QWORD v31[4];
  __int128 v32;

  length = a3.length;
  location = a3.location;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MFAtomFieldEditor textStorage](self->_textView, "textStorage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x3010000000;
  v31[3] = "";
  v11 = MEMORY[0x1E0C809B0];
  v32 = xmmword_1ABAA0BD0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __52__MFAtomTextView__representedObjectsInRange_ranges___block_invoke;
  aBlock[3] = &unk_1E5A65678;
  v30 = v31;
  v12 = v8;
  v27 = v12;
  v13 = v10;
  v28 = v13;
  v14 = v9;
  v29 = v14;
  v21[0] = v11;
  v21[1] = 3221225472;
  v21[2] = __52__MFAtomTextView__representedObjectsInRange_ranges___block_invoke_2;
  v21[3] = &unk_1E5A656A0;
  v15 = _Block_copy(aBlock);
  v24 = v15;
  v16 = v12;
  v22 = v16;
  v17 = v14;
  v23 = v17;
  v25 = v31;
  objc_msgSend(v13, "enumerateAttributesInRange:options:usingBlock:", location, length, 0, v21);
  v15[2](v15);
  if (a4)
    *a4 = objc_retainAutorelease(v17);
  v18 = v23;
  v19 = v16;

  _Block_object_dispose(v31, 8);
  return v19;
}

double __52__MFAtomTextView__representedObjectsInRange_ranges___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double result;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 32) != 0x7FFFFFFFFFFFFFFFLL)
  {
    v2 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "string");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "substringWithRange:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v4);

    v5 = *(void **)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v6);

    result = NAN;
    *(_OWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 32) = xmmword_1ABAA0BD0;
  }
  return result;
}

void __52__MFAtomTextView__representedObjectsInRange_ranges___block_invoke_2(_QWORD *a1, void *a2, NSUInteger location, NSUInteger length)
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSRange v12;
  NSRange v13;
  uint64_t v14;
  id v15;
  NSRange v16;

  objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0DC10F8]);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    (*(void (**)(void))(a1[6] + 16))();
    v7 = (void *)a1[4];
    objc_msgSend(v15, "representedObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v8);

    v9 = (void *)a1[5];
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", location, length);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v10);

  }
  else if (!v15)
  {
    v11 = *(_QWORD *)(a1[7] + 8);
    v12.location = *(_QWORD *)(v11 + 32);
    if (v12.location == 0x7FFFFFFFFFFFFFFFLL
      || (v12.length = *(_QWORD *)(v11 + 40), v12.length + v12.location != location))
    {
      (*(void (**)(void))(a1[6] + 16))();
    }
    else
    {
      v16.location = location;
      v16.length = length;
      v13 = NSUnionRange(v12, v16);
      location = v13.location;
      length = v13.length;
    }
    v14 = *(_QWORD *)(a1[7] + 8);
    *(_QWORD *)(v14 + 32) = location;
    *(_QWORD *)(v14 + 40) = length;
  }

}

- (id)currentEditingString:(_NSRange *)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  char *v11;
  char *v12;
  unint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  unint64_t v17;
  NSUInteger v18;
  NSUInteger v19;
  NSUInteger v20;
  char *v23;
  void *v24;
  char isKindOfClass;
  void *v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  id v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  if (a3)
    *a3 = (_NSRange)xmmword_1ABAA0BD0;
  -[_MFAtomFieldEditor textStorage](self->_textView, "textStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[_MFAtomFieldEditor selectedRange](self->_textView, "selectedRange");
  v8 = v7;
  v33 = 0;
  -[MFAtomTextView _representedObjectsInRange:ranges:](self, "_representedObjectsInRange:ranges:", 0, objc_msgSend(v5, "length"), &v33);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v10 = v33;
  v11 = (char *)objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v11)
  {
    v27 = v9;
    v28 = v5;
    v12 = 0;
    v13 = v6 + v8;
    v14 = *(_QWORD *)v30;
    while (2)
    {
      v15 = 0;
      v16 = &v11[(_QWORD)v12];
      do
      {
        if (*(_QWORD *)v30 != v14)
          objc_enumerationMutation(v10);
        v17 = objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)v15), "rangeValue", v27, v28, (_QWORD)v29);
        v19 = v17;
        v20 = v18;
        if (v13 - v17 < v18 && v13 >= v17 || v13 == v17 + v18)
        {
          v23 = &v15[(_QWORD)v12];
          v9 = v27;
          v5 = v28;
          objc_msgSend(v27, "objectAtIndexedSubscript:", v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();

          if ((isKindOfClass & 1) != 0)
          {
            objc_msgSend(v27, "objectAtIndexedSubscript:", v23);
            v11 = (char *)objc_claimAutoreleasedReturnValue();
            if (a3)
            {
              a3->location = v19;
              a3->length = v20;
            }
          }
          else
          {
            v11 = 0;
          }
          goto LABEL_22;
        }
        ++v15;
      }
      while (v11 != v15);
      v11 = (char *)objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
      v12 = v16;
      if (v11)
        continue;
      break;
    }
    v9 = v27;
    v5 = v28;
  }
LABEL_22:

  return v11;
}

- (NSString)currentEditingString
{
  return (NSString *)-[MFAtomTextView currentEditingString:](self, "currentEditingString:", 0);
}

- (NSArray)representedObjects
{
  void *v3;
  void *v4;

  -[_MFAtomFieldEditor textStorage](self->_textView, "textStorage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFAtomTextView _representedObjectsInRange:ranges:](self, "_representedObjectsInRange:ranges:", 0, objc_msgSend(v3, "length"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (NSArray)selectedRepresentedObjects
{
  uint64_t v3;
  uint64_t v4;

  v3 = -[_MFAtomFieldEditor selectedRange](self->_textView, "selectedRange");
  return (NSArray *)-[MFAtomTextView _representedObjectsInRange:ranges:](self, "_representedObjectsInRange:ranges:", v3, v4, 0);
}

- (void)insertRepresentedObject:(id)a3 atIndex:(unint64_t)a4
{
  id v6;
  void *v7;
  char *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;

  v6 = a3;
  -[_MFAtomFieldEditor textStorage](self->_textView, "textStorage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "beginEditing");
  v14 = 0;
  -[MFAtomTextView _representedObjectsInRange:ranges:](self, "_representedObjectsInRange:ranges:", 0, objc_msgSend(v7, "length"), &v14);
  v8 = (char *)objc_claimAutoreleasedReturnValue();
  v9 = v14;

  if (v8)
  {
    objc_msgSend(v9, "objectAtIndexedSubscript:", a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "rangeValue");

    -[MFAtomTextView _baseAttributedStringWithRepresentedObject:](self, "_baseAttributedStringWithRepresentedObject:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "insertAttributedString:atIndex:", v12, v11);
    v8 = (char *)objc_msgSend(v12, "length");

  }
  else
  {
    v11 = 0x7FFFFFFFFFFFFFFFLL;
  }
  objc_msgSend(v7, "endEditing");
  if (v8)
  {
    -[_MFAtomFieldEditor layoutManager](self->_textView, "layoutManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "invalidateLayoutForCharacterRange:actualCharacterRange:", v11, v8, 0);

  }
  -[MFAtomTextView setNeedsLayout](self, "setNeedsLayout");
  -[MFAtomTextView sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 0x20000);
  -[_MFAtomFieldEditor setSelectedRange:](self->_textView, "setSelectedRange:", &v8[v11], 0);

}

- (void)_deleteCharactersInStorage:(id)a3 ranges:(id)a4 rangeToAdjust:(_NSRange *)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSUInteger v12;
  uint64_t v13;
  unint64_t v14;
  NSUInteger length;
  NSUInteger location;
  BOOL v17;
  NSUInteger v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend(a4, "reverseObjectEnumerator", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v20;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(v8);
        v12 = objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v11), "rangeValue");
        v14 = v13;
        objc_msgSend(v7, "deleteCharactersInRange:", v12, v13);
        location = a5->location;
        length = a5->length;
        if (v12 < length + a5->location)
        {
          if (location >= v12 + v14)
          {
            a5->location = location - v14;
          }
          else
          {
            if (v12 <= location)
            {
              v18 = location - (v12 + v14) + length;
              a5->location = v12;
            }
            else
            {
              v17 = length >= v14;
              v18 = length - v14;
              if (!v17)
                v18 = 0;
            }
            a5->length = v18;
          }
        }
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v9);
  }

}

- (void)removeRepresentedObjectsAtIndexes:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;

  v4 = a3;
  -[_MFAtomFieldEditor textStorage](self->_textView, "textStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "beginEditing");
  v11 = -[_MFAtomFieldEditor selectedRange](self->_textView, "selectedRange");
  v12 = v6;
  v10 = 0;
  -[MFAtomTextView _representedObjectsInRange:ranges:](self, "_representedObjectsInRange:ranges:", 0, objc_msgSend(v5, "length"), &v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v10;

  if (v7)
  {
    objc_msgSend(v8, "objectsAtIndexes:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFAtomTextView _deleteCharactersInStorage:ranges:rangeToAdjust:](self, "_deleteCharactersInStorage:ranges:rangeToAdjust:", v5, v9, &v11);

  }
  objc_msgSend(v5, "endEditing");
  -[MFAtomTextView setNeedsLayout](self, "setNeedsLayout");
  -[MFAtomTextView sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 0x20000);
  -[_MFAtomFieldEditor setSelectedRange:](self->_textView, "setSelectedRange:", v11, v12);

}

- (void)removeRepresentedObjects:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;

  v4 = a3;
  -[_MFAtomFieldEditor textStorage](self->_textView, "textStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "beginEditing");
  v18 = -[_MFAtomFieldEditor selectedRange](self->_textView, "selectedRange");
  v19 = v6;
  v17 = 0;
  -[MFAtomTextView _representedObjectsInRange:ranges:](self, "_representedObjectsInRange:ranges:", 0, objc_msgSend(v5, "length"), &v17);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v17;
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __43__MFAtomTextView_removeRepresentedObjects___block_invoke;
  v15 = &unk_1E5A656C8;
  v9 = v4;
  v16 = v9;
  objc_msgSend(v7, "indexesOfObjectsPassingTest:", &v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectsAtIndexes:", v10, v12, v13, v14, v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFAtomTextView _deleteCharactersInStorage:ranges:rangeToAdjust:](self, "_deleteCharactersInStorage:ranges:rangeToAdjust:", v5, v11, &v18);

  objc_msgSend(v5, "endEditing");
  -[MFAtomTextView setNeedsLayout](self, "setNeedsLayout");
  -[MFAtomTextView sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 0x20000);
  -[_MFAtomFieldEditor setSelectedRange:](self->_textView, "setSelectedRange:", v18, v19);

}

uint64_t __43__MFAtomTextView_removeRepresentedObjects___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2);
}

- (void)removeRepresentedObjectAtIndex:(unint64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[MFAtomTextView removeRepresentedObjectsAtIndexes:](self, "removeRepresentedObjectsAtIndexes:");

}

- (void)removeRepresentedObject:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v7[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFAtomTextView removeRepresentedObjects:](self, "removeRepresentedObjects:", v6);

  }
}

- (void)setRepresentedObjects:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_MFAtomFieldEditor textStorage](self->_textView, "textStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "beginEditing");
  objc_msgSend(v5, "deleteCharactersInRange:", 0, objc_msgSend(v5, "length"));
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v6);
        -[MFAtomTextView _baseAttributedStringWithRepresentedObject:](self, "_baseAttributedStringWithRepresentedObject:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9), (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "appendAttributedString:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  objc_msgSend(v5, "endEditing");
  -[_MFAtomFieldEditor layoutManager](self->_textView, "layoutManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "invalidateLayoutForCharacterRange:actualCharacterRange:", 0, objc_msgSend(v5, "length"), 0);

  -[MFAtomTextView setNeedsLayout](self, "setNeedsLayout");
  -[MFAtomTextView sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 0x20000);
  -[_MFAtomFieldEditor setSelectedRange:](self->_textView, "setSelectedRange:", objc_msgSend(v5, "length"), 0);

}

- (void)addRepresentedObject:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a3;
  -[_MFAtomFieldEditor textStorage](self->_textView, "textStorage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "beginEditing");
  -[MFAtomTextView _baseAttributedStringWithRepresentedObject:](self, "_baseAttributedStringWithRepresentedObject:", v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "length");
  v7 = objc_msgSend(v5, "length");
  objc_msgSend(v4, "appendAttributedString:", v5);
  objc_msgSend(v4, "endEditing");
  if (v7)
  {
    -[_MFAtomFieldEditor layoutManager](self->_textView, "layoutManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "invalidateLayoutForCharacterRange:actualCharacterRange:", v6, v7, 0);

  }
  -[MFAtomTextView setNeedsLayout](self, "setNeedsLayout");
  -[MFAtomTextView sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 0x20000);
  -[_MFAtomFieldEditor setSelectedRange:](self->_textView, "setSelectedRange:", objc_msgSend(v4, "length"), 0);

}

- (id)_atomLayoutViewForRepresentedObject:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "atomTextView:atomViewForRepresentedObject:", self, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setEnabled:", -[MFAtomTextView isEnabled](self, "isEnabled"));
  objc_msgSend(v6, "viewForLastBaselineLayout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v7, "_setDrawsDebugBaselines:", -[MFAtomTextView _drawsDebugBaselines](self, "_drawsDebugBaselines"));
  +[_MFAtomLayoutView layoutViewWithDelegateView:](_MFAtomLayoutView, "layoutViewWithDelegateView:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_supportedPasteboardTypes
{
  void *v2;
  id WeakRetained;
  uint64_t v5;
  void *v6;
  id v7;

  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "supportedPasteboardTypesForAtomTextView:", self);
    v5 = objc_claimAutoreleasedReturnValue();

    v2 = (void *)v5;
  }
  else
  {
    v2 = 0;
  }
  if (objc_msgSend(v2, "count"))
    v6 = v2;
  else
    v6 = (void *)*MEMORY[0x1E0DC51E0];
  v7 = v6;

  return v7;
}

- (id)_representedObjectsFromPasteboard:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((*(_BYTE *)&self->_flags & 4) == 0
    || (WeakRetained = objc_loadWeakRetained((id *)&self->_delegate),
        objc_msgSend(WeakRetained, "atomTextView:representedObjectsFromPasteboard:", self, v4),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        WeakRetained,
        !v6))
  {
    objc_msgSend(v4, "string");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    if (v7)
    {
      v10[0] = v7;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = (void *)MEMORY[0x1E0C9AA60];
    }

  }
  return v6;
}

- (void)_storeRepresentedObjects:(id)a3 onPasteboard:(id)a4
{
  id WeakRetained;
  char v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const __CFString *v14;
  id v15;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v15 = a4;
  if ((*(_BYTE *)&self->_flags & 8) == 0
    || (WeakRetained = objc_loadWeakRetained((id *)&self->_delegate),
        v7 = objc_msgSend(WeakRetained, "atomTextView:storeRepresentedObjects:onPasteboard:", self, v16, v15),
        WeakRetained,
        (v7 & 1) == 0))
  {
    objc_msgSend(MEMORY[0x1E0CB37A0], "string");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v9 = v16;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v18;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v18 != v11)
            objc_enumerationMutation(v9);
          v13 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v12);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            if (objc_msgSend(v8, "length"))
              v14 = CFSTR(" ");
            else
              v14 = &stru_1E5A6A588;
            objc_msgSend(v8, "appendFormat:", CFSTR("%@%@"), v14, v13);
          }
          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v10);
    }

    objc_msgSend(v15, "setString:", v8);
  }

}

- (void)_insertRepresentedObjects:(id)a3 atCharacterRange:(_NSRange)a4
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char isKindOfClass;
  void *v9;
  id v10;
  char *v11;
  char *v12;
  uint64_t v13;
  char *v14;
  char *v15;
  NSUInteger v16;
  NSUInteger v17;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  NSUInteger length;
  uint64_t v26;
  NSUInteger v27;
  uint64_t i;
  void *v29;
  NSUInteger location;
  uint64_t v31;
  NSUInteger v32;
  NSRange v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  id v47;
  _NSRange v48;
  _BYTE v49[128];
  _BYTE v50[128];
  _QWORD v51[3];
  NSRange v52;
  NSRange v53;

  v51[1] = *MEMORY[0x1E0C80C00];
  v48 = a4;
  v36 = a3;
  -[_MFAtomFieldEditor textStorage](self->_textView, "textStorage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v4;
  objc_msgSend(v4, "beginEditing");
  if (v48.length)
  {
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", v48.location);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v51[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFAtomTextView _deleteCharactersInStorage:ranges:rangeToAdjust:](self, "_deleteCharactersInStorage:ranges:rangeToAdjust:", v4, v6, &v48);

  }
  objc_msgSend(v36, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    v47 = 0;
    -[MFAtomTextView _representedObjectsInRange:ranges:](self, "_representedObjectsInRange:ranges:", 0, objc_msgSend(v4, "length"), &v47);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v10 = v47;
    v11 = (char *)objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v43, v50, 16);
    if (v11)
    {
      v12 = 0;
      v13 = *(_QWORD *)v44;
      do
      {
        v14 = 0;
        v15 = &v11[(_QWORD)v12];
        do
        {
          if (*(_QWORD *)v44 != v13)
            objc_enumerationMutation(v10);
          v16 = objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * (_QWORD)v14), "rangeValue");
          if (v48.location >= v16 && v48.location - v16 < v17)
          {
            v15 = &v14[(_QWORD)v12];
            objc_msgSend(v9, "objectAtIndexedSubscript:", &v14[(_QWORD)v12]);
            v11 = (char *)objc_claimAutoreleasedReturnValue();
            goto LABEL_18;
          }
          ++v14;
        }
        while (v11 != v14);
        v11 = (char *)objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v43, v50, 16);
        v12 = v15;
      }
      while (v11);
    }
    else
    {
      v15 = 0;
    }
LABEL_18:

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v10, "objectAtIndexedSubscript:", v15);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "rangeValue");
      v22 = v21;

      if (v48.location != v20)
      {
        v48.location = v20 + v22;
        v48.length = 0;
      }
    }

  }
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v23 = v36;
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v39, v49, 16);
  length = 0;
  if (v24)
  {
    v26 = *(_QWORD *)v40;
    v27 = 0x7FFFFFFFFFFFFFFFLL;
    do
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v40 != v26)
          objc_enumerationMutation(v23);
        -[MFAtomTextView _baseAttributedStringWithRepresentedObject:](self, "_baseAttributedStringWithRepresentedObject:", *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * i));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "insertAttributedString:atIndex:", v29, v48.location);
        location = v48.location;
        v31 = objc_msgSend(v29, "length");
        v32 = v31;
        if (v27 == 0x7FFFFFFFFFFFFFFFLL)
        {
          v27 = location;
          length = v31;
        }
        else
        {
          v52.location = location;
          v52.length = v32;
          v53.location = v27;
          v53.length = length;
          v33 = NSUnionRange(v52, v53);
          v27 = v33.location;
          length = v33.length;
        }
        v48.location = v32 + location;
        v48.length = 0;

      }
      v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v39, v49, 16);
    }
    while (v24);
  }
  else
  {
    v27 = 0x7FFFFFFFFFFFFFFFLL;
  }

  v34 = v37;
  objc_msgSend(v37, "endEditing");
  if (length)
  {
    -[_MFAtomFieldEditor layoutManager](self->_textView, "layoutManager");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "invalidateLayoutForCharacterRange:actualCharacterRange:", v27, length, 0);

    v34 = v37;
  }
  -[MFAtomTextView setNeedsLayout](self, "setNeedsLayout");
  -[MFAtomTextView sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 0x20000);
  -[_MFAtomFieldEditor setSelectedRange:](self->_textView, "setSelectedRange:", v48.location, v48.length);

}

- (void)_removeRepresentedObjectsInCharacterRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[2];

  length = a3.length;
  location = a3.location;
  v12[1] = *MEMORY[0x1E0C80C00];
  -[_MFAtomFieldEditor textStorage](self->_textView, "textStorage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "beginEditing");
  v10 = -[_MFAtomFieldEditor selectedRange](self->_textView, "selectedRange");
  v11 = v7;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", location, length);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFAtomTextView _deleteCharactersInStorage:ranges:rangeToAdjust:](self, "_deleteCharactersInStorage:ranges:rangeToAdjust:", v6, v9, &v10);

  objc_msgSend(v6, "endEditing");
  -[MFAtomTextView setNeedsLayout](self, "setNeedsLayout");
  -[MFAtomTextView sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 0x20000);
  -[_MFAtomFieldEditor setSelectedRange:](self->_textView, "setSelectedRange:", v10, v11);

}

- (UIEdgeInsets)_edgeInsetsForDirectionalInsets:(NSDirectionalEdgeInsets)a3
{
  double trailing;
  CGFloat bottom;
  double leading;
  CGFloat top;
  int v7;
  double v8;
  double v9;
  double v10;
  double v11;
  UIEdgeInsets result;

  trailing = a3.trailing;
  bottom = a3.bottom;
  leading = a3.leading;
  top = a3.top;
  v7 = -[MFAtomTextView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  if (v7)
    v8 = trailing;
  else
    v8 = leading;
  if (v7)
    v9 = leading;
  else
    v9 = trailing;
  v10 = top;
  v11 = bottom;
  result.right = v9;
  result.bottom = v11;
  result.left = v8;
  result.top = v10;
  return result;
}

- (CGRect)_visibleAtomsRect
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
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
  CGRect result;

  -[UIScrollView bounds](self->_scrollView, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UIScrollView contentInset](self->_scrollView, "contentInset");
  -[MFAtomTextView convertRect:fromView:](self, "convertRect:fromView:", self->_scrollView, v4 + v14, v6 + v11, v8 - (v14 + v12), v10 - (v11 + v13));
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (id)_clearButtonImageForState:(unint64_t)a3
{
  void *v3;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  objc_msgSend(MEMORY[0x1E0DC3870], "kitImageNamed:", CFSTR("UITextFieldClearButton"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFAtomTextView tintColor](self, "tintColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7
    || (objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v7, "isEqual:", v3)))
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.047, 0.455, 0.867, 1.0);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (!v7)
      goto LABEL_6;
  }
  else
  {
    v8 = v7;
  }

LABEL_6:
  if (a3 == 1)
  {
    v9 = v8;
  }
  else
  {
    if (a3 == 2)
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.1);
    else
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.275);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;
  v11 = (void *)MEMORY[0x1E0DC3870];
  objc_msgSend(v6, "size");
  objc_msgSend(v11, "_tintedImageForSize:withTint:effectsImage:maskImage:style:", v10, 0, v6, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (UIButton)clearButton
{
  UIButton *clearButton;
  id v4;
  UIButton *v5;
  UIButton *v6;
  UIButton *v7;
  void *v8;
  UIButton *v9;
  void *v10;
  UIButton *v11;
  void *v12;

  clearButton = self->_clearButton;
  if (!clearButton)
  {
    v4 = objc_alloc(MEMORY[0x1E0DC3518]);
    v5 = (UIButton *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v6 = self->_clearButton;
    self->_clearButton = v5;

    -[UIButton addTarget:action:forControlEvents:](self->_clearButton, "addTarget:action:forControlEvents:", self, sel__clearButtonTapped_, 64);
    v7 = self->_clearButton;
    -[MFAtomTextView _clearButtonImageForState:](self, "_clearButtonImageForState:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setImage:forState:](v7, "setImage:forState:", v8, 0);

    v9 = self->_clearButton;
    -[MFAtomTextView _clearButtonImageForState:](self, "_clearButtonImageForState:", 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setImage:forState:](v9, "setImage:forState:", v10, 1);

    v11 = self->_clearButton;
    -[MFAtomTextView _clearButtonImageForState:](self, "_clearButtonImageForState:", 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setImage:forState:](v11, "setImage:forState:", v12, 2);

    -[UIButton setOpaque:](self->_clearButton, "setOpaque:", 0);
    -[UIButton setBackgroundColor:](self->_clearButton, "setBackgroundColor:", 0);
    -[UIButton _setTouchInsets:](self->_clearButton, "_setTouchInsets:", -12.5, -12.5, -12.5, -12.5);
    clearButton = self->_clearButton;
  }
  return clearButton;
}

- (CGSize)_clearButtonSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 19.0;
  v3 = 19.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGRect)clearButtonFrameForBounds:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGFloat v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  CGFloat v29;
  CGFloat rect;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = (CGFloat *)MEMORY[0x1E0C9D648];
  rect = *(double *)(MEMORY[0x1E0C9D648] + 8);
  -[MFAtomTextView _clearButtonSize](self, "_clearButtonSize");
  v10 = v9;
  v12 = v11;
  -[UIView mf_currentScreenScale](self, "mf_currentScreenScale");
  if (-[MFAtomTextView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))
  {
    v31.origin.x = x;
    v31.origin.y = y;
    v31.size.width = width;
    v31.size.height = height;
    CGRectGetMinX(v31);
  }
  else
  {
    v29 = v10;
    v13 = v12;
    v14 = *v8;
    v32.origin.x = x;
    v32.origin.y = y;
    v32.size.width = width;
    v32.size.height = height;
    CGRectGetMaxX(v32);
    v33.origin.x = v14;
    v12 = v13;
    v10 = v29;
    v33.origin.y = rect;
    v33.size.width = v29;
    v33.size.height = v12;
    CGRectGetWidth(v33);
  }
  UIRoundToViewScale();
  v16 = v15;
  v34.origin.x = x;
  v34.origin.y = y;
  v34.size.width = width;
  v34.size.height = height;
  CGRectGetMidY(v34);
  v35.origin.x = v16;
  v35.origin.y = rect;
  v35.size.width = v10;
  v35.size.height = v12;
  CGRectGetHeight(v35);
  UIRoundToViewScale();
  v18 = v17;
  -[MFAtomTextView clearButtonInsets](self, "clearButtonInsets");
  -[MFAtomTextView _edgeInsetsForDirectionalInsets:](self, "_edgeInsetsForDirectionalInsets:");
  v20 = v18 + v19;
  v23 = v10 - (v21 + v22);
  v25 = v12 - (v19 + v24);
  v26 = v16 + v21;
  v27 = v20;
  v28 = v23;
  result.size.height = v25;
  result.size.width = v28;
  result.origin.y = v27;
  result.origin.x = v26;
  return result;
}

- (CGRect)_rectForBounds:(CGRect)a3 sizingView:(id)a4 isLeft:(BOOL)a5
{
  _BOOL4 v5;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat *v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGFloat v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect result;

  v5 = a5;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = (CGFloat *)MEMORY[0x1E0C9D648];
  v11 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  objc_msgSend(a4, "systemLayoutSizeFittingSize:", a3.size.width, a3.size.height);
  v13 = v12;
  v15 = v14;
  if (v5)
  {
    v25.origin.x = x;
    v25.origin.y = y;
    v25.size.width = width;
    v25.size.height = height;
    CGRectGetMinX(v25);
  }
  else
  {
    v24 = v11;
    v16 = *v10;
    v26.origin.x = x;
    v26.origin.y = y;
    v26.size.width = width;
    v26.size.height = height;
    CGRectGetMaxX(v26);
    v27.origin.x = v16;
    v11 = v24;
    v27.origin.y = v24;
    v27.size.width = v13;
    v27.size.height = v15;
    CGRectGetWidth(v27);
  }
  UIRoundToViewScale();
  v18 = v17;
  v28.origin.x = x;
  v28.origin.y = y;
  v28.size.width = width;
  v28.size.height = height;
  CGRectGetMidY(v28);
  v29.origin.x = v18;
  v29.origin.y = v11;
  v29.size.width = v13;
  v29.size.height = v15;
  CGRectGetHeight(v29);
  UIRoundToViewScale();
  v20 = v19;
  v21 = v18;
  v22 = v13;
  v23 = v15;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v20;
  result.origin.x = v21;
  return result;
}

- (CGRect)leadingViewFrameForBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  uint64_t v8;
  void *v9;
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
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = -[MFAtomTextView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection") ^ 1;
  -[MFAtomTextView leadingView](self, "leadingView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFAtomTextView _rectForBounds:sizingView:isLeft:](self, "_rectForBounds:sizingView:isLeft:", v9, v8, x, y, width, height);
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;

  -[MFAtomTextView leadingViewInsets](self, "leadingViewInsets");
  -[MFAtomTextView _edgeInsetsForDirectionalInsets:](self, "_edgeInsetsForDirectionalInsets:");
  v19 = v13 + v18;
  v22 = v15 - (v20 + v21);
  v24 = v17 - (v18 + v23);
  v25 = v11 + v20;
  v26 = v19;
  v27 = v22;
  result.size.height = v24;
  result.size.width = v27;
  result.origin.y = v26;
  result.origin.x = v25;
  return result;
}

- (CGRect)trailingViewFrameForBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
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
  double v23;
  double v24;
  double v25;
  double v26;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[MFAtomTextView trailingView](self, "trailingView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFAtomTextView _rectForBounds:sizingView:isLeft:](self, "_rectForBounds:sizingView:isLeft:", v8, -[MFAtomTextView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"), x, y, width, height);
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  -[MFAtomTextView trailingViewInsets](self, "trailingViewInsets");
  -[MFAtomTextView _edgeInsetsForDirectionalInsets:](self, "_edgeInsetsForDirectionalInsets:");
  v18 = v12 + v17;
  v21 = v14 - (v19 + v20);
  v23 = v16 - (v17 + v22);
  v24 = v10 + v19;
  v25 = v18;
  v26 = v21;
  result.size.height = v23;
  result.size.width = v26;
  result.origin.y = v25;
  result.origin.x = v24;
  return result;
}

- (BOOL)_showViewWithMode:(int64_t)a3 alwaysDefinition:(BOOL)a4
{
  _BOOL4 v7;
  _BOOL4 v8;
  BOOL v9;
  BOOL v10;

  v7 = -[MFAtomTextView isFirstResponder](self, "isFirstResponder");
  v8 = v7 & -[MFAtomTextView _hasContent](self, "_hasContent");
  v9 = !v8;
  v10 = a3 == 3 && a4;
  if (a3 != 2)
    v9 = v10;
  if (a3 == 1)
    return v8;
  else
    return v9;
}

- (BOOL)_showsClearButton
{
  return -[MFAtomTextView _showViewWithMode:alwaysDefinition:](self, "_showViewWithMode:alwaysDefinition:", -[MFAtomTextView clearButtonMode](self, "clearButtonMode"), -[MFAtomTextView _hasContent](self, "_hasContent"));
}

- (BOOL)_showsLeadingView
{
  void *v3;
  BOOL v4;

  -[MFAtomTextView leadingView](self, "leadingView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = -[MFAtomTextView _showViewWithMode:alwaysDefinition:](self, "_showViewWithMode:alwaysDefinition:", -[MFAtomTextView leadingViewMode](self, "leadingViewMode"), 1);
  else
    v4 = 0;

  return v4;
}

- (BOOL)_showsTrailingView
{
  void *v3;
  BOOL v4;

  -[MFAtomTextView trailingView](self, "trailingView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3
    && !-[MFAtomTextView _showsClearButton](self, "_showsClearButton")
    && -[MFAtomTextView _showViewWithMode:alwaysDefinition:](self, "_showViewWithMode:alwaysDefinition:", -[MFAtomTextView trailingViewMode](self, "trailingViewMode"), 1);

  return v4;
}

- (void)_layoutButtons
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  UIButton *clearButton;
  UIView *leadingView;
  UIView *trailingView;
  id v14;
  id v15;
  id v16;

  -[MFAtomTextView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  if (-[MFAtomTextView _showsClearButton](self, "_showsClearButton"))
  {
    -[MFAtomTextView clearButton](self, "clearButton");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    -[MFAtomTextView clearButtonFrameForBounds:](self, "clearButtonFrameForBounds:", v4, v6, v8, v10);
    objc_msgSend(v14, "setFrame:");
    -[MFAtomTextView addSubview:](self, "addSubview:", v14);

  }
  else
  {
    clearButton = self->_clearButton;
    if (clearButton)
      -[UIButton removeFromSuperview](clearButton, "removeFromSuperview");
  }
  if (-[MFAtomTextView _showsLeadingView](self, "_showsLeadingView"))
  {
    -[MFAtomTextView leadingView](self, "leadingView");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    -[MFAtomTextView leadingViewFrameForBounds:](self, "leadingViewFrameForBounds:", v4, v6, v8, v10);
    objc_msgSend(v15, "setFrame:");
    -[MFAtomTextView addSubview:](self, "addSubview:", v15);

  }
  else
  {
    leadingView = self->_leadingView;
    if (leadingView)
      -[UIView removeFromSuperview](leadingView, "removeFromSuperview");
  }
  if (-[MFAtomTextView _showsTrailingView](self, "_showsTrailingView"))
  {
    -[MFAtomTextView trailingView](self, "trailingView");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    -[MFAtomTextView trailingViewFrameForBounds:](self, "trailingViewFrameForBounds:", v4, v6, v8, v10);
    objc_msgSend(v16, "setFrame:");
    -[MFAtomTextView addSubview:](self, "addSubview:", v16);

  }
  else
  {
    trailingView = self->_trailingView;
    if (trailingView)
      -[UIView removeFromSuperview](trailingView, "removeFromSuperview");
  }
}

- (void)setPlaceholderColor:(id)a3
{
  UIColor *v4;
  void (**v5)(_QWORD);
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t);
  void *v9;
  MFAtomTextView *v10;
  UIColor *v11;

  v4 = (UIColor *)a3;
  if (!v4)
  {
    objc_msgSend((id)objc_opt_class(), "defaultPlaceholderColor");
    v4 = (UIColor *)objc_claimAutoreleasedReturnValue();
  }
  if (self->_placeholderColor != v4)
  {
    objc_storeStrong((id *)&self->_placeholderColor, v4);
    if (self->_placeholderLabel)
    {
      v6 = MEMORY[0x1E0C809B0];
      v7 = 3221225472;
      v8 = __38__MFAtomTextView_setPlaceholderColor___block_invoke;
      v9 = &unk_1E5A65430;
      v10 = self;
      v11 = v4;
      v5 = (void (**)(_QWORD))_Block_copy(&v6);
      if (objc_msgSend(MEMORY[0x1E0DC3F10], "areAnimationsEnabled", v6, v7, v8, v9, v10))
        objc_msgSend(MEMORY[0x1E0DC3F10], "transitionWithView:duration:options:animations:completion:", self->_placeholderLabel, 5242880, v5, 0, 0.35);
      else
        v5[2](v5);

    }
  }

}

uint64_t __38__MFAtomTextView_setPlaceholderColor___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 504), "setTextColor:", *(_QWORD *)(a1 + 40));
}

- (UILabel)placeholderLabel
{
  UILabel *placeholderLabel;
  id v4;
  UILabel *v5;
  UILabel *v6;
  void *v7;
  void *v8;
  void *v9;

  placeholderLabel = self->_placeholderLabel;
  if (!placeholderLabel)
  {
    v4 = objc_alloc(MEMORY[0x1E0DC3990]);
    v5 = (UILabel *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v6 = self->_placeholderLabel;
    self->_placeholderLabel = v5;

    -[UILabel _setDrawsDebugBaselines:](self->_placeholderLabel, "_setDrawsDebugBaselines:", -[MFAtomTextView _drawsDebugBaselines](self, "_drawsDebugBaselines"));
    -[MFAtomTextView font](self, "font");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](self->_placeholderLabel, "setFont:", v7);

    -[MFAtomTextView placeholderColor](self, "placeholderColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](self->_placeholderLabel, "setTextColor:", v8);

    -[MFAtomTextView placeholder](self, "placeholder");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](self->_placeholderLabel, "setText:", v9);

    placeholderLabel = self->_placeholderLabel;
  }
  return placeholderLabel;
}

- (void)setPlaceholder:(id)a3
{
  NSString *v4;
  NSString *placeholder;
  NSString *v6;

  v6 = (NSString *)a3;
  if (self->_placeholder != v6)
  {
    v4 = (NSString *)-[NSString copy](v6, "copy");
    placeholder = self->_placeholder;
    self->_placeholder = v4;

    -[UILabel setText:](self->_placeholderLabel, "setText:", self->_placeholder);
    -[MFAtomTextView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (CGRect)placeholderFrameForBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  char v17;
  _BOOL4 v18;
  _BOOL4 v19;
  _BOOL4 v20;
  int v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  uint64_t v38;
  double v39;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UILabel sizeThatFits:](self->_placeholderLabel, "sizeThatFits:", a3.size.width, a3.size.height);
  -[UIView mf_currentScreenScale](self, "mf_currentScreenScale");
  v38 = v8;
  UIRectCenteredYInRectScale();
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v17 = -[MFAtomTextView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection", v38);
  v18 = -[MFAtomTextView _showsLeadingView](self, "_showsLeadingView");
  v19 = -[MFAtomTextView _showsTrailingView](self, "_showsTrailingView");
  v20 = -[MFAtomTextView _showsClearButton](self, "_showsClearButton");
  v21 = v19 || v20;
  v39 = v16;
  if ((v17 & 1) == 0 && v18)
  {
    -[MFAtomTextView leadingViewFrameForBounds:](self, "leadingViewFrameForBounds:", x, y, width, height);
    v23 = v22 + 16.0;
    v24 = v14 - (v22 + 16.0);
    if ((v21 & 1) == 0)
      goto LABEL_18;
    goto LABEL_10;
  }
  if ((v17 & 1) == 0)
  {
    v24 = v14 + -8.0;
    v23 = 8.0;
    if ((v21 & 1) != 0)
    {
LABEL_10:
      if (v20)
        -[MFAtomTextView clearButtonFrameForBounds:](self, "clearButtonFrameForBounds:", x, y, width, height);
      else
        -[MFAtomTextView trailingViewFrameForBounds:](self, "trailingViewFrameForBounds:", x, y, width, height);
      goto LABEL_15;
    }
    goto LABEL_18;
  }
  if (v21)
  {
    if (v20)
      -[MFAtomTextView clearButtonFrameForBounds:](self, "clearButtonFrameForBounds:", x, y, width, height);
    else
      -[MFAtomTextView trailingViewFrameForBounds:](self, "trailingViewFrameForBounds:", x, y, width, height);
    v23 = v25 + 16.0;
    v24 = v14 - (v25 + 16.0);
    if (!v18)
      goto LABEL_18;
    goto LABEL_14;
  }
  v24 = v14 + -8.0;
  v23 = 8.0;
  if (!v18)
  {
LABEL_18:
    v27 = v24 + -8.0;
    goto LABEL_19;
  }
LABEL_14:
  -[MFAtomTextView leadingViewFrameForBounds:](self, "leadingViewFrameForBounds:", x, y, width, height);
LABEL_15:
  v27 = v24 - (v26 + 16.0);
LABEL_19:
  -[MFAtomTextView placeholderInsets](self, "placeholderInsets");
  -[MFAtomTextView _edgeInsetsForDirectionalInsets:](self, "_edgeInsetsForDirectionalInsets:");
  v29 = v12 + v28;
  v32 = v27 - (v30 + v31);
  v34 = v39 - (v28 + v33);
  v35 = v10 + v23 + v30;
  v36 = v29;
  v37 = v32;
  result.size.height = v34;
  result.size.width = v37;
  result.origin.y = v36;
  result.origin.x = v35;
  return result;
}

- (BOOL)_showsPlaceholder
{
  return !-[MFAtomTextView _hasContent](self, "_hasContent");
}

- (void)_layoutPlaceholder
{
  UILabel *placeholderLabel;
  id v4;

  if (-[MFAtomTextView _showsPlaceholder](self, "_showsPlaceholder"))
  {
    -[MFAtomTextView placeholderLabel](self, "placeholderLabel");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[MFAtomTextView bounds](self, "bounds");
    -[MFAtomTextView placeholderFrameForBounds:](self, "placeholderFrameForBounds:");
    objc_msgSend(v4, "setFrame:");
    -[MFAtomTextView addSubview:](self, "addSubview:", v4);

  }
  else
  {
    placeholderLabel = self->_placeholderLabel;
    if (placeholderLabel)
      -[UILabel removeFromSuperview](placeholderLabel, "removeFromSuperview");
  }
}

- (UIEdgeInsets)edgeInsets
{
  __int128 v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  void (**v13)(void *, uint64_t);
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  _QWORD aBlock[9];
  uint64_t v29;
  double *v30;
  uint64_t v31;
  const char *v32;
  __int128 v33;
  __int128 v34;
  UIEdgeInsets result;

  v29 = 0;
  v30 = (double *)&v29;
  v31 = 0x4010000000;
  v32 = "";
  v3 = *(_OWORD *)(MEMORY[0x1E0DC49E8] + 16);
  v33 = *MEMORY[0x1E0DC49E8];
  v34 = v3;
  -[MFAtomTextView bounds](self, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v12 = -[MFAtomTextView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __28__MFAtomTextView_edgeInsets__block_invoke;
  aBlock[3] = &unk_1E5A656F0;
  aBlock[4] = &v29;
  *(double *)&aBlock[5] = v5;
  *(double *)&aBlock[6] = v7;
  *(double *)&aBlock[7] = v9;
  *(double *)&aBlock[8] = v11;
  v13 = (void (**)(void *, uint64_t))_Block_copy(aBlock);
  if (-[MFAtomTextView _showsClearButton](self, "_showsClearButton"))
  {
    -[MFAtomTextView clearButtonFrameForBounds:](self, "clearButtonFrameForBounds:", v5, v7, v9, v11);
    v13[2](v13, v12);
    v14 = 7;
    if ((_DWORD)v12)
      v14 = 5;
    v30[v14] = v30[v14] + 7.0;
  }
  if (-[MFAtomTextView _showsLeadingView](self, "_showsLeadingView"))
  {
    -[MFAtomTextView leadingViewFrameForBounds:](self, "leadingViewFrameForBounds:", v5, v7, v9, v11);
    v13[2](v13, v12 ^ 1);
  }
  if (-[MFAtomTextView _showsTrailingView](self, "_showsTrailingView"))
  {
    -[MFAtomTextView trailingViewFrameForBounds:](self, "trailingViewFrameForBounds:", v5, v7, v9, v11);
    v13[2](v13, v12);
  }
  -[MFAtomTextView textInsets](self, "textInsets");
  -[MFAtomTextView _edgeInsetsForDirectionalInsets:](self, "_edgeInsetsForDirectionalInsets:");
  UIEdgeInsetsAdd();
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v23 = v30;
  v30[4] = v15;
  v23[5] = v17;
  v23[6] = v19;
  v23[7] = v21;

  _Block_object_dispose(&v29, 8);
  v24 = v16;
  v25 = v18;
  v26 = v20;
  v27 = v22;
  result.right = v27;
  result.bottom = v26;
  result.left = v25;
  result.top = v24;
  return result;
}

double __28__MFAtomTextView_edgeInsets__block_invoke(uint64_t a1, int a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  double MaxX;
  double *v12;
  double v13;
  double result;
  CGRect v15;

  if (a2)
  {
    MaxX = CGRectGetMaxX(*(CGRect *)&a3);
    v12 = (double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  }
  else
  {
    v13 = CGRectGetMaxX(*(CGRect *)(a1 + 40));
    v15.origin.x = a3;
    v15.origin.y = a4;
    v15.size.width = a5;
    v15.size.height = a6;
    MaxX = v13 - CGRectGetMinX(v15);
    v12 = (double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 56);
  }
  result = MaxX + *v12;
  *v12 = result;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
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
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  uint64_t v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  uint64_t v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;

  -[MFAtomTextView _layoutPlaceholder](self, "_layoutPlaceholder");
  -[MFAtomTextView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[MFAtomTextView edgeInsets](self, "edgeInsets");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  -[_UITextFieldRoundedRectBackgroundViewNeue setFrame:](self->_background, "setFrame:", v4, v6, v8, v10);
  v19 = v4 + v14;
  v20 = v6 + v12;
  v21 = v8 - (v14 + v18);
  v22 = v10 - (v12 + v16);
  v23 = v19;
  -[UIScrollView setFrame:](self->_scrollView, "setFrame:", v19, v6 + v12, v21, v22);
  v24 = *MEMORY[0x1E0C9D648];
  v25 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  *(_BYTE *)&self->_flags |= 0x20u;
  v38.origin.x = v23;
  v38.origin.y = v20;
  v38.size.width = v21;
  v38.size.height = v22;
  -[_MFAtomFieldEditor sizeThatFits:](self->_textView, "sizeThatFits:", 1.79769313e308, CGRectGetHeight(v38));
  v39.size.width = v26;
  v39.size.height = v27;
  *(_BYTE *)&self->_flags &= ~0x20u;
  v39.origin.x = v24;
  v39.origin.y = v25;
  CGRectGetWidth(v39);
  v40.origin.x = v23;
  v40.origin.y = v20;
  v40.size.width = v21;
  v40.size.height = v22;
  CGRectGetWidth(v40);
  -[UILabel bounds](self->_placeholderLabel, "bounds");
  CGRectGetHeight(v41);
  -[UIView mf_currentScreenScale](self, "mf_currentScreenScale");
  v37 = v28;
  UIRectCenteredYInRectScale();
  v30 = v29;
  v32 = v31;
  v34 = v33;
  v36 = v35;
  -[_MFAtomFieldEditor frame](self->_textView, "frame", v37);
  v43.origin.x = v30;
  v43.origin.y = v32;
  v43.size.width = v34;
  v43.size.height = v36;
  if (!CGRectEqualToRect(v42, v43))
    -[_MFAtomFieldEditor setFrame:](self->_textView, "setFrame:", v30, v32, v34, v36);
  -[MFAtomTextView _layoutButtons](self, "_layoutButtons");
  -[MFAtomTextView _updateBaselineConstraintIfNecessaryUsingTextViewFrame:](self, "_updateBaselineConstraintIfNecessaryUsingTextViewFrame:", v30, v32, v34, v36);
  -[MFAtomTextView _scrollToSelectionIfNeeded](self, "_scrollToSelectionIfNeeded");
}

- (void)setTextInsets:(NSDirectionalEdgeInsets)a3
{
  if (self->_textInsets.leading != a3.leading
    || self->_textInsets.top != a3.top
    || self->_textInsets.trailing != a3.trailing
    || self->_textInsets.bottom != a3.bottom)
  {
    self->_textInsets = a3;
    -[MFAtomTextView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setPlaceholderInsets:(NSDirectionalEdgeInsets)a3
{
  if (self->_placeholderInsets.leading != a3.leading
    || self->_placeholderInsets.top != a3.top
    || self->_placeholderInsets.trailing != a3.trailing
    || self->_placeholderInsets.bottom != a3.bottom)
  {
    self->_placeholderInsets = a3;
    -[MFAtomTextView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setLeadingViewInsets:(NSDirectionalEdgeInsets)a3
{
  if (self->_leadingViewInsets.leading != a3.leading
    || self->_leadingViewInsets.top != a3.top
    || self->_leadingViewInsets.trailing != a3.trailing
    || self->_leadingViewInsets.bottom != a3.bottom)
  {
    self->_leadingViewInsets = a3;
    -[MFAtomTextView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setTrailingViewInsets:(NSDirectionalEdgeInsets)a3
{
  if (self->_trailingViewInsets.leading != a3.leading
    || self->_trailingViewInsets.top != a3.top
    || self->_trailingViewInsets.trailing != a3.trailing
    || self->_trailingViewInsets.bottom != a3.bottom)
  {
    self->_trailingViewInsets = a3;
    -[MFAtomTextView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setClearButtonInsets:(NSDirectionalEdgeInsets)a3
{
  if (self->_clearButtonInsets.leading != a3.leading
    || self->_clearButtonInsets.top != a3.top
    || self->_clearButtonInsets.trailing != a3.trailing
    || self->_clearButtonInsets.bottom != a3.bottom)
  {
    self->_clearButtonInsets = a3;
    -[MFAtomTextView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (CGPoint)_firstGlyphBaselineLeftPointWithLayoutManager:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  double v12;
  double v13;
  CGFloat MinX;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  _QWORD v20[5];
  uint64_t v21;
  CGRect *v22;
  uint64_t v23;
  const char *v24;
  __int128 v25;
  __int128 v26;
  _QWORD v27[6];
  uint64_t v28;
  double *v29;
  uint64_t v30;
  const char *v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  CGPoint result;

  v4 = a3;
  objc_msgSend(v4, "textStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");
  if (!v6)
  {
    -[MFAtomTextView _baseAttributedStringWithRepresentedObject:](self, "_baseAttributedStringWithRepresentedObject:", CFSTR("X"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendAttributedString:", v7);

  }
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy_;
  v38 = __Block_byref_object_dispose_;
  v39 = 0;
  v28 = 0;
  v29 = (double *)&v28;
  v30 = 0x4010000000;
  v31 = "";
  *(_QWORD *)&v8 = -1;
  *((_QWORD *)&v8 + 1) = -1;
  v32 = v8;
  v33 = v8;
  v9 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __64__MFAtomTextView__firstGlyphBaselineLeftPointWithLayoutManager___block_invoke;
  v27[3] = &unk_1E5A65718;
  v27[4] = &v28;
  v27[5] = &v34;
  objc_msgSend(v4, "enumerateLineFragmentsForGlyphRange:usingBlock:", 0, 1, v27);
  v21 = 0;
  v22 = (CGRect *)&v21;
  v23 = 0x4010000000;
  v24 = "";
  *(_QWORD *)&v10 = -1;
  *((_QWORD *)&v10 + 1) = -1;
  v25 = v10;
  v26 = v10;
  v11 = v35[5];
  v20[0] = v9;
  v20[1] = 3221225472;
  v20[2] = __64__MFAtomTextView__firstGlyphBaselineLeftPointWithLayoutManager___block_invoke_2;
  v20[3] = &unk_1E5A65740;
  v20[4] = &v21;
  objc_msgSend(v4, "enumerateEnclosingRectsForGlyphRange:withinSelectedGlyphRange:inTextContainer:usingBlock:", 0, 1, 0x7FFFFFFFFFFFFFFFLL, 0, v11, v20);
  objc_msgSend(v4, "baselineOffsetForGlyphAtIndex:", 0);
  v13 = v12;
  MinX = CGRectGetMinX(v22[1]);
  v15 = v29[5];
  -[_MFAtomFieldEditor textContainerInset](self->_textView, "textContainerInset");
  v17 = v16;
  if (!v6)
    objc_msgSend(v5, "deleteCharactersInRange:", 0, objc_msgSend(v5, "length"));
  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v34, 8);

  v18 = MinX;
  v19 = v13 + v15 + v17;
  result.y = v19;
  result.x = v18;
  return result;
}

void __64__MFAtomTextView__firstGlyphBaselineLeftPointWithLayoutManager___block_invoke(uint64_t a1, void *a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9, double a10, uint64_t a11, uint64_t a12, _BYTE *a13)
{
  double *v14;

  v14 = *(double **)(*(_QWORD *)(a1 + 32) + 8);
  v14[4] = a7;
  v14[5] = a8;
  v14[6] = a9;
  v14[7] = a10;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  *a13 = 1;
}

uint64_t __64__MFAtomTextView__firstGlyphBaselineLeftPointWithLayoutManager___block_invoke_2(uint64_t result, _BYTE *a2, double a3, double a4, double a5, double a6)
{
  double *v6;

  v6 = *(double **)(*(_QWORD *)(result + 32) + 8);
  v6[4] = a3;
  v6[5] = a4;
  v6[6] = a5;
  v6[7] = a6;
  *a2 = 1;
  return result;
}

- (void)_createBaselineLayoutStrutIfNecessary
{
  _MFAtomTextViewBaselineLayoutStrut *v3;
  _MFAtomTextViewBaselineLayoutStrut *v4;
  _MFAtomTextViewBaselineLayoutStrut *baselineLayoutLabel;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSLayoutConstraint *v14;
  NSLayoutConstraint *baselineLayoutConstraint;

  if (!self->_baselineLayoutLabel)
  {
    v3 = [_MFAtomTextViewBaselineLayoutStrut alloc];
    v4 = -[_MFAtomTextViewBaselineLayoutStrut initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    baselineLayoutLabel = self->_baselineLayoutLabel;
    self->_baselineLayoutLabel = v4;

    -[MFAtomTextView font](self, "font");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MFAtomTextViewBaselineLayoutStrut setFont:](self->_baselineLayoutLabel, "setFont:", v6);

    -[_MFAtomTextViewBaselineLayoutStrut setTranslatesAutoresizingMaskIntoConstraints:](self->_baselineLayoutLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[_MFAtomTextViewBaselineLayoutStrut setHidden:](self->_baselineLayoutLabel, "setHidden:", 1);
    -[MFAtomTextView addSubview:](self, "addSubview:", self->_baselineLayoutLabel);
    LODWORD(v7) = 1148846080;
    -[_MFAtomTextViewBaselineLayoutStrut setContentCompressionResistancePriority:forAxis:](self->_baselineLayoutLabel, "setContentCompressionResistancePriority:forAxis:", 1, v7);
    LODWORD(v8) = 1148846080;
    -[_MFAtomTextViewBaselineLayoutStrut setContentHuggingPriority:forAxis:](self->_baselineLayoutLabel, "setContentHuggingPriority:forAxis:", 1, v8);
    v9 = (void *)MEMORY[0x1E0CB3718];
    _NSDictionaryOfVariableBindings(CFSTR("_baselineLayoutLabel"), self->_baselineLayoutLabel, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[_baselineLayoutLabel(0)]"), 0, 0, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "activateConstraints:", v11);

    -[_MFAtomTextViewBaselineLayoutStrut topAnchor](self->_baselineLayoutLabel, "topAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFAtomTextView topAnchor](self, "topAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constraintEqualToAnchor:", v13);
    v14 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    baselineLayoutConstraint = self->_baselineLayoutConstraint;
    self->_baselineLayoutConstraint = v14;

    -[NSLayoutConstraint setActive:](self->_baselineLayoutConstraint, "setActive:", 1);
  }
}

- (void)_updateBaselineConstraintIfNecessaryUsingTextViewFrame:(CGRect)a3
{
  _MFAtomTextViewBaselineLayoutStrut *baselineLayoutLabel;
  double height;
  double width;
  double y;
  double x;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  double v28;
  CGRect v29;

  if (self->_baselineLayoutConstraint)
  {
    baselineLayoutLabel = self->_baselineLayoutLabel;
    if (baselineLayoutLabel)
    {
      height = a3.size.height;
      width = a3.size.width;
      y = a3.origin.y;
      x = a3.origin.x;
      -[_MFAtomTextViewBaselineLayoutStrut frame](baselineLayoutLabel, "frame");
      v10 = v9;
      v12 = v11;
      -[_MFAtomTextViewBaselineLayoutStrut intrinsicContentSize](self->_baselineLayoutLabel, "intrinsicContentSize");
      -[_MFAtomTextViewBaselineLayoutStrut setFrame:](self->_baselineLayoutLabel, "setFrame:", v10, v12, v13, v14);
      -[_MFAtomFieldEditor layoutManager](self->_textView, "layoutManager");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[MFAtomTextView _firstGlyphBaselineLeftPointWithLayoutManager:](self, "_firstGlyphBaselineLeftPointWithLayoutManager:", v15);

      UIRoundToViewScale();
      v17 = v16;
      -[_MFAtomFieldEditor superview](self->_textView, "superview");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[MFAtomTextView convertRect:fromView:](self, "convertRect:fromView:", v18, x, y, width, height);
      v20 = v19;
      v22 = v21;
      v24 = v23;
      v26 = v25;

      v29.origin.x = v20;
      v29.origin.y = v22;
      v29.size.width = v24;
      v29.size.height = v26;
      v27 = v17 + CGRectGetMinY(v29);
      -[_MFAtomTextViewBaselineLayoutStrut _firstLineBaselineOffsetFromBoundsTop](self->_baselineLayoutLabel, "_firstLineBaselineOffsetFromBoundsTop");
      -[NSLayoutConstraint setConstant:](self->_baselineLayoutConstraint, "setConstant:", v27 - v28);
    }
  }
}

- (id)viewForLastBaselineLayout
{
  -[MFAtomTextView _createBaselineLayoutStrutIfNecessary](self, "_createBaselineLayoutStrutIfNecessary");
  return self->_baselineLayoutLabel;
}

- (id)_attachmentAtCharacterIndex:(unint64_t)a3
{
  void *v4;
  void *v5;
  id v6;

  -[_MFAtomFieldEditor textStorage](self->_textView, "textStorage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0DC10F8], a3, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;

  return v6;
}

- (_NSRange)_characterRangeForAtomView:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSUInteger v9;
  NSUInteger v10;
  NSUInteger v11;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  const char *v18;
  __int128 v19;
  _NSRange result;

  v4 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3010000000;
  v18 = "";
  v19 = xmmword_1ABAA0BD0;
  if (v4)
  {
    -[_MFAtomFieldEditor textStorage](self->_textView, "textStorage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "length");
    v7 = *MEMORY[0x1E0DC10F8];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __45__MFAtomTextView__characterRangeForAtomView___block_invoke;
    v12[3] = &unk_1E5A65768;
    v13 = v4;
    v14 = &v15;
    objc_msgSend(v5, "enumerateAttribute:inRange:options:usingBlock:", v7, 0, v6, 0, v12);

    v8 = v16[4];
    v9 = v16[5];
  }
  else
  {
    v9 = 0;
    v8 = 0x7FFFFFFFFFFFFFFFLL;
  }
  _Block_object_dispose(&v15, 8);

  v10 = v8;
  v11 = v9;
  result.length = v11;
  result.location = v10;
  return result;
}

void __45__MFAtomTextView__characterRangeForAtomView___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;

  v12 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v12, "atomView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(void **)(a1 + 32);

    if (v9 == v10)
    {
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      *(_QWORD *)(v11 + 32) = a3;
      *(_QWORD *)(v11 + 40) = a4;
      *a5 = 1;
    }
  }

}

- (void)_updateAtomMasksInRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v22 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = self->_atomViews;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v12, "bounds", (_QWORD)v17);
        -[MFAtomTextView convertRect:fromView:](self, "convertRect:fromView:", v12);
        v25.origin.x = v13;
        v25.origin.y = v14;
        v25.size.width = v15;
        v25.size.height = v16;
        v23.origin.x = x;
        v23.origin.y = y;
        v23.size.width = width;
        v23.size.height = height;
        v24 = CGRectIntersection(v23, v25);
        -[MFAtomTextView convertRect:toView:](self, "convertRect:toView:", v12, v24.origin.x, v24.origin.y, v24.size.width, v24.size.height);
        objc_msgSend(v12, "setMaskBounds:");
      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v9);
  }

}

- (void)_tapRecognized:(id)a3
{
  id v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;
  CGPoint v23;
  CGRect v24;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "state") == 3)
  {
    objc_msgSend(v4, "locationInView:", self);
    v6 = v5;
    v8 = v7;
    if (!-[MFAtomTextView isFirstResponder](self, "isFirstResponder"))
      -[MFAtomTextView becomeFirstResponder](self, "becomeFirstResponder");
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v9 = self->_atomViews;
    v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v18;
      while (2)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v18 != v11)
            objc_enumerationMutation(v9);
          v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          objc_msgSend(v13, "delegateView", (_QWORD)v17);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "bounds");
          -[MFAtomTextView convertRect:fromView:](self, "convertRect:fromView:", v14);
          v23.x = v6;
          v23.y = v8;
          if (CGRectContainsPoint(v24, v23))
          {
            v16 = -[MFAtomTextView _characterRangeForAtomView:](self, "_characterRangeForAtomView:", v13);
            if (v16 != 0x7FFFFFFFFFFFFFFFLL)
              -[_MFAtomFieldEditor setSelectedRange:](self->_textView, "setSelectedRange:", v16, v15);

            goto LABEL_16;
          }

        }
        v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v10)
          continue;
        break;
      }
    }
LABEL_16:

  }
}

- (void)_clearButtonTapped:(id)a3
{
  -[MFAtomTextView setRepresentedObjects:](self, "setRepresentedObjects:", 0);
  -[MFAtomTextView becomeFirstResponder](self, "becomeFirstResponder");
}

- (void)escKeyPressed:(id)a3
{
  id v4;

  v4 = a3;
  if (-[MFAtomTextView _showsClearButton](self, "_showsClearButton"))
    -[MFAtomTextView _clearButtonTapped:](self, "_clearButtonTapped:", v4);

}

- (CGRect)_usedRectWithLayoutManager:(id)a3 textContainer:(id)a4
{
  id v6;
  id v7;
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
  double v23;
  double v24;
  double v25;
  CGRect result;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "usedRectForTextContainer:", v7);
  v9 = v8;
  v11 = v10;
  -[_MFAtomFieldEditor textContainerInset](self->_textView, "textContainerInset");
  v13 = v12;
  -[_MFAtomFieldEditor textContainerInset](self->_textView, "textContainerInset");
  v15 = v14;
  -[_MFAtomFieldEditor textContainerInset](self->_textView, "textContainerInset");
  v17 = v16;
  -[_MFAtomFieldEditor textContainerInset](self->_textView, "textContainerInset");
  v18 = *MEMORY[0x1E0C9D538];
  v19 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  v21 = v9 - (v17 + v20);

  v22 = v18;
  v23 = v19;
  v24 = v21;
  v25 = v11 - (v13 + v15);
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

- (void)layoutManager:(id)a3 didCompleteLayoutForTextContainer:(id)a4 atEnd:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  NSMutableArray *atomViews;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _QWORD v34[4];
  id v35;
  MFAtomTextView *v36;
  id v37;
  id v38;
  _BYTE v39[128];
  uint64_t v40;

  v5 = a5;
  v40 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (v5 && (*(_BYTE *)&self->_flags & 0x20) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", self->_atomViews);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "textStorage", v10);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v29, "length");
    v12 = *MEMORY[0x1E0DC10F8];
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __72__MFAtomTextView_layoutManager_didCompleteLayoutForTextContainer_atEnd___block_invoke;
    v34[3] = &unk_1E5A65790;
    v13 = v10;
    v35 = v13;
    v36 = self;
    v14 = v8;
    v37 = v14;
    v15 = v9;
    v38 = v15;
    objc_msgSend(v29, "enumerateAttribute:inRange:options:usingBlock:", v12, 0, v11, 0, v34);
    if (objc_msgSend(v13, "count"))
    {
      atomViews = self->_atomViews;
      objc_msgSend(v13, "allObjects");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray removeObjectsInArray:](atomViews, "removeObjectsInArray:", v17);

      v32 = 0u;
      v33 = 0u;
      v30 = 0u;
      v31 = 0u;
      v18 = v13;
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
      if (v19)
      {
        v20 = *(_QWORD *)v31;
        do
        {
          v21 = 0;
          do
          {
            if (*(_QWORD *)v31 != v20)
              objc_enumerationMutation(v18);
            objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * v21++), "removeFromSuperview");
          }
          while (v19 != v21);
          v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
        }
        while (v19);
      }

    }
    -[MFAtomTextView _usedRectWithLayoutManager:textContainer:](self, "_usedRectWithLayoutManager:textContainer:", v14, v15);
    -[UIView mf_currentScreenScale](self, "mf_currentScreenScale");
    UIRectIntegralWithScale();
    v23 = v22;
    v25 = v24;
    -[UIScrollView contentSize](self->_scrollView, "contentSize");
    if (v27 != v23 || v26 != v25)
      -[UIScrollView setContentSize:](self->_scrollView, "setContentSize:", v23, v25);
    -[MFAtomTextView _visibleAtomsRect](self, "_visibleAtomsRect");
    -[MFAtomTextView _updateAtomMasksInRect:](self, "_updateAtomMasksInRect:");

  }
}

void __72__MFAtomTextView_layoutManager_didCompleteLayoutForTextContainer_atEnd___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
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
  void *v21;
  double v22;
  id v23;

  v23 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v23, "atomView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "removeObject:", v7);
    objc_msgSend(v7, "superview");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 496), "addSubview:", v7);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 520), "addObject:", v7);
    }
    v9 = objc_msgSend(*(id *)(a1 + 48), "glyphRangeForCharacterRange:actualCharacterRange:", a3, a4, 0);
    objc_msgSend(*(id *)(a1 + 48), "boundingRectForGlyphRange:inTextContainer:", v9, v10, *(_QWORD *)(a1 + 56));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 496), "convertGlyphRect:");
    objc_msgSend(v7, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
    objc_msgSend(*(id *)(a1 + 40), "mf_currentScreenScale");
    UIRectIntegralWithScale();
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;
    objc_msgSend(v7, "frame");
    if (v16 != v20 || v18 != v19)
    {
      objc_msgSend(v7, "setBounds:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), v16, v18);
      objc_msgSend(v7, "layoutSubviews");
    }
    objc_msgSend(v7, "viewForLastBaselineLayout");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "frame");
    objc_msgSend(v7, "setFrame:", v12, v14 - v22, v16, v18);

  }
}

- (void)scrollViewDidScroll:(id)a3
{
  if (self->_scrollView == a3)
  {
    -[MFAtomTextView _visibleAtomsRect](self, "_visibleAtomsRect");
    -[MFAtomTextView _updateAtomMasksInRect:](self, "_updateAtomMasksInRect:");
  }
}

- (void)_scrollToSelectionIfNeeded
{
  _MFAtomFieldEditor *textView;
  uint64_t v4;
  uint64_t v5;

  if ((*(_BYTE *)&self->_flags & 0x40) != 0)
  {
    textView = self->_textView;
    v4 = -[_MFAtomFieldEditor selectedRange](textView, "selectedRange");
    -[_MFAtomFieldEditor _rectForScrollToVisible:](textView, "_rectForScrollToVisible:", v4, v5);
    -[_MFAtomFieldEditor scrollRectToVisible:animated:](self->_textView, "scrollRectToVisible:animated:", 1);
    *(_BYTE *)&self->_flags &= ~0x40u;
  }
}

- (void)textViewDidBeginEditing:(id)a3
{
  -[MFAtomTextView sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 0x10000);
}

- (void)textViewDidEndEditing:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "textStorage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSelectedRange:", objc_msgSend(v4, "length"), 0);

  -[MFAtomTextView sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 0x40000);
}

- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  id v10;
  void *v11;
  BOOL v12;
  int v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  id WeakRetained;
  void *v20;
  char v21;

  length = a4.length;
  location = a4.location;
  v9 = a3;
  v10 = a5;
  if ((objc_msgSend(v10, "isEqualToString:", CFSTR("\n")) & 1) != 0
    || objc_msgSend(v10, "isEqualToString:", CFSTR("\t")))
  {
    objc_msgSend(v9, "textStorage");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setSelectedRange:", objc_msgSend(v11, "length"), 0);

    -[MFAtomTextView sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 0x80000);
    v12 = 0;
    goto LABEL_4;
  }
  v14 = objc_msgSend(v10, "isEqualToString:", &stru_1E5A6A588);
  if (length == 1)
    v15 = v14;
  else
    v15 = 0;
  if (v15 == 1)
  {
    -[MFAtomTextView _attachmentAtCharacterIndex:](self, "_attachmentAtCharacterIndex:", location);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "atomView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17 && !objc_msgSend(v17, "selectionStyle"))
    {
      objc_msgSend(v9, "setSelectedRange:", location, length);
LABEL_19:
      v12 = 0;
      goto LABEL_20;
    }
    goto LABEL_16;
  }
  v12 = 1;
  if ((*(_BYTE *)&self->_flags & 0x10) != 0 && length == 1)
  {
    -[MFAtomTextView _attachmentAtCharacterIndex:](self, "_attachmentAtCharacterIndex:", location);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "atomView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v18, "selectionStyle"))
    {

      goto LABEL_20;
    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v17, "representedObject");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(WeakRetained, "_atomTextView:shouldReplaceRepresentedObject:replacementText:", self, v20, v10);

    if ((v21 & 1) == 0)
    {
      objc_msgSend(v9, "setSelectedRange:", location + 1, 0);
      objc_msgSend(v9, "insertText:", v10);
      goto LABEL_19;
    }
LABEL_16:
    v12 = 1;
LABEL_20:

  }
LABEL_4:

  return v12;
}

- (void)textViewDidChange:(id)a3
{
  -[MFAtomTextView setNeedsLayout](self, "setNeedsLayout", a3);
  -[MFAtomTextView sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 0x20000);
}

- (void)textViewDidChangeSelection:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  _MFAtomFieldEditor *textView;
  id WeakRetained;
  void *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v4 = a3;
  objc_msgSend(v4, "textStorage");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "selectedRange", v5);
  v8 = v7;
  v9 = objc_msgSend(v5, "glyphRangeForCharacterRange:actualCharacterRange:", 0, objc_msgSend(v18, "length"), 0);
  v11 = v10;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy_;
  v30 = __Block_byref_object_dispose_;
  v31 = 0;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __45__MFAtomTextView_textViewDidChangeSelection___block_invoke;
  v19[3] = &unk_1E5A657E0;
  v12 = v5;
  v20 = v12;
  v13 = v18;
  v21 = v13;
  v24 = v6;
  v25 = v8;
  v14 = v4;
  v22 = v14;
  v23 = &v26;
  objc_msgSend(v12, "enumerateLineFragmentsForGlyphRange:usingBlock:", v9, v11, v19);
  v15 = (void *)v27[5];
  textView = self->_textView;
  if (v15)
  {
    objc_msgSend(v15, "bounds");
    -[_MFAtomFieldEditor convertRect:fromView:](textView, "convertRect:fromView:", v27[5]);
  }
  else
  {
    -[_MFAtomFieldEditor _rectForScrollToVisible:](self->_textView, "_rectForScrollToVisible:", v6, v8);
  }
  -[_MFAtomFieldEditor scrollRectToVisible:animated:](self->_textView, "scrollRectToVisible:animated:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "atomTextViewDidChangeSelection:", self);

  }
  _Block_object_dispose(&v26, 8);

}

void __45__MFAtomTextView_textViewDidChangeSelection___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  __int128 v15;

  v5 = objc_msgSend(*(id *)(a1 + 32), "characterRangeForGlyphRange:actualGlyphRange:", a3, a4, 0);
  v7 = v6;
  v8 = *MEMORY[0x1E0DC10F8];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __45__MFAtomTextView_textViewDidChangeSelection___block_invoke_2;
  v12[3] = &unk_1E5A657B8;
  v15 = *(_OWORD *)(a1 + 64);
  v9 = *(void **)(a1 + 40);
  v10 = *(id *)(a1 + 48);
  v11 = *(_QWORD *)(a1 + 56);
  v13 = v10;
  v14 = v11;
  objc_msgSend(v9, "enumerateAttribute:inRange:options:usingBlock:", v8, v5, v7, 0, v12);

}

void __45__MFAtomTextView_textViewDidChangeSelection___block_invoke_2(_QWORD *a1, void *a2, unint64_t a3, uint64_t a4)
{
  void *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  _BOOL4 v15;
  _BOOL4 v16;
  _BOOL4 v17;
  _BOOL4 v18;
  int v19;
  BOOL v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;

  v24 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v24, "atomView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 0;
    v9 = a1[6];
    if (a3 >= v9)
    {
      v10 = a1[7];
      if (a3 - v9 < v10)
      {
        v11 = (void *)a1[4];
        objc_msgSend(v11, "beginningOfDocument");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "positionFromPosition:offset:", v12, a3);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v11, "baseWritingDirectionForPosition:inDirection:", v13, 0);
        v15 = a3 + a4 == v10 + v9;
        v16 = a3 == v9;

        if (v14 == 1)
          v17 = v15;
        else
          v17 = v16;
        if (v14 == 1)
          v18 = v16;
        else
          v18 = v15;
        v19 = v17 || v18;
        v20 = !v17;
        v21 = 4;
        if (v20)
          v21 = 0;
        v20 = !v18;
        v22 = 8;
        if (v20)
          v22 = 0;
        v23 = v21 | v22;
        if (v19)
          v8 = v23;
        else
          v8 = 1;
        objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), v7);
      }
    }
    objc_msgSend(v7, "setSelectionStyle:animated:", v8, 0);

  }
}

- (void)_textStorageDidProcessEditing:(id)a3
{
  if (-[_MFAtomFieldEditor isSelectable](self->_textView, "isSelectable", a3))
  {
    if (-[MFAtomTextView isFirstResponder](self, "isFirstResponder"))
      *(_BYTE *)&self->_flags |= 0x40u;
  }
}

- (BOOL)keyboardInputChanged:(id)a3
{
  return 1;
}

- (_NSRange)selectionRange
{
  NSUInteger v2;
  NSUInteger v3;
  _NSRange result;

  v2 = -[_MFAtomFieldEditor selectionRange](self->_textView, "selectionRange");
  result.length = v3;
  result.location = v2;
  return result;
}

- (BOOL)hasContent
{
  return -[_MFAtomFieldEditor hasContent](self->_textView, "hasContent");
}

- (void)selectAll
{
  -[_MFAtomFieldEditor selectAll](self->_textView, "selectAll");
}

- (BOOL)hasSelection
{
  return -[_MFAtomFieldEditor hasSelection](self->_textView, "hasSelection");
}

- (id)rangeEnclosingPosition:(id)a3 withGranularity:(int64_t)a4 inDirection:(int64_t)a5
{
  -[_MFAtomFieldEditor rangeEnclosingPosition:withGranularity:inDirection:](self->_textView, "rangeEnclosingPosition:withGranularity:inDirection:", a3, a4, a5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)isPosition:(id)a3 atBoundary:(int64_t)a4 inDirection:(int64_t)a5
{
  return -[_MFAtomFieldEditor isPosition:atBoundary:inDirection:](self->_textView, "isPosition:atBoundary:inDirection:", a3, a4, a5);
}

- (BOOL)isPosition:(id)a3 withinTextUnit:(int64_t)a4 inDirection:(int64_t)a5
{
  return -[_MFAtomFieldEditor isPosition:withinTextUnit:inDirection:](self->_textView, "isPosition:withinTextUnit:inDirection:", a3, a4, a5);
}

- (id)positionFromPosition:(id)a3 toBoundary:(int64_t)a4 inDirection:(int64_t)a5
{
  -[_MFAtomFieldEditor positionFromPosition:toBoundary:inDirection:](self->_textView, "positionFromPosition:toBoundary:inDirection:", a3, a4, a5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)_cursorAccessoriesVisible
{
  return 0;
}

- (id)_cursorAccessories
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (int64_t)baseWritingDirectionForPosition:(id)a3 inDirection:(int64_t)a4
{
  return -[_MFAtomFieldEditor baseWritingDirectionForPosition:inDirection:](self->_textView, "baseWritingDirectionForPosition:inDirection:", a3, a4);
}

- (void)setBaseWritingDirection:(int64_t)a3 forRange:(id)a4
{
  -[_MFAtomFieldEditor setBaseWritingDirection:forRange:](self->_textView, "setBaseWritingDirection:forRange:", a3, a4);
}

- (CGRect)firstRectForRange:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[_MFAtomFieldEditor firstRectForRange:](self->_textView, "firstRectForRange:", a3);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)caretRectForPosition:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[_MFAtomFieldEditor caretRectForPosition:](self->_textView, "caretRectForPosition:", a3);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (id)selectionRectsForRange:(id)a3
{
  -[_MFAtomFieldEditor selectionRectsForRange:](self->_textView, "selectionRectsForRange:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)textInRange:(id)a3
{
  -[_MFAtomFieldEditor textInRange:](self->_textView, "textInRange:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)replaceRange:(id)a3 withText:(id)a4
{
  -[_MFAtomFieldEditor replaceRange:withText:](self->_textView, "replaceRange:withText:", a3, a4);
}

- (BOOL)hasText
{
  return -[_MFAtomFieldEditor hasText](self->_textView, "hasText");
}

- (void)insertText:(id)a3
{
  -[_MFAtomFieldEditor insertText:](self->_textView, "insertText:", a3);
}

- (void)deleteBackward
{
  -[_MFAtomFieldEditor deleteBackward](self->_textView, "deleteBackward");
}

- (void)unmarkText
{
  -[_MFAtomFieldEditor unmarkText](self->_textView, "unmarkText");
}

- (id)characterRangeAtPoint:(CGPoint)a3
{
  return (id)-[_MFAtomFieldEditor characterRangeAtPoint:](self->_textView, "characterRangeAtPoint:", a3.x, a3.y);
}

- (id)characterRangeByExtendingPosition:(id)a3 inDirection:(int64_t)a4
{
  -[_MFAtomFieldEditor characterRangeByExtendingPosition:inDirection:](self->_textView, "characterRangeByExtendingPosition:inDirection:", a3, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)textRangeFromPosition:(id)a3 toPosition:(id)a4
{
  -[_MFAtomFieldEditor textRangeFromPosition:toPosition:](self->_textView, "textRangeFromPosition:toPosition:", a3, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)positionFromPosition:(id)a3 offset:(int64_t)a4
{
  -[_MFAtomFieldEditor positionFromPosition:offset:](self->_textView, "positionFromPosition:offset:", a3, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)positionFromPosition:(id)a3 inDirection:(int64_t)a4 offset:(int64_t)a5
{
  -[_MFAtomFieldEditor positionFromPosition:inDirection:offset:](self->_textView, "positionFromPosition:inDirection:offset:", a3, a4, a5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)positionWithinRange:(id)a3 atCharacterOffset:(int64_t)a4
{
  -[_MFAtomFieldEditor positionWithinRange:atCharacterOffset:](self->_textView, "positionWithinRange:atCharacterOffset:", a3, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)positionWithinRange:(id)a3 farthestInDirection:(int64_t)a4
{
  -[_MFAtomFieldEditor positionWithinRange:farthestInDirection:](self->_textView, "positionWithinRange:farthestInDirection:", a3, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)closestPositionToPoint:(CGPoint)a3
{
  return (id)-[_MFAtomFieldEditor closestPositionToPoint:](self->_textView, "closestPositionToPoint:", a3.x, a3.y);
}

- (id)closestPositionToPoint:(CGPoint)a3 withinRange:(id)a4
{
  -[_MFAtomFieldEditor closestPositionToPoint:withinRange:](self->_textView, "closestPositionToPoint:withinRange:", a4, a3.x, a3.y);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int64_t)comparePosition:(id)a3 toPosition:(id)a4
{
  return -[_MFAtomFieldEditor comparePosition:toPosition:](self->_textView, "comparePosition:toPosition:", a3, a4);
}

- (int64_t)offsetFromPosition:(id)a3 toPosition:(id)a4
{
  return -[_MFAtomFieldEditor offsetFromPosition:toPosition:](self->_textView, "offsetFromPosition:toPosition:", a3, a4);
}

- (void)setMarkedText:(id)a3 selectedRange:(_NSRange)a4
{
  -[_MFAtomFieldEditor setMarkedText:selectedRange:](self->_textView, "setMarkedText:selectedRange:", a3, a4.location, a4.length);
}

- (id)textInputTraits
{
  UITextInputTraits *textInputTraits;
  UITextInputTraits *v4;
  UITextInputTraits *v5;

  textInputTraits = self->_textInputTraits;
  if (!textInputTraits)
  {
    v4 = (UITextInputTraits *)objc_alloc_init(MEMORY[0x1E0DC3E00]);
    v5 = self->_textInputTraits;
    self->_textInputTraits = v4;

    textInputTraits = self->_textInputTraits;
  }
  return textInputTraits;
}

- (void)takeTraitsFrom:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[MFAtomTextView textInputTraits](self, "textInputTraits");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "takeTraitsFrom:", v5);

}

- (id)forwardingTargetForSelector:(SEL)a3
{
  void *v5;
  objc_super v7;

  if (objc_msgSend((id)objc_opt_class(), "instancesRespondToSelector:", a3))
  {
    -[MFAtomTextView textInputTraits](self, "textInputTraits");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (objc_msgSend((id)objc_opt_class(), "instancesRespondToSelector:", a3))
      return self->_textView;
    v7.receiver = self;
    v7.super_class = (Class)MFAtomTextView;
    -[MFAtomTextView forwardingTargetForSelector:](&v7, sel_forwardingTargetForSelector_, a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend((id)objc_opt_class(), "instanceMethodSignatureForSelector:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "instanceMethodSignatureForSelector:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v9 = v7;
    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "instanceMethodSignatureForSelector:", a3);
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    v6 = v9;

  }
  return v6;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  char v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MFAtomTextView;
  if (-[MFAtomTextView respondsToSelector:](&v7, sel_respondsToSelector_))
  {
    v4 = 1;
  }
  else
  {
    -[MFAtomTextView textInputTraits](self, "textInputTraits");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v4 = 1;
    else
      v4 = objc_opt_respondsToSelector();

  }
  return v4 & 1;
}

- (id)keyCommands
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)keyCommands_keyCommands;
  if (!keyCommands_keyCommands)
  {
    objc_msgSend(MEMORY[0x1E0DC3930], "keyCommandWithInput:modifierFlags:action:", *MEMORY[0x1E0DC4DA0], 0, sel_escKeyPressed_);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)keyCommands_keyCommands;
    keyCommands_keyCommands = v4;

    v2 = (void *)keyCommands_keyCommands;
  }
  return v2;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6;
  BOOL v7;

  v6 = a4;
  v7 = sel__clearButtonTapped_ == a3
    || sel_escKeyPressed_ == a3 && -[MFAtomTextView _showsClearButton](self, "_showsClearButton")
    || -[_MFAtomFieldEditor canPerformAction:withSender:](self->_textView, "canPerformAction:withSender:", a3, v6);

  return v7;
}

- (BOOL)canBecomeFirstResponder
{
  return -[_MFAtomFieldEditor canBecomeFirstResponder](self->_textView, "canBecomeFirstResponder");
}

- (BOOL)becomeFirstResponder
{
  return -[_MFAtomFieldEditor becomeFirstResponder](self->_textView, "becomeFirstResponder");
}

- (BOOL)canResignFirstResponder
{
  return -[_MFAtomFieldEditor canResignFirstResponder](self->_textView, "canResignFirstResponder");
}

- (BOOL)resignFirstResponder
{
  return -[_MFAtomFieldEditor resignFirstResponder](self->_textView, "resignFirstResponder");
}

- (BOOL)isFirstResponder
{
  return -[_MFAtomFieldEditor isFirstResponder](self->_textView, "isFirstResponder");
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  MFAtomTextView *v5;
  MFAtomTextView *v6;
  MFAtomTextView *v7;
  MFAtomTextView *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MFAtomTextView;
  -[MFAtomTextView hitTest:withEvent:](&v10, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (MFAtomTextView *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 == self || v5 == (MFAtomTextView *)self->_textView)
  {
    -[UIButton superview](self->_clearButton, "superview");
    v7 = (MFAtomTextView *)objc_claimAutoreleasedReturnValue();
    if (v7 != self)
    {
      -[UIView superview](self->_leadingView, "superview");
      v8 = (MFAtomTextView *)objc_claimAutoreleasedReturnValue();
      if (v8 != self)
      {
        -[UIView superview](self->_trailingView, "superview");

      }
    }

  }
  return v6;
}

- (MFAtomTextViewDelegate)delegate
{
  return (MFAtomTextViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (UIFont)font
{
  return self->_font;
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (NSDirectionalEdgeInsets)textInsets
{
  double top;
  double leading;
  double bottom;
  double trailing;
  NSDirectionalEdgeInsets result;

  top = self->_textInsets.top;
  leading = self->_textInsets.leading;
  bottom = self->_textInsets.bottom;
  trailing = self->_textInsets.trailing;
  result.trailing = trailing;
  result.bottom = bottom;
  result.leading = leading;
  result.top = top;
  return result;
}

- (NSString)placeholder
{
  return self->_placeholder;
}

- (UIColor)placeholderColor
{
  return self->_placeholderColor;
}

- (NSDirectionalEdgeInsets)placeholderInsets
{
  double top;
  double leading;
  double bottom;
  double trailing;
  NSDirectionalEdgeInsets result;

  top = self->_placeholderInsets.top;
  leading = self->_placeholderInsets.leading;
  bottom = self->_placeholderInsets.bottom;
  trailing = self->_placeholderInsets.trailing;
  result.trailing = trailing;
  result.bottom = bottom;
  result.leading = leading;
  result.top = top;
  return result;
}

- (UIView)leadingView
{
  return self->_leadingView;
}

- (void)setLeadingView:(id)a3
{
  objc_storeStrong((id *)&self->_leadingView, a3);
}

- (int64_t)leadingViewMode
{
  return self->_leadingViewMode;
}

- (void)setLeadingViewMode:(int64_t)a3
{
  self->_leadingViewMode = a3;
}

- (NSDirectionalEdgeInsets)leadingViewInsets
{
  double top;
  double leading;
  double bottom;
  double trailing;
  NSDirectionalEdgeInsets result;

  top = self->_leadingViewInsets.top;
  leading = self->_leadingViewInsets.leading;
  bottom = self->_leadingViewInsets.bottom;
  trailing = self->_leadingViewInsets.trailing;
  result.trailing = trailing;
  result.bottom = bottom;
  result.leading = leading;
  result.top = top;
  return result;
}

- (UIView)trailingView
{
  return self->_trailingView;
}

- (void)setTrailingView:(id)a3
{
  objc_storeStrong((id *)&self->_trailingView, a3);
}

- (int64_t)trailingViewMode
{
  return self->_trailingViewMode;
}

- (void)setTrailingViewMode:(int64_t)a3
{
  self->_trailingViewMode = a3;
}

- (NSDirectionalEdgeInsets)trailingViewInsets
{
  double top;
  double leading;
  double bottom;
  double trailing;
  NSDirectionalEdgeInsets result;

  top = self->_trailingViewInsets.top;
  leading = self->_trailingViewInsets.leading;
  bottom = self->_trailingViewInsets.bottom;
  trailing = self->_trailingViewInsets.trailing;
  result.trailing = trailing;
  result.bottom = bottom;
  result.leading = leading;
  result.top = top;
  return result;
}

- (int64_t)clearButtonMode
{
  return self->_clearButtonMode;
}

- (void)setClearButtonMode:(int64_t)a3
{
  self->_clearButtonMode = a3;
}

- (NSDirectionalEdgeInsets)clearButtonInsets
{
  double top;
  double leading;
  double bottom;
  double trailing;
  NSDirectionalEdgeInsets result;

  top = self->_clearButtonInsets.top;
  leading = self->_clearButtonInsets.leading;
  bottom = self->_clearButtonInsets.bottom;
  trailing = self->_clearButtonInsets.trailing;
  result.trailing = trailing;
  result.bottom = bottom;
  result.leading = leading;
  result.top = top;
  return result;
}

- (BOOL)_drawsDebugBaselines
{
  return self->_drawsDebugBaselines;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trailingView, 0);
  objc_storeStrong((id *)&self->_leadingView, 0);
  objc_storeStrong((id *)&self->_placeholderColor, 0);
  objc_storeStrong((id *)&self->_placeholder, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_baselineLayoutConstraint, 0);
  objc_storeStrong((id *)&self->_baselineLayoutLabel, 0);
  objc_storeStrong((id *)&self->_atomViews, 0);
  objc_storeStrong((id *)&self->_clearButton, 0);
  objc_storeStrong((id *)&self->_placeholderLabel, 0);
  objc_storeStrong((id *)&self->_textView, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_background, 0);
  objc_storeStrong((id *)&self->_textInputTraits, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

uint64_t __24___MFAtomTextView_atoms__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

void __60___MFAtomTextView_enumerateAtomsInCharacterRange_withBlock___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(a2, "objectForKey:", *MEMORY[0x1E0DC10F8]);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "atomView");
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      if (v3)
      {
        v4 = *(_QWORD *)(a1 + 32);
        objc_msgSend(v6, "atomView");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);

      }
    }
  }

}

void __44___MFAtomTextView_enumerateAtomAttachments___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "objectForKey:", *MEMORY[0x1E0DC10F8]);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __42___MFAtomTextView_selectionRectsForRange___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  _MFAtomTextSelectionRect *v20;
  _MFAtomTextSelectionRect *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  objc_super v27;

  objc_msgSend(a2, "objectForKey:", *MEMORY[0x1E0DC10F8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v22 = *(void **)(a1 + 32);
    objc_msgSend(v22, "beginningOfDocument");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "positionFromPosition:offset:", v23, a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "positionFromPosition:offset:", v10, a4);
    v21 = (_MFAtomTextSelectionRect *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "textRangeFromPosition:toPosition:", v10, v21);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = *(void **)(a1 + 40);
    v27.receiver = *(id *)(a1 + 32);
    v27.super_class = (Class)_MFAtomTextView;
    objc_msgSendSuper2(&v27, sel_selectionRectsForRange_, v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addObjectsFromArray:", v26);

    goto LABEL_8;
  }
  v8 = *(_QWORD *)(a1 + 48);
  v9 = *(_QWORD *)(a1 + 56);
  objc_msgSend(v7, "atomView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *(void **)(a1 + 32);
  objc_msgSend(v10, "selectionFrame");
  objc_msgSend(v11, "convertRect:fromView:", v10);
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  if (a3 == v8)
  {
    v20 = objc_alloc_init(_MFAtomTextSelectionRect);
    -[_MFAtomTextSelectionRect setRect:](v20, "setRect:", v13, v15, 0.0, v19);
    -[_MFAtomTextSelectionRect setContainsStart:](v20, "setContainsStart:", 1);
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v20);

  }
  if (v9 + v8 == a3 + a4)
  {
    v21 = objc_alloc_init(_MFAtomTextSelectionRect);
    -[_MFAtomTextSelectionRect setRect:](v21, "setRect:", v13 + v17, v15, 0.0, v19);
    -[_MFAtomTextSelectionRect setContainsEnd:](v21, "setContainsEnd:", 1);
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v21);
LABEL_8:

  }
}

@end
