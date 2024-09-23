@implementation CKBalloonTextView

- (void)setShouldAdjustInsetsForMinimumSize:(BOOL)a3
{
  self->_shouldAdjustInsetsForMinimumSize = a3;
}

- (void)setInteractionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_interactionDelegate, a3);
}

+ (id)makeTextView
{
  void *v3;
  void *v4;

  +[CKBalloonTextViewConfiguration defaultConfiguration](CKBalloonTextViewConfiguration, "defaultConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "makeTextViewUsingConfiguration:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (void)_commonTextViewContainerSetup:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "setSize:", 0.0, 1.79769313e308);
  objc_msgSend(v3, "setWidthTracksTextView:", 1);
  objc_msgSend(v3, "setHeightTracksTextView:", 1);

}

- (void)setFakeSelected:(BOOL)a3
{
  if (self->_fakeSelected != a3)
  {
    self->_fakeSelected = a3;
    if (a3)
      -[CKBalloonTextView _setFakeSelectionBackgroundColor](self, "_setFakeSelectionBackgroundColor");
    else
      -[CKBalloonTextView _removeFakeSelectionBackgroundColor](self, "_removeFakeSelectionBackgroundColor");
  }
}

- (void)setBalloonTextSelectedRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  length = a3.length;
  location = a3.location;
  if (-[CKBalloonTextView isFirstResponder](self, "isFirstResponder"))
  {
    -[CKBalloonTextView setSelectedRange:](self, "setSelectedRange:", location, length);
  }
  else
  {
    -[CKBalloonTextView _selectedRange](self, "_selectedRange");
    if (v6)
      -[CKBalloonTextView _removeFakeSelectionBackgroundColor](self, "_removeFakeSelectionBackgroundColor");
    -[CKBalloonTextView set_selectedRange:](self, "set_selectedRange:", location, length);
    -[CKBalloonTextView _selectedRange](self, "_selectedRange");
    if (v7)
    {
      v8 = -[CKBalloonTextView _selectedRange](self, "_selectedRange");
      -[CKBalloonTextView _setFakeSelectionBackgroundColorForRange:](self, "_setFakeSelectionBackgroundColorForRange:", v8, v9);
    }
  }
}

- (_NSRange)_selectedRange
{
  _NSRange *p_selectedRange;
  NSUInteger location;
  NSUInteger length;
  _NSRange result;

  p_selectedRange = &self->__selectedRange;
  location = self->__selectedRange.location;
  length = p_selectedRange->length;
  result.length = length;
  result.location = location;
  return result;
}

- (void)set_selectedRange:(_NSRange)a3
{
  self->__selectedRange = a3;
}

- (BOOL)resignFirstResponder
{
  uint64_t v3;
  uint64_t v4;
  BOOL v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v9;

  v3 = -[CKBalloonTextView selectedRange](self, "selectedRange");
  -[CKBalloonTextView set_selectedRange:](self, "set_selectedRange:", v3, v4);
  v9.receiver = self;
  v9.super_class = (Class)CKBalloonTextView;
  v5 = -[CKBalloonTextView resignFirstResponder](&v9, sel_resignFirstResponder);
  v6 = -[CKBalloonTextView _selectedRange](self, "_selectedRange");
  -[CKBalloonTextView _setFakeSelectionBackgroundColorForRange:](self, "_setFakeSelectionBackgroundColorForRange:", v6, v7);
  return v5;
}

- (void)_setFakeSelectionBackgroundColorForRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  void *v6;
  void *v7;
  NSUInteger v8;
  NSRange v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;
  NSRange v22;
  NSRange v23;
  NSRange v24;
  NSRange v25;

  v21 = *MEMORY[0x1E0C80C00];
  if (a3.length)
  {
    length = a3.length;
    location = a3.location;
    -[CKBalloonTextView attributedText](self, "attributedText");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "mutableCopy");

    v8 = objc_msgSend(v7, "length");
    v22.location = location;
    v22.length = length;
    v25.location = 0;
    v25.length = v8;
    v9 = NSIntersectionRange(v22, v25);
    if (location != v9.location || length != v9.length)
    {
      IMLogHandleForCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v23.location = 0;
        v23.length = v8;
        NSStringFromRange(v23);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v24.location = location;
        v24.length = length;
        NSStringFromRange(v24);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromRange(v9);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 138412802;
        v16 = v12;
        v17 = 2112;
        v18 = v13;
        v19 = 2112;
        v20 = v14;
        _os_log_error_impl(&dword_18DFCD000, v10, OS_LOG_TYPE_ERROR, "Attempted to add selection on textRange: %@ with invalid range: %@, corrected to validatedRange: %@", (uint8_t *)&v15, 0x20u);

      }
    }
    -[CKBalloonTextView _removeFakeSelectionBackgroundColor](self, "_removeFakeSelectionBackgroundColor");
    -[CKBalloonTextView _fakeSelectionBackgroundColor](self, "_fakeSelectionBackgroundColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
      objc_msgSend(v7, "addAttribute:value:range:", *MEMORY[0x1E0DC1100], v11, v9.location, v9.length);
    -[CKBalloonTextView setAttributedText:](self, "setAttributedText:", v7);

  }
}

