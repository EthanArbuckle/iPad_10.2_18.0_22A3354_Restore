@implementation SREditableTextView

- (SREditableTextView)initWithFrame:(CGRect)a3 presentationStyle:(int64_t)a4
{
  SREditableTextView *v5;
  uint64_t v6;
  SREditableTextView *v7;
  int IsRTL;
  uint64_t v9;
  SRSpeechRecognizedCorrectionTextView *v10;
  double y;
  double width;
  double height;
  SRSpeechRecognizedCorrectionTextView *v14;
  SRSpeechRecognizedCorrectionTextView *textView;
  void *v16;
  SRSpeechRecognizedCorrectionTextView *v17;
  void *v18;
  SRSpeechRecognizedCorrectionTextView *v19;
  void *v20;
  UIView *v21;
  UIView *backgroundView;
  UIView *v23;
  UIView *v24;
  uint64_t v25;
  void *v26;
  double v27;
  CGFloat v28;
  id v29;
  objc_super v31;

  v31.receiver = self;
  v31.super_class = (Class)SREditableTextView;
  v5 = -[SREditableTextView initWithFrame:](&v31, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v7 = v5;
  if (v5)
  {
    v5->_presentationStyle = a4;
    IsRTL = SiriLanguageIsRTL(v5, v6);
    v9 = 2;
    if (!IsRTL)
      v9 = 0;
    v7->_textAlignment = v9;
    v10 = [SRSpeechRecognizedCorrectionTextView alloc];
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
    v14 = -[SRSpeechRecognizedCorrectionTextView initWithFrame:](v10, "initWithFrame:", CGRectZero.origin.x, y, width, height);
    textView = v7->_textView;
    v7->_textView = v14;

    -[SRSpeechRecognizedCorrectionTextView setDelegate:](v7->_textView, "setDelegate:", v7);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _preferredFontForTextStyle:variant:](UIFont, "_preferredFontForTextStyle:variant:", UIFontTextStyleBody, 256));
    -[SRSpeechRecognizedCorrectionTextView setFont:](v7->_textView, "setFont:", v16);
    v17 = v7->_textView;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[SRSpeechRecognizedCorrectionTextView setBackgroundColor:](v17, "setBackgroundColor:", v18);

    -[SRSpeechRecognizedCorrectionTextView setTextAlignment:](v7->_textView, "setTextAlignment:", v7->_textAlignment);
    -[SRSpeechRecognizedCorrectionTextView setBounces:](v7->_textView, "setBounces:", 0);
    -[SRSpeechRecognizedCorrectionTextView setClipsToBounds:](v7->_textView, "setClipsToBounds:", 0);
    -[SRSpeechRecognizedCorrectionTextView setScrollEnabled:](v7->_textView, "setScrollEnabled:", 0);
    -[SRSpeechRecognizedCorrectionTextView setReturnKeyType:](v7->_textView, "setReturnKeyType:", 9);
    -[SRSpeechRecognizedCorrectionTextView setTextContainerInset:](v7->_textView, "setTextContainerInset:", UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);
    if (v7->_presentationStyle == 1)
    {
      v7->_topOffsetForTextView = 8.0;
      v19 = v7->_textView;
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
      -[SRSpeechRecognizedCorrectionTextView setTextColor:](v19, "setTextColor:", v20);

      -[SRSpeechRecognizedCorrectionTextView setKeyboardAppearance:](v7->_textView, "setKeyboardAppearance:", 0);
      v21 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
      backgroundView = v7->_backgroundView;
      v7->_backgroundView = v21;

      v23 = v7->_backgroundView;
      v24 = (UIView *)objc_claimAutoreleasedReturnValue(+[UIColor systemFillColor](UIColor, "systemFillColor"));
      -[UIView setBackgroundColor:](v23, "setBackgroundColor:", v24);
    }
    else
    {
      v25 = objc_claimAutoreleasedReturnValue(-[SREditableTextView _createVisualEffectBackgroundViewForTextView:topOffset:](v7, "_createVisualEffectBackgroundViewForTextView:topOffset:", v7->_textView, &v7->_topOffsetForTextView));
      v24 = v7->_backgroundView;
      v7->_backgroundView = (UIView *)v25;
    }

    -[UIView _setContinuousCornerRadius:](v7->_backgroundView, "_setContinuousCornerRadius:", 10.0);
    -[UIView setUserInteractionEnabled:](v7->_backgroundView, "setUserInteractionEnabled:", 0);
    -[SREditableTextView insertSubview:below:](v7, "insertSubview:below:", v7->_backgroundView, v7->_textView);
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[SRSpeechRecognizedCorrectionTextView font](v7->_textView, "font"));
    objc_msgSend(v26, "_scaledValueForValue:", 8.0);
    v7->_heightOffsetForTextView = v27 + v7->_topOffsetForTextView;

    -[SREditableTextView addSubview:](v7, "addSubview:", v7->_textView);
    v28 = SiriUIDefaultEdgePadding;
    v7->_edgeInsets.top = 0.0;
    v7->_edgeInsets.leading = v28;
    v7->_edgeInsets.bottom = 0.0;
    v7->_edgeInsets.trailing = v28;
    v29 = objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", v7, "_handleTap:");
    -[SREditableTextView addGestureRecognizer:](v7, "addGestureRecognizer:", v29);

  }
  return v7;
}

