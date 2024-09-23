@implementation ICInlineAttachmentView

- (ICInlineAttachmentView)initWithTextAttachment:(id)a3 textContainer:(id)a4 forManualRendering:(BOOL)a5
{
  id v6;
  ICInlineAttachmentView *v7;
  ICInlineAttachmentView *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ICInlineAttachmentView;
  v7 = -[ICInlineAttachmentView initWithFrame:](&v15, sel_initWithFrame_, 0.0, 0.0, 300.0, 100.0);
  v8 = v7;
  if (v7)
  {
    v7->_textContainerWidth = 300.0;
    objc_storeWeak((id *)&v7->_textAttachment, v6);
    v9 = -[ICInlineAttachmentView isLinkAttachmentView](v8, "isLinkAttachmentView")
      || -[ICInlineAttachmentView isCalculateResultAttachmentView](v8, "isCalculateResultAttachmentView");
    -[ICInlineAttachmentView setUserInteractionEnabled:](v8, "setUserInteractionEnabled:", v9);
    if (-[ICInlineAttachmentView isUserInteractionEnabled](v8, "isUserInteractionEnabled"))
      -[ICInlineAttachmentView setupEventHandling](v8, "setupEventHandling");
    objc_msgSend(v6, "attachment");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "ic_permanentObjectID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:selector:name:object:", v8, sel_attachmentDataChanged_, *MEMORY[0x1E0D63728], v11);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObserver:selector:name:object:", v8, sel_objectDidUpdateShare_, CFSTR("ICCloudSyncingObjectDidUpdateShare"), v10);

    -[ICInlineAttachmentView setClipsToBounds:](v8, "setClipsToBounds:", 0);
  }

  return v8;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)ICInlineAttachmentView;
  -[ICInlineAttachmentView dealloc](&v4, sel_dealloc);
}

- (void)didMoveToWindow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ICInlineAttachmentView;
  -[ICInlineAttachmentView didMoveToWindow](&v3, sel_didMoveToWindow);
  if (ICInternalSettingsIsTextKit2Enabled())
    -[ICInlineAttachmentView animateInsertionIfNecessary](self, "animateInsertionIfNecessary");
}

- (CGSize)intrinsicContentSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[ICInlineAttachmentView label](self, "label");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "frame");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (UILabel)label
{
  UILabel *label;
  UILabel *v4;
  UILabel *v5;

  label = self->_label;
  if (!label)
  {
    -[ICInlineAttachmentView createNewLabel](self, "createNewLabel");
    v4 = (UILabel *)objc_claimAutoreleasedReturnValue();
    v5 = self->_label;
    self->_label = v4;

    -[ICInlineAttachmentView addSubview:](self, "addSubview:", self->_label);
    label = self->_label;
  }
  return label;
}

- (id)createNewLabel
{
  id v2;

  v2 = objc_alloc_init(MEMORY[0x1E0DC3990]);
  objc_msgSend(v2, "setNumberOfLines:", 1);
  objc_msgSend(v2, "setAdjustsFontSizeToFitWidth:", 0);
  objc_msgSend(v2, "setLineBreakMode:", 5);
  return v2;
}

- (void)attachmentDataChanged:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(a3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICInlineAttachmentView textAttachment](self, "textAttachment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "attachment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 == v7)
  {
    -[ICInlineAttachmentView textAttachment](self, "textAttachment");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "attachment");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "markDisplayTextNeedsUpdate");

    -[ICInlineAttachmentView updateLabel](self, "updateLabel");
  }
}

- (void)objectDidUpdateShare:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;
  uint64_t v14;
  id v15;

  v15 = a3;
  objc_opt_class();
  objc_msgSend(v15, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  ICCheckedDynamicCast();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICInlineAttachmentView textAttachment](self, "textAttachment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "attachment");
  v7 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v7, "note");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v7) = objc_msgSend(v9, "isEqual:", v5);

  if ((v7 & 1) != 0)
  {
LABEL_8:
    -[ICInlineAttachmentView updateLabel](self, "updateLabel");
    goto LABEL_9;
  }
  objc_msgSend(v8, "folder");
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (void *)v10;
    while (1)
    {
      objc_msgSend(v11, "objectID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isEqual:", v5);

      if ((v13 & 1) != 0)
        break;
      objc_msgSend(v11, "parent");
      v14 = objc_claimAutoreleasedReturnValue();

      v11 = (void *)v14;
      if (!v14)
        goto LABEL_9;
    }

    goto LABEL_8;
  }
