@implementation CNAtomTextView

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
  return (id)objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
}

+ (id)defaultPlaceholderColor
{
  return (id)objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
}

- (CNAtomTextView)initWithFrame:(CGRect)a3
{
  CNAtomTextView *v3;
  CNAtomTextView *v4;
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
  _CNAtomFieldEditor *textView;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  NSMutableArray *v30;
  NSMutableArray *atomViews;
  objc_super v33;

  v33.receiver = self;
  v33.super_class = (Class)CNAtomTextView;
  v3 = -[CNAtomTextView initWithFrame:](&v33, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[CNAtomTextView _setHostsLayoutEngine:](v3, "_setHostsLayoutEngine:", 1);
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
    v18 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA970]), "initWithFrame:", v12, v13, v14, v15);
    scrollView = v4->_scrollView;
    v4->_scrollView = (UIScrollView *)v18;

    -[UIScrollView setDelegate:](v4->_scrollView, "setDelegate:", v4);
    -[UIScrollView setScrollsToTop:](v4->_scrollView, "setScrollsToTop:", 0);
    -[UIScrollView setShowsHorizontalScrollIndicator:](v4->_scrollView, "setShowsHorizontalScrollIndicator:", 0);
    -[UIScrollView setShowsVerticalScrollIndicator:](v4->_scrollView, "setShowsVerticalScrollIndicator:", 0);
    v20 = objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "_fieldEditorClass")), "initWithFrame:textContainer:", 0, v12, v13, v14, v15);
    textView = v4->_textView;
    v4->_textView = (_CNAtomFieldEditor *)v20;

    -[_CNAtomFieldEditor setAutoresizingMask:](v4->_textView, "setAutoresizingMask:", 0);
    -[_CNAtomFieldEditor setBackgroundColor:](v4->_textView, "setBackgroundColor:", 0);
    -[CNAtomTextView font](v4, "font");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CNAtomFieldEditor setFont:](v4->_textView, "setFont:", v22);

    -[_CNAtomFieldEditor setScrollEnabled:](v4->_textView, "setScrollEnabled:", 0);
    -[_CNAtomFieldEditor setScrollsToTop:](v4->_textView, "setScrollsToTop:", 0);
    -[_CNAtomFieldEditor setTextAlignment:](v4->_textView, "setTextAlignment:", 4);
    -[CNAtomTextView baseAttributes](v4, "baseAttributes");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CNAtomFieldEditor setTypingAttributes:](v4->_textView, "setTypingAttributes:", v23);

    -[_CNAtomFieldEditor layoutManager](v4->_textView, "layoutManager");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setAllowsNonContiguousLayout:", 1);

    -[_CNAtomFieldEditor setDelegate:](v4->_textView, "setDelegate:", v4);
    -[_CNAtomFieldEditor layoutManager](v4->_textView, "layoutManager");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setDelegate:", v4);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = *MEMORY[0x1E0DC1230];
    -[_CNAtomFieldEditor textStorage](v4->_textView, "textStorage");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addObserver:selector:name:object:", v4, sel__textStorageDidProcessEditing_, v27, v28);

    if (v4->_background)
      -[CNAtomTextView addSubview:](v4, "addSubview:");
    -[CNAtomTextView addSubview:](v4, "addSubview:", v4->_scrollView);
    -[UIScrollView addSubview:](v4->_scrollView, "addSubview:", v4->_textView);
    v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA88]), "initWithTarget:action:", v4, sel__tapRecognized_);
    objc_msgSend(v29, "setCancelsTouchesInView:", 0);
    -[CNAtomTextView addGestureRecognizer:](v4, "addGestureRecognizer:", v29);
    v30 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    atomViews = v4->_atomViews;
    v4->_atomViews = v30;

  }
  return v4;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_storeWeak((id *)&self->_delegate, 0);
  -[UIScrollView setDelegate:](self->_scrollView, "setDelegate:", 0);
  -[_CNAtomFieldEditor setDelegate:](self->_textView, "setDelegate:", 0);
  -[_CNAtomFieldEditor layoutManager](self->_textView, "layoutManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDelegate:", 0);

  v4.receiver = self;
  v4.super_class = (Class)CNAtomTextView;
  -[CNAtomTextView dealloc](&v4, sel_dealloc);
}

- (_CNAtomFieldEditor)_fieldEditor
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
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (self->_drawsDebugBaselines != a3)
  {
    v3 = a3;
    self->_drawsDebugBaselines = a3;
    -[_CNAtomFieldEditor _setDrawsDebugBaselines:](self->_textView, "_setDrawsDebugBaselines:");
    -[UILabel _setDrawsDebugBaselines:](self->_placeholderLabel, "_setDrawsDebugBaselines:", v3);
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v5 = self->_atomViews;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v12;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v9), "viewForLastBaselineLayout", (_QWORD)v11);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(v10, "_setDrawsDebugBaselines:", v3);

          ++v9;
        }
        while (v7 != v9);
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v7);
    }

    -[CNAtomTextView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  char v5;
  char v6;
  char v7;
  char v8;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | objc_opt_respondsToSelector() & 1;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = 2;
    else
      v5 = 0;
    *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v5;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v6 = 4;
    else
      v6 = 0;
    *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFB | v6;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v7 = 8;
    else
      v7 = 0;
    *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xF7 | v7;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v8 = 16;
    else
      v8 = 0;
    *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xEF | v8;
  }

}

- (void)setFont:(id)a3
{
  UIFont *v4;
  UIFont *v5;

  v4 = (UIFont *)a3;
  if (!v4)
  {
    objc_msgSend((id)objc_opt_class(), "defaultFont");
    v4 = (UIFont *)objc_claimAutoreleasedReturnValue();
  }
  if (self->_font != v4)
  {
    v5 = v4;
    objc_storeStrong((id *)&self->_font, v4);
    -[_CNAtomFieldEditor setFont:](self->_textView, "setFont:", v5);
    -[UILabel setFont:](self->_placeholderLabel, "setFont:", v5);
    -[_CNAtomTextViewBaselineLayoutStrut setFont:](self->_baselineLayoutLabel, "setFont:", v5);
    -[CNAtomTextView setNeedsLayout](self, "setNeedsLayout");
    v4 = v5;
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
  CNAtomTextView *v10;
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
    v8 = __31__CNAtomTextView_setTextColor___block_invoke;
    v9 = &unk_1E62BF0D0;
    v10 = self;
    v11 = v4;
    v5 = (void (**)(_QWORD))MEMORY[0x1B5E16810](&v6);
    if (objc_msgSend(MEMORY[0x1E0CEABB0], "areAnimationsEnabled", v6, v7, v8, v9, v10))
      objc_msgSend(MEMORY[0x1E0CEABB0], "transitionWithView:duration:options:animations:completion:", self->_textView, 5242880, v5, 0, 0.35);
    else
      v5[2](v5);

  }
}

void __31__CNAtomTextView_setTextColor___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 496), "setTextColor:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "baseAttributes");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 496), "setTypingAttributes:", v2);

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
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  objc_super v17;
  _BYTE v18[128];
  uint64_t v19;

  v4 = a4;
  v5 = a3;
  v19 = *MEMORY[0x1E0C80C00];
  v17.receiver = self;
  v17.super_class = (Class)CNAtomTextView;
  -[CNAtomTextView setEnabled:](&v17, sel_setEnabled_);
  -[_UITextFieldRoundedRectBackgroundViewNeue setEnabled:animated:](self->_background, "setEnabled:animated:", v5, v4);
  -[CNAtomTextView clearButton](self, "clearButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setEnabled:", v5);

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v8 = self->_atomViews;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v12++), "setEnabled:animated:", v5, v4, (_QWORD)v13);
      }
      while (v10 != v12);
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    }
    while (v10);
  }

}

- (void)setEnabled:(BOOL)a3
{
  -[CNAtomTextView _setEnabled:animated:](self, "_setEnabled:animated:", a3, 0);
}

- (id)paragraphStyle
{
  if (paragraphStyle_onceToken != -1)
    dispatch_once(&paragraphStyle_onceToken, &__block_literal_global_3);
  return (id)paragraphStyle_sParagraphStyle;
}

void __32__CNAtomTextView_paragraphStyle__block_invoke()
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
  -[CNAtomTextView font](self, "font");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v5;
  v16[1] = *MEMORY[0x1E0DC1140];
  -[CNAtomTextView textColor](self, "textColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v6;
  v7 = *MEMORY[0x1E0DC1178];
  v16[2] = *MEMORY[0x1E0DC1178];
  -[CNAtomTextView paragraphStyle](self, "paragraphStyle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    -[CNAtomTextView _atomLayoutViewForRepresentedObject:](self, "_atomLayoutViewForRepresentedObject:", v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[_CNAtomAttachment attachmentWithAtomLayoutView:representedObject:](_CNAtomAttachment, "attachmentWithAtomLayoutView:representedObject:", v11, v4);
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
  return -[CNAtomTextView baseAttributesWithRepresentedObject:](self, "baseAttributesWithRepresentedObject:", 0);
}

- (id)_baseAttributedStringWithRepresentedObject:(id)a3
{
  id v4;
  void *v5;
  char isKindOfClass;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  __int16 v12;

  v4 = a3;
  -[CNAtomTextView baseAttributesWithRepresentedObject:](self, "baseAttributesWithRepresentedObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v7 = objc_alloc(MEMORY[0x1E0CB3498]);
  v8 = v7;
  if ((isKindOfClass & 1) != 0)
  {
    v9 = (void *)objc_msgSend(v7, "initWithString:attributes:", v4, v5);
  }
  else
  {
    v12 = -4;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCharacters:length:", &v12, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "initWithString:attributes:", v10, v5);

  }
  return v9;
}

- (BOOL)_hasContent
{
  void *v2;
  BOOL v3;

  -[_CNAtomFieldEditor textStorage](self->_textView, "textStorage");
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
  _QWORD v26[4];
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
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CNAtomFieldEditor textStorage](self->_textView, "textStorage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x3010000000;
  v31[3] = &unk_1B1148B9B;
  v11 = MEMORY[0x1E0C809B0];
  v32 = xmmword_1B1144CB0;
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __52__CNAtomTextView__representedObjectsInRange_ranges___block_invoke;
  v26[3] = &unk_1E62BF398;
  v30 = v31;
  v12 = v8;
  v27 = v12;
  v13 = v10;
  v28 = v13;
  v14 = v9;
  v29 = v14;
  v21[0] = v11;
  v21[1] = 3221225472;
  v21[2] = __52__CNAtomTextView__representedObjectsInRange_ranges___block_invoke_2;
  v21[3] = &unk_1E62BF3C0;
  v15 = (void (**)(_QWORD))(id)MEMORY[0x1B5E16810](v26);
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

double __52__CNAtomTextView__representedObjectsInRange_ranges___block_invoke(uint64_t a1)
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
    *(_OWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 32) = xmmword_1B1144CB0;
  }
  return result;
}

void __52__CNAtomTextView__representedObjectsInRange_ranges___block_invoke_2(_QWORD *a1, void *a2, NSUInteger location, NSUInteger length)
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSRange v13;
  NSRange v14;
  uint64_t v15;
  id v16;
  NSRange v17;

  objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0DC10F8]);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    (*(void (**)(void))(a1[6] + 16))();
    v7 = (void *)a1[4];
    objc_msgSend(v16, "representedObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v8);

    v9 = (void *)a1[5];
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", location, length);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v10);

LABEL_9:
    v11 = v16;
    goto LABEL_10;
  }
  v11 = v16;
  if (!v16)
  {
    v12 = *(_QWORD *)(a1[7] + 8);
    v13.location = *(_QWORD *)(v12 + 32);
    if (v13.location == 0x7FFFFFFFFFFFFFFFLL
      || (v13.length = *(_QWORD *)(v12 + 40), v13.length + v13.location != location))
    {
      (*(void (**)(void))(a1[6] + 16))();
    }
    else
    {
      v17.location = location;
      v17.length = length;
      v14 = NSUnionRange(v13, v17);
      location = v14.location;
      length = v14.length;
    }
    v15 = *(_QWORD *)(a1[7] + 8);
    *(_QWORD *)(v15 + 32) = location;
    *(_QWORD *)(v15 + 40) = length;
    goto LABEL_9;
  }