+ (id)makeTextViewUsingConfiguration:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;

  v4 = a3;
  if (objc_msgSend(v4, "textKit2Enabled"))
    objc_msgSend(a1, "makeTextViewUsingTextKit2UsingConfiguration:", v4);
  else
    objc_msgSend(a1, "makeTextViewUsingTextKit1");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setShowsVerticalScrollIndicator:", 0);
  objc_msgSend(v5, "setShowsHorizontalScrollIndicator:", 0);
  objc_msgSend(v5, "setBackgroundColor:", 0);
  objc_msgSend(v5, "setContentMode:", 11);
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "enableBalloonTextSelection");

  if (v7)
  {
    objc_msgSend(v5, "setSelectable:", 1);
    objc_msgSend(v5, "setTextLoupeVisibility:", 1);
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA7F8]), "initWithTarget:action:", v5, sel_panGestureRecognized_);
    objc_msgSend(v8, "setDelegate:", v5);
    objc_msgSend(v8, "setCancelsTouchesInView:", 0);
    objc_msgSend(v8, "setName:", CFSTR("panGestureRecognizer"));
    objc_msgSend(v8, "setRequiresExclusiveTouchType:", 0);
    objc_msgSend(v8, "setAllowedScrollTypesMask:", 3);
    objc_msgSend(v5, "addGestureRecognizer:", v8);
    objc_msgSend(v5, "setDragGestureRecognizer:", v8);

  }
  else
  {
    objc_msgSend(v5, "setUserInteractionEnabled:", 0);
  }
  objc_msgSend(v5, "setLinkTextAttributes:", MEMORY[0x1E0C9AA70]);

  return v5;
}

+ (id)makeTextViewUsingTextKit2UsingConfiguration:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  CKTextStorage *v7;
  id v8;
  id v9;
  int v10;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;

  v4 = (objc_class *)MEMORY[0x1E0DC12C8];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  v7 = objc_alloc_init(CKTextStorage);
  objc_msgSend(v6, "setTextStorage:", v7);

  v8 = objc_alloc_init(MEMORY[0x1E0DC12F0]);
  v9 = objc_alloc_init(MEMORY[0x1E0DC12C0]);
  objc_msgSend(v8, "setTextContainer:", v9);
  objc_msgSend(v6, "addTextLayoutManager:", v8);
  v10 = objc_msgSend(a1, "instancesRespondToSelector:", sel_initReadonlyAndUnselectableWithFrame_textContainer_textLayoutManagerEnabled_);
  v11 = objc_alloc((Class)a1);
  v12 = *MEMORY[0x1E0C9D648];
  v13 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v14 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v15 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  if (v10)
    v16 = objc_msgSend(v11, "initReadonlyAndUnselectableWithFrame:textContainer:textLayoutManagerEnabled:", v9, 1, v12, v13, v14, v15);
  else
    v16 = objc_msgSend(v11, "initWithFrame:textContainer:", v9, v12, v13, v14, v15);
  v17 = (void *)v16;
  v18 = objc_msgSend(v5, "expressiveTextEnabled");

  if (v18)
  {
    if ((objc_msgSend(MEMORY[0x1E0CEAB18], "ck_supportsDynamicallyTogglingAllowsTextAnimations") & 1) == 0)
      objc_msgSend(v17, "setAllowsTextAnimations:", 1);
    objc_msgSend(v17, "textLayoutManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setRequiresCTLineRef:", 1);

  }
  objc_msgSend(v17, "textContainer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_commonTextViewContainerSetup:", v20);

  if ((v10 & 1) == 0)
  {
    objc_msgSend(v17, "setSelectable:", 0);
    objc_msgSend(v17, "setEditable:", 0);
    objc_msgSend(v17, "setScrollEnabled:", 0);
  }

  return v17;
}