+ (double)insertionAnimatedZPosition
{
  return 500.0;
}

- (double)firstLineBaselineOffsetFromTop
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont siriui_userUtteranceFont](UIFont, "siriui_userUtteranceFont"));
  objc_msgSend(v2, "ascender");
  v4 = v3;

  return v4;
}

- (double)baselineOffsetFromBottom
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont siriui_userUtteranceFont](UIFont, "siriui_userUtteranceFont"));
  objc_msgSend(v2, "descender");
  v4 = -v3;

  return v4;
}

- (void)setText:(id)a3
{
  const __CFString *v4;
  const __CFString *v5;
  __CFString *v6;

  v4 = (const __CFString *)a3;
  if (v4)
    v5 = v4;
  else
    v5 = &stru_100125588;
  v6 = (__CFString *)v5;
  -[SRSpeechRecognizedCorrectionTextView setText:](self->_textView, "setText:");
  -[SREditableTextView _adjustLineSpacing](self, "_adjustLineSpacing");
  -[SREditableTextView setNeedsLayout](self, "setNeedsLayout");

}

- (void)setTextAlignment:(int64_t)a3
{
  self->_textAlignment = a3;
  -[SRSpeechRecognizedCorrectionTextView setTextAlignment:](self->_textView, "setTextAlignment:");
  -[SREditableTextView setNeedsLayout](self, "setNeedsLayout");
}

- (NSString)text
{
  return (NSString *)-[SRSpeechRecognizedCorrectionTextView text](self->_textView, "text");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  width = a3.width;
  v5 = -88.0;
  if (self->_presentationStyle == 1)
    v5 = -52.0;
  -[SRSpeechRecognizedCorrectionTextView sizeThatFits:](self->_textView, "sizeThatFits:", width + v5, 1.79769313e308);
  v7 = v6 + self->_heightOffsetForTextView;
  v8 = width;
  result.height = v7;
  result.width = v8;
  return result;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  CGPoint v7;
  CGRect v8;

  y = a3.y;
  x = a3.x;
  -[SREditableTextView bounds](self, "bounds", a4);
  v7.x = x;
  v7.y = y;
  return CGRectContainsPoint(v8, v7);
}