LABEL_10:

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
  NSUInteger v21;
  NSUInteger v22;
  void *v23;
  char isKindOfClass;
  void *v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  id v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  if (a3)
    *a3 = (_NSRange)xmmword_1B1144CB0;
  -[_CNAtomFieldEditor textStorage](self->_textView, "textStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[_CNAtomFieldEditor selectedRange](self->_textView, "selectedRange");
  v8 = v7;
  v32 = 0;
  -[CNAtomTextView _representedObjectsInRange:ranges:](self, "_representedObjectsInRange:ranges:", 0, objc_msgSend(v5, "length"), &v32);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v10 = v32;
  v11 = (char *)objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v11)
  {
    v26 = v5;
    v27 = v9;
    v12 = 0;
    v13 = v6 + v8;
    v14 = *(_QWORD *)v29;
    while (2)
    {
      v15 = 0;
      v16 = &v11[(_QWORD)v12];
      do
      {
        if (*(_QWORD *)v29 != v14)
          objc_enumerationMutation(v10);
        v17 = objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)v15), "rangeValue", v26);
        if (v13 - v17 < v18 && v13 >= v17 || v13 == v17 + v18)
        {
          v21 = v17;
          v22 = v18;
          v9 = v27;
          objc_msgSend(v27, "objectAtIndexedSubscript:", &v15[(_QWORD)v12]);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();

          if ((isKindOfClass & 1) != 0)
          {
            objc_msgSend(v27, "objectAtIndexedSubscript:", &v15[(_QWORD)v12]);
            v11 = (char *)objc_claimAutoreleasedReturnValue();
            v5 = v26;
            if (a3)
            {
              a3->location = v21;
              a3->length = v22;
            }
          }
          else
          {
            v11 = 0;
            v5 = v26;
          }
          goto LABEL_22;
        }
        ++v15;
      }
      while (v11 != v15);
      v11 = (char *)objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      v12 = v16;
      if (v11)
        continue;
      break;
    }
    v5 = v26;
    v9 = v27;
  }
LABEL_22:

  return v11;
}

- (NSString)currentEditingString
{
  return (NSString *)-[CNAtomTextView currentEditingString:](self, "currentEditingString:", 0);
}