+ (id)makeTextViewUsingTextKit1
{
  id v3;
  CKTextStorage *v4;
  id v5;
  int v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  void *v13;

  v3 = objc_alloc_init(MEMORY[0x1E0DC12C0]);
  objc_msgSend(a1, "_commonTextViewContainerSetup:", v3);
  v4 = objc_alloc_init(CKTextStorage);
  v5 = objc_alloc_init(MEMORY[0x1E0DC1280]);
  objc_msgSend(v5, "setAllowsNonContiguousLayout:", 1);
  objc_msgSend(v5, "addTextContainer:", v3);
  -[CKTextStorage addLayoutManager:](v4, "addLayoutManager:", v5);
  v6 = objc_msgSend(a1, "instancesRespondToSelector:", sel_initReadonlyAndUnselectableWithFrame_textContainer_textLayoutManagerEnabled_);
  v7 = objc_alloc((Class)a1);
  v8 = *MEMORY[0x1E0C9D648];
  v9 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v10 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v11 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  if (v6)
    v12 = objc_msgSend(v7, "initReadonlyAndUnselectableWithFrame:textContainer:textLayoutManagerEnabled:", v3, 0, v8, v9, v10, v11);
  else
    v12 = objc_msgSend(v7, "initReadonlyAndUnselectableWithFrame:textContainer:", v3, v8, v9, v10, v11);
  v13 = (void *)v12;

  return v13;
}

- (id)selectionHighlightColor
{
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  -[CKBalloonTextView superview](self, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[CKBalloonTextView superview](self, "superview");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "theme");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "selectionHighlightColorOverrideForColorType:", objc_msgSend(v5, "color"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    return v8;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)CKBalloonTextView;
    -[CKBalloonTextView selectionHighlightColor](&v10, sel_selectionHighlightColor);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  CGPoint v14;
  CGSize v15;
  CGRect v16;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKBalloonTextView frame](self, "frame");
  NSStringFromCGRect(v16);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CKBalloonTextView clipsToBounds](self, "clipsToBounds"))
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  if (-[CKBalloonTextView isOpaque](self, "isOpaque"))
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  if (-[CKBalloonTextView isUserInteractionEnabled](self, "isUserInteractionEnabled"))
    v9 = CFSTR("YES");
  else
    v9 = CFSTR("NO");
  -[CKBalloonTextView contentOffset](self, "contentOffset");
  NSStringFromCGPoint(v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKBalloonTextView contentSize](self, "contentSize");
  NSStringFromCGSize(v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; frame = %@; clipsToBounds = %@; opaque = %@; userInteractionEnabled = %@; contentOffset = %@; contentSize = %@>"),
    v5,
    self,
    v6,
    v7,
    v8,
    v9,
    v10,
    v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v12;
}

- (id)initReadonlyAndUnselectableWithFrame:(CGRect)a3 textContainer:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CKBalloonTextView;
  v4 = -[CKBalloonTextView initReadonlyAndUnselectableWithFrame:textContainer:](&v11, sel_initReadonlyAndUnselectableWithFrame_textContainer_, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v4)
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "balloonTextContainerInset");
    objc_msgSend(v4, "setTextContainerInset:");

    objc_msgSend(v4, "textContainer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "balloonLineFragmentPadding");
    objc_msgSend(v6, "setLineFragmentPadding:");

    objc_msgSend(v4, "layoutManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setBackgroundLayoutEnabled:", 0);

    objc_msgSend(v4, "layoutManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setSynchronizesAlignmentToDirection:", 1);

    objc_msgSend(v4, "setShouldPresentSheetsInAWindowLayeredAboveTheKeyboard:", 1);
    objc_msgSend(v4, "registerForEvents");
  }
  return v4;
}

- (void)didMoveToWindow
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKBalloonTextView;
  -[CKBalloonTextView didMoveToWindow](&v4, sel_didMoveToWindow);
  -[CKBalloonTextView attributedText](self, "attributedText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKBalloonTextView _displayAttributedTextIfPossible:applyHyphenation:](self, "_displayAttributedTextIfPossible:applyHyphenation:", v3, 1);

}

- (void)viewDidMoveToSuperview
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKBalloonTextView;
  -[CKBalloonTextView viewDidMoveToSuperview](&v4, sel_viewDidMoveToSuperview);
  -[CKBalloonTextView attributedText](self, "attributedText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKBalloonTextView _displayAttributedTextIfPossible:applyHyphenation:](self, "_displayAttributedTextIfPossible:applyHyphenation:", v3, 1);

}

- (void)_displayAttributedTextIfPossible:(id)a3 applyHyphenation:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  char v11;
  id v12;
  uint64_t v13;
  objc_super v14;

  v4 = a4;
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isTextKit2Enabled");

  if (v8)
    -[CKBalloonTextView superview](self, "superview");
  else
    -[CKBalloonTextView window](self, "window");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKPrintController sharedInstance](CKPrintController, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isPrinting");

  if ((v11 & 1) != 0 || v9)
  {
    v12 = v6;
    if (v4)
    {
      -[CKBalloonTextView _textWithHyphenationAppliedForAttributedText:](self, "_textWithHyphenationAppliedForAttributedText:", v12);
      v13 = objc_claimAutoreleasedReturnValue();

      v12 = (id)v13;
    }
    v14.receiver = self;
    v14.super_class = (Class)CKBalloonTextView;
    -[CKBalloonTextView setAttributedText:](&v14, sel_setAttributedText_, v12);

  }
}