LABEL_9:

}

- (void)updateLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double textContainerWidth;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  id v34;

  -[ICInlineAttachmentView textAttachment](self, "textAttachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attachment");
  v34 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v34, "uiModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSelected:", -[ICInlineAttachmentView isSelected](self, "isSelected"));
  -[ICInlineAttachmentView surroundingAttributes](self, "surroundingAttributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "attributedStringWithSurroundingAttributes:formatter:", v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICInlineAttachmentView surroundingAttributes](self, "surroundingAttributes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "highlightingAttributedString:withSurroundingAttributes:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICInlineAttachmentView highlightPatternRegexFinder](self, "highlightPatternRegexFinder");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "highlightingAttributedString:withRegexMatches:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICInlineAttachmentView label](self, "label");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAttributedText:", v10);

  -[ICInlineAttachmentView label](self, "label");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sizeToFit");

  -[ICInlineAttachmentView label](self, "label");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "frame");
  v15 = v14;
  textContainerWidth = self->_textContainerWidth;

  if (v15 > textContainerWidth)
  {
    -[ICInlineAttachmentView label](self, "label");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "frame");
    v19 = v18;
    v21 = v20;
    v23 = v22;

    v24 = self->_textContainerWidth;
    -[ICInlineAttachmentView label](self, "label");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setFrame:", v19, v21, v24, v23);

  }
  if ((ICInternalSettingsIsTextKit2Enabled() & 1) == 0)
  {
    -[ICInlineAttachmentView frame](self, "frame");
    v27 = v26;
    -[ICInlineAttachmentView frame](self, "frame");
    v29 = v28;
    -[ICInlineAttachmentView label](self, "label");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "frame");
    v32 = v31;
    -[ICInlineAttachmentView label](self, "label");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "frame");
    -[ICInlineAttachmentView setFrame:](self, "setFrame:", v27, v29, v32);

  }
}

- (void)setTextContainerWidth:(double)a3
{
  if (a3 > 0.0 && self->_textContainerWidth != a3)
  {
    self->_textContainerWidth = a3;
    -[ICInlineAttachmentView updateLabel](self, "updateLabel");
  }
}

- (void)updateStyleWithAttributes:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (v8)
  {
    -[ICInlineAttachmentView textAttachment](self, "textAttachment");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "attachment");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "uiModel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "filteredStyleAttributes:", v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICInlineAttachmentView setSurroundingAttributes:](self, "setSurroundingAttributes:", v7);

  }
  else
  {
    -[ICInlineAttachmentView setSurroundingAttributes:](self, "setSurroundingAttributes:", MEMORY[0x1E0C9AA70]);
  }
  -[ICInlineAttachmentView updateLabel](self, "updateLabel");

}

- (void)updateHighlightsWithAttributes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  -[ICInlineAttachmentView textAttachment](self, "textAttachment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "attachment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uiModel");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  -[ICInlineAttachmentView label](self, "label");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "attributedText");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "highlightingAttributedString:withSurroundingAttributes:", v8, v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICInlineAttachmentView label](self, "label");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAttributedText:", v9);

}

- (void)setSelected:(BOOL)a3
{
  if (self->_selected != a3)
  {
    self->_selected = a3;
    -[ICInlineAttachmentView updateLabel](self, "updateLabel");
  }
}

- (void)setHighlightPatternRegexFinder:(id)a3
{
  objc_storeStrong((id *)&self->_highlightPatternRegexFinder, a3);
  -[ICInlineAttachmentView updateLabel](self, "updateLabel");
}

- (double)baselineOffsetFromBottom
{
  void *v2;
  double v3;
  double v4;

  -[ICInlineAttachmentView label](self, "label");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_baselineOffsetFromBottom");
  v4 = v3;

  return v4;
}

- (void)animateInsertionIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[ICInlineAttachmentView textAttachment](self, "textAttachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attachment");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "animateInsertion"))
  {
    -[ICInlineAttachmentView label](self, "label");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "attributedText");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "string");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (+[ICAttributedStringRippler canAnimateString:](ICAttributedStringRippler, "canAnimateString:", v6))
    {
      -[ICInlineAttachmentView beginRippleAnimation](self, "beginRippleAnimation");
    }
    objc_msgSend(v7, "setAnimateInsertion:", 0);

  }
}