- (NSArray)representedObjects
{
  void *v3;
  void *v4;

  -[_CNAtomFieldEditor textStorage](self->_textView, "textStorage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAtomTextView _representedObjectsInRange:ranges:](self, "_representedObjectsInRange:ranges:", 0, objc_msgSend(v3, "length"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (NSArray)selectedRepresentedObjects
{
  uint64_t v3;
  uint64_t v4;

  v3 = -[_CNAtomFieldEditor selectedRange](self->_textView, "selectedRange");
  return (NSArray *)-[CNAtomTextView _representedObjectsInRange:ranges:](self, "_representedObjectsInRange:ranges:", v3, v4, 0);
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
  -[_CNAtomFieldEditor textStorage](self->_textView, "textStorage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "beginEditing");
  v14 = 0;
  -[CNAtomTextView _representedObjectsInRange:ranges:](self, "_representedObjectsInRange:ranges:", 0, objc_msgSend(v7, "length"), &v14);
  v8 = (char *)objc_claimAutoreleasedReturnValue();
  v9 = v14;

  if (v8)
  {
    objc_msgSend(v9, "objectAtIndexedSubscript:", a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "rangeValue");

    -[CNAtomTextView _baseAttributedStringWithRepresentedObject:](self, "_baseAttributedStringWithRepresentedObject:", v6);
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
    -[_CNAtomFieldEditor layoutManager](self->_textView, "layoutManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "invalidateLayoutForCharacterRange:actualCharacterRange:", v11, v8, 0);

  }
  -[CNAtomTextView setNeedsLayout](self, "setNeedsLayout");
  -[CNAtomTextView sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 0x20000);
  -[_CNAtomFieldEditor setSelectedRange:](self->_textView, "setSelectedRange:", &v8[v11], 0);

}

- (void)_deleteCharactersInStorage:(id)a3 ranges:(id)a4 rangeToAdjust:(_NSRange *)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSUInteger v13;
  uint64_t v14;
  unint64_t v15;
  NSUInteger length;
  NSUInteger location;
  BOOL v18;
  NSUInteger v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  objc_msgSend(a4, "reverseObjectEnumerator", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
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
        v13 = objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v12), "rangeValue");
        v15 = v14;
        objc_msgSend(v7, "deleteCharactersInRange:", v13, v14);
        location = a5->location;
        length = a5->length;
        if (v13 < length + a5->location)
        {
          if (location >= v13 + v15)
          {
            a5->location = location - v15;
          }
          else
          {
            if (v13 <= location)
            {
              v19 = location - (v13 + v15) + length;
              a5->location = v13;
            }
            else
            {
              v18 = length >= v15;
              v19 = length - v15;
              if (!v18)
                v19 = 0;
            }
            a5->length = v19;
          }
        }
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v10);
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
  -[_CNAtomFieldEditor textStorage](self->_textView, "textStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "beginEditing");
  v11 = -[_CNAtomFieldEditor selectedRange](self->_textView, "selectedRange");
  v12 = v6;
  v10 = 0;
  -[CNAtomTextView _representedObjectsInRange:ranges:](self, "_representedObjectsInRange:ranges:", 0, objc_msgSend(v5, "length"), &v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v10;

  if (v7)
  {
    objc_msgSend(v8, "objectsAtIndexes:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNAtomTextView _deleteCharactersInStorage:ranges:rangeToAdjust:](self, "_deleteCharactersInStorage:ranges:rangeToAdjust:", v5, v9, &v11);

  }
  objc_msgSend(v5, "endEditing");
  -[CNAtomTextView setNeedsLayout](self, "setNeedsLayout");
  -[CNAtomTextView sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 0x20000);
  -[_CNAtomFieldEditor setSelectedRange:](self->_textView, "setSelectedRange:", v11, v12);

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
  -[_CNAtomFieldEditor textStorage](self->_textView, "textStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "beginEditing");
  v18 = -[_CNAtomFieldEditor selectedRange](self->_textView, "selectedRange");
  v19 = v6;
  v17 = 0;
  -[CNAtomTextView _representedObjectsInRange:ranges:](self, "_representedObjectsInRange:ranges:", 0, objc_msgSend(v5, "length"), &v17);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v17;
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __43__CNAtomTextView_removeRepresentedObjects___block_invoke;
  v15 = &unk_1E62BF3E8;
  v16 = v4;
  v9 = v4;
  objc_msgSend(v7, "indexesOfObjectsPassingTest:", &v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectsAtIndexes:", v10, v12, v13, v14, v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAtomTextView _deleteCharactersInStorage:ranges:rangeToAdjust:](self, "_deleteCharactersInStorage:ranges:rangeToAdjust:", v5, v11, &v18);

  objc_msgSend(v5, "endEditing");
  -[CNAtomTextView setNeedsLayout](self, "setNeedsLayout");
  -[CNAtomTextView sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 0x20000);
  -[_CNAtomFieldEditor setSelectedRange:](self->_textView, "setSelectedRange:", v18, v19);

}

uint64_t __43__CNAtomTextView_removeRepresentedObjects___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2);
}

- (void)removeRepresentedObjectAtIndex:(unint64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CNAtomTextView removeRepresentedObjectsAtIndexes:](self, "removeRepresentedObjectsAtIndexes:", v4);

}

- (void)removeRepresentedObject:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v7 = a3;
    v4 = (void *)MEMORY[0x1E0C99D20];
    v5 = a3;
    objc_msgSend(v4, "arrayWithObjects:count:", &v7, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[CNAtomTextView removeRepresentedObjects:](self, "removeRepresentedObjects:", v6, v7, v8);
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
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_CNAtomFieldEditor textStorage](self->_textView, "textStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "beginEditing");
  objc_msgSend(v5, "deleteCharactersInRange:", 0, objc_msgSend(v5, "length"));
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        -[CNAtomTextView _baseAttributedStringWithRepresentedObject:](self, "_baseAttributedStringWithRepresentedObject:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10), (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "appendAttributedString:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  objc_msgSend(v5, "endEditing");
  -[_CNAtomFieldEditor layoutManager](self->_textView, "layoutManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "invalidateLayoutForCharacterRange:actualCharacterRange:", 0, objc_msgSend(v5, "length"), 0);

  -[CNAtomTextView setNeedsLayout](self, "setNeedsLayout");
  -[CNAtomTextView sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 0x20000);
  -[_CNAtomFieldEditor setSelectedRange:](self->_textView, "setSelectedRange:", objc_msgSend(v5, "length"), 0);

}

- (void)addRepresentedObject:(id)a3
{
  _CNAtomFieldEditor *textView;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  textView = self->_textView;
  v5 = a3;
  -[_CNAtomFieldEditor textStorage](textView, "textStorage");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "beginEditing");
  -[CNAtomTextView _baseAttributedStringWithRepresentedObject:](self, "_baseAttributedStringWithRepresentedObject:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v10, "length");
  v8 = objc_msgSend(v6, "length");
  objc_msgSend(v10, "appendAttributedString:", v6);
  objc_msgSend(v10, "endEditing");
  if (v8)
  {
    -[_CNAtomFieldEditor layoutManager](self->_textView, "layoutManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "invalidateLayoutForCharacterRange:actualCharacterRange:", v7, v8, 0);

  }
  -[CNAtomTextView setNeedsLayout](self, "setNeedsLayout");
  -[CNAtomTextView sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 0x20000);
  -[_CNAtomFieldEditor setSelectedRange:](self->_textView, "setSelectedRange:", objc_msgSend(v10, "length"), 0);

}

- (void)replaceCurrentEditingStringWithRepresentedObject:(id)a3
{
  -[CNAtomTextView replaceCurrentEditingStringWithRepresentedObject:autoSelect:](self, "replaceCurrentEditingStringWithRepresentedObject:autoSelect:", a3, 0);
}

- (void)replaceCurrentEditingStringWithRepresentedObject:(id)a3 autoSelect:(BOOL)a4
{
  _BOOL4 v4;
  _CNAtomFieldEditor *textView;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v4 = a4;
  textView = self->_textView;
  v7 = a3;
  -[_CNAtomFieldEditor textStorage](textView, "textStorage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "beginEditing");
  v16 = 0;
  v17 = 0;
  -[CNAtomTextView currentEditingString:](self, "currentEditingString:", &v16);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAtomTextView _baseAttributedStringWithRepresentedObject:](self, "_baseAttributedStringWithRepresentedObject:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9 || v16 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v16 = objc_msgSend(v8, "length");
    v17 = 0;
    objc_msgSend(v8, "appendAttributedString:", v10);
  }
  else
  {
    objc_msgSend(v8, "replaceCharactersInRange:withAttributedString:", v16, v17, v10);
  }
  objc_msgSend(v8, "endEditing");
  v11 = v16;
  v12 = objc_msgSend(v10, "length");
  if (v12)
  {
    -[_CNAtomFieldEditor layoutManager](self->_textView, "layoutManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "invalidateLayoutForCharacterRange:actualCharacterRange:", v11, v12, 0);

  }
  -[CNAtomTextView setNeedsLayout](self, "setNeedsLayout");
  -[CNAtomTextView sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 0x20000);
  v14 = v12 + v11;
  if (v4)
  {
    -[CNAtomTextView becomeFirstResponder](self, "becomeFirstResponder");
    --v14;
    v15 = 1;
  }
  else
  {
    v15 = 0;
  }
  -[_CNAtomFieldEditor setSelectedRange:](self->_textView, "setSelectedRange:", v14, v15);

}

- (id)_atomLayoutViewForRepresentedObject:(id)a3
{
  CNAtomTextViewDelegateInternal **p_delegate;
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;

  p_delegate = &self->_delegate;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "atomTextView:atomViewForRepresentedObject:", self, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setEnabled:", -[CNAtomTextView isEnabled](self, "isEnabled"));
  objc_msgSend(v7, "viewForLastBaselineLayout");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v8, "_setDrawsDebugBaselines:", -[CNAtomTextView _drawsDebugBaselines](self, "_drawsDebugBaselines"));
  +[_CNAtomLayoutView layoutViewWithDelegateView:](_CNAtomLayoutView, "layoutViewWithDelegateView:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_supportedPasteboardTypes
{
  void *v2;
  id WeakRetained;
  void *v5;
  id v6;

  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "supportedPasteboardTypesForAtomTextView:", self);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v2 = 0;
  }
  if (objc_msgSend(v2, "count"))
    v5 = v2;
  else
    v5 = (void *)*MEMORY[0x1E0CEBA08];
  v6 = v5;

  return v6;
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
  id v6;
  id v7;
  id WeakRetained;
  char v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  const __CFString *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if ((*(_BYTE *)&self->_flags & 8) == 0
    || (WeakRetained = objc_loadWeakRetained((id *)&self->_delegate),
        v9 = objc_msgSend(WeakRetained, "atomTextView:storeRepresentedObjects:onPasteboard:", self, v6, v7),
        WeakRetained,
        (v9 & 1) == 0))
  {
    v18 = v7;
    objc_msgSend(MEMORY[0x1E0CB37A0], "string");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v11 = v6;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v20 != v14)
            objc_enumerationMutation(v11);
          v16 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            if (objc_msgSend(v10, "length"))
              v17 = CFSTR(" ");
            else
              v17 = &stru_1E62C0368;
            objc_msgSend(v10, "appendFormat:", CFSTR("%@%@"), v17, v16);
          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v13);
    }

    v7 = v18;
    objc_msgSend(v18, "setString:", v10);

  }
}

- (void)_insertRepresentedObjects:(id)a3 atCharacterRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char isKindOfClass;
  void *v14;
  id v15;
  char *v16;
  char *v17;
  uint64_t v18;
  char *v19;
  char *v20;
  NSUInteger v21;
  NSUInteger v22;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  NSUInteger v32;
  uint64_t v33;
  NSUInteger v34;
  uint64_t i;
  void *v36;
  void *v37;
  NSUInteger v38;
  uint64_t v39;
  NSUInteger v40;
  NSRange v41;
  void *v42;
  void *v43;
  uint64_t v44;
  CNAtomTextView *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  id v54;
  _NSRange v55;
  _BYTE v56[128];
  _BYTE v57[128];
  _QWORD v58[3];
  NSRange v59;
  NSRange v60;

  length = a4.length;
  location = a4.location;
  v58[1] = *MEMORY[0x1E0C80C00];
  v55 = a4;
  v7 = a3;
  v8 = 496;
  -[_CNAtomFieldEditor textStorage](self->_textView, "textStorage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "beginEditing");
  if (length)
  {
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", location, length);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v58[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v58, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNAtomTextView _deleteCharactersInStorage:ranges:rangeToAdjust:](self, "_deleteCharactersInStorage:ranges:rangeToAdjust:", v9, v11, &v55);

  }
  objc_msgSend(v7, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  v45 = self;
  if ((isKindOfClass & 1) == 0)
  {
    v54 = 0;
    -[CNAtomTextView _representedObjectsInRange:ranges:](self, "_representedObjectsInRange:ranges:", 0, objc_msgSend(v9, "length"), &v54);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v15 = v54;
    v16 = (char *)objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v50, v57, 16);
    if (v16)
    {
      v43 = v9;
      v17 = 0;
      v18 = *(_QWORD *)v51;
      do
      {
        v19 = 0;
        v20 = &v16[(_QWORD)v17];
        do
        {
          if (*(_QWORD *)v51 != v18)
            objc_enumerationMutation(v15);
          v21 = objc_msgSend(*(id *)(*((_QWORD *)&v50 + 1) + 8 * (_QWORD)v19), "rangeValue", v43);
          if (v55.location >= v21 && v55.location - v21 < v22)
          {
            v20 = &v19[(_QWORD)v17];
            objc_msgSend(v14, "objectAtIndexedSubscript:", &v19[(_QWORD)v17]);
            v16 = (char *)objc_claimAutoreleasedReturnValue();
            goto LABEL_16;
          }
          ++v19;
        }
        while (v16 != v19);
        v16 = (char *)objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v50, v57, 16);
        v17 = v20;
      }
      while (v16);
LABEL_16:
      v9 = v43;
    }
    else
    {
      v20 = 0;
    }

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v15, "objectAtIndexedSubscript:", v20);
      v24 = v9;
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "rangeValue");
      v28 = v27;

      v9 = v24;
      if (v55.location != v26)
      {
        v55.location = v26 + v28;
        v55.length = 0;
      }
    }

    self = v45;
  }
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v29 = v7;
  v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v46, v56, 16);
  if (v30)
  {
    v31 = v30;
    v44 = 496;
    v32 = 0;
    v33 = *(_QWORD *)v47;
    v34 = 0x7FFFFFFFFFFFFFFFLL;
    do
    {
      for (i = 0; i != v31; ++i)
      {
        if (*(_QWORD *)v47 != v33)
          objc_enumerationMutation(v29);
        -[CNAtomTextView _baseAttributedStringWithRepresentedObject:](self, "_baseAttributedStringWithRepresentedObject:", *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * i), v44);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = v9;
        objc_msgSend(v9, "insertAttributedString:atIndex:", v36, v55.location);
        v38 = v55.location;
        v39 = objc_msgSend(v36, "length");
        v40 = v39;
        if (v34 == 0x7FFFFFFFFFFFFFFFLL)
        {
          v34 = v38;
          v32 = v39;
        }
        else
        {
          v59.location = v38;
          v59.length = v40;
          v60.location = v34;
          v60.length = v32;
          v41 = NSUnionRange(v59, v60);
          v34 = v41.location;
          v32 = v41.length;
        }
        v55.location = v40 + v38;
        v55.length = 0;

        self = v45;
        v9 = v37;
      }
      v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v46, v56, 16);
    }
    while (v31);

    objc_msgSend(v37, "endEditing");
    v8 = v44;
    if (v32)
    {
      objc_msgSend(*(id *)((char *)&v45->super.super.super.super.isa + v44), "layoutManager");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "invalidateLayoutForCharacterRange:actualCharacterRange:", v34, v32, 0);

    }
  }
  else
  {

    objc_msgSend(v9, "endEditing");
  }
  -[CNAtomTextView setNeedsLayout](self, "setNeedsLayout");
  -[CNAtomTextView sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 0x20000);
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + v8), "setSelectedRange:", v55.location, v55.length);

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
  -[_CNAtomFieldEditor textStorage](self->_textView, "textStorage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "beginEditing");
  v10 = -[_CNAtomFieldEditor selectedRange](self->_textView, "selectedRange");
  v11 = v7;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", location, length);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAtomTextView _deleteCharactersInStorage:ranges:rangeToAdjust:](self, "_deleteCharactersInStorage:ranges:rangeToAdjust:", v6, v9, &v10);

  objc_msgSend(v6, "endEditing");
  -[CNAtomTextView setNeedsLayout](self, "setNeedsLayout");
  -[CNAtomTextView sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 0x20000);
  -[_CNAtomFieldEditor setSelectedRange:](self->_textView, "setSelectedRange:", v10, v11);

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
  v7 = -[CNAtomTextView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
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
  -[CNAtomTextView convertRect:fromView:](self, "convertRect:fromView:", self->_scrollView, v4 + v14, v6 + v11, v8 - (v14 + v12), v10 - (v11 + v13));
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
  double v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  objc_msgSend(MEMORY[0x1E0CEA638], "kitImageNamed:", CFSTR("UITextFieldClearButton"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAtomTextView tintColor](self, "tintColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7
    || (objc_msgSend(MEMORY[0x1E0CEA478], "systemBlueColor"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        (objc_msgSend(v7, "isEqual:", v3) & 1) != 0))
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.047, 0.455, 0.867, 1.0);
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
    v10 = v8;
  }
  else
  {
    if (a3 == 2)
      v9 = 0.1;
    else
      v9 = 0.275;
    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 0.0, v9);
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;
  v12 = (void *)MEMORY[0x1E0CEA638];
  objc_msgSend(v6, "size");
  objc_msgSend(v12, "_tintedImageForSize:withTint:effectsImage:maskImage:style:", v11, 0, v6, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
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
    v4 = objc_alloc(MEMORY[0x1E0CEA3A0]);
    v5 = (UIButton *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v6 = self->_clearButton;
    self->_clearButton = v5;

    -[UIButton addTarget:action:forControlEvents:](self->_clearButton, "addTarget:action:forControlEvents:", self, sel__clearButtonTapped_, 64);
    v7 = self->_clearButton;
    -[CNAtomTextView _clearButtonImageForState:](self, "_clearButtonImageForState:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setImage:forState:](v7, "setImage:forState:", v8, 0);

    v9 = self->_clearButton;
    -[CNAtomTextView _clearButtonImageForState:](self, "_clearButtonImageForState:", 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setImage:forState:](v9, "setImage:forState:", v10, 1);

    v11 = self->_clearButton;
    -[CNAtomTextView _clearButtonImageForState:](self, "_clearButtonImageForState:", 2);
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
  -[CNAtomTextView _clearButtonSize](self, "_clearButtonSize");
  v10 = v9;
  v12 = v11;
  -[UIView cnaui_currentScreenScale](self, "cnaui_currentScreenScale");
  if (-[CNAtomTextView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))
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
  -[CNAtomTextView clearButtonInsets](self, "clearButtonInsets");
  -[CNAtomTextView _edgeInsetsForDirectionalInsets:](self, "_edgeInsetsForDirectionalInsets:");
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
  v8 = -[CNAtomTextView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection") ^ 1;
  -[CNAtomTextView leadingView](self, "leadingView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAtomTextView _rectForBounds:sizingView:isLeft:](self, "_rectForBounds:sizingView:isLeft:", v9, v8, x, y, width, height);
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;

  -[CNAtomTextView leadingViewInsets](self, "leadingViewInsets");
  -[CNAtomTextView _edgeInsetsForDirectionalInsets:](self, "_edgeInsetsForDirectionalInsets:");
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
  -[CNAtomTextView trailingView](self, "trailingView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAtomTextView _rectForBounds:sizingView:isLeft:](self, "_rectForBounds:sizingView:isLeft:", v8, -[CNAtomTextView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"), x, y, width, height);
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  -[CNAtomTextView trailingViewInsets](self, "trailingViewInsets");
  -[CNAtomTextView _edgeInsetsForDirectionalInsets:](self, "_edgeInsetsForDirectionalInsets:");
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

  v7 = -[CNAtomTextView isFirstResponder](self, "isFirstResponder");
  v8 = v7 & -[CNAtomTextView _hasContent](self, "_hasContent");
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
  return -[CNAtomTextView _showViewWithMode:alwaysDefinition:](self, "_showViewWithMode:alwaysDefinition:", -[CNAtomTextView clearButtonMode](self, "clearButtonMode"), -[CNAtomTextView _hasContent](self, "_hasContent"));
}

- (BOOL)_showsLeadingView
{
  void *v3;
  BOOL v4;

  -[CNAtomTextView leadingView](self, "leadingView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = -[CNAtomTextView _showViewWithMode:alwaysDefinition:](self, "_showViewWithMode:alwaysDefinition:", -[CNAtomTextView leadingViewMode](self, "leadingViewMode"), 1);
  else
    v4 = 0;

  return v4;
}

- (BOOL)_showsTrailingView
{
  void *v3;
  BOOL v4;

  -[CNAtomTextView trailingView](self, "trailingView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3
    && !-[CNAtomTextView _showsClearButton](self, "_showsClearButton")
    && -[CNAtomTextView _showViewWithMode:alwaysDefinition:](self, "_showViewWithMode:alwaysDefinition:", -[CNAtomTextView trailingViewMode](self, "trailingViewMode"), 1);

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
  void *v11;
  UIButton *clearButton;
  void *v13;
  UIView *leadingView;
  UIView *trailingView;
  id v16;

  -[CNAtomTextView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  if (-[CNAtomTextView _showsClearButton](self, "_showsClearButton"))
  {
    -[CNAtomTextView clearButton](self, "clearButton");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNAtomTextView clearButtonFrameForBounds:](self, "clearButtonFrameForBounds:", v4, v6, v8, v10);
    objc_msgSend(v11, "setFrame:");
    -[CNAtomTextView addSubview:](self, "addSubview:", v11);

  }
  else
  {
    clearButton = self->_clearButton;
    if (clearButton)
      -[UIButton removeFromSuperview](clearButton, "removeFromSuperview");
  }
  if (-[CNAtomTextView _showsLeadingView](self, "_showsLeadingView"))
  {
    -[CNAtomTextView leadingView](self, "leadingView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNAtomTextView leadingViewFrameForBounds:](self, "leadingViewFrameForBounds:", v4, v6, v8, v10);
    objc_msgSend(v13, "setFrame:");
    -[CNAtomTextView addSubview:](self, "addSubview:", v13);

  }
  else
  {
    leadingView = self->_leadingView;
    if (leadingView)
      -[UIView removeFromSuperview](leadingView, "removeFromSuperview");
  }
  if (-[CNAtomTextView _showsTrailingView](self, "_showsTrailingView"))
  {
    -[CNAtomTextView trailingView](self, "trailingView");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    -[CNAtomTextView trailingViewFrameForBounds:](self, "trailingViewFrameForBounds:", v4, v6, v8, v10);
    objc_msgSend(v16, "setFrame:");
    -[CNAtomTextView addSubview:](self, "addSubview:", v16);

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
  CNAtomTextView *v10;
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
      v8 = __38__CNAtomTextView_setPlaceholderColor___block_invoke;
      v9 = &unk_1E62BF0D0;
      v10 = self;
      v11 = v4;
      v5 = (void (**)(_QWORD))MEMORY[0x1B5E16810](&v6);
      if (objc_msgSend(MEMORY[0x1E0CEABB0], "areAnimationsEnabled", v6, v7, v8, v9, v10))
        objc_msgSend(MEMORY[0x1E0CEABB0], "transitionWithView:duration:options:animations:completion:", self->_placeholderLabel, 5242880, v5, 0, 0.35);
      else
        v5[2](v5);

    }
  }

}

uint64_t __38__CNAtomTextView_setPlaceholderColor___block_invoke(uint64_t a1)
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
    v4 = objc_alloc(MEMORY[0x1E0CEA700]);
    v5 = (UILabel *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v6 = self->_placeholderLabel;
    self->_placeholderLabel = v5;

    -[UILabel _setDrawsDebugBaselines:](self->_placeholderLabel, "_setDrawsDebugBaselines:", -[CNAtomTextView _drawsDebugBaselines](self, "_drawsDebugBaselines"));
    -[CNAtomTextView font](self, "font");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](self->_placeholderLabel, "setFont:", v7);

    -[CNAtomTextView placeholderColor](self, "placeholderColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](self->_placeholderLabel, "setTextColor:", v8);

    -[CNAtomTextView placeholder](self, "placeholder");
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

  if (self->_placeholder != a3)
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");
    placeholder = self->_placeholder;
    self->_placeholder = v4;

    -[UILabel setText:](self->_placeholderLabel, "setText:", self->_placeholder);
    -[CNAtomTextView setNeedsLayout](self, "setNeedsLayout");
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
  -[UIView cnaui_currentScreenScale](self, "cnaui_currentScreenScale");
  v38 = v8;
  UIRectCenteredYInRectScale();
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v17 = -[CNAtomTextView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection", v38);
  v18 = -[CNAtomTextView _showsLeadingView](self, "_showsLeadingView");
  v19 = -[CNAtomTextView _showsTrailingView](self, "_showsTrailingView");
  v20 = -[CNAtomTextView _showsClearButton](self, "_showsClearButton");
  v21 = v19 || v20;
  v39 = v16;
  if ((v17 & 1) == 0 && v18)
  {
    -[CNAtomTextView leadingViewFrameForBounds:](self, "leadingViewFrameForBounds:", x, y, width, height);
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
        -[CNAtomTextView clearButtonFrameForBounds:](self, "clearButtonFrameForBounds:", x, y, width, height);
      else
        -[CNAtomTextView trailingViewFrameForBounds:](self, "trailingViewFrameForBounds:", x, y, width, height);
      goto LABEL_15;
    }
    goto LABEL_18;
  }
  if (v21)
  {
    if (v20)
      -[CNAtomTextView clearButtonFrameForBounds:](self, "clearButtonFrameForBounds:", x, y, width, height);
    else
      -[CNAtomTextView trailingViewFrameForBounds:](self, "trailingViewFrameForBounds:", x, y, width, height);
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
  -[CNAtomTextView leadingViewFrameForBounds:](self, "leadingViewFrameForBounds:", x, y, width, height);
LABEL_15:
  v27 = v24 - (v26 + 16.0);
LABEL_19:
  -[CNAtomTextView placeholderInsets](self, "placeholderInsets");
  -[CNAtomTextView _edgeInsetsForDirectionalInsets:](self, "_edgeInsetsForDirectionalInsets:");
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
  return !-[CNAtomTextView _hasContent](self, "_hasContent");
}

- (void)_layoutPlaceholder
{
  UILabel *placeholderLabel;
  id v4;

  if (-[CNAtomTextView _showsPlaceholder](self, "_showsPlaceholder"))
  {
    -[CNAtomTextView placeholderLabel](self, "placeholderLabel");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[CNAtomTextView bounds](self, "bounds");
    -[CNAtomTextView placeholderFrameForBounds:](self, "placeholderFrameForBounds:");
    objc_msgSend(v4, "setFrame:");
    -[CNAtomTextView addSubview:](self, "addSubview:", v4);

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
  void (**v13)(_QWORD, _QWORD);
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
  _QWORD v28[9];
  uint64_t v29;
  double *v30;
  uint64_t v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  UIEdgeInsets result;

  v29 = 0;
  v30 = (double *)&v29;
  v31 = 0x4010000000;
  v32 = &unk_1B1148B9B;
  v3 = *(_OWORD *)(MEMORY[0x1E0CEB4B0] + 16);
  v33 = *MEMORY[0x1E0CEB4B0];
  v34 = v3;
  -[CNAtomTextView bounds](self, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v12 = -[CNAtomTextView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __28__CNAtomTextView_edgeInsets__block_invoke;
  v28[3] = &unk_1E62BF410;
  v28[4] = &v29;
  *(double *)&v28[5] = v5;
  *(double *)&v28[6] = v7;
  *(double *)&v28[7] = v9;
  *(double *)&v28[8] = v11;
  v13 = (void (**)(_QWORD, _QWORD))MEMORY[0x1B5E16810](v28);
  if (-[CNAtomTextView _showsClearButton](self, "_showsClearButton"))
  {
    -[CNAtomTextView clearButtonFrameForBounds:](self, "clearButtonFrameForBounds:", v5, v7, v9, v11);
    v13[2](v13, v12);
    v14 = 7;
    if ((_DWORD)v12)
      v14 = 5;
    v30[v14] = v30[v14] + 7.0;
  }
  if (-[CNAtomTextView _showsLeadingView](self, "_showsLeadingView"))
  {
    -[CNAtomTextView leadingViewFrameForBounds:](self, "leadingViewFrameForBounds:", v5, v7, v9, v11);
    v13[2](v13, v12 ^ 1);
  }
  if (-[CNAtomTextView _showsTrailingView](self, "_showsTrailingView"))
  {
    -[CNAtomTextView trailingViewFrameForBounds:](self, "trailingViewFrameForBounds:", v5, v7, v9, v11);
    v13[2](v13, v12);
  }
  -[CNAtomTextView textInsets](self, "textInsets");
  -[CNAtomTextView _edgeInsetsForDirectionalInsets:](self, "_edgeInsetsForDirectionalInsets:");
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

double __28__CNAtomTextView_edgeInsets__block_invoke(uint64_t a1, int a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
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

  -[CNAtomTextView _layoutPlaceholder](self, "_layoutPlaceholder");
  -[CNAtomTextView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[CNAtomTextView edgeInsets](self, "edgeInsets");
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
  -[_CNAtomFieldEditor sizeThatFits:](self->_textView, "sizeThatFits:", 1.79769313e308, CGRectGetHeight(v38));
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
  -[UIView cnaui_currentScreenScale](self, "cnaui_currentScreenScale");
  v37 = v28;
  UIRectCenteredYInRectScale();
  v30 = v29;
  v32 = v31;
  v34 = v33;
  v36 = v35;
  -[_CNAtomFieldEditor frame](self->_textView, "frame", v37);
  v43.origin.x = v30;
  v43.origin.y = v32;
  v43.size.width = v34;
  v43.size.height = v36;
  if (!CGRectEqualToRect(v42, v43))
    -[_CNAtomFieldEditor setFrame:](self->_textView, "setFrame:", v30, v32, v34, v36);
  -[CNAtomTextView _layoutButtons](self, "_layoutButtons");
  -[CNAtomTextView _updateBaselineConstraintIfNecessaryUsingTextViewFrame:](self, "_updateBaselineConstraintIfNecessaryUsingTextViewFrame:", v30, v32, v34, v36);
  -[CNAtomTextView _scrollToSelectionIfNeeded](self, "_scrollToSelectionIfNeeded");
}

- (void)setTextInsets:(NSDirectionalEdgeInsets)a3
{
  if (self->_textInsets.leading != a3.leading
    || self->_textInsets.top != a3.top
    || self->_textInsets.trailing != a3.trailing
    || self->_textInsets.bottom != a3.bottom)
  {
    self->_textInsets = a3;
    -[CNAtomTextView setNeedsLayout](self, "setNeedsLayout");
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
    -[CNAtomTextView setNeedsLayout](self, "setNeedsLayout");
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
    -[CNAtomTextView setNeedsLayout](self, "setNeedsLayout");
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
    -[CNAtomTextView setNeedsLayout](self, "setNeedsLayout");
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
    -[CNAtomTextView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (CGPoint)_firstGlyphBaselineLeftPointWithLayoutManager:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  CGFloat MinX;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  _QWORD v18[5];
  uint64_t v19;
  CGRect *v20;
  uint64_t v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  _QWORD v25[6];
  uint64_t v26;
  double *v27;
  uint64_t v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  CGPoint result;

  v4 = a3;
  objc_msgSend(v4, "textStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");
  if (!v6)
  {
    -[CNAtomTextView _baseAttributedStringWithRepresentedObject:](self, "_baseAttributedStringWithRepresentedObject:", CFSTR("X"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendAttributedString:", v7);

  }
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__0;
  v36 = __Block_byref_object_dispose__0;
  v37 = 0;
  v26 = 0;
  v27 = (double *)&v26;
  v28 = 0x4010000000;
  v29 = &unk_1B1148B9B;
  v30 = 0u;
  v31 = 0u;
  v8 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __64__CNAtomTextView__firstGlyphBaselineLeftPointWithLayoutManager___block_invoke;
  v25[3] = &unk_1E62BF438;
  v25[4] = &v26;
  v25[5] = &v32;
  objc_msgSend(v4, "enumerateLineFragmentsForGlyphRange:usingBlock:", 0, 1, v25);
  v19 = 0;
  v20 = (CGRect *)&v19;
  v21 = 0x4010000000;
  v22 = &unk_1B1148B9B;
  v23 = 0u;
  v24 = 0u;
  v9 = v33[5];
  v18[0] = v8;
  v18[1] = 3221225472;
  v18[2] = __64__CNAtomTextView__firstGlyphBaselineLeftPointWithLayoutManager___block_invoke_2;
  v18[3] = &unk_1E62BF460;
  v18[4] = &v19;
  objc_msgSend(v4, "enumerateEnclosingRectsForGlyphRange:withinSelectedGlyphRange:inTextContainer:usingBlock:", 0, 1, 0x7FFFFFFFFFFFFFFFLL, 0, v9, v18);
  objc_msgSend(v4, "baselineOffsetForGlyphAtIndex:", 0);
  v11 = v10;
  MinX = CGRectGetMinX(v20[1]);
  v13 = v27[5];
  -[_CNAtomFieldEditor textContainerInset](self->_textView, "textContainerInset");
  v15 = v14;
  if (!v6)
    objc_msgSend(v5, "deleteCharactersInRange:", 0, objc_msgSend(v5, "length"));
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v32, 8);

  v16 = MinX;
  v17 = v11 + v13 + v15;
  result.y = v17;
  result.x = v16;
  return result;
}

void __64__CNAtomTextView__firstGlyphBaselineLeftPointWithLayoutManager___block_invoke(uint64_t a1, void *a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9, double a10, uint64_t a11, uint64_t a12, _BYTE *a13)
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

uint64_t __64__CNAtomTextView__firstGlyphBaselineLeftPointWithLayoutManager___block_invoke_2(uint64_t result, _BYTE *a2, double a3, double a4, double a5, double a6)
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
  _CNAtomTextViewBaselineLayoutStrut *v3;
  _CNAtomTextViewBaselineLayoutStrut *v4;
  _CNAtomTextViewBaselineLayoutStrut *baselineLayoutLabel;
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
    v3 = [_CNAtomTextViewBaselineLayoutStrut alloc];
    v4 = -[_CNAtomTextViewBaselineLayoutStrut initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    baselineLayoutLabel = self->_baselineLayoutLabel;
    self->_baselineLayoutLabel = v4;

    -[CNAtomTextView font](self, "font");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CNAtomTextViewBaselineLayoutStrut setFont:](self->_baselineLayoutLabel, "setFont:", v6);

    -[_CNAtomTextViewBaselineLayoutStrut setTranslatesAutoresizingMaskIntoConstraints:](self->_baselineLayoutLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[_CNAtomTextViewBaselineLayoutStrut setHidden:](self->_baselineLayoutLabel, "setHidden:", 1);
    -[CNAtomTextView addSubview:](self, "addSubview:", self->_baselineLayoutLabel);
    LODWORD(v7) = 1148846080;
    -[_CNAtomTextViewBaselineLayoutStrut setContentCompressionResistancePriority:forAxis:](self->_baselineLayoutLabel, "setContentCompressionResistancePriority:forAxis:", 1, v7);
    LODWORD(v8) = 1148846080;
    -[_CNAtomTextViewBaselineLayoutStrut setContentHuggingPriority:forAxis:](self->_baselineLayoutLabel, "setContentHuggingPriority:forAxis:", 1, v8);
    v9 = (void *)MEMORY[0x1E0CB3718];
    _NSDictionaryOfVariableBindings(CFSTR("_baselineLayoutLabel"), self->_baselineLayoutLabel, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[_baselineLayoutLabel(0)]"), 0, 0, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "activateConstraints:", v11);

    -[_CNAtomTextViewBaselineLayoutStrut topAnchor](self->_baselineLayoutLabel, "topAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNAtomTextView topAnchor](self, "topAnchor");
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
  _CNAtomTextViewBaselineLayoutStrut *baselineLayoutLabel;
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
      -[_CNAtomTextViewBaselineLayoutStrut frame](baselineLayoutLabel, "frame");
      v10 = v9;
      v12 = v11;
      -[_CNAtomTextViewBaselineLayoutStrut intrinsicContentSize](self->_baselineLayoutLabel, "intrinsicContentSize");
      -[_CNAtomTextViewBaselineLayoutStrut setFrame:](self->_baselineLayoutLabel, "setFrame:", v10, v12, v13, v14);
      -[_CNAtomFieldEditor layoutManager](self->_textView, "layoutManager");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNAtomTextView _firstGlyphBaselineLeftPointWithLayoutManager:](self, "_firstGlyphBaselineLeftPointWithLayoutManager:", v15);

      UIRoundToViewScale();
      v17 = v16;
      -[_CNAtomFieldEditor superview](self->_textView, "superview");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNAtomTextView convertRect:fromView:](self, "convertRect:fromView:", v18, x, y, width, height);
      v20 = v19;
      v22 = v21;
      v24 = v23;
      v26 = v25;

      v29.origin.x = v20;
      v29.origin.y = v22;
      v29.size.width = v24;
      v29.size.height = v26;
      v27 = v17 + CGRectGetMinY(v29);
      -[_CNAtomTextViewBaselineLayoutStrut _firstLineBaselineOffsetFromBoundsTop](self->_baselineLayoutLabel, "_firstLineBaselineOffsetFromBoundsTop");
      -[NSLayoutConstraint setConstant:](self->_baselineLayoutConstraint, "setConstant:", v27 - v28);
    }
  }
}

- (id)viewForLastBaselineLayout
{
  -[CNAtomTextView _createBaselineLayoutStrutIfNecessary](self, "_createBaselineLayoutStrutIfNecessary");
  return self->_baselineLayoutLabel;
}

- (id)_attachmentAtCharacterIndex:(unint64_t)a3
{
  void *v4;
  void *v5;
  id v6;

  -[_CNAtomFieldEditor textStorage](self->_textView, "textStorage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0DC10F8], a3, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  v6 = 0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;

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
  void *v18;
  __int128 v19;
  _NSRange result;

  v4 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3010000000;
  v18 = &unk_1B1148B9B;
  v19 = xmmword_1B1144CB0;
  if (v4)
  {
    -[_CNAtomFieldEditor textStorage](self->_textView, "textStorage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "length");
    v7 = *MEMORY[0x1E0DC10F8];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __45__CNAtomTextView__characterRangeForAtomView___block_invoke;
    v12[3] = &unk_1E62BF488;
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

void __45__CNAtomTextView__characterRangeForAtomView___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
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
  uint64_t v11;
  uint64_t i;
  void *v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v23 = *MEMORY[0x1E0C80C00];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v8 = self->_atomViews;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v13, "bounds", (_QWORD)v18);
        -[CNAtomTextView convertRect:fromView:](self, "convertRect:fromView:", v13);
        v26.origin.x = v14;
        v26.origin.y = v15;
        v26.size.width = v16;
        v26.size.height = v17;
        v24.origin.x = x;
        v24.origin.y = y;
        v24.size.width = width;
        v24.size.height = height;
        v25 = CGRectIntersection(v24, v26);
        -[CNAtomTextView convertRect:toView:](self, "convertRect:toView:", v13, v25.origin.x, v25.origin.y, v25.size.width, v25.size.height);
        objc_msgSend(v13, "setMaskBounds:");
      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v10);
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
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;
  CGPoint v24;
  CGRect v25;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "state") == 3)
  {
    objc_msgSend(v4, "locationInView:", self);
    v6 = v5;
    v8 = v7;
    if (!-[CNAtomTextView isFirstResponder](self, "isFirstResponder"))
      -[CNAtomTextView becomeFirstResponder](self, "becomeFirstResponder");
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v9 = self->_atomViews;
    v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v19;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v19 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          objc_msgSend(v14, "delegateView", (_QWORD)v18);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "bounds");
          -[CNAtomTextView convertRect:fromView:](self, "convertRect:fromView:", v15);
          v24.x = v6;
          v24.y = v8;
          if (CGRectContainsPoint(v25, v24))
          {
            v16 = -[CNAtomTextView _characterRangeForAtomView:](self, "_characterRangeForAtomView:", v14);
            if (v16 != 0x7FFFFFFFFFFFFFFFLL)
              -[_CNAtomFieldEditor setSelectedRange:](self->_textView, "setSelectedRange:", v16, v17);

            goto LABEL_16;
          }

        }
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        if (v11)
          continue;
        break;
      }
    }
LABEL_16:

  }
}

- (void)_clearButtonTapped:(id)a3
{
  -[CNAtomTextView setRepresentedObjects:](self, "setRepresentedObjects:", 0);
  -[CNAtomTextView becomeFirstResponder](self, "becomeFirstResponder");
}

- (void)escKeyPressed:(id)a3
{
  id v4;

  v4 = a3;
  if (-[CNAtomTextView _showsClearButton](self, "_showsClearButton"))
    -[CNAtomTextView _clearButtonTapped:](self, "_clearButtonTapped:", v4);

}

- (CGRect)_usedRectWithLayoutManager:(id)a3 textContainer:(id)a4
{
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
  double v19;
  double v20;
  double v21;
  CGRect result;

  objc_msgSend(a3, "usedRectForTextContainer:", a4);
  v6 = v5;
  v8 = v7;
  v9 = *MEMORY[0x1E0C9D538];
  v10 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  -[_CNAtomFieldEditor textContainerInset](self->_textView, "textContainerInset");
  v12 = v11;
  -[_CNAtomFieldEditor textContainerInset](self->_textView, "textContainerInset");
  v14 = v8 - (v12 + v13);
  -[_CNAtomFieldEditor textContainerInset](self->_textView, "textContainerInset");
  v16 = v15;
  -[_CNAtomFieldEditor textContainerInset](self->_textView, "textContainerInset");
  v18 = v6 - (v16 + v17);
  v19 = v9;
  v20 = v10;
  v21 = v14;
  result.size.height = v21;
  result.size.width = v18;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (void)layoutManager:(id)a3 didCompleteLayoutForTextContainer:(id)a4 atEnd:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  NSMutableArray *atomViews;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _QWORD v36[4];
  id v37;
  CNAtomTextView *v38;
  id v39;
  id v40;
  _BYTE v41[128];
  uint64_t v42;

  v5 = a5;
  v42 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (v5 && (*(_BYTE *)&self->_flags & 0x20) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", self->_atomViews);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "textStorage");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "length");
    v13 = *MEMORY[0x1E0DC10F8];
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __72__CNAtomTextView_layoutManager_didCompleteLayoutForTextContainer_atEnd___block_invoke;
    v36[3] = &unk_1E62BF4B0;
    v14 = v10;
    v37 = v14;
    v38 = self;
    v15 = v8;
    v39 = v15;
    v16 = v9;
    v40 = v16;
    v31 = v11;
    objc_msgSend(v11, "enumerateAttribute:inRange:options:usingBlock:", v13, 0, v12, 0, v36);
    if (objc_msgSend(v14, "count"))
    {
      atomViews = self->_atomViews;
      objc_msgSend(v14, "allObjects");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray removeObjectsInArray:](atomViews, "removeObjectsInArray:", v18);

      v34 = 0u;
      v35 = 0u;
      v32 = 0u;
      v33 = 0u;
      v19 = v14;
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
      if (v20)
      {
        v21 = v20;
        v22 = *(_QWORD *)v33;
        do
        {
          v23 = 0;
          do
          {
            if (*(_QWORD *)v33 != v22)
              objc_enumerationMutation(v19);
            objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * v23++), "removeFromSuperview");
          }
          while (v21 != v23);
          v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
        }
        while (v21);
      }

    }
    -[CNAtomTextView _usedRectWithLayoutManager:textContainer:](self, "_usedRectWithLayoutManager:textContainer:", v15, v16);
    -[UIView cnaui_currentScreenScale](self, "cnaui_currentScreenScale");
    UIRectIntegralWithScale();
    v25 = v24;
    v27 = v26;
    -[UIScrollView contentSize](self->_scrollView, "contentSize");
    if (v29 != v25 || v28 != v27)
      -[UIScrollView setContentSize:](self->_scrollView, "setContentSize:", v25, v27);
    -[CNAtomTextView _visibleAtomsRect](self, "_visibleAtomsRect");
    -[CNAtomTextView _updateAtomMasksInRect:](self, "_updateAtomMasksInRect:");

  }
}

void __72__CNAtomTextView_layoutManager_didCompleteLayoutForTextContainer_atEnd___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  char isKindOfClass;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
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
  void *v24;
  double v25;
  id v26;

  v26 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v8 = v26;
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v26, "atomView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "removeObject:", v9);
    objc_msgSend(v9, "superview");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 496), "addSubview:", v9);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 520), "addObject:", v9);
    }
    v11 = objc_msgSend(*(id *)(a1 + 48), "glyphRangeForCharacterRange:actualCharacterRange:", a3, a4, 0);
    objc_msgSend(*(id *)(a1 + 48), "boundingRectForGlyphRange:inTextContainer:", v11, v12, *(_QWORD *)(a1 + 56));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 496), "convertGlyphRect:");
    objc_msgSend(v9, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
    objc_msgSend(*(id *)(a1 + 40), "cnaui_currentScreenScale");
    UIRectIntegralWithScale();
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v20 = v19;
    objc_msgSend(v9, "frame");
    if (v18 != v22 || v20 != v21)
    {
      objc_msgSend(v9, "setBounds:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), v18, v20);
      objc_msgSend(v9, "layoutSubviews");
    }
    objc_msgSend(v9, "viewForLastBaselineLayout");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "frame");
    objc_msgSend(v9, "setFrame:", v14, v16 - v25, v18, v20);

    v8 = v26;
  }

}