- (void)setAttributedText:(id)a3
{
  NSAttributedString *v4;
  NSAttributedString *attributedText;

  if (self->_attributedText != a3)
  {
    -[CKBalloonTextView _textWithHyphenationAppliedForAttributedText:](self, "_textWithHyphenationAppliedForAttributedText:");
    v4 = (NSAttributedString *)objc_claimAutoreleasedReturnValue();
    attributedText = self->_attributedText;
    self->_attributedText = v4;

    -[CKBalloonTextView _displayAttributedTextIfPossible:applyHyphenation:](self, "_displayAttributedTextIfPossible:applyHyphenation:", self->_attributedText, 0);
  }
}

- (id)_textWithHyphenationAppliedForAttributedText:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_msgSend(a3, "mutableCopy");
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "balloonParagraphStyle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0DC1290], "defaultParagraphStyle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v3, "addAttribute:value:range:", *MEMORY[0x1E0DC1178], v5, 0, objc_msgSend(v3, "length"));

  return v3;
}

- (void)copy:(id)a3
{
  id v4;

  -[CKBalloonTextView interactionDelegate](self, "interactionDelegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "interactionTextViewShouldCopyToPasteboard:", self);

}

- (BOOL)canBecomeFocused
{
  return 0;
}

- (CGSize)sizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4 isSingleLine:(BOOL *)a5 isReplyPreview:(BOOL)a6
{
  _BOOL8 v6;
  double height;
  double width;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGSize result;

  v6 = a6;
  height = a3.height;
  width = a3.width;
  -[CKBalloonTextView attributedText](self, "attributedText");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKBalloonTextView textContainer](self, "textContainer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKBalloonTextView sizeThatFits:attributedText:maximumNumberOfLines:lineBreakMode:isReplyPreview:outTextAlignmentInsets:outIsSingleLine:](CKBalloonTextView, "sizeThatFits:attributedText:maximumNumberOfLines:lineBreakMode:isReplyPreview:outTextAlignmentInsets:outIsSingleLine:", v12, objc_msgSend(v13, "maximumNumberOfLines"), objc_msgSend(v13, "lineBreakMode"), v6, a4, a5, width, height);
  v15 = v14;
  v17 = v16;

  v18 = v15;
  v19 = v17;
  result.height = v19;
  result.width = v18;
  return result;
}

+ (CGSize)sizeThatFits:(CGSize)a3 attributedText:(id)a4 maximumNumberOfLines:(unint64_t)a5 lineBreakMode:(int64_t)a6 isReplyPreview:(BOOL)a7 outTextAlignmentInsets:(UIEdgeInsets *)a8 outIsSingleLine:(BOOL *)a9
{
  _BOOL8 v11;
  double height;
  double width;
  void *v17;
  id v18;
  void *v19;
  int v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGSize result;

  v11 = a7;
  height = a3.height;
  width = a3.width;
  v17 = (void *)MEMORY[0x1E0D39840];
  v18 = a4;
  objc_msgSend(v17, "sharedFeatureFlags");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "isTextKit2Enabled");

  if (v20)
    objc_msgSend(a1, "_textKit2_sizeThatFits:attributedText:maximumNumberOfLines:lineBreakMode:isReplyPreview:outTextAlignmentInsets:outIsSingleLine:", v18, a5, a6, v11, a8, a9, width, height);
  else
    objc_msgSend(a1, "_textKit1_sizeThatFits:attributedText:maximumNumberOfLines:lineBreakMode:isReplyPreview:outTextAlignmentInsets:outIsSingleLine:", v18, a5, a6, v11, a8, a9, width, height);
  v23 = v21;
  v24 = v22;

  v25 = v23;
  v26 = v24;
  result.height = v26;
  result.width = v25;
  return result;
}

