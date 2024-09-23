@implementation ICNoteEditorDateView

- (void)updateLayoutIfNecessary
{
  double v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  id v8;

  if ((objc_msgSend(MEMORY[0x1E0D641E0], "isRunningUnitTests") & 1) == 0)
  {
    -[ICNoteEditorDateView dateViewMaximumWidth](self, "dateViewMaximumWidth");
    v4 = v3;
    -[ICNoteEditorDateView dateViewMaximumWidthOnPreviousTextChange](self, "dateViewMaximumWidthOnPreviousTextChange");
    if (v4 != v5)
    {
      -[ICNoteEditorDateView dateViewLayoutUpdateDelayer](self, "dateViewLayoutUpdateDelayer");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v6)
      {
        v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D64268]), "initWithTarget:selector:delay:waitToFireUntilRequestsStop:callOnMainThread:", self, sel__updateLayout, 0, 1, 0.25);
        -[ICNoteEditorDateView setDateViewLayoutUpdateDelayer:](self, "setDateViewLayoutUpdateDelayer:", v7);

      }
      -[ICNoteEditorDateView dateViewLayoutUpdateDelayer](self, "dateViewLayoutUpdateDelayer");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "requestFire");

    }
  }
}

- (void)setNote:(id)a3
{
  ICNote *v4;
  ICNote *note;
  ICNote *v6;
  void *v7;

  v4 = (ICNote *)a3;
  -[ICNoteEditorDateView setCachedHeight:](self, "setCachedHeight:", 0.0);
  note = self->_note;
  self->_note = v4;
  v6 = v4;

  -[ICNoteEditorDateView formatterController](self, "formatterController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setNote:", v6);

  -[ICNoteEditorDateView setHidden:](self, "setHidden:", v6 == 0);
  -[ICNoteEditorDateView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setLockImageView:(id)a3
{
  objc_storeWeak((id *)&self->_lockImageView, a3);
}

- (void)setLabel:(id)a3
{
  objc_storeWeak((id *)&self->_label, a3);
}

- (void)setFormatterController:(id)a3
{
  objc_storeStrong((id *)&self->_formatterController, a3);
}

- (void)setDateViewMaximumWidthOnPreviousTextChange:(double)a3
{
  self->_dateViewMaximumWidthOnPreviousTextChange = a3;
}

- (void)setDateViewLayoutUpdateDelayer:(id)a3
{
  objc_storeStrong((id *)&self->_dateViewLayoutUpdateDelayer, a3);
}

- (void)setCachedHeight:(double)a3
{
  self->_cachedHeight = a3;
}

- (double)preferredHeight
{
  double v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  int v11;
  double v12;
  double result;

  -[ICNoteEditorDateView cachedHeight](self, "cachedHeight");
  if (v3 == 0.0)
  {
    -[ICNoteEditorDateView superview](self, "superview");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "frame");
    v6 = v5;
    -[ICNoteEditorDateView label](self, "label");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setPreferredMaxLayoutWidth:", v6);

    -[ICNoteEditorDateView label](self, "label");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "intrinsicContentSize");
    v10 = v9;

    v11 = objc_msgSend(MEMORY[0x1E0DC3708], "ic_isVision");
    v12 = v10 + 20.0;
    if (!v11)
      v12 = v10;
    -[ICNoteEditorDateView setCachedHeight:](self, "setCachedHeight:", v12);
  }
  -[ICNoteEditorDateView cachedHeight](self, "cachedHeight");
  return result;
}

- (UIImageView)lockImageView
{
  return (UIImageView *)objc_loadWeakRetained((id *)&self->_lockImageView);
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ICNoteEditorDateView;
  -[ICNoteEditorDateView layoutSubviews](&v7, sel_layoutSubviews);
  -[ICNoteEditorDateView superview](self, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;
  -[ICNoteEditorDateView label](self, "label");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPreferredMaxLayoutWidth:", v5);

}

- (UILabel)label
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_label);
}

- (ICNoteDateFormatterController)formatterController
{
  return self->_formatterController;
}

- (void)formatter:(id)a3 textDidChange:(id)a4
{
  void *v5;
  void *v6;
  char v7;
  const __CFString *v8;
  void *v9;
  __CFString *v10;

  v10 = (__CFString *)a4;
  -[ICNoteEditorDateView label](self, "label");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", v10);

  if ((v7 & 1) == 0)
  {
    if (v10)
      v8 = v10;
    else
      v8 = &stru_1EA7E9860;
    -[ICNoteEditorDateView label](self, "label");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setText:", v8);

    -[ICNoteEditorDateView setCachedHeight:](self, "setCachedHeight:", 0.0);
  }
  -[ICNoteEditorDateView dateViewMaximumWidth](self, "dateViewMaximumWidth");
  -[ICNoteEditorDateView setDateViewMaximumWidthOnPreviousTextChange:](self, "setDateViewMaximumWidthOnPreviousTextChange:");

}