- (void)scrollViewDidScroll:(id)a3
{
  if (self->_scrollView == a3)
  {
    -[CNAtomTextView _visibleAtomsRect](self, "_visibleAtomsRect");
    -[CNAtomTextView _updateAtomMasksInRect:](self, "_updateAtomMasksInRect:");
  }
}

- (void)_scrollToSelectionIfNeeded
{
  _CNAtomFieldEditor *textView;
  uint64_t v4;
  uint64_t v5;

  if ((*(_BYTE *)&self->_flags & 0x40) != 0)
  {
    textView = self->_textView;
    v4 = -[_CNAtomFieldEditor selectedRange](textView, "selectedRange");
    -[_CNAtomFieldEditor _rectForScrollToVisible:](textView, "_rectForScrollToVisible:", v4, v5);
    -[_CNAtomFieldEditor scrollRectToVisible:animated:](self->_textView, "scrollRectToVisible:animated:", 1);
    *(_BYTE *)&self->_flags &= ~0x40u;
  }
}

- (void)textViewDidBeginEditing:(id)a3
{
  -[CNAtomTextView sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 0x10000);
}

- (void)textViewDidEndEditing:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(v4, "textStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSelectedRange:", objc_msgSend(v5, "length"), 0);

  -[CNAtomTextView sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 0x40000);
}

- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  id v10;
  void *v11;
  BOOL v12;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id WeakRetained;
  void *v19;
  char v20;

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

    -[CNAtomTextView sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 0x80000);
LABEL_4:
    v12 = 0;
    goto LABEL_5;
  }
  if (objc_msgSend(v10, "isEqualToString:", &stru_1E62C0368) && length == 1)
  {
    -[CNAtomTextView _attachmentAtCharacterIndex:](self, "_attachmentAtCharacterIndex:", location);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "atomView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15 && !objc_msgSend(v15, "selectionStyle"))
    {
      objc_msgSend(v9, "setSelectedRange:", location, 1);
      v12 = 0;
    }
    else
    {
      v12 = 1;
    }

  }
  else
  {
    v12 = 1;
    if ((*(_BYTE *)&self->_flags & 0x10) != 0 && length == 1)
    {
      -[CNAtomTextView _attachmentAtCharacterIndex:](self, "_attachmentAtCharacterIndex:", location);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "atomView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v17, "selectionStyle"))
      {
        WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(v16, "representedObject");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(WeakRetained, "_atomTextView:shouldReplaceRepresentedObject:replacementText:", self, v19, v10);

        if ((v20 & 1) == 0)
        {
          objc_msgSend(v9, "setSelectedRange:", location + 1, 0);
          objc_msgSend(v9, "insertText:", v10);

          goto LABEL_4;
        }
      }
      else
      {

      }
      v12 = 1;
    }
  }