+ (CGSize)_textKit1_sizeThatFits:(CGSize)a3 attributedText:(id)a4 maximumNumberOfLines:(unint64_t)a5 lineBreakMode:(int64_t)a6 isReplyPreview:(BOOL)a7 outTextAlignmentInsets:(UIEdgeInsets *)a8 outIsSingleLine:(BOOL *)a9
{
  _BOOL4 v11;
  double width;
  id v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  double v35;
  double v36;
  CGSize result;

  v11 = a7;
  width = a3.width;
  v15 = a4;
  if (_textKit1_sizeThatFits_attributedText_maximumNumberOfLines_lineBreakMode_isReplyPreview_outTextAlignmentInsets_outIsSingleLine__once != -1)
    dispatch_once(&_textKit1_sizeThatFits_attributedText_maximumNumberOfLines_lineBreakMode_isReplyPreview_outTextAlignmentInsets_outIsSingleLine__once, &__block_literal_global_258);
  objc_msgSend((id)_textKit1_sizeThatFits_attributedText_maximumNumberOfLines_lineBreakMode_isReplyPreview_outTextAlignmentInsets_outIsSingleLine__sSizingTextContainer, "setMaximumNumberOfLines:", a5);
  objc_msgSend((id)_textKit1_sizeThatFits_attributedText_maximumNumberOfLines_lineBreakMode_isReplyPreview_outTextAlignmentInsets_outIsSingleLine__sSizingTextContainer, "setLineBreakMode:", a6);
  if (v15)
  {
    objc_msgSend((id)_textKit1_sizeThatFits_attributedText_maximumNumberOfLines_lineBreakMode_isReplyPreview_outTextAlignmentInsets_outIsSingleLine__sSizingTextStorage, "beginEditing");
    objc_msgSend((id)_textKit1_sizeThatFits_attributedText_maximumNumberOfLines_lineBreakMode_isReplyPreview_outTextAlignmentInsets_outIsSingleLine__sSizingTextStorage, "setAttributedString:", v15);
    objc_msgSend((id)_textKit1_sizeThatFits_attributedText_maximumNumberOfLines_lineBreakMode_isReplyPreview_outTextAlignmentInsets_outIsSingleLine__sSizingTextStorage, "endEditing");
  }
  objc_msgSend((id)_textKit1_sizeThatFits_attributedText_maximumNumberOfLines_lineBreakMode_isReplyPreview_outTextAlignmentInsets_outIsSingleLine__sSizingTextContainer, "lineFragmentPadding");
  v17 = width + v16 * 2.0;
  objc_msgSend((id)_textKit1_sizeThatFits_attributedText_maximumNumberOfLines_lineBreakMode_isReplyPreview_outTextAlignmentInsets_outIsSingleLine__sSizingTextContainer, "setSize:", v17, 1.79769313e308);
  objc_msgSend((id)_textKit1_sizeThatFits_attributedText_maximumNumberOfLines_lineBreakMode_isReplyPreview_outTextAlignmentInsets_outIsSingleLine__sSizingTextContainer, "sizeThatFits:textAlignmentInsets:isSingleLine:", a8, a9, v17, 1.79769313e308);
  v19 = v18;
  v21 = v20;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22;
  if (v11)
    objc_msgSend(v22, "replyBalloonTextContainerInset");
  else
    objc_msgSend(v22, "balloonTextContainerInset");
  v28 = v24;
  v29 = v25;
  v30 = v26;
  v31 = v27;

  if (a8)
  {
    v32 = v29 + a8->left;
    v33 = v30 + a8->bottom;
    v34 = v31 + a8->right;
    a8->top = v28 + a8->top;
    a8->left = v32;
    a8->bottom = v33;
    a8->right = v34;
  }

  v35 = v19 + v29 + v31;
  v36 = v21 + v28 + v30;
  result.height = v36;
  result.width = v35;
  return result;
}