- (void)layoutSubviews
{
  CGFloat x;
  double y;
  double width;
  double height;
  int64_t presentationStyle;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  int64_t v13;
  double v14;
  double v15;
  objc_super v16;
  CGRect v17;
  CGRect v18;

  -[SREditableTextView recursive_setSemanticContentAttribute:](self, "recursive_setSemanticContentAttribute:", SiriLanguageSemanticContentAttribute(self, a2));
  v16.receiver = self;
  v16.super_class = (Class)SREditableTextView;
  -[SREditableTextView layoutSubviews](&v16, "layoutSubviews");
  -[SREditableTextView bounds](self, "bounds");
  x = v17.origin.x;
  y = v17.origin.y;
  width = v17.size.width;
  height = v17.size.height;
  presentationStyle = self->_presentationStyle;
  v8 = CGRectGetWidth(v17);
  v9 = -88.0;
  if (presentationStyle == 1)
    v9 = -52.0;
  v10 = v8 + v9;
  v18.origin.x = x;
  v18.origin.y = y;
  v18.size.width = width;
  v18.size.height = height;
  -[SRSpeechRecognizedCorrectionTextView sizeThatFits:](self->_textView, "sizeThatFits:", v10, CGRectGetHeight(v18));
  v12 = 44.0;
  if (self->_presentationStyle == 1)
    v12 = 26.0;
  -[SRSpeechRecognizedCorrectionTextView setFrame:](self->_textView, "setFrame:", v12, self->_topOffsetForTextView, v10, v11);
  v13 = self->_presentationStyle;
  v14 = 30.0;
  if (v13 == 1)
    v14 = 14.0;
  v15 = -60.0;
  if (v13 == 1)
    v15 = -28.0;
  -[UIView setFrame:](self->_backgroundView, "setFrame:", v14, y, width + v15, height);
}

- (BOOL)canResignFirstResponder
{
  return -[SRSpeechRecognizedCorrectionTextView canResignFirstResponder](self->_textView, "canResignFirstResponder");
}

- (BOOL)resignFirstResponder
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SREditableTextView;
  -[SREditableTextView resignFirstResponder](&v4, "resignFirstResponder");
  return -[SRSpeechRecognizedCorrectionTextView resignFirstResponder](self->_textView, "resignFirstResponder");
}

- (BOOL)isFirstResponder
{
  return -[SRSpeechRecognizedCorrectionTextView isFirstResponder](self->_textView, "isFirstResponder");
}

- (void)_handleTap:(id)a3
{
  if (objc_msgSend(a3, "state") == (id)3)
    -[SREditableTextView _requestKeyboardFocusAndBecomeFirstResponder](self, "_requestKeyboardFocusAndBecomeFirstResponder");
}

- (void)_requestKeyboardFocusAndBecomeFirstResponder
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SREditableTextView delegate](self, "delegate"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10001D45C;
  v4[3] = &unk_100122CD8;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v3, "editableTextViewRequestKeyboardForTapToEditWithCompletion:", v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)beginEditing
{
  -[SREditableTextView _requestKeyboardFocusAndBecomeFirstResponder](self, "_requestKeyboardFocusAndBecomeFirstResponder");
}

- (void)endEditingAndCorrect:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  char v6;
  id v7;

  v3 = a3;
  -[SRSpeechRecognizedCorrectionTextView resignFirstResponder](self->_textView, "resignFirstResponder");
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SREditableTextView delegate](self, "delegate"));
    v6 = objc_opt_respondsToSelector(v5, "editableTextViewTextDidFinishCorrecting:");

    if ((v6 & 1) != 0)
    {
      v7 = (id)objc_claimAutoreleasedReturnValue(-[SREditableTextView delegate](self, "delegate"));
      objc_msgSend(v7, "editableTextViewTextDidFinishCorrecting:", self);

    }
  }
}

- (void)_adjustLineSpacing
{
  void *v3;
  void *v4;
  id v5;
  id v6;

  v6 = objc_alloc_init((Class)NSMutableParagraphStyle);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRSpeechRecognizedCorrectionTextView font](self->_textView, "font"));
  objc_msgSend(v3, "_scaledValueForValue:", 1.0);
  objc_msgSend(v6, "setLineSpacing:");

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SRSpeechRecognizedCorrectionTextView attributedText](self->_textView, "attributedText"));
  v5 = objc_msgSend(v4, "mutableCopy");

  objc_msgSend(v5, "addAttribute:value:range:", NSParagraphStyleAttributeName, v6, 0, objc_msgSend(v5, "length"));
  -[SRSpeechRecognizedCorrectionTextView setAttributedText:](self->_textView, "setAttributedText:", v5);

}

- (void)setDictationResult:(id)a3 withCorrectionIdentifier:(id)a4
{
  -[SRSpeechRecognizedCorrectionTextView _setDictationResult:withCorrectionIdentifier:](self->_textView, "_setDictationResult:withCorrectionIdentifier:", a3, a4);
  -[SREditableTextView _adjustLineSpacing](self, "_adjustLineSpacing");
  -[SRSpeechRecognizedCorrectionTextView setNeedsLayout](self->_textView, "setNeedsLayout");
}