LABEL_5:

  return v12;
}

- (void)textViewDidChange:(id)a3
{
  -[CNAtomTextView setNeedsLayout](self, "setNeedsLayout", a3);
  -[CNAtomTextView sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 0x20000);
}

- (void)textViewDidChangeSelection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  _CNAtomFieldEditor *textView;
  id WeakRetained;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, uint64_t, uint64_t, uint64_t);
  void *v22;
  id v23;
  id v24;
  id v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;

  v4 = a3;
  objc_msgSend(v4, "textStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "selectedRange");
  v9 = v8;
  v10 = objc_msgSend(v6, "glyphRangeForCharacterRange:actualCharacterRange:", 0, objc_msgSend(v5, "length"), 0);
  v12 = v11;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__0;
  v33 = __Block_byref_object_dispose__0;
  v34 = 0;
  v19 = MEMORY[0x1E0C809B0];
  v20 = 3221225472;
  v21 = __45__CNAtomTextView_textViewDidChangeSelection___block_invoke;
  v22 = &unk_1E62BF500;
  v13 = v6;
  v23 = v13;
  v14 = v5;
  v24 = v14;
  v27 = v7;
  v28 = v9;
  v15 = v4;
  v25 = v15;
  v26 = &v29;
  objc_msgSend(v13, "enumerateLineFragmentsForGlyphRange:usingBlock:", v10, v12, &v19);
  v16 = (void *)v30[5];
  textView = self->_textView;
  if (v16)
  {
    objc_msgSend(v16, "bounds", v19, v20, v21, v22, v23, v24);
    -[_CNAtomFieldEditor convertRect:fromView:](textView, "convertRect:fromView:", v30[5]);
  }
  else
  {
    -[_CNAtomFieldEditor _rectForScrollToVisible:](self->_textView, "_rectForScrollToVisible:", v7, v9, v19, v20, v21, v22, v23, v24);
  }
  -[_CNAtomFieldEditor scrollRectToVisible:animated:](self->_textView, "scrollRectToVisible:animated:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "atomTextViewDidChangeSelection:", self);

  }
  _Block_object_dispose(&v29, 8);

}