uint64_t __148__CKBalloonTextView__textKit1_sizeThatFits_attributedText_maximumNumberOfLines_lineBreakMode_isReplyPreview_outTextAlignmentInsets_outIsSingleLine___block_invoke()
{
  id v0;
  void *v1;
  id v2;
  void *v3;
  CKTextStorage *v4;
  void *v5;
  void *v6;
  void *v7;

  v0 = objc_alloc_init(MEMORY[0x1E0DC1280]);
  v1 = (void *)_textKit1_sizeThatFits_attributedText_maximumNumberOfLines_lineBreakMode_isReplyPreview_outTextAlignmentInsets_outIsSingleLine__sSizingLayoutManager;
  _textKit1_sizeThatFits_attributedText_maximumNumberOfLines_lineBreakMode_isReplyPreview_outTextAlignmentInsets_outIsSingleLine__sSizingLayoutManager = (uint64_t)v0;

  v2 = objc_alloc_init(MEMORY[0x1E0DC12C0]);
  v3 = (void *)_textKit1_sizeThatFits_attributedText_maximumNumberOfLines_lineBreakMode_isReplyPreview_outTextAlignmentInsets_outIsSingleLine__sSizingTextContainer;
  _textKit1_sizeThatFits_attributedText_maximumNumberOfLines_lineBreakMode_isReplyPreview_outTextAlignmentInsets_outIsSingleLine__sSizingTextContainer = (uint64_t)v2;

  objc_msgSend((id)_textKit1_sizeThatFits_attributedText_maximumNumberOfLines_lineBreakMode_isReplyPreview_outTextAlignmentInsets_outIsSingleLine__sSizingLayoutManager, "addTextContainer:", _textKit1_sizeThatFits_attributedText_maximumNumberOfLines_lineBreakMode_isReplyPreview_outTextAlignmentInsets_outIsSingleLine__sSizingTextContainer);
  objc_msgSend((id)_textKit1_sizeThatFits_attributedText_maximumNumberOfLines_lineBreakMode_isReplyPreview_outTextAlignmentInsets_outIsSingleLine__sSizingLayoutManager, "setAllowsNonContiguousLayout:", 1);
  v4 = objc_alloc_init(CKTextStorage);
  v5 = (void *)_textKit1_sizeThatFits_attributedText_maximumNumberOfLines_lineBreakMode_isReplyPreview_outTextAlignmentInsets_outIsSingleLine__sSizingTextStorage;
  _textKit1_sizeThatFits_attributedText_maximumNumberOfLines_lineBreakMode_isReplyPreview_outTextAlignmentInsets_outIsSingleLine__sSizingTextStorage = (uint64_t)v4;

  objc_msgSend((id)_textKit1_sizeThatFits_attributedText_maximumNumberOfLines_lineBreakMode_isReplyPreview_outTextAlignmentInsets_outIsSingleLine__sSizingTextStorage, "addLayoutManager:", _textKit1_sizeThatFits_attributedText_maximumNumberOfLines_lineBreakMode_isReplyPreview_outTextAlignmentInsets_outIsSingleLine__sSizingLayoutManager);
  v6 = (void *)_textKit1_sizeThatFits_attributedText_maximumNumberOfLines_lineBreakMode_isReplyPreview_outTextAlignmentInsets_outIsSingleLine__sSizingTextContainer;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "balloonLineFragmentPadding");
  objc_msgSend(v6, "setLineFragmentPadding:");

  objc_msgSend((id)_textKit1_sizeThatFits_attributedText_maximumNumberOfLines_lineBreakMode_isReplyPreview_outTextAlignmentInsets_outIsSingleLine__sSizingLayoutManager, "setBackgroundLayoutEnabled:", 0);
  return objc_msgSend((id)_textKit1_sizeThatFits_attributedText_maximumNumberOfLines_lineBreakMode_isReplyPreview_outTextAlignmentInsets_outIsSingleLine__sSizingLayoutManager, "setSynchronizesAlignmentToDirection:", 1);
}

+ (CGSize)_textKit2_sizeThatFits:(CGSize)a3 attributedText:(id)a4 maximumNumberOfLines:(unint64_t)a5 lineBreakMode:(int64_t)a6 isReplyPreview:(BOOL)a7 outTextAlignmentInsets:(UIEdgeInsets *)a8 outIsSingleLine:(BOOL *)a9
{
  _BOOL4 v11;
  double height;
  double width;
  id v16;
  void *v17;
  NSObject *v18;
  CKTextMetricsRequest *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  double v29;
  double v30;
  CGSize result;

  v11 = a7;
  height = a3.height;
  width = a3.width;
  v16 = a4;
  if (_textKit2_sizeThatFits_attributedText_maximumNumberOfLines_lineBreakMode_isReplyPreview_outTextAlignmentInsets_outIsSingleLine__once != -1)
    dispatch_once(&_textKit2_sizeThatFits_attributedText_maximumNumberOfLines_lineBreakMode_isReplyPreview_outTextAlignmentInsets_outIsSingleLine__once, &__block_literal_global_84_5);
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
    v16 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", &stru_1E276D870);
    IMLogHandleForCategory();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      +[CKBalloonTextView _textKit2_sizeThatFits:attributedText:maximumNumberOfLines:lineBreakMode:isReplyPreview:outTextAlignmentInsets:outIsSingleLine:].cold.1(v18);

  }
  v19 = -[CKTextMetricsRequest initWithAttributedString:]([CKTextMetricsRequest alloc], "initWithAttributedString:", v16);
  objc_msgSend(v17, "balloonLineFragmentPadding");
  -[CKTextMetricsRequest setLineFragmentPadding:](v19, "setLineFragmentPadding:");
  -[CKTextMetricsRequest setLineBreakMode:](v19, "setLineBreakMode:", a6);
  -[CKTextMetricsRequest setMaximumNumberOfLines:](v19, "setMaximumNumberOfLines:", a5);
  -[CKTextMetricsRequest setMaximumWidth:](v19, "setMaximumWidth:", width);
  -[CKTextMetricsRequest setMaximumHeight:](v19, "setMaximumHeight:", height);
  -[CKTextMetricsRequest setAlreadyPadded:](v19, "setAlreadyPadded:", 0);
  if (v11)
    objc_msgSend(v17, "replyBalloonTextContainerInset");
  else
    objc_msgSend(v17, "balloonTextContainerInset");
  -[CKTextMetricsRequest setContainerInset:](v19, "setContainerInset:");
  objc_msgSend((id)_textKit2_sizeThatFits_attributedText_maximumNumberOfLines_lineBreakMode_isReplyPreview_outTextAlignmentInsets_outIsSingleLine__metricsProvider, "metricsForRequest:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "size");
  v22 = v21;
  v24 = v23;
  if (a8)
  {
    objc_msgSend(v20, "alignmentInset");
    a8->top = v25;
    a8->left = v26;
    a8->bottom = v27;
    a8->right = v28;
  }
  if (a9)
    *a9 = objc_msgSend(v20, "isSingleLine");

  v29 = v22;
  v30 = v24;
  result.height = v30;
  result.width = v29;
  return result;
}