- (BOOL)textViewShouldBeginEditing:(id)a3
{
  void *v4;
  BOOL v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SREditableTextView delegate](self, "delegate", a3));
  if ((objc_opt_respondsToSelector(v4, "editableTextViewTextShouldPreventCorrection:") & 1) != 0
    && (objc_msgSend(v4, "editableTextViewTextShouldPreventCorrection:", self) & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    if ((objc_opt_respondsToSelector(v4, "editableTextViewTextWillBeginCorrecting:") & 1) != 0)
      objc_msgSend(v4, "editableTextViewTextWillBeginCorrecting:", self);
    v5 = 1;
  }

  return v5;
}

- (void)textViewDidEndEditing:(id)a3
{
  if (self->_didCorrect)
    self->_didCorrect = 0;
  else
    -[SREditableTextView endEditingAndCorrect:](self, "endEditingAndCorrect:", 0);
}

- (void)textViewDidChange:(id)a3
{
  void *v4;
  id v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "window"));

  if (v4)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[SREditableTextView delegate](self, "delegate"));
    if ((objc_opt_respondsToSelector(v5, "editableTextViewTextDidChange:") & 1) != 0)
      objc_msgSend(v5, "editableTextViewTextDidChange:", self);

  }
}

- (double)_indentWidth
{
  double v2;

  v2 = 28.0;
  if ((SiriUIIsCompactWidth(self, a2) & 1) == 0)
  {
    if (SiriUIIsCompactHeight())
      return 28.0;
    else
      return 31.0;
  }
  return v2;
}

- (void)utteranceTextDidResignFirstResponder:(id)a3
{
  void *v4;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SREditableTextView delegate](self, "delegate", a3));
  objc_msgSend(v4, "editableTextViewTextDidResignFirstResponder:", self);

  -[SREditableTextView setNeedsLayout](self, "setNeedsLayout");
}

- (void)utteranceTextDidReceiveReturnKey:(id)a3
{
  void *v4;
  char v5;
  id v6;

  self->_didCorrect = 1;
  -[SREditableTextView endEditingAndCorrect:](self, "endEditingAndCorrect:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SREditableTextView delegate](self, "delegate"));
  v5 = objc_opt_respondsToSelector(v4, "editableTextViewTextDidReceiveReturnKey:");

  if ((v5 & 1) != 0)
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[SREditableTextView delegate](self, "delegate"));
    objc_msgSend(v6, "editableTextViewTextDidReceiveReturnKey:", self);

  }
}

- (id)_createVisualEffectBackgroundViewForTextView:(id)a3 topOffset:(double *)a4
{
  id v5;
  void *v6;
  void *v7;
  double v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "font"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "font"));
  objc_msgSend(v7, "ascender");
  objc_msgSend(v6, "_scaledValueForValue:", 29.0 - v8);
  *(_QWORD *)a4 = v9;

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  objc_msgSend(v5, "setTextColor:", v10);

  v11 = objc_alloc((Class)UIVisualEffectView);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIVibrancyEffect siriui_userUtteranceEditModeVibrancyEffect](UIVibrancyEffect, "siriui_userUtteranceEditModeVibrancyEffect"));
  v13 = objc_msgSend(v11, "initWithEffect:", v12);

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "contentView"));
  objc_msgSend(v14, "_setContinuousCornerRadius:", 10.0);

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "contentView"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  objc_msgSend(v15, "setBackgroundColor:", v16);

  return v13;
}

- (SREditableTextViewDelegate)delegate
{
  return (SREditableTextViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)textAlignment
{
  return self->_textAlignment;
}

- (BOOL)editable
{
  return self->_editable;
}

- (void)setEditable:(BOOL)a3
{
  self->_editable = a3;
}

- (BOOL)didCorrect
{
  return self->_didCorrect;
}

- (void)setDidCorrect:(BOOL)a3
{
  self->_didCorrect = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_textView, 0);
}

@end