void __45__CNAtomTextView_textViewDidChangeSelection___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
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
  v12[2] = __45__CNAtomTextView_textViewDidChangeSelection___block_invoke_2;
  v12[3] = &unk_1E62BF4D8;
  v15 = *(_OWORD *)(a1 + 64);
  v9 = *(void **)(a1 + 40);
  v10 = *(id *)(a1 + 48);
  v11 = *(_QWORD *)(a1 + 56);
  v13 = v10;
  v14 = v11;
  objc_msgSend(v9, "enumerateAttribute:inRange:options:usingBlock:", v8, v5, v7, 0, v12);

}

void __45__CNAtomTextView_textViewDidChangeSelection___block_invoke_2(_QWORD *a1, void *a2, unint64_t a3, uint64_t a4)
{
  char isKindOfClass;
  void *v8;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v13;
  _BOOL4 v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  _BOOL4 v20;
  _BOOL4 v21;
  int v22;
  BOOL v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;

  v27 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v8 = v27;
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v27, "atomView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = a1[6];
    v11 = a1[7];
    if (a3 < v10 || a3 - v10 >= v11)
    {
      v13 = 0;
    }
    else
    {
      v14 = a3 == v10;
      v15 = a3 + a4 == v11 + v10;
      v16 = (void *)a1[4];
      objc_msgSend(v16, "beginningOfDocument");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "positionFromPosition:offset:", v17, a3);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v16, "baseWritingDirectionForPosition:inDirection:", v18, 0);

      if (v19 == 1)
        v20 = v15;
      else
        v20 = v14;
      if (v19 == 1)
        v21 = v14;
      else
        v21 = v15;
      v22 = v20 || v21;
      v23 = !v20;
      v24 = 4;
      if (v23)
        v24 = 0;
      v23 = !v21;
      v25 = 8;
      if (v23)
        v25 = 0;
      v26 = v24 | v25;
      if (v22)
        v13 = v26;
      else
        v13 = 1;
      objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), v9);
    }
    objc_msgSend(v9, "setSelectionStyle:animated:", v13, 0);

    v8 = v27;
  }

}

- (void)_textStorageDidProcessEditing:(id)a3
{
  if (-[_CNAtomFieldEditor isSelectable](self->_textView, "isSelectable", a3))
  {
    if (-[CNAtomTextView isFirstResponder](self, "isFirstResponder"))
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

  v2 = -[_CNAtomFieldEditor selectionRange](self->_textView, "selectionRange");
  result.length = v3;
  result.location = v2;
  return result;
}

- (BOOL)hasContent
{
  return -[_CNAtomFieldEditor hasContent](self->_textView, "hasContent");
}

- (void)selectAll
{
  -[_CNAtomFieldEditor selectAll](self->_textView, "selectAll");
}

- (BOOL)hasSelection
{
  return -[_CNAtomFieldEditor hasSelection](self->_textView, "hasSelection");
}

- (id)rangeEnclosingPosition:(id)a3 withGranularity:(int64_t)a4 inDirection:(int64_t)a5
{
  return (id)-[_CNAtomFieldEditor rangeEnclosingPosition:withGranularity:inDirection:](self->_textView, "rangeEnclosingPosition:withGranularity:inDirection:", a3, a4, a5);
}

- (BOOL)isPosition:(id)a3 atBoundary:(int64_t)a4 inDirection:(int64_t)a5
{
  return -[_CNAtomFieldEditor isPosition:atBoundary:inDirection:](self->_textView, "isPosition:atBoundary:inDirection:", a3, a4, a5);
}

- (BOOL)isPosition:(id)a3 withinTextUnit:(int64_t)a4 inDirection:(int64_t)a5
{
  return -[_CNAtomFieldEditor isPosition:withinTextUnit:inDirection:](self->_textView, "isPosition:withinTextUnit:inDirection:", a3, a4, a5);
}

- (id)positionFromPosition:(id)a3 toBoundary:(int64_t)a4 inDirection:(int64_t)a5
{
  return (id)-[_CNAtomFieldEditor positionFromPosition:toBoundary:inDirection:](self->_textView, "positionFromPosition:toBoundary:inDirection:", a3, a4, a5);
}

- (int64_t)baseWritingDirectionForPosition:(id)a3 inDirection:(int64_t)a4
{
  return -[_CNAtomFieldEditor baseWritingDirectionForPosition:inDirection:](self->_textView, "baseWritingDirectionForPosition:inDirection:", a3, a4);
}

- (void)setBaseWritingDirection:(int64_t)a3 forRange:(id)a4
{
  -[_CNAtomFieldEditor setBaseWritingDirection:forRange:](self->_textView, "setBaseWritingDirection:forRange:", a3, a4);
}

- (CGRect)firstRectForRange:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[_CNAtomFieldEditor firstRectForRange:](self->_textView, "firstRectForRange:", a3);
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

  -[_CNAtomFieldEditor caretRectForPosition:](self->_textView, "caretRectForPosition:", a3);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (id)selectionRectsForRange:(id)a3
{
  return -[_CNAtomFieldEditor selectionRectsForRange:](self->_textView, "selectionRectsForRange:", a3);
}

- (id)textInRange:(id)a3
{
  return (id)-[_CNAtomFieldEditor textInRange:](self->_textView, "textInRange:", a3);
}

- (void)replaceRange:(id)a3 withText:(id)a4
{
  -[_CNAtomFieldEditor replaceRange:withText:](self->_textView, "replaceRange:withText:", a3, a4);
}

- (BOOL)hasText
{
  return -[_CNAtomFieldEditor hasText](self->_textView, "hasText");
}

- (void)insertText:(id)a3
{
  -[_CNAtomFieldEditor insertText:](self->_textView, "insertText:", a3);
}

- (void)deleteBackward
{
  -[_CNAtomFieldEditor deleteBackward](self->_textView, "deleteBackward");
}

- (void)unmarkText
{
  -[_CNAtomFieldEditor unmarkText](self->_textView, "unmarkText");
}

- (id)characterRangeAtPoint:(CGPoint)a3
{
  return (id)-[_CNAtomFieldEditor characterRangeAtPoint:](self->_textView, "characterRangeAtPoint:", a3.x, a3.y);
}

- (id)characterRangeByExtendingPosition:(id)a3 inDirection:(int64_t)a4
{
  return (id)-[_CNAtomFieldEditor characterRangeByExtendingPosition:inDirection:](self->_textView, "characterRangeByExtendingPosition:inDirection:", a3, a4);
}

- (id)textRangeFromPosition:(id)a3 toPosition:(id)a4
{
  return (id)-[_CNAtomFieldEditor textRangeFromPosition:toPosition:](self->_textView, "textRangeFromPosition:toPosition:", a3, a4);
}

- (id)positionFromPosition:(id)a3 offset:(int64_t)a4
{
  return (id)-[_CNAtomFieldEditor positionFromPosition:offset:](self->_textView, "positionFromPosition:offset:", a3, a4);
}

- (id)positionFromPosition:(id)a3 inDirection:(int64_t)a4 offset:(int64_t)a5
{
  return (id)-[_CNAtomFieldEditor positionFromPosition:inDirection:offset:](self->_textView, "positionFromPosition:inDirection:offset:", a3, a4, a5);
}

- (id)positionWithinRange:(id)a3 atCharacterOffset:(int64_t)a4
{
  return (id)-[_CNAtomFieldEditor positionWithinRange:atCharacterOffset:](self->_textView, "positionWithinRange:atCharacterOffset:", a3, a4);
}

- (id)positionWithinRange:(id)a3 farthestInDirection:(int64_t)a4
{
  return (id)-[_CNAtomFieldEditor positionWithinRange:farthestInDirection:](self->_textView, "positionWithinRange:farthestInDirection:", a3, a4);
}

- (id)closestPositionToPoint:(CGPoint)a3
{
  return (id)-[_CNAtomFieldEditor closestPositionToPoint:](self->_textView, "closestPositionToPoint:", a3.x, a3.y);
}

- (id)closestPositionToPoint:(CGPoint)a3 withinRange:(id)a4
{
  return (id)-[_CNAtomFieldEditor closestPositionToPoint:withinRange:](self->_textView, "closestPositionToPoint:withinRange:", a4, a3.x, a3.y);
}

- (int64_t)comparePosition:(id)a3 toPosition:(id)a4
{
  return -[_CNAtomFieldEditor comparePosition:toPosition:](self->_textView, "comparePosition:toPosition:", a3, a4);
}

- (int64_t)offsetFromPosition:(id)a3 toPosition:(id)a4
{
  return -[_CNAtomFieldEditor offsetFromPosition:toPosition:](self->_textView, "offsetFromPosition:toPosition:", a3, a4);
}

- (void)setMarkedText:(id)a3 selectedRange:(_NSRange)a4
{
  -[_CNAtomFieldEditor setMarkedText:selectedRange:](self->_textView, "setMarkedText:selectedRange:", a3, a4.location, a4.length);
}

- (id)textInputTraits
{
  UITextInputTraits *textInputTraits;
  UITextInputTraits *v4;
  UITextInputTraits *v5;

  textInputTraits = self->_textInputTraits;
  if (!textInputTraits)
  {
    v4 = (UITextInputTraits *)objc_alloc_init(MEMORY[0x1E0CEAAE8]);
    v5 = self->_textInputTraits;
    self->_textInputTraits = v4;

    textInputTraits = self->_textInputTraits;
  }
  return textInputTraits;
}

- (void)takeTraitsFrom:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CNAtomTextView textInputTraits](self, "textInputTraits");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "takeTraitsFrom:", v4);

}