void __148__CKBalloonTextView__textKit2_sizeThatFits_attributedText_maximumNumberOfLines_lineBreakMode_isReplyPreview_outTextAlignmentInsets_outIsSingleLine___block_invoke()
{
  CKTextMetricsProvider *v0;
  void *v1;

  v0 = objc_alloc_init(CKTextMetricsProvider);
  v1 = (void *)_textKit2_sizeThatFits_attributedText_maximumNumberOfLines_lineBreakMode_isReplyPreview_outTextAlignmentInsets_outIsSingleLine__metricsProvider;
  _textKit2_sizeThatFits_attributedText_maximumNumberOfLines_lineBreakMode_isReplyPreview_outTextAlignmentInsets_outIsSingleLine__metricsProvider = (uint64_t)v0;

}

- (void)_interactionStartedFromPreviewItemController:(id)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKBalloonTextView;
  -[CKBalloonTextView _interactionStartedFromPreviewItemController:](&v5, sel__interactionStartedFromPreviewItemController_, a3);
  -[CKBalloonTextView interactionDelegate](self, "interactionDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "interactionStartedFromPreviewItemControllerInTextView:", self);

}

- (void)_interactionStoppedFromPreviewItemController:(id)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKBalloonTextView;
  -[CKBalloonTextView _interactionStoppedFromPreviewItemController:](&v5, sel__interactionStoppedFromPreviewItemController_, a3);
  -[CKBalloonTextView interactionDelegate](self, "interactionDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "interactionStoppedFromPreviewItemControllerInTextView:", self);

}

- (void)panGestureRecognized:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  id v8;
  CGPoint v9;
  CGRect v10;

  objc_msgSend(a3, "locationInView:", self);
  v5 = v4;
  v7 = v6;
  -[CKBalloonTextView bounds](self, "bounds");
  v9.x = v5;
  v9.y = v7;
  if (CGRectContainsPoint(v10, v9))
  {
    if (-[CKBalloonTextView isFakeSelected](self, "isFakeSelected"))
      -[CKBalloonTextView setFakeSelected:](self, "setFakeSelected:", 0);
  }
  else
  {
    -[CKBalloonTextView interactionDelegate](self, "interactionDelegate");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "interactionTextView:userDidDragOutsideViewWithPoint:", self, v5, v7);

  }
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  id v5;
  BOOL v6;

  v4 = a3;
  -[CKBalloonTextView dragGestureRecognizer](self, "dragGestureRecognizer");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v6 = v5 != v4 || objc_msgSend(v4, "buttonMask") == 1;
  return v6;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  return 0;
}

- (void)_setFakeSelectionBackgroundColor
{
  void *v3;
  uint64_t v4;

  -[CKBalloonTextView attributedText](self, "attributedText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  -[CKBalloonTextView _setFakeSelectionBackgroundColorForRange:](self, "_setFakeSelectionBackgroundColorForRange:", 0, v4);
}

- (id)_fakeSelectionBackgroundColor
{
  void *v4;
  int v5;
  void *v6;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "enableBalloonTextSelection");

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CKBalloonTextView.m"), 535, CFSTR("Need to set colors for fakeSelectionBackgroundColor for iPad"));

  }
  return 0;
}

- (void)_removeFakeSelectionBackgroundColor
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;

  -[CKBalloonTextView attributedText](self, "attributedText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (v4)
  {
    -[CKBalloonTextView attributedText](self, "attributedText");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (id)objc_msgSend(v5, "mutableCopy");

    v6 = objc_msgSend(v7, "length");
    objc_msgSend(v7, "removeAttribute:range:", *MEMORY[0x1E0DC1100], 0, v6);
    -[CKBalloonTextView setAttributedText:](self, "setAttributedText:", v7);

  }
}