- (void)beginRippleAnimation
{
  void *v3;
  ICAttributedStringRippler *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  ICAttributedStringRippler *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  void *v17;
  void *v18;
  id v19;

  -[ICInlineAttachmentView rippler](self, "rippler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    -[ICInlineAttachmentView endRippleAnimation](self, "endRippleAnimation");
  v4 = [ICAttributedStringRippler alloc];
  -[ICInlineAttachmentView label](self, "label");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "attributedText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICInlineAttachmentView textAttachment](self, "textAttachment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "attachment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "animatableRange");
  v11 = -[ICAttributedStringRippler initWithAttributedString:animatedRange:](v4, "initWithAttributedString:animatedRange:", v6, v9, v10);
  -[ICInlineAttachmentView setRippler:](self, "setRippler:", v11);

  -[ICInlineAttachmentView rippler](self, "rippler");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "start");

  -[ICInlineAttachmentView rippleAnimationTimer](self, "rippleAnimationTimer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "displayLinkWithTarget:selector:", self, sel_updateRippleAnimation);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICInlineAttachmentView setRippleAnimationTimer:](self, "setRippleAnimationTimer:", v15);

    v16 = +[ICAttributedStringRippler framesPerSecond](ICAttributedStringRippler, "framesPerSecond");
    -[ICInlineAttachmentView rippleAnimationTimer](self, "rippleAnimationTimer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setPreferredFramesPerSecond:", v16);

    -[ICInlineAttachmentView rippleAnimationTimer](self, "rippleAnimationTimer");
    v19 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addToRunLoop:forMode:", v18, *MEMORY[0x1E0C99748]);

  }
}

- (void)endRippleAnimation
{
  void *v3;
  void *v4;

  -[ICInlineAttachmentView rippleAnimationTimer](self, "rippleAnimationTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  -[ICInlineAttachmentView setRippleAnimationTimer:](self, "setRippleAnimationTimer:", 0);
  -[ICInlineAttachmentView updateLabel](self, "updateLabel");
  -[ICInlineAttachmentView delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "redrawInlineAttachmentView:", self);

  -[ICInlineAttachmentView setRippler:](self, "setRippler:", 0);
}

- (void)updateRippleAnimation
{
  void *v3;
  uint64_t v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  id v21;

  -[ICInlineAttachmentView rippler](self, "rippler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "currentTimeIndex");

  -[ICInlineAttachmentView rippler](self, "rippler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "finishedForTimeIndex:", v4);

  if (v6)
  {
    -[ICInlineAttachmentView endRippleAnimation](self, "endRippleAnimation");
  }
  else
  {
    -[ICInlineAttachmentView rippler](self, "rippler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "attributedStringForTimeIndex:", v4);
    v21 = (id)objc_claimAutoreleasedReturnValue();

    -[ICInlineAttachmentView label](self, "label");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAttributedText:", v21);

    -[ICInlineAttachmentView label](self, "label");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sizeToFit");

    -[ICInlineAttachmentView label](self, "label");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "frame");
    v12 = v11;
    v14 = v13;
    v16 = v15;

    -[ICInlineAttachmentView frame](self, "frame");
    v18 = (v17 - v16) / 3.0 + (v17 - v16) / 3.0;
    -[ICInlineAttachmentView label](self, "label");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setFrame:", v12, v18, v14, v16);

    -[ICInlineAttachmentView delegate](self, "delegate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "redrawInlineAttachmentView:", self);

  }
}

- (void)setupEventHandling
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  if (-[ICInlineAttachmentView isLinkAttachmentView](self, "isLinkAttachmentView")
    || -[ICInlineAttachmentView isCalculateResultAttachmentView](self, "isCalculateResultAttachmentView"))
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel_respondToTapGesture_);
    objc_msgSend(v3, "setDelegate:", self);
    objc_msgSend(v3, "setNumberOfTapsRequired:", 1);
    -[ICInlineAttachmentView addGestureRecognizer:](self, "addGestureRecognizer:", v3);

  }
  if (-[ICInlineAttachmentView isLinkAttachmentView](self, "isLinkAttachmentView")
    || -[ICInlineAttachmentView isCalculateResultAttachmentView](self, "isCalculateResultAttachmentView"))
  {
    -[ICInlineAttachmentView contextInteraction](self, "contextInteraction");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC36C0]), "initWithDelegate:", self);
      -[ICInlineAttachmentView setContextInteraction:](self, "setContextInteraction:", v5);

      -[ICInlineAttachmentView contextInteraction](self, "contextInteraction");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      -[ICInlineAttachmentView addInteraction:](self, "addInteraction:", v6);

    }
  }
}