- (id)forwardingTargetForSelector:(SEL)a3
{
  void *v5;
  objc_super v7;

  if (objc_msgSend((id)objc_opt_class(), "instancesRespondToSelector:", a3))
  {
    -[CNAtomTextView textInputTraits](self, "textInputTraits");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (objc_msgSend((id)objc_opt_class(), "instancesRespondToSelector:", a3))
      return self->_textView;
    v7.receiver = self;
    v7.super_class = (Class)CNAtomTextView;
    -[CNAtomTextView forwardingTargetForSelector:](&v7, sel_forwardingTargetForSelector_, a3);
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
  v7.super_class = (Class)CNAtomTextView;
  if (-[CNAtomTextView respondsToSelector:](&v7, sel_respondsToSelector_))
  {
    v4 = 1;
  }
  else
  {
    -[CNAtomTextView textInputTraits](self, "textInputTraits");
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
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CEA6B8], "keyCommandWithInput:modifierFlags:action:", *MEMORY[0x1E0CEB740], 0, sel_escKeyPressed_);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6;
  BOOL v7;

  v6 = a4;
  v7 = sel__clearButtonTapped_ == a3
    || sel_escKeyPressed_ == a3 && -[CNAtomTextView _showsClearButton](self, "_showsClearButton")
    || -[_CNAtomFieldEditor canPerformAction:withSender:](self->_textView, "canPerformAction:withSender:", a3, v6);

  return v7;
}

- (BOOL)canBecomeFirstResponder
{
  return -[_CNAtomFieldEditor canBecomeFirstResponder](self->_textView, "canBecomeFirstResponder");
}

- (BOOL)becomeFirstResponder
{
  return -[_CNAtomFieldEditor becomeFirstResponder](self->_textView, "becomeFirstResponder");
}

- (BOOL)canResignFirstResponder
{
  return -[_CNAtomFieldEditor canResignFirstResponder](self->_textView, "canResignFirstResponder");
}

- (BOOL)resignFirstResponder
{
  return -[_CNAtomFieldEditor resignFirstResponder](self->_textView, "resignFirstResponder");
}

- (BOOL)isFirstResponder
{
  return -[_CNAtomFieldEditor isFirstResponder](self->_textView, "isFirstResponder");
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  CNAtomTextView *v5;
  CNAtomTextView *v6;
  CNAtomTextView *v7;
  CNAtomTextView *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CNAtomTextView;
  -[CNAtomTextView hitTest:withEvent:](&v10, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (CNAtomTextView *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 == self || v5 == (CNAtomTextView *)self->_textView)
  {
    -[UIButton superview](self->_clearButton, "superview");
    v7 = (CNAtomTextView *)objc_claimAutoreleasedReturnValue();
    if (v7 != self)
    {
      -[UIView superview](self->_leadingView, "superview");
      v8 = (CNAtomTextView *)objc_claimAutoreleasedReturnValue();
      if (v8 != self)
      {
        -[UIView superview](self->_trailingView, "superview");

      }
    }

  }
  return v6;
}

- (CNAtomTextViewDelegate)delegate
{
  return (CNAtomTextViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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

void __25___CNAtomTextView_os_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contacts.autocomplete.ui", "composerecipient");
  v1 = (void *)os_log_cn_once_object_8;
  os_log_cn_once_object_8 = (uint64_t)v0;

}

uint64_t __24___CNAtomTextView_atoms__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

void __60___CNAtomTextView_enumerateAtomsInCharacterRange_withBlock___block_invoke(uint64_t a1, void *a2)
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

void __44___CNAtomTextView_enumerateAtomAttachments___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "objectForKey:", *MEMORY[0x1E0DC10F8]);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __42___CNAtomTextView_selectionRectsForRange___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  _CNAtomTextSelectionRect *v21;
  _CNAtomTextSelectionRect *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  objc_super v30;

  objc_msgSend(a2, "objectForKey:", *MEMORY[0x1E0DC10F8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = *(_QWORD *)(a1 + 48);
    v9 = *(_QWORD *)(a1 + 56) + v8;
    v10 = a3 + a4;
    objc_msgSend(v7, "atomView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *(void **)(a1 + 32);
    objc_msgSend(v11, "selectionFrame");
    objc_msgSend(v12, "convertRect:fromView:", v11);
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v20 = v19;
    if (a3 == v8)
    {
      v21 = objc_alloc_init(_CNAtomTextSelectionRect);
      -[_CNAtomTextSelectionRect setRect:](v21, "setRect:", v14, v16, 0.0, v20);
      -[_CNAtomTextSelectionRect setContainsStart:](v21, "setContainsStart:", 1);
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v21);

    }
    if (v9 == v10)
    {
      v22 = objc_alloc_init(_CNAtomTextSelectionRect);
      -[_CNAtomTextSelectionRect setRect:](v22, "setRect:", v14 + v18, v16, 0.0, v20);
      -[_CNAtomTextSelectionRect setContainsEnd:](v22, "setContainsEnd:", 1);
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v22);

    }
  }
  else
  {
    v23 = *(void **)(a1 + 32);
    objc_msgSend(v23, "beginningOfDocument");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "positionFromPosition:offset:", v24, a3);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "positionFromPosition:offset:", v25, a4);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "textRangeFromPosition:toPosition:", v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = *(void **)(a1 + 40);
    v30.receiver = *(id *)(a1 + 32);
    v30.super_class = (Class)_CNAtomTextView;
    objc_msgSendSuper2(&v30, sel_selectionRectsForRange_, v27);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "addObjectsFromArray:", v29);

  }
}

uint64_t __25___CNAtomTextView_paste___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  v3 = objc_msgSend(v2, "canLoadObjectOfClass:", objc_opt_class());

  return v3;
}

void __26___CNAtomTextView_delete___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;

  objc_msgSend(a2, "recipient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
    v3 = v4;
  }

}

uint64_t __26___CNAtomTextView_delete___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_didRemoveRecipient:", a2);
}

void __30___CNAtomTextView_keyCommands__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  objc_super v16;
  _QWORD v17[9];

  v17[8] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CEA6B8], "keyCommandWithInput:modifierFlags:action:", *MEMORY[0x1E0CEB7D0], 0, sel_upArrowPressed);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setWantsPriorityOverSystemBehavior:", 1);
  objc_msgSend(MEMORY[0x1E0CEA6B8], "keyCommandWithInput:modifierFlags:action:", *MEMORY[0x1E0CEB728], 0, sel_downArrowPressed);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWantsPriorityOverSystemBehavior:", 1);
  objc_msgSend(MEMORY[0x1E0CEA6B8], "keyCommandWithInput:modifierFlags:action:", *MEMORY[0x1E0CEB7B0], 0, sel_leftArrowPressed);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWantsPriorityOverSystemBehavior:", 1);
  objc_msgSend(MEMORY[0x1E0CEA6B8], "keyCommandWithInput:modifierFlags:action:", *MEMORY[0x1E0CEB7C8], 0, sel_rightArrowPressed);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWantsPriorityOverSystemBehavior:", 1);
  objc_msgSend(MEMORY[0x1E0CEA6B8], "keyCommandWithInput:modifierFlags:action:", CFSTR("\r"), 0, sel_returnPressed);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWantsPriorityOverSystemBehavior:", 1);
  objc_msgSend(MEMORY[0x1E0CEA6B8], "keyCommandWithInput:modifierFlags:action:", CFSTR("\t"), 0, sel_tabPressed);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWantsPriorityOverSystemBehavior:", 1);
  objc_msgSend(MEMORY[0x1E0CEA6B8], "keyCommandWithInput:modifierFlags:action:", CFSTR(","), 0, sel_commaPressed);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWantsPriorityOverSystemBehavior:", 1);
  objc_msgSend(MEMORY[0x1E0CEA6B8], "keyCommandWithInput:modifierFlags:action:", *MEMORY[0x1E0CEB740], 0, sel_escKeyPressed);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWantsPriorityOverSystemBehavior:", 1);
  v16.receiver = *(id *)(a1 + 32);
  v16.super_class = (Class)_CNAtomTextView;
  objc_msgSendSuper2(&v16, sel_keyCommands);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v9)
    v11 = (void *)v9;
  else
    v11 = (void *)MEMORY[0x1E0C9AA60];
  v17[0] = v15;
  v17[1] = v2;
  v17[2] = v3;
  v17[3] = v4;
  v17[4] = v5;
  v17[5] = v6;
  v17[6] = v7;
  v17[7] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "arrayByAddingObjectsFromArray:", v12);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)keyCommands_keyCommands;
  keyCommands_keyCommands = v13;

}

@end