- (void)_updateFakeSelectionBackgroundColor:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__CKBalloonTextView__updateFakeSelectionBackgroundColor___block_invoke;
  block[3] = &unk_1E274A208;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __57__CKBalloonTextView__updateFakeSelectionBackgroundColor___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isFakeSelected");
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "_setFakeSelectionBackgroundColor");
  return result;
}

- (BOOL)becomeFirstResponder
{
  BOOL v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CKBalloonTextView;
  v3 = -[CKBalloonTextView becomeFirstResponder](&v8, sel_becomeFirstResponder);
  -[CKBalloonTextView _selectedRange](self, "_selectedRange");
  if (v4)
  {
    -[CKBalloonTextView setSelectable:](self, "setSelectable:", 1);
    -[CKBalloonTextView _removeFakeSelectionBackgroundColor](self, "_removeFakeSelectionBackgroundColor");
    v5 = -[CKBalloonTextView _selectedRange](self, "_selectedRange");
    -[CKBalloonTextView setSelectedRange:](self, "setSelectedRange:", v5, v6);
  }
  return v3;
}

- (BOOL)_showsEditMenu
{
  uint64_t v3;
  uint64_t v5;

  -[CKBalloonTextView _selectedRange](self, "_selectedRange");
  if (v3)
    return 1;
  -[CKBalloonTextView selectedRange](self, "selectedRange");
  return v5 != 0;
}

+ (BOOL)_textEffectsBalloonDebugHighlightingEnabled
{
  if (_textEffectsBalloonDebugHighlightingEnabled_onceToken != -1)
    dispatch_once(&_textEffectsBalloonDebugHighlightingEnabled_onceToken, &__block_literal_global_104_3);
  return _textEffectsBalloonDebugHighlightingEnabled_enabled;
}

void __64__CKBalloonTextView__textEffectsBalloonDebugHighlightingEnabled__block_invoke()
{
  void *v0;
  int v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0D36A50], "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "isInternalInstall");

  if (v1)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    _textEffectsBalloonDebugHighlightingEnabled_enabled = objc_msgSend(v2, "BOOLForKey:", CFSTR("textEffectsBalloonDebugHighlightingEnabled"));

  }
}

- (void)setAllowsTextAnimations:(BOOL)a3
{
  _BOOL8 v3;
  unsigned int v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  id v10;
  objc_super v11;
  objc_super v12;

  v3 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CKBalloonTextView;
  v5 = -[CKBalloonTextView allowsTextAnimations](&v12, sel_allowsTextAnimations);
  v11.receiver = self;
  v11.super_class = (Class)CKBalloonTextView;
  -[CKBalloonTextView setAllowsTextAnimations:](&v11, sel_setAllowsTextAnimations_, v3);
  if (v5 != v3 && objc_msgSend((id)objc_opt_class(), "_textEffectsBalloonDebugHighlightingEnabled"))
  {
    if (v3)
    {
      objc_msgSend(MEMORY[0x1E0CEA478], "redColor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "colorWithAlphaComponent:", 0.5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = 1.5;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 0.0;
    }
    -[CKBalloonTextView layer](self, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_retainAutorelease(v7);
    objc_msgSend(v9, "setBorderColor:", objc_msgSend(v10, "CGColor"));
    objc_msgSend(v9, "setBorderWidth:", v8);

  }
}

- (BOOL)isFakeSelected
{
  return self->_fakeSelected;
}

- (CKBalloonTextViewInteractionDelegate)interactionDelegate
{
  return (CKBalloonTextViewInteractionDelegate *)objc_loadWeakRetained((id *)&self->_interactionDelegate);
}

- (BOOL)shouldAdjustInsetsForMinimumSize
{
  return self->_shouldAdjustInsetsForMinimumSize;
}

- (NSAttributedString)attributedText
{
  return self->_attributedText;
}

- (UITapGestureRecognizer)tapGestureRecognizer
{
  return self->_tapGestureRecognizer;
}

- (UIPanGestureRecognizer)dragGestureRecognizer
{
  return self->_dragGestureRecognizer;
}

- (void)setDragGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_dragGestureRecognizer, a3);
}

- (char)selectionColorType
{
  return self->_selectionColorType;
}

- (void)setSelectionColorType:(char)a3
{
  self->_selectionColorType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dragGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_attributedText, 0);
  objc_destroyWeak((id *)&self->_interactionDelegate);
}

+ (void)_textKit2_sizeThatFits:(os_log_t)log attributedText:maximumNumberOfLines:lineBreakMode:isReplyPreview:outTextAlignmentInsets:outIsSingleLine:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18DFCD000, log, OS_LOG_TYPE_ERROR, "attempted to compute size with nil attributedText", v1, 2u);
}

@end