- (void)respondToTapGesture:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (-[ICInlineAttachmentView isLinkAttachmentView](self, "isLinkAttachmentView"))
  {
    -[ICInlineAttachmentView textAttachment](self, "textAttachment");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "attachment");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "tokenContentIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NotesAppURLForNoteIdentifierOrTokenContentIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7 && (objc_opt_respondsToSelector() & 1) != 0)
      -[ICInlineAttachmentView openURL:](self, "openURL:", v7);
    goto LABEL_7;
  }
  if (-[ICInlineAttachmentView isCalculateResultAttachmentView](self, "isCalculateResultAttachmentView"))
  {
    -[ICInlineAttachmentView contextInteraction](self, "contextInteraction");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "location");
    objc_msgSend(v7, "_presentMenuAtLocation:");
LABEL_7:

  }
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  if (-[ICInlineAttachmentView isLinkAttachmentView](self, "isLinkAttachmentView", a3, a4.x, a4.y))
  {
    objc_opt_class();
    -[ICInlineAttachmentView textAttachment](self, "textAttachment");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    ICDynamicCast();
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "linkMenuDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICInlineAttachmentView textAttachment](self, "textAttachment");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "attachment");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "contextMenuInteraction:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (!-[ICInlineAttachmentView isCalculateResultAttachmentView](self, "isCalculateResultAttachmentView"))
    {
      v10 = 0;
      return v10;
    }
    -[ICInlineAttachmentView textAttachment](self, "textAttachment");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "attachment");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "note");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "calculateDocumentController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      v10 = 0;
      goto LABEL_7;
    }
    objc_msgSend(v7, "updateAffectingChangeCounts:", 0);
    objc_msgSend(v7, "contextMenuForResultAttachment:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_7:
  return v10;
}

- (void)contextMenuInteraction:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  id v12;

  v6 = a5;
  if (-[ICInlineAttachmentView isLinkAttachmentView](self, "isLinkAttachmentView"))
  {
    -[ICInlineAttachmentView textAttachment](self, "textAttachment");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "attachment");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "tokenContentIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NotesAppURLForNoteIdentifierOrTokenContentIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __107__ICInlineAttachmentView_contextMenuInteraction_willPerformPreviewActionForMenuWithConfiguration_animator___block_invoke;
      v11[3] = &unk_1E5C1D9A8;
      v11[4] = self;
      v12 = v10;
      objc_msgSend(v6, "addCompletion:", v11);

    }
  }

}

uint64_t __107__ICInlineAttachmentView_contextMenuInteraction_willPerformPreviewActionForMenuWithConfiguration_animator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "openURL:", *(_QWORD *)(a1 + 40));
}

- (BOOL)isLinkAttachmentView
{
  void *v2;
  void *v3;
  char v4;

  -[ICInlineAttachmentView textAttachment](self, "textAttachment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isLinkAttachment");

  return v4;
}

- (BOOL)isCalculateResultAttachmentView
{
  void *v2;
  void *v3;
  char v4;

  -[ICInlineAttachmentView textAttachment](self, "textAttachment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isCalculateResultAttachment");

  return v4;
}

- (id)imageForTextPreviewInRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  void *v6;
  void *v7;
  void *v8;
  NSUInteger v9;
  NSRange v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  double v21;
  double v22;
  void *v23;
  id v24;
  void *v25;
  _QWORD v27[4];
  id v28;
  ICInlineAttachmentView *v29;
  _QWORD v30[2];
  _QWORD v31[2];
  uint64_t v32;
  _QWORD v33[2];
  NSRange v34;
  NSRange v35;

  length = a3.length;
  location = a3.location;
  v33[1] = *MEMORY[0x1E0C80C00];
  -[ICInlineAttachmentView label](self, "label");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "attributedText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  v35.location = objc_msgSend(v8, "ic_range");
  v35.length = v9;
  v34.location = location;
  v34.length = length;
  v10 = NSIntersectionRange(v34, v35);
  v32 = *MEMORY[0x1E0DC1140];
  v11 = v32;
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, &v32, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v8, "ic_range");
  objc_msgSend(v8, "addAttributes:range:", v13, v14, v15);

  v30[0] = v11;
  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v16;
  v30[1] = *MEMORY[0x1E0DC1100];
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v31[1] = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addAttributes:range:", v18, v10.location, v10.length);

  objc_msgSend(MEMORY[0x1E0DC3830], "defaultFormat");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_alloc(MEMORY[0x1E0DC3828]);
  -[ICInlineAttachmentView bounds](self, "bounds");
  v23 = (void *)objc_msgSend(v20, "initWithSize:format:", v19, v21, v22);
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __53__ICInlineAttachmentView_imageForTextPreviewInRange___block_invoke;
  v27[3] = &unk_1E5C1D568;
  v28 = v8;
  v29 = self;
  v24 = v8;
  objc_msgSend(v23, "imageWithActions:", v27);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