- (void)formatter:(id)a3 iconHiddenDidChange:(BOOL)a4
{
  _BOOL8 v4;
  id v5;

  v4 = a4;
  -[ICNoteEditorDateView lockImageView](self, "lockImageView", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidden:", v4);

}

- (double)dateViewMaximumWidth
{
  void *v2;
  double v3;
  double v4;

  -[ICNoteEditorDateView label](self, "label");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredMaxLayoutWidth");
  v4 = v3;

  return v4;
}

- (double)dateViewMaximumWidthOnPreviousTextChange
{
  return self->_dateViewMaximumWidthOnPreviousTextChange;
}

- (ICSelectorDelayer)dateViewLayoutUpdateDelayer
{
  return self->_dateViewLayoutUpdateDelayer;
}

- (id)dateViewAttributes
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v6 = *MEMORY[0x1E0DC1138];
  -[ICNoteEditorDateView label](self, "label");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "font");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (double)cachedHeight
{
  return self->_cachedHeight;
}

- (void)awakeFromNib
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  ICNoteDateFormatterController *v21;
  void *v22;
  void *v23;
  void *v24;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)ICNoteEditorDateView;
  -[ICNoteEditorDateView awakeFromNib](&v25, sel_awakeFromNib);
  -[ICNoteEditorDateView setCachedHeight:](self, "setCachedHeight:", 0.0);
  objc_msgSend(MEMORY[0x1E0DC1350], "ic_preferredFontForDateText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNoteEditorDateView label](self, "label");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFont:", v3);

  -[ICNoteEditorDateView label](self, "label");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "font");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "ic_fontHasSingleLineA");

  if ((v7 & 1) == 0)
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "[self.label.font ic_fontHasSingleLineA]", "-[ICNoteEditorDateView awakeFromNib]", 1, 0, CFSTR("font should have a single-line a attribute"));
  objc_msgSend(MEMORY[0x1E0DC3658], "ic_noteEditorSecondaryLabelColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNoteEditorDateView label](self, "label");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTextColor:", v8);

  -[ICNoteEditorDateView label](self, "label");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTextAlignment:", 1);

  -[ICNoteEditorDateView label](self, "label");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setText:", &stru_1EA7E9860);

  -[ICNoteEditorDateView label](self, "label");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "textColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNoteEditorDateView lockImageView](self, "lockImageView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTintColor:", v13);

  -[ICNoteEditorDateView lockImageView](self, "lockImageView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setContentMode:", 1);

  v16 = (void *)MEMORY[0x1E0DC3888];
  -[ICNoteEditorDateView label](self, "label");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "font");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "configurationWithFont:scale:", v18, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNoteEditorDateView lockImageView](self, "lockImageView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setPreferredSymbolConfiguration:", v19);

  v21 = objc_alloc_init(ICNoteDateFormatterController);
  -[ICNoteEditorDateView setFormatterController:](self, "setFormatterController:", v21);

  -[ICNoteEditorDateView formatterController](self, "formatterController");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setDelegate:", self);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addObserver:selector:name:object:", self, sel_contentSizeCategoryDidChange, *MEMORY[0x1E0DC48E8], 0);

  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel_dateViewDidTap_);
  -[ICNoteEditorDateView addGestureRecognizer:](self, "addGestureRecognizer:", v24);

}

- (void)_updateLayout
{
  id v2;

  -[ICNoteEditorDateView formatterController](self, "formatterController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateDate");

}

+ (id)newDateView
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromClass((Class)a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "loadNibNamed:owner:options:", v4, a1, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v15 != v9)
        objc_enumerationMutation(v6);
      v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v10);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      if (v8 == ++v10)
      {
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v8)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v12 = v11;

    if (v12)
      goto LABEL_12;
  }
  else
  {
LABEL_9:

  }
  objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "result != ((void *)0)", "+[ICNoteEditorDateView newDateView]", 1, 0, CFSTR("Unable to load date view"), (_QWORD)v14);
  v12 = 0;
LABEL_12:
  objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 1, (_QWORD)v14);

  return v12;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)ICNoteEditorDateView;
  -[ICNoteEditorDateView dealloc](&v4, sel_dealloc);
}