uint64_t __53__ICInlineAttachmentView_imageForTextPreviewInRange___block_invoke(uint64_t a1)
{
  void *v1;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "bounds");
  return objc_msgSend(v1, "drawInRect:");
}

- (UIImage)imageForPrinting
{
  CGFloat v3;
  CGFloat v4;
  void *v5;
  CGSize v7;

  -[ICInlineAttachmentView setOverrideUserInterfaceStyle:](self, "setOverrideUserInterfaceStyle:", 1);
  -[ICInlineAttachmentView bounds](self, "bounds");
  v7.width = v3;
  v7.height = v4;
  UIGraphicsBeginImageContextWithOptions(v7, 0, 0.0);
  -[ICInlineAttachmentView bounds](self, "bounds");
  -[ICInlineAttachmentView drawViewHierarchyInRect:afterScreenUpdates:](self, "drawViewHierarchyInRect:afterScreenUpdates:", 1);
  UIGraphicsGetImageFromCurrentImageContext();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  -[ICInlineAttachmentView setOverrideUserInterfaceStyle:](self, "setOverrideUserInterfaceStyle:", 0);
  return (UIImage *)v5;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityAttributedLabel
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB3498];
  -[ICInlineAttachmentView label](self, "label");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "icaxAttributedStringForSpeakingStringInLowerPitch:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)ICInlineAttachmentView;
  v3 = -[ICInlineAttachmentView accessibilityTraits](&v10, sel_accessibilityTraits);
  -[ICInlineAttachmentView textAttachment](self, "textAttachment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "attachment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "typeUTI");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0D63878]);

  v8 = *MEMORY[0x1E0DC4688];
  if (!v7)
    v8 = 0;
  return v8 | v3;
}

- (UIContextMenuInteraction)contextInteraction
{
  return self->_contextInteraction;
}

- (void)setContextInteraction:(id)a3
{
  objc_storeStrong((id *)&self->_contextInteraction, a3);
}

- (ICInlineTextAttachment)textAttachment
{
  return (ICInlineTextAttachment *)objc_loadWeakRetained((id *)&self->_textAttachment);
}

- (void)setTextAttachment:(id)a3
{
  objc_storeWeak((id *)&self->_textAttachment, a3);
}

- (double)textContainerWidth
{
  return self->_textContainerWidth;
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (NSDictionary)surroundingAttributes
{
  return self->_surroundingAttributes;
}

- (void)setSurroundingAttributes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 448);
}

- (ICSearchResultRegexMatchFinder)highlightPatternRegexFinder
{
  return self->_highlightPatternRegexFinder;
}

- (ICInlineAttachmentViewAnimationDelegate)delegate
{
  return (ICInlineAttachmentViewAnimationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (CADisplayLink)rippleAnimationTimer
{
  return self->_rippleAnimationTimer;
}

- (void)setRippleAnimationTimer:(id)a3
{
  objc_storeStrong((id *)&self->_rippleAnimationTimer, a3);
}

- (ICAttributedStringRippler)rippler
{
  return self->_rippler;
}

- (void)setRippler:(id)a3
{
  objc_storeStrong((id *)&self->_rippler, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rippler, 0);
  objc_storeStrong((id *)&self->_rippleAnimationTimer, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_highlightPatternRegexFinder, 0);
  objc_storeStrong((id *)&self->_surroundingAttributes, 0);
  objc_destroyWeak((id *)&self->_textAttachment);
  objc_storeStrong((id *)&self->_contextInteraction, 0);
}

@end