- (void)reset
{
  void *v3;
  void *v4;
  id v5;

  -[ICNoteEditorDateView setCachedHeight:](self, "setCachedHeight:", 0.0);
  -[ICNoteEditorDateView formatterController](self, "formatterController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNote:", 0);

  -[ICNoteEditorDateView note](self, "note");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[ICNoteEditorDateView formatterController](self, "formatterController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNote:", v5);

}

- (void)formatter:(id)a3 iconImageDidChange:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[ICNoteEditorDateView lockImageView](self, "lockImageView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setImage:", v5);

}

- (void)dateViewDidTap:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  id v17;
  CGRect v18;
  CGRect v19;

  v4 = a3;
  -[ICNoteEditorDateView label](self, "label");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationInView:", v5);
  v7 = v6;

  -[ICNoteEditorDateView label](self, "label");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  v18.origin.x = v10;
  v18.origin.y = v12;
  v18.size.width = v14;
  v18.size.height = v16;
  if (v7 > CGRectGetMinX(v18) + -5.0)
  {
    v19.origin.x = v10;
    v19.origin.y = v12;
    v19.size.width = v14;
    v19.size.height = v16;
    if (v7 < CGRectGetMaxX(v19) + 5.0)
    {
      -[ICNoteEditorDateView formatterController](self, "formatterController");
      v17 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "toggleVisibleDateType");

    }
  }
}

- (BOOL)iconHidden
{
  void *v2;
  char v3;

  -[ICNoteEditorDateView formatterController](self, "formatterController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "iconHidden");

  return v3;
}

- (UIFont)font
{
  void *v2;
  void *v3;

  -[ICNoteEditorDateView label](self, "label");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "font");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIFont *)v3;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityContainer
{
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ICNoteEditorDateView;
  -[ICNoteEditorDateView accessibilityContainer](&v7, sel_accessibilityContainer);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
    while (!objc_msgSend(v4, "conformsToProtocol:", &unk_1F04A7230))
    {
      objc_msgSend(v4, "accessibilityContainer");
      v5 = objc_claimAutoreleasedReturnValue();

      v4 = (id)v5;
      if (!v5)
        goto LABEL_8;
    }
    v4 = v4;

    v3 = v4;
  }
  else
  {
    v4 = 0;
  }
LABEL_8:

  return v3;
}

- (id)accessibilityElements
{
  return 0;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  if (-[ICNoteEditorDateView iconHidden](self, "iconHidden"))
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Locked Note"), &stru_1EA7E9860, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[ICNoteEditorDateView label](self, "label");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __ICAccessibilityStringForVariables();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)accessibilityUserInputLabels
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[5];

  v12[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Timestamp"), &stru_1EA7E9860, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v4;
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Created"), &stru_1EA7E9860, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v6;
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Edited"), &stru_1EA7E9860, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v8;
  -[ICNoteEditorDateView accessibilityLabel](self, "accessibilityLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[3] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)_accessibilityScrollToVisible
{
  _BOOL4 IsVoiceOverRunning;
  id v4;
  uint64_t v5;

  IsVoiceOverRunning = UIAccessibilityIsVoiceOverRunning();
  if (IsVoiceOverRunning)
  {
    -[ICNoteEditorDateView nextResponder](self, "nextResponder");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      while (1)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          break;
        objc_msgSend(v4, "nextResponder");
        v5 = objc_claimAutoreleasedReturnValue();

        v4 = (id)v5;
        if (!v5)
          goto LABEL_7;
      }
      v4 = v4;
    }
LABEL_7:
    objc_msgSend(v4, "showOverscrollContentAndScrollToTop");

  }
  return IsVoiceOverRunning;
}

- (void)contentSizeCategoryDidChange
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  -[ICNoteEditorDateView setCachedHeight:](self, "setCachedHeight:", 0.0);
  objc_msgSend(MEMORY[0x1E0DC1350], "ic_preferredFontForDateText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNoteEditorDateView label](self, "label");
  v4 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v4, "setFont:", v3);

  -[ICNoteEditorDateView label](self, "label");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "font");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v6, "ic_fontHasSingleLineA");

  if ((v4 & 1) == 0)
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "[self.label.font ic_fontHasSingleLineA]", "-[ICNoteEditorDateView contentSizeCategoryDidChange]", 1, 0, CFSTR("font should have a single-line a attribute"));
}

- (ICNote)note
{
  return self->_note;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateViewLayoutUpdateDelayer, 0);
  objc_storeStrong((id *)&self->_formatterController, 0);
  objc_destroyWeak((id *)&self->_lockImageView);
  objc_destroyWeak((id *)&self->_label);
  objc_storeStrong((id *)&self->_note, 0);
}

@end
